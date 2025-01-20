@interface EDAddBusinessAddressesTableCategoryColumnUpgradeStep
+ (id)_businessCategoriesTableSchema;
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddBusinessAddressesTableCategoryColumnUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;

  return v2;
}

void __59__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 columnExists:@"address" inTable:@"business_categories" type:0])
  {
    int v5 = sqlite3_exec((sqlite3 *)[v4 sqlDB], "ALTER TABLE business_categories RENAME TO old_business_categories;",
           0,
           0,
           0);
    if (v5)
    {
      v6 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.5();
      }
      goto LABEL_30;
    }
    v6 = [a1 _businessCategoriesTableSchema];
    v7 = [v6 definitionWithDatabaseName:&stru_1F3583658];
    v8 = (sqlite3 *)[v4 sqlDB];
    id v9 = v7;
    int v5 = sqlite3_exec(v8, (const char *)[v9 UTF8String], 0, 0, 0);
    if (v5)
    {
      v10 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:].cold.4();
      }
LABEL_14:

      goto LABEL_30;
    }
    int v5 = sqlite3_exec((sqlite3 *)[v4 sqlDB], "INSERT INTO business_categories (business, category) SELECT business, category FROM old_business_categories;",
           0,
           0,
           0);
    if (v5)
    {
      v10 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:]();
      }
      goto LABEL_14;
    }
    int v5 = sqlite3_exec((sqlite3 *)[v4 sqlDB], "DROP TABLE old_business_categories;", 0, 0, 0);
    if (v5)
    {
      v10 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:]();
      }
      goto LABEL_14;
    }
  }
  if (([v4 columnExists:@"category" inTable:@"business_addresses" type:0] & 1) != 0
    || (int v5 = sqlite3_exec((sqlite3 *)[v4 sqlDB], (const char *)objc_msgSend(@"ALTER TABLE business_addresses ADD COLUMN category INTEGER;",
                               "UTF8String"),
               0,
               0,
               0)) == 0)
  {
    v6 = [objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"business" table:@"business_categories"];
    [v6 addResultColumn:@"category"];
    *(void *)buf = 0;
    v22 = buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_runWithConnection___block_invoke;
    v18[3] = &unk_1E6BFF208;
    v20 = buf;
    id v19 = v4;
    id v17 = 0;
    int v11 = [v19 executeSelectStatement:v6 withBlock:v18 error:&v17];
    id v12 = v17;
    if (v11)
    {
      v13 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 134217984;
        uint64_t v26 = 0;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Successfully populated %lu rows in the business_addresses table.", v25, 0xCu);
      }

      if (v22[24])
      {
        int v5 = 0;
LABEL_29:

        _Block_object_dispose(buf, 8);
        goto LABEL_30;
      }
    }
    else
    {
      v14 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_msgSend(v12, "ef_publicDescription");
        +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep runWithConnection:v14];
      }
    }
    int v5 = 1;
    goto LABEL_29;
  }
  v6 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Failed to add category column in business_addresses table", buf, 2u);
  }
LABEL_30:

  return v5;
}

void __74__EDAddBusinessAddressesTableCategoryColumnUpgradeStep_runWithConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  int v5 = [v4 numberValue];

  v6 = [v3 objectAtIndexedSubscript:1];
  v7 = [v6 numberValue];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"business_addresses"];
  [v8 setObject:v7 forKeyedSubscript:@"category"];
  id v9 = [MEMORY[0x1E4F60E78] column:@"business"];
  v10 = [v9 equalTo:v5];
  [v8 setWhereClause:v10];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v11 + 24))
  {
    id v12 = *(void **)(a1 + 32);
    id v21 = 0;
    char v13 = [v12 executeUpdateStatement:v8 error:&v21];
    id v14 = v21;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    id v14 = 0;
    char v13 = 0;
  }
  *(unsigned char *)(v11 + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v15 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v5 longLongValue];
      uint64_t v17 = [v7 integerValue];
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated category for business ID %lld to %ld", buf, 0x16u);
    }
  }
  else
  {
    v15 = +[EDAddBusinessAddressesTableCategoryColumnUpgradeStep log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v5 longLongValue];
      uint64_t v19 = [v7 integerValue];
      v20 = objc_msgSend(v14, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = v18;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      _os_log_error_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_ERROR, "Failed to update category for business ID %lld to %ld due to error %@{public}", buf, 0x20u);
    }
  }
}

+ (id)_businessCategoriesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"business" nullable:0];
  v10[0] = v3;
  id v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:0];
  v10[1] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = (void *)[v2 initWithName:@"business_categories" rowIDType:1 columns:v5];

  id v9 = @"business";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v6 addUniquenessConstraintForColumns:v7 conflictResolution:1];

  return v6;
}

+ (void)runWithConnection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to update business_addresses table due to error %@{public}", buf, 0xCu);
}

+ (void)runWithConnection:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to drop old_business_categories table", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to drop populate business_categories table with existing user overrides", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to create new business_categories table", v2, v3, v4, v5, v6);
}

+ (void)runWithConnection:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to rename business_categories table", v2, v3, v4, v5, v6);
}

@end