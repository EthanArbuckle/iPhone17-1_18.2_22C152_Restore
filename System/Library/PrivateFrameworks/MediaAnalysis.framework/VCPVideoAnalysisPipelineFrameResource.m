@interface VCPVideoAnalysisPipelineFrameResource
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)predictedTimeRange;
- (NSDictionary)actionAnalysisResults;
- (NSDictionary)fullAnalysisResults;
- (NSDictionary)sceneAnalysisResults;
- (VCPFrameAnalysisStats)frameStats;
- (VCPVideoAnalysisPipelineFrameResource)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (opaqueCMSampleBuffer)frameSampleBuffer;
- (unint64_t)frameFlags;
- (void)dealloc;
- (void)setActionAnalysisResults:(id)a3;
- (void)setFrameFlags:(unint64_t)a3;
- (void)setFrameSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setFrameStats:(id)a3;
- (void)setFullAnalysisResults:(id)a3;
- (void)setPredictedTimeRange:(id *)a3;
- (void)setSceneAnalysisResults:(id)a3;
@end

@implementation VCPVideoAnalysisPipelineFrameResource

- (VCPVideoAnalysisPipelineFrameResource)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VCPVideoAnalysisPipelineFrameResource;
  v4 = [(VCPVideoAnalysisPipelineFrameResource *)&v15 init];
  v5 = (VCPVideoAnalysisPipelineFrameResource *)v4;
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    uint64_t v6 = MEMORY[0x1E4F1FA20];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)(v4 + 56) = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)(v4 + 72) = v7;
    *(_OWORD *)(v4 + 88) = *(_OWORD *)(v6 + 32);
    v8 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = 0;

    actionAnalysisResults = v5->_actionAnalysisResults;
    v5->_actionAnalysisResults = 0;

    fullAnalysisResults = v5->_fullAnalysisResults;
    v5->_fullAnalysisResults = 0;

    v5->_frameFlags = 0;
    v11 = objc_alloc_init(VCPFrameAnalysisStats);
    frameStats = v5->_frameStats;
    v5->_frameStats = v11;

    v13 = v5;
  }

  return v5;
}

- (void)dealloc
{
  frameSampleBuffer = self->_frameSampleBuffer;
  if (frameSampleBuffer)
  {
    CFRelease(frameSampleBuffer);
    self->_frameSampleBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoAnalysisPipelineFrameResource;
  [(VCPVideoAnalysisPipelineFrameResource *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)frameSampleBuffer
{
  return self->_frameSampleBuffer;
}

- (void)setFrameSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_frameSampleBuffer = a3;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)predictedTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void)setPredictedTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_predictedTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_predictedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_predictedTimeRange.start.value = v3;
}

- (VCPFrameAnalysisStats)frameStats
{
  return self->_frameStats;
}

- (void)setFrameStats:(id)a3
{
}

- (NSDictionary)sceneAnalysisResults
{
  return self->_sceneAnalysisResults;
}

- (void)setSceneAnalysisResults:(id)a3
{
}

- (NSDictionary)actionAnalysisResults
{
  return self->_actionAnalysisResults;
}

- (void)setActionAnalysisResults:(id)a3
{
}

- (NSDictionary)fullAnalysisResults
{
  return self->_fullAnalysisResults;
}

- (void)setFullAnalysisResults:(id)a3
{
}

- (unint64_t)frameFlags
{
  return self->_frameFlags;
}

- (void)setFrameFlags:(unint64_t)a3
{
  self->_frameFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullAnalysisResults, 0);
  objc_storeStrong((id *)&self->_actionAnalysisResults, 0);
  objc_storeStrong((id *)&self->_sceneAnalysisResults, 0);
  objc_storeStrong((id *)&self->_frameStats, 0);
}

@end