@interface CFXFaceReticleView
- (BOOL)canPerformFadeInAnimations;
- (BOOL)canPerformFadeOutAnimations;
- (BOOL)isShowingFaceIndicator;
- (CFXFaceReticleView)initWithFrame:(CGRect)a3 reticleType:(int64_t)a4;
- (NSMutableArray)reticleLayersToAnimate;
- (UIImageView)reticleImageView;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIViewPropertyAnimator)animojiBounceAnimator;
- (UIViewPropertyAnimator)animojiFadeOutAnimator;
- (UIViewPropertyAnimator)bounceAnimator;
- (UIViewPropertyAnimator)fadeOutAnimator;
- (void)animojiCloseAnimationWithCompletion:(id)a3;
- (void)animojiFadeInAnimation;
- (void)fadeInAnimation;
- (void)fadeOutAndEndHapticWithCompletionBlock:(id)a3;
- (void)fadeOutAnimationWithCompletion:(id)a3;
- (void)hideAnimojiFaceReticleAnimatedWithCompletion:(id)a3;
- (void)setAnimojiBounceAnimator:(id)a3;
- (void)setAnimojiFadeOutAnimator:(id)a3;
- (void)setBounceAnimator:(id)a3;
- (void)setCanPerformFadeInAnimations:(BOOL)a3;
- (void)setCanPerformFadeOutAnimations:(BOOL)a3;
- (void)setFadeOutAnimator:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setIsShowingFaceIndicator:(BOOL)a3;
- (void)setReticleImageView:(id)a3;
- (void)setReticleLayersToAnimate:(id)a3;
- (void)setupAnimojiReticleLayers;
- (void)shouldUseHapticFeedback:(BOOL)a3;
- (void)showAndAnimateAnimojiFaceReticle;
- (void)updateFrameForDisplayRelativeToBounds:(CGRect)a3;
- (void)userFeedbackForTrackingType:(int64_t)a3 needsHaptics:(BOOL)a4;
@end

@implementation CFXFaceReticleView

- (CFXFaceReticleView)initWithFrame:(CGRect)a3 reticleType:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CFXFaceReticleView;
  v9 = -[CFXFaceReticleView initWithFrame:](&v19, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v9->_isShowingFaceIndicator = 0;
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", x, y, width, height);
    reticleImageView = v10->_reticleImageView;
    v10->_reticleImageView = (UIImageView *)v11;

    [(UIImageView *)v10->_reticleImageView setHidden:1];
    v10->_canPerformFadeInAnimations = 1;
    if (a4 == 1)
    {
      [(CFXFaceReticleView *)v10 setupAnimojiReticleLayers];
    }
    else if (!a4)
    {
      v13 = (void *)MEMORY[0x263F1C6B0];
      v14 = [MEMORY[0x263F086E0] jfxBundle];
      v15 = [v13 imageNamed:@"faceIndicator" inBundle:v14 compatibleWithTraitCollection:0];

      [v15 size];
      v17 = objc_msgSend(v15, "resizableImageWithCapInsets:", v16 * 0.5, v16 * 0.5, v16 * 0.5, v16 * 0.5);
      [(UIImageView *)v10->_reticleImageView setImage:v17];
    }
    [(CFXFaceReticleView *)v10 addSubview:v10->_reticleImageView];
  }
  return v10;
}

- (void)updateFrameForDisplayRelativeToBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = +[JFXOrientationMonitor interfaceOrientation];
  v9 = +[CFXMediaSettings sharedInstance];
  [v9 frameSize];
  unint64_t v12 = aspectRatioForSize(v10, v11);
  long long v22 = *MEMORY[0x263F010E0];
  uint64_t v23 = *(void *)(MEMORY[0x263F010E0] + 16);
  +[JFXEffectEditingUtilities currentFaceRectRelativeToBounds:atTime:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "currentFaceRectRelativeToBounds:atTime:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v22, 0, 1, v8, v12, 0, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(CFXFaceReticleView *)self reticleImageView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
}

- (void)userFeedbackForTrackingType:(int64_t)a3 needsHaptics:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1) {
    [(CFXFaceReticleView *)self fadeInAnimation];
  }
  else {
    [(CFXFaceReticleView *)self fadeOutAnimationWithCompletion:0];
  }
  [(CFXFaceReticleView *)self shouldUseHapticFeedback:v4];
}

- (void)fadeInAnimation
{
  if ([(CFXFaceReticleView *)self canPerformFadeInAnimations])
  {
    [(CFXFaceReticleView *)self setCanPerformFadeInAnimations:0];
    [(CFXFaceReticleView *)self setCanPerformFadeOutAnimations:1];
    v3 = [(CFXFaceReticleView *)self reticleImageView];
    [v3 setHidden:0];

    BOOL v4 = [(CFXFaceReticleView *)self reticleImageView];
    [v4 setAlpha:0.0];

    CGAffineTransformMakeScale(&v21, 0.85, 0.85);
    v5 = [(CFXFaceReticleView *)self reticleImageView];
    CGAffineTransform v20 = v21;
    [v5 setTransform:&v20];

    id v6 = objc_alloc(MEMORY[0x263F1CB78]);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __37__CFXFaceReticleView_fadeInAnimation__block_invoke;
    v19[3] = &unk_264C09FA8;
    v19[4] = self;
    v7 = (void *)[v6 initWithDuration:0 curve:v19 animations:0.5];
    [v7 startAnimation];
    id v8 = objc_alloc(MEMORY[0x263F1CB78]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __37__CFXFaceReticleView_fadeInAnimation__block_invoke_2;
    v18[3] = &unk_264C09FA8;
    v18[4] = self;
    v9 = (void *)[v8 initWithDuration:0 curve:v18 animations:0.7];
    [(CFXFaceReticleView *)self setBounceAnimator:v9];

    objc_initWeak(&location, self);
    double v10 = [(CFXFaceReticleView *)self bounceAnimator];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    double v14 = __37__CFXFaceReticleView_fadeInAnimation__block_invoke_3;
    double v15 = &unk_264C0CDD8;
    objc_copyWeak(&v16, &location);
    [v10 addCompletion:&v12];

    double v11 = [(CFXFaceReticleView *)self bounceAnimator];
    [v11 startAnimationAfterDelay:0.5];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reticleImageView];
  [v2 setAlpha:1.0];

  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v3 = [*(id *)(a1 + 32) reticleImageView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = 2139095040;
  [MEMORY[0x263F1CB60] setAnimationRepeatCount:a2];
  [MEMORY[0x263F1CB60] setAnimationRepeatAutoreverses:1];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  CGAffineTransform v4 = [*(id *)(a1 + 32) reticleImageView];
  CGAffineTransform v5 = v7;
  [v4 setTransform:&v5];
}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCanPerformFadeInAnimations:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setBounceAnimator:0];
}

- (void)fadeOutAnimationWithCompletion:(id)a3
{
  CGAffineTransform v4 = (void (**)(void))a3;
  if ([(CFXFaceReticleView *)self canPerformFadeOutAnimations])
  {
    [(CFXFaceReticleView *)self setCanPerformFadeOutAnimations:0];
    id v5 = objc_alloc(MEMORY[0x263F1CB78]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke;
    v17[3] = &unk_264C09FA8;
    v17[4] = self;
    CGAffineTransform v6 = (void *)[v5 initWithDuration:0 curve:v17 animations:0.5];
    [(CFXFaceReticleView *)self setFadeOutAnimator:v6];

    objc_initWeak(&location, self);
    CGAffineTransform v7 = [(CFXFaceReticleView *)self fadeOutAnimator];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_2;
    v14[3] = &unk_264C0CDD8;
    objc_copyWeak(&v15, &location);
    [v7 addCompletion:v14];

    id v8 = [(CFXFaceReticleView *)self fadeOutAnimator];
    [v8 startAnimation];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if (v4)
  {
    v9 = [(CFXFaceReticleView *)self fadeOutAnimator];
    int v10 = [v9 isRunning];

    if (v10)
    {
      double v11 = [(CFXFaceReticleView *)self fadeOutAnimator];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_3;
      v12[3] = &unk_264C0AA48;
      uint64_t v13 = v4;
      [v11 addCompletion:v12];
    }
    else
    {
      v4[2](v4);
    }
  }
}

void __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reticleImageView];
  [v1 setAlpha:0.0];
}

void __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained reticleImageView];
  [v5 setHidden:1];

  id v6 = objc_loadWeakRetained(v3);
  CGAffineTransform v7 = [v6 bounceAnimator];
  [v7 stopAnimation:0];

  id v8 = objc_loadWeakRetained(v3);
  v9 = [v8 bounceAnimator];
  [v9 finishAnimationAtPosition:a2];

  id v10 = objc_loadWeakRetained(v3);
  [v10 setFadeOutAnimator:0];
}

uint64_t __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fadeOutAndEndHapticWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(CFXFaceReticleView *)self shouldUseHapticFeedback:0];
  [(CFXFaceReticleView *)self fadeOutAnimationWithCompletion:v4];
}

- (void)shouldUseHapticFeedback:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CFXFaceReticleView *)self feedbackGenerator];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F1C970]);
      [(CFXFaceReticleView *)self setFeedbackGenerator:v5];

      id v6 = [(CFXFaceReticleView *)self feedbackGenerator];
      [v6 _setOutputMode:5];
    }
    CGAffineTransform v7 = [(CFXFaceReticleView *)self feedbackGenerator];
    [v7 prepare];

    id v8 = [(CFXFaceReticleView *)self feedbackGenerator];
    [v8 selectionChanged];
  }
  else
  {
    [(CFXFaceReticleView *)self setFeedbackGenerator:0];
  }
}

- (void)setupAnimojiReticleLayers
{
  [(CFXFaceReticleView *)self bounds];
  double v3 = 0.125;
  double v5 = (v4 * 0.125 * 3.14159265 * 3.0 * 0.5 - v4 * 0.5) / (v4 + v4);
  id v6 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CFXFaceReticleView *)self setReticleLayersToAnimate:v7];

  id v8 = [(CFXFaceReticleView *)self reticleLayersToAnimate];
  unint64_t v9 = [v8 count];

  uint64_t v10 = *MEMORY[0x263F15E70];
  if (v9 <= 7)
  {
    double v11 = 0.375;
    do
    {
      uint64_t v12 = (void *)MEMORY[0x263F1C478];
      [(CFXFaceReticleView *)self bounds];
      uint64_t v13 = objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:");
      id v14 = objc_alloc_init(MEMORY[0x263F15880]);
      objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
      id v15 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v14, "setFillColor:", objc_msgSend(v15, "CGColor"));

      [v14 setLineWidth:5.0];
      [v14 setLineCap:v10];
      [v14 setStrokeStart:v3 + 0.045 - v5];
      [v14 setStrokeEnd:v11 + -0.045 - v5];
      id v16 = v13;
      objc_msgSend(v14, "setPath:", objc_msgSend(v16, "CGPath"));
      double v17 = [(UIImageView *)self->_reticleImageView layer];
      [v17 addSublayer:v14];

      double v18 = [(CFXFaceReticleView *)self reticleLayersToAnimate];
      [v18 addObject:v14];

      double v3 = v3 + 0.25;
      double v11 = v11 + 0.25;

      double v19 = [(CFXFaceReticleView *)self reticleLayersToAnimate];
      unint64_t v20 = [v19 count];
    }
    while (v20 < 8);
  }
  CGAffineTransform v21 = (void *)MEMORY[0x263F1C478];
  [(CFXFaceReticleView *)self bounds];
  long long v22 = objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:");
  id v23 = objc_alloc_init(MEMORY[0x263F15880]);
  id v28 = v6;
  objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v28, "CGColor"));
  id v24 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v23, "setFillColor:", objc_msgSend(v24, "CGColor"));

  [v23 setLineWidth:5.0];
  [v23 setLineCap:v10];
  [v23 setStrokeStart:0.0];
  [v23 setStrokeEnd:0.08 - v5];
  id v25 = v22;
  objc_msgSend(v23, "setPath:", objc_msgSend(v25, "CGPath"));
  v26 = [(UIImageView *)self->_reticleImageView layer];
  [v26 addSublayer:v23];

  v27 = [(CFXFaceReticleView *)self reticleLayersToAnimate];
  [v27 addObject:v23];
}

- (void)animojiFadeInAnimation
{
  double v3 = [(CFXFaceReticleView *)self reticleImageView];
  [v3 setHidden:0];

  double v4 = [(CFXFaceReticleView *)self reticleImageView];
  [v4 setAlpha:0.0];

  id v5 = objc_alloc(MEMORY[0x263F1CB78]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke;
  v18[3] = &unk_264C09FA8;
  v18[4] = self;
  id v6 = (void *)[v5 initWithDuration:0 curve:v18 animations:0.4];
  [v6 startAnimation];
  id v7 = objc_alloc(MEMORY[0x263F1CB78]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_2;
  v17[3] = &unk_264C09FA8;
  v17[4] = self;
  id v8 = (void *)[v7 initWithDuration:0 curve:v17 animations:0.4];
  [(CFXFaceReticleView *)self setAnimojiBounceAnimator:v8];

  objc_initWeak(&location, self);
  unint64_t v9 = [(CFXFaceReticleView *)self animojiBounceAnimator];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_3;
  id v14 = &unk_264C0CDD8;
  objc_copyWeak(&v15, &location);
  [v9 addCompletion:&v11];

  uint64_t v10 = [(CFXFaceReticleView *)self animojiBounceAnimator];
  [v10 startAnimation];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reticleImageView];
  [v1 setAlpha:1.0];
}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = 2139095040;
  [MEMORY[0x263F1CB60] setAnimationRepeatCount:a2];
  [MEMORY[0x263F1CB60] setAnimationRepeatAutoreverses:1];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  double v4 = [*(id *)(a1 + 32) reticleImageView];
  CGAffineTransform v5 = v7;
  [v4 setTransform:&v5];
}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setBounceAnimator:0];
}

- (void)animojiCloseAnimationWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [MEMORY[0x263F158F8] begin];
  CGAffineTransform v5 = (void *)MEMORY[0x263F158F8];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __58__CFXFaceReticleView_animojiCloseAnimationWithCompletion___block_invoke;
  v29[3] = &unk_264C0A3F0;
  id v22 = v4;
  id v30 = v22;
  [v5 setCompletionBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CFXFaceReticleView *)self reticleLayersToAnimate];
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v24 = *(void *)v26;
    uint64_t v8 = *MEMORY[0x263F15AB0];
    uint64_t v9 = *MEMORY[0x263F15EB8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        uint64_t v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
        uint64_t v13 = NSNumber;
        [v11 strokeStart];
        id v15 = [v13 numberWithDouble:v14 + -0.045];
        [v12 setToValue:v15];

        [v12 setDuration:0.2];
        [v12 setFillMode:v8];
        id v16 = [MEMORY[0x263F15808] functionWithName:v9];
        [v12 setTimingFunction:v16];

        [v12 setRemovedOnCompletion:0];
        double v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
        double v18 = NSNumber;
        [v11 strokeEnd];
        unint64_t v20 = [v18 numberWithDouble:v19 + 0.045];
        [v17 setToValue:v20];

        [v17 setDuration:0.2];
        [v17 setFillMode:v8];
        CGAffineTransform v21 = [MEMORY[0x263F15808] functionWithName:v9];
        [v17 setTimingFunction:v21];

        [v17 setRemovedOnCompletion:0];
        [v11 addAnimation:v17 forKey:0];
        [v11 addAnimation:v12 forKey:0];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  [MEMORY[0x263F158F8] commit];
}

uint64_t __58__CFXFaceReticleView_animojiCloseAnimationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showAndAnimateAnimojiFaceReticle
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CFXFaceReticleView_showAndAnimateAnimojiFaceReticle__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __54__CFXFaceReticleView_showAndAnimateAnimojiFaceReticle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animojiFadeInAnimation];
}

- (void)hideAnimojiFaceReticleAnimatedWithCompletion:(id)a3
{
  id v4 = a3;
  CGAffineTransform v5 = [(CFXFaceReticleView *)self animojiBounceAnimator];
  [v5 stopAnimation:1];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CFXFaceReticleView *)self animojiCloseAnimationWithCompletion:v7];
}

void __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F1CB78]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_2;
  v13[3] = &unk_264C09FA8;
  v13[4] = *(void *)(a1 + 32);
  dispatch_time_t v3 = (void *)[v2 initWithDuration:0 curve:v13 animations:0.4];
  [*(id *)(a1 + 32) setAnimojiFadeOutAnimator:v3];

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) animojiFadeOutAnimator];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_3;
  uint64_t v9 = &unk_264C0CE00;
  objc_copyWeak(&v11, &location);
  id v10 = *(id *)(a1 + 40);
  [v4 addCompletion:&v6];

  CGAffineTransform v5 = objc_msgSend(*(id *)(a1 + 32), "animojiFadeOutAnimator", v6, v7, v8, v9);
  [v5 startAnimationAfterDelay:0.2];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reticleImageView];
  [v1 setAlpha:0.0];
}

uint64_t __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained reticleImageView];
  [v4 setHidden:1];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setFadeOutAnimator:0];

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

- (BOOL)isShowingFaceIndicator
{
  return self->_isShowingFaceIndicator;
}

- (void)setIsShowingFaceIndicator:(BOOL)a3
{
  self->_isShowingFaceIndicator = a3;
}

- (UIImageView)reticleImageView
{
  return self->_reticleImageView;
}

- (void)setReticleImageView:(id)a3
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)canPerformFadeInAnimations
{
  return self->_canPerformFadeInAnimations;
}

- (void)setCanPerformFadeInAnimations:(BOOL)a3
{
  self->_canPerformFadeInAnimations = a3;
}

- (BOOL)canPerformFadeOutAnimations
{
  return self->_canPerformFadeOutAnimations;
}

- (void)setCanPerformFadeOutAnimations:(BOOL)a3
{
  self->_canPerformFadeOutAnimations = a3;
}

- (UIViewPropertyAnimator)bounceAnimator
{
  return self->_bounceAnimator;
}

- (void)setBounceAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)fadeOutAnimator
{
  return self->_fadeOutAnimator;
}

- (void)setFadeOutAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)animojiBounceAnimator
{
  return self->_animojiBounceAnimator;
}

- (void)setAnimojiBounceAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)animojiFadeOutAnimator
{
  return self->_animojiFadeOutAnimator;
}

- (void)setAnimojiFadeOutAnimator:(id)a3
{
}

- (NSMutableArray)reticleLayersToAnimate
{
  return self->_reticleLayersToAnimate;
}

- (void)setReticleLayersToAnimate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reticleLayersToAnimate, 0);
  objc_storeStrong((id *)&self->_animojiFadeOutAnimator, 0);
  objc_storeStrong((id *)&self->_animojiBounceAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutAnimator, 0);
  objc_storeStrong((id *)&self->_bounceAnimator, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_reticleImageView, 0);
}

@end