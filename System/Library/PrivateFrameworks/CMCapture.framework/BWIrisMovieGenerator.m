@interface BWIrisMovieGenerator
+ (BOOL)_addNewMetadataTrackToAssetWriter:(uint64_t)a3 forTrackTimeScale:(unsigned int *)a4 yieldingTrackID:;
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualMovieStartTime;
- (BOOL)flush;
- (BOOL)flushAsync;
- (BOOL)suspended;
- (BOOL)vitalInputStreamHasBeenForcedOff;
- (BWIrisMovieGenerator)initWithReadableByteStream:(OpaqueCMByteStream *)a3 forFrontFacingCamera:(BOOL)a4 forExternalCamera:(BOOL)a5 clientExpectsCameraMountedInLandscapeOrientation:(BOOL)a6 sampleReferenceMoviesEnabled:(BOOL)a7 movieGenerationQueue:(id)a8 irisStillImageMovieMetadataCache:(id)a9 videoOrientationTimeMachine:(id)a10;
- (char)initWithReadableByteStream:(uint64_t)a3 metadataByteStream:(char)a4 forFrontFacingCamera:(char)a5 forExternalCamera:(char)a6 clientExpectsCameraMountedInLandscapeOrientation:(char)a7 sampleReferenceMoviesEnabled:(void *)a8 movieGenerationQueue:(void *)a9 irisStillImageMovieMetadataCache:(void *)a10 videoOrientationTimeMachine:;
- (double)_findIrisShortestTrackDuration:(CMTime *)a3 audioTrackDuration:(char)a4 flush:(double)result;
- (int)numberOfPendingReferenceMovies;
- (int)streamForcedOffErrorCode;
- (uint64_t)_cancelAllPendingIrisMoviesWithError:(uint64_t)result;
- (uint64_t)_completedMovieInfoAndCallbacksForShortestTrackDuration:(long long *)a3 audioTrackDuration:(char)a4 flush:;
- (uint64_t)_doIrisMovieParsing:(uint64_t)a1;
- (uint64_t)_generateCompletedIrisMovies:(uint64_t)result;
- (uint64_t)_generateIrisMovies:(uint64_t)a1;
- (uint64_t)_generateRefMovieForInfo:(uint64_t)a3 movieLevelMetadata:(int)a4 generateMetadataMovie:;
- (void)_getAdjustedRefMovieEndTime:(uint64_t)a3@<X8>;
- (void)_getAdjustedRefMovieStartTime:(uint64_t)a3@<X8>;
- (void)dealloc;
- (void)parseAdditionalFragments;
- (void)setActualMovieStartTime:(id *)a3;
- (void)setStreamForcedOffErrorCode:(int)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setVitalInputStreamHasBeenForcedOff:(BOOL)a3;
- (void)updateOverCaptureQualityScoresForMoviesEndingBefore:(id *)a3 fromMetadataRingBuffer:(id)a4;
- (void)writeMovieWithInfo:(id)a3 completionHandler:(id)a4;
@end

@implementation BWIrisMovieGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWIrisMovieGenerator)initWithReadableByteStream:(OpaqueCMByteStream *)a3 forFrontFacingCamera:(BOOL)a4 forExternalCamera:(BOOL)a5 clientExpectsCameraMountedInLandscapeOrientation:(BOOL)a6 sampleReferenceMoviesEnabled:(BOOL)a7 movieGenerationQueue:(id)a8 irisStillImageMovieMetadataCache:(id)a9 videoOrientationTimeMachine:(id)a10
{
  return (BWIrisMovieGenerator *)-[BWIrisMovieGenerator initWithReadableByteStream:metadataByteStream:forFrontFacingCamera:forExternalCamera:clientExpectsCameraMountedInLandscapeOrientation:sampleReferenceMoviesEnabled:movieGenerationQueue:irisStillImageMovieMetadataCache:videoOrientationTimeMachine:]((char *)self, a3, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10);
}

- (char)initWithReadableByteStream:(uint64_t)a3 metadataByteStream:(char)a4 forFrontFacingCamera:(char)a5 forExternalCamera:(char)a6 clientExpectsCameraMountedInLandscapeOrientation:(char)a7 sampleReferenceMoviesEnabled:(void *)a8 movieGenerationQueue:(void *)a9 irisStillImageMovieMetadataCache:(void *)a10 videoOrientationTimeMachine:
{
  v10 = a1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2 && a8)
    {
      v22.receiver = a1;
      v22.super_class = (Class)BWIrisMovieGenerator;
      v17 = (char *)objc_msgSendSuper2(&v22, sel_init);
      v10 = v17;
      if (v17)
      {
        v17[8] = a4;
        v17[9] = a5;
        v17[10] = a6;
        v17[11] = a7;
        *((void *)v17 + 5) = CFRetain(a2);
        *((void *)v10 + 12) = FigSimpleMutexCreate();
        *((void *)v10 + 13) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *((void *)v10 + 15) = a8;
        uint64_t v18 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)(v10 + 72) = *MEMORY[0x1E4F1F9F8];
        *((void *)v10 + 11) = *(void *)(v18 + 16);
        *((void *)v10 + 17) = a9;
        *((void *)v10 + 18) = a10;
        v19 = [BWLimitedGMErrorLogger alloc];
        *((void *)v10 + 19) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v19, "initWithName:maxLoggingCount:", objc_msgSend(NSString, "stringWithFormat:", @"%p Live Photo Movie Generator", v10), 10);
        FigAtomicIncrement32();
        if (dword_1E96B6808)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  byteStream = self->_byteStream;
  if (byteStream) {
    CFRelease(byteStream);
  }
  masterMovieReader = self->_masterMovieReader;
  if (masterMovieReader) {
    CFRelease(masterMovieReader);
  }
  [(NSMutableArray *)self->_movieInfoAndCallbacks count];

  FigSimpleMutexDestroy();
  FigAtomicDecrement32();
  if (dword_1E96B6808)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6.receiver = self;
  v6.super_class = (Class)BWIrisMovieGenerator;
  [(BWIrisMovieGenerator *)&v6 dealloc];
}

- (void)writeMovieWithInfo:(id)a3 completionHandler:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  v7 = objc_msgSend((id)-[NSMutableArray lastObject](self->_movieInfoAndCallbacks, "lastObject"), "info");
  if (v7)
  {
    [v7 movieTrimEndTime];
    if (a3) {
      [a3 movieTrimEndTime];
    }
    else {
      memset(&v10, 0, sizeof(v10));
    }
    CMTimeCompare(&time1, &v10);
  }
  int v8 = +[BWIrisMovieInfoAndCallback movieInfoAndCallbackWithMovieInfo:callback:](BWIrisMovieInfoAndCallback, "movieInfoAndCallbackWithMovieInfo:callback:", a3, a4, v10.value, *(void *)&v10.timescale, v10.epoch);
  [(NSMutableArray *)self->_movieInfoAndCallbacks addObject:v8];
  if ([[(BWIrisMovieInfoAndCallback *)v8 info] numberOfRequestedVariants] < 2)int v9 = 1; {
  else
  }
    int v9 = [[(BWIrisMovieInfoAndCallback *)v8 info] numberOfRequestedVariants];
  self->_numberOfPendingReferenceMovies += v9;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
}

- (void)parseAdditionalFragments
{
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  movieGenerationQueue = self->_movieGenerationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__BWIrisMovieGenerator_parseAdditionalFragments__block_invoke;
  v5[3] = &unk_1E5C24430;
  v5[4] = self;
  fig_dispatch_async_autoreleasepool(movieGenerationQueue, v5);
  if (*v3 == 1) {
    kdebug_trace();
  }
}

uint64_t __48__BWIrisMovieGenerator_parseAdditionalFragments__block_invoke(uint64_t a1)
{
  return -[BWIrisMovieGenerator _generateIrisMovies:](*(void *)(a1 + 32), 0);
}

- (uint64_t)_generateIrisMovies:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (!a1) {
    return v2;
  }
  v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (*(unsigned char *)(v2 + 57))
  {
    -[BWIrisMovieGenerator _cancelAllPendingIrisMoviesWithError:](v2, *(unsigned int *)(v2 + 60));
    uint64_t v5 = [(id)v2 suspended];
LABEL_10:
    uint64_t v2 = v5;
    goto LABEL_11;
  }
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (!-[BWIrisMovieGenerator _doIrisMovieParsing:](v2, a2))
  {
    memset(&v12, 0, sizeof(v12));
    memset(&v11, 0, sizeof(v11));
    [(BWIrisMovieGenerator *)v2 _findIrisShortestTrackDuration:&v12 audioTrackDuration:a2 flush:v6];
    CMTime v10 = v11;
    CMTime v9 = v12;
    v7 = (void *)-[BWIrisMovieGenerator _completedMovieInfoAndCallbacksForShortestTrackDuration:audioTrackDuration:flush:](v2, (long long *)&v10.value, (long long *)&v9.value, a2);
    uint64_t v5 = -[BWIrisMovieGenerator _generateCompletedIrisMovies:](v2, v7);
    goto LABEL_10;
  }
  uint64_t v2 = 0;
LABEL_11:
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v2;
}

- (BOOL)flush
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  movieGenerationQueue = self->_movieGenerationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__BWIrisMovieGenerator_flush__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(movieGenerationQueue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__BWIrisMovieGenerator_flush__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[BWIrisMovieGenerator _generateIrisMovies:](*(void *)(a1 + 32), 1);
}

- (BOOL)flushAsync
{
  movieGenerationQueue = self->_movieGenerationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__BWIrisMovieGenerator_flushAsync__block_invoke;
  v6[3] = &unk_1E5C24430;
  v6[4] = self;
  fig_dispatch_async_autoreleasepool(movieGenerationQueue, v6);
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  BOOL v4 = [(NSMutableArray *)self->_movieInfoAndCallbacks count] == 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  return v4;
}

uint64_t __34__BWIrisMovieGenerator_flushAsync__block_invoke(uint64_t a1)
{
  return -[BWIrisMovieGenerator _generateIrisMovies:](*(void *)(a1 + 32), 1);
}

- (void)updateOverCaptureQualityScoresForMoviesEndingBefore:(id *)a3 fromMetadataRingBuffer:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  uint64_t v5 = [(NSMutableArray *)self->_movieInfoAndCallbacks count];
  if (v5 - 1 >= 0) {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_movieInfoAndCallbacks, "objectAtIndexedSubscript:", v5 - 1), "overCaptureQualityScore");
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
}

uint64_t __99__BWIrisMovieGenerator_updateOverCaptureQualityScoresForMoviesEndingBefore_fromMetadataRingBuffer___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, unsigned char *a5)
{
  CMTime time1 = *a3;
  CMTime v9 = *(CMTime *)(a1 + 40);
  uint64_t result = CMTimeCompare(&time1, &v9);
  if ((result & 0x80000000) != 0) {
    return [*(id *)(a1 + 32) processMetadata:a2];
  }
  *a5 = 1;
  return result;
}

- (void)setSuspended:(BOOL)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  self->_suspended = a3;
  movieInfoAndCallbacksMutex = self->_movieInfoAndCallbacksMutex;
  pthread_mutex_unlock((pthread_mutex_t *)movieInfoAndCallbacksMutex);
}

- (BOOL)suspended
{
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  BOOL suspended = self->_suspended;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  return suspended;
}

- (int)numberOfPendingReferenceMovies
{
  return self->_numberOfPendingReferenceMovies;
}

- (uint64_t)_cancelAllPendingIrisMoviesWithError:(uint64_t)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 96));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v4 = *(void **)(v3 + 104);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          CMTime v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          CMTime v10 = (void *)MEMORY[0x1A6272C70]();
          int v11 = 1;
          [v9 setProcessed:1];
          if ((int)objc_msgSend((id)objc_msgSend(v9, "info"), "numberOfRequestedVariants") >= 2) {
            int v11 = objc_msgSend((id)objc_msgSend(v9, "info"), "numberOfRequestedVariants");
          }
          int v12 = *(_DWORD *)(v3 + 112);
          BOOL v13 = __OFSUB__(v12, v11);
          int v14 = v12 - v11;
          if (v14 < 0 != v13) {
            int v14 = 0;
          }
          *(_DWORD *)(v3 + 112) = v14;
          uint64_t v15 = [v9 callback];
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, [v9 info], a2);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
    [*(id *)(v3 + 104) removeAllObjects];
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
  }
  return result;
}

- (uint64_t)_doIrisMovieParsing:(uint64_t)a1
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BOOL v4 = (uint64_t *)(a1 + 48);
  if (!*(void *)(a1 + 48))
  {
    uint64_t v14 = *MEMORY[0x1E4F32B08];
    v15[0] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v5 = FigFormatReaderCreateForStream();
    if (v5)
    {
      uint64_t v6 = v5;
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    return 0;
  }
  int v13 = 0;
  uint64_t v7 = *v4;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  CMTime v10 = *(uint64_t (**)(uint64_t, void, int *))(v9 + 40);
  if (v10) {
    unsigned int v11 = v10(v7, 0, &v13);
  }
  else {
    unsigned int v11 = -12782;
  }
  if ((a2 & (v11 != 0)) != 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v11;
  }
  if (v6)
  {
LABEL_20:
    FigDebugAssert3();
    return v6;
  }
  if ((v13 & 4) != 0) {
    *(unsigned char *)(a1 + 56) = 1;
  }
  return v6;
}

- (double)_findIrisShortestTrackDuration:(CMTime *)a3 audioTrackDuration:(char)a4 flush:(double)result
{
  if (a1)
  {
    CMTime v28 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v27.value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v27.epoch = v8;
    if (a4)
    {
LABEL_39:
      *a2 = v27;
      uint64_t result = *(double *)&v28.value;
      *a3 = v28;
      return result;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    *(_OWORD *)&v26.value = v7;
    v26.epoch = v8;
    uint64_t v34 = 0;
    v35[0] = 0;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    int v12 = *(unsigned int (**)(uint64_t, uint64_t *))(v11 + 8);
    if (v12 && !v12(v9, &v34))
    {
      if (v34 < 1)
      {
LABEL_36:
        if (v35[0]) {
          CFRelease(v35[0]);
        }
        CMTime v27 = v26;
        goto LABEL_39;
      }
      uint64_t v13 = 0;
      uint64_t v14 = *MEMORY[0x1E4F34AC0];
      uint64_t v15 = *MEMORY[0x1E4F1CF80];
      while (1)
      {
        uint64_t v33 = 0;
        uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v17 = v16 ? v16 : 0;
        long long v18 = *(unsigned int (**)(uint64_t, uint64_t, void, char *, uint64_t *))(v17 + 48);
        if (!v18 || v18(v9, v13, 0, (char *)&v33 + 4, &v33)) {
          break;
        }
        if (HIDWORD(v33) != 1835365473 || (qtrmg_metadataTrackWithIDShouldBePropagated(v9, v33) & 1) != 0)
        {
          uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v19) {
            uint64_t v20 = v19;
          }
          else {
            uint64_t v20 = 0;
          }
          uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, CFTypeRef *, void, void))(v20 + 48);
          if (!v21 || v21(v9, v13, v35, 0, 0)) {
            break;
          }
          CFDictionaryRef v32 = 0;
          uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
          uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v24 = v23 ? v23 : 0;
          v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef *))(v24 + 48);
          if (!v25 || v25(FigBaseObject, v14, v15, &v32)) {
            break;
          }
          memset(&v31, 0, sizeof(v31));
          CMTimeMakeFromDictionary(&v31, v32);
          if (v32) {
            CFRelease(v32);
          }
          if (HIDWORD(v33) == 1936684398) {
            CMTime v28 = v31;
          }
          CMTime time1 = v26;
          CMTime time2 = v31;
          CMTimeMinimum(&v26, &time1, &time2);
          if (v35[0])
          {
            CFRelease(v35[0]);
            v35[0] = 0;
          }
        }
        if (++v13 >= v34) {
          goto LABEL_36;
        }
      }
    }
    FigDebugAssert3();
    goto LABEL_36;
  }
  return result;
}

- (uint64_t)_completedMovieInfoAndCallbacksForShortestTrackDuration:(long long *)a3 audioTrackDuration:(char)a4 flush:
{
  if (!a1) {
    return 0;
  }
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 96));
  CMTimeEpoch v8 = *(void **)(a1 + 104);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__BWIrisMovieGenerator__completedMovieInfoAndCallbacksForShortestTrackDuration_audioTrackDuration_flush___block_invoke;
  v11[3] = &unk_1E5C24708;
  char v16 = a4;
  v11[4] = a1;
  long long v12 = *a3;
  uint64_t v13 = *((void *)a3 + 2);
  long long v14 = *a2;
  uint64_t v15 = *((void *)a2 + 2);
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 104), "objectsAtIndexes:", objc_msgSend(v8, "indexesOfObjectsPassingTest:", v11));
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 96));
  return v9;
}

- (uint64_t)_generateCompletedIrisMovies:(uint64_t)result
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v25;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v25 != v5) {
            objc_enumerationMutation(a2);
          }
          long long v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
          CMTimeEpoch v8 = (void *)MEMORY[0x1A6272C70]();
          if ([(id)v3 suspended])
          {
            return 1;
          }
          [v7 setProcessed:1];
          id v9 = v7;
          uint64_t v10 = (void *)[v7 info];
          uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "settings"), "movieLevelMetadata");
          id v12 = (id)v11;
          if (*(void *)(v3 + 136)) {
            id v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityDisabledIfRequired(v11);
          }
          if ([v10 isVitalityScoreValid])
          {
            [v10 vitalityScore];
            id v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityScore(v12, [v10 vitalityScoringVersion], v13);
          }
          if ([v10 limitStillImageTransformDuringVitalityPlayback]) {
            id v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithLimitStillImageTransformFlagIfRequired(v12);
          }
          if (objc_msgSend((id)objc_msgSend(v10, "subjectRelightingResult"), "relightingRequired"))
          {
            objc_msgSend((id)objc_msgSend(v10, "subjectRelightingResult"), "curveParameter");
            id v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSubjectRelightingAppliedCurveParameter(v12, v14);
          }
          if (objc_msgSend((id)objc_msgSend(v10, "stillImageRequestSettings"), "smartStyle")) {
            id v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSmartStyleMetadata(v12, objc_msgSend((id)objc_msgSend(v10, "stillImageRequestSettings"), "smartStyle"), objc_msgSend((id)objc_msgSend(v10, "settings"), "smartStyleRenderingBypassed"));
          }
          [v7 overCaptureQualityScore];
          [v7 overCaptureQualityScore];
          float v16 = v15;
          id v17 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialOverCaptureQualityScore(v12, [v7 overCaptureQualityScoringVersion], v16);
          uint64_t v18 = -[BWIrisMovieGenerator _generateRefMovieForInfo:movieLevelMetadata:generateMetadataMovie:](v3, v10, (uint64_t)v17, 0);
          pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 96));
          if ((int)objc_msgSend((id)objc_msgSend(v7, "info"), "numberOfRequestedVariants") < 2) {
            int v19 = 1;
          }
          else {
            int v19 = objc_msgSend((id)objc_msgSend(v7, "info"), "numberOfRequestedVariants");
          }
          int v20 = *(_DWORD *)(v3 + 112);
          BOOL v21 = __OFSUB__(v20, v19);
          int v22 = v20 - v19;
          if (v22 < 0 != v21) {
            int v22 = 0;
          }
          *(_DWORD *)(v3 + 112) = v22;
          pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
          uint64_t v23 = [v7 callback];
          (*(void (**)(uint64_t, void *, uint64_t))(v23 + 16))(v23, v10, v18);
          pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 96));
          [*(id *)(v3 + 104) removeObjectIdenticalTo:v7];
          pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));

          ++v6;
        }
        while (v4 != v6);
        uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v4 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

uint64_t __105__BWIrisMovieGenerator__completedMovieInfoAndCallbacksForShortestTrackDuration_audioTrackDuration_flush___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 processed]) {
    return 0;
  }
  memset(&v21, 0, sizeof(v21));
  CMTimeEpoch v8 = (void *)[a2 info];
  if (v8) {
    [v8 movieEndTime];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  id v9 = (void *)[a2 info];
  if (v9) {
    [v9 audioOffset];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTimeAdd(&v21, &lhs, &rhs);
  if (*(unsigned char *)(a1 + 88)) {
    return 1;
  }
  memset(&v18, 0, sizeof(v18));
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = (void *)[a2 info];
  if (!v10) {
    goto LABEL_16;
  }
  if (*(unsigned char *)(v10 + 84))
  {
    CMTime v18 = *(CMTime *)(v10 + 72);
    goto LABEL_17;
  }
  if (!v11)
  {
LABEL_16:
    memset(&v18, 0, sizeof(v18));
    goto LABEL_17;
  }
  [v11 masterMovieStartTime];
LABEL_17:
  CMTime time1 = v21;
  CMTime v15 = v18;
  CMTimeSubtract(&time2, &time1, &v15);
  CMTime time1 = *(CMTime *)(a1 + 40);
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    id v12 = (void *)[a2 info];
    if (v12) {
      [v12 movieEndTime];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CMTime time1 = v18;
    CMTimeSubtract(&v14, &v13, &time1);
    CMTime time1 = *(CMTime *)(a1 + 64);
    if (CMTimeCompare(&v14, &time1) < 1) {
      return 1;
    }
  }
  uint64_t result = 0;
  *a4 = 1;
  return result;
}

- (uint64_t)_generateRefMovieForInfo:(uint64_t)a3 movieLevelMetadata:(int)a4 generateMetadataMovie:
{
  uint64_t v300 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v8 = a1;
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    if (a2) {
      [a2 stillImageCaptureHostTime];
    }
    else {
      memset(&v287, 0, sizeof(v287));
    }
    CMTime time = v287;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (!a2) {
    return 4294950346;
  }
  [a2 masterMovieStartTime];
  if ((v286 & 1) == 0) {
    return 4294950346;
  }
  [a2 stillImageCaptureTime];
  if ((v285 & 1) == 0) {
    return 4294950346;
  }
  [a2 stillImageCaptureTime];
  [a2 masterMovieStartTime];
  if (CMTimeCompare(&time1, &time2) < 1) {
    return 4294950346;
  }
  CFTypeRef v282 = 0;
  CFTypeRef v281 = 0;
  CFTypeRef cf = 0;
  uint64_t v279 = 0;
  v202 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v200 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v201 = (void *)[MEMORY[0x1E4F1CA48] array];
  v192 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v181 = *MEMORY[0x1E4F1FA10];
  *(_OWORD *)&v278.CMTime value = *MEMORY[0x1E4F1FA10];
  CMTimeEpoch v180 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  v278.CMTimeEpoch epoch = v180;
  long long v179 = *MEMORY[0x1E4F1FA08];
  *(_OWORD *)&v277.CMTime value = *MEMORY[0x1E4F1FA08];
  CMTimeEpoch v178 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
  v277.CMTimeEpoch epoch = v178;
  uint64_t v276 = 0;
  uint64_t v273 = FigReentrantMutexCreate();
  uint64_t v274 = FigConditionVariableCreate();
  id v275 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v9 = [a2 numberOfRequestedVariants];
  uint64_t v10 = MEMORY[0x1E4F32548];
  if (v9 != 1)
  {
    LODWORD(p_value) = 0;
    FigDebugAssert3();
    uint64_t SampleBuffer = FigSignalErrorAt();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"too many variants", p_value, *(void *)&v4);
    goto LABEL_127;
  }
  memset(&v272, 0, sizeof(v272));
  if (*(unsigned char *)(v8 + 84)) {
    CMTime v272 = *(CMTime *)(v8 + 72);
  }
  else {
    [a2 masterMovieStartTime];
  }
  [a2 movieStartTime];
  [a2 movieTrimStartTime];
  int32_t v13 = CMTimeCompare(&v271, &v270);
  [a2 masterMovieStartTime];
  CMTime time = v272;
  uint64_t v208 = v8;
  if (CMTimeCompare(&v269, &time))
  {
    memset(&v268, 0, sizeof(v268));
    [a2 masterMovieStartTime];
    CMTime time = v272;
    CMTimeSubtract(&v268, &time, &rhs);
    if (dword_1E96B6808)
    {
      LODWORD(v290.value) = 0;
      LOBYTE(type.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v15 = v290.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        uint64_t v17 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        [a2 masterMovieStartTime];
        Float64 Seconds = CMTimeGetSeconds(&v266);
        CMTime time = v272;
        Float64 v19 = CMTimeGetSeconds(&time);
        CMTime time = v268;
        Float64 v20 = CMTimeGetSeconds(&time);
        LODWORD(value.value) = 136316418;
        *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movieL"
                                                                  "evelMetadata:generateMetadataMovie:]";
        LOWORD(value.flags) = 2048;
        *(void *)((char *)&value.flags + 2) = v208;
        HIWORD(value.epoch) = 2048;
        Float64 v292 = *(double *)&v17;
        __int16 v293 = 2048;
        Float64 v294 = Seconds;
        __int16 v295 = 2048;
        Float64 v296 = v19;
        __int16 v297 = 2048;
        Float64 v298 = v20;
        LODWORD(v169) = 62;
        p_CMTime value = &value;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v8 = v208;
      uint64_t v10 = MEMORY[0x1E4F32548];
    }
    objc_msgSend(a2, "movieStartTime", p_value, v169);
    [a2 masterMovieStartTime];
    if (!CMTimeCompare(&v265, &v264))
    {
      CMTime v263 = v272;
      [a2 setMovieStartTime:&v263];
      if (!v13)
      {
        [a2 movieStartTime];
        long long v259 = v261;
        uint64_t v260 = v262;
        [a2 setMovieTrimStartTime:&v259];
      }
    }
    CMTime v258 = v272;
    [a2 setMasterMovieStartTime:&v258];
  }
  if ([a2 temporaryMovieURL]) {
    uint64_t v21 = [a2 temporaryMovieURL];
  }
  else {
    uint64_t v21 = [a2 outputMovieURL];
  }
  v204 = (void *)v21;
  memset(&v257, 0, sizeof(v257));
  [a2 movieTrimStartTime];
  [a2 masterMovieStartTime];
  CMTimeSubtract(&v257, &lhs, &v255);
  CMTime value = v257;
  [(BWIrisMovieGenerator *)v8 _getAdjustedRefMovieStartTime:(uint64_t)&time];
  CMTime v257 = time;
  memset(&v254, 0, sizeof(v254));
  [a2 movieTrimEndTime];
  [a2 masterMovieStartTime];
  CMTimeSubtract(&v254, &v253, &v252);
  CMTime value = v254;
  [(BWIrisMovieGenerator *)v8 _getAdjustedRefMovieEndTime:(uint64_t)&time];
  CMTime v254 = time;
  uint64_t v22 = *(void *)(v8 + 48);
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F32338], 0);
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [a2 masterMovieURL];
  uint64_t v24 = FigAssetReaderCreateWithURLAndFormatReader();
  if (v24)
  {
    uint64_t SampleBuffer = v24;
    LODWORD(v164) = v24;
    FigDebugAssert3();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"create asset reader", v164, *(void *)&v4);
    goto LABEL_127;
  }
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F32558], 0);
  uint64_t v25 = FigAssetWriterCreateWithURL();
  if (v25)
  {
    uint64_t SampleBuffer = v25;
    LODWORD(v165) = v25;
    FigDebugAssert3();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"create asset writer", v165, *(void *)&v4);
    goto LABEL_127;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v26 = CMNotificationCenterAddListener();
  if (v26)
  {
    uint64_t SampleBuffer = v26;
    LODWORD(v165) = v26;
    FigDebugAssert3();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"add queue level callbacks", v165, *(void *)&v4);
    goto LABEL_127;
  }
  if (a3)
  {
    uint64_t v27 = FigAssetWriterSetFormatWriterProperty((uint64_t)v281, *MEMORY[0x1E4F32CE8], a3);
    if (v27)
    {
      uint64_t SampleBuffer = v27;
      LODWORD(v165) = v27;
      FigDebugAssert3();
      objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"set movie level metadata", v165, *(void *)&v4);
      goto LABEL_127;
    }
  }
  uint64_t TrackCount = FigFormatReaderGetTrackCount(v22, (uint64_t)&v279);
  if (TrackCount)
  {
    uint64_t SampleBuffer = TrackCount;
    LODWORD(v165) = TrackCount;
    FigDebugAssert3();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"get track count", v165, *(void *)&v4);
    goto LABEL_127;
  }
  uint64_t v29 = v279;
  if (a4 && v279 != 1) {
    goto LABEL_309;
  }
  CFAllocatorRef allocator = v23;
  *(void *)(v8 + 64) = -1;
  if (v29 >= 1)
  {
    unsigned int TrackTimescale = 0;
    unsigned int v196 = 0;
    uint64_t v190 = 0;
    uint64_t v30 = 0;
    double v31 = 0.0;
    uint64_t v207 = 0;
    uint64_t v174 = *MEMORY[0x1E4F32E98];
    uint64_t v173 = *MEMORY[0x1E4F32E30];
    uint64_t v183 = *MEMORY[0x1E4F349B8];
    uint64_t v177 = *MEMORY[0x1E4F32F00];
    uint64_t v182 = *MEMORY[0x1E4F447D0];
    key = (void *)*MEMORY[0x1E4F33070];
    v185 = (void *)*MEMORY[0x1E4F33068];
    v176 = (void *)*MEMORY[0x1E4F32FD0];
    uint64_t value_low = -1;
    uint64_t v184 = *MEMORY[0x1E4F32E78];
    uint64_t v175 = *MEMORY[0x1E4F32FD8];
    CFStringRef v194 = (CFStringRef)*MEMORY[0x1E4F32E60];
    uint64_t v188 = *MEMORY[0x1E4F32EE0];
    uint64_t v191 = -1;
    while (1)
    {
      LODWORD(v290.value) = 0;
      LODWORD(type.value) = 0;
      LODWORD(v240.value) = 0;
      LODWORD(v239.value) = 0;
      uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v32) {
        uint64_t v33 = v32;
      }
      else {
        uint64_t v33 = 0;
      }
      uint64_t v34 = *(uint64_t (**)(uint64_t, void, void, CMTime *, CMTime *))(v33 + 48);
      if (!v34)
      {
        uint64_t SampleBuffer = 4294954514;
        goto LABEL_124;
      }
      uint64_t v35 = v34(v22, *(void *)&v31, 0, &type, &v290);
      if (v35)
      {
        uint64_t SampleBuffer = v35;
LABEL_124:
        v110 = *(void **)(v8 + 152);
        v72 = NSString;
        Float64 v166 = v31;
        v70 = @"copy track with index %d";
LABEL_125:
        uint64_t v111 = objc_msgSend(v72, "stringWithFormat:", v70, *(void *)&v166, *(void *)&v170);
LABEL_126:
        objc_msgSend(v110, "logErrorNumber:errorString:", SampleBuffer, v111, v167, v171);
        goto LABEL_127;
      }
      if (a4 && LODWORD(type.value) != 1835365473)
      {
LABEL_49:
        uint64_t v36 = v30;
        goto LABEL_102;
      }
      if (LODWORD(type.value) == 1986618469)
      {
        uint64_t v36 = (v30 + 1);
        if ([a2 requestedSDOFVariants] == 2 && v30
          || [a2 requestedSDOFVariants] == 1 && v30 != 1)
        {
          goto LABEL_102;
        }
        unsigned int TrackTimescale = qtrmg_getTrackTimescale(v22, LODWORD(v290.value));
      }
      else
      {
        if (LODWORD(type.value) == 1835365473)
        {
          if (!qtrmg_metadataTrackWithIDShouldBePropagated(v22, LODWORD(v290.value))) {
            goto LABEL_49;
          }
          if (value_low == -1) {
            uint64_t value_low = SLODWORD(v290.value);
          }
        }
        uint64_t v36 = v30;
      }
      if (*(unsigned char *)(v8 + 11))
      {
        uint64_t v37 = FigAssetReaderEnableOriginalSampleReferenceExtractionFromTrack((uint64_t)v282, LODWORD(v290.value), (uint64_t)&v240);
        if (v37)
        {
          uint64_t SampleBuffer = v37;
          v110 = *(void **)(v8 + 152);
          uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"enable original sample reference extraction for index %d", *(void *)&v31, *(void *)&v170);
          goto LABEL_126;
        }
      }
      else
      {
        uint64_t v38 = FigAssetReaderEnableOriginalSampleExtractionFromTrack((uint64_t)v282, LODWORD(v290.value), (uint64_t)&v240);
        if (v38)
        {
          uint64_t SampleBuffer = v38;
          v110 = *(void **)(v8 + 152);
          uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"enable original sample extraction for index %d", *(void *)&v31, *(void *)&v170);
          goto LABEL_126;
        }
      }
      uint64_t v39 = LODWORD(type.value);
      if (LODWORD(type.value) == 1986618469)
      {
        uint64_t v40 = v10;
        uint64_t v191 = SLODWORD(v240.value);
      }
      else
      {
        uint64_t v40 = v10;
        if (LODWORD(type.value) == 1936684398) {
          *(void *)(v8 + 64) = SLODWORD(v240.value);
        }
      }
      uint64_t v41 = FigAssetWriterAddNativeTrack((uint64_t)v281, v39, (uint64_t)&v239);
      if (v41)
      {
        uint64_t SampleBuffer = v41;
        [*(id *)(v8 + 152) logErrorNumber:v41, objc_msgSend(NSString, "stringWithFormat:", @"add native track for index %d", *(void *)&v31) errorString];
        goto LABEL_127;
      }
      uint64_t v42 = [NSNumber numberWithLong:v207];
      objc_msgSend(v200, "setObject:forKeyedSubscript:", v42, objc_msgSend(NSNumber, "numberWithInt:", LODWORD(v239.value)));
      if (SLODWORD(type.value) > 1936684397)
      {
        if (LODWORD(type.value) == 1936684398)
        {
          CMTimeMake(&v251, 10, 1);
          CFDictionaryRef v58 = CMTimeCopyAsDictionary(&v251, allocator);
          uint64_t SampleBuffer = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v174, (uint64_t)v58);
          CFRelease(v58);
          if (SampleBuffer)
          {
            [*(id *)(v8 + 152) logErrorNumber:SampleBuffer, objc_msgSend(NSString, "stringWithFormat:", @"set preferred chunk duration for track %d", LODWORD(v239.value)) errorString];
            goto LABEL_127;
          }
          CMTime time = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          CFDictionaryRef v59 = CMTimeCopyAsDictionary(&time, allocator);
          uint64_t SampleBuffer = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v173, (uint64_t)v59);
          CFRelease(v59);
          uint64_t v10 = MEMORY[0x1E4F32548];
          if (SampleBuffer)
          {
            v110 = *(void **)(v8 + 152);
            uint64_t v111 = objc_msgSend(NSString, "stringWithFormat:", @"set interleave advance for track %d", LODWORD(v239.value), *(void *)&v170);
            goto LABEL_126;
          }
        }
        else
        {
          if (LODWORD(type.value) == 1986618469)
          {
            unsigned int v196 = v239.value;
LABEL_80:
            uint64_t v44 = FigFormatReaderCopyTrackByID(v22, LODWORD(v290.value), (uint64_t)&cf);
            if (v44)
            {
              uint64_t SampleBuffer = v44;
LABEL_313:
              FigDebugAssert3();
              uint64_t v8 = v208;
              goto LABEL_127;
            }
            v45 = (void *)[a2 settings];
            int v46 = [v45 videoOrientation];
            int v47 = [v45 videoMirrored];
            time.CMTime value = 0;
            uint64_t v48 = FigTrackReaderCopyProperty((uint64_t)cf, v183, (uint64_t)allocator, (uint64_t)&time);
            if (v48)
            {
              uint64_t SampleBuffer = v48;
              goto LABEL_313;
            }
            unsigned int v49 = objc_msgSend((id)objc_msgSend((id)time.value, "objectForKeyedSubscript:", @"Width"), "intValue");
            uint64_t v50 = objc_msgSend((id)objc_msgSend((id)time.value, "objectForKeyedSubscript:", @"Height"), "intValue");

            uint64_t v51 = BWBuildVideoTrackMatrix(v46, v47, 0, *(unsigned __int8 *)(v208 + 8), *(unsigned __int8 *)(v208 + 9), 0, v49 | (unint64_t)(v50 << 32));
            if (v51)
            {
              uint64_t v52 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v177, v51);
              if (v52)
              {
                uint64_t SampleBuffer = v52;
                uint64_t v8 = v208;
                [*(id *)(v208 + 152) logErrorNumber:v52, objc_msgSend(NSString, "stringWithFormat:", @"set track matrix for track %d", LODWORD(v239.value)) errorString];
                goto LABEL_127;
              }
            }
            LOBYTE(v190) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "videoSettings"), "objectForKeyedSubscript:", @"AVVideoCompressionPropertiesKey"), "objectForKeyedSubscript:", v182), "BOOLValue");
            value.CMTime value = 0;
            uint64_t v53 = FigMetadataCopyTrackQuickTimeMetadata();
            uint64_t v10 = MEMORY[0x1E4F32548];
            if (v53)
            {
              uint64_t SampleBuffer = v53;
              FigDebugAssert3();
              uint64_t v8 = v208;
              goto LABEL_127;
            }
            uint64_t v8 = v208;
            if (value.value)
            {
              Mutable = CFDictionaryCreateMutable(allocator, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              CFDictionaryAddValue(Mutable, key, (const void *)value.value);
              CFRelease((CFTypeRef)value.value);
              CFDictionaryAddValue(Mutable, v185, v176);
              uint64_t SampleBuffer = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v184, (uint64_t)Mutable);
              CFRelease(Mutable);
              if (SampleBuffer) {
                goto LABEL_318;
              }
            }
            v268.CMTime value = 0;
            uint64_t v55 = FigMetadataCopyTrackQuickTimeUserdata();
            if (v55)
            {
              uint64_t SampleBuffer = v55;
              goto LABEL_318;
            }
            if (v268.value)
            {
              v56 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
              [v56 setObject:v175 forKeyedSubscript:v185];
              [v56 setObject:v268.value forKeyedSubscript:key];
              if (v268.value) {
                CFRelease((CFTypeRef)v268.value);
              }
              uint64_t v57 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v184, (uint64_t)v56);
              if (v57)
              {
                uint64_t SampleBuffer = v57;
LABEL_318:
                FigDebugAssert3();
LABEL_127:
                v73 = 0;
                goto LABEL_128;
              }
            }
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
            goto LABEL_98;
          }
          uint64_t v10 = MEMORY[0x1E4F32548];
        }
      }
      else
      {
        if (LODWORD(type.value) == 1635088502) {
          goto LABEL_80;
        }
        if (LODWORD(type.value) == 1835365473)
        {
          objc_msgSend(v192, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", LODWORD(v239.value)));
          int v43 = HIDWORD(v190);
          if (!HIDWORD(v190)) {
            int v43 = v239.value;
          }
          HIDWORD(v190) = v43;
        }
        uint64_t v10 = v40;
      }
LABEL_98:
      uint64_t v60 = qtrmg_getTrackTimescale(v22, LODWORD(v290.value));
      uint64_t v61 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), (uint64_t)v194, [NSNumber numberWithInt:v60]);
      if (v61)
      {
        uint64_t SampleBuffer = v61;
        v99 = *(void **)(v8 + 152);
        uint64_t v100 = objc_msgSend(NSString, "stringWithFormat:", @"set time scale %d for track %d", v60, LODWORD(v239.value));
LABEL_250:
        [v99 logErrorNumber:SampleBuffer errorString:v100];
        goto LABEL_127;
      }
      if (*(unsigned char *)(v8 + 11))
      {
        uint64_t v62 = objc_msgSend((id)objc_msgSend(v204, "URLByDeletingLastPathComponent"), "absoluteURL");
        uint64_t v63 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, LODWORD(v239.value), v188, v62);
        if (v63)
        {
          uint64_t SampleBuffer = v63;
          v99 = *(void **)(v8 + 152);
          uint64_t v100 = objc_msgSend(NSString, "stringWithFormat:", @"set sample reference base URL for track %d", LODWORD(v239.value), *(void *)&v170);
          goto LABEL_250;
        }
      }
      ++v207;
      uint64_t v64 = [NSNumber numberWithInt:LODWORD(v240.value)];
      objc_msgSend(v202, "setObject:forKeyedSubscript:", v64, objc_msgSend(NSNumber, "numberWithInt:", LODWORD(v239.value)));
LABEL_102:
      ++*(void *)&v31;
      uint64_t v30 = v36;
      if (*(uint64_t *)&v31 >= v279) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v190 = 0;
  uint64_t v191 = -1;
  uint64_t v207 = 0;
  unsigned int v196 = 0;
  unsigned int TrackTimescale = 0;
  uint64_t value_low = -1;
LABEL_105:
  [a2 stillImageCaptureTime];
  if ((v250 & 1) != 0
    && (a4 & 1) == 0
    && +[BWIrisMovieGenerator _addNewMetadataTrackToAssetWriter:forTrackTimeScale:yieldingTrackID:]((uint64_t)BWIrisMovieGenerator, (uint64_t)v281, TrackTimescale, (unsigned int *)&v276 + 1))
  {
    objc_msgSend(v192, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(v276)));
  }
  if (objc_msgSend((id)objc_msgSend(a2, "settings"), "recordVideoOrientationAndMirroringChanges")
    && *(void *)(v8 + 144)
    && +[BWIrisMovieGenerator _addNewMetadataTrackToAssetWriter:forTrackTimeScale:yieldingTrackID:]((uint64_t)BWIrisMovieGenerator, (uint64_t)v281, TrackTimescale, (unsigned int *)&v276))
  {
    objc_msgSend(v192, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v276));
  }
  keya = (void *)[v202 allKeys];
  uint64_t v65 = qtrmg_setupMetadataTrackReferences((uint64_t)v281, v196, v192);
  if (v65)
  {
    uint64_t SampleBuffer = v65;
    LODWORD(v165) = v65;
    FigDebugAssert3();
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"set metadata track references", v165, *(void *)&v4);
    goto LABEL_127;
  }
  memset(&v249, 0, sizeof(v249));
  CMTime time = v257;
  CMTimeConvertScale(&v249, &time, TrackTimescale, kCMTimeRoundingMethod_QuickTime);
  CMTime v248 = v254;
  memset(&v247, 0, sizeof(v247));
  [a2 audioOffset];
  if (v246)
  {
    [a2 audioOffset];
    CMTime time = v248;
    CMTimeAdd(&v247, &time, &v245);
  }
  else
  {
    CMTime v247 = v248;
  }
  CMTime time = v248;
  CMTimeConvertScale(&v248, &time, v249.timescale, kCMTimeRoundingMethod_QuickTime);
  CMTime value = v247;
  CMTimeConvertScale(&time, &value, v249.timescale, kCMTimeRoundingMethod_QuickTime);
  CMTimeEpoch epoch = time.epoch;
  CMTime v247 = time;
  CMTime time = v249;
  *(_OWORD *)&value.CMTime value = *(_OWORD *)&v247.value;
  value.CMTimeEpoch epoch = epoch;
  uint64_t started = FigAssetReaderStartExtractionForTimeRange((uint64_t)v282, (long long *)&time.value, (long long *)&value.value);
  if (started)
  {
    uint64_t SampleBuffer = started;
    v110 = *(void **)(v8 + 152);
    v68 = NSString;
    CMTime time = v249;
    Float64 v69 = CMTimeGetSeconds(&time);
    CMTime time = v248;
    Float64 v166 = v69;
    Float64 v170 = CMTimeGetSeconds(&time);
    v70 = @"start extraction %.4lf to %.4lf";
LABEL_122:
    v72 = v68;
    goto LABEL_125;
  }
  CMTime time = v249;
  uint64_t v71 = FigAssetWriterBeginSession((uint64_t)v281, (long long *)&time.value);
  if (v71)
  {
    uint64_t SampleBuffer = v71;
    v110 = *(void **)(v8 + 152);
    v68 = NSString;
    CMTime time = v249;
    Float64 v166 = CMTimeGetSeconds(&time);
    v70 = @"begin session from %.4lf";
    goto LABEL_122;
  }
  if (v207 <= 0)
  {
LABEL_309:
    FigDebugAssert3();
    v73 = 0;
    uint64_t SampleBuffer = 0xFFFFFFFFLL;
    goto LABEL_128;
  }
  v76 = (char *)malloc_type_malloc(24 * v207, 0x1000040504FFAC1uLL);
  long long v77 = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v78 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v189 = v76;
  v79 = v76;
  uint64_t v80 = v207;
  do
  {
    *(_OWORD *)v79 = v77;
    *((void *)v79 + 2) = v78;
    v79 += 24;
    --v80;
  }
  while (v80);
  long long v205 = v77;
  if (![v202 count])
  {
    uint64_t SampleBuffer = 0;
LABEL_239:
    v101 = v192;
    v73 = v189;
    if (objc_msgSend(v192, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(v276))))
    {
      memset(&time, 0, sizeof(time));
      [a2 stillImageCaptureTime];
      [a2 masterMovieStartTime];
      CMTimeSubtract(&time, &v235, &v234);
      id v102 = *(id *)(v8 + 136);
      if (v102)
      {
        id v102 = (id)objc_msgSend(v102, "copyAndClearStillImageTransformDataForSettingsID:", objc_msgSend(a2, "livePhotoMetadataStillImageKeyFrameSettingsID"));
        if (v102 || (v103 = [MEMORY[0x1E4F1C9B8] data], (id v102 = (id)v103) != 0))
        {
          v104 = (void *)[a2 settings];
          unsigned int v105 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "videoSettings"), "objectForKeyedSubscript:", @"AVVideoWidthKey"), "intValue");
          uint64_t v103 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "videoSettings"), "objectForKeyedSubscript:", @"AVVideoHeightKey"), "intValue");
        }
        else
        {
          unsigned int v105 = 0;
        }
      }
      else
      {
        unsigned int v105 = 0;
        uint64_t v103 = 0;
      }
      CMTime value = time;
      uint64_t SampleBuffer = qtrmg_writeStillImageTimeMetadataSample((uint64_t)v281, HIDWORD(v276), (long long *)&value.value, v102, v105 | (unint64_t)(v103 << 32), TrackTimescale);
      if (SampleBuffer)
      {
        [*(id *)(v8 + 152) logErrorNumber:SampleBuffer, objc_msgSend(NSString, "stringWithFormat:", @"write still image metadata to track %d", HIDWORD(v276)) errorString];
        goto LABEL_128;
      }
      v101 = v192;
    }
    if (objc_msgSend(v101, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v276)))
    {
      v112 = *(void **)(v8 + 144);
      [a2 masterMovieStartTime];
      CMTime time = v249;
      CMTime value = v248;
      v113 = (void *)[v112 copyVideoOrientationSbufFromPTS:&time toPTS:&value referencePTS:v233];
      if ([v113 count])
      {
        CMTime time = v248;
        uint64_t v114 = qtrmg_writeVideoOrientationMetadataSamples((uint64_t)v281, v276, v113, &time);
        if (v114) {
          [*(id *)(v8 + 152) logErrorNumber:v114, objc_msgSend(NSString, "stringWithFormat:", @"write video orientation metadata to track %d", v276) errorString];
        }
      }
      else
      {
        [*(id *)(v8 + 152) logErrorNumber:SampleBuffer, objc_msgSend(NSString, "stringWithFormat:", @"copy video orientation samples from %@", *(void *)(v8 + 144)) errorString];
      }

      v73 = v189;
    }
    CMTime time = v248;
    uint64_t v115 = FigAssetWriterEndSession((uint64_t)v281, (long long *)&time.value);
    if (v115)
    {
      uint64_t SampleBuffer = v115;
      v108 = *(void **)(v8 + 152);
      CMTime time = v248;
      uint64_t v109 = objc_msgSend(NSString, "stringWithFormat:", @"end session to %.4lf", CMTimeGetSeconds(&time));
      goto LABEL_266;
    }
    memset(&v232, 0, sizeof(v232));
    CMTime time = v248;
    CMTime value = v249;
    CMTimeSubtract(&v232, &time, &value);
    long long v228 = 0u;
    long long v229 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    uint64_t v118 = [keya countByEnumeratingWithState:&v228 objects:v288 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v229;
      uint64_t v206 = *MEMORY[0x1E4F32DC8];
      while (2)
      {
        for (uint64_t i = 0; i != v119; ++i)
        {
          if (*(void *)v229 != v120) {
            objc_enumerationMutation(keya);
          }
          v122 = *(void **)(*((void *)&v228 + 1) + 8 * i);
          uint64_t v123 = objc_msgSend((id)objc_msgSend(v200, "objectForKeyedSubscript:", v122), "integerValue");
          if (v123 >= v207)
          {
            uint64_t SampleBuffer = 0;
            goto LABEL_128;
          }
          v124 = &v73[24 * v123];
          v290.CMTime value = *(void *)v124;
          v290.timescale = *((_DWORD *)v124 + 2);
          CMTimeFlags v125 = *((_DWORD *)v124 + 3);
          if (v125)
          {
            CMTimeEpoch v126 = *((void *)v124 + 2);
            memset(&time, 0, sizeof(time));
            CMTime value = v249;
            v268.CMTime value = v290.value;
            v268.timescale = v290.timescale;
            v268.flags = v125;
            v268.CMTimeEpoch epoch = v126;
            CMTimeSubtract(&time, &value, &v268);
            CMTime value = time;
            if (CMTimeGetSeconds(&value) > 0.0005)
            {
              CMTime value = time;
              CMTime v268 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
              if (CMTimeCompare(&value, &v268) < 1)
              {
                v203 = *(void **)(v208 + 152);
                v129 = NSString;
                value.CMTime value = v290.value;
                value.timescale = v290.timescale;
                value.flags = v125;
                value.CMTimeEpoch epoch = v126;
                Float64 v130 = CMTimeGetSeconds(&value);
                CMTime value = v249;
                Float64 v131 = CMTimeGetSeconds(&value);
                CMTime value = time;
                uint64_t v8 = v208;
                [v203 logErrorNumber:0xFFFFFFFFLL, objc_msgSend(v129, "stringWithFormat:", @"Earliest read PTS %.4lf is larger than from value %.4lf by %.4lf for track %@, not able to make an edit", *(void *)&v130, *(void *)&v131, -CMTimeGetSeconds(&value), v122) errorString];
              }
              else
              {
                CMTime value = v232;
                CMTime v268 = time;
                uint64_t v127 = BWTrackEditListArrayForRegularTrackInIrisMovie((long long *)&value.value, (long long *)&v268.value);
                uint64_t v128 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, [v122 intValue], v206, v127);
                uint64_t v8 = v208;
                if (v128)
                {
                  uint64_t SampleBuffer = v128;
                  [*(id *)(v208 + 152) logErrorNumber:v128, objc_msgSend(NSString, "stringWithFormat:", @"set edit list for track %d", objc_msgSend(v122, "intValue")) errorString];
                  goto LABEL_345;
                }
              }
            }
            v73 = v189;
          }
          else
          {
            [*(id *)(v8 + 152) logErrorNumber:0xFFFFFFFFLL, objc_msgSend(NSString, "stringWithFormat:", @"Earliest read PTS not available for track %@, not able to make an edit", v122) errorString];
          }
        }
        uint64_t v119 = [keya countByEnumeratingWithState:&v228 objects:v288 count:16];
        if (v119) {
          continue;
        }
        break;
      }
    }
    if (HIDWORD(v276))
    {
      uint64_t v132 = BWTrackEditListArrayForStillImageDisplayTimeTrackInIrisTrimmedMovie(a2, TrackTimescale);
      uint64_t v133 = FigAssetWriterSetFormatWriterTrackProperty((uint64_t)v281, HIDWORD(v276), *MEMORY[0x1E4F32DC8], v132);
      if (v133)
      {
        uint64_t SampleBuffer = v133;
        v108 = *(void **)(v8 + 152);
        uint64_t v109 = objc_msgSend(NSString, "stringWithFormat:", @"set edit list for still image track %d", HIDWORD(v276));
        goto LABEL_266;
      }
    }
    uint64_t v134 = FigAssetWriterFinish((uint64_t)v281);
    if (v134)
    {
      uint64_t SampleBuffer = v134;
      Float64 v170 = v4;
      LODWORD(v165) = v134;
      FigDebugAssert3();
      v117 = *(void **)(v8 + 152);
      v116 = @"writer finish";
      goto LABEL_267;
    }
    uint64_t v135 = FigAssetReaderInvalidate();
    if (v135)
    {
      uint64_t SampleBuffer = v135;
      Float64 v170 = v4;
      LODWORD(v165) = v135;
      FigDebugAssert3();
      v117 = *(void **)(v8 + 152);
      v116 = @"reader invalidate";
      goto LABEL_267;
    }
    uint64_t v136 = FigAssetWriterInvalidate();
    if (v136)
    {
      uint64_t SampleBuffer = v136;
      Float64 v170 = v4;
      LODWORD(v165) = v136;
      FigDebugAssert3();
      v117 = *(void **)(v8 + 152);
      v116 = @"writer invalidate";
      goto LABEL_267;
    }
    CMTime time = v278;
    *(_OWORD *)&value.CMTime value = v181;
    value.CMTimeEpoch epoch = v180;
    if (!CMTimeCompare(&time, &value)
      || (time = v277, *(_OWORD *)&value.value = v179, value.CMTimeEpoch epoch = v178, !CMTimeCompare(&time, &value)))
    {
      uint64_t SampleBuffer = 0;
      goto LABEL_128;
    }
    memset(&v268, 0, sizeof(v268));
    CMTime time = v278;
    CMTime value = v249;
    CMTimeSubtract(&v268, &time, &value);
    memset(&v290, 0, sizeof(v290));
    [a2 movieStartTime];
    CMTime time = v268;
    CMTimeAdd(&v290, &v227, &time);
    if (([a2 containsTrims] & 1) == 0)
    {
      if (dword_1E96B6808)
      {
        LODWORD(type.value) = 0;
        LOBYTE(v240.value) = 0;
        v137 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v138 = type.value;
        if (os_log_type_enabled(v137, v240.value)) {
          unsigned int v139 = v138;
        }
        else {
          unsigned int v139 = v138 & 0xFFFFFFFE;
        }
        if (v139)
        {
          [a2 movieTrimStartTime];
          Float64 v140 = CMTimeGetSeconds(&v226);
          CMTime time = v290;
          Float64 v141 = CMTimeGetSeconds(&time);
          [a2 movieTrimStartTime];
          CMTime time = v290;
          CMTimeSubtract(&v225, &time, &v224);
          Float64 v142 = CMTimeGetSeconds(&v225);
          LODWORD(value.value) = 136316162;
          *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movi"
                                                                    "eLevelMetadata:generateMetadataMovie:]";
          LOWORD(value.flags) = 2048;
          *(void *)((char *)&value.flags + 2) = v208;
          HIWORD(value.epoch) = 2048;
          Float64 v292 = v140;
          __int16 v293 = 2048;
          Float64 v294 = v141;
          __int16 v295 = 2048;
          Float64 v296 = v142;
          LODWORD(v170) = 52;
          v165 = &value;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMTime v223 = v290;
      objc_msgSend(a2, "setMovieTrimStartTime:", &v223, v165, *(void *)&v170);
    }
    if (dword_1E96B6808)
    {
      LODWORD(type.value) = 0;
      LOBYTE(v240.value) = 0;
      v143 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v144 = type.value;
      if (os_log_type_enabled(v143, v240.value)) {
        unsigned int v145 = v144;
      }
      else {
        unsigned int v145 = v144 & 0xFFFFFFFE;
      }
      if (v145)
      {
        [a2 movieStartTime];
        Float64 v146 = CMTimeGetSeconds(&v222);
        CMTime time = v290;
        Float64 v147 = CMTimeGetSeconds(&time);
        [a2 movieStartTime];
        CMTime time = v290;
        CMTimeSubtract(&v221, &time, &v220);
        Float64 v148 = CMTimeGetSeconds(&v221);
        *(double *)&uint64_t v149 = COERCE_DOUBLE([a2 description]);
        LODWORD(value.value) = 136316418;
        *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movieL"
                                                                  "evelMetadata:generateMetadataMovie:]";
        LOWORD(value.flags) = 2048;
        *(void *)((char *)&value.flags + 2) = v208;
        HIWORD(value.epoch) = 2048;
        Float64 v292 = v146;
        __int16 v293 = 2048;
        Float64 v294 = v147;
        __int16 v295 = 2048;
        Float64 v296 = v148;
        __int16 v297 = 2112;
        Float64 v298 = *(double *)&v149;
        LODWORD(v170) = 62;
        v165 = &value;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMTime v219 = v290;
    objc_msgSend(a2, "setMovieStartTime:", &v219, v165, *(void *)&v170);
    memset(&type, 0, sizeof(type));
    CMTime time = v277;
    CMTime value = v278;
    CMTimeSubtract(&type, &time, &value);
    memset(&v240, 0, sizeof(v240));
    [a2 movieStartTime];
    CMTime time = type;
    CMTimeAdd(&v240, &v218, &time);
    if (([a2 containsTrims] & 1) == 0)
    {
      if (dword_1E96B6808)
      {
        LODWORD(v239.value) = 0;
        LOBYTE(v289.value) = 0;
        v150 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v151 = v239.value;
        if (os_log_type_enabled(v150, v289.value)) {
          unsigned int v152 = v151;
        }
        else {
          unsigned int v152 = v151 & 0xFFFFFFFE;
        }
        if (v152)
        {
          [a2 movieTrimEndTime];
          Float64 v153 = CMTimeGetSeconds(&v217);
          CMTime time = v240;
          Float64 v154 = CMTimeGetSeconds(&time);
          [a2 movieTrimEndTime];
          CMTime time = v240;
          CMTimeSubtract(&v216, &time, &v215);
          Float64 v155 = CMTimeGetSeconds(&v216);
          LODWORD(value.value) = 136316162;
          *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movi"
                                                                    "eLevelMetadata:generateMetadataMovie:]";
          LOWORD(value.flags) = 2048;
          *(void *)((char *)&value.flags + 2) = v208;
          HIWORD(value.epoch) = 2048;
          Float64 v292 = v153;
          __int16 v293 = 2048;
          Float64 v294 = v154;
          __int16 v295 = 2048;
          Float64 v296 = v155;
          LODWORD(v172) = 52;
          v168 = &value;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMTime v214 = v240;
      objc_msgSend(a2, "setMovieTrimEndTime:", &v214, v168, v172);
    }
    if (dword_1E96B6808)
    {
      LODWORD(v239.value) = 0;
      LOBYTE(v289.value) = 0;
      v156 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v157 = v239.value;
      if (os_log_type_enabled(v156, v289.value)) {
        unsigned int v158 = v157;
      }
      else {
        unsigned int v158 = v157 & 0xFFFFFFFE;
      }
      if (v158)
      {
        [a2 movieEndTime];
        Float64 v159 = CMTimeGetSeconds(&v213);
        CMTime time = v240;
        Float64 v160 = CMTimeGetSeconds(&time);
        [a2 movieEndTime];
        CMTime time = v240;
        CMTimeSubtract(&v212, &time, &v211);
        Float64 v161 = CMTimeGetSeconds(&v212);
        *(double *)&uint64_t v162 = COERCE_DOUBLE([a2 description]);
        LODWORD(value.value) = 136316418;
        *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movieL"
                                                                  "evelMetadata:generateMetadataMovie:]";
        LOWORD(value.flags) = 2048;
        *(void *)((char *)&value.flags + 2) = v208;
        HIWORD(value.epoch) = 2048;
        Float64 v292 = v159;
        __int16 v293 = 2048;
        Float64 v294 = v160;
        __int16 v295 = 2048;
        Float64 v296 = v161;
        __int16 v297 = 2112;
        Float64 v298 = *(double *)&v162;
        LODWORD(v172) = 62;
        v168 = &value;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMTime v210 = v240;
    objc_msgSend(a2, "setMovieEndTime:", &v210, v168, v172);
    uint64_t SampleBuffer = 0;
    uint64_t v8 = v208;
    goto LABEL_345;
  }
  CFStringRef v197 = (const __CFString *)*MEMORY[0x1E4F1F308];
  CFStringRef v195 = (const __CFString *)*MEMORY[0x1E4F1F300];
  while (1)
  {
    id v244 = 0;
    uint64_t v81 = qtrmg_trackIDForNextTrackBelowWater((uint64_t)&v273, &v244);
    if (v81)
    {
      uint64_t SampleBuffer = v81;
      LODWORD(v165) = v81;
      FigDebugAssert3();
      objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", SampleBuffer, @"next track below water level", v165, *(void *)&v4);
LABEL_345:
      v73 = v189;
      goto LABEL_128;
    }
    id v82 = v244;
    uint64_t v83 = [v244 intValue];
    v84 = v202;
    if (![v202 objectForKeyedSubscript:v82])
    {
      uint64_t SampleBuffer = 0;
      goto LABEL_150;
    }
    uint64_t v85 = objc_msgSend((id)objc_msgSend(v202, "objectForKeyedSubscript:", v82), "intValue");
    char v243 = 0;
    uint64_t SampleBuffer = 0;
    if (!FigAssetWriterIsTrackQueueAboveHighWaterLevel((uint64_t)v281, v83)) {
      break;
    }
LABEL_148:
    v84 = v202;
    [v202 removeObjectsForKeys:v201];
    [v201 removeAllObjects];
    uint64_t v8 = v208;
LABEL_150:
    if (![v84 count]) {
      goto LABEL_239;
    }
  }
  while (1)
  {
    CMSampleBufferRef sbuf = 0;
    uint64_t SampleBuffer = FigAssetReaderExtractAndRetainNextSampleBuffer((uint64_t)v282, v85, (uint64_t)&v243, (uint64_t)&sbuf);
    if (SampleBuffer)
    {
      uint64_t v86 = 84;
      if (!v243) {
        uint64_t v86 = 70;
      }
      [*(id *)(v208 + 152) logErrorNumber:SampleBuffer, objc_msgSend(NSString, "stringWithFormat:", @"extract next sample for %d (complete %c)", v85, v86) errorString];
    }
    else if (value_low <= (int)v85 && CMSampleBufferGetNumSamples(sbuf) == 1)
    {
      CMTime time = v248;
      CMSampleBufferRef v87 = qtrmg_createTrimmedSampleBufferIfNeeded(sbuf, &time);
      if (v87)
      {
        v88 = v87;
        CFRelease(sbuf);
        CMSampleBufferRef sbuf = v88;
        memset(&time, 0, sizeof(time));
LABEL_161:
        CMSampleBufferGetPresentationTimeStamp(&time, v88);
        v89 = sbuf;
        goto LABEL_163;
      }
    }
    v88 = sbuf;
    memset(&time, 0, sizeof(time));
    if (sbuf) {
      goto LABEL_161;
    }
    v89 = 0;
    *(_OWORD *)&time.CMTime value = v205;
    time.CMTimeEpoch epoch = v78;
LABEL_163:
    CMTime value = time;
    memset(&v268, 0, sizeof(v268));
    if (v89)
    {
      CMSampleBufferGetDecodeTimeStamp(&v268, v89);
      memset(&v290, 0, sizeof(v290));
      if (sbuf)
      {
        CMSampleBufferGetDuration(&v290, sbuf);
        goto LABEL_168;
      }
    }
    else
    {
      *(_OWORD *)&v268.CMTime value = v205;
      v268.CMTimeEpoch epoch = v78;
    }
    *(_OWORD *)&v290.CMTime value = v205;
    v290.CMTimeEpoch epoch = v78;
LABEL_168:
    memset(&type, 0, sizeof(type));
    if (v290.flags)
    {
      CMTime v240 = time;
      CMTime v239 = v290;
      CMTimeAdd(&type, &v240, &v239);
    }
    else
    {
      CMTime type = time;
    }
    if ((v268.flags & 1) == 0) {
      CMTime v268 = time;
    }
    if (CMGetAttachment(sbuf, v197, 0))
    {
      BOOL v90 = 0;
    }
    else
    {
      CMTime v240 = time;
      CMTime v239 = v249;
      BOOL v90 = CMTimeCompare(&v240, &v239) >= 0;
    }
    uint64_t v91 = *(void *)(v208 + 64);
    if (v91 & 0x8000000000000000) == 0 && v91 == (int)v85 && (time.flags)
    {
      CMSampleBufferRef v238 = 0;
      memset(&v240, 0, sizeof(v240));
      [a2 audioOffset];
      CMTime v239 = time;
      CMTimeSubtract(&v240, &v239, &v237);
      memset(&v239, 0, sizeof(v239));
      if (v290.flags)
      {
        CMTime v289 = v240;
        CMTime v236 = v290;
        CMTimeAdd(&v239, &v289, &v236);
      }
      else
      {
        CMTime v239 = v240;
      }
      CMTime v289 = v239;
      CMTime v236 = v249;
      if (CMTimeCompare(&v289, &v236) < 0)
      {
        if (sbuf)
        {
          CFRelease(sbuf);
          CMSampleBufferRef sbuf = 0;
        }
        *(_OWORD *)&time.CMTime value = v205;
        time.CMTimeEpoch epoch = v78;
        *(_OWORD *)&v290.CMTime value = v205;
        v290.CMTimeEpoch epoch = v78;
        *(_OWORD *)&type.CMTime value = v205;
        type.CMTimeEpoch epoch = v78;
      }
      else if (sbuf)
      {
        CMTime v289 = v240;
        *(_OWORD *)&v236.CMTime value = v205;
        v236.CMTimeEpoch epoch = v78;
        uint64_t SampleBuffer = BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(sbuf, &v289, (long long *)&v236.value, &v238);
        CFRelease(sbuf);
        CMSampleBufferRef sbuf = v238;
        CMTime time = v240;
        CMTime type = v239;
        CMTime v289 = v240;
        CMTime v236 = v249;
        BOOL v90 = CMTimeCompare(&v289, &v236) > 0;
      }
    }
    BOOL v92 = CMGetAttachment(sbuf, v195, 0) != 0;
    if ((time.flags & 1) == 0) {
      goto LABEL_189;
    }
    if (*(void *)(v208 + 64) == (int)v85)
    {
      *(_OWORD *)&v240.CMTime value = *(_OWORD *)&time.value;
      CMTimeEpoch v93 = time.epoch;
LABEL_193:
      v240.CMTimeEpoch epoch = v93;
      CMTime v239 = v248;
      if (CMTimeCompare(&v240, &v239) > 0) {
        goto LABEL_194;
      }
      goto LABEL_189;
    }
    if (v191 == (int)v85)
    {
      if (v190)
      {
        if (CMSampleBufferGetNumSamples(sbuf) >= 1)
        {
          CMTime v240 = type;
          CMTime v239 = v248;
          if (CMTimeCompare(&v240, &v239) >= 1)
          {
            if (CMGetAttachment(sbuf, v197, 0)) {
              CMRemoveAttachment(sbuf, v197);
            }
            BOOL v92 = 1;
          }
        }
        goto LABEL_189;
      }
      *(_OWORD *)&v240.CMTime value = *(_OWORD *)&type.value;
      CMTimeEpoch v93 = type.epoch;
      goto LABEL_193;
    }
    if ((int)v83 >= SHIDWORD(v190))
    {
      CMTime v240 = time;
      CMTime v239 = v248;
      if ((CMTimeCompareApproximately(&v240, &v239) & 0x80000000) == 0)
      {
LABEL_194:
        if (sbuf)
        {
          CFRelease(sbuf);
          CMSampleBufferRef sbuf = 0;
        }
        char v243 = 1;
        *(_OWORD *)&time.CMTime value = v205;
        time.CMTimeEpoch epoch = v78;
LABEL_197:
        FigAssetWriterMarkEndOfDataForTrack((uint64_t)v281, v83);
        [v201 addObject:v244];
        goto LABEL_198;
      }
    }
    else
    {
      CMTime v240 = type;
      CMTime v239 = v248;
      if (CMTimeCompare(&v240, &v239) >= 1) {
        goto LABEL_194;
      }
    }
LABEL_189:
    if (v243) {
      goto LABEL_197;
    }
LABEL_198:
    if (!sbuf) {
      goto LABEL_218;
    }
    if (CMSampleBufferGetNumSamples(sbuf) < 1) {
      goto LABEL_217;
    }
    uint64_t v94 = FigAssetWriterAddSampleBuffer((uint64_t)v281, v83, (uint64_t)sbuf);
    if (v94) {
      break;
    }
    if ((time.flags & 0x1D) == 1)
    {
      if (v90)
      {
        CMTime v240 = time;
        CMTime v239 = v278;
        if (CMTimeCompare(&v240, &v239) < 0) {
          CMTime v278 = time;
        }
      }
      if ((type.flags & 0x1D) == 1)
      {
        CMTime v240 = type;
        CMTime v239 = v277;
        char v95 = CMTimeCompare(&v240, &v239) < 1 || v92;
        if ((v95 & 1) == 0) {
          CMTime v277 = type;
        }
      }
      if ((v290.flags & 1) == 0) {
        [*(id *)(v208 + 152) logErrorNumber:0, objc_msgSend(NSString, "stringWithFormat:", @"wrote sample with no duration to track %d", v83) errorString];
      }
      v96 = &v189[24
                * objc_msgSend((id)objc_msgSend(v200, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v83)), "integerValue")];
      v289.CMTime value = *(void *)v96;
      v289.timescale = *((_DWORD *)v96 + 2);
      CMTimeFlags v97 = *((_DWORD *)v96 + 3);
      if ((v97 & 1) == 0
        || (CMTimeEpoch v98 = *((void *)v96 + 2),
            v240.CMTime value = v289.value,
            v240.timescale = v289.timescale,
            v240.flags = v97,
            v240.CMTimeEpoch epoch = v98,
            CMTime v239 = value,
            CMTimeCompare(&v240, &v239) >= 1))
      {
        *(CMTime *)v96 = value;
      }
    }
    uint64_t SampleBuffer = 0;
LABEL_217:
    CFRelease(sbuf);
LABEL_218:
    if (SampleBuffer || v243) {
      goto LABEL_148;
    }
    if (FigAssetWriterIsTrackQueueAboveHighWaterLevel((uint64_t)v281, v83))
    {
      uint64_t SampleBuffer = 0;
      goto LABEL_148;
    }
  }
  uint64_t SampleBuffer = v94;
  CFDictionaryRef v106 = CMCopyDictionaryOfAttachments(allocator, sbuf, 1u);
  if (v106) {
    CFRelease(v106);
  }
  CFDictionaryRef v107 = CMCopyDictionaryOfAttachments(allocator, sbuf, 0);
  uint64_t v8 = v208;
  v73 = v189;
  if (v107) {
    CFRelease(v107);
  }
  v108 = *(void **)(v208 + 152);
  uint64_t v109 = objc_msgSend(NSString, "stringWithFormat:", @"add sample buffer to track %d", v83);
LABEL_266:
  v116 = (__CFString *)v109;
  v117 = v108;
LABEL_267:
  objc_msgSend(v117, "logErrorNumber:errorString:", SampleBuffer, v116, v165, *(void *)&v170);
LABEL_128:
  if (v282) {
    CFRelease(v282);
  }
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v74 = CMNotificationCenterRemoveListener();
  if (v74)
  {
    unsigned int v75 = v74;
    [*(id *)(v8 + 152) logErrorNumber:v74 errorString:@"remove queue level callbacks"];
    if (SampleBuffer) {
      uint64_t SampleBuffer = SampleBuffer;
    }
    else {
      uint64_t SampleBuffer = v75;
    }
  }
  if (v281) {
    CFRelease(v281);
  }
  if (cf) {
    CFRelease(cf);
  }

  FigSimpleMutexDestroy();
  FigConditionVariableDestroy();
  id v275 = 0;
  uint64_t v273 = 0;
  uint64_t v274 = 0;
  free(v73);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [a2 stillImageCaptureHostTime];
    CMTime time = v209;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  return SampleBuffer;
}

- (void)_getAdjustedRefMovieStartTime:(uint64_t)a3@<X8>
{
  if (a1)
  {
    *(_OWORD *)a3 = *(_OWORD *)&a2->value;
    *(void *)(a3 + 16) = a2->epoch;
    int v31 = 0;
    CFTypeRef v29 = 0;
    CFTypeRef v30 = 0;
    CFTypeRef v28 = 0;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(unsigned int (**)(uint64_t, void, uint64_t, CFTypeRef *, int *))(v7 + 64);
    if (!v8 || v8(v5, 0, 1986618469, &v30, &v31)) {
      goto LABEL_27;
    }
    CFTypeRef v9 = v30;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v11 = v10 ? v10 : 0;
    id v12 = *(unsigned int (**)(CFTypeRef, CFTypeRef *))(v11 + 32);
    if (!v12 || v12(v9, &v29)) {
      goto LABEL_27;
    }
    memset(&v27, 0, sizeof(v27));
    CMTimeMake(&rhs, 5, 1000);
    CMTime lhs = *a2;
    CMTimeAdd(&v27, &lhs, &rhs);
    CFTypeRef v13 = v29;
    CMTime time2 = v27;
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v15 = v14 ? v14 : 0;
    unsigned int v16 = *(unsigned int (**)(CFTypeRef, CMTime *, CFTypeRef *, void, void))(v15 + 8);
    if (!v16) {
      goto LABEL_27;
    }
    CMTime lhs = time2;
    if (v16(v13, &lhs, &v28, 0, 0)) {
      goto LABEL_27;
    }
    long long v23 = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v24 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CFTypeRef v17 = v28;
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v19 = v18 ? v18 : 0;
    Float64 v20 = *(unsigned int (**)(CFTypeRef, long long *))(v19 + 40);
    if (v20 && !v20(v17, &v23) && (BYTE12(v23) & 1) != 0)
    {
      long long v21 = v23;
      *(_OWORD *)a3 = v23;
      CMTimeEpoch v22 = v24;
      *(void *)(a3 + 16) = v24;
      *(_OWORD *)&lhs.CMTime value = v21;
      lhs.CMTimeEpoch epoch = v22;
      CMTime time2 = *a2;
      CMTimeCompare(&lhs, &time2);
    }
    else
    {
LABEL_27:
      FigDebugAssert3();
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v29) {
      CFRelease(v29);
    }
    if (v28) {
      CFRelease(v28);
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
}

- (void)_getAdjustedRefMovieEndTime:(uint64_t)a3@<X8>
{
  if (a1)
  {
    *(_OWORD *)a3 = *(_OWORD *)&a2->value;
    *(void *)(a3 + 16) = a2->epoch;
    int v34 = 0;
    CFTypeRef v32 = 0;
    CFTypeRef v33 = 0;
    CFTypeRef v31 = 0;
    CMTime v30 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CMTime v29 = v30;
    CMTime v28 = v30;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(unsigned int (**)(uint64_t, void, uint64_t, CFTypeRef *, int *))(v7 + 64);
    if (!v8 || v8(v5, 0, 1986618469, &v33, &v34)) {
      goto LABEL_28;
    }
    CFTypeRef v9 = v33;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v11 = v10 ? v10 : 0;
    id v12 = *(unsigned int (**)(CFTypeRef, CFTypeRef *))(v11 + 32);
    if (!v12 || v12(v9, &v32)) {
      goto LABEL_28;
    }
    CFTypeRef v13 = v32;
    CMTime rhs = *a2;
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v15 = v14 ? v14 : 0;
    unsigned int v16 = *(unsigned int (**)(CFTypeRef, CMTime *, CFTypeRef *, void, void))(v15 + 8);
    if (!v16) {
      goto LABEL_28;
    }
    CMTime lhs = rhs;
    if (v16(v13, &lhs, &v31, 0, 0)) {
      goto LABEL_28;
    }
    CFTypeRef v17 = v31;
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v19 = v18 ? v18 : 0;
    if ((Float64 v20 = *(unsigned int (**)(CFTypeRef, CMTime *))(v19 + 40)) != 0
      && !v20(v17, &v30)
      && (v30.flags & 1) != 0
      && ((v21 = v31, (uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0) ? (v23 = 0) : (v23 = v22),
          (CMTimeEpoch v24 = *(unsigned int (**)(CFTypeRef, CMTime *))(v23 + 56)) != 0
       && !v24(v21, &v28)
       && (v28.flags & 1) != 0))
    {
      CMTime lhs = v30;
      CMTime rhs = v28;
      CMTimeAdd(&v29, &lhs, &rhs);
      long long v25 = *(_OWORD *)&v29.value;
      *(_OWORD *)a3 = *(_OWORD *)&v29.value;
      CMTimeEpoch epoch = v29.epoch;
      *(void *)(a3 + 16) = v29.epoch;
      *(_OWORD *)&lhs.CMTime value = v25;
      lhs.CMTimeEpoch epoch = epoch;
      CMTime rhs = *a2;
      CMTimeCompare(&lhs, &rhs);
    }
    else
    {
LABEL_28:
      FigDebugAssert3();
    }
    if (v33) {
      CFRelease(v33);
    }
    if (v32) {
      CFRelease(v32);
    }
    if (v31) {
      CFRelease(v31);
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
}

+ (BOOL)_addNewMetadataTrackToAssetWriter:(uint64_t)a3 forTrackTimeScale:(unsigned int *)a4 yieldingTrackID:
{
  self;
  unsigned int v24 = 0;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFTypeRef v9 = *(uint64_t (**)(uint64_t, uint64_t, unsigned int *))(v8 + 8);
  if (!v9)
  {
    int v15 = -12782;
LABEL_21:
    FigDebugAssert3();
    return v15 == 0;
  }
  int v10 = v9(a2, 1835365473, &v24);
  if (v10)
  {
    int v15 = v10;
    goto LABEL_21;
  }
  uint64_t v11 = v24;
  uint64_t v12 = [NSNumber numberWithInt:a3];
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  unsigned int v16 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v14 + 64);
  if (!v16)
  {
    int v15 = -12782;
    goto LABEL_21;
  }
  int v17 = v16(a2, v11, *MEMORY[0x1E4F32E60], v12);
  if (v17)
  {
    int v15 = v17;
    goto LABEL_21;
  }
  uint64_t v18 = v24;
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  CFTypeRef v21 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v20 + 64);
  if (!v21)
  {
    int v15 = -12782;
    goto LABEL_21;
  }
  int v22 = v21(a2, v18, *MEMORY[0x1E4F32E20], *MEMORY[0x1E4F1CFC8]);
  if (v22)
  {
    int v15 = v22;
    goto LABEL_21;
  }
  int v15 = 0;
  if (a4) {
    *a4 = v24;
  }
  return v15 == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualMovieStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setActualMovieStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_actualMovieStartTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_actualMovieStartTime.CMTime value = v3;
}

- (BOOL)vitalInputStreamHasBeenForcedOff
{
  return self->_vitalInputStreamHasBeenForcedOff;
}

- (void)setVitalInputStreamHasBeenForcedOff:(BOOL)a3
{
  self->_vitalInputStreamHasBeenForcedOff = a3;
}

- (int)streamForcedOffErrorCode
{
  return self->_streamForcedOffErrorCode;
}

- (void)setStreamForcedOffErrorCode:(int)a3
{
  self->_streamForcedOffErrorCode = a3;
}

@end