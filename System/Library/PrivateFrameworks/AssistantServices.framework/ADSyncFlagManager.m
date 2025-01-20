@interface ADSyncFlagManager
+ (id)sharedManager;
- (ADSyncFlagManager)init;
- (void)_clearSyncNeededFlagsForKeys:(id)a3;
- (void)_fetchSyncFlagsOnDisk;
- (void)_setSyncNeededFlagsForKeys:(id)a3;
- (void)clearAllFlags;
- (void)clearFlagsForKeys:(id)a3;
- (void)fetchKeysThatNeedToSync:(id)a3;
- (void)setSyncNeededFlagForKeys:(id)a3;
@end

@implementation ADSyncFlagManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFlags, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_clearSyncNeededFlagsForKeys:(id)a3
{
  id v4 = a3;
  v15 = AFUserSupportDirectoryPath();
  v5 = +[NSFileManager defaultManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_cachedFlags containsObject:v11])
        {
          v12 = [@"sync_flag" stringByAppendingString:v11];
          v13 = [v15 stringByAppendingPathComponent:v12];
          id v16 = 0;
          [v5 removeItemAtPath:v13 error:&v16];
          id v14 = v16;

          [(NSMutableSet *)self->_cachedFlags removeObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)_setSyncNeededFlagsForKeys:(id)a3
{
  id v4 = a3;
  long long v18 = AFUserSupportDirectoryPath();
  v5 = +[NSFileManager defaultManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 136315650;
    long long v17 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_cachedFlags, "containsObject:", v12, v17) & 1) == 0)
        {
          v13 = [@"sync_flag" stringByAppendingString:v12];
          id v14 = [v18 stringByAppendingPathComponent:v13];
          unsigned __int8 v15 = [v5 createFileAtPath:v14 contents:0 attributes:0];

          if ((v15 & 1) == 0)
          {
            id v16 = AFSiriLogContextUtility;
            if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v24 = "-[ADSyncFlagManager _setSyncNeededFlagsForKeys:]";
              __int16 v25 = 2112;
              uint64_t v26 = v12;
              __int16 v27 = 2112;
              v28 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to create the sync flag for %@ at %@", buf, 0x20u);
            }
          }
          [(NSMutableSet *)self->_cachedFlags addObject:v12];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)_fetchSyncFlagsOnDisk
{
  v3 = AFUserSupportDirectoryPath();
  id v4 = +[NSFileManager defaultManager];
  v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  if (v5)
  {
    id v6 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
    cachedFlags = self->_cachedFlags;
    self->_cachedFlags = v6;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqualToString:", @"sync_flag", (void)v15) & 1) == 0
            && [v13 hasPrefix:@"sync_flag"])
          {
            id v14 = [v13 substringFromIndex:objc_msgSend(@"sync_flag", "length")];
            [(NSMutableSet *)self->_cachedFlags addObject:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)clearAllFlags
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E35B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFlagsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002E36D4;
    v6[3] = &unk_10050E160;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)setSyncNeededFlagForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002E37C8;
    v6[3] = &unk_10050E160;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)fetchKeysThatNeedToSync:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002E38B8;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (ADSyncFlagManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADSyncFlagManager;
  v2 = [(ADSyncFlagManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADSyncFlagManagerQueue", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(ADSyncFlagManager *)v2 _fetchSyncFlagsOnDisk];
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_100586170 != -1) {
    dispatch_once(&qword_100586170, &stru_10050AFE0);
  }
  v2 = (void *)qword_100586168;
  return v2;
}

@end