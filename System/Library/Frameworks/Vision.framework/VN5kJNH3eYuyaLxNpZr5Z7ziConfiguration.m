@interface VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration
- (VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
  }
  return v5;
}

- (VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_imageCropAndScaleOption = 2;
  }
  return result;
}

@end