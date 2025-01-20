@interface CPUIFocusRingView
- (CPUIFocusRingView)initWithFrame:(CGRect)a3;
- (UIBezierPath)focusPath;
- (UIBezierPath)insetFocusPath;
- (UIColor)ringColor;
- (double)cornerRadius;
- (double)ringWidth;
- (void)_updateFocusRect;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setFocusPath:(id)a3;
- (void)setInsetFocusPath:(id)a3;
- (void)setRingColor:(id)a3;
- (void)setRingWidth:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIFocusRingView

- (CPUIFocusRingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPUIFocusRingView;
  v3 = -[CPUIFocusRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CPUIFocusRingView *)v3 setBackgroundColor:v4];

    v3->_cornerRadius = 11.0;
    uint64_t v5 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    ringColor = v3->_ringColor;
    v3->_ringColor = (UIColor *)v5;

    v3->_ringWidth = 2.0;
  }
  return v3;
}

- (void)_updateFocusRect
{
  v3 = [(CPUIFocusRingView *)self focusPath];
  [v3 removeAllPoints];

  [(CPUIFocusRingView *)self setFocusPath:0];
  [(CPUIFocusRingView *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUIFocusRingView;
  [(CPUIFocusRingView *)&v4 traitCollectionDidChange:a3];
  [(CPUIFocusRingView *)self _updateFocusRect];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(CPUIFocusRingView *)self _updateFocusRect];
  }
}

- (void)setRingWidth:(double)a3
{
  if (self->_ringWidth != a3)
  {
    self->_ringWidth = a3;
    [(CPUIFocusRingView *)self _updateFocusRect];
  }
}

- (void)setRingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringColor, a3);
  [(CPUIFocusRingView *)self _updateFocusRect];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CPUIFocusRingView;
  [(CPUIFocusRingView *)&v3 layoutSubviews];
  [(CPUIFocusRingView *)self _updateFocusRect];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)CPUIFocusRingView;
  -[CPUIFocusRingView drawRect:](&v18, sel_drawRect_);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectInset(v19, 1.0, 1.0);
  double v8 = v20.origin.x;
  double v9 = v20.origin.y;
  double v10 = v20.size.width;
  double v11 = v20.size.height;
  v12 = [(CPUIFocusRingView *)self focusPath];

  if (!v12)
  {
    v13 = (void *)MEMORY[0x263F824C0];
    [(CPUIFocusRingView *)self cornerRadius];
    v15 = objc_msgSend(v13, "_bezierPathWithPillRect:cornerRadius:", v8, v9, v10, v11, v14);
    [v15 setLineWidth:self->_ringWidth];
    [(CPUIFocusRingView *)self setFocusPath:v15];
  }
  v16 = [(CPUIFocusRingView *)self ringColor];
  [v16 setStroke];

  v17 = [(CPUIFocusRingView *)self focusPath];
  [v17 stroke];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (UIBezierPath)focusPath
{
  return self->_focusPath;
}

- (void)setFocusPath:(id)a3
{
}

- (UIBezierPath)insetFocusPath
{
  return self->_insetFocusPath;
}

- (void)setInsetFocusPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetFocusPath, 0);
  objc_storeStrong((id *)&self->_focusPath, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
}

@end