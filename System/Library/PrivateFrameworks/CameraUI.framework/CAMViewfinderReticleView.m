@interface CAMViewfinderReticleView
- (BOOL)cornersVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAMViewfinderReticleView)initWithFrame:(CGRect)a3;
- (UIImageView)_bottomLeftCornerView;
- (UIImageView)_bottomRightCornerView;
- (UIImageView)_topLeftCornerView;
- (UIImageView)_topRightCornerView;
- (UIImageView)_viewportBorderView;
- (UIView)_bottomMaskingView;
- (UIView)_topMaskingView;
- (double)viewportBottomInset;
- (double)viewportTopInset;
- (id)_newViewportCornerImage;
- (id)_newViewportTemplateImage;
- (int64_t)material;
- (void)_updateMaterialOpacityWithDuration:(double)a3;
- (void)layoutSubviews;
- (void)setCornersVisible:(BOOL)a3;
- (void)setCornersVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setMaterial:(int64_t)a3;
- (void)setMaterial:(int64_t)a3 withDuration:(double)a4;
- (void)setViewportTopInset:(double)a3 bottomInset:(double)a4 animated:(BOOL)a5;
@end

@implementation CAMViewfinderReticleView

- (CAMViewfinderReticleView)initWithFrame:(CGRect)a3
{
  v60.receiver = self;
  v60.super_class = (Class)CAMViewfinderReticleView;
  v3 = -[CAMViewfinderReticleView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_cornersVisible = 1;
    id v5 = objc_alloc(MEMORY[0x263F82E00]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    topMaskingView = v4->__topMaskingView;
    v4->__topMaskingView = (UIView *)v10;

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
    bottomMaskingView = v4->__bottomMaskingView;
    v4->__bottomMaskingView = (UIView *)v12;

    [(CAMViewfinderReticleView *)v4 addSubview:v4->__topMaskingView];
    [(CAMViewfinderReticleView *)v4 addSubview:v4->__bottomMaskingView];
    v14 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v15 = objc_msgSend(v14, "cam_initialLayoutStyle");

    v16 = +[CAMCaptureCapabilities capabilities];
    int v17 = [v16 useReticleStroke];

    if (v17)
    {
      id v18 = [(CAMViewfinderReticleView *)v4 _newViewportTemplateImage];
      objc_msgSend(v18, "resizableImageWithCapInsets:resizingMode:", 1, 24.0, 24.0, 24.0, 24.0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v20 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
      p_viewportBorderView = &v4->__viewportBorderView;
      viewportBorderView = v4->__viewportBorderView;
      v4->__viewportBorderView = (UIImageView *)v20;
    }
    else
    {
      if (v15 != 4)
      {
LABEL_7:
        v35 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
        v36 = [(CAMViewfinderReticleView *)v4 _topMaskingView];
        [v36 setBackgroundColor:v35];

        v37 = [(CAMViewfinderReticleView *)v4 _bottomMaskingView];
        [v37 setBackgroundColor:v35];

        [(CAMViewfinderReticleView *)v4 _updateMaterialOpacityWithDuration:0.0];
        v38 = v4;

        goto LABEL_8;
      }
      id v19 = [(CAMViewfinderReticleView *)v4 _newViewportCornerImage];
      uint64_t v23 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
      topLeftCornerView = v4->__topLeftCornerView;
      v4->__topLeftCornerView = (UIImageView *)v23;

      uint64_t v25 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
      topRightCornerView = v4->__topRightCornerView;
      v4->__topRightCornerView = (UIImageView *)v25;

      uint64_t v27 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
      bottomLeftCornerView = v4->__bottomLeftCornerView;
      v4->__bottomLeftCornerView = (UIImageView *)v27;

      uint64_t v29 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
      p_viewportBorderView = &v4->__bottomRightCornerView;
      bottomRightCornerView = v4->__bottomRightCornerView;
      v4->__bottomRightCornerView = (UIImageView *)v29;

      CGAffineTransformMakeRotation(&v56, 0.0);
      UIIntegralTransform();
      v31 = v4->__topLeftCornerView;
      v55[0] = v57;
      v55[1] = v58;
      v55[2] = v59;
      [(UIImageView *)v31 setTransform:v55];
      CGAffineTransformMakeRotation(&v51, 1.57079633);
      UIIntegralTransform();
      v32 = v4->__topRightCornerView;
      v50[0] = v52;
      v50[1] = v53;
      v50[2] = v54;
      [(UIImageView *)v32 setTransform:v50];
      CGAffineTransformMakeRotation(&v46, -1.57079633);
      UIIntegralTransform();
      v33 = v4->__bottomLeftCornerView;
      v45[0] = v47;
      v45[1] = v48;
      v45[2] = v49;
      [(UIImageView *)v33 setTransform:v45];
      CGAffineTransformMakeRotation(&v41, 3.14159265);
      UIIntegralTransform();
      v34 = v4->__bottomRightCornerView;
      v40[0] = v42;
      v40[1] = v43;
      v40[2] = v44;
      [(UIImageView *)v34 setTransform:v40];
      [(CAMViewfinderReticleView *)v4 addSubview:v4->__topLeftCornerView];
      [(CAMViewfinderReticleView *)v4 addSubview:v4->__topRightCornerView];
      [(CAMViewfinderReticleView *)v4 addSubview:v4->__bottomLeftCornerView];
    }
    [(CAMViewfinderReticleView *)v4 addSubview:*p_viewportBorderView];

    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (void)layoutSubviews
{
  id v44 = [(CAMViewfinderReticleView *)self _topMaskingView];
  v3 = [(CAMViewfinderReticleView *)self _bottomMaskingView];
  [(CAMViewfinderReticleView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(CAMViewfinderReticleView *)self viewportTopInset];
  objc_msgSend(v44, "setFrame:", 0.0, 0.0, v5, v8);
  [(CAMViewfinderReticleView *)self viewportBottomInset];
  double v10 = v7 - v9;
  [(CAMViewfinderReticleView *)self viewportBottomInset];
  objc_msgSend(v3, "setFrame:", 0.0, v10, v5, v11);
  [(CAMViewfinderReticleView *)self viewportBottomInset];
  double v13 = v7 - v12;
  [(CAMViewfinderReticleView *)self viewportTopInset];
  double v15 = v13 - v14;
  [(CAMViewfinderReticleView *)self viewportTopInset];
  double v17 = v16;
  id v18 = +[CAMCaptureCapabilities capabilities];
  int v19 = [v18 useReticleStroke];

  if (v19)
  {
    uint64_t v20 = [(CAMViewfinderReticleView *)self _viewportBorderView];
    objc_msgSend(v20, "setFrame:", 0.0, v17, v5, v15);
  }
  else
  {
    v46.origin.CGFloat x = 0.0;
    v46.origin.CGFloat y = v17;
    v46.size.CGFloat width = v5;
    v46.size.CGFloat height = v15;
    CGRect v47 = CGRectInset(v46, 12.0, 12.0);
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    CGRectGetMinX(v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRectGetMinY(v48);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    double v26 = v25;
    double v28 = v27;
    uint64_t v29 = [(CAMViewfinderReticleView *)self _topLeftCornerView];
    objc_msgSend(v29, "setCenter:", v26, v28);

    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGRectGetMaxX(v49);
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRectGetMinY(v50);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    double v31 = v30;
    double v33 = v32;
    v34 = [(CAMViewfinderReticleView *)self _topRightCornerView];
    objc_msgSend(v34, "setCenter:", v31, v33);

    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGRectGetMinX(v51);
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGRectGetMaxY(v52);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    double v36 = v35;
    double v38 = v37;
    v39 = [(CAMViewfinderReticleView *)self _bottomLeftCornerView];
    objc_msgSend(v39, "setCenter:", v36, v38);

    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGRectGetMaxX(v53);
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    CGRectGetMaxY(v54);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    double v41 = v40;
    double v43 = v42;
    uint64_t v20 = [(CAMViewfinderReticleView *)self _bottomRightCornerView];
    objc_msgSend(v20, "setCenter:", v41, v43);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = [(CAMViewfinderReticleView *)self _topMaskingView];
  [(id)v7 frame];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v8 = CGRectContainsPoint(v13, v11);

  double v9 = [(CAMViewfinderReticleView *)self _bottomMaskingView];
  [v9 frame];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  LOBYTE(v7) = CGRectContainsPoint(v14, v12);

  return v8 | v7;
}

- (void)setMaterial:(int64_t)a3
{
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  if (self->_material != a3)
  {
    self->_material = a3;
    [(CAMViewfinderReticleView *)self _updateMaterialOpacityWithDuration:a4];
  }
}

- (void)_updateMaterialOpacityWithDuration:(double)a3
{
  double v5 = +[CAMCaptureCapabilities capabilities];
  uint64_t v6 = 0;
  if (([v5 featureDevelopmentHidePreviewOverlayBars] & 1) == 0)
  {
    unint64_t v7 = [(CAMViewfinderReticleView *)self material];
    if (v7 <= 4) {
      uint64_t v6 = qword_209C7B028[v7];
    }
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CAMViewfinderReticleView__updateMaterialOpacityWithDuration___block_invoke;
  v8[3] = &unk_263FA04E0;
  v8[4] = self;
  v8[5] = v6;
  +[CAMView animateIfNeededWithDuration:4 options:v8 animations:0 completion:a3];
}

void __63__CAMViewfinderReticleView__updateMaterialOpacityWithDuration___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) _topMaskingView];
  [v3 setAlpha:v2];

  double v4 = *(double *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) _bottomMaskingView];
  [v5 setAlpha:v4];
}

- (id)_newViewportCornerImage
{
  v6.CGFloat width = 24.0;
  v6.CGFloat height = 24.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.51];
  [v3 setStroke];
  v7.origin.CGFloat x = 0.5;
  v7.origin.CGFloat y = 0.5;
  v7.size.CGFloat width = 24.0;
  v7.size.CGFloat height = 24.0;
  CGContextStrokeRectWithWidth(CurrentContext, v7, 1.0);
  double v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
}

- (id)_newViewportTemplateImage
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v36.CGFloat width = 49.0;
  v36.CGFloat height = 49.0;
  UIGraphicsBeginImageContextWithOptions(v36, 0, 0.0);
  double v2 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.51];
  [v2 setStroke];
  CurrentContext = UIGraphicsGetCurrentContext();
  v37.origin.CGFloat x = *(CGFloat *)MEMORY[0x263F00148];
  v37.origin.CGFloat y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v37.size.CGFloat width = 49.0;
  v37.size.CGFloat height = 49.0;
  CGRect v38 = CGRectInset(v37, 0.5, 0.5);
  CGContextStrokeRectWithWidth(CurrentContext, v38, 1.0);
  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 24.0, 0.0, 1.0, 1.0);
  CGSize v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 0.0, 24.0, 1.0, 1.0);
  CGRect v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 24.0, 48.0, 1.0, 1.0);
  BOOL v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 48.0, 24.0, 1.0, 1.0);
  double v9 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, 0);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v14) CGRectValue];
        CGContextClearRect(CurrentContext, v39);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  double v15 = +[CAMCaptureCapabilities capabilities];
  int v16 = [v15 useReticleStroke];

  if (v16)
  {
    double v17 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
    [v17 setFill];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v22) CGRectValue];
          CGContextFillRect(CurrentContext, v40);
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }
  }
  uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v23;
}

- (void)setViewportTopInset:(double)a3 bottomInset:(double)a4 animated:(BOOL)a5
{
  if (self->_viewportTopInset != a3 || self->_viewportBottomInset != a4)
  {
    if (a5)
    {
      [(CAMViewfinderReticleView *)self layoutIfNeeded];
      self->_viewportTopInset = a3;
      self->_viewportBottomInset = a4;
      [(CAMViewfinderReticleView *)self setNeedsLayout];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __69__CAMViewfinderReticleView_setViewportTopInset_bottomInset_animated___block_invoke;
      v8[3] = &unk_263FA0208;
      v8[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      self->_viewportTopInset = a3;
      self->_viewportBottomInset = a4;
      [(CAMViewfinderReticleView *)self setNeedsLayout];
    }
  }
}

uint64_t __69__CAMViewfinderReticleView_setViewportTopInset_bottomInset_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setCornersVisible:(BOOL)a3
{
}

- (void)setCornersVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_cornersVisible != a3)
  {
    self->_cornersVisible = a3;
    double v4 = 0.0;
    v6[1] = 3221225472;
    double v5 = 1.0;
    if (!a3) {
      double v5 = 0.0;
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[2] = __55__CAMViewfinderReticleView_setCornersVisible_animated___block_invoke;
    v6[3] = &unk_263FA04E0;
    if (a4) {
      double v4 = 0.25;
    }
    v6[4] = self;
    *(double *)&v6[5] = v5;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v6, v4, 0.25);
  }
}

void __55__CAMViewfinderReticleView_setCornersVisible_animated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) _topLeftCornerView];
  [v3 setAlpha:v2];

  double v4 = *(double *)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) _topRightCornerView];
  [v5 setAlpha:v4];

  double v6 = *(double *)(a1 + 40);
  CGRect v7 = [*(id *)(a1 + 32) _bottomLeftCornerView];
  [v7 setAlpha:v6];

  double v8 = *(double *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) _bottomRightCornerView];
  [v9 setAlpha:v8];
}

- (double)viewportTopInset
{
  return self->_viewportTopInset;
}

- (double)viewportBottomInset
{
  return self->_viewportBottomInset;
}

- (int64_t)material
{
  return self->_material;
}

- (BOOL)cornersVisible
{
  return self->_cornersVisible;
}

- (UIView)_topMaskingView
{
  return self->__topMaskingView;
}

- (UIView)_bottomMaskingView
{
  return self->__bottomMaskingView;
}

- (UIImageView)_viewportBorderView
{
  return self->__viewportBorderView;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
  objc_storeStrong((id *)&self->__viewportBorderView, 0);
  objc_storeStrong((id *)&self->__bottomMaskingView, 0);
  objc_storeStrong((id *)&self->__topMaskingView, 0);
}

@end