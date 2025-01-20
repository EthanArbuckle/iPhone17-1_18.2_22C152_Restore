@interface KSTextReplacementCoreDataStore
@end

@implementation KSTextReplacementCoreDataStore

void __67___KSTextReplacementCoreDataStore_queryEntriesWithPredicate_limit___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(a1 + 40);
        v8 = +[_KSTextReplacementCoreDataStore localCloudEntryFromMocObject:](_KSTextReplacementCoreDataStore, "localCloudEntryFromMocObject:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke(uint64_t a1)
{
  id v2 = +[_KSDeviceStateMonitor deviceStateMonitor];
  char v3 = [v2 isDataAvailableForClassC];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[4];
  if (v3)
  {
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    }
    else
    {
      id v14 = [v4 persistentStoreCoordinator];
      long long v10 = [*(id *)(a1 + 32) persistentStore];

      if (v10)
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPersistentStoreCoordinator:v14];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMergePolicy:*MEMORY[0x263EFF060]];
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
  }
  else
  {
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
      uint64_t v6 = *(void *)(a1 + 40);
      v7 = *(void **)(*(void *)(v6 + 8) + 40);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke_2;
      v15[3] = &unk_264891460;
      v15[4] = v6;
      [v7 performBlockAndWait:v15];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[6];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
    uint64_t v4 = +[_KSDeviceStateMonitor deviceStateMonitor];
    char v5 = [v4 isDataAvailableForClassC];

    if (v5) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    v7 = [v2 managedObjectModel];
    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }

LABEL_7:
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) persistentStores];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v13 = [*(id *)(a1 + 32) directoryPath];
    id v14 = [v13 stringByAppendingPathComponent:@"TextReplacements.db"];

    +[_KSUtilities createFileIfDoesNotExist:v14];
    v15 = [NSURL fileURLWithPath:v14 isDirectory:0];
    v16 = NSDictionary;
    v17 = [NSNumber numberWithBool:1];
    uint64_t v18 = *MEMORY[0x263EFF070];
    v19 = [NSNumber numberWithBool:1];
    v20 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, v18, v19, *MEMORY[0x263EFF008], 0);

    v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v22 = *MEMORY[0x263EFF168];
    id v57 = 0;
    id v23 = [v21 addPersistentStoreWithType:v22 configuration:0 URL:v15 options:v20 error:&v57];
    id v24 = v57;
    id v25 = v24;
    if (!v23)
    {
      id v23 = [v24 domain];
      if (v23 == (id)*MEMORY[0x263EFF150])
      {
        uint64_t v26 = [v25 code];

        if (v26 != 11) {
          goto LABEL_11;
        }
        v27 = KSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke_cold_1();
        }

        v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v56 = v25;
        int v29 = [v28 destroyPersistentStoreAtURL:v15 withType:v22 options:0 error:&v56];
        id v30 = v56;

        if (!v29)
        {
          id v25 = v30;
          goto LABEL_11;
        }
        v46 = v20;
        v47 = v15;
        v48 = v14;
        v31 = [MEMORY[0x263F08850] defaultManager];
        v32 = [*(id *)(a1 + 32) directoryPath];
        id v55 = v30;
        v33 = [v31 contentsOfDirectoryAtPath:v32 error:&v55];
        id v25 = v55;

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v23 = v33;
        uint64_t v34 = [v23 countByEnumeratingWithState:&v51 objects:v58 count:16];
        uint64_t v45 = v22;
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v52;
          do
          {
            uint64_t v37 = 0;
            v38 = v25;
            do
            {
              if (*(void *)v52 != v36) {
                objc_enumerationMutation(v23);
              }
              uint64_t v39 = *(void *)(*((void *)&v51 + 1) + 8 * v37);
              v40 = [MEMORY[0x263F08850] defaultManager];
              v41 = [*(id *)(a1 + 32) directoryPath];
              v42 = [v41 stringByAppendingPathComponent:v39];
              id v50 = v38;
              [v40 removeItemAtPath:v42 error:&v50];
              id v25 = v50;

              ++v37;
              v38 = v25;
            }
            while (v35 != v37);
            uint64_t v35 = [v23 countByEnumeratingWithState:&v51 objects:v58 count:16];
          }
          while (v35);
        }

        id v14 = v48;
        +[_KSUtilities createFileIfDoesNotExist:v48];
        v15 = [NSURL fileURLWithPath:v48 isDirectory:0];

        v43 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v49 = 0;
        v20 = v46;
        id v44 = (id)[v43 addPersistentStoreWithType:v45 configuration:0 URL:v15 options:v46 error:&v49];
      }
    }

LABEL_11:
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke(uint64_t a1)
{
  v20[6] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  char v3 = (void *)MEMORY[0x263EFF240];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v5 = [WeakRetained managedObjectContext];
  uint64_t v6 = [v3 entityForName:@"TRCloudKitSyncState" inManagedObjectContext:v5];
  [v2 setEntity:v6];

  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = [v7 managedObjectContext];
  v20[0] = 0;
  uint64_t v9 = [v8 executeFetchRequest:v2 error:v20];
  id v10 = v20[0];
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v14 = (void *)MEMORY[0x263EFF240];
    id v15 = objc_loadWeakRetained((id *)(a1 + 48));
    v16 = [v15 managedObjectContext];
    uint64_t v17 = [v14 insertNewObjectForEntityForName:@"TRCloudKitSyncState" inManagedObjectContext:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFetchChangeToken:*(void *)(a1 + 32)];
  }
}

void __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  char v3 = (void *)MEMORY[0x263EFF240];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v5 = [WeakRetained managedObjectContext];
  uint64_t v6 = [v3 entityForName:@"TextReplacementEntry" inManagedObjectContext:v5];
  [v2 setEntity:v6];

  id v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v16[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v2 setSortDescriptors:v8];

  [v2 setPredicate:*(void *)(a1 + 32)];
  [v2 setFetchLimit:*(void *)(a1 + 56)];
  [v2 setFetchBatchSize:500];
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = [v9 managedObjectContext];
  v15[0] = 0;
  uint64_t v11 = [v10 executeFetchRequest:v2 error:v15];
  id v12 = v15[0];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;
}

void __53___KSTextReplacementCoreDataStore_didMakeInitialPull__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) syncStateEntryShouldSave:0 fetchToken:0];
  id v2 = [v3 fetchChangeToken];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void __42___KSTextReplacementCoreDataStore_cleanup__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = 0;
    [v2 save:&v4];
    id v3 = v4;
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) reset];
}

uint64_t __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v3 + 40);
    [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v4 = KSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke_cold_1(a1 + 40);
      }
    }
  }
  return [*(id *)(a1 + 32) reset];
}

void __77___KSTextReplacementCoreDataStore_fetchAndMergeTextReplacementEntry_context___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained fetchTextReplacementEntry:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];

  uint64_t v4 = [v3 count];
  if (!v4)
  {
    uint64_t v32 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"TextReplacementEntry" inManagedObjectContext:*(void *)(a1 + 40)];
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    v21 = [*(id *)(a1 + 32) cloudID];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUniqueName:v21];
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v3 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (v5 != 1)
  {
    for (uint64_t i = 1; i != v5; ++i)
    {
      id v10 = [v3 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 uniqueName];
      id v12 = [*(id *)(a1 + 32) cloudID];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        id v15 = *(void **)(v14 + 40);
        id v16 = v10;
        uint64_t v17 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v16;
        id v18 = v15;

        [v18 setWasDeleted:1];
      }
      [v10 setWasDeleted:1];
    }
  }
  if (([*(id *)(a1 + 32) needsSaveToCloud] & 1) == 0
    && ([*(id *)(a1 + 32) wasDeleted] & 1) == 0)
  {
    v19 = [*(id *)(a1 + 32) cloudID];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUniqueName:v19];
  }
  uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
  if (!v20) {
    goto LABEL_19;
  }
  v21 = (void *)v20;
  uint64_t v22 = [*(id *)(a1 + 32) timestamp];
  if (!v22) {
    goto LABEL_18;
  }
  id v23 = (void *)v22;
  char v24 = [*(id *)(a1 + 32) wasDeleted];

  if (v24)
  {
LABEL_19:
    BOOL v35 = 1;
    goto LABEL_20;
  }
  id v25 = [*(id *)(a1 + 32) timestamp];
  uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
  [v25 timeIntervalSinceDate:v26];
  double v28 = v27;

  if ([*(id *)(a1 + 32) needsSaveToCloud] && v28 < 2.0)
  {
    int v29 = KSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [*(id *)(a1 + 32) cloudID];
      v31 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uniqueName];
      int v51 = 136315650;
      long long v52 = "-[_KSTextReplacementCoreDataStore fetchAndMergeTextReplacementEntry:context:]_block_invoke";
      __int16 v53 = 2112;
      long long v54 = v30;
      __int16 v55 = 2112;
      id v56 = v31;
      _os_log_impl(&dword_22B2BC000, v29, OS_LOG_TYPE_INFO, "%s  not saving as the entry is older than or same as existing record, entryToSaveID: %@, existing record: %@", (uint8_t *)&v51, 0x20u);
    }
    goto LABEL_35;
  }
  BOOL v35 = v28 > 2.0;
LABEL_20:
  uint64_t v36 = [*(id *)(a1 + 32) phrase];

  if (!v36) {
    [*(id *)(a1 + 32) setPhrase:&stru_26DE8B7B0];
  }
  uint64_t v37 = [*(id *)(a1 + 32) shortcut];
  if (!v37
    || (v38 = (void *)v37,
        [*(id *)(a1 + 32) shortcut],
        uint64_t v39 = objc_claimAutoreleasedReturnValue(),
        int v40 = [v39 isEqualToString:&stru_26DE8B7B0],
        v39,
        v38,
        v40))
  {
    v41 = [*(id *)(a1 + 32) phrase];
    [*(id *)(a1 + 32) setShortcut:v41];
  }
  v42 = [*(id *)(a1 + 32) timestamp];

  if (!v42)
  {
    v43 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 32) setTimestamp:v43];
  }
  id v44 = [*(id *)(a1 + 32) shortcut];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setShortcut:v44];

  uint64_t v45 = [*(id *)(a1 + 32) phrase];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPhrase:v45];

  v46 = [*(id *)(a1 + 32) timestamp];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTimestamp:v46];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setNeedsSaveToCloud:", objc_msgSend(*(id *)(a1 + 32), "needsSaveToCloud"));
  if (([*(id *)(a1 + 32) needsSaveToCloud] & 1) != 0
    || (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) wasDeleted] ^ 1 | v35) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setWasDeleted:", objc_msgSend(*(id *)(a1 + 32), "wasDeleted"));
  }
  else
  {
    v47 = KSCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      int v51 = 136315138;
      long long v52 = "-[_KSTextReplacementCoreDataStore fetchAndMergeTextReplacementEntry:context:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v47, OS_LOG_TYPE_INFO, "%s  not clearing the deleted flag", (uint8_t *)&v51, 0xCu);
    }
  }
  v48 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uniqueName];
  uint64_t v49 = [*(id *)(a1 + 32) cloudID];
  int v50 = [v48 isEqualToString:v49];

  if (v50)
  {
    int v29 = [*(id *)(a1 + 32) cloudData];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRemoteRecordInfo:v29];
LABEL_35:
  }
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke(uint64_t a1)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)MEMORY[0x263EFF240];
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained managedObjectContext];
  uint64_t v7 = [v3 entityForName:@"TextReplacementEntry" inManagedObjectContext:v6];
  [v2 setEntity:v7];

  [v2 setIncludesSubentities:0];
  [v2 setIncludesPendingChanges:1];
  [v2 setIncludesPropertyValues:0];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (needsSaveToCloud == TRUE AND wasDeleted == FALSE)"];
    id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"uniqueName == %@", *(void *)(a1 + 32)];
    id v10 = (void *)MEMORY[0x263F08730];
    v21[0] = v9;
    v21[1] = v8;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    id v12 = [v10 andPredicateWithSubpredicates:v11];
    [v2 setPredicate:v12];
  }
  else
  {
    int v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"uniqueName == %@", *(void *)(a1 + 32)];
    [v2 setPredicate:v13];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v2];
  [v14 setResultType:2];
  id v15 = objc_loadWeakRetained(v4);
  id v16 = [v15 managedObjectContext];
  id v20 = 0;
  uint64_t v17 = [v16 executeRequest:v14 error:&v20];
  id v18 = v20;

  if (v18)
  {
    v19 = KSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_cold_1(v18);
    }
  }
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained managedObjectContext];
  [v1 reset];
}

void __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)MEMORY[0x263EFF240];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = [WeakRetained managedObjectContext];
  uint64_t v8 = [v3 entityForName:v4 inManagedObjectContext:v7];
  [v2 setEntity:v8];

  [v2 setIncludesSubentities:1];
  [v2 setIncludesPendingChanges:1];
  [v2 setIncludesPropertyValues:0];
  [v2 setFetchOffset:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "setPredicate:");
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v2];
  [v9 setResultType:2];
  id v10 = objc_loadWeakRetained(v5);
  uint64_t v11 = [v10 managedObjectContext];
  id v17 = 0;
  id v12 = (id)[v11 executeRequest:v9 error:&v17];
  id v13 = v17;

  if (v13)
  {
    uint64_t v14 = KSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke_cold_1(v13);
    }
  }
  id v15 = objc_loadWeakRetained(v5);
  id v16 = [v15 managedObjectContext];
  [v16 reset];
}

void __67___KSTextReplacementCoreDataStore_textReplacementEntriesWithLimit___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)MEMORY[0x263EFF240];
  uint64_t v4 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v5 = [v3 entityForName:@"TextReplacementEntry" inManagedObjectContext:v4];
  [v2 setEntity:v5];

  [v2 setFetchLimit:*(void *)(a1 + 56)];
  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v24[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [v2 setSortDescriptors:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = [WeakRetained managedObjectContext];
  id v22 = 0;
  id v10 = [v9 executeFetchRequest:v2 error:&v22];
  id v11 = v22;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(a1 + 40);
        id v17 = +[_KSTextReplacementCoreDataStore localCloudEntryFromMocObject:*(void *)(*((void *)&v18 + 1) + 8 * v15)];
        [v16 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

void __61___KSTextReplacementCoreDataStore_countEntriesWithPredicate___block_invoke(uint64_t a1)
{
  v11[4] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF260]);
  uint64_t v3 = (void *)MEMORY[0x263EFF240];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [WeakRetained managedObjectContext];
  uint64_t v6 = [v3 entityForName:@"TextReplacementEntry" inManagedObjectContext:v5];
  [v2 setEntity:v6];

  [v2 setPredicate:*(void *)(a1 + 32)];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = [v7 managedObjectContext];
  v11[0] = 0;
  uint64_t v9 = [v8 countForFetchRequest:v2 error:v11];
  id v10 = v11[0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

void __50___KSTextReplacementCoreDataStore_getCKFetchToken__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) syncStateEntryShouldSave:0 fetchToken:0];
  uint64_t v2 = [v5 fetchChangeToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_ERROR, "%s  ERROR! Could not access coredata store, %@", (uint8_t *)v1, 0x16u);
}

void __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) userInfo];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  >>> !!!ERROR: failed to save records with error: %@", v4, v5, v6, v7, 2u);
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_cold_1(void *a1)
{
  v1 = [a1 userInfo];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  ERROR! Failed to delete: %@", v4, v5, v6, v7, 2u);
}

void __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke_cold_1(void *a1)
{
  v1 = [a1 userInfo];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  ERROR! Failed to delete: %@", v4, v5, v6, v7, 2u);
}

void __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315650;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, (uint64_t)a3);
  _os_log_error_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_ERROR, "%s  Querying records failed with error : %@, exception %@", v4, 0x20u);
}

void __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315650;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, (uint64_t)a3);
  _os_log_error_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_ERROR, "%s  Querying records failed with error : %@, exception %@", v4, 0x20u);
}

@end