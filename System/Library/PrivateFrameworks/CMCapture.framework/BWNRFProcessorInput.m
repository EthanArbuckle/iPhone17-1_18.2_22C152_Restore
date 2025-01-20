@interface BWNRFProcessorInput
- (BOOL)emitErrorRecoveryFrame;
- (BOOL)keepFrames;
- (BOOL)receivedAllFrames;
- (BWNRFProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWNRFProcessorInputDelegate)delegate;
- (NSMutableDictionary)oisRecenteringLoggingData;
- (NSString)description;
- (int)expectedFrameCount;
- (int)fusionMode;
- (int)ispMotionHighPassFilterConvergenceFlags;
- (int)receivedFrames;
- (opaqueCMSampleBuffer)errorRecoveryFrame;
- (opaqueCMSampleBuffer)evMinusReferenceFrame;
- (opaqueCMSampleBuffer)originalImage;
- (opaqueCMSampleBuffer)referenceFrame;
- (os_unfair_lock_s)stopAdaptiveBracketingNow;
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
- (void)setProcessedRawErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3;
- (void)setRemainingProcessingCount:(unsigned int)a3;
- (void)stopAdaptiveBracketingWithGroup:(int)a3;
@end

@implementation BWNRFProcessorInput

- (BWNRFProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BWNRFProcessorInput;
  v4 = [(BWStillImageProcessorControllerInput *)&v6 initWithSettings:a3 portType:a4];
  if (v4)
  {
    v4->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_keepFrames = 1;
    v4->_fusionMode = 0;
    v4->_oisRecenteringLoggingData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_ispMotionHighPassFilterConvergenceFlags = 0;
  }
  return v4;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_gainMapPixelBuffer);
  self->_gainMapPixelBuffer = 0;
  referenceFrame = self->_referenceFrame;
  if (referenceFrame) {
    CFRelease(referenceFrame);
  }
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame) {
    CFRelease(errorRecoveryFrame);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWNRFProcessorInput;
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

- (int)ispMotionHighPassFilterConvergenceFlags
{
  return self->_ispMotionHighPassFilterConvergenceFlags;
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  if (!a3)
  {
    FigDebugAssert3();
    return;
  }
  unint64_t v5 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a3);
  ++self->_receivedFrames;
  if (self->_keepFrames) {
    [(NSMutableArray *)self->_frames addObject:a3];
  }
  if (objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count"))
  {
    char AdaptiveBracketingFrame = BWIsLastAdaptiveBracketingFrame(a3);
    p_receivedAllFrames = &self->_receivedAllFrames;
    self->_receivedAllFrames = AdaptiveBracketingFrame;
    int adaptiveBracketingStopFrameCount = self->_adaptiveBracketingStopFrameCount;
    if (adaptiveBracketingStopFrameCount < 1) {
      goto LABEL_11;
    }
    BOOL v9 = (AdaptiveBracketingFrame & 1) != 0 || self->_receivedFrames >= adaptiveBracketingStopFrameCount;
  }
  else
  {
    int receivedFrames = self->_receivedFrames;
    BOOL v9 = receivedFrames == [(BWNRFProcessorInput *)self expectedFrameCount];
    p_receivedAllFrames = &self->_receivedAllFrames;
  }
  BOOL *p_receivedAllFrames = v9;
LABEL_11:
  if ([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType] == 11)
  {
    v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    v12 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F54280]];
    if (v12)
    {
      if (([v12 isEqualToString:*MEMORY[0x1E4F54E78]] & 1) == 0)
      {
        v13 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F54288]];
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
          objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F98]), "floatValue");
          float v35 = v34;
          v36 = NSNumber;
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oisRecenteringLoggingData, "objectForKeyedSubscript:", 0x1EFA730C0), "floatValue");
          *(float *)&double v38 = (float)(v35 + (float)(v37 * v26)) / (float)(int)v29;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [v36 numberWithFloat:v38], 0x1EFA730C0);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oisRecenteringLoggingData, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v29], @"numberOfFrames");
        }
        v39 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53FA8]];
        if (v39) {
          self->_ispMotionHighPassFilterConvergenceFlags = [v39 intValue];
        }
      }
    }
  }
  delegate = self->_delegate;
  [(BWNRFProcessorInputDelegate *)delegate input:self addFrame:a3 isReferenceFrame:(v5 >> 4) & 1];
}

- (int)receivedFrames
{
  return self->_receivedFrames;
}

- (BOOL)receivedAllFrames
{
  return self->_receivedAllFrames;
}

- (int)expectedFrameCount
{
  if ([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureType] == 12&& ([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags] & 4) != 0)
  {
    if (([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags] & 0x100000) != 0)return 2; {
    else
    }
      return 1;
  }
  else if (([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags] & 8) != 0)
  {
    return 1;
  }
  else
  {
    uint64_t v3 = objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count");
    v4 = [(BWStillImageProcessorControllerInput *)self captureStreamSettings];
    if (v3)
    {
      return [(BWStillImageCaptureStreamSettings *)v4 currentExpectedAdaptiveBracketedFrameCaptureCount];
    }
    else
    {
      return [(BWStillImageCaptureStreamSettings *)v4 expectedFrameCount];
    }
  }
}

- (opaqueCMSampleBuffer)referenceFrame
{
  int v3 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType];
  referenceFrame = self->_referenceFrame;
  if (referenceFrame) {
    return referenceFrame;
  }
  if (v3 != 1 && v3 != 7)
  {
    if (v3 == 2)
    {
      if ([(NSMutableArray *)self->_frames count])
      {
        uint64_t v6 = 0;
        CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53070];
        uint64_t v8 = *MEMORY[0x1E4F54188];
        uint64_t v9 = *MEMORY[0x1E4F53CA0];
        while (1)
        {
          referenceFrame = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v6];
          v10 = (void *)CMGetAttachment(referenceFrame, v7, 0);
          if ((objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v8), "BOOLValue") & 1) == 0
            && !objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v9), "BOOLValue"))
          {
            break;
          }
          if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v6) {
            return 0;
          }
        }
        return referenceFrame;
      }
    }
    else if ([(NSMutableArray *)self->_frames count])
    {
      uint64_t v12 = 0;
      while (1)
      {
        referenceFrame = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v12];
        if ((BWStillImageCaptureFrameFlagsForSampleBuffer(referenceFrame) & 0x10) != 0) {
          break;
        }
        if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v12) {
          return 0;
        }
      }
      return referenceFrame;
    }
    return 0;
  }
  frames = self->_frames;
  return (opaqueCMSampleBuffer *)[(NSMutableArray *)frames firstObject];
}

- (void)_setReferenceFrame:(void *)result
{
  if (result)
  {
    int v3 = result;
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

- (opaqueCMSampleBuffer)evMinusReferenceFrame
{
  if (([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureFlags] & 0x100000) == 0|| ![(NSMutableArray *)self->_frames count])
  {
    return 0;
  }
  uint64_t v3 = 0;
  while (1)
  {
    v4 = (const void *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v3];
    if ((BWStillImageCaptureFrameFlagsForSampleBuffer(v4) & 4) != 0) {
      break;
    }
    if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v3) {
      return 0;
    }
  }
  return (opaqueCMSampleBuffer *)v4;
}

- (void)setProcessedRawErrorRecoveryFrame:(opaqueCMSampleBuffer *)a3
{
  -[BWNRFProcessorInput _setErrorRecoveryFrame:](self, a3);
  delegate = self->_delegate;
  [(BWNRFProcessorInputDelegate *)delegate inputReceivedProcessedRawErrorRecoveryFrame:self];
}

- (void)_setErrorRecoveryFrame:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)result[12];
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
      v3[12] = result;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)errorRecoveryFrame
{
  errorRecoveryFrame = self->_errorRecoveryFrame;
  if (errorRecoveryFrame) {
    return errorRecoveryFrame;
  }
  int v5 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureType];
  frames = self->_frames;
  if (v5 != 1)
  {
    if (![(NSMutableArray *)frames count]) {
      return 0;
    }
    uint64_t v7 = 0;
    while (1)
    {
      errorRecoveryFrame = (opaqueCMSampleBuffer *)[(NSMutableArray *)self->_frames objectAtIndexedSubscript:v7];
      if ((BWStillImageCaptureFrameFlagsForSampleBuffer(errorRecoveryFrame) & 0x20) != 0) {
        break;
      }
      if ([(NSMutableArray *)self->_frames count] <= (unint64_t)++v7) {
        return 0;
      }
    }
    return errorRecoveryFrame;
  }
  return (opaqueCMSampleBuffer *)[(NSMutableArray *)frames firstObject];
}

- (opaqueCMSampleBuffer)originalImage
{
  if (![(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] deliverOriginalImage])return 0; {
  return [(BWNRFProcessorInput *)self errorRecoveryFrame];
  }
}

- (os_unfair_lock_s)stopAdaptiveBracketingNow
{
  if (result)
  {
    v1 = result;
    result = (os_unfair_lock_s *)-[BWNRFProcessorInput adaptiveBracketingParameters](result);
    if (result)
    {
      v2 = result;
      if (dword_1E96B6A88)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      os_unfair_lock_lock(v2 + 2);
      LOBYTE(v2[6]._os_unfair_lock_opaque) = 1;
      os_unfair_lock_unlock(v2 + 2);
      LOBYTE(v1[20]._os_unfair_lock_opaque) = 1;
      return (os_unfair_lock_s *)[*(id *)&v1[12]._os_unfair_lock_opaque inputReceivedAllFrames:v1];
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
    if (dword_1E96B6A88)
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
        [(BWNRFProcessorInputDelegate *)self->_delegate inputReceivedAllFrames:self];
      }
    }
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] settingsID];
  uint64_t v6 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureType]);
  return (NSString *)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType:%@ portType:%@ receivedFrames:%d fusionMode:%@ keepFrames:%d emitErrRecovery:%d processingCount:%u", v4, self, v5, v6, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_receivedFrames, BWPhotoEncoderStringFromEncodingScheme(self->_fusionMode), self->_keepFrames, self->_emitErrorRecoveryFrame, self->_remainingProcessingCount];
}

- (BWNRFProcessorInputDelegate)delegate
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