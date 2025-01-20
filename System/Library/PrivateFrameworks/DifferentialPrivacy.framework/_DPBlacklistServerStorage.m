@interface _DPBlacklistServerStorage
- (BOOL)prepareRuntimeBlacklistFolder:(id *)a3;
- (BOOL)requestLatestBlacklistsSynchronously:(id *)a3 error:(id *)a4 lastRecordModifiedAt:(id *)a5;
- (BOOL)updateRuntimeBlacklistsFromServer;
- (NSDate)lastUpdateDate;
- (NSString)storePath;
- (OS_xpc_object)activity;
- (_DPBlacklistServerStorage)init;
- (_DPBlacklistServerStorage)initWithCustomStorePath:(id)a3;
- (id)_blacklistURLByKeyFrom:(id)a3;
- (id)_predicateForFetchQuery;
- (id)_publicDatabaseForBlacklists;
- (id)_queryOperationFromCursor:(id)a3;
- (id)saveBlacklistsToRuntimeFolder:(id)a3;
- (void)_attributeQueryOperation:(id)a3;
- (void)_executeQueryOperation:(id)a3 onOperationQueue:(id)a4 onCompletion:(id)a5;
- (void)_requestLatestBlacklists:(id)a3;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
- (void)setActivity:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setStorePath:(id)a3;
- (void)updateRuntimeBlacklistsFromServer;
@end

@implementation _DPBlacklistServerStorage

- (_DPBlacklistServerStorage)init
{
  v3 = +[_DPStrings runtimeBlacklistDirectoryPath];
  v4 = [(_DPBlacklistServerStorage *)self initWithCustomStorePath:v3];

  return v4;
}

- (_DPBlacklistServerStorage)initWithCustomStorePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPBlacklistServerStorage;
  v6 = [(_DPBlacklistServerStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storePath, a3);
  }

  return v7;
}

- (BOOL)updateRuntimeBlacklistsFromServer
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (+[_DPDeviceInfo isDataCollectionEnabled])
  {
    v4 = self;
    uint64_t v5 = objc_sync_enter(v4);
    context = (void *)MEMORY[0x1E019F810](v5);
    id v36 = 0;
    id v37 = 0;
    id v35 = 0;
    BOOL v6 = [(_DPBlacklistServerStorage *)v4 requestLatestBlacklistsSynchronously:&v37 error:&v36 lastRecordModifiedAt:&v35];
    id v7 = v37;
    id v8 = v36;
    id v9 = v35;
    if (v6)
    {
      v10 = +[_DPLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v7 count];
        *(_DWORD *)buf = 138412546;
        id v41 = v12;
        __int16 v42 = 2048;
        uint64_t v43 = v13;
        _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_INFO, "%@: request for new blacklist files is completed (updated blacklists count: %lu)", buf, 0x16u);
      }
      id v34 = 0;
      BOOL v14 = [(_DPBlacklistServerStorage *)v4 prepareRuntimeBlacklistFolder:&v34];
      v15 = v34;
      if (v14)
      {
        v16 = +[_DPLog framework];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 138412290;
          id v41 = v18;
          _os_log_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_INFO, "%@: Runtime Blacklists Folder is ready", buf, 0xCu);
        }
        v19 = [(_DPBlacklistServerStorage *)v4 saveBlacklistsToRuntimeFolder:v7];
        v20 = +[_DPLog framework];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = [v19 count];
          *(_DWORD *)buf = 138412546;
          id v41 = v22;
          __int16 v42 = 2048;
          uint64_t v43 = v23;
          _os_log_impl(&dword_1DC55E000, v20, OS_LOG_TYPE_INFO, "%@: Blacklists saved to Runtime Folder, count: %lu", buf, 0x16u);
        }
        if ([v19 count])
        {
          v24 = +[_DPLog framework];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            [(_DPBlacklistServerStorage *)v26 updateRuntimeBlacklistsFromServer];
          }

          +[_DPBlacklist removeBlackListsForKeys:v19];
          [(_DPBlacklistServerStorage *)v4 setLastUpdateDate:v9];
        }
        v27 = +[_DPLog framework];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          *(_DWORD *)v38 = 138412290;
          v39 = v29;
          _os_log_impl(&dword_1DC55E000, v27, OS_LOG_TYPE_INFO, "%@: blacklist files update from server is finished", v38, 0xCu);
        }
      }
      else
      {
        v19 = +[_DPLog daemon];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          objc_claimAutoreleasedReturnValue();
          -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer]();
        }
      }
    }
    else
    {
      v15 = +[_DPLog daemon];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        objc_claimAutoreleasedReturnValue();
        -[_DPBlacklistServerStorage updateRuntimeBlacklistsFromServer]();
      }
      BOOL v14 = 0;
    }

    objc_sync_exit(v4);
  }
  else
  {
    v4 = +[_DPLog daemon];
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      [(_DPBlacklistServerStorage *)a2 updateRuntimeBlacklistsFromServer];
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)requestLatestBlacklistsSynchronously:(id *)a3 error:(id *)a4 lastRecordModifiedAt:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy_;
  uint64_t v44 = __Block_byref_object_dispose_;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = +[_DPLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138412290;
    v53 = v11;
    _os_log_impl(&dword_1DC55E000, v9, OS_LOG_TYPE_INFO, "%@: requesting new blacklist files from server", buf, 0xCu);
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __93___DPBlacklistServerStorage_requestLatestBlacklistsSynchronously_error_lastRecordModifiedAt___block_invoke;
  uint64_t v23 = &unk_1E6C43DD8;
  v24 = self;
  v26 = &v46;
  v27 = &v40;
  v28 = &v34;
  v29 = &v30;
  id v12 = v8;
  v25 = v12;
  [(_DPBlacklistServerStorage *)self _requestLatestBlacklists:&v20];
  dispatch_time_t v13 = dispatch_time(0, 600000000000);
  dispatch_semaphore_wait(v12, v13);
  if (*((unsigned char *)v31 + 24))
  {
    if (!v47[5])
    {
      *a3 = (id) v41[5];
      *a5 = (id) v35[5];
      BOOL v18 = 1;
      goto LABEL_12;
    }
    BOOL v14 = +[_DPLog daemon];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      objc_claimAutoreleasedReturnValue();
      -[_DPBlacklistServerStorage requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:]();
    }
  }
  else
  {
    BOOL v14 = +[_DPLog daemon];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      -[_DPBlacklistServerStorage requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:](v17, (uint64_t)buf, v14);
    }
  }

  BOOL v18 = 0;
LABEL_12:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v18;
}

- (BOOL)prepareRuntimeBlacklistFolder:(id *)a3
{
  v4 = [(_DPBlacklistServerStorage *)self storePath];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a3) = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:a3];

  return (char)a3;
}

- (id)saveBlacklistsToRuntimeFolder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26 = [(_DPBlacklistServerStorage *)self storePath];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v6 objectForKeyedSubscript:v10];
        id v12 = (void *)MEMORY[0x1E4F1CB10];
        dispatch_time_t v13 = [NSString stringWithFormat:@"%@.blacklist", v10];
        uint64_t v14 = [v26 stringByAppendingPathComponent:v13];
        v15 = [v12 fileURLWithPath:v14 isDirectory:0];

        [v5 removeItemAtURL:v15 error:0];
        id v27 = 0;
        LOBYTE(v14) = [v5 moveItemAtURL:v11 toURL:v15 error:&v27];
        id v16 = v27;
        v17 = +[_DPLog framework];
        BOOL v18 = v17;
        if (v14)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v19 = (objc_class *)objc_opt_class();
            uint64_t v20 = NSStringFromClass(v19);
            *(_DWORD *)buf = 138412546;
            char v33 = v20;
            __int16 v34 = 2112;
            id v35 = v10;
            _os_log_debug_impl(&dword_1DC55E000, v18, OS_LOG_TYPE_DEBUG, "%@: blacklist for key '%@' successfully moved to runtime directory", buf, 0x16u);
          }
          [v24 addObject:v10];
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = (objc_class *)objc_opt_class();
            id v22 = NSStringFromClass(v21);
            *(_DWORD *)buf = 138412546;
            char v33 = v22;
            __int16 v34 = 2112;
            id v35 = v16;
            _os_log_error_impl(&dword_1DC55E000, v18, OS_LOG_TYPE_ERROR, "%@: Unable to move new blacklist file to runtime directory: %@", buf, 0x16u);
          }
        }
        [v5 removeItemAtURL:v11 error:0];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v8);
  }

  return v24;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___DPBlacklistServerStorage_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E6C43BE0;
  v7[4] = self;
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E019FA60](v7);
  id v6 = +[_DPPeriodicTask taskWithName:v4 period:kSecondsIn24Hours handler:v5 networkingRequired:1];

  +[_DPPeriodicTaskManager registerTask:v6];
}

- (NSDate)lastUpdateDate
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"kLastUpdateDateKey"];

  return (NSDate *)v3;
}

- (void)setLastUpdateDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  uint64_t v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"kLastUpdateDateKey"];

  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 synchronize];
}

- (void)_requestLatestBlacklists:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1A2A0]);
  id v6 = [(_DPBlacklistServerStorage *)self _predicateForFetchQuery];
  uint64_t v7 = (void *)[v5 initWithRecordType:@"BlacklistRecord" predicate:v6];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v7];
  [(_DPBlacklistServerStorage *)self _attributeQueryOperation:v8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy_;
  long long v29 = __Block_byref_object_dispose_;
  id v30 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__30;
  uint64_t v21 = __Block_byref_object_dispose__31;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke;
  v12[3] = &unk_1E6C43E20;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  uint64_t v14 = &v17;
  v15 = v23;
  id v16 = &v25;
  uint64_t v10 = MEMORY[0x1E019FA60](v12);
  v11 = (void *)v18[5];
  v18[5] = v10;

  [(_DPBlacklistServerStorage *)self _executeQueryOperation:v8 onOperationQueue:v26[5] onCompletion:v18[5]];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

- (void)_executeQueryOperation:(id)a3 onOperationQueue:(id)a4 onCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke;
  v18[3] = &unk_1E6C43E48;
  v18[4] = self;
  v18[5] = v19;
  [v8 setRecordMatchedBlock:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke_36;
  v15 = &unk_1E6C43E70;
  id v11 = v10;
  id v16 = v11;
  uint64_t v17 = v19;
  [v8 setQueryCompletionBlock:&v12];
  objc_msgSend(v9, "addOperation:", v8, v12, v13, v14, v15);

  _Block_object_dispose(v19, 8);
}

- (id)_queryOperationFromCursor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A2B8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithCursor:v5];

  [(_DPBlacklistServerStorage *)self _attributeQueryOperation:v6];
  return v6;
}

- (void)_attributeQueryOperation:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
  [v9 setXpcActivity:WeakRetained];

  [v9 setPreferAnonymousRequests:1];
  [v9 setDiscretionaryNetworkBehavior:0];
  [v4 setConfiguration:v9];
  id v6 = [MEMORY[0x1E4F1A310] defaultRecordZone];
  uint64_t v7 = [v6 zoneID];
  [v4 setZoneID:v7];

  id v8 = [(_DPBlacklistServerStorage *)self _publicDatabaseForBlacklists];
  [v4 setDatabase:v8];
}

- (id)_blacklistURLByKeyFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v21 = (id)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412802;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"key", v19);
        uint64_t v12 = [v10 objectForKeyedSubscript:@"blacklistAsset"];
        uint64_t v13 = [v12 fileURL];
        uint64_t v14 = (void *)v13;
        if (v11) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          id v16 = +[_DPLog daemon];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = (objc_class *)objc_opt_class();
            id v20 = NSStringFromClass(v17);
            *(_DWORD *)buf = v19;
            uint64_t v27 = v20;
            __int16 v28 = 2112;
            long long v29 = v11;
            __int16 v30 = 2112;
            long long v31 = v12;
            _os_log_error_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_ERROR, "%@: Received wrong blacklist record from server: (key: %@, asset: %@)", buf, 0x20u);
          }
        }
        else
        {
          [v21 setObject:v13 forKey:v11];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v7);
  }

  return v21;
}

- (id)_publicDatabaseForBlacklists
{
  v2 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.DPBlacklist"];
  id v3 = [v2 publicCloudDatabase];

  return v3;
}

- (id)_predicateForFetchQuery
{
  v2 = [(_DPBlacklistServerStorage *)self lastUpdateDate];
  if (v2) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"modificationDate > %@", v2];
  }
  else {
  id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v3;
}

- (NSString)storePath
{
  return self->_storePath;
}

- (void)setStorePath:(id)a3
{
}

- (OS_xpc_object)activity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
  return (OS_xpc_object *)WeakRetained;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activity);
  objc_storeStrong((id *)&self->_storePath, 0);
}

- (void)updateRuntimeBlacklistsFromServer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "%@: Disabled by D&U switch - skipping server deny-list update", (uint8_t *)&v4, 0xCu);
}

- (void)requestLatestBlacklistsSynchronously:(void *)a1 error:(uint64_t)a2 lastRecordModifiedAt:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = 600;
  OUTLINED_FUNCTION_1_2(&dword_1DC55E000, a3, (uint64_t)a3, "%@: Request to server was timed out (timeout in seconds: %lld)", (uint8_t *)a2);
}

- (void)requestLatestBlacklistsSynchronously:error:lastRecordModifiedAt:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v2 = *(void *)(*(void *)v1 + 40);
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_1_2(&dword_1DC55E000, v6, v3, "%@: Blacklist Server responded with error: %@", v5);
}

@end