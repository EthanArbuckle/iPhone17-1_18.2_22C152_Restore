@interface SSSScrollView
- (BOOL)hitTestsUsingSubviews;
- (BOOL)isInProgrammaticCall;
- (BOOL)isMoving;
- (CGRect)visibleRect;
- (CGSize)_unscaledContentSize;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setHitTestsUsingSubviews:(BOOL)a3;
- (void)setZoomScale:(double)a3 animated:(BOOL)a4;
- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4;
@end

@implementation SSSScrollView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SSSScrollView *)self frame];
  if ((SSRectEqualToRect() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSScrollView;
    -[SSSScrollView setFrame:](&v8, "setFrame:", x, y, width, height);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(SSSScrollView *)self contentInset];
  if ((SSEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    self->_isInProgrammaticCall = 1;
    v8.receiver = self;
    v8.super_class = (Class)SSSScrollView;
    -[SSSScrollView setContentInset:](&v8, "setContentInset:", top, left, bottom, right);
    self->_isInProgrammaticCall = 0;
  }
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SSSScrollView *)self zoomScale];
  if (v7 != a3)
  {
    self->_isInProgrammaticCall = 1;
    v8.receiver = self;
    v8.super_class = (Class)SSSScrollView;
    [(SSSScrollView *)&v8 setZoomScale:v4 animated:a3];
    self->_isInProgrammaticCall = 0;
  }
}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (SSRectIsValid())
  {
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    if (!CGRectIsEmpty(v11))
    {
      self->_inSuperZoomToRect = 1;
      self->_animateSuperZoomToRect = v4;
      v10.receiver = self;
      v10.super_class = (Class)SSSScrollView;
      -[SSSScrollView zoomToRect:animated:](&v10, "zoomToRect:animated:", v4, x, y, width, height);
      self->_inSuperZoomToRect = 0;
    }
  }
}

- (BOOL)isInProgrammaticCall
{
  return self->_isInProgrammaticCall;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if (self->_inSuperZoomToRect) {
    *(void *)&a4 = self->_animateSuperZoomToRect;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSSScrollView;
  -[SSSScrollView setContentOffset:animated:](&v4, "setContentOffset:animated:", a4, a3.x, a3.y);
}

- (CGSize)_unscaledContentSize
{
  [(SSSScrollView *)self contentSize];
  double v4 = v3;
  double v6 = v5;
  [(SSSScrollView *)self zoomScale];
  double v8 = v4 / v7;
  [(SSSScrollView *)self zoomScale];
  double v10 = v6 / v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (CGRect)visibleRect
{
  double v3 = [(SSSScrollView *)self delegate];
  double v4 = [v3 viewForZoomingInScrollView:self];

  [(SSSScrollView *)self bounds];
  [v4 convertRect:self fromView:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)isMoving
{
  unsigned __int8 v3 = [(SSSScrollView *)self isDragging];
  unsigned __int8 v4 = [(SSSScrollView *)self isDecelerating];
  unsigned __int8 v5 = [(SSSScrollView *)self isZooming];
  return v3 | v4 | v5 | [(SSSScrollView *)self isZoomBouncing];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSSScrollView;
  double v8 = -[SSSScrollView hitTest:withEvent:](&v24, "hitTest:withEvent:", v7, x, y);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100028EF8;
  v22 = sub_100028F08;
  id v23 = 0;
  if ([(SSSScrollView *)self hitTestsUsingSubviews])
  {
    double v9 = [(SSSScrollView *)self subviews];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100028F10;
    v13[3] = &unk_10009A3E8;
    double v16 = x;
    double v17 = y;
    v13[4] = self;
    id v14 = v7;
    double v15 = &v18;
    [v9 enumerateObjectsUsingBlock:v13];
  }
  double v10 = (void *)v19[5];
  if (!v10) {
    double v10 = v8;
  }
  id v11 = v10;
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (BOOL)hitTestsUsingSubviews
{
  return self->_hitTestsUsingSubviews;
}

- (void)setHitTestsUsingSubviews:(BOOL)a3
{
  self->_hitTestsUsingSubviews = a3;
}

@end