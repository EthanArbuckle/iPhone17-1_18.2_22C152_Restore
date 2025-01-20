@interface PKPaletteBackgroundColorFactory
- (id)makeBackgroundColor;
@end

@implementation PKPaletteBackgroundColorFactory

- (id)makeBackgroundColor
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_46];
    uint64_t v1 = vars8;
  }
  return a1;
}

id __54__PKPaletteBackgroundColorFactory_makeBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    v2 = [MEMORY[0x1E4FB1618] blackColor];
    v3 = v2;
    double v4 = 0.7;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v3 = v2;
    double v4 = 0.9;
  }
  v5 = [v2 colorWithAlphaComponent:v4];

  return v5;
}

@end