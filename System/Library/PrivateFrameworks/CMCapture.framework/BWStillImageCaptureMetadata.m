@interface BWStillImageCaptureMetadata
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)smartCamTimestamp;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)geometricDistortionCorrectionEnabled;
- (BOOL)intelligentDistortionCorrectionEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreviewSmartCamInferences;
- (BWStillImageCaptureMetadata)init;
- (BWStillImageCaptureMetadata)initWithCoder:(id)a3;
- (NSArray)slaveFocalLengths;
- (NSArray)slaveLensFNumbers;
- (NSDictionary)exifFocalLengthMultiplierByPortType;
- (NSDictionary)previewWhiteBalanceMetadataByPortType;
- (NSDictionary)smartCamInferences;
- (NSNumber)shallowDepthOfFieldEffectSceneStatus;
- (NSString)semanticStyleSceneTypeAsSmartCameraSceneType;
- (float)alsRearLuxLevel;
- (float)exifFocalLengthOverride;
- (float)snr;
- (float)totalZoomFactor;
- (float)uiZoomFactor;
- (int)alsLuxLevel;
- (int)cameraControlsStatisticsMaster;
- (int)deepZoomVersion;
- (int)devicePosition;
- (int)deviceType;
- (int)intelligentDistortionCorrectionVersion;
- (int)semanticStyleSceneType;
- (int)smartCamVersion;
- (int)snrType;
- (int)systemPressureLevel;
- (int)zeroShutterLagFailureReason;
- (unint64_t)hash;
- (unsigned)streamingTime;
- (void)calculateSemanticStyleSceneType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlsLuxLevel:(int)a3;
- (void)setAlsRearLuxLevel:(float)a3;
- (void)setCameraControlsStatisticsMaster:(int)a3;
- (void)setDeepZoomVersion:(int)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setExifFocalLengthMultiplierByPortType:(id)a3;
- (void)setExifFocalLengthOverride:(float)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3;
- (void)setIntelligentDistortionCorrectionVersion:(int)a3;
- (void)setIsPreviewSmartCamInferences:(BOOL)a3;
- (void)setPreviewWhiteBalanceMetadataByPortType:(id)a3;
- (void)setSemanticStyleSceneType:(int)a3;
- (void)setShallowDepthOfFieldEffectSceneStatus:(id)a3;
- (void)setSlaveFocalLengths:(id)a3;
- (void)setSlaveLensFNumbers:(id)a3;
- (void)setSmartCamInferences:(id)a3;
- (void)setSmartCamTimestamp:(id *)a3;
- (void)setSmartCamVersion:(int)a3;
- (void)setSnr:(float)a3;
- (void)setSnrType:(int)a3;
- (void)setStreamingTime:(unsigned int)a3;
- (void)setSystemPressureLevel:(int)a3;
- (void)setTotalZoomFactor:(float)a3;
- (void)setUiZoomFactor:(float)a3;
- (void)setZeroShutterLagFailureReason:(int)a3;
@end

@implementation BWStillImageCaptureMetadata

- (int)deviceType
{
  return self->_deviceType;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (BWStillImageCaptureMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureMetadata;
  result = [(BWStillImageCaptureMetadata *)&v3 init];
  if (result) {
    *(void *)&result->_alsLuxLevel = 0x7F7FFFFF7FFFFFFFLL;
  }
  return result;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureMetadata)initWithCoder:(id)a3
{
  v4 = [(BWStillImageCaptureMetadata *)self init];
  if (v4)
  {
    v4->_snrType = [a3 decodeInt32ForKey:@"metadataSNRType"];
    [a3 decodeFloatForKey:@"metadataSNR"];
    v4->_snr = v5;
    v4->_alsLuxLevel = [a3 decodeInt32ForKey:@"metadataALSLuxLevel"];
    [a3 decodeFloatForKey:@"metadataALSRearLuxLevel"];
    v4->_alsRearLuxLevel = v6;
    v4->_deviceType = [a3 decodeInt32ForKey:@"deviceType"];
    v4->_devicePosition = [a3 decodeInt32ForKey:@"devicePosition"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v4->_slaveFocalLengths = (NSArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"slaveFocalLengths"];
    v4->_slaveLensFNumbers = (NSArray *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"slaveLensFNumbers"];
    [a3 decodeFloatForKey:@"totalZoomFactor"];
    v4->_totalZoomFactor = v13;
    [a3 decodeFloatForKey:@"uiZoomFactor"];
    v4->_uiZoomFactor = v14;
    uint64_t v15 = objc_opt_class();
    v4->_exifFocalLengthMultiplierByPortType = (NSDictionary *)(id)[a3 decodeDictionaryWithKeysOfClass:v15 objectsOfClass:objc_opt_class() forKey:@"exifFocalLengthMultiplierByPortType"];
    [a3 decodeFloatForKey:@"exifFocalLengthOverride"];
    v4->_exifFocalLengthOverride = v16;
    v4->_fastCapturePrioritizationEnabled = [a3 decodeBoolForKey:@"fastCapturePrioritizationEnabled"];
    v4->_systemPressureLevel = [a3 decodeInt32ForKey:@"systemPressureLevel"];
    v4->_cameraControlsStatisticsMaster = [a3 decodeInt32ForKey:@"cameraControlsStatisticsMaster"];
    v4->_smartCamVersion = [a3 decodeInt32ForKey:@"smartCamVersion"];
    CMTimeMakeFromDictionary(&v18, (CFDictionaryRef)[a3 decodeObjectOfClasses:v12 forKey:@"smartCamTimestamp"]);
    *(CMTime *)(&v4->_smartCamVersion + 1) = v18;
    v4->_smartCamInferences = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"smartCamInferences"];
    v4->_isPreviewSmartCamInferences = [a3 decodeBoolForKey:@"isPreviewSmartCamInferences"];
    v4->_semanticStyleSceneType = [a3 decodeInt32ForKey:@"semanticStyleSceneType"];
    v4->_zeroShutterLagFailureReason = [a3 decodeInt32ForKey:@"zeroShutterLagFailureReason"];
    v4->_shallowDepthOfFieldEffectSceneStatus = (NSNumber *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"shallowDepthOfFieldEffectSceneStatus"];
    v4->_previewWhiteBalanceMetadataByPortType = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"previewWhiteBalanceMetadataByPortType"];
    v4->_streamingTime = [a3 decodeInt32ForKey:@"streamingTime"];
    v4->_intelligentDistortionCorrectionEnabled = [a3 decodeBoolForKey:@"intelligentDistortionCorrectionEnabled"];
    v4->_geometricDistortionCorrectionEnabled = [a3 decodeBoolForKey:@"geometricDistortionCorrectionEnabled"];
    v4->_intelligentDistortionCorrectionVersion = [a3 decodeInt32ForKey:@"intelligentDistortionCorrectionVersion"];
    v4->_deepZoomVersion = [a3 decodeInt32ForKey:@"deepZoomVersion"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_snrType forKey:@"metadataSNRType"];
  *(float *)&double v5 = self->_snr;
  [a3 encodeFloat:@"metadataSNR" forKey:v5];
  [a3 encodeInt32:self->_alsLuxLevel forKey:@"metadataALSLuxLevel"];
  *(float *)&double v6 = self->_alsRearLuxLevel;
  [a3 encodeFloat:@"metadataALSRearLuxLevel" forKey:v6];
  [a3 encodeInt32:self->_deviceType forKey:@"deviceType"];
  [a3 encodeInt32:self->_devicePosition forKey:@"devicePosition"];
  [a3 encodeObject:self->_slaveFocalLengths forKey:@"slaveFocalLengths"];
  [a3 encodeObject:self->_slaveLensFNumbers forKey:@"slaveLensFNumbers"];
  *(float *)&double v7 = self->_totalZoomFactor;
  [a3 encodeFloat:@"totalZoomFactor" forKey:v7];
  *(float *)&double v8 = self->_uiZoomFactor;
  [a3 encodeFloat:@"uiZoomFactor" forKey:v8];
  [a3 encodeObject:self->_exifFocalLengthMultiplierByPortType forKey:@"exifFocalLengthMultiplierByPortType"];
  *(float *)&double v9 = self->_exifFocalLengthOverride;
  [a3 encodeFloat:@"exifFocalLengthOverride" forKey:v9];
  [a3 encodeBool:self->_fastCapturePrioritizationEnabled forKey:@"fastCapturePrioritizationEnabled"];
  [a3 encodeInt32:self->_systemPressureLevel forKey:@"systemPressureLevel"];
  [a3 encodeInt32:self->_cameraControlsStatisticsMaster forKey:@"cameraControlsStatisticsMaster"];
  [a3 encodeInt32:self->_smartCamVersion forKey:@"smartCamVersion"];
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&v12.value = *(_OWORD *)(&self->_smartCamVersion + 1);
  v12.epoch = *(void *)&self->_smartCamTimestamp.flags;
  CFDictionaryRef v11 = CMTimeCopyAsDictionary(&v12, v10);
  [a3 encodeObject:v11 forKey:@"smartCamTimestamp"];

  [a3 encodeObject:self->_smartCamInferences forKey:@"smartCamInferences"];
  [a3 encodeBool:self->_isPreviewSmartCamInferences forKey:@"isPreviewSmartCamInferences"];
  [a3 encodeInt32:self->_semanticStyleSceneType forKey:@"semanticStyleSceneType"];
  [a3 encodeInt32:self->_zeroShutterLagFailureReason forKey:@"zeroShutterLagFailureReason"];
  [a3 encodeObject:self->_shallowDepthOfFieldEffectSceneStatus forKey:@"shallowDepthOfFieldEffectSceneStatus"];
  [a3 encodeObject:self->_previewWhiteBalanceMetadataByPortType forKey:@"previewWhiteBalanceMetadataByPortType"];
  [a3 encodeInt32:self->_streamingTime forKey:@"streamingTime"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureMetadata;
  [(BWStillImageCaptureMetadata *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v18) = 1;
    return v18;
  }
  uint64_t v47 = v6;
  uint64_t v48 = v5;
  uint64_t v49 = v3;
  uint64_t v50 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  int snrType = self->_snrType;
  if (snrType != [a3 snrType]) {
    goto LABEL_31;
  }
  float snr = self->_snr;
  [a3 snr];
  if (snr != v11) {
    goto LABEL_31;
  }
  int alsLuxLevel = self->_alsLuxLevel;
  if (alsLuxLevel != [a3 alsLuxLevel]) {
    goto LABEL_31;
  }
  float alsRearLuxLevel = self->_alsRearLuxLevel;
  [a3 alsRearLuxLevel];
  if (alsRearLuxLevel != v14) {
    goto LABEL_31;
  }
  int deviceType = self->_deviceType;
  if (deviceType != [a3 deviceType]) {
    goto LABEL_31;
  }
  int devicePosition = self->_devicePosition;
  if (devicePosition != [a3 devicePosition]) {
    goto LABEL_31;
  }
  slaveFocalLengths = self->_slaveFocalLengths;
  if (slaveFocalLengths == (NSArray *)[a3 slaveFocalLengths]
    || (int v18 = -[NSArray isEqual:](self->_slaveFocalLengths, "isEqual:", [a3 slaveFocalLengths])) != 0)
  {
    slaveLensFNumbers = self->_slaveLensFNumbers;
    if (slaveLensFNumbers == (NSArray *)[a3 slaveLensFNumbers]
      || (int v18 = -[NSArray isEqual:](self->_slaveLensFNumbers, "isEqual:", [a3 slaveLensFNumbers])) != 0)
    {
      float totalZoomFactor = self->_totalZoomFactor;
      [a3 totalZoomFactor];
      if (totalZoomFactor != v21) {
        goto LABEL_31;
      }
      float uiZoomFactor = self->_uiZoomFactor;
      [a3 uiZoomFactor];
      if (uiZoomFactor != v23) {
        goto LABEL_31;
      }
      exifFocalLengthMultiplierByPortType = self->_exifFocalLengthMultiplierByPortType;
      if (exifFocalLengthMultiplierByPortType == (NSDictionary *)[a3 exifFocalLengthMultiplierByPortType]|| (int v18 = -[NSDictionary isEqualToDictionary:](self->_exifFocalLengthMultiplierByPortType, "isEqualToDictionary:", objc_msgSend(a3, "exifFocalLengthMultiplierByPortType"))) != 0)
      {
        float exifFocalLengthOverride = self->_exifFocalLengthOverride;
        [a3 exifFocalLengthOverride];
        if (exifFocalLengthOverride != v26) {
          goto LABEL_31;
        }
        int fastCapturePrioritizationEnabled = self->_fastCapturePrioritizationEnabled;
        if (fastCapturePrioritizationEnabled != [a3 fastCapturePrioritizationEnabled]) {
          goto LABEL_31;
        }
        int intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
        if (intelligentDistortionCorrectionEnabled != [a3 intelligentDistortionCorrectionEnabled])goto LABEL_31; {
        int geometricDistortionCorrectionEnabled = self->_geometricDistortionCorrectionEnabled;
        }
        if (geometricDistortionCorrectionEnabled != [a3 geometricDistortionCorrectionEnabled])goto LABEL_31; {
        int intelligentDistortionCorrectionVersion = self->_intelligentDistortionCorrectionVersion;
        }
        if (intelligentDistortionCorrectionVersion != [a3 intelligentDistortionCorrectionVersion])goto LABEL_31; {
        int deepZoomVersion = self->_deepZoomVersion;
        }
        if (deepZoomVersion != [a3 deepZoomVersion]) {
          goto LABEL_31;
        }
        int systemPressureLevel = self->_systemPressureLevel;
        if (systemPressureLevel != [a3 systemPressureLevel]) {
          goto LABEL_31;
        }
        int cameraControlsStatisticsMaster = self->_cameraControlsStatisticsMaster;
        if (cameraControlsStatisticsMaster != [a3 cameraControlsStatisticsMaster]) {
          goto LABEL_31;
        }
        int smartCamVersion = self->_smartCamVersion;
        if (smartCamVersion != [a3 smartCamVersion]) {
          goto LABEL_31;
        }
        if (a3) {
          [a3 smartCamTimestamp];
        }
        else {
          memset(&time2, 0, sizeof(time2));
        }
        CMTime v45 = *(CMTime *)(&self->_smartCamVersion + 1);
        if (CMTimeCompare(&v45, &time2)) {
          goto LABEL_31;
        }
        smartCamInferences = self->_smartCamInferences;
        if (smartCamInferences == (NSDictionary *)[a3 smartCamInferences]
          || (int v18 = -[NSDictionary isEqualToDictionary:](self->_smartCamInferences, "isEqualToDictionary:", [a3 smartCamInferences])) != 0)
        {
          int isPreviewSmartCamInferences = self->_isPreviewSmartCamInferences;
          if (isPreviewSmartCamInferences == [a3 isPreviewSmartCamInferences])
          {
            int semanticStyleSceneType = self->_semanticStyleSceneType;
            if (semanticStyleSceneType == [a3 semanticStyleSceneType])
            {
              int zeroShutterLagFailureReason = self->_zeroShutterLagFailureReason;
              if (zeroShutterLagFailureReason == [a3 zeroShutterLagFailureReason])
              {
                BOOL v39 = self->_shallowDepthOfFieldEffectSceneStatus != 0;
                if (v39 != ([a3 shallowDepthOfFieldEffectSceneStatus] == 0))
                {
                  shallowDepthOfFieldEffectSceneStatus = self->_shallowDepthOfFieldEffectSceneStatus;
                  if (!shallowDepthOfFieldEffectSceneStatus
                    || (int v41 = [(NSNumber *)shallowDepthOfFieldEffectSceneStatus intValue],
                        v41 == objc_msgSend((id)objc_msgSend(a3, "shallowDepthOfFieldEffectSceneStatus"), "intValue")))
                  {
                    previewWhiteBalanceMetadataByPortType = self->_previewWhiteBalanceMetadataByPortType;
                    if (previewWhiteBalanceMetadataByPortType == (NSDictionary *)[a3 previewWhiteBalanceMetadataByPortType]|| (int v18 = -[NSDictionary isEqualToDictionary:](self->_previewWhiteBalanceMetadataByPortType, "isEqualToDictionary:", objc_msgSend(a3, "previewWhiteBalanceMetadataByPortType"))) != 0)
                    {
                      unsigned int streamingTime = self->_streamingTime;
                      LOBYTE(v18) = streamingTime == [a3 streamingTime];
                    }
                    return v18;
                  }
                }
              }
            }
          }
LABEL_31:
          LOBYTE(v18) = 0;
        }
      }
    }
  }
  return v18;
}

- (unint64_t)hash
{
  return 9;
}

- (NSString)semanticStyleSceneTypeAsSmartCameraSceneType
{
  switch(*((_DWORD *)self + 33))
  {
    case 0:
      v2 = (NSString **)MEMORY[0x1E4F54D58];
      goto LABEL_6;
    case 1:
      v2 = (NSString **)MEMORY[0x1E4F54D50];
      goto LABEL_6;
    case 2:
      v2 = (NSString **)MEMORY[0x1E4F54D70];
      goto LABEL_6;
    case 3:
      v2 = (NSString **)MEMORY[0x1E4F54D88];
LABEL_6:
      self = *v2;
      break;
    default:
      return self;
  }
  return self;
}

- (void)calculateSemanticStyleSceneType
{
  smartCamInferences = self->_smartCamInferences;
  if (!smartCamInferences) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"smartCamInferences cannot be nil when invoking this method" userInfo:0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  double v7 = __62__BWStillImageCaptureMetadata_calculateSemanticStyleSceneType__block_invoke;
  double v8 = &unk_1E5C248F0;
  double v9 = self;
  objc_msgSend(-[NSDictionary valueForKey:](smartCamInferences, "valueForKey:", *MEMORY[0x1E4F54D50]), "floatValue");
  if (v4 <= 0.77)
  {
    if (((float (*)(void *, void))v7)(v6, *MEMORY[0x1E4F54D88]) <= 0.88)
    {
      if (((float (*)(void *, void))v7)(v6, *MEMORY[0x1E4F54D58]) <= 0.4)
      {
        if (((float (*)(void *, void))v7)(v6, *MEMORY[0x1E4F54D70]) <= 0.58) {
          return;
        }
        int v5 = 2;
      }
      else
      {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 3;
    }
  }
  else
  {
    int v5 = 1;
  }
  self->_int semanticStyleSceneType = v5;
}

uint64_t __62__BWStillImageCaptureMetadata_calculateSemanticStyleSceneType__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 120) valueForKey:a2];
  return [v2 floatValue];
}

- (int)snrType
{
  return self->_snrType;
}

- (void)setSnrType:(int)a3
{
  self->_int snrType = a3;
}

- (float)snr
{
  return self->_snr;
}

- (void)setSnr:(float)a3
{
  self->_float snr = a3;
}

- (int)alsLuxLevel
{
  return self->_alsLuxLevel;
}

- (void)setAlsLuxLevel:(int)a3
{
  self->_int alsLuxLevel = a3;
}

- (float)alsRearLuxLevel
{
  return self->_alsRearLuxLevel;
}

- (void)setAlsRearLuxLevel:(float)a3
{
  self->_float alsRearLuxLevel = a3;
}

- (NSArray)slaveFocalLengths
{
  return self->_slaveFocalLengths;
}

- (void)setSlaveFocalLengths:(id)a3
{
}

- (NSArray)slaveLensFNumbers
{
  return self->_slaveLensFNumbers;
}

- (void)setSlaveLensFNumbers:(id)a3
{
}

- (float)totalZoomFactor
{
  return self->_totalZoomFactor;
}

- (void)setTotalZoomFactor:(float)a3
{
  self->_float totalZoomFactor = a3;
}

- (float)uiZoomFactor
{
  return self->_uiZoomFactor;
}

- (void)setUiZoomFactor:(float)a3
{
  self->_float uiZoomFactor = a3;
}

- (NSDictionary)exifFocalLengthMultiplierByPortType
{
  return self->_exifFocalLengthMultiplierByPortType;
}

- (void)setExifFocalLengthMultiplierByPortType:(id)a3
{
}

- (float)exifFocalLengthOverride
{
  return self->_exifFocalLengthOverride;
}

- (void)setExifFocalLengthOverride:(float)a3
{
  self->_float exifFocalLengthOverride = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_int fastCapturePrioritizationEnabled = a3;
}

- (int)systemPressureLevel
{
  return self->_systemPressureLevel;
}

- (void)setSystemPressureLevel:(int)a3
{
  self->_int systemPressureLevel = a3;
}

- (int)cameraControlsStatisticsMaster
{
  return self->_cameraControlsStatisticsMaster;
}

- (void)setCameraControlsStatisticsMaster:(int)a3
{
  self->_int cameraControlsStatisticsMaster = a3;
}

- (int)smartCamVersion
{
  return self->_smartCamVersion;
}

- (void)setSmartCamVersion:(int)a3
{
  self->_int smartCamVersion = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)smartCamTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
  retstr->var3 = *(void *)&self[4].var2;
  return self;
}

- (void)setSmartCamTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_smartCamTimestamp.flags = a3->var3;
  *(_OWORD *)(&self->_smartCamVersion + 1) = v3;
}

- (NSDictionary)smartCamInferences
{
  return self->_smartCamInferences;
}

- (void)setSmartCamInferences:(id)a3
{
}

- (BOOL)isPreviewSmartCamInferences
{
  return self->_isPreviewSmartCamInferences;
}

- (void)setIsPreviewSmartCamInferences:(BOOL)a3
{
  self->_int isPreviewSmartCamInferences = a3;
}

- (int)semanticStyleSceneType
{
  return self->_semanticStyleSceneType;
}

- (void)setSemanticStyleSceneType:(int)a3
{
  self->_int semanticStyleSceneType = a3;
}

- (int)zeroShutterLagFailureReason
{
  return self->_zeroShutterLagFailureReason;
}

- (void)setZeroShutterLagFailureReason:(int)a3
{
  self->_int zeroShutterLagFailureReason = a3;
}

- (NSNumber)shallowDepthOfFieldEffectSceneStatus
{
  return self->_shallowDepthOfFieldEffectSceneStatus;
}

- (void)setShallowDepthOfFieldEffectSceneStatus:(id)a3
{
}

- (NSDictionary)previewWhiteBalanceMetadataByPortType
{
  return self->_previewWhiteBalanceMetadataByPortType;
}

- (void)setPreviewWhiteBalanceMetadataByPortType:(id)a3
{
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_unsigned int streamingTime = a3;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_int intelligentDistortionCorrectionEnabled = a3;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_int geometricDistortionCorrectionEnabled = a3;
}

- (int)intelligentDistortionCorrectionVersion
{
  return self->_intelligentDistortionCorrectionVersion;
}

- (void)setIntelligentDistortionCorrectionVersion:(int)a3
{
  self->_int intelligentDistortionCorrectionVersion = a3;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_int deepZoomVersion = a3;
}

@end