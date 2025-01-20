@interface AVCaptureResolvedPhotoSettings
+ (id)resolvedSettingsWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)spatialOverCapturePhotoDimensions;
- (BOOL)isAdjustedPhotoFilterRenderingEnabled;
- (BOOL)isCaptureBeforeResolvingSettingsEnabled;
- (BOOL)isContentAwareDistortionCorrectionEnabled;
- (BOOL)isDualCameraFusionEnabled;
- (BOOL)isEV0PhotoDeliveryEnabled;
- (BOOL)isFastCapturePrioritizationEnabled;
- (BOOL)isFlashEnabled;
- (BOOL)isHDREnabled;
- (BOOL)isRedEyeReductionEnabled;
- (BOOL)isSpatialPhotoCaptureEnabled;
- (BOOL)isSquareCropEnabled;
- (BOOL)isStillImageStabilizationEnabled;
- (BOOL)isTurboModeEnabled;
- (BOOL)isVirtualDeviceFusionEnabled;
- (BOOL)livePhotoMovieEnabled;
- (CMTimeRange)photoProcessingTimeRange;
- (CMVideoDimensions)deferredPhotoProxyDimensions;
- (CMVideoDimensions)dimensionsForSemanticSegmentationMatteOfType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType;
- (CMVideoDimensions)embeddedThumbnailDimensions;
- (CMVideoDimensions)livePhotoMovieDimensions;
- (CMVideoDimensions)photoDimensions;
- (CMVideoDimensions)portraitEffectsMatteDimensions;
- (CMVideoDimensions)previewDimensions;
- (CMVideoDimensions)rawEmbeddedThumbnailDimensions;
- (CMVideoDimensions)rawPhotoDimensions;
- (NSUInteger)expectedPhotoCount;
- (id)_initWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33;
- (id)debugDescription;
- (id)description;
- (id)digitalFlashUserInterfaceRGBEstimate;
- (id)photoManifest;
- (int64_t)uniqueID;
- (unint64_t)digitalFlashUserInterfaceHints;
- (void)dealloc;
@end

@implementation AVCaptureResolvedPhotoSettings

+ (void)initialize
{
}

+ (id)resolvedSettingsWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33
{
  id v33 = objc_alloc((Class)objc_opt_class());
  long long v34 = *(_OWORD *)&a27->var0.var3;
  v47[0] = *(_OWORD *)&a27->var0.var0;
  v47[1] = v34;
  v47[2] = *(_OWORD *)&a27->var1.var1;
  LOBYTE(v40) = a33;
  LOWORD(v39) = __PAIR16__(a29, a28);
  LOBYTE(v38) = a25;
  HIBYTE(v37) = a24;
  BYTE6(v37) = a23;
  WORD2(v37) = __PAIR16__(a22, a21);
  WORD1(v37) = __PAIR16__(a20, a19);
  LOWORD(v37) = __PAIR16__(a18, a17);
  LOBYTE(v36) = a9;
  return objc_autorelease((id)objc_msgSend(v33, "_initWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", a3, a4, a5, a6, a7, a8, v36, a10, a11,
                                a12,
                                a13,
                                a14,
                                a15,
                                a16,
                                v37,
                                v38,
                                a26,
                                v47,
                                v39,
                                a30,
                                a31,
                                a32,
                                v40));
}

- (id)_initWithUniqueID:(int64_t)a3 photoDimensions:(id)a4 rawPhotoDimensions:(id)a5 previewDimensions:(id)a6 embeddedThumbnailDimensions:(id)a7 rawEmbeddedThumbnailDimensions:(id)a8 livePhotoMovieEnabled:(BOOL)a9 livePhotoMovieDimensions:(id)a10 portraitEffectsMatteDimensions:(id)a11 hairSegmentationMatteDimensions:(id)a12 skinSegmentationMatteDimensions:(id)a13 teethSegmentationMatteDimensions:(id)a14 glassesSegmentationMatteDimensions:(id)a15 spatialOverCapturePhotoDimensions:(id)a16 turboModeEnabled:(BOOL)a17 flashEnabled:(BOOL)a18 redEyeReductionEnabled:(BOOL)a19 HDREnabled:(BOOL)a20 adjustedPhotoFiltersEnabled:(BOOL)a21 EV0PhotoDeliveryEnabled:(BOOL)a22 stillImageStabilizationEnabled:(BOOL)a23 virtualDeviceFusionEnabled:(BOOL)a24 squareCropEnabled:(BOOL)a25 deferredPhotoProxyDimensions:(id)a26 photoProcessingTimeRange:(id *)a27 contentAwareDistortionCorrectionEnabled:(BOOL)a28 spatialPhotoCaptureEnabled:(BOOL)a29 photoManifest:(id)a30 digitalFlashUserInterfaceHints:(unint64_t)a31 digitalFlashUserInterfaceRGBEstimate:(id)a32 captureBeforeResolvingSettingsEnabled:(BOOL)a33
{
  v45.receiver = self;
  v45.super_class = (Class)AVCaptureResolvedPhotoSettings;
  uint64_t v39 = [(AVCaptureResolvedPhotoSettings *)&v45 init];
  if (v39)
  {
    uint64_t v40 = objc_alloc_init(AVCaptureResolvedPhotoSettingsInternal);
    v39->_internal = v40;
    if (v40)
    {
      v40->uniqueID = a3;
      v39->_internal->photoDimensions = ($470D365275581EF16070F5A11344F73E)a4;
      v39->_internal->rawPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a5;
      v39->_internal->previewDimensions = ($470D365275581EF16070F5A11344F73E)a6;
      v39->_internal->embeddedThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a7;
      v39->_internal->rawEmbeddedThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a8;
      v39->_internal->livePhotoMovieEnabled = a9;
      v39->_internal->livePhotoMovieDimensions = ($470D365275581EF16070F5A11344F73E)a10;
      v39->_internal->portraitEffectsMatteDimensions = ($470D365275581EF16070F5A11344F73E)a11;
      v39->_internal->hairSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a12;
      v39->_internal->skinSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a13;
      v39->_internal->teethSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a14;
      v39->_internal->glassesSegmentationMatteDimensions = ($470D365275581EF16070F5A11344F73E)a15;
      v39->_internal->spatialOverCapturePhotoDimensions = ($470D365275581EF16070F5A11344F73E)a16;
      v39->_internal->turboModeEnabled = a17;
      v39->_internal->flashEnabled = a18;
      v39->_internal->redEyeReductionEnabled = a19;
      v39->_internal->HDREnabled = a20;
      v39->_internal->adjustedPhotoFiltersEnabled = a21;
      v39->_internal->EV0PhotoDeliveryEnabled = a22;
      v39->_internal->stillImageStabilizationEnabled = a23;
      v39->_internal->virtualDeviceFusionEnabled = a24;
      v39->_internal->squareCropEnabled = a25;
      v39->_internal->deferredPhotoProxyDimensions = ($470D365275581EF16070F5A11344F73E)a26;
      long long v41 = *(_OWORD *)&a27->var0.var0;
      long long v42 = *(_OWORD *)&a27->var0.var3;
      internal = v39->_internal;
      *(_OWORD *)&internal->photoProcessingTimeRange.duration.timescale = *(_OWORD *)&a27->var1.var1;
      *(_OWORD *)&internal->photoProcessingTimeRange.start.epoch = v42;
      *(_OWORD *)&internal->photoProcessingTimeRange.start.value = v41;
      v39->_internal->contentAwareDistortionCorrectionEnabled = a28;
      v39->_internal->spatialPhotoCaptureEnabled = a29;
      v39->_internal->photoManifest = (NSArray *)[a30 copy];
      v39->_internal->digitalFlashUserInterfaceHints = a31;
      v39->_internal->digitalFlashUserInterfaceRGBEstimate = (NSArray *)[a32 copy];
      v39->_internal->captureBeforeResolvingSettingsEnabled = a33;
    }
  }
  return v39;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal) {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureResolvedPhotoSettings;
  [(AVCaptureResolvedPhotoSettings *)&v4 dealloc];
}

- (id)debugDescription
{
  internal = self->_internal;
  objc_super v4 = &stru_1EF4D21D0;
  if (internal->flashEnabled) {
    v5 = @" flash:ON";
  }
  else {
    v5 = &stru_1EF4D21D0;
  }
  v53 = v5;
  if (internal->redEyeReductionEnabled) {
    v6 = @" red-eye reduction:ON";
  }
  else {
    v6 = &stru_1EF4D21D0;
  }
  if (internal->HDREnabled) {
    v7 = @" HDR:ON";
  }
  else {
    v7 = &stru_1EF4D21D0;
  }
  if (internal->adjustedPhotoFiltersEnabled) {
    v8 = @" filters:ON";
  }
  else {
    v8 = &stru_1EF4D21D0;
  }
  if (internal->EV0PhotoDeliveryEnabled) {
    v9 = @" (EV0:ON)";
  }
  else {
    v9 = &stru_1EF4D21D0;
  }
  if (internal->stillImageStabilizationEnabled) {
    v10 = @" SIS:ON";
  }
  else {
    v10 = &stru_1EF4D21D0;
  }
  if (internal->virtualDeviceFusionEnabled) {
    v11 = @" virtualdevice-fusion:ON";
  }
  else {
    v11 = &stru_1EF4D21D0;
  }
  if (internal->squareCropEnabled) {
    v12 = @" square:ON";
  }
  else {
    v12 = &stru_1EF4D21D0;
  }
  unint64_t v13 = [(NSArray *)internal->photoManifest count];
  unint64_t v14 = 0x1E4F29000;
  v15 = &stru_1EF4D21D0;
  if (v13 >= 2)
  {
    v16 = NSString;
    NSUInteger v46 = [(NSArray *)self->_internal->photoManifest count];
    v17 = v16;
    unint64_t v14 = 0x1E4F29000uLL;
    v15 = (__CFString *)objc_msgSend(v17, "stringWithFormat:", @" expected photos:%d", v46);
  }
  uint64_t v18 = [*(id *)(v14 + 24) stringWithFormat:@" photo:{%dx%d%@%@%@%@%@%@%@%@%@%@}", self->_internal->photoDimensions.width, self->_internal->photoDimensions.height, v53, v6, &stru_1EF4D21D0, v7, v8, v9, v10, v11, v12, v15];
  v19 = self->_internal;
  if (v19->rawPhotoDimensions.width >= 1)
  {
    uint64_t height = v19->rawPhotoDimensions.height;
    if ((int)height >= 1)
    {
      objc_super v4 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" raw:{%dx%d}", v19->rawPhotoDimensions.width, height);
      v19 = self->_internal;
    }
  }
  uint64_t width = v19->previewDimensions.width;
  if ((int)width < 1 || (uint64_t v22 = v19->previewDimensions.height, (int)v22 < 1)) {
    v52 = &stru_1EF4D21D0;
  }
  else {
    v52 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" prev:{%dx%d}", width, v22);
  }
  CMVideoDimensions v23 = [(AVCaptureResolvedPhotoSettings *)self embeddedThumbnailDimensions];
  v24 = &stru_1EF4D21D0;
  if (v23.width >= 1 && v23.height >= 1) {
    v24 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" thumb:{%dx%d}", v23, HIDWORD(*(unint64_t *)&v23));
  }
  CMVideoDimensions v25 = [(AVCaptureResolvedPhotoSettings *)self rawEmbeddedThumbnailDimensions];
  v26 = &stru_1EF4D21D0;
  if (v25.width >= 1 && v25.height >= 1) {
    v26 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" raw-thumb:{%dx%d}", v25, HIDWORD(*(unint64_t *)&v25));
  }
  v27 = self->_internal;
  v54 = v26;
  if (v27->livePhotoMovieEnabled)
  {
    v51 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" mov:{%dx%d}", v27->livePhotoMovieDimensions.width, v27->livePhotoMovieDimensions.height);
    v27 = self->_internal;
  }
  else
  {
    v51 = &stru_1EF4D21D0;
  }
  uint64_t v28 = v27->portraitEffectsMatteDimensions.width;
  if ((int)v28 < 1)
  {
    v50 = &stru_1EF4D21D0;
  }
  else
  {
    v50 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" portrait-matte:{%dx%d}", v28, v27->portraitEffectsMatteDimensions.height);
    v27 = self->_internal;
  }
  uint64_t v29 = v27->hairSegmentationMatteDimensions.width;
  if ((int)v29 < 1)
  {
    v49 = &stru_1EF4D21D0;
  }
  else
  {
    v49 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" hair-matte:{%dx%d}", v29, v27->hairSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  uint64_t v30 = v27->skinSegmentationMatteDimensions.width;
  if ((int)v30 < 1)
  {
    v48 = &stru_1EF4D21D0;
  }
  else
  {
    v48 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" skin-matte:{%dx%d}", v30, v27->skinSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  uint64_t v31 = v27->teethSegmentationMatteDimensions.width;
  unint64_t v32 = v14;
  if ((int)v31 < 1)
  {
    v47 = &stru_1EF4D21D0;
  }
  else
  {
    v47 = (__CFString *)objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @" teeth-matte:{%dx%d}", v31, v27->teethSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  uint64_t v33 = v27->glassesSegmentationMatteDimensions.width;
  long long v34 = v24;
  if ((int)v33 < 1)
  {
    v35 = &stru_1EF4D21D0;
  }
  else
  {
    v35 = (__CFString *)objc_msgSend(*(id *)(v32 + 24), "stringWithFormat:", @" glasses-matte:{%dx%d}", v33, v27->glassesSegmentationMatteDimensions.height);
    v27 = self->_internal;
  }
  BOOL contentAwareDistortionCorrectionEnabled = v27->contentAwareDistortionCorrectionEnabled;
  BOOL spatialPhotoCaptureEnabled = v27->spatialPhotoCaptureEnabled;
  uint64_t v38 = v27->spatialOverCapturePhotoDimensions.width;
  uint64_t v39 = &stru_1EF4D21D0;
  if ((int)v38 < 1)
  {
    uint64_t v40 = &stru_1EF4D21D0;
  }
  else
  {
    uint64_t v40 = (__CFString *)objc_msgSend(*(id *)(v32 + 24), "stringWithFormat:", @" spatial-overcapture:{%dx%d}", v38, v27->spatialOverCapturePhotoDimensions.height);
    v27 = self->_internal;
  }
  if (spatialPhotoCaptureEnabled) {
    long long v41 = @" spatial-photo:1";
  }
  else {
    long long v41 = &stru_1EF4D21D0;
  }
  if (contentAwareDistortionCorrectionEnabled) {
    uint64_t v39 = @" distortion-correction:1";
  }
  long long v42 = *(void **)(v32 + 24);
  CMTime time = (CMTime)v27->photoProcessingTimeRange.start;
  Float64 Seconds = CMTimeGetSeconds(&time);
  v44 = self->_internal;
  CMTime time = (CMTime)v44->photoProcessingTimeRange.start;
  CMTime rhs = (CMTime)v44->photoProcessingTimeRange.duration;
  CMTimeAdd(&v56, &time, &rhs);
  return (id)objc_msgSend(*(id *)(v32 + 24), "stringWithFormat:", @"uid:%lld %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", self->_internal->uniqueID, v18, v4, v52, v34, v54, v51, v50, v49, v48, v47, v35, v39, v41, v40, objc_msgSend(
                 v42,
                 "stringWithFormat:",
                 @" time:%.3f-%.3f",
                 *(void *)&Seconds,
                 CMTimeGetSeconds(&v56)));
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureResolvedPhotoSettings debugDescription](self, "debugDescription")];
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (CMVideoDimensions)photoDimensions
{
  return (CMVideoDimensions)self->_internal->photoDimensions;
}

- (CMVideoDimensions)previewDimensions
{
  return (CMVideoDimensions)self->_internal->previewDimensions;
}

- (CMVideoDimensions)embeddedThumbnailDimensions
{
  char BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat");
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0
    || internal->embeddedThumbnailDimensions.width
    || (p_embeddedThumbnailDimensions = (CMVideoDimensions *)&internal->rawEmbeddedThumbnailDimensions,
        !internal->rawEmbeddedThumbnailDimensions.width))
  {
    p_embeddedThumbnailDimensions = (CMVideoDimensions *)&internal->embeddedThumbnailDimensions;
  }
  return *p_embeddedThumbnailDimensions;
}

- (CMVideoDimensions)rawEmbeddedThumbnailDimensions
{
  return (CMVideoDimensions)self->_internal->rawEmbeddedThumbnailDimensions;
}

- (CMVideoDimensions)rawPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->rawPhotoDimensions;
}

- (CMVideoDimensions)livePhotoMovieDimensions
{
  return (CMVideoDimensions)self->_internal->livePhotoMovieDimensions;
}

- (CMVideoDimensions)portraitEffectsMatteDimensions
{
  return (CMVideoDimensions)self->_internal->portraitEffectsMatteDimensions;
}

- (CMVideoDimensions)dimensionsForSemanticSegmentationMatteOfType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType
{
  if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeHair"])
  {
    internal = self->_internal;
    p_hairSegmentationMatteDimensions = &internal->hairSegmentationMatteDimensions;
    p_uint64_t height = &internal->hairSegmentationMatteDimensions.height;
  }
  else if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeSkin"])
  {
    v8 = self->_internal;
    p_hairSegmentationMatteDimensions = &v8->skinSegmentationMatteDimensions;
    p_uint64_t height = &v8->skinSegmentationMatteDimensions.height;
  }
  else if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeTeeth"])
  {
    v9 = self->_internal;
    p_hairSegmentationMatteDimensions = &v9->teethSegmentationMatteDimensions;
    p_uint64_t height = &v9->teethSegmentationMatteDimensions.height;
  }
  else
  {
    if (![(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeGlasses"])return (CMVideoDimensions)0; {
    v10 = self->_internal;
    }
    p_hairSegmentationMatteDimensions = &v10->glassesSegmentationMatteDimensions;
    p_uint64_t height = &v10->glassesSegmentationMatteDimensions.height;
  }
  return (CMVideoDimensions)(p_hairSegmentationMatteDimensions->width | ((unint64_t)*p_height << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)spatialOverCapturePhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->spatialOverCapturePhotoDimensions;
}

- (BOOL)isTurboModeEnabled
{
  return self->_internal->turboModeEnabled;
}

- (BOOL)isFlashEnabled
{
  return self->_internal->flashEnabled;
}

- (BOOL)isRedEyeReductionEnabled
{
  return self->_internal->redEyeReductionEnabled;
}

- (BOOL)isHDREnabled
{
  return self->_internal->HDREnabled;
}

- (BOOL)isAdjustedPhotoFilterRenderingEnabled
{
  return self->_internal->adjustedPhotoFiltersEnabled;
}

- (BOOL)isEV0PhotoDeliveryEnabled
{
  return self->_internal->EV0PhotoDeliveryEnabled;
}

- (BOOL)isStillImageStabilizationEnabled
{
  return self->_internal->stillImageStabilizationEnabled;
}

- (BOOL)isSquareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (BOOL)livePhotoMovieEnabled
{
  return self->_internal->livePhotoMovieEnabled;
}

- (BOOL)isVirtualDeviceFusionEnabled
{
  return self->_internal->virtualDeviceFusionEnabled;
}

- (BOOL)isDualCameraFusionEnabled
{
  return self->_internal->virtualDeviceFusionEnabled;
}

- (NSUInteger)expectedPhotoCount
{
  return [(NSArray *)self->_internal->photoManifest count];
}

- (id)photoManifest
{
  v2 = self->_internal->photoManifest;

  return v2;
}

- (CMVideoDimensions)deferredPhotoProxyDimensions
{
  return (CMVideoDimensions)self->_internal->deferredPhotoProxyDimensions;
}

- (CMTimeRange)photoProcessingTimeRange
{
  uint64_t v3 = *(void *)&self->start.timescale;
  long long v4 = *(_OWORD *)(v3 + 152);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 136);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 168);
  return self;
}

- (BOOL)isContentAwareDistortionCorrectionEnabled
{
  return self->_internal->contentAwareDistortionCorrectionEnabled;
}

- (BOOL)isSpatialPhotoCaptureEnabled
{
  return self->_internal->spatialPhotoCaptureEnabled;
}

- (BOOL)isCaptureBeforeResolvingSettingsEnabled
{
  return self->_internal->captureBeforeResolvingSettingsEnabled;
}

- (unint64_t)digitalFlashUserInterfaceHints
{
  return self->_internal->digitalFlashUserInterfaceHints;
}

- (id)digitalFlashUserInterfaceRGBEstimate
{
  if (self->_internal->digitalFlashUserInterfaceRGBEstimate) {
    return self->_internal->digitalFlashUserInterfaceRGBEstimate;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)isFastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

@end