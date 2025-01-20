@interface DOCTagRenderingAppearance
- (BOOL)outlineTagsToIndicateMixedState;
- (UIColor)underlyingColorForNoneTag;
- (double)_defaultBorderWidth;
- (double)defaultBorderWidth;
- (id)_init;
- (int64_t)imageWeightForVariant:(unint64_t)a3;
@end

@implementation DOCTagRenderingAppearance

- (double)defaultBorderWidth
{
  [(DOCTagRenderingAppearance *)self _defaultBorderWidth];
  double v3 = v2;
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = 1.0;
  if (IsBoldTextEnabled) {
    double v5 = 2.0;
  }
  return v3 * v5;
}

- (double)_defaultBorderWidth
{
  return 1.0;
}

- (UIColor)underlyingColorForNoneTag
{
  return (UIColor *)[MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DOCTagRenderingAppearance;
  return [(DOCTagRenderingAppearance *)&v3 init];
}

- (BOOL)outlineTagsToIndicateMixedState
{
  return 0;
}

- (int64_t)imageWeightForVariant:(unint64_t)a3
{
  return 4;
}

@end