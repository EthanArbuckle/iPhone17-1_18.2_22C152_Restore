@interface CAMUserPreferenceOverrides
- (BOOL)hasOverrides;
- (CAMUserPreferenceOverrides)initWithConfigurationURL:(id)a3;
- (CAMUserPreferenceOverrides)initWithLaunchOptions:(id)a3;
- (CAMUserPreferenceOverrides)initWithOverrides:(id)a3;
- (CAMUserPreferenceOverrides)initWithShortcutItem:(id)a3;
- (NSNumber)aspectRatioCrop;
- (NSNumber)captureDevice;
- (NSNumber)captureMode;
- (NSNumber)cinematicConfiguration;
- (NSNumber)flashMode;
- (NSNumber)slomoConfiguration;
- (NSNumber)torchMode;
- (NSNumber)videoConfiguration;
- (NSNumber)wantsQRCodes;
- (void)setAspectRatioCrop:(id)a3;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureMode:(id)a3;
- (void)setCinematicConfiguration:(id)a3;
- (void)setFlashMode:(id)a3;
- (void)setSlomoConfiguration:(id)a3;
- (void)setTorchMode:(id)a3;
- (void)setVideoConfiguration:(id)a3;
- (void)setWantsQRCodes:(id)a3;
@end

@implementation CAMUserPreferenceOverrides

- (CAMUserPreferenceOverrides)initWithLaunchOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83350]];
  if (v5)
  {
    v6 = [(CAMUserPreferenceOverrides *)self initWithShortcutItem:v5];
    self = v6;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83360]];
  v8 = (void *)v7;
  if (!v6 && v7)
  {
    v6 = [(CAMUserPreferenceOverrides *)self initWithConfigurationURL:v7];
    self = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatioCrop, 0);
  objc_storeStrong((id *)&self->_torchMode, 0);
  objc_storeStrong((id *)&self->_flashMode, 0);
  objc_storeStrong((id *)&self->_wantsQRCodes, 0);
  objc_storeStrong((id *)&self->_cinematicConfiguration, 0);
  objc_storeStrong((id *)&self->_slomoConfiguration, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_captureMode, 0);
}

- (CAMUserPreferenceOverrides)initWithOverrides:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = [(CAMUserPreferenceOverrides *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 captureMode];
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v6;

    uint64_t v8 = [v4 captureDevice];
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v8;

    uint64_t v10 = [v4 videoConfiguration];
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (NSNumber *)v10;

    uint64_t v12 = [v4 slomoConfiguration];
    slomoConfiguration = v5->_slomoConfiguration;
    v5->_slomoConfiguration = (NSNumber *)v12;

    uint64_t v14 = [v4 cinematicConfiguration];
    cinematicConfiguration = v5->_cinematicConfiguration;
    v5->_cinematicConfiguration = (NSNumber *)v14;

    uint64_t v16 = [v4 wantsQRCodes];
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v16;

    uint64_t v18 = [v4 flashMode];
    flashMode = v5->_flashMode;
    v5->_flashMode = (NSNumber *)v18;

    uint64_t v20 = [v4 torchMode];
    torchMode = v5->_torchMode;
    v5->_torchMode = (NSNumber *)v20;

    uint64_t v22 = [v4 aspectRatioCrop];
    aspectRatioCrop = v5->_aspectRatioCrop;
    v5->_aspectRatioCrop = (NSNumber *)v22;

    v24 = v5;
  }

  return v5;
}

- (BOOL)hasOverrides
{
  v3 = [(CAMUserPreferenceOverrides *)self captureMode];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(CAMUserPreferenceOverrides *)self captureDevice];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(CAMUserPreferenceOverrides *)self videoConfiguration];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v7 = [(CAMUserPreferenceOverrides *)self slomoConfiguration];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v8 = [(CAMUserPreferenceOverrides *)self cinematicConfiguration];
          if (v8)
          {
            BOOL v4 = 1;
          }
          else
          {
            v9 = [(CAMUserPreferenceOverrides *)self wantsQRCodes];
            if (v9)
            {
              BOOL v4 = 1;
            }
            else
            {
              uint64_t v10 = [(CAMUserPreferenceOverrides *)self aspectRatioCrop];
              if (v10)
              {
                BOOL v4 = 1;
              }
              else
              {
                v11 = [(CAMUserPreferenceOverrides *)self flashMode];
                if (v11)
                {
                  BOOL v4 = 1;
                }
                else
                {
                  uint64_t v12 = [(CAMUserPreferenceOverrides *)self torchMode];
                  BOOL v4 = v12 != 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (NSNumber)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(id)a3
{
}

- (NSNumber)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
}

- (NSNumber)videoConfiguration
{
  return self->_videoConfiguration;
}

- (void)setVideoConfiguration:(id)a3
{
}

- (NSNumber)slomoConfiguration
{
  return self->_slomoConfiguration;
}

- (void)setSlomoConfiguration:(id)a3
{
}

- (NSNumber)cinematicConfiguration
{
  return self->_cinematicConfiguration;
}

- (void)setCinematicConfiguration:(id)a3
{
}

- (NSNumber)wantsQRCodes
{
  return self->_wantsQRCodes;
}

- (void)setWantsQRCodes:(id)a3
{
}

- (NSNumber)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(id)a3
{
}

- (NSNumber)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(id)a3
{
}

- (NSNumber)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (void)setAspectRatioCrop:(id)a3
{
}

- (CAMUserPreferenceOverrides)initWithShortcutItem:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = [(CAMUserPreferenceOverrides *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"CAMCaptureMode"];
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v7;

    uint64_t v9 = [v6 objectForKeyedSubscript:@"CAMCaptureDevice"];
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"CAMCaptureVideoConfiguration"];
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (NSNumber *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"CAMCaptureSloMoConfiguration"];
    slomoConfiguration = v5->_slomoConfiguration;
    v5->_slomoConfiguration = (NSNumber *)v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:@"CAMCaptureCinematicConfiguration"];
    cinematicConfiguration = v5->_cinematicConfiguration;
    v5->_cinematicConfiguration = (NSNumber *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:@"wantsQRCodes"];
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v17;

    if ([(CAMUserPreferenceOverrides *)v5 hasOverrides]) {
      v19 = v5;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CAMUserPreferenceOverrides)initWithConfigurationURL:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = [(CAMUserPreferenceOverrides *)&v16 init];
  if (v5
    && [v4 isConfigurationURL]
    && ([v4 configurationRequest], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = v6;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "requestedCaptureMode"));
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v8;

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "requestedCaptureDevice"));
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v10;

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "wantsQRCodeForSession"));
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v12;

    uint64_t v14 = v5;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end