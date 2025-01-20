@interface VNClassifyImageRequestConfiguration
- (VNClassificationCustomHierarchy)customHierarchy;
- (VNClassifyImageRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)imageCropAndScaleOption;
- (unint64_t)maximumHierarchicalObservations;
- (unint64_t)maximumLeafObservations;
- (void)setCustomHierarchy:(id)a3;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setMaximumHierarchicalObservations:(unint64_t)a3;
- (void)setMaximumLeafObservations:(unint64_t)a3;
@end

@implementation VNClassifyImageRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  self->_maximumHierarchicalObservations = a3;
}

- (unint64_t)maximumHierarchicalObservations
{
  return self->_maximumHierarchicalObservations;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  self->_maximumLeafObservations = a3;
}

- (unint64_t)maximumLeafObservations
{
  return self->_maximumLeafObservations;
}

- (void)setCustomHierarchy:(id)a3
{
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNClassifyImageRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setCustomHierarchy:self->_customHierarchy];
    [v5 setMaximumLeafObservations:self->_maximumLeafObservations];
    [v5 setMaximumHierarchicalObservations:self->_maximumHierarchicalObservations];
    [v5 setImageCropAndScaleOption:self->_imageCropAndScaleOption];
  }
  return v5;
}

- (VNClassifyImageRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNClassifyImageRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_maximumLeafObservations = 0x7FFFFFFFFFFFFFFFLL;
    result->_maximumHierarchicalObservations = 0x7FFFFFFFFFFFFFFFLL;
    result->_imageCropAndScaleOption = 2;
  }
  return result;
}

@end