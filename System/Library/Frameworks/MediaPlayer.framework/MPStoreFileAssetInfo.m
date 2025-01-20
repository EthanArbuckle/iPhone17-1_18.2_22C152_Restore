@interface MPStoreFileAssetInfo
- (MPStoreFileAssetInfo)initWithiTunesCloudStoreFileAssetInfo:(id)a3;
- (NSArray)fairPlayInfoList;
- (NSData)md5;
- (NSString)downloadKey;
- (NSString)fileExtension;
- (NSURL)assetURL;
- (int64_t)flavorType;
- (int64_t)protectionType;
- (unint64_t)fileSize;
@end

@implementation MPStoreFileAssetInfo

- (void).cxx_destruct
{
}

- (int64_t)protectionType
{
  int64_t result = [(ICStoreFileAssetInfo *)self->_internalInfo protectionType];
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (NSData)md5
{
  return (NSData *)[(ICStoreFileAssetInfo *)self->_internalInfo md5];
}

- (unint64_t)fileSize
{
  return [(ICStoreFileAssetInfo *)self->_internalInfo fileSize];
}

- (NSString)fileExtension
{
  return (NSString *)[(ICStoreFileAssetInfo *)self->_internalInfo fileExtension];
}

- (int64_t)flavorType
{
  int64_t result = [(ICStoreFileAssetInfo *)self->_internalInfo flavorType];
  if (result > 200)
  {
    if (result != 203)
    {
      if (result == 201) {
        int64_t v3 = 201;
      }
      else {
        int64_t v3 = 0;
      }
      if (result != 202) {
        return v3;
      }
    }
  }
  else
  {
    switch(result)
    {
      case 'e':
      case 'f':
      case 'g':
      case 'h':
        return result;
      default:
        int64_t result = 0;
        break;
    }
  }
  return result;
}

- (NSArray)fairPlayInfoList
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(ICStoreFileAssetInfo *)self->_internalInfo fairPlayInfoList];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [[MPStoreFileAssetFairPlayInfo alloc] initWithiTunesCloudStoreFileAssetFairPlayInfo:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        if (v8)
        {
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSString)downloadKey
{
  return (NSString *)[(ICStoreFileAssetInfo *)self->_internalInfo downloadKey];
}

- (NSURL)assetURL
{
  return (NSURL *)[(ICStoreFileAssetInfo *)self->_internalInfo assetURL];
}

- (MPStoreFileAssetInfo)initWithiTunesCloudStoreFileAssetInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreFileAssetInfo;
  uint64_t v6 = [(MPStoreFileAssetInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalInfo, a3);
  }

  return v7;
}

@end