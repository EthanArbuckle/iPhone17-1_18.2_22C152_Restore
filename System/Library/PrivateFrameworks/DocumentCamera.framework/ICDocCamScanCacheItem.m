@interface ICDocCamScanCacheItem
- (ICDocCamImageCache)imageCache;
- (ICDocCamScanCacheItem)init;
- (ICDocCamScanCacheItem)initWithImageCache:(id)a3 docInfos:(id)a4;
- (NSArray)docInfos;
- (id)docInfoForScanDataDelegate:(id)a3;
- (id)imageForScanDataDelegateIdentifier:(id)a3;
- (void)deleteCacheImages;
- (void)doneBuildingCache;
- (void)setDocInfos:(id)a3;
- (void)setImageCache:(id)a3;
@end

@implementation ICDocCamScanCacheItem

- (ICDocCamScanCacheItem)init
{
  return 0;
}

- (ICDocCamScanCacheItem)initWithImageCache:(id)a3 docInfos:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamScanCacheItem;
  v9 = [(ICDocCamScanCacheItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageCache, a3);
    objc_storeStrong((id *)&v10->_docInfos, a4);
  }

  return v10;
}

- (id)docInfoForScanDataDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ICDocCamScanCacheItem *)self docInfos];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 scanDataDelegateIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)imageForScanDataDelegateIdentifier:(id)a3
{
  id v4 = [(ICDocCamScanCacheItem *)self docInfoForScanDataDelegate:a3];
  v5 = [v4 croppedAndFilteredImageUUID];
  if (v5)
  {
    id v6 = [(ICDocCamScanCacheItem *)self imageCache];
    uint64_t v7 = [v6 getImage:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)deleteCacheImages
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "ICDocCamScanCache deleteCacheImages", v1, 2u);
}

- (void)doneBuildingCache
{
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke(uint64_t a1)
{
  v2 = +[ICDocCamScanCache cachedItem];
  dispatch_time_t v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    id v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke_cold_1(v4);
    }

    +[ICDocCamScanCache setCachedItem:0];
  }
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (NSArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docInfos, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

void __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "ICDocCamScanCache doneBuildingCache", v1, 2u);
}

@end