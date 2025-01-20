@interface MUPlatterViewStyleProvider
- (UIColor)fillColor;
- (id)visualEffectForTraitCollection:(id)a3;
- (int64_t)backgroundStyle;
@end

@implementation MUPlatterViewStyleProvider

- (int64_t)backgroundStyle
{
  return +[MUInfoCardStyle containerStyle] == 1;
}

- (id)visualEffectForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(MUPlatterViewStyleProvider *)self backgroundStyle] == 1)
  {
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:_MKBlurEffectStyleForTraitCollection()];
    v6 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v5 style:6];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIColor)fillColor
{
  if ([(MUPlatterViewStyleProvider *)self backgroundStyle] == 1) {
    [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.9];
  }
  else {
  v2 = +[MUInfoCardStyle cardBackgroundColor];
  }
  return (UIColor *)v2;
}

@end