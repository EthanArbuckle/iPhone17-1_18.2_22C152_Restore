@interface BMBehaviorStorage
+ (NSURL)defaultURL;
- (BMBehaviorDatabaseMetadata)metadata;
- (BMBehaviorStorage)init;
- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4;
- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BMManagedObjectConverter)converter;
- (BOOL)readOnly;
- (NSManagedObjectContext)context;
- (NSPersistentContainer)container;
- (NSURL)URL;
- (id)description;
- (id)fetchRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 limit:(unint64_t)a12 error:(id *)a13;
- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6;
- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 limit:(unint64_t)a6 error:(id *)a7;
- (void)resetStorageWithMetadata:(id)a3 error:(id *)a4;
- (void)saveRules:(id)a3 error:(id *)a4;
- (void)setContainer:(id)a3;
- (void)setContext:(id)a3;
- (void)setConverter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation BMBehaviorStorage

+ (NSURL)defaultURL
{
  return (NSURL *)BMStorageURLForDomain(@"BehaviorMiner");
}

- (BMBehaviorStorage)init
{
  v3 = BMStorageURLForDomain(@"BehaviorMiner");
  v4 = [(BMBehaviorStorage *)self initWithURL:v3 readOnly:0];

  return v4;
}

- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4
{
  return [(BMBehaviorStorage *)self initWithURL:a3 readOnly:a4 error:0];
}

- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v72[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v62.receiver = self;
  v62.super_class = (Class)BMBehaviorStorage;
  v9 = [(BMBehaviorStorage *)&v62 init];
  v10 = v9;
  if (!v9)
  {
LABEL_47:
    v47 = v10;
    goto LABEL_48;
  }
  v9->_readOnly = v6;
  if ([v8 isFileURL])
  {
    v11 = (NSURL *)v8;
    URL = v10->_URL;
    v10->_URL = v11;
  }
  else
  {
    v13 = NSURL;
    URL = [v8 path];
    uint64_t v14 = [v13 fileURLWithPath:URL];
    v15 = v10->_URL;
    v10->_URL = (NSURL *)v14;
  }
  id v16 = v8;
  v17 = BMLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.8();
  }

  if (v6)
  {
    v18 = (const char *)[v16 fileSystemRepresentation];
    if (access(v18, 0))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"File does not exist %s", v18);
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F08320];
      v72[0] = v19;
      v21 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      v22 = [v20 errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:v21];

      v23 = BMLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_21FF33000, v23, OS_LOG_TYPE_DEFAULT, "Can't initialize CoreBehavior storage: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (!access(v18, 4)) {
        goto LABEL_16;
      }
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"No permission to read %s", v18);
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F08320];
      v72[0] = v19;
      v25 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      v22 = [v24 errorWithDomain:*MEMORY[0x263F07F70] code:257 userInfo:v25];

      v23 = BMLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BMBehaviorStorage initWithURL:readOnly:error:].cold.7();
      }
    }

    if (v22)
    {
      id v26 = v22;
LABEL_28:
      v29 = v26;
      v40 = 0;
      id v39 = v26;
      goto LABEL_38;
    }
  }
LABEL_16:
  if (BMLoadBehaviorStoragePersistentContainer_onceToken != -1) {
    dispatch_once(&BMLoadBehaviorStoragePersistentContainer_onceToken, &__block_literal_global_14);
  }
  if (!BMLoadBehaviorStoragePersistentContainer_model)
  {
    v41 = (void *)MEMORY[0x263F087E8];
    v64[0] = *MEMORY[0x263F08320];
    *(void *)&long long buf = @"Error loading BehaviorMiner.momd from BehaviorMiner.framework resources";
    v42 = [NSDictionary dictionaryWithObjects:&buf forKeys:v64 count:1];
    v43 = [v41 errorWithDomain:*MEMORY[0x263F07F70] code:-1100 userInfo:v42];

    id v26 = v43;
    goto LABEL_28;
  }
  v27 = BMLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.6(v27);
  }

  id v28 = objc_alloc(MEMORY[0x263EFF2E8]);
  v29 = (void *)[v28 initWithName:@"BehaviorMiner" managedObjectModel:BMLoadBehaviorStoragePersistentContainer_model];
  v30 = (void *)[objc_alloc(MEMORY[0x263EFF328]) initWithURL:v16];
  [v30 setType:*MEMORY[0x263EFF168]];
  [v30 setReadOnly:v6];
  v70 = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  [v29 setPersistentStoreDescriptions:v31];

  v32 = [v16 path];
  v33 = [v32 stringByDeletingLastPathComponent];

  v34 = BMLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.5();
  }

  v35 = [MEMORY[0x263F08850] defaultManager];
  id v63 = 0;
  [v35 createDirectoryAtPath:v33 withIntermediateDirectories:1 attributes:0 error:&v63];
  id v36 = v63;

  v37 = BMLog();
  v38 = v37;
  if (v36)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[BMBehaviorStorage initWithURL:readOnly:error:].cold.4();
    }

    id v39 = v36;
    v40 = 0;
  }
  else
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[BMBehaviorStorage initWithURL:readOnly:error:](v38);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__2;
    v68 = __Block_byref_object_dispose__2;
    id v69 = 0;
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __BMLoadBehaviorStoragePersistentContainer_block_invoke_206;
    v64[3] = &unk_264546AC8;
    v64[4] = &buf;
    [v29 loadPersistentStoresWithCompletionHandler:v64];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v44 = BMLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[BMBehaviorStorage initWithURL:readOnly:error:]((uint64_t)&buf + 8, v44);
      }

      id v39 = *(id *)(*((void *)&buf + 1) + 40);
      v40 = 0;
    }
    else
    {
      v40 = v29;
      id v39 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
LABEL_38:

  id v45 = v39;
  container = v10->_container;
  v10->_container = v40;

  if (a5) {
    *a5 = v45;
  }
  if (!v45)
  {
    v48 = [(NSPersistentContainer *)v10->_container persistentStoreCoordinator];
    v49 = [v48 persistentStores];
    v50 = [v49 firstObject];

    v51 = [v50 metadata];
    v52 = BMLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[BMBehaviorStorage initWithURL:readOnly:error:]();
    }

    v53 = [[BMBehaviorDatabaseMetadata alloc] initWithDictionary:v51];
    metadata = v10->_metadata;
    v10->_metadata = v53;

    v55 = BMLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = v10->_metadata;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v56;
      _os_log_impl(&dword_21FF33000, v55, OS_LOG_TYPE_INFO, "Initialized behavior storage with metadata %@", (uint8_t *)&buf, 0xCu);
    }

    v57 = objc_alloc_init(BMManagedObjectConverter);
    converter = v10->_converter;
    v10->_converter = v57;

    uint64_t v59 = [(NSPersistentContainer *)v10->_container newBackgroundContext];
    context = v10->_context;
    v10->_context = (NSManagedObjectContext *)v59;

    [(NSManagedObjectContext *)v10->_context setMergePolicy:*MEMORY[0x263EFF060]];
    goto LABEL_47;
  }

  v47 = 0;
LABEL_48:

  return v47;
}

- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6
{
  return [(BMBehaviorStorage *)self fetchRulesWithSupport:a5 confidence:0 filters:a6 limit:a3 error:a4];
}

- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  return [(BMBehaviorStorage *)self fetchRulesWithAbsoluteSupport:0 support:0 confidence:0 conviction:a5 lift:a6 rulePowerFactor:a7 uniqueDaysLastWeek:a3 uniqueDaysTotal:a4 filters:0.0 limit:0.0 error:0.0];
}

- (id)fetchRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 limit:(unint64_t)a12 error:(id *)a13
{
  id v24 = a11;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  id v48 = 0;
  v25 = [(BMBehaviorStorage *)self context];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __157__BMBehaviorStorage_fetchRulesWithAbsoluteSupport_support_confidence_conviction_lift_rulePowerFactor_uniqueDaysLastWeek_uniqueDaysTotal_filters_limit_error___block_invoke;
  v29[3] = &unk_264546A28;
  unint64_t v34 = a12;
  double v35 = a4;
  double v36 = a5;
  id v26 = v24;
  id v30 = v26;
  v31 = self;
  unint64_t v37 = a3;
  double v38 = a6;
  double v39 = a7;
  double v40 = a8;
  unint64_t v41 = a9;
  unint64_t v42 = a10;
  v32 = &v49;
  v33 = &v43;
  [v25 performBlockAndWait:v29];

  if (a13) {
    *a13 = (id) v44[5];
  }
  id v27 = (id)v50[5];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v27;
}

void __157__BMBehaviorStorage_fetchRulesWithAbsoluteSupport_support_confidence_conviction_lift_rulePowerFactor_uniqueDaysLastWeek_uniqueDaysTotal_filters_limit_error___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = +[BMRuleMO fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  [v2 setRelationshipKeyPathsForPrefetching:&unk_26D1C7E68];
  if (*(void *)(a1 + 64))
  {
    objc_msgSend(v2, "setFetchLimit:");
    v3 = (void *)MEMORY[0x263EFF8C0];
    v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"confidence" ascending:0];
    v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"support" ascending:0];
    BOOL v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);

    [v2 setSortDescriptors:v6];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"support >= %f AND confidence >= %f", *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v7 addObject:v8];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v15 = [v14 rulePredicate];

        if (v15)
        {
          id v16 = [v14 rulePredicate];
          [v7 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v11);
  }

  v17 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v7];
  [v2 setPredicate:v17];

  v18 = [*(id *)(a1 + 40) context];
  id v40 = 0;
  v19 = [v18 executeFetchRequest:v2 error:&v40];
  id v20 = v40;

  if (v20) {
    goto LABEL_14;
  }
  unint64_t v37 = NSString;
  v21 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
  v22 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
  v23 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  id v24 = [NSNumber numberWithDouble:*(double *)(a1 + 112)];
  v25 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
  id v26 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 128)];
  double v38 = [v37 stringWithFormat:@"absoluteSupport >= %@ && conviction >= %@ && lift >= %@ && rulePowerFactor >= %@ && uniqueDaysLastWeek >= %@ && uniqueDaysTotal >= %@", v21, v22, v23, v24, v25, v26];

  id v27 = [*(id *)(a1 + 40) converter];
  id v28 = [*(id *)(a1 + 40) metadata];
  id v39 = 0;
  v29 = objc_msgSend(v27, "convertRuleMOs:basketCount:error:", v19, objc_msgSend(v28, "numberOfBaskets"), &v39);
  id v20 = v39;
  id v30 = [MEMORY[0x263F08A98] predicateWithFormat:v38];
  uint64_t v31 = [v29 filteredArrayUsingPredicate:v30];
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
  v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v31;

  if (v20)
  {
LABEL_14:
    uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
    double v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v20;
    id v36 = v20;
  }
}

- (void)saveRules:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v7 = [(BMBehaviorStorage *)self context];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__BMBehaviorStorage_saveRules_error___block_invoke;
  v9[3] = &unk_264546A50;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = &v12;
  [v7 performBlockAndWait:v9];

  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
}

void __37__BMBehaviorStorage_saveRules_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) converter];
  v3 = [*(id *)(a1 + 40) allObjects];
  v4 = [*(id *)(a1 + 32) context];
  id v5 = (id)[v2 insertRules:v3 inManagedObjectContext:v4];

  id v6 = [*(id *)(a1 + 32) context];
  LODWORD(v3) = [v6 hasChanges];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) context];
    id v11 = 0;
    [v7 save:&v11];
    id v8 = v11;

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)resetStorageWithMetadata:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = BMLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21FF33000, v7, OS_LOG_TYPE_INFO, "Resetting behavior storage and applying new metadata %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  id v8 = [(BMBehaviorStorage *)self context];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke;
  v16[3] = &unk_264546A78;
  v16[4] = self;
  v16[5] = &buf;
  [v8 performBlockAndWait:v16];

  uint64_t v9 = [(BMBehaviorStorage *)self context];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke_2;
  v15[3] = &unk_264546AA0;
  v15[4] = self;
  [v9 performBlockAndWait:v15];

  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    id v10 = [(BMBehaviorStorage *)self container];
    id v11 = [v10 persistentStoreCoordinator];
    uint64_t v12 = [v11 persistentStores];
    v13 = [v12 firstObject];

    uint64_t v14 = [v6 dictionaryRepresntation];
    [v13 setMetadata:v14];
    [(BMBehaviorStorage *)self setMetadata:v6];
  }
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);
}

void __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF1D0]);
  v3 = +[BMRuleMO fetchRequest];
  v4 = (void *)[v2 initWithFetchRequest:v3];

  id v5 = [*(id *)(a1 + 32) context];
  id v17 = 0;
  id v6 = (id)[v5 executeRequest:v4 error:&v17];
  id v7 = v17;

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v7;
    id v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF1D0]);
    uint64_t v12 = +[BMItemMO fetchRequest];
    id v10 = (void *)[v11 initWithFetchRequest:v12];

    v13 = [*(id *)(a1 + 32) context];
    id v16 = 0;
    id v14 = (id)[v13 executeRequest:v10 error:&v16];
    id v15 = v16;
    id v9 = v16;

    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v15);
    }
  }
}

void __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) context];
  [v1 reset];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BMBehaviorStorage *)self container];
  id v6 = [v5 debugDescription];
  id v7 = [(BMBehaviorStorage *)self URL];
  uint64_t v8 = [(BMBehaviorStorage *)self metadata];
  id v9 = [v3 stringWithFormat:@"<%@ %p> container: %@, URL: %@, metadata: %@", v4, self, v6, v7, v8];

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BMBehaviorDatabaseMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BMManagedObjectConverter)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:readOnly:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_21FF33000, v0, v1, "Loaded persistent metadata dictionary for behavior storage: %@", v2, v3, v4, v5, v6);
}

- (void)initWithURL:(uint64_t)a1 readOnly:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FF33000, a2, OS_LOG_TYPE_ERROR, "Error loading persistent store %@", (uint8_t *)&v3, 0xCu);
}

- (void)initWithURL:(os_log_t)log readOnly:error:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FF33000, log, OS_LOG_TYPE_DEBUG, "Loading persistent persistent store", v1, 2u);
}

- (void)initWithURL:readOnly:error:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_21FF33000, v0, OS_LOG_TYPE_ERROR, "Error creating directory at path %@, %@", v1, 0x16u);
}

- (void)initWithURL:readOnly:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_21FF33000, v0, v1, "Creating directory for persistent store at path %@", v2, v3, v4, v5, v6);
}

- (void)initWithURL:(os_log_t)log readOnly:error:.cold.6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21FF33000, log, OS_LOG_TYPE_DEBUG, "Creating persistent container and persistent store", v1, 2u);
}

- (void)initWithURL:readOnly:error:.cold.7()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_21FF33000, v0, OS_LOG_TYPE_FAULT, "Error initializing CoreBehavior storage: %@", v1, 0xCu);
}

- (void)initWithURL:readOnly:error:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_21FF33000, v0, v1, "Checking access level for URL %@", v2, v3, v4, v5, v6);
}

@end