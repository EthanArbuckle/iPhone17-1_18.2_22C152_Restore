@interface WFOpacitySlider
- (CGRect)trackRectForBounds:(CGRect)a3;
@end

@implementation WFOpacitySlider

- (CGRect)trackRectForBounds:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFOpacitySlider;
  -[WFOpacitySlider trackRectForBounds:](&v16, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  double v11 = 2.0 / v10;

  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end