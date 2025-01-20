@interface NavdDoomConfigurableGuard
- (BOOL)canRequestRoute;
- (BOOL)evaluateError:(id)a3;
- (NSString)description;
- (NSString)uniqueName;
- (NavdDoomConfigurableGuard)initWithStorage:(id)a3;
- (double)defaultCooldownMultiplierPerError;
- (double)defaultCooldownTimeForError;
- (double)defaultMaxCooldownTime;
- (double)defaultMeasuredTimeInterval;
- (double)defaultMinTimeWhenHappy;
- (double)defaultPurgeAgeLimit;
- (id)_calculateNextAvailableTime;
- (id)nextAllowedRequestTime;
- (id)objectForJSON;
- (int64_t)defaultMeasuredMaxRequests;
- (int64_t)defaultPurgeCountLimit;
- (unint64_t)_requestsOverTimeInterval:(double)a3;
- (void)_purgeWithMaxAge:(double)a3 maxCount:(int64_t)a4;
- (void)didRequestRoute;
- (void)reset;
@end

@implementation NavdDoomConfigurableGuard

- (NavdDoomConfigurableGuard)initWithStorage:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NavdDoomConfigurableGuard;
  v5 = [(NavdDoomConfigurableGuard *)&v15 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requestTimes = v5->_requestTimes;
    v5->_requestTimes = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NavdDoomSimpleGuardQueue", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    if (v4)
    {
      v11 = (NavdDoomStorage *)v4;
      p_super = &v5->_storage->super;
      v5->_storage = v11;
    }
    else
    {
      p_super = GEOFindOrCreateLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConfigurableGuard.mm";
        __int16 v18 = 1024;
        int v19 = 43;
        __int16 v20 = 2082;
        v21 = "-[NavdDoomConfigurableGuard initWithStorage:]";
        __int16 v22 = 2082;
        v23 = "nil == (storage)";
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a storage", buf, 0x26u);
      }
    }

    v13 = v5;
  }

  return v5;
}

- (unint64_t)_requestsOverTimeInterval:(double)a3
{
  if (a3 == 0.0)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomConfigurableGuard.mm";
      __int16 v18 = 1024;
      int v19 = 51;
      __int16 v20 = 2082;
      v21 = "-[NavdDoomConfigurableGuard _requestsOverTimeInterval:]";
      __int16 v22 = 2082;
      v23 = "0.0 == timeInterval";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time interval", (uint8_t *)&v16, 0x26u);
    }

    return -1;
  }
  else if ([(NSMutableArray *)self->_requestTimes count])
  {
    v7 = MapsSuggestionsNowWithOffset(-a3);
    v8 = [(NSMutableArray *)self->_requestTimes firstObject];
    dispatch_queue_t v9 = [v8 earlierDate:v7];

    requestTimes = self->_requestTimes;
    if (v9 == v7)
    {
      id v4 = (char *)[(NSMutableArray *)requestTimes count];
    }
    else
    {
      v11 = (char *)[(NSMutableArray *)requestTimes count];
      id v4 = 0;
      v12 = v11 - 1;
      if (v11 != (char *)1)
      {
        do
        {
          v13 = [(NSMutableArray *)self->_requestTimes objectAtIndexedSubscript:v12];
          v14 = [v13 earlierDate:v7];

          if (v14 == v7) {
            ++v4;
          }
          --v12;
        }
        while (v12);
      }
    }
  }
  else
  {
    return 0;
  }
  return (unint64_t)v4;
}

- (id)_calculateNextAvailableTime
{
  unint64_t Integer = GEOConfigGetInteger();
  BOOL v4 = (unint64_t)[(NSMutableArray *)self->_requestTimes count] < Integer;
  v5 = GEOFindOrCreateLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "We can go right now!", (uint8_t *)&v14, 2u);
    }

    v7 = MapsSuggestionsNow();
  }
  else
  {
    v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v9 = [(NSMutableArray *)self->_requestTimes count];
      int v14 = 67109120;
      LODWORD(v15) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "This is the last request we can do for now (%u)", (uint8_t *)&v14, 8u);
    }

    v10 = [(NSMutableArray *)self->_requestTimes objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_requestTimes count] - Integer];
    GEOConfigGetDouble();
    v7 = objc_msgSend(v10, "dateByAddingTimeInterval:");
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = MapsSuggestionsStringFromDate(v7);
      int v14 = 138412290;
      objc_super v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "We can request again as soon as %@", (uint8_t *)&v14, 0xCu);
    }
  }

  return v7;
}

- (void)_purgeWithMaxAge:(double)a3 maxCount:(int64_t)a4
{
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v23 = a3;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Purging age > %.f or count > %d", buf, 0x12u);
  }

  if ([(NSMutableArray *)self->_requestTimes count])
  {
    v8 = [(NSMutableArray *)self->_requestTimes lastObject];
    unsigned int v9 = MapsSuggestionsNow();
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 > a3;

    if (v11)
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "All were too old!", buf, 2u);
      }

      [(NSMutableArray *)self->_requestTimes removeAllObjects];
    }
    *(void *)&long long v12 = 138412290;
    long long v21 = v12;
    while (1)
    {
      if (a4 < 0 || (unint64_t)[(NSMutableArray *)self->_requestTimes count] <= a4)
      {
        if (![(NSMutableArray *)self->_requestTimes count]) {
          break;
        }
        int v14 = [(NSMutableArray *)self->_requestTimes firstObject];
        objc_super v15 = MapsSuggestionsNow();
        [v14 timeIntervalSinceDate:v15];
        BOOL v17 = v16 > a3;

        if (!v17) {
          break;
        }
      }
      GEOFindOrCreateLog();
      __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v19 = [(NSMutableArray *)self->_requestTimes firstObject];
        *(_DWORD *)buf = v21;
        double v23 = *(double *)&v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Popped request time %@", buf, 0xCu);
      }
      [(NSMutableArray *)self->_requestTimes removeObjectAtIndex:0];
    }
  }
  else
  {
    __int16 v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "We had none", buf, 2u);
    }
  }
}

- (id)nextAllowedRequestTime
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_10000E804;
  double v10 = sub_10000E814;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E81C;
  v5[3] = &unk_1000892B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)canRequestRoute
{
  v2 = [(NavdDoomConfigurableGuard *)self nextAllowedRequestTime];
  BOOL v3 = !MapsSuggestionsIsInTheFuture(v2);

  return v3;
}

- (void)didRequestRoute
{
  BOOL v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "didRequestRoute", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E9B4;
  block[3] = &unk_1000892D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)evaluateError:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "evaluateError:%@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EC70;
  block[3] = &unk_100089300;
  long long v12 = self;
  p_long long buf = &buf;
  id v11 = v4;
  id v7 = v4;
  dispatch_sync(queue, block);
  BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)reset
{
  BOOL v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Reset", v6, 2u);
  }

  [(NSMutableArray *)self->_requestTimes removeAllObjects];
  mostRecentError = self->_mostRecentError;
  self->_mostRecentError = 0;

  self->_mostRecentErrorOccured = 0;
  v5 = MapsSuggestionsNow();
  [(NavdDoomStorage *)self->_storage setNextAllowedRequestTime:v5];

  MapsSuggestionsSetFakeNow(0);
}

- (int64_t)defaultPurgeCountLimit
{
  return GEOConfigGetInteger();
}

- (double)defaultPurgeAgeLimit
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultMeasuredTimeInterval
{
  GEOConfigGetDouble();
  return result;
}

- (int64_t)defaultMeasuredMaxRequests
{
  return GEOConfigGetInteger();
}

- (double)defaultCooldownTimeForError
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultCooldownMultiplierPerError
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultMaxCooldownTime
{
  GEOConfigGetDouble();
  return result;
}

- (double)defaultMinTimeWhenHappy
{
  GEOConfigGetDouble();
  return result;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)NavdDoomConfigurableGuard;
  BOOL v3 = [(NavdDoomConfigurableGuard *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@ %@", v3, self->_requestTimes];

  return (NSString *)v4;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (id)objectForJSON
{
  v2 = (MSg *)[(NavdDoomConfigurableGuard *)self isTrue];

  return (id)MSg::jsonFor(v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_mostRecentError, 0);
  objc_storeStrong((id *)&self->_requestTimes, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end