@interface BWStillImageCaptureAnalyticsPayload
- (BOOL)depthDataFiltered;
- (BWStillImageCaptureAnalyticsPayload)init;
- (BWStillImageFocusPixelBlurScoreResult)focusPixelBlurScoreResult;
- (NSDictionary)oisRecenteringLoggingData;
- (float)dngCodecQuality;
- (float)largestFaceHeight;
- (float)smallestFaceHeight;
- (float)uiZoom;
- (float)zoom;
- (id)eventDictionary;
- (id)eventName;
- (int)deviceType;
- (int)fusionMode;
- (int)intelligentDistortionCorrectionCorrectionType;
- (int)intelligentDistortionCorrectionGainMapProcessingStatusCode;
- (int)intelligentDistortionCorrectionStatusCode;
- (int)ispMotionHighPassFilterConvergenceFlags;
- (int)numberOfFacesAtCenter;
- (int)numberOfFacesAtEdge;
- (int)numberOfFacesWithVisionFaceDetection;
- (int)shutterLag;
- (unsigned)auxiliaryImagesSize;
- (unsigned)bitDepth;
- (unsigned)depthFormatDimensionHeight;
- (unsigned)depthFormatDimensionWidth;
- (unsigned)depthPixelFormat;
- (unsigned)dngCodecType;
- (unsigned)dngFileSize;
- (unsigned)photoFileSize;
- (unsigned)processingFlags;
- (unsigned)thumbnailImageSize;
- (void)dealloc;
- (void)reset;
- (void)setAuxiliaryImagesSize:(unsigned int)a3;
- (void)setBitDepth:(unsigned int)a3;
- (void)setDepthDataFiltered:(BOOL)a3;
- (void)setDepthFormatDimensionHeight:(unsigned int)a3;
- (void)setDepthFormatDimensionWidth:(unsigned int)a3;
- (void)setDepthPixelFormat:(unsigned int)a3;
- (void)setDeviceType:(int)a3;
- (void)setDngCodecQuality:(float)a3;
- (void)setDngCodecType:(unsigned int)a3;
- (void)setDngFileSize:(unsigned int)a3;
- (void)setFocusPixelBlurScoreResult:(id)a3;
- (void)setFusionMode:(int)a3;
- (void)setIntelligentDistortionCorrectionCorrectionType:(int)a3;
- (void)setIntelligentDistortionCorrectionGainMapProcessingStatusCode:(int)a3;
- (void)setIntelligentDistortionCorrectionStatusCode:(int)a3;
- (void)setIspMotionHighPassFilterConvergenceFlags:(int)a3;
- (void)setLargestFaceHeight:(float)a3;
- (void)setNumberOfFacesAtCenter:(int)a3;
- (void)setNumberOfFacesAtEdge:(int)a3;
- (void)setNumberOfFacesWithVisionFaceDetection:(int)a3;
- (void)setOisRecenteringLoggingData:(id)a3;
- (void)setPhotoFileSize:(unsigned int)a3;
- (void)setProcessingFlags:(unsigned int)a3;
- (void)setShutterLag:(int)a3;
- (void)setSmallestFaceHeight:(float)a3;
- (void)setThumbnailImageSize:(unsigned int)a3;
- (void)setUiZoom:(float)a3;
- (void)setZoom:(float)a3;
@end

@implementation BWStillImageCaptureAnalyticsPayload

- (BWStillImageCaptureAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  v2 = [(BWStillImageAnalyticsPayloadCommon *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStillImageCaptureAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  [(BWStillImageAnalyticsPayloadCommon *)&v3 dealloc];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  [(BWStillImageAnalyticsPayloadCommon *)&v3 reset];
  *(&self->super._depthAFStatus + 1) = 0;
  self->_deviceType = -1;
  self->_processingFlags = 0x7FFFFFFF;
  self->_shutterLag = 2139095039;
  self->_zoom = 3.4028e38;
  self->_uiZoom = NAN;
  self->_numberOfFacesWithVisionFaceDetection = 0;
  self->_largestFaceHeight = 0.0;
  self->_smallestFaceHeight = 0.0;
  self->_numberOfFacesAtEdge = 0;

  self->_oisRecenteringLoggingData = 0;
  self->_intelligentDistortionCorrectionStatusCode = 0x7FFFFFFF;
  self->_intelligentDistortionCorrectionGainMapProcessingStatusCode = 0x7FFFFFFF;
  self->_intelligentDistortionCorrectionCorrectionType = 0x7FFFFFFF;
  self->_ispMotionHighPassFilterConvergenceFlags = 0x7FFFFFFF;
  self->_dngFileSize = 0;
  self->_thumbnailImageSize = 0;
  self->_auxiliaryImagesSize = 0;
  self->_photoFileSize = 0;
  self->_bitDepth = 0;
  self->_depthFormatDimensionWidth = -1;
  self->_depthFormatDimensionHeight = -1;
  strcpy((char *)&self->_depthPixelFormat, "0000");

  self->_focusPixelBlurScoreResult = 0;
  self->_fusionMode = 0;
  self->_dngCodecType = 0;
  self->_dngCodecQuality = 0.0;
}

- (id)eventName
{
  if ([(BWStillImageAnalyticsPayloadCommon *)self deferred]) {
    return @"com.apple.coremedia.camera.DeferredPhotoCapture";
  }
  else {
    return @"com.apple.coremedia.camera.PhotoCapture";
  }
}

- (id)eventDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCaptureAnalyticsPayload;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[BWStillImageAnalyticsPayloadCommon eventDictionary](&v9, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", LODWORD(self->_smallestFaceHeight)), @"numberOfFacesAtEdge");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_numberOfFacesAtEdge), @"numberOfFacesAtCenter");
  if ([(BWStillImageAnalyticsPayloadCommon *)self numberOfFaces] >= 1
    && *(float *)&self->_numberOfFacesWithVisionFaceDetection > 0.0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"largestFaceHeight");
  }
  if ([(BWStillImageAnalyticsPayloadCommon *)self numberOfFaces] >= 1 && self->_largestFaceHeight > 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"smallestFaceHeight");
  }
  if ([(BWStillImageAnalyticsPayloadCommon *)self numberOfFaces] > 1)
  {
    *(float *)&double v4 = *(float *)&self->_numberOfFacesWithVisionFaceDetection - self->_largestFaceHeight;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"deltaFaceHeight");
  }
  if (*(&self->super._depthAFStatus + 1)) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"deviceType");
  }
  if (self->_deviceType != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"processingFlags");
  }
  if (self->_processingFlags != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"shutterLag");
  }
  if (*(float *)&self->_shutterLag != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"zoom");
  }
  if (self->_zoom != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"uiZoom");
  }
  oisRecenteringLoggingData = self->_oisRecenteringLoggingData;
  if (oisRecenteringLoggingData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73020), @"oisMaxRecenteringDistance");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73040), @"oisSettleTimeForMaxRecenteringDistance");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73060), @"oisMeanRecenteringDistance");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73080), @"oisMeanRecenteringSettleTime");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA730A0), @"oisTrackingErrorAtSettleTime");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA730C0), @"meanMotionDataBiasErrorEstimate");
  }
  if (self->_intelligentDistortionCorrectionStatusCode != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"intelligentDistortionCorrectionStatusCode");
  }
  if (self->_intelligentDistortionCorrectionGainMapProcessingStatusCode != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"intelligentDistortionCorrectionGainMapProcessingStatusCode");
  }
  if (self->_intelligentDistortionCorrectionCorrectionType != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"intelligentDistortionCorrectionCorrectionType");
  }
  if (self->_ispMotionHighPassFilterConvergenceFlags != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"ispMotionHighPassFilterConvergenceFlags");
  }
  if (self->_dngFileSize) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"dngFileSize");
  }
  if (self->_thumbnailImageSize) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"thumbnailImageSize");
  }
  if (self->_auxiliaryImagesSize) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"auxiliaryImagesSize");
  }
  if (self->_photoFileSize) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"photoFileSize");
  }
  if (self->_bitDepth) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"bitDepth");
  }
  if (LODWORD(self->_uiZoom) != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"numberOfFacesWithVisionFaceDetection");
  }
  if (self->_depthFormatDimensionWidth != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"depthFormatDimensionWidth");
  }
  if (self->_depthFormatDimensionHeight != -1) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"depthFormatDimensionHeight");
  }
  if ([(BWStillImageAnalyticsPayloadCommon *)self depthDataDeliveryEnabled])
  {
    [v3 setObject:BWStringForOSType(self->_depthPixelFormat) forKeyedSubscript:@"depthPixelFormat"];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_depthDataFiltered), @"depthDataFiltered");
  }
  focusPixelBlurScoreResult = self->_focusPixelBlurScoreResult;
  if (focusPixelBlurScoreResult)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", -[BWStillImageFocusPixelBlurScoreResult status](focusPixelBlurScoreResult, "status")), @"focusPixelBlurScoreStatus");
    v7 = NSNumber;
    [(BWStillImageFocusPixelBlurScoreResult *)self->_focusPixelBlurScoreResult score];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithFloat:"), @"focusPixelBlurScoreScore");
  }
  if (self->_fusionMode) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"fusionMode");
  }
  if (self->_dngCodecType) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"dngCodecType");
  }
  if (self->_dngCodecQuality != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"dngCodecQuality");
  }
  return v3;
}

- (int)deviceType
{
  return *(&self->super._depthAFStatus + 1);
}

- (void)setDeviceType:(int)a3
{
  *(&self->super._depthAFStatus + 1) = a3;
}

- (unsigned)processingFlags
{
  return self->_deviceType;
}

- (void)setProcessingFlags:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (int)shutterLag
{
  return self->_processingFlags;
}

- (void)setShutterLag:(int)a3
{
  self->_processingFlags = a3;
}

- (float)zoom
{
  return *(float *)&self->_shutterLag;
}

- (void)setZoom:(float)a3
{
  *(float *)&self->_shutterLag = a3;
}

- (float)uiZoom
{
  return self->_zoom;
}

- (void)setUiZoom:(float)a3
{
  self->_zoom = a3;
}

- (int)numberOfFacesWithVisionFaceDetection
{
  return LODWORD(self->_uiZoom);
}

- (void)setNumberOfFacesWithVisionFaceDetection:(int)a3
{
  LODWORD(self->_uiZoom) = a3;
}

- (float)largestFaceHeight
{
  return *(float *)&self->_numberOfFacesWithVisionFaceDetection;
}

- (void)setLargestFaceHeight:(float)a3
{
  *(float *)&self->_numberOfFacesWithVisionFaceDetection = a3;
}

- (float)smallestFaceHeight
{
  return self->_largestFaceHeight;
}

- (void)setSmallestFaceHeight:(float)a3
{
  self->_largestFaceHeight = a3;
}

- (int)numberOfFacesAtCenter
{
  return self->_numberOfFacesAtEdge;
}

- (void)setNumberOfFacesAtCenter:(int)a3
{
  self->_numberOfFacesAtEdge = a3;
}

- (int)numberOfFacesAtEdge
{
  return LODWORD(self->_smallestFaceHeight);
}

- (void)setNumberOfFacesAtEdge:(int)a3
{
  LODWORD(self->_smallestFaceHeight) = a3;
}

- (NSDictionary)oisRecenteringLoggingData
{
  return self->_oisRecenteringLoggingData;
}

- (void)setOisRecenteringLoggingData:(id)a3
{
}

- (int)intelligentDistortionCorrectionStatusCode
{
  return self->_intelligentDistortionCorrectionStatusCode;
}

- (void)setIntelligentDistortionCorrectionStatusCode:(int)a3
{
  self->_intelligentDistortionCorrectionStatusCode = a3;
}

- (int)intelligentDistortionCorrectionGainMapProcessingStatusCode
{
  return self->_intelligentDistortionCorrectionGainMapProcessingStatusCode;
}

- (void)setIntelligentDistortionCorrectionGainMapProcessingStatusCode:(int)a3
{
  self->_intelligentDistortionCorrectionGainMapProcessingStatusCode = a3;
}

- (int)intelligentDistortionCorrectionCorrectionType
{
  return self->_intelligentDistortionCorrectionCorrectionType;
}

- (void)setIntelligentDistortionCorrectionCorrectionType:(int)a3
{
  self->_intelligentDistortionCorrectionCorrectionType = a3;
}

- (int)ispMotionHighPassFilterConvergenceFlags
{
  return self->_ispMotionHighPassFilterConvergenceFlags;
}

- (void)setIspMotionHighPassFilterConvergenceFlags:(int)a3
{
  self->_ispMotionHighPassFilterConvergenceFlags = a3;
}

- (unsigned)dngFileSize
{
  return self->_dngFileSize;
}

- (void)setDngFileSize:(unsigned int)a3
{
  self->_dngFileSize = a3;
}

- (unsigned)thumbnailImageSize
{
  return self->_thumbnailImageSize;
}

- (void)setThumbnailImageSize:(unsigned int)a3
{
  self->_thumbnailImageSize = a3;
}

- (unsigned)auxiliaryImagesSize
{
  return self->_auxiliaryImagesSize;
}

- (void)setAuxiliaryImagesSize:(unsigned int)a3
{
  self->_auxiliaryImagesSize = a3;
}

- (unsigned)photoFileSize
{
  return self->_photoFileSize;
}

- (void)setPhotoFileSize:(unsigned int)a3
{
  self->_photoFileSize = a3;
}

- (unsigned)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(unsigned int)a3
{
  self->_bitDepth = a3;
}

- (unsigned)depthFormatDimensionWidth
{
  return self->_depthFormatDimensionWidth;
}

- (void)setDepthFormatDimensionWidth:(unsigned int)a3
{
  self->_depthFormatDimensionWidth = a3;
}

- (unsigned)depthFormatDimensionHeight
{
  return self->_depthFormatDimensionHeight;
}

- (void)setDepthFormatDimensionHeight:(unsigned int)a3
{
  self->_depthFormatDimensionHeight = a3;
}

- (unsigned)depthPixelFormat
{
  return self->_depthPixelFormat;
}

- (void)setDepthPixelFormat:(unsigned int)a3
{
  self->_depthPixelFormat = a3;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (BWStillImageFocusPixelBlurScoreResult)focusPixelBlurScoreResult
{
  return self->_focusPixelBlurScoreResult;
}

- (void)setFocusPixelBlurScoreResult:(id)a3
{
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (unsigned)dngCodecType
{
  return self->_dngCodecType;
}

- (void)setDngCodecType:(unsigned int)a3
{
  self->_dngCodecType = a3;
}

- (float)dngCodecQuality
{
  return self->_dngCodecQuality;
}

- (void)setDngCodecQuality:(float)a3
{
  self->_dngCodecQuality = a3;
}

@end