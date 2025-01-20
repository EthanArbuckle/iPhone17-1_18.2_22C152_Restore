@interface PHContentEditingInputRequestOptions
- (BOOL)disallowFallbackAdjustmentBase;
- (BOOL)dontAllowRAW;
- (BOOL)forcePrepareCurrentBaseVersionInAddition;
- (BOOL)forceReturnFullLivePhoto;
- (BOOL)forceRunAsUnadjustedAsset;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)loadResourcesToFlip;
- (BOOL)requireOriginalsDownloaded;
- (BOOL)shouldForceOriginalChoice;
- (BOOL)skipDisplaySizeImage;
- (BOOL)skipLivePhotoImageAndAVAsset;
- (CGSize)targetSize;
- (OS_dispatch_queue)resultHandlerQueue;
- (id)canHandleRAW;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contentMode;
- (int64_t)downloadIntent;
- (unint64_t)originalChoice;
- (void)canHandleAdjustmentData;
- (void)progressHandler;
- (void)setCanHandleAdjustmentData:(void *)canHandleAdjustmentData;
- (void)setCanHandleRAW:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDisallowFallbackAdjustmentBase:(BOOL)a3;
- (void)setDontAllowRAW:(BOOL)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setForcePrepareCurrentBaseVersionInAddition:(BOOL)a3;
- (void)setForceReturnFullLivePhoto:(BOOL)a3;
- (void)setForceRunAsUnadjustedAsset:(BOOL)a3;
- (void)setLoadResourcesToFlip:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed;
- (void)setOriginalChoice:(unint64_t)a3;
- (void)setProgressHandler:(void *)progressHandler;
- (void)setRequireOriginalsDownloaded:(BOOL)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setShouldForceOriginalChoice:(BOOL)a3;
- (void)setSkipDisplaySizeImage:(BOOL)a3;
- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
@end

@implementation PHContentEditingInputRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_canHandleRAW, 0);
  objc_storeStrong(&self->_progressHandler, 0);

  objc_storeStrong(&self->_canHandleAdjustmentData, 0);
}

- (void)setRequireOriginalsDownloaded:(BOOL)a3
{
  self->_requireOriginalsDownloaded = a3;
}

- (BOOL)requireOriginalsDownloaded
{
  return self->_requireOriginalsDownloaded;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3
{
  self->_skipLivePhotoImageAndAVAsset = a3;
}

- (BOOL)skipLivePhotoImageAndAVAsset
{
  return self->_skipLivePhotoImageAndAVAsset;
}

- (void)setSkipDisplaySizeImage:(BOOL)a3
{
  self->_skipDisplaySizeImage = a3;
}

- (BOOL)skipDisplaySizeImage
{
  return self->_skipDisplaySizeImage;
}

- (void)setLoadResourcesToFlip:(BOOL)a3
{
  self->_loadResourcesToFlip = a3;
}

- (BOOL)loadResourcesToFlip
{
  return self->_loadResourcesToFlip;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setForcePrepareCurrentBaseVersionInAddition:(BOOL)a3
{
  self->_forcePrepareCurrentBaseVersionInAddition = a3;
}

- (BOOL)forcePrepareCurrentBaseVersionInAddition
{
  return self->_forcePrepareCurrentBaseVersionInAddition;
}

- (void)setForceReturnFullLivePhoto:(BOOL)a3
{
  self->_forceReturnFullLivePhoto = a3;
}

- (BOOL)forceReturnFullLivePhoto
{
  return self->_forceReturnFullLivePhoto;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (unint64_t)originalChoice
{
  return self->_originalChoice;
}

- (void)setCanHandleRAW:(id)a3
{
}

- (id)canHandleRAW
{
  return self->_canHandleRAW;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDisallowFallbackAdjustmentBase:(BOOL)a3
{
  self->_disallowFallbackAdjustmentBase = a3;
}

- (BOOL)disallowFallbackAdjustmentBase
{
  return self->_disallowFallbackAdjustmentBase;
}

- (void)setShouldForceOriginalChoice:(BOOL)a3
{
  self->_shouldForceOriginalChoice = a3;
}

- (BOOL)shouldForceOriginalChoice
{
  return self->_shouldForceOriginalChoice;
}

- (void)setProgressHandler:(void *)progressHandler
{
}

- (void)progressHandler
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

- (void)setCanHandleAdjustmentData:(void *)canHandleAdjustmentData
{
}

- (void)canHandleAdjustmentData
{
  return self->_canHandleAdjustmentData;
}

- (void)setOriginalChoice:(unint64_t)a3
{
  self->_forceRunAsUnadjustedAsset = 1;
  self->_shouldForceOriginalChoice = 1;
  self->_originalChoice = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(PHContentEditingInputRequestOptions *)self canHandleAdjustmentData];
  [v4 setCanHandleAdjustmentData:v5];

  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHContentEditingInputRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  v6 = [(PHContentEditingInputRequestOptions *)self progressHandler];
  [v4 setProgressHandler:v6];

  [(PHContentEditingInputRequestOptions *)self targetSize];
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setContentMode:", -[PHContentEditingInputRequestOptions contentMode](self, "contentMode"));
  objc_msgSend(v4, "setDontAllowRAW:", -[PHContentEditingInputRequestOptions dontAllowRAW](self, "dontAllowRAW"));
  v7 = [(PHContentEditingInputRequestOptions *)self canHandleRAW];
  [v4 setCanHandleRAW:v7];

  objc_msgSend(v4, "setOriginalChoice:", -[PHContentEditingInputRequestOptions originalChoice](self, "originalChoice"));
  objc_msgSend(v4, "setForceRunAsUnadjustedAsset:", -[PHContentEditingInputRequestOptions forceRunAsUnadjustedAsset](self, "forceRunAsUnadjustedAsset"));
  objc_msgSend(v4, "setForceReturnFullLivePhoto:", -[PHContentEditingInputRequestOptions forceReturnFullLivePhoto](self, "forceReturnFullLivePhoto"));
  objc_msgSend(v4, "setForcePrepareCurrentBaseVersionInAddition:", -[PHContentEditingInputRequestOptions forcePrepareCurrentBaseVersionInAddition](self, "forcePrepareCurrentBaseVersionInAddition"));
  v8 = [(PHContentEditingInputRequestOptions *)self resultHandlerQueue];
  [v4 setResultHandlerQueue:v8];

  objc_msgSend(v4, "setShouldForceOriginalChoice:", -[PHContentEditingInputRequestOptions shouldForceOriginalChoice](self, "shouldForceOriginalChoice"));
  objc_msgSend(v4, "setDisallowFallbackAdjustmentBase:", -[PHContentEditingInputRequestOptions disallowFallbackAdjustmentBase](self, "disallowFallbackAdjustmentBase"));
  objc_msgSend(v4, "setSkipDisplaySizeImage:", -[PHContentEditingInputRequestOptions skipDisplaySizeImage](self, "skipDisplaySizeImage"));
  objc_msgSend(v4, "setSkipLivePhotoImageAndAVAsset:", -[PHContentEditingInputRequestOptions skipLivePhotoImageAndAVAsset](self, "skipLivePhotoImageAndAVAsset"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHContentEditingInputRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setRequireOriginalsDownloaded:", -[PHContentEditingInputRequestOptions requireOriginalsDownloaded](self, "requireOriginalsDownloaded"));
  return v4;
}

- (BOOL)isSynchronous
{
  return 0;
}

@end