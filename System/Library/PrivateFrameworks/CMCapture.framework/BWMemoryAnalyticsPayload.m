@interface BWMemoryAnalyticsPayload
- (BOOL)burst;
- (BOOL)cinematicVideo;
- (BOOL)clientIsCameraOrDerivative;
- (BOOL)dockKitDeviceConnected;
- (BOOL)enhancedResolutionPortraitApplied;
- (BOOL)enhancedResolutionPortraitSuggested;
- (BOOL)faceDetectedInScene;
- (BOOL)graphContainsDepthDataPipeline;
- (BOOL)graphContainsMovieFilePipeline;
- (BOOL)graphHasVideoDataOutput;
- (BOOL)greenGhostMitigation;
- (BOOL)hdrVideo;
- (BOOL)intelligentDistortionCorrection;
- (BOOL)livePhoto;
- (BOOL)photographicStyleUsed;
- (BOOL)portraitDepthGenerationAttempted;
- (BOOL)portraitEffectApplied;
- (BOOL)portraitRequested;
- (BOOL)proRaw;
- (BOOL)proRawPlusProcessedPhotoEncoding;
- (BOOL)proResVideo;
- (BOOL)quickTakeVideo;
- (BOOL)scaledStillCaptureTaken;
- (BWMemoryAnalyticsPayload)init;
- (NSString)clientApplicationID;
- (id)eventDictionary;
- (id)eventName;
- (int)colorSpace;
- (int)deviceType;
- (int)maxVideoStabilizationMethod;
- (int)videoStabilizationStrength;
- (unint64_t)peakFootprintDifference;
- (unsigned)videoMaxFrameRate;
- (unsigned)videoMinDimension;
- (unsigned)videoRecordingCount;
- (void)addCaptureType:(int)a3;
- (void)addDeviceType:(int)a3;
- (void)addHighResolutionFlavor:(int)a3;
- (void)addPortType:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setBurst:(BOOL)a3;
- (void)setCinematicVideo:(BOOL)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setClientIsCameraOrDerivative:(BOOL)a3;
- (void)setColorSpace:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setDockKitDeviceConnected:(BOOL)a3;
- (void)setEnhancedResolutionPortraitApplied:(BOOL)a3;
- (void)setEnhancedResolutionPortraitSuggested:(BOOL)a3;
- (void)setFaceDetectedInScene:(BOOL)a3;
- (void)setGraphContainsDepthDataPipeline:(BOOL)a3;
- (void)setGraphContainsMovieFilePipeline:(BOOL)a3;
- (void)setGraphHasVideoDataOutput:(BOOL)a3;
- (void)setGreenGhostMitigation:(BOOL)a3;
- (void)setHdrVideo:(BOOL)a3;
- (void)setIntelligentDistortionCorrection:(BOOL)a3;
- (void)setLivePhoto:(BOOL)a3;
- (void)setMaxVideoStabilizationMethod:(int)a3;
- (void)setPeakFootprintDifference:(unint64_t)a3;
- (void)setPhotographicStyleUsed:(BOOL)a3;
- (void)setPortraitDepthGenerationAttempted:(BOOL)a3;
- (void)setPortraitEffectApplied:(BOOL)a3;
- (void)setPortraitRequested:(BOOL)a3;
- (void)setProRaw:(BOOL)a3;
- (void)setProRawPlusProcessedPhotoEncoding:(BOOL)a3;
- (void)setProResVideo:(BOOL)a3;
- (void)setQuickTakeVideo:(BOOL)a3;
- (void)setScaledStillCaptureTaken:(BOOL)a3;
- (void)setVideoMaxFrameRate:(unsigned int)a3;
- (void)setVideoMinDimension:(unsigned int)a3;
- (void)setVideoRecordingCount:(unsigned int)a3;
- (void)setVideoStabilizationStrength:(int)a3;
- (void)updateButtonMash:(BOOL)a3;
@end

@implementation BWMemoryAnalyticsPayload

- (void)setGraphHasVideoDataOutput:(BOOL)a3
{
  self->_graphHasVideoDataOutput = a3;
}

- (void)setGraphContainsMovieFilePipeline:(BOOL)a3
{
  self->_graphContainsMovieFilePipeline = a3;
}

- (BWMemoryAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWMemoryAnalyticsPayload;
  v2 = [(BWMemoryAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWMemoryAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_creationTime = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  self->_clientApplicationID = 0;
  self->_colorSpace = -1;
}

- (void)setGraphContainsDepthDataPipeline:(BOOL)a3
{
  self->_graphContainsDepthDataPipeline = a3;
}

- (int)maxVideoStabilizationMethod
{
  return self->_maxVideoStabilizationMethod;
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setMaxVideoStabilizationMethod:(int)a3
{
  self->_maxVideoStabilizationMethod = a3;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setClientApplicationID:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMemoryAnalyticsPayload;
  [(BWMemoryAnalyticsPayload *)&v3 dealloc];
}

- (void)addCaptureType:(int)a3
{
  ++self->_captureCount;
  if (a3 > 10)
  {
    if (a3 == 11)
    {
      uint64_t v3 = 42;
      goto LABEL_11;
    }
    if (a3 == 12)
    {
      uint64_t v3 = 41;
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v3 = 43;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 44;
    goto LABEL_11;
  }
  if (a3 != 10) {
    goto LABEL_8;
  }
  uint64_t v3 = 40;
LABEL_11:
  *((unsigned char *)&self->super.isa + v3) = 1;
}

- (void)addDeviceType:(int)a3
{
  if ((a3 - 4) > 9) {
    uint64_t v3 = 29;
  }
  else {
    uint64_t v3 = qword_1A5F0C950[a3 - 4];
  }
  *((unsigned char *)&self->super.isa + v3) = 1;
}

- (void)addHighResolutionFlavor:(int)a3
{
  if (a3 <= 2) {
    *(&self->_captureResolutionDefault + a3) = 1;
  }
}

- (void)addPortType:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F52DF0];
  char v6 = [a3 isEqualToString:*MEMORY[0x1E4F52DF0]];
  v7 = (void *)MEMORY[0x1E4F52DD8];
  if (v6)
  {
    uint64_t v8 = 34;
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F52DE8]])
  {
    uint64_t v8 = 33;
  }
  else
  {
    int v9 = [a3 isEqualToString:*v7];
    uint64_t v8 = 35;
    if (v9) {
      uint64_t v8 = 36;
    }
  }
  *((unsigned char *)&self->super.isa + v8) = 1;
  if (([a3 isEqualToString:*MEMORY[0x1E4F52DF8]] & 1) != 0
    || ([a3 isEqualToString:*MEMORY[0x1E4F52E00]] & 1) != 0
    || ([a3 isEqualToString:*MEMORY[0x1E4F52E10]] & 1) != 0
    || [a3 isEqualToString:*MEMORY[0x1E4F52E08]])
  {
    self->_captureDevicePositionFront = 1;
  }
  if (([a3 isEqualToString:*v7] & 1) != 0
    || ([a3 isEqualToString:v5] & 1) != 0
    || ([a3 isEqualToString:*MEMORY[0x1E4F52DE8]] & 1) != 0
    || [a3 isEqualToString:*MEMORY[0x1E4F52DE0]])
  {
    self->_captureDevicePositionBack = 1;
  }
}

- (void)updateButtonMash:(BOOL)a3
{
  int buttonMashRate0Counter = self->_buttonMashRate0Counter;
  if (a3)
  {
    int v4 = buttonMashRate0Counter + 1;
  }
  else
  {
    if (buttonMashRate0Counter < 1) {
      return;
    }
    int v4 = 0;
    if (self->_maxButtonMashCount <= buttonMashRate0Counter + 1) {
      unsigned int maxButtonMashCount = buttonMashRate0Counter + 1;
    }
    else {
      unsigned int maxButtonMashCount = self->_maxButtonMashCount;
    }
    self->_unsigned int maxButtonMashCount = maxButtonMashCount;
  }
  self->_int buttonMashRate0Counter = v4;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.MemoryAnalytics";
}

- (id)eventDictionary
{
  [(BWMemoryAnalyticsPayload *)self updateButtonMash:0];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v4 = NSNumber;
  [(NSDate *)self->_creationTime timeIntervalSinceNow];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "numberWithDouble:", -v5), @"duration");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_burst), @"burst");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDevicePositionFront), @"captureDevicePositionFront");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDevicePositionBack), @"captureDevicePositionBack");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypeBravo), @"captureDeviceTypeBravo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypeSuperBravo), @"captureDeviceTypeSuperBravo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypeWideBravo), @"captureDeviceTypeWideBravo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypePearl), @"captureDeviceTypePearl");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypeLiDAR), @"captureDeviceTypeLiDAR");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureDeviceTypeOther), @"captureDeviceTypeOther");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_capturePortTypeBackTelephoto), @"capturePortTypeBackTelephoto");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_capturePortTypeBackSuperWide), @"capturePortTypeBackSuperWide");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_capturePortTypeBack), @"capturePortTypeBack");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_capturePortTypeOther), @"capturePortTypeOther");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureResolutionDefault), @"captureResolutionDefault");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureResolutionEnhanced), @"captureResolutionEnhanced");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureResolutionUltraHigh), @"captureResolutionUltraHigh");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureTypeDeepFusion), @"captureTypeDeepFusion");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureTypeDigitalFlash), @"captureTypeDigitalFlash");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureTypeOther), @"captureTypeOther");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureTypeWYSIWYG), @"captureTypeWYSIWYG");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_captureTypeUB), @"captureTypeUB");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_graphContainsDepthDataPipeline), @"graphContainsDepthDataPipeline");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_graphContainsMovieFilePipeline), @"graphContainsMovieFilePipeline");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_graphHasVideoDataOutput), @"graphHasVideoDataOutput");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_greenGhostMitigation), @"greenGhostMitigation");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_scaledStillCaptureTaken), @"scaledStillCaptureTaken");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_intelligentDistortionCorrection), @"intelligentDistortionCorrection");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_livePhoto), @"livePhoto");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxButtonMashCount), @"maxButtonMashCount");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_proRaw), @"proRaw");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_proRawPlusProcessedPhotoEncoding), @"proRawPlusProcessedPhotoEncoding");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_quickTakeVideo), @"quickTakeVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_faceDetectedInScene), @"faceDetectedInScene");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_photographicStyleUsed), @"photographicStyleUsed");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_enhancedResolutionPortraitSuggested), @"_enhancedResolutionPortraitSuggested");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_enhancedResolutionPortraitApplied), @"_enhancedResolutionPortraitApplied");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_portraitRequested), @"portraitRequested");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_portraitDepthGenerationAttempted), @"portraitDepthGenerationAttempted");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_portraitEffectApplied), @"portraitEffectApplied");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_cinematicVideo), @"cinematicVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_hdrVideo), @"hdrVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_proResVideo), @"proResVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_colorSpace), @"colorSpace");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoMinDimension), @"videoMinDimension");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoMaxFrameRate), @"videoMaxFrameRate");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoRecordingCount), @"videoRecordingCount");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxVideoStabilizationMethod), @"maxVideoStabilizationMethod");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_videoStabilizationStrength), @"videoStabilizationStrength");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_dockKitDeviceConnected), @"dockKitDeviceConnected");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_captureCount), @"captureCount");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (double)self->_peakFootprintDifference * 0.000000953674316), @"peakFootprintDifferenceMiB");
  return v3;
}

- (BOOL)burst
{
  return self->_burst;
}

- (void)setBurst:(BOOL)a3
{
  self->_burst = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (BOOL)graphContainsDepthDataPipeline
{
  return self->_graphContainsDepthDataPipeline;
}

- (BOOL)graphContainsMovieFilePipeline
{
  return self->_graphContainsMovieFilePipeline;
}

- (BOOL)graphHasVideoDataOutput
{
  return self->_graphHasVideoDataOutput;
}

- (BOOL)greenGhostMitigation
{
  return self->_greenGhostMitigation;
}

- (void)setGreenGhostMitigation:(BOOL)a3
{
  self->_greenGhostMitigation = a3;
}

- (BOOL)scaledStillCaptureTaken
{
  return self->_scaledStillCaptureTaken;
}

- (void)setScaledStillCaptureTaken:(BOOL)a3
{
  self->_scaledStillCaptureTaken = a3;
}

- (BOOL)intelligentDistortionCorrection
{
  return self->_intelligentDistortionCorrection;
}

- (void)setIntelligentDistortionCorrection:(BOOL)a3
{
  self->_intelligentDistortionCorrection = a3;
}

- (BOOL)livePhoto
{
  return self->_livePhoto;
}

- (void)setLivePhoto:(BOOL)a3
{
  self->_livePhoto = a3;
}

- (BOOL)proRaw
{
  return self->_proRaw;
}

- (void)setProRaw:(BOOL)a3
{
  self->_proRaw = a3;
}

- (BOOL)proRawPlusProcessedPhotoEncoding
{
  return self->_proRawPlusProcessedPhotoEncoding;
}

- (void)setProRawPlusProcessedPhotoEncoding:(BOOL)a3
{
  self->_proRawPlusProcessedPhotoEncoding = a3;
}

- (BOOL)quickTakeVideo
{
  return self->_quickTakeVideo;
}

- (void)setQuickTakeVideo:(BOOL)a3
{
  self->_quickTakeVideo = a3;
}

- (BOOL)portraitRequested
{
  return self->_portraitRequested;
}

- (void)setPortraitRequested:(BOOL)a3
{
  self->_portraitRequested = a3;
}

- (BOOL)portraitDepthGenerationAttempted
{
  return self->_portraitDepthGenerationAttempted;
}

- (void)setPortraitDepthGenerationAttempted:(BOOL)a3
{
  self->_portraitDepthGenerationAttempted = a3;
}

- (BOOL)portraitEffectApplied
{
  return self->_portraitEffectApplied;
}

- (void)setPortraitEffectApplied:(BOOL)a3
{
  self->_portraitEffectApplied = a3;
}

- (unint64_t)peakFootprintDifference
{
  return self->_peakFootprintDifference;
}

- (void)setPeakFootprintDifference:(unint64_t)a3
{
  self->_peakFootprintDifference = a3;
}

- (BOOL)cinematicVideo
{
  return self->_cinematicVideo;
}

- (void)setCinematicVideo:(BOOL)a3
{
  self->_cinematicVideo = a3;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (BOOL)proResVideo
{
  return self->_proResVideo;
}

- (void)setProResVideo:(BOOL)a3
{
  self->_proResVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (unsigned)videoMinDimension
{
  return self->_videoMinDimension;
}

- (void)setVideoMinDimension:(unsigned int)a3
{
  self->_videoMinDimension = a3;
}

- (unsigned)videoMaxFrameRate
{
  return self->_videoMaxFrameRate;
}

- (void)setVideoMaxFrameRate:(unsigned int)a3
{
  self->_videoMaxFrameRate = a3;
}

- (unsigned)videoRecordingCount
{
  return self->_videoRecordingCount;
}

- (void)setVideoRecordingCount:(unsigned int)a3
{
  self->_videoRecordingCount = a3;
}

- (BOOL)dockKitDeviceConnected
{
  return self->_dockKitDeviceConnected;
}

- (void)setDockKitDeviceConnected:(BOOL)a3
{
  self->_dockKitDeviceConnected = a3;
}

- (BOOL)faceDetectedInScene
{
  return self->_faceDetectedInScene;
}

- (void)setFaceDetectedInScene:(BOOL)a3
{
  self->_faceDetectedInScene = a3;
}

- (BOOL)photographicStyleUsed
{
  return self->_photographicStyleUsed;
}

- (void)setPhotographicStyleUsed:(BOOL)a3
{
  self->_photographicStyleUsed = a3;
}

- (BOOL)enhancedResolutionPortraitSuggested
{
  return self->_enhancedResolutionPortraitSuggested;
}

- (void)setEnhancedResolutionPortraitSuggested:(BOOL)a3
{
  self->_enhancedResolutionPortraitSuggested = a3;
}

- (BOOL)enhancedResolutionPortraitApplied
{
  return self->_enhancedResolutionPortraitApplied;
}

- (void)setEnhancedResolutionPortraitApplied:(BOOL)a3
{
  self->_enhancedResolutionPortraitApplied = a3;
}

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

@end