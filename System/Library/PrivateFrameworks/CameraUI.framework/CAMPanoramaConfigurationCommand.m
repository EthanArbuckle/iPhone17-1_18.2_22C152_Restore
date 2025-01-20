@interface CAMPanoramaConfigurationCommand
- (CAMPanoramaConfiguration)_configuration;
- (CAMPanoramaConfigurationCommand)initWithCoder:(id)a3;
- (CAMPanoramaConfigurationCommand)initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPanoramaConfigurationCommand

- (CAMPanoramaConfigurationCommand)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPanoramaConfigurationCommand;
  v6 = [(CAMCaptureCommand *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMPanoramaConfigurationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPanoramaConfigurationCommand;
  id v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMPanoramaConfigurationCommandConfiguration"];
    configuration = v5->__configuration;
    v5->__configuration = (CAMPanoramaConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaConfigurationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  id v5 = [(CAMPanoramaConfigurationCommand *)self _configuration];
  [v4 encodeObject:v5 forKey:@"CAMPanoramaConfigurationCommandConfiguration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaConfigurationCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMPanoramaConfigurationCommand *)self _configuration];
  objc_super v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 currentVideoDevice];
  objc_super v6 = [v4 currentVideoDeviceFormat];

  v7 = [(CAMPanoramaConfigurationCommand *)self _configuration];
  objc_super v8 = v7;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (v7)
  {
    [v7 minimumFramerate];
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    [v8 maximumFramerate];
    if (objc_msgSend(v6, "cam_supportsPanoramaConfiguration:", v8))
    {
      [v8 minimumFramerate];
      [v5 setActiveVideoMinFrameDuration:v11];
      [v8 maximumFramerate];
LABEL_6:
      [v5 setActiveVideoMaxFrameDuration:v10];
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (objc_msgSend(v6, "cam_supportsPanoramaConfiguration:", 0))
    {
      memset(v11, 0, sizeof(v11));
      [v5 setActiveVideoMinFrameDuration:v11];
      memset(v10, 0, sizeof(v10));
      goto LABEL_6;
    }
  }
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = v15;
    __int16 v20 = 1024;
    int v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set invalid panorama framerates (%lld/%d and %lld/%d) for the current format %{public}@", buf, 0x2Cu);
  }

LABEL_10:
}

- (CAMPanoramaConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
}

@end