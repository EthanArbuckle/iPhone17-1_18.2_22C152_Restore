@interface VCPSceneChangeAnalyzer
- (BOOL)decideLensSwitchPoint:(void *)a3;
- (BOOL)isSegmentPoint;
- (VCPSceneChangeAnalyzer)init;
- (id).cxx_construct;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)finalizeAnalysisPass:(id *)a3;
- (void)ComputeSceneDelta:(void *)a3;
- (void)PrintSegments;
@end

@implementation VCPSceneChangeAnalyzer

- (VCPSceneChangeAnalyzer)init
{
  v11.receiver = self;
  v11.super_class = (Class)VCPSceneChangeAnalyzer;
  v2 = [(VCPSceneChangeAnalyzer *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(VCPSceneChangeSegment);
    v4 = (void *)*((void *)v2 + 1792);
    *((void *)v2 + 1792) = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = (void *)*((void *)v2 + 1793);
    *((void *)v2 + 1793) = v5;

    v2[14352] = 1;
    v2[14353] = 1;
    long long v7 = *MEMORY[0x1E4F1FA30];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    *(_OWORD *)(v2 + 14372) = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)(v2 + 14388) = v8;
    *(_OWORD *)(v2 + 14356) = v7;
    v2[14404] = 0;
    v2[14405] = 0;
    *((void *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    v9 = v2;
  }

  return (VCPSceneChangeAnalyzer *)v2;
}

- (void)ComputeSceneDelta:(void *)a3
{
  unsigned int v3 = *(_DWORD *)a3;
  unsigned int v4 = *(_DWORD *)a3 - 3;
  if (*(int *)a3 >= 3)
  {
    if (v3 <= 0xC) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 10;
    }
    uint64_t v8 = ma::FrameBuffer::Get((ma::FrameBuffer *)&self->_frameBuffer, v3 - 2);
    float v9 = ma::Histogram::EarthMoverDistance((ma::Histogram *)((char *)a3 + 360), (const ma::Histogram *)(v8 + 360));
    if (v7)
    {
      sceneDeltaBuffer = self->_sceneDeltaBuffer;
      float v11 = 0.0;
      uint64_t v12 = v7;
      do
      {
        float v13 = *sceneDeltaBuffer++;
        float v11 = v11 + v13;
        --v12;
      }
      while (v12);
      float v14 = fmaxf(v9 - (float)(v11 / (float)(int)v7), 0.0) / (float)((float)(v11 / (float)(int)v7) + 0.000001);
    }
    else
    {
      float v14 = 0.0;
    }
    self->_sceneDeltaBuffer[v4 % 0xA] = v9;
    *((float *)a3 + 75) = v9;
    *((float *)a3 + 76) = v14;
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  CMTime start = *(CMTime *)a4;
  CMTime duration = *(CMTime *)a5;
  CMTimeRangeMake(&v42, &start, &duration);
  long long v10 = *(_OWORD *)&v42.start.epoch;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[5] = *(_OWORD *)&v42.start.value;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.confidence_[3] = v10;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.action_score_ = *(_OWORD *)&v42.duration.timescale;
  Next = ma::FrameBuffer::GetNext((ma::FrameBuffer *)&self->_frameBuffer);
  CMTime v39 = *(CMTime *)a4;
  CMTime v38 = *(CMTime *)a5;
  *(void *)&double v12 = ma::Frame::Initialize((ma::Frame *)Next, &v39, &v38, a3, 1).n128_u64[0];
  int v14 = v13;
  if (!v13)
  {
    if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]))
    {
      v15 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
      long long v36 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      [v15 resetSegment:&v36];
      BYTE1(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]) = 0;
      *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 0;
    }
    else
    {
      -[VCPSceneChangeAnalyzer ComputeSceneDelta:](self, "ComputeSceneDelta:", Next, v12);
      if ([(VCPSceneChangeAnalyzer *)self decideLensSwitchPoint:Next])
      {
        *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 1;
        v16 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        long long v34 = *(_OWORD *)&a4->var0;
        int64_t v35 = a4->var3;
        [v16 finalizeAtTime:&v34];
        v17 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
        v44[0] = @"start";
        v18 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        if (v18) {
          [v18 timeRange];
        }
        else {
          memset(&v42, 0, sizeof(v42));
        }
        time[0] = v42.start;
        CFDictionaryRef v20 = CMTimeCopyAsDictionary(time, 0);
        v45[0] = v20;
        v44[1] = @"duration";
        v21 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        if (v21) {
          [v21 timeRange];
        }
        else {
          memset(time, 0, sizeof(time));
        }
        CMTime v43 = time[1];
        CFDictionaryRef v22 = CMTimeCopyAsDictionary(&v43, 0);
        v45[1] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
        [v17 addObject:v23];

        v24 = objc_alloc_init(VCPSceneChangeSegment);
        p_motion_result = &self->_frameBuffer.buffer_[34].motion_result_;
        v26 = *(void **)p_motion_result->significant_values_;
        *(void *)p_motion_result->significant_values_ = v24;

        v27 = *(void **)p_motion_result->significant_values_;
        long long v31 = *(_OWORD *)&a4->var0;
        int64_t v32 = a4->var3;
        [v27 resetSegment:&v31];
      }
      else
      {
        *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 0;
        v19 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        long long v29 = *(_OWORD *)&a4->var0;
        int64_t v30 = a4->var3;
        [v19 updateSegment:&v29];
      }
    }
  }
  return v14;
}

- (void)PrintSegments
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]))
  {
    printf("===========SceneChangeSegments=============");
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v3);
          }
          CFDictionaryRef v7 = *(const __CFDictionary **)(*((void *)&v14 + 1) + 8 * i);
          memset(&v13, 0, sizeof(v13));
          CMTimeRangeMakeFromDictionary(&v13, v7);
          CMTime time = v13.start;
          double Seconds = CMTimeGetSeconds(&time);
          CMTimeRange range = v13;
          CMTimeRangeGetEnd(&v11, &range);
          Float64 v9 = CMTimeGetSeconds(&v11);
          printf("[%f, %f]", Seconds, v9);
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)decideLensSwitchPoint:(void *)a3
{
  float v4 = *((float *)a3 + 76);
  BOOL v5 = !self->_frameBuffer.buffer_[34].motion_result_.is_stable_;
  if (!self->_frameBuffer.buffer_[34].motion_result_.is_stable_)
  {
    if (v4 > 6.8 && *((float *)a3 + 75) > 3.5)
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 >= 1.0) {
    return 0;
  }
  unint64_t v6 = [*(id *)self->_frameBuffer.buffer_[34].motion_result_.significant_values_ numOfFrames];
  BOOL v7 = 0;
  BOOL result = 0;
  if (v6 >= 4)
  {
LABEL_11:
    self->_frameBuffer.buffer_[34].motion_result_.is_stable_ = v7;
    return v5;
  }
  return result;
}

- (int)finalizeAnalysisPass:(id *)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  p_motion_BOOL result = (id *)&self->_frameBuffer.buffer_[34].motion_result_;
  BOOL v5 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
  long long v6 = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.confidence_[3];
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[5];
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.action_score_;
  CMTimeRangeGetEnd(&v18, &range);
  [v5 finalizeAtTime:&v18];
  BOOL v7 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
  v20[0] = @"start";
  if (*p_motion_result)
  {
    [*p_motion_result timeRange];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  *(_OWORD *)&v13[0].value = v14;
  v13[0].epoch = v15;
  CFDictionaryRef v8 = CMTimeCopyAsDictionary(v13, 0);
  v21[0] = v8;
  v20[1] = @"duration";
  Float64 v9 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
  if (v9) {
    [v9 timeRange];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  CMTime time = v13[1];
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, 0);
  v21[1] = v10;
  CMTime v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v7 addObject:v11];

  [(VCPSceneChangeAnalyzer *)self PrintSegments];
  return 0;
}

- (id)results
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[*(id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2] count];
  if (v3)
  {
    uint64_t v4 = *(void *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
    long long v6 = @"SceneChangeResults";
    v7[0] = v4;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (BOOL)isSegmentPoint
{
  return *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_, 0);
  id v3 = &self->_frameBuffer.buffer_[33].motion_result_.motion_param_diff_.__elems_[3];
  uint64_t v4 = -14280;
  do
  {
    ma::Histogram::~Histogram((ma::Histogram *)(v3 + 58));
    ma::MotionResult::~MotionResult((ma::MotionResult *)v3);
    v3 -= 102;
    v4 += 408;
  }
  while (v4);
}

- (id).cxx_construct
{
  return self;
}

@end