@interface AVMomentCaptureSettings
+ (id)settingsWithPhotoSettings:(id)a3;
+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3;
+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4;
- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions;
- (AVCapturePhotoSettings)photoSettings;
- (BOOL)isAutoDeferredPhotoDeliveryEnabled;
- (BOOL)isAutoDeferredProcessingEnabled;
- (BOOL)isAutoOriginalPhotoDeliveryEnabled;
- (BOOL)isAutoRedEyeReductionEnabled;
- (BOOL)isAutoSpatialOverCaptureEnabled;
- (BOOL)isDepthDataDeliveryEnabled;
- (NSString)bravoCameraSelectionBehaviorForRecording;
- (id)_initWithPhotoSettings:(id)a3;
- (id)_initWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)HDRMode;
- (int64_t)digitalFlashMode;
- (int64_t)flashMode;
- (int64_t)photoQualityPrioritization;
- (int64_t)torchMode;
- (int64_t)uniqueID;
- (unint64_t)userInitiatedCaptureTime;
- (unsigned)rawOutputFormat;
- (void)dealloc;
- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)a3;
- (void)setAutoDeferredProcessingEnabled:(BOOL)a3;
- (void)setAutoOriginalPhotoDeliveryEnabled:(BOOL)a3;
- (void)setAutoRedEyeReductionEnabled:(BOOL)a3;
- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDigitalFlashMode:(int64_t)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3;
- (void)setMaxPhotoDimensions:(id)a3;
- (void)setPhotoQualityPrioritization:(int64_t)a3;
- (void)setRawOutputFormat:(unsigned int)a3;
- (void)setTorchMode:(int64_t)a3;
@end

@implementation AVMomentCaptureSettings

- (id)_initWithPhotoSettings:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMomentCaptureSettings;
  v4 = [(AVMomentCaptureSettings *)&v6 init];
  if (v4)
  {
    v4->_photoSettings = (AVCapturePhotoSettings *)[a3 copy];
    v4->_bravoCameraSelectionBehaviorForRecording = (NSString *)@"AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange";
  }
  return v4;
}

+ (id)settingsWithPhotoSettings:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithPhotoSettings:a3];

  return v3;
}

+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUserInitiatedCaptureTime:uniqueID:", a3, +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID"));

  return v3;
}

+ (id)settingsWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithUserInitiatedCaptureTime:a3 uniqueID:a4];

  return v4;
}

- (id)_initWithUserInitiatedCaptureTime:(unint64_t)a3 uniqueID:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMomentCaptureSettings;
  objc_super v6 = [(AVMomentCaptureSettings *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_uniqueID = a4;
    v6->_userInitiatedCaptureTime = a3;
    v6->_photoQualityPrioritization = 3;
    v6->_bravoCameraSelectionBehaviorForRecording = (NSString *)@"AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange";
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureSettings;
  [(AVMomentCaptureSettings *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  photoSettings = self->_photoSettings;
  v5 = [AVMomentCaptureSettings alloc];
  if (photoSettings)
  {
    id v6 = [(AVMomentCaptureSettings *)v5 _initWithPhotoSettings:self->_photoSettings];
  }
  else
  {
    id v6 = [(AVMomentCaptureSettings *)v5 _initWithUserInitiatedCaptureTime:self->_userInitiatedCaptureTime uniqueID:self->_uniqueID];
    [v6 setFlashMode:self->_flashMode];
    [v6 setDigitalFlashMode:self->_digitalFlashMode];
    [v6 setPhotoQualityPrioritization:self->_photoQualityPrioritization];
    [v6 setHDRMode:self->_HDRMode];
    [v6 setMaxPhotoDimensions:*(void *)&self->_maxPhotoDimensions];
    [v6 setDepthDataDeliveryEnabled:self->_depthDataDeliveryEnabled];
  }
  [v6 setTorchMode:self->_torchMode];
  [v6 setBravoCameraSelectionBehaviorForRecording:self->_bravoCameraSelectionBehaviorForRecording];
  return v6;
}

- (id)debugDescription
{
  if (self->_depthDataDeliveryEnabled) {
    v2 = @" depth:1";
  }
  else {
    v2 = &stru_1EF4D21D0;
  }
  return (id)[NSString stringWithFormat:@"uid:%lld torch:%d flash:%d%@ SBQ:%d HDR:%d%@", self->_uniqueID, self->_torchMode, self->_flashMode, @" dflash:%d", self->_photoQualityPrioritization, self->_HDRMode, v2];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVMomentCaptureSettings debugDescription](self, "debugDescription")];
}

- (int64_t)uniqueID
{
  photoSettings = self->_photoSettings;
  if (photoSettings) {
    return [(AVCapturePhotoSettings *)photoSettings uniqueID];
  }
  else {
    return self->_uniqueID;
  }
}

- (unint64_t)userInitiatedCaptureTime
{
  photoSettings = self->_photoSettings;
  if (photoSettings) {
    return [(AVCapturePhotoSettings *)photoSettings userInitiatedPhotoRequestTime];
  }
  else {
    return self->_userInitiatedCaptureTime;
  }
}

- (AVCapturePhotoSettings)photoSettings
{
  v2 = (void *)[(AVCapturePhotoSettings *)self->_photoSettings copy];

  return (AVCapturePhotoSettings *)v2;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_torchMode = a3;
  }
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_flashMode = a3;
  }
}

- (int64_t)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_digitalFlashMode = a3;
  }
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (void)setPhotoQualityPrioritization:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_photoQualityPrioritization = a3;
  }
}

- (int64_t)HDRMode
{
  return self->_HDRMode;
}

- (void)setHDRMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_HDRMode = a3;
  }
}

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_autoDeferredPhotoDeliveryEnabled = a3;
}

- (NSString)bravoCameraSelectionBehaviorForRecording
{
  v2 = self->_bravoCameraSelectionBehaviorForRecording;

  return v2;
}

- (void)setBravoCameraSelectionBehaviorForRecording:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously";
  v6[1] = @"AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange";
  v6[2] = @"AVCaptureBravoCameraSelectionBehaviorEvaluatesNever";
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 3), "containsObject:", a3))
  {

    self->_bravoCameraSelectionBehaviorForRecording = (NSString *)[a3 copy];
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (BOOL)isAutoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_autoRedEyeReductionEnabled = a3;
}

- (BOOL)isAutoOriginalPhotoDeliveryEnabled
{
  return self->_autoOriginalPhotoDeliveryEnabled;
}

- (void)setAutoOriginalPhotoDeliveryEnabled:(BOOL)a3
{
  self->_autoOriginalPhotoDeliveryEnabled = a3;
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_autoSpatialOverCaptureEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_autoSpatialOverCaptureEnabled = a3;
}

- (BOOL)isAutoDeferredPhotoDeliveryEnabled
{
  return self->_autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)a3
{
  self->_autoDeferredPhotoDeliveryEnabled = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_rawOutputFormat = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxPhotoDimensions;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  self->_maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

@end