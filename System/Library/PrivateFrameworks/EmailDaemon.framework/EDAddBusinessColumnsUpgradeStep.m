@interface EDAddBusinessColumnsUpgradeStep
+ (BOOL)runWithConnection:(id)a3 protectedIndexInitialized:(BOOL)a4 protectedDatabaseName:(id)a5;
+ (id)_businessesTableSchema;
+ (id)log;
@end

@implementation EDAddBusinessColumnsUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDAddBusinessColumnsUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;

  return v2;
}

void __38__EDAddBusinessColumnsUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

+ (BOOL)runWithConnection:(id)a3 protectedIndexInitialized:(BOOL)a4 protectedDatabaseName:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v6) {
    goto LABEL_11;
  }
  if (!sqlite3_exec((sqlite3 *)[v8 sqlDB], "DROP TABLE businesses", 0, 0, 0))
  {
    v11 = [a1 _businessesTableSchema];
    v12 = [v11 definitionWithDatabaseName:v9];
    v13 = (sqlite3 *)[v8 sqlDB];
    id v14 = v12;
    if (sqlite3_exec(v13, (const char *)[v14 UTF8String], 0, 0, 0))
    {
      v15 = +[EDAddBusinessColumnsUpgradeStep log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[EDAddBusinessColumnsUpgradeStep runWithConnection:protectedIndexInitialized:protectedDatabaseName:](v15);
      }

      goto LABEL_19;
    }

LABEL_11:
    if ([v8 columnExists:@"last_bcs_sync" inTable:@"business_addresses" type:0])
    {
      v16 = +[EDAddBusinessColumnsUpgradeStep log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = @"last_bcs_sync";
        _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%@ column already exists.", buf, 0xCu);
      }
    }
    else
    {
      v17 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ ADD %@ INTEGER", @"business_addresses", @"last_bcs_sync"];
      v18 = (sqlite3 *)[v8 sqlDB];
      id v19 = v17;
      if (sqlite3_exec(v18, (const char *)[v19 UTF8String], 0, 0, 0))
      {
        v20 = +[EDAddBusinessColumnsUpgradeStep log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          +[EDAddBusinessColumnsUpgradeStep runWithConnection:protectedIndexInitialized:protectedDatabaseName:](v20);
        }

        goto LABEL_19;
      }
    }
    BOOL v21 = 1;
    goto LABEL_22;
  }
  v10 = +[EDAddBusinessColumnsUpgradeStep log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[EDAddBusinessColumnsUpgradeStep runWithConnection:protectedIndexInitialized:protectedDatabaseName:](v10);
  }

LABEL_19:
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

+ (id)_businessesTableSchema
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v36 = [MEMORY[0x1E4F60E80] textColumnWithName:@"address_comment" collation:2 nullable:1];
  v35 = [MEMORY[0x1E4F60E80] textColumnWithName:@"domain" collation:2 nullable:1];
  v34 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"brand_id" nullable:1];
  v33 = [MEMORY[0x1E4F60E80] textColumnWithName:@"localized_brand_name" collation:0 nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v34;
  v42[3] = v33;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  id v32 = (id)[v2 initWithName:@"businesses" rowIDType:2 columns:v3];

  v41[0] = @"address_comment";
  v41[1] = @"domain";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v32 addUniquenessConstraintForColumns:v4 conflictResolution:1];

  v40 = @"brand_id";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v32 addUniquenessConstraintForColumns:v5 conflictResolution:1];

  id v6 = objc_alloc(MEMORY[0x1E4F60E48]);
  v7 = [v36 columnExpression];
  id v8 = [v7 isNotNull];
  v39[0] = v8;
  id v9 = [v35 columnExpression];
  v10 = [v9 isNotNull];
  v39[1] = v10;
  v11 = [v34 columnExpression];
  v12 = [v11 isNull];
  v39[2] = v12;
  v13 = [v33 columnExpression];
  id v14 = [v13 isNull];
  v39[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v31 = (void *)[v6 initWithExpressions:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F60E48]);
  v17 = [v36 columnExpression];
  v18 = [v17 isNull];
  v38[0] = v18;
  id v19 = [v35 columnExpression];
  v20 = [v19 isNull];
  v38[1] = v20;
  BOOL v21 = [v34 columnExpression];
  v22 = [v21 isNotNull];
  v38[2] = v22;
  v23 = [v33 columnExpression];
  v24 = [v23 isNotNull];
  v38[3] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  v26 = (void *)[v16 initWithExpressions:v25];

  id v27 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v37[0] = v31;
  v37[1] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v29 = (void *)[v27 initWithExpressions:v28];

  [v32 addCheckConstraintForExpression:v29];

  return v32;
}

+ (void)runWithConnection:(os_log_t)log protectedIndexInitialized:protectedDatabaseName:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  id v2 = @"last_bcs_sync";
  __int16 v3 = 2112;
  v4 = @"business_addresses";
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to add column %@ to %@ table", (uint8_t *)&v1, 0x16u);
}

+ (void)runWithConnection:(os_log_t)log protectedIndexInitialized:protectedDatabaseName:.cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to create new businesses table", v1, 2u);
}

+ (void)runWithConnection:(os_log_t)log protectedIndexInitialized:protectedDatabaseName:.cold.3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to drop businesses table", v1, 2u);
}

@end