@interface HKSeparatorLineView
+ (id)_hkecg_separatorView;
- (BOOL)_isVertical;
- (BOOL)isOpaque;
- (CGSize)intrinsicContentSize;
- (HKSeparatorLineView)init;
- (HKSeparatorLineView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (double)leadingMargin;
- (double)separatorThickness;
- (double)trailingMargin;
- (int64_t)dashStyle;
- (void)_applyStyleToContext:(CGContext *)a3;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setDashStyle:(int64_t)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setSeparatorThickness:(double)a3;
- (void)setTrailingMargin:(double)a3;
@end

@implementation HKSeparatorLineView

+ (id)_hkecg_separatorView
{
  v2 = objc_alloc_init(HKSeparatorLineView);
  [(HKSeparatorLineView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKSeparatorLineView *)v2 setColor:v3];

  [(HKSeparatorLineView *)v2 setSeparatorThickness:HKUIFloorToScreenScale(0.5)];
  [(HKSeparatorLineView *)v2 setDashStyle:2];
  return v2;
}

- (HKSeparatorLineView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKSeparatorLineView;
  v3 = -[HKSeparatorLineView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    v3->_separatorThickness = 1.0;
    v3->_dashStyle = 0;
    v3->_leadingMargin = 0.0;
    v3->_trailingMargin = 0.0;
  }
  return v3;
}

- (HKSeparatorLineView)init
{
  return -[HKSeparatorLineView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(HKSeparatorLineView *)self _isVertical];
  double separatorThickness = self->_separatorThickness;
  if (v3) {
    double v5 = self->_separatorThickness;
  }
  else {
    double v5 = 0.0;
  }
  if (v3) {
    double separatorThickness = 0.0;
  }
  result.height = separatorThickness;
  result.width = v5;
  return result;
}

- (void)setDashStyle:(int64_t)a3
{
  self->_dashStyle = a3;
  [(HKSeparatorLineView *)self setNeedsDisplay];
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
  [(HKSeparatorLineView *)self setNeedsDisplay];
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
  [(HKSeparatorLineView *)self setNeedsDisplay];
}

- (BOOL)_isVertical
{
  [(HKSeparatorLineView *)self frame];
  return v2 < v3;
}

- (BOOL)isOpaque
{
  return 1;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = [(HKSeparatorLineView *)self backgroundColor];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  v12 = v11;

  id v19 = v12;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v19 CGColor]);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v21);
  [(HKSeparatorLineView *)self _applyStyleToContext:CurrentContext];
  [(HKSeparatorLineView *)self frame];
  double v14 = v13;
  double v16 = v15;
  if ([(HKSeparatorLineView *)self _isVertical])
  {
    double v17 = v14 * 0.5;
    CGContextMoveToPoint(CurrentContext, v17, self->_leadingMargin);
    double v18 = v16 - self->_leadingMargin - self->_trailingMargin;
  }
  else
  {
    double v18 = v16 * 0.5;
    CGContextMoveToPoint(CurrentContext, self->_leadingMargin, v18);
    double v17 = v14 - self->_leadingMargin - self->_trailingMargin;
  }
  CGContextAddLineToPoint(CurrentContext, v17, v18);
  CGContextStrokePath(CurrentContext);
}

- (void)_applyStyleToContext:(CGContext *)a3
{
  CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_color CGColor]);
  CGContextSetLineWidth(a3, self->_separatorThickness);
  unint64_t v5 = self->_dashStyle - 1;
  if (v5 <= 3)
  {
    v6 = (const CGFloat *)*(&off_1E6D52720 + v5);
    CGContextSetLineDash(a3, 0.0, v6, 2uLL);
  }
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)separatorThickness
{
  return self->_separatorThickness;
}

- (void)setSeparatorThickness:(double)a3
{
  self->_double separatorThickness = a3;
}

- (int64_t)dashStyle
{
  return self->_dashStyle;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void).cxx_destruct
{
}

@end