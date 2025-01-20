@interface BWUBProcessorRequest
- (BOOL)deliveredDeferredProxyImage;
- (BOOL)inferencesAvailable;
- (BOOL)provideInferenceInputImageForProcessing;
- (BWUBProcessorInput)input;
- (UBDeepFusionOutput)deepFusionOutput;
- (UBFusionOutput)output;
- (float)maxExposureTimesOfFramesAddedForMultiFrameProcessing;
- (float)minExposureTimesOfFramesAddedForMultiFrameProcessing;
- (float)totalExposureTimesOfFramesAddedForMultiFrameProcessing;
- (id)description;
- (int)err;
- (int)numberOfFramesAddedForMultiFrameProcessing;
- (uint64_t)expectedFrameCount;
- (uint64_t)imageType;
- (uint64_t)processingType;
- (uint64_t)receivedAllFrames;
- (uint64_t)useFrameForMultiFrameProcessing:(uint64_t)result;
- (void)dealloc;
- (void)initWithInput:(void *)a3 output:(void *)a4 deepFusionOutput:(char)a5 processErrorRecoveryFrame:(char)a6 processOriginalImage:(char)a7 processSemanticRendering:(char)a8 provideInferenceInputImageForProcessing:(char)a9 inferencesAvailable:(void *)a10 delegate:;
- (void)setDeliveredDeferredProxyImage:(BOOL)a3;
- (void)setErr:(int)a3;
- (void)setMaxExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3;
- (void)setMinExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3;
- (void)setNumberOfFramesAddedForMultiFrameProcessing:(int)a3;
- (void)setTotalExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3;
@end

@implementation BWUBProcessorRequest

- (void)initWithInput:(void *)a3 output:(void *)a4 deepFusionOutput:(char)a5 processErrorRecoveryFrame:(char)a6 processOriginalImage:(char)a7 processSemanticRendering:(char)a8 provideInferenceInputImageForProcessing:(char)a9 inferencesAvailable:(void *)a10 delegate:
{
  if (!a1) {
    return 0;
  }
  v19.receiver = a1;
  v19.super_class = (Class)BWUBProcessorRequest;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  if (v17)
  {
    v17[1] = a2;
    v17[2] = a3;
    v17[3] = a4;
    *((unsigned char *)v17 + 32) = a5;
    *((unsigned char *)v17 + 33) = a6;
    *((unsigned char *)v17 + 34) = a7;
    *((unsigned char *)v17 + 35) = a8;
    *((unsigned char *)v17 + 36) = a9;
    v17[5] = a10;
    *(void *)((char *)v17 + 60) = 0x8000007F7FFFFFLL;
  }
  return v17;
}

- (void)dealloc
{
  [(BWUBProcessorInput *)self->_input setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWUBProcessorRequest;
  [(BWUBProcessorRequest *)&v3 dealloc];
}

- (BWUBProcessorInput)input
{
  return self->_input;
}

- (UBFusionOutput)output
{
  return self->_output;
}

- (UBDeepFusionOutput)deepFusionOutput
{
  return self->_deepFusionOutput;
}

- (BOOL)provideInferenceInputImageForProcessing
{
  return self->_provideInferenceInputImageForProcessing;
}

- (BOOL)inferencesAvailable
{
  return self->_inferencesAvailable;
}

- (uint64_t)imageType
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    if (*(unsigned char *)(v1 + 33)) {
      return 4;
    }
    if (v2 == 12)
    {
      if (*(unsigned char *)(v1 + 32))
      {
        return 14;
      }
      else if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "deliverDeferredPhotoProxyImage"))
      {
        return 7;
      }
      else
      {
        return 13;
      }
    }
    else
    {
      if (v2 == 11)
      {
        BOOL v3 = *(unsigned char *)(v1 + 32) == 0;
        uint64_t v4 = 5;
      }
      else
      {
        if (v2 != 10) {
          return 1;
        }
        BOOL v3 = *(unsigned char *)(v1 + 32) == 0;
        uint64_t v4 = 2;
      }
      if (v3) {
        return v4;
      }
      else {
        return v4 + 1;
      }
    }
  }
  return result;
}

- (uint64_t)processingType
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    if (*(unsigned char *)(v1 + 32) || *(unsigned char *)(v1 + 33))
    {
      return 0;
    }
    else if ((v2 - 10) >= 3)
    {
      return 0;
    }
    else
    {
      return (v2 - 9);
    }
  }
  return result;
}

- (uint64_t)expectedFrameCount
{
  if (result)
  {
    uint64_t v1 = result;
    if (-[BWUBProcessorRequest processingType](result))
    {
      int v2 = (void *)[*(id *)(v1 + 8) captureStreamSettings];
      return [v2 expectedFrameCount];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)receivedAllFrames
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 32))
    {
      uint64_t v2 = [*(id *)(result + 8) errorRecoveryFrame];
      return v2 != 0;
    }
    BOOL v3 = *(void **)(result + 8);
    if (*(unsigned char *)(v1 + 33))
    {
      uint64_t v2 = [v3 originalImage];
      return v2 != 0;
    }
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "captureStreamSettings"), "adaptiveBracketingParameters");
    v5 = *(void **)(v1 + 8);
    if (v4)
    {
      return [v5 receivedAllFrames];
    }
    else
    {
      if (v5) {
        v5 = (void *)v5[7];
      }
      uint64_t v6 = [v5 count];
      if (-[BWUBProcessorRequest processingType](v1)) {
        uint64_t v7 = (int)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureStreamSettings"), "expectedFrameCount");
      }
      else {
        uint64_t v7 = 1;
      }
      return v6 == v7;
    }
  }
  return result;
}

- (uint64_t)useFrameForMultiFrameProcessing:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = -[BWUBProcessorRequest processingType](result);
    switch(v4)
    {
      case 3:
        goto LABEL_5;
      case 2:
        return objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue") ^ 1;
      case 1:
LABEL_5:
        uint64_t v5 = *(void *)(v3 + 8);
        if (v5) {
          uint64_t v6 = *(void **)(v5 + 56);
        }
        else {
          uint64_t v6 = 0;
        }
        int v7 = [v6 count];
        unsigned int v8 = v7 - 1;
        do
        {
          BOOL v9 = __OFSUB__(v7--, 1);
          if (v7 < 0 != v9) {
            return 1;
          }
          uint64_t v10 = *(void *)(v3 + 8);
          if (v10) {
            v11 = *(void **)(v10 + 56);
          }
          else {
            v11 = 0;
          }
          uint64_t v12 = [v11 objectAtIndexedSubscript:v8--];
        }
        while ((const void *)v12 != a2);
        int v13 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "captureStreamSettings"), "referenceFrameIndex");
        int v14 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "captureStreamSettings"), "isUnifiedBracketingErrorRecoveryFrame:isReferenceFrame:", a2, v13 == v7);
        if (v13 == v7) {
          return 1;
        }
        else {
          return v14 ^ 1u;
        }
      default:
        return 0;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@ %p>: captureID:%lld, captureType=%@, %@, errorRecovery=%d, original=%d semanticRendering=%d inferenceInput=%d inferences=%d", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), self->_processErrorRecoveryFrame, self->_processOriginalImage, self->_processSemanticRendering, self->_provideInferenceInputImageForProcessing,
               self->_inferencesAvailable);
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (int)numberOfFramesAddedForMultiFrameProcessing
{
  return self->_numberOfFramesAddedForMultiFrameProcessing;
}

- (void)setNumberOfFramesAddedForMultiFrameProcessing:(int)a3
{
  self->_numberOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)totalExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_totalExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setTotalExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_totalExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)minExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_minExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setMinExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_minExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)maxExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_maxExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setMaxExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_maxExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (BOOL)deliveredDeferredProxyImage
{
  return self->_deliveredDeferredProxyImage;
}

- (void)setDeliveredDeferredProxyImage:(BOOL)a3
{
  self->_deliveredDeferredProxyImage = a3;
}

@end