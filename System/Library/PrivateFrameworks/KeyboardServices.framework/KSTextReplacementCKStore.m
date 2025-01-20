@interface KSTextReplacementCKStore
@end

@implementation KSTextReplacementCKStore

void __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v3 = +[_KSUtilities userDefaultsSuiteName];
  v4 = (void *)[v2 initWithSuiteName:v3];

  if (([v4 BOOLForKey:@"KSSampleShortcutWasImported_CK"] & 1) == 0)
  {
    v5 = +[_KSTextReplacementHelper sampleShortcut];
    v6 = *(void **)(a1 + 32);
    v10[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke_2;
    v8[3] = &unk_264890D40;
    id v9 = v4;
    [v6 addEntries:v7 removeEntries:0 withCompletionHandler:v8];
  }
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[_KSTextReplacementCKStore queryCloudIfFirstPullOrAccountChanged:]_block_invoke_2";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  >>> Finished pulling remote entries for the first fetch", (uint8_t *)&v3, 0xCu);
  }

  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), &__block_literal_global_2);
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained coreDataStore];
  int v5 = [v4 didMakeInitialPull];

  if ((queryCloudIfFirstPullOrAccountChanged__pendingSync & 1) == 0 && !v5 || *(unsigned char *)(a1 + 48))
  {
    queryCloudIfFirstPullOrAccountChanged__pendingSync = 1;
    id v6 = objc_loadWeakRetained(v2);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_2;
    v7[3] = &unk_264890830;
    v7[4] = *(void *)(a1 + 32);
    [v6 requestSync:4 withCompletionBlock:v7];
  }
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_60()
{
  queryCloudIfFirstPullOrAccountChanged__pendingSync = 0;
}

void __63___KSTextReplacementCKStore_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F08A98] predicateWithFormat:@"wasDeleted == %@ || wasDeleted == nil", MEMORY[0x263EFFA80]];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) coreDataStore];
  uint64_t v3 = [v2 queryEntriesWithPredicate:v6 limit:10000];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46___KSTextReplacementCKStore_accountDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[_KSTextReplacementCKStore accountDidChange:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_DEFAULT, "%s  >>> User has logged out of the account, removing local entries", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) removeAllEntries];
    id v3 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v4 = +[_KSUtilities userDefaultsSuiteName];
    int v5 = (void *)[v3 initWithSuiteName:v4];

    [v5 setBool:0 forKey:@"kDidMigrateToUUIDRecordName"];
    [v5 setBool:0 forKey:@"KSSampleShortcutWasImported_CK"];
    [v5 setBool:0 forKey:@"KSDidMigrateToCloudKitOnCloud"];
    [*(id *)(a1 + 32) importSampleShortcutsIfNecessary];
    [*(id *)(a1 + 32) setCkMigrationStatusOnCloud:0];
  }
  else if (*(void *)(a1 + 40) == 1)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 queryCloudIfFirstPullOrAccountChanged:0];
  }
}

uint64_t __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBool:1 forKey:@"KSSampleShortcutWasImported_CK"];
}

void __45___KSTextReplacementCKStore_pushAllLocalData__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = KSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[_KSTextReplacementCKStore pushAllLocalData]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_INFO, "%s  marked all local entries to be saved to cloud", (uint8_t *)&v1, 0xCu);
  }
}

void __76___KSTextReplacementCKStore_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coreDataStore];
  char v3 = [v2 markDeletesForTextReplacementEntries:*(void *)(a1 + 40)];

  uint64_t v4 = [*(id *)(a1 + 32) coreDataStore];
  char v5 = [v4 recordTextReplacementEntries:*(void *)(a1 + 48)];

  if (v3)
  {
    id v6 = 0;
    if ((v5 & 1) == 0)
    {
LABEL_3:
      id v7 = *(id *)(a1 + 48);
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = *(id *)(a1 + 40);
    if ((v5 & 1) == 0) {
      goto LABEL_3;
    }
  }
  id v7 = 0;
LABEL_6:
  id v10 = v7;
  v8 = +[_KSTextReplacementHelper errorWithCode:-2 failedAdds:v7 failedDeletes:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"_KSTRCKStoreDidReceiveChangesNotification" object:0];
}

void __45___KSTextReplacementCKStore_removeAllEntries__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coreDataStore];
  char v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"TRUEPREDICATE"];
  [v2 deleteTextReplacementsWithPredicate:v3];

  id v4 = [*(id *)(a1 + 32) coreDataStore];
  [v4 saveCKFetchToken:0];
}

uint64_t __67___KSTextReplacementCKStore_removeAllEntriesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coreDataStore];
  char v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"TRUEPREDICATE"];
  [v2 deleteTextReplacementsWithPredicate:v3];

  id v4 = [*(id *)(a1 + 32) coreDataStore];
  [v4 saveCKFetchToken:0];

  char v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

void __51___KSTextReplacementCKStore_textReplacementEntries__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) coreDataStore];
  uint64_t v2 = [v5 queryEntriesWithPredicate:*(void *)(a1 + 40) limit:10000];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __73___KSTextReplacementCKStore_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  void v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F08730];
  uint64_t v3 = *(void *)(a1 + 40);
  v10[0] = *(void *)(a1 + 32);
  v10[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  id v5 = [v2 andPredicateWithSubpredicates:v4];

  id v6 = [*(id *)(a1 + 48) coreDataStore];
  uint64_t v7 = [v6 queryEntriesWithPredicate:v5 limit:10000];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __56___KSTextReplacementCKStore_pushMigrationStatusToCloud___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if ([a3 count])
  {
    id v5 = [v6 userInfo];
    NSLog(&cfstr_ErrorFailedToW.isa, v5);
  }
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateSyncCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) success:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) countLocalEntriesToBeSynced])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 56);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_3;
    v8[3] = &unk_2648911A0;
    void v8[4] = v2;
    long long v7 = *(_OWORD *)(a1 + 40);
    id v4 = (id)v7;
    long long v9 = v7;
    [v2 _requestSync:v3 completionBlock:v8];
  }
  else
  {
    id v5 = KSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  Nothing to sync", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateSyncCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) success:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_93(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateSyncCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) success:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x230F44DF0]();
  BOOL v3 = *(void *)(a1 + 48) != 0;
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_2;
  v5[3] = &unk_264891218;
  v5[4] = v4;
  BOOL v7 = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 pullRemoteDataWithPriority:v3 completionHandler:v5];
}

void __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_3;
  v5[3] = &unk_2648911F0;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  [v4 pushLocalChangesWithPriority:v3 completionHandler:v5];
}

uint64_t __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      a2 = a2;
    }
    else {
      a2 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x230F44DF0]();
  uint64_t v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  pushing local changes", (uint8_t *)&buf, 0xCu);
  }

  v16 = [*(id *)(a1 + 32) queryUpdatedLocalEntries];
  v15 = [*(id *)(a1 + 32) queryDeletedEntries];
  if ([v16 count] || objc_msgSend(v15, "count", context))
  {
    v18 = [[ArraySlicer alloc] initWithArray:v16 sliceSize:400];
    v17 = [[ArraySlicer alloc] initWithArray:v15 sliceSize:400];
    uint64_t v3 = dispatch_group_create();
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    uint64_t v4 = [(ArraySlicer *)v18 nextSlice];
    uint64_t v5 = [(ArraySlicer *)v17 nextSlice];
    while (v4 | v5)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__0;
      v34 = __Block_byref_object_dispose__0;
      id v35 = (id)os_transaction_create();
      dispatch_group_enter(v3);
      id v6 = [*(id *)(a1 + 32) cloudKitManager];
      uint64_t v7 = *(void *)(a1 + 48);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_96;
      v22[3] = &unk_264891240;
      id v8 = (id)v4;
      id v23 = v8;
      id v9 = (id)v5;
      uint64_t v10 = *(void *)(a1 + 32);
      id v24 = v9;
      uint64_t v25 = v10;
      v27 = v29;
      v26 = v3;
      p_long long buf = &buf;
      [v6 updateRecords:v8 deleteRecordIDs:v9 withPriority:v7 completionHandler:v22];

      _Block_object_dispose(&buf, 8);
      uint64_t v4 = [(ArraySlicer *)v18 nextSlice];

      uint64_t v5 = [(ArraySlicer *)v17 nextSlice];
    }
    v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_3;
    block[3] = &unk_264891268;
    id v20 = *(id *)(a1 + 40);
    v21 = v29;
    dispatch_group_notify(v3, v11, block);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    uint64_t v12 = KSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v12, OS_LOG_TYPE_INFO, "%s  no entries to push", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
    }
  }
}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_96(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x230F44DF0]();
  uint64_t v10 = (void *)v9;
  if (a2)
  {
    v46 = (void *)v9;
    id v47 = v8;
    v11 = [MEMORY[0x263EFF9C0] set];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v49 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v62 + 1) + 8 * i) recordID];
          v18 = [v17 recordName];
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v14);
    }
    unsigned int v48 = a2;

    v19 = [MEMORY[0x263EFF980] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v50 = a1;
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          v26 = [v25 recordID];
          v27 = [v26 recordName];
          char v28 = [v11 containsObject:v27];

          if ((v28 & 1) == 0) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v22);
    }

    v29 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v30 = *(id *)(v50 + 40);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          uint64_t v36 = [v35 recordName];
          char v37 = [v11 containsObject:v36];

          if ((v37 & 1) == 0)
          {
            v38 = [v35 recordName];
            [v29 addObject:v38];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v32);
    }

    a1 = v50;
    v39 = [*(id *)(v50 + 48) localEntriesFromCloudEntries:v19];
    uint64_t v40 = *(void *)(v50 + 48);
    v41 = *(NSObject **)(v40 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_2;
    block[3] = &unk_264890CC8;
    void block[4] = v40;
    id v52 = v39;
    id v53 = v29;
    id v42 = v29;
    id v43 = v39;
    dispatch_async(v41, block);
    a2 = v48;
    *(unsigned char *)(*(void *)(*(void *)(v50 + 64) + 8) + 24) = v48;

    id v7 = v49;
    uint64_t v10 = v46;
    id v8 = v47;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
  v45 = *(void **)(v44 + 40);
  *(void *)(v44 + 40) = 0;

  +[_KSTextReplacementHelper logAggdValueForSyncIsPull:0 success:a2];
}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coreDataStore];
  [v2 recordTextReplacementEntries:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) coreDataStore];
  [v3 deleteTextReplacementsFromLocalStoreWithNames:*(void *)(a1 + 48) excludeSavesToCloud:0];
}

uint64_t __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke_3";
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  completed uploading local changes", (uint8_t *)&v3, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumPullRequests:", objc_msgSend(*(id *)(a1 + 32), "numPullRequests") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) coreDataStore];
  int v3 = [v2 getCKFetchToken];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2;
  v8[3] = &unk_264890C50;
  id v6 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  void v8[4] = v4;
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  Pulling remote data", buf, 0xCu);
  }

  int v3 = (void *)MEMORY[0x230F44DF0]();
  uint64_t v4 = [*(id *)(a1 + 32) cloudKitManager];
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_99;
  v7[3] = &unk_2648912E0;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 fetchRecordsWithPriority:v5 changeToken:v6 completionHandler:v7];
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_99(uint64_t a1, void *a2, void *a3, void *a4, char a5, char a6, char a7)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v27 = a2;
  id v26 = a3;
  id v13 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__0;
  v40[4] = __Block_byref_object_dispose__0;
  id v41 = (id)os_transaction_create();
  uint64_t v14 = (void *)[v27 copy];
  uint64_t v15 = (void *)[v26 copy];
  v16 = [*(id *)(a1 + 32) localEntriesFromCloudEntries:v14];
  v17 = KSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v43 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
    __int16 v44 = 2112;
    v45 = v16;
    __int16 v46 = 2112;
    id v47 = v15;
    _os_log_impl(&dword_22B2BC000, v17, OS_LOG_TYPE_INFO, "%s  >>> storing pulled records locally; added entries: %@, deleted: %@",
      buf,
      0x20u);
  }

  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(NSObject **)(v18 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_101;
  block[3] = &unk_2648912B8;
  id v29 = v16;
  uint64_t v30 = v18;
  id v31 = v15;
  id v32 = v13;
  char v37 = a6;
  char v38 = a5;
  uint64_t v21 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 48);
  id v33 = v14;
  uint64_t v36 = v20;
  char v39 = a7;
  id v34 = v21;
  id v35 = v40;
  id v22 = v14;
  id v23 = v13;
  id v24 = v15;
  id v25 = v16;
  dispatch_async(v19, block);

  _Block_object_dispose(v40, 8);
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_101(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 40) coreDataStore];
    [v2 recordTextReplacementEntries:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 48) count])
  {
    int v3 = [*(id *)(a1 + 40) coreDataStore];
    [v3 deleteTextReplacementsFromLocalStoreWithNames:*(void *)(a1 + 48) excludeSavesToCloud:1];
  }
  uint64_t v4 = [*(id *)(a1 + 40) coreDataStore];
  [v4 saveCKFetchToken:*(void *)(a1 + 56)];

  if ([*(id *)(a1 + 64) count] || objc_msgSend(*(id *)(a1 + 48), "count")) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_104);
  }
  uint64_t v5 = KSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v17 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  completed saving pulled records", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v6 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_105;
  v11[3] = &unk_264891290;
  __int16 v14 = *(_WORD *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 88);
  v11[4] = v6;
  uint64_t v13 = v8;
  id v12 = *(id *)(a1 + 72);
  char v15 = *(unsigned char *)(a1 + 98);
  dispatch_async(v7, v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2_102()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"_KSTRCKStoreDidReceiveChangesNotification" object:0];
}

uint64_t __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_105(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(result + 56))
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 57))
    {
      uint64_t v2 = KSCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v4 = 136315138;
        uint64_t v5 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
        _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  morecoming from cloudkit, pulling again", (uint8_t *)&v4, 0xCu);
      }

      return [*(id *)(v1 + 32) pullRemoteDataWithPriority:*(void *)(v1 + 48) completionHandler:*(void *)(v1 + 40)];
    }
    else
    {
      +[_KSTextReplacementHelper logAggdValueForSyncIsPull:1 success:*(unsigned __int8 *)(result + 58)];
      uint64_t result = *(void *)(v1 + 40);
      if (result)
      {
        int v3 = *(uint64_t (**)(void))(result + 16);
        return v3();
      }
    }
  }
  return result;
}

void __45___KSTextReplacementCKStore_recordSyncStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) countLocalEntriesToBeSynced];
  uint64_t v2 = NSString;
  uint64_t v5 = +[_KSTextReplacementHelper aggdPrefix];
  id v6 = (id)v5;
  if (v1) {
    int v3 = @"%@.failedSyncDailyStatus";
  }
  else {
    int v3 = @"%@.successfulSyncDailyStatus";
  }
  int v4 = objc_msgSend(v2, "stringWithFormat:", v3, v5);
  +[_KSAggdLogger addValue:1 forScalarKey:v4];
}

void __53___KSTextReplacementCKStore_queryUpdatedLocalEntries__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) coreDataStore];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"needsSaveToCloud == TRUE AND (wasDeleted == %@ || wasDeleted == nil)", MEMORY[0x263EFFA80]];
  uint64_t v3 = [v6 queryEntriesWithPredicate:v2 limit:10000];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __48___KSTextReplacementCKStore_queryDeletedEntries__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) coreDataStore];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"wasDeleted == TRUE"];
  uint64_t v3 = [v6 queryEntriesWithPredicate:v2 limit:10000];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end