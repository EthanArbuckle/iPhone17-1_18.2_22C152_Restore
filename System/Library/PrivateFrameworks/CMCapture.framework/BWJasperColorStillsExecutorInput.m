@interface BWJasperColorStillsExecutorInput
- (BOOL)isReadyToExecute;
- (BOOL)needMorePointClouds;
- (BOOL)skipProcessing;
- (BWJasperColorStillsExecutorInput)initWithSettings:(id)a3 portType:(id)a4 timeOfFlightCameraType:(int)a5;
- (BWJasperColorStillsExecutorInputDelegate)delegate;
- (NSArray)pointClouds;
- (id)description;
- (opaqueCMSampleBuffer)colorBuffer;
- (unint64_t)colorBufferType;
- (void)addPointCloud:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)jasperPointCloudsForColorBuffer;
- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4;
- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setSkipProcessing:(BOOL)a3;
@end

@implementation BWJasperColorStillsExecutorInput

- (BWJasperColorStillsExecutorInput)initWithSettings:(id)a3 portType:(id)a4 timeOfFlightCameraType:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWJasperColorStillsExecutorInput;
  v6 = [(BWStillImageProcessorControllerInput *)&v10 initWithSettings:a3 portType:a4];
  if (v6)
  {
    v6->_pointClouds = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a5)
    {
      if (a5 == 1) {
        int v7 = 4;
      }
      else {
        int v7 = 0;
      }
      if (a5 == 2) {
        int v8 = 2;
      }
      else {
        int v8 = v7;
      }
      v6->_numberOfPointCloudsRequired = v8;
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  colorBuffer = self->_colorBuffer;
  if (colorBuffer) {
    CFRelease(colorBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWJasperColorStillsExecutorInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)addPointCloud:(opaqueCMSampleBuffer *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  -[NSMutableArray addObject:](self->_pointClouds, "addObject:");
  uint64_t v4 = [(NSMutableArray *)self->_pointClouds count];
  if (v4 != 1)
  {
    if (0xCCCCCCCCCCCCCCCDLL * v4 > 0x3333333333333333 || dword_1E96B6848 == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (dword_1E96B6848)
  {
LABEL_9:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_10:
  if ([(BWJasperColorStillsExecutorInput *)self isReadyToExecute]) {
    [(BWJasperColorStillsExecutorInputDelegate *)self->_delegate inputReadyToExecute:self];
  }
}

- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_colorBufferPTS.value = *(_OWORD *)&a3->var0;
  self->_colorBufferPTS.epoch = var3;
  self->_colorBufferExposureTime = a4;
}

- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (dword_1E96B6848)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  colorBuffer = self->_colorBuffer;
  if (colorBuffer) {
    CFRelease(colorBuffer);
  }
  if (a3) {
    uint64_t v9 = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  else {
    uint64_t v9 = 0;
  }
  self->_colorBuffer = v9;
  self->_colorBufferType = a4;
  if ([(BWJasperColorStillsExecutorInput *)self isReadyToExecute]) {
    [(BWJasperColorStillsExecutorInputDelegate *)self->_delegate inputReadyToExecute:self];
  }
}

- (BOOL)needMorePointClouds
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pointClouds count] < (unint64_t)self->_numberOfPointCloudsRequired) {
    return 1;
  }
  colorBuffer = self->_colorBuffer;
  uint64_t v4 = (CFStringRef *)MEMORY[0x1E4F53070];
  if (!colorBuffer)
  {
    if ((self->_colorBufferPTS.flags & 1) != 0 && self->_colorBufferExposureTime > 0.0)
    {
      CMTime time = (CMTime)self->_colorBufferPTS;
      double Seconds = CMTimeGetSeconds(&time);
      double colorBufferExposureTime = self->_colorBufferExposureTime;
      goto LABEL_11;
    }
    return 1;
  }
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F53070];
  v6 = (void *)CMGetAttachment(colorBuffer, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v7 = self->_colorBuffer;
  if (v7)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v7, v5, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F530C0]);
    CMTimeMakeFromDictionary(&time, v8);
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    double Seconds = 0.0;
  }
  objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
  double colorBufferExposureTime = v12;
LABEL_11:
  BOOL result = 1;
  if (Seconds > 0.0 && colorBufferExposureTime > 0.0)
  {
    v13 = (const void *)[(NSMutableArray *)self->_pointClouds lastObject];
    if (v13)
    {
      CFDictionaryRef v14 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v13, *v4, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F530C0]);
      CMTimeMakeFromDictionary(&time, v14);
      double v15 = CMTimeGetSeconds(&time);
    }
    else
    {
      double v15 = 0.0;
    }
    double v16 = colorBufferExposureTime + Seconds + 0.01;
    BOOL result = v16 > v15;
    if (v16 <= v15 && dword_1E96B6848 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 0;
    }
  }
  return result;
}

- (void)jasperPointCloudsForColorBuffer
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (*(void *)(a1 + 88) && (v3 = [*(id *)(a1 + 48) count], unint64_t v4 = *(int *)(a1 + 104), v3 >= v4))
  {
    CFStringRef v5 = (CFStringRef *)MEMORY[0x1E4F53070];
    if (dword_1E96B6848)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      unint64_t v4 = *(int *)(a1 + 104);
    }
    CFStringRef v7 = *v5;
    objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 88), *v5, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
    double v9 = v8;
    uint64_t v10 = *(const void **)(a1 + 88);
    if (v10)
    {
      CFDictionaryRef v11 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v10, v7, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F530C0]);
      CMTimeMakeFromDictionary(&time, v11);
      double Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      double Seconds = 0.0;
    }
    memset(v32, 0, sizeof(v32));
    unint64_t v13 = *(int *)(a1 + 104);
    if (objc_msgSend(*(id *)(a1 + 48), "count", v28, v30) <= v13)
    {
      unint64_t v14 = 0;
    }
    else
    {
      unint64_t v14 = 0;
      uint64_t v15 = *MEMORY[0x1E4F530C0];
      do
      {
        unint64_t v16 = v14 % *(int *)(a1 + 104);
        double v17 = *((double *)v32 + v16);
        if (v17 == 0.0)
        {
          v18 = (const void *)[*(id *)(a1 + 48) objectAtIndexedSubscript:v14];
          if (v18)
          {
            CFDictionaryRef v19 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v18, v7, 0), "objectForKeyedSubscript:", v15);
            CMTimeMakeFromDictionary(&time, v19);
            double v17 = CMTimeGetSeconds(&time);
          }
          else
          {
            double v17 = 0.0;
          }
        }
        uint64_t v20 = (const void *)[*(id *)(a1 + 48) objectAtIndexedSubscript:v13 + v14];
        if (v20)
        {
          CFDictionaryRef v21 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v20, v7, 0), "objectForKeyedSubscript:", v15);
          CMTimeMakeFromDictionary(&time, v21);
          double v22 = CMTimeGetSeconds(&time);
        }
        else
        {
          double v22 = 0.0;
        }
        if (vabdd_f64(v9 * 0.5 + Seconds, v17) <= vabdd_f64(v9 * 0.5 + Seconds, v22)) {
          break;
        }
        ++v14;
        *((double *)v32 + v16) = v22;
      }
      while (v13 + v14 < [*(id *)(a1 + 48) count]);
    }
    if (dword_1E96B6848)
    {
      v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v14 < v14 + v4)
    {
      do
      {
        CFTypeRef CVDataBuffer = BWSampleBufferGetCVDataBuffer((opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v14, v29, v31));
        v25 = (void *)[objc_alloc((Class)getADJasperPointCloudClass()) initWithDataBuffer:CVDataBuffer];
        [v2 addObject:v25];

        ++v14;
        --v4;
      }
      while (v4);
    }
  }
  else
  {
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

- (BOOL)isReadyToExecute
{
  return self->_colorBuffer && ![(BWJasperColorStillsExecutorInput *)self needMorePointClouds]
      || self->_skipProcessing;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ : pointClouds:%lu (req:%d) colorBuf:%p skip:%d", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), -[NSMutableArray count](self->_pointClouds, "count"), self->_numberOfPointCloudsRequired, self->_colorBuffer, self->_skipProcessing];
}

- (BWJasperColorStillsExecutorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)pointClouds
{
  return &self->_pointClouds->super;
}

- (unint64_t)colorBufferType
{
  return self->_colorBufferType;
}

- (opaqueCMSampleBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
}

@end