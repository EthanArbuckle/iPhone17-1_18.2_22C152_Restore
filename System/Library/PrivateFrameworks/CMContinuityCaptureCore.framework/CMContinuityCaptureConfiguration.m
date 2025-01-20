@interface CMContinuityCaptureConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)stringForManualFramingDeviceType:(int64_t)a3;
- (BOOL)asyncStillCaptureEnabled;
- (BOOL)backgroundReplacementEnabled;
- (BOOL)centerStageEnabled;
- (BOOL)centerStageFieldOfViewRestrictedToWide;
- (BOOL)faceDetectionEnabled;
- (BOOL)humanBodyDetectionEnabled;
- (BOOL)humanFullBodyDetectionEnabled;
- (BOOL)isCenterStageForcefullyEnabled;
- (BOOL)portraitEffectEnabled;
- (BOOL)reactionEffectGesturesEnabled;
- (BOOL)reactionEffectsEnabled;
- (BOOL)studioLightingEnabled;
- (BOOL)suppressVideoEffects;
- (CMContinuityCaptureConfiguration)init;
- (CMContinuityCaptureConfiguration)initWithCoder:(id)a3;
- (CMContinuityCaptureStreamFormat)format;
- (NSDictionary)asyncStillCaptureConfigs;
- (NSDictionary)centerStageRectOfInterest;
- (NSUUID)sessionID;
- (__CVBuffer)backgroundReplacementPixelBuffer;
- (double)panningAngleX;
- (double)panningAngleY;
- (double)videoZoomFactor;
- (float)portraitEffectAperture;
- (float)studioLightingIntensity;
- (id)description;
- (int)maxPhotoQualityPrioritization;
- (int64_t)centerStageFramingMode;
- (int64_t)deskViewCameraMode;
- (int64_t)entity;
- (int64_t)forcefulCenterStageEnablementType;
- (int64_t)manualFramingDeviceType;
- (unint64_t)generationID;
- (unsigned)audioDeviceMode;
- (unsigned)maxFrameRate;
- (unsigned)minFrameRate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAsyncStillCaptureConfigs:(id)a3;
- (void)setAsyncStillCaptureEnabled:(BOOL)a3;
- (void)setAudioDeviceMode:(unsigned int)a3;
- (void)setBackgroundReplacementEnabled:(BOOL)a3;
- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3;
- (void)setCenterStageEnabled:(BOOL)a3;
- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3;
- (void)setCenterStageFramingMode:(int64_t)a3;
- (void)setCenterStageRectOfInterest:(id)a3;
- (void)setDeskViewCameraMode:(int64_t)a3;
- (void)setEntity:(int64_t)a3;
- (void)setFaceDetectionEnabled:(BOOL)a3;
- (void)setForcefulCenterStageEnablementType:(int64_t)a3;
- (void)setFormat:(id)a3;
- (void)setGenerationID:(unint64_t)a3;
- (void)setHumanBodyDetectionEnabled:(BOOL)a3;
- (void)setHumanFullBodyDetectionEnabled:(BOOL)a3;
- (void)setManualFramingDeviceType:(int64_t)a3;
- (void)setMaxFrameRate:(unsigned int)a3;
- (void)setMinFrameRate:(unsigned int)a3;
- (void)setPanningAngleX:(double)a3;
- (void)setPanningAngleY:(double)a3;
- (void)setPortraitEffectAperture:(float)a3;
- (void)setPortraitEffectEnabled:(BOOL)a3;
- (void)setReactionEffectGesturesEnabled:(BOOL)a3;
- (void)setReactionEffectsEnabled:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setStudioLightingEnabled:(BOOL)a3;
- (void)setStudioLightingIntensity:(float)a3;
- (void)setSuppressVideoEffects:(BOOL)a3;
- (void)setVideoZoomFactor:(double)a3;
@end

@implementation CMContinuityCaptureConfiguration

- (CMContinuityCaptureConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureConfiguration;
  result = [(CMContinuityCaptureConfiguration *)&v3 init];
  if (result) {
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    CFRelease(backgroundReplacementPixelBuffer);
    self->_backgroundReplacementPixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureConfiguration;
  [(CMContinuityCaptureConfiguration *)&v4 dealloc];
}

- (void)setCenterStageRectOfInterest:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  v6 = (NSDictionary *)[v5 copy];
  centerStageRectOfInterest = self->_centerStageRectOfInterest;
  self->_centerStageRectOfInterest = v6;

  CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  rect.origin = (CGPoint)*MEMORY[0x263F001A8];
  rect.size = v8;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v5, &rect);

  v9 = [NSString stringWithFormat:@"[x:%.2f,y:%.2f,w:%.2f,h:%.2f]", *(void *)&rect.origin.x, *(void *)&rect.origin.y, *(void *)&rect.size.width, *(void *)&rect.size.height];
  centerStageRectOfInterestStr = self->_centerStageRectOfInterestStr;
  self->_centerStageRectOfInterestStr = v9;

  os_unfair_lock_unlock(p_stateLock);
}

- (NSDictionary)centerStageRectOfInterest
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  objc_super v4 = (void *)[(NSDictionary *)self->_centerStageRectOfInterest copy];
  os_unfair_lock_unlock(p_stateLock);
  return (NSDictionary *)v4;
}

- (BOOL)isCenterStageForcefullyEnabled
{
  return [(CMContinuityCaptureConfiguration *)self forcefulCenterStageEnablementType] != 0;
}

- (CMContinuityCaptureConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureConfiguration;
  id v5 = [(CMContinuityCaptureConfiguration *)&v25 init];
  if (v5)
  {
    v5->_entity = [v4 decodeInt64ForKey:@"entity"];
    v5->_suppressVideoEffects = [v4 decodeBoolForKey:@"suppressVideoEffects"];
    v5->_portraitEffectEnabled = [v4 decodeBoolForKey:@"portraitEffectEnabled"];
    v5->_centerStageEnabled = [v4 decodeBoolForKey:@"centerStageEnabled"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"centerStageRectOfInterest"];
    centerStageRectOfInterest = v5->_centerStageRectOfInterest;
    v5->_centerStageRectOfInterest = (NSDictionary *)v7;

    v5->_centerStageFramingMode = [v4 decodeInt64ForKey:@"centerStageFramingMode"];
    v5->_forcefulCenterStageEnablementType = (int)[v4 decodeInt32ForKey:@"forcefulCenterStageEnablementType"];
    v5->_faceDetectionEnabled = [v4 decodeBoolForKey:@"faceDetectionEnabled"];
    v5->_humanBodyDetectionEnabled = [v4 decodeBoolForKey:@"humanBodyDetectionEnabled"];
    v5->_humanFullBodyDetectionEnabled = [v4 decodeBoolForKey:@"humanFullBodyDetectionEnabled"];
    v5->_studioLightingEnabled = [v4 decodeBoolForKey:@"studioLightingEnabled"];
    v5->_reactionEffectsEnabled = [v4 decodeBoolForKey:@"reactionEffectsEnabled"];
    v5->_backgroundReplacementEnabled = [v4 decodeBoolForKey:@"backgroundReplacementEnabled"];
    v5->_maxFrameRate = [v4 decodeInt32ForKey:@"frameRate"];
    v5->_minFrameRate = [v4 decodeInt32ForKey:@"minFrameRate"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
    format = v5->_format;
    v5->_format = (CMContinuityCaptureStreamFormat *)v9;

    [v4 decodeDoubleForKey:@"videoZoomFactor"];
    v5->_videoZoomFactor = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v12;

    v5->_asyncStillCaptureEnabled = [v4 decodeBoolForKey:@"asyncStillCaptureEnabled"];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v4 decodeDictionaryWithKeysOfClass:v14 objectsOfClass:objc_opt_class() forKey:@"asyncStillCaptureConfigs"];
    asyncStillCaptureConfigs = v5->_asyncStillCaptureConfigs;
    v5->_asyncStillCaptureConfigs = (NSDictionary *)v15;

    v5->_generationID = [v4 decodeInt64ForKey:@"generationID"];
    v5->_deskViewCameraMode = (int)[v4 decodeInt32ForKey:@"deskViewCameraMode"];
    if ([v4 containsValueForKey:@"audioDeviceMode"]) {
      int v17 = [v4 decodeInt32ForKey:@"audioDeviceMode"];
    }
    else {
      int v17 = 1684434036;
    }
    v5->_audioDeviceMode = v17;
    [v4 decodeFloatForKey:@"portraitEffectAperture"];
    v5->_portraitEffectAperture = v18;
    [v4 decodeFloatForKey:@"studioLightingIntensity"];
    v5->_studioLightingIntensity = v19;
    v5->_reactionEffectGesturesEnabled = [v4 decodeBoolForKey:@"reactionEffectGesturesEnabled"];
    v20 = (void *)[v4 decodeCVPixelBufferForKey:@"backgroundReplacementPixelBuffer" expectSourceMedia:1];
    if (v20) {
      v20 = (void *)CFRetain(v20);
    }
    v5->_backgroundReplacementPixelBuffer = (__CVBuffer *)v20;
    [v4 decodeFloatForKey:@"panningAngleX"];
    v5->_panningAngleX = v21;
    [v4 decodeFloatForKey:@"panningAngleY"];
    v5->_panningAngleY = v22;
    v5->_manualFramingDeviceType = (int)[v4 decodeInt32ForKey:@"manualFramingDeviceType"];
    v5->_centerStageFieldOfViewRestrictedToWide = [v4 decodeBoolForKey:@"centerStageFieldOfViewRestrictedToWide"];
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v23 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = (__CFString *)[(NSString *)self->_centerStageRectOfInterestStr copy];
  os_unfair_lock_unlock(p_stateLock);
  v38 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int64_t entity = self->_entity;
  v37 = (void *)v6;
  BOOL suppressVideoEffects = self->_suppressVideoEffects;
  BOOL portraitEffectEnabled = self->_portraitEffectEnabled;
  BOOL centerStageEnabled = self->_centerStageEnabled;
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = @"default";
  }
  v31 = v7;
  int64_t forcefulCenterStageEnablementType = self->_forcefulCenterStageEnablementType;
  BOOL faceDetectionEnabled = self->_faceDetectionEnabled;
  int64_t centerStageFramingMode = self->_centerStageFramingMode;
  BOOL humanBodyDetectionEnabled = self->_humanBodyDetectionEnabled;
  BOOL humanFullBodyDetectionEnabled = self->_humanFullBodyDetectionEnabled;
  BOOL asyncStillCaptureEnabled = self->_asyncStillCaptureEnabled;
  uint64_t v8 = [(CMContinuityCaptureConfiguration *)self maxPhotoQualityPrioritization];
  BOOL studioLightingEnabled = self->_studioLightingEnabled;
  uint64_t v25 = v8;
  BOOL backgroundReplacementEnabled = self->_backgroundReplacementEnabled;
  double videoZoomFactor = self->_videoZoomFactor;
  format = self->_format;
  int64_t deskViewCameraMode = self->_deskViewCameraMode;
  unint64_t generationID = self->_generationID;
  double portraitEffectAperture = self->_portraitEffectAperture;
  double studioLightingIntensity = self->_studioLightingIntensity;
  double panningAngleX = self->_panningAngleX;
  double panningAngleY = self->_panningAngleY;
  uint64_t maxFrameRate = self->_maxFrameRate;
  uint64_t minFrameRate = self->_minFrameRate;
  uint64_t audioDeviceMode = self->_audioDeviceMode;
  float v21 = +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:self->_manualFramingDeviceType];
  objc_msgSend(v38, "stringWithFormat:", @"%@: Entity:%d SVE:%d PE:%d CS:%d FCST:%lu CSRI:%@ CSFM:%ld FD:%d HBD:%d HFBD:%d AsyncStill:%d MQP:%d SL:%d BR:%d FR:%u MnFR:%u VideoZoomFactor:%.2f Format:%@ DVCM:%u ADM:%u GID:%llx PEA:%f SLI:%f PA[x:%f,y:%f] MFD:%@ FoVTW:%d [%p]", v37, entity, suppressVideoEffects, portraitEffectEnabled, centerStageEnabled, forcefulCenterStageEnablementType, v31, centerStageFramingMode, faceDetectionEnabled, humanBodyDetectionEnabled, humanFullBodyDetectionEnabled, asyncStillCaptureEnabled, v25, studioLightingEnabled, backgroundReplacementEnabled, maxFrameRate,
    minFrameRate,
    *(void *)&videoZoomFactor,
    format,
    deskViewCameraMode,
    audioDeviceMode,
    generationID,
    *(void *)&portraitEffectAperture,
    *(void *)&studioLightingIntensity,
    *(void *)&panningAngleX,
    *(void *)&panningAngleY,
    v21,
    self->_centerStageFieldOfViewRestrictedToWide,
  float v22 = self);

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL suppressVideoEffects = self->_suppressVideoEffects;
  id v9 = a3;
  [v9 encodeBool:suppressVideoEffects forKey:@"suppressVideoEffects"];
  [v9 encodeBool:self->_portraitEffectEnabled forKey:@"portraitEffectEnabled"];
  [v9 encodeBool:self->_centerStageEnabled forKey:@"centerStageEnabled"];
  [v9 encodeObject:self->_centerStageRectOfInterest forKey:@"centerStageRectOfInterest"];
  [v9 encodeInt64:self->_centerStageFramingMode forKey:@"centerStageFramingMode"];
  [v9 encodeInt32:LODWORD(self->_forcefulCenterStageEnablementType) forKey:@"forcefulCenterStageEnablementType"];
  [v9 encodeBool:self->_faceDetectionEnabled forKey:@"faceDetectionEnabled"];
  [v9 encodeBool:self->_humanBodyDetectionEnabled forKey:@"humanBodyDetectionEnabled"];
  [v9 encodeBool:self->_humanFullBodyDetectionEnabled forKey:@"humanFullBodyDetectionEnabled"];
  [v9 encodeBool:self->_studioLightingEnabled forKey:@"studioLightingEnabled"];
  [v9 encodeBool:self->_reactionEffectsEnabled forKey:@"reactionEffectsEnabled"];
  [v9 encodeBool:self->_backgroundReplacementEnabled forKey:@"backgroundReplacementEnabled"];
  [v9 encodeInt32:self->_maxFrameRate forKey:@"frameRate"];
  [v9 encodeInt32:self->_minFrameRate forKey:@"minFrameRate"];
  [v9 encodeDouble:@"videoZoomFactor" forKey:self->_videoZoomFactor];
  [v9 encodeObject:self->_format forKey:@"format"];
  [v9 encodeInt64:self->_entity forKey:@"entity"];
  [v9 encodeObject:self->_sessionID forKey:@"sessionID"];
  [v9 encodeBool:self->_asyncStillCaptureEnabled forKey:@"asyncStillCaptureEnabled"];
  [v9 encodeObject:self->_asyncStillCaptureConfigs forKey:@"asyncStillCaptureConfigs"];
  [v9 encodeInt32:LODWORD(self->_deskViewCameraMode) forKey:@"deskViewCameraMode"];
  [v9 encodeInt32:self->_audioDeviceMode forKey:@"audioDeviceMode"];
  [v9 encodeInt64:self->_generationID forKey:@"generationID"];
  *(float *)&double v5 = self->_portraitEffectAperture;
  [v9 encodeFloat:@"portraitEffectAperture" forKey:v5];
  *(float *)&double v6 = self->_studioLightingIntensity;
  [v9 encodeFloat:@"studioLightingIntensity" forKey:v6];
  [v9 encodeBool:self->_reactionEffectGesturesEnabled forKey:@"reactionEffectGesturesEnabled"];
  [v9 encodeCVPixelBuffer:self->_backgroundReplacementPixelBuffer forKey:@"backgroundReplacementPixelBuffer"];
  double panningAngleX = self->_panningAngleX;
  *(float *)&double panningAngleX = panningAngleX;
  [v9 encodeFloat:@"panningAngleX" forKey:panningAngleX];
  double panningAngleY = self->_panningAngleY;
  *(float *)&double panningAngleY = panningAngleY;
  [v9 encodeFloat:@"panningAngleY" forKey:panningAngleY];
  [v9 encodeInteger:self->_manualFramingDeviceType forKey:@"manualFramingDeviceType"];
  [v9 encodeBool:self->_centerStageFieldOfViewRestrictedToWide forKey:@"centerStageFieldOfViewRestrictedToWide"];
}

- (int)maxPhotoQualityPrioritization
{
  v2 = [(NSDictionary *)self->_asyncStillCaptureConfigs objectForKeyedSubscript:@"MaxPhotoQualityPrioritization"];
  int v3 = [v2 intValue];

  return v3;
}

+ (id)stringForManualFramingDeviceType:(int64_t)a3
{
  int v3 = @"Unknown Manual Framing device type";
  if (a3 == 2) {
    int v3 = @"ultra wide";
  }
  if (a3 == 1) {
    return @"back wide";
  }
  else {
    return v3;
  }
}

- (int64_t)entity
{
  return self->_entity;
}

- (void)setEntity:(int64_t)a3
{
  self->_int64_t entity = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_unint64_t generationID = a3;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  self->_BOOL suppressVideoEffects = a3;
}

- (BOOL)portraitEffectEnabled
{
  return self->_portraitEffectEnabled;
}

- (void)setPortraitEffectEnabled:(BOOL)a3
{
  self->_BOOL portraitEffectEnabled = a3;
}

- (BOOL)centerStageEnabled
{
  return self->_centerStageEnabled;
}

- (void)setCenterStageEnabled:(BOOL)a3
{
  self->_BOOL centerStageEnabled = a3;
}

- (int64_t)centerStageFramingMode
{
  return self->_centerStageFramingMode;
}

- (void)setCenterStageFramingMode:(int64_t)a3
{
  self->_int64_t centerStageFramingMode = a3;
}

- (int64_t)forcefulCenterStageEnablementType
{
  return self->_forcefulCenterStageEnablementType;
}

- (void)setForcefulCenterStageEnablementType:(int64_t)a3
{
  self->_int64_t forcefulCenterStageEnablementType = a3;
}

- (BOOL)faceDetectionEnabled
{
  return self->_faceDetectionEnabled;
}

- (void)setFaceDetectionEnabled:(BOOL)a3
{
  self->_BOOL faceDetectionEnabled = a3;
}

- (BOOL)humanBodyDetectionEnabled
{
  return self->_humanBodyDetectionEnabled;
}

- (void)setHumanBodyDetectionEnabled:(BOOL)a3
{
  self->_BOOL humanBodyDetectionEnabled = a3;
}

- (BOOL)humanFullBodyDetectionEnabled
{
  return self->_humanFullBodyDetectionEnabled;
}

- (void)setHumanFullBodyDetectionEnabled:(BOOL)a3
{
  self->_BOOL humanFullBodyDetectionEnabled = a3;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_BOOL studioLightingEnabled = a3;
}

- (float)portraitEffectAperture
{
  return self->_portraitEffectAperture;
}

- (void)setPortraitEffectAperture:(float)a3
{
  self->_double portraitEffectAperture = a3;
}

- (float)studioLightingIntensity
{
  return self->_studioLightingIntensity;
}

- (void)setStudioLightingIntensity:(float)a3
{
  self->_double studioLightingIntensity = a3;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (BOOL)reactionEffectGesturesEnabled
{
  return self->_reactionEffectGesturesEnabled;
}

- (void)setReactionEffectGesturesEnabled:(BOOL)a3
{
  self->_reactionEffectGesturesEnabled = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_BOOL backgroundReplacementEnabled = a3;
}

- (__CVBuffer)backgroundReplacementPixelBuffer
{
  return (__CVBuffer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
}

- (CMContinuityCaptureStreamFormat)format
{
  return (CMContinuityCaptureStreamFormat *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFormat:(id)a3
{
}

- (unsigned)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(unsigned int)a3
{
  self->_uint64_t maxFrameRate = a3;
}

- (unsigned)minFrameRate
{
  return self->_minFrameRate;
}

- (void)setMinFrameRate:(unsigned int)a3
{
  self->_uint64_t minFrameRate = a3;
}

- (double)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (void)setVideoZoomFactor:(double)a3
{
  self->_double videoZoomFactor = a3;
}

- (BOOL)asyncStillCaptureEnabled
{
  return self->_asyncStillCaptureEnabled;
}

- (void)setAsyncStillCaptureEnabled:(BOOL)a3
{
  self->_BOOL asyncStillCaptureEnabled = a3;
}

- (NSDictionary)asyncStillCaptureConfigs
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAsyncStillCaptureConfigs:(id)a3
{
}

- (int64_t)deskViewCameraMode
{
  return self->_deskViewCameraMode;
}

- (void)setDeskViewCameraMode:(int64_t)a3
{
  self->_int64_t deskViewCameraMode = a3;
}

- (unsigned)audioDeviceMode
{
  return self->_audioDeviceMode;
}

- (void)setAudioDeviceMode:(unsigned int)a3
{
  self->_uint64_t audioDeviceMode = a3;
}

- (double)panningAngleX
{
  return self->_panningAngleX;
}

- (void)setPanningAngleX:(double)a3
{
  self->_double panningAngleX = a3;
}

- (double)panningAngleY
{
  return self->_panningAngleY;
}

- (void)setPanningAngleY:(double)a3
{
  self->_double panningAngleY = a3;
}

- (BOOL)centerStageFieldOfViewRestrictedToWide
{
  return self->_centerStageFieldOfViewRestrictedToWide;
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  self->_centerStageFieldOfViewRestrictedToWide = a3;
}

- (int64_t)manualFramingDeviceType
{
  return self->_manualFramingDeviceType;
}

- (void)setManualFramingDeviceType:(int64_t)a3
{
  self->_manualFramingDeviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncStillCaptureConfigs, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_centerStageRectOfInterestStr, 0);
  objc_storeStrong((id *)&self->_centerStageRectOfInterest, 0);
}

@end