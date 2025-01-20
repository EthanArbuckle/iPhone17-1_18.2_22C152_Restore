@interface VNCoreMLRequestConfiguration
- (NSObject)modelCachingIdentifier;
- (VNCoreMLRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setModelCachingIdentifier:(id)a3;
- (void)updateWithPropertiesOfModel:(id)a3;
@end

@implementation VNCoreMLRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setModelCachingIdentifier:(id)a3
{
}

- (NSObject)modelCachingIdentifier
{
  return self->_modelCachingIdentifier;
}

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
  v7.super_class = (Class)VNCoreMLRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
    [v5 setModelCachingIdentifier:self->_modelCachingIdentifier];
  }
  return v5;
}

- (void)updateWithPropertiesOfModel:(id)a3
{
  id v4 = [a3 cachingIdentifier];
  -[VNCoreMLRequestConfiguration setModelCachingIdentifier:](self, "setModelCachingIdentifier:");
}

- (VNCoreMLRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCoreMLRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_imageCropAndScaleOption = 0;
  }
  return result;
}

@end