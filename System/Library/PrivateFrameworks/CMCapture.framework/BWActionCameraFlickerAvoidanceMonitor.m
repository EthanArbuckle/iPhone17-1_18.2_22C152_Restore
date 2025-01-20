@interface BWActionCameraFlickerAvoidanceMonitor
+ (void)initialize;
- (BOOL)detectFlickerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 fromCaptureStreamWithPortType:(id)a4;
- (BWActionCameraFlickerAvoidanceMonitor)initWithDefaultMaxExposureDurationFrameworkOverrideByPortType:(id)a3;
- (float)_updateCurrentFrameRateWithFrameRate:(uint64_t)a1;
- (int)flickerFrequency;
- (void)dealloc;
- (void)setFlickerFrequency:(int)a3;
@end

@implementation BWActionCameraFlickerAvoidanceMonitor

+ (void)initialize
{
}

- (BWActionCameraFlickerAvoidanceMonitor)initWithDefaultMaxExposureDurationFrameworkOverrideByPortType:(id)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BWActionCameraFlickerAvoidanceMonitor;
    v5 = [(BWActionCameraFlickerAvoidanceMonitor *)&v8 init];
    v6 = v5;
    if (v5)
    {
      *(void *)&v5->_confidenceThreshold = 0x2710000088B8;
      v5->_frameRateAware = 1;
      v5->_defaultMaxExposureDurationFrameworkOverrideByPortType = (NSDictionary *)[a3 copy];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWActionCameraFlickerAvoidanceMonitor;
  [(BWActionCameraFlickerAvoidanceMonitor *)&v3 dealloc];
}

- (BOOL)detectFlickerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 fromCaptureStreamWithPortType:(id)a4
{
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54110]];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
    float v10 = -[BWActionCameraFlickerAvoidanceMonitor _updateCurrentFrameRateWithFrameRate:]((uint64_t)self, v9);
    int v11 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F544D8]), "intValue");
    if (v11 > 3 || v11 == 0)
    {
LABEL_18:
      LOBYTE(v7) = 0;
      return v7;
    }
    if (v11 > 2) {
      goto LABEL_15;
    }
    v13 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F544D0]), "firstObject");
    int v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F544C0]), "intValue");
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F544C8]), "floatValue");
    float v16 = v15;
    int confidenceThreshold = self->_confidenceThreshold - self->_confidenceHysteresis;
    if (!self->_flickerFrequency && !self->_frameRateCompatibleFlickerFrequency) {
      int confidenceThreshold = self->_confidenceThreshold;
    }
    if (v14 < confidenceThreshold || v15 < 49.0)
    {
LABEL_15:
      int v19 = 0;
    }
    else
    {
      int v20 = llroundf(v15);
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[(NSDictionary *)self->_defaultMaxExposureDurationFrameworkOverrideByPortType objectForKeyedSubscript:a4]);
      float v21 = CMTimeGetSeconds(&time) * (double)v20;
      BOOL v22 = self->_frameRateAware && vabds_f32(v16 / v10, roundf(v16 / v10)) <= 0.03;
      if (v21 < 0.5 && !v22)
      {
        int v19 = 0;
LABEL_17:
        self->_frameRateCompatibleFlickerFrequency = v19;
        if (v20 != self->_flickerFrequency)
        {
          self->_flickerFrequency = v20;
          LOBYTE(v7) = 1;
          return v7;
        }
        goto LABEL_18;
      }
      if (v21 >= 0.5 || !self->_frameRateAware) {
        int v19 = 0;
      }
      else {
        int v19 = v20;
      }
    }
    int v20 = 0;
    goto LABEL_17;
  }
  return v7;
}

- (float)_updateCurrentFrameRateWithFrameRate:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  float v2 = *(float *)(a1 + 28);
  if (v2 == 0.0)
  {
    *(float *)(a1 + 28) = a2;
    objc_super v3 = (int *)(a1 + 32);
LABEL_12:
    *objc_super v3 = 0;
    return a2;
  }
  objc_super v3 = (int *)(a1 + 32);
  if (vabds_f32(a2, v2) < 1.0) {
    goto LABEL_11;
  }
  int v4 = v2 < a2 ? *v3 + 1 : *v3 - 1;
  *objc_super v3 = v4;
  if (v4 < 0) {
    int v4 = -v4;
  }
  if (v4 >= 3)
  {
LABEL_11:
    *(float *)(a1 + 28) = a2;
    goto LABEL_12;
  }
  return v2;
}

- (int)flickerFrequency
{
  return self->_flickerFrequency;
}

- (void)setFlickerFrequency:(int)a3
{
  self->_flickerFrequency = a3;
}

@end