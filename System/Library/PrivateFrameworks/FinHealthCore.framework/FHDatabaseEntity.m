@interface FHDatabaseEntity
- (BOOL)clearData;
- (BOOL)clearDataWithClauseBuilder:(id)a3;
- (BOOL)clearDataWithEntity:(id)a3;
- (FHDatabaseEntity)initWithEntity:(id)a3;
- (FHDatabaseEntity)initWithEntity:(id)a3 databaseManager:(id)a4;
- (FHDatabaseEntity)initWithFullJoinKey:(id)a3 entities:(id)a4;
- (FHDatabaseEntity)initWithJoinKey:(id)a3 entities:(id)a4;
- (FHDatabaseEntity)initWithLeftJoinKey:(id)a3 entities:(id)a4;
- (FHDatabaseEntity)initWithRightJoinKey:(id)a3 entities:(id)a4;
- (FHDatabaseManager)databaseManagerStrong;
- (FHDatabaseManager)databaseManagerWeak;
- (NSArray)entities;
- (NSArray)fieldsInOrder;
- (NSArray)virtualEntities;
- (NSDictionary)scalarFunctions;
- (NSDictionary)windowFunctions;
- (NSString)joinType;
- (NSString)multiEntityJoinQuery;
- (id)_availableFunctions:(int64_t)a3 functionTypeFilter:(id)a4;
- (id)_getDatabaseManager;
- (id)_initWithJoinKey:(id)a3 joinType:(id)a4 databaseManager:(id)a5 entities:(id)a6;
- (void)insertOrUpdate:(id)a3 upsert:(BOOL)a4;
- (void)insertOrUpdateWithEntity:(id)a3 fieldValuePairsFromBuilder:(id)a4 upsert:(BOOL)a5;
- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 limit:(unint64_t)a5 selectFields:(id)a6 orderby:(id)a7 usingBlock:(id)a8;
- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 selectFields:(id)a5 usingBlock:(id)a6;
- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 usingBlock:(id)a5;
- (void)setDatabaseManagerStrong:(id)a3;
- (void)setDatabaseManagerWeak:(id)a3;
- (void)setEntities:(id)a3;
- (void)setJoinType:(id)a3;
- (void)setMultiEntityJoinQuery:(id)a3;
- (void)setScalarFunctions:(id)a3;
- (void)setVirtualEntities:(id)a3;
- (void)setWindowFunctions:(id)a3;
- (void)streamDataWithEntity:(id)a3 recordStreamHandler:(id)a4;
@end

@implementation FHDatabaseEntity

- (id)_getDatabaseManager
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManagerWeak);
  v4 = WeakRetained;
  if (!WeakRetained) {
    WeakRetained = self->_databaseManagerStrong;
  }
  id v5 = WeakRetained;

  return v5;
}

- (FHDatabaseEntity)initWithEntity:(id)a3
{
  return -[FHDatabaseEntity initWithJoinKey:entities:](self, "initWithJoinKey:entities:", 0, a3, 0);
}

- (FHDatabaseEntity)initWithJoinKey:(id)a3 entities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = v8;
  if (v7)
  {
    [v8 addObject:v7];
    v18 = (id *)&v20;
    id v10 = v19;
    if (v10)
    {
      v11 = v10;
      do
      {
        v12 = [v11 stringValue];
        [v9 addObject:v12];

        v13 = v18++;
        id v14 = *v13;

        v11 = v14;
      }
      while (v14);
    }
  }
  v15 = (void *)[v9 copy];
  v16 = [(FHDatabaseEntity *)self _initWithJoinKey:v6 joinType:@"inner" databaseManager:0 entities:v15];

  return v16;
}

- (FHDatabaseEntity)initWithLeftJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)[(FHDatabaseEntity *)self _initWithJoinKey:a3 joinType:@"left" databaseManager:0 entities:a4];
}

- (FHDatabaseEntity)initWithRightJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)[(FHDatabaseEntity *)self _initWithJoinKey:a3 joinType:@"right" databaseManager:0 entities:a4];
}

- (FHDatabaseEntity)initWithFullJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)[(FHDatabaseEntity *)self _initWithJoinKey:a3 joinType:@"full" databaseManager:0 entities:a4];
}

- (FHDatabaseEntity)initWithEntity:(id)a3 databaseManager:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = [(FHDatabaseEntity *)self _initWithJoinKey:0, @"inner", v7, v9, v12, v13 joinType databaseManager entities];
  return v10;
}

- (id)_initWithJoinKey:(id)a3 joinType:(id)a4 databaseManager:(id)a5 entities:(id)a6
{
  id v38 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v57.receiver = self;
  v57.super_class = (Class)FHDatabaseEntity;
  uint64_t v13 = [(FHDatabaseEntity *)&v57 init];
  id v14 = v13;
  if (v13)
  {
    if (v11)
    {
      objc_storeWeak((id *)&v13->_databaseManagerWeak, v11);
    }
    else
    {
      v15 = [[FHDatabaseManager alloc] init:0];
      databaseManagerStrong = v14->_databaseManagerStrong;
      v14->_databaseManagerStrong = v15;
    }
    objc_storeStrong((id *)&v14->_joinType, a4);
    uint64_t v17 = [(FHDatabaseEntity *)v14 _availableFunctions:2 functionTypeFilter:@"s"];
    scalarFunctions = v14->_scalarFunctions;
    v14->_scalarFunctions = (NSDictionary *)v17;

    uint64_t v19 = [(FHDatabaseEntity *)v14 _availableFunctions:2 functionTypeFilter:@"w"];
    windowFunctions = v14->_windowFunctions;
    v14->_windowFunctions = (NSDictionary *)v19;

    p_entities = (id *)&v14->_entities;
    objc_storeStrong((id *)&v14->_entities, a6);
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__1;
    v55 = __Block_byref_object_dispose__1;
    id v56 = (id)objc_opt_new();
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__1;
    v49 = __Block_byref_object_dispose__1;
    id v50 = (id)objc_opt_new();
    id v22 = objc_alloc_init(MEMORY[0x263F089D8]);
    [v22 appendString:@"select * from"];
    id v35 = v12;
    id v36 = v11;
    id v37 = v10;
    v23 = [(NSArray *)v14->_entities firstObject];
    for (unint64_t i = 0; i < [*p_entities count]; ++i)
    {
      v25 = [*p_entities objectAtIndex:i];
      if (i)
      {
        v26 = [NSString stringWithFormat:@" %@ join ", v14->_joinType];
        [v22 appendString:v26];

        [v22 appendString:v25];
        [v22 appendFormat:@" on %@.%@ == %@.%@", v23, v38, v25, v38];
      }
      else
      {
        [v22 appendString:@" "];
        [v22 appendString:v23];
      }
      v27 = [NSString stringWithFormat:@"PRAGMA TABLE_XINFO(%@);", v25];
      objc_initWeak(&location, v14);
      v28 = [(FHDatabaseEntity *)v14 _getDatabaseManager];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __71__FHDatabaseEntity__initWithJoinKey_joinType_databaseManager_entities___block_invoke;
      v39[3] = &unk_265314F48;
      objc_copyWeak(&v43, &location);
      id v29 = v25;
      id v40 = v29;
      v41 = &v51;
      v42 = &v45;
      [v28 streamQueryResults:v27 usingFetchHandler:v39];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    objc_storeStrong((id *)&v14->_virtualEntities, (id)v46[5]);
    uint64_t v30 = [v22 copy];
    multiEntityJoinQuery = v14->_multiEntityJoinQuery;
    v14->_multiEntityJoinQuery = (NSString *)v30;

    uint64_t v32 = [(id)v52[5] copy];
    fieldsIndex = v14->_fieldsIndex;
    v14->_fieldsIndex = (NSArray *)v32;

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);

    id v11 = v36;
    id v10 = v37;
    id v12 = v35;
  }

  return v14;
}

void __71__FHDatabaseEntity__initWithJoinKey_joinType_databaseManager_entities___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = NSString;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v14 objectAtIndex:1];
    id v7 = [v6 stringValue];
    id v8 = [v4 stringWithFormat:@"%@.%@", v5, v7];

    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = [v8 lowercaseString];
    [v9 addObject:v10];

    if ([v14 intAtIndex:6])
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v14 objectAtIndex:1];
      uint64_t v13 = [v12 stringValue];
      LODWORD(v11) = [v11 isEqualToString:v13];

      if (v11) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)streamDataWithEntity:(id)a3 recordStreamHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"%@ %@;", @"select * from", v6];
  objc_initWeak(&location, self);
  v9 = objc_opt_new();
  id v10 = [(FHDatabaseEntity *)self _getDatabaseManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__FHDatabaseEntity_streamDataWithEntity_recordStreamHandler___block_invoke;
  v13[3] = &unk_265314F70;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 streamQueryResults:v8 usingFetchHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __61__FHDatabaseEntity_streamDataWithEntity_recordStreamHandler___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v10 count])
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = [WeakRetained[1] objectAtIndex:v4];
        id v6 = *(void **)(a1 + 32);
        id v7 = [v10 objectAtIndex:v4];
        [v6 setObject:v7 forKey:v5];

        ++v4;
      }
      while (v4 < [v10 count]);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    [*(id *)(a1 + 32) removeAllObjects];
  }
}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 limit:(unint64_t)a5 selectFields:(id)a6 orderby:(id)a7 usingBlock:(id)a8
{
  v113[1] = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v74 = a4;
  id v76 = a6;
  id v79 = a7;
  v75 = (void (**)(id, void, void *, uint64_t))a8;
  v83 = [MEMORY[0x263EFF980] array];
  if (v76)
  {
    fieldsIndex = self->_fieldsIndex;
    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke;
    v99[3] = &unk_265314F98;
    id v13 = v76;
    id v100 = v13;
    v77 = [(NSArray *)fieldsIndex indexesOfObjectsPassingTest:v99];
    uint64_t v14 = [v77 count];
    if (v14 != [v13 count])
    {
      id v15 = (void *)MEMORY[0x263F087E8];
      v112 = @"One or more invalid selectFields";
      v113[0] = v13;
      id v16 = [NSDictionary dictionaryWithObjects:v113 forKeys:&v112 count:1];
      uint64_t v17 = [v15 errorWithDomain:@"com.apple.FinHealth.Framework" code:10016 userInfo:v16];
      [v83 addObject:v17];

      v18 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v77;
        _os_log_impl(&dword_24E029000, v18, OS_LOG_TYPE_DEBUG, "Invalid select fields: available fields=%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    v77 = 0;
  }
  if (v79)
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v19 = v79;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v96 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          v24 = [v23 featureLabel];
          if (![(NSArray *)self->_fieldsIndex containsObject:v24])
          {
            v25 = (void *)MEMORY[0x263F087E8];
            v109 = @"One or more invalid order by fields";
            id v110 = v19;
            v26 = [NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            v27 = [v25 errorWithDomain:@"com.apple.FinHealth.Framework" code:10016 userInfo:v26];
            [v83 addObject:v27];
          }
          v28 = [v23 featureRank];
          uint64_t v29 = [v28 integerValue];

          if (!v29)
          {
            uint64_t v30 = (void *)MEMORY[0x263F087E8];
            v107 = @"One or more invalid orderings (NSOrderedSame)";
            id v108 = v19;
            v31 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
            uint64_t v32 = [v30 errorWithDomain:@"com.apple.FinHealth.Framework" code:10016 userInfo:v31];
            [v83 addObject:v32];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v95 objects:v111 count:16];
      }
      while (v20);
    }
  }
  id v80 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (v78)
  {
    v33 = [v78 clausesAndOperatorsInOrder];
    if ([v33 count])
    {
      for (unint64_t j = 0; j < [v33 count]; ++j)
      {
        id v35 = [v33 objectAtIndex:j];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v36 = [v35 comparisonOperator];
          BOOL v37 = v36 == @"MATCH";

          if (v37)
          {
            v41 = [v35 fieldName];
            id v40 = [v41 componentsSeparatedByString:@"."];

            v42 = [v40 stringAtIndex:0];
            if (![(NSArray *)self->_virtualEntities containsObject:v42]) {
              goto LABEL_31;
            }
            id v43 = self->_fieldsIndex;
            v44 = [v35 fieldName];
            if ([(NSArray *)v43 containsObject:v44])
            {
LABEL_32:
            }
            else
            {
              entities = self->_entities;
              v46 = [v35 fieldName];
              LOBYTE(entities) = [(NSArray *)entities containsObject:v46];

              if ((entities & 1) == 0)
              {
LABEL_31:
                v44 = [v35 shortDescription];
                [v80 appendFormat:@"clause: %@,", v44];
                goto LABEL_32;
              }
            }

            goto LABEL_34;
          }
          id v38 = self->_fieldsIndex;
          v39 = [v35 fieldName];
          LOBYTE(v38) = [(NSArray *)v38 containsObject:v39];

          if ((v38 & 1) == 0)
          {
            id v40 = [v35 shortDescription];
            [v80 appendFormat:@"clause: %@,", v40];
LABEL_34:
          }
        }
      }
    }
    if ([v80 length])
    {
      uint64_t v47 = (void *)MEMORY[0x263F087E8];
      v105 = @"Invalid clauses";
      id v106 = v80;
      v48 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      v49 = [v47 errorWithDomain:@"com.apple.FinHealth.Framework" code:10016 userInfo:v48];
      [v83 addObject:v49];

      id v50 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v80;
        _os_log_impl(&dword_24E029000, v50, OS_LOG_TYPE_DEBUG, "Invalid clauses: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if ([v83 count])
  {
    v75[2](v75, 0, v83, 1);
  }
  else
  {
    v73 = [v78 expressionFromClausesAndOperators];
    if (v79)
    {
      id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v51 addObject:@" ORDER BY "];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      obunint64_t j = v79;
      uint64_t v52 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
      if (v52)
      {
        int v53 = 0;
        uint64_t v54 = *(void *)v92;
        do
        {
          uint64_t v55 = 0;
          int v81 = v53;
          int v56 = -v53;
          do
          {
            if (*(void *)v92 != v54) {
              objc_enumerationMutation(obj);
            }
            objc_super v57 = *(void **)(*((void *)&v91 + 1) + 8 * v55);
            v58 = [v57 featureLabel];
            v59 = [v57 featureRank];
            uint64_t v60 = [v59 integerValue];

            if (v56 != v55) {
              [v51 addObject:@", "];
            }
            [v51 addObject:v58];
            if (v60 == -1) {
              v61 = @" ASC";
            }
            else {
              v61 = @" DESC";
            }
            [v51 addObject:v61];

            ++v55;
          }
          while (v52 != v55);
          uint64_t v62 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
          int v53 = v81 + v52;
          uint64_t v52 = v62;
        }
        while (v62);
      }

      v63 = NSString;
      v64 = [v51 componentsJoinedByString:&stru_27001CD40];
      v65 = [v63 stringWithFormat:@"%@", v64];

      uint64_t v66 = [v73 stringByAppendingString:v65];

      v73 = (void *)v66;
    }
    if (v78)
    {
      v67 = [v78 clausesAndOperatorsInOrder];
      if ([v67 count])
      {
        v68 = [NSString stringWithFormat:@"%@ WHERE %@;", self->_multiEntityJoinQuery, v73];
      }
      else
      {
        v68 = self->_multiEntityJoinQuery;
      }
      v69 = v68;
    }
    else
    {
      v69 = self->_multiEntityJoinQuery;
    }
    v70 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v69;
      _os_log_impl(&dword_24E029000, v70, OS_LOG_TYPE_DEBUG, "clausesFromBuilder - sql: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_initWeak(&location, self);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v102 = 0x2020000000;
    uint64_t v103 = 0;
    v71 = [(FHDatabaseEntity *)self _getDatabaseManager];
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke_164;
    v85[3] = &unk_265314FC0;
    p_long long buf = &buf;
    v89[1] = (id)a5;
    objc_copyWeak(v89, &location);
    id v86 = v77;
    v87 = v75;
    [v71 streamQueryResults:v69 usingFetchHandler:v85];

    objc_destroyWeak(v89);
    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);
  }
}

uint64_t __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke_164(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != *(void *)(a1 + 64))
  {
    id v9 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (v9 && WeakRetained)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      if (v5)
      {
        uint64_t v7 = objc_msgSend(v9, "objectsAtIndexes:");
      }
      else
      {
        uint64_t v7 = [v9 copy];
      }
      uint64_t v8 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t, void, void))(v6 + 16))(v6, v7, 0, 0);
    }
    id v3 = v9;
  }
}

- (BOOL)clearDataWithClauseBuilder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (!v4) {
    goto LABEL_18;
  }
  uint64_t v6 = [v4 clausesAndOperatorsInOrder];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v6 objectAtIndex:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        fieldsIndex = self->_fieldsIndex;
        id v10 = [v8 fieldName];
        LOBYTE(fieldsIndex) = [(NSArray *)fieldsIndex containsObject:v10];

        if ((fieldsIndex & 1) == 0)
        {
          id v11 = [v8 shortDescription];
          [v5 appendFormat:@"clause: %@,", v11];
        }
      }

      ++v7;
    }
    while (v7 < [v6 count]);
  }
  if (![v5 length])
  {
    if ([(NSArray *)self->_entities count] == 1)
    {
      uint64_t v14 = NSString;
      id v15 = [(NSArray *)self->_entities firstObject];
      id v16 = [v4 expressionFromClausesAndOperators];
      id v12 = [v14 stringWithFormat:@"%@ %@ WHERE (%@);", @"delete from", v15, v16];

      uint64_t v17 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v21 = v12;
        _os_log_impl(&dword_24E029000, v17, OS_LOG_TYPE_DEBUG, "clausesFromBuilder - sql: %@", buf, 0xCu);
      }

      v18 = [(FHDatabaseEntity *)self _getDatabaseManager];
      char v13 = [v18 deleteWithSQL:v12];

      goto LABEL_16;
    }

LABEL_18:
    char v13 = 0;
    goto LABEL_19;
  }
  id v12 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = v5;
    _os_log_impl(&dword_24E029000, v12, OS_LOG_TYPE_ERROR, "Invalid clauses: %@", buf, 0xCu);
  }
  char v13 = 0;
LABEL_16:

LABEL_19:
  return v13;
}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 selectFields:(id)a5 usingBlock:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__FHDatabaseEntity_queryDataWithBlock_logicalOperator_selectFields_usingBlock___block_invoke;
  v12[3] = &unk_265314FE8;
  id v13 = v10;
  id v11 = v10;
  [(FHDatabaseEntity *)self queryDataWithBlock:a3 logicalOperator:a4 limit:-1 selectFields:a5 orderby:0 usingBlock:v12];
}

uint64_t __79__FHDatabaseEntity_queryDataWithBlock_logicalOperator_selectFields_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__FHDatabaseEntity_queryDataWithBlock_logicalOperator_usingBlock___block_invoke;
  v10[3] = &unk_265314FE8;
  id v11 = v8;
  id v9 = v8;
  [(FHDatabaseEntity *)self queryDataWithBlock:a3 logicalOperator:a4 limit:-1 selectFields:0 orderby:0 usingBlock:v10];
}

uint64_t __66__FHDatabaseEntity_queryDataWithBlock_logicalOperator_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertOrUpdate:(id)a3 upsert:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(NSArray *)self->_entities count] == 1)
  {
    unint64_t v7 = [(NSArray *)self->_entities firstObject];
    [(FHDatabaseEntity *)self insertOrUpdateWithEntity:v7 fieldValuePairsFromBuilder:v6 upsert:v4];
  }
  else
  {
    id v8 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v9 = [(NSArray *)self->_entities count];
      int v10 = 134217984;
      NSUInteger v11 = v9;
      _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_ERROR, "Operation insertOrUpdate not supported, [_entities count] = %lu", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)clearData
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_entities count] == 1)
  {
    id v3 = [(NSArray *)self->_entities firstObject];
    BOOL v4 = [(FHDatabaseEntity *)self clearDataWithEntity:v3];

    return v4;
  }
  else
  {
    id v6 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v7 = [(NSArray *)self->_entities count];
      int v8 = 134217984;
      NSUInteger v9 = v7;
      _os_log_impl(&dword_24E029000, v6, OS_LOG_TYPE_ERROR, "clearDataWithEntity insertOrUpdate not supported, [_entities count] = %lu", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (void)insertOrUpdateWithEntity:(id)a3 fieldValuePairsFromBuilder:(id)a4 upsert:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v8 = a4;
  NSUInteger v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  NSUInteger v11 = objc_opt_new();
  if (v8)
  {
    uint64_t v12 = [v8 fieldValuePairList];

    if (v12)
    {
      BOOL v36 = v5;
      id v37 = v8;
      id v13 = [v8 fieldValuePairList];
      if ([v13 count] == 1)
      {
LABEL_7:
        id v15 = [v13 lastObject];
        fieldsIndex = self->_fieldsIndex;
        v23 = [v15 fieldName];
        LODWORD(fieldsIndex) = [(NSArray *)fieldsIndex containsObject:v23];

        if (fieldsIndex)
        {
          v24 = [v15 fieldName];
          v25 = objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v38, "length") + 1);

          v26 = [v25 lowercaseString];
          [v9 appendString:v26];

          [v10 appendString:@"?"];
          v27 = [v15 fieldValue];
          [v11 addObject:v27];

          v28 = NSString;
          if (v36) {
            uint64_t v29 = @"insert or replace into";
          }
          else {
            uint64_t v29 = @"insert into";
          }
          uint64_t v30 = (void *)[v9 copy];
          v31 = (void *)[v10 copy];
          uint64_t v32 = [v28 stringWithFormat:@"%@ %@ (%@) values (%@)", v29, v38, v30, v31];

          v33 = [(FHDatabaseEntity *)self _getDatabaseManager];
          v34 = (void *)[v11 copy];
          [v33 executeAsPreparedStatement:v32 values:v34];

          goto LABEL_18;
        }
        id v35 = FinHealthLogObject(@"FinHealthCore");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
LABEL_17:

LABEL_18:
          id v8 = v37;

          goto LABEL_19;
        }
        *(_DWORD *)long long buf = 138412290;
        id v40 = v15;
      }
      else
      {
        uint64_t v14 = 0;
        while (1)
        {
          id v15 = [v13 objectAtIndex:v14];
          id v16 = self->_fieldsIndex;
          uint64_t v17 = [v15 fieldName];
          LOBYTE(v16) = [(NSArray *)v16 containsObject:v17];

          if ((v16 & 1) == 0) {
            break;
          }
          v18 = [v15 fieldName];
          id v19 = objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v38, "length") + 1);

          uint64_t v20 = [v19 lowercaseString];
          [v9 appendString:v20];

          [v10 appendString:@"?"];
          [v9 appendString:@", "];
          [v10 appendString:@", "];
          uint64_t v21 = [v15 fieldValue];
          [v11 addObject:v21];

          if (++v14 >= (unint64_t)([v13 count] - 1)) {
            goto LABEL_7;
          }
        }
        id v35 = FinHealthLogObject(@"FinHealthCore");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        *(_DWORD *)long long buf = 138412290;
        id v40 = v15;
      }
      _os_log_impl(&dword_24E029000, v35, OS_LOG_TYPE_DEBUG, "Invalid fieldValuePair: %@", buf, 0xCu);
      goto LABEL_17;
    }
  }
LABEL_19:
}

- (BOOL)clearDataWithEntity:(id)a3
{
  BOOL v4 = [NSString stringWithFormat:@"%@ %@", @"delete from", a3];
  BOOL v5 = [(FHDatabaseEntity *)self _getDatabaseManager];
  char v6 = [v5 deleteWithSQL:v4];

  return v6;
}

- (id)_availableFunctions:(int64_t)a3 functionTypeFilter:(id)a4
{
  id v5 = a4;
  char v6 = [NSString stringWithFormat:@"PRAGMA function_list;"];
  NSUInteger v7 = objc_opt_new();
  objc_initWeak(&location, self);
  id v8 = [(FHDatabaseEntity *)self _getDatabaseManager];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __59__FHDatabaseEntity__availableFunctions_functionTypeFilter___block_invoke;
  id v16 = &unk_265315010;
  objc_copyWeak(&v19, &location);
  id v9 = v5;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  [v8 streamQueryResults:v6 usingFetchHandler:&v13];

  NSUInteger v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

void __59__FHDatabaseEntity__availableFunctions_functionTypeFilter___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = [v3 objectAtIndex:0];
    char v6 = [v5 stringValue];

    NSUInteger v7 = [v3 objectAtIndex:2];
    id v8 = [v7 stringValue];

    id v9 = [v3 objectAtIndex:4];
    int v10 = [v9 intValue];

    if (v8)
    {
      NSUInteger v11 = *(void **)(a1 + 32);
      if (v11)
      {
        if ([v11 isEqualToString:v8])
        {
          uint64_t v12 = [*(id *)(a1 + 40) objectForKey:v6];
          uint64_t v13 = [NSNumber numberWithInteger:v10];
          uint64_t v14 = (void *)v13;
          if (v12)
          {
            v18[0] = v13;
            id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
            id v16 = [v15 arrayByAddingObjectsFromArray:v12];
          }
          else
          {
            uint64_t v17 = v13;
            id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
          }

          [*(id *)(a1 + 40) setObject:v16 forKey:v6];
        }
      }
    }
  }
}

- (NSArray)fieldsInOrder
{
  return self->_fieldsIndex;
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (FHDatabaseManager)databaseManagerWeak
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManagerWeak);
  return (FHDatabaseManager *)WeakRetained;
}

- (void)setDatabaseManagerWeak:(id)a3
{
}

- (FHDatabaseManager)databaseManagerStrong
{
  return self->_databaseManagerStrong;
}

- (void)setDatabaseManagerStrong:(id)a3
{
}

- (NSDictionary)scalarFunctions
{
  return self->_scalarFunctions;
}

- (void)setScalarFunctions:(id)a3
{
}

- (NSDictionary)windowFunctions
{
  return self->_windowFunctions;
}

- (void)setWindowFunctions:(id)a3
{
}

- (NSString)multiEntityJoinQuery
{
  return self->_multiEntityJoinQuery;
}

- (void)setMultiEntityJoinQuery:(id)a3
{
}

- (NSArray)virtualEntities
{
  return self->_virtualEntities;
}

- (void)setVirtualEntities:(id)a3
{
}

- (NSString)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinType, 0);
  objc_storeStrong((id *)&self->_virtualEntities, 0);
  objc_storeStrong((id *)&self->_multiEntityJoinQuery, 0);
  objc_storeStrong((id *)&self->_windowFunctions, 0);
  objc_storeStrong((id *)&self->_scalarFunctions, 0);
  objc_storeStrong((id *)&self->_databaseManagerStrong, 0);
  objc_destroyWeak((id *)&self->_databaseManagerWeak);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_fieldsIndex, 0);
}

@end