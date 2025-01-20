@interface BWUBProcessorInput
- (BOOL)emitErrorRecoveryFrame;
- (BOOL)keepFrames;
- (BOOL)receivedAllFrames;
- (BWUBProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWUBProcessorInputDelegate)delegate;
- (NSMutableDictionary)oisRecenteringLoggingData;
- (int)fusionMode;
- (int)receivedFrames;
- (opaqueCMSampleBuffer)errorRecoveryFrame;
- (opaqueCMSampleBuffer)evMinusReferenceFrame;
- (opaqueCMSampleBuffer)originalImage;
- (opaqueCMSampleBuffer)referenceFrame;
- (unsigned)remainingProcessingCount;
- (void)_setErrorRecoveryFrame:(void *)result;
- (void)_setReferenceFrame:(void *)result;
- (void)adaptiveBracketingParameters;
- (void)addFrame:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEmitErrorRecoveryFrame:(BOOL)a3;
- (void)setFusionMode:(int)a3;
- (void)setKeepFrames:(BOOL)a3;
- (void)setRemainingProcessingCount:(unsigned int)a3;
- (void)stopAdaptiveBracketingNow;
- (void)stopAdaptiveBracketingWithGroup:(int)a3;
- (void)updateAdaptiveBracketingFrameParametersIfNeededUsingFrame:(int)a3 err:;
@end

@implementation BWUBProcessorInput

- (BWUBProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BWUBProcessorInput;
  v4 = [(BWStillImageProcessorControllerInput *)&v6 initWithSettings:a3 portType:a4];
  if (v4)
  {
    v4->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_keepFrames = 1;
    v4->_fusionMode = 0;
    v4->_oisRecenteringLoggingData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  referenceFrame = self->_referenceFrame;
  if (referenceFrame) {
    CFRelease(referenceFrame);
  }
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame) {
    CFRelease(errorRecoveryFrame);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWUBProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (BOOL)keepFrames
{
  return self->_keepFrames;
}

- (void)setKeepFrames:(BOOL)a3
{
  if (self->_keepFrames != a3)
  {
    self->_keepFrames = a3;
    if (!a3) {
      [(NSMutableArray *)self->_frames removeAllObjects];
    }
  }
}

- (NSMutableDictionary)oisRecenteringLoggingData
{
  return self->_oisRecenteringLoggingData;
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  int receivedFrames = self->_receivedFrames;
  int v6 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] referenceFrameIndex];
  ++self->_receivedFrames;
  if (![(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] adaptiveBracketingParameters])
  {
    int v11 = self->_receivedFrames;
    BOOL v10 = v11 == [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] expectedFrameCount];
    p_receivedAllFrames = &self->_receivedAllFrames;
LABEL_8:
    BOOL *p_receivedAllFrames = v10;
    goto LABEL_9;
  }
  char AdaptiveBracketingFrame = BWIsLastAdaptiveBracketingFrame(a3);
  p_receivedAllFrames = &self->_receivedAllFrames;
  self->_receivedAllFrames = AdaptiveBracketingFrame;
  int adaptiveBracketingStopFrameCount = self->_adaptiveBracketingStopFrameCount;
  if (adaptiveBracketingStopFrameCount >= 1)
  {
    BOOL v10 = (AdaptiveBracketingFrame & 1) != 0 || self->_receivedFrames >= adaptiveBracketingStopFrameCount;
    goto LABEL_8;
  }
LABEL_9:
  if (self->_keepFrames) {
    [(NSMutableArray *)self->_frames addObject:a3];
  }
  if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType] == 11)
  {
    v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    v13 = (void *)[v12 objectForKeyedSubscript:*MEMORY[0x1E4F54288]];
    if (v13)
    {
      v14 = v13;
      objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54EB8]), "floatValue");
      float v16 = v15;
      objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54EC0]), "floatValue");
      float v18 = v17;
      objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54EC8]), "floatValue");
      int v20 = v19;
      int v21 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", @"numberOfFrames"), "intValue");
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73020), "floatValue");
      if (*(float *)&v22 < v16)
      {
        *(float *)&double v22 = v16;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [NSNumber numberWithFloat:v22], 0x1EFA73020);
        *(float *)&double v23 = v18;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [NSNumber numberWithFloat:v23], 0x1EFA73040);
        LODWORD(v24) = v20;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [NSNumber numberWithFloat:v24], 0x1EFA730A0);
      }
      v25 = NSNumber;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73060), "floatValue");
      float v26 = (float)v21;
      float v28 = v16 + (float)(v27 * (float)v21);
      uint64_t v29 = (v21 + 1);
      *(float *)&double v30 = v28 / (float)(int)v29;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [v25 numberWithFloat:v30], 0x1EFA73060);
      v31 = NSNumber;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA73080), "floatValue");
      *(float *)&double v33 = (float)(v18 + (float)(v32 * v26)) / (float)(int)v29;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [v31 numberWithFloat:v33], 0x1EFA73080);
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F98]), "floatValue");
      float v35 = v34;
      v36 = NSNumber;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA730C0), "floatValue");
      *(float *)&double v38 = (float)(v35 + (float)(v37 * v26)) / (float)(int)v29;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [v36 numberWithFloat:v38], 0x1EFA730C0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v29], @"numberOfFrames");
    }
  }
  delegate = self->_delegate;
  [(BWUBProcessorInputDelegate *)delegate input:self addFrame:a3 isReferenceFrame:receivedFrames == v6];
}

- (int)receivedFrames
{
  return self->_receivedFrames;
}

- (BOOL)receivedAllFrames
{
  return self->_receivedAllFrames;
}

- (opaqueCMSampleBuffer)referenceFrame
{
  referenceFrame = self->_referenceFrame;
  if (referenceFrame) {
    return referenceFrame;
  }
  if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] referenceFrameIndex] < 0|| (int v4 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] referenceFrameIndex], [(NSMutableArray *)self->_frames count] <= (unint64_t)v4))
  {
    if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType] != 2|| ![(NSMutableArray *)self->_frames count])
    {
      return 0;
    }
    uint64_t v8 = 0;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v10 = *MEMORY[0x1E4F54188];
    while (1)
    {
      referenceFrame = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v8];
      if ((objc_msgSend((id)objc_msgSend((id)CMGetAttachment(referenceFrame, v9, 0), "objectForKeyedSubscript:", v10), "BOOLValue") & 1) == 0)break; {
      if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v8)
      }
        return 0;
    }
    return referenceFrame;
  }
  frames = self->_frames;
  uint64_t v6 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] referenceFrameIndex];
  return (opaqueCMSampleBuffer *)[(NSMutableArray *)frames objectAtIndexedSubscript:v6];
}

- (void)_setReferenceFrame:(void *)result
{
  if (result)
  {
    v3 = result;
    result = (void *)result[10];
    if (result != cf)
    {
      if (result) {
        CFRelease(result);
      }
      if (cf) {
        result = CFRetain(cf);
      }
      else {
        result = 0;
      }
      v3[10] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)evMinusReferenceFrame
{
  if (([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureFlags] & 0x100000) == 0|| ![(NSMutableArray *)self->_frames count])
  {
    return 0;
  }
  uint64_t v3 = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v5 = *MEMORY[0x1E4F541A8];
  uint64_t v6 = *MEMORY[0x1E4F53450];
  while (1)
  {
    v7 = (const void *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v3];
    uint64_t v8 = (void *)CMGetAttachment(v7, v4, 0);
    if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v5), "BOOLValue")) {
      break;
    }
    objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v6), "floatValue");
    if (v9 < 0.0) {
      break;
    }
    if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v3) {
      return 0;
    }
  }
  return (opaqueCMSampleBuffer *)v7;
}

- (opaqueCMSampleBuffer)errorRecoveryFrame
{
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (!errorRecoveryFrame)
  {
    CFStringRef v4 = [(BWUBProcessorInput *)self referenceFrame];
    if ([(NSMutableArray *)self->_frames count])
    {
      uint64_t v5 = 0;
      while (1)
      {
        errorRecoveryFrame = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v5];
        if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] isUnifiedBracketingErrorRecoveryFrame:errorRecoveryFrame isReferenceFrame:errorRecoveryFrame == v4])
        {
          break;
        }
        if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return errorRecoveryFrame;
}

- (void)_setErrorRecoveryFrame:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)result[11];
    if (result != cf)
    {
      if (result) {
        CFRelease(result);
      }
      if (cf) {
        result = CFRetain(cf);
      }
      else {
        result = 0;
      }
      v3[11] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)originalImage
{
  if (![(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] deliverOriginalImage])return 0; {
  return [(BWUBProcessorInput *)self errorRecoveryFrame];
  }
}

- (void)stopAdaptiveBracketingNow
{
  if (result)
  {
    v1 = result;
    result = -[BWUBProcessorInput adaptiveBracketingParameters](result);
    if (result)
    {
      uint64_t v2 = (uint64_t)result;
      if (dword_1E96B6888)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWUBAdaptiveBracketingParameters stopAdaptiveBracketing](v2);
      *((unsigned char *)v1 + 72) = 1;
      return (void *)[*((id *)v1 + 6) inputReceivedAllFrames:v1];
    }
  }
  return result;
}

- (void)adaptiveBracketingParameters
{
  if (result)
  {
    uint64_t v1 = objc_msgSend((id)objc_msgSend(result, "captureStreamSettings"), "adaptiveBracketingParameters");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (void *)v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)stopAdaptiveBracketingWithGroup:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] adaptiveBracketingParameters])
  {
    int v5 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] expectedAdaptiveBracketedFrameCaptureCountUsingGroup:v3];
    if (dword_1E96B6888)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_int adaptiveBracketingStopFrameCount = v5;
    if (!self->_receivedAllFrames && v5 >= 1)
    {
      int receivedFrames = self->_receivedFrames;
      self->_receivedAllFrames = receivedFrames >= v5;
      if (receivedFrames >= v5) {
        [(BWUBProcessorInputDelegate *)self->_delegate inputReceivedAllFrames:self];
      }
    }
  }
}

- (void)updateAdaptiveBracketingFrameParametersIfNeededUsingFrame:(int)a3 err:
{
  if (a1)
  {
    if (a3)
    {
      CFStringRef v4 = -[BWUBProcessorInput adaptiveBracketingParameters](a1);
      -[BWUBAdaptiveBracketingParameters stopAdaptiveBracketing]((uint64_t)v4);
    }
    else if ((objc_msgSend((id)objc_msgSend(a1, "captureStreamSettings"), "reachedEndOfAdaptiveBracketing") & 1) == 0)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F531E0]), "intValue")+ 1;
      v7 = -[BWUBProcessorInput adaptiveBracketingParameters](a1);
      -[BWUBAdaptiveBracketingParameters updateAdaptiveBracketingFrameParametersUsingGroup:]((uint64_t)v7, v6);
    }
  }
}

- (BWUBProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (BOOL)emitErrorRecoveryFrame
{
  return self->_emitErrorRecoveryFrame;
}

- (void)setEmitErrorRecoveryFrame:(BOOL)a3
{
  self->_emitErrorRecoveryFrame = a3;
}

- (unsigned)remainingProcessingCount
{
  return self->_remainingProcessingCount;
}

- (void)setRemainingProcessingCount:(unsigned int)a3
{
  self->_remainingProcessingCount = a3;
}

@end