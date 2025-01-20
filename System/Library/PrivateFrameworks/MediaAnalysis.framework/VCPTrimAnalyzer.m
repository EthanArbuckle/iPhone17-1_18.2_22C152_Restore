@interface VCPTrimAnalyzer
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)bestTrimTimeRange;
- (BOOL)checkTrimAt:(id *)a3 captureTime:(id *)a4;
- (BOOL)isCurated:(float)a3;
- (BOOL)isReady;
- (BOOL)isTimestampSkipable:(id *)a3;
- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5;
- (VCPTrimAnalyzer)init;
- (float)calculateCandidateScoreWithRangeAdjust:(int)a3 endIdx:(int)a4 candidateTimeRange:(id *)a5 captureTime:(id *)a6;
- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4;
- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4 andCaptureTime:(id *)a5;
- (int)generateInterestingTrimBasedOnCaptureTime:(id *)a3;
- (int)prepareTrimmingWithTrimStart:(id *)a3 andTrimEnd:(id *)a4;
- (void)generateCurationSegment;
- (void)printSegments:(id)a3;
- (void)updateCurationThreshold;
@end

@implementation VCPTrimAnalyzer

- (VCPTrimAnalyzer)init
{
  v17.receiver = self;
  v17.super_class = (Class)VCPTrimAnalyzer;
  v2 = [(VCPTrimAnalyzer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = objc_alloc_init(VCPActionAnalyzer);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    uint64_t v7 = MEMORY[0x1E4F1FA20];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)(v2 + 40) = v8;
    *(_OWORD *)(v2 + 56) = *(_OWORD *)(v7 + 32);
    v2[76] = 0;
    uint64_t v9 = MEMORY[0x1E4F1FA48];
    *((_OWORD *)v2 + 5) = *MEMORY[0x1E4F1FA48];
    *((void *)v2 + 12) = *(void *)(v9 + 16);
    uint64_t v10 = MEMORY[0x1E4F1F9F8];
    long long v16 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 104) = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(v10 + 16);
    *((void *)v2 + 15) = v11;
    v2[128] = 1;
    v12 = objc_alloc_init(VCPSegment);
    v13 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v12;

    *((_OWORD *)v2 + 9) = v16;
    *((void *)v2 + 20) = v11;
    v2[168] = 0;
    v14 = v2;
  }

  return (VCPTrimAnalyzer *)v2;
}

- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4
{
  v6 = [a4 objectForKeyedSubscript:@"subjectMotionScore"];
  [v6 floatValue];
  float v8 = v7;

  actionAnalyzer = self->_actionAnalyzer;
  long long v10 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time[16] = v10;
  long long v15 = *(_OWORD *)&a3->var1.var1;
  [(VCPActionAnalyzer *)actionAnalyzer analyzeFrameWithTimeRange:time andActionScore:COERCE_DOUBLE(__PAIR64__(DWORD1(v15), LODWORD(v8)))];
  if (self->_firstFrame)
  {
    long long v11 = *(_OWORD *)&a3->var0.var0;
    self->_inTrimStart.epoch = a3->var0.var3;
    *(_OWORD *)&self->_inTrimStart.value = v11;
    self->_firstFrame = 0;
  }
  if (self->_verbose)
  {
    *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
    *(void *)&time[16] = a3->var0.var3;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
    printf("Received action score %f - %f\n", Seconds, v8);
  }
  self->_ready = 1;
  return 0;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)updateCurationThreshold
{
  self->_float curationThreshold = 0.2;
  if ([(NSMutableArray *)self->_internalResults count])
  {
    unint64_t v3 = 0;
    float v4 = 0.0;
    do
    {
      v5 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v3];
      [v5 curationScore];
      if (v6 > v4)
      {
        [v5 curationScore];
        float v4 = v7;
      }

      ++v3;
    }
    while ([(NSMutableArray *)self->_internalResults count] > v3);
  }
  else
  {
    float v4 = 0.0;
  }
  float curationThreshold = self->_curationThreshold;
  if (v4 > curationThreshold) {
    self->_float curationThreshold = (float)(v4 + curationThreshold) * 0.5;
  }
}

- (BOOL)isCurated:(float)a3
{
  return self->_curationThreshold < a3;
}

- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4 andCaptureTime:(id *)a5
{
  if (self->_verbose)
  {
    CMTime time = *(CMTime *)a3;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime time = (CMTime)*a4;
    Float64 v10 = CMTimeGetSeconds(&time);
    printf("Destructive Trim Range: [%.2f - %.2f]\n", Seconds, v10);
  }
  actionAnalyzer = self->_actionAnalyzer;
  CMTime time = (CMTime)*a3;
  long long v13 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [(VCPActionAnalyzer *)actionAnalyzer finalizeWithDestructiveTrimStart:&time trimEnd:&v13];
  [(VCPTrimAnalyzer *)self generateCurationSegment];
  CMTime time = (CMTime)*a5;
  [(VCPTrimAnalyzer *)self generateInterestingTrimBasedOnCaptureTime:&time];
  return 0;
}

- (void)printSegments:(id)a3
{
  if (self->_verbose)
  {
    printf("=========%s==========\n", (const char *)[a3 UTF8String]);
    internalResults = self->_internalResults;
    [(NSMutableArray *)internalResults enumerateObjectsUsingBlock:&__block_literal_global_90];
  }
}

void __33__VCPTrimAnalyzer_printSegments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 timeRange];
    *(_OWORD *)&time.value = v9;
    time.epoch = v10;
    double Seconds = CMTimeGetSeconds(&time);
    [v3 timeRange];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    memset(&time, 0, sizeof(time));
    double Seconds = CMTimeGetSeconds(&time);
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v8, &range);
  double v5 = CMTimeGetSeconds(&v8);
  [v3 score];
  printf("[%.2f - %.2f]: %.2f\n", Seconds, v5, v6);
}

- (void)generateCurationSegment
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_internalResults removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = [(VCPActionAnalyzer *)self->_actionAnalyzer segments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        CMTime v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        long long v9 = objc_alloc_init(VCPSegment);
        [(VCPSegment *)v9 copyFrom:v8];
        [v8 score];
        -[VCPSegment setCurationScore:](v9, "setCurationScore:");
        [(NSMutableArray *)self->_internalResults addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  activeSegment = self->_activeSegment;
  long long v11 = [(VCPActionAnalyzer *)self->_actionAnalyzer activeSegment];
  [(VCPSegment *)activeSegment copyFrom:v11];

  [(VCPSegment *)self->_activeSegment score];
  -[VCPSegment setCurationScore:](self->_activeSegment, "setCurationScore:");
  [(VCPTrimAnalyzer *)self updateCurationThreshold];
}

- (int)generateInterestingTrimBasedOnCaptureTime:(id *)a3
{
  unint64_t v5 = 0;
  do
  {
    unint64_t v6 = v5;
    if ([(NSMutableArray *)self->_internalResults count] <= v5) {
      break;
    }
    uint64_t v7 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v5];
    CMTime v8 = v7;
    if (v7) {
      [v7 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    int v9 = CMTimeRangeContainsTime(&range, &time.start);
    ++v5;
  }
  while (!v9);
  uint64_t v10 = [(NSMutableArray *)self->_internalResults count];
  if (v10 == v6)
  {
    long long v11 = objc_alloc_init(VCPSegment);
    [(VCPSegment *)v11 copyFrom:self->_activeSegment];
    if (v11) {
      [(VCPSegment *)v11 timeRange];
    }
    else {
      memset(&v58, 0, sizeof(v58));
    }
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    if (!CMTimeRangeContainsTime(&v58, &time.start))
    {
      memset(&time, 0, 24);
      *(_OWORD *)&end.start.value = *(_OWORD *)&a3->var0;
      end.start.epoch = a3->var3;
      Float64 Seconds = CMTimeGetSeconds(&end.start);
      CMTimeMakeWithSeconds(&time.start, Seconds + 0.300000012, a3->var1);
      if (v11)
      {
        [(VCPSegment *)v11 timeRange];
      }
      else
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v53 = 0u;
      }
      *(_OWORD *)&start.value = v53;
      start.epoch = v54;
      *(_OWORD *)&end.start.value = *(_OWORD *)&time.start.value;
      end.start.epoch = time.start.epoch;
      CMTimeRangeFromTimeToTime(&v57, &start, &end.start);
      CMTimeRange v52 = v57;
      [(VCPSegment *)v11 setTimeRange:&v52];
    }
    [(NSMutableArray *)self->_internalResults addObject:v11];
  }
  if (self->_verbose)
  {
    printf("capturePointSegmentIdx: %d\n", v6);
    long long v13 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
    long long v14 = v13;
    if (v13)
    {
      [v13 timeRange];
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
    }
    *(_OWORD *)&v51.value = v48;
    v51.epoch = v49;
    double v15 = CMTimeGetSeconds(&v51);
    long long v16 = [(NSMutableArray *)self->_internalResults lastObject];
    uint64_t v17 = v16;
    if (v16) {
      [v16 timeRange];
    }
    else {
      memset(&v46, 0, sizeof(v46));
    }
    CMTimeRangeGetEnd(&v47, &v46);
    Float64 v18 = CMTimeGetSeconds(&v47);
    printf("----[%.2f - %.2f]\n", v15, v18);
  }
  uint64_t v19 = 0;
  long long v38 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v39 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&time.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&time.start.epoch = v38;
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  *(_OWORD *)&time.duration.timescale = v37;
  float v20 = -1.0;
  do
  {
    if ((int)v6 < (int)[(NSMutableArray *)self->_internalResults count])
    {
      unint64_t v21 = v6;
      do
      {
        *(_OWORD *)&end.start.value = v39;
        *(_OWORD *)&end.start.epoch = v38;
        *(_OWORD *)&end.duration.timescale = v37;
        *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
        v42.start.epoch = a3->var3;
        [(VCPTrimAnalyzer *)self calculateCandidateScoreWithRangeAdjust:v19 endIdx:v21 candidateTimeRange:&end captureTime:&v42];
        float v23 = v22;
        if (v22 > v20)
        {
          *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
          v42.start.epoch = a3->var3;
          double v24 = CMTimeGetSeconds(&v42.start);
          *(_OWORD *)&v42.start.value = *(_OWORD *)&end.start.value;
          v42.start.epoch = end.start.epoch;
          if (v24 - CMTimeGetSeconds(&v42.start) >= 1.5)
          {
            CMTimeRange time = end;
            float v20 = v23;
          }
        }
        if (self->_verbose)
        {
          int v25 = [(NSMutableArray *)self->_internalResults count];
          *(_OWORD *)&v42.start.value = *(_OWORD *)&end.start.value;
          v42.start.epoch = end.start.epoch;
          double v26 = CMTimeGetSeconds(&v42.start);
          CMTimeRange v42 = end;
          CMTimeRangeGetEnd(&v43, &v42);
          double v27 = CMTimeGetSeconds(&v43);
          *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
          v42.start.epoch = a3->var3;
          Float64 v28 = CMTimeGetSeconds(&v42.start);
          printf("startIdx = %d, endIdx = %d, count = %d, [%f, %f] with score %f captureTime=%f\n", v19, v21, v25, v26, v27, v23, v28);
        }
        unint64_t v21 = (v21 + 1);
      }
      while ((int)v21 < (int)[(NSMutableArray *)self->_internalResults count]);
    }
    uint64_t v19 = (v19 + 1);
  }
  while (v6 + 1 != v19);
  if (self->_verbose)
  {
    *(_OWORD *)&end.start.value = *(_OWORD *)&time.start.value;
    end.start.epoch = time.start.epoch;
    double v29 = CMTimeGetSeconds(&end.start);
    CMTimeRange end = time;
    CMTimeRangeGetEnd(&v41, &end);
    Float64 v30 = CMTimeGetSeconds(&v41);
    printf("interesting trim: [%f, %f], score = %.2f\n", v29, v30, v20);
  }
  p_bestTrimTimeRange = &self->_bestTrimTimeRange;
  if (v20 <= 0.05)
  {
    *(_OWORD *)&end.start.value = *(_OWORD *)&a3->var0;
    end.start.epoch = a3->var3;
    Float64 v34 = CMTimeGetSeconds(&end.start);
    CMTimeMakeWithSeconds(&v40, v34 + -1.5, a3->var1);
    *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
    v42.start.epoch = a3->var3;
    CMTimeRangeFromTimeToTime(&end, &v40, &v42.start);
    long long v35 = *(_OWORD *)&end.start.epoch;
    *(_OWORD *)&p_bestTrimTimeRange->start.value = *(_OWORD *)&end.start.value;
    *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v35;
    long long v33 = *(_OWORD *)&end.duration.timescale;
  }
  else
  {
    long long v32 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&p_bestTrimTimeRange->start.value = *(_OWORD *)&time.start.value;
    *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v32;
    long long v33 = *(_OWORD *)&time.duration.timescale;
  }
  *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale = v33;
  if (v10 == v6) {
    [(NSMutableArray *)self->_internalResults removeLastObject];
  }
  return 0;
}

- (int)prepareTrimmingWithTrimStart:(id *)a3 andTrimEnd:(id *)a4
{
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v35 = [(NSMutableArray *)self->_internalResults count] - 1;
  internalResults = self->_internalResults;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59__VCPTrimAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke;
  v29[3] = &unk_1E629C8F8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v30 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a4;
  v29[4] = &v36;
  v29[5] = &v32;
  [(NSMutableArray *)internalResults enumerateObjectsUsingBlock:v29];
  for (unint64_t i = (int)[(NSMutableArray *)self->_internalResults count] - 1; ; unint64_t i = v10)
  {
    int v9 = self->_internalResults;
    if (v33[3] >= i) {
      break;
    }
    unint64_t v10 = i - 1;
    -[NSMutableArray removeObjectAtIndex:](v9, "removeObjectAtIndex:");
  }
  long long v11 = -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:");
  long long v27 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [v11 trimSegment:&v27 fromStart:0];

  for (uint64_t j = *((unsigned int *)v37 + 6);
        (int)j >= 1;
        [(NSMutableArray *)self->_internalResults removeObjectAtIndex:j])
  {
    --j;
  }
  long long v13 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
  long long v27 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  [v13 trimSegment:&v27 fromStart:1];

  if (self->_verbose)
  {
    long long v14 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
    double v15 = v14;
    if (v14)
    {
      [v14 timeRange];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)&time.value = v23;
    time.epoch = v24;
    double Seconds = CMTimeGetSeconds(&time);
    uint64_t v17 = [(NSMutableArray *)self->_internalResults lastObject];
    Float64 v18 = v17;
    if (v17) {
      [v17 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRangeGetEnd(&v22, &range);
    Float64 v19 = CMTimeGetSeconds(&v22);
    printf(" --[%.2f - %.2f]\n", Seconds, v19);
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return 0;
}

void __59__VCPTrimAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTime time = *(CMTime *)(a1 + 48);
  if (CMTimeRangeContainsTime(&range, &time)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  if (v6) {
    [v6 timeRange];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CMTime time = *(CMTime *)(a1 + 72);
  if (CMTimeRangeContainsTime(&v7, &time)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (float)calculateCandidateScoreWithRangeAdjust:(int)a3 endIdx:(int)a4 candidateTimeRange:(id *)a5 captureTime:(id *)a6
{
  uint64_t v10 = a3;
  long long v11 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:a3];
  [v11 curationScore];
  float v13 = v12;
  if (v11)
  {
    [v11 timeRange];
  }
  else
  {
    memset(v88, 0, sizeof(v88));
    long long v87 = 0u;
  }
  double v14 = v13;
  CMTime time = *(CMTime *)((char *)v88 + 8);
  double Seconds = CMTimeGetSeconds(&time);
  [v11 curationScore];
  float v17 = v16;
  [v11 curationScore];
  float v19 = v18;
  if (v11)
  {
    [v11 timeRange];
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
  }
  double v20 = Seconds * v14;
  *(_OWORD *)&v86.value = v83;
  v86.epoch = v84;
  double v21 = CMTimeGetSeconds(&v86);
  if (v11) {
    [v11 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRange v52 = a6;
  float v22 = v21;
  CMTimeRangeGetEnd(&v82, &range);
  double v23 = CMTimeGetSeconds(&v82);
  float v24 = v23;
  float v25 = v20;
  if (a3 < a4)
  {
    uint64_t v26 = v10;
    do
    {
      long long v27 = v11;
      uint64_t v28 = v26 + 1;
      long long v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v26 + 1, v52);

      [v11 curationScore];
      float v30 = v29;
      if (v11)
      {
        [v11 timeRange];
      }
      else
      {
        memset(v79, 0, sizeof(v79));
        long long v78 = 0u;
      }
      CMTime v80 = *(CMTime *)((char *)v79 + 8);
      double v31 = CMTimeGetSeconds(&v80);
      if (a4 - 1 == v26)
      {
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(&v76, 0, sizeof(v76));
        }
        CMTimeRangeGetEnd(&v77, &v76);
        float v24 = CMTimeGetSeconds(&v77);
        [v11 curationScore];
        float v19 = v32;
      }
      double v23 = v25 + v30 * v31;
      float v25 = v23;
      ++v26;
    }
    while (a4 != v28);
  }
  float v33 = v24 - v22;
  if ((float)(v24 - v22) <= 1.5
    || (*(float *)&double v23 = v17, [(VCPTrimAnalyzer *)self isCurated:v23])
    && (*(float *)&double v34 = v19, [(VCPTrimAnalyzer *)self isCurated:v34]))
  {
    uint64_t v35 = a5;
    goto LABEL_63;
  }
  uint64_t v36 = -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v10, v52);
  long long v37 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:a4];
  if (v36) {
    [v36 timeRange];
  }
  else {
    memset(&v75, 0, sizeof(v75));
  }
  *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
  v57.start.epoch = *(void *)(v53 + 16);
  int v38 = CMTimeRangeContainsTime(&v75, &v57.start);
  if (v37) {
    [v37 timeRange];
  }
  else {
    memset(&v74, 0, sizeof(v74));
  }
  *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
  v57.start.epoch = *(void *)(v53 + 16);
  int v39 = CMTimeRangeContainsTime(&v74, &v57.start);
  if (!v39)
  {
    *(float *)&double v40 = v19;
    if (![(VCPTrimAnalyzer *)self isCurated:v40])
    {
      float v41 = v33 + -1.5;
      if (v37)
      {
        [v37 timeRange];
      }
      else
      {
        memset(v72, 0, sizeof(v72));
        long long v71 = 0u;
      }
      CMTime v73 = *(CMTime *)((char *)v72 + 8);
      double v40 = CMTimeGetSeconds(&v73);
      if (v40 < v41)
      {
        if (v37)
        {
          [v37 timeRange];
        }
        else
        {
          memset(v69, 0, sizeof(v69));
          long long v68 = 0u;
        }
        CMTime v70 = *(CMTime *)((char *)v69 + 8);
        double v40 = CMTimeGetSeconds(&v70);
        float v41 = v40;
      }
      float v24 = v24 - v41;
      float v25 = v25 - (float)(v41 * v19);
    }
  }
  if (v38)
  {
    if ((float)(v24 - v22) <= 1.5) {
      goto LABEL_61;
    }
    *(float *)&double v40 = v17;
    if (![(VCPTrimAnalyzer *)self isCurated:v40])
    {
      float v43 = (float)(v24 - v22) + -1.5;
      *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
      v57.start.epoch = *(void *)(v53 + 16);
      double v42 = CMTimeGetSeconds(&v57.start) - v22;
      if (v42 <= v43)
      {
        *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
        v57.start.epoch = *(void *)(v53 + 16);
        double v42 = CMTimeGetSeconds(&v57.start) - v22;
        float v43 = v42;
      }
      float v22 = v43 + v22;
      float v25 = v25 - (float)(v43 * v17);
    }
  }
  else
  {
    *(float *)&double v40 = v17;
    if (![(VCPTrimAnalyzer *)self isCurated:v40])
    {
      float v44 = (float)(v24 - v22) + -1.5;
      if (v36)
      {
        [v36 timeRange];
      }
      else
      {
        memset(v66, 0, sizeof(v66));
        long long v65 = 0u;
      }
      CMTime v67 = *(CMTime *)((char *)v66 + 8);
      double v42 = CMTimeGetSeconds(&v67);
      if (v42 < v44)
      {
        if (v36)
        {
          [v36 timeRange];
        }
        else
        {
          memset(v63, 0, sizeof(v63));
          long long v62 = 0u;
        }
        CMTime v64 = *(CMTime *)((char *)v63 + 8);
        double v42 = CMTimeGetSeconds(&v64);
        float v44 = v42;
      }
      float v22 = v44 + v22;
      float v25 = v25 - (float)(v44 * v17);
    }
    if ((float)(v24 - v22) <= 1.5) {
      goto LABEL_61;
    }
  }
  if (v39)
  {
    *(float *)&double v42 = v19;
    if (![(VCPTrimAnalyzer *)self isCurated:v42])
    {
      float v49 = (float)(v24 - v22) + -1.5;
      if (v37) {
        [v37 timeRange];
      }
      else {
        memset(&v60, 0, sizeof(v60));
      }
      uint64_t v35 = a5;
      CMTimeRangeGetEnd(&v61, &v60);
      double v50 = CMTimeGetSeconds(&v61);
      *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
      v57.start.epoch = *(void *)(v53 + 16);
      if (v50 - CMTimeGetSeconds(&v57.start) <= v49)
      {
        if (v37) {
          [v37 timeRange];
        }
        else {
          memset(&v58, 0, sizeof(v58));
        }
        CMTimeRangeGetEnd(&v59, &v58);
        double v51 = CMTimeGetSeconds(&v59);
        *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
        v57.start.epoch = *(void *)(v53 + 16);
        float v49 = v51 - CMTimeGetSeconds(&v57.start);
      }
      float v24 = v24 - v49;
      float v25 = v25 - (float)(v49 * v19);
      goto LABEL_62;
    }
  }
LABEL_61:
  uint64_t v35 = a5;
LABEL_62:

  float v33 = v24 - v22;
LABEL_63:
  if (v33 == 0.0) {
    float v45 = 0.0;
  }
  else {
    float v45 = v25 / v33;
  }
  float v46 = v45
      * expf((float)-(float)((float)(v33 + -1.5) * (float)(v33 + -1.5))/ calculateCandidateScoreWithRangeAdjust_endIdx_candidateTimeRange_captureTime__kDurationSigma[(float)(v33 + -1.5) > 0.0]);
  CMTimeMakeWithSeconds(&start, v22, 600);
  CMTimeMakeWithSeconds(&end, v24, 600);
  CMTimeRangeFromTimeToTime(&v57, &start, &end);
  long long v47 = *(_OWORD *)&v57.start.epoch;
  *(_OWORD *)&v35->var0.var0 = *(_OWORD *)&v57.start.value;
  *(_OWORD *)&v35->var0.int64_t var3 = v47;
  *(_OWORD *)&v35->var1.var1 = *(_OWORD *)&v57.duration.timescale;

  return v46;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)bestTrimTimeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5
{
  if (a5)
  {
    time.CMTime start = (CMTime)*a3;
    double Seconds = CMTimeGetSeconds(&time.start);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    if (Seconds <= CMTimeGetSeconds(&time.start))
    {
      long long v9 = *(_OWORD *)&a3->var0;
      self->_inTrimStart.epoch = a3->var3;
      *(_OWORD *)&self->_inTrimStart.value = v9;
    }
    return 1;
  }
  else
  {
    p_captureTime = &self->_captureTime;
    if ((self->_captureTime.flags & 1) == 0
      || (*(_OWORD *)&time.start.value = *(_OWORD *)&p_captureTime->value,
          time.start.epoch = self->_captureTime.epoch,
          CMTime time2 = *(CMTime *)a4,
          CMTimeCompare(&time.start, &time2)))
    {
      long long v12 = *(_OWORD *)&a4->var0;
      self->_captureTime.epoch = a4->var3;
      *(_OWORD *)&p_captureTime->value = v12;
      uint64_t v13 = MEMORY[0x1E4F1FA20];
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&self->_bestTrimTimeRange.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v14;
      *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale = *(_OWORD *)(v13 + 32);
    }
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    double v15 = CMTimeGetSeconds(&time.start);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    if (v15 >= CMTimeGetSeconds(&time.start)
      || (self->_bestTrimTimeRange.start.flags & 1) == 0
      || (self->_bestTrimTimeRange.duration.flags & 1) == 0
      || self->_bestTrimTimeRange.duration.epoch
      || self->_bestTrimTimeRange.duration.value < 0)
    {
      if ([(NSMutableArray *)self->_internalResults count]
        && (*(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0,
            time.start.epoch = a3->var3,
            [(VCPTrimAnalyzer *)self isTimestampSkipable:&time]))
      {
        return 0;
      }
      else
      {
        actionAnalyzer = self->_actionAnalyzer;
        long long v19 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        *(_OWORD *)&time.start.value = *(_OWORD *)&self->_inTrimStart.value;
        time.start.epoch = self->_inTrimStart.epoch;
        [(VCPActionAnalyzer *)actionAnalyzer postProcessSegmentsWithCaptureTime:&v19 trimStart:&time];
        [(VCPTrimAnalyzer *)self generateCurationSegment];
        *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
        time.start.epoch = a3->var3;
        CMTime time2 = (CMTime)*a4;
        return [(VCPTrimAnalyzer *)self checkTrimAt:&time captureTime:&time2];
      }
    }
    else
    {
      long long v17 = *(_OWORD *)&self->_bestTrimTimeRange.start.epoch;
      *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
      *(_OWORD *)&time.start.epoch = v17;
      long long v18 = *(_OWORD *)&a3->var0;
      *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale;
      *(_OWORD *)&time2.value = v18;
      time2.epoch = a3->var3;
      return CMTimeRangeContainsTime(&time, &time2) == 0;
    }
  }
}

- (BOOL)isTimestampSkipable:(id *)a3
{
  id v5 = 0;
  uint64_t v6 = [(NSMutableArray *)self->_internalResults count];
  do
  {
    if ((int)v6 < 1)
    {
      BOOL v10 = 0;
      CMTimeRange v7 = v5;
      goto LABEL_23;
    }
    CMTimeRange v7 = [(NSMutableArray *)self->_internalResults objectAtIndex:--v6];

    if (v7) {
      [v7 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTime time = (CMTime)*a3;
    if (CMTimeRangeContainsTime(&range, &time)) {
      break;
    }
    CMTime time = (CMTime)*a3;
    double Seconds = CMTimeGetSeconds(&time);
    if (v7) {
      [v7 timeRange];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CMTimeRangeGetEnd(&v20, &v19);
    id v5 = v7;
  }
  while (Seconds <= CMTimeGetSeconds(&v20));
  CMTime time = (CMTime)*a3;
  double v9 = CMTimeGetSeconds(&time);
  if (v7)
  {
    [v7 timeRange];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }
  *(_OWORD *)&v18.value = v15;
  v18.epoch = v16;
  if (v9 <= CMTimeGetSeconds(&v18)) {
    goto LABEL_22;
  }
  CMTime time = (CMTime)*a3;
  double v11 = CMTimeGetSeconds(&time);
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTimeRangeGetEnd(&v14, &v13);
  if (v11 < CMTimeGetSeconds(&v14)
    && ([v7 curationScore], -[VCPTrimAnalyzer isCurated:](self, "isCurated:")))
  {
    BOOL v10 = 1;
  }
  else
  {
LABEL_22:
    BOOL v10 = 0;
  }
LABEL_23:

  return v10;
}

- (BOOL)checkTrimAt:(id *)a3 captureTime:(id *)a4
{
  time.CMTime start = (CMTime)*a3;
  double Seconds = CMTimeGetSeconds(&time.start);
  time.CMTime start = (CMTime)*a4;
  if (Seconds <= CMTimeGetSeconds(&time.start))
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    [(VCPTrimAnalyzer *)self generateInterestingTrimBasedOnCaptureTime:&time];
    long long v9 = *(_OWORD *)&self->_bestTrimTimeRange.start.epoch;
    *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
    *(_OWORD *)&time.start.epoch = v9;
    *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale;
    CMTime v15 = (CMTime)*a3;
    return CMTimeRangeContainsTime(&time, &v15) == 0;
  }
  else
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    if ([(VCPTrimAnalyzer *)self isTimestampSkipable:&time]) {
      return 0;
    }
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    double v10 = CMTimeGetSeconds(&time.start);
    activeSegment = self->_activeSegment;
    if (activeSegment) {
      [(VCPSegment *)activeSegment timeRange];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CMTime v14 = v13;
    if (v10 > CMTimeGetSeconds(&v14)
      && ([(VCPSegment *)self->_activeSegment curationScore],
          -[VCPTrimAnalyzer isCurated:](self, "isCurated:")))
    {
      return 0;
    }
    else
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
      time.start.epoch = a3->var3;
      double v12 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
      time.start.epoch = self->_bestTrimTimeRange.start.epoch;
      return v12 - CMTimeGetSeconds(&time.start) >= 3.0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSegment, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_actionAnalyzer, 0);
}

@end