@interface CDCoreDataContextPersisting
@end

@implementation CDCoreDataContextPersisting

void __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 uniqunessPredicateForRegistration:*(void *)(a1 + 40)];
  [v2 withMOFromEntityWithName:@"ContextualChangeRegistration" andUniqunessPredicate:v3 update:&__block_literal_global_8];

  v4 = [*(id *)(a1 + 40) predicate];
  v5 = [v4 keyPaths];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) _deleteKeyPaths:v6];
}

void __73___CDCoreDataContextPersisting_fromEntityWithName_deleteObjectsMatching___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F1C0D8] fetchRequestWithEntityName:a1[4]];
  [v2 setFetchLimit:0];
  [v2 setIncludesPendingChanges:1];
  [v2 setPredicate:a1[5]];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C010]) initWithFetchRequest:v2];
  [v3 setResultType:0];
  v4 = (void *)a1[6];
  id v8 = 0;
  v5 = [v4 executeRequest:v3 error:&v8];
  id v6 = v8;
  uint64_t v7 = [v5 result];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v7 BOOLValue];
}

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C0D8] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setFetchLimit:1];
  [v2 setIncludesPendingChanges:1];
  [v2 setPredicate:*(void *)(a1 + 40)];
  v3 = *(void **)(a1 + 48);
  id v13 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_2((uint64_t)v5, v6);
    }
  }
  if ([v4 count])
  {
    uint64_t v7 = [v4 firstObject];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72)) {
      goto LABEL_15;
    }
    uint64_t v7 = [MEMORY[0x1E4F1C0B0] insertNewObjectForEntityForName:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 48)];
  }
  id v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    uint64_t v9 = *(void **)(a1 + 48);
    id v12 = 0;
    char v10 = [v9 save:&v12];
    id v5 = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
    if (v5)
    {
      long long v11 = [MEMORY[0x1E4F5B418] contextChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_1((uint64_t)v5, v11);
      }
    }
    [*(id *)(a1 + 48) processPendingChanges];
    [*(id *)(a1 + 48) refreshAllObjects];
  }
LABEL_15:
}

uint64_t __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

void __96___CDCoreDataContextPersisting_fromEntityWithName_fetchAllObjectsMatchingPredicate_handlingMOs___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F1C0D8] fetchRequestWithEntityName:a1[4]];
  [v2 setFetchLimit:0];
  [v2 setIncludesPendingChanges:1];
  [v2 setPredicate:a1[5]];
  v3 = (void *)a1[6];
  id v6 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();
}

void __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isEphemeral]
    || [*(id *)(*(void *)(a1 + 40) + 24) countForObject:*(void *)(a1 + 32)])
  {
    v2 = *(void **)(a1 + 40);
    v3 = [v2 uniquenessPredicateForKeyPath:*(void *)(a1 + 32)];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke_2;
    v4[3] = &unk_1E56092E8;
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    [v2 withMOFromEntityWithName:@"ContextualKeyPath" andUniqunessPredicate:v3 insertOrUpdate:v4];
  }
}

uint64_t __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[_CDContextualKeyPathMO hydrateMO:a2 fromKeyPath:*(void *)(a1 + 32) andValue:*(void *)(a1 + 40)];
}

void __49___CDCoreDataContextPersisting_saveRegistration___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [*(id *)(a1 + 32) predicate];
  v3 = [v2 keyPaths];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v8 uniqunessPredicateForRegistration:*(void *)(a1 + 32)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___CDCoreDataContextPersisting_saveRegistration___block_invoke_2;
  v10[3] = &unk_1E5609310;
  id v11 = *(id *)(a1 + 32);
  [v8 withMOFromEntityWithName:@"ContextualChangeRegistration" andUniqunessPredicate:v9 insertOrUpdate:v10];
}

void __49___CDCoreDataContextPersisting_saveRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F5B418];
  id v4 = a2;
  uint64_t v5 = [v3 contextChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_18EC9B000, v5, OS_LOG_TYPE_DEFAULT, "Saving registration: %@", (uint8_t *)&v7, 0xCu);
  }

  +[_CDContextualChangeRegistrationMO hydrateMO:v4 fromRegistration:*(void *)(a1 + 32)];
}

uint64_t __45___CDCoreDataContextPersisting_deleteAllData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) fromEntityWithName:@"ContextualKeyPath" deleteObjectsMatching:0];
  v2 = *(void **)(a1 + 32);
  return [v2 fromEntityWithName:@"ContextualChangeRegistration" deleteObjectsMatching:0];
}

void __56___CDCoreDataContextPersisting_deleteDataCreatedBefore___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@", *(void *)(a1 + 32)];
  [*(id *)(a1 + 40) fromEntityWithName:@"ContextualKeyPath" deleteObjectsMatching:v2];
  [*(id *)(a1 + 40) fromEntityWithName:@"ContextualChangeRegistration" deleteObjectsMatching:v2];
}

void __42___CDCoreDataContextPersisting_loadValues__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42___CDCoreDataContextPersisting_loadValues__block_invoke_2;
  v2[3] = &unk_1E5609358;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 fromEntityWithName:@"ContextualKeyPath" fetchAllObjectsMatchingPredicate:0 handlingMOs:v2];
}

void __42___CDCoreDataContextPersisting_loadValues__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = +[_CDContextualKeyPathMO materializedKeyPathFrom:v8];
        char v10 = +[_CDContextualKeyPathMO materializedContextValueFrom:v8];
        [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long v12 = 0x1500000001;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  size_t v7 = 16;
  if (sysctl(v12, 2u, &v8, &v7, 0, 0) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_cold_1();
    }
    id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(int)v9 / 1000000.0 + (double)v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v11 = v2;
      _os_log_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device boot time: %@", buf, 0xCu);
    }
  }
  id v3 = +[_CDContextualChangeRegistrationMO predicateForActiveRegistrationsInBootSession:v2];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_2;
  v5[3] = &unk_1E5609358;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 fromEntityWithName:@"ContextualChangeRegistration" fetchAllObjectsMatchingPredicate:v3 handlingMOs:v5];
}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v10 = +[_CDContextualChangeRegistrationMO materializedRegistrationFrom:v9];
        if (v10)
        {
          [*(id *)(a1 + 32) addObject:v10];
        }
        else
        {
          if (!v6)
          {
            id v6 = [v9 managedObjectContext];
          }
          [v6 deleteObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  [v6 save:0];
}

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_ERROR, "Error saving MO: %@", (uint8_t *)&v2, 0xCu);
}

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_ERROR, "Error fetching MO: %@", (uint8_t *)&v2, 0xCu);
}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = __error();
  v1 = strerror(*v0);
  int v2 = 136446210;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to determine KERN_BOOTTIME: %{public}s", (uint8_t *)&v2, 0xCu);
}

@end