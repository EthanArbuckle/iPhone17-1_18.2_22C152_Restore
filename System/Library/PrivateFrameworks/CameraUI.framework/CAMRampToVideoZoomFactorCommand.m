@interface CAMRampToVideoZoomFactorCommand
- (CAMCaptureGraphConfiguration)_graphConfiguration;
- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 duration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6;
- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 rate:(float)a4 graphConfiguration:(id)a5;
- (double)_duration;
- (double)_videoZoomFactor;
- (float)_rate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_videoZoomRampTuning;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMRampToVideoZoomFactorCommand

- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 rate:(float)a4 graphConfiguration:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v10 = [(CAMCaptureCommand *)&v14 initWithSubcommands:0];
  v11 = v10;
  if (v10)
  {
    v10->__videoZoomFactor = a3;
    v10->__rate = a4;
    v10->__duration = 0.0;
    v10->__videoZoomRampTuning = 0;
    objc_storeStrong((id *)&v10->__graphConfiguration, a5);
    v12 = v11;
  }

  return v11;
}

- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 duration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v12 = [(CAMCaptureCommand *)&v16 initWithSubcommands:0];
  v13 = v12;
  if (v12)
  {
    v12->__videoZoomFactor = a3;
    v12->__rate = 0.0;
    v12->__duration = a4;
    v12->__videoZoomRampTuning = a5;
    objc_storeStrong((id *)&v12->__graphConfiguration, a6);
    objc_super v14 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v4 = [(CAMCaptureCommand *)&v11 copyWithZone:a3];
  [(CAMRampToVideoZoomFactorCommand *)self _videoZoomFactor];
  v4[4] = v5;
  [(CAMRampToVideoZoomFactorCommand *)self _rate];
  *((_DWORD *)v4 + 6) = v6;
  [(CAMRampToVideoZoomFactorCommand *)self _duration];
  v4[5] = v7;
  v4[6] = [(CAMRampToVideoZoomFactorCommand *)self _videoZoomRampTuning];
  uint64_t v8 = [(CAMRampToVideoZoomFactorCommand *)self _graphConfiguration];
  id v9 = (void *)v4[7];
  v4[7] = v8;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CAMRampToVideoZoomFactorCommand *)self _videoZoomFactor];
  double v6 = v5;
  [(CAMRampToVideoZoomFactorCommand *)self _rate];
  float v8 = v7;
  [(CAMRampToVideoZoomFactorCommand *)self _duration];
  double v10 = v9;
  objc_super v11 = [v4 currentVideoDevice];
  v12 = [v4 currentVideoDeviceFormat];
  v13 = [v4 currentStillImageOutput];
  int v14 = [v13 isDepthDataDeliveryEnabled];
  v15 = [(CAMRampToVideoZoomFactorCommand *)self _graphConfiguration];
  uint64_t v16 = [v15 mode];

  [v12 videoMaxZoomFactor];
  if (v6 <= v17)
  {
    double v18 = v6;
  }
  else
  {
    double v18 = v17;
    v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v42 = v6;
      __int16 v43 = 2048;
      uint64_t v44 = *(void *)&v18;
      _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
    }
  }
  if (v18 < 1.0)
  {
    v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v42 = v18;
      __int16 v43 = 2048;
      uint64_t v44 = 0x3FF0000000000000;
      _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
    }

    double v18 = 1.0;
  }
  if (!v14) {
    goto LABEL_25;
  }
  uint64_t v35 = v16;
  [v12 supportedVideoZoomRangesForDepthDataDelivery];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [v26 minZoomFactor];
        if (v18 >= v27)
        {
          [v26 maxZoomFactor];
          if (v18 <= v28)
          {

            goto LABEL_25;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  if (v35)
  {
    v29 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v42 = v18;
      _os_log_impl(&dword_2099F8000, v29, OS_LOG_TYPE_DEFAULT, "Ignoring zoom request, depth delivery is enabled but zoomFactor of %f is not supported", buf, 0xCu);
    }
  }
  else
  {
LABEL_25:
    if ([(CAMRampToVideoZoomFactorCommand *)self _videoZoomRampTuning])
    {
      int64_t v33 = +[CAMCaptureConversions AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:[(CAMRampToVideoZoomFactorCommand *)self _videoZoomRampTuning]];
      float v32 = v18;
      *(float *)&double v34 = v32;
      [v11 rampToVideoZoomFactor:v33 withTuning:v34];
    }
    else if (v10 <= 0.0)
    {
      if (v8 <= 0.0)
      {
        [v11 setVideoZoomFactor:v18];
      }
      else
      {
        *(float *)&double v31 = v8;
        [v11 rampToVideoZoomFactor:v18 withRate:v31];
      }
    }
    else
    {
      *(float *)&double v30 = v18;
      [v11 rampExponentiallyToVideoZoomFactor:v30 withDuration:v10];
    }
  }
}

- (double)_videoZoomFactor
{
  return self->__videoZoomFactor;
}

- (float)_rate
{
  return self->__rate;
}

- (double)_duration
{
  return self->__duration;
}

- (int64_t)_videoZoomRampTuning
{
  return self->__videoZoomRampTuning;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (void).cxx_destruct
{
}

@end