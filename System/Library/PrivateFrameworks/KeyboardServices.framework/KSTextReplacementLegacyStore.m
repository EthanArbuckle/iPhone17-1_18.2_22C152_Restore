@interface KSTextReplacementLegacyStore
@end

@implementation KSTextReplacementLegacyStore

void __49___KSTextReplacementLegacyStore_initWithBaseURL___block_invoke(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.keyboardServices.legacyStore.workQueue", v2);
  v4 = (void *)initWithBaseURL__cdWorkQueueShared;
  initWithBaseURL__cdWorkQueueShared = (uint64_t)v3;

  id v5 = objc_alloc(MEMORY[0x263EFF298]);
  v6 = [*(id *)(a1 + 32) managedObjectModelURL];
  id v9 = (id)[v5 initWithContentsOfURL:v6];

  uint64_t v7 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v9];
  v8 = (void *)initWithBaseURL__pscShared;
  initWithBaseURL__pscShared = v7;
}

void __55___KSTextReplacementLegacyStore_minimumUptimeRemaining__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) persistentStoreDidLoadTime];
  [v3 timeIntervalSinceReferenceDate];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 180.0 - fabs(v2);
}

void __40___KSTextReplacementLegacyStore_cleanup__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40___KSTextReplacementLegacyStore_cleanup__block_invoke_2;
  v6[3] = &unk_2648906A8;
  id v3 = v2;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  [*(id *)(a1 + 32) endMinimumUptime];
  [*(id *)(a1 + 32) unloadPersistentStore];
  v4 = [*(id *)(a1 + 32) persistentStore];

  if (!v4)
  {
    id v5 = KSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[_KSTextReplacementLegacyStore cleanup]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  Invalidaitng bird connection", buf, 0xCu);
    }

    softLinkBRDaemonConnectionInvalidate();
  }
}

void __40___KSTextReplacementLegacyStore_cleanup__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    double v2 = *(void **)(a1 + 32);
    id v3 = 0;
    [v2 save:&v3];
  }
}

uint64_t __63___KSTextReplacementLegacyStore_loadPersistentStoreIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanup];
}

uint64_t __53___KSTextReplacementLegacyStore_requestMinimumUptime__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endMinimumUptime];
}

uint64_t __65___KSTextReplacementLegacyStore_importSampleShortcutsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  >>> finished importing sample shortcut", (uint8_t *)&v7, 0xCu);
  }

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [v3 managedObjectContext];
  [v3 detectAndCleanDuplicatesWithContext:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPendingSampleShortcutImport:0];

  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:@"kDidInsertSampleShortcutForPeer"];
}

intptr_t __52___KSTextReplacementLegacyStore_prepareForMigration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadPersistentStoreIfNecessary];
  [*(id *)(a1 + 32) runMaintenanceIncludeLocalVariations:1];
  double v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

void __80___KSTextReplacementLegacyStore_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  double v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = [WeakRetained managedObjectContext];

  if (v4)
  {
    location = v2;
    id v5 = objc_loadWeakRetained(v2);
    [v5 loadPersistentStoreIfNecessary];

    uint64_t v32 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263EFF980] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[_KSTextReplacementHelper transactionFromTextReplacementEntry:forDelete:](_KSTextReplacementHelper, "transactionFromTextReplacementEntry:forDelete:", *(void *)(*((void *)&v37 + 1) + 8 * i), 0, location);
          v13 = *(void **)(a1 + 48);
          v14 = [v12 valueToInsert];
          [v13 insertEntryWithValue:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v9);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          v21 = +[_KSTextReplacementHelper transactionFromTextReplacementEntry:forDelete:](_KSTextReplacementHelper, "transactionFromTextReplacementEntry:forDelete:", v20, 1, location);
          v22 = [*(id *)(a1 + 48) _deleteTransaction:v21];
          if (v22)
          {
            v23 = +[_KSTextReplacementHelper errorWithCode:-2 forEntry:v20];
            [v6 addObject:v23];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v17);
    }

    id v24 = objc_loadWeakRetained(location);
    [v24 setShouldUpdateTheCache:1];

    id v25 = objc_loadWeakRetained(location);
    LOBYTE(v24) = [v25 save];

    if (v24)
    {
      v26 = (void *)v32;
      v27 = +[_KSTextReplacementHelper multipleAddErrors:v32 removeErrors:v6];
    }
    else
    {
      v27 = +[_KSTextReplacementHelper errorWithCode:-2 failedAdds:*(void *)(a1 + 32) failedDeletes:*(void *)(a1 + 40)];
      v29 = KSCategory();
      v26 = (void *)v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[_KSTextReplacementLegacyStore addEntries:removeEntries:withCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_22B2BC000, v29, OS_LOG_TYPE_INFO, "%s  Failed to save to coredata store", buf, 0xCu);
      }
    }
  }
  else
  {
    v28 = KSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[_KSTextReplacementLegacyStore addEntries:removeEntries:withCompletionHandler:]_block_invoke";
      __int16 v45 = 1024;
      int v46 = -2;
      _os_log_impl(&dword_22B2BC000, v28, OS_LOG_TYPE_INFO, "%s  Replying with error = %i", buf, 0x12u);
    }

    v27 = +[_KSTextReplacementHelper errorWithCode:-2 failedAdds:*(void *)(a1 + 32) failedDeletes:*(void *)(a1 + 40)];
  }
  v30 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", location);
  [v30 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __65___KSTextReplacementLegacyStore_requestSync_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((*(void *)(a1 + 48) | 4) == 4)
  {
    double v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "-[_KSTextReplacementLegacyStore requestSync:withCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  sync request due to maintainence / client, loading ubiquity", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(a1 + 32) loadPersistentStoreIfNecessary];
    if (*(void *)(a1 + 48) == 4)
    {
      [*(id *)(a1 + 32) runLegacyMigration];
      [*(id *)(a1 + 32) runMaintenanceIncludeLocalVariations:0];
      [*(id *)(a1 + 32) setShouldUpdateTheCache:1];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadPersistentStoreIfNecessary];
  double v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"TRUEPREDICATE"];
  id v4 = (id)[v2 removeEntriesWithPredicate:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke_2;
  v7[3] = &unk_2648906A8;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
  [*(id *)(a1 + 32) setShouldUpdateTheCache:1];
}

uint64_t __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v13 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = a1 + 48;
  uint64_t v9 = *(void **)(v7 - 8);
  uint64_t v10 = *(void *)(v8 + 8);
  obuint64_t j = *(id *)(v10 + 40);
  [v9 save:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v7 + 8) + 40))
  {
    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke_cold_1(v7, v11);
    }
  }
}

void __55___KSTextReplacementLegacyStore_textReplacementEntries__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:1 selector:sel_compare_];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v2 entriesUsingSortDescriptors:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __67___KSTextReplacementLegacyStore_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77___KSTextReplacementLegacyStore_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) ubiquityStoreLoaded] & 1) != 0
    || ([*(id *)(a1 + 32) shouldUpdateTheCache] & 1) != 0)
  {
    goto LABEL_8;
  }
  id v2 = [*(id *)(a1 + 40) predicateFormat];
  if (([v2 isEqualToString:@"TRUEPREDICATE"] & 1) == 0) {
    goto LABEL_7;
  }
  char v3 = [*(id *)(a1 + 32) shouldDisableCaching];

  if (v3)
  {
LABEL_8:
    [*(id *)(a1 + 32) loadPersistentStoreIfNecessary];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [*(id *)(a1 + 32) entriesMatchingPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48)];
    id v2 = [v7 textReplacementEntriesFromManagedObjects:v8];

    uint64_t v9 = KSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v14 = "-[_KSTextReplacementLegacyStore queryTextReplacementsWithPredicate:callback:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  read entries from ubiquity store", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) shouldUpdateTheCache]) {
      [*(id *)(a1 + 32) scheduleCacheUpdate:v2];
    }
    goto LABEL_12;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v12 = 0;
  id v2 = [v4 entriesFromCache:&v12];
  id v5 = v12;
  if (v5)
  {
    uint64_t v6 = v5;
    [*(id *)(a1 + 32) setShouldUpdateTheCache:1];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = KSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    *(_DWORD *)buf = 136315394;
    long long v14 = "-[_KSTextReplacementLegacyStore queryTextReplacementsWithPredicate:callback:]_block_invoke";
    __int16 v15 = 2112;
    long long v16 = v11;
    _os_log_impl(&dword_22B2BC000, v10, OS_LOG_TYPE_INFO, "%s  read entries from cache: \n %@", buf, 0x16u);
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __53___KSTextReplacementLegacyStore_scheduleCacheUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) writeEntriesToCache:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(a1 + 32) setShouldUpdateTheCache:0];
    [*(id *)(a1 + 32) setDidScheduleCacheUpdate:0];
    [*(id *)(a1 + 32) save];
    char v3 = *(void **)(a1 + 32);
    return [v3 unloadPersistentStore];
  }
  return result;
}

void __56___KSTextReplacementLegacyStore_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v13 = "-[_KSTextReplacementLegacyStore iCloudAccountDidChange:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  received icloud account change notif", buf, 0xCu);
  }

  char v3 = (void *)CFPreferencesCopyAppValue(@"UserDictionaryUbiquityIdentityTokenCurrent", @"com.apple.Preferences");
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v4 ubiquityIdentityToken];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v13 = "-[_KSTextReplacementLegacyStore iCloudAccountDidChange:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, "%s  detected account change, invalidating cache", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [*(id *)(a1 + 32) cacheFilePath];
    id v11 = 0;
    [v8 removeItemAtPath:v9 error:&v11];
    id v10 = v11;
  }
}

void __54___KSTextReplacementLegacyStore_insertEntryWithValue___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"UserDictionaryEntry" inManagedObjectContext:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) phrase];
  [v7 setValue:v2 forKey:@"phrase"];

  char v3 = [*(id *)(a1 + 40) shortcut];
  [v7 setValue:v3 forKey:@"shortcut"];

  uint64_t v4 = NSNumber;
  id v5 = [*(id *)(a1 + 40) timestamp];
  [v5 timeIntervalSinceReferenceDate];
  BOOL v6 = objc_msgSend(v4, "numberWithDouble:");

  [v7 setValue:v6 forKey:@"timestamp"];
}

void __37___KSTextReplacementLegacyStore_save__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    id v2 = *(void **)(a1 + 32);
    id v6 = 0;
    char v3 = [v2 save:&v6];
    id v4 = v6;
    id v5 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [*(id *)(a1 + 32) reset];
    }
    else
    {
      NSLog(&cfstr_ErrorWritingTo.isa, v4);
      [*(id *)(a1 + 32) rollback];
    }
  }
}

void __74___KSTextReplacementLegacyStore_entriesMatchingPredicate_sortDescriptors___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF260]);
  char v3 = [*(id *)(a1 + 32) entityDescription];
  id v4 = [v3 name];
  id v5 = (void *)[v2 initWithEntityName:v4];

  [v5 setFetchLimit:10000];
  [v5 setFetchBatchSize:1000];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v5, "setPredicate:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v5, "setSortDescriptors:");
  }
  id v6 = *(void **)(a1 + 56);
  id v11 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

void __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) persistentStore];

  if (v2)
  {
    NSLog(&cfstr_PersistentStor.isa);
    char v3 = [*(id *)(a1 + 40) userInfo];
    id v4 = [v3 objectForKey:*MEMORY[0x263EFF018]];

    if ([v4 count])
    {
      objc_msgSend(*(id *)(a1 + 32), "setImportedSinceMaintenance:", objc_msgSend(*(id *)(a1 + 32), "importedSinceMaintenance") + objc_msgSend(v4, "count"));
      id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "importedSinceMaintenance"));
      CFPreferencesSetAppValue(@"UserDictionaryImportedSinceMaintenance", v5, @"com.apple.Preferences");

      CFPreferencesAppSynchronize(@"com.apple.Preferences");
    }
    id v6 = [*(id *)(a1 + 32) managedObjectContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke_2;
    v15[3] = &unk_2648906A8;
    id v7 = v6;
    id v16 = v7;
    [v7 performBlockAndWait:v15];
    [*(id *)(a1 + 32) performMaintenanceIfNecessary];
    [*(id *)(a1 + 32) setShouldUpdateTheCache:1];
    id v8 = KSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = NSNumber;
      id v10 = [*(id *)(a1 + 32) ubiquityStoreLoadStartTime];
      [v10 timeIntervalSinceNow];
      id v12 = [v9 numberWithDouble:-v11];
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[_KSTextReplacementLegacyStore persistentStoreDidImportUbiquitousContentChanges:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_22B2BC000, v8, OS_LOG_TYPE_INFO, "%s  time to import changes since PS load request: %@", buf, 0x16u);
    }
    long long v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];

    uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"_KSTRLegacyStoreDidImportUbiquitousChanges" object:0];
  }
}

uint64_t __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v5 = [v4 objectForKey:@"shortcut"];
        uint64_t v6 = [v4 objectForKey:@"phrase"];
        id v7 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_3;
        v14[3] = &unk_2648917D8;
        objc_copyWeak(&v20, (id *)(a1 + 64));
        id v8 = v5;
        id v15 = v8;
        id v9 = v6;
        id v16 = v9;
        id v17 = *(id *)(a1 + 32);
        id v10 = *(id *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 56);
        id v18 = v10;
        uint64_t v19 = v11;
        [v7 performBlockAndWait:v14];

        objc_destroyWeak(&v20);
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v2);
  }
}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v4 = [WeakRetained _shouldMergeShortcut:*(void *)(a1 + 32) phrase:*(void *)(a1 + 40) intoContext:*(void *)(a1 + 48)];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 _mergeShortcut:*(void *)(a1 + 32) phrase:*(void *)(a1 + 40) fromContext:*(void *)(a1 + 56)];

    if (v6) {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
  }
}

uint64_t __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    obuint64_t j = *(id *)(v3 + 40);
    char v4 = [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  else
  {
    char v4 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return [*(id *)(a1 + 32) reset];
  }
  NSLog(&cfstr_ErrorSavingAft.isa, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  return [*(id *)(a1 + 32) rollback];
}

uint64_t __90___KSTextReplacementLegacyStore_mergeEntriesForUbiquityIdentityChangeFromURL_firstDelete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rollback];
}

uint64_t __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __69___KSTextReplacementLegacyStore_detectAndCleanDuplicatesWithContext___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v18 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v8 = [v18 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v18);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKey:@"count"];
        uint64_t v14 = [v13 integerValue];

        if (v14 >= 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          id v15 = [v12 objectForKey:@"shortcut"];
          id v16 = [v12 objectForKey:@"phrase"];
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          [WeakRetained _deleteDuplicatesOfShortcut:v15 phrase:v16 count:v14 withContext:*(void *)(a1 + 32)];

          ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        }
      }
      uint64_t v9 = [v18 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  NSLog(&cfstr_DeduplicationC.isa, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
}

void __55___KSTextReplacementLegacyStore_basePersistentStoreURL__block_invoke()
{
  v0 = NSURL;
  id v4 = +[_KSUtilities keyboardDirectory];
  v1 = [v4 stringByAppendingPathComponent:@"CloudUserDictionary.sqlite"];
  uint64_t v2 = [v0 fileURLWithPath:v1];
  uint64_t v3 = (void *)basePersistentStoreURL_baseURL;
  basePersistentStoreURL_baseURL = v2;
}

void __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresWillChange:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  Suspending user dictionary due to impending account change.", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke_371;
  v6[3] = &unk_2648906A8;
  id v7 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v6];
  uint64_t v5 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v5);
}

uint64_t __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke_371(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void __75___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresDidChange___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setForceMaintenance:1];
  uint64_t v2 = [*(id *)(a1 + 32) persistentStore];
  uint64_t v3 = [v2 URL];
  id v4 = [v3 absoluteString];

  uint64_t v5 = [*(id *)(a1 + 32) persistentStore];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 runMaintenanceIncludeLocalVariations:0];
  }
  else {
    [v6 loadPersistentStoreIfNecessary];
  }
  id v7 = KSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, "%s  >>> current legacy store: %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];

  uint64_t v9 = KSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [*(id *)(a1 + 32) ubiquityStoreLoadStartTime];
    [v11 timeIntervalSinceNow];
    uint64_t v13 = [v10 numberWithDouble:-v12];
    int v14 = 136315394;
    id v15 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  time since PS load request: %@", (uint8_t *)&v14, 0x16u);
  }
}

void __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 136315394;
  id v4 = "-[_KSTextReplacementLegacyStore removeEntriesWithPredicate:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_22B2BC000, a2, OS_LOG_TYPE_ERROR, "%s  ERROR!!! Failed to remove entrtries with error: %@", (uint8_t *)&v3, 0x16u);
}

@end