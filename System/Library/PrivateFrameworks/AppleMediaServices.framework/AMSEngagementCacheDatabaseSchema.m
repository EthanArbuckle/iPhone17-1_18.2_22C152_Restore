@interface AMSEngagementCacheDatabaseSchema
+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3;
+ (void)_migrateVersion0to1WithMigration:(id)a3;
@end

@implementation AMSEngagementCacheDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[AMSSQLiteSchema alloc] initWithConnection:v4];
  uint64_t v6 = [(AMSSQLiteSchema *)v5 currentUserVersion];
  while (1)
  {
    if (v6 > 0)
    {
      BOOL v12 = 1;
      goto LABEL_19;
    }
    if (!v6)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__AMSEngagementCacheDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke;
      v15[3] = &__block_descriptor_40_e34_v16__0__AMSSQLiteSchemaMigration_8l;
      v15[4] = a1;
      if (![(AMSSQLiteSchema *)v5 migrateToVersion:1 usingBlock:v15]) {
        break;
      }
    }
    uint64_t v7 = [(AMSSQLiteSchema *)v5 currentUserVersion];
    BOOL v8 = v7 == v6;
    uint64_t v6 = v7;
    if (v8)
    {
      v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        v9 = +[AMSLogConfig sharedConfig];
      }
      v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update Engagement cache database scheme. User version did not change", buf, 0xCu);
      }
      BOOL v12 = 1;
      goto LABEL_18;
    }
  }
  v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    v9 = +[AMSLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update Engagement cache database scheme. Success = NO", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_18:

LABEL_19:
  return v12;
}

uint64_t __72__AMSEngagementCacheDatabaseSchema_createOrUpdateSchemaUsingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _migrateVersion0to1WithMigration:a2];
}

+ (void)_migrateVersion0to1WithMigration:(id)a3
{
  id v3 = a3;
  [v3 executeStatement:@"PRAGMA auto_vacuum = 2;"];
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"CREATE TABLE IF NOT EXISTS %@(  %@ BLOB,  %@ REAL,  %@ BLOB,  %@ INTEGER PRIMARY KEY);",
                 @"responses",
                 @"data",
                 @"expiration",
                 @"filter",
                 @"identifier");
  [v3 executeStatement:v4];
}

@end