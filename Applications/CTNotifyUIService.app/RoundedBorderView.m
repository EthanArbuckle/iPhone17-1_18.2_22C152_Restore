@interface RoundedBorderView
- (RoundedBorderView)initWithFrame:(CGRect)a3 color:(id)a4;
- (void)drawRect:(CGRect)a3;
@end

@implementation RoundedBorderView

- (RoundedBorderView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoundedBorderView;
  v11 = -[RoundedBorderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(RoundedBorderView *)v11 setOpaque:0];
    objc_storeStrong((id *)&v12->_color, a4);
  }

  return v12;
}

- (void)drawRect:(CGRect)a3
{
  color = self->_color;
  if (color)
  {
    [(UIColor *)color set];
    [(RoundedBorderView *)self bounds];
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 fill];
  }
}

- (void).cxx_destruct
{
}

@end