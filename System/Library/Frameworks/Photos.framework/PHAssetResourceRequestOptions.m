@interface PHAssetResourceRequestOptions
- (BOOL)downloadIsTransient;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)pruneAfterAvailableOnLowDisk;
- (BOOL)resistentToPrune;
- (NSNumber)pruneAfterAvailableLowDiskThresholdBytes;
- (PHAssetResourceProgressHandler)progressHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadIsTransient:(BOOL)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed;
- (void)setProgressHandler:(PHAssetResourceProgressHandler)progressHandler;
- (void)setPruneAfterAvailableLowDiskThresholdBytes:(id)a3;
- (void)setPruneAfterAvailableOnLowDisk:(BOOL)a3;
- (void)setResistentToPrune:(BOOL)a3;
@end

@implementation PHAssetResourceRequestOptions

- (void).cxx_destruct
{
}

- (void)setPruneAfterAvailableLowDiskThresholdBytes:(id)a3
{
  self->_pruneAfterAvailableLowDiskThresholdBytes = (NSNumber *)a3;
}

- (NSNumber)pruneAfterAvailableLowDiskThresholdBytes
{
  return self->_pruneAfterAvailableLowDiskThresholdBytes;
}

- (void)setPruneAfterAvailableOnLowDisk:(BOOL)a3
{
  self->_pruneAfterAvailableOnLowDisk = a3;
}

- (BOOL)pruneAfterAvailableOnLowDisk
{
  return self->_pruneAfterAvailableOnLowDisk;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIsTransient:(BOOL)a3
{
  self->_downloadIsTransient = a3;
}

- (BOOL)downloadIsTransient
{
  return self->_downloadIsTransient;
}

- (void)setResistentToPrune:(BOOL)a3
{
  self->_resistentToPrune = a3;
}

- (BOOL)resistentToPrune
{
  return self->_resistentToPrune;
}

- (void)setProgressHandler:(PHAssetResourceProgressHandler)progressHandler
{
}

- (PHAssetResourceProgressHandler)progressHandler
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

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHAssetResourceRequestOptions);
  [(PHAssetResourceRequestOptions *)v4 setNetworkAccessAllowed:self->_networkAccessAllowed];
  [(PHAssetResourceRequestOptions *)v4 setProgressHandler:self->_progressHandler];
  [(PHAssetResourceRequestOptions *)v4 setResistentToPrune:self->_resistentToPrune];
  [(PHAssetResourceRequestOptions *)v4 setDownloadIsTransient:self->_downloadIsTransient];
  [(PHAssetResourceRequestOptions *)v4 setPruneAfterAvailableOnLowDisk:self->_pruneAfterAvailableOnLowDisk];
  [(PHAssetResourceRequestOptions *)v4 setPruneAfterAvailableLowDiskThresholdBytes:self->_pruneAfterAvailableLowDiskThresholdBytes];
  [(PHAssetResourceRequestOptions *)v4 setDownloadIntent:self->_downloadIntent];
  [(PHAssetResourceRequestOptions *)v4 setDownloadPriority:self->_downloadPriority];
  return v4;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
  if (a3 == 6) {
    self->_pruneAfterAvailableOnLowDisk = 1;
  }
}

@end