@interface CAMVideoStabilizationCommand
- (BOOL)_isEnabled;
- (CAMVideoStabilizationCommand)initWithAutomaticVideoStabilizationEnabled:(BOOL)a3 strength:(int64_t)a4;
- (CAMVideoStabilizationCommand)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_strength;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoStabilizationCommand

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v13 = [v4 currentMovieFileOutput];
  v5 = [v13 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  v6 = [v4 currentVideoDeviceFormat];
  v7 = [v4 currentVideoDevice];

  int v8 = [v6 isVideoStabilizationModeSupported:3];
  unint64_t v9 = [(CAMVideoStabilizationCommand *)self _strength];
  if (v9 > 3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = qword_209C79820[v9];
    uint64_t v11 = qword_209C79840[v9];
  }
  if ([v5 isVideoStabilizationSupported])
  {
    if ([v6 isVideoStabilizationModeSupported:v11]) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = -1;
    }
    [v5 setPreferredVideoStabilizationMode:v12];
  }
  if ((v8 & [v6 isVideoStabilizationStrengthSupported:v10]) == 1) {
    [v7 setVideoStabilizationStrength:v10];
  }
}

- (CAMVideoStabilizationCommand)initWithAutomaticVideoStabilizationEnabled:(BOOL)a3 strength:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMVideoStabilizationCommand;
  v6 = [(CAMCaptureCommand *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->__enabled = a3;
    v6->__strength = a4;
    int v8 = v6;
  }

  return v7;
}

- (CAMVideoStabilizationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoStabilizationCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMVideoStabilizationCommandEnabled"];
    v5->__strength = [v4 decodeIntegerForKey:@"CAMVideoStabilizationCommandStrength"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoStabilizationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoStabilizationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMVideoStabilizationCommandEnabled");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMVideoStabilizationCommand _strength](self, "_strength"), @"CAMVideoStabilizationCommandStrength");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoStabilizationCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoStabilizationCommand *)self _isEnabled];
  *((void *)v4 + 4) = [(CAMVideoStabilizationCommand *)self _strength];
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (int64_t)_strength
{
  return self->__strength;
}

@end