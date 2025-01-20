@interface CAMPortraitLightingEffectStrengthCommand
- (CAMPortraitLightingEffectStrengthCommand)initWithCoder:(id)a3;
- (CAMPortraitLightingEffectStrengthCommand)initWithEffectStrength:(double)a3;
- (double)effectStrength;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPortraitLightingEffectStrengthCommand

- (CAMPortraitLightingEffectStrengthCommand)initWithEffectStrength:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->_effectStrength = a3;
  }
  return result;
}

- (CAMPortraitLightingEffectStrengthCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  objc_super v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"CAMPortraitCommandLightingEffectStrength"];
    v5->_effectStrength = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"CAMPortraitCommandLightingEffectStrength", self->_effectStrength, v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  id result = [(CAMCaptureCommand *)&v5 copyWithZone:a3];
  *((void *)result + 3) = *(void *)&self->_effectStrength;
  return result;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentVideoDeviceInput];
  double v6 = [v4 currentVideoDeviceFormat];

  [(CAMPortraitLightingEffectStrengthCommand *)self effectStrength];
  double v8 = v7;
  [v6 minPortraitLightingEffectStrength];
  float v10 = v9;
  [v6 maxPortraitLightingEffectStrength];
  double v12 = v11;
  double v13 = v10;
  if (v8 > v10) {
    double v13 = v8;
  }
  if (v13 <= v12) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }
  if (v14 != v8)
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      double v17 = v8;
      __int16 v18 = 2048;
      double v19 = v14;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "Clamping portrait effect strength: %.2f->%.2f", (uint8_t *)&v16, 0x16u);
    }
  }
  *(float *)&double v12 = v14;
  [v5 setPortraitLightingEffectStrength:v12];
}

- (double)effectStrength
{
  return self->_effectStrength;
}

@end