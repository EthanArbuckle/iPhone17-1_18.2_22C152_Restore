@interface AVCapturePhotoBracketSettings
+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat bracketedSettings:(NSArray *)bracketedSettings;
+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType bracketedSettings:(NSArray *)bracketedSettings;
+ (void)initialize;
- (BOOL)isLensStabilizationEnabled;
- (NSArray)bracketedSettings;
- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 bracketedSettings:(id)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)dealloc;
- (void)setAutoDualCameraFusionEnabled:(BOOL)a3;
- (void)setAutoRedEyeReductionEnabled:(BOOL)a3;
- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3;
- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)a3;
- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3;
- (void)setLensStabilizationEnabled:(BOOL)lensStabilizationEnabled;
- (void)setLivePhotoMovieFileURL:(id)a3;
- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3;
- (void)setLivePhotoMovieMetadata:(id)a3;
- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3;
@end

@implementation AVCapturePhotoBracketSettings

+ (void)initialize
{
}

+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat bracketedSettings:(NSArray *)bracketedSettings
{
  uint64_t v9 = 0;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:processedFormat processedFileType:0 rawPixelFormatType:*(void *)&rawPixelFormatType rawFileType:0 bracketedSettings:bracketedSettings uniqueID:0 exceptionReason:&v9];
  v6 = v5;
  if (!v9) {
    return (AVCapturePhotoBracketSettings *)v5;
  }
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
  return 0;
}

+ (AVCapturePhotoBracketSettings)photoBracketSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType bracketedSettings:(NSArray *)bracketedSettings
{
  uint64_t v11 = 0;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:processedFormat processedFileType:processedFileType rawPixelFormatType:*(void *)&rawPixelFormatType rawFileType:rawFileType bracketedSettings:bracketedSettings uniqueID:0 exceptionReason:&v11];
  v8 = v7;
  if (!v11) {
    return (AVCapturePhotoBracketSettings *)v7;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v9);
  }
  NSLog(&cfstr_SuppressingExc.isa, v9);
  return 0;
}

- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 bracketedSettings:(id)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31 = 0;
  if (!a7)
  {
    v22 = @"bracketedSettings may not be nil";
LABEL_17:
    v31 = v22;
    goto LABEL_18;
  }
  uint64_t v13 = *(void *)&a5;
  if (![a7 count])
  {
    v22 = @"Bracketed capture settings array contains 0 elements";
    goto LABEL_17;
  }
  [a7 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = @"Bracketed capture settings array may only contain AVCaptureBracketedStillImageSettings objects";
    goto LABEL_17;
  }
  id v25 = a3;
  uint64_t v16 = objc_opt_class();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = [a7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(a7);
        }
        if (objc_opt_class() != v16)
        {
          v22 = @"All elements in the bracketed capture settings array must be of the same class";
          goto LABEL_17;
        }
      }
      uint64_t v18 = [a7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)AVCapturePhotoBracketSettings;
  v21 = [(AVCapturePhotoSettings *)&v26 _initWithFormat:v25 processedFileType:a4 rawPixelFormatType:v13 rawFileType:a6 burstQualityCaptureEnabled:0 uniqueID:a8 exceptionReason:&v31];
  self = v21;
  v22 = v31;
  if (!v31)
  {
    if (v21)
    {
      v23 = objc_alloc_init(AVCapturePhotoBracketSettingsInternal);
      self->_bracketSettingsInternal = v23;
      if (v23)
      {
        self->_bracketSettingsInternal->bracketedSettings = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a7];
        [(AVCapturePhotoSettings *)self _setPhotoQualityPrioritization:1];
        [(AVCapturePhotoBracketSettings *)self setAutoVirtualDeviceFusionEnabled:0];
        [(AVCapturePhotoBracketSettings *)self setAutoRedEyeReductionEnabled:0];
      }
    }
    return self;
  }
LABEL_18:
  if (a9) {
    *a9 = v22;
  }

  return 0;
}

- (void)dealloc
{
  bracketSettingsInternal = self->_bracketSettingsInternal;
  if (bracketSettingsInternal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoBracketSettings;
  [(AVCapturePhotoSettings *)&v4 dealloc];
}

- (id)debugDescription
{
  if (self->_bracketSettingsInternal->lensStabilizationEnabled) {
    v2 = @" lensStab:ON";
  }
  else {
    v2 = &stru_1EF4D21D0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoBracketSettings;
  return (id)[NSString stringWithFormat:@"%@ bracket:%d%@", -[AVCapturePhotoSettings debugDescription](&v4, sel_debugDescription), -[NSArray count](self->_bracketSettingsInternal->bracketedSettings, "count"), v2];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCapturePhotoBracketSettings debugDescription](self, "debugDescription")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoBracketSettings;
  v5 = -[AVCapturePhotoSettings copyWithZone:](&v7, sel_copyWithZone_);
  if (v5) {
    v5[2] = [(AVCapturePhotoBracketSettingsInternal *)self->_bracketSettingsInternal copyWithZone:a3];
  }
  return v5;
}

- (NSArray)bracketedSettings
{
  return self->_bracketSettingsInternal->bracketedSettings;
}

- (BOOL)isLensStabilizationEnabled
{
  return self->_bracketSettingsInternal->lensStabilizationEnabled;
}

- (void)setLensStabilizationEnabled:(BOOL)lensStabilizationEnabled
{
  self->_bracketSettingsInternal->lensStabilizationEnabled = lensStabilizationEnabled;
}

- (void)setFlashMode:(int64_t)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setFlashMode:](&v4, sel_setFlashMode_);
  }
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoRedEyeReductionEnabled:](&v4, sel_setAutoRedEyeReductionEnabled_);
  }
}

- (void)setHDRMode:(int64_t)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setHDRMode:](&v4, sel_setHDRMode_);
  }
}

- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setEV0PhotoDeliveryEnabled:](&v4, sel_setEV0PhotoDeliveryEnabled_);
  }
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoStillImageStabilizationEnabled:](&v4, sel_setAutoStillImageStabilizationEnabled_);
  }
}

- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoVirtualDeviceFusionEnabled:](&v4, sel_setAutoVirtualDeviceFusionEnabled_);
  }
}

- (void)setAutoDualCameraFusionEnabled:(BOOL)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setAutoDualCameraFusionEnabled:](&v4, sel_setAutoDualCameraFusionEnabled_);
  }
}

- (void)setLivePhotoMovieFileURL:(id)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieFileURL:](&v4, sel_setLivePhotoMovieFileURL_);
  }
}

- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieFileURLForOriginalPhoto:](&v4, sel_setLivePhotoMovieFileURLForOriginalPhoto_);
  }
}

- (void)setLivePhotoMovieMetadata:(id)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieMetadata:](&v4, sel_setLivePhotoMovieMetadata_);
  }
}

- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  if (a3)
  {
    v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVCapturePhotoBracketSettings;
    -[AVCapturePhotoSettings setLivePhotoMovieMetadataForOriginalPhoto:](&v4, sel_setLivePhotoMovieMetadataForOriginalPhoto_);
  }
}

@end