@interface JTFixedSizeUIImageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation JTFixedSizeUIImageView

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  double v3 = *MEMORY[0x263F1D7C8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(JTFixedSizeUIImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

@end