@interface BMTableStore
- (BMTableStore)initWithURL:(id)a3;
- (BOOL)addTable:(id)a3 named:(id)a4 error:(id *)a5;
- (BOOL)closeDB;
- (BOOL)openDB;
- (BOOL)setupClassArray:(id)a3 table:(id)a4 named:(id)a5 error:(id *)a6;
- (BOOL)upsertRows:(id)a3 error:(id *)a4;
- (NSArray)classArray;
- (NSString)sqlReplace;
- (NSString)tableName;
- (NSURL)dbURL;
- (_bmFMDatabase)db;
- (id)selectTableNamed:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)lock;
- (void)closeDB;
- (void)openDB;
@end

@implementation BMTableStore

- (BMTableStore)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMTableStore;
  v6 = [(BMTableStore *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[_bmFMDatabase databaseWithURL:v5];
    db = v6->_db;
    v6->_db = (_bmFMDatabase *)v7;

    objc_storeStrong((id *)&v6->_dbURL, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)openDB
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(BMTableStore *)self db];

  if (v4)
  {
    id v5 = [(BMTableStore *)self db];
    char v6 = [v5 open];

    if (v6)
    {
      os_unfair_lock_unlock(p_lock);
      return 1;
    }
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(BMTableStore *)self openDB];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)closeDB
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(BMTableStore *)self db];

  if (v4)
  {
    id v5 = [(BMTableStore *)self db];
    char v6 = [v5 close];

    if (v6)
    {
      os_unfair_lock_unlock(p_lock);
      classArray = self->_classArray;
      self->_classArray = 0;

      return 1;
    }
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(BMTableStore *)self closeDB];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)addTable:(id)a3 named:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 rows];
  objc_super v10 = [v9 firstObject];

  v11 = objc_opt_new();
  if ([v10 columnCount])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [v10 valueAtIdx:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v14 = objc_opt_class();
      }
      else
      {
        v14 = 0;
      }

      [v11 addObject:v14];
      ++v12;
    }
    while (v12 < [v10 columnCount]);
  }
  BOOL v15 = [(BMTableStore *)self setupClassArray:v11 table:v7 named:v8 error:a5];

  return v15;
}

- (BOOL)setupClassArray:(id)a3 table:(id)a4 named:(id)a5 error:(id *)a6
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v49 = v13;
  if (!v11 || (id v14 = v13, ![v11 count]))
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58[0] = @"setupClassArray, classArray nil or 0 entries";
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    v18 = [v30 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v31];

    if (a6) {
      *a6 = v18;
    }
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BMTableStore setupClassArray:table:named:error:]();
    }
    goto LABEL_28;
  }
  [(BMTableStore *)self openDB];
  os_unfair_lock_lock(&self->_lock);
  BOOL v15 = [(BMTableStore *)self db];

  if (!v15)
  {
    os_unfair_lock_unlock(&self->_lock);
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56 = @"setupClassArray, can not open database";
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v18 = [v33 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v34];

    if (a6) {
      *a6 = v18;
    }
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BMTableStore setupClassArray:table:named:error:]();
    }
LABEL_28:
    BOOL v32 = 0;
    goto LABEL_47;
  }
  os_unfair_lock_t lock = &self->_lock;
  v16 = objc_opt_new();
  v17 = objc_opt_new();
  v18 = objc_msgSend(v16, "stringByAppendingFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" ("), v14;

  v19 = objc_msgSend(v17, "stringByAppendingFormat:", @"REPLACE INTO \"%@\" VALUES ("), v14;

  v20 = [v12 schema];
  v21 = [v20 columnNames];

  uint64_t v22 = [v11 count];
  v50 = v21;
  if (v22 != [v21 count])
  {
    os_unfair_lock_unlock(lock);
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v54 = @"classArray and columnNames sizes do not match";
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v24 = [v35 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v36];

    if (a6) {
      *a6 = v24;
    }
    v37 = __biome_log_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BMTableStore setupClassArray:table:named:error:].cold.5();
    }
    goto LABEL_44;
  }
  id v47 = v12;
  if (![v11 count])
  {
    v28 = v19;
LABEL_38:
    v38 = v18;
    v18 = [v18 stringByAppendingString:@""]);;

    v19 = [v28 stringByAppendingString:@""]);;

    v39 = [(BMTableStore *)self db];
    char v40 = [v39 executeUpdate:v18];

    os_unfair_lock_unlock(lock);
    if (v40)
    {
      objc_storeStrong((id *)&self->_sqlReplace, v19);
      objc_storeStrong((id *)&self->_classArray, a3);
      BOOL v32 = 1;
      id v12 = v47;
      goto LABEL_46;
    }
    v41 = [(BMTableStore *)self db];
    v24 = [v41 lastError];

    id v12 = v47;
    if (a6) {
      *a6 = v24;
    }
    v37 = __biome_log_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BMTableStore setupClassArray:table:named:error:](self, (uint64_t)v24, v37);
    }
LABEL_44:

    [(BMTableStore *)self closeDB];
    goto LABEL_45;
  }
  unint64_t v23 = 0;
  while (1)
  {
    v24 = [v11 objectAtIndex:v23];
    if ([v24 isEqual:objc_opt_class()])
    {
      v25 = [v50 objectAtIndexedSubscript:v23];
      [v18 stringByAppendingFormat:@"\"%@\" TEXT", v25];
      goto LABEL_11;
    }
    if (![v24 isEqual:objc_opt_class()]) {
      break;
    }
    v25 = [v50 objectAtIndexedSubscript:v23];
    [v18 stringByAppendingFormat:@"\"%@\" REAL", v25];
    v26 = LABEL_11:;

    if (v23)
    {
      if (v23 == [v11 count] - 1 || (unint64_t)objc_msgSend(v11, "count") < 2)
      {
        v18 = v26;
        goto LABEL_19;
      }
      uint64_t v27 = [v26 stringByAppendingString:@", "];
      v18 = v26;
    }
    else
    {
      v18 = [v26 stringByAppendingString:@" UNIQUE PRIMARY KEY"];

      if ((unint64_t)[v11 count] < 2) {
        goto LABEL_19;
      }
      uint64_t v27 = [v18 stringByAppendingString:@" ,"];
    }

    v18 = (void *)v27;
LABEL_19:
    v28 = [v19 stringByAppendingString:@"?"];

    if (v23 < [v11 count] - 1 && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      uint64_t v29 = [v28 stringByAppendingString:@", "];

      v28 = v29;
    }

    ++v23;
    v19 = v28;
    if (v23 >= [v11 count]) {
      goto LABEL_38;
    }
  }
  os_unfair_lock_unlock(lock);
  v43 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v52 = @"classArray must contain NSString or NSNumber";
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v45 = [v43 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v44];

  if (a6) {
    *a6 = v45;
  }
  v46 = __biome_log_for_category();
  id v12 = v47;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
    -[BMTableStore setupClassArray:table:named:error:].cold.4();
  }

  [(BMTableStore *)self closeDB];
LABEL_45:

  BOOL v32 = 0;
LABEL_46:

LABEL_47:
  return v32;
}

- (BOOL)upsertRows:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (!v6)
  {
    BOOL v18 = 1;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  uint64_t v38 = *(void *)v41;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v41 != v38) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      NSUInteger v10 = [(NSArray *)self->_classArray count];
      if (v10 != [v9 columnCount])
      {
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"BMTableUpsertSubscriber: input array has %lu elements and must have %lu elements", objc_msgSend(v9, "columnCount"), -[NSArray count](self->_classArray, "count"));
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v47 = v12;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        unint64_t v23 = [v29 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v30];

        if (a4) {
          *a4 = v23;
        }
        v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          -[BMTableStore upsertRows:error:]();
        }

LABEL_20:
LABEL_21:

        BOOL v18 = 0;
        goto LABEL_23;
      }
      if ([(NSArray *)self->_classArray count])
      {
        uint64_t v11 = 0;
        while (1)
        {
          id v12 = [v9 valueAtIdx:v11];
          id v13 = [(NSArray *)self->_classArray objectAtIndex:v11];
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            break;
          }

          if (++v11 >= [(NSArray *)self->_classArray count]) {
            goto LABEL_11;
          }
        }
        v19 = NSString;
        v20 = [(id)objc_opt_class() description];
        v21 = [(NSArray *)self->_classArray objectAtIndex:v11];
        uint64_t v22 = [v21 description];
        unint64_t v23 = [v19 stringWithFormat:@"input classes must match (index=%ld) %@ vs. %@", v11, v20, v22];

        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        v45 = v23;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v26 = [v24 errorWithDomain:@"BMFlexibleStorageTableErrorDomain" code:-1 userInfo:v25];

        if (a4) {
          *a4 = v26;
        }
        uint64_t v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          -[BMTableStore upsertRows:error:]();
        }

        goto LABEL_20;
      }
LABEL_11:
      os_unfair_lock_lock(&self->_lock);
      BOOL v15 = [(BMTableStore *)self db];
      sqlReplace = self->_sqlReplace;
      v17 = [v9 values];
      LOBYTE(sqlReplace) = [v15 executeUpdate:sqlReplace values:v17 error:a4];

      os_unfair_lock_unlock(&self->_lock);
      if ((sqlReplace & 1) == 0)
      {
        id v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BMTableStore upsertRows:error:]((uint64_t)a4, v12, v32, v33, v34, v35, v36, v37);
        }
        goto LABEL_21;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    BOOL v18 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_23:

  return v18;
}

- (id)selectTableNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(BMTableStore *)self openDB])
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v7 = [(BMTableStore *)self db];
    id v8 = [v7 getTableSchema:v6];

    v9 = objc_opt_new();
    if ([v8 next])
    {
      do
      {
        NSUInteger v10 = [v8 objectForColumnIndex:1];
        [v9 addObject:v10];
      }
      while (([v8 next] & 1) != 0);
    }
    if ([v9 count])
    {
      uint64_t v11 = objc_opt_new();
      id v25 = v6;
      id v12 = [v11 stringByAppendingFormat:@"SELECT * FROM \"%@\"", v6];

      id v13 = [(BMTableStore *)self db];
      id v14 = [v13 executeQuery:v12];

      v24 = [[BMTableSchema alloc] initWithColumnNames:v9];
      BOOL v15 = objc_opt_new();
      if ([v14 next])
      {
        do
        {
          v16 = objc_opt_new();
          if ((int)[v14 columnCount] >= 1)
          {
            uint64_t v17 = 0;
            do
            {
              BOOL v18 = [v14 objectForColumnIndex:v17];
              [v16 addObject:v18];

              uint64_t v17 = (v17 + 1);
            }
            while ((int)v17 < (int)[v14 columnCount]);
          }
          v19 = [[BMSQLRow alloc] initWithValues:v16];
          [v15 addObject:v19];
        }
        while (([v14 next] & 1) != 0);
      }
      v20 = [[BMTable alloc] initWithRows:v15 schema:v24];
      os_unfair_lock_unlock(&self->_lock);
      [(BMTableStore *)self closeDB];

      id v6 = v25;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    if (a4)
    {
      v21 = [(BMTableStore *)self db];
      *a4 = [v21 lastError];
    }
    uint64_t v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BMTableStore selectTableNamed:error:](self, v22);
    }

    v20 = 0;
  }

  return v20;
}

- (_bmFMDatabase)db
{
  return self->_db;
}

- (NSURL)dbURL
{
  return self->_dbURL;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSArray)classArray
{
  return self->_classArray;
}

- (NSString)sqlReplace
{
  return self->_sqlReplace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlReplace, 0);
  objc_storeStrong((id *)&self->_classArray, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)openDB
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [a1 db];
  id v5 = [v4 databaseURL];
  id v6 = [a1 db];
  uint64_t v7 = [v6 lastError];
  int v8 = 138412546;
  v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_ERROR, "BMTableStore: Could not open database: %@ err:%@.", (uint8_t *)&v8, 0x16u);
}

- (void)closeDB
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [a1 db];
  id v5 = [a1 db];
  id v6 = [v5 lastError];
  int v7 = 138412546;
  int v8 = v4;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_ERROR, "BMTableUpsertSubscriber: Could not close database: %@ err:%@.", (uint8_t *)&v7, 0x16u);
}

- (void)setupClassArray:table:named:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "Invalid table setup data %@", v2, v3, v4, v5, v6);
}

- (void)setupClassArray:table:named:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "Invalid db %@", v2, v3, v4, v5, v6);
}

- (void)setupClassArray:(NSObject *)a3 table:named:error:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 dbURL];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1B87BE000, a3, OS_LOG_TYPE_FAULT, "Could not create table: %@ err:%@.", v6, 0x16u);
}

- (void)setupClassArray:table:named:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "classArray must contain NSString or NSNumber %@", v2, v3, v4, v5, v6);
}

- (void)setupClassArray:table:named:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "Count Mismatch Error: %@", v2, v3, v4, v5, v6);
}

- (void)upsertRows:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)upsertRows:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "Element Mismatch %@", v2, v3, v4, v5, v6);
}

- (void)upsertRows:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B87BE000, v0, v1, "Count Mismatch %@", v2, v3, v4, v5, v6);
}

- (void)selectTableNamed:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 db];
  uint64_t v4 = [v3 lastError];
  uint64_t v5 = [v4 description];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_FAULT, "BMBiomeTableStore: unable to open database: %@", v6, 0xCu);
}

@end