@interface ADPCEDisparityColorExecutorParameters
- (ADPCEDisparityColorPipelineParameters)pipelineParameters;
- (BOOL)disparityPostprocessingActive;
- (BOOL)disparityPreprocessingActive;
- (BOOL)temporalConsistencyActive;
- (id)initForInputSource:(unint64_t)a3;
- (id)initForPipelineParameters:(id)a3 inputSource:(unint64_t)a4;
- (int64_t)disparityRotation;
- (unsigned)disparityInvalidValue;
- (void)setDisparityInvalidValue:(unsigned __int16)a3;
- (void)setDisparityPostprocessingActive:(BOOL)a3;
- (void)setDisparityPreprocessingActive:(BOOL)a3;
- (void)setDisparityRotation:(int64_t)a3;
- (void)setTemporalConsistencyActive:(BOOL)a3;
@end

@implementation ADPCEDisparityColorExecutorParameters

- (void).cxx_destruct
{
}

- (void)setDisparityInvalidValue:(unsigned __int16)a3
{
  self->_disparityInvalidValue = a3;
}

- (unsigned)disparityInvalidValue
{
  return self->_disparityInvalidValue;
}

- (void)setDisparityRotation:(int64_t)a3
{
  self->_disparityRotation = a3;
}

- (int64_t)disparityRotation
{
  return self->_disparityRotation;
}

- (void)setDisparityPostprocessingActive:(BOOL)a3
{
  self->_disparityPostprocessingActive = a3;
}

- (BOOL)disparityPostprocessingActive
{
  return self->_disparityPostprocessingActive;
}

- (void)setDisparityPreprocessingActive:(BOOL)a3
{
  self->_disparityPreprocessingActive = a3;
}

- (BOOL)disparityPreprocessingActive
{
  return self->_disparityPreprocessingActive;
}

- (void)setTemporalConsistencyActive:(BOOL)a3
{
  self->_temporalConsistencyActive = a3;
}

- (BOOL)temporalConsistencyActive
{
  return self->_temporalConsistencyActive;
}

- (ADPCEDisparityColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForInputSource:(unint64_t)a3
{
  v5 = objc_opt_new();
  id v6 = [(ADPCEDisparityColorExecutorParameters *)self initForPipelineParameters:v5 inputSource:a3];

  return v6;
}

- (id)initForPipelineParameters:(id)a3 inputSource:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADPCEDisparityColorExecutorParameters;
  v8 = [(ADExecutorParameters *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pipelineParameters, a3);
    v9->_temporalConsistencyActive = 1;
    v9->_disparityPreprocessingActive = 1;
    v9->_disparityPostprocessingActive = 1;
    v9->_disparityRotation = a4 == 2;
    v9->_disparityInvalidValue = 0x1FFF;
  }

  return v9;
}

@end