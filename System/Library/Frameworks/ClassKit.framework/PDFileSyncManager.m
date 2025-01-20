@interface PDFileSyncManager
+ (id)agentCache;
+ (id)agentForAsset:(id)a3 database:(id)a4 forUpload:(BOOL)a5;
+ (id)countedDownloadAgentByAssetID;
+ (id)countedUploadAgentByAssetID;
+ (void)removeAgentForAsset:(id)a3 forUpload:(BOOL)a4;
@end

@implementation PDFileSyncManager

+ (id)agentCache
{
  if (qword_10023E758 != -1) {
    dispatch_once(&qword_10023E758, &stru_1001F58E0);
  }
  v2 = (void *)qword_10023E750;

  return v2;
}

+ (id)countedUploadAgentByAssetID
{
  if (qword_10023E768 != -1) {
    dispatch_once(&qword_10023E768, &stru_1001F5900);
  }
  v2 = (void *)qword_10023E760;

  return v2;
}

+ (id)countedDownloadAgentByAssetID
{
  if (qword_10023E778 != -1) {
    dispatch_once(&qword_10023E778, &stru_1001F5920);
  }
  v2 = (void *)qword_10023E770;

  return v2;
}

+ (id)agentForAsset:(id)a3 database:(id)a4 forUpload:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  objc_sync_enter(v10);
  if (v5) {
    [v10 countedUploadAgentByAssetID];
  }
  else {
  v11 = [v10 countedDownloadAgentByAssetID];
  }
  v12 = [v8 objectID];
  v13 = [v11 objectForKey:v12];

  if (v13)
  {
    [v13 incrementCounter];
    signed int v14 = [v13 counter];
    v15 = [v13 agent];
    CLSInitLog();
    v16 = (PDCountedFileSyncAgent *)CLSLogAsset;
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v8 objectID];
      v18 = (void *)v17;
      v19 = "DN";
      int v27 = 134218754;
      __int16 v29 = 2048;
      v28 = v15;
      if (v5) {
        v19 = "UP";
      }
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      __int16 v33 = 2080;
      v34 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_DEBUG, "^^^^ PDFileSyncAgent: %p [%ld] :: %@ :: %s", (uint8_t *)&v27, 0x2Au);
    }
  }
  else
  {
    v15 = [[PDFileSyncAgent alloc] initWithAsset:v8 database:v9];
    v16 = [[PDCountedFileSyncAgent alloc] initWithAgent:v15];
    signed int v20 = [(PDCountedFileSyncAgent *)v16 counter];
    v21 = [v8 objectID];
    [v11 setObject:v16 forKey:v21];

    CLSInitLog();
    v22 = CLSLogAsset;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [v8 objectID];
      v25 = "DN";
      int v27 = 134218754;
      __int16 v29 = 2048;
      v28 = v15;
      if (v5) {
        v25 = "UP";
      }
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v24;
      __int16 v33 = 2080;
      v34 = v25;
      v26 = (void *)v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "++++ PDFileSyncAgent: %p [%ld] :: %@ :: %s", (uint8_t *)&v27, 0x2Au);
    }
  }

  objc_sync_exit(v10);

  return v15;
}

+ (void)removeAgentForAsset:(id)a3 forUpload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = a1;
  objc_sync_enter(v7);
  if (v4) {
    [v7 countedUploadAgentByAssetID];
  }
  else {
  id v8 = [v7 countedDownloadAgentByAssetID];
  }
  id v9 = [v6 objectID];
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    v11 = [v10 agent];
    signed int v12 = [v10 decrementCounter];
    if (v12 == 1)
    {
      CLSInitLog();
      v13 = CLSLogAsset;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = [v6 objectID];
        v16 = (void *)v15;
        uint64_t v17 = "DN";
        int v21 = 134218754;
        v22 = v11;
        __int16 v23 = 2048;
        if (v4) {
          uint64_t v17 = "UP";
        }
        uint64_t v24 = 1;
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        __int16 v27 = 2080;
        v28 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "---- PDFileSyncAgent: %p [%ld] :: %@ :: %s", (uint8_t *)&v21, 0x2Au);
      }
      signed int v14 = [v6 objectID];
      [v8 removeObjectForKey:v14];
    }
    else
    {
      CLSInitLog();
      signed int v14 = CLSLogAsset;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = [v6 objectID];
        v19 = (void *)v18;
        signed int v20 = "DN";
        int v21 = 134218754;
        __int16 v23 = 2048;
        v22 = v11;
        if (v4) {
          signed int v20 = "UP";
        }
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2080;
        v28 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "vvvv PDFileSyncAgent: %p [%ld] :: %@ :: %s", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
  objc_sync_exit(v7);
}

@end