@interface _FBSCDHashCacheInfo
+ (_FBSCDHashCacheInfo)cacheInfoWithData:(id)a3 hashType:(unsigned int)a4;
- (NSData)cachedCodeDirectoryHash;
- (unsigned)cachedCodeDirectoryHashType;
@end

@implementation _FBSCDHashCacheInfo

+ (_FBSCDHashCacheInfo)cacheInfoWithData:(id)a3 hashType:(unsigned int)a4
{
  v5 = (NSData *)a3;
  v6 = objc_alloc_init(_FBSCDHashCacheInfo);
  cachedCodeDirectoryHash = v6->_cachedCodeDirectoryHash;
  v6->_cachedCodeDirectoryHash = v5;

  v6->_cachedCodeDirectoryHashType = a4;

  return v6;
}

- (NSData)cachedCodeDirectoryHash
{
  return self->_cachedCodeDirectoryHash;
}

- (unsigned)cachedCodeDirectoryHashType
{
  return self->_cachedCodeDirectoryHashType;
}

- (void).cxx_destruct
{
}

@end