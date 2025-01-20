@interface CAMCaptureGraphConfiguration
- (BOOL)enableAutoFPSVideo;
- (BOOL)enableContentAwareDistortionCorrection;
- (BOOL)enableDepthSuggestion;
- (BOOL)enableRAWCaptureIfSupported;
- (BOOL)enableResponsiveShutter;
- (BOOL)enableStereoVideoCapture;
- (BOOL)enableZoomPIP;
- (BOOL)isCaptureMirrored;
- (BOOL)isVideoHDRSuspended;
- (BOOL)mixAudioWithOthers;
- (BOOL)prefersHDR10BitVideo;
- (BOOL)suspendLivePhotoCapture;
- (BOOL)trueVideoEnabled;
- (BOOL)windNoiseRemovalEnabled;
- (CAMCaptureGraphConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 macroMode:(int64_t)a5 videoConfiguration:(int64_t)a6 audioConfiguration:(unint64_t)a7 mixAudioWithOthers:(BOOL)a8 windNoiseRemovalEnabled:(BOOL)a9 previewConfiguration:(unint64_t)a10 previewSampleBufferVideoFormat:(int64_t)a11 previewFilters:(id)a12 videoThumbnailOutputConfiguration:(id)a13 photoEncodingBehavior:(int64_t)a14 videoEncodingBehavior:(int64_t)a15 enableAutoFPSVideo:(BOOL)a16 videoHDRSuspended:(BOOL)a17 aspectRatioCrop:(int64_t)a18 photoQualityPrioritization:(int64_t)a19 captureMirrored:(BOOL)a20 enableRAWCaptureIfSupported:(BOOL)a21 semanticStyleSupport:(unint64_t)a22 previewSemanticStyle:(id)a23 enableContentAwareDistortionCorrection:(BOOL)a24 enableResponsiveShutter:(BOOL)a25 suspendLivePhotoCapture:(BOOL)a26 videoStabilizationStrength:(int64_t)a27 maximumPhotoResolution:(int64_t)a28 colorSpace:(int64_t)a29 enableDepthSuggestion:(BOOL)a30 enableZoomPIP:(BOOL)a31 customLensGroup:(id)a32 enableStereoVideoCapture:(BOOL)a33 trueVideoEnabled:(BOOL)a34 prefersHDR10BitVideo:(BOOL)a35;
- (CAMVideoThumbnailOutputConfiguration)videoThumbnailOutputConfiguration;
- (CEKCaptureStyle)previewSemanticStyle;
- (NSArray)customLensGroup;
- (NSArray)previewFilters;
- (id)completeDescription;
- (id)deviceDescription;
- (id)devicePositionDescription;
- (id)modeDescription;
- (id)shortDescription;
- (int64_t)aspectRatioCrop;
- (int64_t)colorSpace;
- (int64_t)device;
- (int64_t)devicePosition;
- (int64_t)macroMode;
- (int64_t)maximumPhotoResolution;
- (int64_t)mode;
- (int64_t)photoEncodingBehavior;
- (int64_t)photoQualityPrioritization;
- (int64_t)previewSampleBufferVideoFormat;
- (int64_t)videoConfiguration;
- (int64_t)videoEncodingBehavior;
- (int64_t)videoStabilizationStrength;
- (unint64_t)audioConfiguration;
- (unint64_t)previewConfiguration;
- (unint64_t)semanticStyleSupport;
@end

@implementation CAMCaptureGraphConfiguration

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (int64_t)videoEncodingBehavior
{
  return self->_videoEncodingBehavior;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (unint64_t)previewConfiguration
{
  return self->_previewConfiguration;
}

- (int64_t)previewSampleBufferVideoFormat
{
  return self->_previewSampleBufferVideoFormat;
}

- (NSArray)previewFilters
{
  return self->_previewFilters;
}

- (CAMVideoThumbnailOutputConfiguration)videoThumbnailOutputConfiguration
{
  return self->_videoThumbnailOutputConfiguration;
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLensGroup, 0);
  objc_storeStrong((id *)&self->_previewSemanticStyle, 0);
  objc_storeStrong((id *)&self->_videoThumbnailOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_previewFilters, 0);
}

- (id)completeDescription
{
  unint64_t v3 = [(CAMCaptureGraphConfiguration *)self mode];
  if (v3 > 9) {
    v4 = 0;
  }
  else {
    v4 = off_263FA5F18[v3];
  }
  unint64_t v5 = [(CAMCaptureGraphConfiguration *)self device];
  if (v5 > 0xB) {
    v6 = 0;
  }
  else {
    v6 = off_263FA5F68[v5];
  }
  int64_t v7 = [(CAMCaptureGraphConfiguration *)self videoConfiguration];
  switch(v7)
  {
    case 0:
      v8 = @"Auto";
      break;
    case 1:
      v8 = @"1080p60";
      break;
    case 2:
      v8 = @"720p120";
      break;
    case 3:
      v8 = @"720p240";
      break;
    case 4:
      v8 = @"1080p120";
      break;
    case 5:
      v8 = @"4k30";
      break;
    case 6:
      v8 = @"720p30";
      break;
    case 7:
      v8 = @"1080p30";
      break;
    case 8:
      v8 = @"1080p240";
      break;
    case 9:
      v8 = @"4k60";
      break;
    case 10:
      v8 = @"4k24";
      break;
    case 11:
      v8 = @"1080p25";
      break;
    case 12:
      v8 = @"4k25";
      break;
    case 13:
      v8 = @"4k120";
      break;
    case 14:
      v8 = @"4k100";
      break;
    default:
      switch(v7)
      {
        case 10000:
          v8 = @"ImagePickerHigh";
          break;
        case 10001:
          v8 = @"ImagePickerMedium";
          break;
        case 10002:
          v8 = @"ImagePickerLow";
          break;
        case 10003:
          v8 = @"ImagePickerVGA";
          break;
        case 10004:
          v8 = @"ImagePickeriFrame720p";
          break;
        case 10005:
          v8 = @"ImagePickeriFrame540p";
          break;
        default:
          v8 = 0;
          break;
      }
      break;
  }
  unint64_t v9 = [(CAMCaptureGraphConfiguration *)self audioConfiguration];
  if (v9 > 3) {
    v10 = 0;
  }
  else {
    v10 = off_263FA5FC8[v9];
  }
  char v11 = [(CAMCaptureGraphConfiguration *)self previewConfiguration];
  v12 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  v13 = v12;
  if (v11)
  {
    [v12 addObject:@"Layer"];
    if ((v11 & 2) == 0)
    {
LABEL_36:
      if ((v11 & 4) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_36;
  }
  [v13 addObject:@"VideoDataOutput"];
  if ((v11 & 4) != 0) {
LABEL_37:
  }
    [v13 addObject:@"ThumbnailOutput"];
LABEL_38:
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__25;
  v47 = __Block_byref_object_dispose__25;
  id v48 = 0;
  uint64_t v14 = [v13 count];
  v15 = (void *)v44[5];
  if (v14)
  {
    v44[5] = @"Preview";

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __CAMDebugStringForPreviewConfiguration_block_invoke;
    v42[3] = &unk_263FA3770;
    v42[4] = &v43;
    [v13 enumerateObjectsUsingBlock:v42];
  }
  else
  {
    v44[5] = @"PreviewDisabled";
  }
  id v39 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  if ([(CAMCaptureGraphConfiguration *)self mixAudioWithOthers])
  {
    v10 = [(__CFString *)v10 stringByAppendingString:@"_MixWithOthers"];
  }
  v16 = +[CAMCaptureCapabilities capabilities];
  int64_t v17 = [(CAMCaptureGraphConfiguration *)self colorSpace];
  v40 = v10;
  if (v17)
  {
    if (v17 == 3)
    {
      v18 = @"_Log";
    }
    else
    {
      if (v17 != 2) {
        goto LABEL_53;
      }
      v18 = @"_HDR10";
    }
  }
  else
  {
    v18 = @"_sRGB";
  }
  v8 = [(__CFString *)v8 stringByAppendingString:v18];
LABEL_53:
  if (objc_msgSend(v16, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", -[CAMCaptureGraphConfiguration mode](self, "mode"), -[CAMCaptureGraphConfiguration videoConfiguration](self, "videoConfiguration"), -[CAMCaptureGraphConfiguration videoEncodingBehavior](self, "videoEncodingBehavior"), 0, -[CAMCaptureGraphConfiguration enableStereoVideoCapture](self, "enableStereoVideoCapture"), -[CAMCaptureGraphConfiguration prefersHDR10BitVideo](self, "prefersHDR10BitVideo")))
  {
    if ([(CAMCaptureGraphConfiguration *)self enableAutoFPSVideo]) {
      v19 = @"_AutoFPS";
    }
    else {
      v19 = @"_AutoFPSDisabled";
    }
    uint64_t v20 = [(__CFString *)v8 stringByAppendingString:v19];

    v8 = (__CFString *)v20;
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__25;
  v47 = __Block_byref_object_dispose__25;
  id v48 = 0;
  v21 = [(CAMCaptureGraphConfiguration *)self previewFilters];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __51__CAMCaptureGraphConfiguration_completeDescription__block_invoke;
  v41[3] = &unk_263FA5EF8;
  v41[4] = &v43;
  [v21 enumerateObjectsUsingBlock:v41];
  v22 = (void *)MEMORY[0x263F089D8];
  unint64_t v23 = [(CAMCaptureGraphConfiguration *)self photoQualityPrioritization];
  if (v23 > 2) {
    v24 = 0;
  }
  else {
    v24 = off_263FA5FE8[v23];
  }
  v25 = objc_msgSend(v22, "stringWithFormat:", @"%@/%@(%@,%@,%@,%@"), v4, v6, v8, v40, v39, v24;
  if ([(CAMCaptureGraphConfiguration *)self isCaptureMirrored]) {
    [v25 appendFormat:@",Mirrored"];
  }
  if ([(CAMCaptureGraphConfiguration *)self enableRAWCaptureIfSupported]) {
    [v25 appendFormat:@",RAW Enabled"];
  }
  if ([(CAMCaptureGraphConfiguration *)self videoEncodingBehavior] == 2)
  {
    [v25 appendFormat:@",ProRes"];
    if ([(CAMCaptureGraphConfiguration *)self colorSpace] == 3) {
      [v25 appendFormat:@"Log"];
    }
  }
  if ((~[(CAMCaptureGraphConfiguration *)self semanticStyleSupport] & 5) != 0)
  {
    if ([(CAMCaptureGraphConfiguration *)self semanticStyleSupport])
    {
      v26 = @",SemanticStyle Capture";
    }
    else
    {
      if (([(CAMCaptureGraphConfiguration *)self semanticStyleSupport] & 4) == 0) {
        goto LABEL_75;
      }
      v26 = @",SemanticStyle Preview";
    }
  }
  else
  {
    v26 = @",SemanticStyle Capture/Preview";
  }
  [v25 appendFormat:v26];
LABEL_75:
  v27 = [(CAMCaptureGraphConfiguration *)self previewSemanticStyle];

  if (v27)
  {
    v28 = [(CAMCaptureGraphConfiguration *)self previewSemanticStyle];
    [v25 appendFormat:@",PreviewSemanticStyle: %@", v28];
  }
  int v29 = objc_msgSend(v16, "isContentAwareDistortionCorrectionSupportedForMode:", -[CAMCaptureGraphConfiguration mode](self, "mode"));
  BOOL v30 = [(CAMCaptureGraphConfiguration *)self enableContentAwareDistortionCorrection];
  if ((v30 | v29))
  {
    if (v30) {
      v31 = @",ContentAwareDistortion";
    }
    else {
      v31 = @",ContentAwareDistortionDisabled";
    }
    [v25 appendFormat:v31];
  }
  if ([(CAMCaptureGraphConfiguration *)self aspectRatioCrop])
  {
    unint64_t v32 = [(CAMCaptureGraphConfiguration *)self aspectRatioCrop];
    if (v32 > 3) {
      v33 = 0;
    }
    else {
      v33 = off_263FA6000[v32];
    }
    [v25 appendFormat:@",%@", v33];
  }
  if ([(id)v44[5] length]) {
    [v25 appendFormat:@",filters=%@", v44[5]];
  }
  if ([(CAMCaptureGraphConfiguration *)self enableResponsiveShutter])
  {
    v34 = @",ResponsiveShutter";
LABEL_93:
    [v25 appendFormat:v34];
    goto LABEL_94;
  }
  if ([v16 responsiveShutterSupported])
  {
    v34 = @",ResponsiveShutterDisabled";
    goto LABEL_93;
  }
LABEL_94:
  if ([(CAMCaptureGraphConfiguration *)self suspendLivePhotoCapture]
    && [v16 isLivePhotoSupported])
  {
    [v25 appendFormat:@",LivePhotoSuspended"];
  }
  if (objc_msgSend(v16, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", -[CAMCaptureGraphConfiguration mode](self, "mode"), -[CAMCaptureGraphConfiguration device](self, "device"), -[CAMCaptureGraphConfiguration videoConfiguration](self, "videoConfiguration"), -[CAMCaptureGraphConfiguration videoEncodingBehavior](self, "videoEncodingBehavior"), -[CAMCaptureGraphConfiguration trueVideoEnabled](self, "trueVideoEnabled"), -[CAMCaptureGraphConfiguration prefersHDR10BitVideo](self, "prefersHDR10BitVideo")))
  {
    unint64_t v35 = [(CAMCaptureGraphConfiguration *)self videoStabilizationStrength];
    if (v35 < 4) {
      [v25 appendFormat:off_263FA6020[v35]];
    }
  }
  unint64_t v36 = [(CAMCaptureGraphConfiguration *)self maximumPhotoResolution] - 1;
  if (v36 <= 2) {
    [v25 appendFormat:off_263FA6040[v36]];
  }
  [v25 appendFormat:@""]);
  id v37 = v25;

  _Block_object_dispose(&v43, 8);
  return v37;
}

- (CAMCaptureGraphConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 macroMode:(int64_t)a5 videoConfiguration:(int64_t)a6 audioConfiguration:(unint64_t)a7 mixAudioWithOthers:(BOOL)a8 windNoiseRemovalEnabled:(BOOL)a9 previewConfiguration:(unint64_t)a10 previewSampleBufferVideoFormat:(int64_t)a11 previewFilters:(id)a12 videoThumbnailOutputConfiguration:(id)a13 photoEncodingBehavior:(int64_t)a14 videoEncodingBehavior:(int64_t)a15 enableAutoFPSVideo:(BOOL)a16 videoHDRSuspended:(BOOL)a17 aspectRatioCrop:(int64_t)a18 photoQualityPrioritization:(int64_t)a19 captureMirrored:(BOOL)a20 enableRAWCaptureIfSupported:(BOOL)a21 semanticStyleSupport:(unint64_t)a22 previewSemanticStyle:(id)a23 enableContentAwareDistortionCorrection:(BOOL)a24 enableResponsiveShutter:(BOOL)a25 suspendLivePhotoCapture:(BOOL)a26 videoStabilizationStrength:(int64_t)a27 maximumPhotoResolution:(int64_t)a28 colorSpace:(int64_t)a29 enableDepthSuggestion:(BOOL)a30 enableZoomPIP:(BOOL)a31 customLensGroup:(id)a32 enableStereoVideoCapture:(BOOL)a33 trueVideoEnabled:(BOOL)a34 prefersHDR10BitVideo:(BOOL)a35
{
  id v37 = a12;
  id v38 = a13;
  id v39 = a23;
  id v40 = a32;
  v50.receiver = self;
  v50.super_class = (Class)CAMCaptureGraphConfiguration;
  v41 = [(CAMCaptureGraphConfiguration *)&v50 init];
  v42 = v41;
  if (v41)
  {
    v41->_mode = a3;
    v41->_device = a4;
    v41->_macroMode = a5;
    v41->_mixAudioWithOthers = a8;
    v41->_videoConfiguration = a6;
    v41->_audioConfiguration = a7;
    v41->_previewConfiguration = a10;
    v41->_previewSampleBufferVideoFormat = a11;
    objc_storeStrong((id *)&v41->_previewFilters, a12);
    objc_storeStrong((id *)&v42->_videoThumbnailOutputConfiguration, a13);
    v42->_photoEncodingBehavior = a14;
    v42->_videoEncodingBehavior = a15;
    v42->_enableAutoFPSVideo = a16;
    v42->_videoHDRSuspended = a17;
    v42->_aspectRatioCrop = a18;
    v42->_photoQualityPrioritization = a19;
    v42->_captureMirrored = a20;
    v42->_enableRAWCaptureIfSupported = a21;
    v42->_semanticStyleSupport = a22;
    objc_storeStrong((id *)&v42->_previewSemanticStyle, a23);
    v42->_enableContentAwareDistortionCorrection = a24;
    v42->_enableResponsiveShutter = a25;
    v42->_suspendLivePhotoCapture = a26;
    v42->_videoStabilizationStrength = a27;
    v42->_maximumPhotoResolution = a28;
    v42->_colorSpace = a29;
    v42->_enableDepthSuggestion = a30;
    v42->_enableZoomPIP = a31;
    objc_storeStrong((id *)&v42->_customLensGroup, a32);
    v42->_enableStereoVideoCapture = a33;
    v42->_windNoiseRemovalEnabled = a9;
    v42->_trueVideoEnabled = a34;
    v42->_prefersHDR10BitVideo = a35;
    uint64_t v43 = v42;
  }

  return v42;
}

- (int64_t)devicePosition
{
  int64_t v2 = [(CAMCaptureGraphConfiguration *)self device];
  if ((unint64_t)(v2 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_209C7B968[v2 - 1];
  }
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  v4 = [(CAMCaptureGraphConfiguration *)self modeDescription];
  unint64_t v5 = [(CAMCaptureGraphConfiguration *)self deviceDescription];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (id)modeDescription
{
  unint64_t v2 = [(CAMCaptureGraphConfiguration *)self mode];
  if (v2 > 9) {
    return 0;
  }
  else {
    return off_263FA5F18[v2];
  }
}

- (id)deviceDescription
{
  unint64_t v2 = [(CAMCaptureGraphConfiguration *)self device];
  if (v2 > 0xB) {
    return 0;
  }
  else {
    return off_263FA5F68[v2];
  }
}

- (id)devicePositionDescription
{
  int64_t v2 = [(CAMCaptureGraphConfiguration *)self devicePosition];
  unint64_t v3 = @"Back";
  if (v2) {
    unint64_t v3 = 0;
  }
  if (v2 == 1) {
    v4 = @"Front";
  }
  else {
    v4 = v3;
  }
  return v4;
}

void __51__CAMCaptureGraphConfiguration_completeDescription__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 name];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  id v10 = v3;
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@;%@", v5, v3];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = v3;
    v8 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;
  }
}

- (int64_t)macroMode
{
  return self->_macroMode;
}

- (BOOL)mixAudioWithOthers
{
  return self->_mixAudioWithOthers;
}

- (BOOL)enableAutoFPSVideo
{
  return self->_enableAutoFPSVideo;
}

- (BOOL)isVideoHDRSuspended
{
  return self->_videoHDRSuspended;
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (BOOL)enableRAWCaptureIfSupported
{
  return self->_enableRAWCaptureIfSupported;
}

- (unint64_t)semanticStyleSupport
{
  return self->_semanticStyleSupport;
}

- (CEKCaptureStyle)previewSemanticStyle
{
  return self->_previewSemanticStyle;
}

- (BOOL)enableContentAwareDistortionCorrection
{
  return self->_enableContentAwareDistortionCorrection;
}

- (BOOL)enableResponsiveShutter
{
  return self->_enableResponsiveShutter;
}

- (BOOL)suspendLivePhotoCapture
{
  return self->_suspendLivePhotoCapture;
}

- (int64_t)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (int64_t)maximumPhotoResolution
{
  return self->_maximumPhotoResolution;
}

- (int64_t)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)enableDepthSuggestion
{
  return self->_enableDepthSuggestion;
}

- (BOOL)enableZoomPIP
{
  return self->_enableZoomPIP;
}

- (NSArray)customLensGroup
{
  return self->_customLensGroup;
}

- (BOOL)enableStereoVideoCapture
{
  return self->_enableStereoVideoCapture;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_windNoiseRemovalEnabled;
}

- (BOOL)trueVideoEnabled
{
  return self->_trueVideoEnabled;
}

- (BOOL)prefersHDR10BitVideo
{
  return self->_prefersHDR10BitVideo;
}

@end