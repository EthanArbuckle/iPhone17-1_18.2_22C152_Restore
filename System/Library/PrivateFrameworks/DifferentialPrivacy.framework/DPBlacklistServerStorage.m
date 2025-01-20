@interface DPBlacklistServerStorage
@end

@implementation DPBlacklistServerStorage

void __93___DPBlacklistServerStorage_requestLatestBlacklistsSynchronously_error_lastRecordModifiedAt___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    int v22 = 138412802;
    v23 = v21;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_DEBUG, "%@: blacklist server responds with (error: %@, data: %@)", (uint8_t *)&v22, 0x20u);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
  id v13 = v7;

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v8;
  id v16 = v8;

  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v9;
  id v19 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __66___DPBlacklistServerStorage_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1E019F810]();
  [*(id *)(a1 + 32) setActivity:v4];
  [*(id *)(a1 + 32) updateRuntimeBlacklistsFromServer];
}

void __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = +[_DPLog daemon];
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_cold_1(a1, (uint64_t)v7, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v26 = 138412802;
      id v27 = v15;
      __int16 v28 = 2048;
      uint64_t v29 = [v8 count];
      __int16 v30 = 1024;
      BOOL v31 = v9 != 0;
      _os_log_impl(&dword_1DC55E000, v11, OS_LOG_TYPE_INFO, "%@: query operation is completed (records: %lu, cursor: %d)", (uint8_t *)&v26, 0x1Cu);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v8];
    if (v9)
    {
      id v16 = +[_DPLog daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        int v26 = 138412290;
        id v27 = v18;
        _os_log_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_DEFAULT, "%@: query operation indicates that it has more records, fetching again using cursor", (uint8_t *)&v26, 0xCu);
      }
      id v19 = *(void **)(a1 + 32);
      id v13 = [v19 _queryOperationFromCursor:v9];
      [v19 _executeQueryOperation:v13 onOperationQueue:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) onCompletion:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    else
    {
      v20 = [v8 sortedArrayUsingComparator:&__block_literal_global_0];
      v21 = [v20 lastObject];
      id v13 = [v21 modificationDate];

      uint64_t v22 = *(void *)(a1 + 40);
      v23 = [*(id *)(a1 + 32) _blacklistURLByKeyFrom:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      (*(void (**)(uint64_t, void, void *, void *))(v22 + 16))(v22, 0, v23, v13);

      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
  }
}

uint64_t __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 modificationDate];
  v6 = [v4 modificationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a3];
  }
  else
  {
    id v9 = +[_DPLog daemon];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = 138412802;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_error_impl(&dword_1DC55E000, v9, OS_LOG_TYPE_ERROR, "%@: unable to obtain record(ID: %@), error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

uint64_t __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  OUTLINED_FUNCTION_1_2(&dword_1DC55E000, a3, v7, "%@: query operation returned error: %@", (uint8_t *)&v8);
}

@end