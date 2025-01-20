@interface FMSongAsset
- (BOOL)contentUpdateAvailable;
- (BOOL)isCloudBacked;
- (BOOL)localURLExists;
- (BOOL)updateDownloadProgress:(double)a3;
- (FMSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 contentVersion:(int64_t)a6 compatibilityVersion:(int64_t)a7;
- (FMSongAsset)initWithURL:(id)a3 assetID:(id)a4 contentVersion:(int64_t)a5 compatibilityVersion:(int64_t)a6;
- (NSString)assetID;
- (NSString)songUID;
- (NSURL)localURL;
- (double)downloadProgress;
- (int64_t)compatibilityVersion;
- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3;
- (int64_t)contentVersion;
- (int64_t)contentVersionForAssetLocation:(unint64_t)a3;
- (unint64_t)assetStatus;
- (void)setSongUID:(id)a3;
@end

@implementation FMSongAsset

- (FMSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 contentVersion:(int64_t)a6 compatibilityVersion:(int64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FMSongAsset;
  v15 = [(FMSongAsset *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetID, a3);
    v16->_assetStatus = a4;
    objc_storeStrong((id *)&v16->_localURL, a5);
    v16->_downloadProgress = 0.0;
    v16->_contentVersion = a6;
    v16->_compatibilityVersion = a7;
  }

  return v16;
}

- (FMSongAsset)initWithURL:(id)a3 assetID:(id)a4 contentVersion:(int64_t)a5 compatibilityVersion:(int64_t)a6
{
  return (FMSongAsset *)objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(self, a2, (uint64_t)a4, 0, (uint64_t)a3, a5, a6);
}

- (BOOL)isCloudBacked
{
  return 0;
}

- (BOOL)localURLExists
{
  v6 = objc_msgSend_localURL(self, a2, v2, v3, v4);

  if (!v6) {
    return 0;
  }
  v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9, v10);
  v16 = objc_msgSend_localURL(self, v12, v13, v14, v15);
  v21 = objc_msgSend_path(v16, v17, v18, v19, v20);
  char v25 = objc_msgSend_fileExistsAtPath_(v11, v22, (uint64_t)v21, v23, v24);

  return v25;
}

- (BOOL)updateDownloadProgress:(double)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  double downloadProgress = v4->_downloadProgress;
  if (downloadProgress != a3) {
    v4->_double downloadProgress = a3;
  }
  BOOL v6 = downloadProgress != a3;
  objc_sync_exit(v4);

  return v6;
}

- (double)downloadProgress
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double downloadProgress = v2->_downloadProgress;
  objc_sync_exit(v2);

  return downloadProgress;
}

- (BOOL)contentUpdateAvailable
{
  return 0;
}

- (int64_t)contentVersionForAssetLocation:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return objc_msgSend_contentVersion(self, a2, 0, v3, v4);
  }
}

- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return objc_msgSend_compatibilityVersion(self, a2, 0, v3, v4);
  }
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)songUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSongUID:(id)a3
{
}

- (unint64_t)assetStatus
{
  return self->_assetStatus;
}

- (NSURL)localURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_songUID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end