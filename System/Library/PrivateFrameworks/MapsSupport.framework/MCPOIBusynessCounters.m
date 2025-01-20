@interface MCPOIBusynessCounters
+ (BOOL)supportsSecureCoding;
+ (id)cacheFileURL;
+ (id)readFromDisk;
- (BOOL)_isDirty;
- (MCPOIBusynessCounters)init;
- (MCPOIBusynessCounters)initWithCoder:(id)a3;
- (NSString)description;
- (id)_description;
- (id)_flushToPowerLog:(BOOL)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_setIsDirty:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)incrementCounterForAnalytic:(unint64_t)a3;
- (void)writeToDiskIfNecessary;
@end

@implementation MCPOIBusynessCounters

+ (id)cacheFileURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];
  v4 = [v3 stringByAppendingPathComponent:@"com.apple.geocorrectiond"];

  char v14 = 0;
  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4 isDirectory:&v14];

  if (v6) {
    goto LABEL_4;
  }
  v7 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v9 = v13;

  if (v8)
  {

LABEL_4:
    id v9 = [v4 stringByAppendingPathComponent:@"poi-busyness.counters"];
    v10 = +[NSURL fileURLWithPath:v9];
    goto LABEL_8;
  }
  v11 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create cache dir %@: %@", buf, 0x16u);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MCPOIBusynessCounters)init
{
  v16.receiver = self;
  v16.super_class = (Class)MCPOIBusynessCounters;
  id v2 = [(MCPOIBusynessCounters *)&v16 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:10];
    unsigned __int8 v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    +[NSDate timeIntervalSinceReferenceDate];
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [*((id *)v2 + 5) setObject:v7 forKeyedSubscript:&off_10001EA28];

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    id v9 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, v2);
    v10 = *((void *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009CAC;
    handler[3] = &unk_10001D548;
    id v13 = v2;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v10, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    GEORegisterPListStateCaptureLegacy();
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  return (MCPOIBusynessCounters *)v2;
}

- (MCPOIBusynessCounters)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCPOIBusynessCounters *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"counters"];
    dispatch_source_t v8 = [v7 objectForKeyedSubscript:&off_10001EA28];
    [v8 doubleValue];
    double v10 = v9;

    if (v7 && v10 > 0.0)
    {
      v11 = (NSMutableDictionary *)[v7 mutableCopy];
      counters = v5->_counters;
      v5->_counters = v11;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [v5 encodeObject:self->_counters forKey:@"counters"];
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MCPOIBusynessCounters;
  [(MCPOIBusynessCounters *)&v3 dealloc];
}

+ (id)readFromDisk
{
  objc_super v3 = +[GEOKeyBagNotification sharedObject];
  unsigned __int8 v4 = [v3 canAccessFilesWithProtection:1];

  if (v4)
  {
    id v5 = [(id)objc_opt_class() cacheFileURL];
    uint64_t v6 = +[NSFileManager defaultManager];
    v7 = [v5 path];
    unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      id v21 = 0;
      id v9 = [objc_alloc((Class)NSData) initWithContentsOfURL:v5 options:0 error:&v21];
      id v10 = v21;
      id v11 = v10;
      if (!v9 || v10)
      {
        id v18 = GEOGetPOIBusynessLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v5;
          __int16 v24 = 2112;
          id v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed read %@: %@", buf, 0x16u);
        }

        objc_super v16 = objc_alloc_init((Class)a1);
      }
      else
      {
        id v20 = 0;
        v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v20];
        id v11 = v20;
        id v13 = GEOGetPOIBusynessLog();
        id v14 = v13;
        if (!v12 || v11)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v5;
            __int16 v24 = 2112;
            id v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed unarchive %@: %@", buf, 0x16u);
          }

          v15 = objc_alloc_init((Class)a1);
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v23 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Successfuly read %{private}@", buf, 0xCu);
          }

          v15 = v12;
        }
        objc_super v16 = v15;
      }
    }
    else
    {
      __int16 v17 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Counters do not exist at %@", buf, 0xCu);
      }

      objc_super v16 = objc_alloc_init((Class)a1);
    }
  }
  else
  {
    id v5 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refusing to read counters, device is not unlocked", buf, 2u);
    }
    objc_super v16 = 0;
  }

  return v16;
}

- (void)writeToDiskIfNecessary
{
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A254;
  block[3] = &unk_10001C650;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  if (PLShouldLogRegisteredEvent())
  {
    unsigned __int8 v4 = [(MCPOIBusynessCounters *)self _flushToPowerLog:1];
  }
  else
  {
    unsigned __int8 v4 = self->_counters;
  }
  id v5 = v4;
  +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableDictionary *)v4 count]];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A67C;
  v8[3] = &unk_10001D570;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  [(NSMutableDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (BOOL)_isDirty
{
  return self->_isDirtyTransaction != 0;
}

- (void)_setIsDirty:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  isDirtyTransaction = self->_isDirtyTransaction;
  if (v3)
  {
    if (!isDirtyTransaction)
    {
      id v6 = _GEOCreateTransaction();
      v7 = self->_isDirtyTransaction;
      self->_isDirtyTransaction = v6;
    }
    writeTimer = self->_writeTimer;
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    id v10 = writeTimer;
    uint64_t v11 = 5000000000;
  }
  else
  {
    if (!isDirtyTransaction) {
      return;
    }
    self->_isDirtyTransaction = 0;

    id v10 = self->_writeTimer;
    dispatch_time_t v9 = -1;
    uint64_t v11 = 0;
  }

  dispatch_source_set_timer(v10, v9, 0xFFFFFFFFFFFFFFFFLL, v11);
}

- (id)_flushToPowerLog:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a3
    || (+[NSDate timeIntervalSinceReferenceDate],
        double v6 = v5,
        [(NSMutableDictionary *)self->_counters objectForKeyedSubscript:&off_10001EA28],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 doubleValue],
        double v9 = v6 - v8,
        v7,
        v9 >= 86400.0))
  {
    id v10 = [(NSMutableDictionary *)self->_counters copy];
    uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:10];
    counters = self->_counters;
    self->_counters = v11;

    +[NSDate timeIntervalSinceReferenceDate];
    id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)self->_counters setObject:v13 forKeyedSubscript:&off_10001EA28];

    [(MCPOIBusynessCounters *)self _setIsDirty:1];
    PLLogRegisteredEvent();
  }
  else
  {
    id v10 = &__NSDictionary0__struct;
  }

  return v10;
}

- (NSString)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = sub_10000AA58;
  id v10 = sub_10000AA68;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000AA70;
  v5[3] = &unk_10001C628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)_description
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  double v5 = +[NSMutableString stringWithFormat:@"<%@ %p: ", v4, self];

  [v5 appendString:@"start: "];
  uint64_t v6 = [(NSMutableDictionary *)self->_counters objectForKeyedSubscript:&off_10001EA28];
  v7 = [v6 stringValue];
  [v5 appendString:v7];

  counters = self->_counters;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AC04;
  v11[3] = &unk_10001D570;
  id v9 = v5;
  id v12 = v9;
  [(NSMutableDictionary *)counters enumerateKeysAndObjectsUsingBlock:v11];
  [v9 appendString:@">"];

  return v9;
}

- (void)incrementCounterForAnalytic:(unint64_t)a3
{
  unsigned __int8 v4 = +[NSNumber numberWithUnsignedInteger:a3];
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AD9C;
  v7[3] = &unk_10001C678;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_isDirtyTransaction, 0);
  objc_storeStrong((id *)&self->_writeTimer, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end