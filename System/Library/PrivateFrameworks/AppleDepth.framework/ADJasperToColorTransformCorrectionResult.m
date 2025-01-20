@interface ADJasperToColorTransformCorrectionResult
- (__n128)rotation;
- (__n128)std;
- (void)setRotation:(ADJasperToColorTransformCorrectionResult *)self;
- (void)setStd:(ADJasperToColorTransformCorrectionResult *)self;
@end

@implementation ADJasperToColorTransformCorrectionResult

- (void)setStd:(ADJasperToColorTransformCorrectionResult *)self
{
  *(_OWORD *)self->_std = v2;
}

- (__n128)std
{
  return a1[2];
}

- (void)setRotation:(ADJasperToColorTransformCorrectionResult *)self
{
  *(_OWORD *)self->_rotation = v2;
}

- (__n128)rotation
{
  return a1[1];
}

@end