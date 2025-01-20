@interface HDSQLiteDatabase(MigrationUtilities)
+ (BOOL)databaseSchemas:()MigrationUtilities containTable:;
- (uint64_t)deleteDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:;
- (uint64_t)deleteDataEntitySubclassTablesIfExist:()MigrationUtilities intermediateTables:error:;
- (uint64_t)deleteRowsFromDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:;
@end

@implementation HDSQLiteDatabase(MigrationUtilities)

- (uint64_t)deleteRowsFromDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:
{
  aBlock[16] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v30 = a1;
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = [NSString stringWithFormat:@"DELETE FROM metadata_values WHERE object_id IN (SELECT data_id FROM %@)", v7];
    [v9 addObject:v10];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:aBlock count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE data_id IN (SELECT data_id FROM %@)", *(void *)(*((void *)&v35 + 1) + 8 * i), v7];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:aBlock count:16];
      }
      while (v12);
    }

    v16 = [NSString stringWithFormat:@"DELETE FROM %@", v7];
    [v9 addObject:v16];
  }
  else
  {
    id v9 = 0;
  }

  if (!v9) {
    goto LABEL_18;
  }
  id v17 = v7;
  v18 = v17;
  if (!v30)
  {

    goto LABEL_18;
  }
  *(void *)&long long v35 = 0;
  *((void *)&v35 + 1) = &v35;
  long long v36 = 0x2020000000uLL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__HDSQLiteDatabase_MigrationUtilities___correlationCountForDataEntitySubclassTable_count_error___block_invoke;
  aBlock[3] = &unk_1E62F3640;
  aBlock[4] = &v35;
  v19 = _Block_copy(aBlock);
  v20 = [NSString stringWithFormat:@"SELECT COUNT(*) FROM correlations WHERE correlation IN (SELECT data_id FROM %@) OR object IN (SELECT data_id FROM %@)", v18, v18];
  int v21 = [v30 executeSQL:v20 error:a5 bindingHandler:0 enumerationHandler:v19];
  if (v21) {
    uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 24);
  }
  else {
    uint64_t v22 = 0;
  }

  _Block_object_dispose(&v35, 8);
  if (!v21) {
    goto LABEL_18;
  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Unable to remove samples with associations.");
LABEL_18:
    uint64_t v23 = 0;
    goto LABEL_19;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v9;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v32;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v25);
        }
        if (![v30 executeUncachedSQL:*(void *)(*((void *)&v31 + 1) + 8 * j) error:a5 bindingHandler:0 enumerationHandler:0])
        {
          uint64_t v23 = 0;
          goto LABEL_30;
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  uint64_t v23 = 1;
LABEL_30:

LABEL_19:
  return v23;
}

- (uint64_t)deleteDataEntitySubclassTable:()MigrationUtilities intermediateTables:error:
{
  id v8 = a3;
  if ([a1 deleteRowsFromDataEntitySubclassTable:v8 intermediateTables:a4 error:a5])
  {
    id v9 = [NSString stringWithFormat:@"DROP TABLE %@", v8];
    uint64_t v10 = [a1 executeUncachedSQL:v9 error:a5 bindingHandler:0 enumerationHandler:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)deleteDataEntitySubclassTablesIfExist:()MigrationUtilities intermediateTables:error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 dumpSchemaWithError:a5];
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v20 = v8;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if ([(id)objc_opt_class() databaseSchemas:v10 containTable:v16])
          {
            if (![a1 deleteDataEntitySubclassTable:v16 intermediateTables:v9 error:a5])
            {
              uint64_t v18 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            _HKInitializeLogging();
            id v17 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v16;
              _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "Skipping deletion from nonexistent table \"%@\"", buf, 0xCu);
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v13);
      uint64_t v18 = 1;
LABEL_16:
      id v8 = v20;
    }
    else
    {
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)databaseSchemas:()MigrationUtilities containTable:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 componentsSeparatedByString:@"."];
  if ((unint64_t)[v7 count] < 2)
  {
    id v8 = @"main";
  }
  else
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = [v7 objectAtIndexedSubscript:1];

    id v6 = (id)v9;
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:v8];
  id v11 = [v10 tables];
  uint64_t v12 = [v11 objectForKeyedSubscript:v6];
  BOOL v13 = v12 != 0;

  return v13;
}

@end