@interface BWPhotoEncoderNodeAttachedMediaConfiguration
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- (BOOL)propagatesDownstream;
- (BOOL)requiresEncoding;
- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithDimensions:(id)a3 propagationMode:(int64_t)a4;
- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithMainImageDownscalingFactor:(float)a3 propagationMode:(int64_t)a4;
- (float)mainImageDownscalingFactor;
- (id)description;
- (int64_t)propagationMode;
- (void)setPropagationMode:(int64_t)a3;
@end

@implementation BWPhotoEncoderNodeAttachedMediaConfiguration

- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithMainImageDownscalingFactor:(float)a3 propagationMode:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWPhotoEncoderNodeAttachedMediaConfiguration;
  result = [(BWPhotoEncoderNodeAttachedMediaConfiguration *)&v7 init];
  if (result)
  {
    result->_mainImageDownscalingFactor = a3;
    result->_dimensions.width = 0;
    result->_dimensions.height = 0;
    result->_propagationMode = a4;
  }
  return result;
}

- (BOOL)propagatesDownstream
{
  return (self->_propagationMode & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (BWPhotoEncoderNodeAttachedMediaConfiguration)initWithDimensions:(id)a3 propagationMode:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWPhotoEncoderNodeAttachedMediaConfiguration;
  result = [(BWPhotoEncoderNodeAttachedMediaConfiguration *)&v7 init];
  if (result)
  {
    result->_mainImageDownscalingFactor = 0.0;
    result->_dimensions = ($470D365275581EF16070F5A11344F73E)a3;
    result->_propagationMode = a4;
  }
  return result;
}

- (BOOL)requiresEncoding
{
  return (unint64_t)(self->_propagationMode - 1) < 2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: mainImageDownscalingFactor:%f, dimensions:%dx%d, mode:%@", v4, self, self->_mainImageDownscalingFactor, self->_dimensions.width, self->_dimensions.height, BWPhotoEncoderStringForPhotoEncoderNodeAttachedMediaPropagationMode(self->_propagationMode)];
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_dimensions;
}

- (int64_t)propagationMode
{
  return self->_propagationMode;
}

- (void)setPropagationMode:(int64_t)a3
{
  self->_propagationMode = a3;
}

@end