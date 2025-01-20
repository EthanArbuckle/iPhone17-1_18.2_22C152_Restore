@interface VCPVideoMetaMotionAnalyzer
- (BOOL)decideSegmentPointBasedOn:(float)a3;
- (NSArray)results;
- (VCPVideoMetaMotionAnalyzer)init;
- (id).cxx_construct;
- (int)finalizeAnalysis;
- (int)processFrameMetadata:(id)a3;
- (void)mergeSimilarSegments;
@end

@implementation VCPVideoMetaMotionAnalyzer

- (VCPVideoMetaMotionAnalyzer)init
{
  v14.receiver = self;
  v14.super_class = (Class)VCPVideoMetaMotionAnalyzer;
  v2 = [(VCPVideoMetaMotionAnalyzer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    internalResults = v2->_internalResults;
    v2->_internalResults = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    mutableResults = v2->_mutableResults;
    v2->_mutableResults = (NSMutableArray *)v5;

    v7 = objc_alloc_init(VCPVideoMetaMotionSegment);
    activeSegment = v2->_activeSegment;
    v2->_activeSegment = v7;

    v9 = v2->_mutableResults;
    if (v9)
    {
      v9 = v2->_internalResults;
      if (v9)
      {
        v9 = v2->_activeSegment;
        if (v9)
        {
          ma::HinkleyDetector::Initialize((uint64_t)&v2->_hinkleyDetector, 0.03, 0.1, 10);
          uint64_t v10 = MEMORY[0x1E4F1FA30];
          long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
          *(_OWORD *)&v2->_frameTimeRange.start.value = *MEMORY[0x1E4F1FA30];
          *(_OWORD *)&v2->_frameTimeRange.start.epoch = v11;
          *(_OWORD *)&v2->_frameTimeRange.duration.timescale = *(_OWORD *)(v10 + 32);
          v9 = v2;
        }
      }
    }
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)decideSegmentPointBasedOn:(float)a3
{
  float v11 = a3;
  int v4 = [(VCPMetaSegment *)self->_activeSegment numOfFrames] + 1;
  p_hinkleyDetector = &self->_hinkleyDetector;
  if (self->_hinkleyDetector.min_length_ < v4
    && ([(VCPVideoMetaMotionSegment *)self->_activeSegment stabilityScore],
        float v10 = v6,
        ma::HinkleyDetector::Test((ma::HinkleyDetector *)&self->_hinkleyDetector, &v10, &v11, v4)))
  {
    BOOL v7 = 1;
  }
  else
  {
    unint64_t v8 = [(VCPMetaSegment *)self->_activeSegment numOfFrames];
    BOOL v7 = 0;
    BOOL result = 0;
    if (v8) {
      return result;
    }
  }
  ma::HinkleyDetector::ResetStats((ma::HinkleyDetector *)p_hinkleyDetector);
  return v7;
}

- (int)processFrameMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"privECMVct"];
  float v6 = v5;
  if (v5)
  {
    NSPoint v7 = NSPointFromString(v5);
    double x = v7.x;
    double y = v7.y;
  }
  else
  {
    double x = *MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  CMTimeRangeMakeFromDictionary(&v32, (CFDictionaryRef)v4);
  long long v10 = *(_OWORD *)&v32.start.epoch;
  *(_OWORD *)&self->_frameTimeRange.start.value = *(_OWORD *)&v32.start.value;
  *(_OWORD *)&self->_frameTimeRange.start.int64_t epoch = v10;
  *(_OWORD *)&self->_frameTimeRange.duration.timescale = *(_OWORD *)&v32.duration.timescale;
  uint64_t v11 = [(NSMutableArray *)self->_internalResults count];
  float v12 = x;
  float v13 = y;
  float v14 = fabsf(v12) + fabsf(v13);
  p_frameTimeRange = &self->_frameTimeRange;
  if (v11 || [(VCPMetaSegment *)self->_activeSegment numOfFrames])
  {
    *(float *)&double v16 = expf(v14 * -0.1);
    BOOL v17 = [(VCPVideoMetaMotionAnalyzer *)self decideSegmentPointBasedOn:v16];
    activeSegment = self->_activeSegment;
    if (v17)
    {
      long long v28 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t epoch = self->_frameTimeRange.start.epoch;
      [(VCPVideoMetaMotionSegment *)activeSegment finalizeAtTime:&v28];
      [(NSMutableArray *)self->_internalResults addObject:self->_activeSegment];
      v19 = [VCPVideoMetaMotionSegment alloc];
      long long v26 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t v27 = self->_frameTimeRange.start.epoch;
      v20 = [(VCPVideoMetaMotionSegment *)v19 initWithAbsMotion:&v26 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v26), LODWORD(v14)))];
      v21 = self->_activeSegment;
      self->_activeSegment = v20;
    }
    else
    {
      long long v24 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t v25 = self->_frameTimeRange.start.epoch;
      [(VCPVideoMetaMotionSegment *)activeSegment updateSegment:&v24 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v24), LODWORD(v14)))];
    }
  }
  else
  {
    v22 = self->_activeSegment;
    long long v30 = *(_OWORD *)&p_frameTimeRange->start.value;
    int64_t v31 = self->_frameTimeRange.start.epoch;
    [(VCPVideoMetaMotionSegment *)v22 resetSegment:&v30 atTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v30), LODWORD(v14)))];
  }

  return 0;
}

- (void)mergeSimilarSegments
{
  if ((unint64_t)[(NSMutableArray *)self->_internalResults count] >= 2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = v3 + 1;
      if ([(NSMutableArray *)self->_internalResults count] <= (unint64_t)(v3 + 1)) {
        break;
      }
      uint64_t v5 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v3];
      float v6 = [(NSMutableArray *)self->_internalResults objectAtIndexedSubscript:v3 + 1];
      [v5 stabilityScore];
      float v8 = v7;
      [v6 stabilityScore];
      if (vabds_f32(v8, v9) <= 0.15)
      {
        [v6 mergeSegment:v5];
        [(NSMutableArray *)self->_internalResults removeObject:v5];
        uint64_t v4 = v3;
      }

      uint64_t v3 = v4;
    }
    while ((unint64_t)[(NSMutableArray *)self->_internalResults count] > 1);
  }
}

- (int)finalizeAnalysis
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_activeSegment = &self->_activeSegment;
  activeSegment = self->_activeSegment;
  long long v4 = *(_OWORD *)&self->_frameTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_frameTimeRange.start.value;
  *(_OWORD *)&range.start.int64_t epoch = v4;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_frameTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v27, &range);
  [(VCPVideoMetaMotionSegment *)activeSegment finalizeAtTime:&v27];
  [(NSMutableArray *)self->_internalResults addObject:*p_activeSegment];
  [(VCPVideoMetaMotionAnalyzer *)self mergeSimilarSegments];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_internalResults;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v5)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        float v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        mutableResults = self->_mutableResults;
        v29[0] = @"start";
        if (v7)
        {
          [v7 timeRange];
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v19 = 0u;
        }
        *(_OWORD *)&time[0].value = v19;
        time[0].int64_t epoch = v20;
        CFDictionaryRef v9 = CMTimeCopyAsDictionary(time, 0);
        v30[0] = v9;
        v29[1] = @"duration";
        if (v7) {
          [v7 timeRange];
        }
        else {
          memset(time, 0, sizeof(time));
        }
        CMTime v28 = time[1];
        CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v28, 0);
        v30[1] = v10;
        v29[2] = @"quality";
        uint64_t v11 = NSNumber;
        [v7 absMotion];
        float v12 = objc_msgSend(v11, "numberWithFloat:");
        v30[2] = v12;
        float v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
        [(NSMutableArray *)mutableResults addObject:v13];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v5);
  }

  return 0;
}

- (NSArray)results
{
  return (NSArray *)self->_mutableResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_activeSegment, 0);
  ma::MotionFilter::~MotionFilter((ma::MotionFilter *)&self->_hinkleyDetector);
}

- (id).cxx_construct
{
  return self;
}

@end