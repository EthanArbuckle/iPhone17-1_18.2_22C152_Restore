@interface CAMCameraViewControllerContainerView
+ (Class)layerClass;
- (CAMCameraViewControllerContainerView)initWithCoder:(id)a3;
- (CAMCameraViewControllerContainerView)initWithFrame:(CGRect)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (UIView)additionalContentView;
- (UIView)customOverlayView;
- (UIView)viewfinderView;
- (void)layoutSubviews;
- (void)setAdditionalContentView:(id)a3;
- (void)setCustomOverlayView:(id)a3;
- (void)setViewfinderView:(id)a3;
- (void)verifyViewOrdering;
@end

@implementation CAMCameraViewControllerContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMCameraViewControllerContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMCameraViewControllerContainerView;
  v3 = -[CAMCameraViewControllerContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMCameraViewControllerContainerView *)v3 _commonCAMCameraViewControllerContainerViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (CAMCameraViewControllerContainerView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMCameraViewControllerContainerView;
  v3 = [(CAMCameraViewControllerContainerView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMCameraViewControllerContainerView *)v3 _commonCAMCameraViewControllerContainerViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CAMCameraViewControllerContainerView;
  [(CAMCameraViewControllerContainerView *)&v14 layoutSubviews];
  [(CAMCameraViewControllerContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMCameraViewControllerContainerView *)self viewfinderView];
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double MidY = CGRectGetMidY(v16);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(CAMCameraViewControllerContainerView *)self viewfinderView];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setViewfinderView:(id)a3
{
  double v5 = (UIView *)a3;
  viewfinderView = self->_viewfinderView;
  if (viewfinderView != v5)
  {
    double v7 = v5;
    [(UIView *)viewfinderView removeFromSuperview];
    objc_storeStrong((id *)&self->_viewfinderView, a3);
    viewfinderView = (UIView *)[(CAMCameraViewControllerContainerView *)self verifyViewOrdering];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](viewfinderView, v5);
}

- (void)setCustomOverlayView:(id)a3
{
  double v5 = (UIView *)a3;
  customOverlayView = self->_customOverlayView;
  if (customOverlayView != v5)
  {
    double v7 = v5;
    [(UIView *)customOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_customOverlayView, a3);
    customOverlayView = (UIView *)[(CAMCameraViewControllerContainerView *)self verifyViewOrdering];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](customOverlayView, v5);
}

- (void)setAdditionalContentView:(id)a3
{
  double v5 = (UIView *)a3;
  additionalContentView = self->_additionalContentView;
  if (additionalContentView != v5)
  {
    double v7 = v5;
    [(UIView *)additionalContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_additionalContentView, a3);
    additionalContentView = (UIView *)[(CAMCameraViewControllerContainerView *)self verifyViewOrdering];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](additionalContentView, v5);
}

- (void)verifyViewOrdering
{
  id v7 = [(CAMCameraViewControllerContainerView *)self viewfinderView];
  double v3 = [(CAMCameraViewControllerContainerView *)self customOverlayView];
  uint64_t v4 = [(CAMCameraViewControllerContainerView *)self additionalContentView];
  id v5 = v7;
  double v6 = (void *)v4;
  if (v7)
  {
    [(CAMCameraViewControllerContainerView *)self addSubview:v7];
    [(CAMCameraViewControllerContainerView *)self sendSubviewToBack:v7];
    id v5 = v7;
  }
  if (v3)
  {
    [(CAMCameraViewControllerContainerView *)self addSubview:v3];
    [(CAMCameraViewControllerContainerView *)self bringSubviewToFront:v3];
    id v5 = v7;
  }
  if (v5 && v6)
  {
    [(CAMCameraViewControllerContainerView *)self insertSubview:v6 aboveSubview:v5];
  }
  else if (v3 && v6)
  {
    [(CAMCameraViewControllerContainerView *)self insertSubview:v6 belowSubview:v3];
  }
}

- (UIView)viewfinderView
{
  return self->_viewfinderView;
}

- (UIView)customOverlayView
{
  return self->_customOverlayView;
}

- (UIView)additionalContentView
{
  return self->_additionalContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalContentView, 0);
  objc_storeStrong((id *)&self->_customOverlayView, 0);
  objc_storeStrong((id *)&self->_viewfinderView, 0);
}

@end