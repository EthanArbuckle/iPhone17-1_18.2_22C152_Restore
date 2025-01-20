@interface VNGeneratePersonSegmentationRequestConfiguration
- (BOOL)keepRawOutputMask;
- (BOOL)useTiling;
- (VNGeneratePersonSegmentationRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)minimumConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)qualityLevel;
- (unsigned)outputPixelFormat;
- (void)setKeepRawOutputMask:(BOOL)a3;
- (void)setMinimumConfidence:(float)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setQualityLevel:(unint64_t)a3;
- (void)setUseTiling:(BOOL)a3;
@end

@implementation VNGeneratePersonSegmentationRequestConfiguration

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setKeepRawOutputMask:(BOOL)a3
{
  self->_keepRawOutputMask = a3;
}

- (BOOL)keepRawOutputMask
{
  return self->_keepRawOutputMask;
}

- (void)setUseTiling:(BOOL)a3
{
  self->_useTiling = a3;
}

- (BOOL)useTiling
{
  return self->_useTiling;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setQualityLevel:(unint64_t)a3
{
  self->_qualityLevel = a3;
}

- (unint64_t)qualityLevel
{
  return self->_qualityLevel;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNGeneratePersonSegmentationRequestConfiguration;
  id v4 = [(VNStatefulRequestConfiguration *)&v7 copyWithZone:a3];
  [v4 setQualityLevel:self->_qualityLevel];
  [v4 setOutputPixelFormat:self->_outputPixelFormat];
  [v4 setUseTiling:self->_useTiling];
  [v4 setKeepRawOutputMask:self->_keepRawOutputMask];
  *(float *)&double v5 = self->_minimumConfidence;
  [v4 setMinimumConfidence:v5];
  return v4;
}

- (VNGeneratePersonSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNGeneratePersonSegmentationRequestConfiguration;
  result = [(VNStatefulRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_qualityLevel = 0;
    result->_outputPixelFormat = 1278226488;
    result->_useTiling = 0;
    result->_keepRawOutputMask = 0;
    result->_minimumConfidence = 0.9;
  }
  return result;
}

@end