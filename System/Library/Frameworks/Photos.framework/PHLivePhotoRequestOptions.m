@interface PHLivePhotoRequestOptions
- (BOOL)includeImage;
- (BOOL)isCurrentVersion;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently;
- (BOOL)liveRenderVideoIfNeeded;
- (BOOL)preferHDR;
- (PHAssetImageProgressHandler)progressHandler;
- (PHImageRequestOptionsDeliveryMode)deliveryMode;
- (PHImageRequestOptionsVersion)version;
- (PHLivePhotoRequestOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)renderResultHandlerQueue;
- (id)resultHandlerQueue;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setIncludeImage:(BOOL)a3;
- (void)setLiveRenderVideoIfNeeded:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed;
- (void)setPreferHDR:(BOOL)a3;
- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler;
- (void)setVersion:(PHImageRequestOptionsVersion)version;
@end

@implementation PHLivePhotoRequestOptions

- (id)renderResultHandlerQueue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently
{
  return 0;
}

- (BOOL)isCurrentVersion
{
  return [(PHLivePhotoRequestOptions *)self version] == PHImageRequestOptionsVersionCurrent;
}

- (void).cxx_destruct
{
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void)setIncludeImage:(BOOL)a3
{
  self->_includeImage = a3;
}

- (BOOL)includeImage
{
  return self->_includeImage;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler
{
}

- (PHAssetImageProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (PHImageRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setVersion:(PHImageRequestOptionsVersion)version
{
  self->_version = version;
}

- (PHImageRequestOptionsVersion)version
{
  return self->_version;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeliveryMode:", -[PHLivePhotoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHLivePhotoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  v5 = [(PHLivePhotoRequestOptions *)self progressHandler];
  [v4 setProgressHandler:v5];

  objc_msgSend(v4, "setDownloadIntent:", -[PHLivePhotoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHLivePhotoRequestOptions downloadPriority](self, "downloadPriority"));
  objc_msgSend(v4, "setIncludeImage:", -[PHLivePhotoRequestOptions includeImage](self, "includeImage"));
  objc_msgSend(v4, "setPreferHDR:", -[PHLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  return v4;
}

- (PHLivePhotoRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHLivePhotoRequestOptions;
  result = [(PHLivePhotoRequestOptions *)&v3 init];
  if (result) {
    result->_includeImage = 1;
  }
  return result;
}

- (id)resultHandlerQueue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (BOOL)isSynchronous
{
  return 0;
}

@end