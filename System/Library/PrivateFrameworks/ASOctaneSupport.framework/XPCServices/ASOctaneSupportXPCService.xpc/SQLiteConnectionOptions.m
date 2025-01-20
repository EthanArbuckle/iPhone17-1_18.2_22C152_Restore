@interface SQLiteConnectionOptions
+ (id)inMemoryDatabaseFlag;
+ (id)inMemoryDatabaseSharedCacheFlag;
- (BOOL)isInMemoryDatabase;
- (BOOL)isReadOnly;
- (NSString)databasePath;
- (NSString)encryptionKeyId;
- (NSString)protectionType;
- (SQLiteConnectionOptions)initWithDatabasePath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInMemoryDatabaseWithName:(id)a3;
- (int64_t)cacheSize;
- (void)setCacheSize:(int64_t)a3;
- (void)setCacheSizeWithNumberOfDatabasePages:(int64_t)a3;
- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3;
- (void)setEncryptionKeyId:(id)a3;
- (void)setProtectionType:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation SQLiteConnectionOptions

- (SQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteConnectionOptions;
  v5 = [(SQLiteConnectionOptions *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = v6;

    [(SQLiteConnectionOptions *)v5 setCacheSizeWithNumberOfKilobytes:64];
  }

  return v5;
}

- (id)initInMemoryDatabaseWithName:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteConnectionOptions inMemoryDatabaseFlag];
  v6 = +[SQLiteConnectionOptions inMemoryDatabaseSharedCacheFlag];
  v7 = +[NSString stringWithFormat:@"file:%@?%@&%@", v4, v5, v6];

  v8 = [(SQLiteConnectionOptions *)self initWithDatabasePath:v7];
  return v8;
}

- (void)setCacheSizeWithNumberOfDatabasePages:(int64_t)a3
{
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
}

- (BOOL)isInMemoryDatabase
{
  databasePath = self->_databasePath;
  v3 = +[SQLiteConnectionOptions inMemoryDatabaseFlag];
  LOBYTE(databasePath) = [(NSString *)databasePath containsString:v3];

  return (char)databasePath;
}

+ (id)inMemoryDatabaseFlag
{
  return @"mode=memory";
}

+ (id)inMemoryDatabaseSharedCacheFlag
{
  return @"cache=shared";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    v5[2] = self->_cacheSize;
    id v7 = [(NSString *)self->_databasePath copyWithZone:a3];
    v8 = (void *)v6[3];
    v6[3] = v7;

    id v9 = [(NSString *)self->_encryptionKeyId copyWithZone:a3];
    v10 = (void *)v6[4];
    v6[4] = v9;

    *((unsigned char *)v6 + 8) = self->_readOnly;
  }
  return v6;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (NSString)databasePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)encryptionKeyId
{
  return self->_encryptionKeyId;
}

- (void)setEncryptionKeyId:(id)a3
{
}

- (NSString)protectionType
{
  return self->_protectionType;
}

- (void)setProtectionType:(id)a3
{
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionType, 0);
  objc_storeStrong((id *)&self->_encryptionKeyId, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end