@interface NWCHighlightedMapLocationView
- (NWCHighlightedMapLocationView)initWithFrame:(CGRect)a3 fillColor:(id)a4 andStrokeWidth:(double)a5;
- (UIColor)fillColor;
- (double)strokeWidth;
- (void)drawRect:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation NWCHighlightedMapLocationView

- (NWCHighlightedMapLocationView)initWithFrame:(CGRect)a3 fillColor:(id)a4 andStrokeWidth:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NWCHighlightedMapLocationView;
  v13 = -[NWCMapLocationView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fillColor, a4);
    v14->_strokeWidth = a5;
    [(NWCHighlightedMapLocationView *)v14 setOpaque:0];
  }

  return v14;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NWCHighlightedMapLocationView *)self strokeWidth];
  CGFloat v9 = v8 * 0.5;
  [(NWCHighlightedMapLocationView *)self strokeWidth];
  CGFloat v11 = v10 * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRect v21 = CGRectInset(v20, v9, v11);
  CGFloat v12 = v21.origin.x;
  CGFloat v13 = v21.origin.y;
  CGFloat v14 = v21.size.width;
  CGFloat v15 = v21.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v17 = [(NWCHighlightedMapLocationView *)self fillColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v17 CGColor]);

  CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 1.0);
  [(NWCHighlightedMapLocationView *)self strokeWidth];
  CGContextSetLineWidth(CurrentContext, v18);
  v22.origin.CGFloat x = v12;
  v22.origin.CGFloat y = v13;
  v22.size.CGFloat width = v14;
  v22.size.CGFloat height = v15;
  CGContextFillEllipseInRect(CurrentContext, v22);
  v23.origin.CGFloat x = v12;
  v23.origin.CGFloat y = v13;
  v23.size.CGFloat width = v14;
  v23.size.CGFloat height = v15;
  CGContextStrokeEllipseInRect(CurrentContext, v23);

  CGContextFillPath(CurrentContext);
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(NWCHighlightedMapLocationView *)self setNeedsDisplay];
  }
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void).cxx_destruct
{
}

@end