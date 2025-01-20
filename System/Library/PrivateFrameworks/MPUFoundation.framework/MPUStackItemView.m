@interface MPUStackItemView
- (void)setCenter:(CGPoint)a3;
@end

@implementation MPUStackItemView

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(MPUStackItemView *)self layer];
  objc_msgSend(v5, "setPosition:", x, y);
}

@end