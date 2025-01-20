@interface VCPVideoMetaFocusAnalyzer
- (NSArray)results;
- (VCPVideoMetaFocusAnalyzer)init;
- (int)finalizeAnalysis;
- (int)processFrameMetadata:(id)a3;
- (void)addSegmentToResults;
@end

@implementation VCPVideoMetaFocusAnalyzer

- (VCPVideoMetaFocusAnalyzer)init
{
  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaFocusAnalyzer;
  v2 = [(VCPVideoMetaFocusAnalyzer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = objc_alloc_init(VCPVideoMetaFocusSegment);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = (void *)*((void *)v2 + 2);
    if (v7)
    {
      v7 = (void *)*((void *)v2 + 1);
      if (v7)
      {
        long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F1FA30];
        *(_OWORD *)(v2 + 40) = v9;
        *(_OWORD *)(v2 + 56) = v8;
        v7 = v2;
      }
    }
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)processFrameMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"privAFSt"];
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 integerValue];
  }
  else {
    uint64_t v7 = 4;
  }
  CMTimeRangeMakeFromDictionary(&v25, (CFDictionaryRef)v4);
  long long v8 = *(_OWORD *)&v25.start.epoch;
  *(_OWORD *)&self->_frameTimeRange.start.value = *(_OWORD *)&v25.start.value;
  *(_OWORD *)&self->_frameTimeRange.start.int64_t epoch = v8;
  *(_OWORD *)&self->_frameTimeRange.duration.timescale = *(_OWORD *)&v25.duration.timescale;
  p_frameTimeRange = &self->_frameTimeRange;
  if ([(NSMutableArray *)self->_mutableResults count]
    || [(VCPMetaSegment *)self->_activeSegment numOfFrames])
  {
    int64_t v10 = [(VCPVideoMetaFocusSegment *)self->_activeSegment focusStatus];
    activeSegment = self->_activeSegment;
    if (v7 == v10)
    {
      long long v17 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t epoch = self->_frameTimeRange.start.epoch;
      [(VCPVideoMetaFocusSegment *)activeSegment updateSegment:v7 atTime:&v17];
    }
    else
    {
      long long v21 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t v22 = self->_frameTimeRange.start.epoch;
      [(VCPMetaSegment *)activeSegment finalizeAtTime:&v21];
      [(VCPVideoMetaFocusAnalyzer *)self addSegmentToResults];
      objc_super v12 = [VCPVideoMetaFocusSegment alloc];
      long long v19 = *(_OWORD *)&p_frameTimeRange->start.value;
      int64_t v20 = self->_frameTimeRange.start.epoch;
      v13 = [(VCPVideoMetaFocusSegment *)v12 initWithFocusStatus:v7 atTime:&v19];
      v14 = self->_activeSegment;
      self->_activeSegment = v13;
    }
  }
  else
  {
    v15 = self->_activeSegment;
    long long v23 = *(_OWORD *)&p_frameTimeRange->start.value;
    int64_t v24 = self->_frameTimeRange.start.epoch;
    [(VCPVideoMetaFocusSegment *)v15 resetSegment:v7 atTime:&v23];
  }

  return 0;
}

- (void)addSegmentToResults
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if ([(VCPVideoMetaFocusSegment *)self->_activeSegment focusStatus] == 4) {
    float v3 = 1.0;
  }
  else {
    float v3 = 0.0;
  }
  v17[0] = @"start";
  activeSegment = self->_activeSegment;
  mutableResults = self->_mutableResults;
  if (activeSegment)
  {
    [(VCPMetaSegment *)activeSegment timeRange];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  *(_OWORD *)&v12[0].value = v13;
  v12[0].int64_t epoch = v14;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(v12, 0);
  v18[0] = v6;
  v17[1] = @"duration";
  uint64_t v7 = self->_activeSegment;
  if (v7) {
    [(VCPMetaSegment *)v7 timeRange];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  CMTime time = v12[1];
  CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, 0);
  v18[1] = v8;
  v17[2] = @"quality";
  *(float *)&double v9 = v3;
  int64_t v10 = [NSNumber numberWithFloat:v9];
  v18[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  [(NSMutableArray *)mutableResults addObject:v11];
}

- (int)finalizeAnalysis
{
  activeSegment = self->_activeSegment;
  long long v4 = *(_OWORD *)&self->_frameTimeRange.start.epoch;
  *(_OWORD *)&v6.start.value = *(_OWORD *)&self->_frameTimeRange.start.value;
  *(_OWORD *)&v6.start.int64_t epoch = v4;
  *(_OWORD *)&v6.duration.timescale = *(_OWORD *)&self->_frameTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v7, &v6);
  [(VCPMetaSegment *)activeSegment finalizeAtTime:&v7];
  [(VCPVideoMetaFocusAnalyzer *)self addSegmentToResults];
  return 0;
}

- (NSArray)results
{
  return (NSArray *)self->_mutableResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_activeSegment, 0);
}

@end