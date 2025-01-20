@interface AVAssetReaderOutput
+ (id)_figAssetReaderVideoScalingPropertiesFromVideoSettings:(id)a3 withFormatDescription:(id)a4;
+ (void)initialize;
- (AVAssetReaderOutput)init;
- (AVMediaType)mediaType;
- (AVWeakReference)_weakReferenceToAssetReader;
- (BOOL)_enableTrackExtractionReturningError:(id *)a3;
- (BOOL)_isFinished;
- (BOOL)_prepareForReadingReturningError:(id *)a3;
- (BOOL)_trimsSampleDurations;
- (BOOL)_updateTimeRangesOnFigAssetReaderReturningError:(id *)a3;
- (BOOL)alwaysCopiesSampleData;
- (BOOL)disablesMultithreadedAndAsyncVideoDecompression;
- (BOOL)maximizePowerEfficiency;
- (BOOL)supportsRandomAccess;
- (CMSampleBufferRef)copyNextSampleBuffer;
- (NSDictionary)_figAssetReaderExtractionOptions;
- (OpaqueFigAssetReader)_figAssetReader;
- (id)_asset;
- (id)_errorForOSStatus:(int)a3;
- (id)currentTimeRanges;
- (int)_extractionID;
- (int64_t)_status;
- (void)_attachToWeakReferenceToAssetReader:(id)a3;
- (void)_cancelReading;
- (void)_figAssetReaderDecodeError;
- (void)_figAssetReaderFailed;
- (void)_figAssetReaderSampleBufferDidBecomeAvailableForExtractionID:(int)a3;
- (void)_figAssetReaderServerConnectionDied;
- (void)_markAsFinished;
- (void)_setExtractionID:(int)a3;
- (void)_setFigAssetReader:(OpaqueFigAssetReader *)a3;
- (void)dealloc;
- (void)markConfigurationAsFinal;
- (void)resetForReadingTimeRanges:(NSArray *)timeRanges;
- (void)setAlwaysCopiesSampleData:(BOOL)alwaysCopiesSampleData;
- (void)setDisablesMultithreadedAndAsyncVideoDecompression:(BOOL)a3;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setSupportsRandomAccess:(BOOL)supportsRandomAccess;
@end

@implementation AVAssetReaderOutput

+ (void)initialize
{
}

- (AVAssetReaderOutput)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVAssetReaderOutput;
  v3 = [(AVAssetReaderOutput *)&v11 init];
  uint64_t v4 = objc_opt_class();
  AVRequireConcreteObject(v3, a2, v4);
  if (v3)
  {
    v5 = objc_alloc_init(AVAssetReaderOutputInternal);
    v3->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v3->_internal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v3];
      v6 = (void *)MEMORY[0x1E4F29238];
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
      CMTimeRangeMake(&v10, &start, &v8);
      v12[0] = [v6 valueWithCMTimeRange:&v10];
      v3->_internal->currentTimeRanges = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      v3->_internal->sampleBufferAvailabilityCondition = objc_alloc_init(AVRunLoopCondition);
      v3->_internal->alwaysCopiesSampleData = 1;
      v3->_internal->maximizePowerEfficiency = 0;
      v3->_internal->disablesMultithreadedAndAsyncVideoDecompression = 0;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    if (internal->figAssetReader)
    {
      id v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      [v4 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderSampleBufferDidBecomeAvailable name:*MEMORY[0x1E4F323A8] object:self->_internal->figAssetReader];
      [v4 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderDecodeError name:*MEMORY[0x1E4F32398] object:self->_internal->figAssetReader];
      [v4 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderFailed name:*MEMORY[0x1E4F323A0] object:self->_internal->figAssetReader];
      [v4 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderServerConnectionDied name:*MEMORY[0x1E4F323B0] object:self->_internal->figAssetReader];
      [v4 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderServerConnectionDied name:*MEMORY[0x1E4F21770] object:self->_internal->figAssetReader];
      CFRelease(self->_internal->weakReference);
      CFRelease(self->_internal->figAssetReader);
      internal = self->_internal;
    }

    CFRelease(self->_internal);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetReaderOutput;
  [(AVAssetReaderOutput *)&v5 dealloc];
}

- (AVMediaType)mediaType
{
  id v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)alwaysCopiesSampleData
{
  return self->_internal->alwaysCopiesSampleData;
}

- (void)setAlwaysCopiesSampleData:(BOOL)alwaysCopiesSampleData
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    objc_super v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  self->_internal->alwaysCopiesSampleData = alwaysCopiesSampleData;
}

- (BOOL)maximizePowerEfficiency
{
  return self->_internal->maximizePowerEfficiency;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    objc_super v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  self->_internal->maximizePowerEfficiency = a3;
}

- (BOOL)disablesMultithreadedAndAsyncVideoDecompression
{
  return self->_internal->disablesMultithreadedAndAsyncVideoDecompression;
}

- (void)setDisablesMultithreadedAndAsyncVideoDecompression:(BOOL)a3
{
  if (![(NSString *)[(AVAssetReaderOutput *)self mediaType] isEqualToString:@"vide"])
  {
    objc_super v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"cannot use disablesMultithreadedAndAsyncVideoDecompression for non video media type";
    goto LABEL_6;
  }
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    objc_super v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = @"cannot be called after reading has started";
LABEL_6:
    v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  self->_internal->disablesMultithreadedAndAsyncVideoDecompression = a3;
}

- (BOOL)supportsRandomAccess
{
  return self->_internal->supportsRandomAccess;
}

- (void)setSupportsRandomAccess:(BOOL)supportsRandomAccess
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    objc_super v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  self->_internal->supportsRandomAccess = supportsRandomAccess;
}

- (id)_asset
{
  id v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (OpaqueFigAssetReader)_figAssetReader
{
  return self->_internal->figAssetReader;
}

- (void)_setFigAssetReader:(OpaqueFigAssetReader *)a3
{
  if (self->_internal->figAssetReader != a3)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    uint64_t v6 = v5;
    internal = self->_internal;
    uint64_t v8 = (void *)MEMORY[0x1E4F323A8];
    uint64_t v9 = (void *)MEMORY[0x1E4F32398];
    uint64_t v10 = (void *)MEMORY[0x1E4F323A0];
    objc_super v11 = (void *)MEMORY[0x1E4F323B0];
    uint64_t v12 = (uint64_t *)MEMORY[0x1E4F21770];
    if (internal->figAssetReader)
    {
      objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", internal->weakReference, figAssetReaderSampleBufferDidBecomeAvailable, *MEMORY[0x1E4F323A8]);
      [v6 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderDecodeError name:*v9 object:self->_internal->figAssetReader];
      [v6 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderFailed name:*v10 object:self->_internal->figAssetReader];
      [v6 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderServerConnectionDied name:*v11 object:self->_internal->figAssetReader];
      [v6 removeListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderServerConnectionDied name:*v12 object:self->_internal->figAssetReader];
      CFRelease(self->_internal->weakReference);
      CFRelease(self->_internal->figAssetReader);
      internal = self->_internal;
    }
    internal->figAssetReader = a3;
    figAssetReader = self->_internal->figAssetReader;
    if (figAssetReader)
    {
      CFRetain(figAssetReader);
      CFRetain(self->_internal->weakReference);
      [v6 addListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderSampleBufferDidBecomeAvailable name:*v8 object:self->_internal->figAssetReader flags:0];
      [v6 addListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderDecodeError name:*v9 object:self->_internal->figAssetReader flags:0];
      [v6 addListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderFailed name:*v10 object:self->_internal->figAssetReader flags:0];
      [v6 addListenerWithWeakReference:self->_internal->weakReference callback:figAssetReaderServerConnectionDied name:*v11 object:self->_internal->figAssetReader flags:0];
      v14 = self->_internal;
      weakReference = v14->weakReference;
      uint64_t v16 = *v12;
      v17 = v14->figAssetReader;
      [v6 addListenerWithWeakReference:weakReference callback:figAssetReaderServerConnectionDied name:v16 object:v17 flags:0];
    }
  }
}

- (AVWeakReference)_weakReferenceToAssetReader
{
  return self->_internal->weakReferenceToAssetReader;
}

- (void)_attachToWeakReferenceToAssetReader:(id)a3
{
  if (self->_internal->weakReferenceToAssetReader) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetReaderOutput.m", 948, @"The receiver cannot already be attached to an AVAssetReader.");
  }
  self->_internal->weakReferenceToAssetReader = (AVWeakReference *)a3;
  uint64_t v5 = objc_msgSend(-[AVWeakReference referencedObject](self->_internal->weakReferenceToAssetReader, "referencedObject"), "_figAssetReader");
  [(AVAssetReaderOutput *)self _setFigAssetReader:v5];
}

- (int64_t)_status
{
  int64_t result = [(AVWeakReference *)[(AVAssetReaderOutput *)self _weakReferenceToAssetReader] referencedObject];
  if (result)
  {
    return [(id)result status];
  }
  return result;
}

- (int)_extractionID
{
  return self->_internal->extractionID;
}

- (void)_setExtractionID:(int)a3
{
  self->_internal->extractionID = a3;
}

- (NSDictionary)_figAssetReaderExtractionOptions
{
  BOOL v3 = [(AVAssetReaderOutput *)self _trimsSampleDurations];
  BOOL v4 = [(AVAssetReaderOutput *)self supportsRandomAccess];
  uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  uint64_t v6 = *MEMORY[0x1E4F32378];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAssetReaderOutput alwaysCopiesSampleData](self, "alwaysCopiesSampleData"));
  uint64_t v8 = *MEMORY[0x1E4F32348];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  uint64_t v10 = *MEMORY[0x1E4F344D0];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAssetReaderOutput maximizePowerEfficiency](self, "maximizePowerEfficiency"));
  uint64_t v12 = *MEMORY[0x1E4F32370];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAssetReaderOutput disablesMultithreadedAndAsyncVideoDecompression](self, "disablesMultithreadedAndAsyncVideoDecompression"));
  return (NSDictionary *)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, v10, v11, v12, v13, *MEMORY[0x1E4F32350], 0);
}

+ (id)_figAssetReaderVideoScalingPropertiesFromVideoSettings:(id)a3 withFormatDescription:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(a3, "videoScalingProperties"));
  [a3 colorPropertiesConsideringFormatDescriptions:a4 colorPrimaries:&v10 transferFunction:&v9 ycbcrMatrix:&v8];
  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F450E0]];
  }
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F45100]];
  }
  if (v9) {
    [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F450F8]];
  }
  return v6;
}

- (BOOL)_trimsSampleDurations
{
  return 1;
}

- (BOOL)_updateTimeRangesOnFigAssetReaderReturningError:(id *)a3
{
  id v5 = [(AVAssetReaderOutput *)self currentTimeRanges];
  uint64_t v6 = [(AVAssetReaderOutput *)self _figAssetReader];
  if (v6)
  {
    size_t v7 = [v5 count];
    uint64_t v8 = malloc_type_calloc(v7, 0x30uLL, 0x1000040EED21634uLL);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__AVAssetReaderOutput__updateTimeRangesOnFigAssetReaderReturningError___block_invoke;
    v14[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v14[4] = v8;
    [v5 enumerateObjectsUsingBlock:v14];
    self->_internal->extractionCompleteForCurrentConfiguration = 0;
    uint64_t v9 = [(AVAssetReaderOutput *)self _extractionID];
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, void *, size_t))(v11 + 128);
    if (v12)
    {
      uint64_t v6 = v12(v6, v9, v8, v7);
      if (!a3) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v6 = 4294954514;
      if (!a3) {
        goto LABEL_12;
      }
    }
    if (v6)
    {
      *a3 = [(AVAssetReaderOutput *)self _errorForOSStatus:v6];
      LODWORD(v6) = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_12:
  free(v8);
  return v6 == 0;
}

__n128 __71__AVAssetReaderOutput__updateTimeRangesOnFigAssetReaderReturningError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    [a2 CMTimeRangeValue];
  }
  else
  {
    __n128 v8 = 0u;
    __n128 v9 = 0u;
    __n128 v7 = 0u;
  }
  id v5 = (__n128 *)(v4 + 48 * a3);
  __n128 result = v7;
  v5[1] = v8;
  v5[2] = v9;
  __n128 *v5 = v7;
  return result;
}

- (BOOL)_prepareForReadingReturningError:(id *)a3
{
  if (![(AVAssetReaderOutput *)self supportsRandomAccess]) {
    self->_internal->currentConfigurationIsFinal = 1;
  }
  return [(AVAssetReaderOutput *)self _enableTrackExtractionReturningError:a3];
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  id v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)currentTimeRanges
{
  return self->_internal->currentTimeRanges;
}

- (BOOL)_isFinished
{
  return self->_internal->finished > 0;
}

- (void)_markAsFinished
{
  [(AVAssetReaderOutput *)self willChangeValueForKey:@"finished"];
  FigAtomicIncrement32();
  [(AVAssetReaderOutput *)self didChangeValueForKey:@"finished"];
}

- (void)_cancelReading
{
}

- (id)_errorForOSStatus:(int)a3
{
  return +[AVAssetReader _errorForOSStatus:*(void *)&a3];
}

- (CMSampleBufferRef)copyNextSampleBuffer
{
  uint64_t v4 = [(AVAssetReaderOutput *)self _status];
  if (v4 > 1) {
    return 0;
  }
  if (!v4)
  {
    v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot copy next sample buffer before adding this output to an instance of AVAssetReader (using -addOutput:) and calling -startReading on that asset reader", v5, v6, v7, v8, v9, v20), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  v21 = 0;
  HIBYTE(v20) = 0;
  [(NSCondition *)self->_internal->sampleBufferAvailabilityCondition lock];
  for (uint64_t i = *MEMORY[0x1E4F20260]; ; [(AVRunLoopCondition *)sampleBufferAvailabilityCondition waitInMode:i])
  {
    uint64_t v12 = [(AVAssetReaderOutput *)self _figAssetReader];
    uint64_t v13 = [(AVAssetReaderOutput *)self _extractionID];
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v15 = v14 ? v14 : 0;
    uint64_t v16 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, void, char *, opaqueCMSampleBuffer **))(v15 + 104);
    uint64_t v17 = v16 ? v16(v12, v13, 0, (char *)&v20 + 7, &v21) : 4294954514;
    sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
    if (v17 || v21 || HIBYTE(v20)) {
      break;
    }
  }
  [(NSCondition *)sampleBufferAvailabilityCondition unlock];
  if (v17)
  {
    objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetReaderOutput _weakReferenceToAssetReader](self, "_weakReferenceToAssetReader"), "referencedObject"), "_transitionToStatus:failureError:", 3, -[AVAssetReaderOutput _errorForOSStatus:](self, "_errorForOSStatus:", v17));
  }
  else if (HIBYTE(v20))
  {
    self->_internal->extractionCompleteForCurrentConfiguration = 1;
    if (self->_internal->currentConfigurationIsFinal) {
      [(AVAssetReaderOutput *)self _markAsFinished];
    }
  }
  if (HIBYTE(v20)) {
    return 0;
  }
  else {
    return v21;
  }
}

- (void)_figAssetReaderSampleBufferDidBecomeAvailableForExtractionID:(int)a3
{
  internal = self->_internal;
  if (internal->extractionID == a3)
  {
    [(NSCondition *)internal->sampleBufferAvailabilityCondition lock];
    [(AVRunLoopCondition *)self->_internal->sampleBufferAvailabilityCondition signal];
    sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
    [(NSCondition *)sampleBufferAvailabilityCondition unlock];
  }
}

- (void)resetForReadingTimeRanges:(NSArray *)timeRanges
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!timeRanges)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v25 = (NSString *)"timeRanges != nil";
    uint64_t v20 = @"invalid parameter not satisfying: %s";
    goto LABEL_26;
  }
  long long v9 = *MEMORY[0x1E4F1FA08];
  v35.epoch = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)&v35.value = v9;
  uint64_t v10 = [(NSArray *)timeRanges countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v32;
  uint64_t v13 = (CMTime *)MEMORY[0x1E4F1FA48];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(timeRanges);
      }
      uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        v21 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v21);
        uint64_t v20 = @"Each entry in timeRanges must be an instance of %@";
        goto LABEL_26;
      }
      memset(&v30, 0, sizeof(v30));
      if (!v15 || ([v15 CMTimeRangeValue], (v30.start.flags & 0x1D) != 1))
      {
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        uint64_t v20 = @"Start time of each time range must be numeric - see CMTIME_IS_NUMERIC";
        goto LABEL_26;
      }
      CMTimeFlags flags = v30.duration.flags;
      if ((v30.duration.flags & 0x1D) == 1)
      {
        time1.CMTime start = v30.duration;
        CMTime time2 = *v13;
        if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
          goto LABEL_14;
        }
        CMTimeFlags flags = v30.duration.flags;
      }
      if ((~flags & 5) != 0)
      {
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        uint64_t v20 = @"Duration of each time range must be nonnegative & numeric or positive infinity - see CMTIME_IS_NUMERIC";
        goto LABEL_26;
      }
LABEL_14:
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v30.start.value;
      time1.start.epoch = v30.start.epoch;
      CMTime time2 = v35;
      if (CMTimeCompare(&time1.start, &time2) < 0)
      {
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        uint64_t v20 = @"Start time of each time range must be greater than or equal to the end time of the previous time range";
LABEL_26:
        v22 = (objc_class *)self;
        goto LABEL_27;
      }
      CMTimeRange time1 = v30;
      CMTimeRangeGetEnd(&v35, &time1);
    }
    uint64_t v11 = [(NSArray *)timeRanges countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v11);
LABEL_17:
  if ([(AVAssetReaderOutput *)self _status] <= 0)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v20 = @"cannot be called before reading has started";
LABEL_34:
    v22 = (objc_class *)self;
LABEL_27:
    v23 = objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector(v22, a2, (uint64_t)v20, v3, v4, v5, v6, v7, (uint64_t)v25), 0);
    objc_exception_throw(v23);
  }
  if (!self->_internal->extractionCompleteForCurrentConfiguration)
  {
    int64_t v24 = [(AVAssetReaderOutput *)self _status];
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    if (v24 == 3)
    {
      uint64_t v20 = @"cannot be called after the asset reader has entered a failure state";
    }
    else
    {
      v25 = NSStringFromSelector(sel_copyNextSampleBuffer);
      uint64_t v20 = @"cannot be called until all samples have been read (i.e. %@ returns NULL)";
    }
    goto LABEL_26;
  }
  if (![(AVAssetReaderOutput *)self supportsRandomAccess])
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v25 = NSStringFromSelector(sel_supportsRandomAccess);
    uint64_t v20 = @"cannot be called without setting %@ to YES";
    goto LABEL_34;
  }
  internal = self->_internal;
  if (internal->currentConfigurationIsFinal)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v25 = NSStringFromSelector(sel_markConfigurationAsFinal);
    uint64_t v20 = @"cannot be called after calling %@";
    goto LABEL_34;
  }

  self->_internal->currentTimeRanges = (NSArray *)[(NSArray *)timeRanges copy];
  [(AVAssetReaderOutput *)self _updateTimeRangesOnFigAssetReaderReturningError:0];
}

- (void)markConfigurationAsFinal
{
  self->_internal->currentConfigurationIsFinal = 1;
  if (self->_internal->extractionCompleteForCurrentConfiguration) {
    [(AVAssetReaderOutput *)self _markAsFinished];
  }
}

- (void)_figAssetReaderDecodeError
{
  [(NSCondition *)self->_internal->sampleBufferAvailabilityCondition lock];
  [(AVRunLoopCondition *)self->_internal->sampleBufferAvailabilityCondition signal];
  sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
  [(NSCondition *)sampleBufferAvailabilityCondition unlock];
}

- (void)_figAssetReaderFailed
{
  [(NSCondition *)self->_internal->sampleBufferAvailabilityCondition lock];
  [(AVRunLoopCondition *)self->_internal->sampleBufferAvailabilityCondition signal];
  sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
  [(NSCondition *)sampleBufferAvailabilityCondition unlock];
}

- (void)_figAssetReaderServerConnectionDied
{
  [(NSCondition *)self->_internal->sampleBufferAvailabilityCondition lock];
  [(AVRunLoopCondition *)self->_internal->sampleBufferAvailabilityCondition signal];
  sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
  [(NSCondition *)sampleBufferAvailabilityCondition unlock];
}

@end