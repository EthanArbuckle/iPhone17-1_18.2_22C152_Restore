@interface SSSCropOverlayGrabberView
+ (double)preferredDimension;
+ (double)preferredOtherDimension;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SSSCropOverlayGrabberView)initWithEdge:(unint64_t)a3;
- (void)layoutSubviews;
@end

@implementation SSSCropOverlayGrabberView

- (SSSCropOverlayGrabberView)initWithEdge:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSCropOverlayGrabberView;
  v3 = [(SSSCropOverlayLineView *)&v7 initWithEdge:a3];
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  hitTestView = v3->_hitTestView;
  v3->_hitTestView = v4;

  [(UIView *)v3->_hitTestView setHidden:1];
  [(SSSCropOverlayGrabberView *)v3 addSubview:v3->_hitTestView];
  return v3;
}

- (void)layoutSubviews
{
  [(SSSCropOverlayGrabberView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if (SSMinimumTouchableDimension >= v3) {
    double v9 = SSMinimumTouchableDimension;
  }
  else {
    double v9 = v3;
  }
  if (SSMinimumTouchableDimension >= v4) {
    double v10 = SSMinimumTouchableDimension;
  }
  else {
    double v10 = v4;
  }
  double v11 = SSCropHandleOutsideTouchableDimension;
  double v17 = SSCropHandleInsideTouchableDimension;
  if ((id)[(SSSCropOverlayLineView *)self edge] == (id)1
    || (id)[(SSSCropOverlayLineView *)self edge] == (id)4)
  {
    UIRectCenteredXInRect();
LABEL_13:
    double v6 = v12;
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;
    goto LABEL_14;
  }
  if ((id)[(SSSCropOverlayLineView *)self edge] == (id)2
    || (id)[(SSSCropOverlayLineView *)self edge] == (id)8)
  {
    UIRectCenteredYInRect();
    goto LABEL_13;
  }
LABEL_14:
  if ((id)[(SSSCropOverlayLineView *)self edge] == (id)1)
  {
    double v8 = -v11;
  }
  else if ((id)[(SSSCropOverlayLineView *)self edge] == (id)4)
  {
    double v8 = -v17;
  }
  else if ((id)[(SSSCropOverlayLineView *)self edge] == (id)2)
  {
    double v6 = -v11;
  }
  else if ((id)[(SSSCropOverlayLineView *)self edge] == (id)8)
  {
    double v6 = -v17;
  }
  hitTestView = self->_hitTestView;

  -[UIView setFrame:](hitTestView, "setFrame:", v6, v8, v9, v10);
}

+ (double)preferredDimension
{
  +[SSChromeHelper cropsCornerWidth];
  return result;
}

+ (double)preferredOtherDimension
{
  +[SSChromeHelper cropsCornerLength];
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self;
  v10.receiver = self;
  v10.super_class = (Class)SSSCropOverlayGrabberView;
  id v7 = a4;
  unsigned __int8 v8 = -[SSSCropOverlayGrabberView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  -[UIView convertPoint:fromView:](v6->_hitTestView, "convertPoint:fromView:", v6, x, y, v10.receiver, v10.super_class);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](v6->_hitTestView, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void).cxx_destruct
{
}

@end