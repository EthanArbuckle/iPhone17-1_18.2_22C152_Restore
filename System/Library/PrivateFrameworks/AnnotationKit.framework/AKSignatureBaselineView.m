@interface AKSignatureBaselineView
- (AKSignatureBaselineView)initWithCoder:(id)a3;
- (AKSignatureBaselineView)initWithFrame:(CGRect)a3;
- (BOOL)_isRTL;
- (UIEdgeInsets)lastSafeAreaInsets;
- (double)baselinePercent;
- (double)scaleFactor;
- (void)_commonInit;
- (void)_drawBaselineInContext:(CGContext *)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBaselinePercent:(double)a3;
- (void)setLastSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation AKSignatureBaselineView

- (AKSignatureBaselineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureBaselineView;
  v3 = -[AKSignatureBaselineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKSignatureBaselineView *)v3 _commonInit];
  }
  return v4;
}

- (AKSignatureBaselineView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureBaselineView;
  v3 = [(AKSignatureBaselineView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKSignatureBaselineView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(AKSignatureBaselineView *)self setOpaque:0];
  [(AKSignatureBaselineView *)self setUserInteractionEnabled:0];
  v3 = [MEMORY[0x263F1C550] clearColor];
  [(AKSignatureBaselineView *)self setBackgroundColor:v3];

  [(AKSignatureBaselineView *)self setContentMode:3];
  [(AKSignatureBaselineView *)self setBaselinePercent:0.187];
  id v4 = [(AKSignatureBaselineView *)self layer];
  [v4 setOpaque:0];
}

- (double)scaleFactor
{
  v3 = [(AKSignatureBaselineView *)self window];
  id v4 = [v3 screen];

  if (v4)
  {
    v5 = [(AKSignatureBaselineView *)self window];
    objc_super v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
  }
  else
  {
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    double v8 = v9;
  }

  return v8;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [(AKSignatureBaselineView *)self _drawBaselineInContext:CurrentContext];

  CGContextRestoreGState(CurrentContext);
}

- (void)layoutSubviews
{
  [(AKSignatureBaselineView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AKSignatureBaselineView *)self lastSafeAreaInsets];
  if (v6 != v14 || v4 != v11 || v10 != v13 || v8 != v12)
  {
    [(AKSignatureBaselineView *)self safeAreaInsets];
    -[AKSignatureBaselineView setLastSafeAreaInsets:](self, "setLastSafeAreaInsets:");
    [(AKSignatureBaselineView *)self setNeedsDisplay];
  }
}

- (void)_drawBaselineInContext:(CGContext *)a3
{
  if (a3)
  {
    CGContextSaveGState(a3);
    Mutable = CGPathCreateMutable();
    CGRect ClipBoundingBox = CGContextGetClipBoundingBox(a3);
    double width = ClipBoundingBox.size.width;
    double height = ClipBoundingBox.size.height;
    double v8 = *(double *)&qword_268922C08;
    [(AKSignatureBaselineView *)self safeAreaInsets];
    if (v9 > 0.0 || ([(AKSignatureBaselineView *)self safeAreaInsets], v10 > 0.0))
    {
      [(AKSignatureBaselineView *)self safeAreaInsets];
      double v8 = v11;
      [(AKSignatureBaselineView *)self safeAreaInsets];
      if (v8 < v12) {
        double v8 = v12;
      }
    }
    [(AKSignatureBaselineView *)self baselinePercent];
    double v14 = height - height * v13;
    double v15 = width - v8;
    if ([(AKSignatureBaselineView *)self _isRTL]) {
      double v16 = width - v8 + -16.0;
    }
    else {
      double v16 = v8;
    }
    if (![(AKSignatureBaselineView *)self _isRTL]) {
      double v8 = v8 + 16.0 + 8.0;
    }
    if ([(AKSignatureBaselineView *)self _isRTL]) {
      double v15 = v16 + -8.0;
    }
    CGPathMoveToPoint(Mutable, 0, v8, v14);
    CGPathAddLineToPoint(Mutable, 0, v15, v14);
    CGFloat v17 = v14 + 1.0;
    CGPathMoveToPoint(Mutable, 0, v16, v17);
    CGPathAddLineToPoint(Mutable, 0, v16 + 16.0, v17 + -16.0);
    CGPathMoveToPoint(Mutable, 0, v16, v17 + -16.0);
    CGPathAddLineToPoint(Mutable, 0, v16 + 16.0, v17);
    id v18 = [MEMORY[0x263F1C550] akColorWithWhite:0.6 alpha:0.7];
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v18 CGColor]);

    CGContextSetLineWidth(a3, 1.0);
    CGContextAddPath(a3, Mutable);
    CGContextStrokePath(a3);
    CGContextRestoreGState(a3);
    CGPathRelease(Mutable);
  }
}

- (BOOL)_isRTL
{
  return 0;
}

- (double)baselinePercent
{
  return self->_baselinePercent;
}

- (void)setBaselinePercent:(double)a3
{
  self->_baselinePercent = a3;
}

- (UIEdgeInsets)lastSafeAreaInsets
{
  double top = self->_lastSafeAreaInsets.top;
  double left = self->_lastSafeAreaInsets.left;
  double bottom = self->_lastSafeAreaInsets.bottom;
  double right = self->_lastSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLastSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_lastSafeAreaInsets = a3;
}

@end