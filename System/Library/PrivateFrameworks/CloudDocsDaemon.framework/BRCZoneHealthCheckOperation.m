@interface BRCZoneHealthCheckOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCZoneHealthCheckOperation)initWithSession:(id)a3 changeToken:(id)a4;
- (void)completedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4;
- (void)main;
- (void)receivedUpdatedServerChangeToken:(id)a3 requestID:(unint64_t)a4;
@end

@implementation BRCZoneHealthCheckOperation

- (BRCZoneHealthCheckOperation)initWithSession:(id)a3 changeToken:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 syncContextProvider];
  v10 = [v9 zoneHealthSyncContext];
  v17.receiver = self;
  v17.super_class = (Class)BRCZoneHealthCheckOperation;
  v11 = [(_BRCOperation *)&v17 initWithName:@"zone-health-check" syncContext:v10 sessionContext:v8];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeToken, a4);
    uint64_t v12 = objc_opt_new();
    recordsByID = v11->_recordsByID;
    v11->_recordsByID = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    deletedRecordIds = v11->_deletedRecordIds;
    v11->_deletedRecordIds = (NSMutableArray *)v14;
  }
  return v11;
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "brc_isResetError"))
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCZoneHealthCheckOperation;
    BOOL v5 = [(_BRCOperation *)&v7 shouldRetryForError:v4];
  }

  return v5;
}

- (void)receivedUpdatedServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(BRCSyncContext *)self->super._syncContext session];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v7 = [(NSMutableDictionary *)self->_recordsByID keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        id v13 = objc_alloc(MEMORY[0x1E4F594E8]);
        uint64_t v14 = [v12 recordName];
        v15 = (void *)[v13 initWithAppLibraryName:v14];

        id v16 = (id)[v6 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v15];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  objc_super v17 = [v6 clientDB];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__BRCZoneHealthCheckOperation_receivedUpdatedServerChangeToken_requestID___block_invoke;
  v21[3] = &unk_1E6994A88;
  v21[4] = self;
  id v22 = v6;
  id v23 = v5;
  unint64_t v24 = a4;
  id v18 = v5;
  id v19 = v6;
  [v17 performWithFlags:9 action:v21];
}

uint64_t __74__BRCZoneHealthCheckOperation_receivedUpdatedServerChangeToken_requestID___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 512) objectEnumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v38;
    *(void *)&long long v3 = 138412546;
    long long v31 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = *(BRCServerZoneHealthState **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v8 = [(BRCServerZoneHealthState *)v7 objectForKeyedSubscript:@"state", v31];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          id v16 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_FAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = v31;
          v43 = v7;
          __int16 v44 = 2112;
          v45 = v15;
          p_super = &v16->super.super;
          v20 = "[CRIT] UNREACHABLE: state is of unexpected class %@%@";
LABEL_14:
          _os_log_fault_impl(&dword_1D353B000, p_super, OS_LOG_TYPE_FAULT, v20, buf, 0x16u);
          goto LABEL_19;
        }
        uint64_t v10 = [(BRCServerZoneHealthState *)v7 objectForKeyedSubscript:@"updateTime"];
        objc_opt_class();
        char v11 = objc_opt_isKindOfClass();

        if ((v11 & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          id v16 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_FAULT)) {
            goto LABEL_19;
          }
          *(_DWORD *)buf = v31;
          v43 = v7;
          __int16 v44 = 2112;
          v45 = v15;
          p_super = &v16->super.super;
          v20 = "[CRIT] UNREACHABLE: update time is of unexpected class %@%@";
          goto LABEL_14;
        }
        uint64_t v12 = [(BRCServerZoneHealthState *)v7 objectForKeyedSubscript:@"state"];
        uint64_t v13 = [v12 intValue];

        uint64_t v14 = [(BRCServerZoneHealthState *)v7 recordID];
        v15 = [v14 recordName];

        id v16 = [[BRFieldCKInfo alloc] initWithRecord:v7];
        objc_super v17 = [*(id *)(a1 + 40) privateClientZoneByID:v15];
        if (v17)
        {
          id v18 = [[BRCServerZoneHealthState alloc] initWithCKInfo:v16 state:v13];
          [v17 syncedDownZoneHealthState:v18];
        }
        else
        {
          brc_bread_crumbs();
          id v18 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v43 = v15;
            __int16 v44 = 2112;
            v45 = v18;
            _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] We don't have a container for %@%@", buf, 0x16u);
          }
        }
LABEL_19:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v4);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = *(id *)(*(void *)(a1 + 32) + 520);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = [*(id *)(*((void *)&v33 + 1) + 8 * j) recordName];
        long long v28 = [*(id *)(a1 + 40) privateClientZoneByID:v27];
        [v28 zoneHealthWasReset];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }

  v29 = [*(id *)(a1 + 40) containerScheduler];
  [v29 receivedUpdatedZoneHealthServerChangeToken:*(void *)(a1 + 48) requestID:*(void *)(a1 + 56)];

  return 1;
}

- (void)completedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(BRCSyncContext *)self->super._syncContext session];
  uint64_t v8 = [v7 clientDB];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__BRCZoneHealthCheckOperation_completedZoneHealthSyncDownWithRequestID_error___block_invoke;
  v11[3] = &unk_1E6994AB0;
  id v13 = v6;
  unint64_t v14 = a3;
  id v12 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 performWithFlags:9 action:v11];

  [(_BRCOperation *)self completedWithResult:0 error:v9];
}

uint64_t __78__BRCZoneHealthCheckOperation_completedZoneHealthSyncDownWithRequestID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) containerScheduler];
  [v2 finishedZoneHealthSyncDownWithRequestID:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];

  return 1;
}

- (void)main
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┣%llx starting a fetch-record-changes operation for health zone%@");
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v26 = *(_OWORD *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 64);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v21 = [WeakRetained operationID];
    *(_DWORD *)buf = 134218754;
    id v29 = (id)v26;
    __int16 v30 = 2112;
    id v31 = v3;
    __int16 v32 = 2112;
    long long v33 = v21;
    __int16 v34 = 2112;
    long long v35 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got a changed record %@ in operation %@%@", buf, 0x2Au);
  }
  objc_super v7 = [v3 recordType];
  int v8 = [v7 isEqualToString:@"zoneState"];

  if (v8)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 520);
    id v10 = [v3 recordID];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9)
    {
      id v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_2();
      }
    }
    char v11 = *(void **)(*(void *)(a1 + 32) + 512);
    id v12 = objc_msgSend(v3, "recordID", v26, v27);
    id v13 = [v11 objectForKeyedSubscript:v12];
    LOBYTE(v11) = v13 == 0;

    if ((v11 & 1) == 0)
    {
      uint64_t v24 = brc_bread_crumbs();
      uint64_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_1();
      }
    }
    unint64_t v14 = *(void **)(*(void *)(a1 + 32) + 512);
    v15 = [v3 recordID];
    [v14 setObject:v3 forKeyedSubscript:v15];
  }
  else
  {
    id v16 = [v3 recordType];
    int v17 = [v16 isEqualToString:@"zoneDetails"];

    if (v17)
    {
      v15 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [WeakRetained operationID];
        *(_DWORD *)buf = 138412802;
        id v29 = v3;
        __int16 v30 = 2112;
        id v31 = v19;
        __int16 v32 = 2112;
        long long v33 = v15;
        _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring zone details record %@ in operation %@%@", buf, 0x20u);
      }
    }
    else
    {
      v15 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [WeakRetained operationID];
        *(_DWORD *)buf = 138412802;
        id v29 = v3;
        __int16 v30 = 2112;
        id v31 = v20;
        __int16 v32 = 2112;
        long long v33 = v15;
        _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring record of unexpected type %@ in operation %@%@", buf, 0x20u);
      }
    }
  }
  __brc_leave_section((uint64_t *)&v26);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v17 = *(_OWORD *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 64);
  int v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [WeakRetained operationID];
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v17;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    long long v26 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx recordID was deleted %@ in operation %@%@", buf, 0x2Au);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 520) containsObject:v5])
  {
    id v13 = brc_bread_crumbs();
    unint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_2();
    }
  }
  id v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 512), "objectForKeyedSubscript:", v5, v17, v18);
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_1();
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 520) addObject:v5];
  __brc_leave_section((uint64_t *)&v17);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t *)[v9 bytes];
  if (v10) {
    uint64_t v11 = *v10;
  }
  else {
    uint64_t v11 = 0;
  }
  long long v15 = *(_OWORD *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 56);
  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v14 = [v8 descriptionWithContext:0];
    *(_DWORD *)buf = 134218754;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Received token update %@, requestID %llu%@", buf, 0x2Au);
  }
  [*(id *)(a1 + 32) receivedUpdatedServerChangeToken:v8 requestID:v11];
  [*(id *)(*(void *)(a1 + 32) + 520) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 512) removeAllObjects];
  __brc_leave_section((uint64_t *)&v15);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_21(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = v12;
  uint64_t v16 = (void **)[v15 bytes];
  if (v16) {
    long long v17 = *v16;
  }
  else {
    long long v17 = 0;
  }
  long long v23 = *(_OWORD *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v18 = brc_bread_crumbs();
  __int16 v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = [v11 descriptionWithContext:0];
    *(_DWORD *)buf = 134219010;
    id v26 = (id)v23;
    __int16 v27 = 2112;
    id v28 = WeakRetained;
    __int16 v29 = 2048;
    __int16 v30 = v17;
    __int16 v31 = 2112;
    __int16 v32 = v22;
    __int16 v33 = 2112;
    __int16 v34 = v18;
    _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished sync down of zone-health %@ with requestID %llu changeToken %@%@", buf, 0x34u);
  }
  if (objc_msgSend(v13, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = WeakRetained;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] No zone-health zone %@: %@%@", buf, 0x20u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v13)
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = WeakRetained;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] Failed syncing down zone-health op %@: %@%@", buf, 0x20u);
    }
    goto LABEL_12;
  }
LABEL_13:
  [*(id *)(a1 + 32) receivedUpdatedServerChangeToken:v11 requestID:v17];
  [*(id *)(a1 + 32) completedZoneHealthSyncDownWithRequestID:v17 error:v13];
  __brc_leave_section((uint64_t *)&v23);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __35__BRCZoneHealthCheckOperation_main__block_invoke_23_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "completedZoneHealthSyncDownWithRequestID:error:", 0, v3, v6, v7);
    __brc_leave_section((uint64_t *)&v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIds, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_recordsByID[record.recordID] == nil%@", v2, v3, v4, v5, v6);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![self->_deletedRecordIds containsObject:record.recordID]%@", v2, v3, v4, v5, v6);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_recordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![self->_deletedRecordIds containsObject:recordID]%@", v2, v3, v4, v5, v6);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┳%llx sync down of zone-health-check was cancelled?%@");
}

@end