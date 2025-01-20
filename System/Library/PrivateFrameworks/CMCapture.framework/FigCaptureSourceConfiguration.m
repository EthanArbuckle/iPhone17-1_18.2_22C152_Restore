@interface FigCaptureSourceConfiguration
+ (id)stringForSourceDeviceType:(int)a3;
+ (id)stringForSourcePosition:(int)a3;
+ (id)stringForSourceType:(int)a3;
+ (int)sourceTypeForString:(id)a3;
- ($2825F4736939C4A6D3AD43837233062D)deskCamOutputDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride;
- (BOOL)applyMaxExposureDurationFrameworkOverrideWhenAvailable;
- (BOOL)backgroundBlurEnabled;
- (BOOL)backgroundReplacementEnabled;
- (BOOL)bravoShiftMitigationEnabled;
- (BOOL)cinematicFramingEnabled;
- (BOOL)clientExpectsCameraMountedInLandscapeOrientation;
- (BOOL)clientOSVersionSupportsDecoupledIO;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)deskCamEnabled;
- (BOOL)faceDrivenAEAFEnabledByDefault;
- (BOOL)gazeSelectionEnabled;
- (BOOL)geometricDistortionCorrectionEnabled;
- (BOOL)hasSetVideoZoomFactorOnCaptureSource;
- (BOOL)highlightRecoveryEnabled;
- (BOOL)isBackgroundBlurSupported;
- (BOOL)isBackgroundReplacementSupported;
- (BOOL)isCinematicFramingSupported;
- (BOOL)isDockedTrackingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStudioLightingSupported;
- (BOOL)lowLightVideoCaptureEnabled;
- (BOOL)manualCinematicFramingEnabled;
- (BOOL)nonDestructiveCropEnabled;
- (BOOL)reactionEffectsEnabled;
- (BOOL)reactionEffectsSupported;
- (BOOL)sensorHDREnabled;
- (BOOL)smartCameraEnabled;
- (BOOL)spatialOverCaptureEnabled;
- (BOOL)studioLightingEnabled;
- (BOOL)variableFrameRateVideoCaptureEnabled;
- (CGSize)normalizedNonDestructiveCropSize;
- (FigCaptureSourceConfiguration)initWithSource:(OpaqueFigCaptureSource *)a3;
- (FigCaptureSourceConfiguration)initWithSourceType:(int)a3;
- (FigCaptureSourceConfiguration)initWithXPCEncoding:(id)a3;
- (FigCaptureSourceDepthDataFormat)depthDataFormat;
- (FigCaptureSourceVideoFormat)requiredFormat;
- (NSArray)fallbackPrimaryConstituentDeviceTypes;
- (NSDictionary)faceDetectionConfiguration;
- (NSString)clientAudioClockDeviceUID;
- (NSString)description;
- (NSString)sourceID;
- (OpaqueFigCaptureSource)source;
- (double)manualFramingDefaultZoomFactor;
- (float)depthDataMaxFrameRate;
- (float)manualFramingPanningAngleX;
- (float)manualFramingPanningAngleY;
- (float)maxFrameRateClientOverride;
- (float)maxGainClientOverride;
- (float)requiredMaxFrameRate;
- (float)requiredMinFrameRate;
- (float)videoZoomFactor;
- (float)videoZoomRampAcceleration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int)cinematicFramingControlMode;
- (int)colorSpace;
- (int)faceDrivenAEAFMode;
- (int)imageControlMode;
- (int)sourceDeviceType;
- (int)sourcePosition;
- (int)sourceType;
- (int)videoStabilizationStrength;
- (uint64_t)_sourceAttributes;
- (uint64_t)_sourceToken;
- (void)dealloc;
- (void)setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:(BOOL)a3;
- (void)setBackgroundBlurEnabled:(BOOL)a3;
- (void)setBackgroundBlurSupported:(BOOL)a3;
- (void)setBackgroundReplacementEnabled:(BOOL)a3;
- (void)setBackgroundReplacementSupported:(BOOL)a3;
- (void)setCinematicFramingControlMode:(int)a3;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setCinematicFramingSupported:(BOOL)a3;
- (void)setClientAudioClockDeviceUID:(id)a3;
- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3;
- (void)setClientOSVersionSupportsDecoupledIO:(BOOL)a3;
- (void)setColorSpace:(int)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDepthDataFormat:(id)a3;
- (void)setDepthDataMaxFrameRate:(float)a3;
- (void)setDeskCamEnabled:(BOOL)a3;
- (void)setDeskCamOutputDimensions:(id)a3;
- (void)setDockedTrackingEnabled:(BOOL)a3;
- (void)setFaceDetectionConfiguration:(id)a3;
- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3;
- (void)setFaceDrivenAEAFMode:(int)a3;
- (void)setFallbackPrimaryConstituentDeviceTypes:(id)a3;
- (void)setGazeSelectionEnabled:(BOOL)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setHasSetVideoZoomFactorOnCaptureSource:(BOOL)a3;
- (void)setHighlightRecoveryEnabled:(BOOL)a3;
- (void)setImageControlMode:(int)a3;
- (void)setLowLightVideoCaptureEnabled:(BOOL)a3;
- (void)setManualCinematicFramingEnabled:(BOOL)a3;
- (void)setManualFramingDefaultZoomFactor:(double)a3;
- (void)setManualFramingPanningAngleX:(float)a3;
- (void)setManualFramingPanningAngleY:(float)a3;
- (void)setMaxExposureDurationClientOverride:(id *)a3;
- (void)setMaxFrameRateClientOverride:(float)a3;
- (void)setMaxGainClientOverride:(float)a3;
- (void)setNonDestructiveCropEnabled:(BOOL)a3;
- (void)setNormalizedNonDestructiveCropSize:(CGSize)a3;
- (void)setReactionEffectsEnabled:(BOOL)a3;
- (void)setReactionEffectsSupported:(BOOL)a3;
- (void)setRequiredFormat:(id)a3;
- (void)setRequiredMaxFrameRate:(float)a3;
- (void)setRequiredMinFrameRate:(float)a3;
- (void)setSensorHDREnabled:(BOOL)a3;
- (void)setSmartCameraEnabled:(BOOL)a3;
- (void)setSourceID:(id)a3;
- (void)setSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setStudioLightingEnabled:(BOOL)a3;
- (void)setStudioLightingSupported:(BOOL)a3;
- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3;
- (void)setVideoStabilizationStrength:(int)a3;
- (void)setVideoZoomFactor:(float)a3;
- (void)setVideoZoomRampAcceleration:(float)a3;
@end

@implementation FigCaptureSourceConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend((id)v4, "setSourceID:", -[FigCaptureSourceConfiguration sourceID](self, "sourceID"));
  v5 = [(FigCaptureSourceConfiguration *)self source];
  if (v5) {
    v5 = (OpaqueFigCaptureSource *)CFRetain(v5);
  }
  *(void *)(v4 + 16) = v5;
  *(_DWORD *)(v4 + 24) = [(FigCaptureSourceConfiguration *)self sourceType];
  if (self)
  {
    if ([(FigCaptureSourceConfiguration *)self sourceType] == 1)
    {
      objc_msgSend((id)v4, "setRequiredFormat:", -[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"));
      [(FigCaptureSourceConfiguration *)self requiredMaxFrameRate];
      objc_msgSend((id)v4, "setRequiredMaxFrameRate:");
      [(FigCaptureSourceConfiguration *)self requiredMinFrameRate];
      objc_msgSend((id)v4, "setRequiredMinFrameRate:");
      [(FigCaptureSourceConfiguration *)self maxFrameRateClientOverride];
      objc_msgSend((id)v4, "setMaxFrameRateClientOverride:");
      [(FigCaptureSourceConfiguration *)self maxGainClientOverride];
      objc_msgSend((id)v4, "setMaxGainClientOverride:");
      [(FigCaptureSourceConfiguration *)self videoZoomFactor];
      objc_msgSend((id)v4, "setVideoZoomFactor:");
      objc_msgSend((id)v4, "setFallbackPrimaryConstituentDeviceTypes:", -[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"));
      [(FigCaptureSourceConfiguration *)self videoZoomRampAcceleration];
      objc_msgSend((id)v4, "setVideoZoomRampAcceleration:");
      objc_msgSend((id)v4, "setImageControlMode:", -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode"));
      objc_msgSend((id)v4, "setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:", -[FigCaptureSourceConfiguration applyMaxExposureDurationFrameworkOverrideWhenAvailable](self, "applyMaxExposureDurationFrameworkOverrideWhenAvailable"));
      [(FigCaptureSourceConfiguration *)self maxExposureDurationClientOverride];
      long long v7 = v9;
      uint64_t v8 = v10;
      [(id)v4 setMaxExposureDurationClientOverride:&v7];
      objc_msgSend((id)v4, "setFaceDetectionConfiguration:", -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"));
      objc_msgSend((id)v4, "setSensorHDREnabled:", -[FigCaptureSourceConfiguration sensorHDREnabled](self, "sensorHDREnabled"));
      objc_msgSend((id)v4, "setHighlightRecoveryEnabled:", -[FigCaptureSourceConfiguration highlightRecoveryEnabled](self, "highlightRecoveryEnabled"));
      objc_msgSend((id)v4, "setColorSpace:", -[FigCaptureSourceConfiguration colorSpace](self, "colorSpace"));
      objc_msgSend((id)v4, "setDepthDataDeliveryEnabled:", -[FigCaptureSourceConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
      objc_msgSend((id)v4, "setDepthDataFormat:", -[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat"));
      [(FigCaptureSourceConfiguration *)self depthDataMaxFrameRate];
      objc_msgSend((id)v4, "setDepthDataMaxFrameRate:");
      objc_msgSend((id)v4, "setLowLightVideoCaptureEnabled:", -[FigCaptureSourceConfiguration lowLightVideoCaptureEnabled](self, "lowLightVideoCaptureEnabled"));
      objc_msgSend((id)v4, "setSpatialOverCaptureEnabled:", -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
      objc_msgSend((id)v4, "setNonDestructiveCropEnabled:", -[FigCaptureSourceConfiguration nonDestructiveCropEnabled](self, "nonDestructiveCropEnabled"));
      [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
      objc_msgSend((id)v4, "setNormalizedNonDestructiveCropSize:");
      objc_msgSend((id)v4, "setGeometricDistortionCorrectionEnabled:", -[FigCaptureSourceConfiguration geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled"));
      objc_msgSend((id)v4, "setVariableFrameRateVideoCaptureEnabled:", -[FigCaptureSourceConfiguration variableFrameRateVideoCaptureEnabled](self, "variableFrameRateVideoCaptureEnabled"));
      objc_msgSend((id)v4, "setVideoStabilizationStrength:", -[FigCaptureSourceConfiguration videoStabilizationStrength](self, "videoStabilizationStrength"));
      objc_msgSend((id)v4, "setCinematicFramingEnabled:", -[FigCaptureSourceConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
      objc_msgSend((id)v4, "setCinematicFramingSupported:", -[FigCaptureSourceConfiguration isCinematicFramingSupported](self, "isCinematicFramingSupported"));
      objc_msgSend((id)v4, "setCinematicFramingControlMode:", -[FigCaptureSourceConfiguration cinematicFramingControlMode](self, "cinematicFramingControlMode"));
      objc_msgSend((id)v4, "setBackgroundBlurSupported:", -[FigCaptureSourceConfiguration isBackgroundBlurSupported](self, "isBackgroundBlurSupported"));
      objc_msgSend((id)v4, "setBackgroundBlurEnabled:", -[FigCaptureSourceConfiguration backgroundBlurEnabled](self, "backgroundBlurEnabled"));
      objc_msgSend((id)v4, "setStudioLightingSupported:", -[FigCaptureSourceConfiguration isStudioLightingSupported](self, "isStudioLightingSupported"));
      objc_msgSend((id)v4, "setStudioLightingEnabled:", -[FigCaptureSourceConfiguration studioLightingEnabled](self, "studioLightingEnabled"));
      objc_msgSend((id)v4, "setReactionEffectsSupported:", -[FigCaptureSourceConfiguration reactionEffectsSupported](self, "reactionEffectsSupported"));
      objc_msgSend((id)v4, "setReactionEffectsEnabled:", -[FigCaptureSourceConfiguration reactionEffectsEnabled](self, "reactionEffectsEnabled"));
      objc_msgSend((id)v4, "setBackgroundReplacementSupported:", -[FigCaptureSourceConfiguration isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported"));
      objc_msgSend((id)v4, "setBackgroundReplacementEnabled:", -[FigCaptureSourceConfiguration backgroundReplacementEnabled](self, "backgroundReplacementEnabled"));
      objc_msgSend((id)v4, "setFaceDrivenAEAFMode:", -[FigCaptureSourceConfiguration faceDrivenAEAFMode](self, "faceDrivenAEAFMode"));
      objc_msgSend((id)v4, "setFaceDrivenAEAFEnabledByDefault:", -[FigCaptureSourceConfiguration faceDrivenAEAFEnabledByDefault](self, "faceDrivenAEAFEnabledByDefault"));
      objc_msgSend((id)v4, "setDeskCamEnabled:", -[FigCaptureSourceConfiguration deskCamEnabled](self, "deskCamEnabled"));
      objc_msgSend((id)v4, "setManualCinematicFramingEnabled:", -[FigCaptureSourceConfiguration manualCinematicFramingEnabled](self, "manualCinematicFramingEnabled"));
      [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleX];
      objc_msgSend((id)v4, "setManualFramingPanningAngleX:");
      [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleY];
      objc_msgSend((id)v4, "setManualFramingPanningAngleY:");
      [(FigCaptureSourceConfiguration *)self manualFramingDefaultZoomFactor];
      objc_msgSend((id)v4, "setManualFramingDefaultZoomFactor:");
      objc_msgSend((id)v4, "setGazeSelectionEnabled:", -[FigCaptureSourceConfiguration gazeSelectionEnabled](self, "gazeSelectionEnabled"));
      objc_msgSend((id)v4, "setDockedTrackingEnabled:", -[FigCaptureSourceConfiguration isDockedTrackingEnabled](self, "isDockedTrackingEnabled"));
      objc_msgSend((id)v4, "setClientExpectsCameraMountedInLandscapeOrientation:", -[FigCaptureSourceConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
    }
    else if ([(FigCaptureSourceConfiguration *)self sourceType] == 2)
    {
      objc_msgSend((id)v4, "setClientOSVersionSupportsDecoupledIO:", -[FigCaptureSourceConfiguration clientOSVersionSupportsDecoupledIO](self, "clientOSVersionSupportsDecoupledIO"));
      objc_msgSend((id)v4, "setClientAudioClockDeviceUID:", -[FigCaptureSourceConfiguration clientAudioClockDeviceUID](self, "clientAudioClockDeviceUID"));
    }
  }
  return (id)v4;
}

- (int)sourceType
{
  int result = self->_sourceType;
  if (!result)
  {
    int result = objc_msgSend((id)objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self), "objectForKeyedSubscript:", @"SourceType"), "intValue");
    self->_sourceType = result;
  }
  return result;
}

- (void)setRequiredMinFrameRate:(float)a3
{
  self->_requiredMinFrameRate = a3;
}

- (void)setRequiredMaxFrameRate:(float)a3
{
  self->_requiredMaxFrameRate = a3;
}

- (void)setNormalizedNonDestructiveCropSize:(CGSize)a3
{
  self->_normalizedNonDestructiveCropSize = a3;
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  self->_nonDestructiveCropEnabled = a3;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (void)setSourceID:(id)a3
{
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (void)setVideoZoomFactor:(float)a3
{
  self->_videoZoomFactor = a3;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_spatialOverCaptureEnabled = a3;
}

- (void)setFallbackPrimaryConstituentDeviceTypes:(id)a3
{
}

- (void)setFaceDrivenAEAFMode:(int)a3
{
  self->_faceDrivenAEAFMode = a3;
}

- (void)setFaceDetectionConfiguration:(id)a3
{
}

- (void)setRequiredFormat:(id)a3
{
}

- (void)setMaxFrameRateClientOverride:(float)a3
{
  self->_maxFrameRateClientOverride = a3;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (void)setDepthDataFormat:(id)a3
{
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setVideoZoomRampAcceleration:(float)a3
{
  self->_videoZoomRampAcceleration = a3;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  self->_variableFrameRateVideoCaptureEnabled = a3;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  self->_studioLightingSupported = a3;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (void)setMaxExposureDurationClientOverride:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maxExposureDurationClientOverride.epoch = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationClientOverride.value = v3;
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  self->_lowLightVideoCaptureEnabled = a3;
}

- (void)setHighlightRecoveryEnabled:(BOOL)a3
{
  self->_highlightRecoveryEnabled = a3;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  self->_gazeSelectionEnabled = a3;
}

- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3
{
  self->_faceDrivenAEAFEnabledByDefault = a3;
}

- (void)setDepthDataMaxFrameRate:(float)a3
{
  self->_depthDataMaxFrameRate = a3;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (void)setCinematicFramingSupported:(BOOL)a3
{
  self->_cinematicFramingSupported = a3;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  self->_backgroundReplacementSupported = a3;
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  self->_backgroundBlurSupported = a3;
}

- (void)setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:(BOOL)a3
{
  self->_applyMaxExposureDurationFrameworkOverrideWhenAvailable = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v95 = v6;
    uint64_t v96 = v5;
    uint64_t v97 = v3;
    uint64_t v98 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_71;
    }
    long long v9 = [(FigCaptureSourceConfiguration *)self sourceID];
    if (v9 == (NSString *)[a3 sourceID]
      || (int v10 = -[NSString isEqual:](-[FigCaptureSourceConfiguration sourceID](self, "sourceID"), "isEqual:", [a3 sourceID])) != 0)
    {
      if (!self->_source
        || ((v11 = (void *)[(id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self) objectForKeyedSubscript:@"UniqueID"], !a3)? (v12 = 0): (v12 = objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)a3), "objectForKeyedSubscript:", @"UniqueID")), (int v10 = objc_msgSend(v11, "isEqual:", v12)) != 0))
      {
        int v13 = -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)self);
        if (v13 != -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)a3)) {
          goto LABEL_71;
        }
        if ([(FigCaptureSourceConfiguration *)self sourceType] != 1) {
          goto LABEL_66;
        }
        if (!a3)
        {
          [(FigCaptureSourceConfiguration *)self sourceType];
LABEL_79:
          LOBYTE(v10) = 1;
          return v10;
        }
        if ([a3 sourceType] != 1)
        {
LABEL_66:
          int v80 = [(FigCaptureSourceConfiguration *)self sourceType];
          if (!a3) {
            goto LABEL_79;
          }
          if (v80 != 2) {
            goto LABEL_79;
          }
          if ([a3 sourceType] != 2) {
            goto LABEL_79;
          }
          int v81 = [(FigCaptureSourceConfiguration *)self clientOSVersionSupportsDecoupledIO];
          if (v81 == [a3 clientOSVersionSupportsDecoupledIO])
          {
            v82 = [(FigCaptureSourceConfiguration *)self clientAudioClockDeviceUID];
            if (v82 == (NSString *)[a3 clientAudioClockDeviceUID]) {
              goto LABEL_79;
            }
          }
          goto LABEL_71;
        }
        v14 = [(FigCaptureSourceConfiguration *)self requiredFormat];
        if (v14 == (FigCaptureSourceVideoFormat *)[a3 requiredFormat]
          || (int v10 = -[FigCaptureSourceFormat isEqual:](-[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"), "isEqual:", [a3 requiredFormat])) != 0)
        {
          [(FigCaptureSourceConfiguration *)self requiredMaxFrameRate];
          float v16 = v15;
          [a3 requiredMaxFrameRate];
          if (v16 != v17) {
            goto LABEL_71;
          }
          [(FigCaptureSourceConfiguration *)self requiredMinFrameRate];
          float v19 = v18;
          [a3 requiredMinFrameRate];
          if (v19 != v20) {
            goto LABEL_71;
          }
          [(FigCaptureSourceConfiguration *)self maxFrameRateClientOverride];
          float v22 = v21;
          [a3 maxFrameRateClientOverride];
          if (v22 != v23) {
            goto LABEL_71;
          }
          [(FigCaptureSourceConfiguration *)self maxGainClientOverride];
          float v25 = v24;
          [a3 maxGainClientOverride];
          if (v25 != v26) {
            goto LABEL_71;
          }
          [(FigCaptureSourceConfiguration *)self videoZoomFactor];
          float v28 = v27;
          [a3 videoZoomFactor];
          if (v28 != v29) {
            goto LABEL_71;
          }
          if (!-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes")&& ![a3 fallbackPrimaryConstituentDeviceTypes]|| (int v10 = -[NSArray isEqualToArray:](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "isEqualToArray:", objc_msgSend(a3, "fallbackPrimaryConstituentDeviceTypes"))) != 0)
          {
            [(FigCaptureSourceConfiguration *)self videoZoomRampAcceleration];
            float v31 = v30;
            [a3 videoZoomRampAcceleration];
            if (v31 != v32) {
              goto LABEL_71;
            }
            int v33 = [(FigCaptureSourceConfiguration *)self imageControlMode];
            if (v33 != [a3 imageControlMode]) {
              goto LABEL_71;
            }
            int v34 = [(FigCaptureSourceConfiguration *)self applyMaxExposureDurationFrameworkOverrideWhenAvailable];
            if (v34 != [a3 applyMaxExposureDurationFrameworkOverrideWhenAvailable]) {
              goto LABEL_71;
            }
            [(FigCaptureSourceConfiguration *)self maxExposureDurationClientOverride];
            [a3 maxExposureDurationClientOverride];
            if (CMTimeCompare(&time1, &v93)) {
              goto LABEL_71;
            }
            v35 = [(FigCaptureSourceConfiguration *)self faceDetectionConfiguration];
            if (v35 != (NSDictionary *)[a3 faceDetectionConfiguration]
              && (-[NSDictionary isEqual:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "isEqual:", [a3 faceDetectionConfiguration]) & 1) == 0)
            {
              v83 = [(FigCaptureSourceConfiguration *)self faceDetectionConfiguration];
              uint64_t v84 = *MEMORY[0x1E4F53948];
              int v85 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", *MEMORY[0x1E4F53948]), "BOOLValue");
              if (v85 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v84), "BOOLValue"))goto LABEL_71; {
              v86 = [(FigCaptureSourceConfiguration *)self faceDetectionConfiguration];
              }
              uint64_t v87 = *MEMORY[0x1E4F53940];
              int v88 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v86, "objectForKeyedSubscript:", *MEMORY[0x1E4F53940]), "BOOLValue");
              if (v88 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v87), "BOOLValue"))goto LABEL_71; {
              v89 = [(FigCaptureSourceConfiguration *)self faceDetectionConfiguration];
              }
              uint64_t v90 = *MEMORY[0x1E4F53958];
              int v91 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v89, "objectForKeyedSubscript:", *MEMORY[0x1E4F53958]), "BOOLValue");
              if (v91 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v90), "BOOLValue"))goto LABEL_71; {
            }
              }
            int v36 = [(FigCaptureSourceConfiguration *)self sensorHDREnabled];
            if (v36 != [a3 sensorHDREnabled]) {
              goto LABEL_71;
            }
            int v37 = [(FigCaptureSourceConfiguration *)self highlightRecoveryEnabled];
            if (v37 != [a3 highlightRecoveryEnabled]) {
              goto LABEL_71;
            }
            int v38 = [(FigCaptureSourceConfiguration *)self colorSpace];
            if (v38 != [a3 colorSpace]) {
              goto LABEL_71;
            }
            int v39 = [(FigCaptureSourceConfiguration *)self depthDataDeliveryEnabled];
            if (v39 != [a3 depthDataDeliveryEnabled]) {
              goto LABEL_71;
            }
            v40 = [(FigCaptureSourceConfiguration *)self depthDataFormat];
            if (v40 == (FigCaptureSourceDepthDataFormat *)[a3 depthDataFormat]
              || (int v10 = -[FigCaptureSourceFormat isEqual:](-[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat"), "isEqual:", [a3 depthDataFormat])) != 0)
            {
              [(FigCaptureSourceConfiguration *)self depthDataMaxFrameRate];
              float v42 = v41;
              [a3 depthDataMaxFrameRate];
              if (v42 == v43)
              {
                int v44 = [(FigCaptureSourceConfiguration *)self lowLightVideoCaptureEnabled];
                if (v44 == [a3 lowLightVideoCaptureEnabled])
                {
                  int v45 = [(FigCaptureSourceConfiguration *)self spatialOverCaptureEnabled];
                  if (v45 == [a3 spatialOverCaptureEnabled])
                  {
                    int v46 = [(FigCaptureSourceConfiguration *)self nonDestructiveCropEnabled];
                    if (v46 == [a3 nonDestructiveCropEnabled])
                    {
                      [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
                      double v48 = v47;
                      [a3 normalizedNonDestructiveCropSize];
                      if (v48 == v49)
                      {
                        [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
                        double v51 = v50;
                        [a3 normalizedNonDestructiveCropSize];
                        if (v51 == v52)
                        {
                          int v53 = [(FigCaptureSourceConfiguration *)self geometricDistortionCorrectionEnabled];
                          if (v53 == [a3 geometricDistortionCorrectionEnabled])
                          {
                            int v54 = [(FigCaptureSourceConfiguration *)self variableFrameRateVideoCaptureEnabled];
                            if (v54 == [a3 variableFrameRateVideoCaptureEnabled])
                            {
                              int v55 = [(FigCaptureSourceConfiguration *)self videoStabilizationStrength];
                              if (v55 == [a3 videoStabilizationStrength])
                              {
                                int v56 = [(FigCaptureSourceConfiguration *)self cinematicFramingEnabled];
                                if (v56 == [a3 cinematicFramingEnabled])
                                {
                                  int v57 = [(FigCaptureSourceConfiguration *)self isCinematicFramingSupported];
                                  if (v57 == [a3 isCinematicFramingSupported])
                                  {
                                    int v58 = [(FigCaptureSourceConfiguration *)self cinematicFramingControlMode];
                                    if (v58 == [a3 cinematicFramingControlMode])
                                    {
                                      int v59 = [(FigCaptureSourceConfiguration *)self isBackgroundBlurSupported];
                                      if (v59 == [a3 isBackgroundBlurSupported])
                                      {
                                        int v60 = [(FigCaptureSourceConfiguration *)self backgroundBlurEnabled];
                                        if (v60 == [a3 backgroundBlurEnabled])
                                        {
                                          int v61 = [(FigCaptureSourceConfiguration *)self isStudioLightingSupported];
                                          if (v61 == [a3 isStudioLightingSupported])
                                          {
                                            int v62 = [(FigCaptureSourceConfiguration *)self studioLightingEnabled];
                                            if (v62 == [a3 studioLightingEnabled])
                                            {
                                              int v63 = [(FigCaptureSourceConfiguration *)self reactionEffectsSupported];
                                              if (v63 == [a3 reactionEffectsSupported])
                                              {
                                                int v64 = [(FigCaptureSourceConfiguration *)self reactionEffectsEnabled];
                                                if (v64 == [a3 reactionEffectsEnabled])
                                                {
                                                  int v65 = [(FigCaptureSourceConfiguration *)self isBackgroundReplacementSupported];
                                                  if (v65 == [a3 isBackgroundReplacementSupported])
                                                  {
                                                    int v66 = [(FigCaptureSourceConfiguration *)self backgroundReplacementEnabled];
                                                    if (v66 == [a3 backgroundReplacementEnabled])
                                                    {
                                                      int v67 = [(FigCaptureSourceConfiguration *)self faceDrivenAEAFMode];
                                                      if (v67 == [a3 faceDrivenAEAFMode])
                                                      {
                                                        int v68 = [(FigCaptureSourceConfiguration *)self faceDrivenAEAFEnabledByDefault];
                                                        if (v68 == [a3 faceDrivenAEAFEnabledByDefault])
                                                        {
                                                          int v69 = [(FigCaptureSourceConfiguration *)self deskCamEnabled];
                                                          if (v69 == [a3 deskCamEnabled])
                                                          {
                                                            int v70 = [(FigCaptureSourceConfiguration *)self manualCinematicFramingEnabled];
                                                            if (v70 == [a3 manualCinematicFramingEnabled])
                                                            {
                                                              [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleX];
                                                              float v72 = v71;
                                                              [a3 manualFramingPanningAngleX];
                                                              if (v72 == v73)
                                                              {
                                                                [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleY];
                                                                float v75 = v74;
                                                                [a3 manualFramingPanningAngleY];
                                                                if (v75 == v76)
                                                                {
                                                                  int v77 = [(FigCaptureSourceConfiguration *)self gazeSelectionEnabled];
                                                                  if (v77 == [a3 gazeSelectionEnabled])
                                                                  {
                                                                    int v78 = [(FigCaptureSourceConfiguration *)self isDockedTrackingEnabled];
                                                                    if (v78 == [a3 isDockedTrackingEnabled])
                                                                    {
                                                                      int v79 = [(FigCaptureSourceConfiguration *)self clientExpectsCameraMountedInLandscapeOrientation];
                                                                      if (v79 == [a3 clientExpectsCameraMountedInLandscapeOrientation])goto LABEL_79; {
                                                                    }
                                                                      }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_71:
              LOBYTE(v10) = 0;
            }
          }
        }
      }
    }
  }
  return v10;
}

- (FigCaptureSourceVideoFormat)requiredFormat
{
  return self->_requiredFormat;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (int)imageControlMode
{
  return self->_imageControlMode;
}

- (BOOL)manualCinematicFramingEnabled
{
  return self->_manualCinematicFramingEnabled;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (float)requiredMaxFrameRate
{
  return self->_requiredMaxFrameRate;
}

- (CGSize)normalizedNonDestructiveCropSize
{
  double width = self->_normalizedNonDestructiveCropSize.width;
  double height = self->_normalizedNonDestructiveCropSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)requiredMinFrameRate
{
  return self->_requiredMinFrameRate;
}

- (BOOL)spatialOverCaptureEnabled
{
  return self->_spatialOverCaptureEnabled;
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (FigCaptureSourceDepthDataFormat)depthDataFormat
{
  return self->_depthDataFormat;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (float)maxFrameRateClientOverride
{
  return self->_maxFrameRateClientOverride;
}

- (float)maxGainClientOverride
{
  return self->_maxGainClientOverride;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (BOOL)isStudioLightingSupported
{
  return self->_studioLightingSupported;
}

- (BOOL)isBackgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (BOOL)isBackgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (BOOL)deskCamEnabled
{
  return self->_deskCamEnabled;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (BOOL)variableFrameRateVideoCaptureEnabled
{
  return self->_variableFrameRateVideoCaptureEnabled;
}

- (BOOL)highlightRecoveryEnabled
{
  return self->_highlightRecoveryEnabled;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)sensorHDREnabled
{
  return self->_sensorHDREnabled;
}

- (BOOL)lowLightVideoCaptureEnabled
{
  return self->_lowLightVideoCaptureEnabled;
}

- (BOOL)applyMaxExposureDurationFrameworkOverrideWhenAvailable
{
  return self->_applyMaxExposureDurationFrameworkOverrideWhenAvailable;
}

- (BOOL)nonDestructiveCropEnabled
{
  return self->_nonDestructiveCropEnabled;
}

- (BOOL)gazeSelectionEnabled
{
  return self->_gazeSelectionEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (BOOL)isCinematicFramingSupported
{
  return self->_cinematicFramingSupported;
}

- (int)faceDrivenAEAFMode
{
  return self->_faceDrivenAEAFMode;
}

- (BOOL)faceDrivenAEAFEnabledByDefault
{
  return self->_faceDrivenAEAFEnabledByDefault;
}

- (int)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (float)depthDataMaxFrameRate
{
  return self->_depthDataMaxFrameRate;
}

- (float)videoZoomRampAcceleration
{
  return self->_videoZoomRampAcceleration;
}

- (float)manualFramingPanningAngleY
{
  return self->_manualFramingPanningAngleY;
}

- (float)manualFramingPanningAngleX
{
  return self->_manualFramingPanningAngleX;
}

- (BOOL)isDockedTrackingEnabled
{
  return self->_dockedTrackingEnabled;
}

- (uint64_t)_sourceToken
{
  if (!a1) {
    return 0;
  }
  id v8 = 0;
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1
    && ((v2 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0 ? (uint64_t v3 = 0) : (uint64_t v3 = v2),
        (uint64_t v4 = *(void (**)(uint64_t, __CFString *, void, id *))(v3 + 48)) != 0))
  {
    v4(v1, @"SourceToken", *MEMORY[0x1E4F1CF80], &v8);
    id v5 = v8;
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [v5 intValue];

  return v6;
}

- (NSString)description
{
  if (self && [(FigCaptureSourceConfiguration *)self sourceType] == 2) {
    return (NSString *)[MEMORY[0x1E4F28E78] stringWithFormat:@"SRC:%@", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureSourceConfiguration sourceDeviceType](self, "sourceDeviceType"))];
  }
  uint64_t v4 = [(FigCaptureSourceConfiguration *)self requiredFormat];
  id v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"SRC:%@ %@ %@/%dx%d", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureSourceConfiguration sourceDeviceType](self, "sourceDeviceType")), +[FigCaptureSourceConfiguration stringForSourcePosition:](FigCaptureSourceConfiguration, "stringForSourcePosition:", -[FigCaptureSourceConfiguration sourcePosition](self, "sourcePosition")), BWStringForOSType(-[FigCaptureSourceFormat format](v4, "format")), -[FigCaptureSourceFormat dimensions](v4, "dimensions"), (unint64_t)-[FigCaptureSourceFormat dimensions](v4, "dimensions") >> 32];
  [(FigCaptureSourceConfiguration *)self requiredMinFrameRate];
  double v7 = v6;
  [(FigCaptureSourceConfiguration *)self requiredMaxFrameRate];
  double v9 = v8;
  [(FigCaptureSourceConfiguration *)self maxFrameRateClientOverride];
  double v11 = v10;
  [(FigCaptureSourceConfiguration *)self videoZoomFactor];
  [v5 appendFormat:@", %.0f-%.0f(max:%.0f), Z:%.2f, ICM:%d", *(void *)&v7, *(void *)&v9, *(void *)&v11, v12, -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode")];
  if ([(NSArray *)[(FigCaptureSourceConfiguration *)self fallbackPrimaryConstituentDeviceTypes] count])
  {
    [v5 appendFormat:@", FallbackDeviceTypes:"];
    if ([(NSArray *)[(FigCaptureSourceConfiguration *)self fallbackPrimaryConstituentDeviceTypes] count])
    {
      unint64_t v13 = 0;
      do
      {
        if (v13) {
          v14 = ", ";
        }
        else {
          v14 = " ";
        }
        objc_msgSend(v5, "appendFormat:", @"%s%d", v14, objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "objectAtIndexedSubscript:", v13++), "intValue"));
      }
      while ([(NSArray *)[(FigCaptureSourceConfiguration *)self fallbackPrimaryConstituentDeviceTypes] count] > v13);
    }
  }
  [(FigCaptureSourceConfiguration *)self maxGainClientOverride];
  if (v15 > 0.0)
  {
    [(FigCaptureSourceConfiguration *)self maxGainClientOverride];
    [v5 appendFormat:@", MaxGain: %.0f", v16];
  }
  if (self->_faceDetectionConfiguration) {
    objc_msgSend(v5, "appendFormat:", @", (FD E:%d B:%d S:%d)", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:", @"EyeDetectionEnabled"), "BOOLValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:", @"BlinkDetectionEnabled"), "BOOLValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:",
  }
                        @"SmileDetectionEnabled"),
                      "BOOLValue"));
  if (self->_sensorHDREnabled) {
    [v5 appendString:@", QHDR/SHDR:1"];
  }
  if (self->_highlightRecoveryEnabled) {
    [v5 appendString:@", HR:1"];
  }
  if (self->_colorSpace) {
    [v5 appendFormat:@", ColorSpace:%d", self->_colorSpace];
  }
  if (self->_depthDataDeliveryEnabled) {
    [v5 appendFormat:@", Depth:1 %@/%dx%d", BWStringForOSType(-[FigCaptureSourceFormat format](self->_depthDataFormat, "format")), -[FigCaptureSourceFormat dimensions](self->_depthDataFormat, "dimensions"), (unint64_t)-[FigCaptureSourceFormat dimensions](self->_depthDataFormat, "dimensions") >> 32];
  }
  if (self->_lowLightVideoCaptureEnabled) {
    [v5 appendString:@", LowLight:1"];
  }
  BOOL nonDestructiveCropEnabled = self->_nonDestructiveCropEnabled;
  if (!self->_spatialOverCaptureEnabled)
  {
    if (!self->_nonDestructiveCropEnabled) {
      goto LABEL_29;
    }
    BOOL nonDestructiveCropEnabled = 1;
  }
  [v5 appendFormat:@", SpatialOverCapture:%d, NonDestructiveCropEnabled:%d", self->_spatialOverCaptureEnabled, nonDestructiveCropEnabled];
LABEL_29:
  double height = self->_normalizedNonDestructiveCropSize.height;
  if (self->_normalizedNonDestructiveCropSize.width > 0.0 || height > 0.0) {
    [v5 appendFormat:@", NormalizedNonDestructiveCropSize:%fx%f", *(void *)&self->_normalizedNonDestructiveCropSize.width, *(void *)&height];
  }
  if (self->_geometricDistortionCorrectionEnabled) {
    [v5 appendString:@", GDC:1"];
  }
  if (self->_variableFrameRateVideoCaptureEnabled) {
    [v5 appendString:@", VFR:1"];
  }
  signed int videoStabilizationStrength = self->_videoStabilizationStrength;
  if (videoStabilizationStrength >= 2) {
    [v5 appendFormat:@", StabilizationStrength:%@", FigCaptureVideoStabilizationStrengthToString(videoStabilizationStrength)];
  }
  if (self->_cinematicFramingEnabled) {
    [v5 appendFormat:@", CinematicFraming:1(CtrlMode:%d)", self->_cinematicFramingControlMode];
  }
  if (self->_backgroundBlurEnabled) {
    [v5 appendString:@", BackgroundBlur:1"];
  }
  if (self->_deskCamEnabled) {
    [v5 appendString:@", DeskCam:1"];
  }
  if (self->_studioLightingEnabled) {
    [v5 appendString:@", studioLighting:1"];
  }
  if (self->_reactionEffectsEnabled) {
    [v5 appendString:@", reactionEffects:1"];
  }
  if (self->_backgroundReplacementEnabled) {
    [v5 appendString:@", backgroundReplacement:1"];
  }
  if (self->_manualCinematicFramingEnabled)
  {
    [v5 appendString:@", MF:1"];
    [v5 appendFormat:@", PAngles x:%f,y:%f, DZF:%.3f", self->_manualFramingPanningAngleX, self->_manualFramingPanningAngleY, *(void *)&self->_manualFramingDefaultZoomFactor];
  }
  if (self->_dockedTrackingEnabled) {
    [v5 appendString:@", DTE:1"];
  }
  if (self->_gazeSelectionEnabled) {
    [v5 appendFormat:@", GS: %d", 1];
  }
  [v5 appendFormat:@", FaceDrivenAEAFMode:%d", self->_faceDrivenAEAFMode];
  [v5 appendFormat:@", FaceDrivenAEAFEnabledByDefault:%d", self->_faceDrivenAEAFEnabledByDefault];
  if (self->_clientExpectsCameraMountedInLandscapeOrientation) {
    [v5 appendFormat:@", cameraMountedInLandscape: YES"];
  }
  return (NSString *)v5;
}

- (NSArray)fallbackPrimaryConstituentDeviceTypes
{
  return self->_fallbackPrimaryConstituentDeviceTypes;
}

- (NSDictionary)faceDetectionConfiguration
{
  return self->_faceDetectionConfiguration;
}

- (int)sourcePosition
{
  uint64_t v2 = (void *)[(id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self) objectForKeyedSubscript:@"Position"];
  return [v2 intValue];
}

+ (id)stringForSourceDeviceType:(int)a3
{
  return BWStringFromCaptureDeviceType(a3);
}

+ (id)stringForSourcePosition:(int)a3
{
  if (a3 > 2) {
    return &stru_1EFA403E0;
  }
  else {
    return *(&off_1E5C295C8 + a3);
  }
}

- (double)manualFramingDefaultZoomFactor
{
  return self->_manualFramingDefaultZoomFactor;
}

- (void)setSensorHDREnabled:(BOOL)a3
{
  self->_sensorHDREnabled = a3;
}

- (void)setMaxGainClientOverride:(float)a3
{
  self->_maxGainClientOverride = a3;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  self->_manualFramingPanningAngleY = a3;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  self->_manualFramingPanningAngleX = a3;
}

- (void)setManualFramingDefaultZoomFactor:(double)a3
{
  self->_manualFramingDefaultZoomFactor = a3;
}

- (void)setManualCinematicFramingEnabled:(BOOL)a3
{
  self->_manualCinematicFramingEnabled = a3;
}

- (void)setImageControlMode:(int)a3
{
  self->_imageControlMode = a3;
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  self->_dockedTrackingEnabled = a3;
}

- (void)setDeskCamEnabled:(BOOL)a3
{
  self->_deskCamEnabled = a3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (void)setCinematicFramingControlMode:(int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (OpaqueFigCaptureSource)source
{
  return self->_source;
}

- (BOOL)clientOSVersionSupportsDecoupledIO
{
  return self->_clientOSVersionSupportsDecoupledIO;
}

- (NSString)clientAudioClockDeviceUID
{
  return self->_clientAudioClockDeviceUID;
}

- (void)setClientOSVersionSupportsDecoupledIO:(BOOL)a3
{
  self->_clientOSVersionSupportsDecoupledIO = a3;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{
}

- (int)sourceDeviceType
{
  uint64_t v2 = (void *)[(id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self) objectForKeyedSubscript:@"DeviceType"];
  return [v2 intValue];
}

- (uint64_t)_sourceAttributes
{
  if (result)
  {
    uint64_t v1 = result + 32;
    if (!*(void *)(result + 32))
    {
      uint64_t v2 = *(void *)(result + 16);
      if (v2)
      {
        uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v3) {
          uint64_t v4 = v3;
        }
        else {
          uint64_t v4 = 0;
        }
        id v5 = *(void (**)(uint64_t, __CFString *, void, uint64_t))(v4 + 48);
        if (v5) {
          v5(v2, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], v1);
        }
      }
    }
    return *(void *)v1;
  }
  return result;
}

- (FigCaptureSourceConfiguration)initWithSource:(OpaqueFigCaptureSource *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureSourceConfiguration;
  uint64_t v4 = [(FigCaptureSourceConfiguration *)&v7 init];
  if (v4)
  {
    if (a3) {
      id v5 = (OpaqueFigCaptureSource *)CFRetain(a3);
    }
    else {
      id v5 = 0;
    }
    v4->_source = v5;
  }
  return v4;
}

- (void)setSmartCameraEnabled:(BOOL)a3
{
  self->_smartCameraEnabled = a3;
}

- (void)dealloc
{
  source = self->_source;
  if (source) {
    CFRelease(source);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSourceConfiguration;
  [(FigCaptureSourceConfiguration *)&v4 dealloc];
}

- (BOOL)hasSetVideoZoomFactorOnCaptureSource
{
  return self->_hasSetVideoZoomFactorOnCaptureSource;
}

- (id)copyXPCEncoding
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(FigCaptureSourceConfiguration *)self sourceID];
  FigXPCMessageSetCFString();
  int v4 = -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)self);
  xpc_dictionary_set_int64(v3, "sourceToken", v4);
  xpc_dictionary_set_int64(v3, "sourceType", [(FigCaptureSourceConfiguration *)self sourceType]);
  if (self)
  {
    if ([(FigCaptureSourceConfiguration *)self sourceType] == 1)
    {
      xpc_dictionary_set_string(v3, "requiredFormatUniqueID", [(NSString *)[(FigCaptureSourceFormat *)[(FigCaptureSourceConfiguration *)self requiredFormat] uniqueID] UTF8String]);
      [(FigCaptureSourceConfiguration *)self requiredMaxFrameRate];
      xpc_dictionary_set_double(v3, "requiredMaxFrameRate", v5);
      [(FigCaptureSourceConfiguration *)self requiredMinFrameRate];
      xpc_dictionary_set_double(v3, "requiredMinFrameRate", v6);
      [(FigCaptureSourceConfiguration *)self maxFrameRateClientOverride];
      xpc_dictionary_set_double(v3, "maxFrameRateClientOverrideKey", v7);
      [(FigCaptureSourceConfiguration *)self maxGainClientOverride];
      xpc_dictionary_set_double(v3, "maxGainClientOverride", v8);
      [(FigCaptureSourceConfiguration *)self videoZoomFactor];
      xpc_dictionary_set_double(v3, "videoZoomFactor", v9);
      xpc_object_t v10 = xpc_array_create(0, 0);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      double v11 = [(FigCaptureSourceConfiguration *)self fallbackPrimaryConstituentDeviceTypes];
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            xpc_object_t v16 = xpc_int64_create((int)[*(id *)(*((void *)&v29 + 1) + 8 * i) intValue]);
            xpc_array_append_value(v10, v16);
            xpc_release(v16);
          }
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v13);
      }
      xpc_dictionary_set_value(v3, "fallbackPrimaryConstituentDeviceTypes", v10);
      xpc_release(v10);
      [(FigCaptureSourceConfiguration *)self videoZoomRampAcceleration];
      xpc_dictionary_set_double(v3, "videoZoomRampAcceleration", v17);
      xpc_dictionary_set_int64(v3, "imageControlMode", [(FigCaptureSourceConfiguration *)self imageControlMode]);
      xpc_dictionary_set_BOOL(v3, "applyMaxExposureDurationFrameworkOverrideWhenAvailable", [(FigCaptureSourceConfiguration *)self applyMaxExposureDurationFrameworkOverrideWhenAvailable]);
      [(FigCaptureSourceConfiguration *)self maxExposureDurationClientOverride];
      if (v28)
      {
        [(FigCaptureSourceConfiguration *)self maxExposureDurationClientOverride];
        FigXPCMessageSetCMTime();
      }
      xpc_dictionary_set_BOOL(v3, "sensorHDREnabled", [(FigCaptureSourceConfiguration *)self sensorHDREnabled]);
      xpc_dictionary_set_BOOL(v3, "highlightRecoveryEnabled", [(FigCaptureSourceConfiguration *)self highlightRecoveryEnabled]);
      xpc_dictionary_set_int64(v3, "colorSpace", [(FigCaptureSourceConfiguration *)self colorSpace]);
      xpc_dictionary_set_BOOL(v3, "depthDataDeliveryEnabled", [(FigCaptureSourceConfiguration *)self depthDataDeliveryEnabled]);
      FigXPCMessageSetCFDictionary();
      float v18 = [(FigCaptureSourceConfiguration *)self depthDataFormat];
      if (v18) {
        xpc_dictionary_set_string(v3, "depthDataFormatUniqueID", [(NSString *)[(FigCaptureSourceFormat *)v18 uniqueID] UTF8String]);
      }
      [(FigCaptureSourceConfiguration *)self depthDataMaxFrameRate];
      xpc_dictionary_set_double(v3, "depthDataMaxFrameRate", v19);
      if ([(FigCaptureSourceConfiguration *)self lowLightVideoCaptureEnabled]) {
        xpc_dictionary_set_BOOL(v3, "lowLightVideoCaptureEnabled", [(FigCaptureSourceConfiguration *)self lowLightVideoCaptureEnabled]);
      }
      if ([(FigCaptureSourceConfiguration *)self spatialOverCaptureEnabled]) {
        xpc_dictionary_set_BOOL(v3, "spatialOverCaptureEnabled", [(FigCaptureSourceConfiguration *)self spatialOverCaptureEnabled]);
      }
      if ([(FigCaptureSourceConfiguration *)self nonDestructiveCropEnabled]) {
        xpc_dictionary_set_BOOL(v3, "nonDestructiveCropEnabled", [(FigCaptureSourceConfiguration *)self nonDestructiveCropEnabled]);
      }
      [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
      if (v20 > 0.0
        || ([(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize],
            v21 > 0.0))
      {
        [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
        xpc_dictionary_set_double(v3, "normalizedNonDestructiveCropSizeWidth", v22);
        [(FigCaptureSourceConfiguration *)self normalizedNonDestructiveCropSize];
        xpc_dictionary_set_double(v3, "normalizedNonDestructiveCropSizeHeight", v23);
      }
      if ([(FigCaptureSourceConfiguration *)self geometricDistortionCorrectionEnabled])
      {
        xpc_dictionary_set_BOOL(v3, "geometricDistortionCorrectionEnabled", [(FigCaptureSourceConfiguration *)self geometricDistortionCorrectionEnabled]);
      }
      if ([(FigCaptureSourceConfiguration *)self variableFrameRateVideoCaptureEnabled])
      {
        xpc_dictionary_set_BOOL(v3, "variableFrameRateVideoCaptureEnabled", [(FigCaptureSourceConfiguration *)self variableFrameRateVideoCaptureEnabled]);
      }
      if ([(FigCaptureSourceConfiguration *)self videoStabilizationStrength]) {
        xpc_dictionary_set_int64(v3, "videoStabilizationStrength", [(FigCaptureSourceConfiguration *)self videoStabilizationStrength]);
      }
      xpc_dictionary_set_BOOL(v3, "cinematicFramingSupported", [(FigCaptureSourceConfiguration *)self isCinematicFramingSupported]);
      if ([(FigCaptureSourceConfiguration *)self cinematicFramingEnabled])
      {
        xpc_dictionary_set_BOOL(v3, "cinematicFramingEnabled", [(FigCaptureSourceConfiguration *)self cinematicFramingEnabled]);
        xpc_dictionary_set_int64(v3, "cinematicFramingControlMode", [(FigCaptureSourceConfiguration *)self cinematicFramingControlMode]);
      }
      xpc_dictionary_set_BOOL(v3, "backgroundBlurSupported", [(FigCaptureSourceConfiguration *)self isBackgroundBlurSupported]);
      xpc_dictionary_set_BOOL(v3, "backgroundBlurEnabled", [(FigCaptureSourceConfiguration *)self backgroundBlurEnabled]);
      xpc_dictionary_set_BOOL(v3, "studioLightingSupported", [(FigCaptureSourceConfiguration *)self isStudioLightingSupported]);
      xpc_dictionary_set_BOOL(v3, "studioLightingEnabled", [(FigCaptureSourceConfiguration *)self studioLightingEnabled]);
      xpc_dictionary_set_BOOL(v3, "reactionEffectsSupported", [(FigCaptureSourceConfiguration *)self reactionEffectsSupported]);
      xpc_dictionary_set_BOOL(v3, "reactionEffectsEnabled", [(FigCaptureSourceConfiguration *)self reactionEffectsEnabled]);
      xpc_dictionary_set_BOOL(v3, "backgroundReplacementSupported", [(FigCaptureSourceConfiguration *)self isBackgroundReplacementSupported]);
      xpc_dictionary_set_BOOL(v3, "backgroundReplacementEnabled", [(FigCaptureSourceConfiguration *)self backgroundReplacementEnabled]);
      xpc_dictionary_set_int64(v3, "faceDrivenAEAFMode", [(FigCaptureSourceConfiguration *)self faceDrivenAEAFMode]);
      xpc_dictionary_set_BOOL(v3, "faceDrivenAEAFEnabledByDefault", [(FigCaptureSourceConfiguration *)self faceDrivenAEAFEnabledByDefault]);
      xpc_dictionary_set_BOOL(v3, "deskCamEnabled", [(FigCaptureSourceConfiguration *)self deskCamEnabled]);
      if ([(FigCaptureSourceConfiguration *)self manualCinematicFramingEnabled]) {
        xpc_dictionary_set_BOOL(v3, "manualFramingEnabled", [(FigCaptureSourceConfiguration *)self manualCinematicFramingEnabled]);
      }
      [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleX];
      xpc_dictionary_set_double(v3, "manualFramingPanningAngleX", v24);
      [(FigCaptureSourceConfiguration *)self manualFramingPanningAngleY];
      xpc_dictionary_set_double(v3, "manualFramingPanningAngleY", v25);
      [(FigCaptureSourceConfiguration *)self manualFramingDefaultZoomFactor];
      xpc_dictionary_set_double(v3, "manualFramingDefaultZoomFactor", v26);
      if ([(FigCaptureSourceConfiguration *)self gazeSelectionEnabled]) {
        xpc_dictionary_set_BOOL(v3, "gazeSelectionEnabled", [(FigCaptureSourceConfiguration *)self gazeSelectionEnabled]);
      }
      if ([(FigCaptureSourceConfiguration *)self isDockedTrackingEnabled]) {
        xpc_dictionary_set_BOOL(v3, "dockedTrackingEnabled", [(FigCaptureSourceConfiguration *)self isDockedTrackingEnabled]);
      }
      xpc_dictionary_set_BOOL(v3, "clientExpectsCameraMountedInLandscapeOrientation", [(FigCaptureSourceConfiguration *)self clientExpectsCameraMountedInLandscapeOrientation]);
    }
    else if ([(FigCaptureSourceConfiguration *)self sourceType] == 2)
    {
      xpc_dictionary_set_BOOL(v3, "clientOSVersionSupportsDecoupledIO", [(FigCaptureSourceConfiguration *)self clientOSVersionSupportsDecoupledIO]);
      if ([(FigCaptureSourceConfiguration *)self clientAudioClockDeviceUID]) {
        xpc_dictionary_set_string(v3, "clientAudioClockDeviceUID", [(NSString *)[(FigCaptureSourceConfiguration *)self clientAudioClockDeviceUID] UTF8String]);
      }
    }
  }
  return v3;
}

- (void)setHasSetVideoZoomFactorOnCaptureSource:(BOOL)a3
{
  self->_hasSetVideoZoomFactorOnCaptureSource = a3;
}

- (BOOL)smartCameraEnabled
{
  return self->_smartCameraEnabled;
}

- (BOOL)bravoShiftMitigationEnabled
{
  id v15 = 0;
  xpc_object_t v3 = [(FigCaptureSourceConfiguration *)self source];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  float v6 = *(void (**)(OpaqueFigCaptureSource *, __CFString *, void, id *))(v5 + 48);
  if (v6)
  {
    v6(v3, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v15);
    id v7 = v15;
  }
  else
  {
    id v7 = 0;
  }
  unsigned int v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
  unsigned int v9 = (v8 > 9) | (0xEFu >> v8);

  BOOL v10 = [(FigCaptureSourceConfiguration *)self spatialOverCaptureEnabled];
  [(FigCaptureSourceVideoFormat *)[(FigCaptureSourceConfiguration *)self requiredFormat] maxContinuousZoomFactorForDepthDataDelivery];
  LOBYTE(v12) = v9 ^ 1;
  if ((v9 & 1) == 0 && !v10)
  {
    float v13 = v11;
    int v12 = ![(FigCaptureSourceConfiguration *)self depthDataDeliveryEnabled];
    if (v13 != 0.0) {
      LOBYTE(v12) = 1;
    }
  }
  return v12 & 1;
}

- (FigCaptureSourceConfiguration)initWithXPCEncoding:(id)a3
{
  if (!a3)
  {

    return 0;
  }
  v43.receiver = self;
  v43.super_class = (Class)FigCaptureSourceConfiguration;
  uint64_t v5 = [(FigCaptureSourceConfiguration *)&v43 init];
  if (!v5) {
    return v5;
  }
  FigXPCMessageCopyCFString();
  v5->_sourceType = xpc_dictionary_get_int64(a3, "sourceType");
  int int64 = xpc_dictionary_get_int64(a3, "sourceToken");
  if (int64)
  {
    id v7 = (OpaqueFigCaptureSource *)FigCaptureSourceServerCopySourceForToken(int64);
    v5->_source = v7;
    if (!v7)
    {
      fig_log_get_emitter();
      uint64_t v40 = v3;
      LODWORD(v39) = 0;
      FigDebugAssert3();
    }
  }
  if (!v5->_source && (v5->_sourceType - 1) <= 1)
  {
LABEL_23:

    return 0;
  }
  if ([(FigCaptureSourceConfiguration *)v5 sourceType] == 1)
  {
    string = xpc_dictionary_get_string(a3, "requiredFormatUniqueID");
    if (string)
    {
      uint64_t v9 = (uint64_t)string;
      float v42 = 0;
      source = v5->_source;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v14 = *(unsigned int (**)(OpaqueFigCaptureSource *, __CFString *, void, void **))(v12 + 48);
      if (!v14 || (uint64_t v15 = *MEMORY[0x1E4F1CF80], v14(source, @"Formats", *MEMORY[0x1E4F1CF80], &v42)))
      {
        fig_log_get_emitter();
      }
      else
      {
        id v41 = 0;
        xpc_object_t v16 = v5->_source;
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        double v20 = *(void (**)(OpaqueFigCaptureSource *, __CFString *, uint64_t, id *))(v18 + 48);
        if (v20)
        {
          v20(v16, @"AttributesDictionary", v15, &v41);
          id v21 = v41;
        }
        else
        {
          id v21 = 0;
        }
        [v21 objectForKeyedSubscript:@"NonLocalizedName"];
        FormatByUniqueID = fcsc_findFormatByUniqueID(v9, v42);
        v5->_requiredFormat = (FigCaptureSourceVideoFormat *)FormatByUniqueID;

        if (FormatByUniqueID)
        {
          float v23 = xpc_dictionary_get_double(a3, "requiredMaxFrameRate");
          v5->_requiredMaxFrameRate = v23;
          float v24 = xpc_dictionary_get_double(a3, "requiredMinFrameRate");
          v5->_requiredMinFrameRate = v24;
          float v25 = xpc_dictionary_get_double(a3, "maxFrameRateClientOverrideKey");
          v5->_maxFrameRateClientOverride = v25;
          float v26 = xpc_dictionary_get_double(a3, "maxGainClientOverride");
          v5->_maxGainClientOverride = v26;
          float v27 = xpc_dictionary_get_double(a3, "videoZoomFactor");
          v5->_videoZoomFactor = v27;
          char v28 = (void *)[MEMORY[0x1E4F1CA48] array];
          xpc_object_t value = xpc_dictionary_get_value(a3, "fallbackPrimaryConstituentDeviceTypes");
          if (xpc_array_get_count(value))
          {
            size_t v30 = 0;
            do
              objc_msgSend(v28, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", xpc_array_get_int64(value, v30++)));
            while (xpc_array_get_count(value) > v30);
          }
          v5->_fallbackPrimaryConstituentDeviceTypes = (NSArray *)[v28 copy];
          float v31 = xpc_dictionary_get_double(a3, "videoZoomRampAcceleration");
          v5->_videoZoomRampAcceleration = v31;
          v5->_imageControlMode = xpc_dictionary_get_int64(a3, "imageControlMode");
          v5->_applyMaxExposureDurationFrameworkOverrideWhenAvailable = xpc_dictionary_get_BOOL(a3, "applyMaxExposureDurationFrameworkOverrideWhenAvailable");
          FigXPCMessageGetCMTime();
          v5->_sensorHDREnabled = xpc_dictionary_get_BOOL(a3, "sensorHDREnabled");
          v5->_highlightRecoveryEnabled = xpc_dictionary_get_BOOL(a3, "highlightRecoveryEnabled");
          v5->_colorSpace = xpc_dictionary_get_int64(a3, "colorSpace");
          v5->_depthDataDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "depthDataDeliveryEnabled");
          FigXPCMessageCopyCFDictionary();
          long long v32 = xpc_dictionary_get_string(a3, "depthDataFormatUniqueID");
          if (!v32
            || (int v33 = fcsc_findFormatByUniqueID((uint64_t)v32, [(FigCaptureSourceVideoFormat *)v5->_requiredFormat supportedDepthDataFormats]), v5->_depthDataFormat = (FigCaptureSourceDepthDataFormat *)v33, v33))
          {
            float v34 = xpc_dictionary_get_double(a3, "depthDataMaxFrameRate");
            v5->_depthDataMaxFrameRate = v34;
            v5->_lowLightVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "lowLightVideoCaptureEnabled");
            v5->_spatialOverCaptureEnabled = xpc_dictionary_get_BOOL(a3, "spatialOverCaptureEnabled");
            v5->_BOOL nonDestructiveCropEnabled = xpc_dictionary_get_BOOL(a3, "nonDestructiveCropEnabled");
            double v35 = xpc_dictionary_get_double(a3, "normalizedNonDestructiveCropSizeWidth");
            double v36 = xpc_dictionary_get_double(a3, "normalizedNonDestructiveCropSizeHeight");
            if (v35 > 0.0 && v36 > 0.0)
            {
              v5->_normalizedNonDestructiveCropSize.double width = v35;
              v5->_normalizedNonDestructiveCropSize.double height = v36;
            }
            v5->_geometricDistortionCorrectionEnabled = xpc_dictionary_get_BOOL(a3, "geometricDistortionCorrectionEnabled");
            v5->_variableFrameRateVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "variableFrameRateVideoCaptureEnabled");
            v5->_signed int videoStabilizationStrength = xpc_dictionary_get_int64(a3, "videoStabilizationStrength");
            v5->_cinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "cinematicFramingEnabled");
            v5->_cinematicFramingSupported = xpc_dictionary_get_BOOL(a3, "cinematicFramingSupported");
            v5->_cinematicFramingControlMode = xpc_dictionary_get_int64(a3, "cinematicFramingControlMode");
            v5->_backgroundBlurSupported = xpc_dictionary_get_BOOL(a3, "backgroundBlurSupported");
            v5->_backgroundBlurEnabled = xpc_dictionary_get_BOOL(a3, "backgroundBlurEnabled");
            v5->_studioLightingSupported = xpc_dictionary_get_BOOL(a3, "studioLightingSupported");
            v5->_studioLightingEnabled = xpc_dictionary_get_BOOL(a3, "studioLightingEnabled");
            v5->_reactionEffectsSupported = xpc_dictionary_get_BOOL(a3, "reactionEffectsSupported");
            v5->_reactionEffectsEnabled = xpc_dictionary_get_BOOL(a3, "reactionEffectsEnabled");
            v5->_backgroundReplacementSupported = xpc_dictionary_get_BOOL(a3, "backgroundReplacementSupported");
            v5->_backgroundReplacementEnabled = xpc_dictionary_get_BOOL(a3, "backgroundReplacementEnabled");
            v5->_faceDrivenAEAFMode = xpc_dictionary_get_int64(a3, "faceDrivenAEAFMode");
            v5->_faceDrivenAEAFEnabledByDefault = xpc_dictionary_get_BOOL(a3, "faceDrivenAEAFEnabledByDefault");
            v5->_deskCamEnabled = xpc_dictionary_get_BOOL(a3, "deskCamEnabled");
            v5->_manualCinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "manualFramingEnabled");
            float v37 = xpc_dictionary_get_double(a3, "manualFramingPanningAngleX");
            v5->_manualFramingPanningAngleX = v37;
            float v38 = xpc_dictionary_get_double(a3, "manualFramingPanningAngleY");
            v5->_manualFramingPanningAngleY = v38;
            v5->_manualFramingDefaultZoomFactor = xpc_dictionary_get_double(a3, "manualFramingDefaultZoomFactor");
            v5->_gazeSelectionEnabled = xpc_dictionary_get_BOOL(a3, "gazeSelectionEnabled");
            v5->_dockedTrackingEnabled = xpc_dictionary_get_BOOL(a3, "dockedTrackingEnabled");
            v5->_clientExpectsCameraMountedInLandscapeOrientation = xpc_dictionary_get_BOOL(a3, "clientExpectsCameraMountedInLandscapeOrientation");
            return v5;
          }
        }
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_23;
  }
  if ([(FigCaptureSourceConfiguration *)v5 sourceType] == 2)
  {
    v5->_clientOSVersionSupportsDecoupledIO = xpc_dictionary_get_BOOL(a3, "clientOSVersionSupportsDecoupledIO");
    float v13 = xpc_dictionary_get_string(a3, "clientAudioClockDeviceUID");
    if (v13) {
      v5->_clientAudioClockDeviceUID = (NSString *)[[NSString alloc] initWithUTF8String:v13];
    }
  }
  return v5;
}

- (FigCaptureSourceConfiguration)initWithSourceType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureSourceConfiguration;
  CGSize result = [(FigCaptureSourceConfiguration *)&v5 init];
  if (result) {
    result->_sourceType = a3;
  }
  return result;
}

+ (id)stringForSourceType:(int)a3
{
  return (id)FigCaptureSourceTypeNameMap[a3];
}

+ (int)sourceTypeForString:(id)a3
{
  uint64_t v4 = 1;
  while ([a3 caseInsensitiveCompare:FigCaptureSourceTypeNameMap[v4]])
  {
    if (++v4 == 6)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }
  return v4;
}

- ($2825F4736939C4A6D3AD43837233062D)deskCamOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deskCamOutputDimensions;
}

- (void)setDeskCamOutputDimensions:(id)a3
{
  self->_deskCamOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end