@interface ASUSQLiteConnectionOptions
- (ASUSQLiteConnectionOptions)initWithDatabasePath:(id)a3;
- (BOOL)isReadOnly;
- (NSString)databasePath;
- (NSString)encryptionKeyId;
- (NSString)protectionType;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cacheSize;
- (void)setCacheSize:(int64_t)a3;
- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3;
- (void)setEncryptionKeyId:(id)a3;
- (void)setProtectionType:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation ASUSQLiteConnectionOptions

- (ASUSQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteConnectionOptions;
  v5 = [(ASUSQLiteConnectionOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    [(ASUSQLiteConnectionOptions *)v5 setCacheSizeWithNumberOfKilobytes:64];
  }

  return v5;
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 16) = self->_cacheSize;
    uint64_t v7 = [(NSString *)self->_databasePath copyWithZone:a3];
    v8 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v7;

    uint64_t v9 = [(NSString *)self->_encryptionKeyId copyWithZone:a3];
    v10 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v9;

    *(unsigned char *)(v6 + 8) = self->_readOnly;
  }
  return (id)v6;
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