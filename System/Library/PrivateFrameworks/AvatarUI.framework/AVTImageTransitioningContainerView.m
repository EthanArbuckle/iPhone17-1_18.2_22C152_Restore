@interface AVTImageTransitioningContainerView
+ (CGRect)borderMaskRectForContentRect:(CGRect)a3;
+ (CGRect)imageViewRectForContentRect:(CGRect)a3 liveViewRect:(CGRect)a4 imageSize:(CGSize)a5 scale:(double)a6;
+ (CGRect)liveViewRectForContentRect:(CGRect)a3 aspectRatio:(CGSize)a4 layoutMode:(int64_t)a5 scale:(double)a6;
- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3;
- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3 layoutMode:(int64_t)a4;
- (AVTUIAnimatingImageView)imageViewsContainer;
- (CGSize)aspectRatio;
- (UIImage)staticImage;
- (UIView)borderMaskView;
- (UIView)liveView;
- (int64_t)layoutMode;
- (void)layoutSubviews;
- (void)setAspectRatio:(CGSize)a3;
- (void)setLiveView:(id)a3;
- (void)setStaticImage:(id)a3;
- (void)setStaticImage:(id)a3 animated:(BOOL)a4;
- (void)setStaticViewVisible:(BOOL)a3;
- (void)transitionLiveViewToFront;
- (void)transitionStaticViewToFront;
@end

@implementation AVTImageTransitioningContainerView

+ (CGRect)liveViewRectForContentRect:(CGRect)a3 aspectRatio:(CGSize)a4 layoutMode:(int64_t)a5 scale:(double)a6
{
  if (a5 == 1) {
    _UIScaleTransformForAspectFitOfSizeInTargetSize();
  }
  else {
    _UIScaleTransformForAspectFillOfSizeInTargetSize();
  }
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)imageViewRectForContentRect:(CGRect)a3 liveViewRect:(CGRect)a4 imageSize:(CGSize)a5 scale:(double)a6
{
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3
{
  return -[AVTImageTransitioningContainerView initWithFrame:layoutMode:](self, "initWithFrame:layoutMode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AVTImageTransitioningContainerView)initWithFrame:(CGRect)a3 layoutMode:(int64_t)a4
{
  v43.receiver = self;
  v43.super_class = (Class)AVTImageTransitioningContainerView;
  v5 = -[AVTImageTransitioningContainerView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    __asm { FMOV            V0.2D, #1.0 }
    v5->_aspectRatio = _Q0;
    v5->_layoutMode = a4;
    v12 = objc_opt_class();
    [(AVTImageTransitioningContainerView *)v6 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(AVTImageTransitioningContainerView *)v6 bounds];
    objc_msgSend(v12, "imageViewRectForContentRect:liveViewRect:imageSize:scale:", v14, v16, v18, v20, v21, v22, v23, v24, 0x3FF0000000000000, 0x3FF0000000000000, 0);
    v29 = -[AVTUIAnimatingImageView initWithFrame:]([AVTUIAnimatingImageView alloc], "initWithFrame:", v25, v26, v27, v28);
    imageViewsContainer = v6->_imageViewsContainer;
    v6->_imageViewsContainer = v29;

    [(AVTImageTransitioningContainerView *)v6 addSubview:v6->_imageViewsContainer];
    v31 = [MEMORY[0x263F1C920] mainScreen];
    [v31 scale];
    double v33 = v32;
    v34 = [MEMORY[0x263F1C920] mainScreen];
    [v34 nativeScale];
    double v36 = v35;

    if (v33 != v36)
    {
      id v37 = objc_alloc(MEMORY[0x263F1CB60]);
      v38 = objc_opt_class();
      [(AVTImageTransitioningContainerView *)v6 bounds];
      objc_msgSend(v38, "borderMaskRectForContentRect:");
      uint64_t v39 = objc_msgSend(v37, "initWithFrame:");
      borderMaskView = v6->_borderMaskView;
      v6->_borderMaskView = (UIView *)v39;

      v41 = [MEMORY[0x263F1C550] whiteColor];
      [(UIView *)v6->_borderMaskView setBackgroundColor:v41];

      [(AVTImageTransitioningContainerView *)v6 setMaskView:v6->_borderMaskView];
    }
  }
  return v6;
}

- (void)setStaticImage:(id)a3
{
}

- (void)setStaticImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIImage *)a3;
  if (self->_staticImage != v7)
  {
    double v16 = v7;
    [(UIImage *)v7 size];
    double v9 = v8;
    double v11 = v10;
    [(UIImage *)self->_staticImage size];
    if (v9 != v13 || v11 != v12) {
      [(AVTImageTransitioningContainerView *)self setNeedsLayout];
    }
    objc_storeStrong((id *)&self->_staticImage, a3);
    double v15 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
    [v15 setImage:v16 animated:v4];

    double v7 = v16;
  }
}

- (void)setLiveView:(id)a3
{
  v5 = (UIView *)a3;
  p_liveView = &self->_liveView;
  liveView = self->_liveView;
  if (liveView != v5)
  {
    double v11 = v5;
    double v8 = [(UIView *)liveView superview];

    double v9 = *p_liveView;
    if (v8 == self)
    {
      [(UIView *)v9 removeFromSuperview];
    }
    else
    {
      double v10 = [(UIView *)v9 superview];

      if (v10) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Live view wasn't removed from superview!"];
      }
    }
    objc_storeStrong((id *)&self->_liveView, a3);
    [(AVTImageTransitioningContainerView *)self addSubview:*p_liveView];
    [(AVTImageTransitioningContainerView *)self transitionStaticViewToFront];
    liveView = (UIView *)[(AVTImageTransitioningContainerView *)self setNeedsLayout];
    v5 = v11;
  }
  MEMORY[0x270F9A758](liveView, v5);
}

- (void)setAspectRatio:(CGSize)a3
{
  if (self->_aspectRatio.width != a3.width || self->_aspectRatio.height != a3.height)
  {
    self->_aspectRatio = a3;
    [(AVTImageTransitioningContainerView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)AVTImageTransitioningContainerView;
  [(AVTImageTransitioningContainerView *)&v63 layoutSubviews];
  [(AVTImageTransitioningContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = objc_opt_class();
  [(AVTImageTransitioningContainerView *)self aspectRatio];
  double v13 = v12;
  double v15 = v14;
  int64_t v16 = [(AVTImageTransitioningContainerView *)self layoutMode];
  double v17 = [(AVTImageTransitioningContainerView *)self window];
  double v18 = [v17 screen];
  [v18 scale];
  double v61 = v10;
  double v62 = v8;
  objc_msgSend(v11, "liveViewRectForContentRect:aspectRatio:layoutMode:scale:", v16, v4, v6, v8, v10, v13, v15, v19);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = [(AVTImageTransitioningContainerView *)self staticImage];
  if (v28)
  {
    v29 = [(AVTImageTransitioningContainerView *)self staticImage];
    [v29 size];
    double v31 = v30;
    double v33 = v32;
  }
  else
  {
    double v31 = 1.0;
    double v33 = 1.0;
  }

  v34 = objc_opt_class();
  uint64_t v35 = [(AVTImageTransitioningContainerView *)self window];
  double v36 = [(id)v35 screen];
  [v36 scale];
  double v59 = v6;
  double v60 = v4;
  objc_msgSend(v34, "imageViewRectForContentRect:liveViewRect:imageSize:scale:", v4, v6, v62, v61, v21, v23, v25, v27, *(void *)&v31, *(void *)&v33, v37);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  v46 = [(AVTImageTransitioningContainerView *)self liveView];
  [v46 frame];
  v66.origin.x = v47;
  v66.origin.y = v48;
  v66.size.width = v49;
  v66.size.height = v50;
  v64.origin.x = v21;
  v64.origin.y = v23;
  v64.size.width = v25;
  v64.size.height = v27;
  LOBYTE(v35) = CGRectEqualToRect(v64, v66);

  if ((v35 & 1) == 0)
  {
    v51 = [(AVTImageTransitioningContainerView *)self liveView];
    objc_msgSend(v51, "setFrame:", v21, v23, v25, v27);
  }
  v52 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
  [v52 frame];
  v67.origin.x = v53;
  v67.origin.y = v54;
  v67.size.width = v55;
  v67.size.height = v56;
  v65.origin.x = v39;
  v65.origin.y = v41;
  v65.size.width = v43;
  v65.size.height = v45;
  BOOL v57 = CGRectEqualToRect(v65, v67);

  if (!v57)
  {
    v58 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
    objc_msgSend(v58, "setFrame:", v39, v41, v43, v45);
  }
  objc_msgSend((id)objc_opt_class(), "borderMaskRectForContentRect:", v60, v59, v62, v61);
  -[UIView setFrame:](self->_borderMaskView, "setFrame:");
}

- (void)transitionStaticViewToFront
{
  double v3 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
  [(AVTImageTransitioningContainerView *)self bringSubviewToFront:v3];

  double v4 = [(AVTImageTransitioningContainerView *)self liveView];
  [v4 setAlpha:0.0];

  id v5 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
  [v5 setAlpha:1.0];
}

- (void)transitionLiveViewToFront
{
  double v3 = [(AVTImageTransitioningContainerView *)self liveView];
  [(AVTImageTransitioningContainerView *)self bringSubviewToFront:v3];

  double v4 = [(AVTImageTransitioningContainerView *)self liveView];
  [v4 setAlpha:1.0];

  id v5 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
  [v5 setAlpha:0.0];
}

- (void)setStaticViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(AVTImageTransitioningContainerView *)self imageViewsContainer];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [v4 setAlpha:v5];
}

- (UIView)liveView
{
  return self->_liveView;
}

- (UIImage)staticImage
{
  return self->_staticImage;
}

- (CGSize)aspectRatio
{
  double width = self->_aspectRatio.width;
  double height = self->_aspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (AVTUIAnimatingImageView)imageViewsContainer
{
  return self->_imageViewsContainer;
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_imageViewsContainer, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
  objc_storeStrong((id *)&self->_liveView, 0);
}

@end