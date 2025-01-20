@interface HUBlendedSeparatorView
- (void)drawRect:(CGRect)a3;
@end

@implementation HUBlendedSeparatorView

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModePlusLighter);
  id v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
  [v9 setFill];
  v8 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", x, y, width, height);
  [v8 fill];
}

@end