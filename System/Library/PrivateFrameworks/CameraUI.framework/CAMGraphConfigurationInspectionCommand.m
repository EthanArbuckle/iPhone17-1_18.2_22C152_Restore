@interface CAMGraphConfigurationInspectionCommand
- (CAMCaptureGraphConfiguration)_knownGraphConfiguration;
- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration;
- (CAMGraphConfigurationInspectionCommand)initWithCoder:(id)a3;
- (CAMGraphConfigurationInspectionCommand)initWithKnownGraphConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
- (int64_t)_resolvedVideoConfigurationFromContext:(id)a3;
- (void)_setResolvedGraphConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMGraphConfigurationInspectionCommand

- (CAMGraphConfigurationInspectionCommand)initWithKnownGraphConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  v6 = [(CAMCaptureCommand *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__knownGraphConfiguration, a3);
    resolvedGraphConfiguration = v7->__resolvedGraphConfiguration;
    v7->__resolvedGraphConfiguration = 0;

    v9 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  id v46 = a3;
  v4 = [(CAMGraphConfigurationInspectionCommand *)self _knownGraphConfiguration];
  unint64_t v5 = [v4 mode];
  if (v5 > 9)
  {
    v6 = 0;
  }
  else if (((1 << v5) & 0x279) != 0 || [v4 videoConfiguration])
  {
    v6 = v4;
  }
  else
  {
    int64_t v45 = [(CAMGraphConfigurationInspectionCommand *)self _resolvedVideoConfigurationFromContext:v46];
    v44 = [CAMCaptureGraphConfiguration alloc];
    uint64_t v43 = [v4 mode];
    uint64_t v42 = [v4 device];
    uint64_t v41 = [v4 macroMode];
    uint64_t v40 = [v4 audioConfiguration];
    unsigned int v39 = [v4 mixAudioWithOthers];
    char v38 = [v4 windNoiseRemovalEnabled];
    uint64_t v37 = [v4 previewConfiguration];
    uint64_t v36 = [v4 previewSampleBufferVideoFormat];
    v35 = [v4 previewFilters];
    v34 = [v4 videoThumbnailOutputConfiguration];
    uint64_t v33 = [v4 photoEncodingBehavior];
    uint64_t v32 = [v4 videoEncodingBehavior];
    char v31 = [v4 enableAutoFPSVideo];
    char v30 = [v4 isVideoHDRSuspended];
    uint64_t v29 = [v4 aspectRatioCrop];
    uint64_t v28 = [v4 photoQualityPrioritization];
    char v27 = [v4 isCaptureMirrored];
    char v25 = [v4 enableRAWCaptureIfSupported];
    uint64_t v24 = [v4 semanticStyleSupport];
    v26 = [v4 previewSemanticStyle];
    char v23 = [v4 enableContentAwareDistortionCorrection];
    char v22 = [v4 enableResponsiveShutter];
    char v21 = [v4 suspendLivePhotoCapture];
    uint64_t v7 = [v4 videoStabilizationStrength];
    uint64_t v8 = [v4 maximumPhotoResolution];
    uint64_t v9 = [v4 colorSpace];
    char v10 = [v4 enableDepthSuggestion];
    char v11 = [v4 enableZoomPIP];
    v12 = [v4 customLensGroup];
    char v13 = [v4 enableStereoVideoCapture];
    char v14 = [v4 trueVideoEnabled];
    BYTE2(v20) = [v4 prefersHDR10BitVideo];
    BYTE1(v20) = v14;
    LOBYTE(v20) = v13;
    BYTE1(v19) = v11;
    LOBYTE(v19) = v10;
    BYTE2(v18) = v21;
    BYTE1(v18) = v22;
    LOBYTE(v18) = v23;
    BYTE1(v17) = v25;
    LOBYTE(v17) = v27;
    BYTE1(v16) = v30;
    LOBYTE(v16) = v31;
    LOBYTE(v15) = v38;
    v6 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v44, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v43, v42, v41, v45, v40, v39, v15, v37, v36, v35, v34,
           v33,
           v32,
           v16,
           v29,
           v28,
           v17,
           v24,
           v26,
           v18,
           v7,
           v8,
           v9,
           v19,
           v12,
           v20);
  }
  [(CAMGraphConfigurationInspectionCommand *)self _setResolvedGraphConfiguration:v6];
}

- (CAMCaptureGraphConfiguration)_knownGraphConfiguration
{
  return self->__knownGraphConfiguration;
}

- (void)_setResolvedGraphConfiguration:(id)a3
{
}

- (id)userInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(CAMGraphConfigurationInspectionCommand *)self _resolvedGraphConfiguration];
  [v3 setObject:v4 forKey:@"CAMModeAndDeviceCommandResolvedConfiguration"];

  return v3;
}

- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration
{
  return self->__resolvedGraphConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, 0);
  objc_storeStrong((id *)&self->__knownGraphConfiguration, 0);
}

- (CAMGraphConfigurationInspectionCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  unint64_t v5 = [(CAMCaptureCommand *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMGraphConfigurationInspectionCommandKnownConfiguration"];
    knownGraphConfiguration = v5->__knownGraphConfiguration;
    v5->__knownGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"CAMGraphConfigurationInspectionCommandResolvedConfiguration"];
    resolvedGraphConfiguration = v5->__resolvedGraphConfiguration;
    v5->__resolvedGraphConfiguration = (CAMCaptureGraphConfiguration *)v8;

    char v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(CAMGraphConfigurationInspectionCommand *)self _knownGraphConfiguration];
  [v4 encodeObject:v5 forKey:@"CAMGraphConfigurationInspectionCommandKnownConfiguration"];

  uint64_t v6 = [(CAMGraphConfigurationInspectionCommand *)self _resolvedGraphConfiguration];
  [v4 encodeObject:v6 forKey:@"CAMGraphConfigurationInspectionCommandResolvedConfiguration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMGraphConfigurationInspectionCommand;
  id v4 = [(CAMCaptureCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(CAMGraphConfigurationInspectionCommand *)self _knownGraphConfiguration];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(CAMGraphConfigurationInspectionCommand *)self _resolvedGraphConfiguration];
  uint64_t v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (int64_t)_resolvedVideoConfigurationFromContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentVideoDevice];
  uint64_t v5 = [v3 currentVideoDeviceFormat];

  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v5 formatDescription]);
  unint64_t v7 = HIDWORD(Dimensions);
  BOOL v9 = Dimensions == 1280 && HIDWORD(Dimensions) == 720;
  BOOL v11 = Dimensions == 1920 && HIDWORD(Dimensions) == 1080;
  BOOL v13 = Dimensions == 3840 && HIDWORD(Dimensions) == 2160;
  if (v4)
  {
    [v4 activeVideoMinFrameDuration];
    uint64_t v14 = 0 / 0;
    if (0 / 0 == 30 && v9)
    {
      int64_t v16 = 6;
      goto LABEL_88;
    }
    LODWORD(v7) = v14 == 120;
    if (v14 == 120 && v9)
    {
      int64_t v16 = 2;
      goto LABEL_88;
    }
    if (v14 == 240 && v9)
    {
      int64_t v16 = 3;
      goto LABEL_88;
    }
    if (v14 == 25 && v11)
    {
      int64_t v16 = 11;
      goto LABEL_88;
    }
    if (v14 == 30 && v11)
    {
      int64_t v16 = 7;
      goto LABEL_88;
    }
    if (v14 == 60 && v11)
    {
      int64_t v16 = 1;
      goto LABEL_88;
    }
    if (v14 == 120 && v11)
    {
      int64_t v16 = 4;
      goto LABEL_88;
    }
    if (v14 == 240 && v11)
    {
      int64_t v16 = 8;
      goto LABEL_88;
    }
    if (v14 == 24 && v13)
    {
      int64_t v16 = 10;
      goto LABEL_88;
    }
    if (v14 == 25 && v13)
    {
      int64_t v16 = 12;
      goto LABEL_88;
    }
    if (v14 == 30 && v13)
    {
      int64_t v16 = 5;
      goto LABEL_88;
    }
    if (v14 == 60 && v13)
    {
      int64_t v16 = 9;
      goto LABEL_88;
    }
    if (v14 == 100 && v13)
    {
      int64_t v16 = 14;
      goto LABEL_88;
    }
  }
  if ((v13 & v7) != 0) {
    int64_t v16 = 13;
  }
  else {
    int64_t v16 = 0;
  }
LABEL_88:

  return v16;
}

@end