@interface ADSyncBlacklist
+ (id)sharedInstance;
- (ADSyncBlacklist)init;
- (id)_storePath;
- (id)_timeouts:(id)a3 expiringAfter:(id)a4;
- (id)_timeoutsExpiringAfter:(id)a3;
- (id)timeoutsExpiringAfter:(id)a3;
- (void)_saveTimeouts:(id)a3;
- (void)checkIfAnyUserVocabularyIsBlacklistedForApp:(id)a3 completion:(id)a4;
- (void)checkPermissionToSyncSlot:(id)a3 forApp:(id)a4 completion:(id)a5;
- (void)filterBlacklistedAnchorsFrom:(id)a3 includingNewRestrictionsFromResponse:(id)a4;
- (void)filterBlacklistedKeys:(id)a3 appSources:(id)a4;
- (void)filterBlacklistedKeys:(id)a3 vocabSources:(id)a4;
- (void)saveTimeouts:(id)a3;
@end

@implementation ADSyncBlacklist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedTimeoutTable, 0);
}

- (void)_saveTimeouts:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_cachedTimeoutTable] & 1) == 0)
  {
    v4 = (NSDictionary *)[v9 copy];
    cachedTimeoutTable = self->_cachedTimeoutTable;
    self->_cachedTimeoutTable = v4;

    if ([(NSDictionary *)self->_cachedTimeoutTable count])
    {
      v6 = self->_cachedTimeoutTable;
      v7 = [(ADSyncBlacklist *)self _storePath];
      [(NSDictionary *)v6 writeToFile:v7 atomically:1];
    }
    else
    {
      v7 = +[NSFileManager defaultManager];
      v8 = [(ADSyncBlacklist *)self _storePath];
      [v7 removeItemAtPath:v8 error:0];
    }
  }
  _objc_release_x1();
}

- (void)saveTimeouts:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A66E0;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_timeouts:(id)a3 expiringAfter:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A67EC;
  v13[3] = &unk_100500980;
  id v14 = a4;
  id v5 = v14;
  id v6 = a3;
  v7 = [v6 keysOfEntriesPassingTest:v13];
  id v8 = [v7 allObjects];
  id v9 = [v6 dictionaryWithValuesForKeys:v8];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = &__NSDictionary0__struct;
  }
  id v11 = v10;

  return v11;
}

- (id)_timeoutsExpiringAfter:(id)a3
{
  return [(ADSyncBlacklist *)self _timeouts:self->_cachedTimeoutTable expiringAfter:a3];
}

- (id)timeoutsExpiringAfter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000A6934;
  v16 = sub_1000A6944;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A694C;
  block[3] = &unk_10050C700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)filterBlacklistedKeys:(id)a3 appSources:(id)a4
{
  v28 = self;
  id v29 = a3;
  id v5 = a4;
  id v6 = [v5 copy];
  [v5 removeAllObjects];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "appIdentifyingInfo", v28);
        v15 = [v14 bundleId];

        if (v15)
        {
          uint64_t v16 = [v13 syncSlots];
          id v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = &__NSArray0__struct;
          }
          [v7 setObject:v18 forKey:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  [(ADSyncBlacklist *)v28 filterBlacklistedKeys:v29 vocabSources:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v8;
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        v25 = objc_msgSend(v24, "appIdentifyingInfo", v28);
        v26 = [v25 bundleId];

        if (v26)
        {
          v27 = [v7 objectForKey:v26];
          if (v27)
          {
            [v24 setSyncSlots:v27];
            [v5 addObject:v24];
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }
}

- (void)filterBlacklistedKeys:(id)a3 vocabSources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSDate date];
  id v9 = [(ADSyncBlacklist *)self timeoutsExpiringAfter:v8];

  if ([v9 count])
  {
    id v10 = [v9 allKeys];
    [v6 removeObjectsInArray:v10];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1000A6D90;
    uint64_t v16 = &unk_100500958;
    id v17 = v10;
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v11 = v18;
    id v12 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:&v13];
    objc_msgSend(v7, "setDictionary:", v11, v13, v14, v15, v16);
  }
}

- (void)filterBlacklistedAnchorsFrom:(id)a3 includingNewRestrictionsFromResponse:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  long long v30 = +[NSDate date];
  id v31 = objc_alloc_init((Class)NSMutableSet);
  id v29 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = v5;
  id v6 = [v5 anchors];
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = [v11 suspendDurationInSeconds];
        [v12 doubleValue];
        if (v13 != 0.0)
        {
          double v14 = v13;
          if (objc_msgSend(v11, "_af_isValid"))
          {
            v15 = objc_msgSend(v11, "_af_normalizedKey");
            if (v14 >= 0.0)
            {
              id v21 = [v30 dateByAddingTimeInterval:v14];
              uint64_t v22 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                long long v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
                __int16 v38 = 2112;
                v39 = v21;
                __int16 v40 = 2112;
                v41 = v11;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Anchor was throttled until %@ %@", buf, 0x20u);
              }
              [v29 setObject:v21 forKey:v15];
            }
            else
            {
              uint64_t v16 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                long long v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
                __int16 v38 = 2112;
                v39 = v11;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Invalid sync anchor was rejected by server %@", buf, 0x16u);
              }
            }
            [v31 addObject:v15];
          }
          else
          {
            id v17 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              id v18 = v17;
              id v19 = [v11 key];
              id v20 = [v11 aceId];
              *(_DWORD *)buf = 136315650;
              long long v37 = "-[ADSyncBlacklist filterBlacklistedAnchorsFrom:includingNewRestrictionsFromResponse:]";
              __int16 v38 = 2114;
              v39 = v19;
              __int16 v40 = 2112;
              v41 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unable to stop synching anchors of type %{public}@, because the example anchor is malformed aceID=%@", buf, 0x20u);
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v8);
  }

  v23 = [(ADSyncBlacklist *)self timeoutsExpiringAfter:v30];
  v24 = [v23 allKeys];
  [v31 addObjectsFromArray:v24];

  [v29 addEntriesFromDictionary:v23];
  [(ADSyncBlacklist *)self saveTimeouts:v29];
  v25 = [v31 allObjects];
  [v28 removeObjectsForKeys:v25];
}

- (void)checkPermissionToSyncSlot:(id)a3 forApp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A74D4;
  v15[3] = &unk_10050E228;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)checkIfAnyUserVocabularyIsBlacklistedForApp:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A7710;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

- (id)_storePath
{
  v2 = AFUserSupportDirectoryPath();
  v3 = [v2 stringByAppendingPathComponent:@"SyncTimeouts.plist"];

  return v3;
}

- (ADSyncBlacklist)init
{
  v13.receiver = self;
  v13.super_class = (Class)ADSyncBlacklist;
  v2 = [(ADSyncBlacklist *)&v13 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() description];
    id v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    cachedTimeoutTable = v2->_cachedTimeoutTable;
    v2->_cachedTimeoutTable = (NSDictionary *)&__NSDictionary0__struct;

    id v9 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A7A4C;
    block[3] = &unk_10050E138;
    id v12 = v2;
    dispatch_async(v9, block);
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7BA0;
  block[3] = &unk_10050E350;
  void block[4] = a1;
  if (qword_1005858F8 != -1) {
    dispatch_once(&qword_1005858F8, block);
  }
  v2 = (void *)qword_1005858F0;
  return v2;
}

@end