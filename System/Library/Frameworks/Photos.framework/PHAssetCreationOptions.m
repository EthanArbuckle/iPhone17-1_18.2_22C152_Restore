@interface PHAssetCreationOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillSourceTime;
- (BOOL)copyAsAlternateAsset;
- (BOOL)copyOriginal;
- (BOOL)copySinglePhotoFromBurst;
- (BOOL)copyStillPhotoFromLivePhoto;
- (BOOL)crashBeforeCreation;
- (BOOL)resetUserSpecificMetadata;
- (BOOL)shouldCreateScreenshot;
- (BOOL)shouldDownloadOrCloudReReferenceMissingResources;
- (BOOL)shouldUseAutomaticallyGeneratedOriginalFilename;
- (BOOL)useRecoverableStagingDirectory;
- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions;
- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions;
- (PHAssetCreationOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAdjustmentBakeInOptions:(id)a3;
- (void)setCopyAsAlternateAsset:(BOOL)a3;
- (void)setCopyOriginal:(BOOL)a3;
- (void)setCopySinglePhotoFromBurst:(BOOL)a3;
- (void)setCopyStillPhotoFromLivePhoto:(BOOL)a3;
- (void)setCrashBeforeCreation:(BOOL)a3;
- (void)setMetadataCopyOptions:(id)a3;
- (void)setResetUserSpecificMetadata:(BOOL)a3;
- (void)setShouldCreateScreenshot:(BOOL)a3;
- (void)setShouldDownloadOrCloudReReferenceMissingResources:(BOOL)a3;
- (void)setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3;
- (void)setStillSourceTime:(id *)a3;
- (void)setUseRecoverableStagingDirectory:(BOOL)a3;
@end

@implementation PHAssetCreationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCopyOptions, 0);

  objc_storeStrong((id *)&self->_adjustmentBakeInOptions, 0);
}

- (void)setCrashBeforeCreation:(BOOL)a3
{
  self->_crashBeforeCreation = a3;
}

- (BOOL)crashBeforeCreation
{
  return self->_crashBeforeCreation;
}

- (void)setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3
{
  self->_shouldUseAutomaticallyGeneratedOriginalFilename = a3;
}

- (BOOL)shouldUseAutomaticallyGeneratedOriginalFilename
{
  return self->_shouldUseAutomaticallyGeneratedOriginalFilename;
}

- (void)setShouldCreateScreenshot:(BOOL)a3
{
  self->_shouldCreateScreenshot = a3;
}

- (BOOL)shouldCreateScreenshot
{
  return self->_shouldCreateScreenshot;
}

- (void)setUseRecoverableStagingDirectory:(BOOL)a3
{
  self->_useRecoverableStagingDirectory = a3;
}

- (BOOL)useRecoverableStagingDirectory
{
  return self->_useRecoverableStagingDirectory;
}

- (void)setCopyAsAlternateAsset:(BOOL)a3
{
  self->_copyAsAlternateAsset = a3;
}

- (BOOL)copyAsAlternateAsset
{
  return self->_copyAsAlternateAsset;
}

- (void)setCopySinglePhotoFromBurst:(BOOL)a3
{
  self->_copySinglePhotoFromBurst = a3;
}

- (BOOL)copySinglePhotoFromBurst
{
  return self->_copySinglePhotoFromBurst;
}

- (void)setCopyOriginal:(BOOL)a3
{
  self->_copyOriginal = a3;
}

- (BOOL)copyOriginal
{
  return self->_copyOriginal;
}

- (void)setCopyStillPhotoFromLivePhoto:(BOOL)a3
{
  self->_copyStillPhotoFromLivePhoto = a3;
}

- (BOOL)copyStillPhotoFromLivePhoto
{
  return self->_copyStillPhotoFromLivePhoto;
}

- (void)setResetUserSpecificMetadata:(BOOL)a3
{
  self->_resetUserSpecificMetadata = a3;
}

- (BOOL)resetUserSpecificMetadata
{
  return self->_resetUserSpecificMetadata;
}

- (void)setStillSourceTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillSourceTime.epoch = a3->var3;
  *(_OWORD *)&self->_stillSourceTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setMetadataCopyOptions:(id)a3
{
}

- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions
{
  return self->_metadataCopyOptions;
}

- (void)setAdjustmentBakeInOptions:(id)a3
{
}

- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions
{
  return self->_adjustmentBakeInOptions;
}

- (void)setShouldDownloadOrCloudReReferenceMissingResources:(BOOL)a3
{
  self->_shouldDownloadOrCloudReReferenceMissingResources = a3;
}

- (BOOL)shouldDownloadOrCloudReReferenceMissingResources
{
  return self->_shouldDownloadOrCloudReReferenceMissingResources;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  objc_msgSend(v4, "setShouldDownloadOrCloudReReferenceMissingResources:", -[PHAssetCreationOptions shouldDownloadOrCloudReReferenceMissingResources](self, "shouldDownloadOrCloudReReferenceMissingResources"));
  v5 = [(PHAssetCreationOptions *)self adjustmentBakeInOptions];
  [v4 setAdjustmentBakeInOptions:v5];

  v6 = [(PHAssetCreationOptions *)self metadataCopyOptions];
  [v4 setMetadataCopyOptions:v6];

  [(PHAssetCreationOptions *)self stillSourceTime];
  long long v8 = v10;
  uint64_t v9 = v11;
  [v4 setStillSourceTime:&v8];
  objc_msgSend(v4, "setResetUserSpecificMetadata:", -[PHAssetCreationOptions resetUserSpecificMetadata](self, "resetUserSpecificMetadata"));
  objc_msgSend(v4, "setCopyStillPhotoFromLivePhoto:", -[PHAssetCreationOptions copyStillPhotoFromLivePhoto](self, "copyStillPhotoFromLivePhoto"));
  objc_msgSend(v4, "setCopyOriginal:", -[PHAssetCreationOptions copyOriginal](self, "copyOriginal"));
  objc_msgSend(v4, "setCopySinglePhotoFromBurst:", -[PHAssetCreationOptions copySinglePhotoFromBurst](self, "copySinglePhotoFromBurst"));
  objc_msgSend(v4, "setCopyAsAlternateAsset:", -[PHAssetCreationOptions copyAsAlternateAsset](self, "copyAsAlternateAsset"));
  objc_msgSend(v4, "setUseRecoverableStagingDirectory:", -[PHAssetCreationOptions useRecoverableStagingDirectory](self, "useRecoverableStagingDirectory"));
  objc_msgSend(v4, "setShouldCreateScreenshot:", -[PHAssetCreationOptions shouldCreateScreenshot](self, "shouldCreateScreenshot"));
  objc_msgSend(v4, "setShouldUseAutomaticallyGeneratedOriginalFilename:", -[PHAssetCreationOptions shouldUseAutomaticallyGeneratedOriginalFilename](self, "shouldUseAutomaticallyGeneratedOriginalFilename"));
  return v4;
}

- (PHAssetCreationOptions)init
{
  v4.receiver = self;
  v4.super_class = (Class)PHAssetCreationOptions;
  result = [(PHAssetCreationOptions *)&v4 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_stillSourceTime.value = *MEMORY[0x1E4F1F9F8];
    result->_stillSourceTime.epoch = *(void *)(v3 + 16);
  }
  return result;
}

@end