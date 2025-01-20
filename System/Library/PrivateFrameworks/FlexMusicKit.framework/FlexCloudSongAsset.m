@interface FlexCloudSongAsset
- (BOOL)contentUpdateAvailable;
- (BOOL)isCloudBacked;
- (FlexCloudManager)cloudManager;
- (FlexCloudSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 cloudManager:(id)a6 contentVersion:(int64_t)a7 compatibilityVersion:(int64_t)a8;
- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3;
- (int64_t)contentVersionForAssetLocation:(unint64_t)a3;
- (unint64_t)assetStatus;
- (void)cancelDownload;
- (void)purgeLocalCache;
- (void)requestDownload;
- (void)requestDownloadWithOptions:(id)a3;
@end

@implementation FlexCloudSongAsset

- (FlexCloudSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 cloudManager:(id)a6 contentVersion:(int64_t)a7 compatibilityVersion:(int64_t)a8
{
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FlexCloudSongAsset;
  v15 = [(FMSongAsset *)&v18 initWithAssetID:a3 assetStatus:a4 localURL:a5 contentVersion:a7 compatibilityVersion:a8];
  v16 = v15;
  if (v15) {
    objc_storeWeak((id *)&v15->_cloudManager, v14);
  }

  return v16;
}

- (BOOL)isCloudBacked
{
  return 1;
}

- (void)requestDownload
{
  id v6 = (id)objc_opt_new();
  objc_msgSend_requestDownloadWithOptions_(self, v3, (uint64_t)v6, v4, v5);
}

- (void)requestDownloadWithOptions:(id)a3
{
  id v15 = a3;
  if (objc_msgSend_assetStatus(self, v4, v5, v6, v7) == 1
    || objc_msgSend_assetStatus(self, v8, v9, v10, v11) == 4
    || objc_msgSend_contentUpdateAvailable(self, v8, v9, v10, v11))
  {
    v12 = objc_msgSend_cloudManager(self, v8, v9, v10, v11);
    objc_msgSend_requestDownloadOfAsset_withOptions_(v12, v13, (uint64_t)self, (uint64_t)v15, v14);
  }
}

- (void)cancelDownload
{
  if (objc_msgSend_assetStatus(self, a2, v2, v3, v4) == 2 || objc_msgSend_assetStatus(self, v6, v7, v8, v9) == 3)
  {
    objc_msgSend_cloudManager(self, v6, v7, v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelDownloadOfAsset_(v13, v10, (uint64_t)self, v11, v12);
  }
}

- (void)purgeLocalCache
{
  if (objc_msgSend_assetStatus(self, a2, v2, v3, v4) != 1 && objc_msgSend_assetStatus(self, v6, v7, v8, v9) != 4)
  {
    objc_msgSend_cloudManager(self, v10, v11, v12, v13);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPurgeOfAsset_(v17, v14, (uint64_t)self, v15, v16);
  }
}

- (unint64_t)assetStatus
{
  uint64_t v6 = objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  unint64_t v10 = objc_msgSend_assetStatus_(v6, v7, (uint64_t)self, v8, v9);

  return v10;
}

- (BOOL)contentUpdateAvailable
{
  return 0;
}

- (int64_t)contentVersionForAssetLocation:(unint64_t)a3
{
  if (a3 == 1) {
    return objc_msgSend_contentVersion(self, a2, 1, v3, v4);
  }
  else {
    return 0;
  }
}

- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3
{
  if (a3 == 1) {
    return objc_msgSend_compatibilityVersion(self, a2, 1, v3, v4);
  }
  else {
    return 0;
  }
}

- (FlexCloudManager)cloudManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudManager);
  return (FlexCloudManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end