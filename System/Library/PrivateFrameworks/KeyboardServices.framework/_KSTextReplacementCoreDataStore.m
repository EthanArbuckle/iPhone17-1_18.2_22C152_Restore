@interface _KSTextReplacementCoreDataStore
+ (id)localCloudEntryFromMocObject:(id)a3;
- (BOOL)deleteTextReplacementsFromLocalStoreWithNames:(id)a3 excludeSavesToCloud:(BOOL)a4;
- (BOOL)deleteTextReplacementsWithPredicate:(id)a3;
- (BOOL)didMakeInitialPull;
- (BOOL)markDeletesForTextReplacementEntries:(id)a3;
- (BOOL)recordTextReplacementEntries:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)directoryPath;
- (_KSTextReplacementCoreDataStore)init;
- (_KSTextReplacementCoreDataStore)initWithDirectoryPath:(id)a3;
- (id)fetchTextReplacementEntry:(id)a3 context:(id)a4;
- (id)fetchTextReplacementWithUniqueName:(id)a3 context:(id)a4;
- (id)getCKFetchToken;
- (id)persistentStore;
- (id)queryEntriesWithPredicate:(id)a3 limit:(unint64_t)a4;
- (id)queryManagedObjectsWithPredicate:(id)a3 limit:(unint64_t)a4;
- (id)syncStateEntryShouldSave:(BOOL)a3 fetchToken:(id)a4;
- (id)textReplacementEntriesWithLimit:(unint64_t)a3;
- (unint64_t)countEntriesWithPredicate:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)fetchAndMergeTextReplacementEntry:(id)a3 context:(id)a4;
- (void)saveCKFetchToken:(id)a3;
- (void)setDirectoryPath:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setManagedObjectModel:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation _KSTextReplacementCoreDataStore

- (BOOL)didMakeInitialPull
{
  v2 = self;
  v3 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53___KSTextReplacementCoreDataStore_didMakeInitialPull__block_invoke;
  v5[3] = &unk_264891488;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

- (id)queryEntriesWithPredicate:(id)a3 limit:(unint64_t)a4
{
  v5 = [(_KSTextReplacementCoreDataStore *)self queryManagedObjectsWithPredicate:a3 limit:a4];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  v7 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67___KSTextReplacementCoreDataStore_queryEntriesWithPredicate_limit___block_invoke;
  v13[3] = &unk_264891550;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  id v9 = v5;
  [v7 performBlockAndWait:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)persistentStore
{
  v2 = [(_KSTextReplacementCoreDataStore *)self persistentStoreCoordinator];
  v3 = [v2 persistentStores];
  v4 = [v3 firstObject];

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel)
  {
    v3 = managedObjectModel;
  }
  else
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 URLForResource:dataModelName withExtension:@"mom"];

    if (v6)
    {
      v7 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v6];
      id v8 = self->_managedObjectModel;
      self->_managedObjectModel = v7;
    }
    v3 = self->_managedObjectModel;
  }
  return v3;
}

- (id)queryManagedObjectsWithPredicate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = [MEMORY[0x263EFF8C0] array];
  objc_initWeak(&location, self);
  v7 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke;
  v11[3] = &unk_264891578;
  objc_copyWeak(v14, &location);
  id v8 = v6;
  v14[1] = (id)a4;
  id v12 = v8;
  v13 = &v16;
  [v7 performWithOptions:4 andBlock:v11];

  id v9 = (id)v17[5];
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queuePSC);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  queuePSC = self->_queuePSC;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke;
  v6[3] = &unk_264891488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queuePSC, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSPersistentStoreCoordinator *)v4;
}

+ (id)localCloudEntryFromMocObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_KSTextReplacementEntry);
  v5 = [v3 phrase];
  [(_KSTextReplacementEntry *)v4 setPhrase:v5];

  id v6 = [v3 shortcut];
  [(_KSTextReplacementEntry *)v4 setShortcut:v6];

  uint64_t v7 = [(_KSTextReplacementEntry *)v4 phrase];

  if (!v7) {
    [(_KSTextReplacementEntry *)v4 setPhrase:&stru_26DE8B7B0];
  }
  id v8 = [(_KSTextReplacementEntry *)v4 shortcut];

  if (!v8)
  {
    uint64_t v9 = [(_KSTextReplacementEntry *)v4 phrase];
    [(_KSTextReplacementEntry *)v4 setShortcut:v9];
  }
  v10 = [v3 timestamp];
  [(_KSTextReplacementEntry *)v4 setTimestamp:v10];

  id v11 = [v3 remoteRecordInfo];
  [(_KSTextReplacementEntry *)v4 setCloudData:v11];

  -[_KSTextReplacementEntry setNeedsSaveToCloud:](v4, "setNeedsSaveToCloud:", [v3 needsSaveToCloud]);
  -[_KSTextReplacementEntry setWasDeleted:](v4, "setWasDeleted:", [v3 wasDeleted]);
  id v12 = [v3 uniqueName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [v3 uniqueName];
    [(_KSTextReplacementEntry *)v4 setCloudID:v14];
  }
  return v4;
}

- (id)syncStateEntryShouldSave:(BOOL)a3 fetchToken:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  id v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke;
  v11[3] = &unk_2648915A0;
  objc_copyWeak(&v14, &location);
  uint64_t v13 = &v17;
  BOOL v15 = a3;
  id v8 = v6;
  id v12 = v8;
  [v7 performBlockAndWait:v11];

  id v9 = (id)v18[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (_KSTextReplacementCoreDataStore)initWithDirectoryPath:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSTextReplacementCoreDataStore;
  id v6 = [(_KSTextReplacementCoreDataStore *)&v15 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.keyboardServices.cdStore.queueMOC", v7);
    queueMOC = v6->_queueMOC;
    v6->_queueMOC = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.keyboardServices.cdStore.queuePSC", v10);
    queuePSC = v6->_queuePSC;
    v6->_queuePSC = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v6 selector:sel_cleanup name:@"_KSTRShouldCleanupResources" object:0];
  }
  return v6;
}

- (NSManagedObjectContext)managedObjectContext
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queueMOC);
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  dispatch_queue_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  queueMOC = self->_queueMOC;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke;
  v6[3] = &unk_264891488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queueMOC, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSManagedObjectContext *)v4;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (_KSTextReplacementCoreDataStore)init
{
  id v3 = +[_KSUtilities unitTestDirectoryPath];
  id v4 = [(_KSTextReplacementCoreDataStore *)self initWithDirectoryPath:v3];

  return v4;
}

- (void)cleanup
{
  id v3 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  id v4 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42___KSTextReplacementCoreDataStore_cleanup__block_invoke;
  v6[3] = &unk_2648906A8;
  id v7 = v3;
  id v5 = v3;
  [v4 performBlockAndWait:v6];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementCoreDataStore;
  [(_KSTextReplacementCoreDataStore *)&v4 dealloc];
}

- (BOOL)recordTextReplacementEntries:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230F44DF0]();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        dispatch_queue_t v11 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
        [(_KSTextReplacementCoreDataStore *)self fetchAndMergeTextReplacementEntry:v10 context:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v12 = [(_KSTextReplacementCoreDataStore *)self persistentStore];

  if (v12)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__2;
    v19[4] = __Block_byref_object_dispose__2;
    id v20 = 0;
    uint64_t v13 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke;
    v16[3] = &unk_264891488;
    id v14 = v13;
    id v17 = v14;
    uint64_t v18 = v19;
    [v14 performBlockAndWait:v16];

    _Block_object_dispose(v19, 8);
  }

  return v12 != 0;
}

- (void)fetchAndMergeTextReplacementEntry:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__2;
  void v13[4] = __Block_byref_object_dispose__2;
  id v14 = 0;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77___KSTextReplacementCoreDataStore_fetchAndMergeTextReplacementEntry_context___block_invoke;
    v8[3] = &unk_2648914B0;
    objc_copyWeak(&v12, &location);
    id v9 = v6;
    id v10 = v7;
    dispatch_queue_t v11 = v13;
    [v10 performWithOptions:4 andBlock:v8];

    objc_destroyWeak(&v12);
  }
  _Block_object_dispose(v13, 8);

  objc_destroyWeak(&location);
}

- (id)fetchTextReplacementEntry:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F08A98];
    uint64_t v8 = [v5 shortcut];
    id v9 = [v6 phrase];
    id v10 = [v7 predicateWithFormat:@"shortcut == %@ AND phrase == %@ ", v8, v9];

    dispatch_queue_t v11 = [(_KSTextReplacementCoreDataStore *)self queryManagedObjectsWithPredicate:v10 limit:0x7FFFFFFFLL];
  }
  else
  {
    id v12 = KSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_KSTextReplacementCoreDataStore fetchTextReplacementEntry:context:](v12);
    }

    dispatch_queue_t v11 = 0;
  }

  return v11;
}

- (id)fetchTextReplacementWithUniqueName:(id)a3 context:(id)a4
{
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"uniqueName == %@", a4, a3];
  id v6 = [(_KSTextReplacementCoreDataStore *)self queryManagedObjectsWithPredicate:v5 limit:0x7FFFFFFFLL];

  return v6;
}

- (BOOL)markDeletesForTextReplacementEntries:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230F44DF0]();
  id v6 = [(_KSTextReplacementCoreDataStore *)self persistentStore];

  if (v6)
  {
    uint64_t v7 = [v4 count];
    if (v7)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = [v4 objectAtIndexedSubscript:i];
        [v10 setWasDeleted:1];
        dispatch_queue_t v11 = [v10 timestamp];

        if (!v11)
        {
          id v12 = [MEMORY[0x263EFF910] date];
          [v10 setTimestamp:v12];
        }
      }
    }
    [(_KSTextReplacementCoreDataStore *)self recordTextReplacementEntries:v4];
  }

  return v6 != 0;
}

- (BOOL)deleteTextReplacementsFromLocalStoreWithNames:(id)a3 excludeSavesToCloud:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v14 = a3;
  context = (void *)MEMORY[0x230F44DF0]();
  objc_super v15 = [(_KSTextReplacementCoreDataStore *)self persistentStore];

  if (v15)
  {
    objc_initWeak(&location, self);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v14;
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v10 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke;
          v19[3] = &unk_264891070;
          objc_copyWeak(&v20, &location);
          BOOL v21 = a4;
          v19[4] = v9;
          [v10 performWithOptions:4 andBlock:v19];

          objc_destroyWeak(&v20);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    dispatch_queue_t v11 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_70;
    v17[3] = &unk_2648914D8;
    objc_copyWeak(&v18, &location);
    [v11 performBlockAndWait:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
  }

  return v15 != 0;
}

- (BOOL)deleteTextReplacementsWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230F44DF0]();
  uint64_t v6 = [(_KSTextReplacementCoreDataStore *)self persistentStore];

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke;
    v9[3] = &unk_264891500;
    id v10 = @"TextReplacementEntry";
    objc_copyWeak(v12, &location);
    v12[1] = 0;
    id v11 = v4;
    [v7 performWithOptions:4 andBlock:v9];

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v6 != 0;
}

- (id)textReplacementEntriesWithLimit:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67___KSTextReplacementCoreDataStore_textReplacementEntriesWithLimit___block_invoke;
  v11[3] = &unk_264891500;
  void v11[4] = self;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  id v7 = v5;
  id v12 = v7;
  [v6 performWithOptions:4 andBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (unint64_t)countEntriesWithPredicate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61___KSTextReplacementCoreDataStore_countEntriesWithPredicate___block_invoke;
  v9[3] = &unk_264891528;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v10 = v6;
  id v11 = &v13;
  [v5 performWithOptions:4 andBlock:v9];

  unint64_t v7 = v14[3];
  objc_destroyWeak(&v12);
  _Block_object_dispose(&v13, 8);
  objc_destroyWeak(&location);

  return v7;
}

- (void)saveCKFetchToken:(id)a3
{
  id v3 = [(_KSTextReplacementCoreDataStore *)self syncStateEntryShouldSave:1 fetchToken:a3];
}

- (id)getCKFetchToken
{
  id v3 = [(_KSTextReplacementCoreDataStore *)self managedObjectContext];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50___KSTextReplacementCoreDataStore_getCKFetchToken__block_invoke;
  v6[3] = &unk_264891488;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setDirectoryPath:(id)a3
{
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void)setManagedObjectModel:(id)a3
{
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_queuePSC, 0);
  objc_storeStrong((id *)&self->_queueMOC, 0);
}

- (void)fetchTextReplacementEntry:(os_log_t)log context:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[_KSTextReplacementCoreDataStore fetchTextReplacementEntry:context:]";
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  >>> entry is nil, returning", (uint8_t *)&v1, 0xCu);
}

@end