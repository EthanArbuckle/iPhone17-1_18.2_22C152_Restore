@interface AMDSQLite
+ (id)allocSharedInstance;
+ (id)clearUserData:(id)a3;
+ (id)createSharedInstance;
+ (id)deleteEventsOlderThan:(unsigned int)a3;
+ (id)deleteEventsWithPredicate:(id)a3 forStreams:(id)a4;
+ (id)deleteRowsHandler:(id)a3 error:(id *)a4;
+ (id)deleteVectorDBEntryForDBName:(id)a3 error:(id *)a4;
+ (id)fetchVectorDBConfigForDBName:(id)a3 error:(id *)a4;
+ (id)getBootstrapSchemaDict;
+ (id)getDomainsFrom:(id)a3;
+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 skipRowset:(BOOL)a6 error:(id *)a7;
+ (id)getSharedInstance;
+ (id)getSharedInstanceWithOption:(BOOL)a3;
+ (id)initSharedInstance:(id)a3;
+ (id)insertRowsHandler:(id)a3 error:(id *)a4;
+ (id)insertRowsInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5;
+ (id)loadNewData:(id)a3;
+ (id)persistVectorDBPath:(id)a3 forDBName:(id)a4 withVectorDimension:(int)a5 andDataType:(id)a6 withDistanceMetric:(id)a7 error:(id *)a8;
+ (id)refreshEntityTableForDomain:(id)a3 error:(id *)a4;
+ (id)refreshODTPForDomain:(id)a3 error:(id *)a4;
+ (id)saveEvents:(id)a3 error:(id *)a4;
+ (id)trimEventsForStreams:(id)a3 error:(id *)a4;
+ (id)truncateEvents:(id *)a3;
+ (id)updateData:(id)a3;
+ (id)updateLastVectorDBRefreshTimestamp:(id)a3 error:(id *)a4;
+ (id)updateTablesHandler:(id)a3 error:(id *)a4;
+ (id)updateTablesInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5;
+ (sqlite3_stmt)prepare:(id)a3 usingDb:(sqlite3 *)a4 error:(id *)a5;
- (AMDSQLiteSchema)_biomeSchema;
- (AMDSQLiteSchema)_bootstrapSchema;
- (AMDSQLiteSchema)_megadomeSchema;
- (AMDSQLiteSchema)_schema;
- (BOOL)_isEnabled;
- (BOOL)isUsable;
- (BOOL)isUsableInternal;
- (NSError)_error;
- (OS_dispatch_queue)_executorQueue;
- (id)applySchema:(id)a3 error:(id *)a4;
- (id)bootstrapDb;
- (id)connectionState;
- (id)createIndices:(id)a3 error:(id *)a4;
- (id)createTable:(id)a3 usingSchema:(id)a4 error:(id *)a5;
- (id)deleteRows:(id)a3 error:(id *)a4;
- (id)deleteRowsInternal:(id)a3 error:(id *)a4;
- (id)fetchRows:(id)a3 andPersist:(BOOL)a4 error:(id *)a5;
- (id)fetchRowsFrom:(sqlite3 *)a3 usingDescriptor:(id)a4 andSchema:(id)a5 columnMajorOutput:(BOOL)a6 rowMajorOutput:(BOOL)a7 andPersist:(BOOL)a8 error:(id *)a9;
- (id)fetchRowsUsingSchema:(id)a3 andDescriptor:(id)a4 andPersist:(BOOL)a5 error:(id *)a6;
- (id)generateDBLoadError;
- (id)getBiomeSchema;
- (id)getBootSchema;
- (id)getDataSchema;
- (id)getError;
- (id)getMegadomeSchema;
- (id)getPredicateExtensionForTable:(id)a3 forUser:(id)a4 andDomain:(id)a5 error:(id *)a6;
- (id)insertRows:(id)a3 usingSchema:(id)a4 error:(id *)a5;
- (id)insertRows:(id)a3 usingSchema:(id)a4 skipValidation:(BOOL)a5 error:(id *)a6;
- (id)loadBiomeSchema;
- (id)loadDataSchema;
- (id)loadDb;
- (id)loadMegadomeSchema;
- (id)prepareBootstrapSchema;
- (id)refreshAppsTable:(id *)a3;
- (id)saveSchema:(id)a3 error:(id *)a4;
- (id)updateSchema:(id)a3 error:(id *)a4;
- (id)updateTableUsingDescriptor:(id)a3 andSchema:(id)a4 error:(id *)a5;
- (id)validateRowsData:(id)a3 tableSchema:(id)a4 error:(id *)a5;
- (sqlite3)_db;
- (sqlite3)getDb;
- (sqlite3_stmt)prepare:(id)a3 error:(id *)a4;
- (void)setEnable:(BOOL)a3;
- (void)set_biomeSchema:(id)a3;
- (void)set_bootstrapSchema:(id)a3;
- (void)set_db:(sqlite3 *)a3;
- (void)set_error:(id)a3;
- (void)set_executorQueue:(id)a3;
- (void)set_isEnabled:(BOOL)a3;
- (void)set_megadomeSchema:(id)a3;
- (void)set_schema:(id)a3;
@end

@implementation AMDSQLite

+ (id)clearUserData:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v35 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = &_os_log_internal;
  char v32 = 2;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG))
  {
    log = v33;
    os_log_type_t type = v32;
    __os_log_helper_16_0_0(v31);
    _os_log_debug_impl(&dword_20ABD4000, log, type, "SQLITE Clearing user data", v31, 2u);
  }
  objc_storeStrong(&v33, 0);
  id v30 = 0;
  id v29 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  id v27 = v30;
  id v15 = (id)[v35 truncateEvents:&v27];
  objc_storeStrong(&v30, v27);
  id v28 = v15;
  if (v30)
  {
    id v13 = v29;
    id v14 = (id)[v30 localizedDescription];
    objc_msgSend(v13, "setObject:forKey:");
  }
  else if (v28)
  {
    [v29 setObject:v28 forKey:@"sqliteDeletionSummary"];
  }
  id v26 = (id)[v35 getDomainsFrom:location[0]];
  if (v26)
  {
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v26, "count"));
    memset(__b, 0, sizeof(__b));
    id v11 = v26;
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v37 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * v9);
        id v5 = v21;
        id v18 = v30;
        id v6 = (id)[v35 refreshODTPForDomain:v20 error:&v18];
        objc_storeStrong(&v30, v18);
        [v5 setObject:v6 forKey:v20];

        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    [v29 setObject:v21 forKey:@"sqliteODTPRefreshed"];
    id v36 = v29;
    int v22 = 1;
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v25 = @"SQLITE Clear user data: no domains";
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v25);
      _os_log_error_impl(&dword_20ABD4000, oslog, v23, "%@", v38, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [v29 setObject:v25 forKey:@"error"];
    id v36 = v29;
    int v22 = 1;
    objc_storeStrong((id *)&v25, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  v3 = v36;

  return v3;
}

+ (id)deleteRowsHandler:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = a4;
  id v47 = (id)[location[0] objectForKey:@"allDeletes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v47 count])
  {
    id v45 = v47;
    id v44 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v45;
    if ([obj countByEnumeratingWithState:__b objects:v55 count:16])
    {
      uint64_t v43 = *(void *)__b[1];
      id v4 = (id)[v45 objectForKey:v43];
      id v5 = v44;
      id v44 = v4;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v44 count])
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v54, v43);
          _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Deleting from db '%@'", v54, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v46 = 2;
      }
      else
      {
        id v6 = +[AMDError allocError:15 withMessage:@"Deletion info not an array, or empty"];
        id *v48 = v6;
        id v50 = 0;
        int v46 = 1;
      }
    }
    else
    {
      int v46 = 0;
    }

    if (!v46 || v46 == 2)
    {
      id v39 = +[AMDSQLite getSharedInstance];
      if ([v39 isUsable])
      {
        id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(v36, 0, sizeof(v36));
        id v27 = v44;
        uint64_t v28 = [v27 countByEnumeratingWithState:v36 objects:v53 count:16];
        if (v28)
        {
          uint64_t v24 = *(void *)v36[2];
          uint64_t v25 = 0;
          unint64_t v26 = v28;
          while (1)
          {
            uint64_t v23 = v25;
            if (*(void *)v36[2] != v24) {
              objc_enumerationMutation(v27);
            }
            id v37 = *(id *)(v36[1] + 8 * v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = v37;
              id v34 = (id)[v35 objectForKey:0x26BEB5158];
              if (v34)
              {
                id v20 = v39;
                id v19 = v34;
                id v22 = (id)[location[0] objectForKey:0x26BEAEC98];
                id v21 = (id)[location[0] objectForKey:0x26BEAE298];
                id v33 = (id)objc_msgSend(v20, "getPredicateExtensionForTable:forUser:andDomain:error:", v19, v22);

                if (*v48)
                {
                  id v17 = v38;
                  id v18 = (id)[*v48 localizedDescription];
                  objc_msgSend(v17, "addObject:");

                  int v46 = 5;
                }
                else
                {
                  id v32 = (id)[v35 objectForKey:0x26BEB50D8];
                  if (v32)
                  {
                    if (v33) {
                      id v8 = (id)[v32 stringByAppendingFormat:@" %@", v33];
                    }
                  }
                  else
                  {
                    objc_storeStrong(&v32, v33);
                  }
                  if (v32)
                  {
                    id v15 = v32;
                    id v16 = (id)[MEMORY[0x263F08708] whitespaceCharacterSet];
                    id v9 = (id)objc_msgSend(v15, "stringByTrimmingCharactersInSet:");
                    id v10 = v32;
                    id v32 = v9;

                    if ([v32 isEqualToString:&stru_26BEAC9D8]) {
                      [v35 setValue:0 forKey:0x26BEB50D8];
                    }
                    else {
                      [v35 setValue:v32 forKey:0x26BEB50D8];
                    }
                  }
                  id v31 = (id)[v39 deleteRows:v35 error:v48];
                  if (*v48)
                  {
                    id v13 = v38;
                    id v14 = (id)[*v48 localizedDescription];
                    objc_msgSend(v13, "addObject:");
                  }
                  else
                  {
                    [v38 addObject:v31];
                  }
                  objc_storeStrong(&v31, 0);
                  objc_storeStrong(&v32, 0);
                  int v46 = 0;
                }
                objc_storeStrong(&v33, 0);
              }
              else
              {
                [v38 addObject:@"Table name required"];
                int v46 = 5;
              }
              objc_storeStrong(&v34, 0);
              objc_storeStrong(&v35, 0);
            }
            else
            {
              [v38 addObject:@"Invalid deletion spec: not a dict"];
            }
            ++v25;
            if (v23 + 1 >= v26)
            {
              uint64_t v25 = 0;
              unint64_t v26 = [v27 countByEnumeratingWithState:v36 objects:v53 count:16];
              if (!v26) {
                break;
              }
            }
          }
        }

        v51 = @"deletionSummary";
        id v52 = v38;
        id v50 = (id)[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        int v46 = 1;
        objc_storeStrong(&v38, 0);
      }
      else
      {
        id v7 = (id)[v39 generateDBLoadError];
        id *v48 = v7;
        id v50 = 0;
        int v46 = 1;
      }
      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
  }
  else
  {
    id *v48 = +[AMDError allocError:15 withMessage:@"Missing deletion info for all DBs"];
    id v50 = 0;
    int v46 = 1;
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
  id v11 = v50;

  return v11;
}

+ (id)deleteEventsWithPredicate:(id)a3 forStreams:(id)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  id v43 = +[AMDSQLite getSharedInstance];
  if ([v43 isUsable])
  {
    id v39 = (id)[v43 getDataSchema];
    id v38 = (id)[v39 getStreamToTableMap];
    id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v44)
    {
      memset(__b, 0, sizeof(__b));
      id v23 = v44;
      uint64_t v24 = [v23 countByEnumeratingWithState:__b objects:v50 count:16];
      if (v24)
      {
        uint64_t v20 = *(void *)__b[2];
        uint64_t v21 = 0;
        unint64_t v22 = v24;
        while (1)
        {
          uint64_t v19 = v21;
          if (*(void *)__b[2] != v20) {
            objc_enumerationMutation(v23);
          }
          uint64_t v36 = *(void *)(__b[1] + 8 * v21);
          id v34 = (id)[v38 objectForKey:v36];
          if (v34)
          {
            [v37 addObject:v34];
            int v40 = 0;
          }
          else
          {
            int v40 = 3;
          }
          objc_storeStrong(&v34, 0);
          ++v21;
          if (v19 + 1 >= v22)
          {
            uint64_t v21 = 0;
            unint64_t v22 = [v23 countByEnumeratingWithState:__b objects:v50 count:16];
            if (!v22) {
              break;
            }
          }
        }
      }
    }
    else
    {
      id v25 = (id)[v38 allValues];
      id v4 = (void *)[v25 mutableCopy];
      id v5 = v37;
      id v37 = v4;
    }
    id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v33 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v37, "count"));
    memset(v31, 0, sizeof(v31));
    id v17 = v37;
    uint64_t v18 = [v17 countByEnumeratingWithState:v31 objects:v49 count:16];
    if (v18)
    {
      uint64_t v13 = *(void *)v31[2];
      uint64_t v14 = 0;
      unint64_t v15 = v18;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)v31[2] != v13) {
          objc_enumerationMutation(v17);
        }
        uint64_t v32 = *(void *)(v31[1] + 8 * v14);
        id v30 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
        [v30 setObject:v32 forKey:0x26BEB5158];
        if (location[0]) {
          [v30 setObject:location[0] forKey:0x26BEB50D8];
        }
        id v29 = 0;
        id v27 = 0;
        id v11 = (id)[v43 deleteRows:v30 error:&v27];
        objc_storeStrong(&v29, v27);
        id v28 = v11;
        if (v29)
        {
          id v47 = @"Error";
          id v10 = (id)[v29 localizedDescription];
          id v48 = v10;
          id v6 = (id)[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          id v7 = v28;
          id v28 = v6;
        }
        if (v28) {
          [v33 setObject:v28 forKey:v32];
        }
        else {
          [v33 setObject:@"Deletion Failed" forKey:v32];
        }
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [v17 countByEnumeratingWithState:v31 objects:v49 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v46 = v33;
    int v40 = 1;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v42 = (id)[v43 connectionState];
    id v41 = (id)[NSString stringWithFormat:@"DB not usable: %@", v42];
    v51 = @"eventDeletionError";
    v52[0] = v41;
    id v46 = (id)[NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    int v40 = 1;
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  id v8 = v46;

  return v8;
}

+ (id)deleteEventsOlderThan:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = a1;
  SEL v12 = a2;
  unsigned int v11 = a3;
  id location = &_os_log_internal;
  os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v14, v11);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)location, v9, "SQLITE Deleting events older than %u days", v14, 8u);
  }
  objc_storeStrong(&location, 0);
  id v8 = +[AMDMiscHelpers getCurrentEpochSeconds];
  uint64_t v3 = [v8 unsignedLongValue];
  uint64_t v7 = v3 - 86400 * v11;
  id v6 = (id)[NSString stringWithFormat:@"%@ < %llu", @"creationTime", v7];
  id v5 = (id)[v13 deleteEventsWithPredicate:v6 forStreams:0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);

  return v5;
}

+ (id)getDomainsFrom:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)[location[0] objectForKey:0x26BEB8778];
  if (!v8) {
    objc_storeStrong(&v8, &unk_26BEC33C0);
  }
  char v6 = 0;
  LOBYTE(v5) = 1;
  if (v8)
  {
    objc_opt_class();
    LOBYTE(v5) = 1;
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v5) = 1;
      if ([v8 count])
      {
        id v7 = (id)[v8 objectAtIndexedSubscript:0];
        char v6 = 1;
        objc_opt_class();
        int v5 = objc_opt_isKindOfClass() ^ 1;
      }
    }
  }
  if (v6) {

  }
  if (v5) {
    id v10 = 0;
  }
  else {
    id v10 = v8;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  uint64_t v3 = v10;

  return v3;
}

+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 skipRowset:(BOOL)a6 error:(id *)a7
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v63 = 0;
  objc_storeStrong(&v63, a4);
  id v62 = 0;
  objc_storeStrong(&v62, a5);
  BOOL v61 = a6;
  v60 = a7;
  int64_t v59 = +[AMDDomains getCodeForDomain:v63];
  id v58 = &_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, (uint64_t)v63, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v58, type, "SQLITE Retrieving feature in domain '%@': %@", v77, 0x16u);
  }
  objc_storeStrong(&v58, 0);
  id v56 = 0;
  if (v61) {
    id v7 = (id)[NSString stringWithFormat:@"featureName = '%@' AND domain = %ld AND valueType <> %d", location[0], v59, 3];
  }
  else {
    id v7 = (id)[NSString stringWithFormat:@"featureName = '%@' AND domain = %ld", location[0], v59];
  }
  id v8 = v56;
  id v56 = v7;

  v75[0] = 0x26BEB4FB8;
  v76[0] = @"getFeatureValue";
  v75[1] = 0x26BEB5158;
  v76[1] = @"__AMDTasteProfile";
  v75[2] = 0x26BEB4F98;
  v72 = @"value";
  v70 = @"type";
  uint64_t v71 = AMD_SQLITE_DATA_TYPE_BLOB;
  id v22 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70);
  id v73 = v22;
  id v21 = (id)[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  id v74 = v21;
  id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
  v76[2] = v20;
  v75[3] = 0x26BEB50D8;
  v76[3] = v56;
  id v55 = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];

  id v54 = +[AMDSQLite getSharedInstance];
  if ([v54 isUsable])
  {
    uint64_t v18 = [AMDFetchDescriptor alloc];
    id v19 = (id)[v54 getBootSchema];
    id v52 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v18, "initWithDict:usingSchema:error:", v55);

    if (*v60)
    {
      id v65 = 0;
      int v53 = 1;
    }
    else
    {
      id v51 = (id)[v54 fetchRows:v52 andPersist:0 error:v60];
      id v17 = (id)[v51 objectForKey:@"resultSet"];
      id v16 = (id)[v17 objectForKey:@"fetchResultColumnsData"];
      id v50 = (id)[v16 objectAtIndexedSubscript:0];

      if (v50 && [v50 count])
      {
        id v46 = (id)[v50 objectAtIndexedSubscript:0];
        id v45 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v46 options:4 error:v60];
        if (*v60)
        {
          id v65 = 0;
          int v53 = 1;
        }
        else if (v62)
        {
          id v44 = 0;
          if (v45)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = v45;
              id v36 = (id)[v37 objectForKey:@"fetchResultColumnsInfo"];
              id v35 = (id)[v37 objectForKey:@"fetchResultColumnsData"];
              if (v36 && v35)
              {
                for (int i = 0; ; ++i)
                {
                  unint64_t v13 = i;
                  if (v13 >= [v36 count]) {
                    break;
                  }
                  id v30 = (id)[v36 objectAtIndex:i];
                  id v29 = (id)[v30 objectForKey:@"name"];
                  if ([v29 isEqualToString:v62])
                  {
                    id v9 = (id)[v35 objectAtIndex:i];
                    id v10 = v44;
                    id v44 = v9;

                    int v53 = 2;
                  }
                  else
                  {
                    int v53 = 0;
                  }
                  objc_storeStrong(&v29, 0);
                  objc_storeStrong(&v30, 0);
                  if (v53) {
                    break;
                  }
                }
                if (v44)
                {
                  id v65 = v44;
                  int v53 = 1;
                }
                else
                {
                  id v28 = (id)[NSString stringWithFormat:@"Feature %@ in domain %@ missing column %@", location[0], v63, v62];
                  os_log_t v27 = (os_log_t)&_os_log_internal;
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v28);
                    _os_log_error_impl(&dword_20ABD4000, v27, OS_LOG_TYPE_ERROR, "%@", v66, 0xCu);
                  }
                  objc_storeStrong((id *)&v27, 0);
                  id *v60 = +[AMDError allocError:16 withMessage:v28];
                  id v65 = 0;
                  int v53 = 1;
                  objc_storeStrong(&v28, 0);
                }
              }
              else
              {
                id v34 = (id)[NSString stringWithFormat:@"Feature %@ in domain %@ missing column info/data in rowset", location[0], v63];
                os_log_t v33 = (os_log_t)&_os_log_internal;
                os_log_type_t v32 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v34);
                  _os_log_error_impl(&dword_20ABD4000, v33, v32, "%@", v67, 0xCu);
                }
                objc_storeStrong((id *)&v33, 0);
                id *v60 = +[AMDError allocError:16 withMessage:v34];
                id v65 = 0;
                int v53 = 1;
                objc_storeStrong(&v34, 0);
              }
              objc_storeStrong(&v35, 0);
              objc_storeStrong(&v36, 0);
              objc_storeStrong(&v37, 0);
            }
            else
            {
              id v40 = (id)[NSString stringWithFormat:@"Feature %@ in domain %@ is incorrectly formatted", location[0], v63];
              os_log_t v39 = (os_log_t)&_os_log_internal;
              os_log_type_t v38 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v40);
                _os_log_error_impl(&dword_20ABD4000, v39, v38, "%@", v68, 0xCu);
              }
              objc_storeStrong((id *)&v39, 0);
              id *v60 = +[AMDError allocError:16 withMessage:v40];
              id v65 = 0;
              int v53 = 1;
              objc_storeStrong(&v40, 0);
            }
          }
          else
          {
            id v43 = (id)[NSString stringWithFormat:@"No feature '%@' in domain '%@' of type RowSet", location[0], v63];
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v41 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v43);
              _os_log_error_impl(&dword_20ABD4000, oslog, v41, "%@", v69, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            id *v60 = +[AMDError allocError:16 withMessage:v43];
            id v65 = 0;
            int v53 = 1;
            objc_storeStrong(&v43, 0);
          }
          objc_storeStrong(&v44, 0);
        }
        else
        {
          id v65 = v45;
          int v53 = 1;
        }
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
      }
      else
      {
        id v49 = &_os_log_internal;
        os_log_type_t v48 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = v49;
          os_log_type_t v15 = v48;
          __os_log_helper_16_0_0(v47);
          _os_log_debug_impl(&dword_20ABD4000, v14, v15, "SQLITE Nothing found", v47, 2u);
        }
        objc_storeStrong(&v49, 0);
        id v65 = 0;
        int v53 = 1;
      }
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
    }
    objc_storeStrong(&v52, 0);
  }
  else
  {
    id *v60 = (id)[v54 generateDBLoadError];
    id v65 = 0;
    int v53 = 1;
  }
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  unsigned int v11 = v65;

  return v11;
}

+ (id)getSharedInstance
{
  return (id)objc_msgSend(a1, "getSharedInstanceWithOption:", 0, a2, a1);
}

+ (id)allocSharedInstance
{
  v2 = objc_msgSend(a1, "getSharedInstanceWithOption:", 1, a2, a1);

  return v2;
}

+ (id)createSharedInstance
{
  id v10 = a1;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(AMDSQLite);
  id v5 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v8 = (id)[v5 bundleIdentifier];

  dispatch_queue_t v6 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
  objc_msgSend(v9[0], "set_executorQueue:");

  objc_msgSend(v9[0], "set_isEnabled:", 0);
  id v2 = (id)[v10 initSharedInstance:v9[0]];
  id v3 = v9[0];
  v9[0] = v2;

  id v7 = v9[0];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);

  return v7;
}

+ (id)initSharedInstance:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v15;
  id v5 = (id)[location[0] prepareBootstrapSchema];
  objc_msgSend(v4, "addEntriesFromDictionary:");

  id v6 = v15;
  id v7 = (id)[location[0] loadDb];
  objc_msgSend(v6, "addEntriesFromDictionary:");

  id v8 = v15;
  id v9 = (id)[location[0] loadDataSchema];
  objc_msgSend(v8, "addEntriesFromDictionary:");

  id v10 = v15;
  id v11 = (id)[location[0] loadBiomeSchema];
  objc_msgSend(v10, "addEntriesFromDictionary:");

  id v12 = v15;
  id v13 = (id)[location[0] loadMegadomeSchema];
  objc_msgSend(v12, "addEntriesFromDictionary:");

  +[AMDFrameworkMetrics log:v15 withKey:@"SQLLoadSummary" atVerbosity:0];
  id v14 = location[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);

  return v14;
}

+ (id)getSharedInstanceWithOption:(BOOL)a3
{
  id v13 = a1;
  SEL v12 = a2;
  BOOL v11 = a3;
  if (a3)
  {
    uint64_t obj = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = __41__AMDSQLite_getSharedInstanceWithOption___block_invoke;
    id v9 = &__block_descriptor_40_e5_v8__0l;
    id v10 = v13;
    id v16 = (dispatch_once_t *)&getSharedInstanceWithOption__onceToken;
    id location = 0;
    objc_storeStrong(&location, &obj);
    if (*v16 != -1) {
      dispatch_once(v16, location);
    }
    objc_storeStrong(&location, 0);
    id v14 = (id)getSharedInstanceWithOption__sharedInstance;
  }
  else
  {
    id v14 = (id)getSharedInstanceWithOption__sharedInstance;
  }
  id v3 = v14;

  return v3;
}

void __41__AMDSQLite_getSharedInstanceWithOption___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = &_os_log_internal;
  char v7 = 1;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    log = location[0];
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_20ABD4000, log, type, "Running first alloc of DB", v6, 2u);
  }
  objc_storeStrong(location, 0);
  id v1 = (id)[a1[4] createSharedInstance];
  id v2 = (void *)getSharedInstanceWithOption__sharedInstance;
  getSharedInstanceWithOption__sharedInstance = (uint64_t)v1;
}

+ (id)getBootstrapSchemaDict
{
  v76[3] = *MEMORY[0x263EF8340];
  v28[2] = a1;
  v28[1] = (id)a2;
  v75[0] = AMD_SQLITE_SCHEMA_NAME;
  v76[0] = @"bootstrap";
  v75[1] = AMD_SQLITE_SCHEMA_VERSION;
  v76[1] = @"1";
  v75[2] = AMD_SQLITE_SCHEMA_TABLES;
  v73[0] = @"__AMDSchema";
  v71[0] = @"schema";
  v69[0] = AMD_SQLITE_TYPE;
  v70[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v69[1] = AMD_SQLITE_NOT_NULL;
  uint64_t v3 = MEMORY[0x263EFFA88];
  v70[1] = MEMORY[0x263EFFA88];
  id v26 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69);
  v72[0] = v26;
  v71[1] = @"creationTime";
  v67[0] = AMD_SQLITE_TYPE;
  v68[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v67[1] = AMD_SQLITE_NOT_NULL;
  v68[1] = v3;
  id v25 = (id)[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  v72[1] = v25;
  id v24 = (id)[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
  v74[0] = v24;
  v73[1] = @"__AMDTasteProfile";
  v65[0] = @"domain";
  v63[0] = AMD_SQLITE_TYPE;
  v64[0] = AMD_SQLITE_DATA_TYPE_INT;
  v63[1] = AMD_SQLITE_NOT_NULL;
  v64[1] = v3;
  id v23 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  v66[0] = v23;
  v65[1] = @"featureName";
  v61[0] = AMD_SQLITE_TYPE;
  v62[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v61[1] = AMD_SQLITE_NOT_NULL;
  v62[1] = v3;
  id v22 = (id)[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  v66[1] = v22;
  v65[2] = @"source";
  v59[0] = AMD_SQLITE_TYPE;
  v60[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v59[1] = AMD_SQLITE_NOT_NULL;
  v60[1] = v3;
  id v21 = (id)[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  v66[2] = v21;
  v65[3] = @"valueType";
  v57[0] = AMD_SQLITE_TYPE;
  v58[0] = AMD_SQLITE_DATA_TYPE_INT;
  v57[1] = AMD_SQLITE_NOT_NULL;
  v58[1] = v3;
  id v20 = (id)[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
  v66[3] = v20;
  v65[4] = @"value";
  uint64_t v55 = AMD_SQLITE_TYPE;
  uint64_t v56 = AMD_SQLITE_DATA_TYPE_BLOB;
  id v19 = (id)[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v66[4] = v19;
  v65[5] = @"creationTime";
  v53[0] = AMD_SQLITE_TYPE;
  v54[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v53[1] = AMD_SQLITE_NOT_NULL;
  v54[1] = v3;
  id v18 = (id)[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v66[5] = v18;
  id v17 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v65);
  v74[1] = v17;
  v73[2] = @"__AMDAggregations";
  v51[0] = @"descriptor";
  v49[0] = AMD_SQLITE_TYPE;
  v50[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v49[1] = AMD_SQLITE_NOT_NULL;
  v50[1] = v3;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  v52[0] = v16;
  v51[1] = @"domain";
  v47[0] = AMD_SQLITE_TYPE;
  v48[0] = AMD_SQLITE_DATA_TYPE_INT;
  v47[1] = AMD_SQLITE_NOT_NULL;
  v48[1] = v3;
  id v15 = (id)[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  v52[1] = v15;
  v51[2] = @"name";
  v45[0] = AMD_SQLITE_TYPE;
  v46[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v45[1] = AMD_SQLITE_NOT_NULL;
  v46[1] = v3;
  id v14 = (id)[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  void v52[2] = v14;
  v51[3] = @"creationTime";
  v43[0] = AMD_SQLITE_TYPE;
  v44[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v43[1] = AMD_SQLITE_NOT_NULL;
  v44[1] = v3;
  id v13 = (id)[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v52[3] = v13;
  id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51);
  v74[2] = v12;
  v73[3] = @"__AMDVectorDatabases";
  v41[0] = @"dbName";
  v39[0] = AMD_SQLITE_TYPE;
  v40[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v39[1] = AMD_SQLITE_NOT_NULL;
  v40[1] = v3;
  v39[2] = AMD_SQLITE_UNIQUE;
  v40[2] = &unk_26BEC17C0;
  id v11 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39);
  v42[0] = v11;
  v41[1] = @"dbPath";
  v37[0] = AMD_SQLITE_TYPE;
  v38[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v37[1] = AMD_SQLITE_NOT_NULL;
  v38[1] = v3;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v42[1] = v10;
  v41[2] = @"lastUpdateTime";
  v35[0] = AMD_SQLITE_TYPE;
  v36[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v35[1] = AMD_SQLITE_NOT_NULL;
  v36[1] = v3;
  id v9 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  v42[2] = v9;
  v41[3] = @"vectorDimension";
  v33[0] = AMD_SQLITE_TYPE;
  v34[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v33[1] = AMD_SQLITE_NOT_NULL;
  v34[1] = v3;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v42[3] = v8;
  v41[4] = @"distanceMetric";
  v31[0] = AMD_SQLITE_TYPE;
  v32[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v31[1] = AMD_SQLITE_NOT_NULL;
  v32[1] = v3;
  id v7 = (id)[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  v42[4] = v7;
  v41[5] = @"dataType";
  v29[0] = AMD_SQLITE_TYPE;
  v30[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v29[1] = AMD_SQLITE_NOT_NULL;
  v30[1] = v3;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v42[5] = v6;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:6];
  v74[3] = v5;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
  v76[2] = v4;
  v28[0] = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];

  id v27 = v28[0];
  objc_storeStrong(v28, 0);

  return v27;
}

+ (id)insertRowsHandler:(id)a3 error:(id *)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[v8 insertRowsInternal:location[0] usingSchema:0 error:a4];
  objc_storeStrong(location, 0);

  return v6;
}

+ (id)insertRowsInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = 0;
  objc_storeStrong(&v51, a4);
  id v50 = a5;
  id v49 = (id)[location[0] objectForKey:@"allInserts"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v49 count])
  {
    id v47 = v49;
    id v46 = 0;
    memset(__b, 0, sizeof(__b));
    id v28 = v47;
    if ([v28 countByEnumeratingWithState:__b objects:v61 count:16])
    {
      uint64_t v45 = *(void *)__b[1];
      id v5 = (id)[v47 objectForKey:v45];
      id v6 = v46;
      id v46 = v5;

      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v60, v45);
        _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Inserting into db '%@'", v60, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v48 = 2;
    }
    else
    {
      int v48 = 0;
    }

    if (v46)
    {
      id v41 = +[AMDSQLite getSharedInstance];
      if ([v41 isUsable])
      {
        if (!v51)
        {
          id v9 = (id)[v41 _schema];
          id v10 = v51;
          id v51 = v9;
        }
        id v40 = (id)[v46 objectForKey:@"skipValidation"];
        BOOL v39 = 0;
        if (v40) {
          BOOL v27 = [v40 intValue] != 0;
        }
        else {
          BOOL v27 = 0;
        }
        BOOL v39 = v27;
        os_log_t v38 = (os_log_t)&_os_log_internal;
        os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          if (v39) {
            id v11 = "YES";
          }
          else {
            id v11 = "NO";
          }
          __os_log_helper_16_2_1_8_32((uint64_t)v59, (uint64_t)v11);
          _os_log_debug_impl(&dword_20ABD4000, v38, v37, "SQLITE Skip validation: %s", v59, 0xCu);
        }
        objc_storeStrong((id *)&v38, 0);
        id v12 = (id)[v46 objectForKey:@"rowsData"];
        id v13 = v49;
        id v49 = v12;

        if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v49 count])
        {
          id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
          memset(v34, 0, sizeof(v34));
          id v25 = v49;
          uint64_t v26 = [v25 countByEnumeratingWithState:v34 objects:v58 count:16];
          if (v26)
          {
            uint64_t v22 = *(void *)v34[2];
            uint64_t v23 = 0;
            unint64_t v24 = v26;
            while (1)
            {
              uint64_t v21 = v23;
              if (*(void *)v34[2] != v22) {
                objc_enumerationMutation(v25);
              }
              id v35 = *(id *)(v34[1] + 8 * v23);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v33 = v35;
                v56[0] = 0x26BEB5158;
                id v20 = (id)[v33 objectForKey:0x26BEB5158];
                v57[0] = v20;
                v56[1] = @"rowsData";
                id v19 = (id)objc_msgSend(v33, "objectForKey:");
                v57[1] = v19;
                id v32 = (id)[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

                id v31 = (id)[v41 insertRows:v32 usingSchema:v51 skipValidation:v39 error:v50];
                if (*v50)
                {
                  id v17 = v36;
                  id v18 = (id)[*v50 localizedDescription];
                  objc_msgSend(v17, "addObject:");
                }
                else
                {
                  [v36 addObject:v31];
                }
                objc_storeStrong(&v31, 0);
                objc_storeStrong(&v32, 0);
                objc_storeStrong(&v33, 0);
              }
              else
              {
                [v36 addObject:@"Invalid rowset"];
              }
              ++v23;
              if (v21 + 1 >= v24)
              {
                uint64_t v23 = 0;
                unint64_t v24 = [v25 countByEnumeratingWithState:v34 objects:v58 count:16];
                if (!v24) {
                  break;
                }
              }
            }
          }

          id v54 = @"insertSummary";
          id v55 = v36;
          id v53 = (id)[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          int v48 = 1;
          objc_storeStrong(&v36, 0);
        }
        else
        {
          id v14 = +[AMDError allocError:15 withMessage:@"Missing or invalid rowsets"];
          *id v50 = v14;
          id v53 = 0;
          int v48 = 1;
        }
        objc_storeStrong(&v40, 0);
      }
      else
      {
        id v8 = (id)[v41 generateDBLoadError];
        *id v50 = v8;
        id v53 = 0;
        int v48 = 1;
      }
      objc_storeStrong(&v41, 0);
    }
    else
    {
      id v7 = +[AMDError allocError:15 withMessage:@"No insert info"];
      *id v50 = v7;
      id v53 = 0;
      int v48 = 1;
    }
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    *id v50 = +[AMDError allocError:15 withMessage:@"Missing insertion info for all DBs"];
    id v53 = 0;
    int v48 = 1;
  }
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  id v15 = v53;

  return v15;
}

+ (id)loadNewData:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = &_os_log_internal;
  char v10 = 2;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
  {
    log = v11;
    os_log_type_t type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_debug_impl(&dword_20ABD4000, log, type, "SQLITE Loading new events", v9, 2u);
  }
  objc_storeStrong(&v11, 0);
  id v8 = (id)[location[0] objectForKey:0x26BEB8578];
  id v7 = +[AMDDeviceStorage performStorageUpdateWithPayload:v8];
  id v13 = @"deviceStorageUpdateSummary";
  v14[0] = v7;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

+ (sqlite3_stmt)prepare:(id)a3 usingDb:(sqlite3 *)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = a4;
  id v19 = a5;
  id v18 = &_os_log_internal;
  os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v18, v17, "SQLITE PREPARE: %@", v24, 0xCu);
  }
  objc_storeStrong(&v18, 0);
  ppStmt = 0;
  if (v20)
  {
    unsigned int v11 = sqlite3_prepare_v2(v20, (const char *)[location[0] UTF8String], -1, &ppStmt, 0);
    if (!v11 && ppStmt)
    {
      uint64_t v22 = ppStmt;
      int v12 = 1;
    }
    else
    {
      id v10 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE PREPARE failed: %d", v11);
      id v6 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v10];
      *id v19 = v6;
      uint64_t v22 = 0;
      int v12 = 1;
      objc_storeStrong(&v10, 0);
    }
  }
  else
  {
    id v15 = (id)[NSString stringWithFormat:@"SQLITE PREPARE failed: No db!!!"];
    id v5 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v15];
    *id v19 = v5;
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v15);
      _os_log_impl(&dword_20ABD4000, oslog, v13, "%@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    uint64_t v22 = 0;
    int v12 = 1;
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
  return v22;
}

- (sqlite3_stmt)prepare:(id)a3 error:(id *)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = +[AMDSQLite prepare:location[0] usingDb:[(AMDSQLite *)v8 _db] error:a4];
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)refreshEntityTableForDomain:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = a4;
  id v18 = @"RefreshEntityTableForDomain";
  if (location[0])
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)location[0]);
      _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Refreshing entity table for domain '%@'", v27, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v13 = (id)[v21 getSharedInstance];
    if ([v13 isUsable])
    {
      if ([location[0] isEqualToString:@"apps"])
      {
        id v22 = (id)[v13 refreshAppsTable:v19];
        int v16 = 1;
      }
      else
      {
        id v10 = (id)[NSString stringWithFormat:@"Unknown domain: %@", location[0]];
        id v6 = +[AMDError allocError:22 withMessage:v10];
        *id v19 = v6;
        id v23 = v18;
        id v24 = v10;
        id v22 = (id)[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        int v16 = 1;
        objc_storeStrong(&v10, 0);
      }
    }
    else
    {
      id v12 = (id)[v13 connectionState];
      id v11 = (id)[NSString stringWithFormat:@"Entity table refresh failed. DB not usable: %@", v12];
      id v5 = +[AMDError allocError:22 withMessage:v11];
      *id v19 = v5;
      id v25 = v18;
      id v26 = v11;
      id v22 = (id)[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      int v16 = 1;
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    os_log_type_t v17 = @"No domain";
    id v4 = +[AMDError allocError:22 withMessage:v17];
    *id v19 = v4;
    id v28 = v18;
    v29[0] = v17;
    id v22 = (id)[NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    int v16 = 1;
    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  id v7 = v22;

  return v7;
}

+ (id)refreshODTPForDomain:(id)a3 error:(id *)a4
{
  v110[1] = *MEMORY[0x263EF8340];
  id v88 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v86 = a4;
  id v85 = @"RefreshODTPSQLite";
  if (location[0])
  {
    id v82 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    +[AMDPerf startMonitoringEvent:v85];
    int64_t v81 = +[AMDDomains getCodeForDomain:location[0]];
    if (v81)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v106, (uint64_t)location[0]);
        _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Refresh ODTP for domain %@", v106, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v103 = @"descriptor";
      uint64_t v101 = AMD_SQLITE_TYPE;
      uint64_t v102 = AMD_SQLITE_DATA_TYPE_BLOB;
      id v41 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101);
      id v104 = v41;
      id v40 = (id)[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      id v105 = v40;
      id v77 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v105 count:1];

      id v76 = (id)[NSString stringWithFormat:@"%@ = %lu", @"domain", v81];
      v99[0] = 0x26BEB4FB8;
      v100[0] = @"__AMDAggregations";
      v99[1] = 0x26BEB5158;
      v100[1] = @"__AMDAggregations";
      v99[2] = 0x26BEB4F98;
      v100[2] = v77;
      v99[3] = 0x26BEB50D8;
      v100[3] = v76;
      id v75 = (id)[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
      id v74 = (id)[v88 getSharedInstance];
      if ([v74 isUsable])
      {
        os_log_type_t v37 = [AMDFetchDescriptor alloc];
        id v38 = (id)[v74 _bootstrapSchema];
        id v71 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v37, "initWithDict:usingSchema:error:", v75);

        id v39 = (id)[v74 _bootstrapSchema];
        id v70 = (id)objc_msgSend(v74, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");

        if (*v86)
        {
          id v95 = v85;
          id v36 = (id)[*v86 localizedDescription];
          id v96 = v36;
          id v89 = (id)[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];

          int v83 = 1;
        }
        else
        {
          id v69 = (id)[v70 objectForKey:@"resultSet"];
          id v68 = (id)[v69 objectForKey:@"fetchResultColumnsData"];
          if (v68 && [v68 count] == 1)
          {
            os_log_t v64 = (os_log_t)&_os_log_internal;
            os_log_type_t v63 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              id v33 = (id)[v68 objectAtIndexedSubscript:0];
              uint64_t v7 = [v33 count];
              __os_log_helper_16_2_2_8_0_8_64((uint64_t)v92, v7, (uint64_t)location[0]);
              _os_log_debug_impl(&dword_20ABD4000, v64, v63, "SQLITE Refresh %lu ODTP FDs for domain %@", v92, 0x16u);
            }
            objc_storeStrong((id *)&v64, 0);
            unsigned int v62 = 0;
            id v61 = (id)[v68 objectAtIndexedSubscript:0];
            id v60 = 0;
            memset(__b, 0, sizeof(__b));
            id v31 = v61;
            uint64_t v32 = [v31 countByEnumeratingWithState:__b objects:v91 count:16];
            if (v32)
            {
              uint64_t v28 = *(void *)__b[2];
              uint64_t v29 = 0;
              unint64_t v30 = v32;
              while (1)
              {
                uint64_t v27 = v29;
                if (*(void *)__b[2] != v28) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v59 = *(void *)(__b[1] + 8 * v29);
                objc_storeStrong(&v60, 0);
                id v56 = v60;
                id v26 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v59 options:4 error:&v56];
                objc_storeStrong(&v60, v56);
                id v57 = v26;
                if (v60)
                {
                  os_log_t v55 = (os_log_t)&_os_log_internal;
                  os_log_type_t v54 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    id v24 = v55;
                    os_log_type_t v25 = v54;
                    __os_log_helper_16_0_0(v53);
                    _os_log_error_impl(&dword_20ABD4000, v24, v25, "SQLITE Stored FD not deserializable.  Check!", v53, 2u);
                  }
                  objc_storeStrong((id *)&v55, 0);
                  ++v62;
                  int v83 = 3;
                }
                else
                {
                  id v21 = [AMDFetchDescriptor alloc];
                  id v20 = v57;
                  id v23 = (id)[v74 _schema];
                  id v51 = v60;
                  id v22 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v21, "initWithDict:usingSchema:error:", v20);
                  objc_storeStrong(&v60, v51);
                  id v52 = v22;

                  if (v60)
                  {
                    os_log_t v50 = (os_log_t)&_os_log_internal;
                    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      id v18 = v50;
                      os_log_type_t v19 = v49;
                      __os_log_helper_16_0_0(v48);
                      _os_log_error_impl(&dword_20ABD4000, v18, v19, "SQLITE Stored FD not parsable.  Check!", v48, 2u);
                    }
                    objc_storeStrong((id *)&v50, 0);
                    ++v62;
                    int v83 = 3;
                  }
                  else
                  {
                    id v16 = v74;
                    id v17 = (id)[v74 _schema];
                    id v47 = v60;
                    id v8 = (id)objc_msgSend(v16, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");
                    objc_storeStrong(&v60, v47);

                    if (v60)
                    {
                      ++v62;
                    }
                    else
                    {
                      os_log_t v46 = (os_log_t)&_os_log_internal;
                      os_log_type_t v45 = OS_LOG_TYPE_DEBUG;
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                      {
                        id v13 = v46;
                        os_log_type_t v14 = v45;
                        id v15 = (id)[v52 getId];
                        id v44 = v15;
                        __os_log_helper_16_2_1_8_64((uint64_t)v90, (uint64_t)v44);
                        _os_log_debug_impl(&dword_20ABD4000, v13, v14, "SQLITE Saving result for FD '%@'", v90, 0xCu);

                        objc_storeStrong(&v44, 0);
                      }
                      objc_storeStrong((id *)&v46, 0);
                    }
                    int v83 = 0;
                  }
                  objc_storeStrong(&v52, 0);
                }
                objc_storeStrong(&v57, 0);
                ++v29;
                if (v27 + 1 >= v30)
                {
                  uint64_t v29 = 0;
                  unint64_t v30 = [v31 countByEnumeratingWithState:__b objects:v91 count:16];
                  if (!v30) {
                    break;
                  }
                }
              }
            }

            id v12 = NSString;
            uint64_t v9 = [v68 count];
            id v43 = (id)[v12 stringWithFormat:@"SQLITE Refresh FD results: total %lu, failed %u", v9, v62];
            [v82 setObject:v43 forKey:v85];
            +[AMDPerf endMonitoringEvent:v85];
            id v89 = v82;
            int v83 = 1;
            objc_storeStrong(&v43, 0);
            objc_storeStrong(&v60, 0);
            objc_storeStrong(&v61, 0);
          }
          else
          {
            os_log_t v67 = (os_log_t)&_os_log_internal;
            os_log_type_t v66 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              id v34 = v67;
              os_log_type_t v35 = v66;
              __os_log_helper_16_0_0(v65);
              _os_log_debug_impl(&dword_20ABD4000, v34, v35, "SQLITE ODTP No FDs", v65, 2u);
            }
            objc_storeStrong((id *)&v67, 0);
            id v93 = v85;
            v94 = @"No FDs";
            id v89 = (id)[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            int v83 = 1;
          }
          objc_storeStrong(&v68, 0);
          objc_storeStrong(&v69, 0);
        }
        objc_storeStrong(&v70, 0);
        objc_storeStrong(&v71, 0);
      }
      else
      {
        id v73 = (id)[v74 connectionState];
        id v72 = (id)[NSString stringWithFormat:@"SQLITE Cannot refresh OD Features: %@", v73];
        id v6 = +[AMDError allocError:22 withMessage:v72];
        id *v86 = v6;
        id v97 = v85;
        id v98 = v72;
        id v89 = (id)[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        int v83 = 1;
        objc_storeStrong(&v72, 0);
        objc_storeStrong(&v73, 0);
      }
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v77, 0);
    }
    else
    {
      v80 = @"Unknown domain";
      id v5 = +[AMDError allocError:22 withMessage:v80];
      id *v86 = v5;
      id v107 = v85;
      v108 = v80;
      id v89 = (id)[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      int v83 = 1;
      objc_storeStrong((id *)&v80, 0);
    }
    objc_storeStrong(&v82, 0);
  }
  else
  {
    v84 = @"No domain";
    id v4 = +[AMDError allocError:22 withMessage:v84];
    id *v86 = v4;
    id v109 = v85;
    v110[0] = v84;
    id v89 = (id)[NSDictionary dictionaryWithObjects:v110 forKeys:&v109 count:1];
    int v83 = 1;
    objc_storeStrong((id *)&v84, 0);
  }
  objc_storeStrong(&v85, 0);
  objc_storeStrong(location, 0);
  id v10 = v89;

  return v10;
}

+ (id)saveEvents:(id)a3 error:(id *)a4
{
  void v58[2] = *MEMORY[0x263EF8340];
  id v55 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = a4;
  id v52 = @"saveEvents";
  id v51 = +[AMDSQLite getSharedInstance];
  if ([v51 isUsable])
  {
    id v49 = (id)[location[0] objectForKey:@"streamName"];
    if (v49)
    {
      id v24 = (id)[v51 _schema];
      id v47 = (id)[v24 getTableForStream:v49];

      if (v47)
      {
        id v45 = (id)[location[0] objectForKey:@"rowsData"];
        if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v57[0] = 0x26BEB5158;
          v58[0] = v47;
          v57[1] = @"rowsData";
          v58[1] = v45;
          id v43 = (id)[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
          id v23 = (id)[v51 _schema];
          id v42 = (id)objc_msgSend(v51, "insertRows:usingSchema:error:", v43);

          if (*v53)
          {
            id v56 = 0;
            int v50 = 1;
          }
          else
          {
            id v41 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
            if (v42) {
              [v41 setObject:v42 forKey:v52];
            }
            else {
              [v41 setObject:@"SQL insert failed" forKey:v52];
            }
            id v40 = (id)[location[0] objectForKey:0x26BEAE298];
            id v39 = 0;
            id v38 = (id)[location[0] objectForKey:@"refreshEntityTable"];
            if (v38 && [v38 intValue])
            {
              if (v40)
              {
                id v36 = v39;
                id v22 = (id)[v55 refreshEntityTableForDomain:v40 error:&v36];
                objc_storeStrong(&v39, v36);
                id v37 = v22;
                if (v39)
                {
                  id v20 = NSString;
                  id v21 = (id)[v39 localizedDescription];
                  id v7 = (id)[v20 stringWithFormat:@"Error refreshing entity table: %@", v21];
                  id v8 = v37;
                  id v37 = v7;
                }
                [v41 setObject:v37 forKey:@"refreshEntity"];
                objc_storeStrong(&v37, 0);
              }
              else
              {
                id v35 = &_os_log_internal;
                char v34 = 16;
                if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
                {
                  log = v35;
                  os_log_type_t type = v34;
                  __os_log_helper_16_0_0(v33);
                  _os_log_error_impl(&dword_20ABD4000, log, type, "SQLITE SaveEvent RefreshEntity: no domain", v33, 2u);
                }
                objc_storeStrong(&v35, 0);
              }
            }
            id v32 = 0;
            id v31 = (id)[location[0] objectForKey:@"refreshODTP"];
            if (v31 && [v31 intValue])
            {
              if (v40)
              {
                id obj = v32;
                id v17 = (id)[v55 refreshODTPForDomain:v40 error:&obj];
                objc_storeStrong(&v32, obj);
                id v30 = v17;
                if (v32)
                {
                  id v15 = NSString;
                  id v16 = (id)[v32 localizedDescription];
                  id v9 = (id)[v15 stringWithFormat:@"Error refreshing ODTP: %@", v16];
                  id v10 = v30;
                  id v30 = v9;
                }
                [v41 setObject:v30 forKey:@"refreshODTP"];
                objc_storeStrong(&v30, 0);
              }
              else
              {
                os_log_t oslog = (os_log_t)&_os_log_internal;
                os_log_type_t v27 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  id v13 = oslog;
                  os_log_type_t v14 = v27;
                  __os_log_helper_16_0_0(v26);
                  _os_log_error_impl(&dword_20ABD4000, v13, v14, "SQLITE SaveEvent RefreshODTP: no domain", v26, 2u);
                }
                objc_storeStrong((id *)&oslog, 0);
              }
            }
            +[AMDFrameworkMetrics log:v41 withKey:@"SQLEventSaveSummary" atVerbosity:0];
            id v56 = v41;
            int v50 = 1;
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v32, 0);
            objc_storeStrong(&v38, 0);
            objc_storeStrong(&v39, 0);
            objc_storeStrong(&v40, 0);
            objc_storeStrong(&v41, 0);
          }
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
        }
        else
        {
          id v44 = @"No rows data";
          id v6 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v44];
          *id v53 = v6;
          id v56 = 0;
          int v50 = 1;
          objc_storeStrong((id *)&v44, 0);
        }
        objc_storeStrong(&v45, 0);
      }
      else
      {
        id v46 = (id)[NSString stringWithFormat:@"Unknown stream: %@", v49];
        id v5 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v46];
        *id v53 = v5;
        id v56 = 0;
        int v50 = 1;
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v47, 0);
    }
    else
    {
      int v48 = @"No stream name";
      id v4 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v48];
      *id v53 = v4;
      id v56 = 0;
      int v50 = 1;
      objc_storeStrong((id *)&v48, 0);
    }
    objc_storeStrong(&v49, 0);
  }
  else
  {
    *id v53 = (id)[v51 generateDBLoadError];
    id v56 = 0;
    int v50 = 1;
  }
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
  id v11 = v56;

  return v11;
}

+ (id)trimEventsForStreams:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = a4;
  if (location[0])
  {
    id v70 = +[AMDSQLite getSharedInstance];
    if ([v70 isUsable])
    {
      id v69 = (id)[v70 getDataSchema];
      if (v69)
      {
        id v67 = (id)[v69 getStreamToTableMap];
        id v66 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        memset(__b, 0, sizeof(__b));
        id obj = location[0];
        uint64_t v36 = [obj countByEnumeratingWithState:__b objects:v90 count:16];
        if (v36)
        {
          uint64_t v32 = *(void *)__b[2];
          uint64_t v33 = 0;
          unint64_t v34 = v36;
          while (1)
          {
            uint64_t v31 = v33;
            if (*(void *)__b[2] != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v65 = *(void *)(__b[1] + 8 * v33);
            id v63 = 0;
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              log = oslog;
              os_log_type_t v30 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v89, v65);
              _os_log_impl(&dword_20ABD4000, log, v30, "Performing cleanup for stream: %@", v89, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            id v60 = (id)[location[0] objectForKey:v65];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v59 = v60;
              id v58 = (id)[v67 objectForKey:v65];
              v86 = @"creationTime";
              uint64_t v84 = AMD_SQLITE_TYPE;
              uint64_t v85 = AMD_SQLITE_DATA_TYPE_INT64;
              id v27 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84);
              id v87 = v27;
              id v26 = (id)[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
              id v88 = v26;
              id v57 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];

              v82[0] = 0x26BEB4FB8;
              v83[0] = v58;
              v82[1] = 0x26BEB5158;
              v83[1] = v58;
              v82[2] = 0x26BEB4F98;
              v83[2] = v57;
              v82[3] = 0x26BEB5138;
              v83[3] = @"creationTime ASC";
              id v56 = (id)[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:4];
              id v6 = [AMDFetchDescriptor alloc];
              id v54 = v63;
              uint64_t v28 = [(AMDFetchDescriptor *)v6 initWithDict:v56 usingSchema:v69 error:&v54];
              objc_storeStrong(&v63, v54);
              id v55 = v28;
              if (v63)
              {
                id v24 = v66;
                id v25 = (id)[v63 localizedDescription];
                objc_msgSend(v24, "setObject:forKey:");

                int v71 = 3;
              }
              else
              {
                id v52 = 0;
                id v23 = (id)[v70 fetchRowsUsingSchema:v69 andDescriptor:v55 andPersist:0 error:&v52];
                objc_storeStrong(&v63, v52);
                id v53 = v23;
                if (v63)
                {
                  id v21 = v66;
                  id v22 = (id)[v63 localizedDescription];
                  objc_msgSend(v21, "setObject:forKey:");

                  int v71 = 3;
                }
                else
                {
                  id v51 = (id)[v53 objectForKey:@"resultSet"];
                  id v50 = (id)[v51 objectForKey:@"fetchResultColumnsData"];
                  if ([v50 count])
                  {
                    id v49 = (id)[v50 objectAtIndexedSubscript:0];
                    uint64_t v48 = 0;
                    uint64_t v48 = [v49 count];
                    os_log_t v47 = (os_log_t)&_os_log_internal;
                    os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      os_log_type_t v19 = v47;
                      os_log_type_t v20 = v46;
                      __os_log_helper_16_0_1_8_0((uint64_t)v81, [v59 longValue]);
                      _os_log_debug_impl(&dword_20ABD4000, v19, v20, "Record limit for stream: %ld", v81, 0xCu);
                    }
                    objc_storeStrong((id *)&v47, 0);
                    os_log_t v45 = (os_log_t)&_os_log_internal;
                    os_log_type_t v44 = OS_LOG_TYPE_DEBUG;
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      id v17 = v45;
                      os_log_type_t v18 = v44;
                      __os_log_helper_16_0_1_8_0((uint64_t)v80, v48);
                      _os_log_debug_impl(&dword_20ABD4000, v17, v18, "Current record count: %ld", v80, 0xCu);
                    }
                    objc_storeStrong((id *)&v45, 0);
                    uint64_t v16 = v48;
                    if (v16 > [v59 longValue])
                    {
                      uint64_t v43 = 0;
                      uint64_t v15 = v48;
                      uint64_t v43 = v15 - [v59 longValue];
                      os_log_t v42 = (os_log_t)&_os_log_internal;
                      os_log_type_t v41 = OS_LOG_TYPE_DEBUG;
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                      {
                        id v13 = v42;
                        os_log_type_t v14 = v41;
                        __os_log_helper_16_0_1_8_0((uint64_t)v79, v43);
                        _os_log_debug_impl(&dword_20ABD4000, v13, v14, "Elements to delete: %ld", v79, 0xCu);
                      }
                      objc_storeStrong((id *)&v42, 0);
                      id v40 = (id)[v49 objectAtIndex:v43];
                      id v39 = (id)[NSString stringWithFormat:@"%@ < %llu", @"creationTime", objc_msgSend(v40, "longLongValue")];
                      id v9 = v39;
                      uint64_t v78 = v65;
                      id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
                      id v38 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", v9);

                      id v11 = v66;
                      v76[0] = @"summary";
                      v77[0] = v38;
                      v76[1] = @"deletionTimestamp";
                      v77[1] = v40;
                      id v12 = (id)[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
                      objc_msgSend(v11, "setObject:forKey:");

                      objc_storeStrong(&v38, 0);
                      objc_storeStrong(&v39, 0);
                      objc_storeStrong(&v40, 0);
                      int v71 = 0;
                    }
                    else
                    {
                      [v66 setObject:&unk_26BEC17D8 forKey:v65];
                      int v71 = 3;
                    }
                    objc_storeStrong(&v49, 0);
                  }
                  else
                  {
                    [v66 setObject:@"Unexpected error: No CreationTime column" forKey:v65];
                    int v71 = 3;
                  }
                  objc_storeStrong(&v50, 0);
                  objc_storeStrong(&v51, 0);
                }
                objc_storeStrong(&v53, 0);
              }
              objc_storeStrong(&v55, 0);
              objc_storeStrong(&v56, 0);
              objc_storeStrong(&v57, 0);
              objc_storeStrong(&v58, 0);
              objc_storeStrong(&v59, 0);
            }
            else
            {
              [v66 setObject:@"record limit is not of type NSNumber" forKey:v65];
              int v71 = 3;
            }
            objc_storeStrong(&v60, 0);
            objc_storeStrong(&v63, 0);
            ++v33;
            if (v31 + 1 >= v34)
            {
              uint64_t v33 = 0;
              unint64_t v34 = [obj countByEnumeratingWithState:__b objects:v90 count:16];
              if (!v34) {
                break;
              }
            }
          }
        }

        +[AMDFrameworkMetrics log:v66 withKey:@"SQLTableTruncationSummary" atVerbosity:0];
        id v75 = v66;
        int v71 = 1;
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
      }
      else
      {
        id v68 = @"SQL database does not have a schema available";
        id v5 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v68];
        *id v73 = v5;
        id v75 = 0;
        int v71 = 1;
        objc_storeStrong((id *)&v68, 0);
      }
      objc_storeStrong(&v69, 0);
    }
    else
    {
      *id v73 = (id)[v70 generateDBLoadError];
      id v75 = 0;
      int v71 = 1;
    }
    objc_storeStrong(&v70, 0);
  }
  else
  {
    id v72 = @"recordLimits dict is nil";
    id v4 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v72];
    *id v73 = v4;
    id v75 = 0;
    int v71 = 1;
    objc_storeStrong((id *)&v72, 0);
  }
  objc_storeStrong(location, 0);
  id v7 = v75;

  return v7;
}

+ (id)truncateEvents:(id *)a3
{
  id v9 = a1;
  id location[2] = (id)a2;
  location[1] = a3;
  location[0] = &_os_log_internal;
  char v7 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_20ABD4000, log, type, "SQLITE Truncating all events tables", v6, 2u);
  }
  objc_storeStrong(location, 0);
  return (id)objc_msgSend(v9, "deleteEventsWithPredicate:forStreams:", 0);
}

+ (id)updateData:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v48 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v25 = type;
    __os_log_helper_16_0_0(v44);
    _os_log_debug_impl(&dword_20ABD4000, log, v25, "SQLITE Updating all data", v44, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v43 = 0;
  id v42 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  unsigned int v41 = 365;
  id v23 = (id)[location[0] objectForKey:0x26BEB8758];

  if (v23)
  {
    id v22 = (id)[location[0] objectForKey:0x26BEB8758];
    unsigned int v41 = [v22 unsignedIntValue];
  }
  id v20 = (id)[v48 deleteEventsOlderThan:v41];
  objc_msgSend(v42, "setObject:forKey:");

  id v21 = (id)[v48 loadNewData:location[0]];
  objc_msgSend(v42, "setObject:forKey:");

  id v40 = (id)[v48 getDomainsFrom:location[0]];
  if (v40)
  {
    id v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v40, "count"));
    memset(__b, 0, sizeof(__b));
    id v18 = v40;
    uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v51 count:16];
    if (v19)
    {
      uint64_t v15 = *(void *)__b[2];
      uint64_t v16 = 0;
      unint64_t v17 = v19;
      while (1)
      {
        uint64_t v14 = v16;
        if (*(void *)__b[2] != v15) {
          objc_enumerationMutation(v18);
        }
        uint64_t v34 = *(void *)(__b[1] + 8 * v16);
        id v31 = v43;
        id v13 = (id)[v48 refreshEntityTableForDomain:v34 error:&v31];
        objc_storeStrong(&v43, v31);
        id v32 = v13;
        if (v13) {
          [v35 setObject:v32 forKey:v34];
        }
        else {
          [v35 setObject:@"Entity table refresh failed" forKey:v34];
        }
        objc_storeStrong(&v32, 0);
        ++v16;
        if (v14 + 1 >= v17)
        {
          uint64_t v16 = 0;
          unint64_t v17 = [v18 countByEnumeratingWithState:__b objects:v51 count:16];
          if (!v17) {
            break;
          }
        }
      }
    }

    [v42 setObject:v35 forKey:@"refreshEntities"];
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v30 = (id)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v40, "count"));
    memset(v28, 0, sizeof(v28));
    id v11 = v40;
    uint64_t v12 = [v11 countByEnumeratingWithState:v28 objects:v50 count:16];
    if (v12)
    {
      uint64_t v7 = *(void *)v28[2];
      uint64_t v8 = 0;
      unint64_t v9 = v12;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)v28[2] != v7) {
          objc_enumerationMutation(v11);
        }
        uint64_t v29 = *(void *)(v28[1] + 8 * v8);
        id v26 = v43;
        id v5 = (id)[v48 refreshODTPForDomain:v29 error:&v26];
        objc_storeStrong(&v43, v26);
        id v27 = v5;
        if (v5) {
          [v30 setObject:v27 forKey:v29];
        }
        else {
          [v30 setObject:@"ODTP refresh failed" forKey:v29];
        }
        objc_storeStrong(&v27, 0);
        ++v8;
        if (v6 + 1 >= v9)
        {
          uint64_t v8 = 0;
          unint64_t v9 = [v11 countByEnumeratingWithState:v28 objects:v50 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    [v42 setObject:v30 forKey:@"refreshAggregations"];
    id v49 = v42;
    int v36 = 1;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    id v39 = @"SQLITE Update: no domains";
    os_log_t v38 = (os_log_t)&_os_log_internal;
    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v39);
      _os_log_error_impl(&dword_20ABD4000, v38, v37, "%@", v52, 0xCu);
    }
    objc_storeStrong((id *)&v38, 0);
    [v42 setObject:v39 forKey:@"error"];
    id v49 = v42;
    int v36 = 1;
    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  uint64_t v3 = v49;

  return v3;
}

+ (id)updateTablesHandler:(id)a3 error:(id *)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[v8 updateTablesInternal:location[0] usingSchema:0 error:a4];
  objc_storeStrong(location, 0);

  return v6;
}

+ (id)updateTablesInternal:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  int v36 = a5;
  id v35 = (id)[location[0] objectForKey:@"allUpdates"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v35 count])
  {
    id v33 = v35;
    memset(__b, 0, sizeof(__b));
    id v21 = v33;
    if ([v21 countByEnumeratingWithState:__b objects:v44 count:16])
    {
      uint64_t v32 = *(void *)__b[1];
      id v5 = (id)[v33 objectForKey:v32];
      id v6 = v35;
      id v35 = v5;

      if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v35 count])
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v43, v32);
          _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Updting db '%@'", v43, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v34 = 2;
      }
      else
      {
        id v7 = +[AMDError allocError:15 withMessage:@"No updates info"];
        *int v36 = v7;
        id v39 = 0;
        int v34 = 1;
      }
    }
    else
    {
      int v34 = 0;
    }

    if (!v34 || v34 == 2)
    {
      id v28 = +[AMDSQLite getSharedInstance];
      if ([v28 isUsable])
      {
        if (!v37)
        {
          id v9 = (id)[v28 _schema];
          id v10 = v37;
          id v37 = v9;
        }
        id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(v25, 0, sizeof(v25));
        id v19 = v35;
        uint64_t v20 = [v19 countByEnumeratingWithState:v25 objects:v42 count:16];
        if (v20)
        {
          uint64_t v16 = *(void *)v25[2];
          uint64_t v17 = 0;
          unint64_t v18 = v20;
          while (1)
          {
            uint64_t v15 = v17;
            if (*(void *)v25[2] != v16) {
              objc_enumerationMutation(v19);
            }
            uint64_t v26 = *(void *)(v25[1] + 8 * v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = (id)[v28 updateTableUsingDescriptor:v26 andSchema:v37 error:v36];
              if (*v36)
              {
                id v13 = v27;
                id v14 = (id)[*v36 localizedDescription];
                objc_msgSend(v13, "addObject:");
              }
              else
              {
                [v27 addObject:v24];
              }
              objc_storeStrong(&v24, 0);
            }
            else
            {
              [v27 addObject:@"Missing or invalid update descriptor"];
            }
            ++v17;
            if (v15 + 1 >= v18)
            {
              uint64_t v17 = 0;
              unint64_t v18 = [v19 countByEnumeratingWithState:v25 objects:v42 count:16];
              if (!v18) {
                break;
              }
            }
          }
        }

        id v40 = @"updateSummary";
        id v41 = v27;
        id v39 = (id)[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        int v34 = 1;
        objc_storeStrong(&v27, 0);
      }
      else
      {
        id v8 = (id)[v28 generateDBLoadError];
        *int v36 = v8;
        id v39 = 0;
        int v34 = 1;
      }
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v33, 0);
  }
  else
  {
    *int v36 = +[AMDError allocError:15 withMessage:@"Missing updates info for all DBs"];
    id v39 = 0;
    int v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v11 = v39;

  return v11;
}

- (id)getPredicateExtensionForTable:(id)a3 forUser:(id)a4 andDomain:(id)a5 error:(id *)a6
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = a6;
  id v23 = [(AMDSQLite *)v28 getDataSchema];
  if (!v23)
  {
    id v29 = 0;
    int v22 = 1;
    goto LABEL_23;
  }
  id v21 = (id)[v23 getSchemaForTable:location[0]];
  if (v21)
  {
    id v20 = &stru_26BEAC9D8;
    id v19 = (id)[v21 getColumns];
    id v18 = 0;
    id v14 = (id)[v19 objectForKey:@"userId"];

    if (v14)
    {
      objc_storeStrong(&v18, @"userId");
    }
    else
    {
      id v13 = (id)[v19 objectForKey:@"dsId"];

      if (v13) {
        objc_storeStrong(&v18, @"dsId");
      }
    }
    if (v18)
    {
      if (!v26)
      {
        id v6 = +[AMDError allocError:15 withMessage:@"User identifier required"];
        *id v24 = v6;
        id v29 = 0;
        int v22 = 1;
LABEL_21:
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        goto LABEL_22;
      }
      id v7 = (id)[v20 stringByAppendingFormat:@"AND %@ == '%@'", v18, v26];
    }
    id v12 = (id)[v19 objectForKey:@"domain"];

    if (v12)
    {
      if (!v25)
      {
        id v8 = +[AMDError allocError:15 withMessage:@"Domain identifier required"];
        *id v24 = v8;
        id v29 = 0;
        int v22 = 1;
        goto LABEL_21;
      }
      id v9 = (id)[v20 stringByAppendingFormat:@"AND %@ == %@", @"domain", v25];
    }
    if ([v20 isEqualToString:&stru_26BEAC9D8]) {
      id v29 = 0;
    }
    else {
      id v29 = v20;
    }
    int v22 = 1;
    goto LABEL_21;
  }
  id v29 = 0;
  int v22 = 1;
LABEL_22:
  objc_storeStrong(&v21, 0);
LABEL_23:
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  id v10 = v29;

  return v10;
}

- (id)prepareBootstrapSchema
{
  v17[1] = *MEMORY[0x263EF8340];
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id v12 = +[AMDSQLite getBootstrapSchemaDict];
  id v2 = [AMDSQLiteSchema alloc];
  id v11 = v13[0];
  id v8 = [(AMDSQLiteSchema *)v2 initWithDict:v12 error:&v11];
  objc_storeStrong(v13, v11);
  [(AMDSQLite *)v14 set_bootstrapSchema:v8];

  uint64_t v3 = [(AMDSQLite *)v14 _bootstrapSchema];
  BOOL v9 = v3 != 0;

  if (v9)
  {
    id v15 = &unk_26BEC25A8;
  }
  else
  {
    [(AMDSQLite *)v14 set_error:v13[0]];
    id v6 = NSString;
    id v7 = (id)[v13[0] localizedDescription];
    id v10 = (id)[v6 stringWithFormat:@"SQLITE Boot schema prep failure: %@", v7];

    uint64_t v16 = @"bootSchemaLoadSummary";
    v17[0] = v10;
    id v15 = (id)[NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  id v4 = v15;

  return v4;
}

- (id)bootstrapDb
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0;
  id v6 = [(AMDSQLite *)self _bootstrapSchema];
  id v7 = v9[0];
  id v5 = -[AMDSQLite applySchema:error:](self, "applySchema:error:");
  objc_storeStrong(v9, v7);
  id v8 = v5;

  if (v9[0]) {
    [(AMDSQLite *)v10 set_error:v9[0]];
  }
  id v3 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);

  return v3;
}

- (id)getError
{
  return [(AMDSQLite *)self _error];
}

- (sqlite3)getDb
{
  return [(AMDSQLite *)self _db];
}

- (id)getDataSchema
{
  return [(AMDSQLite *)self _schema];
}

- (id)getBiomeSchema
{
  return [(AMDSQLite *)self _biomeSchema];
}

- (id)getMegadomeSchema
{
  return [(AMDSQLite *)self _megadomeSchema];
}

- (id)getBootSchema
{
  return [(AMDSQLite *)self _bootstrapSchema];
}

- (id)connectionState
{
  id v19 = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(AMDSQLite *)v19 _isEnabled])
  {
    if ([(AMDSQLite *)v19 _db])
    {
      id v2 = [(AMDSQLite *)v19 _bootstrapSchema];
      BOOL v16 = v2 != 0;

      if (v16)
      {
        id v3 = [(AMDSQLite *)v19 _schema];
        BOOL v15 = v3 != 0;

        if (v15)
        {
          id v14 = [(AMDSQLite *)v19 _error];

          if (v14)
          {
            id v10 = NSString;
            id v13 = [(AMDSQLite *)v19 _error];
            id v12 = [(NSError *)v13 localizedDescription];
            id v11 = (id)[v10 stringWithFormat:@"SQLITE internal error: %@", v12];
            objc_msgSend(v18[0], "addObject:");
          }
        }
        else
        {
          [v18[0] addObject:@"SQLITE db has no data schema"];
        }
      }
      else
      {
        [v18[0] addObject:@"SQLITE db not bootstrapped"];
      }
    }
    else
    {
      [v18[0] addObject:@"SQLITE db not loaded"];
    }
  }
  else
  {
    [v18[0] addObject:@"SQLITE disabled"];
  }
  if (![v18[0] count]) {
    [v18[0] addObject:@"SQLite ready"];
  }
  id v4 = [(AMDSQLite *)v19 _megadomeSchema];
  BOOL v9 = v4 != 0;

  if (!v9) {
    [v18[0] addObject:@"no Megadome schema"];
  }
  id v5 = [(AMDSQLite *)v19 _biomeSchema];
  BOOL v8 = v5 != 0;

  if (!v8) {
    [v18[0] addObject:@"no Biome schema"];
  }
  id v17 = (id)[v18[0] componentsJoinedByString:@";"];
  id v7 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);

  return v7;
}

- (id)generateDBLoadError
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = [(AMDSQLite *)self connectionState];
  id v5 = (id)[NSString stringWithFormat:@"DB not usable: %@", v6[0]];
  id v4 = +[AMDMiscHelpers logAndCreateError:30 errorMessage:v5];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (BOOL)isUsable
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v15 = self;
  SEL v14 = a2;
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  BOOL v4 = 0;
  if ([(AMDSQLite *)self _isEnabled])
  {
    BOOL v4 = 0;
    if ([(AMDSQLite *)v15 _db])
    {
      id v12 = [(AMDSQLite *)v15 _bootstrapSchema];
      char v11 = 1;
      BOOL v4 = 0;
      if (v12)
      {
        id v10 = [(AMDSQLite *)v15 _schema];
        char v9 = 1;
        BOOL v4 = v10 != 0;
      }
    }
  }
  BOOL v16 = v4;
  if (v9) {

  }
  if (v11) {
  int v8 = 1;
  }
  id v7 = &_os_log_internal;
  os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [(AMDSQLite *)v15 connectionState];
    id location = v3;
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)location);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v7, v6, "%@", v17, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  if (v13) {
    objc_exception_rethrow();
  }
  return v16;
}

- (BOOL)isUsableInternal
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  char v9 = 0;
  BOOL v4 = 0;
  if ([(AMDSQLite *)self _isEnabled])
  {
    BOOL v4 = 0;
    if ([(AMDSQLite *)v13 _db])
    {
      id v10 = [(AMDSQLite *)v13 _bootstrapSchema];
      char v9 = 1;
      BOOL v4 = v10 != 0;
    }
  }
  BOOL v14 = v4;
  if (v9) {

  }
  int v8 = 1;
  id v7 = &_os_log_internal;
  os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [(AMDSQLite *)v13 connectionState];
    id location = v3;
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)location);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v7, v6, "%@", v15, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  if (v11) {
    objc_exception_rethrow();
  }
  return v14;
}

- (void)setEnable:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  [(AMDSQLite *)self set_isEnabled:a3];
  os_log_t oslog = (os_log_t)&_os_log_internal;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      id v3 = @"enabled";
    }
    else {
      id v3 = @"disabled";
    }
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v3);
    _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE set to: %@", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (id)loadDb
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  os_log_t v64 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)&_os_log_internal;
  os_log_type_t v62 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v69, @"0");
    _os_log_impl(&dword_20ABD4000, location[0], v62, "SQLITE Version: %@", v69, 0xCu);
  }
  objc_storeStrong((id *)location, 0);
  id v61 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v60 = (id)[v61 objectAtIndexedSubscript:0];
  id v59 = (id)[NSString stringWithFormat:@"%@.%@", @"AMDSQLite.db", @"0"];
  id v58 = (id)[v60 stringByAppendingPathComponent:v59];
  id v57 = &_os_log_internal;
  os_log_type_t v56 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v58);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v57, v56, "SQLITE Loading from DB file: %@", v68, 0xCu);
  }
  objc_storeStrong(&v57, 0);
  id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v55 setObject:@"0" forKey:@"version"];
  [(AMDSQLite *)v64 set_error:0];
  id v54 = 0;
  ppDb = 0;
  unsigned int v52 = 0;
  id v51 = @"loadDBSummary";
  id v25 = (id)[MEMORY[0x263F08850] defaultManager];
  char v26 = [v25 fileExistsAtPath:v58];

  if (v26)
  {
    id v50 = &_os_log_internal;
    char v49 = 2;
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEBUG))
    {
      id v23 = v50;
      os_log_type_t v24 = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_debug_impl(&dword_20ABD4000, v23, v24, "SQLITE DB found", v48, 2u);
    }
    objc_storeStrong(&v50, 0);
    unsigned int v52 = sqlite3_open_v2((const char *)[v58 UTF8String], &ppDb, 65538, 0);
    if (v52)
    {
      id v2 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE DB loading failed: %d", v52);
      id v3 = v54;
      id v54 = v2;
    }
    else
    {
      [(AMDSQLite *)v64 set_db:ppDb];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        id v21 = oslog;
        os_log_type_t v22 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_debug_impl(&dword_20ABD4000, v21, v22, "SQLITE Loaded DB", v45, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      unsigned int v52 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL;", 0, 0, 0);
      if (v52)
      {
        os_log_t v41 = (os_log_t)&_os_log_internal;
        os_log_type_t v40 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v67, v52);
          _os_log_debug_impl(&dword_20ABD4000, v41, v40, "SQLITE Setting journaling to WAL failed: %d", v67, 8u);
        }
        objc_storeStrong((id *)&v41, 0);
        [v55 setObject:@"loaded without WAL mode" forKey:v51];
      }
      else
      {
        os_log_t v44 = (os_log_t)&_os_log_internal;
        os_log_type_t v43 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          id v19 = v44;
          os_log_type_t v20 = v43;
          __os_log_helper_16_0_0(v42);
          _os_log_debug_impl(&dword_20ABD4000, v19, v20, "SQLITE Journaling set to WAL", v42, 2u);
        }
        objc_storeStrong((id *)&v44, 0);
        [v55 setObject:@"loaded in WAL mode" forKey:v51];
      }
      os_log_t v39 = (os_log_t)&_os_log_internal;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        id v17 = v39;
        os_log_type_t v18 = v38;
        __os_log_helper_16_0_0(v37);
        _os_log_impl(&dword_20ABD4000, v17, v18, "Running bootstrap schema refresh", v37, 2u);
      }
      objc_storeStrong((id *)&v39, 0);
      id v15 = v55;
      id v16 = [(AMDSQLite *)v64 bootstrapDb];
      objc_msgSend(v15, "addEntriesFromDictionary:");
    }
  }
  else
  {
    os_log_t v36 = (os_log_t)&_os_log_internal;
    os_log_type_t v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v58);
      _os_log_impl(&dword_20ABD4000, v36, v35, "SQLITE Creating new DB at: %@", v66, 0xCu);
    }
    objc_storeStrong((id *)&v36, 0);
    int flags = 65542;
    unsigned int v52 = sqlite3_open_v2((const char *)[v58 UTF8String], &ppDb, 65542, 0);
    if (v52)
    {
      id v4 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE DB creation failed: %d", v52);
      id v5 = v54;
      id v54 = v4;
    }
    else
    {
      [(AMDSQLite *)v64 set_db:ppDb];
      id v13 = v55;
      id v14 = [(AMDSQLite *)v64 bootstrapDb];
      objc_msgSend(v13, "addEntriesFromDictionary:");

      os_log_t v33 = (os_log_t)&_os_log_internal;
      os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        char v11 = v33;
        os_log_type_t v12 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_debug_impl(&dword_20ABD4000, v11, v12, "SQLITE Created new DB", v31, 2u);
      }
      objc_storeStrong((id *)&v33, 0);
      +[AMDFrameworkMetrics log:@"createdDb" withKey:@"SQLiteLoadDb" atVerbosity:2];
      unsigned int v52 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL;", 0, 0, 0);
      if (v52)
      {
        os_log_t v27 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v65, v52);
          _os_log_debug_impl(&dword_20ABD4000, v27, OS_LOG_TYPE_DEBUG, "SQLITE Setting journaling to WAL failed: %d", v65, 8u);
        }
        objc_storeStrong((id *)&v27, 0);
        [v55 setObject:@"created without WAL mode" forKey:v51];
      }
      else
      {
        os_log_t v30 = (os_log_t)&_os_log_internal;
        os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = v30;
          os_log_type_t v10 = v29;
          __os_log_helper_16_0_0(v28);
          _os_log_debug_impl(&dword_20ABD4000, v9, v10, "SQLITE Journaling set to WAL", v28, 2u);
        }
        objc_storeStrong((id *)&v30, 0);
        [v55 setObject:@"created in WAL mode" forKey:v51];
      }
    }
  }
  if (v54)
  {
    id v8 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:v54];
    -[AMDSQLite set_error:](v64, "set_error:");

    [(AMDSQLite *)v64 set_db:0];
    sqlite3_close(ppDb);
    [v55 setObject:v54 forKey:v51];
  }
  id v7 = v55;
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);

  return v7;
}

- (id)applySchema:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  os_log_type_t v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t v41 = a4;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    os_log_type_t v20 = type;
    id v21 = (id)[location[0] getName];
    id v38 = v21;
    __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v38);
    _os_log_impl(&dword_20ABD4000, log, v20, "SQLITE applying schema '%@'", v49, 0xCu);

    objc_storeStrong(&v38, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v18 = (id)[location[0] getTables];
  id v36 = (id)[v18 allKeys];

  os_log_t v35 = (os_log_t)&_os_log_internal;
  os_log_type_t v34 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v48, [v36 count]);
    _os_log_impl(&dword_20ABD4000, v35, v34, "SQLITE Creating %lu tables", v48, 0xCu);
  }
  objc_storeStrong((id *)&v35, 0);
  unsigned int v33 = 0;
  unsigned int v32 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v36;
  uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void *)(__b[1] + 8 * v14);
      id v29 = 0;
      id v27 = 0;
      id v11 = [(AMDSQLite *)v43 createTable:v31 usingSchema:location[0] error:&v27];
      objc_storeStrong(&v29, v27);
      id v28 = v11;
      if (v29)
      {
        ++v33;
      }
      else
      {
        if (v28) {
          [v37 setObject:v28 forKey:v31];
        }
        ++v32;
      }
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  os_log_t v26 = (os_log_t)&_os_log_internal;
  os_log_type_t v25 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v46, v32, v33);
    _os_log_impl(&dword_20ABD4000, v26, v25, "SQLITE table creation: succceed: %u, failed: %u", v46, 0xEu);
  }
  objc_storeStrong((id *)&v26, 0);
  id v7 = v37;
  v44[0] = @"succeeded";
  id v10 = (id)[NSNumber numberWithUnsignedInt:v32];
  v45[0] = v10;
  v44[1] = @"failed";
  id v9 = (id)[NSNumber numberWithUnsignedInt:v33];
  v45[1] = v9;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  objc_msgSend(v7, "setObject:forKey:");

  if (v33)
  {
    id v24 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%u Errors while applying schema", v33);
    id v4 = +[AMDError allocError:22 withMessage:v24];
    *os_log_t v41 = v4;
    [v37 setObject:v24 forKey:@"createTableError"];
    objc_storeStrong(&v24, 0);
  }
  id v23 = [(AMDSQLite *)v43 createIndices:location[0] error:v41];
  [v37 setObject:v23 forKey:@"createIndicesSummary"];
  id v6 = v37;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)createIndices:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  char v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47[1] = a4;
  v47[0] = (id)[location[0] getIndices];
  id v21 = objc_alloc(MEMORY[0x263EFF980]);
  id v46 = (id)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v47[0], "count"));
  id v20 = objc_alloc(MEMORY[0x263EFF980]);
  id v45 = (id)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v47[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = v47[0];
  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
  if (v19)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v19;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v44 = *(id *)(__b[1] + 8 * v16);
      id v42 = (id)[v47[0] objectForKey:v44];
      id v41 = (id)[v42 objectForKey:0x26BEB5158];
      id v40 = (id)[v42 objectForKey:AMD_SQLITE_COLUMNS];
      id v11 = NSString;
      id v12 = v44;
      id v13 = v41;
      id v10 = (id)[v40 componentsJoinedByString:@","];
      id v39 = (id)[v11 stringWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)", v12, v13, v10];

      id v38 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
      {
        log = v38;
        os_log_type_t v9 = type;
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v39);
        _os_log_debug_impl(&dword_20ABD4000, log, v9, "SQLITE Creating index:: '%@'", v53, 0xCu);
      }
      objc_storeStrong(&v38, 0);
      uint64_t v32 = 0;
      unsigned int v33 = &v32;
      int v34 = 0x20000000;
      int v35 = 32;
      int v36 = 1;
      queue = [(AMDSQLite *)v49 _executorQueue];
      uint64_t v24 = MEMORY[0x263EF8330];
      int v25 = -1073741824;
      int v26 = 0;
      id v27 = __33__AMDSQLite_createIndices_error___block_invoke;
      id v28 = &unk_263FE1D98;
      v31[1] = &v32;
      id v29 = v49;
      id v30 = v39;
      v31[0] = v44;
      dispatch_sync(queue, &v24);

      if (*((_DWORD *)v33 + 6))
      {
        [v45 addObject:v44];
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          id v6 = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v44);
          _os_log_impl(&dword_20ABD4000, v6, OS_LOG_TYPE_INFO, "SQLITE Created index: '%@'", v52, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        [v46 addObject:v44];
      }
      objc_storeStrong(v31, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong((id *)&v29, 0);
      _Block_object_dispose(&v32, 8);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  v50[0] = @"succeeded";
  v51[0] = v46;
  v50[1] = @"failed";
  v51[1] = v45;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
  objc_storeStrong(location, 0);

  return v5;
}

void __33__AMDSQLite_createIndices_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4[2] = (char *)a1;
  v4[1] = (char *)a1;
  v4[0] = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) _db], (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), 0, 0, v4);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = (id)[NSString stringWithFormat:@"SQLITE CREATE INDEX failure for index '%@': %s", *(void *)(a1 + 48), v4[0]];
    +[AMDFrameworkMetrics log:v3 withKey:@"createIndexError" atVerbosity:0];
    id location = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_32((uint64_t)v5, *(void *)(a1 + 48), (uint64_t)v4[0]);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SQLITE CREATE INDEX failure for index '%@': %s", v5, 0x16u);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v3, 0);
  }
}

- (id)updateSchema:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v53 = a4;
  id v52 = @"UpdateSchema";
  id v51 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if ([(AMDSQLite *)v55 _isEnabled])
  {
    id v46 = [[AMDSQLiteSchema alloc] initWithDict:location[0] error:v53];
    if (v46)
    {
      id v42 = (id)[v46 getVersionNumber];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v40 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v42);
        _os_log_impl(&dword_20ABD4000, oslog, v40, "SQLITE Attempting schema update to version %@", v61, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      BOOL v39 = 1;
      id v38 = 0;
      uint64_t v19 = [(AMDSQLite *)v55 _schema];

      if (v19)
      {
        unint64_t v17 = [(AMDSQLite *)v55 _schema];
        id v5 = [(AMDSQLiteSchema *)v17 getVersionNumber];
        id v6 = v38;
        id v38 = v5;

        uint64_t v18 = [v38 integerValue];
        BOOL v39 = v18 < [v42 integerValue];
      }
      if (v39)
      {
        id v34 = (id)[NSString stringWithFormat:@"SQLITE Update schema from version %@ to %@", v38, v42];
        os_log_t v33 = (os_log_t)&_os_log_internal;
        os_log_type_t v32 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v34);
          _os_log_impl(&dword_20ABD4000, v33, v32, "%@", v57, 0xCu);
        }
        objc_storeStrong((id *)&v33, 0);
        id v31 = 0;
        id v15 = v51;
        id v30 = 0;
        id v16 = [(AMDSQLite *)v55 applySchema:v46 error:&v30];
        objc_storeStrong(&v31, v30);
        [v15 setObject:v16 forKey:@"applySchema"];

        if (v31)
        {
          os_log_t v29 = (os_log_t)&_os_log_internal;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            id v13 = v29;
            os_log_type_t v14 = v28;
            __os_log_helper_16_0_0(v27);
            _os_log_error_impl(&dword_20ABD4000, v13, v14, "SQLITE Could not apply schema, not saving it in DB", v27, 2u);
          }
          objc_storeStrong((id *)&v29, 0);
          id v56 = v51;
          int v47 = 1;
        }
        else
        {
          id v11 = v51;
          id v12 = [(AMDSQLite *)v55 saveSchema:location[0] error:v53];
          objc_msgSend(v11, "setObject:forKey:");

          if (!*v53) {
            [(AMDSQLite *)v55 set_schema:v46];
          }
          +[AMDFrameworkMetrics log:v34 withKey:@"SQLiteSchemaUpdate" atVerbosity:2];
          [v51 setObject:v42 forKey:@"newVersion"];
          os_log_type_t v9 = [(AMDSQLite *)v55 _error];
          char v25 = 0;
          char v23 = 0;
          BOOL v10 = 0;
          if (v9)
          {
            int v26 = [(AMDSQLite *)v55 _error];
            char v25 = 1;
            uint64_t v24 = [(NSError *)v26 localizedDescription];
            char v23 = 1;
            BOOL v10 = [(NSString *)v24 isEqualToString:@"No Schema Data"];
          }
          if (v23) {

          }
          if (v25) {
          if (v10)
          }
            [(AMDSQLite *)v55 set_error:0];
          id v56 = v51;
          int v47 = 1;
        }
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v34, 0);
      }
      else
      {
        id v37 = (id)[NSString stringWithFormat:@"SQLITE Skipping schema update: current version %@", v38];
        os_log_t v36 = (os_log_t)&_os_log_internal;
        os_log_type_t v35 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v37);
          _os_log_impl(&dword_20ABD4000, v36, v35, "%@", v60, 0xCu);
        }
        objc_storeStrong((id *)&v36, 0);
        id v58 = v52;
        id v59 = v37;
        id v56 = (id)[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        int v47 = 1;
        objc_storeStrong(&v37, 0);
      }
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v42, 0);
    }
    else
    {
      id v21 = NSString;
      BOOL v4 = *v53 == 0;
      char v43 = 0;
      if (v4)
      {
        id v20 = @"unknown reason";
      }
      else
      {
        id v44 = (__CFString *)(id)[*v53 localizedDescription];
        char v43 = 1;
        id v20 = v44;
      }
      id v45 = (id)[v21 stringWithFormat:@"SQLITE new schema parse failure: %@", v20];
      if (v43) {

      }
      id v62 = v52;
      id v63 = v45;
      id v56 = (id)[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      int v47 = 1;
      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong(&v46, 0);
  }
  else
  {
    uint64_t v50 = @"SQLITE Cannot update schema: SQLite disabled";
    id v49 = &_os_log_internal;
    os_log_type_t v48 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v50);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v49, v48, "%@", v66, 0xCu);
    }
    objc_storeStrong(&v49, 0);
    id v64 = v52;
    uint64_t v65 = v50;
    id v56 = (id)[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    int v47 = 1;
    objc_storeStrong((id *)&v50, 0);
  }
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
  id v7 = v56;

  return v7;
}

- (id)saveSchema:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v28 = a4;
  id v27 = @"SaveSchema";
  id v26 = (id)[MEMORY[0x263F08900] dataWithJSONObject:location[0] options:6 error:a4];
  if (*a4)
  {
    id v16 = NSString;
    BOOL v4 = *v28 == 0;
    char v23 = 0;
    if (v4)
    {
      id v15 = @"unknown reason";
    }
    else
    {
      uint64_t v24 = (__CFString *)(id)[*v28 localizedDescription];
      char v23 = 1;
      id v15 = v24;
    }
    id v25 = (id)[v16 stringWithFormat:@"SQLITE new schema serialization failure: %@", v15];
    if (v23) {

    }
    id v39 = v27;
    v40[0] = v25;
    id v31 = (id)[NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    int v22 = 1;
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v36[0] = @"schema";
    v37[0] = v26;
    v36[1] = @"creationTime";
    id v13 = +[AMDMiscHelpers getCurrentEpochSeconds];
    v37[1] = v13;
    id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36);
    id v38 = v12;
    id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];

    v34[0] = 0x26BEB5158;
    v35[0] = @"__AMDSchema";
    v34[1] = @"rowsData";
    v35[1] = v21;
    id v20 = (id)[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v19 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    id v14 = [(AMDSQLite *)v30 deleteRowsInternal:v20 error:v28];
    objc_msgSend(v19, "addEntriesFromDictionary:");

    if (*v28)
    {
      BOOL v10 = NSString;
      id v11 = (id)[*v28 localizedDescription];
      id v18 = (id)[v10 stringWithFormat:@"SQLITE could not truncate schema table: %@", v11];

      id v32 = v27;
      id v33 = v18;
      id v31 = (id)[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      int v22 = 1;
      objc_storeStrong(&v18, 0);
    }
    else
    {
      id v7 = v30;
      os_log_type_t v9 = [(AMDSQLite *)v30 _bootstrapSchema];
      id v8 = -[AMDSQLite insertRows:usingSchema:error:](v7, "insertRows:usingSchema:error:", v20);
      objc_msgSend(v19, "addEntriesFromDictionary:");

      id v31 = v19;
      int v22 = 1;
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  id v5 = v31;

  return v5;
}

- (id)loadDataSchema
{
  v120[1] = *MEMORY[0x263EF8340];
  id v88 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_INFO))
  {
    log = location[0];
    os_log_type_t v42 = type;
    __os_log_helper_16_0_0(v85);
    _os_log_impl(&dword_20ABD4000, log, v42, "SQLITE Loading run-time schema from DB", v85, 2u);
  }
  objc_storeStrong((id *)location, 0);
  id v84 = @"loadSchemaSummary";
  [(AMDSQLite *)v88 set_schema:0];
  if ([(AMDSQLite *)v88 _db])
  {
    id v2 = [(AMDSQLite *)v88 _bootstrapSchema];
    BOOL v38 = v2 != 0;

    if (v38)
    {
      v114 = @"schema";
      v112[0] = AMD_SQLITE_TYPE;
      v113[0] = AMD_SQLITE_DATA_TYPE_BLOB;
      v112[1] = AMD_SQLITE_NOT_NULL;
      v113[1] = MEMORY[0x263EFFA88];
      id v28 = (id)[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
      id v115 = v28;
      id v27 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114);
      id v116 = v27;
      id v76 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];

      v110[0] = 0x26BEB4FB8;
      v111[0] = @"__AMDSchema";
      v110[1] = 0x26BEB5158;
      v111[1] = @"__AMDSchema";
      void v110[2] = 0x26BEB5058;
      v111[2] = @"1";
      v110[3] = 0x26BEB4F98;
      v111[3] = v76;
      id v75 = (id)[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:4];
      id v74 = 0;
      id v30 = [AMDFetchDescriptor alloc];
      id v29 = v75;
      id v32 = [(AMDSQLite *)v88 _bootstrapSchema];
      id v72 = v74;
      id v31 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v30, "initWithDict:usingSchema:error:", v29);
      objc_storeStrong(&v74, v72);
      id v73 = v31;

      id v33 = v88;
      os_log_type_t v35 = [(AMDSQLite *)v88 _bootstrapSchema];
      id v70 = v74;
      id v34 = -[AMDSQLite fetchRowsUsingSchema:andDescriptor:andPersist:error:](v33, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");
      objc_storeStrong(&v74, v70);
      id v71 = v34;

      if (v74)
      {
        [(AMDSQLite *)v88 set_error:v74];
        id v25 = NSString;
        id v26 = (id)[v74 localizedDescription];
        id v69 = (id)[v25 stringWithFormat:@"SQLITE schema fetch failure: '%@'", v26];

        id v68 = &_os_log_internal;
        os_log_type_t v67 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v109, (uint64_t)v69);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v68, v67, "%@", v109, 0xCu);
        }
        objc_storeStrong(&v68, 0);
        id v107 = v84;
        id v108 = v69;
        id v89 = (id)[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        int v80 = 1;
        objc_storeStrong(&v69, 0);
      }
      else
      {
        id v66 = (id)[v71 objectForKey:@"resultSet"];
        id v65 = (id)[v66 objectForKey:@"fetchResultColumnsData"];
        char v63 = 0;
        BOOL v24 = 1;
        if (v65)
        {
          BOOL v24 = 1;
          if ([v65 count])
          {
            id v64 = (id)[v65 objectAtIndexedSubscript:0];
            char v63 = 1;
            BOOL v24 = [v64 count] == 0;
          }
        }
        if (v63) {

        }
        if (v24)
        {
          id v62 = &_os_log_internal;
          os_log_type_t v61 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v106, @"No Schema Data");
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v62, v61, "%@", v106, 0xCu);
          }
          objc_storeStrong(&v62, 0);
          id v23 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 22);
          -[AMDSQLite set_error:](v88, "set_error:");

          id v104 = v84;
          id v105 = @"No Schema Data";
          id v89 = (id)[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
          int v80 = 1;
        }
        else
        {
          id v22 = (id)objc_msgSend(v65, "objectAtIndexedSubscript:");
          id v60 = (id)[v22 objectAtIndexedSubscript:0];

          if (v60 && [v60 length])
          {
            id v55 = v74;
            id v18 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v60 options:4 error:&v55];
            objc_storeStrong(&v74, v55);
            id v56 = v18;
            if (v18 && !v74)
            {
              id v3 = [AMDSQLiteSchema alloc];
              id v51 = v74;
              id v13 = [(AMDSQLiteSchema *)v3 initWithDict:v56 error:&v51];
              objc_storeStrong(&v74, v51);
              [(AMDSQLite *)v88 set_schema:v13];

              BOOL v4 = [(AMDSQLite *)v88 _schema];
              BOOL v14 = v4 != 0;

              if (v14)
              {
                os_log_type_t v9 = [(AMDSQLite *)v88 _schema];
                id v45 = [(AMDSQLiteSchema *)v9 getVersion];

                BOOL v10 = [(AMDSQLite *)v88 _schema];
                id v44 = [(AMDSQLiteSchema *)v10 getTables];

                os_log_t v43 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v94, (uint64_t)v45);
                  _os_log_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_INFO, "SQLITE Loaded schema version %@", v94, 0xCu);
                }
                objc_storeStrong((id *)&v43, 0);
                id v92 = v84;
                v90[0] = @"version";
                v91[0] = v45;
                v90[1] = @"tableCount";
                id v8 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
                v91[1] = v8;
                id v7 = (id)[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
                id v93 = v7;
                id v89 = (id)[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];

                int v80 = 1;
                objc_storeStrong(&v44, 0);
                objc_storeStrong(&v45, 0);
              }
              else
              {
                [(AMDSQLite *)v88 set_error:v74];
                id v12 = NSString;
                char v48 = 0;
                if (v74)
                {
                  id v49 = (id)[v74 localizedDescription];
                  char v48 = 1;
                  id v11 = (__CFString *)v49;
                }
                else
                {
                  id v11 = @"unknown";
                }
                id v50 = (id)[v12 stringWithFormat:@"Fail: '%@'", v11];
                if (v48) {

                }
                os_log_t v47 = (os_log_t)&_os_log_internal;
                os_log_type_t v46 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v97, (uint64_t)v50);
                  _os_log_error_impl(&dword_20ABD4000, v47, v46, "%@", v97, 0xCu);
                }
                objc_storeStrong((id *)&v47, 0);
                id v95 = v84;
                id v96 = v50;
                id v89 = (id)[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                int v80 = 1;
                objc_storeStrong(&v50, 0);
              }
            }
            else
            {
              objc_storeStrong(&v74, 0);
              id v16 = NSString;
              id v17 = (id)[v74 localizedDescription];
              id v54 = (id)[v16 stringWithFormat:@"Error deserializing schema: %@", v17];

              os_log_t v53 = (os_log_t)&_os_log_internal;
              os_log_type_t v52 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v100, (uint64_t)v54);
                _os_log_error_impl(&dword_20ABD4000, v53, v52, "%@", v100, 0xCu);
              }
              objc_storeStrong((id *)&v53, 0);
              id v15 = +[AMDError allocError:22 withMessage:v54];
              -[AMDSQLite set_error:](v88, "set_error:");

              id v98 = v84;
              id v99 = v54;
              id v89 = (id)[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
              int v80 = 1;
              objc_storeStrong(&v54, 0);
            }
            objc_storeStrong(&v56, 0);
          }
          else
          {
            id v21 = NSString;
            if (v60) {
              unsigned int v20 = [v60 length];
            }
            else {
              unsigned int v20 = -1;
            }
            id v59 = (id)[v21 stringWithFormat:@"No schema data, size: %d", v20];
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v57 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v103, (uint64_t)v59);
              _os_log_error_impl(&dword_20ABD4000, oslog, v57, "%@", v103, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            id v19 = +[AMDError allocError:22 withMessage:v59];
            -[AMDSQLite set_error:](v88, "set_error:");

            id v101 = v84;
            id v102 = v59;
            id v89 = (id)[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
            int v80 = 1;
            objc_storeStrong(&v59, 0);
          }
          objc_storeStrong(&v60, 0);
        }
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v66, 0);
      }
      objc_storeStrong(&v71, 0);
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
    }
    else
    {
      id v79 = &_os_log_internal;
      os_log_type_t v78 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_ERROR))
      {
        os_log_t v36 = v79;
        os_log_type_t v37 = v78;
        __os_log_helper_16_0_0(v77);
        _os_log_error_impl(&dword_20ABD4000, v36, v37, "Not bootstrapped", v77, 2u);
      }
      objc_storeStrong(&v79, 0);
      id v117 = v84;
      v118 = @"Not bootstrapped";
      id v89 = (id)[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      int v80 = 1;
    }
  }
  else
  {
    id v83 = &_os_log_internal;
    os_log_type_t v82 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_ERROR))
    {
      id v39 = v83;
      os_log_type_t v40 = v82;
      __os_log_helper_16_0_0(v81);
      _os_log_error_impl(&dword_20ABD4000, v39, v40, "No DB", v81, 2u);
    }
    objc_storeStrong(&v83, 0);
    id v119 = v84;
    v120[0] = @"No DB";
    id v89 = (id)[NSDictionary dictionaryWithObjects:v120 forKeys:&v119 count:1];
    int v80 = 1;
  }
  objc_storeStrong(&v84, 0);
  id v5 = v89;

  return v5;
}

- (id)loadBiomeSchema
{
  BOOL v4 = [(AMDSQLite *)self _schema];
  -[AMDSQLite set_biomeSchema:](self, "set_biomeSchema:");

  id v2 = (void *)MEMORY[0x263EFFA78];

  return v2;
}

- (id)loadMegadomeSchema
{
  BOOL v4 = [(AMDSQLite *)self _schema];
  -[AMDSQLite set_megadomeSchema:](self, "set_megadomeSchema:");

  id v2 = (void *)MEMORY[0x263EFFA78];

  return v2;
}

- (id)createTable:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  os_log_type_t v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = a5;
  id v31 = &_os_log_internal;
  os_log_type_t v30 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)location[0]);
    _os_log_impl(&dword_20ABD4000, (os_log_t)v31, v30, "SQLITE Creating table '%@'", v44, 0xCu);
  }
  objc_storeStrong(&v31, 0);
  id v29 = @"createTableStatus";
  if ([(AMDSQLite *)v35 _db])
  {
    id v26 = (id)[v33 getCreateTableStatementFor:location[0]];
    if (v26)
    {
      uint64_t v20 = 0;
      id v21 = &v20;
      int v22 = 0x20000000;
      int v23 = 32;
      int v24 = 1;
      queue = [(AMDSQLite *)v35 _executorQueue];
      uint64_t v12 = MEMORY[0x263EF8330];
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = __43__AMDSQLite_createTable_usingSchema_error___block_invoke;
      id v16 = &unk_263FE1D98;
      v19[1] = &v20;
      id v17 = v35;
      id v18 = v26;
      v19[0] = location[0];
      dispatch_sync(queue, &v12);

      if (*((_DWORD *)v21 + 6))
      {
        id v11 = (id)[NSString stringWithFormat:@"Unable to create %@", location[0]];
        *id v32 = +[AMDError allocError:22 withMessage:v11];
        id v36 = 0;
        int v27 = 1;
        objc_storeStrong(&v11, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)location[0]);
          _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Created table '%@'", v39, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v37 = v29;
        BOOL v38 = @"created";
        id v36 = (id)[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        int v27 = 1;
      }
      objc_storeStrong(v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong((id *)&v17, 0);
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      id v25 = (id)[NSString stringWithFormat:@"SQLITE CREATE: No table '%@' in schema", location[0]];
      *id v32 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v25];
      id v40 = v29;
      id v41 = v25;
      id v36 = (id)[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      int v27 = 1;
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v28 = (id)[NSString stringWithFormat:@"SQLITE CREATE: No db!!"];
    *id v32 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v28];
    id v42 = v29;
    id v43 = v28;
    id v36 = (id)[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    int v27 = 1;
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  id v5 = v36;

  return v5;
}

void __43__AMDSQLite_createTable_usingSchema_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4[2] = (char *)a1;
  v4[1] = (char *)a1;
  v4[0] = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) _db], (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), 0, 0, v4);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = (id)[NSString stringWithFormat:@"SQLITE CREATE TABLE failure for table '%@': %s", *(void *)(a1 + 48), v4[0]];
    +[AMDFrameworkMetrics log:v3 withKey:@"createTableError" atVerbosity:0];
    id location = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_32((uint64_t)v5, *(void *)(a1 + 48), (uint64_t)v4[0]);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)location, OS_LOG_TYPE_DEBUG, "SQLITE CREATE TABLE failure for table '%@': %s", v5, 0x16u);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v3, 0);
  }
}

- (id)validateRowsData:(id)a3 tableSchema:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  id v40 = a5;
  id v39 = (id)[v41 getColumns];
  id v38 = (id)[v41 getRequiredColumns];
  id v20 = objc_alloc(MEMORY[0x263EFF980]);
  id v37 = (id)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(location[0], "count"));
  for (unsigned int i = 0; ; ++i)
  {
    unint64_t v17 = i;
    if (v17 >= [location[0] count]) {
      break;
    }
    id v35 = (id)[location[0] objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v35;
      char v31 = 1;
      id v30 = (id)[v38 mutableCopy];
      memset(__b, 0, sizeof(__b));
      id v15 = v32;
      uint64_t v16 = [v15 countByEnumeratingWithState:__b objects:v46 count:16];
      if (v16)
      {
        uint64_t v12 = *(void *)__b[2];
        uint64_t v13 = 0;
        unint64_t v14 = v16;
        while (1)
        {
          uint64_t v11 = v13;
          if (*(void *)__b[2] != v12) {
            objc_enumerationMutation(v15);
          }
          id v29 = *(id *)(__b[1] + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id v26 = v29;
          id v25 = (id)[v39 objectForKey:v26];
          if (v25)
          {
            [v30 removeObject:v26];
            id v24 = (id)[v32 objectForKey:v29];
            char v5 = [v25 getType];
            if (v5)
            {
              uint64_t v7 = v5;
              char v6 = 1;
            }
            else
            {
              uint64_t v7 = 0;
              char v6 = 0;
            }
            if ((v6 & 1) == 0)
            {
              switch(v7)
              {
                case 0:
                  break;
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                  objc_opt_class();
                  char v31 = objc_opt_isKindOfClass() & 1;
                  goto LABEL_20;
                default:
                  JUMPOUT(0);
              }
            }
            char v31 = 0;
LABEL_20:
            if (v31) {
              int v33 = 0;
            }
            else {
              int v33 = 5;
            }
            objc_storeStrong(&v24, 0);
          }
          else
          {
            int v33 = 6;
          }
          objc_storeStrong(&v25, 0);
          objc_storeStrong(&v26, 0);
          if (v33 && v33 != 6) {
            goto LABEL_29;
          }
          ++v13;
          if (v11 + 1 >= v14)
          {
            uint64_t v13 = 0;
            unint64_t v14 = [v15 countByEnumeratingWithState:__b objects:v46 count:16];
            if (!v14) {
              goto LABEL_28;
            }
          }
        }
        int v27 = @"SQLITE INSERT: invalid row data: bad column name";
        *id v40 = +[AMDMiscHelpers logAndCreateError:15 errorMessage:v27];
        id v43 = 0;
        int v33 = 1;
        objc_storeStrong((id *)&v27, 0);
      }
      else
      {
LABEL_28:
        int v33 = 0;
      }
LABEL_29:

      if (!v33 || v33 == 5)
      {
        if ((v31 & 1) == 0 || [v30 count])
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            log = oslog;
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v45, i, (uint64_t)v30);
            _os_log_debug_impl(&dword_20ABD4000, log, type, "SQLITE Row %u not valid, missing required columns: %@", v45, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        else
        {
          [v37 addObject:v32];
        }
        int v33 = 0;
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v34 = @"SQLITE INSERT: invalid row data";
      *id v40 = +[AMDMiscHelpers logAndCreateError:15 errorMessage:v34];
      id v43 = 0;
      int v33 = 1;
      objc_storeStrong((id *)&v34, 0);
    }
    objc_storeStrong(&v35, 0);
    if (v33) {
      goto LABEL_44;
    }
  }
  os_log_t v21 = (os_log_t)&_os_log_internal;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v44, [location[0] count], objc_msgSend(v37, "count"));
    _os_log_debug_impl(&dword_20ABD4000, v21, OS_LOG_TYPE_DEBUG, "SQLITE Total rows: %lu, valid: %lu", v44, 0x16u);
  }
  objc_storeStrong((id *)&v21, 0);
  id v43 = v37;
  int v33 = 1;
LABEL_44:
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  id v8 = v43;

  return v8;
}

- (id)insertRows:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = [(AMDSQLite *)v11 insertRows:location[0] usingSchema:v9 skipValidation:0 error:a5];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)insertRows:(id)a3 usingSchema:(id)a4 skipValidation:(BOOL)a5 error:(id *)a6
{
  v73[2] = *MEMORY[0x263EF8340];
  id v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  BOOL v61 = a5;
  id v60 = a6;
  id v59 = @"insertedRowsCount";
  id v58 = @"totalRowsCount";
  id v57 = (id)[location[0] objectForKey:0x26BEB5158];
  id v56 = (id)[location[0] objectForKey:@"rowsData"];
  if (v56)
  {
    id v51 = (id)[v62 getSchemaForTable:v57];
    if (v51)
    {
      id v49 = v56;
      if (v61)
      {
        id v48 = &_os_log_internal;
        os_log_type_t v47 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v57);
          _os_log_impl(&dword_20ABD4000, (os_log_t)v48, v47, "SQLITE INSERT: Skipping validation for table '%@'", v71, 0xCu);
        }
        objc_storeStrong(&v48, 0);
      }
      else
      {
        id v6 = [(AMDSQLite *)v64 validateRowsData:v56 tableSchema:v51 error:v60];
        id v7 = v49;
        id v49 = v6;
      }
      if (v49)
      {
        id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v45 = 0;
        id v43 = 0;
        id v14 = (id)[v62 getInsertStatementFor:v51 hasColumns:v46 requiresColumns:&v43];
        objc_storeStrong(&v45, v43);
        id v44 = v14;
        id v42 = &_os_log_internal;
        os_log_type_t v41 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v44);
          _os_log_impl(&dword_20ABD4000, (os_log_t)v42, v41, "Prepared INSERT statement: %@", v70, 0xCu);
        }
        objc_storeStrong(&v42, 0);
        id v40 = [(AMDSQLite *)v64 prepare:v44 error:v60];
        if (v40)
        {
          uint64_t v36 = 0;
          id v37 = &v36;
          int v38 = 0x20000000;
          uint64_t v39 = 32;
          HIDWORD(v39) = [v49 count];
          uint64_t v31 = 0;
          id v32 = &v31;
          int v33 = 0x20000000;
          int v34 = 32;
          int v35 = 0;
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v69, *((_DWORD *)v37 + 6), (uint64_t)v57);
            _os_log_debug_impl(&dword_20ABD4000, oslog, v29, "SQLITE Inserting %u rows into table '%@'", v69, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
          queue = [(AMDSQLite *)v64 _executorQueue];
          uint64_t v21 = MEMORY[0x263EF8330];
          int v22 = -1073741824;
          int v23 = 0;
          id v24 = __57__AMDSQLite_insertRows_usingSchema_skipValidation_error___block_invoke;
          id v25 = &unk_263FE1DC0;
          v28[1] = &v36;
          id v28[3] = v40;
          id v26 = v49;
          id v27 = v46;
          v28[0] = v45;
          v28[2] = &v31;
          dispatch_sync(queue, &v21);

          sqlite3_finalize(v40);
          os_log_t v20 = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_3_4_0_4_0_8_64((uint64_t)v68, *((_DWORD *)v32 + 6), *((_DWORD *)v37 + 6), (uint64_t)v57);
            _os_log_debug_impl(&dword_20ABD4000, v20, OS_LOG_TYPE_DEBUG, "SQLITE Inserted %u of %u rows in table '%@'", v68, 0x18u);
          }
          objc_storeStrong((id *)&v20, 0);
          v66[0] = v59;
          id v11 = (id)[NSNumber numberWithUnsignedInt:*((unsigned int *)v32 + 6)];
          v67[0] = v11;
          v66[1] = v58;
          id v10 = (id)[NSNumber numberWithUnsignedInt:*((unsigned int *)v37 + 6)];
          v67[1] = v10;
          id v65 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];

          int v52 = 1;
          objc_storeStrong(v28, 0);
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v26, 0);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v36, 8);
        }
        else
        {
          id v13 = (id)[*v60 localizedDescription];
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          id v65 = 0;
          int v52 = 1;
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
      }
      else
      {
        id v65 = 0;
        int v52 = 1;
      }
      objc_storeStrong(&v49, 0);
    }
    else
    {
      id v50 = (id)[NSString stringWithFormat:@"SQLITE INSERT: table '%@' does not exist'", v57];
      id *v60 = +[AMDMiscHelpers logAndCreateError:15 errorMessage:v50];
      id v65 = 0;
      int v52 = 1;
      objc_storeStrong(&v50, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    id v55 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
    {
      log = v55;
      os_log_type_t v16 = type;
      __os_log_helper_16_0_0(v53);
      _os_log_debug_impl(&dword_20ABD4000, log, v16, "SQLITE Nothing to insert", v53, 2u);
    }
    objc_storeStrong(&v55, 0);
    v72[0] = v59;
    v73[0] = &unk_26BEC17D8;
    v72[1] = v58;
    v73[1] = &unk_26BEC17D8;
    id v65 = (id)[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
    int v52 = 1;
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
  id v8 = v65;

  return v8;
}

void __57__AMDSQLite_insertRows_usingSchema_skipValidation_error___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v37 = a1;
  uint64_t v36 = a1;
  for (unsigned int i = 0; i < *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24); ++i)
  {
    int v34 = 0;
    int v34 = sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 72));
    if (v34)
    {
      id location = &_os_log_internal;
      char v32 = 16;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = location;
        os_log_type_t type = v32;
        __os_log_helper_16_0_2_4_0_4_0((uint64_t)v41, i, v34);
        _os_log_error_impl(&dword_20ABD4000, log, type, "SQLITE could not clear bindings for row %u: %d", v41, 0xEu);
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      id v31 = (id)[*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      char v30 = 0;
      for (unsigned int j = 0; ; ++j)
      {
        unint64_t v15 = j;
        if (v15 >= [*(id *)(a1 + 40) count]) {
          break;
        }
        id v28 = (id)[*(id *)(a1 + 40) objectAtIndexedSubscript:j];
        id v27 = (id)[v28 getName];
        id v26 = (id)[v31 objectForKey:v27];
        if (v26)
        {
          char v24 = 0;
          char v14 = [v28 getType];
          char v24 = v14;
          if (v14)
          {
            uint64_t v2 = v14;
            char v1 = 1;
          }
          else
          {
            uint64_t v2 = 0;
            char v1 = 0;
          }
          if ((v1 & 1) == 0)
          {
            switch(v2)
            {
              case 0:
                break;
              case 1:
                uint64_t v12 = *(sqlite3_stmt **)(a1 + 72);
                int v13 = j + 1;
                id v11 = (void *)[v26 bytes];
                int v34 = sqlite3_bind_blob(v12, v13, v11, [v26 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
                break;
              case 2:
                id v9 = *(sqlite3_stmt **)(a1 + 72);
                int v10 = j + 1;
                [v26 doubleValue];
                int v34 = sqlite3_bind_double(v9, v10, v3);
                break;
              case 3:
                int v34 = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 72), j + 1, [v26 intValue]);
                break;
              case 4:
                int v34 = sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), j + 1, [v26 longLongValue]);
                break;
              case 5:
                int v34 = sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 72), j + 1, (const char *)[v26 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
                break;
              default:
                JUMPOUT(0);
            }
          }
          if (v34)
          {
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              id v7 = oslog;
              os_log_type_t v8 = v22;
              __os_log_helper_16_2_4_8_64_4_0_4_0_4_0((uint64_t)v40, (uint64_t)v27, v24, i, v34);
              _os_log_debug_impl(&dword_20ABD4000, v7, v8, "SQLITE Bind failed for column '%@', type: %u, row %u: %d", v40, 0x1Eu);
            }
            objc_storeStrong((id *)&oslog, 0);
            int v25 = 5;
          }
          else
          {
            int v25 = 0;
          }
        }
        else if ([*(id *)(a1 + 48) containsObject:v27])
        {
          char v30 = 1;
          int v25 = 5;
        }
        else
        {
          int v25 = 7;
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        if (v25 == 5) {
          break;
        }
      }
      if ((v30 & 1) != 0 || v34)
      {
        os_log_t v21 = (os_log_t)&_os_log_internal;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          char v5 = v21;
          os_log_type_t v6 = v20;
          __os_log_helper_16_0_3_4_0_4_0_4_0((uint64_t)v39, i, v30 & 1, v34);
          _os_log_impl(&dword_20ABD4000, v5, v6, "SQLITE Skipping row %u, rowBad: %u, sqlResponse: %d", v39, 0x14u);
        }
        objc_storeStrong((id *)&v21, 0);
        int v25 = 4;
      }
      else
      {
        int v34 = sqlite3_step(*(sqlite3_stmt **)(a1 + 72));
        if (v34 == 101)
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        }
        else
        {
          os_log_t v19 = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            BOOL v4 = v19;
            __os_log_helper_16_0_2_4_0_4_0((uint64_t)v38, i, v34);
            _os_log_error_impl(&dword_20ABD4000, v4, OS_LOG_TYPE_ERROR, "SQLITE INSERT failure (row %u): %d", v38, 0xEu);
          }
          objc_storeStrong((id *)&v19, 0);
        }
        sqlite3_reset(*(sqlite3_stmt **)(a1 + 72));
        int v25 = 0;
      }
      objc_storeStrong(&v31, 0);
    }
  }
}

- (id)fetchRows:(id)a3 andPersist:(BOOL)a4 error:(id *)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(AMDSQLite *)v11 isUsable])
  {
    id v7 = v11;
    os_log_type_t v8 = [(AMDSQLite *)v11 _schema];
    id v12 = -[AMDSQLite fetchRowsUsingSchema:andDescriptor:andPersist:error:](v7, "fetchRowsUsingSchema:andDescriptor:andPersist:error:");
  }
  else
  {
    *a5 = [(AMDSQLite *)v11 generateDBLoadError];
    id v12 = 0;
  }
  objc_storeStrong(location, 0);
  char v5 = v12;

  return v5;
}

- (id)fetchRowsUsingSchema:(id)a3 andDescriptor:(id)a4 andPersist:(BOOL)a5 error:(id *)a6
{
  unint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v11 = v15;
  uint64_t v6 = [(AMDSQLite *)v15 _db];
  id v12 = [(AMDSQLite *)v11 fetchRowsFrom:v6 usingDescriptor:v13 andSchema:location[0] columnMajorOutput:1 rowMajorOutput:0 andPersist:a5 error:a6];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v12;
}

- (id)fetchRowsFrom:(sqlite3 *)a3 usingDescriptor:(id)a4 andSchema:(id)a5 columnMajorOutput:(BOOL)a6 rowMajorOutput:(BOOL)a7 andPersist:(BOOL)a8 error:(id *)a9
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  os_log_type_t v82 = self;
  SEL v81 = a2;
  int v80 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v78 = 0;
  objc_storeStrong(&v78, a5);
  BOOL v77 = a6;
  BOOL v76 = a7;
  BOOL v75 = a8;
  id v74 = a9;
  id v73 = (id)[location getStatement];
  if (!v73)
  {
    *id v74 = +[AMDError allocError:22 withMessage:@"Fetch descriptor unusable!"];
    id v83 = 0;
    int v72 = 1;
    goto LABEL_28;
  }
  pStmt = +[AMDSQLite prepare:v73 usingDb:v80 error:v74];
  if (!pStmt)
  {
    id v31 = (id)[*v74 localizedDescription];
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

    id v83 = 0;
    int v72 = 1;
    goto LABEL_28;
  }
  char v70 = 0;
  id v69 = (id)[location getColumnSpecs];
  id v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v69, "count"));
  for (unsigned int i = 0; i < (unint64_t)[v69 count]; ++i)
  {
    id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v68 addObject:v30];
  }
  id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v61 = 0;
  id v62 = &v61;
  int v63 = 0x20000000;
  int v64 = 32;
  char v65 = 0;
  uint64_t v54 = 0;
  id v55 = &v54;
  int v56 = 838860800;
  int v57 = 48;
  id v58 = __Block_byref_object_copy__0;
  id v59 = __Block_byref_object_dispose__0;
  id v60 = 0;
  queue = [(AMDSQLite *)v82 _executorQueue];
  uint64_t v44 = MEMORY[0x263EF8330];
  int v45 = -1073741824;
  int v46 = 0;
  os_log_type_t v47 = __103__AMDSQLite_fetchRowsFrom_usingDescriptor_andSchema_columnMajorOutput_rowMajorOutput_andPersist_error___block_invoke;
  id v48 = &unk_263FE1DE8;
  v51[3] = pStmt;
  id v49 = v69;
  v51[1] = &v54;
  void v51[2] = &v61;
  BOOL v52 = v77;
  id v50 = v68;
  BOOL v53 = v76;
  v51[0] = v66;
  dispatch_sync(queue, &v44);

  if ((v62[3] & 1) == 0)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      id v26 = (id)[v68 objectAtIndexedSubscript:0];
      uint64_t v27 = [v26 count];
      id v25 = (id)[location getId];
      id v41 = v25;
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v91, v27, (uint64_t)v41);
      _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE Fetched %lu rows from descriptor '%@'", v91, 0x16u);

      objc_storeStrong(&v41, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    id v40 = (id)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v69, "count"));
    memset(__b, 0, sizeof(__b));
    id v22 = v69;
    uint64_t v23 = [v22 countByEnumeratingWithState:__b objects:v90 count:16];
    if (v23)
    {
      uint64_t v19 = *(void *)__b[2];
      uint64_t v20 = 0;
      unint64_t v21 = v23;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)__b[2] != v19) {
          objc_enumerationMutation(v22);
        }
        id v39 = *(id *)(__b[1] + 8 * v20);
        id v17 = v40;
        v88[0] = @"name";
        id v16 = (id)[v39 getSelectColumnName];
        v89[0] = v16;
        v88[1] = AMD_SQLITE_TYPE;
        id v15 = (id)[v39 getTypeString];
        v89[1] = v15;
        id v14 = (id)[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
        objc_msgSend(v17, "addObject:");

        ++v20;
        if (v18 + 1 >= v21)
        {
          uint64_t v20 = 0;
          unint64_t v21 = [v22 countByEnumeratingWithState:__b objects:v90 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    v86[0] = @"fetchResultColumnsInfo";
    v87[0] = v40;
    v86[1] = @"fetchResultColumnsData";
    v87[1] = v68;
    v86[2] = @"fetchResultRowsData";
    v87[2] = v66;
    id v37 = (id)[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:3];
    id v36 = 0;
    if (v75)
    {
      id v9 = (id)[location persist:v37 error:v74];
      id v10 = v36;
      id v36 = v9;

      if (*v74)
      {
        id v83 = 0;
        int v72 = 1;
LABEL_24:
        objc_storeStrong(&v36, 0);
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v40, 0);
        goto LABEL_25;
      }
    }
    else
    {
      objc_storeStrong(&v36, @"Persistance not requested");
    }
    v84[0] = @"resultSet";
    v85[0] = v37;
    v84[1] = @"persistStatus";
    v85[1] = v36;
    id v83 = (id)[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
    int v72 = 1;
    goto LABEL_24;
  }
  id v28 = (id) v55[5];
  *id v74 = v28;
  id v83 = 0;
  int v72 = 1;
LABEL_25:
  objc_storeStrong(v51, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v49, 0);
  _Block_object_dispose(&v54, 8);
  objc_storeStrong(&v60, 0);
  _Block_object_dispose(&v61, 8);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  int v13 = v72;
  sqlite3_finalize(pStmt);
  if (v70) {
    objc_exception_rethrow();
  }
  int v72 = v13;
  if (v13 == 2)
  {
    __break(1u);
    JUMPOUT(0x20AC15BECLL);
  }
LABEL_28:
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&location, 0);
  id v11 = v83;

  return v11;
}

void __103__AMDSQLite_fetchRowsFrom_usingDescriptor_andSchema_columnMajorOutput_rowMajorOutput_andPersist_error___block_invoke(uint64_t a1)
{
  void v50[2] = (id)a1;
  v50[1] = (id)a1;
  do
  {
    if (sqlite3_step(*(sqlite3_stmt **)(a1 + 72)) != 100) {
      break;
    }
    v50[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    for (unsigned int i = 0; ; ++i)
    {
      unint64_t v39 = i;
      if (v39 >= [*(id *)(a1 + 32) count]) {
        break;
      }
      id location = (id)[*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      int v47 = 0;
      int v47 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 72), i);
      char v46 = 0;
      char v46 = [location getType];
      if (v46)
      {
        uint64_t v2 = v46;
        char v1 = 1;
      }
      else
      {
        uint64_t v2 = 0;
        char v1 = 0;
      }
      if (v1)
      {
LABEL_33:
        id v15 = +[AMDError allocError:22 withMessage:@"Unexpected data type. Check!"];
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
      else
      {
        switch(v2)
        {
          case 0:
            goto LABEL_33;
          case 1:
            if (v47 == 5)
            {
              id v37 = v50[0];
              int v38 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v45 length:0];
              objc_msgSend(v37, "addObject:");
            }
            else if (v47 == 4)
            {
              id v35 = v50[0];
              id v34 = objc_alloc(MEMORY[0x263EFF8F8]);
              int v33 = sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 72), i);
              id v36 = objc_msgSend(v34, "initWithBytes:length:", v33, sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 72), i));
              objc_msgSend(v35, "addObject:");
            }
            else
            {
              id v3 = +[AMDError allocError:22 withMessage:@"Data not blob"];
              uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
              char v5 = *(void **)(v4 + 40);
              *(void *)(v4 + 40) = v3;

              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            break;
          case 2:
            if (v47 == 5)
            {
              [v50[0] addObject:&unk_26BEC3750];
            }
            else if (v47 == 2)
            {
              id v31 = v50[0];
              id v32 = (id)objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)(a1 + 72), i));
              objc_msgSend(v31, "addObject:");
            }
            else
            {
              id v6 = +[AMDError allocError:22 withMessage:@"Data not float"];
              uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
              os_log_type_t v8 = *(void **)(v7 + 40);
              *(void *)(v7 + 40) = v6;

              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            break;
          case 3:
            if (v47 == 5) {
              goto LABEL_21;
            }
            if (v47 != 1) {
              goto LABEL_23;
            }
            id v29 = v50[0];
            id v30 = (id)objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)(a1 + 72), i));
            objc_msgSend(v29, "addObject:");

            break;
          case 4:
            if (v47 == 5)
            {
LABEL_21:
              [v50[0] addObject:&unk_26BEC17D8];
            }
            else if (v47 == 1)
            {
              id v27 = v50[0];
              id v28 = (id)objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 72), i));
              objc_msgSend(v27, "addObject:");
            }
            else
            {
LABEL_23:
              id v9 = +[AMDError allocError:22 withMessage:@"Data not int"];
              uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
              id v11 = *(void **)(v10 + 40);
              *(void *)(v10 + 40) = v9;

              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            break;
          case 5:
            if (v47 == 5)
            {
              [v50[0] addObject:&stru_26BEAC9D8];
            }
            else if (v47 == 3)
            {
              id v25 = v50[0];
              id v26 = (id)objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)(a1 + 72), i));
              objc_msgSend(v25, "addObject:");
            }
            else
            {
              id v12 = +[AMDError allocError:22 withMessage:@"Data not text"];
              uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
              id v14 = *(void **)(v13 + 40);
              *(void *)(v13 + 40) = v12;

              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            break;
          default:
            JUMPOUT(0);
        }
      }
      int v44 = (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) & 1) != 0 ? 4 : 0;
      objc_storeStrong(&location, 0);
      if (v44) {
        break;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      int v44 = 3;
    }
    else
    {
      if (*(unsigned char *)(a1 + 80))
      {
        for (unsigned int j = 0; ; ++j)
        {
          unint64_t v24 = j;
          if (v24 >= [*(id *)(a1 + 32) count]) {
            break;
          }
          id v23 = (id)[*(id *)(a1 + 40) objectAtIndexedSubscript:j];
          id v22 = (id)[v50[0] objectAtIndexedSubscript:j];
          objc_msgSend(v23, "addObject:");
        }
      }
      if (*(unsigned char *)(a1 + 81))
      {
        id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
        for (unsigned int k = 0; k < (unint64_t)[*(id *)(a1 + 32) count]; ++k)
        {
          id v18 = v42;
          id v21 = (id)[v50[0] objectAtIndexedSubscript:k];
          id v20 = (id)[*(id *)(a1 + 32) objectAtIndexedSubscript:k];
          id v19 = (id)[v20 getName];
          objc_msgSend(v18, "setObject:forKey:", v21);
        }
        [*(id *)(a1 + 48) addObject:v42];
        objc_storeStrong(&v42, 0);
      }
      int v44 = 0;
    }
    objc_storeStrong(v50, 0);
  }
  while (!v44);
}

- (id)deleteRows:(id)a3 error:(id *)a4
{
  os_log_type_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(AMDSQLite *)v8 isUsable])
  {
    id v9 = [(AMDSQLite *)v8 deleteRowsInternal:location[0] error:a4];
  }
  else
  {
    *a4 = [(AMDSQLite *)v8 generateDBLoadError];
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v4 = v9;

  return v4;
}

- (id)deleteRowsInternal:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v49 = a4;
  if ([(AMDSQLite *)v51 _db])
  {
    id v46 = (id)[location[0] objectForKey:0x26BEB5158];
    id v45 = (id)[location[0] objectForKey:0x26BEB50D8];
    id v44 = (id)[location[0] objectForKey:0x26BEB5138];
    id v43 = (id)[location[0] objectForKey:0x26BEB5058];
    id v42 = (id)[location[0] objectForKey:0x26BEB50B8];
    id v14 = NSString;
    char v39 = 0;
    if (v45)
    {
      id v40 = (__CFString *)(id)[NSString stringWithFormat:@" WHERE %@", v45];
      char v39 = 1;
      uint64_t v13 = v40;
    }
    else
    {
      uint64_t v13 = &stru_26BEAC9D8;
    }
    char v37 = 0;
    if (v44)
    {
      int v38 = (__CFString *)(id)[NSString stringWithFormat:@" ORDER BY %@", v44];
      char v37 = 1;
      id v12 = v38;
    }
    else
    {
      id v12 = &stru_26BEAC9D8;
    }
    char v35 = 0;
    if (v43)
    {
      id v36 = (__CFString *)(id)[NSString stringWithFormat:@" LIMIT %@", v43];
      char v35 = 1;
      id v11 = v36;
    }
    else
    {
      id v11 = &stru_26BEAC9D8;
    }
    char v33 = 0;
    if (v42)
    {
      id v34 = (__CFString *)(id)[NSString stringWithFormat:@" OFFSET %@", v42];
      char v33 = 1;
      uint64_t v10 = v34;
    }
    else
    {
      uint64_t v10 = &stru_26BEAC9D8;
    }
    id v41 = (id)[v14 stringWithFormat:@"DELETE FROM %@%@%@%@%@", v46, v13, v12, v11, v10];
    if (v33) {

    }
    if (v35) {
    if (v37)
    }

    if (v39) {
    id v32 = [(AMDSQLite *)v51 prepare:v41 error:v49];
    }
    if (v32)
    {
      char v31 = 0;
      uint64_t v26 = 0;
      id v27 = &v26;
      int v28 = 0x20000000;
      int v29 = 32;
      int v30 = 1;
      os_log_type_t v8 = [(AMDSQLite *)v51 _executorQueue];
      blocunsigned int k = MEMORY[0x263EF8330];
      int v20 = -1073741824;
      int v21 = 0;
      id v22 = __38__AMDSQLite_deleteRowsInternal_error___block_invoke;
      id v23 = &unk_263FE1E10;
      unint64_t v24 = &v26;
      id v25 = v32;
      dispatch_sync(v8, &block);

      if (*((_DWORD *)v27 + 6) == 101)
      {
        unsigned int v17 = sqlite3_changes([(AMDSQLite *)v51 _db]);
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_4_0_8_64((uint64_t)v55, v17, (uint64_t)v46);
          _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Deleted %u rows from table %@", v55, 0x12u);
        }
        objc_storeStrong((id *)&oslog, 0);
        BOOL v53 = @"deleteStatus";
        id v7 = (id)objc_msgSend(NSString, "stringWithFormat:", @"deleted %u rows", v17);
        id v54 = v7;
        id v52 = (id)[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];

        int v47 = 1;
      }
      else
      {
        id v18 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Delete: %d", *((unsigned int *)v27 + 6));
        *id v49 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v18];
        id v52 = 0;
        int v47 = 1;
        objc_storeStrong(&v18, 0);
      }
      _Block_object_dispose(&v26, 8);
      int v6 = v47;
      sqlite3_finalize(v32);
      if (v31) {
        objc_exception_rethrow();
      }
      int v47 = v6;
      if (v6 == 2)
      {
        __break(1u);
        JUMPOUT(0x20AC1726CLL);
      }
    }
    else
    {
      id v9 = (id)[*v49 localizedDescription];
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      id v52 = 0;
      int v47 = 1;
    }
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
  }
  else
  {
    id v48 = (id)[NSString stringWithFormat:@"SQLITE DELETE: No db!!"];
    *id v49 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v48];
    id v52 = 0;
    int v47 = 1;
    objc_storeStrong(&v48, 0);
  }
  objc_storeStrong(location, 0);
  uint64_t v4 = v52;

  return v4;
}

uint64_t __38__AMDSQLite_deleteRowsInternal_error___block_invoke(uint64_t a1)
{
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)updateTableUsingDescriptor:(id)a3 andSchema:(id)a4 error:(id *)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v64 = 0;
  objc_storeStrong(&v64, a4);
  int v63 = a5;
  id v62 = (id)[location[0] objectForKey:0x26BEB5158];
  id v61 = (id)[v64 getSchemaForTable:v62];
  if (v61)
  {
    id v58 = (id)[location[0] objectForKey:@"orReplace"];
    BOOL v57 = 0;
    if (v58) {
      BOOL v25 = [v58 intValue] != 0;
    }
    else {
      BOOL v25 = 0;
    }
    BOOL v57 = v25;
    id v56 = (id)[location[0] objectForKey:0x26BEB5118];
    if (v56 && [v56 count])
    {
      id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
      memset(__b, 0, sizeof(__b));
      id v23 = v56;
      uint64_t v24 = [v23 countByEnumeratingWithState:__b objects:v72 count:16];
      if (v24)
      {
        uint64_t v20 = *(void *)__b[2];
        uint64_t v21 = 0;
        unint64_t v22 = v24;
        while (1)
        {
          uint64_t v19 = v21;
          if (*(void *)__b[2] != v20) {
            objc_enumerationMutation(v23);
          }
          uint64_t v53 = *(void *)(__b[1] + 8 * v21);
          id v51 = (id)[v56 objectForKey:v53];
          id v18 = v54;
          id v17 = (id)[NSString stringWithFormat:@"%@ = %@", v53, v51];
          objc_msgSend(v18, "addObject:");

          objc_storeStrong(&v51, 0);
          ++v21;
          if (v19 + 1 >= v22)
          {
            uint64_t v21 = 0;
            unint64_t v22 = [v23 countByEnumeratingWithState:__b objects:v72 count:16];
            if (!v22) {
              break;
            }
          }
        }
      }

      id v50 = (id)[location[0] objectForKey:0x26BEB50D8];
      id v14 = NSString;
      id v15 = v62;
      char v5 = @" OR REPLACE";
      if (!v57) {
        char v5 = &stru_26BEAC9D8;
      }
      uint64_t v16 = v5;
      id v13 = (id)[v54 componentsJoinedByString:@","];
      char v47 = 0;
      if (v50)
      {
        id v48 = (__CFString *)(id)[NSString stringWithFormat:@" WHERE %@", v50];
        char v47 = 1;
        id v12 = v48;
      }
      else
      {
        id v12 = &stru_26BEAC9D8;
      }
      id v49 = (id)[v14 stringWithFormat:@"UPDATE %@%@ SET %@%@", v15, v16, v13, v12];
      if (v47) {

      }
      id v46 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v49);
        _os_log_impl(&dword_20ABD4000, (os_log_t)v46, type, "Prepared UPDATE statement: %@", v71, 0xCu);
      }
      objc_storeStrong(&v46, 0);
      id v44 = [(AMDSQLite *)v66 prepare:v49 error:v63];
      if (v44)
      {
        char v43 = 0;
        uint64_t v38 = 0;
        char v39 = &v38;
        int v40 = 0x20000000;
        int v41 = 32;
        int v42 = 1;
        uint64_t v10 = [(AMDSQLite *)v66 _executorQueue];
        blocunsigned int k = MEMORY[0x263EF8330];
        int v32 = -1073741824;
        int v33 = 0;
        id v34 = __56__AMDSQLite_updateTableUsingDescriptor_andSchema_error___block_invoke;
        char v35 = &unk_263FE1E10;
        id v36 = &v38;
        char v37 = v44;
        dispatch_sync(v10, &block);

        if (*((_DWORD *)v39 + 6) == 101)
        {
          unsigned int v29 = sqlite3_changes([(AMDSQLite *)v66 _db]);
          os_log_t oslog = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_4_0_8_64((uint64_t)v70, v29, (uint64_t)v62);
            _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Updated %u rows in table %@", v70, 0x12u);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v68 = @"updateStatus";
          id v9 = (id)objc_msgSend(NSString, "stringWithFormat:", @"updated %u rows", v29);
          id v69 = v9;
          id v67 = (id)[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];

          int v59 = 1;
        }
        else
        {
          id v30 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE update: %d", *((unsigned int *)v39 + 6));
          *int v63 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v30];
          id v67 = 0;
          int v59 = 1;
          objc_storeStrong(&v30, 0);
        }
        _Block_object_dispose(&v38, 8);
        int v8 = v59;
        sqlite3_finalize(v44);
        if (v43) {
          objc_exception_rethrow();
        }
        int v59 = v8;
        if (v8 == 4)
        {
          __break(1u);
          JUMPOUT(0x20AC18068);
        }
      }
      else
      {
        id v11 = (id)[*v63 localizedDescription];
        +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

        id v67 = 0;
        int v59 = 1;
      }
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v54, 0);
    }
    else
    {
      id v55 = @"SQLITE UPDATE: no SET clause info";
      *int v63 = +[AMDMiscHelpers logAndCreateError:15 errorMessage:v55];
      id v67 = 0;
      int v59 = 1;
      objc_storeStrong(&v55, 0);
    }
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v58, 0);
  }
  else
  {
    id v60 = (id)[NSString stringWithFormat:@"SQLITE UPDATE: table '%@' does not exist'", v62];
    *int v63 = +[AMDMiscHelpers logAndCreateError:15 errorMessage:v60];
    id v67 = 0;
    int v59 = 1;
    objc_storeStrong(&v60, 0);
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  int v6 = v67;

  return v6;
}

uint64_t __56__AMDSQLite_updateTableUsingDescriptor_andSchema_error___block_invoke(uint64_t a1)
{
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)refreshAppsTable:(id *)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v44 = self;
  SEL v43 = a2;
  int v42 = a3;
  id v41 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v39 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v38 = (id)objc_msgSend(MEMORY[0x263F01878], "enumeratorWithOptions:");
  [v38 setFilter:&__block_literal_global_0];
  memset(__b, 0, sizeof(__b));
  id obj = v38;
  uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v58 count:16];
  if (v23)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    unint64_t v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(obj);
      }
      id v37 = *(id *)(__b[1] + 8 * v20);
      id v35 = (id)[v37 iTunesMetadata];
      id v11 = v40;
      v56[0] = @"adamId";
      id v17 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v35, "storeItemIdentifier"));
      v57[0] = v17;
      v56[1] = @"genreId";
      id v16 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v35, "genreIdentifier"));
      v57[1] = v16;
      void v56[2] = @"isArcade";
      id v15 = (id)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v37, "isArcadeApp") & 1);
      void v57[2] = v15;
      v56[3] = @"purchasedRedownload";
      id v14 = (id)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v35, "isPurchasedRedownload") & 1);
      v57[3] = v14;
      v56[4] = @"ratingRank";
      id v13 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v35, "ratingRank"));
      v57[4] = v13;
      v56[5] = @"creationTime";
      v57[5] = v39;
      id v12 = (id)[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:6];
      objc_msgSend(v11, "addObject:");

      objc_storeStrong(&v35, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [obj countByEnumeratingWithState:__b objects:v58 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  if ([v40 count])
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v55, [v40 count]);
      _os_log_debug_impl(&dword_20ABD4000, oslog, type, "SQLITE found %lu apps", v55, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v50[0] = 0x26BEB5158;
    v51[0] = @"apps";
    v50[1] = @"rowsData";
    v51[1] = v40;
    id v28 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    id v27 = [(AMDSQLite *)v44 deleteRows:v28 error:v42];
    if (*v42)
    {
      id v9 = NSString;
      id v10 = (id)[*v42 localizedDescription];
      id v26 = (id)[v9 stringWithFormat:@"SQLITE could not truncate '%@': %@", @"apps", v10];

      id v48 = @"error";
      id v49 = v26;
      id v45 = (id)[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      int v29 = 1;
      objc_storeStrong(&v26, 0);
    }
    else
    {
      if (v27) {
        [v41 addEntriesFromDictionary:v27];
      }
      else {
        +[AMDFrameworkMetrics log:@"Delete Rows Failed" withKey:@"AppsTableRefreshError" atVerbosity:0];
      }
      id v7 = v44;
      int v8 = [(AMDSQLite *)v44 _schema];
      id v25 = -[AMDSQLite insertRows:usingSchema:error:](v7, "insertRows:usingSchema:error:", v28);

      if (*v42)
      {
        char v5 = NSString;
        id v6 = (id)[*v42 localizedDescription];
        id v24 = (id)[v5 stringWithFormat:@"SQLITE could not insert into '%@': %@", @"apps", v6];

        id v46 = @"error";
        id v47 = v24;
        id v45 = (id)[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        int v29 = 1;
        objc_storeStrong(&v24, 0);
      }
      else
      {
        if (v25) {
          [v41 addEntriesFromDictionary:v25];
        }
        else {
          +[AMDFrameworkMetrics log:@"Insert Rows Failed" withKey:@"AppsTableRefreshError" atVerbosity:0];
        }
        id v45 = v41;
        int v29 = 1;
      }
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    int v32 = @"SQLITE found no apps. Check!";
    os_log_t v31 = (os_log_t)&_os_log_internal;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v32);
      _os_log_error_impl(&dword_20ABD4000, v31, v30, "%@", v54, 0xCu);
    }
    objc_storeStrong((id *)&v31, 0);
    id v52 = @"error";
    uint64_t v53 = v32;
    id v45 = (id)[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    int v29 = 1;
    objc_storeStrong((id *)&v32, 0);
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  id v3 = v45;

  return v3;
}

BOOL __30__AMDSQLite_refreshAppsTable___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] iTunesMetadata];
  BOOL v4 = [v3 storeItemIdentifier] != 0;

  objc_storeStrong(location, 0);
  return v4;
}

+ (id)fetchVectorDBConfigForDBName:(id)a3 error:(id *)a4
{
  id v51[4] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v30 = a4;
  id v29 = +[AMDSQLite getSharedInstance];
  if ([v29 isUsableInternal])
  {
    id v49 = @"dbPath";
    v47[0] = AMD_SQLITE_TYPE;
    v48[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v47[1] = AMD_SQLITE_NOT_NULL;
    uint64_t v6 = MEMORY[0x263EFFA88];
    v48[1] = MEMORY[0x263EFFA88];
    id v14 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47);
    id v50 = v14;
    id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49);
    v51[0] = v13;
    id v45 = @"dataType";
    v43[0] = AMD_SQLITE_TYPE;
    v44[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v43[1] = AMD_SQLITE_NOT_NULL;
    v44[1] = v6;
    id v12 = (id)[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    id v46 = v12;
    id v11 = (id)[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v51[1] = v11;
    id v41 = @"vectorDimension";
    v39[0] = AMD_SQLITE_TYPE;
    v40[0] = AMD_SQLITE_DATA_TYPE_INT;
    v39[1] = AMD_SQLITE_NOT_NULL;
    v40[1] = v6;
    id v10 = (id)[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    id v42 = v10;
    id v9 = (id)[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    void v51[2] = v9;
    id v37 = @"distanceMetric";
    v35[0] = AMD_SQLITE_TYPE;
    v36[0] = AMD_SQLITE_DATA_TYPE_TEXT;
    v35[1] = AMD_SQLITE_NOT_NULL;
    v36[1] = v6;
    id v8 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    id v38 = v8;
    id v7 = (id)[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v51[3] = v7;
    id v27 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];

    v33[0] = 0x26BEB4FB8;
    v34[0] = @"__AMDVectorDatabases";
    v33[1] = 0x26BEB5158;
    v34[1] = @"__AMDVectorDatabases";
    void v33[2] = 0x26BEB5058;
    void v34[2] = @"1";
    v33[3] = 0x26BEB4F98;
    v34[3] = v27;
    v33[4] = 0x26BEB50D8;
    id v15 = (id)[NSString stringWithFormat:@"dbName = '%@'", location[0]];
    v34[4] = v15;
    id v26 = (id)[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];

    id v16 = [AMDFetchDescriptor alloc];
    id v17 = (id)[v29 _bootstrapSchema];
    id v25 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v16, "initWithDict:usingSchema:error:", v26);

    uint64_t v18 = [v29 _db];
    id v19 = (id)[v29 _bootstrapSchema];
    id v24 = (id)objc_msgSend(v29, "fetchRowsFrom:usingDescriptor:andSchema:columnMajorOutput:rowMajorOutput:andPersist:error:", v18, v25, v30);

    if (*v30)
    {
      id v32 = 0;
      int v28 = 1;
    }
    else
    {
      id v23 = (id)[v24 objectForKey:@"resultSet"];
      id v22 = (id)[v23 objectForKey:@"fetchResultRowsData"];
      if (v22)
      {
        if ([v22 count])
        {
          id v21 = (id)[v22 objectAtIndexedSubscript:0];
          id v32 = v21;
          int v28 = 1;
          objc_storeStrong(&v21, 0);
        }
        else
        {
          id v32 = MEMORY[0x263EFFA78];
          int v28 = 1;
        }
      }
      else
      {
        *os_log_type_t v30 = +[AMDError allocError:22 withMessage:@"Internal SQL failure"];
        id v32 = 0;
        int v28 = 1;
      }
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    *os_log_type_t v30 = (id)[v29 generateDBLoadError];
    id v32 = 0;
    int v28 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  BOOL v4 = v32;

  return v4;
}

+ (id)persistVectorDBPath:(id)a3 forDBName:(id)a4 withVectorDimension:(int)a5 andDataType:(id)a6 withDistanceMetric:(id)a7 error:(id *)a8
{
  v37[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  unsigned int v29 = a5;
  id v28 = 0;
  objc_storeStrong(&v28, a6);
  id v27 = 0;
  objc_storeStrong(&v27, a7);
  id v26 = a8;
  id v25 = +[AMDSQLite getSharedInstance];
  if ([v25 isUsableInternal])
  {
    v35[0] = @"dbName";
    v36[0] = v30;
    v35[1] = @"dbPath";
    v36[1] = location[0];
    void v35[2] = @"lastUpdateTime";
    id v10 = NSNumber;
    id v14 = (id)[MEMORY[0x263EFF910] date];
    [v14 timeIntervalSince1970];
    id v13 = (id)objc_msgSend(v10, "numberWithDouble:");
    void v36[2] = v13;
    v35[3] = @"vectorDimension";
    id v12 = (id)[NSNumber numberWithInt:v29];
    v36[3] = v12;
    v35[4] = @"dataType";
    v36[4] = v28;
    v35[5] = @"distanceMetric";
    v36[5] = v27;
    id v11 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];
    v37[0] = v11;
    id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];

    v33[0] = 0x26BEB5158;
    v34[0] = @"__AMDVectorDatabases";
    v33[1] = @"rowsData";
    v34[1] = v23;
    id v22 = (id)[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v15 = (id)[v25 _bootstrapSchema];
    id v21 = (id)objc_msgSend(v25, "insertRows:usingSchema:error:", v22);

    if (*v26) {
      id v32 = 0;
    }
    else {
      id v32 = v21;
    }
    int v24 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    *id v26 = (id)[v25 generateDBLoadError];
    id v32 = 0;
    int v24 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  id v8 = v32;

  return v8;
}

+ (id)deleteVectorDBEntryForDBName:(id)a3 error:(id *)a4
{
  v16[3] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = a4;
  id v11 = +[AMDSQLite getSharedInstance];
  if ([v11 isUsableInternal])
  {
    v15[0] = 0x26BEB4FB8;
    v16[0] = @"__AMDVectorDatabases";
    v15[1] = 0x26BEB5158;
    v16[1] = @"__AMDVectorDatabases";
    v15[2] = 0x26BEB50D8;
    id v6 = (id)[NSString stringWithFormat:@"dbName = '%@'", location[0]];
    v16[2] = v6;
    id v9 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    id v8 = (id)[v11 deleteRowsInternal:v9 error:v12];
    if (*v12) {
      id v14 = 0;
    }
    else {
      id v14 = v8;
    }
    int v10 = 1;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    *id v12 = (id)[v11 generateDBLoadError];
    id v14 = 0;
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  BOOL v4 = v14;

  return v4;
}

+ (id)updateLastVectorDBRefreshTimestamp:(id)a3 error:(id *)a4
{
  v24[4] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v18 = a4;
  id v17 = +[AMDSQLite getSharedInstance];
  if ([v17 isUsableInternal])
  {
    v23[0] = 0x26BEB4FB8;
    v24[0] = @"__AMDVectorDatabases";
    v23[1] = 0x26BEB5158;
    v24[1] = @"__AMDVectorDatabases";
    v23[2] = 0x26BEB50D8;
    id v11 = (id)[NSString stringWithFormat:@"dbName = '%@'", location[0]];
    v24[2] = v11;
    v23[3] = 0x26BEB5118;
    id v21 = @"lastUpdateTime";
    id v7 = NSNumber;
    id v10 = (id)[MEMORY[0x263EFF910] date];
    [v10 timeIntervalSince1970];
    id v9 = (id)[v7 numberWithLongLong:(uint64_t)v4];
    id v22 = v9;
    id v8 = (id)[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24[3] = v8;
    id v15 = (id)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

    id v12 = (id)[v17 _bootstrapSchema];
    id v14 = (id)objc_msgSend(v17, "updateTableUsingDescriptor:andSchema:error:", v15);

    if (*v18) {
      id v20 = 0;
    }
    else {
      id v20 = v14;
    }
    int v16 = 1;
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    *uint64_t v18 = (id)[v17 generateDBLoadError];
    id v20 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  char v5 = v20;

  return v5;
}

- (AMDSQLiteSchema)_bootstrapSchema
{
  return self->__bootstrapSchema;
}

- (void)set_bootstrapSchema:(id)a3
{
}

- (sqlite3)_db
{
  return self->__db;
}

- (void)set_db:(sqlite3 *)a3
{
  self->__db = a3;
}

- (NSError)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
}

- (OS_dispatch_queue)_executorQueue
{
  return self->__executorQueue;
}

- (void)set_executorQueue:(id)a3
{
}

- (BOOL)_isEnabled
{
  return self->__isEnabled;
}

- (void)set_isEnabled:(BOOL)a3
{
  self->__isEnabled = a3;
}

- (AMDSQLiteSchema)_schema
{
  return self->__schema;
}

- (void)set_schema:(id)a3
{
}

- (AMDSQLiteSchema)_biomeSchema
{
  return self->__biomeSchema;
}

- (void)set_biomeSchema:(id)a3
{
}

- (AMDSQLiteSchema)_megadomeSchema
{
  return self->__megadomeSchema;
}

- (void)set_megadomeSchema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end