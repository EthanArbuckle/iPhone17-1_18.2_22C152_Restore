@interface CLSAssetDownloadObserver
- (BOOL)isDownloaded;
- (CLSAbstractAsset)asset;
- (CLSAssetDownloadObserver)initWithAsset:(id)a3;
- (NSError)downloadError;
- (double)downloadProgress;
- (id)onDownloadComplete;
- (id)onDownloadProgress;
- (void)setAsset:(id)a3;
- (void)setDownloaded:(BOOL)a3;
- (void)setOnDownloadComplete:(id)a3;
- (void)setOnDownloadProgress:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation CLSAssetDownloadObserver

- (CLSAssetDownloadObserver)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSAssetDownloadObserver;
  v6 = [(CLSAssetDownloadObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_asset, a3);
  }

  return v7;
}

- (BOOL)isDownloaded
{
  v3 = objc_msgSend_asset(self, a2, v2);
  char isDownloaded = objc_msgSend_isDownloaded(v3, v4, v5);

  return isDownloaded;
}

- (double)downloadProgress
{
  v3 = objc_msgSend_asset(self, a2, v2);
  objc_msgSend_fractionDownloaded(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (NSError)downloadError
{
  v3 = objc_msgSend_asset(self, a2, v2);
  double v6 = objc_msgSend_downloadError(v3, v4, v5);

  return (NSError *)v6;
}

- (void)startObserving
{
  objc_msgSend_asset(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addDownloadObserver_(v5, v4, (uint64_t)self);
}

- (void)stopObserving
{
  objc_msgSend_asset(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeDownloadObserver_(v5, v4, (uint64_t)self);
}

- (CLSAbstractAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (id)onDownloadProgress
{
  return self->_onDownloadProgress;
}

- (void)setOnDownloadProgress:(id)a3
{
}

- (id)onDownloadComplete
{
  return self->_onDownloadComplete;
}

- (void)setOnDownloadComplete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDownloadComplete, 0);
  objc_storeStrong(&self->_onDownloadProgress, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->downloadError, 0);
}

@end