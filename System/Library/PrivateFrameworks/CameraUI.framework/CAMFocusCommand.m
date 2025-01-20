@interface CAMFocusCommand
- (BOOL)_shouldUseSmoothFocus;
- (CAMFocusCommand)initWithCoder:(id)a3;
- (CAMFocusCommand)initWithFocusMode:(int64_t)a3;
- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4;
- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4 smooth:(BOOL)a5;
- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 smooth:(BOOL)a4;
- (CGPoint)_focusPointOfInterest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_focusMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFocusCommand

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4 smooth:(BOOL)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CAMFocusCommand;
  v9 = [(CAMCaptureCommand *)&v13 initWithSubcommands:0];
  v10 = v9;
  if (v9)
  {
    v9->__focusMode = a3;
    v9->__focusPointOfInterest.CGFloat x = x;
    v9->__focusPointOfInterest.CGFloat y = y;
    v9->__shouldUseSmoothFocus = a5;
    v11 = v9;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFocusCommand;
  v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  v4[4] = [(CAMFocusCommand *)self _focusMode];
  [(CAMFocusCommand *)self _focusPointOfInterest];
  v4[5] = v5;
  v4[6] = v6;
  *((unsigned char *)v4 + 24) = [(CAMFocusCommand *)self _shouldUseSmoothFocus];
  return v4;
}

- (int64_t)_focusMode
{
  return self->__focusMode;
}

- (CGPoint)_focusPointOfInterest
{
  double x = self->__focusPointOfInterest.x;
  double y = self->__focusPointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_shouldUseSmoothFocus
{
  return self->__shouldUseSmoothFocus;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 currentVideoDevice];
  uint64_t v6 = +[CAMCaptureConversions captureFocusModeForFocusMode:isPerformingContrastBasedFocus:](CAMCaptureConversions, "captureFocusModeForFocusMode:isPerformingContrastBasedFocus:", -[CAMFocusCommand _focusMode](self, "_focusMode"), [v5 isAdjustingFocus]);
  [(CAMFocusCommand *)self _focusPointOfInterest];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(CAMFocusCommand *)self _shouldUseSmoothFocus];
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v26.double x = v8;
    v26.double y = v10;
    v19 = NSStringFromCGPoint(v26);
    int v21 = 134218242;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    v24 = v19;
    _os_log_debug_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEBUG, "Applying focus mode %ld with point of interest %{public}@", (uint8_t *)&v21, 0x16u);
  }
  BOOL v13 = v8 > 1.0;
  if (v8 < 0.0) {
    BOOL v13 = 1;
  }
  if (v10 > 1.0) {
    BOOL v13 = 1;
  }
  char v14 = v10 < 0.0 || v13;
  if (![v5 isFocusPointOfInterestSupported] || (v14 & 1) != 0)
  {
    if ((v14 & 1) == 0)
    {
      v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v27.double x = v8;
        v27.double y = v10;
        v20 = NSStringFromCGPoint(v27);
        int v21 = 138543618;
        uint64_t v22 = (uint64_t)v20;
        __int16 v23 = 2114;
        v24 = v5;
        _os_log_debug_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEBUG, "Failed to set focus point of interest (%{public}@), as it is not supported by %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend(v5, "setFocusPointOfInterest:", v8, v10);
  }
  v16 = [v4 currentMovieFileOutput];

  if (v16 && [v5 isSmoothAutoFocusSupported])
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      [(CAMFocusCommand *)(uint64_t)v5 executeWithContext:v17];
    }

    [v5 setSmoothAutoFocusEnabled:v11];
  }
  if ([v5 isFocusModeSupported:v6])
  {
    [v5 setFocusMode:v6];
  }
  else
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      [(CAMFocusCommand *)(uint64_t)v5 executeWithContext:v18];
    }
  }
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFocusCommand;
  id v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  uint64_t v5 = (CAMFocusCommand *)v4;
  if (v4)
  {
    *((void *)v4 + 4) = a3;
    *(int64x2_t *)(v4 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v4[24] = 0;
    uint64_t v6 = v4;
  }

  return v5;
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4
{
  return -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:](self, "initWithFocusMode:atPointOfInterest:smooth:", a3, 0, a4.x, a4.y);
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 smooth:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMFocusCommand;
  uint64_t v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  double v7 = (CAMFocusCommand *)v6;
  if (v6)
  {
    *((void *)v6 + 4) = a3;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v6[24] = a4;
    objc_super v8 = v6;
  }

  return v7;
}

- (CAMFocusCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMFocusCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->__focusMode = [v4 decodeIntegerForKey:@"CAMFocusCommandFocusMode"];
    v5->__shouldUseSmoothFocus = [v4 decodeBoolForKey:@"CAMFocusCommandSmoothFocus"];
    CFDictionaryRef v6 = [v4 decodeObjectForKey:@"CAMFocusCommandFocusPointOfInterest"];
    CGPointMakeWithDictionaryRepresentation(v6, &v5->__focusPointOfInterest);
    double v7 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFocusCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMFocusCommand _focusMode](self, "_focusMode", v6.receiver, v6.super_class), @"CAMFocusCommandFocusMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMFocusCommand _shouldUseSmoothFocus](self, "_shouldUseSmoothFocus"), @"CAMFocusCommandSmoothFocus");
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->__focusPointOfInterest);
  [v4 encodeObject:DictionaryRepresentation forKey:@"CAMFocusCommandFocusPointOfInterest"];
}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Failed to set focus mode %ld, as it is not supported by %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "%{public}@ supports smooth focus, setting smooth focus to %d", (uint8_t *)&v3, 0x12u);
}

@end