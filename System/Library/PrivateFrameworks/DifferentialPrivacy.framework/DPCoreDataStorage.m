@interface DPCoreDataStorage
@end

@implementation DPCoreDataStorage

void __71___DPCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleDataProtectionChangeFor:v5 willBeAvailable:a3];
}

void __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContexts];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  v4 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke_2;
  v8[3] = &unk_1E6C440A0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  [v7 performWithOptions:4 andBlock:v8];
}

uint64_t __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reset];
  v2 = [*(id *)(a1 + 40) managedObjectContexts];
  [v2 removeObjectForKey:*(void *)(a1 + 48)];

  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 invalidatePersistentStoreCoordinatorFor:v4];
}

void __62___DPCoreDataStorage_invalidatePersistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinators];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = objc_msgSend(v3, "persistentStores", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removePersistentStore:*(void *)(*((void *)&v10 + 1) + 8 * v8++) error:0];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    id v9 = [*(id *)(a1 + 32) persistentStoreCoordinators];
    [v9 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) persistentStoreCoordinators];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(v2 + 8)];
  uint64_t v5 = *(void *)(*(void *)(v2 + 16) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(*(void *)(v2 + 16) + 8) + 40);
  if (*(unsigned char *)(v2 + 32))
  {
    if (v7) {
      return;
    }
    uint64_t v8 = objc_opt_class();
    id v9 = [*(id *)v2 databaseDirectory];
    id v51 = 0;
    LOBYTE(v8) = [(id)v8 createDatabaseDirectory:v9 error:&v51];
    id v10 = v51;

    if ((v8 & 1) == 0 && [v10 code] != 516)
    {
      v29 = +[_DPLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_5((id *)v2, (uint64_t)v10, v29);
      }

      uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v11 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = 0;
      goto LABEL_44;
    }
    long long v11 = [*(id *)v2 managedObjectModel];
    if (!v11)
    {
      v28 = +[_DPLog framework];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_1((id *)v2, v28);
      }

      v18 = +[_DPCoreAnalyticsCollector sharedInstance];
      v52 = @"nilMOM";
      v53[0] = MEMORY[0x1E4F1CC38];
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      [v18 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.CoreData" withMetrics:v19];
      goto LABEL_43;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [*(id *)(a1 + 32) paths];
    v17 = [v16 objectForKeyedSubscript:*(void *)(a1 + 40)];
    v18 = [v15 fileURLWithPath:v17];

    v19 = objc_msgSend((id)objc_opt_class(), "persistentStoreOptionsFor:readOnly:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "readOnly"));
    v20 = (void *)[v19 mutableCopy];
    [v20 removeObjectForKey:*MEMORY[0x1E4F1BE50]];
    v21 = (void *)[v20 copy];
    v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v23 = *MEMORY[0x1E4F1BF70];
    id v50 = v10;
    v24 = [v22 addPersistentStoreWithType:v23 configuration:0 URL:v18 options:v21 error:&v50];
    id v25 = v50;

    if (v24)
    {
      id v10 = v25;
LABEL_40:
      uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v44)
      {
        v45 = [*(id *)(a1 + 32) persistentStoreCoordinators];
        [v45 setObject:v44 forKeyedSubscript:*(void *)(a1 + 40)];
      }
LABEL_43:

LABEL_44:
      return;
    }
    v31 = [v25 domain];
    if ([v31 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      if ([v25 code] == 134020)
      {

LABEL_21:
        uint64_t v32 = [v19 mutableCopy];
        [(id)v32 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BEC8]];
        v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v49 = 0;
        v46 = (void *)v32;
        LOBYTE(v32) = [v33 destroyPersistentStoreAtURL:v18 withType:v23 options:v32 error:&v49];
        id v25 = v49;
        if (v32) {
          goto LABEL_25;
        }
        v34 = +[_DPLog framework];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_4();
        }

        [v46 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BF18]];
        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) destroyPersistentStoreAtURL:v18 withType:v23 options:v46 error:0])
        {
LABEL_25:
          v35 = +[_DPLog framework];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DC55E000, v35, OS_LOG_TYPE_DEFAULT, "Deleted persistent store with old schema.", buf, 2u);
          }

          v36 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          id v47 = v25;
          v24 = [v36 addPersistentStoreWithType:v23 configuration:0 URL:v18 options:v19 error:&v47];
          id v10 = v47;

          if (v24) {
            goto LABEL_40;
          }
          goto LABEL_37;
        }
        v40 = +[_DPLog framework];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_3();
        }

        v31 = v46;
        goto LABEL_35;
      }
      if ([v25 code] > 134099)
      {
        uint64_t v37 = [v25 code];
        v38 = v31;
        uint64_t v39 = v37;

        if (v39 >= 134171) {
          goto LABEL_36;
        }
        goto LABEL_21;
      }
    }
LABEL_35:

LABEL_36:
    id v10 = v25;
LABEL_37:
    v41 = +[_DPLog framework];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) handleDatabaseErrors:v10 forPSC:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) protectionClass:*(void *)(a1 + 40)];
    uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
    v43 = *(void **)(v42 + 40);
    *(void *)(v42 + 40) = 0;

    v24 = 0;
    goto LABEL_40;
  }
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = 0;
  }
}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContexts];
  uint64_t v3 = a1 + 40;
  uint64_t v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    if (v7) {
      return;
    }
    uint64_t v8 = [*(id *)(a1 + 32) persistentStoreCoordinatorFor:*(void *)(a1 + 40)];
    if (v8)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPersistentStoreCoordinator:v8];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setMergePolicy:*MEMORY[0x1E4F1BE40]];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUndoManager:0];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v13 = [*(id *)(a1 + 32) managedObjectContexts];
      [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else
    {
      v22 = +[_DPLog daemon];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_2(v3, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else
  {
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
    uint64_t v8 = +[_DPLog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_1(a1 + 40, v8, v16, v17, v18, v19, v20, v21);
    }
  }
}

void __105___DPCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit___block_invoke(uint64_t a1)
{
  id v7 = (id)objc_opt_new();
  uint64_t v2 = [MEMORY[0x1E4F1C0A8] entityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  [v7 setEntity:v2];

  [v7 setFetchLimit:*(void *)(a1 + 72)];
  [v7 setIncludesSubentities:0];
  [v7 setIncludesPendingChanges:0];
  [v7 setFetchOffset:*(void *)(a1 + 80)];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v7, "setPredicate:");
  }
  uint64_t v3 = *(void **)(a1 + 56);
  if (v3 && [v3 count]) {
    [v7 setSortDescriptors:*(void *)(a1 + 56)];
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  [v4 setResultType:2];
  uint64_t v5 = [*(id *)(a1 + 40) executeRequest:v4 error:0];
  uint64_t v6 = [v5 result];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v6 unsignedIntegerValue];

  [*(id *)(a1 + 40) reset];
}

void __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];
  [v2 setIncludesSubentities:0];
  [v2 setIncludesPendingChanges:0];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v2, "setPredicate:");
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) countForFetchRequest:v2 error:0];
}

uint64_t __50___DPCoreDataStorage_deleteStorageFor_obliterate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateManagedObjectContextFor:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) deleteDatabaseForPSC:*(void *)(a1 + 48) protectionClass:*(void *)(a1 + 40) obliterate:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 modelURL];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed to load Managed Object Model from %@", v4, 0xCu);
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Failed to add persistent store: %@", v2, v3, v4, v5, v6);
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Failed to delete persistent store with old schema: %@", v2, v3, v4, v5, v6);
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Failed to delete persistent store with old schema, retrying with unlink: %@", v2, v3, v4, v5, v6);
}

void __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke_cold_5(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 databaseDirectory];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "%@ : did not exist and could not be created: %@", v6, 0x16u);
}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "NSManagedObjectContext not available for protectionClass=%@", a5, a6, a7, a8, 2u);
}

void __44___DPCoreDataStorage_mocForProtectionClass___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "NSPersistentStoreCoordinator is nil for protectionClass=%@", a5, a6, a7, a8, 2u);
}

void __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Caught %@", v2, v3, v4, v5, v6);
}

@end