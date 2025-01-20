@interface LCFDatabaseConnection
- (BOOL)addColumn:(id)a3;
- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4;
- (BOOL)doQueryExec:(id)a3;
- (BOOL)pruneFrom:(id)a3 endDate:(id)a4;
- (BOOL)writeFeatures:(id)a3;
- (LCFDatabaseColumnConnection)dbColumnConnection;
- (NSString)databaseName;
- (NSString)databaseNamePath;
- (NSString)tableName;
- (NSURL)databaseBaseURL;
- (id)getColumns;
- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5;
- (id)isDoubleArray:(id)a3;
- (id)query:(id)a3 startDate:(id)a4 endDate:(id)a5 reversed:(BOOL)a6;
- (void)dumpDatabase;
- (void)ensureDatabaseTable;
@end

@implementation LCFDatabaseConnection

- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)LCFDatabaseConnection;
  v12 = [(LCFDatabaseConnection *)&v21 init];
  if (v12)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_databaseBaseURL, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_tableName, a5);
    v13 = [(NSURL *)v12->_databaseBaseURL path];
    uint64_t v14 = [v13 stringByAppendingPathComponent:v12->_databaseName];
    databaseNamePath = v12->_databaseNamePath;
    v12->_databaseNamePath = (NSString *)v14;

    v16 = [LCFDatabaseColumnConnection alloc];
    v17 = [v11 stringByAppendingString:@"_Columns"];
    uint64_t v18 = [(LCFDatabaseColumnConnection *)v16 init:v9 databaseName:v10 tableName:v17];
    dbColumnConnection = v12->_dbColumnConnection;
    v12->_dbColumnConnection = (LCFDatabaseColumnConnection *)v18;

    [(LCFDatabaseConnection *)v12 ensureDatabaseTable];
  }

  return v12;
}

- (void)ensureDatabaseTable
{
}

- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  v8 = [MEMORY[0x263F08850] defaultManager];
  databaseNamePath = self->_databaseNamePath;
  p_databaseNamePath = &self->_databaseNamePath;
  if ([v8 fileExistsAtPath:databaseNamePath])
  {
    id v11 = [(NSString *)*p_databaseNamePath UTF8String];
    ppDb = 0;
    if (sqlite3_open(v11, &ppDb))
    {
      v12 = LCFLogDatabaseConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR)) {
        [(LCFDatabaseConnection *)(uint64_t)p_databaseNamePath ensureDatabaseTable];
      }
    }
    else
    {
      objc_super v21 = 0;
      sqlite3_prepare_v2(ppDb, (const char *)[v6 UTF8String], -1, &v21, 0);
      while (1)
      {
        int v19 = sqlite3_step(v21);
        if (v19 != 100) {
          break;
        }
        v7[2](v7, v21);
      }
      if (v19 != 101) {
        -[LCFDatabaseConnection doQueryEachStep:statementStepHandler:]();
      }
      sqlite3_close(ppDb);
    }
  }

  return 1;
}

- (BOOL)doQueryExec:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  databaseNamePath = self->_databaseNamePath;
  p_databaseNamePath = &self->_databaseNamePath;
  if (![v5 fileExistsAtPath:databaseNamePath])
  {
LABEL_5:
    BOOL v16 = 0;
    goto LABEL_6;
  }
  v8 = [(NSString *)*p_databaseNamePath UTF8String];
  ppDb = 0;
  if (sqlite3_open(v8, &ppDb))
  {
    id v9 = LCFLogDatabaseConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR)) {
      [(LCFDatabaseConnection *)(uint64_t)p_databaseNamePath ensureDatabaseTable];
    }
    goto LABEL_5;
  }
  sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
  v28 = 0;
  uint64_t v18 = ppDb;
  id v19 = v4;
  int v20 = sqlite3_exec(v18, (const char *)objc_msgSend(v19, "UTF8String", 0), 0, 0, &v28);
  BOOL v16 = v20 == 0;
  if (v20)
  {
    objc_super v21 = LCFLogDatabaseConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR)) {
      [(LCFDatabaseConnection *)(uint64_t)v19 ensureDatabaseTable];
    }
  }
  sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
  sqlite3_close(ppDb);
LABEL_6:

  return v16;
}

- (id)getColumns
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSString stringWithFormat:@"pragma table_info(%@)", self->_tableName];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__LCFDatabaseConnection_getColumns__block_invoke;
  v7[3] = &unk_2653B0030;
  id v5 = v3;
  id v8 = v5;
  [(LCFDatabaseConnection *)self doQueryEachStep:v4 statementStepHandler:v7];

  return v5;
}

void __35__LCFDatabaseConnection_getColumns__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_text(a2, 1);
  id v5 = sqlite3_column_text(a2, 2);
  id v6 = [LCFDatabaseColumn alloc];
  v7 = [NSString stringWithUTF8String:v4];
  id v8 = [NSString stringWithUTF8String:v5];
  id v11 = [(LCFDatabaseColumn *)v6 init:v7 typeDb:v8];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v11 name];
  [v9 setValue:v11 forKey:v10];
}

- (BOOL)addColumn:(id)a3
{
  id v3 = self;
  id v4 = NSString;
  tableName = self->_tableName;
  id v6 = a3;
  v7 = [v6 name];
  id v8 = [v6 typeDb];

  id v9 = [v4 stringWithFormat:@"alter table %@ ADD COLUMN %@ %@;", tableName, v7, v8];

  LOBYTE(v3) = [(LCFDatabaseConnection *)v3 doQueryExec:v9];
  return (char)v3;
}

- (BOOL)writeFeatures:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 featureValues];
  v51 = [v4 itemIdentifier];
  v50 = [v4 featureVersion];
  v48 = v4;
  v49 = [v4 timestamp];
  id v6 = self;
  v47 = [(LCFDatabaseConnection *)self getColumns];
  uint64_t v7 = [v47 allKeys];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v52 = (void *)v5;
  id v8 = (void *)v5;
  id v9 = (void *)v7;
  uint64_t v10 = [v8 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        if (([v9 containsObject:v15] & 1) == 0)
        {
          BOOL v16 = [LCFDatabaseColumn alloc];
          uint64_t v17 = [v52 objectForKeyedSubscript:v15];
          uint64_t v18 = [v17 getTypeDBString];
          id v19 = [(LCFDatabaseColumn *)v16 init:v15 typeDb:v18];

          [(LCFDatabaseConnection *)v6 addColumn:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v12);
  }

  v46 = v9;
  if (v49)
  {
    [v49 timeIntervalSinceReferenceDate];
    double v21 = v20;
  }
  else
  {
    uint64_t v22 = [MEMORY[0x263EFF910] now];
    [v22 timeIntervalSinceReferenceDate];
    double v21 = v23;
  }
  id v24 = objc_alloc(MEMORY[0x263EFF980]);
  v63[0] = @"_lcf_itemIdentifier";
  v63[1] = @"_lcf_featureVersion";
  v63[2] = @"_lcf_timestamp";
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
  uint64_t v26 = (void *)[v24 initWithArray:v25];

  id v27 = objc_alloc(MEMORY[0x263EFF980]);
  v28 = [NSString stringWithFormat:@"'%@'", v51];
  v62[0] = v28;
  v62[1] = v50;
  v29 = [NSNumber numberWithDouble:v21];
  v62[2] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:3];
  v31 = (void *)[v27 initWithArray:v30];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v32 = [v52 allKeys];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        v38 = [v52 objectForKeyedSubscript:v37];
        -[LCFDatabaseColumnConnection writeFeatures:featureValueType:](v6->_dbColumnConnection, "writeFeatures:featureValueType:", v37, [v38 type]);
        [v26 addObject:v37];
        v39 = [v38 valueInString];
        [v31 addObject:v39];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v34);
  }

  v40 = NSString;
  tableName = v6->_tableName;
  v42 = [v26 componentsJoinedByString:@","];
  v43 = [v31 componentsJoinedByString:@","];
  v44 = [v40 stringWithFormat:@"INSERT INTO %@ (%@) VALUES(%@)", tableName, v42, v43];

  LOBYTE(v43) = [(LCFDatabaseConnection *)v6 doQueryExec:v44];
  return (char)v43;
}

- (id)isDoubleArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [a3 dataUsingEncoding:4];
  id v17 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v17];
  id v5 = v17;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v11 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v11 = v6;
LABEL_14:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)query:(id)a3 startDate:(id)a4 endDate:(id)a5 reversed:(BOOL)a6
{
  BOOL v59 = a6;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v61 = a4;
  unint64_t v63 = (unint64_t)a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v11 = [(LCFDatabaseColumnConnection *)self->_dbColumnConnection query];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v75 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v17 = [v16 featureName];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v13);
  }

  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v19 = [(LCFDatabaseConnection *)self getColumns];
  double v20 = v19;
  v62 = v9;
  long long v60 = v18;
  if (v9)
  {
    double v21 = [v19 allKeys];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v71;
      while (2)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v71 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v70 + 1) + 8 * j);
          if (([v21 containsObject:v27] & 1) == 0)
          {
            v31 = LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR)) {
              -[LCFDatabaseConnection query:startDate:endDate:reversed:](v27, v31, v32, v33, v34, v35, v36, v37);
            }
            id v38 = 0;
            v39 = v60;
            unint64_t v30 = (unint64_t)v61;
            goto LABEL_40;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    v28 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v22];
    uint64_t v29 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v22];
    unint64_t v30 = (unint64_t)v61;
    if (([v28 containsObject:@"_lcf_itemIdentifier"] & 1) == 0) {
      [v28 addObject:@"_lcf_itemIdentifier"];
    }
    if (([v28 containsObject:@"_lcf_featureVersion"] & 1) == 0) {
      [v28 addObject:@"_lcf_featureVersion"];
    }
    if (([v28 containsObject:@"_lcf_timestamp"] & 1) == 0) {
      [v28 addObject:@"_lcf_timestamp"];
    }

    double v21 = (void *)v29;
  }
  else
  {
    id v40 = objc_alloc(MEMORY[0x263EFF980]);
    v41 = [v20 allKeys];
    v28 = (void *)[v40 initWithArray:v41];

    id v42 = objc_alloc(MEMORY[0x263EFF980]);
    v43 = [v20 allKeys];
    double v21 = (void *)[v42 initWithArray:v43];

    [v21 removeObject:@"_lcf_itemIdentifier"];
    [v21 removeObject:@"_lcf_featureVersion"];
    [v21 removeObject:@"_lcf_timestamp"];
    unint64_t v30 = (unint64_t)v61;
  }
  v44 = NSString;
  v45 = [v28 componentsJoinedByString:@","];
  v46 = [v44 stringWithFormat:@"SELECT %@ FROM %@", v45, self->_tableName];

  if (v30 | v63)
  {
    v47 = [NSString stringWithFormat:@"%@ where ", v46];

    unint64_t v48 = 0x263F08000uLL;
    if (v30)
    {
      v49 = NSString;
      v50 = NSNumber;
      [(id)v30 timeIntervalSinceReferenceDate];
      v51 = objc_msgSend(v50, "numberWithDouble:");
      v52 = [v49 stringWithFormat:@"%@ %@ >= %@ ", v47, @"_lcf_timestamp", v51];

      if (!v63)
      {
LABEL_34:
        v47 = v52;
        goto LABEL_35;
      }
      v47 = [NSString stringWithFormat:@"%@ and ", v52];

      unint64_t v48 = 0x263F08000;
    }
    else if (!v63)
    {
LABEL_35:
      if (v59) {
        long long v56 = @"%@ order by %@ asc";
      }
      else {
        long long v56 = @"%@ order by %@ desc";
      }
      v46 = objc_msgSend(NSString, "stringWithFormat:", v56, v47, @"_lcf_timestamp");

      goto LABEL_39;
    }
    long long v53 = NSString;
    long long v54 = *(void **)(v48 + 2584);
    [(id)v63 timeIntervalSinceReferenceDate];
    long long v55 = objc_msgSend(v54, "numberWithDouble:");
    v52 = [v53 stringWithFormat:@"%@ %@ <= %@ ", v47, @"_lcf_timestamp", v55];

    goto LABEL_34;
  }
LABEL_39:
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __58__LCFDatabaseConnection_query_startDate_endDate_reversed___block_invoke;
  v64[3] = &unk_2653B0058;
  id v65 = v28;
  id v66 = v20;
  id v67 = v10;
  v68 = self;
  v39 = v60;
  id v57 = v60;
  id v69 = v57;
  id v22 = v28;
  [(LCFDatabaseConnection *)self doQueryEachStep:v46 statementStepHandler:v64];
  id v38 = v57;

LABEL_40:
  return v38;
}

void __58__LCFDatabaseConnection_query_startDate_endDate_reversed___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v6 = 0;
    *(void *)&long long v5 = 138412802;
    long long v43 = v5;
    while (2)
    {
      uint64_t v7 = sqlite3_column_text(a2, v6);
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
      id v10 = [v8 objectForKeyedSubscript:v9];

      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = [v10 name];
      uint64_t v13 = [v11 objectForKeyedSubscript:v12];
      uint64_t v14 = [v13 featureValueType];

      switch([v10 type])
      {
        case 1:
          switch(v14)
          {
            case 0:
              goto LABEL_9;
            case 6:
              if (v7)
              {
                id v17 = [NSString stringWithUTF8String:v7];
                v28 = [*(id *)(a1 + 56) isDoubleArray:v17];
                long long v16 = [[LCFFeatureValue alloc] initWithDoubleArray:v28];

                goto LABEL_26;
              }
              long long v15 = [[LCFFeatureValue alloc] initWithDoubleArray:0];
              goto LABEL_5;
            case 3:
LABEL_9:
              if (v7)
              {
                id v17 = [NSString stringWithUTF8String:v7];
                id v18 = [[LCFFeatureValue alloc] initWithStringValue:v17];
                goto LABEL_25;
              }
              long long v15 = [[LCFFeatureValue alloc] initWithStringValue:0];
              goto LABEL_5;
          }
          uint64_t v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          goto LABEL_37;
        case 2:
          if (!v14 || v14 == 5)
          {
            uint64_t v25 = [LCFFeatureValue alloc];
            uint64_t v26 = v25;
            if (v7)
            {
              id v17 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a2, v6));
              id v18 = [(LCFFeatureValue *)v26 initWithTimeBucketValue:v17];
              goto LABEL_25;
            }
            long long v15 = [(LCFFeatureValue *)v25 initWithTimeBucketValue:0];
            goto LABEL_5;
          }
          if (v14 == 1)
          {
            uint64_t v19 = [LCFFeatureValue alloc];
            double v20 = v19;
            if (v7)
            {
              id v17 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a2, v6));
              id v18 = [(LCFFeatureValue *)v20 initWithIntValue:v17];
              goto LABEL_25;
            }
            long long v15 = [(LCFFeatureValue *)v19 initWithIntValue:0];
            goto LABEL_5;
          }
          uint64_t v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          goto LABEL_37;
        case 3:
          if (!v14 || v14 == 2)
          {
            double v21 = [LCFFeatureValue alloc];
            id v22 = v21;
            if (v7)
            {
              id v17 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(a2, v6));
              id v18 = [(LCFFeatureValue *)v22 initWithDoubleValue:v17];
              goto LABEL_25;
            }
            long long v15 = [(LCFFeatureValue *)v21 initWithDoubleValue:0];
            goto LABEL_5;
          }
          uint64_t v27 = (void *)LCFLogDatabaseConnection;
          if (!os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          goto LABEL_37;
        case 4:
          if (v14 == 4)
          {
            uint64_t v23 = [LCFFeatureValue alloc];
            uint64_t v24 = v23;
            if (v7)
            {
              id v17 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a2, v6));
              id v18 = [(LCFFeatureValue *)v24 initWithBoolValue:v17];
LABEL_25:
              long long v16 = v18;
LABEL_26:
            }
            else
            {
              long long v15 = [(LCFFeatureValue *)v23 initWithBoolValue:0];
LABEL_5:
              long long v16 = v15;
            }
          }
          else
          {
            uint64_t v27 = (void *)LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_FAULT))
            {
LABEL_37:
              uint64_t v29 = v27;
              unint64_t v30 = [v10 name];
              uint64_t v31 = [v10 type];
              *(_DWORD *)buf = v43;
              *(void *)&buf[4] = v30;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2048;
              uint64_t v45 = v14;
              _os_log_fault_impl(&dword_25459C000, v29, OS_LOG_TYPE_FAULT, "Wrong feature value type is assigned featureName:%@ columnInDb.type:%ld featureValueType: %ld", buf, 0x20u);
            }
LABEL_38:
            long long v16 = 0;
          }
          uint64_t v32 = objc_msgSend(v10, "name", v43, *(_OWORD *)buf, *(void *)&buf[16], v45);
          [v4 setValue:v16 forKey:v32];

          if ([*(id *)(a1 + 32) count] <= (unint64_t)++v6) {
            break;
          }
          continue;
        default:
          long long v15 = [[LCFFeatureValue alloc] initEmpty];
          goto LABEL_5;
      }
      break;
    }
  }
  uint64_t v33 = [v4 objectForKeyedSubscript:@"_lcf_itemIdentifier"];
  uint64_t v34 = [v33 stringValue];

  uint64_t v35 = [v4 objectForKeyedSubscript:@"_lcf_featureVersion"];
  uint64_t v36 = [v35 doubleValue];

  uint64_t v37 = (void *)MEMORY[0x263EFF910];
  id v38 = [v4 objectForKeyedSubscript:@"_lcf_timestamp"];
  v39 = [v38 doubleValue];
  [v39 doubleValue];
  id v40 = objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");

  [v4 removeObjectForKey:@"_lcf_itemIdentifier"];
  [v4 removeObjectForKey:@"_lcf_featureVersion"];
  [v4 removeObjectForKey:@"_lcf_timestamp"];
  [v4 removeObjectForKey:@"ID"];
  v41 = *(void **)(a1 + 64);
  id v42 = [[LCFFeatureSet alloc] initWithIdentifier:v34 featureVersion:v36 timestamp:v40 featureValues:v4];
  [v41 addObject:v42];
}

- (void)dumpDatabase
{
  id v3 = [(LCFDatabaseConnection *)self getColumns];
  id v4 = [v3 allKeys];
  long long v5 = [NSString stringWithFormat:@"SELECT * FROM %@ limit 10", self->_tableName];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__LCFDatabaseConnection_dumpDatabase__block_invoke;
  v7[3] = &unk_2653B0030;
  id v8 = v4;
  id v6 = v4;
  [(LCFDatabaseConnection *)self doQueryEachStep:v5 statementStepHandler:v7];
}

void __37__LCFDatabaseConnection_dumpDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = sqlite3_column_text(a2, v5);
      if (v6)
      {
        uint64_t v7 = [NSString stringWithUTF8String:v6];
        [v4 addObject:v7];
      }
      else
      {
        [v4 addObject:@"null"];
      }
      ++v5;
    }
    while ([*(id *)(a1 + 32) count] > v5);
  }
  id v8 = (void *)LCFLogDatabaseConnection;
  if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v4 componentsJoinedByString:@","];
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_25459C000, v9, OS_LOG_TYPE_INFO, "database %@", (uint8_t *)&v11, 0xCu);
  }
}

- (BOOL)pruneFrom:(id)a3 endDate:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = [NSString stringWithFormat:@"DELETE FROM %@", self->_tableName];
  if (!(v6 | v7)) {
    goto LABEL_7;
  }
  id v9 = [NSString stringWithFormat:@"%@ where ", v8];

  if (v6)
  {
    id v10 = NSString;
    int v11 = NSNumber;
    [(id)v6 timeIntervalSinceReferenceDate];
    uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
    id v8 = [v10 stringWithFormat:@"%@ %@ >= %@ ", v9, @"_lcf_timestamp", v12];

    if (!v7)
    {
LABEL_7:
      id v9 = v8;
      goto LABEL_8;
    }
    id v9 = [NSString stringWithFormat:@"%@ and ", v8];

LABEL_6:
    uint64_t v13 = NSString;
    uint64_t v14 = NSNumber;
    [(id)v7 timeIntervalSinceReferenceDate];
    long long v15 = objc_msgSend(v14, "numberWithDouble:");
    id v8 = [v13 stringWithFormat:@"%@ %@ <= %@ ", v9, @"_lcf_timestamp", v15];

    goto LABEL_7;
  }
  if (v7) {
    goto LABEL_6;
  }
LABEL_8:
  BOOL v16 = [(LCFDatabaseConnection *)self doQueryExec:v9];

  return v16;
}

- (NSURL)databaseBaseURL
{
  return self->_databaseBaseURL;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)databaseNamePath
{
  return self->_databaseNamePath;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (LCFDatabaseColumnConnection)dbColumnConnection
{
  return self->_dbColumnConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbColumnConnection, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_databaseNamePath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
}

- (void)doQueryEachStep:statementStepHandler:.cold.1()
{
}

- (void)query:(uint64_t)a3 startDate:(uint64_t)a4 endDate:(uint64_t)a5 reversed:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end