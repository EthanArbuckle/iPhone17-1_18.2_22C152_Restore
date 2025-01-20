@interface ADPCEDisparityColorPipelineParameters
- (ADPCEDisparityColorPipelineParameters)init;
- (float)disparityScaleForModelZoom;
- (float)maxDisparity;
- (float)minDisparity;
- (float)outputDisparityBias;
- (float)pceBias;
- (unint64_t)trainingWidth;
- (void)setDisparityScaleForModelZoom:(float)a3;
- (void)setMaxDisparity:(float)a3;
- (void)setMinDisparity:(float)a3;
- (void)setOutputDisparityBias:(float)a3;
- (void)setPceBias:(float)a3;
- (void)setTrainingWidth:(unint64_t)a3;
@end

@implementation ADPCEDisparityColorPipelineParameters

- (float)pceBias
{
  return self->_pceBias;
}

- (unint64_t)trainingWidth
{
  return self->_trainingWidth;
}

- (float)outputDisparityBias
{
  return self->_outputDisparityBias;
}

- (float)disparityScaleForModelZoom
{
  return self->_disparityScaleForModelZoom;
}

- (void)setTrainingWidth:(unint64_t)a3
{
  self->_trainingWidth = a3;
}

- (void)setPceBias:(float)a3
{
  self->_pceBias = a3;
}

- (void)setOutputDisparityBias:(float)a3
{
  self->_outputDisparityBias = a3;
}

- (void)setDisparityScaleForModelZoom:(float)a3
{
  self->_disparityScaleForModelZoom = a3;
}

- (ADPCEDisparityColorPipelineParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADPCEDisparityColorPipelineParameters;
  result = [(ADPipelineParameters *)&v3 init];
  if (result)
  {
    result->_minDisparity = 0.03;
    result->_maxDisparity = 3.4028e38;
    result->_pceBias = NAN;
    result->_outputDisparityBias = NAN;
    result->_trainingWidth = -1;
    result->_disparityScaleForModelZoom = NAN;
  }
  return result;
}

- (void)setMaxDisparity:(float)a3
{
  self->_maxDisparity = a3;
}

- (float)maxDisparity
{
  return self->_maxDisparity;
}

- (void)setMinDisparity:(float)a3
{
  self->_minDisparity = a3;
}

- (float)minDisparity
{
  return self->_minDisparity;
}

@end