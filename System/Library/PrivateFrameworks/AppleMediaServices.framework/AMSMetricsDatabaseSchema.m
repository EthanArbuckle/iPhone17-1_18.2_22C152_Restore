@interface AMSMetricsDatabaseSchema
+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3;
+ (void)migrateVersion0to1WithMigration:(id)a3;
+ (void)migrateVersion1to2WithMigration:(id)a3;
+ (void)migrateVersion3to4WithMigration:(id)a3;
+ (void)migrateVersion4to5WithMigration:(id)a3;
+ (void)migrateVersion5to6WithMigration:(id)a3;
@end

@implementation AMSMetricsDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v4 = [[AMSSQLiteSchema alloc] initWithConnection:v19];
  unint64_t v7 = [(AMSSQLiteSchema *)v4 currentUserVersion];
  while (!v6 && v5)
  {
LABEL_11:
    unint64_t v11 = [(AMSSQLiteSchema *)v4 currentUserVersion];
    BOOL v5 = v11 >= v7;
    BOOL v6 = v11 == v7;
    unint64_t v7 = v11;
    if (v6)
    {
      v12 = +[AMSLogConfig sharedMetricsConfig];
      if (!v12)
      {
        v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v14;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update database scheme. User version did not change", buf, 0xCu);
      }
      BOOL v15 = 1;
      goto LABEL_24;
    }
  }
  switch(v7)
  {
    case 0uLL:
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke;
      v25[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v25[4] = a1;
      v8 = v25;
      v9 = v4;
      uint64_t v10 = 1;
      goto LABEL_10;
    case 1uLL:
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_2;
      v24[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v24[4] = a1;
      v8 = v24;
      v9 = v4;
      uint64_t v10 = 2;
      goto LABEL_10;
    case 2uLL:
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_3;
      v23[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v23[4] = a1;
      v8 = v23;
      v9 = v4;
      uint64_t v10 = 3;
      goto LABEL_10;
    case 3uLL:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_4;
      v22[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v22[4] = a1;
      v8 = v22;
      v9 = v4;
      uint64_t v10 = 4;
      goto LABEL_10;
    case 4uLL:
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_5;
      v21[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v21[4] = a1;
      v8 = v21;
      v9 = v4;
      uint64_t v10 = 5;
      goto LABEL_10;
    case 5uLL:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_6;
      v20[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v20[4] = a1;
      v8 = v20;
      v9 = v4;
      uint64_t v10 = 6;
LABEL_10:
      if ([(AMSSQLiteSchema *)v9 migrateToVersion:v10 usingBlock:v8]) {
        goto LABEL_11;
      }
      v12 = +[AMSLogConfig sharedMetricsConfig];
      if (!v12)
      {
        v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v17;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update database scheme. Success = NO", buf, 0xCu);
      }
      BOOL v15 = 0;
      break;
    default:
      BOOL v15 = 1;
      v16 = v19;
      goto LABEL_25;
  }
LABEL_24:
  v16 = v19;

LABEL_25:
  return v15;
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion0to1WithMigration:a2];
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion1to2WithMigration:a2];
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion2to3WithMigration:a2];
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion3to4WithMigration:a2];
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion4to5WithMigration:a2];
}

uint64_t __64__AMSMetricsDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) migrateVersion5to6WithMigration:a2];
}

+ (void)migrateVersion0to1WithMigration:(id)a3
{
  id v3 = a3;
  [v3 executeStatement:@"PRAGMA auto_vacuum = 2;"];
  [v3 executeStatement:@"CREATE TABLE events (pid INTEGER, report_url TEXT, eventBody TEXT, locked_by TEXT, locked_time REAL DEFAULT 0, timestampInserted REAL, PRIMARY KEY (pid));"];
  [v3 executeStatement:@"CREATE INDEX events_locked_by ON events (locked_by);"];
  [v3 executeStatement:@"CREATE INDEX events_locked_time ON events (locked_time);"];
  [v3 executeStatement:@"CREATE INDEX events_report_url ON events (report_url);"];
  [v3 executeStatement:@"CREATE INDEX events_timestampInserted ON events (timestampInserted);"];
}

+ (void)migrateVersion1to2WithMigration:(id)a3
{
}

+ (void)migrateVersion3to4WithMigration:(id)a3
{
}

+ (void)migrateVersion4to5WithMigration:(id)a3
{
  id v3 = a3;
  [v3 executeOptionalStatement:@"ALTER TABLE identifiers RENAME TO old_identifiers;"];
  [v3 executeStatement:@"CREATE TABLE identifier_stores (store_key TEXT PRIMARY KEY, store_uuid TEXT UNIQUE, account TEXT, interval REAL, cross_device INTEGER, started REAL, modified REAL, last_sync REAL DEFAULT 0, deleted INTEGER DEFAULT 0);"];
  [v3 executeStatement:@"CREATE TABLE identifiers (identifier_key TEXT PRIMARY KEY, store_uuid TEXT, name TEXT, value TEXT, cross_device INTEGER, expires REAL, modified REAL, last_sync REAL DEFAULT 0, deleted INTEGER DEFAULT 0);"];
  [v3 executeStatement:@"CREATE INDEX identifiers_store_uuid ON identifiers (store_uuid);"];
  v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke;
  v8[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v8[4] = v6;
  objc_msgSend(v3, "executeOptionalStatement:bindings:", @"INSERT INTO identifier_stores (store_key, store_uuid, account, interval, cross_device, started, modified) SELECT key, key, account, 0, 0, ?, ? FROM old_identifiers;",
    v8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke_2;
  v7[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v7[4] = v6;
  objc_msgSend(v3, "executeOptionalStatement:bindings:", @"INSERT INTO identifiers (identifier_key, store_uuid, name, value, cross_device, expires, modified) SELECT key || '_clientId', key, 'clientId', value, 0, expires, ? FROM old_identifiers;",
    v7);
  [v3 executeOptionalStatement:@"DROP TABLE old_identifiers;"];
}

void __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 bindDouble:1 atPosition:v3];
  [v4 bindDouble:2 atPosition:*(double *)(a1 + 32)];
  [v4 bindDouble:3 atPosition:*(double *)(a1 + 32)];
}

uint64_t __60__AMSMetricsDatabaseSchema_migrateVersion4to5WithMigration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindDouble:1 atPosition:*(double *)(a1 + 32)];
}

+ (void)migrateVersion5to6WithMigration:(id)a3
{
}

@end