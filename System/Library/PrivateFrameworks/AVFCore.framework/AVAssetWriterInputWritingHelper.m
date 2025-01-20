@interface AVAssetWriterInputWritingHelper
- (AVAssetWriterInputPassDescription)currentPassDescription;
- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3 assetWriterTrack:(id)a4 error:(id *)a5;
- (AVFigAssetWriterTrack)_assetWriterTrack;
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4;
- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4;
- (BOOL)canPerformMultiplePasses;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)mediaDataRequesterShouldRequestMediaData;
- (BOOL)prepareToFinishWritingReturningError:(id *)a3;
- (__CVPixelBufferPool)pixelBufferPool;
- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3;
- (int64_t)appendCaption:(id)a3 error:(id *)a4;
- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4;
- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (int64_t)status;
- (void)_nudgeMediaDataRequesterIfAppropriate:(id)a3;
- (void)_startObservingReadyForMoreMediaDataKeyPath;
- (void)_stopObservingReadyForMoreMediaDataKeyPath;
- (void)addCallbackToCancelDuringDeallocation:(id)a3;
- (void)beginPassIfAppropriate;
- (void)dealloc;
- (void)declareKeyPathDependenciesWithRegistry:(id)a3;
- (void)markAsFinished;
- (void)markAsFinishedAndTransitionCurrentHelper:(id)a3;
- (void)markCurrentPassAsFinished;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareToEndSession;
- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4;
- (void)setCurrentPassDescription:(id)a3;
- (void)stopRequestingMediaData;
@end

@implementation AVAssetWriterInputWritingHelper

- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3
{
  return [(AVAssetWriterInputWritingHelper *)self initWithConfigurationState:a3 assetWriterTrack:0 error:0];
}

- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3 assetWriterTrack:(id)a4 error:(id *)a5
{
  v50.receiver = self;
  v50.super_class = (Class)AVAssetWriterInputWritingHelper;
  v8 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v50, sel_initWithConfigurationState_, a3, a4, a5);
  v9 = v8;
  if (!a4)
  {
    v38 = v8;
    v44 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, @"invalid parameter not satisfying: %s", v39, v40, v41, v42, v43, (uint64_t)"assetWriterTrack != nil"), 0 reason userInfo];
    objc_exception_throw(v44);
  }
  if (v8)
  {
    v8->_assetWriterTrack = (AVFigAssetWriterTrack *)a4;
    objc_msgSend(a3, "setTrackID:", objc_msgSend(a4, "trackID"));
    if (![a3 outputSettings])
    {
      if (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"meta"))
      {
        uint64_t v10 = [a3 sourceFormatHint];
        if (v10) {
          -[AVFigAssetWriterTrack setFormatDescriptions:](v9->_assetWriterTrack, "setFormatDescriptions:", [MEMORY[0x1E4F1C978] arrayWithObject:v10]);
        }
      }
    }
    v11 = (void *)[a3 metadataItems];
    if (v11)
    {
      v12 = v11;
      if ([v11 count])
      {
        [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setFigMetadata:+[AVMetadataItem _figMetadataPropertyFromMetadataItems:v12]];
        if (objc_msgSend(+[AVMetadataItem metadataItemsFromArray:withStringValue:](AVMetadataItem, "metadataItemsFromArray:withStringValue:", -[NSArray arrayByAddingObjectsFromArray:](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v12, @"tagc", @"uiso"), "arrayByAddingObjectsFromArray:", +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v12, @"tagc", @"udta")), @"public.auxiliary-content"), "count"))
        {
          [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setExcludeFromAutoSelection:1];
        }
      }
    }
    memset(&v49, 0, sizeof(v49));
    if (a3) {
      [a3 transform];
    }
    CGAffineTransform v48 = v49;
    if (!CGAffineTransformIsIdentity(&v48))
    {
      CGAffineTransform v48 = v49;
      v13 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setFigTrackMatrix:v13];
      CFRelease(v13);
    }
    uint64_t v14 = [a3 mediaTimeScale];
    if (v14) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setMediaTimeScale:v14];
    }
    [a3 naturalSize];
    if (v15 != *MEMORY[0x1E4F1DB30] || v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&v15);
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setFigDimensions:DictionaryRepresentation];
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
    }
    v18 = (void *)[a3 languageCode];
    if (v18)
    {
      v19 = v18;
      if ([v18 length]) {
        [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setLanguageCode:v19];
      }
    }
    v20 = (void *)[a3 extendedLanguageTag];
    if (v20)
    {
      v21 = v20;
      if ([v20 length]) {
        [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setExtendedLanguageTag:v21];
      }
    }
    -[AVFigAssetWriterTrack setMarksOutputTrackAsEnabled:](v9->_assetWriterTrack, "setMarksOutputTrackAsEnabled:", [a3 marksOutputTrackAsEnabled]);
    [a3 preferredVolume];
    -[AVFigAssetWriterTrack setTrackVolume:](v9->_assetWriterTrack, "setTrackVolume:");
    -[AVFigAssetWriterTrack setLayer:](v9->_assetWriterTrack, "setLayer:", [a3 layer]);
    uint64_t v22 = [a3 alternateGroupID];
    if (v22) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setAlternateGroupID:v22];
    }
    uint64_t v23 = [a3 provisionalAlternateGroupID];
    if (v23) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setProvisionalAlternateGroupID:v23];
    }
    memset(&v48, 0, 24);
    if (a3)
    {
      [a3 preferredMediaChunkDuration];
      if (BYTE4(v48.b))
      {
        assetWriterTrack = v9->_assetWriterTrack;
        *(_OWORD *)&start.value = *(_OWORD *)&v48.a;
        start.epoch = *(void *)&v48.c;
        [(AVFigAssetWriterTrack *)assetWriterTrack setPreferredChunkDuration:&start];
      }
    }
    uint64_t v25 = [a3 preferredMediaChunkAlignment];
    if (v25) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setPreferredChunkAlignment:v25];
    }
    uint64_t v26 = [a3 preferredMediaChunkSize];
    if (v26) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setPreferredChunkSize:v26];
    }
    v27 = (void *)[a3 mediaType];
    if (([v27 isEqualToString:@"meta"] & 1) != 0
      || [v27 isEqualToString:@"auxv"])
    {
      v28 = @"AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData";
    }
    else
    {
      v28 = @"AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData";
    }
    uint64_t v29 = [a3 mediaDataLocation];
    if (([(__CFString *)v28 isEqualToString:v29] & 1) == 0) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setMediaDataLocation:v29];
    }
    uint64_t v30 = [a3 sampleReferenceBaseURL];
    if (v30) {
      [(AVFigAssetWriterTrack *)v9->_assetWriterTrack setSampleReferenceBaseURL:v30];
    }
    v31 = [AVAssetWriterInputPassDescription alloc];
    v32 = (void *)MEMORY[0x1E4F1C978];
    v33 = (void *)MEMORY[0x1E4F29238];
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
    CMTimeRangeMake(&v46, &start, &duration);
    v9->_currentPassDescription = -[AVAssetWriterInputPassDescription initWithTimeRanges:](v31, "initWithTimeRanges:", objc_msgSend(v32, "arrayWithObject:", objc_msgSend(v33, "valueWithCMTimeRange:", &v46)));
    v34 = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:v9];
    v9->_keyPathDependencyManager = v34;
    [(AVKeyPathDependencyManager *)v34 dependencyHostIsFullyInitialized];
    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_mediaDataRequesterSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputWritingHelperMediaDataRequester", v35);
    v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_readyForMoreMediaDataObserverSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputWritingHelperReadyForMoreMediaDataObserver", v36);
  }
  return v9;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
}

- (void)dealloc
{
  if (self->_observingSelf) {
    [(AVAssetWriterInputWritingHelper *)self removeObserver:self forKeyPath:@"readyForMoreMediaData" context:@"AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"];
  }
  [(AVKeyPathDependencyManager *)self->_keyPathDependencyManager cancelAllCallbacks];

  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  if (mediaDataRequesterSerialQueue) {
    dispatch_release(mediaDataRequesterSerialQueue);
  }
  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  if (readyForMoreMediaDataObserverSerialQueue) {
    dispatch_release(readyForMoreMediaDataObserverSerialQueue);
  }
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputWritingHelper;
  [(AVAssetWriterInputHelper *)&v5 dealloc];
}

- (int64_t)status
{
  return 1;
}

- (BOOL)canPerformMultiplePasses
{
  BOOL v3 = [(AVAssetWriterInputHelper *)self performsMultiPassEncodingIfSupported];
  if (v3)
  {
    v4 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
    LOBYTE(v3) = [(AVFigAssetWriterTrack *)v4 encoderSupportsMultiPass];
  }
  return v3;
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  v4 = AVTwoPartKeyPathMake(@"assetWriterTrack", @"aboveHighWaterLevel");
  [a3 valueForKey:@"readyForMoreMediaData" dependsOnValueAtKeyPath:v4];
}

- (BOOL)isReadyForMoreMediaData
{
  return ![(AVFigAssetWriterTrack *)[(AVAssetWriterInputWritingHelper *)self _assetWriterTrack] isAboveHighWaterLevel];
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  if (!a3)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "queue != NULL";
    goto LABEL_7;
  }
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "block != nil";
LABEL_7:
    double v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3052000000;
  uint64_t v29 = __Block_byref_object_copy__11;
  uint64_t v30 = __Block_byref_object_dispose__11;
  uint64_t v31 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVAssetWriterInputWritingHelper_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke;
  block[3] = &unk_1E57B46E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = &v26;
  dispatch_sync(mediaDataRequesterSerialQueue, block);
  v11 = (void *)v27[5];
  if (!v11)
  {
    double v16 = (void *)MEMORY[0x1E4F1CA00];
    v17 = (objc_class *)objc_opt_class();
    uint64_t v23 = (void *)[v16 exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithClassAndSelector(v17, a2, @"cannot be called more than once.", v18, v19, v20, v21, v22, v24), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  [v11 setDelegate:self];
  [(AVAssetWriterInputWritingHelper *)self _nudgeMediaDataRequesterIfAppropriate:v27[5]];

  _Block_object_dispose(&v26, 8);
}

void *__79__AVAssetWriterInputWritingHelper_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke(void *result)
{
  if (!*(void *)(result[4] + 32))
  {
    v1 = result;
    *(void *)(result[4] + 32) = [[AVAssetWriterInputMediaDataRequester alloc] initWithRequestQueue:result[5] requestBlock:result[6]];
    *(void *)(*(void *)(v1[7] + 8) + 40) = *(id *)(v1[4] + 32);
    v2 = (void *)v1[4];
    return (void *)[v2 _startObservingReadyForMoreMediaDataKeyPath];
  }
  return result;
}

- (void)stopRequestingMediaData
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  uint64_t v10 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVAssetWriterInputWritingHelper_stopRequestingMediaData__block_invoke;
  v4[3] = &unk_1E57B2160;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(mediaDataRequesterSerialQueue, v4);
  BOOL v3 = (void *)v6[5];
  if (v3) {

  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __58__AVAssetWriterInputWritingHelper_stopRequestingMediaData__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 32);
  if (v1)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = v1;
    *(void *)(*(void *)(result + 32) + 32) = 0;
    return [*(id *)(result + 32) _stopObservingReadyForMoreMediaDataKeyPath];
  }
  return result;
}

- (void)_nudgeMediaDataRequesterIfAppropriate:(id)a3
{
  if ([(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    uint64_t v4 = [a3 requestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AVAssetWriterInputWritingHelper__nudgeMediaDataRequesterIfAppropriate___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = a3;
    dispatch_async(v4, block);
  }
}

uint64_t __73__AVAssetWriterInputWritingHelper__nudgeMediaDataRequesterIfAppropriate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestMediaDataIfNecessary];
}

- (BOOL)mediaDataRequesterShouldRequestMediaData
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__AVAssetWriterInputWritingHelper_mediaDataRequesterShouldRequestMediaData__block_invoke;
  v6[3] = &unk_1E57B2160;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mediaDataRequesterSerialQueue, v6);
  BOOL v4 = [(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData]
    && !objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject"), "numberOfAppendFailures")&& *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__AVAssetWriterInputWritingHelper_mediaDataRequesterShouldRequestMediaData__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_startObservingReadyForMoreMediaDataKeyPath
{
  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVAssetWriterInputWritingHelper__startObservingReadyForMoreMediaDataKeyPath__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(readyForMoreMediaDataObserverSerialQueue, block);
}

unsigned char *__78__AVAssetWriterInputWritingHelper__startObservingReadyForMoreMediaDataKeyPath__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[40])
  {
    result = (unsigned char *)[result addObserver:result forKeyPath:@"readyForMoreMediaData" options:0 context:@"AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)_stopObservingReadyForMoreMediaDataKeyPath
{
  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AVAssetWriterInputWritingHelper__stopObservingReadyForMoreMediaDataKeyPath__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(readyForMoreMediaDataObserverSerialQueue, block);
}

unsigned char *__77__AVAssetWriterInputWritingHelper__stopObservingReadyForMoreMediaDataKeyPath__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[40])
  {
    result = (unsigned char *)[result removeObserver:result forKeyPath:@"readyForMoreMediaData" context:@"AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext")
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = __Block_byref_object_copy__11;
    uint64_t v14 = __Block_byref_object_dispose__11;
    uint64_t v15 = 0;
    mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AVAssetWriterInputWritingHelper_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E57B2160;
    block[4] = self;
    void block[5] = &v10;
    dispatch_sync(mediaDataRequesterSerialQueue, block);
    if (v11[5])
    {
      -[AVAssetWriterInputWritingHelper _nudgeMediaDataRequesterIfAppropriate:](self, "_nudgeMediaDataRequesterIfAppropriate:");
    }
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAssetWriterInputWritingHelper;
    -[AVAssetWriterInputWritingHelper observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void *__82__AVAssetWriterInputWritingHelper_observeValueForKeyPath_ofObject_change_context___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 32);
  if (v1)
  {
    v2 = result;
    result = v1;
    *(void *)(*(void *)(v2[5] + 8) + 40) = result;
  }
  return result;
}

- (void)beginPassIfAppropriate
{
  if ([(AVAssetWriterInputWritingHelper *)self canPerformMultiplePasses])
  {
    uint64_t v3 = 0;
    if (![(AVFigAssetWriterTrack *)[(AVAssetWriterInputWritingHelper *)self _assetWriterTrack] beginPassReturningError:&v3])[(AVAssetWriterInputHelper *)self transitionAssetWriterAndAllInputsToFailedStatusWithError:v3]; {
  }
    }
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  if ([(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F2D8], 0)
      || (int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject"), "_weakReferenceToAssetWriter"), "referencedObject"), "_supportsSampleReferencesReturningError:", &v10)) != 0)
    {
      int v7 = [(AVFigAssetWriterTrack *)[(AVAssetWriterInputWritingHelper *)self _assetWriterTrack] addSampleBuffer:a3 error:&v10];
    }
  }
  else
  {
    uint64_t v8 = AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"readyForMoreMediaData is NO." userInfo:0]);
    int v7 = 0;
    uint64_t v10 = (void *)v8;
  }
  if (a4 && (v7 & 1) == 0) {
    *a4 = v10;
  }
  return v7 ^ 1u;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  if (![(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v19 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, @"A pixel buffer cannot be appended when readyForMoreMediaData is NO.", v14, v15, v16, v17, v18, v20), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  uint64_t v22 = 0;
  uint64_t v8 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  long long v20 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  BOOL v9 = [(AVFigAssetWriterTrack *)v8 addPixelBuffer:a3 atPresentationTime:&v20 error:&v22];
  if (!v9) {
    [(AVAssetWriterInputHelper *)self transitionAssetWriterAndAllInputsToFailedStatusWithError:v22];
  }
  return v9;
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  if (![(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v19 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, @"A tagged buffer group cannot be appended when readyForMoreMediaData is NO.", v14, v15, v16, v17, v18, v20), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  uint64_t v22 = 0;
  uint64_t v8 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  long long v20 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  BOOL v9 = [(AVFigAssetWriterTrack *)v8 addTaggedPixelBufferGroup:a3 atPresentationTime:&v20 error:&v22];
  if (!v9) {
    [(AVAssetWriterInputHelper *)self transitionAssetWriterAndAllInputsToFailedStatusWithError:v22];
  }
  return v9;
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  BOOL v9 = 0;
  if (![(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    BOOL v9 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"readyForMoreMediaData is NO." userInfo:0]);
LABEL_6:
    if (!a4) {
      return 1;
    }
LABEL_7:
    *a4 = v9;
    return 1;
  }
  int v7 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  if ([(AVFigAssetWriterTrack *)v7 addCaption:a3 error:&v9]) {
    return 0;
  }
  [(AVAssetWriterInputHelper *)self transitionAssetWriterAndAllInputsToFailedStatusWithError:v9];
  if (a4) {
    goto LABEL_7;
  }
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  BOOL v9 = 0;
  if (![(AVAssetWriterInputWritingHelper *)self isReadyForMoreMediaData])
  {
    BOOL v9 = (void *)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"readyForMoreMediaData is NO." userInfo:0]);
LABEL_6:
    if (!a4) {
      return 1;
    }
LABEL_7:
    *a4 = v9;
    return 1;
  }
  int v7 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  if ([(AVFigAssetWriterTrack *)v7 addCaptionGroup:a3 error:&v9]) {
    return 0;
  }
  [(AVAssetWriterInputHelper *)self transitionAssetWriterAndAllInputsToFailedStatusWithError:v9];
  if (a4) {
    goto LABEL_7;
  }
  return 1;
}

- (void)prepareToEndSession
{
  v2 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  [(AVFigAssetWriterTrack *)v2 prepareToEndSession];
}

- (BOOL)prepareToFinishWritingReturningError:(id *)a3
{
  BOOL v4 = [(AVAssetWriterInputWritingHelper *)self _assetWriterTrack];
  return [(AVFigAssetWriterTrack *)v4 markEndOfDataReturningError:a3];
}

- (void)markCurrentPassAsFinished
{
  id v3 = [(AVWeakReference *)[(AVAssetWriterInputHelper *)self weakReferenceToAssetWriterInput] referencedObject];
  mediaDataRequester = self->_mediaDataRequester;
  if (mediaDataRequester)
  {
    [(AVAssetWriterInputWritingHelper *)self _stopObservingReadyForMoreMediaDataKeyPath];
    [(AVAssetWriterInputMediaDataRequester *)mediaDataRequester setDelegate:0];
    self->_mediaDataRequester = 0;
    uint64_t v5 = [(AVAssetWriterInputMediaDataRequester *)mediaDataRequester requestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AVAssetWriterInputWritingHelper_markCurrentPassAsFinished__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = mediaDataRequester;
    dispatch_async(v5, block);
  }
  if ([(AVAssetWriterInputWritingHelper *)self canPerformMultiplePasses])
  {
    uint64_t v6 = [[AVAssetWriterInputInterPassAnalysisHelper alloc] initWithWritingHelper:self];
    [v3 _setHelper:v6];
    [(AVAssetWriterInputInterPassAnalysisHelper *)v6 startPassAnalysis];
  }
  else
  {
    uint64_t v6 = [[AVAssetWriterInputNoMorePassesHelper alloc] initWithWritingHelper:self];
    [v3 _setHelper:v6];
  }
}

void __60__AVAssetWriterInputWritingHelper_markCurrentPassAsFinished__block_invoke(uint64_t a1)
{
}

- (void)markAsFinished
{
}

- (void)markAsFinishedAndTransitionCurrentHelper:(id)a3
{
  uint64_t v4 = 0;
  if ([(AVFigAssetWriterTrack *)[(AVAssetWriterInputWritingHelper *)self _assetWriterTrack] markEndOfDataReturningError:&v4])
  {
    [a3 transitionToAndReturnTerminalHelperWithTerminalStatus:2];
  }
  else
  {
    [a3 transitionAssetWriterAndAllInputsToFailedStatusWithError:v4];
  }
}

- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3
{
  if (self->_mediaDataRequester)
  {
    [(AVAssetWriterInputWritingHelper *)self _stopObservingReadyForMoreMediaDataKeyPath];
    [(AVAssetWriterInputMediaDataRequester *)self->_mediaDataRequester setDelegate:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInputWritingHelper;
  id v5 = [(AVAssetWriterInputHelper *)&v8 transitionToAndReturnTerminalHelperWithTerminalStatus:a3];
  uint64_t v6 = v5;
  if (self->_mediaDataRequester) {
    objc_msgSend(v5, "requestMediaDataOnceIfNecessaryWithMediaDataRequester:");
  }
  return v6;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  p_pixelBufferPool = &self->_pixelBufferPool;
  result = self->_pixelBufferPool;
  if (!result)
  {
    result = [(AVFigAssetWriterTrack *)[(AVAssetWriterInputWritingHelper *)self _assetWriterTrack] pixelBufferPool];
    if (!result)
    {
      result = *p_pixelBufferPool;
      if (!*p_pixelBufferPool)
      {
        [(AVAssetWriterInputHelper *)self sourcePixelBufferAttributes];
        if (FigCreatePixelBufferAttributesWithIOSurfaceSupport())
        {
          return 0;
        }
        else
        {
          CFDictionaryRef v6 = (const __CFDictionary *)0;
          if (CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v6, p_pixelBufferPool) == -6682)
          {
            int v7 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v8 = *MEMORY[0x1E4F1C3B8];
            BOOL v9 = (objc_class *)objc_opt_class();
            uint64_t v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, @"A pixel buffer pool cannot be created with the receiver's sourcePixelBufferAttributes. The pixel buffer attributes must specify a width, height, and either a pixel format or a pixel format description.", v10, v11, v12, v13, v14, v16), 0 reason userInfo];
            objc_exception_throw(v15);
          }
          return *p_pixelBufferPool;
        }
      }
    }
  }
  return result;
}

- (AVFigAssetWriterTrack)_assetWriterTrack
{
  return self->_assetWriterTrack;
}

- (AVAssetWriterInputPassDescription)currentPassDescription
{
  return self->_currentPassDescription;
}

- (void)setCurrentPassDescription:(id)a3
{
}

@end