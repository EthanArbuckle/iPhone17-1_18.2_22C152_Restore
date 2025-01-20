@interface _SSSPDFPageMiniMapVisibleRegionView
- (CAShapeLayer)shadowMask;
- (CGRect)visibleRect;
- (UIView)highlightView;
- (UIView)shadowView;
- (_SSSPDFPageMiniMapVisibleRegionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlightView:(id)a3;
- (void)setShadowMask:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)updateHiddenRegionViewWithVisibleRect:(CGRect)a3;
- (void)updateVisibleRegionViewWithVisibleRect:(CGRect)a3;
@end

@implementation _SSSPDFPageMiniMapVisibleRegionView

- (_SSSPDFPageMiniMapVisibleRegionView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_SSSPDFPageMiniMapVisibleRegionView;
  v3 = -[_SSSPDFPageMiniMapVisibleRegionView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  shadowMask = v3->_shadowMask;
  v3->_shadowMask = v4;

  id v6 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  shadowView = v3->_shadowView;
  v3->_shadowView = v10;

  v12 = v3->_shadowView;
  v13 = +[UIColor colorWithWhite:0.0 alpha:0.5];
  [(UIView *)v12 setBackgroundColor:v13];

  v14 = [(UIView *)v3->_shadowView layer];
  [v14 setMask:v3->_shadowMask];

  [(_SSSPDFPageMiniMapVisibleRegionView *)v3 addSubview:v3->_shadowView];
  v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  highlightView = v3->_highlightView;
  v3->_highlightView = v15;

  v17 = [(UIView *)v3->_highlightView layer];
  id v18 = +[UIColor whiteColor];
  [v17 setBorderColor:[v18 CGColor]];

  v19 = [(UIView *)v3->_highlightView layer];
  [v19 setBorderWidth:2.0];

  v20 = [(UIView *)v3->_highlightView layer];
  [v20 setCornerRadius:2.0];

  [(_SSSPDFPageMiniMapVisibleRegionView *)v3 addSubview:v3->_highlightView];
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SSSPDFPageMiniMapVisibleRegionView;
  [(_SSSPDFPageMiniMapVisibleRegionView *)&v3 layoutSubviews];
  [(_SSSPDFPageMiniMapVisibleRegionView *)self visibleRect];
  -[_SSSPDFPageMiniMapVisibleRegionView updateVisibleRegionViewWithVisibleRect:](self, "updateVisibleRegionViewWithVisibleRect:");
  [(_SSSPDFPageMiniMapVisibleRegionView *)self visibleRect];
  -[_SSSPDFPageMiniMapVisibleRegionView updateHiddenRegionViewWithVisibleRect:](self, "updateHiddenRegionViewWithVisibleRect:");
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
  [(_SSSPDFPageMiniMapVisibleRegionView *)self setNeedsLayout];
}

- (void)updateVisibleRegionViewWithVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  highlightView = self->_highlightView;
  CGRect v12 = CGRectInset(a3, -2.0, -2.0);
  -[UIView setFrame:](highlightView, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  v9 = self->_highlightView;
  v14.origin.CGFloat x = CGRectZero.origin.x;
  v14.origin.CGFloat y = CGRectZero.origin.y;
  v14.size.CGFloat width = CGRectZero.size.width;
  v14.size.CGFloat height = CGRectZero.size.height;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  BOOL v10 = CGRectEqualToRect(v13, v14);

  [(UIView *)v9 setHidden:v10];
}

- (void)updateHiddenRegionViewWithVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  shadowView = self->_shadowView;
  [(_SSSPDFPageMiniMapVisibleRegionView *)self bounds];
  -[UIView setFrame:](shadowView, "setFrame:");
  shadowMask = self->_shadowMask;
  [(UIView *)self->_shadowView bounds];
  -[CAShapeLayer setFrame:](shadowMask, "setFrame:");
  Mutable = CGPathCreateMutable();
  [(CAShapeLayer *)self->_shadowMask bounds];
  CGPathAddRect(Mutable, 0, v12);
  -[UIView convertRect:fromView:](self->_shadowView, "convertRect:fromView:", self, x, y, width, height);
  CGRect v14 = CGRectInset(v13, -1.0, -1.0);
  CGPathAddRect(Mutable, 0, v14);
  [(CAShapeLayer *)self->_shadowMask setPath:Mutable];
  [(CAShapeLayer *)self->_shadowMask setFillRule:kCAFillRuleEvenOdd];

  CGPathRelease(Mutable);
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (CAShapeLayer)shadowMask
{
  return self->_shadowMask;
}

- (void)setShadowMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowMask, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end