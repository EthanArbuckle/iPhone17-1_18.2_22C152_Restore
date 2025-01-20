@interface VNDetectRectanglesRequestConfiguration
- (VNDetectRectanglesRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)maximumAspectRatio;
- (float)minimumAspectRatio;
- (float)minimumConfidence;
- (float)minimumSize;
- (float)quadratureTolerance;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumObservations;
- (unint64_t)requiredVersion;
- (void)setMaximumAspectRatio:(float)a3;
- (void)setMaximumObservations:(unint64_t)a3;
- (void)setMinimumAspectRatio:(float)a3;
- (void)setMinimumConfidence:(float)a3;
- (void)setMinimumSize:(float)a3;
- (void)setQuadratureTolerance:(float)a3;
- (void)setRequiredVersion:(unint64_t)a3;
@end

@implementation VNDetectRectanglesRequestConfiguration

- (void)setMaximumObservations:(unint64_t)a3
{
  self->_maximumObservations = a3;
}

- (unint64_t)maximumObservations
{
  return self->_maximumObservations;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumSize:(float)a3
{
  self->_minimumSize = a3;
}

- (float)minimumSize
{
  return self->_minimumSize;
}

- (void)setQuadratureTolerance:(float)a3
{
  self->_quadratureTolerance = a3;
}

- (float)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (void)setMaximumAspectRatio:(float)a3
{
  self->_maximumAspectRatio = a3;
}

- (float)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (void)setMinimumAspectRatio:(float)a3
{
  self->_minimumAspectRatio = a3;
}

- (float)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (void)setRequiredVersion:(unint64_t)a3
{
  self->_requiredVersion = a3;
}

- (unint64_t)requiredVersion
{
  return self->_requiredVersion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VNDetectRectanglesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v12 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setRequiredVersion:self->_requiredVersion];
    *(float *)&double v6 = self->_minimumAspectRatio;
    [v5 setMinimumAspectRatio:v6];
    *(float *)&double v7 = self->_maximumAspectRatio;
    [v5 setMaximumAspectRatio:v7];
    *(float *)&double v8 = self->_quadratureTolerance;
    [v5 setQuadratureTolerance:v8];
    *(float *)&double v9 = self->_minimumSize;
    [v5 setMinimumSize:v9];
    *(float *)&double v10 = self->_minimumConfidence;
    [v5 setMinimumConfidence:v10];
    [v5 setMaximumObservations:self->_maximumObservations];
  }
  return v5;
}

- (VNDetectRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNDetectRectanglesRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_requiredVersion = 2;
    result->_minimumAspectRatio = 0.5;
    result->_maximumAspectRatio = 1.0;
    result->_quadratureTolerance = 30.0;
    result->_minimumSize = 0.2;
    result->_minimumConfidence = 0.0;
    result->_maximumObservations = 1;
  }
  return result;
}

@end