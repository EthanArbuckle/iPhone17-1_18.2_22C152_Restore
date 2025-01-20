@interface CAMSetVideoZoomFactorCommand
- (CAMCaptureGraphConfiguration)_graphConfiguration;
- (CAMSetVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 graphConfiguration:(id)a4;
- (double)_videoZoomFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSetVideoZoomFactorCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSetVideoZoomFactorCommand;
  v4 = [(CAMCaptureCommand *)&v9 copyWithZone:a3];
  [(CAMSetVideoZoomFactorCommand *)self _videoZoomFactor];
  v4[3] = v5;
  uint64_t v6 = [(CAMSetVideoZoomFactorCommand *)self _graphConfiguration];
  v7 = (void *)v4[4];
  v4[4] = v6;

  return v4;
}

- (double)_videoZoomFactor
{
  return self->__videoZoomFactor;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 currentVideoDevice];
  uint64_t v6 = [v4 currentVideoDeviceFormat];
  v7 = [v4 currentStillImageOutput];
  [(CAMSetVideoZoomFactorCommand *)self _videoZoomFactor];
  double v9 = v8;
  v10 = [(CAMSetVideoZoomFactorCommand *)self _graphConfiguration];
  uint64_t v11 = [v10 mode];

  if ([v7 isDepthDataDeliveryEnabled] && v11)
  {
    [v6 supportedVideoZoomRangesForDepthDataDelivery];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v17, "minZoomFactor", (void)v25);
          if (v9 >= v18)
          {
            [v17 maxZoomFactor];
            if (v9 <= v19)
            {

              goto LABEL_16;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v30 = v9;
      _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring zoom ramp request, depth delivery is enabled but zoomFactor of %f is not supported", buf, 0xCu);
    }
  }
  else
  {
LABEL_16:
    [v6 videoMaxZoomFactor];
    if (v9 <= v21)
    {
      double v22 = v9;
    }
    else
    {
      double v22 = v21;
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v30 = v9;
        __int16 v31 = 2048;
        uint64_t v32 = *(void *)&v22;
        _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
      }
    }
    if (v22 < 1.0)
    {
      v24 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v30 = v22;
        __int16 v31 = 2048;
        uint64_t v32 = 0x3FF0000000000000;
        _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
      }

      double v22 = 1.0;
    }
    [v5 setVideoZoomFactor:v22];
  }
}

- (CAMSetVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 graphConfiguration:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMSetVideoZoomFactorCommand;
  double v8 = [(CAMCaptureCommand *)&v12 initWithSubcommands:0];
  double v9 = v8;
  if (v8)
  {
    v8->__videoZoomFactor = a3;
    objc_storeStrong((id *)&v8->__graphConfiguration, a4);
    v10 = v9;
  }

  return v9;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (void).cxx_destruct
{
}

@end