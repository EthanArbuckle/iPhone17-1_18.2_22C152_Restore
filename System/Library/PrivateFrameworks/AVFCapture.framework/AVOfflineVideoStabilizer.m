@interface AVOfflineVideoStabilizer
+ (id)offlineVideoStabilizerWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6;
+ (void)initialize;
- (AVOfflineVideoStabilizer)initWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6;
- (NSMutableArray)outputSampleBuffers;
- (int)_setupVISProcessor;
- (int)_validateSourcePixelBuffer:(__CVBuffer *)a3 withSampleTime:(id *)a4 metadata:(id)a5 isEndOfData:(BOOL *)a6;
- (int)_validateStabilizationMetadata:(id)a3 withSampleTime:(id *)a4 isEndOfData:(BOOL *)a5;
- (int)preferredSourcePixelBufferPrimingFrameCount;
- (int)preferredSourceStabilizationMetadataPrimingCount;
- (opaqueCMSampleBuffer)_copyStabilizedSampleBuffer:(id *)a3;
- (opaqueCMSampleBuffer)_createSampleBufferWithPixelBuffer:(__CVBuffer *)a3 sampleTime:(id *)a4 futureMetadata:(id)a5 status:(int *)a6;
- (opaqueCMSampleBuffer)copyStabilizedSampleBuffer:(id *)a3;
- (unint64_t)_extendedRowsOfOutputBuffer;
- (void)_teardownVISProcessor;
- (void)dealloc;
- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
@end

@implementation AVOfflineVideoStabilizer

+ (void)initialize
{
}

+ (id)offlineVideoStabilizerWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  return (id)[v10 initWithTargetFrameDuration:&v12 dataProvider:a4 destinationBufferPool:a5 stabilizationEnabled:v6];
}

- (AVOfflineVideoStabilizer)initWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementOfflineVideoStabilizer))
  {
    if ((a3->var2 & 1) != 0
      && (time1 = (CMTime)*a3, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2) > 0))
    {
      if (a4)
      {
        if (a5)
        {
          v18.receiver = self;
          v18.super_class = (Class)AVOfflineVideoStabilizer;
          v11 = [(AVOfflineVideoStabilizer *)&v18 init];
          $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (AVOfflineVideoStabilizer *)v11;
          if (v11)
          {
            long long v13 = *(_OWORD *)&a3->var0;
            *((void *)v11 + 3) = a3->var3;
            *(_OWORD *)(v11 + 8) = v13;
            *((_DWORD *)v11 + 9) = 1056964608;
            *((_DWORD *)v11 + 8) = vcvtps_s32_f32((float)a3->var1 / (float)a3->var0);
            *((void *)v11 + 5) = [objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a4];
            v12->_pixelBufferPool = (__CVPixelBufferPool *)CFRetain(a5);
            v12->_stabilizationEnabled = a6;
            v12->_outputSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v12->_futureFrameMetadataDicts = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v12->_isFirstFrame = 1;
          }
          return v12;
        }
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      }
      else
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
  }
  v16 = (void *)[v14 exceptionWithName:v15 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v16);
  }
  NSLog(&cfstr_SuppressingExc.isa, v16);
  return 0;
}

- (void)dealloc
{
  [(AVOfflineVideoStabilizer *)self _teardownVISProcessor];

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool) {
    CFRelease(pixelBufferPool);
  }

  cachedVideoFormatDescription = self->_cachedVideoFormatDescription;
  if (cachedVideoFormatDescription) {
    CFRelease(cachedVideoFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVOfflineVideoStabilizer;
  [(AVOfflineVideoStabilizer *)&v5 dealloc];
}

- (opaqueCMSampleBuffer)copyStabilizedSampleBuffer:(id *)a3
{
  unint64_t v6 = 0;
  result = [(AVOfflineVideoStabilizer *)self _copyStabilizedSampleBuffer:&v6];
  if ((unint64_t)result | v6)
  {
LABEL_4:
    if (!a3) {
      return result;
    }
    goto LABEL_5;
  }
  if (self->_videoOutputFrameNumber == 1)
  {
    result = [(AVOfflineVideoStabilizer *)self _copyStabilizedSampleBuffer:&v6];
    goto LABEL_4;
  }
  result = 0;
  if (!a3) {
    return result;
  }
LABEL_5:
  *a3 = (id)v6;
  return result;
}

- (int)preferredSourcePixelBufferPrimingFrameCount
{
  return 2;
}

- (int)preferredSourceStabilizationMetadataPrimingCount
{
  return self->_metadataPrimingCount;
}

- (opaqueCMSampleBuffer)_copyStabilizedSampleBuffer:(id *)a3
{
  int v26 = 0;
  v4 = (void *)[(AVWeakReference *)self->_dataProviderWeakReference referencedObject];
  p_clientMarkedEndOfMetadata = &self->_clientMarkedEndOfMetadata;
  if (self->_clientMarkedEndOfMetadata)
  {
    unint64_t v6 = 0;
LABEL_11:
    if (self->_clientMarkedEndOfVideoData)
    {
      long long v13 = 0;
      v14 = 0;
LABEL_13:
      uint64_t v15 = a3;
LABEL_17:
      objc_super v18 = (void *)[(NSMutableArray *)self->_outputSampleBuffers firstObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v18)
        {
          CFTypeID v19 = CFGetTypeID(v18);
          if (v19 != CMSampleBufferGetTypeID()) {
            goto LABEL_32;
          }
          CMRemoveAttachment(v18, (CFStringRef)*MEMORY[0x1E4F51480]);
          CFRetain(v18);
          [(NSMutableArray *)self->_outputSampleBuffers removeObjectAtIndex:0];
        }
LABEL_33:
        int v11 = v26;
        goto LABEL_34;
      }
      int v26 = [v18 intValue];
      [(NSMutableArray *)self->_outputSampleBuffers removeObjectAtIndex:0];
LABEL_32:
      objc_super v18 = 0;
      goto LABEL_33;
    }
    uint64_t v16 = [(NSMutableArray *)self->_futureFrameMetadataDicts firstObject];
    CMTime v25 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    long long v13 = (const void *)[v4 copySourcePixelBufferForFrameNumber:self->_videoOutputFrameNumber outputSampleTime:&v25 stabilizer:self];
    CMTime time = v25;
    int v26 = [(AVOfflineVideoStabilizer *)self _validateSourcePixelBuffer:v13 withSampleTime:&time metadata:v16 isEndOfData:&self->_clientMarkedEndOfVideoData];
    if (v26)
    {
      v14 = 0;
      goto LABEL_31;
    }
    if (self->_clientMarkedEndOfVideoData)
    {
      int v17 = [(VISProcessor *)self->_visProcessor finishProcessing];
      v14 = 0;
      int v26 = v17;
      self->_isFirstFrame = 1;
      uint64_t v15 = a3;
      if (v17) {
        goto LABEL_32;
      }
      goto LABEL_17;
    }
    CMTime time = v25;
    v14 = [(AVOfflineVideoStabilizer *)self _createSampleBufferWithPixelBuffer:v13 sampleTime:&time futureMetadata:v6 status:&v26];
    if (!v26)
    {
      visProcessor = self->_visProcessor;
      if (!visProcessor)
      {
        int v26 = [(AVOfflineVideoStabilizer *)self _setupVISProcessor];
        if (v26) {
          goto LABEL_31;
        }
        visProcessor = self->_visProcessor;
      }
      int v26 = [(VISProcessor *)visProcessor enqueueBufferForProcessing:v14];
      if (!v26)
      {
        self->_isFirstFrame = 0;
        [(NSMutableArray *)self->_futureFrameMetadataDicts removeObject:v16];
        ++self->_videoOutputFrameNumber;
        goto LABEL_13;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
LABEL_31:
    uint64_t v15 = a3;
    goto LABEL_32;
  }
  unint64_t v6 = 0;
  uint64_t v7 = *MEMORY[0x1E4F52850];
  int64_t metadataOutputFrameNumber = self->_metadataOutputFrameNumber;
  long long v23 = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  while (1)
  {
    *(_OWORD *)&v25.value = v23;
    v25.epoch = v9;
    id v10 = (id)[v4 copySourceStabilizationMetadataForFrameNumber:metadataOutputFrameNumber outputSampleTime:&v25 stabilizer:self];
    CMTime time = v25;
    int v11 = [(AVOfflineVideoStabilizer *)self _validateStabilizationMetadata:v10 withSampleTime:&time isEndOfData:&self->_clientMarkedEndOfMetadata];
    int v26 = v11;
    if (v11) {
      break;
    }
    if (*p_clientMarkedEndOfMetadata)
    {
      int64_t metadataOutputFrameNumber = self->_metadataOutputFrameNumber;
      int64_t metadataPrimingCount = self->_metadataPrimingCount;
      if (metadataOutputFrameNumber < metadataPrimingCount)
      {
        self->_int64_t metadataPrimingCount = metadataOutputFrameNumber;
        LODWORD(metadataPrimingCount) = metadataOutputFrameNumber;
      }
    }
    else
    {
      unint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
      CMTime time = v25;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", CMTimeGetSeconds(&time)), v7);
      CMTime time = v25;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", &time), @"CinematicFutureOutputFramePTSValue");
      [(NSMutableArray *)self->_futureFrameMetadataDicts addObject:v6];
      int64_t metadataOutputFrameNumber = self->_metadataOutputFrameNumber + 1;
      self->_int64_t metadataOutputFrameNumber = metadataOutputFrameNumber;
      LODWORD(metadataPrimingCount) = self->_metadataPrimingCount;
    }
    if (metadataOutputFrameNumber > (int)metadataPrimingCount || *p_clientMarkedEndOfMetadata) {
      goto LABEL_11;
    }
  }
  objc_super v18 = 0;
  long long v13 = 0;
  v14 = 0;
  uint64_t v15 = a3;
LABEL_34:
  if (v11 != -11822)
  {
    if (!v11) {
      goto LABEL_39;
    }
    [(AVOfflineVideoStabilizer *)self _teardownVISProcessor];
  }
  if (v15) {
    *uint64_t v15 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
  }
LABEL_39:
  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    CFRelease(v14);
  }
  return (opaqueCMSampleBuffer *)v18;
}

- (unint64_t)_extendedRowsOfOutputBuffer
{
  int v2 = objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](CVPixelBufferPoolGetPixelBufferAttributes(self->_pixelBufferPool), "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue");
  return ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - v2;
}

- (int)_setupVISProcessor
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  futureFrameMetadataDicts = self->_futureFrameMetadataDicts;
  uint64_t v4 = [(NSMutableArray *)futureFrameMetadataDicts countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F527C8];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(futureFrameMetadataDicts);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:v7])
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)futureFrameMetadataDicts countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F50F08], "sharedInstance"), "videoStabilizationProcessorVersion");
  if (!v10) {
    return FigSignalErrorAt();
  }
  uint64_t v11 = v10;
  uint64_t v12 = [MEMORY[0x1E4F55F78] VISConfigurationForVersion:v10];
  if (!v12) {
    return FigSignalErrorAt();
  }
  long long v13 = (void *)v12;
  v14 = (VISProcessor *)(id)[MEMORY[0x1E4F55F78] VISProcessorForVersion:v11];
  self->_visProcessor = v14;
  if (!v14) {
    return FigSignalErrorAt();
  }
  [(VISProcessor *)v14 setDelegate:self];
  objc_msgSend(v13, "setExtendedOutputRowsToFill:", -[AVOfflineVideoStabilizer _extendedRowsOfOutputBuffer](self, "_extendedRowsOfOutputBuffer"));
  [v13 setInputPixelBufferAttributes:self->_cachedInputBufferAttributes];
  [v13 setOutputPixelBufferAttributes:CVPixelBufferPoolGetPixelBufferAttributes(self->_pixelBufferPool)];
  [v13 setTransformPlatform:0];
  uint64_t v24 = *MEMORY[0x1E4F514D8];
  CMTime v25 = &unk_1EF4FA5F8;
  objc_msgSend(v13, "setSensorIDDict:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  [v13 setSmoothingMethod:2];
  [v13 setSphereCorrectionEnabled:v9];
  [v13 setUseISPMotionData:1];
  [v13 setCinematicLookAheadFrameCount:self->_metadataPrimingCount];
  *(float *)&double v15 = self->_lookAheadTime;
  [v13 setCinematicLookAheadTime:v15];
  [v13 setOutputPixelBufferPool:self->_pixelBufferPool];
  [v13 setGpuPriority:0];
  [v13 setMetalSubmissionAndCompletionQueuePriority:0];
  [v13 setVideoStabilizationDisabled:!self->_stabilizationEnabled];
  [(VISProcessor *)self->_visProcessor setConfiguration:v13];
  int v16 = [(VISProcessor *)self->_visProcessor prepareToProcess:0];
  int v17 = 0;
  if (v16)
  {
    int v19 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v19;
  }
  return v17;
}

- (void)_teardownVISProcessor
{
  visProcessor = self->_visProcessor;
  if (visProcessor)
  {
    [(VISProcessor *)visProcessor finishProcessing];
    uint64_t v4 = self->_visProcessor;
  }
}

- (int)_validateStabilizationMetadata:(id)a3 withSampleTime:(id *)a4 isEndOfData:(BOOL *)a5
{
  if (a3)
  {
    if (a4->var2)
    {
      if (!self->_requiredMetadataKeys)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        self->_requiredMetadataKeys = (NSSet *)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x1E4F523F0], *MEMORY[0x1E4F52398], *MEMORY[0x1E4F527C0], *MEMORY[0x1E4F523A8], *MEMORY[0x1E4F523C8], *MEMORY[0x1E4F527B8], *MEMORY[0x1E4F527D8], *MEMORY[0x1E4F527D0], 0);
      }
      if (!self->_optionalMetadataKeys)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        self->_optionalMetadataKeys = (NSSet *)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E4F527E0], *MEMORY[0x1E4F527C8], *MEMORY[0x1E4F523D8], *MEMORY[0x1E4F52418], *MEMORY[0x1E4F52440], 0);
      }
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
      [v10 minusSet:self->_requiredMetadataKeys];
      [v10 minusSet:self->_optionalMetadataKeys];
      [v10 count];
      if ([v10 count]
        || (uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:self->_requiredMetadataKeys],
            objc_msgSend(v11, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "allKeys"))), objc_msgSend(v11, "count"), (uint64_t v12 = objc_msgSend(v11, "count")) != 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        LODWORD(v12) = -11822;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      LODWORD(v12) = FigSignalErrorAt();
    }
  }
  else
  {
    LODWORD(v12) = 0;
  }
  if (a5) {
    *a5 = a3 == 0;
  }
  return v12;
}

- (int)_validateSourcePixelBuffer:(__CVBuffer *)a3 withSampleTime:(id *)a4 metadata:(id)a5 isEndOfData:(BOOL *)a6
{
  if (!a3)
  {
    int result = 0;
    goto LABEL_7;
  }
  if ((a4->var2 & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    int result = -11822;
    goto LABEL_7;
  }
  memset(&v13, 0, sizeof(v13));
  id v9 = (void *)[a5 objectForKeyedSubscript:@"CinematicFutureOutputFramePTSValue"];
  if (v9) {
    [v9 CMTimeValue];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTime time1 = v13;
  CMTime time2 = (CMTime)*a4;
  int result = CMTimeCompare(&time1, &time2);
  if (result)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
LABEL_7:
  if (a6) {
    *a6 = a3 == 0;
  }
  return result;
}

- (opaqueCMSampleBuffer)_createSampleBufferWithPixelBuffer:(__CVBuffer *)a3 sampleTime:(id *)a4 futureMetadata:(id)a5 status:(int *)a6
{
  CMSampleBufferRef sampleBufferOut = 0;
  sampleTiming.presentationTimeStamp = (CMTime)*a4;
  sampleTiming.decodeTimeStamp = sampleTiming.presentationTimeStamp;
  sampleTiming.duration = (CMTime)self->_targetFrameDuration;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!self->_cachedInputBufferAttributes)
  {
    self->_cachedInputBufferAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(a3)], *MEMORY[0x1E4F24E10]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(a3)], *MEMORY[0x1E4F24D08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)], *MEMORY[0x1E4F24D70]);
  }
  p_cachedVideoFormatDescription = (CFTypeRef *)&self->_cachedVideoFormatDescription;
  cachedVideoFormatDescription = self->_cachedVideoFormatDescription;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  char v14 = 1;
  while (1)
  {
    char v15 = v14;
    if (cachedVideoFormatDescription) {
      goto LABEL_7;
    }
    OSStatus v16 = CMVideoFormatDescriptionCreateForImageBuffer(v13, a3, &self->_cachedVideoFormatDescription);
    if (v16) {
      break;
    }
    cachedVideoFormatDescription = (opaqueCMFormatDescription *)*p_cachedVideoFormatDescription;
LABEL_7:
    OSStatus v17 = CMSampleBufferCreateForImageBuffer(v13, a3, 1u, 0, 0, cachedVideoFormatDescription, &sampleTiming, &sampleBufferOut);
    int v18 = v17;
    if (v17 != -12743)
    {
      if (!v17)
      {
LABEL_13:
        if (self->_isFirstFrame)
        {
          futureFrameMetadataDicts = self->_futureFrameMetadataDicts;
          if ([(NSMutableArray *)futureFrameMetadataDicts count] > (unint64_t)self->_metadataPrimingCount) {
            futureFrameMetadataDicts = (NSMutableArray *)[(NSMutableArray *)self->_futureFrameMetadataDicts subarrayWithRange:0];
          }
          [v10 setObject:futureFrameMetadataDicts forKeyedSubscript:*MEMORY[0x1E4F52578]];
        }
        if (a5) {
          [v10 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F52570]];
        }
        CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E4F51480], v10, 1u);
      }
      if (!a6) {
        goto LABEL_22;
      }
LABEL_21:
      *a6 = v18;
      goto LABEL_22;
    }
    if (*p_cachedVideoFormatDescription)
    {
      CFRelease(*p_cachedVideoFormatDescription);
      CFTypeRef *p_cachedVideoFormatDescription = 0;
    }
    cachedVideoFormatDescription = 0;
    char v14 = 0;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
  }
  int v18 = v16;
  if (a6) {
    goto LABEL_21;
  }
LABEL_22:

  return sampleBufferOut;
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  if (a3)
  {
    outputSampleBuffers = self->_outputSampleBuffers;
  }
  else
  {
    if (!a4) {
      return;
    }
    uint64_t v5 = self->_outputSampleBuffers;
    a3 = (opaqueCMSampleBuffer *)[NSNumber numberWithInt:*(void *)&a4];
    outputSampleBuffers = v5;
  }

  -[NSMutableArray addObject:](outputSampleBuffers, "addObject:", a3, *(void *)&a4);
}

- (NSMutableArray)outputSampleBuffers
{
  return self->_outputSampleBuffers;
}

@end