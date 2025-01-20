@interface FBARadialProgressView
- (CGRect)circleRectForFrame:(CGRect)a3;
- (float)progress;
- (void)awakeFromNib;
- (void)drawRect:(CGRect)a3;
- (void)setProgress:(float)a3;
@end

@implementation FBARadialProgressView

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)FBARadialProgressView;
  [(FBARadialProgressView *)&v4 awakeFromNib];
  v3 = +[UIColor clearColor];
  [(FBARadialProgressView *)self setBackgroundColor:v3];
}

- (void)setProgress:(float)a3
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  self->_progress = fmaxf(a3, 0.0);
  [(FBARadialProgressView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(FBARadialProgressView *)self bounds];
  CGFloat Height = CGRectGetHeight(v26);
  CGContextTranslateCTM(CurrentContext, 0.0, Height);
  v6 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v6, 1.0, -1.0);
  id v24 = [(FBARadialProgressView *)self tintColor];
  [(FBARadialProgressView *)self bounds];
  -[FBARadialProgressView circleRectForFrame:](self, "circleRectForFrame:");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  CGFloat v23 = CGRectGetWidth(v27) * 0.5;
  [v24 set];
  [v15 setLineWidth:1.0];
  [v15 stroke];
  [(FBARadialProgressView *)self progress];
  double v17 = v16 * -2.0 * 3.14159265 + 1.57079633;
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  double MinX = CGRectGetMinX(v28);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  double v19 = MinX + CGRectGetWidth(v29) * 0.5;
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  double MinY = CGRectGetMinY(v30);
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  double v21 = MinY + CGRectGetHeight(v31) * 0.5;
  v22 = +[UIBezierPath bezierPath];
  [v22 moveToPoint:v19, v21];
  [v22 addArcWithCenter:0 radius:v19 startAngle:v21 endAngle:v23 clockwise:1.57079633];
  [v22 addLineToPoint:v19, v21];
  [v22 closePath];
  [v22 fill];
}

- (CGRect)circleRectForFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetWidth(a3);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v15);
  if (v7 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  double v10 = v9 + -2.0;
  double v11 = (v7 - (v9 + -2.0)) * 0.5;
  double v12 = (v8 - (v9 + -2.0)) * 0.5;
  double v13 = v11;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v13;
  return result;
}

- (float)progress
{
  return self->_progress;
}

@end