@interface HKDotAnnotationView
- (HKDotAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (UIColor)dotColor;
- (void)drawRect:(CGRect)a3;
- (void)setDotColor:(id)a3;
@end

@implementation HKDotAnnotationView

- (HKDotAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKDotAnnotationView;
  v4 = [(MKAnnotationView *)&v7 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HKDotAnnotationView *)v4 setOpaque:0];
  }
  return v5;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v9 = CurrentContext;
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [v10 setFill];

    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGContextFillEllipseInRect(v9, v12);
    [(UIColor *)self->_dotColor setFill];
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    CGRect v14 = CGRectInset(v13, 4.0, 4.0);
    CGContextFillEllipseInRect(v9, v14);
  }
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void)setDotColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end