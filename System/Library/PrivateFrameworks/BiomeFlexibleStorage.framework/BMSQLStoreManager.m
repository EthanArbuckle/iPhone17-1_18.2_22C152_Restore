@interface BMSQLStoreManager
+ (id)migrations;
- (BMIdentifiable)sessionEvent;
- (BMSQLStoreManager)initWithURL:(id)a3;
- (BOOL)addManagedTable:(id)a3 derivedFromSource:(id)a4;
- (BOOL)addManagedTable:(id)a3 derivedFromStream:(id)a4;
- (NSMutableSet)managedTableNames;
- (id)deleteRowsDerivedFromEvent:(id)a3;
- (id)deleteRowsDerivedFromEvents:(id)a3;
- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4;
- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifiers:(id)a4;
- (id)managedTables;
- (id)sourcesForManagedTable:(id)a3;
- (int)deleteRows:(id)a3 fromTable:(id)a4;
- (void)beginManagedSessionWithEvent:(id)a3;
- (void)endManagedSession;
- (void)prepareTriggerForTable:(id)a3;
- (void)setSessionEvent:(id)a3;
@end

@implementation BMSQLStoreManager

- (BMSQLStoreManager)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BMSQLStoreManager;
  return [(BMSQLStore *)&v4 initWithURL:a3];
}

+ (id)migrations
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"CREATE TABLE BM_MANAGED_TABLES (bm_managed_table TEXT UNIQUE PRIMARY KEY ON CONFLICT IGNORE NOT NULL, bm_source_id TEXT NOT NULL); CREATE TABLE BM_SESSION_CONTEXT (bm_rowid INTEGER PRIMARY KEY AUTOINCREMENT, bm_origin_id TEXT); CREATE TABLE BM_DERIVED_OBJECTS (bm_managed_table_rowid INTEGER NOT NULL, bm_derived_rowid INTEGER NOT NULL, bm_context_rowid INTEGER NOT NULL); CREATE TRIGGER bm_managed_table_ad AFTER DELETE ON BM_MANAGED_TABLES BEGIN DELETE FROM BM_DERIVED_OBJECTS WHERE bm_managed_table_rowid == old.rowid; END; CREATE TRIGGER bm_derived_objects_ad AFTER DELETE ON BM_DERIVED_OBJECTS   WHEN (SELECT count(*) FROM BM_DERIVED_OBJECTS WHERE bm_context_rowid == old.bm_context_rowid) == 0 BEGIN  DELETE FROM BM_SESSION_CONTEXT WHERE bm_rowid == old.bm_context_rowid; END; "];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)managedTables
{
  v3 = [(BMSQLStoreManager *)self managedTableNames];

  if (!v3)
  {
    objc_super v4 = [MEMORY[0x1E4F1CA80] set];
    v5 = [(BMSQLStore *)self db];
    v6 = [v5 executeQuery:@"SELECT bm_managed_table FROM BM_MANAGED_TABLES;"];

    if ([v6 next])
    {
      do
      {
        v7 = [v6 stringForColumnIndex:0];
        [(NSMutableSet *)v4 addObject:v7];
      }
      while (([v6 next] & 1) != 0);
    }
    managedTableNames = self->_managedTableNames;
    self->_managedTableNames = v4;
  }
  v9 = [(BMSQLStoreManager *)self managedTableNames];
  v10 = [v9 allObjects];

  return v10;
}

- (id)sourcesForManagedTable:(id)a3
{
  id v4 = a3;
  v5 = [(BMSQLStore *)self db];
  v6 = objc_msgSend(v5, "executeQuery:", @"SELECT bm_source_id FROM BM_MANAGED_TABLES WHERE bm_managed_table=? ", v4);;

  if (![v6 next]) {
    goto LABEL_6;
  }
  v7 = 0;
  do
  {
    v8 = v7;
    v7 = [v6 stringForColumnIndex:0];
  }
  while (([v6 next] & 1) != 0);
  if (v7)
  {
    v9 = [v7 componentsSeparatedByString:@","];
  }
  else
  {
LABEL_6:
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void)prepareTriggerForTable:(id)a3
{
  id v4 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TRIGGER bm_%@_ai AFTER INSERT ON %@ BEGIN  INSERT INTO BM_DERIVED_OBJECTS (bm_managed_table_rowid, bm_derived_rowid, bm_context_rowid)  SELECT  t.rowid,          new.rowid,          c.rowid  FROM BM_MANAGED_TABLES t, BM_SESSION_CONTEXT c  WHERE t.bm_managed_table == '%@'  ORDER BY c.rowid DESC LIMIT 1;END;",
    v4,
    v4,
  v5 = v4);
  v6 = [(BMSQLStore *)self db];
  char v7 = [v6 executeUpdate:v5];

  if ((v7 & 1) == 0)
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BMSQLStoreManager prepareTriggerForTable:]();
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TRIGGER bm_%@_ad AFTER DELETE ON %@ BEGIN  DELETE FROM BM_DERIVED_OBJECTS  WHERE bm_derived_rowid == old.rowid AND    bm_managed_table_rowid == (SELECT rowid FROM BM_MANAGED_TABLES WHERE bm_managed_table == '%@'); END;",
    v4,
    v4,
  v9 = v4);

  v10 = [(BMSQLStore *)self db];
  char v11 = [v10 executeUpdate:v9];

  if ((v11 & 1) == 0)
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BMSQLStoreManager prepareTriggerForTable:]();
    }
  }
}

- (BOOL)addManagedTable:(id)a3 derivedFromSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 identifier];

  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMSQLStoreManager.m", 134, @"Invalid parameter not satisfying: %@", @"[(id<BMSourceMethods>)source identifier]" object file lineNumber description];
  }
  v10 = [v7 identifier];
  BOOL v11 = [(BMSQLStoreManager *)self addManagedTable:v8 derivedFromStream:v10];

  return v11;
}

- (BOOL)addManagedTable:(id)a3 derivedFromStream:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  id v7 = (void *)[a3 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(BMSQLStoreManager *)self sourcesForManagedTable:v7];
    if ([v8 containsObject:v6])
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v7;
        __int16 v30 = 2112;
        v31 = v8;
        __int16 v32 = 2112;
        v33 = v6;
        _os_log_debug_impl(&dword_1B87BE000, v9, OS_LOG_TYPE_DEBUG, "Table: %@ already has sources: %@, so not registering stream: %@", buf, 0x20u);
      }
      goto LABEL_5;
    }
    BOOL v11 = [(BMSQLStore *)self db];
    char v12 = [v11 tableExists:v7];

    if (v12)
    {
      v13 = [(BMSQLStoreManager *)self managedTables];
      char v14 = [v13 containsObject:v7];

      v15 = __biome_log_for_category();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          __int16 v30 = 2112;
          v31 = v8;
          __int16 v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_1B87BE000, v15, OS_LOG_TYPE_DEFAULT, "Updating existing managed table '%@' with sources: %@ to add new source: %@", buf, 0x20u);
        }

        v9 = [v8 mutableCopy];
        [v9 addObject:v6];
        v17 = [v9 componentsJoinedByString:@","];
        v18 = [(BMSQLStore *)self db];
        char v19 = objc_msgSend(v18, "executeUpdate:", @"UPDATE BM_MANAGED_TABLES SET bm_source_id = ? WHERE bm_managed_table = ?;",
                v17,
                v7);

        if (v19)
        {

LABEL_5:
          BOOL v10 = 1;
LABEL_27:

          goto LABEL_28;
        }
        v22 = __biome_log_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v24 = [(BMSQLStore *)self db];
          v25 = [v24 lastError];
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          __int16 v30 = 2112;
          v31 = v6;
          __int16 v32 = 2112;
          v33 = v25;
          _os_log_fault_impl(&dword_1B87BE000, v22, OS_LOG_TYPE_FAULT, "Failed to update managed table name (%@, %@). %@", buf, 0x20u);
        }
      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412546;
          v29 = v7;
          __int16 v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1B87BE000, v15, OS_LOG_TYPE_DEFAULT, "Adding managed table '%@' derived from %@.", buf, 0x16u);
        }

        v20 = [(BMSQLStore *)self db];
        char v21 = [v20 executeUpdate:@"INSERT INTO BM_MANAGED_TABLES (bm_managed_table, bm_source_id) VALUES (?, ?)", v7, v6];

        if (v21)
        {
          [(BMSQLStoreManager *)self prepareTriggerForTable:v7];
          v9 = [(BMSQLStoreManager *)self managedTableNames];
          [v9 addObject:v7];
          goto LABEL_5;
        }
        v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          v26 = [(BMSQLStore *)self db];
          v27 = [v26 lastError];
          *(_DWORD *)buf = 138412802;
          v29 = v7;
          __int16 v30 = 2112;
          v31 = v6;
          __int16 v32 = 2112;
          v33 = v27;
          _os_log_fault_impl(&dword_1B87BE000, v9, OS_LOG_TYPE_FAULT, "Failed to insert managed table name (%@, %@). %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMSQLStoreManager addManagedTable:derivedFromStream:]();
      }
    }
    BOOL v10 = 0;
    goto LABEL_27;
  }
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[BMSQLStoreManager addManagedTable:derivedFromStream:](v8);
  }
  BOOL v10 = 0;
LABEL_28:

  return v10;
}

- (void)beginManagedSessionWithEvent:(id)a3
{
  id v10 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v10 eventBody];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v10;
  }
  id v11 = v6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BMSQLStoreManager.m", 192, @"Invalid parameter not satisfying: %@", @"[event respondsToSelector:@selector(identifier)]" object file lineNumber description];
  }
  id v7 = [(BMSQLStore *)self db];
  id v8 = [v11 identifier];
  objc_msgSend(v7, "executeUpdate:", @"INSERT INTO BM_SESSION_CONTEXT (bm_origin_id) VALUES (?)", v8);

  [(BMSQLStoreManager *)self setSessionEvent:v11];
}

- (void)endManagedSession
{
}

- (id)deleteRowsDerivedFromEvents:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(BMSQLStore *)self db];
    id v44 = 0;
    char v6 = [v5 startSavePointWithName:@"bm_deletion" error:&v44];
    id v7 = v44;

    if ((v6 & 1) == 0)
    {
      id v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[BMSQLStoreManager deleteRowsDerivedFromEvents:]((uint64_t)v7, v8);
      }
    }
    v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v7);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v29 = v4;
    id obj = v4;
    uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v33)
    {
      uint64_t v31 = *(void *)v41;
      __int16 v32 = self;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v10;
          id v11 = [(BMSQLStoreManager *)self deleteRowsDerivedFromEvent:*(void *)(*((void *)&v40 + 1) + 8 * v10)];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v37 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                v17 = NSNumber;
                v18 = [v9 objectForKeyedSubscript:v16];
                uint64_t v19 = [v18 integerValue];
                v20 = [v11 objectForKeyedSubscript:v16];
                char v21 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v20, "integerValue") + v19);
                [v9 setObject:v21 forKeyedSubscript:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v13);
          }

          uint64_t v10 = v34 + 1;
          self = v32;
        }
        while (v34 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v33);
    }

    v22 = [(BMSQLStore *)self db];
    id v35 = v28;
    char v23 = [v22 releaseSavePointWithName:@"bm_deletion" error:&v35];
    id v24 = v35;

    if ((v23 & 1) == 0)
    {
      v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[BMSQLStoreManager deleteRowsDerivedFromEvents:]((uint64_t)v24, v25);
      }
    }
    v26 = (void *)[v9 copy];

    id v4 = v29;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v26;
}

- (id)deleteRowsDerivedFromEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BMSQLStoreManager.m", 233, @"Invalid parameter not satisfying: %@", @"[event respondsToSelector:@selector(identifier)]" object file lineNumber description];
  }
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(BMSQLStoreManager *)self managedTables];
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v27;
    id v21 = v5;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v8 = [(BMSQLStore *)self db];
        v9 = [v5 identifier];
        uint64_t v10 = [v8 executeQuery:@"SELECT bm_derived_rowid FROM BM_DERIVED_OBJECTS d, BM_SESSION_CONTEXT c, BM_MANAGED_TABLES t WHERE t.bm_managed_table==? AND c.bm_origin_id==? AND bm_managed_table_rowid==t.rowid AND bm_context_rowid==c.rowid", v7, v9];

        id v11 = [MEMORY[0x1E4F1CA48] array];
        if ([v10 next])
        {
          do
          {
            uint64_t v12 = [v10 longForColumnIndex:0];
            uint64_t v13 = [NSNumber numberWithLongLong:v12];
            [v11 addObject:v13];
          }
          while (([v10 next] & 1) != 0);
        }
        uint64_t v14 = [(BMSQLStoreManager *)self deleteRows:v11 fromTable:v7];
        if ((int)v14 >= 1)
        {
          v15 = __biome_log_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = [NSNumber numberWithInt:v14];
            v17 = [(BMSQLStore *)self dbURL];
            *(_DWORD *)buf = 138412802;
            uint64_t v31 = v16;
            __int16 v32 = 2112;
            uint64_t v33 = v7;
            __int16 v34 = 2112;
            id v35 = v17;
            _os_log_impl(&dword_1B87BE000, v15, OS_LOG_TYPE_INFO, "Deleted %@ rows from %@. DB: %@.", buf, 0x20u);

            id v5 = v21;
          }
        }
        v18 = [NSNumber numberWithInt:v14];
        [v24 setObject:v18 forKeyedSubscript:v7];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v25);
  }

  return v24;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  char v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  uint64_t v10 = -[BMSQLStoreManager deleteRowsDerivedFromStream:eventIdentifiers:](self, "deleteRowsDerivedFromStream:eventIdentifiers:", v8, v9, v12, v13);

  return v10;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifiers:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BMSQLStore *)self db];
  id v35 = v6;
  v9 = (void *)[[NSString alloc] initWithFormat:@"%%%@%%", v6];
  uint64_t v10 = @"SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?";
  id v11 = objc_msgSend(v8, "executeQuery:", @"SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?", v9);

  uint64_t v12 = 0;
  if ([v11 next])
  {
    uint64_t v13 = @"SELECT rowid,bm_managed_table from BM_MANAGED_TABLES WHERE bm_source_id LIKE ?";
    __int16 v34 = self;
    uint64_t v37 = v11;
    do
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v11, "longForColumnIndex:", 0));
      v15 = [v11 stringForColumnIndex:1];
      uint64_t v16 = NSString;
      v17 = objc_msgSend(&stru_1F11ED4A0, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v7, "count") - 1, @"?,", 0);
      uint64_t v18 = [v16 stringWithFormat:@"SELECT bm_derived_rowid FROM BM_DERIVED_OBJECTS d, BM_SESSION_CONTEXT c WHERE c.bm_origin_id IN (%@) AND d.bm_managed_table_rowid==? AND d.bm_context_rowid==c.rowid", v17];

      uint64_t v19 = (void *)v14;
      v20 = [(BMSQLStore *)self db];
      id v21 = [v7 arrayByAddingObject:v14];
      long long v38 = (__CFString *)v18;
      v22 = [v20 executeQuery:v18 values:v21 error:0];

      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      if ([v22 next])
      {
        do
        {
          uint64_t v24 = [v22 longForColumnIndex:0];
          uint64_t v25 = [NSNumber numberWithLongLong:v24];
          [v23 addObject:v25];
        }
        while (([v22 next] & 1) != 0);
      }
      [v22 close];
      uint64_t v26 = [(BMSQLStoreManager *)self deleteRows:v23 fromTable:v15];
      if ((int)v26 >= 1)
      {
        long long v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          [NSNumber numberWithInt:v26];
          v28 = long long v36 = v19;
          [(BMSQLStore *)self dbURL];
          __int16 v30 = v29 = v7;
          *(_DWORD *)buf = 138413058;
          long long v42 = v28;
          __int16 v43 = 2112;
          id v44 = v15;
          __int16 v45 = 2112;
          v46 = v35;
          __int16 v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_1B87BE000, v27, OS_LOG_TYPE_INFO, "Deleted %@ rows from %@ derived from %@. DB: %@.", buf, 0x2Au);

          id v7 = v29;
          self = v34;

          uint64_t v19 = v36;
        }
      }
      uint64_t v12 = (v26 + v12);

      id v11 = v37;
      uint64_t v10 = v38;
      uint64_t v13 = v38;
    }
    while (([v37 next] & 1) != 0);
  }
  long long v39 = v35;
  uint64_t v31 = [NSNumber numberWithInt:v12];
  long long v40 = v31;
  __int16 v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  return v32;
}

- (int)deleteRows:(id)a3 fromTable:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = NSString;
    id v11 = objc_msgSend(&stru_1F11ED4A0, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v6, "count") - 1, @"?,", 0);
    uint64_t v12 = [v10 stringWithFormat:@"DELETE FROM %@ WHERE rowid IN (%@)", v7, v11];

    uint64_t v13 = [(BMSQLStore *)self db];
    char v14 = [v13 executeUpdate:v12 withArgumentsInArray:v6];

    v15 = [(BMSQLStore *)self db];
    int v16 = [v15 changes];

    if (v14)
    {
      if (v9 == v16)
      {
LABEL_10:

        goto LABEL_11;
      }
      v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:v9 - v16];
        uint64_t v19 = [NSNumber numberWithUnsignedInteger:v9];
        *(_DWORD *)buf = 138412802;
        v22 = v18;
        __int16 v23 = 2112;
        uint64_t v24 = v19;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_error_impl(&dword_1B87BE000, v17, OS_LOG_TYPE_ERROR, "Failed to delete %@ of %@ rows derived from %@.", buf, 0x20u);
      }
    }
    else
    {
      v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BMSQLStoreManager deleteRows:fromTable:]();
      }
    }

    goto LABEL_10;
  }
  int v16 = 0;
LABEL_11:

  return v16;
}

- (NSMutableSet)managedTableNames
{
  return self->_managedTableNames;
}

- (BMIdentifiable)sessionEvent
{
  return self->_sessionEvent;
}

- (void)setSessionEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEvent, 0);
  objc_storeStrong((id *)&self->_managedTableNames, 0);
}

- (void)prepareTriggerForTable:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "db");
  v3 = [v2 lastError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B87BE000, v4, v5, "Failed to create managed table deletion trigger for %@. %@", v6, v7, v8, v9, v10);
}

- (void)prepareTriggerForTable:.cold.2()
{
  OUTLINED_FUNCTION_3();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "db");
  v3 = [v2 lastError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B87BE000, v4, v5, "Failed to create managed table insertion trigger for %@. %@", v6, v7, v8, v9, v10);
}

- (void)addManagedTable:derivedFromStream:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "db");
  v3 = [v2 databasePath];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B87BE000, v4, v5, "Table '%@' does not exist in database %@", v6, v7, v8, v9, v10);
}

- (void)addManagedTable:(os_log_t)log derivedFromStream:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B87BE000, log, OS_LOG_TYPE_ERROR, "Argument must be an NSString.", v1, 2u);
}

- (void)deleteRowsDerivedFromEvents:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_ERROR, "Failed to release deletion savepoint. %@", (uint8_t *)&v2, 0xCu);
}

- (void)deleteRowsDerivedFromEvents:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_ERROR, "Failed to start deletion savepoint. %@", (uint8_t *)&v2, 0xCu);
}

- (void)deleteRows:fromTable:.cold.1()
{
  OUTLINED_FUNCTION_3();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_2(v0, v1), "db");
  uint64_t v3 = [v2 lastError];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B87BE000, v4, v5, "Failed to delete rows %@. %@", v6, v7, v8, v9, v10);
}

@end