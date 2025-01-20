@interface BWInferenceResultRingBuffers
- (BWInferenceResultRingBuffers)init;
- (id)retrieveInferencesForType:(int)a3 beginning:(id *)a4 until:(id *)a5;
- (void)bufferingStatsForType:(int)a3 firstOut:(id *)a4 lastOut:(id *)a5 countOut:(int *)a6;
- (void)dealloc;
- (void)insertInferenceResultsFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setupRingBuffer:(int)a3 inferencesOfType:(int)a4;
@end

@implementation BWInferenceResultRingBuffers

- (BWInferenceResultRingBuffers)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWInferenceResultRingBuffers;
  v2 = [(BWInferenceResultRingBuffers *)&v4 init];
  if (v2)
  {
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v2->_rings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)setupRingBuffer:(int)a3 inferencesOfType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  if (v5)
  {
    v7 = [[BWObjectRingBuffer alloc] initWithCapacity:v5];
    [(BWObjectRingBuffer *)v7 setExpectAscending:1];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rings, "setObject:forKeyedSubscript:", v7, [NSNumber numberWithInt:v4]);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_rings, "removeObjectForKey:", [NSNumber numberWithInt:v4]);
  }
  lock = self->_lock;
  pthread_mutex_unlock((pthread_mutex_t *)lock);
}

- (void)dealloc
{
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceResultRingBuffers;
  [(BWInferenceResultRingBuffers *)&v3 dealloc];
}

- (id)retrieveInferencesForType:(int)a3 beginning:(id *)a4 until:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  CMTime time1 = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)a5;
  if (CMTimeCompare(&time1, &time2) < 0
    && (v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rings, "objectForKeyedSubscript:", [NSNumber numberWithInt:v7])) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", (int)objc_msgSend(v9, "count"));
    if ((int)[v10 count] <= 0)
    {
      FigDebugAssert3();
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __74__BWInferenceResultRingBuffers_retrieveInferencesForType_beginning_until___block_invoke;
      v13[3] = &unk_1E5C29910;
      long long v14 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      v13[4] = v11;
      CMTime time1 = (CMTime)*a4;
      [v10 enumerateObjectsStartingAt:&time1 usingBlock:v13];
    }
  }
  else
  {
    FigDebugAssert3();
    v11 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v11;
}

uint64_t __74__BWInferenceResultRingBuffers_retrieveInferencesForType_beginning_until___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, unsigned char *a5)
{
  CMTime time1 = *a3;
  CMTime v9 = *(CMTime *)(a1 + 40);
  uint64_t result = CMTimeCompare(&time1, &v9);
  if ((result & 0x80000000) != 0) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  *a5 = 1;
  return result;
}

- (void)bufferingStatsForType:(int)a3 firstOut:(id *)a4 lastOut:(id *)a5 countOut:(int *)a6
{
  uint64_t v9 = *(void *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rings, "objectForKeyedSubscript:", [NSNumber numberWithInt:v9]);
  v12 = v11;
  if (a4)
  {
    if (!v11)
    {
      uint64_t v14 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&a4->var0 = *MEMORY[0x1E4F1F9F8];
      a4->int64_t var3 = *(void *)(v14 + 16);
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    [v11 firstTime];
    *(_OWORD *)&a4->var0 = v16;
    a4->int64_t var3 = v17;
  }
  if (!a5) {
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_8:
    uint64_t v15 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&a5->var0 = *MEMORY[0x1E4F1F9F8];
    int64_t v13 = *(void *)(v15 + 16);
    goto LABEL_9;
  }
  [v12 lastTime];
  *(_OWORD *)&a5->var0 = v16;
  int64_t v13 = v17;
LABEL_9:
  a5->int64_t var3 = v13;
LABEL_10:
  if (a6) {
    *a6 = [v12 count];
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)insertInferenceResultsFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  rings = self->_rings;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__BWInferenceResultRingBuffers_insertInferenceResultsFromSampleBuffer___block_invoke;
  v6[3] = &__block_descriptor_40_e45_v32__0__NSNumber_8__BWObjectRingBuffer_16_B24l;
  v6[4] = a3;
  [(NSMutableDictionary *)rings enumerateKeysAndObjectsUsingBlock:v6];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

uint64_t __71__BWInferenceResultRingBuffers_insertInferenceResultsFromSampleBuffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = BWInferenceGetAttachedInferenceResult(*(const void **)(a1 + 32), [a2 longValue]);
  if (result)
  {
    uint64_t v5 = (void *)result;
    if ((int)[a3 count] >= 1)
    {
      if (a3) {
        [a3 lastTime];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      [v5 timestamp];
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
        [a3 clear];
      }
    }
    [v5 timestamp];
    return [a3 appendObject:v5 forTime:v6];
  }
  return result;
}

@end