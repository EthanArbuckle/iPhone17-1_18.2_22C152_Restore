@interface EKDayOccurrenceResizeHandleView
- (CGRect)_circleRect;
- (EKDayOccurrenceResizeHandleView)initWithFrame:(CGRect)a3 occurrenceView:(id)a4;
- (EKDayOccurrenceView)occurrenceView;
- (UIColor)baseColor;
- (double)radius;
- (void)drawRect:(CGRect)a3;
- (void)setBaseColor:(id)a3;
- (void)setRadius:(double)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation EKDayOccurrenceResizeHandleView

- (CGRect)_circleRect
{
  [(EKDayOccurrenceResizeHandleView *)self bounds];
  double v3 = (v2 + -7.0) * 0.5;
  double v4 = 7.0;
  double v5 = 7.0;
  double v6 = v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (EKDayOccurrenceResizeHandleView)initWithFrame:(CGRect)a3 occurrenceView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKDayOccurrenceResizeHandleView;
  v10 = -[EKDayOccurrenceResizeHandleView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [v9 currentImageState];
    v12 = [v11 displayColor];
    [(EKDayOccurrenceResizeHandleView *)v10 setBaseColor:v12];

    objc_storeWeak((id *)&v10->_occurrenceView, v9);
    [(EKDayOccurrenceResizeHandleView *)v10 setOpaque:0];
  }

  return v10;
}

- (void)willMoveToSuperview:(id)a3
{
  if (!a3) {
    objc_storeWeak((id *)&self->_occurrenceView, 0);
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(EKDayOccurrenceResizeHandleView *)self _circleRect];
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  CGRect v24 = CGRectInset(v23, -0.5, -0.5);
  CGFloat v9 = v24.origin.x;
  CGFloat v10 = v24.origin.y;
  CGFloat v11 = v24.size.width;
  CGFloat v12 = v24.size.height;
  CGContextSetCompositeOperation();
  [(UIColor *)self->_baseColor setFill];
  v25.origin.CGFloat x = v9;
  v25.origin.CGFloat y = v10;
  v25.size.CGFloat width = v11;
  v25.size.CGFloat height = v12;
  CGContextFillEllipseInRect(CurrentContext, v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, 0.5, 0.5);
  CGFloat v13 = v27.origin.x;
  CGFloat v14 = v27.origin.y;
  CGFloat v15 = v27.size.width;
  CGFloat v16 = v27.size.height;
  v17 = [MEMORY[0x1E4FB1618] whiteColor];
  [v17 setFill];

  CGFloat v18 = v13;
  CGFloat v19 = v14;
  CGFloat v20 = v15;
  CGFloat v21 = v16;

  CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v18);
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (void)setBaseColor:(id)a3
{
}

- (EKDayOccurrenceView)occurrenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_occurrenceView);

  return (EKDayOccurrenceView *)WeakRetained;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseColor, 0);

  objc_destroyWeak((id *)&self->_occurrenceView);
}

@end