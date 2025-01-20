@interface SSSCropOverlayCornerView
+ (double)preferredDimension;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initForCorner:(unint64_t)a3;
- (unint64_t)corner;
- (void)layoutSubviews;
@end

@implementation SSSCropOverlayCornerView

- (id)initForCorner:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SSSCropOverlayCornerView;
  v4 = [(SSSCropOverlayCornerView *)&v13 init];
  v4->_corner = a3;
  CGFloat v5 = 0.0;
  if (a3 - 2 <= 6) {
    CGFloat v5 = dbl_100075F78[a3 - 2];
  }
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, v5);
  CGAffineTransform v11 = v12;
  [(SSSCropOverlayCornerView *)v4 setTransform:&v11];
  v6 = [[SSSCropOverlayGrabberView alloc] initWithEdge:1];
  topLineView = v4->_topLineView;
  v4->_topLineView = v6;

  v8 = [[SSSCropOverlayGrabberView alloc] initWithEdge:2];
  leftLineView = v4->_leftLineView;
  v4->_leftLineView = v8;

  [(SSSCropOverlayCornerView *)v4 addSubview:v4->_topLineView];
  [(SSSCropOverlayCornerView *)v4 addSubview:v4->_leftLineView];
  return v4;
}

+ (double)preferredDimension
{
  +[SSSCropOverlayGrabberView preferredOtherDimension];
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SSSCropOverlayCornerView;
  [(SSSCropOverlayCornerView *)&v10 layoutSubviews];
  [(SSSCropOverlayCornerView *)self bounds];
  double v4 = v3;
  [(SSSCropOverlayCornerView *)self bounds];
  double v6 = v5;
  +[SSSCropOverlayGrabberView preferredDimension];
  double v8 = v7;
  double v9 = v6 - v7;
  -[SSSCropOverlayGrabberView setFrame:](self->_topLineView, "setFrame:", 0.0, 0.0, v4, v7);
  -[SSSCropOverlayGrabberView setFrame:](self->_leftLineView, "setFrame:", 0.0, v8, v8, v9);
}

- (CGSize)intrinsicContentSize
{
  +[SSSCropOverlayCornerView preferredDimension];
  double v3 = v2;
  +[SSSCropOverlayCornerView preferredDimension];
  double v5 = v4;
  double v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  topLineView = self->_topLineView;
  -[SSSCropOverlayGrabberView convertPoint:fromView:](topLineView, "convertPoint:fromView:", self, x, y);
  if (-[SSSCropOverlayGrabberView pointInside:withEvent:](topLineView, "pointInside:withEvent:", v7))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    leftLineView = self->_leftLineView;
    -[SSSCropOverlayGrabberView convertPoint:fromView:](leftLineView, "convertPoint:fromView:", self, x, y);
    unsigned __int8 v9 = -[SSSCropOverlayGrabberView pointInside:withEvent:](leftLineView, "pointInside:withEvent:", v7);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = self;
  v12.receiver = self;
  v12.super_class = (Class)SSSCropOverlayCornerView;
  -[SSSCropOverlayCornerView hitTest:withEvent:](&v12, "hitTest:withEvent:", a4);
  id v7 = (SSSCropOverlayGrabberView *)objc_claimAutoreleasedReturnValue();
  +[SSSCropOverlayGrabberView preferredDimension];
  UIRectCenteredAboutPoint();
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  BOOL v8 = CGRectContainsPoint(v15, v14);
  if (v7 != v6->_topLineView && v7 != v6->_leftLineView && !v8) {
    double v6 = (SSSCropOverlayCornerView *)v7;
  }
  objc_super v10 = v6;

  return v10;
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftLineView, 0);

  objc_storeStrong((id *)&self->_topLineView, 0);
}

@end