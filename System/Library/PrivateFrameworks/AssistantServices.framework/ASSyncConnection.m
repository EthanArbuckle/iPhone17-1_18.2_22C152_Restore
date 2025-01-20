@interface ASSyncConnection
- (ASSyncConnection)initWithDelegate:(id)a3;
- (BOOL)_getChunkInfoWithHandler:(id)a3 batchSize:(int64_t)a4 lastAnchor:(id)a5 updates:(id)a6 deletes:(id)a7 post:(id *)a8 targetIsLocal:(BOOL)a9;
- (BOOL)_infoIsValid:(id)a3 forPreAnchor:(id)a4;
- (BOOL)_sendChunkWithUpdates:(id)a3 deletes:(id)a4 pre:(id)a5 post:(id)a6 validity:(id)a7 forRequestUUID:(id)a8;
- (id)currentSyncSnapshotFromHandler:(id)a3 forKey:(id)a4;
- (int64_t)defaultChunkBatchSize;
- (void)runSyncWithHandler:(id)a3 info:(id)a4 forRequestUUID:(id)a5;
@end

@implementation ASSyncConnection

- (void).cxx_destruct
{
}

- (id)currentSyncSnapshotFromHandler:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v14 = 136315394;
    v15 = "-[ASSyncConnection currentSyncSnapshotFromHandler:forKey:]";
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Fetching sync info from handler %@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v5 syncSnapshotForKey:v6];
LABEL_7:
    v12 = (void *)v11;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v5 currentSyncSnapshot];
    goto LABEL_7;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)runSyncWithHandler:(id)a3 info:(id)a4 forRequestUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v61 = a5;
  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v11 = (void *)v10;
  v12 = @"unknown";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  v55 = [v8 reasons];
  int v14 = [v55 allObjects];
  uint64_t v15 = [v14 componentsJoinedByString:@"+"];

  __int16 v16 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
    __int16 v70 = 2112;
    v71 = (ASSyncBeginInfo *)v13;
    __int16 v72 = 2112;
    uint64_t v73 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@ Beginning sync with info %@", buf, 0x20u);
  }
  v17 = @"Assistant Service Event";
  v66[0] = @"Assistant Service Event";
  v66[1] = @"SyncHandler";
  v67[0] = @"Sync start";
  v67[1] = v13;
  v66[2] = @"SyncReasons";
  v54 = (void *)v15;
  v67[2] = v15;
  v18 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
  sub_10000350C(v18);

  v19 = objc_alloc_init(ASSyncBeginInfo);
  uint64_t v20 = [v8 anchor];
  uint64_t v21 = [v8 validity];
  id v22 = [v8 count];
  v23 = [v8 key];
  if [v8 forVerification] && (objc_opt_respondsToSelector())
  {
    uint64_t v24 = [v7 syncVerificationKeyForKey:v23];

    v25 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
      __int16 v70 = 2112;
      v71 = (ASSyncBeginInfo *)v13;
      __int16 v72 = 2112;
      uint64_t v73 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s %@ provided verification key %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v24 = (uint64_t)v23;
  }
  [(ASSyncBeginInfo *)v19 setAnchor:v20];
  [(ASSyncBeginInfo *)v19 setValidity:v21];
  [(ASSyncBeginInfo *)v19 setCount:v22];
  [(ASSyncBeginInfo *)v19 setKey:v24];
  v26 = [v8 appMetadata];
  [(ASSyncBeginInfo *)v19 setAppMetadata:v26];

  v27 = [v8 reasons];
  [(ASSyncBeginInfo *)v19 setReasons:v27];

  v57 = (void *)v24;
  if (objc_opt_respondsToSelector())
  {
    v29 = [[ASSyncConfiguration alloc] initWithConfigurationPlistForSyncKey:v24];
    [v7 beginSyncWithInfo:v19 configuration:v29];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 beginSyncWithAnchor:v20 validity:v21 count:v22 forKey:v24 beginInfo:v19];
      }
      else {
        [v7 beginSyncWithAnchor:v20 validity:v21 forKey:v24 beginInfo:v19];
      }
      goto LABEL_15;
    }
    v29 = [[ASSyncConfiguration alloc] initWithConfigurationPlistForSyncKey:v24];
    [v7 beginSyncWithAnchor:v20 validity:v21 count:v22 forKey:v24 beginInfo:v19 configuration:v29];
  }

LABEL_15:
  v30 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
    __int16 v70 = 2112;
    v71 = v19;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s BeginSyncInfo: %@", buf, 0x16u);
  }
  v56 = v13;
  v53 = v19;
  uint64_t v31 = [(ASSyncBeginInfo *)v19 resetValidity];
  uint64_t v59 = v31;
  if (v31) {
    v32 = (void *)v31;
  }
  else {
    v32 = (void *)v21;
  }
  id v60 = v32;
  v58 = (void *)v20;
  v52 = (void *)v21;
  if (objc_opt_respondsToSelector()) {
    int64_t v33 = (int)[v7 _syncBatchSize];
  }
  else {
    int64_t v33 = [(ASSyncConnection *)self defaultChunkBatchSize];
  }
  id v34 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v33];
  id v35 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v33];
  v36 = v58;
  if (v59) {
    v36 = 0;
  }
  v37 = v36;
  do
  {
    v37 = v37;
    v38 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
      __int16 v70 = 2112;
      v71 = v37;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Gathering chunk with pre %@", buf, 0x16u);
    }
    v63 = v37;
    v39 = v8;
    LOBYTE(v51) = [v8 targetIsLocal];
    id v40 = v7;
    unsigned int v41 = [(ASSyncConnection *)self _getChunkInfoWithHandler:v7 batchSize:v33 lastAnchor:v37 updates:v34 deletes:v35 post:&v63 targetIsLocal:v51];
    unint64_t v42 = v63;

    if (v41)
    {
      v43 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Last chunk!", buf, 0xCu);
      }
    }
    if (v37)
    {
      if ([(ASSyncBeginInfo *)v37 isEqualToString:v42]) {
        goto LABEL_33;
      }
    }
    else if (!(v42 | v59))
    {
LABEL_33:
      v44 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        __int16 v70 = 2112;
        v71 = v37;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Ignoring empty sync chunk for anchors pre == post %@", buf, 0x16u);
      }
      goto LABEL_37;
    }
    if (![(ASSyncConnection *)self _sendChunkWithUpdates:v34 deletes:v35 pre:v37 post:v42 validity:v60 forRequestUUID:v61])
    {
      v47 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s assistantd told us to stop sending chunks", buf, 0xCu);
      }
      goto LABEL_41;
    }
LABEL_37:
    if ((v41 & 1) == 0)
    {
      v45 = (ASSyncBeginInfo *)(id)v42;

      char v46 = 1;
      v37 = v45;
      goto LABEL_42;
    }
LABEL_41:
    char v46 = 0;
LABEL_42:
    [v34 removeAllObjects];
    [v35 removeAllObjects];

    id v7 = v40;
    id v8 = v39;
  }
  while ((v46 & 1) != 0);
  v48 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[ASSyncConnection runSyncWithHandler:info:forRequestUUID:]";
    __int16 v70 = 2112;
    v71 = (ASSyncBeginInfo *)v56;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s %@ Finishing sync", buf, 0x16u);
  }
  v49 = @"Assistant Service Event";
  v64[0] = @"Assistant Service Event";
  v64[1] = @"SyncHandler";
  v65[0] = @"Sync finish";
  v65[1] = v56;
  v64[2] = @"SyncReasons";
  v65[2] = v54;
  v50 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
  sub_10000350C(v50);

  if (objc_opt_respondsToSelector()) {
    [v7 syncDidEnd];
  }
}

- (int64_t)defaultChunkBatchSize
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.assistant"];
  v4 = [v3 objectForKey:@"Sync Chunk Batch Size"];

  if (v4)
  {
    id v5 = (char *)[v4 integerValue];
    if ((unint64_t)(v5 - 1) >= 0x270F) {
      int64_t v6 = 100;
    }
    else {
      int64_t v6 = (int64_t)v5;
    }
  }
  else
  {
    int64_t v6 = 100;
  }

  return v6;
}

- (BOOL)_infoIsValid:(id)a3 forPreAnchor:(id)a4
{
  v4 = [a3 object];
  id v5 = v4;
  if (v4 && ([v4 identifier], int64_t v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    id v8 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[ASSyncConnection _infoIsValid:forPreAnchor:]";
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Synced object has no identifier! %@", (uint8_t *)&v10, 0x16u);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_getChunkInfoWithHandler:(id)a3 batchSize:(int64_t)a4 lastAnchor:(id)a5 updates:(id)a6 deletes:(id)a7 post:(id *)a8 targetIsLocal:(BOOL)a9
{
  id v14 = a3;
  id v15 = a5;
  id v40 = a6;
  id v39 = a7;
  __int16 v16 = objc_alloc_init(ASSyncChangeInfo);
  if (a4 < 1)
  {
    BOOL v30 = 0;
  }
  else
  {
    v38 = a8;
    int64_t v17 = 0;
    while (1)
    {
      [(ASSyncChangeInfo *)v16 setObject:0];
      [(ASSyncChangeInfo *)v16 setIsDelete:0];
      [(ASSyncChangeInfo *)v16 setPostAnchor:0];
      [v14 getChangeAfterAnchor:v15 changeInfo:v16];
      v19 = [(ASSyncChangeInfo *)v16 object];
      unsigned int v20 = [(ASSyncChangeInfo *)v16 isDelete];
      uint64_t v21 = [(ASSyncChangeInfo *)v16 postAnchor];
      id v22 = (void *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        uint64_t v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 136315650;
        v43 = "-[ASSyncConnection _getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:]";
        __int16 v44 = 2112;
        id v45 = v25;
        __int16 v46 = 2112;
        v47 = v16;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s %@ change info %@", buf, 0x20u);
      }
      if (!v21 || ([v15 isEqualToString:v21] & 1) != 0) {
        break;
      }
      if (![(ASSyncConnection *)self _infoIsValid:v16 forPreAnchor:v15])
      {
        uint64_t v31 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v43 = "-[ASSyncConnection _getChunkInfoWithHandler:batchSize:lastAnchor:updates:deletes:post:targetIsLocal:]";
          __int16 v44 = 2114;
          id v45 = v14;
          __int16 v46 = 2112;
          v47 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Sync plugin %{public}@ gave bad sync info %@", buf, 0x20u);
        }
        if (AFIsInternalInstall())
        {
          v32 = (objc_class *)objc_opt_class();
          int64_t v33 = NSStringFromClass(v32);
          id v34 = (objc_class *)objc_opt_class();
          id v35 = NSStringFromClass(v34);
          v36 = +[NSString stringWithFormat:@"Sync handler %@ return bad object %@", v33, v35];

          WriteStackshotReport_async();
        }
        break;
      }

      v26 = [v19 properties];
      id v27 = [v26 count];

      if (v27)
      {
        if (v20) {
          v28 = v39;
        }
        else {
          v28 = v40;
        }
        v29 = [v19 dictionary];
        [v28 addObject:v29];

        ++v17;
      }

      id v15 = v21;
      if (v17 >= a4)
      {
        BOOL v30 = 0;
        id v15 = v21;
        goto LABEL_21;
      }
    }

    BOOL v30 = 1;
LABEL_21:
    a8 = v38;
  }
  *a8 = [v15 copy];

  return v30;
}

- (BOOL)_sendChunkWithUpdates:(id)a3 deletes:(id)a4 pre:(id)a5 post:(id)a6 validity:(id)a7 forRequestUUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  unsigned int v20 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = v20;
    int v24 = 136316162;
    v25 = "-[ASSyncConnection _sendChunkWithUpdates:deletes:pre:post:validity:forRequestUUID:]";
    __int16 v26 = 2048;
    id v27 = [v14 count];
    __int16 v28 = 2048;
    id v29 = [v15 count];
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    id v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Sending chunk with %lu updates %lu deletes. Anchors (%@, %@)", (uint8_t *)&v24, 0x34u);
  }
  unsigned __int8 v22 = [(ASSyncConnectionDelegate *)self->_delegate sendSyncChunksWithPreAnchor:v16 postAnchor:v17 updates:v14 deletes:v15 validity:v18 forRequestUUID:v19];

  return v22 ^ 1;
}

- (ASSyncConnection)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASSyncConnection;
  int64_t v6 = [(ASSyncConnection *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

@end