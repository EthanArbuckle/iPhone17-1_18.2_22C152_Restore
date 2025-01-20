@interface DiagnosticStorageManager
- (ABCFileCleaner)abcCleaner;
- (DiagnosticStorageManager)initWithPersistentStoreController:(id)a3 logArchiveDirectory:(id)a4;
- (unint64_t)allowableDiskUsageSize;
- (unint64_t)deleteAttachmentFiles:(id)a3;
- (unint64_t)performPeriodicPurge;
- (unint64_t)performPurgeToMeetDiskUsageLimit:(unint64_t)a3 calculateOnly:(BOOL)a4;
- (void)_autoBugCaptureDiskUsageSize:(id)a3;
- (void)_calculatePurgableSizeForRequestedPurgeSize:(unint64_t)a3 reply:(id)a4;
- (void)_inspectAutoBugCaptureDiskUsage:(id)a3;
- (void)_performSizedPurge:(unint64_t)a3 reply:(id)a4;
- (void)_purgeCasesWithCaseIDs:(id)a3;
- (void)_sortedAutoBugCaptureDiskUsageByCase:(id)a3;
- (void)cleanupCasesAfterACentralizedCacheDeletePurgeEvent:(id)a3;
- (void)deleteAttachmentsAtPaths:(id)a3;
- (void)deleteAttachmentsForCases:(id)a3;
- (void)didSaveDiagnosticCases;
- (void)fileCleanupComplete;
- (void)invalidateDiskUsageStatistics;
- (void)purgeAttachmentsAtPaths:(id)a3;
- (void)purgeAttachmentsForAllCases;
- (void)purgeDEPayloadForCase:(id)a3;
- (void)removeCaseStorageAndAttachmentsForCasesWithUUIDs:(id)a3;
- (void)setAbcCleaner:(id)a3;
@end

@implementation DiagnosticStorageManager

- (DiagnosticStorageManager)initWithPersistentStoreController:(id)a3 logArchiveDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticStorageManager;
  v9 = [(DiagnosticStorageManager *)&v14 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.symptoms.diagstoragemanager.queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_storeController, a3);
    objc_storeStrong((id *)&v9->_logArchivePath, a4);
  }
  return v9;
}

- (unint64_t)allowableDiskUsageSize
{
  v2 = +[SystemProperties sharedInstance];
  int v3 = [v2 deviceClass];

  if (v3 == 7) {
    return 0x40000000;
  }
  else {
    return 0x280000000;
  }
}

- (void)invalidateDiskUsageStatistics
{
  payloadsByCaseID = self->_payloadsByCaseID;
  self->_payloadsByCaseID = 0;

  casesSortedByDate = self->_casesSortedByDate;
  self->_casesSortedByDate = 0;

  self->_lastCalculatedDiskUsageSize = 0;
}

- (unint64_t)performPeriodicPurge
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke;
  block[3] = &unk_263FC44F0;
  dispatch_semaphore_t v10 = v3;
  dispatch_queue_t v11 = &v12;
  block[4] = self;
  v5 = v3;
  dispatch_async(queue, block);
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke_2;
  v4[3] = &unk_263FC44C8;
  v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _sortedAutoBugCaptureDiskUsageByCase:v4];
}

void __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-864000.0];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    unint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    do
    {
      uint64_t v10 = 0;
      dispatch_queue_t v11 = v7;
      uint64_t v12 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        id v8 = objc_msgSend(v13, "objectForKeyedSubscript:", @"caseDate", v28);

        unint64_t v7 = [v13 objectForKeyedSubscript:@"caseID"];

        if ([v7 length])
        {
          if ([v3 compare:v8] != 1) {
            goto LABEL_18;
          }
          uint64_t v14 = [v13 objectForKeyedSubscript:@"SymptomsAttachmentsTotalSize"];
          uint64_t v15 = [v14 unsignedIntegerValue];

          v16 = [v13 objectForKeyedSubscript:@"SymptomsDiagExtAttachmentsTotalSize"];
          uint64_t v17 = [v16 unsignedIntegerValue];

          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v17 + v15;
          v18 = storageLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v37 = (uint64_t)v7;
            __int16 v38 = 2112;
            v39 = v8;
            __int16 v40 = 2112;
            v41 = v3;
            _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "Payloads for case %@ (generated on %@) is older than the retention limit (%@) and will be purged", buf, 0x20u);
          }

          [v30 addObject:v7];
        }
        else
        {
          v19 = storageLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            uint64_t v37 = (uint64_t)v13;
            _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "This case is missing a caseID: %@", buf, 0xCu);
          }
        }
        ++v10;
        dispatch_queue_t v11 = v7;
        uint64_t v12 = v8;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
    id v8 = 0;
  }
LABEL_18:

  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v21 = storageLogHandle();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      uint64_t v23 = [v30 count];
      v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      uint64_t v37 = v23;
      __int16 v38 = 2048;
      v39 = v24;
      v25 = "The total periodic purge size for %lu cases shall be %lu";
      v26 = v21;
      uint32_t v27 = 22;
LABEL_23:
      _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
  }
  else if (v22)
  {
    *(_WORD *)buf = 0;
    v25 = "There are no stale cases which need to be purged";
    v26 = v21;
    uint32_t v27 = 2;
    goto LABEL_23;
  }

  [*(id *)(a1 + 32) _purgeCasesWithCaseIDs:v30];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (unint64_t)performPurgeToMeetDiskUsageLimit:(unint64_t)a3 calculateOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v7 = storageLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = "NO";
    if (v4) {
      id v8 = "YES";
    }
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "performPurgeToMeetDiskUsageLimit (%lu) calculateOnly:%s", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v21 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke;
  block[3] = &unk_263FC4590;
  BOOL v19 = v4;
  uint64_t v17 = buf;
  unint64_t v18 = a3;
  block[4] = self;
  dispatch_semaphore_t v16 = v9;
  dispatch_queue_t v11 = v9;
  dispatch_async(queue, block);
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v11, v12);
  unint64_t v13 = *(void *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateDiskUsageStatistics];
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2;
  v6[3] = &unk_263FC4568;
  uint64_t v3 = *(void *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 64);
  uint64_t v8 = v3;
  v6[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 _autoBugCaptureDiskUsageSize:v6];
}

void __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 56) >= a2)
  {
    uint64_t v10 = *(NSObject **)(a1 + 40);
    dispatch_semaphore_signal(v10);
  }
  else
  {
    id v4 = storageLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = a2;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "ABC Disk Usage exceeds limit: %lu > %lu", buf, 0x16u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = a2 - *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 64))
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_29;
      v16[3] = &unk_263FC4518;
      long long v12 = *(_OWORD *)(a1 + 40);
      id v8 = (id)v12;
      long long v17 = v12;
      [v6 _calculatePurgableSizeForRequestedPurgeSize:v7 reply:v16];
      char v9 = (void *)v17;
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2_31;
      v14[3] = &unk_263FC4540;
      long long v13 = *(_OWORD *)(a1 + 40);
      id v11 = (id)v13;
      long long v15 = v13;
      [v6 _performSizedPurge:v7 reply:v14];
      char v9 = (void *)v15;
    }
  }
}

intptr_t __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2_31(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_performSizedPurge:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__DiagnosticStorageManager__performSizedPurge_reply___block_invoke;
  v8[3] = &unk_263FC45B8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(DiagnosticStorageManager *)self _calculatePurgableSizeForRequestedPurgeSize:a3 reply:v8];
}

uint64_t __53__DiagnosticStorageManager__performSizedPurge_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _purgeCasesWithCaseIDs:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_calculatePurgableSizeForRequestedPurgeSize:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__DiagnosticStorageManager__calculatePurgableSizeForRequestedPurgeSize_reply___block_invoke;
  v8[3] = &unk_263FC45E0;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  [(DiagnosticStorageManager *)self _sortedAutoBugCaptureDiskUsageByCase:v8];
}

void __78__DiagnosticStorageManager__calculatePurgableSizeForRequestedPurgeSize_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v5 = 138412290;
    long long v21 = v5;
    do
    {
      uint64_t v10 = 0;
      id v11 = v7;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        id v7 = objc_msgSend(v12, "objectForKeyedSubscript:", @"caseID", v21);

        if ([v7 length])
        {
          long long v13 = [v12 objectForKeyedSubscript:@"SymptomsAttachmentsTotalSize"];
          uint64_t v14 = [v13 unsignedIntegerValue];

          long long v15 = [v12 objectForKeyedSubscript:@"SymptomsDiagExtAttachmentsTotalSize"];
          uint64_t v16 = [v15 unsignedIntegerValue];

          v8 += v14 + v16;
          [v3 addObject:v7];
          if ((unint64_t)v8 >= *(void *)(a1 + 40)) {
            goto LABEL_14;
          }
        }
        else
        {
          long long v17 = storageLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v29 = (char *)v12;
            _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, "This case is missing a caseID: %@", buf, 0xCu);
          }
        }
        ++v10;
        id v11 = v7;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
LABEL_14:
  }
  else
  {
    id v8 = 0;
  }

  unint64_t v18 = storageLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    v29 = v8;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "purge size calculated to be %lu for a requestedPurgeSize of %lu", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(uint64_t, id, char *))(v20 + 16))(v20, v3, v8);
  }
}

- (void)_purgeCasesWithCaseIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        long long v12 = v9;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          id v14 = objc_alloc(MEMORY[0x263F08C38]);
          uint64_t v9 = objc_msgSend(v14, "initWithUUIDString:", v13, (void)v15);

          [v5 addObject:v9];
          ++v11;
          long long v12 = v9;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    [(DiagnosticStorageManager *)self removeCaseStorageAndAttachmentsForCasesWithUUIDs:v5];
    [(DiagnosticStorageManager *)self invalidateDiskUsageStatistics];
  }
}

- (void)removeCaseStorageAndAttachmentsForCasesWithUUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) UUIDString];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    queue = self->_queue;
    storeController = self->_storeController;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __77__DiagnosticStorageManager_removeCaseStorageAndAttachmentsForCasesWithUUIDs___block_invoke;
    v15[3] = &unk_263FC4608;
    v15[4] = self;
    id v16 = v5;
    id v14 = v5;
    [(ABCPersistentStoreController *)storeController caseAttachmentsForDiagnosticCaseIDs:v14 queue:queue reply:v15];
  }
}

void __77__DiagnosticStorageManager_removeCaseStorageAndAttachmentsForCasesWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    [*(id *)(a1 + 32) deleteAttachmentsForCases:v3];
    [*(id *)(*(void *)(a1 + 32) + 40) removeCaseStoragesWithCaseIDs:*(void *)(a1 + 40)];
  }
}

- (void)deleteAttachmentsForCases:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__DiagnosticStorageManager_deleteAttachmentsForCases___block_invoke;
    v6[3] = &unk_263FC4630;
    v6[4] = self;
    [v4 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    id v5 = storageLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "Skipping deletion for empty attachments list.", buf, 2u);
    }
  }
}

void __54__DiagnosticStorageManager_deleteAttachmentsForCases___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x21050CEB0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 objectForKeyedSubscript:@"caseID"];
    id v6 = [v3 objectForKeyedSubscript:@"caseAttachments"];
    uint64_t v7 = +[DiagnosticCase attachmentsFromStringRepresentation:v6];
    uint64_t v8 = [*(id *)(a1 + 32) deleteAttachmentFiles:v7];
    uint64_t v9 = storageLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "Deleted %lu attachment files for case %@", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_7;
  }
  id v5 = storageLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v10);
    int v11 = 138412546;
    uint64_t v12 = (uint64_t)v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Found unexpected class %@ in cases array: %@", (uint8_t *)&v11, 0x16u);
LABEL_7:
  }
}

- (void)deleteAttachmentsAtPaths:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__DiagnosticStorageManager_deleteAttachmentsAtPaths___block_invoke;
  v7[3] = &unk_263FC4658;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = storageLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v9[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v6;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Deleted a total of %lu attachment files.", buf, 0xCu);
  }

  _Block_object_dispose(&v8, 8);
}

void __53__DiagnosticStorageManager_deleteAttachmentsAtPaths___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) deleteAttachmentFiles:v3];
  }
  else
  {
    id v4 = storageLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Found unexpected object of class %@ in attachments list (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (unint64_t)deleteAttachmentFiles:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__DiagnosticStorageManager_deleteAttachmentFiles___block_invoke;
  v8[3] = &unk_263FC3F10;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [v3 enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__DiagnosticStorageManager_deleteAttachmentFiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = (void *)[objc_alloc(NSURL) initWithString:v7];
    if (!v8)
    {
LABEL_12:

      goto LABEL_13;
    }
    id v9 = *(void **)(a1 + 32);
    id v17 = 0;
    int v10 = [v9 removeItemAtURL:v8 error:&v17];
    id v11 = v17;
    uint64_t v12 = v11;
    if (v10)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else
    {
      uint64_t v15 = [v11 domain];
      if (v15 == *MEMORY[0x263F07F70] && [v12 code] != 4)
      {
        uint64_t v16 = [v12 code];

        if (v16 == 260) {
          goto LABEL_11;
        }
        uint64_t v15 = storageLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = v7;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_ERROR, "Failed to delete file at %@. (%@)", buf, 0x16u);
        }
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v13 = storageLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = NSStringFromClass((Class)v6);
    *(_DWORD *)buf = 138412546;
    id v19 = v14;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object of class %@ in attachments list (%@)", buf, 0x16u);
  }
  *a4 = 1;
LABEL_13:
}

- (void)purgeAttachmentsForAllCases
{
  queue = self->_queue;
  storeController = self->_storeController;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__DiagnosticStorageManager_purgeAttachmentsForAllCases__block_invoke;
  v4[3] = &unk_263FC4680;
  v4[4] = self;
  [(ABCPersistentStoreController *)storeController caseAttachmentsForAllDiagnosticCasesWithQueue:queue reply:v4];
}

uint64_t __55__DiagnosticStorageManager_purgeAttachmentsForAllCases__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteAttachmentsForCases:a2];
}

- (void)cleanupCasesAfterACentralizedCacheDeletePurgeEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = storageLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Cleanup cases after Centralized CD Purge for these files %@", buf, 0xCu);
  }

  if (!v4)
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  if ([v4 count])
  {
    uint64_t v8 = (void *)[v4 copy];
LABEL_7:
    queue = self->_queue;
    storeController = self->_storeController;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__DiagnosticStorageManager_cleanupCasesAfterACentralizedCacheDeletePurgeEvent___block_invoke;
    v12[3] = &unk_263FC46A8;
    id v13 = v8;
    id v14 = v5;
    id v15 = v6;
    uint64_t v16 = self;
    id v11 = v8;
    [(ABCPersistentStoreController *)storeController caseAttachmentsForAllDiagnosticCasesWithQueue:queue reply:v12];
  }
}

void __79__DiagnosticStorageManager_cleanupCasesAfterACentralizedCacheDeletePurgeEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  context = (void *)MEMORY[0x21050CEB0]();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v6 = [v5 objectForKeyedSubscript:@"caseAttachments"];
        id v7 = [v5 objectForKeyedSubscript:@"caseID"];
        long long v28 = (void *)v6;
        uint64_t v8 = +[DiagnosticCase attachmentsFromStringRepresentation:v6];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (!v10) {
          goto LABEL_24;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        while (2)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = (void *)[objc_alloc(NSURL) initWithString:*(void *)(*((void *)&v29 + 1) + 8 * j)];
            id v15 = [v14 path];
            uint64_t v16 = *(void **)(a1 + 32);
            if (v16)
            {
              if ([v16 containsObject:v15])
              {
                id v17 = storageLogHandle();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v38 = (uint64_t)v7;
                  uint64_t v19 = v17;
                  __int16 v20 = "Case %@ will be purged due to purged payload files";
                  goto LABEL_22;
                }
                goto LABEL_23;
              }
            }
            else if (([*(id *)(a1 + 48) fileExistsAtPath:v15] & 1) == 0)
            {
              id v17 = storageLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v38 = (uint64_t)v7;
                uint64_t v19 = v17;
                __int16 v20 = "Case %@ will be purged due to missing payload files";
LABEL_22:
                _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
LABEL_23:

              [*(id *)(a1 + 40) addObject:v7];
              goto LABEL_24;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_24:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v27);
  }

  if ([*(id *)(a1 + 40) count])
  {
    id v21 = storageLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [*(id *)(a1 + 40) count];
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = v22;
      __int16 v39 = 2112;
      uint64_t v40 = v23;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEFAULT, "Post Centralized CacheDelete cleanup for %lu cases: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 56) _purgeCasesWithCaseIDs:*(void *)(a1 + 40)];
  }
}

- (void)purgeDEPayloadForCase:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 UUIDString];

      id v4 = (id)v5;
    }
  }
  storeController = self->_storeController;
  v12[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__DiagnosticStorageManager_purgeDEPayloadForCase___block_invoke;
  v10[3] = &unk_263FC4680;
  id v11 = v4;
  id v9 = v4;
  [(ABCPersistentStoreController *)storeController caseAttachmentsForDiagnosticCaseIDs:v7 queue:queue reply:v10];
}

void __50__DiagnosticStorageManager_purgeDEPayloadForCase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a2;
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v41;
    *(void *)&long long v2 = 138412802;
    long long v28 = v2;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v3;
        id v4 = *(void **)(*((void *)&v40 + 1) + 8 * v3);
        uint64_t v5 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v28);
        uint64_t v6 = [v4 objectForKeyedSubscript:kStoredPayloadKeyAttachmentPaths];
        id v7 = storageLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [v6 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v45 = v8;
          _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Will purge %ld files.", buf, 0xCu);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v50 count:16];
        if (!v10)
        {
          unint64_t v34 = 0;
          id v12 = 0;
          goto LABEL_35;
        }
        uint64_t v11 = v10;
        unint64_t v34 = 0;
        id v12 = 0;
        uint64_t v13 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            id v15 = v12;
            if (*(void *)v37 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = storageLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v45 = v16;
                _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_INFO, "Will remove file at %@", buf, 0xCu);
              }

              id v35 = v15;
              int v18 = [v5 removeItemAtPath:v16 error:&v35];
              id v12 = v35;

              if (v18)
              {
                uint64_t v19 = storageLogHandle();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v45 = v16;
                  _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
                }

                if ([v5 fileExistsAtPath:v16])
                {
                  __int16 v20 = storageLogHandle();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v45 = v16;
                    id v21 = v20;
                    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
                    uint64_t v23 = "This file should have been removed. Why is it still here??? - %@";
                    goto LABEL_28;
                  }
LABEL_30:

                  continue;
                }
                ++v34;
                __int16 v20 = storageLogHandle();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_30;
                }
                *(_DWORD *)buf = 138412290;
                uint64_t v45 = v16;
                id v21 = v20;
                os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
                uint64_t v23 = "Verified that %@ no longer exists.";
LABEL_28:
                uint32_t v24 = 12;
              }
              else
              {
                if ([v12 code] == 4) {
                  continue;
                }
                __int16 v20 = storageLogHandle();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_30;
                }
                *(_DWORD *)buf = 138412546;
                uint64_t v45 = v16;
                __int16 v46 = 2112;
                uint64_t v47 = (uint64_t)v12;
                id v21 = v20;
                os_log_type_t v22 = OS_LOG_TYPE_ERROR;
                uint64_t v23 = "Unable to remove file at %@. (%@)";
                uint32_t v24 = 22;
              }
              _os_log_impl(&dword_209DBA000, v21, v22, v23, buf, v24);
              goto LABEL_30;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v50 count:16];
        }
        while (v11);
LABEL_35:

        if (v34 < [v9 count])
        {
          long long v25 = storageLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = *(void *)(a1 + 32);
            uint64_t v27 = [v9 count];
            *(_DWORD *)buf = v28;
            uint64_t v45 = v26;
            __int16 v46 = 2048;
            uint64_t v47 = v27;
            __int16 v48 = 2048;
            unint64_t v49 = v34;
            _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_INFO, "Case %@ has %ld attachments but only %ld were removed.", buf, 0x20u);
          }
        }
        uint64_t v3 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v32);
  }
}

- (void)_autoBugCaptureDiskUsageSize:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = v4;
  if (self->_lastCalculatedDiskUsageSize)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__DiagnosticStorageManager__autoBugCaptureDiskUsageSize___block_invoke;
    v6[3] = &unk_263FC46D0;
    v6[4] = self;
    id v7 = v4;
    [(DiagnosticStorageManager *)self _inspectAutoBugCaptureDiskUsage:v6];
  }
}

void __57__DiagnosticStorageManager__autoBugCaptureDiskUsageSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        id v9 = [v8 objectForKeyedSubscript:@"SymptomsAttachmentsTotalSize"];
        uint64_t v10 = [v9 unsignedIntegerValue];
        uint64_t v11 = [v8 objectForKeyedSubscript:@"SymptomsDiagExtAttachmentsTotalSize"];
        v5 += v10 + [v11 unsignedIntegerValue];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v12 = storageLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v5;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "The total ABC disk usage size is %lu", buf, 0xCu);
  }

  *(void *)(*(void *)(a1 + 32) + 8) = v5;
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(a1 + 32) + 8));
  }
}

- (void)_sortedAutoBugCaptureDiskUsageByCase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))v4;
  casesSortedByDate = self->_casesSortedByDate;
  if (casesSortedByDate)
  {
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = self->_casesSortedByDate;
  self->_casesSortedByDate = v7;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke;
  v9[3] = &unk_263FC3FD8;
  v9[4] = self;
  [(DiagnosticStorageManager *)self _inspectAutoBugCaptureDiskUsage:v9];
  if (v5)
  {
    casesSortedByDate = self->_casesSortedByDate;
LABEL_6:
    ((void (**)(void, NSMutableArray *))v5)[2](v5, casesSortedByDate);
  }
LABEL_7:
}

void __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 length])
        {
          id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
          uint64_t v10 = [v3 objectForKeyedSubscript:v8];
          uint64_t v11 = [v9 initWithDictionary:v10];

          [v11 setObject:v8 forKeyedSubscript:@"caseID"];
          [*(id *)(*(void *)(a1 + 32) + 16) addObject:v11];
        }
        else
        {
          uint64_t v11 = storageLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v12 = 0;
            _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "A blank caseID from _gatherAutoBugCaptureDiskUsageStatistics()", v12, 2u);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) sortUsingComparator:&__block_literal_global_16];
}

uint64_t __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"caseDate"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"caseDate"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_inspectAutoBugCaptureDiskUsage:(id)a3
{
  v79[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_payloadsByCaseID)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
    goto LABEL_40;
  }
  uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  payloadsByCaseID = self->_payloadsByCaseID;
  self->_payloadsByCaseID = v6;

  id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = (void *)MEMORY[0x21050CEB0]();
  v54 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-3600.0];
  uint64_t v10 = (void *)[objc_alloc(NSURL) initFileURLWithPath:self->_logArchivePath isDirectory:1];
  uint64_t v11 = *MEMORY[0x263EFF610];
  uint64_t v56 = *MEMORY[0x263EFF6A8];
  v79[0] = *MEMORY[0x263EFF6A8];
  v79[1] = v11;
  uint64_t v58 = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  id v73 = 0;
  v53 = v8;
  long long v13 = [v8 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:v12 options:1 error:&v73];
  id v14 = v73;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (!v15) {
    goto LABEL_39;
  }
  uint64_t v16 = v15;
  __int16 v46 = v9;
  uint64_t v47 = self;
  __int16 v48 = v5;
  id v17 = 0;
  id v18 = 0;
  uint64_t v57 = *(void *)v70;
  uint64_t v52 = *MEMORY[0x263F07F70];
  uint64_t v51 = *MEMORY[0x263F08438];
  uint64_t v19 = v49;
  do
  {
    uint64_t v20 = 0;
    do
    {
      id v21 = v18;
      uint64_t v22 = v17;
      if (*(void *)v70 != v57) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(id *)(*((void *)&v69 + 1) + 8 * v20);

      uint64_t v23 = (void *)MEMORY[0x21050CEB0]();
      id v68 = 0;
      int v24 = [v18 getResourceValue:&v68 forKey:v58 error:0];
      id v17 = v68;

      if (!v24 || [v17 compare:v54] != 1)
      {
        id v67 = 0;
        int v26 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v67, v56, 0, v46, v47, v48);
        uint64_t v27 = v67;
        long long v25 = v27;
        if (v26 && [v27 BOOLValue])
        {
          long long v28 = storageLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v18;
            _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_DEFAULT, "Found an errant directory (%@) in AutoBugCapture which will be deleted", buf, 0xCu);
          }

          id v66 = v14;
          char v29 = [v53 removeItemAtURL:v18 error:&v66];
          id v30 = v66;

          if (v29) {
            goto LABEL_29;
          }
          uint64_t v31 = storageLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v75 = v18;
            __int16 v76 = 2112;
            id v77 = v30;
            _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_ERROR, "Unable to remove directory at %@ (%@)", buf, 0x16u);
          }

          uint64_t v32 = [v30 domain];
          if ([v32 isEqualToString:v52] && objc_msgSend(v30, "code") == 513)
          {

            goto LABEL_35;
          }
          long long v36 = [v30 domain];
          if ([v36 isEqualToString:v51])
          {
            uint64_t v37 = [v30 code];

            BOOL v38 = v37 == 13;
            uint64_t v19 = v49;
            if (!v38) {
              goto LABEL_29;
            }
LABEL_35:
            uint64_t v32 = [v18 path];
            [v50 addObject:v32];
          }
          else
          {
          }
        }
        else
        {
          uint64_t v32 = [v18 path];
          uint64_t v33 = [v32 rangeOfString:@"/private"];
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v35 = [v32 substringFromIndex:v33 + v34];

            uint64_t v32 = (void *)v35;
          }
          if ([v32 length]) {
            [v19 addObject:v32];
          }
          id v30 = v14;
        }

LABEL_29:
        id v14 = v30;
        goto LABEL_30;
      }
      long long v25 = storageLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v75 = v18;
        __int16 v76 = 2112;
        id v77 = v17;
        _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_INFO, "This item (%@) will NOT be deleted because it's too young (%@)", buf, 0x16u);
      }
LABEL_30:

      ++v20;
    }
    while (v16 != v20);
    uint64_t v39 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    uint64_t v16 = v39;
  }
  while (v39);

  self = v47;
  uint64_t v5 = v48;
  id v9 = v46;
LABEL_39:

  queue = self->_queue;
  storeController = self->_storeController;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __60__DiagnosticStorageManager__inspectAutoBugCaptureDiskUsage___block_invoke;
  v59[3] = &unk_263FC46F8;
  id v60 = v53;
  id v61 = v49;
  v62 = self;
  id v63 = v14;
  id v64 = v50;
  id v65 = v5;
  id v42 = v50;
  id v43 = v14;
  id v44 = v49;
  id v45 = v53;
  [(ABCPersistentStoreController *)storeController caseAttachmentsForAllDiagnosticCasesWithQueue:queue reply:v59];

LABEL_40:
}

void __60__DiagnosticStorageManager__inspectAutoBugCaptureDiskUsage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = a2;
  context = (void *)MEMORY[0x21050CEB0]();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v3;
  uint64_t v71 = a1;
  uint64_t v61 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v84 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        uint64_t v6 = (void *)MEMORY[0x21050CEB0]();
        uint64_t v7 = [v5 objectForKeyedSubscript:@"caseID"];
        uint64_t v8 = [v5 objectForKeyedSubscript:@"caseAttachments"];
        id v9 = +[DiagnosticCase attachmentsFromStringRepresentation:v8];
        if ([v9 count])
        {
          id v60 = v5;
          id v63 = v8;
          id v64 = v7;
          id v65 = v6;
          uint64_t v66 = i;
          id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v62 = v9;
          id v69 = v9;
          uint64_t v10 = [v69 countByEnumeratingWithState:&v79 objects:v92 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = *(void *)v80;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v80 != v13) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v15 = *(void *)(*((void *)&v79 + 1) + 8 * j);
                uint64_t v16 = (void *)MEMORY[0x21050CEB0]();
                id v17 = (void *)[objc_alloc(NSURL) initWithString:v15];
                id v18 = [v17 path];
                uint64_t v19 = [v18 rangeOfString:@"/private"];
                if (v19 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v21 = [v18 substringFromIndex:v19 + v20];

                  id v18 = (void *)v21;
                  a1 = v71;
                }
                uint64_t v22 = *(void **)(a1 + 32);
                id v78 = 0;
                uint64_t v23 = [v22 attributesOfItemAtPath:v18 error:&v78];
                id v24 = v78;
                long long v25 = v24;
                if (v23)
                {
                  v12 += [v23 fileSize];
                }
                else if (v24)
                {
                  int v26 = storageLogHandle();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v89 = (uint64_t)v18;
                    __int16 v90 = 2112;
                    v91 = v25;
                    _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEBUG, "Unable to inspect attributes of file at %@. (%@)", buf, 0x16u);
                  }

                  a1 = v71;
                }
                [v72 addObject:v18];
                if ([*(id *)(a1 + 40) containsObject:v18]) {
                  [*(id *)(a1 + 40) removeObject:v18];
                }
              }
              uint64_t v11 = [v69 countByEnumeratingWithState:&v79 objects:v92 count:16];
            }
            while (v11);
          }
          else
          {
            uint64_t v12 = 0;
          }

          uint64_t i = v66;
          uint64_t v7 = v64;
          id v9 = v62;
          if ([v72 count])
          {
            uint64_t v27 = [v60 objectForKeyedSubscript:@"caseClosedTime"];
            if (v64)
            {
              id v28 = objc_alloc(MEMORY[0x263EFF9A0]);
              char v29 = [NSNumber numberWithUnsignedInteger:v12];
              id v30 = objc_msgSend(v28, "initWithObjectsAndKeys:", v72, @"SymptomsAttachments", v29, @"SymptomsAttachmentsTotalSize", v27, @"caseDate", 0, context);
              [*(id *)(*(void *)(a1 + 48) + 24) setObject:v30 forKeyedSubscript:v64];
            }
          }

          uint64_t v6 = v65;
          uint64_t v8 = v63;
        }
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v83 objects:v93 count:16];
    }
    while (v61);
  }

  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v32 = *(id *)(a1 + 40);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v75;
    uint64_t v68 = *MEMORY[0x263F07F70];
    uint64_t v67 = *MEMORY[0x263F08438];
    do
    {
      uint64_t v36 = 0;
      id v70 = (id)v34;
      do
      {
        if (*(void *)v75 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v74 + 1) + 8 * v36);
        BOOL v38 = (void *)MEMORY[0x21050CEB0]();
        uint64_t v39 = storageLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v37;
          _os_log_impl(&dword_209DBA000, v39, OS_LOG_TYPE_DEBUG, "Will remove orphaned file at %@", buf, 0xCu);
        }

        long long v40 = *(void **)(v71 + 32);
        id v73 = 0;
        int v41 = [v40 removeItemAtPath:v37 error:&v73];
        id v42 = v73;
        id v43 = v42;
        if (v41)
        {
          id v44 = storageLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v89 = (uint64_t)v37;
            _os_log_impl(&dword_209DBA000, v44, OS_LOG_TYPE_DEFAULT, "Removed orphaned file at %@", buf, 0xCu);
          }
        }
        else
        {
          if ([v42 code] == 4) {
            goto LABEL_55;
          }
          uint64_t v45 = v35;
          id v46 = v32;
          uint64_t v47 = storageLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v89 = (uint64_t)v37;
            __int16 v90 = 2112;
            v91 = v43;
            _os_log_impl(&dword_209DBA000, v47, OS_LOG_TYPE_ERROR, "Unable to remove orphaned file at %@. (%@)", buf, 0x16u);
          }

          __int16 v48 = [*(id *)(v71 + 56) domain];
          if ([v48 isEqualToString:v68]
            && [*(id *)(v71 + 56) code] == 513)
          {

            uint64_t v35 = v45;
            uint64_t v34 = (uint64_t)v70;
LABEL_53:
            [v31 addObject:v37];
            goto LABEL_55;
          }
          id v49 = [*(id *)(v71 + 56) domain];
          if ([v49 isEqualToString:v67])
          {
            id v50 = v31;
            uint64_t v51 = [*(id *)(v71 + 56) code];

            BOOL v52 = v51 == 13;
            id v31 = v50;
            id v32 = v46;
            uint64_t v35 = v45;
            uint64_t v34 = (uint64_t)v70;
            if (v52) {
              goto LABEL_53;
            }
          }
          else
          {

            uint64_t v35 = v45;
            uint64_t v34 = (uint64_t)v70;
          }
        }
LABEL_55:

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v74 objects:v87 count:16];
    }
    while (v34);
  }

  [v31 addObjectsFromArray:*(void *)(v71 + 64)];
  if ([v31 count])
  {
    v53 = storageLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v54 = [v31 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v89 = v54;
      _os_log_impl(&dword_209DBA000, v53, OS_LOG_TYPE_DEBUG, "Will use netdiagnose to clean up %lu orphans and folders", buf, 0xCu);
    }

    v55 = [[ABCFileCleaner alloc] initWithQueue:0];
    [*(id *)(v71 + 48) setAbcCleaner:v55];

    objc_msgSend(*(id *)(*(void *)(v71 + 48) + 56), "setDelegate:");
    [*(id *)(*(void *)(v71 + 48) + 56) cleanupFiles:v31];
  }

  uint64_t v56 = *(void *)(v71 + 72);
  if (v56) {
    (*(void (**)(uint64_t, void))(v56 + 16))(v56, *(void *)(*(void *)(v71 + 48) + 24));
  }
}

- (void)fileCleanupComplete
{
  id v3 = storageLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "File cleanup using netdiagnose completed", v4, 2u);
  }

  [(DiagnosticStorageManager *)self setAbcCleaner:0];
}

- (void)didSaveDiagnosticCases
{
  unint64_t v3 = [(DiagnosticStorageManager *)self allowableDiskUsageSize];

  [(DiagnosticStorageManager *)self performPurgeToMeetDiskUsageLimit:v3 calculateOnly:0];
}

- (void)purgeAttachmentsAtPaths:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__DiagnosticStorageManager_purgeAttachmentsAtPaths___block_invoke;
  v7[3] = &unk_263FC3430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__DiagnosticStorageManager_purgeAttachmentsAtPaths___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAttachmentsAtPaths:*(void *)(a1 + 40)];
}

- (ABCFileCleaner)abcCleaner
{
  return self->_abcCleaner;
}

- (void)setAbcCleaner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abcCleaner, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_payloadsByCaseID, 0);

  objc_storeStrong((id *)&self->_casesSortedByDate, 0);
}

@end