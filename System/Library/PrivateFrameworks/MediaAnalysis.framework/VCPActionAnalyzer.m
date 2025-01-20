@interface VCPActionAnalyzer
- (BOOL)decideSegmentPointBasedOnActionScore:(float)a3;
- (BOOL)decideSegmentPointUsingHinkleyDetector:(float)a3;
- (BOOL)isActive:(float)a3;
- (BOOL)isScoreValid:(float)a3;
- (VCPActionAnalyzer)init;
- (id)activeSegment;
- (id)segments;
- (int)analyzeFrameWithTimeRange:(id *)a3 andActionScore:(float)a4;
- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4;
- (int)mergeConsecutiveShortSegments;
- (int)mergeSameTypeSegments;
- (int)mergeSparseShortSegments;
- (int)postProcessSegmentsWithCaptureTime:(id *)a3 trimStart:(id *)a4;
- (int)prepareTrimmingWithTrimStart:(id *)a3 andTrimEnd:(id *)a4;
- (void)dealloc;
- (void)printSegments:(id)a3;
- (void)updateActiveThreshold;
@end

@implementation VCPActionAnalyzer

- (VCPActionAnalyzer)init
{
  v14.receiver = self;
  v14.super_class = (Class)VCPActionAnalyzer;
  v2 = [(VCPActionAnalyzer *)&v14 init];
  if (!v2)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v3 = operator new(0x1CuLL, MEMORY[0x1E4FBA2D0]);
  if (!v3)
  {
    v2->_activeHinkleyDetector = 0;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)v13, 2u);
      }
    }
    goto LABEL_8;
  }
  uint64_t v4 = (uint64_t)v3;
  ma::HinkleyDetector::HinkleyDetector((uint64_t)v3);
  v2->_activeHinkleyDetector = (HinkleyDetector *)v4;
  ma::HinkleyDetector::Initialize(v4, 0.05, 0.15, 10);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  internalResults = v2->_internalResults;
  v2->_internalResults = (NSMutableArray *)v5;

  v7 = objc_alloc_init(VCPSegment);
  activeSegment = v2->_activeSegment;
  v2->_activeSegment = v7;

  *(_WORD *)&v2->_firstFrame = 1;
  v2->_postProcessStart = 0;
  v9 = v2;
LABEL_9:
  v11 = v9;

  return v11;
}

- (void)dealloc
{
  activeHinkleyDetector = self->_activeHinkleyDetector;
  if (activeHinkleyDetector)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)activeHinkleyDetector);
    MEMORY[0x1C186C7D0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPActionAnalyzer;
  [(VCPActionAnalyzer *)&v4 dealloc];
}

- (int)analyzeFrameWithTimeRange:(id *)a3 andActionScore:(float)a4
{
  if (self->_firstFrame)
  {
    activeSegment = self->_activeSegment;
    long long v8 = *(_OWORD *)&a3->var0.var3;
    v27[0] = *(_OWORD *)&a3->var0.var0;
    v27[1] = v8;
    long long v28 = *(_OWORD *)&a3->var1.var1;
    BOOL v9 = [(VCPActionAnalyzer *)self isScoreValid:COERCE_DOUBLE(__PAIR64__(DWORD1(v28), LODWORD(a4)))];
    *(float *)&double v10 = a4;
    [(VCPSegment *)activeSegment updateWithFirstFrame:v27 score:v9 valid:v10];
    self->_firstFrame = 0;
  }
  else if ([(VCPActionAnalyzer *)self isScoreValid:*(double *)&a4] {
         && (*(float *)&double v11 = a4,
  }
             [(VCPActionAnalyzer *)self decideSegmentPointUsingHinkleyDetector:v11]))
  {
    v12 = self->_activeSegment;
    long long v25 = *(_OWORD *)&a3->var0.var0;
    int64_t var3 = a3->var0.var3;
    [(VCPSegment *)v12 updateDuration:&v25];
    [(NSMutableArray *)self->_internalResults addObject:self->_activeSegment];
    v13 = [VCPSegment alloc];
    long long v23 = *(_OWORD *)&a3->var0.var0;
    int64_t v24 = a3->var0.var3;
    objc_super v14 = [(VCPSegment *)v13 initWithTimestamp:&v23 score:1 valid:COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(a4)))];
    v15 = self->_activeSegment;
    self->_activeSegment = v14;
  }
  else
  {
    v16 = self->_activeSegment;
    long long v17 = *(_OWORD *)&a3->var0.var3;
    v22[0] = *(_OWORD *)&a3->var0.var0;
    v22[1] = v17;
    long long v18 = *(_OWORD *)&a3->var1.var1;
    *(float *)&long long v18 = a4;
    BOOL v19 = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:", *(double *)&v18, v22[0], v17, *(void *)&a3->var1.var1, a3->var1.var3);
    *(float *)&double v20 = a4;
    [(VCPSegment *)v16 updateSegment:v22 score:v19 valid:v20];
  }
  return 0;
}

- (void)updateActiveThreshold
{
  self->_float activeThreshold = 0.2;
  if ([(NSMutableArray *)self->_internalResults count])
  {
    unint64_t v3 = 0;
    float v4 = 0.0;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v3];
      [v5 score];
      if (v6 > v4)
      {
        [v5 score];
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
  float activeThreshold = self->_activeThreshold;
  if (v4 > activeThreshold) {
    self->_float activeThreshold = (float)(v4 + activeThreshold) * 0.5;
  }
}

- (BOOL)isActive:(float)a3
{
  return self->_activeThreshold < a3;
}

- (BOOL)isScoreValid:(float)a3
{
  return a3 >= 0.0;
}

- (BOOL)decideSegmentPointBasedOnActionScore:(float)a3
{
  unint64_t v5 = [(VCPSegment *)self->_activeSegment numOfFrames];
  if (v5)
  {
    *(float *)&double v6 = a3;
    LODWORD(v5) = [(VCPActionAnalyzer *)self isScoreValid:v6];
    if (v5)
    {
      [(VCPSegment *)self->_activeSegment score];
      BOOL v7 = -[VCPActionAnalyzer isActive:](self, "isActive:");
      *(float *)&double v8 = a3;
      LOBYTE(v5) = v7 ^ [(VCPActionAnalyzer *)self isActive:v8];
    }
  }
  return v5;
}

- (BOOL)decideSegmentPointUsingHinkleyDetector:(float)a3
{
  float v11 = a3;
  if ([(VCPSegment *)self->_activeSegment numOfValidFrames]
    && (activeHinkleyDetector = self->_activeHinkleyDetector,
        activeHinkleyDetector->min_length_ < (int)[(VCPSegment *)self->_activeSegment numOfFrames])
    && (unint64_t v5 = self->_activeHinkleyDetector,
        [(VCPSegment *)self->_activeSegment sumOfScore],
        float v10 = v6,
        ma::HinkleyDetector::Test((ma::HinkleyDetector *)v5, &v10, &v11, [(VCPSegment *)self->_activeSegment numOfValidFrames] + 1)))
  {
    BOOL v7 = 1;
  }
  else
  {
    unint64_t v8 = [(VCPSegment *)self->_activeSegment numOfValidFrames];
    BOOL v7 = 0;
    BOOL result = 0;
    if (v8) {
      return result;
    }
  }
  ma::HinkleyDetector::ResetStats((ma::HinkleyDetector *)self->_activeHinkleyDetector);
  return v7;
}

- (int)mergeConsecutiveShortSegments
{
  int postProcessStart = self->_postProcessStart;
  if (postProcessStart < (int)([(NSMutableArray *)self->_internalResults count] - 1))
  {
    do
    {
      float v4 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:postProcessStart];
      signed int v5 = postProcessStart + 1;
      if ([v4 isContentTooShort])
      {
        uint64_t v6 = 0;
        int v7 = postProcessStart;
        while ([(NSMutableArray *)self->_internalResults count] > (unint64_t)(v5 + v6))
        {
          unint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:");
          int v9 = [v8 isContentTooShort];

          if (!v9) {
            break;
          }
          ++v6;
          ++postProcessStart;
        }
        while (v7 < postProcessStart)
        {
          float v10 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v5];
          [v4 mergeSegment:v10];

          --postProcessStart;
          [(NSMutableArray *)self->_internalResults removeObjectAtIndex:v5];
        }
        signed int v5 = postProcessStart + 1;
      }

      int postProcessStart = v5;
    }
    while (v5 < (int)([(NSMutableArray *)self->_internalResults count] - 1));
  }
  [(VCPActionAnalyzer *)self updateActiveThreshold];
  [(VCPActionAnalyzer *)self mergeSameTypeSegments];
  return 0;
}

- (int)mergeSameTypeSegments
{
  uint64_t postProcessStart = self->_postProcessStart;
  if ((int)[(NSMutableArray *)self->_internalResults count] >= 2)
  {
    do
    {
      uint64_t v4 = (postProcessStart + 1);
      if ([(NSMutableArray *)self->_internalResults count] <= (unint64_t)(int)v4) {
        break;
      }
      signed int v5 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:(int)postProcessStart];
      uint64_t v6 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:(int)v4];
      [v6 score];
      BOOL v7 = -[VCPActionAnalyzer isActive:](self, "isActive:");
      [v5 score];
      if (v7 == -[VCPActionAnalyzer isActive:](self, "isActive:"))
      {
        [v6 mergeSegment:v5];
        [(NSMutableArray *)self->_internalResults removeObjectAtIndex:(int)postProcessStart];
        uint64_t v4 = postProcessStart;
      }

      uint64_t postProcessStart = v4;
    }
    while ((int)[(NSMutableArray *)self->_internalResults count] > 1);
  }
  return 0;
}

- (int)mergeSparseShortSegments
{
  [(NSMutableArray *)self->_internalResults count];
  int postProcessStart = self->_postProcessStart;
  uint64_t v4 = (postProcessStart + 1);
  int v5 = [(NSMutableArray *)self->_internalResults count];
  if (v5 >= 3 && (int)v4 < v5 - 1)
  {
    do
    {
      unint64_t v8 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:postProcessStart];
      int v9 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:(int)v4];
      uint64_t v10 = (v4 + 1);
      float v11 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:(int)v10];
      if (([v8 isContentTooShort] & 1) != 0
        || ![v9 isContentTooShort]
        || ([v11 isContentTooShort] & 1) != 0)
      {
        int postProcessStart = v4;
      }
      else
      {
        [v9 mergeSegment:v11];
        [(NSMutableArray *)self->_internalResults removeObjectAtIndex:(int)v10];
        uint64_t v10 = v4;
      }
      int v12 = [(NSMutableArray *)self->_internalResults count];

      if (v12 < 3) {
        break;
      }
      uint64_t v4 = v10;
    }
    while ((int)v10 < v12 - 1);
  }
  [(VCPActionAnalyzer *)self mergeSameTypeSegments];
  return 0;
}

- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4
{
  if (self->_verbose)
  {
    CMTime time = *(CMTime *)a3;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime v14 = (CMTime)*a4;
    Float64 v8 = CMTimeGetSeconds(&v14);
    printf("Destructive Trim Range: [%.2f - %.2f]\n", Seconds, v8);
  }
  [(NSMutableArray *)self->_internalResults addObject:self->_activeSegment];
  [(VCPActionAnalyzer *)self printSegments:@"start"];
  long long v12 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v10 = *(_OWORD *)&a4->var0;
  int64_t v11 = a4->var3;
  [(VCPActionAnalyzer *)self prepareTrimmingWithTrimStart:&v12 andTrimEnd:&v10];
  [(VCPActionAnalyzer *)self printSegments:@"after repare"];
  [(VCPActionAnalyzer *)self mergeConsecutiveShortSegments];
  [(VCPActionAnalyzer *)self printSegments:@"after consecutive short merge"];
  [(VCPActionAnalyzer *)self mergeSparseShortSegments];
  [(VCPActionAnalyzer *)self printSegments:@"after sparse short merge"];
  return 0;
}

- (int)postProcessSegmentsWithCaptureTime:(id *)a3 trimStart:(id *)a4
{
  activeSegment = self->_activeSegment;
  if (activeSegment) {
    [(VCPSegment *)activeSegment timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTime time = (CMTime)*a3;
  if (CMTimeRangeContainsTime(&range, &time))
  {
    [(NSMutableArray *)self->_internalResults addObject:self->_activeSegment];
    Float64 v8 = [VCPSegment alloc];
    int v9 = self->_activeSegment;
    if (v9) {
      [(VCPSegment *)v9 timeRange];
    }
    else {
      memset(&v23, 0, sizeof(v23));
    }
    CMTimeRangeGetEnd(&v24, &v23);
    [(VCPSegment *)self->_activeSegment score];
    int v11 = v10;
    [(VCPSegment *)self->_activeSegment score];
    BOOL v12 = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:");
    LODWORD(v13) = v11;
    CMTime v14 = [(VCPSegment *)v8 initWithTimestamp:&v24 score:v12 valid:v13];
    v15 = self->_activeSegment;
    self->_activeSegment = v14;
  }
  if ([(NSMutableArray *)self->_internalResults count])
  {
    v16 = [(NSMutableArray *)self->_internalResults lastObject];
    long long v17 = v16;
    long long v21 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    if (v16) {
      [v16 timeRange];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CMTimeRangeGetEnd(&v20, &v19);
    [(VCPActionAnalyzer *)self prepareTrimmingWithTrimStart:&v21 andTrimEnd:&v20];
    [(VCPActionAnalyzer *)self mergeConsecutiveShortSegments];
    [(VCPActionAnalyzer *)self mergeSparseShortSegments];
    [(VCPActionAnalyzer *)self printSegments:@"after post processing"];
    self->_int postProcessStart = [(NSMutableArray *)self->_internalResults count] - 1;
  }
  return 0;
}

- (id)segments
{
  return self->_internalResults;
}

- (id)activeSegment
{
  return self->_activeSegment;
}

- (void)printSegments:(id)a3
{
  id v4 = a3;
  if (self->_verbose)
  {
    id v5 = v4;
    printf("=========Segment %s==========\n", (const char *)[v4 UTF8String]);
    [(NSMutableArray *)self->_internalResults enumerateObjectsUsingBlock:&__block_literal_global_73];
    id v4 = v5;
  }
}

void __35__VCPActionAnalyzer_printSegments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 timeRange];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  *(_OWORD *)&time.value = v9;
  time.epoch = v10;
  double Seconds = CMTimeGetSeconds(&time);
  if (v3) {
    [v3 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v8, &range);
  double v5 = CMTimeGetSeconds(&v8);
  [v3 score];
  printf(" [%.2f - %.2f]: %.2f\n", Seconds, v5, v6);
}

- (int)prepareTrimmingWithTrimStart:(id *)a3 andTrimEnd:(id *)a4
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v37 = [(NSMutableArray *)self->_internalResults count] - 1;
  internalResults = self->_internalResults;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__VCPActionAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke;
  v31[3] = &unk_1E629BF20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v32 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v33 = *a4;
  v31[4] = &v38;
  v31[5] = &v34;
  [(NSMutableArray *)internalResults enumerateObjectsUsingBlock:v31];
  for (unint64_t i = (int)[(NSMutableArray *)self->_internalResults count] - 1; ; unint64_t i = v10)
  {
    long long v9 = self->_internalResults;
    if (v35[3] >= i) {
      break;
    }
    unint64_t v10 = i - 1;
    -[NSMutableArray removeObjectAtIndex:](v9, "removeObjectAtIndex:");
  }
  long long v11 = -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:");
  long long v29 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [v11 trimSegment:&v29 fromStart:0];

  for (uint64_t j = *((unsigned int *)v39 + 6);
        (int)j >= 1;
        [(NSMutableArray *)self->_internalResults removeObjectAtIndex:j])
  {
    --j;
  }
  double v13 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
  long long v27 = *(_OWORD *)&a3->var0;
  int64_t v28 = a3->var3;
  [v13 trimSegment:&v27 fromStart:1];

  if (self->_verbose)
  {
    CMTime v14 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:0];
    v15 = v14;
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
    long long v17 = [(NSMutableArray *)self->_internalResults lastObject];
    long long v18 = v17;
    if (v17) {
      [v17 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRangeGetEnd(&v22, &range);
    Float64 v19 = CMTimeGetSeconds(&v22);
    printf("--[%.2f - %.2f]\n", Seconds, v19);
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return 0;
}

void __61__VCPActionAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  float v6 = v5;
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
    memset(&v8, 0, sizeof(v8));
  }
  CMTime v7 = *(CMTime *)(a1 + 72);
  if (CMTimeRangeContainsTime(&v8, &v7)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSegment, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
}

@end