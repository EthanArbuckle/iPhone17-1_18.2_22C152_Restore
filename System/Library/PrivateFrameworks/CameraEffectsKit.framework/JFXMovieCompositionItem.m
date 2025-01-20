@interface JFXMovieCompositionItem
- ($70930193D4F448A53BB9343C0237EB5F)applySpeed:(SEL)a3;
- (AVAsset)asset;
- (AVAsset)audioAssetOverwrite;
- (BOOL)hasVideoContent;
- (BOOL)needAudioLoop;
- (JFXMovieCompositionItem)initWithClip:(id)a3 timeScale:(int)a4;
- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3;
- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3;
- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4;
- (id)segmentWithCharacteristic:(id)a3 sourceRange:(id *)a4 destinationRange:(id *)a5;
- (id)speedRangesForSourceRange:(id *)a3 destinationRange:(id *)a4;
- (id)videoTrackSegmentsWithDestinationRange:(id *)a3;
- (int)audioAssetOverwriteStartOffset;
- (void)setAsset:(id)a3;
- (void)setAudioAssetOverwrite:(id)a3;
- (void)setAudioAssetOverwriteStartOffset:(int)a3;
@end

@implementation JFXMovieCompositionItem

- (JFXMovieCompositionItem)initWithClip:(id)a3 timeScale:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)JFXMovieCompositionItem;
  v7 = [(JFXCompositionItem *)&v16 initWithClip:v6 timeScale:v4];
  if (v7 && [v6 mediaType] == 1)
  {
    v8 = [v6 mediaItem];
    if ([v6 isAssetUnavailable])
    {
      id v9 = objc_alloc(MEMORY[0x263EFA8D0]);
      v10 = NSURL;
      v11 = [MEMORY[0x263F086E0] jfxBundle];
      v12 = [v11 pathForResource:@"blhack" ofType:@"mov"];
      v13 = [v10 fileURLWithPath:v12];
      v14 = (void *)[v9 initWithURL:v13 options:0];
      [(JFXMovieCompositionItem *)v7 setAsset:v14];
    }
    else
    {
      v11 = [v8 avAsset];
      [(JFXMovieCompositionItem *)v7 setAsset:v11];
    }
  }
  return v7;
}

- (BOOL)hasVideoContent
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(JFXMovieCompositionItem *)self asset];
  uint64_t v5 = *MEMORY[0x263EF9CE0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__JFXMovieCompositionItem_hasVideoContent__block_invoke;
  v8[3] = &unk_264C0AD08;
  v10 = &v11;
  id v6 = v3;
  id v9 = v6;
  [v4 loadTracksWithMediaCharacteristic:v5 completionHandler:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

intptr_t __42__JFXMovieCompositionItem_hasVideoContent__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (BOOL)needAudioLoop
{
  v2 = [(JFXMovieCompositionItem *)self audioAssetOverwrite];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)segmentWithCharacteristic:(id)a3 sourceRange:(id *)a4 destinationRange:(id *)a5
{
  id v8 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__26;
  v34 = __Block_byref_object_dispose__26;
  id v35 = 0;
  id v9 = [(JFXMovieCompositionItem *)self asset];
  uint64_t v10 = [(JFXMovieCompositionItem *)self audioAssetOverwrite];
  uint64_t v11 = (void *)v10;
  if (v8 && v10)
  {
    int v12 = [v8 isEqualToString:*MEMORY[0x263EF9C80]];

    if (!v12) {
      goto LABEL_6;
    }
    [(JFXMovieCompositionItem *)self audioAssetOverwrite];
    id v9 = v11 = v9;
  }

LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    long long v14 = *(_OWORD *)&a4->var0.var3;
    long long v24 = *(_OWORD *)&a4->var0.var0;
    long long v25 = v14;
    v19[2] = __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke;
    v19[3] = &unk_264C0D4C8;
    long long v26 = *(_OWORD *)&a4->var1.var1;
    v19[4] = self;
    v23 = &v30;
    id v20 = v9;
    long long v15 = *(_OWORD *)&a5->var0.var3;
    long long v27 = *(_OWORD *)&a5->var0.var0;
    long long v28 = v15;
    long long v29 = *(_OWORD *)&a5->var1.var1;
    id v21 = v8;
    objc_super v16 = v13;
    v22 = v16;
    [v20 loadTracksWithMediaCharacteristic:v21 completionHandler:v19];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    id v17 = (id)v31[5];
  }
  else
  {
    objc_super v16 = JFXLog_playback();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[JFXMovieCompositionItem segmentWithCharacteristic:sourceRange:destinationRange:]((uint64_t)v9, v16);
    }
    id v17 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    long long v5 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)id v17 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v17[16] = v5;
    long long v18 = *(_OWORD *)(a1 + 104);
    CMTimeMake(&time2, 0, [*(id *)(a1 + 32) timeScale]);
    *(_OWORD *)time1 = *(_OWORD *)(a1 + 72);
    *(void *)&time1[16] = *(void *)(a1 + 88);
    CMTimeMaximum((CMTime *)v17, (CMTime *)time1, &time2);
    id v6 = (void *)MEMORY[0x263EFA6D0];
    v7 = [*(id *)(a1 + 40) URL];
    uint64_t v8 = [v4 trackID];
    *(_OWORD *)time1 = *(_OWORD *)v17;
    *(_OWORD *)&time1[16] = *(_OWORD *)&v17[16];
    long long v15 = v18;
    long long v9 = *(_OWORD *)(a1 + 136);
    v13[0] = *(_OWORD *)(a1 + 120);
    v13[1] = v9;
    v13[2] = *(_OWORD *)(a1 + 152);
    uint64_t v10 = [v6 compositionTrackSegmentWithURL:v7 trackID:v8 sourceTimeRange:time1 targetTimeRange:v13];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v4 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke_cold_1(a1, v4);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- ($70930193D4F448A53BB9343C0237EB5F)applySpeed:(SEL)a3
{
  long long v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  result = ($70930193D4F448A53BB9343C0237EB5F *)[(JFXCompositionItem *)self speed];
  if (v8 != 1.0)
  {
    if (retstr->var0.var0)
    {
      [(JFXCompositionItem *)self speed];
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = retstr->var0;
      CMTimeMultiplyByFloat64(&v12, (CMTime *)&var0, v9 + 0.0001);
    }
    else
    {
      CMTimeMake(&v12, 1, 1000);
    }
    retstr->$3CC8671D27C23BF42ADDB32F2B5E48AE var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v12;
    [(JFXCompositionItem *)self speed];
    $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = retstr->var1;
    result = ($70930193D4F448A53BB9343C0237EB5F *)CMTimeMultiplyByFloat64(&v12, (CMTime *)&var0, v10 + 0.0001);
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v12;
  }
  return result;
}

- (id)speedRangesForSourceRange:(id *)a3 destinationRange:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263F08D40];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&source.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&source.start.epoch = v5;
  *(_OWORD *)&source.duration.timescale = *(_OWORD *)&a3->var1.var1;
  long long v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v10.start.epoch = v6;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeMappingMake(&v12, &source, &v10);
  v7 = [v4 valueWithCMTimeMapping:&v12];
  v13[0] = v7;
  float v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

  return v8;
}

- (id)videoTrackSegmentsWithDestinationRange:(id *)a3
{
  uint64_t v4 = self;
  uint64_t v50 = *MEMORY[0x263EF8340];
  memset(&v46, 0, sizeof(v46));
  [(JFXCompositionItem *)self sourceTimeRange];
  id v30 = [MEMORY[0x263EFF980] array];
  if ([(JFXCompositionItem *)v4 isFreezeFrame])
  {
    v46.duration.timescale *= 1000;
    long long v5 = (void *)MEMORY[0x263F08D40];
    CMTimeRange source = v46;
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&target.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&target.start.epoch = v6;
    *(_OWORD *)&target.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeMappingMake(&v45, &source, &target);
    v7 = [v5 valueWithCMTimeMapping:&v45];
    v48 = v7;
    float v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  }
  else
  {
    CMTimeRange source = v46;
    long long v9 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&target.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&target.start.epoch = v9;
    *(_OWORD *)&target.duration.timescale = *(_OWORD *)&a3->var1.var1;
    float v8 = [(JFXMovieCompositionItem *)v4 speedRangesForSourceRange:&source destinationRange:&target];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    p_timescale = &source.start.timescale;
    uint64_t v31 = *MEMORY[0x263EF9CE0];
    do
    {
      uint64_t v14 = 0;
      uint64_t v28 = v11;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        long long v40 = 0u;
        memset(v39, 0, sizeof(v39));
        memset(&source, 0, sizeof(source));
        if (v15)
        {
          [v15 CMTimeMappingValue];
          CMTimeValue value = source.start.value;
          CMTimeValue v17 = source.duration.value;
          CMTimeValue v18 = *(void *)&v39[0];
          uint64_t v19 = *((void *)&v39[1] + 1);
        }
        else
        {
          uint64_t v19 = 0;
          CMTimeValue v18 = 0;
          CMTimeValue v17 = 0;
          CMTimeValue value = 0;
        }
        *(_OWORD *)&target.start.timescale = *(_OWORD *)p_timescale;
        *(_OWORD *)&target.duration.timescale = *(_OWORD *)&source.duration.timescale;
        long long v35 = *(_OWORD *)((char *)v39 + 8);
        long long v37 = v40;
        target.start.CMTimeValue value = value;
        target.duration.CMTimeValue value = v17;
        CMTimeValue v34 = v18;
        uint64_t v36 = v19;
        id v20 = [(JFXMovieCompositionItem *)v4 segmentWithCharacteristic:v31 sourceRange:&target destinationRange:&v34];
        if (v20)
        {
          [v30 addObject:v20];
        }
        else
        {
          id v21 = p_timescale;
          uint64_t v22 = v12;
          v23 = v4;
          long long v24 = JFXLog_DebugComposition();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            [(JFXMovieCompositionItem *)&buf videoTrackSegmentsWithDestinationRange:v24];
          }

          long long v25 = JFXLog_DebugComposition();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(target.start.value) = 134218240;
            *(CMTimeValue *)((char *)&target.start.value + 4) = value;
            LOWORD(target.start.flags) = 2048;
            *(void *)((char *)&target.start.flags + 2) = v17;
            _os_log_debug_impl(&dword_234C41000, v25, OS_LOG_TYPE_DEBUG, "  sourceRange was (%lld, %lld)", (uint8_t *)&target, 0x16u);
          }

          long long v26 = JFXLog_DebugComposition();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(target.start.value) = 134218240;
            *(CMTimeValue *)((char *)&target.start.value + 4) = v18;
            LOWORD(target.start.flags) = 2048;
            *(void *)((char *)&target.start.flags + 2) = v19;
            _os_log_debug_impl(&dword_234C41000, v26, OS_LOG_TYPE_DEBUG, "  destinationTime was (%lld, %lld)", (uint8_t *)&target, 0x16u);
          }

          uint64_t v4 = v23;
          uint64_t v12 = v22;
          p_timescale = v21;
          uint64_t v11 = v28;
        }

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v11);
  }

  return v30;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  long long v5 = *MEMORY[0x263F01090];
  uint64_t v6 = *(void *)(MEMORY[0x263F01090] + 16);
  id v3 = [(JFXMovieCompositionItem *)self audioTrackSegmentsWithDestinationTime:&v7 paddedFromTime:&v5];
  return v3;
}

- (id)audioTrackSegmentsWithDestinationTime:(id *)a3 paddedFromTime:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(v46, 0, sizeof(v46));
  long long v45 = 0u;
  [(JFXCompositionItem *)self sourceTimeRange];
  if ([(JFXCompositionItem *)self isFreezeFrame])
  {
    [(JFXCompositionItem *)self destinationDuration];
    *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)lhs;
    *((void *)&v46[1] + 1) = *(void *)&lhs[16];
  }
  [(JFXCompositionItem *)self audioStartOffset];
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0;
  *(void *)&lhs[16] = a3->var3;
  CMTimeAdd((CMTime *)&v43, (CMTime *)lhs, &rhs);
  memset(&v44[8], 0, 24);
  [(JFXCompositionItem *)self destinationDuration];
  [(JFXCompositionItem *)self audioStartOffset];
  CMTimeSubtract(&v41, &v40, &v39);
  [(JFXCompositionItem *)self audioEndOffset];
  CMTimeAdd((CMTime *)lhs, &v41, &v38);
  *(_OWORD *)&v44[8] = *(_OWORD *)lhs;
  *(void *)&v44[24] = *(void *)&lhs[16];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = MEMORY[0x263F010E0];
  if (a4->var2)
  {
    long long v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v10 = [v9 BOOLForKey:@"enableGapSyncWorkaround"];

    if (v10)
    {
      memset(lhs, 0, 24);
      *(_OWORD *)time1 = v43;
      *(void *)&time1[16] = *(void *)v44;
      *(_OWORD *)CMTime time2 = *(_OWORD *)&a4->var0;
      *(void *)&time2[16] = a4->var3;
      CMTimeSubtract((CMTime *)lhs, (CMTime *)time1, (CMTime *)time2);
      *(_OWORD *)time1 = *(_OWORD *)lhs;
      *(void *)&time1[16] = *(void *)&lhs[16];
      *(_OWORD *)CMTime time2 = *(_OWORD *)v8;
      *(void *)&time2[16] = *(void *)(v8 + 16);
      if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
      {
        *(_OWORD *)time1 = *(_OWORD *)lhs;
        *(void *)&time1[16] = *(void *)&lhs[16];
        *(_OWORD *)CMTime time2 = v45;
        *(void *)&time2[16] = *(void *)&v46[0];
        if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
        {
          *(_OWORD *)lhs = v45;
          *(void *)&lhs[16] = *(void *)&v46[0];
        }
        *(_OWORD *)CMTime time2 = v43;
        *(void *)&time2[16] = *(void *)v44;
        long long v22 = *(_OWORD *)lhs;
        *(void *)&long long v23 = *(void *)&lhs[16];
        CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        long long v43 = *(_OWORD *)time1;
        *(void *)long long v44 = *(void *)&time1[16];
        *(_OWORD *)CMTime time2 = *(_OWORD *)&v44[8];
        *(void *)&time2[16] = *(void *)&v44[24];
        long long v22 = *(_OWORD *)lhs;
        *(void *)&long long v23 = *(void *)&lhs[16];
        CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        *(_OWORD *)&v44[8] = *(_OWORD *)time1;
        *(void *)&v44[24] = *(void *)&time1[16];
        *(_OWORD *)CMTime time2 = v45;
        *(void *)&time2[16] = *(void *)&v46[0];
        long long v22 = *(_OWORD *)lhs;
        *(void *)&long long v23 = *(void *)&lhs[16];
        CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        long long v45 = *(_OWORD *)time1;
        *(void *)&v46[0] = *(void *)&time1[16];
        *(_OWORD *)CMTime time2 = *(_OWORD *)((char *)v46 + 8);
        *(void *)&time2[16] = *((void *)&v46[1] + 1);
        long long v22 = *(_OWORD *)lhs;
        *(void *)&long long v23 = *(void *)&lhs[16];
        CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
        *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)time1;
        *((void *)&v46[1] + 1) = *(void *)&time1[16];
      }
    }
  }
  *(_OWORD *)lhs = v43;
  *(void *)&lhs[16] = *(void *)v44;
  *(_OWORD *)time1 = *(_OWORD *)v8;
  *(void *)&time1[16] = *(void *)(v8 + 16);
  if (!CMTimeCompare((CMTime *)lhs, (CMTime *)time1))
  {
    uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v12 = [v11 BOOLForKey:@"enableStartupSyncWorkaround"];

    if (v12)
    {
      memset(lhs, 0, 24);
      CMTimeMake((CMTime *)lhs, -1, [(JFXCompositionItem *)self timeScale]);
      *(_OWORD *)CMTime time2 = v43;
      *(void *)&time2[16] = *(void *)v44;
      long long v22 = *(_OWORD *)lhs;
      *(void *)&long long v23 = *(void *)&lhs[16];
      CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      long long v43 = *(_OWORD *)time1;
      *(void *)long long v44 = *(void *)&time1[16];
      *(_OWORD *)CMTime time2 = *(_OWORD *)&v44[8];
      *(void *)&time2[16] = *(void *)&v44[24];
      long long v22 = *(_OWORD *)lhs;
      *(void *)&long long v23 = *(void *)&lhs[16];
      CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      *(_OWORD *)&v44[8] = *(_OWORD *)time1;
      *(void *)&v44[24] = *(void *)&time1[16];
      *(_OWORD *)CMTime time2 = v45;
      *(void *)&time2[16] = *(void *)&v46[0];
      long long v22 = *(_OWORD *)lhs;
      *(void *)&long long v23 = *(void *)&lhs[16];
      CMTimeSubtract((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      long long v45 = *(_OWORD *)time1;
      *(void *)&v46[0] = *(void *)&time1[16];
      *(_OWORD *)CMTime time2 = *(_OWORD *)((char *)v46 + 8);
      *(void *)&time2[16] = *((void *)&v46[1] + 1);
      long long v22 = *(_OWORD *)lhs;
      *(void *)&long long v23 = *(void *)&lhs[16];
      CMTimeAdd((CMTime *)time1, (CMTime *)time2, (CMTime *)&v22);
      *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)time1;
      *((void *)&v46[1] + 1) = *(void *)&time1[16];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)lhs = v45;
  *(_OWORD *)&lhs[16] = v46[0];
  long long v28 = v46[1];
  *(_OWORD *)time1 = v43;
  *(_OWORD *)&time1[16] = *(_OWORD *)v44;
  long long v33 = *(_OWORD *)&v44[16];
  dispatch_semaphore_t v13 = [(JFXMovieCompositionItem *)self speedRangesForSourceRange:lhs destinationRange:time1];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    uint64_t v17 = *MEMORY[0x263EF9C80];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        memset(lhs, 0, sizeof(lhs));
        if (v19) {
          [v19 CMTimeMappingValue];
        }
        *(_OWORD *)CMTime time2 = *(_OWORD *)lhs;
        *(_OWORD *)&time2[16] = *(_OWORD *)&lhs[16];
        long long v26 = v28;
        *(_OWORD *)time1 = v29;
        *(_OWORD *)&time1[16] = v30;
        long long v33 = v31;
        long long v22 = v29;
        long long v23 = v30;
        long long v24 = v31;
        id v20 = [(JFXMovieCompositionItem *)self segmentWithCharacteristic:v17 sourceRange:time2 destinationRange:&v22];
        if (!v20)
        {
          *(_OWORD *)CMTime time2 = *(_OWORD *)time1;
          *(_OWORD *)&time2[16] = *(_OWORD *)&time1[16];
          long long v26 = v33;
          id v20 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationRange:time2];
          if (!v20) {
            continue;
          }
        }
        [v7 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v15);
  }

  return v7;
}

- (id)audioTrackSegmentsLoopedWithDestinationTime:(id *)a3
{
  [(JFXCompositionItem *)self audioStartOffset];
  long long v7 = *(_OWORD *)&a3->var0;
  *(void *)&long long v8 = a3->var3;
  CMTimeAdd((CMTime *)&v15, (CMTime *)&v7, &rhs);
  memset(&v16[8], 0, 24);
  [(JFXCompositionItem *)self destinationDuration];
  [(JFXCompositionItem *)self audioStartOffset];
  CMTimeSubtract(&v13, &lhs, &v11);
  [(JFXCompositionItem *)self audioEndOffset];
  CMTimeAdd((CMTime *)&v7, &v13, &v10);
  *(void *)&v16[24] = v8;
  *(_OWORD *)&v16[8] = v7;
  long long v7 = v15;
  long long v8 = *(_OWORD *)v16;
  long long v9 = *(_OWORD *)&v16[16];
  long long v5 = [(JFXMovieCompositionItem *)self audioTrackSegmentsLoopedForDestinationTimeRange:&v7];
  return v5;
}

- (id)audioTrackSegmentsLoopedForDestinationTimeRange:(id *)a3
{
  long long v5 = [MEMORY[0x263EFF8C0] array];
  uint64_t v6 = [(JFXMovieCompositionItem *)self audioAssetOverwrite];

  if (v6) {
    [(JFXMovieCompositionItem *)self audioAssetOverwrite];
  }
  else {
  long long v7 = [(JFXMovieCompositionItem *)self asset];
  }
  long long v8 = v7;
  memset(&v36, 0, sizeof(v36));
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  [(JFXCompositionItem *)self speed];
  CMTimeMultiplyByFloat64(&v35, &time, 1.0 / v9);
  CMTimeConvertScale(&v36, &v35, [(JFXCompositionItem *)self timeScale], kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(v33, 0, sizeof(v33));
  if (v6)
  {
    [(JFXCompositionItem *)self sourceTimeRange];
    CMTime lhs = v31;
    CMTimeMake(&rhs, [(JFXMovieCompositionItem *)self audioAssetOverwriteStartOffset], [(JFXCompositionItem *)self timeScale]);
    CMTimeAdd(v33, &lhs, &rhs);
  }
  else
  {
    [(JFXCompositionItem *)self sourceTimeRange];
    v33[0] = v29;
  }
  time1.start = v33[0];
  *(CMTime *)CMTime time2 = v36;
  if (CMTimeCompare(&time1.start, (CMTime *)time2) >= 1)
  {
    do
    {
      *(CMTime *)CMTime time2 = v33[0];
      *(CMTime *)duration = v36;
      CMTimeSubtract(&time1.start, (CMTime *)time2, (CMTime *)duration);
      v33[0] = time1.start;
      *(CMTime *)CMTime time2 = v36;
    }
    while (CMTimeCompare(&time1.start, (CMTime *)time2) > 0);
  }
  long long v10 = *(_OWORD *)&a3->var0.var3;
  CMTime var0 = (CMTime)a3->var0;
  memset(&v27, 0, sizeof(v27));
  long long v11 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time1.start.epoch = v10;
  *(_OWORD *)&time1.duration.timescale = v11;
  CMTimeRangeGetEnd(&v27, &time1);
  time1.start = var0;
  *(CMTime *)CMTime time2 = v27;
  if (CMTimeCompare(&time1.start, (CMTime *)time2) < 0)
  {
    uint64_t v16 = *MEMORY[0x263EF9C80];
    while (1)
    {
      time1.start = v36;
      *(CMTime *)CMTime time2 = v33[0];
      CMTimeSubtract(&v25, &time1.start, (CMTime *)time2);
      time1.start = v27;
      *(CMTime *)CMTime time2 = var0;
      CMTimeSubtract(&v24, &time1.start, (CMTime *)time2);
      CMTimeMinimum(&time1.start, &v25, &v24);
      v33[1] = time1.start;
      if (v36.value <= 0)
      {
        *(CMTime *)CMTime time2 = v27;
        *(CMTime *)duration = var0;
        CMTimeSubtract(&time1.start, (CMTime *)time2, (CMTime *)duration);
        v33[1] = time1.start;
        if (v36.value < 1) {
          break;
        }
      }
      memset(&time1, 0, sizeof(time1));
      *(CMTime *)CMTime time2 = var0;
      *(CMTime *)duration = v33[1];
      CMTimeRangeMake(&time1, (CMTime *)time2, (CMTime *)duration);
      long long v23 = 0u;
      *(_OWORD *)duration = *(_OWORD *)&v33[0].value;
      *(_OWORD *)&duration[16] = *(_OWORD *)&v33[0].epoch;
      long long v21 = *(_OWORD *)&v33[1].timescale;
      memset(time2, 0, sizeof(time2));
      [(JFXMovieCompositionItem *)self applySpeed:duration];
      *(_OWORD *)duration = *(_OWORD *)time2;
      *(_OWORD *)&duration[16] = *(_OWORD *)&time2[16];
      long long v21 = v23;
      CMTimeRange v19 = time1;
      uint64_t v17 = [(JFXMovieCompositionItem *)self segmentWithCharacteristic:v16 sourceRange:duration destinationRange:&v19];
      if (!v17) {
        break;
      }
      CMTimeValue v18 = (void *)v17;
      int v12 = [v5 arrayByAddingObject:v17];

      *(CMTime *)duration = var0;
      v19.start = v33[1];
      CMTimeAdd(&var0, (CMTime *)duration, &v19.start);
      CMTimeMake((CMTime *)duration, 0, [(JFXCompositionItem *)self timeScale]);
      v33[0] = *(CMTime *)duration;

      time1.start = var0;
      *(CMTime *)CMTime time2 = v27;
      long long v5 = v12;
      if ((CMTimeCompare(&time1.start, (CMTime *)time2) & 0x80000000) == 0) {
        goto LABEL_14;
      }
    }
  }
  int v12 = v5;
LABEL_14:
  if (![v12 count])
  {
    time1.start = v27;
    CMTime v13 = [(JFXCompositionItem *)self emptyTrackSegmentWithDestinationTime:&time1];
    if (v13)
    {
      uint64_t v14 = [v12 arrayByAddingObject:v13];

      int v12 = (void *)v14;
    }
  }
  return v12;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (AVAsset)audioAssetOverwrite
{
  return self->_audioAssetOverwrite;
}

- (void)setAudioAssetOverwrite:(id)a3
{
}

- (int)audioAssetOverwriteStartOffset
{
  return self->_audioAssetOverwriteStartOffset;
}

- (void)setAudioAssetOverwriteStartOffset:(int)a3
{
  self->_audioAssetOverwriteStartOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssetOverwrite, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)segmentWithCharacteristic:(uint64_t)a1 sourceRange:(NSObject *)a2 destinationRange:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Can only create an AVCompositionTrackSegment from a AVURLAsset, not %@", (uint8_t *)&v2, 0xCu);
}

void __82__JFXMovieCompositionItem_segmentWithCharacteristic_sourceRange_destinationRange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Asset %@ appears to not have any tracks with characteristic %@", (uint8_t *)&v4, 0x16u);
}

- (void)videoTrackSegmentsWithDestinationRange:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "segmentWithCharacteristic returned nil !", buf, 2u);
}

@end