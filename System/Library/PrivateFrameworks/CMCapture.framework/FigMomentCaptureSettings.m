@interface FigMomentCaptureSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)autoRedEyeReductionEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)isAutoDeferredProcessingEnabled;
- (BOOL)isAutoOriginalPhotoDeliveryEnabled;
- (BOOL)isAutoSpatialOverCaptureEnabled;
- (BOOL)isEqual:(id)a3;
- (FigCaptureIrisStillImageSettings)stillImageSettings;
- (FigMomentCaptureSettings)initWithCoder:(id)a3;
- (FigMomentCaptureSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4 userInitiatedCaptureTime:(unint64_t)a5;
- (FigMomentCaptureSettings)initWithStillImageSettings:(id)a3;
- (NSString)captureRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)HDRMode;
- (int)clientQualityPrioritization;
- (int)digitalFlashMode;
- (int)flashMode;
- (int)qualityPrioritization;
- (int)torchMode;
- (int64_t)settingsID;
- (unint64_t)hash;
- (unint64_t)userInitiatedCaptureTime;
- (unsigned)outputHeight;
- (unsigned)outputWidth;
- (unsigned)rawOutputFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoDeferredProcessingEnabled:(BOOL)a3;
- (void)setAutoOriginalPhotoDeliveryEnabled:(BOOL)a3;
- (void)setAutoRedEyeReductionEnabled:(BOOL)a3;
- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setClientQualityPrioritization:(int)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDigitalFlashMode:(int)a3;
- (void)setFlashMode:(int)a3;
- (void)setHDRMode:(int)a3;
- (void)setOutputHeight:(unsigned int)a3;
- (void)setOutputWidth:(unsigned int)a3;
- (void)setQualityPrioritization:(int)a3;
- (void)setRawOutputFormat:(unsigned int)a3;
- (void)setTorchMode:(int)a3;
@end

@implementation FigMomentCaptureSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigMomentCaptureSettings)initWithStillImageSettings:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigMomentCaptureSettings;
  v4 = [(FigMomentCaptureSettings *)&v6 init];
  if (v4) {
    v4->_stillImageSettings = (FigCaptureIrisStillImageSettings *)a3;
  }
  return v4;
}

- (FigMomentCaptureSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4 userInitiatedCaptureTime:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)FigMomentCaptureSettings;
  v8 = [(FigMomentCaptureSettings *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_settingsID = a3;
    v8->_captureRequestIdentifier = (NSString *)a4;
    v9->_userInitiatedCaptureTime = a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigMomentCaptureSettings;
  [(FigMomentCaptureSettings *)&v3 dealloc];
}

- (FigMomentCaptureSettings)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"stillImageSettings"];
  if (v5)
  {
    objc_super v6 = [(FigMomentCaptureSettings *)self initWithStillImageSettings:v5];
    if (!v6) {
      return v6;
    }
    goto LABEL_6;
  }
  objc_super v6 = -[FigMomentCaptureSettings initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:](self, "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", [a3 decodeInt64ForKey:@"settingsID"], objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"captureRequestIdentifier"), objc_msgSend(a3, "decodeInt64ForKey:", @"userInitiatedCaptureTime"));
  if (v6)
  {
    v6->_flashMode = [a3 decodeInt32ForKey:@"flashMode"];
    v6->_autoRedEyeReductionEnabled = [a3 decodeBoolForKey:@"autoRedEyeReductionEnabled"];
    v6->_digitalFlashMode = [a3 decodeInt32ForKey:@"digitalFlashMode"];
    v6->_qualityPrioritization = [a3 decodeInt32ForKey:@"qualityPrioritization"];
    v6->_clientQualityPrioritization = [a3 decodeInt32ForKey:@"clientQualityPrioritization"];
    v6->_HDRMode = [a3 decodeInt32ForKey:@"HDRMode"];
    v6->_autoOriginalPhotoDeliveryEnabled = [a3 decodeBoolForKey:@"autoOriginalPhotoDeliveryEnabled"];
    v6->_autoDeferredProcessingEnabled = [a3 decodeBoolForKey:@"autoDeferredProcessingEnabled"];
    v6->_rawOutputFormat = [a3 decodeInt32ForKey:@"rawOutputFormat"];
    v6->_outputWidth = [a3 decodeInt32ForKey:@"outputWidth"];
    v6->_outputHeight = [a3 decodeInt32ForKey:@"outputHeight"];
    v6->_depthDataDeliveryEnabled = [a3 decodeBoolForKey:@"depthDataDeliveryEnabled"];
LABEL_6:
    v6->_torchMode = [a3 decodeInt32ForKey:@"torchMode"];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_stillImageSettings forKey:@"stillImageSettings"];
  [a3 encodeInt64:self->_settingsID forKey:@"settingsID"];
  [a3 encodeObject:self->_captureRequestIdentifier forKey:@"captureRequestIdentifier"];
  [a3 encodeInt64:self->_userInitiatedCaptureTime forKey:@"userInitiatedCaptureTime"];
  [a3 encodeInt32:self->_torchMode forKey:@"torchMode"];
  [a3 encodeInt32:self->_flashMode forKey:@"flashMode"];
  [a3 encodeBool:self->_autoRedEyeReductionEnabled forKey:@"autoRedEyeReductionEnabled"];
  [a3 encodeInt32:self->_digitalFlashMode forKey:@"digitalFlashMode"];
  [a3 encodeInt32:self->_qualityPrioritization forKey:@"qualityPrioritization"];
  [a3 encodeInt32:self->_clientQualityPrioritization forKey:@"clientQualityPrioritization"];
  [a3 encodeInt32:self->_HDRMode forKey:@"HDRMode"];
  [a3 encodeBool:self->_autoOriginalPhotoDeliveryEnabled forKey:@"autoOriginalPhotoDeliveryEnabled"];
  [a3 encodeBool:self->_autoSpatialOverCaptureEnabled forKey:@"autoSpatialOverCaptureEnabled"];
  [a3 encodeBool:self->_autoDeferredProcessingEnabled forKey:@"autoDeferredProcessingEnabled"];
  [a3 encodeInt32:self->_rawOutputFormat forKey:@"rawOutputFormat"];
  [a3 encodeInt32:self->_outputWidth forKey:@"outputWidth"];
  [a3 encodeInt32:self->_outputHeight forKey:@"outputHeight"];
  BOOL depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
  [a3 encodeBool:depthDataDeliveryEnabled forKey:@"depthDataDeliveryEnabled"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", self->_settingsID, self->_captureRequestIdentifier, self->_userInitiatedCaptureTime);
  [v4 setTorchMode:self->_torchMode];
  [v4 setFlashMode:self->_flashMode];
  [v4 setAutoRedEyeReductionEnabled:self->_autoRedEyeReductionEnabled];
  [v4 setDigitalFlashMode:self->_digitalFlashMode];
  [v4 setQualityPrioritization:self->_qualityPrioritization];
  [v4 setClientQualityPrioritization:self->_clientQualityPrioritization];
  [v4 setHDRMode:self->_HDRMode];
  [v4 setAutoOriginalPhotoDeliveryEnabled:self->_autoOriginalPhotoDeliveryEnabled];
  [v4 setAutoSpatialOverCaptureEnabled:self->_autoSpatialOverCaptureEnabled];
  [v4 setAutoDeferredProcessingEnabled:self->_autoDeferredProcessingEnabled];
  [v4 setRawOutputFormat:self->_rawOutputFormat];
  [v4 setOutputWidth:self->_outputWidth];
  [v4 setOutputHeight:self->_outputHeight];
  [v4 setDepthDataDeliveryEnabled:self->_depthDataDeliveryEnabled];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    BOOL v5 = -[FigCaptureStillImageSettings isEqual:](self->_stillImageSettings, "isEqual:", [a3 stillImageSettings]);
    if (!v5) {
      return v5;
    }
    int64_t settingsID = self->_settingsID;
    if (settingsID != [a3 settingsID]) {
      goto LABEL_21;
    }
    BOOL v5 = -[NSString isEqualToString:](self->_captureRequestIdentifier, "isEqualToString:", [a3 captureRequestIdentifier]);
    if (!v5) {
      return v5;
    }
    unint64_t userInitiatedCaptureTime = self->_userInitiatedCaptureTime;
    if (userInitiatedCaptureTime != [a3 userInitiatedCaptureTime]) {
      goto LABEL_21;
    }
    int torchMode = self->_torchMode;
    if (torchMode != [a3 torchMode]) {
      goto LABEL_21;
    }
    int flashMode = self->_flashMode;
    if (flashMode != [a3 flashMode]) {
      goto LABEL_21;
    }
    int autoRedEyeReductionEnabled = self->_autoRedEyeReductionEnabled;
    if (autoRedEyeReductionEnabled != [a3 autoRedEyeReductionEnabled]) {
      goto LABEL_21;
    }
    int digitalFlashMode = self->_digitalFlashMode;
    if (digitalFlashMode != [a3 digitalFlashMode]) {
      goto LABEL_21;
    }
    int qualityPrioritization = self->_qualityPrioritization;
    if (qualityPrioritization != [a3 qualityPrioritization]) {
      goto LABEL_21;
    }
    int clientQualityPrioritization = self->_clientQualityPrioritization;
    if (clientQualityPrioritization != [a3 clientQualityPrioritization]
      || (int HDRMode = self->_HDRMode, HDRMode != [a3 HDRMode])
      || (int autoOriginalPhotoDeliveryEnabled = self->_autoOriginalPhotoDeliveryEnabled,
          autoOriginalPhotoDeliveryEnabled != [a3 isAutoOriginalPhotoDeliveryEnabled])
      || (int autoSpatialOverCaptureEnabled = self->_autoSpatialOverCaptureEnabled,
          autoSpatialOverCaptureEnabled != [a3 isAutoSpatialOverCaptureEnabled])
      || (int autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled,
          autoDeferredProcessingEnabled != [a3 isAutoDeferredProcessingEnabled])
      || (unsigned int rawOutputFormat = self->_rawOutputFormat, rawOutputFormat != [a3 rawOutputFormat])
      || (unsigned int outputWidth = self->_outputWidth, outputWidth != [a3 outputWidth])
      || (unsigned int outputHeight = self->_outputHeight, outputHeight != [a3 outputHeight]))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    int depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
    LOBYTE(v5) = depthDataDeliveryEnabled == [a3 depthDataDeliveryEnabled];
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_settingsID;
}

- (id)description
{
  uint64_t torchMode = self->_torchMode;
  if (torchMode) {
    v16 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" TORCH:%d", torchMode);
  }
  else {
    v16 = &stru_1EFA403E0;
  }
  if (self->_flashMode) {
    v15 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" FLASH:%d", self->_flashMode);
  }
  else {
    v15 = &stru_1EFA403E0;
  }
  if (self->_digitalFlashMode) {
    v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" DIGITALFLASH:%d", self->_digitalFlashMode);
  }
  else {
    v4 = &stru_1EFA403E0;
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @" QUAL:%d", self->_qualityPrioritization);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @" CQUAL:%d", self->_clientQualityPrioritization);
  if (self->_HDRMode) {
    v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" HDR:%d", self->_HDRMode);
  }
  else {
    v7 = &stru_1EFA403E0;
  }
  BOOL autoOriginalPhotoDeliveryEnabled = self->_autoOriginalPhotoDeliveryEnabled;
  BOOL autoSpatialOverCaptureEnabled = self->_autoSpatialOverCaptureEnabled;
  v10 = &stru_1EFA403E0;
  if (self->_rawOutputFormat) {
    objc_super v11 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" RAW:%c%c%c%c", HIBYTE(self->_rawOutputFormat), BYTE2(self->_rawOutputFormat), BYTE1(self->_rawOutputFormat), self->_rawOutputFormat);
  }
  else {
    objc_super v11 = &stru_1EFA403E0;
  }
  if (autoSpatialOverCaptureEnabled) {
    v12 = @" OverCapture:1";
  }
  else {
    v12 = &stru_1EFA403E0;
  }
  if (autoOriginalPhotoDeliveryEnabled) {
    v13 = @" ORIGINAL:1";
  }
  else {
    v13 = &stru_1EFA403E0;
  }
  if (self->_depthDataDeliveryEnabled) {
    v10 = @" DEPTH:1";
  }
  return (id)[NSString stringWithFormat:@"%@ %p: captureID:%lld userTime:%llu %dx%d %@%@%@%@%@%@%@%@%@%@", objc_opt_class(), self, self->_settingsID, self->_userInitiatedCaptureTime, self->_outputWidth, self->_outputHeight, v16, v15, v4, v5, v6, v7, v13, v12, v11, v10];
}

- (int64_t)settingsID
{
  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings) {
    return [(FigCaptureStillImageSettings *)stillImageSettings settingsID];
  }
  else {
    return self->_settingsID;
  }
}

- (NSString)captureRequestIdentifier
{
  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings) {
    return [(FigCaptureStillImageSettings *)stillImageSettings captureRequestIdentifier];
  }
  else {
    return self->_captureRequestIdentifier;
  }
}

- (unint64_t)userInitiatedCaptureTime
{
  stillImageSettings = self->_stillImageSettings;
  if (stillImageSettings) {
    return [(FigCaptureStillImageSettings *)stillImageSettings stillImageUserInitiatedRequestTime];
  }
  else {
    return self->_userInitiatedCaptureTime;
  }
}

- (int)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int)a3
{
  self->_uint64_t torchMode = a3;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int)a3
{
  self->_int flashMode = a3;
}

- (BOOL)autoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_int autoRedEyeReductionEnabled = a3;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_int digitalFlashMode = a3;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_int qualityPrioritization = a3;
}

- (int)clientQualityPrioritization
{
  return self->_clientQualityPrioritization;
}

- (void)setClientQualityPrioritization:(int)a3
{
  self->_int clientQualityPrioritization = a3;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (void)setHDRMode:(int)a3
{
  self->_int HDRMode = a3;
}

- (BOOL)isAutoOriginalPhotoDeliveryEnabled
{
  return self->_autoOriginalPhotoDeliveryEnabled;
}

- (void)setAutoOriginalPhotoDeliveryEnabled:(BOOL)a3
{
  self->_BOOL autoOriginalPhotoDeliveryEnabled = a3;
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_autoSpatialOverCaptureEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_BOOL autoSpatialOverCaptureEnabled = a3;
}

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_autoDeferredProcessingEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_int autoDeferredProcessingEnabled = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_unsigned int rawOutputFormat = a3;
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_unsigned int outputWidth = a3;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_unsigned int outputHeight = a3;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_int depthDataDeliveryEnabled = a3;
}

- (FigCaptureIrisStillImageSettings)stillImageSettings
{
  return self->_stillImageSettings;
}

@end