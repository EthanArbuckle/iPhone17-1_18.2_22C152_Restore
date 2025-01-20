@interface BWAppClipCodeNode
+ (void)initialize;
- (BWAppClipCodeNode)initWithProcessingQueuePriority:(unsigned int)a3;
- (BWMetadataDetectedResultsObserver)detectedResultsObserver;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_endAppClipCodeSession;
- (void)_processSampleBuffer:(uint64_t)a1;
- (void)_startAppClipCodeSession;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didReceiveAppC3DUpdate:(void *)a3 userData:;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDetectedResultsObserver:(id)a3;
@end

@implementation BWAppClipCodeNode

- (id)nodeType
{
  return @"Effect";
}

- (void)setDetectedResultsObserver:(id)a3
{
  self->_detectedResultsObserver = (BWMetadataDetectedResultsObserver *)a3;
}

- (BWAppClipCodeNode)initWithProcessingQueuePriority:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWAppClipCodeNode;
  v3 = [(BWNode *)&v9 init];
  if (v3)
  {
    v4 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v3];
    [(BWNodeInput *)v4 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNode *)v3 addInput:v4];
    [(BWFormatRequirements *)[(BWNodeInput *)v3->super._input formatRequirements] setSupportedPixelFormats:&unk_1EFB02D50];
    v5 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v3];
    [(BWNodeOutput *)v5 setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:0]];
    [(BWNode *)v3 addOutput:v5];
    v3->_weakSelf = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:v3];
    v3->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    if (MEMORY[0x1E4F4AC20]) {
      BOOL v6 = MEMORY[0x1E4F4AC28] == 0;
    }
    else {
      BOOL v6 = 1;
    }
    char v7 = !v6;
    v3->_appC3DAvailable = v7;
  }
  return v3;
}

+ (void)initialize
{
}

- (void)dealloc
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__BWAppClipCodeNode_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(processingQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)BWAppClipCodeNode;
  [(BWNode *)&v4 dealloc];
}

uint64_t __28__BWAppClipCodeNode_dealloc__block_invoke(uint64_t a1)
{
  return -[BWAppClipCodeNode _endAppClipCodeSession](*(void *)(a1 + 32));
}

- (uint64_t)_endAppClipCodeSession
{
  if (result)
  {
    uint64_t v1 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!result)
    {
      fig_log_get_emitter();
      result = FigDebugAssert3();
    }
    if (*(unsigned char *)(v1 + 104))
    {
      result = *(void *)(v1 + 96);
      if (result)
      {
        result = AppC3DRelease();
        *(void *)(v1 + 96) = 0;
      }
    }
  }
  return result;
}

- (id)nodeSubType
{
  return @"AppClipCode";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BWAppClipCodeNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(processingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)BWAppClipCodeNode;
  [(BWNode *)&v4 prepareForCurrentConfigurationToBecomeLive];
}

void __63__BWAppClipCodeNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
}

- (void)_startAppClipCodeSession
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (*(unsigned char *)(a1 + 104))
    {
      if (!*(void *)(a1 + 96))
      {
        AppC3DConfigCreate();
        AppC3DConfigSetTrackingMode();
        AppC3DConfigSetMaxNumberCodesToTrack();
        AppC3DCreate();
        AppC3DSetUpdateCallback();
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  BOOL v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53000], 0);
  char v7 = v6;
  if (v6) {
    dispatch_group_enter(v6);
  }
  if (objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530F8], 0), "BOOLValue"))
  {
    processingQueue = self->_processingQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__BWAppClipCodeNode_renderSampleBuffer_forInput___block_invoke;
    v9[3] = &unk_1E5C24F10;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(processingQueue, v9);
  }
  if (v7) {
    dispatch_group_leave(v7);
  }
}

void __49__BWAppClipCodeNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
}

- (void)_processSampleBuffer:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      uint64_t v13 = v2;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    CFTypeRef cf = 0;
    memset(&v18, 0, sizeof(v18));
    CMSampleBufferGetPresentationTimeStamp(&v18, a2);
    *(CMTime *)time = v18;
    CMTimeGetSeconds((CMTime *)time);
    long long v17 = 0u;
    memset(time, 0, sizeof(time));
    v5 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F1F218], 0);
    if (v5)
    {
      BOOL v6 = v5;
      if ([v5 length] == 48)
      {
        objc_msgSend(v6, "getBytes:length:", time, objc_msgSend(v6, "length"));
        double v20 = *(float *)time;
        double v21 = *(float *)&time[16];
        float64x2_t v22 = vcvtq_f64_f32((float32x2_t)__PAIR64__(*(unsigned int *)&time[4], v17));
        float64x2_t v23 = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)&time[16], *(int32x2_t *)&v17));
        float64x2_t v24 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)time, *(int8x16_t *)time, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&time[16], *(int8x16_t *)&time[16], 8uLL)));
        double v25 = *((float *)&v17 + 2);
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
        if (ImageBuffer && !*(unsigned char *)(a1 + 128))
        {
          CVImageBufferRef v8 = ImageBuffer;
          *(_DWORD *)(a1 + 132) = objc_msgSend((id)CMGetAttachment(ImageBuffer, @"RotationDegrees", 0), "intValue");
          *(unsigned char *)(a1 + 136) = objc_msgSend((id)CMGetAttachment(v8, @"MirroredHorizontal", 0), "BOOLValue");
          *(unsigned char *)(a1 + 137) = objc_msgSend((id)CMGetAttachment(v8, @"MirroredVertical", 0), "BOOLValue");
          *(unsigned char *)(a1 + 128) = 1;
        }
        objc_super v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v12, v13);
        CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CMTime v15 = v18;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMTimeCopyAsDictionary(&v15, v10), @"pts");
        memset(&v14, 0, sizeof(v14));
        BWGetOriginalPresentationTimeStampFromBuffer(a2, (uint64_t)&v14);
        CMTime v15 = v14;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMTimeCopyAsDictionary(&v15, v10), @"OriginalPTS");
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F530D8], 0), @"primaryCaptureRectBeforeCropping");
        [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];
        if (*(unsigned char *)(a1 + 104))
        {
          CMSampleBufferGetImageBuffer(a2);
          AppC3DProcessCameraFrameData();
          CFTypeRef v11 = cf;
          if (cf || (AppC3DFlush(), (CFTypeRef v11 = cf) != 0)) {
            CFRelease(v11);
          }
        }
      }
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__BWAppClipCodeNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWAppClipCodeNode;
  [(BWNode *)&v6 didReachEndOfDataForInput:a3];
}

uint64_t __47__BWAppClipCodeNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return -[BWAppClipCodeNode _endAppClipCodeSession](*(void *)(a1 + 32));
}

- (void)didReceiveAppC3DUpdate:(void *)a3 userData:
{
  if (a1)
  {
    v36 = 0;
    uint64_t NumberOfTrackingData = AppC3DTrackingResultGetNumberOfTrackingData();
    CFDictionaryRef dictionaryRepresentation = (const __CFDictionary *)[a3 objectForKeyedSubscript:@"pts"];
    value = (void *)[MEMORY[0x1E4F1CA48] array];
    if (NumberOfTrackingData)
    {
      uint64_t v5 = 0;
      do
      {
        id v6 = (id)AppC3DTrackingResultCreateData();
        char v7 = v36;
        if (v36) {
          goto LABEL_29;
        }
        uint64_t Metadata = AppC3DTrackingResultGetMetadata();
        char v7 = v36;
        if (v36) {
          goto LABEL_29;
        }
        uint64_t DataVersion = AppC3DTrackingResultGetDataVersion();
        char v7 = v36;
        if (v36) {
          goto LABEL_29;
        }
        id v10 = (id)AppC3DTrackingResultCreateCorners();
        char v7 = v36;
        if (v36) {
          goto LABEL_29;
        }
        if ([v10 count] != 4)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_28;
        }
        CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        rect.size = v11;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a3 objectForKeyedSubscript:@"primaryCaptureRectBeforeCropping"], &rect);
        memset(&sampleTimingArray, 0, 48);
        FigCaptureGetTransformForMirroringRotationAndCrop(*(unsigned __int8 *)(a1 + 136), *(unsigned __int8 *)(a1 + 137), *(_DWORD *)(a1 + 132), (uint64_t)&sampleTimingArray, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
        uint64_t v13 = 0;
        float v14 = 1.0;
        float v15 = 0.0;
        float v16 = 0.0;
        float x = 1.0;
        do
        {
          point.float x = 0.0;
          point.CGFloat y = 0.0;
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v10 objectAtIndexedSubscript:v13], &point);
          CGPoint v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&sampleTimingArray.presentationTimeStamp.timescale, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&sampleTimingArray.duration.epoch, point.y), *(float64x2_t *)&sampleTimingArray.duration.value, point.x));
          CGPoint point = v18;
          CGFloat y = v18.y;
          [v12 addObject:CGPointCreateDictionaryRepresentation(v18)];
          if (point.x < x) {
            float x = point.x;
          }
          if (point.x > v16) {
            float v16 = point.x;
          }
          if (point.y < v14) {
            float v14 = point.y;
          }
          if (point.y > v15) {
            float v15 = point.y;
          }
          ++v13;
        }
        while (v13 != 4);
        v37.origin.float x = x;
        v37.origin.CGFloat y = v14;
        v37.size.width = (float)(v16 - x);
        v37.size.height = (float)(v15 - v14);
        CFDictionaryRef v20 = CGRectCreateDictionaryRepresentation(v37);
        double v21 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v21 setObject:v6 forKeyedSubscript:@"RawData"];
        objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", Metadata), @"Metadata");
        objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", DataVersion), @"Version");
        [v21 setObject:v12 forKeyedSubscript:@"Corners"];
        [v21 setObject:v20 forKeyedSubscript:@"BoundingRect"];
        [v21 setObject:dictionaryRepresentation forKeyedSubscript:@"TimeStamp"];
        [value addObject:v21];
      }
      while (++v5 != NumberOfTrackingData);
    }
    CFDictionaryRef v22 = (const __CFDictionary *)[a3 objectForKeyedSubscript:@"OriginalPTS"];
    memset(&v33, 0, sizeof(v33));
    CMTimeMakeFromDictionary(&v33, v22);
    uint64_t v23 = NumberOfTrackingData;
    if (!NumberOfTrackingData) {
      uint64_t v23 = *(void *)(a1 + 152);
    }
    *(void *)(a1 + 152) = NumberOfTrackingData;
    float64x2_t v24 = *(void **)(a1 + 144);
    sampleTimingArray.duration = v33;
    [v24 node:a1 didEmitCodesCount:NumberOfTrackingData emittedIdentifiers:0 originalPTS:&sampleTimingArray];
    if (v23 >= 1)
    {
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
      long long v31 = *(_OWORD *)&sampleTimingArray.duration.value;
      sampleTimingArray.duration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      CMTimeEpoch epoch = sampleTimingArray.duration.epoch;
      memset(&rect, 0, 24);
      CMTimeMakeFromDictionary((CMTime *)&rect, dictionaryRepresentation);
      *(CGPoint *)&sampleTimingArray.presentationTimeStamp.value = rect.origin;
      sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = *(void *)&rect.size.width;
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v31;
      sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = epoch;
      point.float x = 0.0;
      OSStatus v26 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&point);
      CGFloat v27 = point.x;
      if (*(void *)&point.x && !v26)
      {
        CMSetAttachment(*(CMAttachmentBearerRef *)&point.x, @"AppClipCodes", value, 1u);
        CMSetAttachment(*(CMAttachmentBearerRef *)&point.x, @"AppClipCodesCount", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(value, "count")), 1u);
        [*(id *)(a1 + 16) emitSampleBuffer:*(void *)&point.x];
        CGFloat v27 = point.x;
      }
      if (v27 != 0.0) {
        CFRelease(*(CFTypeRef *)&v27);
      }
    }
LABEL_28:
    char v7 = v36;
    if (v36) {
LABEL_29:
    }
      CFRelease(v7);
  }
}

- (BWMetadataDetectedResultsObserver)detectedResultsObserver
{
  return self->_detectedResultsObserver;
}

@end