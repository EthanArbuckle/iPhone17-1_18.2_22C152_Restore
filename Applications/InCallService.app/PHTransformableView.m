@interface PHTransformableView
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation PHTransformableView

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PHTransformableView *)self transform];
  if (CGAffineTransformIsIdentity(&v7))
  {
    v6.receiver = self;
    v6.super_class = (Class)PHTransformableView;
    -[PHTransformableView setCenter:](&v6, "setCenter:", x, y);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PHTransformableView *)self transform];
  if (CGAffineTransformIsIdentity(&v9))
  {
    v8.receiver = self;
    v8.super_class = (Class)PHTransformableView;
    -[PHTransformableView setFrame:](&v8, "setFrame:", x, y, width, height);
  }
}

@end