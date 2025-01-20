@interface IDSDecryptionMetadata
- (BOOL)usedCachedData;
- (BOOL)usedLastResortCache;
- (IDSDecryptionMetadata)init;
- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3;
- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3 usedLastResortCache:(BOOL)a4 usedCachedData:(BOOL)a5;
- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3 usedLastResortCache:(BOOL)a4 usedCachedData:(BOOL)a5 additionalDecryptionResult:(id)a6;
- (IDSDecryptionMetadata)initWithUsedLastResortCache:(BOOL)a3 usedCachedData:(BOOL)a4;
- (IDSDecryptionMetadata)initWithUsedLastResortCache:(BOOL)a3 usedCachedData:(BOOL)a4 additionalDecryptionResult:(id)a5;
- (NSDictionary)additionalDecryptionResult;
- (int64_t)encryptionType;
@end

@implementation IDSDecryptionMetadata

- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3 usedLastResortCache:(BOOL)a4 usedCachedData:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSDecryptionMetadata;
  result = [(IDSDecryptionMetadata *)&v9 init];
  if (result)
  {
    result->_usedLastResortCache = a4;
    result->_encryptionType = a3;
    result->_usedCachedData = a5;
  }
  return result;
}

- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3 usedLastResortCache:(BOOL)a4 usedCachedData:(BOOL)a5 additionalDecryptionResult:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IDSDecryptionMetadata;
  v12 = [(IDSDecryptionMetadata *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_usedLastResortCache = a4;
    v12->_encryptionType = a3;
    v12->_usedCachedData = a5;
    objc_storeStrong((id *)&v12->_additionalDecryptionResult, a6);
  }

  return v13;
}

- (IDSDecryptionMetadata)init
{
  return [(IDSDecryptionMetadata *)self initWithEncryptionType:-1 usedLastResortCache:0 usedCachedData:0];
}

- (IDSDecryptionMetadata)initWithEncryptionType:(int64_t)a3
{
  return [(IDSDecryptionMetadata *)self initWithEncryptionType:a3 usedLastResortCache:0 usedCachedData:0];
}

- (IDSDecryptionMetadata)initWithUsedLastResortCache:(BOOL)a3 usedCachedData:(BOOL)a4
{
  return [(IDSDecryptionMetadata *)self initWithEncryptionType:-1 usedLastResortCache:a3 usedCachedData:a4];
}

- (IDSDecryptionMetadata)initWithUsedLastResortCache:(BOOL)a3 usedCachedData:(BOOL)a4 additionalDecryptionResult:(id)a5
{
  return [(IDSDecryptionMetadata *)self initWithEncryptionType:-1 usedLastResortCache:a3 usedCachedData:a4 additionalDecryptionResult:a5];
}

- (int64_t)encryptionType
{
  return self->_encryptionType;
}

- (BOOL)usedLastResortCache
{
  return self->_usedLastResortCache;
}

- (BOOL)usedCachedData
{
  return self->_usedCachedData;
}

- (NSDictionary)additionalDecryptionResult
{
  return self->_additionalDecryptionResult;
}

- (void).cxx_destruct
{
}

@end