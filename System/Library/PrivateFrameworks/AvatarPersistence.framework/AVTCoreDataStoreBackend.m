@interface AVTCoreDataStoreBackend
+ (BOOL)fetchRequestCriteriaSupported:(int64_t)a3;
+ (id)cdFetchRequestForAvatarFetchRequest:(id)a3 recordTransformer:(id)a4;
+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4;
+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4 ascending:(BOOL)a5;
- (AVTAvatarManagedRecordTransformer)recordTransformer;
- (AVTAvatarRecordChangeTracker)recordChangeTracker;
- (AVTCoreDataPersistentStoreConfiguration)configuration;
- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver;
- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 environment:(id)a4;
- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 recordTransformer:(id)a4 remoteChangesObserver:(id)a5 localProcessName:(id)a6 recordChangeTracker:(id)a7 environment:(id)a8;
- (AVTStoreBackendDelegate)backendDelegate;
- (AVTUILogger)logger;
- (BOOL)canCreateAvatarWithError:(id *)a3;
- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)nts_saveManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)saveAvatar:(id)a3 error:(id *)a4;
- (BOOL)saveAvatars:(id)a3 error:(id *)a4;
- (BOOL)setupStoreIfNeeded:(id *)a3;
- (NSString)localProcessName;
- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4;
- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4;
- (id)newManagedObjectContext;
- (id)recordIdentifiersForManagedObjectIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (unint64_t)nts_avatarCountWithManagedObjectContext:(id)a3 error:(id *)a4;
- (void)contentDidChangeWithIdentifiers:(id)a3;
- (void)getChangedObjectIDsOfInterest:(id *)a3 deletedIdentifiers:(id *)a4 forTransactions:(id)a5;
- (void)performWorkWithManagedObjectContext:(id)a3;
- (void)setBackendDelegate:(id)a3;
- (void)startObservingChangesIfNeeded;
@end

@implementation AVTCoreDataStoreBackend

- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(AVTAvatarManagedRecordTransformer);
  v9 = [v6 serialQueueProvider];
  v10 = ((void (**)(void, const char *))v9)[2](v9, "com.apple.AvatarUI.AVTCoreDataStoreBackend.changesObserverQueue");

  v11 = [AVTEventCoalescer alloc];
  v12 = [v6 logger];
  v13 = [(AVTEventCoalescer *)v11 initWithDelay:v10 queue:v12 logger:1.0];

  v14 = [[AVTCoreDataRemoteChangesObserver alloc] initWithConfiguration:v7 workQueue:v10 coalescer:v13 environment:v6];
  v15 = [[AVTCoreDataChangeTracker alloc] initWithConfiguration:v7 recordTransformer:v8 environment:v6];
  v16 = [MEMORY[0x263F08AB0] processInfo];
  v17 = [v16 processName];

  v18 = [(AVTCoreDataStoreBackend *)self initWithConfiguration:v7 recordTransformer:v8 remoteChangesObserver:v14 localProcessName:v17 recordChangeTracker:v15 environment:v6];
  return v18;
}

- (AVTCoreDataStoreBackend)initWithConfiguration:(id)a3 recordTransformer:(id)a4 remoteChangesObserver:(id)a5 localProcessName:(id)a6 recordChangeTracker:(id)a7 environment:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)AVTCoreDataStoreBackend;
  v19 = [(AVTCoreDataStoreBackend *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_recordTransformer, a4);
    uint64_t v21 = objc_msgSend(v18, "logger", v24, v25);
    logger = v20->_logger;
    v20->_logger = (AVTUILogger *)v21;

    objc_storeStrong((id *)&v20->_configuration, a3);
    objc_storeStrong((id *)&v20->_remoteChangesObserver, a5);
    objc_storeStrong((id *)&v20->_recordChangeTracker, a7);
    objc_storeStrong((id *)&v20->_localProcessName, a6);
  }

  return v20;
}

- (id)newManagedObjectContext
{
  v2 = [(AVTCoreDataStoreBackend *)self configuration];
  v3 = [v2 createManagedObjectContext];

  return v3;
}

- (void)performWorkWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTCoreDataStoreBackend *)self newManagedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__AVTCoreDataStoreBackend_performWorkWithManagedObjectContext___block_invoke;
  v8[3] = &unk_2647C3210;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

uint64_t __63__AVTCoreDataStoreBackend_performWorkWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)setupStoreIfNeeded:(id *)a3
{
  id v5 = [(AVTCoreDataStoreBackend *)self configuration];
  int v6 = [v5 setupIfNeeded:a3];

  if (v6) {
    [(AVTCoreDataStoreBackend *)self startObservingChangesIfNeeded];
  }
  return v6;
}

- (id)recordIdentifiersForManagedObjectIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Avatar"];
  [v9 setResultType:2];
  v35[0] = @"identifier";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v9 setPropertiesToFetch:v10];

  v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"self in %@", v7];
  [v9 setPredicate:v11];

  v12 = [v8 executeFetchRequest:v9 error:a5];
  if (v12)
  {
    id v25 = v9;
    id v26 = v8;
    id v27 = v7;
    v13 = [MEMORY[0x263EFF980] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v12;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:@"identifier"];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
          {
            id v19 = objc_alloc(MEMORY[0x263F08C38]);
            id v20 = v18;
            id v18 = objc_msgSend(v19, "initWithUUIDBytes:", objc_msgSend(v20, "bytes"));
          }
          uint64_t v21 = [(AVTCoreDataStoreBackend *)self recordTransformer];
          v22 = [v21 identifierForManagedRecordIdentifier:v18];
          [v13 addObject:v22];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    id v8 = v26;
    id v7 = v27;
    v12 = v24;
    id v9 = v25;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)getChangedObjectIDsOfInterest:(id *)a3 deletedIdentifiers:(id *)a4 forTransactions:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a5;
  v34 = [MEMORY[0x263EFF980] array];
  long long v33 = [MEMORY[0x263EFF980] array];
  id v7 = [(AVTCoreDataStoreBackend *)self localProcessName];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    uint64_t v28 = *(void *)v40;
    v29 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        v13 = [v12 processID];
        char v14 = [v13 isEqual:v7];

        if ((v14 & 1) == 0)
        {
          uint64_t v32 = v11;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v15 = [v12 changes];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (!v16) {
            goto LABEL_23;
          }
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v36;
          while (1)
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
              if (!(*((BOOL (**)(uint64_t, void *))AVTIsPersistentChangeOfInterest + 2))((uint64_t)AVTIsPersistentChangeOfInterest, v20))
              {
                v22 = [(AVTCoreDataStoreBackend *)self logger];
                v23 = [v20 description];
                [v22 logPersistentChangeNotOfInterest:v23];
LABEL_17:

                goto LABEL_19;
              }
              if ([v20 changeType] == 2)
              {
                uint64_t v21 = [v20 tombstone];
                v22 = [v21 objectForKeyedSubscript:@"identifier"];

                if (v22)
                {
                  v23 = [(AVTCoreDataStoreBackend *)self recordTransformer];
                  id v24 = [v23 identifierForManagedRecordIdentifier:v22];
                  [v33 addObject:v24];
                }
                else
                {
                  v23 = [(AVTCoreDataStoreBackend *)self logger];
                  [v23 logMissingTombstonedIdentifier];
                }
                goto LABEL_17;
              }
              v22 = [v20 changedObjectID];
              [v34 addObject:v22];
LABEL_19:

              ++v19;
            }
            while (v17 != v19);
            uint64_t v25 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            uint64_t v17 = v25;
            if (!v25)
            {
LABEL_23:

              uint64_t v10 = v28;
              id v7 = v29;
              uint64_t v9 = v30;
              uint64_t v11 = v32;
              break;
            }
          }
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }

  *a3 = (id)[v34 copy];
  *a4 = (id)[v33 copy];
}

- (void)startObservingChangesIfNeeded
{
  v3 = [(AVTCoreDataStoreBackend *)self remoteChangesObserver];
  char v4 = [v3 isObservingChanges];

  if ((v4 & 1) == 0)
  {
    objc_initWeak(&location, self);
    id v5 = [(AVTCoreDataStoreBackend *)self remoteChangesObserver];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __56__AVTCoreDataStoreBackend_startObservingChangesIfNeeded__block_invoke;
    uint64_t v10 = &unk_2647C3238;
    objc_copyWeak(&v11, &location);
    [v5 addChangesHandler:&v7];

    id v6 = [(AVTCoreDataStoreBackend *)self remoteChangesObserver];
    [v6 startObservingChanges];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__AVTCoreDataStoreBackend_startObservingChangesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v17 = 0;
  id v18 = 0;
  [WeakRetained getChangedObjectIDsOfInterest:&v18 deletedIdentifiers:&v17 forTransactions:v6];

  id v8 = v18;
  id v9 = v17;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    id v16 = 0;
    uint64_t v10 = [WeakRetained recordIdentifiersForManagedObjectIDs:v8 managedObjectContext:v5 error:&v16];
    id v11 = v16;
    if (!v10)
    {
      v12 = [WeakRetained logger];
      v13 = [v8 description];
      char v14 = [v11 description];
      [v12 logErrorGettingChangedRecordsContentForIdentifiers:v13 error:v14];

      uint64_t v10 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v15 = [v10 arrayByAddingObjectsFromArray:v9];
    [WeakRetained contentDidChangeWithIdentifiers:v15];
  }
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "fetchRequestCriteriaSupported:", objc_msgSend(v6, "criteria")))
  {
    id v8 = (id)MEMORY[0x263EFFA68];
    goto LABEL_17;
  }
  if (![(AVTCoreDataStoreBackend *)self setupStoreIfNeeded:a4])
  {
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __56__AVTCoreDataStoreBackend_avatarsForFetchRequest_error___block_invoke;
  char v14 = &unk_2647C3260;
  uint64_t v15 = self;
  id v7 = v6;
  id v16 = v7;
  id v17 = &v19;
  id v18 = &v25;
  [(AVTCoreDataStoreBackend *)self performWorkWithManagedObjectContext:&v11];
  if (!v26[5])
  {
    if (a4)
    {
      id v9 = (id) v20[5];
LABEL_14:
      id v8 = 0;
      *a4 = v9;
      goto LABEL_16;
    }
LABEL_15:
    id v8 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v7, "criteria", v11, v12, v13, v14, v15) == 1 || objc_msgSend(v7, "criteria") == 2)
    && ![(id)v26[5] count])
  {
    if (a4)
    {
      id v9 = +[AVTError errorWithCode:404 userInfo:0];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v8 = (id)v26[5];
LABEL_16:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

LABEL_17:

  return v8;
}

void __56__AVTCoreDataStoreBackend_avatarsForFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) recordTransformer];
  id v7 = [v4 cdFetchRequestForAvatarFetchRequest:v5 recordTransformer:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v3 executeFetchRequest:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    unint64_t v10 = +[AVTPAvatarStore maximumNumberOfFetchableAvatars];
    long long v37 = v7;
    id v38 = v3;
    if ([v9 count] > v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) logger];
      objc_msgSend(v11, "logTooManyAvatars:limit:", objc_msgSend(v9, "count"), v10);

      uint64_t v12 = objc_msgSend(v9, "subarrayWithRange:", objc_msgSend(v9, "count") - v10, v10);

      id v9 = (void *)v12;
    }
    uint64_t v13 = [*(id *)(a1 + 40) criteria];
    char v14 = [MEMORY[0x263EFF980] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = v9;
    uint64_t v41 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v41)
    {
      uint64_t v16 = *(void *)v44;
      uint64_t v39 = a1;
      uint64_t v40 = v13;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v44 != v16) {
            objc_enumerationMutation(v15);
          }
          uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * v17);
          uint64_t v19 = [*(id *)(a1 + 32) recordTransformer];
          id v42 = 0;
          id v20 = [v19 recordWithManagedRecord:v18 error:&v42];
          id v21 = v42;

          if (v20)
          {
            [v14 addObject:v20];
            if (v13 == 5)
            {

              goto LABEL_18;
            }
          }
          else
          {
            if ([v21 code] == 703)
            {
              v22 = NSString;
              v23 = [v21 description];
              [v21 userInfo];
              v25 = id v24 = v14;
              [v25 objectForKeyedSubscript:0];
              uint64_t v26 = v16;
              v28 = id v27 = v15;
              v29 = [v22 stringWithFormat:@"%@ : unexpected class is %@", v23, v28];

              id v15 = v27;
              uint64_t v16 = v26;

              char v14 = v24;
              a1 = v39;
              uint64_t v13 = v40;

              id v30 = [*(id *)(v39 + 32) logger];
              long long v31 = v30;
              uint64_t v32 = v29;
              uint64_t v33 = 1;
            }
            else
            {
              v29 = [*(id *)(a1 + 32) logger];
              long long v31 = [v21 description];
              id v30 = v29;
              uint64_t v32 = v31;
              uint64_t v33 = 0;
            }
            [v30 logUnableToReadRemoteRecord:v32 isCritical:v33];
          }
          ++v17;
        }
        while (v41 != v17);
        uint64_t v41 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v41);
    }
LABEL_18:

    uint64_t v34 = [v14 copy];
    uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    id v7 = v37;
    id v3 = v38;
  }
}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v10 count:1];

  LOBYTE(a4) = -[AVTCoreDataStoreBackend saveAvatars:error:](self, "saveAvatars:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    if ([(AVTCoreDataStoreBackend *)self setupStoreIfNeeded:a4])
    {
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 1;
      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy_;
      uint64_t v18 = __Block_byref_object_dispose_;
      id v19 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke;
      v9[3] = &unk_2647C3260;
      id v10 = v6;
      uint64_t v11 = self;
      uint64_t v12 = &v14;
      uint64_t v13 = &v20;
      [(AVTCoreDataStoreBackend *)self performWorkWithManagedObjectContext:v9];
      BOOL v7 = *((unsigned char *)v21 + 24) != 0;
      if (a4 && !*((unsigned char *)v21 + 24)) {
        *a4 = (id) v15[5];
      }

      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_2;
  v45[3] = &unk_2647C3288;
  char v4 = *(void **)(a1 + 32);
  v45[4] = *(void *)(a1 + 40);
  uint64_t v5 = objc_msgSend(v4, "avt_map:", v45);
  id v6 = objc_opt_class();
  BOOL v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"identifier", v5];
  uint64_t v8 = [v6 cdFetchRequestWithPredicate:v7 fetchLimit:0];

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [v3 executeFetchRequest:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    uint64_t v11 = objc_msgSend(NSDictionary, "_avtui_dictionaryByIndexingObjectsInArray:by:", v10, &__block_literal_global);
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v43 = *(id *)(v13 + 40);
    uint64_t v14 = objc_msgSend(v12, "nts_avatarCountWithManagedObjectContext:error:", v3, &v43);
    objc_storeStrong((id *)(v13 + 40), v43);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [*(id *)(a1 + 32) count];
      uint64_t v16 = [v10 count];
      if (v15 == v16
        || v15 + v14 - v16 <= +[AVTPAvatarStore maximumNumberOfSavableAvatars])
      {
        uint64_t v34 = v10;
        uint64_t v35 = v8;
        long long v36 = v5;
        id v37 = v3;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v20 = *(id *)(a1 + 32);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              uint64_t v26 = [*(id *)(a1 + 40) recordTransformer];
              id v27 = [v25 identifier];
              uint64_t v28 = [v26 managedRecordIdentifierForIdentifier:v27];

              v29 = [v11 objectForKeyedSubscript:v28];
              if (!v29)
              {
                v29 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"Avatar" inManagedObjectContext:v37];
              }
              id v30 = [*(id *)(a1 + 40) recordTransformer];
              [v30 updateManagedRecord:v29 withRecord:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v46 count:16];
          }
          while (v22);
        }

        long long v31 = *(void **)(a1 + 40);
        uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
        id v38 = *(id *)(v32 + 40);
        id v3 = v37;
        char v33 = objc_msgSend(v31, "nts_saveManagedObjectContext:error:", v37, &v38);
        objc_storeStrong((id *)(v32 + 40), v38);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v33;
        uint64_t v8 = v35;
        uint64_t v5 = v36;
        id v10 = v34;
        goto LABEL_18;
      }
      uint64_t v17 = +[AVTError errorWithCode:578 userInfo:0];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_18:

    goto LABEL_19;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_19:
}

id __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  char v4 = [v2 recordTransformer];
  uint64_t v5 = [v3 identifier];

  id v6 = [v4 managedRecordIdentifierForIdentifier:v5];

  return v6;
}

uint64_t __45__AVTCoreDataStoreBackend_saveAvatars_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)nts_saveManagedObjectContext:(id)a3 error:(id *)a4
{
  return [a3 save:a4];
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVTCoreDataStoreBackend *)self setupStoreIfNeeded:a4])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy_;
    uint64_t v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__AVTCoreDataStoreBackend_deleteAvatarWithIdentifier_error___block_invoke;
    v9[3] = &unk_2647C3260;
    void v9[4] = self;
    id v10 = v6;
    uint64_t v11 = &v19;
    uint64_t v12 = &v13;
    [(AVTCoreDataStoreBackend *)self performWorkWithManagedObjectContext:v9];
    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
    if (a4 && !*((unsigned char *)v20 + 24)) {
      *a4 = (id) v14[5];
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __60__AVTCoreDataStoreBackend_deleteAvatarWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a2;
  uint64_t v5 = [v3 fetchRequestWithEntityName:@"Avatar"];
  id v6 = [*(id *)(a1 + 32) recordTransformer];
  BOOL v7 = [v6 managedRecordIdentifierForIdentifier:*(void *)(a1 + 40)];

  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"identifier", v7];
  [v5 setPredicate:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v5];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = [v4 executeRequest:v9 error:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = [v11 result];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 BOOLValue];
}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVTCoreDataStoreBackend *)self setupStoreIfNeeded:a4])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    id v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy_;
    id v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__AVTCoreDataStoreBackend_duplicateAvatarRecord_error___block_invoke;
    v10[3] = &unk_2647C32D0;
    v10[4] = self;
    uint64_t v12 = &v14;
    id v11 = v6;
    uint64_t v13 = &v20;
    [(AVTCoreDataStoreBackend *)self performWorkWithManagedObjectContext:v10];
    BOOL v7 = (void *)v21[5];
    if (v7)
    {
      id v8 = v7;
    }
    else if (a4)
    {
      *a4 = (id) v15[5];
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __55__AVTCoreDataStoreBackend_duplicateAvatarRecord_error___block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  unint64_t v6 = objc_msgSend(v4, "nts_avatarCountWithManagedObjectContext:error:", v3, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 >= +[AVTPAvatarStore maximumNumberOfSavableAvatars])
    {
      uint64_t v23 = +[AVTError errorWithCode:578 userInfo:0];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      BOOL v7 = objc_opt_class();
      id v8 = (void *)MEMORY[0x263F08A98];
      uint64_t v9 = [*(id *)(a1 + 40) orderDate];
      uint64_t v10 = [*(id *)(a1 + 40) orderDate];
      id v11 = [v10 dateByAddingTimeInterval:1.0];
      uint64_t v12 = [v8 predicateWithFormat:@"%K > %@ AND %K < %@", @"orderDate", v9, @"orderDate", v11];
      uint64_t v13 = [v7 cdFetchRequestWithPredicate:v12 fetchLimit:1];

      [v13 setResultType:2];
      v40[0] = @"orderDate";
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
      [v13 setPropertiesToFetch:v14];

      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v38 = *(id *)(v15 + 40);
      uint64_t v16 = [v3 executeFetchRequest:v13 error:&v38];
      objc_storeStrong((id *)(v15 + 40), v38);
      if (v16)
      {
        if ([v16 count])
        {
          uint64_t v17 = [v16 firstObject];
          id v18 = [v17 objectForKeyedSubscript:@"orderDate"];
          id v19 = [*(id *)(a1 + 40) orderDate];
          [v18 timeIntervalSinceDate:v19];
          double v21 = v20;

          double v22 = v21 * 0.5;
        }
        else
        {
          double v22 = 0.5;
        }
        id v27 = [*(id *)(a1 + 40) orderDate];
        uint64_t v26 = [v27 dateByAddingTimeInterval:v22];

        uint64_t v28 = [AVTAvatarRecord alloc];
        v29 = [*(id *)(a1 + 40) avatarData];
        id v30 = (void *)[v29 copy];
        long long v31 = [(AVTAvatarRecord *)v28 initWithAvatarData:v30 orderDate:v26];

        uint64_t v32 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:@"Avatar" inManagedObjectContext:v3];
        char v33 = [*(id *)(a1 + 32) recordTransformer];
        [v33 updateManagedRecord:v32 withRecord:v31];

        uint64_t v34 = *(void **)(a1 + 32);
        uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
        id v37 = *(id *)(v35 + 40);
        int v36 = objc_msgSend(v34, "nts_saveManagedObjectContext:error:", v3, &v37);
        objc_storeStrong((id *)(v35 + 40), v37);
        if (v36) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v31);
        }
      }
      else
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = 0;
      }
    }
  }
}

- (unint64_t)nts_avatarCountWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF260];
  id v6 = a3;
  BOOL v7 = [v5 fetchRequestWithEntityName:@"Avatar"];
  unint64_t v8 = [v6 countForFetchRequest:v7 error:a4];

  return v8;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  if (!-[AVTCoreDataStoreBackend setupStoreIfNeeded:](self, "setupStoreIfNeeded:")) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__AVTCoreDataStoreBackend_canCreateAvatarWithError___block_invoke;
  v8[3] = &unk_2647C32F8;
  void v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  [(AVTCoreDataStoreBackend *)self performWorkWithManagedObjectContext:v8];
  unint64_t v5 = v16[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = 0;
    if (a3) {
      *a3 = (id) v10[5];
    }
  }
  else
  {
    BOOL v6 = v5 < +[AVTPAvatarStore maximumNumberOfSavableAvatars];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __52__AVTCoreDataStoreBackend_canCreateAvatarWithError___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_msgSend(v3, "nts_avatarCountWithManagedObjectContext:error:", a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = v5;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
    && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v6 = +[AVTError errorWithCode:1 userInfo:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)contentDidChangeWithIdentifiers:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(AVTCoreDataStoreBackend *)self backendDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(AVTCoreDataStoreBackend *)self backendDelegate];
    [v6 backend:self didChangeRecordsWithIdentifiers:v7];
  }
}

+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4
{
  return (id)[a1 cdFetchRequestWithPredicate:a3 fetchLimit:a4 ascending:1];
}

+ (id)cdFetchRequestWithPredicate:(id)a3 fetchLimit:(int64_t)a4 ascending:(BOOL)a5
{
  BOOL v5 = a5;
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFF260];
  id v8 = a3;
  uint64_t v9 = [v7 fetchRequestWithEntityName:@"Avatar"];
  [v9 setPredicate:v8];

  [v9 setReturnsObjectsAsFaults:0];
  if (a4) {
    [v9 setFetchLimit:a4];
  }
  uint64_t v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"orderDate" ascending:v5];
  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v9 setSortDescriptors:v11];

  return v9;
}

+ (id)cdFetchRequestForAvatarFetchRequest:(id)a3 recordTransformer:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 criteria];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  switch(v8)
  {
    case 1:
      uint64_t v13 = [v6 identifiers];
      id v14 = [v13 objectAtIndexedSubscript:0];
      uint64_t v15 = [v7 managedRecordIdentifierForIdentifier:v14];

      uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"identifier", v15];

      goto LABEL_13;
    case 2:
      uint64_t v16 = (void *)MEMORY[0x263EFF980];
      uint64_t v17 = [v6 identifiers];
      uint64_t v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = [v6 identifiers];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = [v7 managedRecordIdentifierForIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * i)];
            if (v24) {
              [v18 addObject:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v21);
      }

      uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K in %@", @"identifier", v18];

LABEL_13:
      uint64_t v11 = 0;
      goto LABEL_15;
    case 4:
      goto LABEL_26;
    case 5:
      break;
    case 6:
      uint64_t v25 = (void *)MEMORY[0x263EFF980];
      uint64_t v26 = [v6 identifiers];
      id v27 = objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v28 = [v6 excludingIdentifiers];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v28);
            }
            char v33 = [v7 managedRecordIdentifierForIdentifier:*(void *)(*((void *)&v36 + 1) + 8 * j)];
            if (v33) {
              [v27 addObject:v33];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v30);
      }

      uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K in %@)", @"identifier", v27];

LABEL_26:
      uint64_t v11 = [v6 fetchLimit];
      uint64_t v10 = 1;
      uint64_t v12 = (void *)v9;
      break;
    default:
      uint64_t v11 = 0;
      uint64_t v12 = 0;
LABEL_15:
      uint64_t v10 = 1;
      break;
  }
  uint64_t v34 = [a1 cdFetchRequestWithPredicate:v12 fetchLimit:v11 ascending:v10];

  return v34;
}

+ (BOOL)fetchRequestCriteriaSupported:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) != 3;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->backendDelegate);

  return (AVTStoreBackendDelegate *)WeakRetained;
}

- (void)setBackendDelegate:(id)a3
{
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return self->_recordChangeTracker;
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarManagedRecordTransformer)recordTransformer
{
  return self->_recordTransformer;
}

- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver
{
  return self->_remoteChangesObserver;
}

- (NSString)localProcessName
{
  return self->_localProcessName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProcessName, 0);
  objc_storeStrong((id *)&self->_remoteChangesObserver, 0);
  objc_storeStrong((id *)&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recordChangeTracker, 0);

  objc_destroyWeak((id *)&self->backendDelegate);
}

@end