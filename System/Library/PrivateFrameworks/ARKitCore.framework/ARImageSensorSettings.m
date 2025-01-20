@interface ARImageSensorSettings
- (ARImageSensorSettings)initWithVideoFormat:(id)a3;
- (ARVideoFormat)videoFormat;
- (BOOL)autoFocusEnabled;
- (BOOL)backFacingCameraGeometricDistortionCorrectionEnabled;
- (BOOL)calibrationDataOutputEnabled;
- (BOOL)dropsInitialFramesOutsideExposureTargetOffsetThreshold;
- (BOOL)focusPixelBlurScoreDeliveryEnabled;
- (BOOL)isBravoCameraEnabled;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirrorVideoOutput;
- (BOOL)supportsCapturingHighResolutionFrames;
- (BOOL)videoHDRAllowed;
- (BOOL)visionDataOutputEnabled;
- (NSDictionary)visionDataOutputParameters;
- (NSString)metaData;
- (float)maxGainOverride;
- (float)negativeExposureTargetOffsetThreshold;
- (float)positiveExposureTargetOffsetThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maximumNumberOfInitialFramesDropped;
- (unint64_t)maximumNumberOfTrackedFaces;
- (void)setAutoFocusEnabled:(BOOL)a3;
- (void)setBackFacingCameraGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setCalibrationDataOutputEnabled:(BOOL)a3;
- (void)setDropsInitialFramesOutsideExposureTargetOffsetThreshold:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3;
- (void)setMaxGainOverride:(float)a3;
- (void)setMaximumNumberOfInitialFramesDropped:(unint64_t)a3;
- (void)setMaximumNumberOfTrackedFaces:(unint64_t)a3;
- (void)setMetaData:(id)a3;
- (void)setMirrorVideoOutput:(BOOL)a3;
- (void)setNegativeExposureTargetOffsetThreshold:(float)a3;
- (void)setPositiveExposureTargetOffsetThreshold:(float)a3;
- (void)setSupportsCapturingHighResolutionFrames:(BOOL)a3;
- (void)setVideoFormat:(id)a3;
- (void)setVideoHDRAllowed:(BOOL)a3;
- (void)setVisionDataOutputEnabled:(BOOL)a3;
- (void)setVisionDataOutputParameters:(id)a3;
@end

@implementation ARImageSensorSettings

- (ARImageSensorSettings)initWithVideoFormat:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARImageSensorSettings;
  v6 = [(ARImageSensorSettings *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoFormat, a3);
    *(_WORD *)&v7->_autoFocusEnabled = 0;
    v7->_visionDataOutputEnabled = 0;
    v8 = [v5 deviceFormat];
    v7->_calibrationDataOutputEnabled = [v8 isCameraCalibrationDataDeliverySupported];

    v7->_maxGainOverride = 0.0;
    *(_WORD *)&v7->_videoHDRAllowed = 0;
    v7->_enabled = 1;
    v7->_backFacingCameraGeometricDistortionCorrectionEnabled = 0;
    v7->_maximumNumberOfTrackedFaces = 0;
    v9 = [v5 captureDeviceType];
    v10 = (void *)*MEMORY[0x1E4F15828];

    if (v9 == v10) {
      v7->_backFacingCameraGeometricDistortionCorrectionEnabled = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.ultrawide.geometricDistortionCorrection"];
    }
    +[ARKitUserDefaults doubleForKey:@"com.apple.arkit.imagesensor.initialFrameDrop.negativeExposureTargetOffsetThreshold"];
    *(float *)&double v11 = v11;
    v7->_negativeExposureTargetOffsetThreshold = *(float *)&v11;
    +[ARKitUserDefaults doubleForKey:@"com.apple.arkit.imagesensor.initialFrameDrop.positiveExposureTargetOffsetThreshold"];
    *(float *)&double v12 = v12;
    v7->_positiveExposureTargetOffsetThreshold = *(float *)&v12;
    v7->_maximumNumberOfInitialFramesDropped = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.imagesensor.initialFrameDrop.maxDroppedFramesCount"];
  }

  return v7;
}

- (void)setVisionDataOutputEnabled:(BOOL)a3
{
  id v5 = [(ARVideoFormat *)self->_videoFormat deviceFormat];
  self->_visionDataOutputEnabled = [v5 isVisionDataDeliverySupported] & a3;
}

- (void)setCalibrationDataOutputEnabled:(BOOL)a3
{
  id v5 = [(ARVideoFormat *)self->_videoFormat deviceFormat];
  self->_calibrationDataOutputEnabled = [v5 isCameraCalibrationDataDeliverySupported] & a3;
}

- (BOOL)isBravoCameraEnabled
{
  v2 = [(ARImageSensorSettings *)self videoFormat];
  v3 = [v2 device];

  v4 = [v3 deviceType];
  if (v4 == (void *)*MEMORY[0x1E4F157F0])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v5 = [v3 deviceType];
    BOOL v6 = v5 == (void *)*MEMORY[0x1E4F15818];
  }
  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v12.receiver = self;
  v12.super_class = (Class)ARImageSensorSettings;
  v4 = [(ARImageSensorSettings *)&v12 description];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  if (self->_enabled) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  [v5 appendFormat:@"Enabled: %@\n", v6];
  [v5 appendFormat:@"Video Format: %@\n", self->_videoFormat];
  if (self->_visionDataOutputEnabled) {
    v7 = @"Enabled";
  }
  else {
    v7 = @"Disabled";
  }
  [v5 appendFormat:@"VisionData: %@\n", v7];
  if (self->_calibrationDataOutputEnabled) {
    v8 = @"Enabled";
  }
  else {
    v8 = @"Disabled";
  }
  [v5 appendFormat:@"CalibrationData: %@\n", v8];
  if (self->_backFacingCameraGeometricDistortionCorrectionEnabled) {
    v9 = @"Enabled";
  }
  else {
    v9 = @"Disabled";
  }
  [v5 appendFormat:@"GeometricDistortionCorrection: %@\n", v9];
  [v5 appendFormat:@"Metadata: %@\n", self->_metaData];
  if (self->_supportsCapturingHighResolutionFrames) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v5 appendFormat:@"Supports Capturing High Resolution Frames: %@\n", v10];
  return v5;
}

- (unint64_t)hash
{
  v3 = NSString;
  v4 = [(ARVideoFormat *)self->_videoFormat description];
  id v5 = [v3 stringWithFormat:@"%@|%li|%i", v4, self->_autoFocusEnabled, self->_mirrorVideoOutput];

  unint64_t v6 = [v5 hash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = v6;
    v8 = [(ARImageSensorSettings *)self videoFormat];
    v9 = [v7 videoFormat];
    if (v8 != v9)
    {
      v3 = [(ARImageSensorSettings *)self videoFormat];
      v4 = [v7 videoFormat];
      if (![v3 isEqual:v4])
      {
        LOBYTE(v10) = 0;
        goto LABEL_14;
      }
    }
    int v12 = [(ARImageSensorSettings *)self autoFocusEnabled];
    if (v12 != [v7 autoFocusEnabled]
      || (int v13 = [(ARImageSensorSettings *)self mirrorVideoOutput],
          v13 != [v7 mirrorVideoOutput])
      || (int v14 = [(ARImageSensorSettings *)self visionDataOutputEnabled],
          v14 != [v7 visionDataOutputEnabled])
      || ([(ARImageSensorSettings *)self maxGainOverride],
          float v16 = v15,
          [v7 maxGainOverride],
          v16 != v17)
      || (int v18 = [(ARImageSensorSettings *)self videoHDRAllowed],
          v18 != [v7 videoHDRAllowed])
      || (int v19 = [(ARImageSensorSettings *)self focusPixelBlurScoreDeliveryEnabled],
          v19 != [v7 focusPixelBlurScoreDeliveryEnabled]))
    {
      LOBYTE(v10) = 0;
      BOOL v11 = 0;
      goto LABEL_13;
    }
    v21 = [(ARImageSensorSettings *)self visionDataOutputParameters];
    v22 = [v7 visionDataOutputParameters];
    if (v21 != v22)
    {
      v23 = [(ARImageSensorSettings *)self visionDataOutputParameters];
      v46 = [v7 visionDataOutputParameters];
      v47 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        goto LABEL_40;
      }
    }
    int v24 = [(ARImageSensorSettings *)self calibrationDataOutputEnabled];
    if (v24 != [v7 calibrationDataOutputEnabled])
    {
      LOBYTE(v10) = 0;
      goto LABEL_39;
    }
    uint64_t v10 = [(ARImageSensorSettings *)self metaData];
    [v7 metaData];
    uint64_t v45 = v44 = v21;
    if (v10 == v45)
    {
      v43 = (void *)v10;
    }
    else
    {
      v40 = v22;
      v25 = [(ARImageSensorSettings *)self metaData];
      v41 = [v7 metaData];
      v42 = v25;
      if (!objc_msgSend(v25, "isEqualToString:"))
      {
        v38 = (void *)v10;
        LOBYTE(v10) = 0;
        v39 = (void *)v45;
        v22 = v40;
        goto LABEL_37;
      }
      v43 = (void *)v10;
      v22 = v40;
    }
    int v26 = [(ARImageSensorSettings *)self isEnabled];
    if (v26 != [v7 isEnabled]) {
      goto LABEL_33;
    }
    int v27 = [(ARImageSensorSettings *)self backFacingCameraGeometricDistortionCorrectionEnabled];
    if (v27 != [v7 backFacingCameraGeometricDistortionCorrectionEnabled]) {
      goto LABEL_33;
    }
    int v28 = [(ARImageSensorSettings *)self dropsInitialFramesOutsideExposureTargetOffsetThreshold];
    if (v28 != [v7 dropsInitialFramesOutsideExposureTargetOffsetThreshold]) {
      goto LABEL_33;
    }
    [(ARImageSensorSettings *)self positiveExposureTargetOffsetThreshold];
    float v30 = v29;
    [v7 positiveExposureTargetOffsetThreshold];
    if (v30 == v31
      && ([(ARImageSensorSettings *)self negativeExposureTargetOffsetThreshold],
          float v33 = v32,
          [v7 negativeExposureTargetOffsetThreshold],
          v33 == v34)
      && (unint64_t v35 = -[ARImageSensorSettings maximumNumberOfInitialFramesDropped](self, "maximumNumberOfInitialFramesDropped"), v35 == [v7 maximumNumberOfInitialFramesDropped]))
    {
      BOOL v36 = [(ARImageSensorSettings *)self supportsCapturingHighResolutionFrames];
      LODWORD(v10) = v36 ^ [v7 supportsCapturingHighResolutionFrames] ^ 1;
      char v37 = v10;
    }
    else
    {
LABEL_33:
      LOBYTE(v10) = 0;
      char v37 = 0;
    }
    v38 = v43;
    v39 = (void *)v45;
    if (v43 == (void *)v45)
    {
      LOBYTE(v10) = v37;
LABEL_38:

      v21 = v44;
LABEL_39:
      if (v21 == v22)
      {
LABEL_41:

        BOOL v11 = v10;
LABEL_13:
        if (v8 == v9)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:

        BOOL v11 = v10;
        goto LABEL_15;
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_37:

    goto LABEL_38;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(ARVideoFormat *)self->_videoFormat copyWithZone:a3];
  uint64_t v7 = [v5 initWithVideoFormat:v6];

  *(unsigned char *)(v7 + 8) = self->_autoFocusEnabled;
  *(unsigned char *)(v7 + 9) = self->_mirrorVideoOutput;
  *(unsigned char *)(v7 + 10) = self->_visionDataOutputEnabled;
  *(unsigned char *)(v7 + 11) = self->_calibrationDataOutputEnabled;
  *(float *)(v7 + 20) = self->_maxGainOverride;
  *(unsigned char *)(v7 + 12) = self->_videoHDRAllowed;
  *(unsigned char *)(v7 + 13) = self->_focusPixelBlurScoreDeliveryEnabled;
  uint64_t v8 = [(NSDictionary *)self->_visionDataOutputParameters copyWithZone:a3];
  v9 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_metaData copyWithZone:a3];
  BOOL v11 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v10;

  *(unsigned char *)(v7 + 17) = self->_enabled;
  *(unsigned char *)(v7 + 15) = self->_backFacingCameraGeometricDistortionCorrectionEnabled;
  *(void *)(v7 + 64) = self->_maximumNumberOfTrackedFaces;
  *(unsigned char *)(v7 + 14) = self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold;
  *(float *)(v7 + 28) = self->_positiveExposureTargetOffsetThreshold;
  *(float *)(v7 + 24) = self->_negativeExposureTargetOffsetThreshold;
  *(void *)(v7 + 40) = self->_maximumNumberOfInitialFramesDropped;
  *(unsigned char *)(v7 + 16) = self->_supportsCapturingHighResolutionFrames;
  return (id)v7;
}

- (ARVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (void)setVideoFormat:(id)a3
{
}

- (BOOL)autoFocusEnabled
{
  return self->_autoFocusEnabled;
}

- (void)setAutoFocusEnabled:(BOOL)a3
{
  self->_autoFocusEnabled = a3;
}

- (BOOL)mirrorVideoOutput
{
  return self->_mirrorVideoOutput;
}

- (void)setMirrorVideoOutput:(BOOL)a3
{
  self->_mirrorVideoOutput = a3;
}

- (BOOL)visionDataOutputEnabled
{
  return self->_visionDataOutputEnabled;
}

- (BOOL)calibrationDataOutputEnabled
{
  return self->_calibrationDataOutputEnabled;
}

- (float)maxGainOverride
{
  return self->_maxGainOverride;
}

- (void)setMaxGainOverride:(float)a3
{
  self->_maxGainOverride = a3;
}

- (BOOL)videoHDRAllowed
{
  return self->_videoHDRAllowed;
}

- (void)setVideoHDRAllowed:(BOOL)a3
{
  self->_videoHDRAllowed = a3;
}

- (BOOL)focusPixelBlurScoreDeliveryEnabled
{
  return self->_focusPixelBlurScoreDeliveryEnabled;
}

- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreDeliveryEnabled = a3;
}

- (BOOL)dropsInitialFramesOutsideExposureTargetOffsetThreshold
{
  return self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold;
}

- (void)setDropsInitialFramesOutsideExposureTargetOffsetThreshold:(BOOL)a3
{
  self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold = a3;
}

- (float)negativeExposureTargetOffsetThreshold
{
  return self->_negativeExposureTargetOffsetThreshold;
}

- (void)setNegativeExposureTargetOffsetThreshold:(float)a3
{
  self->_negativeExposureTargetOffsetThreshold = a3;
}

- (float)positiveExposureTargetOffsetThreshold
{
  return self->_positiveExposureTargetOffsetThreshold;
}

- (void)setPositiveExposureTargetOffsetThreshold:(float)a3
{
  self->_positiveExposureTargetOffsetThreshold = a3;
}

- (unint64_t)maximumNumberOfInitialFramesDropped
{
  return self->_maximumNumberOfInitialFramesDropped;
}

- (void)setMaximumNumberOfInitialFramesDropped:(unint64_t)a3
{
  self->_maximumNumberOfInitialFramesDropped = a3;
}

- (BOOL)backFacingCameraGeometricDistortionCorrectionEnabled
{
  return self->_backFacingCameraGeometricDistortionCorrectionEnabled;
}

- (void)setBackFacingCameraGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_backFacingCameraGeometricDistortionCorrectionEnabled = a3;
}

- (NSString)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSDictionary)visionDataOutputParameters
{
  return self->_visionDataOutputParameters;
}

- (void)setVisionDataOutputParameters:(id)a3
{
}

- (unint64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void)setMaximumNumberOfTrackedFaces:(unint64_t)a3
{
  self->_maximumNumberOfTrackedFaces = a3;
}

- (BOOL)supportsCapturingHighResolutionFrames
{
  return self->_supportsCapturingHighResolutionFrames;
}

- (void)setSupportsCapturingHighResolutionFrames:(BOOL)a3
{
  self->_supportsCapturingHighResolutionFrames = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionDataOutputParameters, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);
}

@end