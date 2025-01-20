@interface VNDetectContoursRequestConfiguration
- (BOOL)detectsDarkOnLight;
- (BOOL)forceUseInputCVPixelBufferDirectly;
- (BOOL)inHierarchy;
- (NSNumber)contrastPivot;
- (VNDetectContoursRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)contrastAdjustment;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumImageDimension;
- (void)setContrastAdjustment:(float)a3;
- (void)setContrastPivot:(id)a3;
- (void)setDetectsDarkOnLight:(BOOL)a3;
- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3;
- (void)setInHierarchy:(BOOL)a3;
- (void)setMaximumImageDimension:(unint64_t)a3;
@end

@implementation VNDetectContoursRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3
{
  self->_forceUseInputCVPixelBufferDirectly = a3;
}

- (BOOL)forceUseInputCVPixelBufferDirectly
{
  return self->_forceUseInputCVPixelBufferDirectly;
}

- (void)setInHierarchy:(BOOL)a3
{
  self->_inHierarchy = a3;
}

- (BOOL)inHierarchy
{
  return self->_inHierarchy;
}

- (void)setMaximumImageDimension:(unint64_t)a3
{
  self->_maximumImageDimension = a3;
}

- (unint64_t)maximumImageDimension
{
  return self->_maximumImageDimension;
}

- (void)setDetectsDarkOnLight:(BOOL)a3
{
  self->_detectsDarkOnLight = a3;
}

- (BOOL)detectsDarkOnLight
{
  return self->_detectsDarkOnLight;
}

- (void)setContrastPivot:(id)a3
{
}

- (NSNumber)contrastPivot
{
  return self->_contrastPivot;
}

- (void)setContrastAdjustment:(float)a3
{
  self->_contrastAdjustment = a3;
}

- (float)contrastAdjustment
{
  return self->_contrastAdjustment;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectContoursRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v8 copyWithZone:a3];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = self->_contrastAdjustment;
    [v4 setContrastAdjustment:v5];
    [v6 setContrastPivot:self->_contrastPivot];
    [v6 setDetectsDarkOnLight:self->_detectsDarkOnLight];
    [v6 setMaximumImageDimension:self->_maximumImageDimension];
    [v6 setInHierarchy:self->_inHierarchy];
    [v6 setForceUseInputCVPixelBufferDirectly:self->_forceUseInputCVPixelBufferDirectly];
  }
  return v6;
}

- (VNDetectContoursRequestConfiguration)initWithRequestClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VNDetectContoursRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v9 initWithRequestClass:a3];
  double v5 = v3;
  if (v3)
  {
    v3->_contrastAdjustment = 2.0;
    LODWORD(v4) = 0.5;
    uint64_t v6 = [NSNumber numberWithFloat:v4];
    contrastPivot = v5->_contrastPivot;
    v5->_contrastPivot = (NSNumber *)v6;

    v5->_detectsDarkOnLight = 1;
    v5->_maximumImageDimension = 512;
    v5->_inHierarchy = 1;
  }
  return v5;
}

@end