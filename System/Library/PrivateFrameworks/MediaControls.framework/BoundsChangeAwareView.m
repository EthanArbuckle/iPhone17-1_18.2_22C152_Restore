@interface BoundsChangeAwareView
- (void)setBounds:(CGRect)a3;
@end

@implementation BoundsChangeAwareView

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BoundsChangeAwareView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)BoundsChangeAwareView;
  -[BoundsChangeAwareView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(BoundsChangeAwareView *)self setNeedsLayout];
  }
}

@end