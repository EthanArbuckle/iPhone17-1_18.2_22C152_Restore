@interface AMDSQLiteSchema
+ (id)fetchColumnSpecsForTable:(id)a3;
- (AMDSQLiteSchema)initWithDict:(id)a3 error:(id *)a4;
- (NSDictionary)indices;
- (NSDictionary)schemaDict;
- (NSDictionary)streamToTableMap;
- (NSDictionary)tables;
- (NSNumber)versionNumber;
- (NSString)name;
- (NSString)version;
- (id)addIndices:(id)a3 error:(id *)a4;
- (id)addTable:(id)a3 withSchema:(id)a4 error:(id *)a5;
- (id)getCreateTableStatementFor:(id)a3;
- (id)getIndices;
- (id)getInsertStatementFor:(id)a3 hasColumns:(id)a4 requiresColumns:(id *)a5;
- (id)getName;
- (id)getSchemaDict;
- (id)getSchemaForTable:(id)a3;
- (id)getStreamToTableMap;
- (id)getTableForStream:(id)a3;
- (id)getTables;
- (id)getVersion;
- (id)getVersionNumber;
- (void)setIndices:(id)a3;
- (void)setName:(id)a3;
- (void)setSchemaDict:(id)a3;
- (void)setStreamToTableMap:(id)a3;
- (void)setTables:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVersionNumber:(id)a3;
@end

@implementation AMDSQLiteSchema

- (id)addTable:(id)a3 withSchema:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  v17[1] = a5;
  v5 = [AMDSQLiteTableSchema alloc];
  v17[0] = [(AMDSQLiteTableSchema *)v5 initWithDict:v18 withName:location[0] error:a5];
  if (*a5)
  {
    id v21 = 0;
    int v16 = 1;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    v9 = [(AMDSQLiteSchema *)v20 tables];
    id v15 = (id)objc_msgSend(v8, "initWithDictionary:");

    [v15 setObject:v17[0] forKey:location[0]];
    [(AMDSQLiteSchema *)v20 setTables:v15];
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    v11 = [(AMDSQLiteSchema *)v20 streamToTableMap];
    id v14 = (id)objc_msgSend(v10, "initWithDictionary:");

    [v14 setObject:location[0] forKey:location[0]];
    [(AMDSQLiteSchema *)v20 setStreamToTableMap:v14];
    v22 = @"added_table";
    v23[0] = location[0];
    id v21 = (id)[NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    int v16 = 1;
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  v6 = v21;

  return v6;
}

- (id)addIndices:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = a4;
  v36 = [(AMDSQLiteSchema *)v59 indices];
  id v56 = (id)[(NSDictionary *)v36 mutableCopy];

  unsigned int v55 = 0;
  for (unsigned int i = 0; ; ++i)
  {
    unint64_t v34 = i;
    if (v34 >= [location[0] count]) {
      break;
    }
    id v53 = (id)[location[0] objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v50 = v53;
      id v5 = (id)[v50 objectForKey:@"indexName"];
      id v6 = v53;
      id v53 = v5;

      if (v53 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v48 = v53;
        v33 = [(AMDSQLiteSchema *)v59 indices];
        id v47 = [(NSDictionary *)v33 objectForKey:v48];

        if (v47)
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            log = oslog;
            os_log_type_t v32 = type;
            __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v48);
            _os_log_impl(&dword_20ABD4000, log, v32, "SQLITE Index '%@' already exists", v67, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          int v51 = 4;
        }
        else
        {
          id v8 = (id)[v50 objectForKey:0x26BEB5158];
          id v9 = v53;
          id v53 = v8;

          if (v53 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v43 = v53;
            v30 = [(AMDSQLiteSchema *)v59 tables];
            id v11 = [(NSDictionary *)v30 objectForKey:v43];
            id v12 = v47;
            id v47 = v11;

            if (v47)
            {
              id v13 = (id)[v50 objectForKey:AMD_SQLITE_COLUMNS];
              id v14 = v53;
              id v53 = v13;

              if (v53 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v53 count])
              {
                id v39 = v53;
                memset(__b, 0, 0x40uLL);
                id obj = v39;
                uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v65 count:16];
                if (v27)
                {
                  uint64_t v23 = *(void *)__b[2];
                  uint64_t v24 = 0;
                  unint64_t v25 = v27;
                  while (1)
                  {
                    uint64_t v22 = v24;
                    if (*(void *)__b[2] != v23) {
                      objc_enumerationMutation(obj);
                    }
                    __b[8] = *(void *)(__b[1] + 8 * v24);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    ++v24;
                    if (v22 + 1 >= v25)
                    {
                      uint64_t v24 = 0;
                      unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v65 count:16];
                      if (!v25) {
                        goto LABEL_31;
                      }
                    }
                  }
                  id v37 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Column name not string in slot %u", i);
                  id v16 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v37];
                  id *v57 = v16;
                  id v60 = 0;
                  int v51 = 1;
                  objc_storeStrong(&v37, 0);
                }
                else
                {
LABEL_31:
                  int v51 = 0;
                }

                if (!v51)
                {
                  id v20 = v56;
                  v63[0] = 0x26BEB5158;
                  v64[0] = v43;
                  v63[1] = AMD_SQLITE_COLUMNS;
                  v64[1] = v39;
                  id v21 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
                  objc_msgSend(v20, "setObject:forKey:");

                  ++v55;
                  int v51 = 0;
                }
                objc_storeStrong(&v39, 0);
              }
              else
              {
                id v40 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Bad or missing columns info in slot %u", i);
                id v15 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v40];
                id *v57 = v15;
                id v60 = 0;
                int v51 = 1;
                objc_storeStrong(&v40, 0);
              }
            }
            else
            {
              os_log_t v42 = (os_log_t)&_os_log_internal;
              os_log_type_t v41 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                v28 = v42;
                os_log_type_t v29 = v41;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v66, (uint64_t)v43, (uint64_t)v48);
                _os_log_impl(&dword_20ABD4000, v28, v29, "SQLITE No table '%@' for index '%@'", v66, 0x16u);
              }
              objc_storeStrong((id *)&v42, 0);
              int v51 = 4;
            }
            objc_storeStrong(&v43, 0);
          }
          else
          {
            id v44 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Bad or missing index table name in slot %u", i);
            id v10 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v44];
            id *v57 = v10;
            id v60 = 0;
            int v51 = 1;
            objc_storeStrong(&v44, 0);
          }
        }
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v48, 0);
      }
      else
      {
        id v49 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Bad or missing index name in slot %u", i);
        id v7 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v49];
        id *v57 = v7;
        id v60 = 0;
        int v51 = 1;
        objc_storeStrong(&v49, 0);
      }
      objc_storeStrong(&v50, 0);
    }
    else
    {
      id v52 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQLITE Bad index info in slot %u", i);
      id v4 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v52];
      id *v57 = v4;
      id v60 = 0;
      int v51 = 1;
      objc_storeStrong(&v52, 0);
    }
    objc_storeStrong(&v53, 0);
    if (v51 && v51 != 4) {
      goto LABEL_42;
    }
  }
  [(AMDSQLiteSchema *)v59 setIndices:v56];
  v61 = @"added";
  id v19 = (id)[NSNumber numberWithUnsignedInt:v55];
  id v62 = v19;
  id v60 = (id)[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];

  int v51 = 1;
LABEL_42:
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  v17 = v60;

  return v17;
}

- (id)getCreateTableStatementFor:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(AMDSQLiteSchema *)v8 tables];
  id v6 = [(NSDictionary *)v5 objectForKey:location[0]];

  if (v6) {
    id v9 = (id)[v6 getCreateTableStatement];
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  v3 = v9;

  return v3;
}

- (id)getIndices
{
  return [(AMDSQLiteSchema *)self indices];
}

- (id)getInsertStatementFor:(id)a3 hasColumns:(id)a4 requiresColumns:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  *a5 = (id)[location[0] getRequiredColumns];
  id v8 = (id)[location[0] getInsertStatement:v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)getName
{
  return [(AMDSQLiteSchema *)self name];
}

- (id)getSchemaDict
{
  return [(AMDSQLiteSchema *)self schemaDict];
}

- (id)getSchemaForTable:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(AMDSQLiteSchema *)v7 tables];
  id v5 = [(NSDictionary *)v4 objectForKey:location[0]];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)getTableForStream:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(AMDSQLiteSchema *)v7 streamToTableMap];
  id v5 = [(NSDictionary *)v4 objectForKey:location[0]];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)getStreamToTableMap
{
  return [(AMDSQLiteSchema *)self streamToTableMap];
}

- (id)getTables
{
  return [(AMDSQLiteSchema *)self tables];
}

- (id)getVersion
{
  return [(AMDSQLiteSchema *)self version];
}

- (id)getVersionNumber
{
  return [(AMDSQLiteSchema *)self versionNumber];
}

- (AMDSQLiteSchema)initWithDict:(id)a3 error:(id *)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v72 = a4;
  id v4 = v74;
  id v74 = 0;
  v71.receiver = v4;
  v71.super_class = (Class)AMDSQLiteSchema;
  id v74 = [(AMDSQLiteSchema *)&v71 init];
  objc_storeStrong(&v74, v74);
  [v74 setSchemaDict:location[0]];
  id v42 = (id)[location[0] objectForKey:AMD_SQLITE_SCHEMA_NAME];
  objc_msgSend(v74, "setName:");

  id v70 = &_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEBUG))
  {
    id v40 = (id)[v74 name];
    __os_log_helper_16_2_1_8_64((uint64_t)v80, (uint64_t)v40);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v70, type, "SQLITE Preparing schema '%@'", v80, 0xCu);
  }
  objc_storeStrong(&v70, 0);
  id v38 = (id)[location[0] objectForKey:AMD_SQLITE_SCHEMA_VERSION];
  objc_msgSend(v74, "setVersion:");

  id v5 = (id)[v74 version];
  BOOL v39 = v5 != 0;

  if (v39)
  {
    id v36 = objc_alloc_init(MEMORY[0x263F08A30]);
    id v35 = (id)[v74 version];
    id v34 = (id)objc_msgSend(v36, "numberFromString:");
    objc_msgSend(v74, "setVersionNumber:");

    id v6 = (id)[v74 versionNumber];
    BOOL v37 = v6 != 0;

    if (!v37)
    {
      id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Bad schema version"];
      v75 = 0;
      int v68 = 1;
      goto LABEL_57;
    }
    [v74 setTables:MEMORY[0x263EFFA78]];
    id v67 = (id)[location[0] objectForKey:AMD_SQLITE_SCHEMA_TABLES];
    if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Bad or missing table specs"];
      v75 = 0;
      int v68 = 1;
LABEL_56:
      objc_storeStrong(&v67, 0);
      goto LABEL_57;
    }
    id v66 = v67;
    id v65 = 0;
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v66, "count"));
    id v8 = v65;
    id v65 = v7;

    memset(__b, 0, sizeof(__b));
    id obj = v66;
    uint64_t v33 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
    if (v33)
    {
      uint64_t v29 = *(void *)__b[2];
      uint64_t v30 = 0;
      unint64_t v31 = v33;
      while (1)
      {
        uint64_t v28 = v30;
        if (*(void *)__b[2] != v29) {
          objc_enumerationMutation(obj);
        }
        id v64 = *(id *)(__b[1] + 8 * v30);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v61 = v64;
        id v60 = (id)[v66 objectForKey:v61];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v58 = v60;
          id v57 = [[AMDSQLiteTableSchema alloc] initWithDict:v58 withName:v61 error:v72];
          if (v57)
          {
            [v65 setObject:v57 forKey:v61];
            int v68 = 0;
          }
          else
          {
            v75 = 0;
            int v68 = 1;
          }
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
        }
        else
        {
          id v59 = (id)[NSString stringWithFormat:@"Table data for '%@' not a dict", v61];
          id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v59];
          v75 = 0;
          int v68 = 1;
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v60, 0);
        objc_storeStrong(&v61, 0);
        if (v68) {
          goto LABEL_26;
        }
        ++v30;
        if (v28 + 1 >= v31)
        {
          uint64_t v30 = 0;
          unint64_t v31 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
          if (!v31) {
            goto LABEL_25;
          }
        }
      }
      id v62 = (id)[NSString stringWithFormat:@"Bad table data"];
      id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v62];
      v75 = 0;
      int v68 = 1;
      objc_storeStrong(&v62, 0);
    }
    else
    {
LABEL_25:
      int v68 = 0;
    }
LABEL_26:

    if (v68)
    {
LABEL_55:
      objc_storeStrong(&v65, 0);
      objc_storeStrong(&v66, 0);
      goto LABEL_56;
    }
    [v74 setTables:v65];
    [v74 setStreamToTableMap:MEMORY[0x263EFFA78]];
    id v56 = (id)[location[0] objectForKey:AMD_SQLITE_STREAM_TO_TABLE_MAP];
    if (v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v55 = v56;
      id v54 = 0;
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v55, "count"));
      id v10 = v54;
      id v54 = v9;

      memset(v52, 0, sizeof(v52));
      id v26 = v55;
      uint64_t v27 = [v26 countByEnumeratingWithState:v52 objects:v78 count:16];
      if (v27)
      {
        uint64_t v23 = *(void *)v52[2];
        uint64_t v24 = 0;
        unint64_t v25 = v27;
        while (1)
        {
          uint64_t v22 = v24;
          if (*(void *)v52[2] != v23) {
            objc_enumerationMutation(v26);
          }
          uint64_t v53 = *(void *)(v52[1] + 8 * v24);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v48 = (id)[v55 objectForKey:v53];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v54 setObject:v48 forKey:v53];
              int v68 = 0;
            }
            else
            {
              os_log_t v47 = (os_log_t)&_os_log_internal;
              os_log_type_t v46 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                id v19 = v47;
                __os_log_helper_16_2_1_8_64((uint64_t)v77, v53);
                _os_log_error_impl(&dword_20ABD4000, v19, v46, "SQLITE Table name for stream '%@' not a string", v77, 0xCu);
              }
              objc_storeStrong((id *)&v47, 0);
              int v68 = 5;
            }
            objc_storeStrong(&v48, 0);
          }
          else
          {
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v50 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              id v20 = oslog;
              os_log_type_t v21 = v50;
              __os_log_helper_16_0_0(v49);
              _os_log_error_impl(&dword_20ABD4000, v20, v21, "SQLITE Bad stream-to-table mapping data", v49, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          ++v24;
          if (v22 + 1 >= v25)
          {
            uint64_t v24 = 0;
            unint64_t v25 = [v26 countByEnumeratingWithState:v52 objects:v78 count:16];
            if (!v25) {
              break;
            }
          }
        }
      }

      [v74 setStreamToTableMap:v54];
      objc_storeStrong(&v54, 0);
      objc_storeStrong(&v55, 0);
    }
    [v74 setIndices:MEMORY[0x263EFFA78]];
    id v45 = (id)[location[0] objectForKey:AMD_SQLITE_SCHEMA_INDICES];
    id v44 = 0;
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Bad or missing table specs"];
        v75 = 0;
        int v68 = 1;
LABEL_54:
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v56, 0);
        goto LABEL_55;
      }
      id v11 = (id)[v74 addIndices:v45 error:v72];
      id v12 = v44;
      id v44 = v11;

      if (!v44)
      {
        v75 = 0;
        int v68 = 1;
        goto LABEL_54;
      }
    }
    os_log_t v43 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (id)[v74 name];
      id v17 = (id)[v74 version];
      id v16 = (id)[v74 tables];
      uint64_t v14 = [v16 count];
      id v15 = (id)[v74 streamToTableMap];
      __os_log_helper_16_2_5_8_64_8_64_8_0_8_0_8_64((uint64_t)v76, (uint64_t)v18, (uint64_t)v17, v14, [v15 count], (uint64_t)v44);
      _os_log_debug_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_DEBUG, "SQLITE Prepared schema '%@', version '%@', table count: %lu, map count: %lu, indices: %@", v76, 0x34u);
    }
    objc_storeStrong((id *)&v43, 0);
    v75 = (AMDSQLiteSchema *)v74;
    int v68 = 1;
    goto LABEL_54;
  }
  id *v72 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"No version in schema"];
  v75 = 0;
  int v68 = 1;
LABEL_57:
  objc_storeStrong(location, 0);
  objc_storeStrong(&v74, 0);
  return v75;
}

+ (id)fetchColumnSpecsForTable:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = +[AMDSQLite getSharedInstance];
  if ([v21 getDb])
  {
    id v13 = (id)[v21 getDataSchema];
    id v19 = (id)[v13 getSchemaForTable:location[0]];

    if (v19)
    {
      id v18 = (id)[v19 getColumns];
      memset(__b, 0, sizeof(__b));
      id obj = v18;
      uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
      if (v12)
      {
        uint64_t v8 = *(void *)__b[2];
        uint64_t v9 = 0;
        unint64_t v10 = v12;
        while (1)
        {
          uint64_t v7 = v9;
          if (*(void *)__b[2] != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(__b[1] + 8 * v9);
          id v15 = (id)[v18 objectForKey:v17];
          uint64_t v27 = v17;
          uint64_t v25 = AMD_SQLITE_TYPE;
          id v6 = (id)[v15 getTypeString];
          id v26 = v6;
          id v5 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25);
          id v28 = v5;
          id v14 = (id)[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

          [v22 addObject:v14];
          objc_storeStrong(&v14, 0);
          objc_storeStrong(&v15, 0);
          ++v9;
          if (v7 + 1 >= v10)
          {
            uint64_t v9 = 0;
            unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
            if (!v10) {
              break;
            }
          }
        }
      }

      id v24 = v22;
      int v20 = 1;
      objc_storeStrong(&v18, 0);
    }
    else
    {
      id v24 = MEMORY[0x263EFFA68];
      int v20 = 1;
    }
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v24 = MEMORY[0x263EFFA68];
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  v3 = v24;

  return v3;
}

- (NSDictionary)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)schemaDict
{
  return self->_schemaDict;
}

- (void)setSchemaDict:(id)a3
{
}

- (NSDictionary)streamToTableMap
{
  return self->_streamToTableMap;
}

- (void)setStreamToTableMap:(id)a3
{
}

- (NSDictionary)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end