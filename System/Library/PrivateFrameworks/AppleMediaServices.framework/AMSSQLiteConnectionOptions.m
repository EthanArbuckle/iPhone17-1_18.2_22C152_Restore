@interface AMSSQLiteConnectionOptions
+ (BOOL)supportsSecureCoding;
- (AMSSQLiteConnectionOptions)initWithCoder:(id)a3;
- (AMSSQLiteConnectionOptions)initWithDatabasePath:(id)a3;
- (BOOL)applyToDatabase:(sqlite3 *)a3 error:(id *)a4;
- (BOOL)isCheckpointingOnCloseDisabled;
- (BOOL)isReadOnly;
- (NSString)databasePath;
- (NSString)protectionType;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cacheSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheSize:(int64_t)a3;
- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3;
- (void)setCheckpointingOnCloseDisabled:(BOOL)a3;
- (void)setDatabasePath:(id)a3;
- (void)setProtectionType:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation AMSSQLiteConnectionOptions

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 24) = self->_cacheSize;
    uint64_t v7 = [(NSString *)self->_databasePath copyWithZone:a3];
    v8 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;

    uint64_t v9 = [(NSString *)self->_protectionType copyWithZone:a3];
    v10 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v9;

    *(unsigned char *)(v6 + 8) = self->_readOnly;
  }
  return (id)v6;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSString)protectionType
{
  return self->_protectionType;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)applyToDatabase:(sqlite3 *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA cache_size=%ld", -[AMSSQLiteConnectionOptions cacheSize](self, "cacheSize"));
  uint64_t v8 = sqlite3_exec(a3, (const char *)[v7 UTF8String], 0, 0, 0);
  if (v8)
  {
    uint64_t v9 = AMSSQLiteCreateError(-7703, @"Error Setting Cache Size", v8);
    v10 = v9;
    if (a4) {
      *a4 = v9;
    }
  }
  else if (self->_checkpointingOnCloseDisabled)
  {
    int v12 = sqlite3_db_config(a3, 1006, 1, 0);
    if (v12)
    {
      int v13 = v12;
      v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        int v17 = v13;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "Failed to disable checkpointing on close: %{public}d", buf, 8u);
      }
    }
  }

  return v8 == 0;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (AMSSQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteConnectionOptions;
  uint64_t v5 = [(AMSSQLiteConnectionOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    [(AMSSQLiteConnectionOptions *)v5 setCacheSizeWithNumberOfKilobytes:128];
  }

  return v5;
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (void)setCheckpointingOnCloseDisabled:(BOOL)a3
{
  self->_checkpointingOnCloseDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionType, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSSQLiteConnectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSQLiteConnectionOptions;
  uint64_t v5 = [(AMSSQLiteConnectionOptions *)&v13 init];
  if (v5)
  {
    v5->_cacheSize = [v4 decodeIntegerForKey:@"c"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    uint64_t v7 = [v6 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v7;

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pt"];
    uint64_t v10 = [v9 copy];
    protectionType = v5->_protectionType;
    v5->_protectionType = (NSString *)v10;

    v5->_readOnly = [v4 decodeBoolForKey:@"ro"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t cacheSize = self->_cacheSize;
  id v5 = a3;
  [v5 encodeInteger:cacheSize forKey:@"c"];
  [v5 encodeObject:self->_databasePath forKey:@"p"];
  [v5 encodeObject:self->_protectionType forKey:@"pt"];
  [v5 encodeBool:self->_readOnly forKey:@"ro"];
}

- (void)setDatabasePath:(id)a3
{
}

- (void)setProtectionType:(id)a3
{
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isCheckpointingOnCloseDisabled
{
  return self->_checkpointingOnCloseDisabled;
}

@end