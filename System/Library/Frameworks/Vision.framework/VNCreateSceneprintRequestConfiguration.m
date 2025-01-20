@interface VNCreateSceneprintRequestConfiguration
- (BOOL)returnAllResults;
- (BOOL)useCenterTileOnly;
- (VNCreateSceneprintRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setReturnAllResults:(BOOL)a3;
- (void)setUseCenterTileOnly:(BOOL)a3;
@end

@implementation VNCreateSceneprintRequestConfiguration

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setUseCenterTileOnly:(BOOL)a3
{
  self->_useCenterTileOnly = a3;
}

- (BOOL)useCenterTileOnly
{
  return self->_useCenterTileOnly;
}

- (void)setReturnAllResults:(BOOL)a3
{
  self->_returnAllResults = a3;
}

- (BOOL)returnAllResults
{
  return self->_returnAllResults;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCreateSceneprintRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setReturnAllResults:self->_returnAllResults];
    [v5 setUseCenterTileOnly:self->_useCenterTileOnly];
    [v5 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
  }
  return v5;
}

- (VNCreateSceneprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCreateSceneprintRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_returnAllResults = 0;
    result->_useCenterTileOnly = 0;
    result->_imageCropAndScaleOption = 2;
  }
  return result;
}

@end