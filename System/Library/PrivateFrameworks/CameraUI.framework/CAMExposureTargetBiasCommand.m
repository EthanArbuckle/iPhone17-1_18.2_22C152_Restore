@interface CAMExposureTargetBiasCommand
- (CAMExposureTargetBiasCommand)initWithCoder:(id)a3;
- (CAMExposureTargetBiasCommand)initWithExposureTargetBias:(float)a3;
- (float)_exposureTargetBias;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMExposureTargetBiasCommand

- (CAMExposureTargetBiasCommand)initWithExposureTargetBias:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMExposureTargetBiasCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__exposureTargetBias = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMExposureTargetBiasCommand;
  v4 = [(CAMCaptureCommand *)&v7 copyWithZone:a3];
  [(CAMExposureTargetBiasCommand *)self _exposureTargetBias];
  v4[6] = v5;
  return v4;
}

- (float)_exposureTargetBias
{
  return self->__exposureTargetBias;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = [a3 currentVideoDevice];
  [(CAMExposureTargetBiasCommand *)self _exposureTargetBias];
  float v6 = v5;
  [v4 minExposureTargetBias];
  float v8 = v7;
  [v4 maxExposureTargetBias];
  float v10 = v9;
  if (v6 < v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      double v16 = v6;
      __int16 v17 = 2048;
      double v18 = v8;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Clamping exposure target bias of %.3f to minimum %.3f", (uint8_t *)&v15, 0x16u);
    }

    float v6 = v8;
  }
  if (v6 > v10)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      double v16 = v6;
      __int16 v17 = 2048;
      double v18 = v10;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Clamping exposure target bias of %.3f to maximum %.3f", (uint8_t *)&v15, 0x16u);
    }

    float v6 = v10;
  }
  v13 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CAMExposureTargetBiasCommand executeWithContext:](v13, v6);
  }

  *(float *)&double v14 = v6;
  [v4 setExposureTargetBias:0 completionHandler:v14];
}

- (CAMExposureTargetBiasCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureTargetBiasCommand;
  float v5 = [(CAMCaptureCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"CAMExposureTargetBiasCommandExposureTargetBias"];
    v5->__exposureTargetBias = v6;
    float v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMExposureTargetBiasCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  [(CAMExposureTargetBiasCommand *)self _exposureTargetBias];
  objc_msgSend(v4, "encodeFloat:forKey:", @"CAMExposureTargetBiasCommandExposureTargetBias");
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Applying exposure target bias of %.3f", (uint8_t *)&v2, 0xCu);
}

@end