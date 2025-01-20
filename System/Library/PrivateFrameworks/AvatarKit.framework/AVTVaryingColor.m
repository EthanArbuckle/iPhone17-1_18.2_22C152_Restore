@interface AVTVaryingColor
- (id)baseColor;
- (id)colorByApplyingVariation:(float)a3;
- (id)variationMaxColor;
- (id)variationMinColor;
- (void)setBaseColor:(void *)a1;
- (void)setVariationMaxColor:(void *)a1;
- (void)setVariationMinColor:(void *)a1;
@end

@implementation AVTVaryingColor

- (id)colorByApplyingVariation:(float)a3
{
  return AVTColorApplyVariation(self->_baseColor, self->_variationMinColor, self->_variationMaxColor, *(double *)&a3);
}

- (id)baseColor
{
  if (result) {
    return objc_getProperty(result, a2, 8, 1);
  }
  return result;
}

- (void)setBaseColor:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 8);
  }
}

- (id)variationMinColor
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (void)setVariationMinColor:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 16);
  }
}

- (id)variationMaxColor
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

- (void)setVariationMaxColor:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationMaxColor, 0);
  objc_storeStrong((id *)&self->_variationMinColor, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end