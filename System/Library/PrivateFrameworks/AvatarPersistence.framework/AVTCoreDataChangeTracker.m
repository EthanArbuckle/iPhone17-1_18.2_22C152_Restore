@interface AVTCoreDataChangeTracker
+ (id)tokenFileURLForLocation:(id)a3;
- (AVTAvatarManagedRecordTransformer)recordTransformer;
- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 environment:(id)a4;
- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 recordTransformer:(id)a4 environment:(id)a5;
- (AVTCoreDataPersistentStoreConfiguration)configuration;
- (AVTCoreEnvironment)environment;
- (AVTUILogger)logger;
- (BOOL)processChangeTransactionsWithChangeTokenLocation:(id)a3 handler:(id)a4 error:(id *)a5;
- (BOOL)saveToken:(id)a3 location:(id)a4 error:(id *)a5;
- (id)currentHistoryTokenForLocation:(id)a3;
- (id)enumerateChangesAfterToken:(id)a3 managedObjectContext:(id)a4 changesHandler:(id)a5 error:(id *)a6;
- (id)recordIdentifierForChange:(id)a3 managedObjectContext:(id)a4;
- (id)trackerChangesFromPersistentChanges:(id)a3 managedObjectContext:(id)a4;
@end

@implementation AVTCoreDataChangeTracker

- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(AVTAvatarManagedRecordTransformer);
  v9 = [(AVTCoreDataChangeTracker *)self initWithConfiguration:v7 recordTransformer:v8 environment:v6];

  return v9;
}

- (AVTCoreDataChangeTracker)initWithConfiguration:(id)a3 recordTransformer:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTCoreDataChangeTracker;
  v12 = [(AVTCoreDataChangeTracker *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    uint64_t v14 = [v11 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v13->_recordTransformer, a4);
    objc_storeStrong((id *)&v13->_configuration, a3);
  }

  return v13;
}

- (BOOL)processChangeTransactionsWithChangeTokenLocation:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  id v10 = [(AVTCoreDataChangeTracker *)self currentHistoryTokenForLocation:v8];
  id v11 = [(AVTCoreDataChangeTracker *)self configuration];
  v12 = [v11 createManagedObjectContext];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke;
  v25[3] = &unk_2647C4090;
  v30 = &v45;
  id v13 = v12;
  v31 = &v33;
  v32 = &v39;
  id v26 = v13;
  v27 = self;
  id v14 = v10;
  id v28 = v14;
  id v15 = v9;
  id v29 = v15;
  [v13 performBlockAndWait:v25];
  if (!*((unsigned char *)v46 + 24))
  {
    if (a5)
    {
      BOOL v19 = 0;
      *a5 = (id) v34[5];
      goto LABEL_11;
    }
LABEL_10:
    BOOL v19 = 0;
    goto LABEL_11;
  }
  id v16 = (id)v40[5];
  if (v16 != v14)
  {
    objc_super v17 = (id *)(v34 + 5);
    id obj = (id)v34[5];
    BOOL v18 = [(AVTCoreDataChangeTracker *)self saveToken:v16 location:v8 error:&obj];
    objc_storeStrong(v17, obj);
    *((unsigned char *)v46 + 24) = v18;
    if (!v18)
    {
      if (a5) {
        *a5 = (id) v34[5];
      }
      v20 = [(AVTCoreDataChangeTracker *)self logger];
      v21 = [(id)v34[5] description];
      v22 = [v8 path];
      [v20 logErrorSavingChangeToken:v21 location:v22];

      goto LABEL_10;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v19;
}

void __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  id v16 = *(id *)(v4 + 40);
  LOBYTE(v2) = [v2 setQueryGenerationFromToken:v3 error:&v16];
  objc_storeStrong((id *)(v4 + 40), v16);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v2;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke_2;
    v13[3] = &unk_2647C4068;
    v13[4] = v6;
    id v14 = v7;
    id v15 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v8 + 40);
    uint64_t v9 = [v6 enumerateChangesAfterToken:v5 managedObjectContext:v14 changesHandler:v13 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                           + 40) == 0;
  }
}

uint64_t __91__AVTCoreDataChangeTracker_processChangeTransactionsWithChangeTokenLocation_handler_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) trackerChangesFromPersistentChanges:a2 managedObjectContext:*(void *)(a1 + 40)];
  if ([v3 count])
  {
    uint64_t v4 = [*(id *)(a1 + 32) logger];
    uint64_t v5 = [v3 description];
    uint64_t v6 = [v3 count];
    id v7 = [*(id *)(a1 + 32) description];
    [v4 logTrackerProcessingChanges:v5 count:v6 from:v7];

    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)trackerChangesFromPersistentChanges:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v18 = a4;
  objc_super v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((*((BOOL (**)(uint64_t, void *))AVTIsPersistentChangeOfInterest + 2))((uint64_t)AVTIsPersistentChangeOfInterest, v12))
        {
          id v13 = [(AVTCoreDataChangeTracker *)self recordIdentifierForChange:v12 managedObjectContext:v18];
          if (v13)
          {
            id v14 = -[AVTCoreDataChangeTrackerChange initWithRecordIdentifier:changeType:]([AVTCoreDataChangeTrackerChange alloc], "initWithRecordIdentifier:changeType:", v13, +[AVTCoreDataChangeTrackerChange trackerChangeTypeFromPersistentChangeType:](AVTCoreDataChangeTrackerChange, "trackerChangeTypeFromPersistentChangeType:", [v12 changeType]));
            [v17 addObject:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v15 = (void *)[v17 copy];

  return v15;
}

+ (id)tokenFileURLForLocation:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"currentHistoryToken"];
}

- (id)currentHistoryTokenForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() tokenFileURLForLocation:v4];

  id v6 = objc_alloc_init(MEMORY[0x263F08850]);
  id v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v24 = 0;
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:0 error:&v24];
    id v10 = v24;
    if (v9)
    {
      id v23 = v10;
      id v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v23];
      id v12 = v23;

      if (v11)
      {
        id v11 = v11;
        id v10 = v12;
        id v13 = v11;
      }
      else
      {
        long long v19 = [(AVTCoreDataChangeTracker *)self environment];
        long long v20 = [v19 logger];
        long long v21 = [v12 description];
        [v20 logErrorReadingCurrentHistoryToken:v21];

        id v10 = v12;
        id v13 = 0;
      }
    }
    else
    {
      id v11 = [(AVTCoreDataChangeTracker *)self environment];
      objc_super v17 = [v11 logger];
      id v18 = [v10 description];
      [v17 logErrorReadingCurrentHistoryToken:v18];

      id v13 = 0;
    }
  }
  else
  {
    id v14 = [(AVTCoreDataChangeTracker *)self environment];
    id v15 = [v14 logger];
    id v16 = [v5 path];
    [v15 logCurrentHistoryTokenFileDoesntExist:v16];

    id v13 = 0;
  }

  return v13;
}

- (BOOL)saveToken:(id)a3 location:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__5;
    id v23 = __Block_byref_object_dispose__5;
    id v24 = 0;
    id v10 = [(AVTCoreDataChangeTracker *)self logger];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__AVTCoreDataChangeTracker_saveToken_location_error___block_invoke;
    v13[3] = &unk_2647C40B8;
    id v14 = v9;
    objc_super v17 = &v25;
    id v18 = &v19;
    id v15 = v8;
    id v16 = self;
    [v10 savingChangeTrackerToken:v13];

    BOOL v11 = *((unsigned char *)v26 + 24) != 0;
    if (a5 && !*((unsigned char *)v26 + 24)) {
      *a5 = (id) v20[5];
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else if (a5)
  {
    +[AVTError errorWithCode:730 userInfo:0];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __53__AVTCoreDataChangeTracker_saveToken_location_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08850]);
  v3 = [*(id *)(a1 + 32) path];
  char v4 = [v2 fileExistsAtPath:v3];

  if ((v4 & 1) != 0
    || (uint64_t v5 = *(void *)(a1 + 32),
        uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8),
        id obj = *(id *)(v6 + 40),
        char v7 = [v2 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&obj],
        objc_storeStrong((id *)(v6 + 40), obj),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7) != 0))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(id *)(v9 + 40);
    id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v15];
    objc_storeStrong((id *)(v9 + 40), v15);
    if (v10)
    {
      BOOL v11 = [(id)objc_opt_class() tokenFileURLForLocation:*(void *)(a1 + 32)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v14 = *(id *)(v12 + 40);
      char v13 = [v10 writeToURL:v11 options:1 error:&v14];
      objc_storeStrong((id *)(v12 + 40), v14);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
}

- (id)enumerateChangesAfterToken:(id)a3 managedObjectContext:(id)a4 changesHandler:(id)a5 error:(id *)a6
{
  v44[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = (uint64_t (**)(id, void *))a5;
  uint64_t v12 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v9];
  [v12 setResultType:5];
  id v41 = 0;
  char v13 = [v10 executeRequest:v12 error:&v41];
  id v14 = v41;
  id v15 = v14;
  if (v13)
  {
    id v32 = v14;
    uint64_t v33 = v13;
    v34 = v12;
    id v35 = v10;
    id v16 = [v13 result];
    id v17 = v9;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (!v19) {
      goto LABEL_15;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v24 = [v23 token];

        uint64_t v25 = [v23 changes];
        id v26 = v25;
        if (v24)
        {
          int v27 = v11[2](v11, v25);

          if (!v27) {
            goto LABEL_15;
          }
          [v23 token];
          char v28 = v17;
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v29 = [v25 count];

          if (!v29) {
            continue;
          }
          char v28 = [(AVTCoreDataChangeTracker *)self logger];
          [v28 logTransactionHasChangesButNoToken];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (!v20)
      {
LABEL_15:

        id v10 = v35;
        char v13 = v33;
        uint64_t v12 = v34;
        id v15 = v32;
        goto LABEL_21;
      }
    }
  }
  if (v14)
  {
    if (a6)
    {
LABEL_18:
      id v15 = v15;
      id v17 = 0;
      *a6 = v15;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v43 = *MEMORY[0x263F08338];
    v44[0] = @"Got a nil NSPersistentHistoryResult, but no error filled in";
    v30 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    id v15 = +[AVTError errorWithCode:1 userInfo:v30];

    if (a6) {
      goto LABEL_18;
    }
  }
  id v17 = 0;
LABEL_21:

  return v17;
}

- (id)recordIdentifierForChange:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 changeType] == 2)
  {
    uint64_t v8 = [v6 tombstone];
    [v8 objectForKeyedSubscript:@"identifier"];
  }
  else
  {
    id v9 = [v6 changedObjectID];
    uint64_t v8 = [v7 objectWithID:v9];

    [v8 identifier];
  id v10 = };

  BOOL v11 = [(AVTCoreDataChangeTracker *)self logger];
  if (v10)
  {
    uint64_t v12 = [v10 UUIDString];
    uint64_t v13 = [v6 changeType];
    id v14 = [v6 changedObjectID];
    id v15 = [v14 URIRepresentation];
    id v16 = [v15 description];
    [v11 logFoundRecordIdentifier:v12 changeType:v13 managedObjectID:v16];

    BOOL v11 = [(AVTCoreDataChangeTracker *)self recordTransformer];
    id v17 = [v11 identifierForManagedRecordIdentifier:v10];
  }
  else
  {
    uint64_t v18 = [v6 changeType];
    uint64_t v19 = [v6 changedObjectID];
    uint64_t v20 = [v19 URIRepresentation];
    uint64_t v21 = [v20 description];
    [v11 logCouldntFindRecordIdentifierForChangeType:v18 managedObjectID:v21];

    id v17 = 0;
  }

  return v17;
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarManagedRecordTransformer)recordTransformer
{
  return self->_recordTransformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end