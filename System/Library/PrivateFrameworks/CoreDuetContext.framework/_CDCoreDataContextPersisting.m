@interface _CDCoreDataContextPersisting
+ (id)persistenceWithDirectory:(id)a3;
+ (id)persistenceWithStorage:(id)a3;
- (BOOL)_withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insert:(BOOL)a5 update:(id)a6;
- (BOOL)fromEntityWithName:(id)a3 deleteObjectsMatching:(id)a4;
- (BOOL)fromEntityWithName:(id)a3 fetchAllObjectsMatchingPredicate:(id)a4 handlingMOs:(id)a5;
- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insertOrUpdate:(id)a5;
- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 update:(id)a5;
- (NSCountedSet)keyPathRegistrationCount;
- (OS_dispatch_queue)queue;
- (_CDCoreDataContextPersisting)initWithStorage:(id)a3;
- (_DKCoreDataStorage)storage;
- (id)getMOC;
- (id)loadRegistrations;
- (id)loadValues;
- (id)uniquenessPredicateForKeyPath:(id)a3;
- (id)uniqunessPredicateForRegistration:(id)a3;
- (void)_deleteKeyPaths:(id)a3;
- (void)deleteAllData;
- (void)deleteDataCreatedBefore:(id)a3;
- (void)deleteRegistration:(id)a3;
- (void)saveRegistration:(id)a3;
- (void)saveValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation _CDCoreDataContextPersisting

- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 update:(id)a5
{
  return [(_CDCoreDataContextPersisting *)self _withMOFromEntityWithName:a3 andUniqunessPredicate:a4 insert:0 update:a5];
}

- (id)uniqunessPredicateForRegistration:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 identifier];
  v5 = [v3 predicateWithFormat:@"identifier == %@", v4];

  return v5;
}

- (void)_deleteKeyPaths:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 isEphemeral]
          && ![(NSCountedSet *)self->_keyPathRegistrationCount countForObject:v11])
        {
          v12 = (void *)MEMORY[0x1E4F28F60];
          v13 = [v11 key];
          v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isUserCentric"));
          v15 = [v11 deviceID];
          v16 = [v12 predicateWithFormat:@"key == %@ AND isUserCentric == %@ AND deviceID == %@", v13, v14, v15];
          [v5 addObject:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v17 = (void *)MEMORY[0x1E4F28BA0];
  v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  v19 = [v17 orPredicateWithSubpredicates:v18];

  [(_CDCoreDataContextPersisting *)self fromEntityWithName:@"ContextualKeyPath" deleteObjectsMatching:v19];
}

- (BOOL)fromEntityWithName:(id)a3 deleteObjectsMatching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v8 = [(_CDCoreDataContextPersisting *)self getMOC];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73___CDCoreDataContextPersisting_fromEntityWithName_deleteObjectsMatching___block_invoke;
  v14[3] = &unk_1E5609298;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  v18 = &v19;
  [v11 performWithOptions:4 andBlock:v14];
  char v12 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (BOOL)_withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insert:(BOOL)a5 update:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  v13 = [(_CDCoreDataContextPersisting *)self getMOC];
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_CDCoreDataContextPersisting _withMOFromEntityWithName:andUniqunessPredicate:insert:update:](v14);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke;
  v21[3] = &unk_1E5609270;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  BOOL v27 = a5;
  id v18 = v12;
  id v25 = v18;
  v26 = &v28;
  [v17 performWithOptions:4 andBlock:v21];
  char v19 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (id)getMOC
{
  return (id)[(_DKCoreDataStorage *)self->_storage managedObjectContextFor:*MEMORY[0x1E4F28358]];
}

- (void)deleteRegistration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (_CDCoreDataContextPersisting)initWithStorage:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDCoreDataContextPersisting;
  id v6 = [(_CDCoreDataContextPersisting *)&v13 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreduetcontext.service.coredatapersistence", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_storage, a3);
    uint64_t v10 = [MEMORY[0x1E4F28BD0] set];
    keyPathRegistrationCount = v6->_keyPathRegistrationCount;
    v6->_keyPathRegistrationCount = (NSCountedSet *)v10;
  }
  return v6;
}

+ (id)persistenceWithDirectory:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v6 pathForResource:@"_DKDataModel" ofType:@"momd"];

  dispatch_queue_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F5B4E0]) initWithDirectory:v5 databaseName:@"knowledge" modelURL:v8 readOnly:0 localOnly:1];

  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithStorage:v9];
  return v10;
}

+ (id)persistenceWithStorage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithStorage:v4];

  return v5;
}

- (BOOL)withMOFromEntityWithName:(id)a3 andUniqunessPredicate:(id)a4 insertOrUpdate:(id)a5
{
  return [(_CDCoreDataContextPersisting *)self _withMOFromEntityWithName:a3 andUniqunessPredicate:a4 insert:1 update:a5];
}

- (BOOL)fromEntityWithName:(id)a3 fetchAllObjectsMatchingPredicate:(id)a4 handlingMOs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_CDCoreDataContextPersisting *)self getMOC];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96___CDCoreDataContextPersisting_fromEntityWithName_fetchAllObjectsMatchingPredicate_handlingMOs___block_invoke;
  v17[3] = &unk_1E56092C0;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  [v13 performWithOptions:4 andBlock:v17];

  return 0;
}

- (id)uniquenessPredicateForKeyPath:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 deviceID];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  if (v4)
  {
    id v6 = [v3 deviceID];
    id v7 = [v5 predicateWithFormat:@"deviceID == %@", v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"deviceID == NULL"];
  }

  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [v3 key];
  id v10 = [v8 predicateWithFormat:@"key == %@", v9];

  char v11 = [v3 isUserCentric];
  id v12 = (void *)MEMORY[0x1E4F28F60];
  if (v11)
  {
    id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isUserCentric"));
    id v14 = [v12 predicateWithFormat:@"isUserCentric == %@", v13];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isUserCentric == NULL"];
  }
  char v15 = [v3 isEphemeral];
  id v16 = (void *)MEMORY[0x1E4F28F60];
  if (v15)
  {
    id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isEphemeral"));
    id v18 = [v16 predicateWithFormat:@"isEphemeral == %@", v17];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isEphemeral == NULL"];
  }
  id v19 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v10;
  v23[1] = v7;
  v23[2] = v14;
  v23[3] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  id v21 = [v19 andPredicateWithSubpredicates:v20];

  return v21;
}

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke;
  block[3] = &unk_1E56091B0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (void)saveRegistration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___CDCoreDataContextPersisting_saveRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)deleteAllData
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___CDCoreDataContextPersisting_deleteAllData__block_invoke;
  block[3] = &unk_1E5609210;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)deleteDataCreatedBefore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___CDCoreDataContextPersisting_deleteDataCreatedBefore___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)loadValues
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __42___CDCoreDataContextPersisting_loadValues__block_invoke;
  char v11 = &unk_1E56091D8;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(queue, &v8);
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v5, v8, v9, v10, v11, v12);

  return v6;
}

- (id)loadRegistrations
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke;
  char v11 = &unk_1E56091D8;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(queue, &v8);
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v5, v8, v9, v10, v11, v12);

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (NSCountedSet)keyPathRegistrationCount
{
  return self->_keyPathRegistrationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_withMOFromEntityWithName:(os_log_t)log andUniqunessPredicate:insert:update:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EC9B000, log, OS_LOG_TYPE_ERROR, "Error: null managed object context", v1, 2u);
}

@end