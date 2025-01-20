@interface NSPersistentStore
- (id)_deleteChangesWithDuration:(void *)a3 entity:(uint64_t)a4 context:(double)a5 error:;
@end

@implementation NSPersistentStore

- (id)_deleteChangesWithDuration:(void *)a3 entity:(uint64_t)a4 context:(double)a5 error:
{
  v30[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v8 = a3;
    id v9 = a2;
    objc_msgSend(v8, "hmd_assertIsExecuting");
    v10 = [MEMORY[0x263EFF2F0] fetchRequest];
    v11 = [v10 entity];
    v12 = [v11 propertiesByName];
    v13 = [v12 objectForKeyedSubscript:@"changedEntity"];

    v14 = [v11 propertiesByName];
    v15 = [v14 objectForKeyedSubscript:@"changeType"];

    v16 = (void *)MEMORY[0x263F08A98];
    v28 = v13;
    v17 = [v13 name];
    v18 = [v9 name];

    v19 = [v15 name];
    v20 = [v16 predicateWithFormat:@"(%K == %@) AND (%K == %ld)", v17, v18, v19, 2];

    [v10 setPredicate:v20];
    if (a5 <= 2.22044605e-16 || fabs(a5 + -2.22044605e-16) < 2.22044605e-16)
    {
      v23 = [MEMORY[0x263EFF2F8] fetchHistoryWithFetchRequest:v10];
    }
    else
    {
      v21 = [MEMORY[0x263EFF910] now];
      v22 = [v21 dateByAddingTimeInterval:-a5];

      v23 = [MEMORY[0x263EFF2F8] fetchHistoryAfterDate:v22];
      [v23 setFetchRequest:v10];
    }
    v30[0] = a1;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v23 setAffectedStores:v24];

    [v23 setFetchBatchSize:20];
    [v23 setResultType:4];
    v25 = [v8 executeRequest:v23 error:a4];

    if (v25)
    {
      v26 = [v25 result];
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

void __83__NSPersistentStore_HomeKitDaemon__hmd_tombstonesForEntity_duration_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 changedObjectID];
  v4 = [v3 tombstone];

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)MEMORY[0x263EFFA78];
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

void __93__NSPersistentStore_HomeKitDaemon__hmd_deletedModelIDsForEntity_modelIDKey_duration_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tombstone];
  id v5 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
    v4 = v5;
  }
}

void __97__NSPersistentStore_HomeKitDaemon__hmd_modelWasDeletedWithID_modelIDKey_entity_duration_context___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 tombstone];
  id v7 = [v6 objectForKeyedSubscript:a1[4]];

  if ([v7 isEqual:a1[5]])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end