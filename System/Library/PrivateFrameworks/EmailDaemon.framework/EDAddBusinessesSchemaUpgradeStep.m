@interface EDAddBusinessesSchemaUpgradeStep
+ (id)_businessAddressesTableSchema;
+ (id)_businessCategoriesTableSchema;
+ (id)_businessesTableSchema;
+ (id)log;
+ (int)runWithConnection:(id)a3 databaseName:(id)a4 updateProtectedSchema:(BOOL)a5;
@end

@implementation EDAddBusinessesSchemaUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EDAddBusinessesSchemaUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;

  return v2;
}

void __39__EDAddBusinessesSchemaUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3 databaseName:(id)a4 updateProtectedSchema:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = sqlite3_exec((sqlite3 *)[v8 sqlDB], "DROP TABLE IF EXISTS businesses", 0, 0, 0);
  if (v10)
  {
    v11 = +[EDAddBusinessesSchemaUpgradeStep log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Failed to drop businesses table", buf, 2u);
    }
    goto LABEL_28;
  }
  if (!v5) {
    goto LABEL_19;
  }
  if (![v8 columnExists:@"domain" inTable:@"addresses" type:0])
  {
LABEL_15:
    v11 = [a1 _businessesTableSchema];
    v19 = [v11 definitionWithDatabaseName:v9];
    v20 = (sqlite3 *)[v8 sqlDB];
    id v21 = v19;
    int v10 = sqlite3_exec(v20, (const char *)[v21 UTF8String], 0, 0, 0);
    if (v10)
    {
      v22 = +[EDAddBusinessesSchemaUpgradeStep log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = 0;
        v23 = "Failed to create businesses table";
        v24 = (uint8_t *)&v33;
LABEL_22:
        _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, v23, v24, 2u);
        goto LABEL_27;
      }
      goto LABEL_27;
    }

LABEL_19:
    v11 = [a1 _businessAddressesTableSchema];
    v25 = [v11 definitionWithDatabaseName:0];
    v26 = (sqlite3 *)[v8 sqlDB];
    id v21 = v25;
    int v10 = sqlite3_exec(v26, (const char *)[v21 UTF8String], 0, 0, 0);
    if (!v10)
    {
      v22 = [a1 _businessCategoriesTableSchema];
      v27 = [v22 definitionWithDatabaseName:0];

      v28 = (sqlite3 *)[v8 sqlDB];
      id v21 = v27;
      int v10 = sqlite3_exec(v28, (const char *)[v21 UTF8String], 0, 0, 0);
      if (v10)
      {
        v29 = +[EDAddBusinessesSchemaUpgradeStep log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1DB39C000, v29, OS_LOG_TYPE_DEFAULT, "Failed to create business_categories table", v31, 2u);
        }
      }
      goto LABEL_27;
    }
    v22 = +[EDAddBusinessesSchemaUpgradeStep log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      v23 = "Failed to create business_addresses table";
      v24 = v32;
      goto LABEL_22;
    }
LABEL_27:

    goto LABEL_28;
  }
  v12 = [NSString stringWithFormat:@"ALTER TABLE %@.addresses DROP COLUMN domain;", v9];
  v13 = (sqlite3 *)[v8 sqlDB];
  v11 = v12;
  int v10 = sqlite3_exec(v13, (const char *)[v11 UTF8String], 0, 0, 0);
  if (v10)
  {
    v14 = +[EDAddBusinessesSchemaUpgradeStep log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Failed to drop domain column in addresses table", v35, 2u);
    }

    goto LABEL_28;
  }
  v15 = [NSString stringWithFormat:@"ALTER TABLE %@.addresses DROP COLUMN business;", v9];
  v16 = (sqlite3 *)[v8 sqlDB];
  id v17 = v15;
  int v10 = sqlite3_exec(v16, (const char *)[v17 UTF8String], 0, 0, 0);
  if (!v10)
  {

    goto LABEL_15;
  }
  v18 = +[EDAddBusinessesSchemaUpgradeStep log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Failed to drop business column in addresses table", v34, 2u);
  }

LABEL_28:
  return v10;
}

+ (id)_businessCategoriesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"business" nullable:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:0];
  v10[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = (void *)[v2 initWithName:@"business_categories" rowIDType:1 columns:v5];

  id v9 = @"business";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v6 addUniquenessConstraintForColumns:v7 conflictResolution:1];

  return v6;
}

+ (id)_businessesTableSchema
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v27 = [MEMORY[0x1E4F60E80] textColumnWithName:@"domain" collation:2 nullable:1];
  v26 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"brand_id" nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"address_comment" collation:2 nullable:0];
  v33[0] = v3;
  v33[1] = v27;
  v33[2] = v26;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  BOOL v5 = (void *)[v2 initWithName:@"businesses" rowIDType:2 columns:v4];

  v32[0] = @"address_comment";
  v32[1] = @"domain";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v5 addUniquenessConstraintForColumns:v6 conflictResolution:1];

  v31 = @"brand_id";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v5 addUniquenessConstraintForColumns:v7 conflictResolution:1];

  id v8 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v9 = [v27 columnExpression];
  int v10 = [v9 isNotNull];
  v30[0] = v10;
  v11 = [v26 columnExpression];
  v12 = [v11 isNull];
  v30[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v14 = (void *)[v8 initWithExpressions:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F60E48]);
  v16 = [v27 columnExpression];
  id v17 = [v16 isNull];
  v29[0] = v17;
  v18 = [v26 columnExpression];
  v19 = [v18 isNotNull];
  v29[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v21 = (void *)[v15 initWithExpressions:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v28[0] = v14;
  v28[1] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v24 = (void *)[v22 initWithExpressions:v23];

  [v5 addCheckConstraintForExpression:v24];

  return v5;
}

+ (id)_businessAddressesTableSchema
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"business" nullable:0];
  v12[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:1];
  v12[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_modified" nullable:1];
  v12[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v8 = (void *)[v2 initWithName:@"business_addresses" rowIDType:1 columns:v7];

  v11 = @"address";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v8 addUniquenessConstraintForColumns:v9 conflictResolution:1];

  return v8;
}

@end