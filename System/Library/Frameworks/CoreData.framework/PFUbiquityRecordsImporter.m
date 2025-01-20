@interface PFUbiquityRecordsImporter
@end

@implementation PFUbiquityRecordsImporter

id __84___PFUbiquityRecordsImporter_createSortedOperationsArrayWithMetadata_isFirstImport___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(*(void *)(a1 + 32) + 72));
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

void __56___PFUbiquityRecordsImporter_schedulePendingLogs_error___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "metadata"), "mutableCopy");
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupCheckForFork"];
  [*(id *)(*(void *)(a1 + 32) + 72) setMetadata:v3];
  v2 = objc_alloc_init(NSSaveChangesRequest);
  [*(id *)(*(void *)(a1 + 32) + 72) executeRequest:v2 withContext:0 error:0];
}

void __56___PFUbiquityRecordsImporter_schedulePendingLogs_error___block_invoke_2(uint64_t a1)
{
  id v3 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "metadata"), "mutableCopy");
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupDoFork"];
  [*(id *)(*(void *)(a1 + 32) + 72) setMetadata:v3];
  v2 = objc_alloc_init(NSSaveChangesRequest);
  [*(id *)(*(void *)(a1 + 32) + 72) executeRequest:v2 withContext:0 error:0];
}

uint64_t __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5 && *(unsigned char *)(v5 + 88))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v7 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v3);
            }
            v10 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(*((void *)&v14 + 1) + 8 * i));
            [v6 addObject:v10];
          }
          uint64_t v7 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
      global_queue = dispatch_get_global_queue(0, 0);
      +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v6, global_queue, (uint64_t)&__block_literal_global_168);
    }
    else
    {
      id v6 = 0;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Initiated download for urls: %@", "-[_PFUbiquityRecordsImporter batchDownloadTransactionLogsAtLocations:error:]", 854, v6);
    }

    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Started download for logs: %@", "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]_block_invoke_2", 780, v3);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 80);
    if (v13) {
      uint64_t v13 = *(void *)(v13 + 16);
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error while starting download for logs: %@\nLogs: %@", "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]_block_invoke_2", 782, 0, v13);
  }

  return [v2 drain];
}

void __76___PFUbiquityRecordsImporter_batchDownloadTransactionLogsAtLocations_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Librian returned a serious error for starting downloads %@ with userInfo %@", "-[_PFUbiquityRecordsImporter batchDownloadTransactionLogsAtLocations:error:]_block_invoke", 844, a2, [a2 userInfo]);
    }
  }
}

uint64_t __93___PFUbiquityRecordsImporter_postImportNotificationForStoreName_andLocalPeerID_withUserInfo___block_invoke(uint64_t a1)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Posting import notification: %@\nFor coordinator: %p\n", "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]_block_invoke", 964, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 postNotification:v3];
}

void __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Restart timer fired for importer: %@", "-[_PFUbiquityRecordsImporter scheduleRecoveryTimer]_block_invoke", 1125, v2);
    }
    [*((id *)v2 + 1) cancelAllOperations];
    [*((id *)v2 + 1) setSuspended:0];
    -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)v2, 0, 0);
    dispatch_source_cancel(*((dispatch_source_t *)v2 + 12));
    id WeakRetained = v2;
    *((void *)v2 + 12) = 0;
  }
}

void __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke_2(uint64_t a1)
{
}

void __58___PFUbiquityRecordsImporter_requestBaselineRollForStore___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 104);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 lock];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    uint64_t v5 = 0;
LABEL_25:
    long long v16 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)(v4 + 128))
  {
    uint64_t v5 = [(PFUbiquityBaselineOperation *)[PFUbiquityBaselineRollOperation alloc] initWithPersistentStore:*(void *)(a1 + 40) localPeerID:*(void *)(*(void *)(a1 + 32) + 32) andUbiquityRootLocation:*(void *)(*(void *)(a1 + 32) + 40)];
    [(PFUbiquityBaselineRollOperation *)v5 setDelegate:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = (void *)[v7 operations];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
LABEL_10:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        if ([v12 isEqual:v5])
        {
          if (([v12 isExecuting] & 1) == 0) {
            break;
          }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            goto LABEL_10;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        long long v14 = *(void **)(v13 + 8);
      }
      else {
        long long v14 = 0;
      }
      [v14 addOperation:v5];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (!v15) {
    goto LABEL_25;
  }
  long long v16 = *(void **)(v15 + 104);
LABEL_22:
  [v16 unlock];
}

void __68___PFUbiquityRecordsImporter_metadataInconsistencyDetectedForStore___block_invoke(uint64_t a1)
{
  id v9 = 0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
  self;
  uint64_t v2 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(*(void *)(a1 + 40) + 48), *(void *)(*(void *)(a1 + 40) + 32));
  uint64_t v3 = [[PFUbiquityStoreMetadataMedic alloc] initWithStore:*(void *)(a1 + 32) localPeerID:*(void *)(*(void *)(a1 + 40) + 32) andUbiquityRootLocation:*(void *)(*(void *)(a1 + 40) + 40)];
  if (-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v3->super.isa, &v9))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recovered metadata for store: %@", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1399, *(void *)(a1 + 40), *(void *)(a1 + 32));
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError during metadata recovery for store: %@\nError: %@\nUser Info: %@", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1401, *(void *)(a1 + 40), *(void *)(a1 + 32), v9, [v9 userInfo]);
  }
  if (v2 && (uint64_t v4 = v2[11]) != 0)
  {
    uint64_t v5 = *(void *)(v4 + 88);
    if (v5)
    {
      char v6 = 0;
      uint64_t v7 = *(void *)(v5 + 56);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v7 = 0;
  char v6 = 1;
LABEL_10:
  if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v7, 0))
  {
    if (v6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = *(void *)(v5 + 56);
    }
    if (-[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](v8, &v9))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recached transaction history", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1410, *(void *)(a1 + 40));
      }
      if (-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:](*(uint64_t **)(a1 + 40), 0, &v9))
      {
        [*(id *)(*(void *)(a1 + 40) + 8) setSuspended:0];
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError scheduling root scan after metadata recovery: %@", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1424, *(void *)(a1 + 40), v9);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to recache transaction history: %@\nUser Info: %@", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1412, *(void *)(a1 + 40), v9, [v9 userInfo]);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to drop the transaction history cache: %@", "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1415, *(void *)(a1 + 40), v9);
  }
}

uint64_t __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

uint64_t __54___PFUbiquityRecordsImporter_executeBlockOnRootQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

uint64_t __65___PFUbiquityRecordsImporter_afterDelay_executeBlockOnRootQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

@end