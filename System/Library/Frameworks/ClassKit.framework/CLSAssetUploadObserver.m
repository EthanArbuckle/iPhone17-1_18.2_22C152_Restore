@interface CLSAssetUploadObserver
- (BOOL)isUploaded;
- (CLSAsset)asset;
- (CLSAssetUploadObserver)initWithAsset:(id)a3;
- (NSError)uploadError;
- (double)uploadProgress;
- (id)onUploadComplete;
- (id)onUploadProgress;
- (void)setAsset:(id)a3;
- (void)setOnUploadComplete:(id)a3;
- (void)setOnUploadProgress:(id)a3;
- (void)setUploaded:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation CLSAssetUploadObserver

- (CLSAssetUploadObserver)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSAssetUploadObserver;
  v6 = [(CLSAssetUploadObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_asset, a3);
  }

  return v7;
}

- (BOOL)isUploaded
{
  v3 = objc_msgSend_asset(self, a2, v2);
  char isUploaded = objc_msgSend_isUploaded(v3, v4, v5);

  return isUploaded;
}

- (double)uploadProgress
{
  v3 = objc_msgSend_asset(self, a2, v2);
  objc_msgSend_fractionUploaded(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (NSError)uploadError
{
  v3 = objc_msgSend_asset(self, a2, v2);
  double v6 = objc_msgSend_uploadError(v3, v4, v5);

  return (NSError *)v6;
}

- (void)startObserving
{
  objc_msgSend_asset(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUploadObserver_(v5, v4, (uint64_t)self);
}

- (void)stopObserving
{
  objc_msgSend_asset(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeUploadObserver_(v5, v4, (uint64_t)self);
}

- (CLSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (id)onUploadProgress
{
  return self->_onUploadProgress;
}

- (void)setOnUploadProgress:(id)a3
{
}

- (id)onUploadComplete
{
  return self->_onUploadComplete;
}

- (void)setOnUploadComplete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onUploadComplete, 0);
  objc_storeStrong(&self->_onUploadProgress, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->uploadError, 0);
}

@end