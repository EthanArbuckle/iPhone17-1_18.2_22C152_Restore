@interface CAMExposureCommand
- (CAMExposureCommand)initWithCoder:(id)a3;
- (CAMExposureCommand)initWithExposureMode:(int64_t)a3;
- (CAMExposureCommand)initWithExposureMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4;
- (CGPoint)_exposurePointOfInterest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_exposureMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMExposureCommand

- (CAMExposureCommand)initWithExposureMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)CAMExposureCommand;
  v7 = [(CAMCaptureCommand *)&v11 initWithSubcommands:0];
  v8 = v7;
  if (v7)
  {
    v7->__exposureMode = a3;
    v7->__exposurePointOfInterest.CGFloat x = x;
    v7->__exposurePointOfInterest.CGFloat y = y;
    v9 = v7;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMExposureCommand;
  v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  v4[3] = [(CAMExposureCommand *)self _exposureMode];
  [(CAMExposureCommand *)self _exposurePointOfInterest];
  v4[4] = v5;
  v4[5] = v6;
  return v4;
}

- (int64_t)_exposureMode
{
  return self->__exposureMode;
}

- (CGPoint)_exposurePointOfInterest
{
  double x = self->__exposurePointOfInterest.x;
  double y = self->__exposurePointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = [a3 currentVideoDevice];
  uint64_t v5 = +[CAMCaptureConversions captureExposureModeForExposureMode:[(CAMExposureCommand *)self _exposureMode]];
  [(CAMExposureCommand *)self _exposurePointOfInterest];
  double x = v19.x;
  double y = v19.y;
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v19);
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(CAMExposureCommand *)(uint64_t)DictionaryRepresentation executeWithContext:v9];
  }

  BOOL v10 = x > 1.0;
  if (x < 0.0) {
    BOOL v10 = 1;
  }
  if (y > 1.0) {
    BOOL v10 = 1;
  }
  char v11 = y < 0.0 || v10;
  if (![v4 isExposurePointOfInterestSupported] || (v11 & 1) != 0)
  {
    if ((v11 & 1) == 0)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        uint64_t v15 = (uint64_t)DictionaryRepresentation;
        __int16 v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Failed to set exposure point of interest (%{public}@), as it is not supported by %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    [(CAMExposureCommand *)self _exposurePointOfInterest];
    objc_msgSend(v4, "setExposurePointOfInterest:");
  }
  CFRelease(DictionaryRepresentation);
  if ([v4 isExposureModeSupported:v5])
  {
    [v4 setExposureMode:v5];
  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      uint64_t v15 = v5;
      __int16 v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Failed to set exposure mode %ld, as it is not supported by %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (CAMExposureCommand)initWithExposureMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMExposureCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->__exposureMode = a3;
    v4->__exposurePointOfInterest = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    uint64_t v6 = v4;
  }

  return v5;
}

- (CAMExposureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->__exposureMode = [v4 decodeIntegerForKey:@"CAMExposureCommandExposureMode"];
    CFDictionaryRef v6 = [v4 decodeObjectForKey:@"CAMExposureCommandExposurePointOfInterest"];
    CGPointMakeWithDictionaryRepresentation(v6, &v5->__exposurePointOfInterest);
    v7 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMExposureCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMExposureCommand _exposureMode](self, "_exposureMode", v6.receiver, v6.super_class), @"CAMExposureCommandExposureMode");
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->__exposurePointOfInterest);
  [v4 encodeObject:DictionaryRepresentation forKey:@"CAMExposureCommandExposurePointOfInterest"];
}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Applying exposure mode %ld with point of interest %{public}@", (uint8_t *)&v3, 0x16u);
}

@end