@interface DKCoreDataStorage
@end

@implementation DKCoreDataStorage

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v3 = [MEMORY[0x1E4F1C0A8] entityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setFetchLimit:*(void *)(a1 + 80)];
  [v2 setIncludesSubentities:*(unsigned __int8 *)(a1 + 96)];
  [v2 setIncludesPendingChanges:*(unsigned __int8 *)(a1 + 97)];
  [v2 setFetchOffset:*(void *)(a1 + 88)];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v2, "setPredicate:");
  }
  v4 = *(void **)(a1 + 56);
  if (v4 && [v4 count]) {
    [v2 setSortDescriptors:*(void *)(a1 + 56)];
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v2];
  [v5 setResultType:2];
  uint64_t v6 = a1 + 64;
  v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  v9 = [v7 executeRequest:v5 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = [v9 result];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v10 integerValue];

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_4();
    }
    v11 = [*(id *)(*(void *)(*(void *)v6 + 8) + 40) domain];
    if (![v11 isEqualToString:*MEMORY[0x1E4F281F8]]) {
      goto LABEL_19;
    }
    BOOL v12 = [*(id *)(*(void *)(*(void *)v6 + 8) + 40) code] == 256;

    if (v12)
    {
      v13 = [*(id *)(*(void *)(*(void *)v6 + 8) + 40) userInfo];
      v11 = [v13 objectForKeyedSubscript:@"NSUnderlyingException"];

      if (objc_opt_respondsToSelector()) {
        [v11 reason];
      }
      else {
      v14 = [v11 description];
      }
      if ([v14 containsString:@"Expression tree is too large"])
      {
        v15 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          v18 = objc_msgSend(*(id *)(a1 + 48), "cd_sanitizeForLogging");
          __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_3(v17, v18, buf);
        }
      }
LABEL_19:
    }
  }
  [*(id *)(a1 + 40) reset];
}

void __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges]) {
    [*(id *)(a1 + 32) save:0];
  }
  [*(id *)(a1 + 32) reset];
  id v2 = -[_DKCoreDataStorage databasePathFor:](*(id **)(a1 + 40), *(void *)(a1 + 48));
  v3 = -[_DKCoreDataStorage databasePathFor:](*(id **)(a1 + 56), *(void *)(a1 + 48));
  id v13 = 0;
  +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v2, v3, (uint64_t)&v13);
  id v4 = v13;
  if (v4)
  {
    id v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@-wal", v2];
    v7 = [NSString stringWithFormat:@"%@-wal", v3];
    if ([*(id *)(*(void *)(a1 + 40) + 48) fileExistsAtPath:v6])
    {
      id v12 = 0;
      +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v6, v7, (uint64_t)&v12);
      id v5 = v12;
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@-shm", v2];
    v9 = [NSString stringWithFormat:@"%@-shm", v3];
    if ([*(id *)(*(void *)(a1 + 40) + 48) fileExistsAtPath:v8])
    {
      id v11 = v5;
      +[_DKCoreDataStorage forceCopyItemAtPath:toPath:error:]((uint64_t)_DKCoreDataStorage, v8, v9, (uint64_t)&v11);
      id v10 = v11;

      id v5 = v10;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __86___DKCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly_localOnly_sync___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[_DKCoreDataStorage handleDataProtectionChangeFor:willBeAvailable:](WeakRetained, v5, a3);
}

void __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = (void *)a1[4];
  id v4 = [*(id *)(a1[5] + 8) entities];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 name];
  v7 = [v2 fetchRequestWithEntityName:v6];
  id v10 = 0;
  [v3 countForFetchRequest:v7 error:&v10];
  id v8 = v10;
  id v9 = v10;

  if (v9) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  }
}

void __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke_2(uint64_t a1)
{
  -[_DKCoreDataStorage _registerForClientHelpNotifications](*(void *)(a1 + 32));
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(unsigned char *)(*(void *)(a1 + 32) + 66) = 0;
  objc_sync_exit(obj);
}

uint64_t __85___DKCoreDataStorage_invalidateManagedObjectContextAndPersistentStoreCoordinatorFor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __40___DKCoreDataStorage_managedObjectModel__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = gManagedObjectModelCache;
  gManagedObjectModelCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __93___DKCoreDataStorage_migratePersistentStoreAtURL_toManagedObjectModel_protectionClass_error___block_invoke(void *a1)
{
  id v2 = (unsigned char *)a1[4];
  v3 = (void *)a1[5];
  id v4 = (void *)a1[6];
  id v5 = (void *)a1[7];
  unint64_t v6 = a1[10];
  unint64_t v7 = a1[11];
  uint64_t v8 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:](v2, v3, v4, v5, v6, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_75(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (!a2 || v6)
  {
    uint64_t v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_75_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57___DKCoreDataStorage_managedObjectContextFor_identifier___block_invoke(uint64_t a1)
{
  id v3 = (id)os_transaction_create();
  id v2 = [*(id *)(a1 + 32) userInfo];
  [v2 setObject:v3 forKeyedSubscript:@"_DKTransaction"];
}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];
  [v2 setIncludesSubentities:*(unsigned __int8 *)(a1 + 72)];
  [v2 setIncludesPendingChanges:*(unsigned __int8 *)(a1 + 73)];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v2, "setPredicate:");
  }
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setUndoManager:0];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v27 = [MEMORY[0x1E4F1C0A8] entityForName:*(void *)(a1 + 40) inManagedObjectContext:*(void *)(a1 + 32)];
  [v28 setEntity:v27];
  [v28 setFetchLimit:*(void *)(a1 + 80)];
  [v28 setFetchBatchSize:*(void *)(a1 + 88)];
  [v28 setIncludesSubentities:*(unsigned __int8 *)(a1 + 96)];
  [v28 setIncludesPropertyValues:0];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v28, "setPredicate:");
  }
  id v2 = *(void **)(a1 + 56);
  if (v2 && [v2 count]) {
    [v28 setSortDescriptors:*(void *)(a1 + 56)];
  }
  v26 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = *(void **)(a1 + 32);
  id v30 = 0;
  id v4 = [v3 executeFetchRequest:v28 error:&v30];
  id v25 = v30;
  uint64_t v5 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v28 fetchLimit];
    [v26 timeIntervalSinceNow];
    double v21 = v20;
    uint64_t v22 = [v4 count];
    v23 = [v28 predicate];
    v24 = objc_msgSend(v23, "cd_sanitizeForLogging");
    *(_DWORD *)buf = 134218754;
    uint64_t v32 = v19;
    __int16 v33 = 2048;
    double v34 = -v21;
    __int16 v35 = 2048;
    uint64_t v36 = v22;
    __int16 v37 = 2112;
    v38 = v24;
    _os_log_debug_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEBUG, "updateObjectsInContext finished executeFetchRequest, fetchLimit %lu object(s),elapsed %f(sec), returned %lu object(s), Predicate: %@ ", buf, 0x2Au);
  }
  unint64_t v6 = vcvtpd_u64_f64((double)(unint64_t)[v4 count] / (double)*(unint64_t *)(a1 + 88));
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    do
    {
      int v9 = (void *)MEMORY[0x192FB2F20]();
      uint64_t v10 = *(void *)(a1 + 88);
      unint64_t v11 = [v4 count];
      unint64_t v12 = v10 * v7;
      unint64_t v13 = v10 * v7 + v10;
      if (v13 >= v11) {
        unint64_t v13 = v11;
      }
      if (v12 < v13)
      {
        if (v11 >= v10 * v8) {
          unint64_t v14 = v10 * v8;
        }
        else {
          unint64_t v14 = v11;
        }
        do
        {
          uint64_t v15 = *(void *)(a1 + 64);
          id v16 = [v4 objectAtIndexedSubscript:v12];
          LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16);

          if (v15) {
            ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          }
          ++v12;
        }
        while (v14 != v12);
      }
      if ([*(id *)(a1 + 32) hasChanges])
      {
        uint64_t v17 = *(void **)(a1 + 32);
        id v29 = 0;
        [v17 save:&v29];
        id v18 = v29;
        if (v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_3(buf, (uint64_t)v18, &v32);
        }
      }
      [*(id *)(a1 + 32) refreshAllObjects];
      ++v7;
      ++v8;
    }
    while (v7 != v6);
  }
}

BOOL __147___DKCoreDataStorage_anonymizeObjectStringsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_salt___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_DKCoreDataStorage anonymizeStringAttributesOfManagedObject:a2 withSalt:*(void *)(a1 + 32)] != 0;
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to add local store to coordinator: %@", v1, v2, v3, v4, v5);
}

void __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to add sync store to coordinator: %@", v2, v3, v4, v5, v6);
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Ignoring %@", v1, v2, v3, v4, v5);
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Encountered exception while deleting objects: %@", v1, v2, v3, v4, v5);
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_3(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Invalid predicate on %@: %@", buf, 0x16u);
}

void __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Caught error: %@", v1, v2, v3, v4, v5);
}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Encountered exception while counting objects: %@", v1, v2, v3, v4, v5);
}

void __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke_cold_3(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v1, "Caught %@", v2, v3, v4, v5, 2u);
  }
  objc_end_catch();
}

void __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed copy: %@", v1, v2, v3, v4, v5);
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Encountered exception while updating objects: %@", v1, v2, v3, v4, v5);
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Update commit failure: %@", buf, 0xCu);
}

void __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_4(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    OUTLINED_FUNCTION_0_1(&dword_18ECEB000, MEMORY[0x1E4F14500], v1, "updateObjectsInContext: %@", v2, v3, v4, v5, 2u);
  }
  objc_end_catch();
}

@end