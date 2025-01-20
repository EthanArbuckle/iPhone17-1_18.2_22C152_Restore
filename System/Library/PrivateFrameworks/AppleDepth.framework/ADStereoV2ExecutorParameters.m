@interface ADStereoV2ExecutorParameters
- (ADStereoV2PipelineParameters)pipelineParameters;
- (BOOL)temporalConsistencyActive;
- (float)temporalSmoothingCurrentFeaturesRatioMin;
- (float)temporalSmoothingPreviousFeaturesRatioMin;
- (id)initForDevice:(id)a3;
- (void)setTemporalConsistencyActive:(BOOL)a3;
- (void)setTemporalSmoothingCurrentFeaturesRatioMin:(float)a3;
- (void)setTemporalSmoothingPreviousFeaturesRatioMin:(float)a3;
@end

@implementation ADStereoV2ExecutorParameters

- (void).cxx_destruct
{
}

- (void)setTemporalSmoothingPreviousFeaturesRatioMin:(float)a3
{
  self->_temporalSmoothingPreviousFeaturesRatioMin = a3;
}

- (float)temporalSmoothingPreviousFeaturesRatioMin
{
  return self->_temporalSmoothingPreviousFeaturesRatioMin;
}

- (void)setTemporalSmoothingCurrentFeaturesRatioMin:(float)a3
{
  self->_temporalSmoothingCurrentFeaturesRatioMin = a3;
}

- (float)temporalSmoothingCurrentFeaturesRatioMin
{
  return self->_temporalSmoothingCurrentFeaturesRatioMin;
}

- (void)setTemporalConsistencyActive:(BOOL)a3
{
  self->_temporalConsistencyActive = a3;
}

- (BOOL)temporalConsistencyActive
{
  return self->_temporalConsistencyActive;
}

- (ADStereoV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADStereoV2ExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 initForDevice:v4];
  if (v5)
  {
    id v6 = [(ADPipelineParameters *)[ADStereoV2PipelineParameters alloc] initForDevice:v4];
    v7 = (void *)v5[8];
    v5[8] = v6;

    *((unsigned char *)v5 + 48) = 1;
    *((_DWORD *)v5 + 13) = 1058642330;
    *((_DWORD *)v5 + 14) = 0;
  }

  return v5;
}

@end