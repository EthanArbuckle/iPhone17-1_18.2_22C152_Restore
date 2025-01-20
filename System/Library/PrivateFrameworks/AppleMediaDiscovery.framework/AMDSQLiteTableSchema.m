@interface AMDSQLiteTableSchema
- (AMDSQLiteTableSchema)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5;
- (NSDictionary)columns;
- (NSSet)requiredColumns;
- (NSString)name;
- (id)getColumns;
- (id)getCreateTableStatement;
- (id)getInsertStatement:(id)a3;
- (id)getRequiredColumns;
- (id)getSpecForColumn:(id)a3;
- (void)setColumns:(id)a3;
- (void)setName:(id)a3;
- (void)setRequiredColumns:(id)a3;
@end

@implementation AMDSQLiteTableSchema

- (id)getColumns
{
  return [(AMDSQLiteTableSchema *)self columns];
}

- (id)getCreateTableStatement
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27 = self;
  v26[1] = (id)a2;
  id v17 = objc_alloc(MEMORY[0x263EFF980]);
  v18 = [(AMDSQLiteTableSchema *)v27 columns];
  v26[0] = (id)objc_msgSend(v17, "initWithCapacity:", -[NSDictionary count](v18, "count"));

  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  v19 = [(AMDSQLiteTableSchema *)v27 columns];
  obj = [(NSDictionary *)v19 allValues];

  uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v21)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v21;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v15);
      id v11 = v26[0];
      id v12 = (id)[v24 getCreateStatementPart];
      objc_msgSend(v11, "addObject:");

      if ([v24 unique])
      {
        id v9 = v25;
        id v10 = (id)[v24 name];
        objc_msgSend(v9, "addObject:");
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  if ([v25 count])
  {
    v7 = NSString;
    id v8 = (id)[v25 componentsJoinedByString:@","];
    id v22 = (id)[v7 stringWithFormat:@"UNIQUE(%@)", v8];

    [v26[0] addObject:v22];
    objc_storeStrong(&v22, 0);
  }
  v3 = NSString;
  v6 = [(AMDSQLiteTableSchema *)v27 name];
  id v4 = (id)[v26[0] componentsJoinedByString:@", "];
  id v5 = (id)[v3 stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)", v6, v4];

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);

  return v5;
}

- (id)getInsertStatement:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v16 = [(AMDSQLiteTableSchema *)v26 columns];
  id v24 = [(NSDictionary *)v16 allKeys];

  id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](v24, "count"));
  char v22 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v24;
  uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v18)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v18;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(__b[1] + 8 * v14);
      id v11 = [(AMDSQLiteTableSchema *)v26 columns];
      id v19 = [(NSDictionary *)v11 objectForKey:v21];

      [location[0] addObject:v19];
      if ([v19 unique]) {
        char v22 = 1;
      }
      [v23 addObject:@"?"];
      objc_storeStrong(&v19, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  v6 = NSString;
  v3 = @"INSERT OR REPLACE INTO %@(%@) VALUES(%@)";
  if ((v22 & 1) == 0) {
    v3 = @"INSERT INTO %@(%@) VALUES(%@)";
  }
  id v5 = v3;
  id v10 = [(AMDSQLiteTableSchema *)v26 name];
  id v9 = -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:");
  id v7 = (id)[v23 componentsJoinedByString:@","];
  id v8 = (id)objc_msgSend(v6, "stringWithFormat:", v5, v10, v9, v7);

  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)getRequiredColumns
{
  return [(AMDSQLiteTableSchema *)self requiredColumns];
}

- (id)getSpecForColumn:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(AMDSQLiteTableSchema *)v7 columns];
  id v5 = [(NSDictionary *)v4 objectForKey:location[0]];

  objc_storeStrong(location, 0);

  return v5;
}

- (AMDSQLiteTableSchema)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  uint64_t v29 = a5;
  id v5 = v32;
  id v32 = 0;
  v28.receiver = v5;
  v28.super_class = (Class)AMDSQLiteTableSchema;
  id v32 = [(AMDSQLiteTableSchema *)&v28 init];
  objc_storeStrong(&v32, v32);
  id v27 = &_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v30);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v27, type, "SQLITE Loading schema for table '%@'", v36, 0xCu);
  }
  objc_storeStrong(&v27, 0);
  [v32 setName:v30];
  unsigned int v25 = [location[0] count];
  if (v25)
  {
    id v23 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v25];
    id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    id v12 = location[0];
    uint64_t v13 = [v12 countByEnumeratingWithState:__b objects:v35 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(v12);
        }
        id v21 = *(id *)(__b[1] + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v19 = v21;
        id v18 = (id)[location[0] objectForKey:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v6 = [AMDSQLiteColumnSpec alloc];
          id v17 = [(AMDSQLiteColumnSpec *)v6 initWithDict:v18 withName:v19 error:v29];
          if (v17)
          {
            if ([v17 isRequired]) {
              [v22 addObject:v19];
            }
            [v23 setObject:v17 forKey:v19];
            int v24 = 0;
          }
          else
          {
            v33 = 0;
            int v24 = 1;
          }
          objc_storeStrong(&v17, 0);
        }
        else
        {
          *uint64_t v29 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Column spec not a dict"];
          v33 = 0;
          int v24 = 1;
        }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        if (v24) {
          goto LABEL_23;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [v12 countByEnumeratingWithState:__b objects:v35 count:16];
          if (!v11) {
            goto LABEL_22;
          }
        }
      }
      *uint64_t v29 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Column name not string"];
      v33 = 0;
      int v24 = 1;
    }
    else
    {
LABEL_22:
      int v24 = 0;
    }
LABEL_23:

    if (!v24)
    {
      [v32 setColumns:v23];
      [v32 setRequiredColumns:v22];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_64_4_0_4_0((uint64_t)v34, (uint64_t)v30, v25, [v22 count]);
        _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "SQLITE Loaded schema for table '%@' (%u columns, %u required)", v34, 0x18u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v33 = (AMDSQLiteTableSchema *)v32;
      int v24 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    *uint64_t v29 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"No columns in table"];
    v33 = 0;
    int v24 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v33;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (NSSet)requiredColumns
{
  return self->_requiredColumns;
}

- (void)setRequiredColumns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end