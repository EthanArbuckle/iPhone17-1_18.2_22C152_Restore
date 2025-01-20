@interface CKPaddleOverlayView
- (CGRect)anchorRect;
- (CGRect)overlayRect;
- (CKPaddleOverlayView)initWithOverlayView:(id)a3 atAnchorRect:(CGRect)a4 inView:(id)a5 delegate:(id)a6;
- (CKPaddleOverlayViewDelegate)delegate;
- (UIImageView)shadowView;
- (UIView)contentView;
- (UIView)darkOuterGlowView;
- (UIView)innerGlowView;
- (UIView)paddleView;
- (UIView)viewToShow;
- (UIVisualEffectView)visualEffectView;
- (void)dismiss;
- (void)setAnchorRect:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setDarkOuterGlowView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInnerGlowView:(id)a3;
- (void)setOverlayRect:(CGRect)a3;
- (void)setPaddleView:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setViewToShow:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)showPaddleAnimated:(BOOL)a3 completion:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateShadowVisualStyling;
@end

@implementation CKPaddleOverlayView

- (CKPaddleOverlayView)initWithOverlayView:(id)a3 atAnchorRect:(CGRect)a4 inView:(id)a5 delegate:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v15 = a5;
  [(CKPaddleOverlayView *)self setDelegate:a6];
  [(CKPaddleOverlayView *)self setOpaque:0];
  v16 = [(CKPaddleOverlayView *)self layer];
  [v16 setAllowsGroupBlending:0];

  id v17 = v15;
  v18 = [v17 superview];

  v19 = v17;
  if (v18)
  {
    v20 = v17;
    do
    {
      v19 = [v20 superview];

      v21 = [v19 superview];

      v20 = v19;
    }
    while (v21);
  }
  objc_msgSend(v19, "convertRect:fromView:", v17, x, y, width, height);
  -[CKPaddleOverlayView setAnchorRect:](self, "setAnchorRect:");
  [v19 bounds];
  v22 = -[CKPaddleOverlayView initWithFrame:](self, "initWithFrame:");
  v23 = v22;
  if (v22)
  {
    [(CKPaddleOverlayView *)v22 bounds];
    double v25 = v24;
    p_viewToShow = (id *)&v23->_viewToShow;
    objc_storeStrong((id *)&v23->_viewToShow, a3);
    [(UIView *)v23->_viewToShow bounds];
    double v28 = v27;
    double v30 = v29;
    [(UIView *)v23->_viewToShow setFrame:v27];
    [(UIView *)v23->_viewToShow layoutIfNeeded];
    [(UIView *)v23->_viewToShow intrinsicContentSize];
    double v33 = v31;
    double v34 = v32;
    if (v31 >= v25 + -16.0) {
      double v35 = v25 + -16.0;
    }
    else {
      double v35 = v31;
    }
    if (v32 >= 94.0) {
      double v36 = v32;
    }
    else {
      double v36 = 94.0;
    }
    objc_msgSend(*p_viewToShow, "setFrame:", v28, v30, v35, v36);
    p_double x = &v23->_overlayRect.origin.x;
    float v38 = v23->_anchorRect.origin.x + v23->_anchorRect.size.width * 0.5 - v33 * 0.5;
    float v39 = ceilf(v38);
    if (v33 + 16.0 <= v25) {
      double v40 = v33;
    }
    else {
      double v40 = v25 + -16.0;
    }
    double v41 = 8.0;
    if (v39 >= 8.0)
    {
      double v41 = v39;
      if (v40 + v39 + 8.0 > v25) {
        double v41 = v25 - v40 + -8.0;
      }
    }
    float v42 = v23->_anchorRect.origin.y - v34 + -8.0;
    *p_double x = v41;
    v23->_overlayRect.origin.double y = ceilf(v42);
    v23->_overlayRect.size.double width = v40;
    v23->_overlayRect.size.double height = v34;
    uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", *p_x, v23->_overlayRect.origin.y, v23->_overlayRect.size.width, v23->_overlayRect.size.height);
    contentView = v23->_contentView;
    v23->_contentView = (UIView *)v43;

    [(CKPaddleOverlayView *)v23 addSubview:v23->_contentView];
    id v45 = objc_alloc(MEMORY[0x1E4F43028]);
    v46 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
    uint64_t v47 = [v45 initWithEffect:v46];
    visualEffectView = v23->_visualEffectView;
    v23->_visualEffectView = (UIVisualEffectView *)v47;

    v49 = v23->_visualEffectView;
    [(UIView *)v23->_contentView bounds];
    -[UIVisualEffectView setFrame:](v49, "setFrame:");
    v50 = v23->_visualEffectView;
    v51 = +[CKUIBehavior sharedBehaviors];
    [v51 paddleOverlayRadius];
    -[UIVisualEffectView _setContinuousCornerRadius:](v50, "_setContinuousCornerRadius:");

    v52 = [(UIVisualEffectView *)v23->_visualEffectView layer];
    [v52 setMasksToBounds:1];

    v53 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    shadowView = v23->_shadowView;
    v23->_shadowView = v53;

    v55 = v23->_shadowView;
    [(UIView *)v23->_contentView bounds];
    -[UIImageView setFrame:](v55, "setFrame:", v56 + -150.0, v57 + -150.0, v58 + 300.0, v59 + 300.0);
    v107 = v23->_shadowView;
    v108 = [(CKPaddleOverlayView *)v23 traitCollection];
    [v108 displayScale];
    double v61 = v60;
    if (CKShadowImageCreateWithShadowProperties_onceToken != -1) {
      dispatch_once(&CKShadowImageCreateWithShadowProperties_onceToken, &__block_literal_global_177);
    }
    v62 = [NSNumber numberWithDouble:v61];
    v63 = [(id)CKShadowImageCreateWithShadowProperties_shadowImages objectForKey:v62];
    if (!v63)
    {
      id v104 = v14;
      v105 = v62;
      id v103 = v17;
      double v64 = v61 * 400.0;
      DeviceGradouble y = CGColorSpaceCreateDeviceGray();
      if (CKIsRunningInMacCatalyst()) {
        uint32_t v66 = 1;
      }
      else {
        uint32_t v66 = 7;
      }
      char v67 = CKIsRunningInMacCatalyst() != 0;
      space = DeviceGray;
      v68 = CGBitmapContextCreate(0, (uint64_t)(v61 * 400.0), (uint64_t)(v61 * 400.0), 8uLL, (uint64_t)(v61 * 400.0) << v67, DeviceGray, v66);
      v110.origin.double x = 0.0;
      v110.origin.double y = 0.0;
      v110.size.double width = (double)(uint64_t)v64;
      v110.size.double height = v110.size.width;
      CGContextClearRect(v68, v110);
      CGContextTranslateCTM(v68, 0.0, (double)(uint64_t)v64);
      CGContextScaleCTM(v68, v61, -v61);
      UIGraphicsPushContext(v68);
      v69 = (void *)MEMORY[0x1E4F427D0];
      v111.origin.double x = 0.0;
      v111.origin.double y = 0.0;
      v111.size.double width = 400.0;
      v111.size.double height = 400.0;
      CGRect v112 = CGRectInset(v111, 150.0, 150.0);
      double v70 = v112.origin.x;
      double v71 = v112.origin.y;
      double v72 = v112.size.width;
      double v73 = v112.size.height;
      v74 = +[CKUIBehavior sharedBehaviors];
      [v74 paddleOverlayRadius];
      uint64_t v76 = objc_msgSend(v69, "bezierPathWithRoundedRect:cornerRadius:", v70, v71, v72, v73, v75);

      v106 = (void *)v76;
      if (CKIsRunningInMacCatalyst())
      {
        CGContextSaveGState(v68);
        CGContextSetBlendMode(v68, kCGBlendModeMultiply);
        v77 = +[CKUIBehavior sharedBehaviors];
        v78 = [v77 theme];
        id v79 = [v78 paddleShadow];
        v80 = (CGColor *)[v79 CGColor];
        v109.double width = 0.0;
        v109.double height = -4.0;
        CGContextSetShadowWithColor(v68, v109, 16.0, v80);

        id v81 = [MEMORY[0x1E4F428B8] whiteColor];
        CGContextSetFillColorWithColor(v68, (CGColorRef)[v81 CGColor]);

        v82 = v106;
        [v106 fill];
        CGContextRestoreGState(v68);
      }
      else
      {
        double v101 = v61;
        v83 = [MEMORY[0x1E4F42A80] kitImageNamed:@"_UIPopoverShadow"];
        int v84 = 0;
        double v85 = *MEMORY[0x1E4F1DB30];
        double v86 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v87 = *MEMORY[0x1E4F1DAD8];
        double v88 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        do
        {
          CGContextSaveGState(v68);
          switch(v84)
          {
            case 1:
              double v90 = 0.0;
              CGFloat v91 = 400.0;
              CGFloat v92 = 1.57079633;
              break;
            case 3:
              CGFloat v91 = 0.0;
              double v90 = 400.0;
              CGFloat v92 = 4.71238898;
              break;
            case 2:
              [v83 size];
              double v90 = v89 + v89;
              CGFloat v91 = 400.0;
              CGFloat v92 = 3.14159265;
              break;
            default:
              CGFloat v92 = 0.0;
              CGFloat v91 = v85;
              double v90 = v86;
              break;
          }
          CGContextTranslateCTM(v68, v91, v90);
          CGContextRotateCTM(v68, v92);
          objc_msgSend(v83, "drawAtPoint:", v87, v88);
          CGContextRestoreGState(v68);
          ++v84;
        }
        while (v84 != 4);

        double v61 = v101;
        v82 = v106;
      }
      id v93 = [MEMORY[0x1E4F428B8] blackColor];
      CGContextSetFillColorWithColor(v68, (CGColorRef)[v93 CGColor]);

      CGContextSetBlendMode(v68, kCGBlendModeClear);
      [v82 fill];
      UIGraphicsPopContext();
      Image = CGBitmapContextCreateImage(v68);
      v95 = [MEMORY[0x1E4F42A80] imageWithCGImage:Image scale:0 orientation:v61];
      v63 = objc_msgSend(v95, "resizableImageWithCapInsets:", 170.0, 170.0, 170.0, 170.0);
      if (v63) {
        [(id)CKShadowImageCreateWithShadowProperties_shadowImages setObject:v63 forKey:v105];
      }
      CGImageRelease(Image);
      CGContextRelease(v68);
      CGColorSpaceRelease(space);

      id v17 = v103;
      id v14 = v104;
      v62 = v105;
    }

    [(UIImageView *)v107 setImage:v63];
    [(CKPaddleOverlayView *)v23 updateShadowVisualStyling];
    [(UIView *)v23->_contentView addSubview:v23->_shadowView];
    id v96 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(UIVisualEffectView *)v23->_visualEffectView bounds];
    uint64_t v97 = objc_msgSend(v96, "initWithFrame:");
    paddleView = v23->_paddleView;
    v23->_paddleView = (UIView *)v97;

    [(UIView *)v23->_paddleView addSubview:*p_viewToShow];
    v99 = [(UIVisualEffectView *)v23->_visualEffectView contentView];
    [v99 addSubview:v23->_paddleView];

    [(UIView *)v23->_contentView addSubview:v23->_visualEffectView];
    [v19 addSubview:v23];
    [v19 bringSubviewToFront:v23];
  }

  return v23;
}

- (void)updateShadowVisualStyling
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!CKIsRunningInMacCatalyst())
  {
    v8[0] = xmmword_18F81D1E0;
    v8[1] = xmmword_18F81D1F0;
    v8[2] = xmmword_18F81D200;
    v8[3] = xmmword_18F81D210;
    v8[4] = xmmword_18F81D220;
    v3 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v8];
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    [v4 setValue:v3 forKey:@"inputColorMatrix"];
    v5 = [(CKPaddleOverlayView *)self shadowView];
    v6 = [v5 layer];
    v9[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 setFilters:v7];
  }
}

- (void)showPaddleAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [(CKPaddleOverlayView *)self contentView];
    v8 = [v7 layer];
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 1.0);

    [(CKPaddleOverlayView *)self overlayRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = [(CKPaddleOverlayView *)self contentView];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = [(CKPaddleOverlayView *)self contentView];
    v19 = v18;
    if (v18) {
      [v18 transform3D];
    }
    else {
      memset(&v32, 0, sizeof(v32));
    }
    double v22 = 1.0;
    CATransform3DScale(&v33, &v32, 0.2, 0.2, 1.0);
    v23 = [(CKPaddleOverlayView *)self contentView];
    CATransform3D v31 = v33;
    [v23 setTransform3D:&v31];

    double v24 = [(CKPaddleOverlayView *)self shadowView];
    [v24 setAlpha:0.0];

    double v25 = [(CKPaddleOverlayView *)self visualEffectView];
    [v25 setAlpha:0.0];

    if (UIAccessibilityIsReduceMotionEnabled())
    {
      double v26 = 0.4;
    }
    else
    {
      double v22 = 0.8;
      double v26 = 0.32;
    }
    double v27 = (void *)MEMORY[0x1E4F42FF0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke;
    v30[3] = &unk_1E5620C40;
    v30[4] = self;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke_2;
    v28[3] = &unk_1E5629A40;
    id v29 = v6;
    [v27 _animateUsingSpringWithDampingRatio:1 response:v30 tracking:v28 dampingRatioSmoothing:v22 responseSmoothing:v26 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    v20 = [(CKPaddleOverlayView *)self shadowView];
    [v20 setAlpha:1.0];

    v21 = [(CKPaddleOverlayView *)self visualEffectView];
    [v21 setAlpha:1.0];

    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

void __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v9[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v9[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v9[0] = *MEMORY[0x1E4F39B10];
  v9[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  void v9[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v9[3] = v6;
  [v2 setTransform3D:v9];

  v7 = [*(id *)(a1 + 32) shadowView];
  [v7 setAlpha:1.0];

  v8 = [*(id *)(a1 + 32) visualEffectView];
  [v8 setAlpha:1.0];
}

uint64_t __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismiss
{
  if (CKIsRunningInMacCatalyst())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __30__CKPaddleOverlayView_dismiss__block_invoke;
    v9[3] = &unk_1E5620C40;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_2;
    v8[3] = &unk_1E5620BF0;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:v8 completion:0.2];
  }
  else
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    double v4 = 0.85;
    if (IsReduceMotionEnabled) {
      double v4 = 1.0;
    }
    double v5 = 0.35;
    if (IsReduceMotionEnabled) {
      double v5 = 0.4;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_3;
    v7[3] = &unk_1E5620C40;
    v7[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_4;
    v6[3] = &unk_1E5629A68;
    v6[4] = self;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDampingRatio:0 response:v7 tracking:v6 dampingRatioSmoothing:v4 responseSmoothing:v5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
}

void __30__CKPaddleOverlayView_dismiss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) darkOuterGlowView];
  [v2 setAlpha:0.0];

  long long v3 = [*(id *)(a1 + 32) shadowView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) visualEffectView];
  [v4 setAlpha:0.0];
}

void __30__CKPaddleOverlayView_dismiss__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDismissPaddleOverlayView:*(void *)(a1 + 32)];
}

void __30__CKPaddleOverlayView_dismiss__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  long long v3 = v2;
  if (v2) {
    [v2 transform3D];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DScale(&v9, &v8, 0.2, 0.2, 1.0);
  id v4 = [*(id *)(a1 + 32) contentView];
  CATransform3D v7 = v9;
  [v4 setTransform3D:&v7];

  double v5 = [*(id *)(a1 + 32) shadowView];
  [v5 setAlpha:0.0];

  long long v6 = [*(id *)(a1 + 32) visualEffectView];
  [v6 setAlpha:0.0];
}

void __30__CKPaddleOverlayView_dismiss__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDismissPaddleOverlayView:*(void *)(a1 + 32)];
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKPaddleOverlayView;
  [(CKPaddleOverlayView *)&v3 traitCollectionDidChange:a3];
}

- (CKPaddleOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKPaddleOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIView)darkOuterGlowView
{
  return self->_darkOuterGlowView;
}

- (void)setDarkOuterGlowView:(id)a3
{
}

- (UIView)innerGlowView
{
  return self->_innerGlowView;
}

- (void)setInnerGlowView:(id)a3
{
}

- (UIView)paddleView
{
  return self->_paddleView;
}

- (void)setPaddleView:(id)a3
{
}

- (UIView)viewToShow
{
  return self->_viewToShow;
}

- (void)setViewToShow:(id)a3
{
}

- (CGRect)overlayRect
{
  double x = self->_overlayRect.origin.x;
  double y = self->_overlayRect.origin.y;
  double width = self->_overlayRect.size.width;
  double height = self->_overlayRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOverlayRect:(CGRect)a3
{
  self->_overlayRect = a3;
}

- (CGRect)anchorRect
{
  double x = self->_anchorRect.origin.x;
  double y = self->_anchorRect.origin.y;
  double width = self->_anchorRect.size.width;
  double height = self->_anchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewToShow, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_innerGlowView, 0);
  objc_storeStrong((id *)&self->_darkOuterGlowView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end