@interface IRStore
- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5;
- (BOOL)commitChangesToStore;
- (IRPersistenceManager)persistenceManager;
- (IRStore)initWithPersistenceManager:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (id)countManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (id)fetchObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6;
- (void)commitChangesToStore;
@end

@implementation IRStore

- (BOOL)commitChangesToStore
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__IRStore_commitChangesToStore__block_invoke;
  v5[3] = &unk_2653A0768;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v5];
  if (v7[5])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRStore commitChangesToStore]();
    }
    BOOL v3 = v7[5] == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (id)fetchManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  uint64_t v6 = [(IRStore *)self fetchManagedObjectsWithEntityName:a3 byAndPredicates:a4 sortDescriptors:a5 andLimit:a6];
  if ([v6 count] == 1)
  {
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__IRStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_2653A07E0;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  v25 = &v33;
  unint64_t v26 = a6;
  id v22 = v16;
  v23 = self;
  v24 = &v27;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v19];
  if (v34[5] && os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
    -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:]();
  }
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __85__IRStore_countManagedObjectWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:a1[4]];
  BOOL v3 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[5]];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:a1[6]];
  [v2 setFetchLimit:a1[10]];
  v4 = *(void **)(a1[7] + 8);
  uint64_t v5 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[8] + 8) + 24) = v6;
  [*(id *)(a1[7] + 8) reset];
}

void __86__IRStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:a1[4]];
  BOOL v3 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[5]];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:a1[6]];
  [v2 setFetchLimit:a1[10]];
  v4 = *(void **)(a1[7] + 8);
  uint64_t v5 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[8] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke_2;
  uint64_t v8 = &unk_2653A0790;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v10 = v4;
  [v2 enumerateObjectsUsingBlock:&v5];
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "reset", v5, v6, v7, v8);
}

uint64_t __31__IRStore_commitChangesToStore__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) hasChanges])
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v3 + 40);
    [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) reset];
}

- (id)fetchObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  uint64_t v6 = [(IRStore *)self fetchObjectsWithEntityName:a3 byAndPredicates:a4 sortDescriptors:a5 andLimit:a6];
  if ([v6 count] == 1)
  {
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)fetchObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(IRStore *)self fetchManagedObjectsWithEntityName:v10 byAndPredicates:v11 sortDescriptors:v12 andLimit:a6];
  if (v13)
  {
    uint64_t v25 = 0;
    unint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__5;
    uint64_t v29 = __Block_byref_object_dispose__5;
    id v30 = [MEMORY[0x263EFF980] array];
    managedObjectContext = self->_managedObjectContext;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
    id v20 = &unk_2653A07B8;
    id v21 = v13;
    v23 = self;
    v24 = &v25;
    id v22 = v10;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:&v17];
    id v15 = objc_msgSend((id)v26[5], "copy", v17, v18, v19, v20);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)countManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  uint64_t v35 = __Block_byref_object_dispose__5;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__IRStore_countManagedObjectWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_2653A07E0;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  uint64_t v25 = &v31;
  unint64_t v26 = a6;
  id v22 = v16;
  v23 = self;
  v24 = &v27;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v19];
  if (v32[5] && os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
    -[IRStore countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:]();
  }
  if (v28[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = *(NSString **)(a1 + 32);
  id v5 = a2;
  id v7 = [v3 stringWithFormat:@"managedObject of class %@ must respond to convert selector", NSClassFromString(v4)];
  uint64_t v6 = [v5 performSelector:sel_convert];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

- (IRStore)initWithPersistenceManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRStore;
  uint64_t v6 = [(IRStore *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceManager, a3);
    uint64_t v8 = [(IRPersistenceManager *)v7->_persistenceManager createManagedObjectContext];
    managedObjectContext = v7->_managedObjectContext;
    v7->_managedObjectContext = (NSManagedObjectContext *)v8;
  }
  return v7;
}

- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__5;
  uint64_t v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__IRStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_2653A0808;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  v23 = self;
  v24 = &v26;
  unint64_t v25 = a6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v19];
  if (v27[5])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:]();
    }
    BOOL v17 = v27[5] == 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __85__IRStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:a1[4]];
  uint64_t v3 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[5]];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:a1[6]];
  [v2 setFetchLimit:a1[9]];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v2];
  id v5 = *(void **)(a1[7] + 8);
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = (id)[v5 executeRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  [*(id *)(a1[7] + 8) reset];
}

- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__5;
  uint64_t v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  managedObjectContext = self->_managedObjectContext;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__IRStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke;
  v17[3] = &unk_2653A0830;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  id v21 = self;
  id v22 = &v23;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v17];
  uint64_t v15 = v24[5];
  if (v15 && os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
    -[IRStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:]();
  }

  _Block_object_dispose(&v23, 8);
  return v15 == 0;
}

void __73__IRStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke(void *a1)
{
  v2 = [MEMORY[0x263EFF1E0] batchUpdateRequestWithEntityName:a1[4]];
  [v2 setPredicate:a1[5]];
  [v2 setPropertiesToUpdate:a1[6]];
  uint64_t v3 = *(void **)(a1[7] + 8);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = (id)[v3 executeRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  [*(id *)(a1[7] + 8) reset];
}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (void)commitChangesToStore
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#store, [ErrorId - Commit changes error] Could not save changes to store with error = %@", v2, v3, v4, v5, v6);
}

- (void)fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#store, [ErrorId - Fetch MOs error] Could not perform fetch request to store with error = %@", v2, v3, v4, v5, v6);
}

- (void)countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#store, [ErrorId - Count MOs error] Could not perform fetch request to store with error = %@", v2, v3, v4, v5, v6);
}

- (void)batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#store, [ErrorId - Batch delete MOs error] Could not perform batch delete request to store with error = %@", v2, v3, v4, v5, v6);
}

- (void)batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:.cold.1()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#store, [ErrorId - Batch update MOs error] Could not perform batch update request to store with error = %@", v2, v3, v4, v5, v6);
}

@end