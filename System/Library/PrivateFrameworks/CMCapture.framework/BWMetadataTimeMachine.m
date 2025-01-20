@interface BWMetadataTimeMachine
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS;
- (BOOL)waitUntilCapacity:(int)a3 timeout:(float)a4;
- (BWMetadataTimeMachine)initWithName:(id)a3 capacity:(int)a4 metadataHandlingPriority:(unsigned int)a5 addHandler:(id)a6;
- (NSString)name;
- (id)metadata;
- (id)metadataForPTSRange:(id *)a3 timeout:(float)a4;
- (void)_metadataForPTSRange:(uint64_t)a1;
- (void)addDroppedFrameForPortType:(id)a3 pts:(id *)a4;
- (void)addMetadata:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setEarliestAllowedPTS:(id *)a3;
@end

@implementation BWMetadataTimeMachine

- (void)setEarliestAllowedPTS:(id *)a3
{
  if (a3->var2)
  {
    metadataHandlingQueue = self->_metadataHandlingQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke;
    v4[3] = &unk_1E5C24C18;
    v4[4] = self;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
    dispatch_sync(metadataHandlingQueue, v4);
  }
}

- (BWMetadataTimeMachine)initWithName:(id)a3 capacity:(int)a4 metadataHandlingPriority:(unsigned int)a5 addHandler:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BWMetadataTimeMachine;
  v9 = [(BWMetadataTimeMachine *)&v12 init];
  if (v9)
  {
    *((void *)v9 + 1) = [a3 copy];
    *((_DWORD *)v9 + 4) = a4;
    *((void *)v9 + 3) = [a6 copy];
    *((void *)v9 + 4) = FigDispatchQueueCreateWithPriority();
    *((void *)v9 + 5) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    *((void *)v9 + 6) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v9 + 56) = *MEMORY[0x1E4F1F9F8];
    *((void *)v9 + 9) = *(void *)(v10 + 16);
  }
  return (BWMetadataTimeMachine *)v9;
}

uint64_t __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  *(void *)(v2 + 72) = *(void *)(a1 + 56);
  *(_OWORD *)(v2 + 56) = v3;
  memset(&v10, 0, sizeof(v10));
  CMTime start = *(CMTime *)(a1 + 40);
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v10, &start, &duration);
  v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke_2;
  v6[3] = &__block_descriptor_80_e29_B32__0__NSDictionary_8Q16_B24l;
  CMTimeRange v7 = v10;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectsAtIndexes:", objc_msgSend(v4, "indexesOfObjectsPassingTest:", v6));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  [(BWMetadataTimeMachine *)self reset];

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataTimeMachine;
  [(BWMetadataTimeMachine *)&v3 dealloc];
}

- (void)addMetadata:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 copy];
    metadataHandlingQueue = self->_metadataHandlingQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__BWMetadataTimeMachine_addMetadata___block_invoke;
    v6[3] = &unk_1E5C24458;
    void v6[4] = self;
    v6[5] = v4;
    dispatch_async(metadataHandlingQueue, v6);
  }
}

void __37__BWMetadataTimeMachine_addMetadata___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3) {
    int v4 = (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), *(void *)(v2 + 40));
  }
  else {
    int v4 = 0;
  }
  memset(&v51, 0, sizeof(v51));
  uint64_t v5 = *MEMORY[0x1E4F530C0];
  CMTimeMakeFromDictionary(&v51, (CFDictionaryRef)[*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  memset(&v50, 0, sizeof(v50));
  CMTimeMakeFromDictionary(&v50, (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "lastObject"), "objectForKeyedSubscript:", v5));
  if (v50.flags)
  {
    CMTime time1 = v51;
    CMTime time2 = v50;
    BOOL v6 = CMTimeCompare(&time1, &time2) > 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 68))
  {
    CMTime time1 = v51;
    CMTime time2 = *(CMTime *)(v7 + 56);
    BOOL v8 = CMTimeCompare(&time1, &time2) >= 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  int v9 = (v4 == 3 || !v4) && v6 && v8;
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v11 = *(void *)(a1 + 32);
  if ((v4 & 0xFFFFFFFE) == 2)
  {
    ++*(_DWORD *)(v11 + 80);
    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    if (!v9)
    {
LABEL_45:
      if (v10 && dword_1E96B6A68)
      {
        int v42 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_48;
    }
  }
  else
  {
    *(_DWORD *)(v11 + 80) = 0;
    if (!v9) {
      goto LABEL_45;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 40) count];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v12 > *(int *)(v13 + 16)) {
    [*(id *)(v13 + 40) removeObjectAtIndex:0];
  }
  if (v10)
  {
    uint64_t v38 = v10;
    v40 = (void *)[MEMORY[0x1E4F28E60] indexSet];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v14 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (!v15) {
      goto LABEL_44;
    }
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    v18 = BWDataBufferPool;
    v19 = &OBJC_IVAR___FigCaptureCMSession__cmsession;
    uint64_t v20 = *(void *)v47;
    v21 = BWDataBufferPool;
    while (1)
    {
      uint64_t v22 = 0;
      uint64_t v39 = v16;
      do
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v14);
        }
        v23 = *(_DWORD **)(*((void *)&v46 + 1) + 8 * v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v23)
          {
            v24 = (long long *)((char *)v23 + v19[411]);
            long long v25 = v24[1];
            long long v43 = *v24;
            long long v44 = v25;
            long long v45 = v24[2];
          }
          else
          {
            long long v44 = 0u;
            long long v45 = 0u;
            long long v43 = 0u;
          }
          v26 = -[BWMetadataTimeMachine _metadataForPTSRange:](*(void *)(a1 + 32), (uint64_t)&v43);
          if (v26)
          {
            -[BWMetadataTimeMachineMetadataRequest completeWithMetadata:](v23, v26);
LABEL_38:
            [v40 addIndex:v17 + v22];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = v20;
            uint64_t v28 = v17;
            v29 = v18;
            v30 = v14;
            v31 = v21;
            v32 = v19;
            int v33 = v23 ? v23[4] : 0;
            BOOL v34 = [*(id *)(*(void *)(a1 + 32) + 40) count] >= (unint64_t)v33;
            v19 = v32;
            v21 = v31;
            v14 = v30;
            v18 = v29;
            uint64_t v17 = v28;
            uint64_t v20 = v27;
            uint64_t v16 = v39;
            if (v34)
            {
              int v35 = [*(id *)(*(void *)(a1 + 32) + 40) count];
              if (v23)
              {
                v23[5] = v35;
                time1.value = (CMTimeValue)v23;
                *(void *)&time1.timescale = BWMetadataTimeMachineWaitRequest;
                [(CMTime *)(objc_super *)&time1 complete];
              }
              goto LABEL_38;
            }
          }
        }
        ++v22;
      }
      while (v16 != v22);
      uint64_t v36 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
      uint64_t v16 = v36;
      v17 += v22;
      if (!v36)
      {
LABEL_44:
        [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsAtIndexes:v40];
        uint64_t v10 = v38;
        goto LABEL_45;
      }
    }
  }
LABEL_48:
}

- (void)_metadataForPTSRange:(uint64_t)a1
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
  }
  if ((*(unsigned char *)(a2 + 12) & 1) == 0
    || (*(unsigned char *)(a2 + 36) & 1) == 0
    || *(void *)(a2 + 40)
    || (*(void *)(a2 + 24) & 0x8000000000000000) != 0)
  {
    return 0;
  }
  memset(&v45, 0, sizeof(v45));
  CMTimeMake(&v45, 1, 1000);
  uint64_t v5 = MEMORY[0x1E4F1FA20];
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  if ([*(id *)(a1 + 40) count])
  {
    memset(&start, 0, 24);
    BOOL v6 = (void *)[*(id *)(a1 + 40) firstObject];
    uint64_t v7 = *MEMORY[0x1E4F530C0];
    CMTimeMakeFromDictionary(&start.start, (CFDictionaryRef)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
    memset(&duration, 0, sizeof(duration));
    CMTimeMakeFromDictionary(&duration, (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastObject"), "objectForKeyedSubscript:", v7));
    *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&start.start.value;
    time1.start.CMTimeEpoch epoch = start.start.epoch;
    CMTime time2 = duration;
    if (CMTimeCompare(&time1.start, &time2) > 0)
    {
      FigDebugAssert3();
      return 0;
    }
    CMTime time2 = start.start;
    CMTime end = duration;
    CMTimeRangeFromTimeToTime(&time1, &time2, &end);
  }
  else
  {
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      CMTimeFlags flags = *(_DWORD *)(v5 + 12);
      CMTimeEpoch epoch = *(void *)(v5 + 16);
      CMTimeValue v10 = *(void *)(v5 + 24);
      uint64_t v11 = *(void *)(v5 + 32);
      CMTimeEpoch v12 = *(void *)(v5 + 40);
      goto LABEL_15;
    }
    *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)(a1 + 56);
    start.start.CMTimeEpoch epoch = *(void *)(a1 + 72);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&time1, &start.start, &duration);
  }
  CMTimeValue value = time1.start.value;
  CMTimeFlags flags = time1.start.flags;
  CMTimeScale timescale = time1.start.timescale;
  CMTimeEpoch epoch = time1.start.epoch;
  CMTimeValue v10 = time1.duration.value;
  CMTimeEpoch v12 = time1.duration.epoch;
  uint64_t v11 = *(void *)&time1.duration.timescale;
LABEL_15:
  if ((flags & 1) == 0) {
    return 0;
  }
  uint64_t v13 = 0;
  if ((v11 & 0x100000000) != 0 && !v12)
  {
    uint64_t v31 = v11;
    if ((v10 & 0x8000000000000000) == 0)
    {
      start.start.CMTimeValue value = value;
      start.start.CMTimeScale timescale = timescale;
      start.start.CMTimeFlags flags = flags;
      start.start.CMTimeEpoch epoch = epoch;
      CMTime duration = v45;
      CMTimeSubtract(&time1.start, &start.start, &duration);
      CMTimeValue value = time1.start.value;
      CMTimeFlags v15 = time1.start.flags;
      CMTimeScale timescale = time1.start.timescale;
      CMTimeEpoch v16 = time1.start.epoch;
      time1.CMTimeRange start = v45;
      CMTimeMultiply(&rhs, &time1.start, 2);
      start.start.CMTimeValue value = v10;
      *(void *)&start.start.CMTimeScale timescale = v31;
      start.start.CMTimeEpoch epoch = 0;
      CMTimeAdd(&time1.start, &start.start, &rhs);
      CMTimeValue v17 = time1.start.value;
      CMTimeEpoch v18 = time1.start.epoch;
      uint64_t v19 = *(void *)&time1.start.timescale;
      long long v20 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a2;
      *(_OWORD *)&time1.start.CMTimeEpoch epoch = v20;
      *(_OWORD *)&time1.duration.CMTimeScale timescale = *(_OWORD *)(a2 + 32);
      CMTimeRangeGetEnd(&v39, &time1);
      time1.start.CMTimeValue value = value;
      time1.start.CMTimeScale timescale = timescale;
      time1.start.CMTimeFlags flags = v15;
      time1.start.CMTimeEpoch epoch = v16;
      time1.duration.CMTimeValue value = v17;
      *(void *)&time1.duration.CMTimeScale timescale = v19;
      time1.duration.CMTimeEpoch epoch = v18;
      CMTimeRangeGetEnd(&v38, &time1);
      uint64_t v13 = 0;
      if (CMTimeCompare(&v39, &v38) <= 0)
      {
        uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v21 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a2;
        *(_OWORD *)&time1.start.CMTimeEpoch epoch = v21;
        *(_OWORD *)&time1.duration.CMTimeScale timescale = *(_OWORD *)(a2 + 32);
        *(_OWORD *)&start.start.CMTimeValue value = *(_OWORD *)&time1.start.value;
        start.start.CMTimeEpoch epoch = *(void *)(a2 + 16);
        CMTime duration = v45;
        CMTimeSubtract(&time1.start, &start.start, &duration);
        start.CMTimeRange start = v45;
        CMTimeMultiply(&v37, &start.start, 2);
        CMTime duration = time1.duration;
        CMTimeAdd(&start.start, &duration, &v37);
        time1.CMTime duration = start.start;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v22 = *(void **)(a1 + 40);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v46 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          uint64_t v26 = *MEMORY[0x1E4F530C0];
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              memset(&duration, 0, sizeof(duration));
              CMTimeMakeFromDictionary(&duration, (CFDictionaryRef)objc_msgSend(v28, "objectForKeyedSubscript:", v26, v29, v30));
              CMTimeRange start = time1;
              CMTime time2 = duration;
              if (CMTimeRangeContainsTime(&start, &time2)) {
                [v13 addObject:v28];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v46 count:16];
          }
          while (v24);
        }
      }
    }
  }
  return v13;
}

- (void)addDroppedFrameForPortType:(id)a3 pts:(id *)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a4->var2)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v9 = *(CMTime *)a4;
    CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v9, v6);
    uint64_t v8 = *MEMORY[0x1E4F530C0];
    v10[0] = *MEMORY[0x1E4F54128];
    v10[1] = v8;
    v11[0] = a3;
    v11[1] = v7;
    v10[2] = @"IsDroppedFrameMetadataKey";
    v11[2] = MEMORY[0x1E4F1CC38];
    -[BWMetadataTimeMachine addMetadata:](self, "addMetadata:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
  }
}

- (id)metadataForPTSRange:(id *)a3 timeout:(float)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (dword_1E96B6A68)
  {
    LODWORD(v24) = 0;
    type[0] = 0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3052000000;
  long long v34 = __Block_byref_object_copy__3;
  long long v35 = __Block_byref_object_dispose__3;
  uint64_t v36 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  uint64_t v29 = 0;
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    metadataHandlingQueue = self->_metadataHandlingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v9 = *(_OWORD *)&a3->var0.var3;
    long long v21 = *(_OWORD *)&a3->var0.var0;
    block[2] = __53__BWMetadataTimeMachine_metadataForPTSRange_timeout___block_invoke;
    block[3] = &unk_1E5C24D40;
    block[4] = self;
    block[5] = &v24;
    long long v22 = v9;
    long long v23 = *(_OWORD *)&a3->var1.var1;
    block[6] = &v31;
    dispatch_sync(metadataHandlingQueue, block);
    uint64_t v11 = (void *)v32[5];
    if (v11)
    {
      *(float *)&double v10 = a4;
      [v11 waitForCompletionWithTimeout:v10];
      CMTimeEpoch v12 = (void *)v32[5];
      if (v12) {
        CMTimeEpoch v12 = (void *)v12[8];
      }
      uint64_t v13 = v12;
      v25[5] = (uint64_t)v13;
    }
  }
  if (dword_1E96B6A68)
  {
    int v19 = 0;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v15 = (id)v25[5];
  if (v15) {
    CMTimeEpoch v16 = v15;
  }
  else {
    CMTimeEpoch v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v31, 8);
  return v16;
}

void *__53__BWMetadataTimeMachine_metadataForPTSRange_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 56);
  long long v9 = v3;
  long long v10 = *(_OWORD *)(a1 + 88);
  result = -[BWMetadataTimeMachine _metadataForPTSRange:](v2, (uint64_t)&v8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [BWMetadataTimeMachineMetadataRequest alloc];
    long long v6 = *(_OWORD *)(a1 + 72);
    long long v8 = *(_OWORD *)(a1 + 56);
    long long v9 = v6;
    long long v10 = *(_OWORD *)(a1 + 88);
    if (v5)
    {
      v11.receiver = v5;
      v11.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
      uint64_t v5 = (BWMetadataTimeMachineMetadataRequest *)objc_msgSendSuper2(&v11, sel_init);
      if (v5)
      {
        long long v7 = v9;
        *(_OWORD *)&v5->_ptsRange.start.CMTimeValue value = v8;
        *(_OWORD *)&v5->_ptsRange.start.CMTimeEpoch epoch = v7;
        *(_OWORD *)&v5->_ptsRange.duration.CMTimeScale timescale = v10;
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v5;
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "addObject:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8, v9, v10);
  }
  return result;
}

- (id)metadata
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__3;
  long long v10 = __Block_byref_object_dispose__3;
  uint64_t v11 = 0;
  metadataHandlingQueue = self->_metadataHandlingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BWMetadataTimeMachine_metadata__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(metadataHandlingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__BWMetadataTimeMachine_metadata__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)waitUntilCapacity:(int)a3 timeout:(float)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (dword_1E96B6A68)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  if (self->_capacity >= a3)
  {
    metadataHandlingQueue = self->_metadataHandlingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__BWMetadataTimeMachine_waitUntilCapacity_timeout___block_invoke;
    block[3] = &unk_1E5C24D68;
    block[4] = self;
    block[5] = &v20;
    int v17 = a3;
    block[6] = &v24;
    dispatch_sync(metadataHandlingQueue, block);
    uint64_t v11 = (void *)v25[5];
    if (v11)
    {
      *(float *)&double v10 = a4;
      [v11 waitForCompletionWithTimeout:v10];
      CMTimeEpoch v12 = v25;
      uint64_t v13 = v25[5];
      if (v13) {
        LODWORD(v13) = *(_DWORD *)(v13 + 20);
      }
      *((_DWORD *)v21 + 6) = v13;
    }
  }
  if (*v8 == 1) {
    kdebug_trace();
  }
  BOOL v14 = *((_DWORD *)v21 + 6) >= a3;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __51__BWMetadataTimeMachine_waitUntilCapacity_timeout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < *(_DWORD *)(a1 + 56))
  {
    id v3 = [BWMetadataTimeMachineWaitRequest alloc];
    if (v3)
    {
      int v4 = *(_DWORD *)(a1 + 56);
      v5.receiver = v3;
      v5.super_class = (Class)BWMetadataTimeMachineWaitRequest;
      id v3 = (BWMetadataTimeMachineWaitRequest *)objc_msgSendSuper2(&v5, sel_init);
      if (v3) {
        v3->_capacity = v4;
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
    return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  return result;
}

- (void)reset
{
  if (!_FigIsNotCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  metadataHandlingQueue = self->_metadataHandlingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BWMetadataTimeMachine_reset__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(metadataHandlingQueue, block);
}

uint64_t __30__BWMetadataTimeMachine_reset__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    objc_super v5 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        long long v7 = *(_DWORD **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[BWMetadataTimeMachineMetadataRequest completeWithMetadata:](v7, v5);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v7)
          {
            v7[5] = 0;
            v14.receiver = v7;
            v14.super_class = (Class)BWMetadataTimeMachineWaitRequest;
            objc_msgSendSuper2(&v14, sel_complete);
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v3);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
}

BOOL __47__BWMetadataTimeMachine_setEarliestAllowedPTS___block_invoke_2(_OWORD *a1, void *a2)
{
  CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  long long v3 = a1[3];
  *(_OWORD *)&v5.start.CMTimeValue value = a1[2];
  *(_OWORD *)&v5.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&v5.duration.CMTimeScale timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3810000000;
  long long v10 = "";
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  metadataHandlingQueue = self->_metadataHandlingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BWMetadataTimeMachine_earliestAllowedPTS__block_invoke;
  block[3] = &unk_1E5C246B8;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(metadataHandlingQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __43__BWMetadataTimeMachine_earliestAllowedPTS__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(v1 + 56);
  v2[3].n128_u64[0] = *(void *)(v1 + 72);
  v2[2] = result;
  return result;
}

- (NSString)name
{
  return self->_name;
}

@end