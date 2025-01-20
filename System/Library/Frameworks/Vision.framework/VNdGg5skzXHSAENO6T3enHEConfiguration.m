@interface VNdGg5skzXHSAENO6T3enHEConfiguration
- (VNdGg5skzXHSAENO6T3enHEConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNdGg5skzXHSAENO6T3enHEConfiguration

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
  v7.super_class = (Class)VNdGg5skzXHSAENO6T3enHEConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
  }
  return v5;
}

- (VNdGg5skzXHSAENO6T3enHEConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNdGg5skzXHSAENO6T3enHEConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_imageCropAndScaleOption = 2;
  }
  return result;
}

@end