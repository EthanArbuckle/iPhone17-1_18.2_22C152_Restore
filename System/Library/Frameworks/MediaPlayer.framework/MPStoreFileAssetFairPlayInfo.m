@interface MPStoreFileAssetFairPlayInfo
- (MPStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3;
- (MPStoreFileAssetFairPlayInfo)initWithiTunesCloudStoreFileAssetFairPlayInfo:(id)a3;
- (NSData)dpInfoData;
- (NSData)pinfData;
- (NSData)sinf2Data;
- (NSData)sinfData;
- (NSDictionary)purchaseBundleSinfDictionary;
- (NSDictionary)responseSinfDictionary;
- (int64_t)identifier;
@end

@implementation MPStoreFileAssetFairPlayInfo

- (void).cxx_destruct
{
}

- (NSDictionary)purchaseBundleSinfDictionary
{
  return (NSDictionary *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo purchaseBundleSinfDictionary];
}

- (NSData)sinf2Data
{
  return (NSData *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo sinf2Data];
}

- (NSData)sinfData
{
  return (NSData *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo sinfData];
}

- (NSData)pinfData
{
  return (NSData *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo pinfData];
}

- (NSData)dpInfoData
{
  return (NSData *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo dpInfoData];
}

- (int64_t)identifier
{
  return [(ICStoreFileAssetFairPlayInfo *)self->_internalInfo identifier];
}

- (NSDictionary)responseSinfDictionary
{
  return (NSDictionary *)[(ICStoreFileAssetFairPlayInfo *)self->_internalInfo responseSinfDictionary];
}

- (MPStoreFileAssetFairPlayInfo)initWithiTunesCloudStoreFileAssetFairPlayInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreFileAssetFairPlayInfo;
  v5 = [(MPStoreFileAssetFairPlayInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    internalInfo = v5->_internalInfo;
    v5->_internalInfo = (ICStoreFileAssetFairPlayInfo *)v6;
  }
  return v5;
}

- (MPStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB8740];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithResponseSinfDictionary:v5];

  v7 = [(MPStoreFileAssetFairPlayInfo *)self initWithiTunesCloudStoreFileAssetFairPlayInfo:v6];
  return v7;
}

@end