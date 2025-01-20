@interface CAMPortraitApertureCommand
- (CAMPortraitApertureCommand)initWithAperture:(double)a3;
- (CAMPortraitApertureCommand)initWithCoder:(id)a3;
- (double)aperture;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPortraitApertureCommand

- (CAMPortraitApertureCommand)initWithAperture:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->_aperture = a3;
  }
  return result;
}

- (CAMPortraitApertureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitApertureCommand;
  objc_super v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"CAMPortraitApertureCommandAperture"];
    v5->_aperture = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"CAMPortraitApertureCommandAperture", self->_aperture, v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  id result = [(CAMCaptureCommand *)&v5 copyWithZone:a3];
  *((void *)result + 3) = *(void *)&self->_aperture;
  return result;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentVideoDeviceInput];
  double v6 = [v4 currentVideoDeviceFormat];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __49__CAMPortraitApertureCommand_executeWithContext___block_invoke;
  v24 = &unk_263FA0408;
  id v7 = v5;
  id v25 = v7;
  id v8 = v6;
  id v26 = v8;
  if (executeWithContext__onceToken != -1) {
    dispatch_once(&executeWithContext__onceToken, &v21);
  }
  if (executeWithContext__spiAvailable)
  {
    [(CAMPortraitApertureCommand *)self aperture];
    double v10 = v9;
    [v8 minSimulatedAperture];
    float v12 = v11;
    [v8 maxSimulatedAperture];
    if (v12 == 0.0 || v13 == 0.0)
    {
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring aperture change request because device format has minSimulatedAperture/maxSimulatedAperture==0", buf, 2u);
      }
    }
    else
    {
      double v14 = v13;
      double v15 = v12;
      if (v10 > v12) {
        double v15 = v10;
      }
      if (v15 <= v14) {
        double v16 = v15;
      }
      else {
        double v16 = v14;
      }
      if (v16 == v10)
      {
        double v16 = v10;
      }
      else
      {
        v17 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          double v28 = v10;
          __int16 v29 = 2048;
          double v30 = v16;
          _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Clamping aperture: %.2f->%.2f", buf, 0x16u);
        }
      }
      float v19 = v16;
      *(float *)&double v14 = v19;
      [v7 setSimulatedAperture:v14];
      v18 = [v4 apertureSlider];
      *(float *)&double v20 = v16;
      [v18 setValue:v20];
    }
  }
}

void __49__CAMPortraitApertureCommand_executeWithContext___block_invoke()
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    executeWithContext__spiAvailable = objc_opt_respondsToSelector() & 1;
    if (executeWithContext__spiAvailable) {
      return;
    }
  }
  else
  {
    executeWithContext__spiAvailable = 0;
  }
  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEFAULT, "AVFoundation SPI for simulatedAperture not available.", v1, 2u);
  }
}

- (double)aperture
{
  return self->_aperture;
}

@end