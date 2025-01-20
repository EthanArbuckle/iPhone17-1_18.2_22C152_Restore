@interface BWDeepFusionProcessorRequest
- (BOOL)cacheBuffers;
- (BWDeepFusionProcessorControllerDelegate)delegate;
- (BWDeepFusionProcessorInput)input;
- (IBPDeepFusionOutput)output;
- (NSSet)expectedBufferTypes;
- (id)description;
- (id)initWithInput:(void *)a3 delegate:;
- (int)demosaicedRawErr;
- (int)err;
- (uint64_t)receivedAllBuffers;
- (void)dealloc;
- (void)setCacheBuffers:(BOOL)a3;
- (void)setDemosaicedRawErr:(int)a3;
- (void)setErr:(int)a3;
- (void)setOutput:(id)a3;
@end

@implementation BWDeepFusionProcessorRequest

- (id)initWithInput:(void *)a3 delegate:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)BWDeepFusionProcessorRequest;
  id v5 = objc_msgSendSuper2(&v16, sel_init);
  if (v5)
  {
    *((void *)v5 + 1) = a2;
    *((void *)v5 + 2) = a3;
    v6 = (void *)[*((id *)v5 + 1) captureStreamSettings];
    unint64_t v7 = [v6 captureFlags];
    if ((v7 & 4) != 0) {
      int v8 = ((int)(v7 >> 2) >> 31) + [v6 expectedEVZeroFrameCount] - 1;
    }
    else {
      int v8 = 0;
    }
    *((_DWORD *)v5 + 6) = v8;
    v9 = (void *)[*((id *)v5 + 1) captureStreamSettings];
    int v10 = *((_DWORD *)v5 + 6);
    uint64_t v11 = [v9 captureFlags];
    if ((v11 & 4) == 0)
    {
      v12 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:&unk_1EFB04520];
      if ((v11 & 0x400000) != 0)
      {
        v13 = &unk_1EFB01958;
LABEL_18:
        [v12 addObject:v13];
      }
LABEL_19:
      *((void *)v5 + 4) = v12;
      return v5;
    }
    v14 = (void *)[MEMORY[0x1E4F1CA80] setWithObject:&unk_1EFB01880];
    v12 = v14;
    if (v10 >= 1) {
      [v14 addObject:&unk_1EFB01898];
    }
    if ((v11 & 0x200000000) != 0)
    {
      [v12 addObject:&unk_1EFB018B0];
      if ((v11 & 0x100000) == 0)
      {
LABEL_13:
        if ((v11 & 0x400000) == 0) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    else if ((v11 & 0x100000) == 0)
    {
      goto LABEL_13;
    }
    [v12 addObject:&unk_1EFB018C8];
    if ((v11 & 0x400000) == 0) {
      goto LABEL_19;
    }
LABEL_17:
    v13 = &unk_1EFB018E0;
    goto LABEL_18;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(BWDeepFusionProcessorInput *)self->_input inputBuffers];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F52DD0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = (void *)CVBufferCopyAttachment((CVBufferRef)[v9 buffer], v7, 0);
        [v10 releaseAll];

        CVBufferRemoveAttachment((CVBufferRef)[v9 buffer], v7);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [(BWDeepFusionProcessorInput *)self->_input setDelegate:0];

  v11.receiver = self;
  v11.super_class = (Class)BWDeepFusionProcessorRequest;
  [(BWDeepFusionProcessorRequest *)&v11 dealloc];
}

- (uint64_t)receivedAllBuffers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 8) onlyApplyingSemanticStyle])
    {
      return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "inputBuffers"), "count") != 0;
    }
    else
    {
      v2 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v3 = objc_msgSend(*(id *)(v1 + 8), "inputBuffers", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        int v6 = 0;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v3);
            }
            v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
            if ([v9 type] == 24) {
              ++v6;
            }
            if ([v9 type] != 19) {
              objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "type")));
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v5);
      }
      else
      {
        int v6 = 0;
      }
      if (v6 == *(_DWORD *)(v1 + 24)) {
        return [*(id *)(v1 + 32) isEqualToSet:v2];
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ cache:%d", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), self->_cacheBuffers];
}

- (BWDeepFusionProcessorInput)input
{
  return self->_input;
}

- (BWDeepFusionProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSSet)expectedBufferTypes
{
  return self->_expectedBufferTypes;
}

- (IBPDeepFusionOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (int)demosaicedRawErr
{
  return self->_demosaicedRawErr;
}

- (void)setDemosaicedRawErr:(int)a3
{
  self->_demosaicedRawErr = a3;
}

- (BOOL)cacheBuffers
{
  return self->_cacheBuffers;
}

- (void)setCacheBuffers:(BOOL)a3
{
  self->_cacheBuffers = a3;
}

@end