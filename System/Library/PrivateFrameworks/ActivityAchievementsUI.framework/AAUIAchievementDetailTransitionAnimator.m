@interface AAUIAchievementDetailTransitionAnimator
- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 didStartAnimationBlock:(id)a8 didFinishAnimationBlock:(id)a9;
- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 presentAlongsideBlock:(id)a8 dismissAlongsideBlock:(id)a9 completionBlock:(id)a10;
- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 willStartAnimationBlock:(id)a8 presentAlongsideBlock:(id)a9 dismissAlongsideBlock:(id)a10 completionBlock:(id)a11;
- (AnimatorDetailViewController)detailViewController;
- (BOOL)isPresentingWithContext:(id)a3;
- (BOOL)isWatch;
- (BOOL)reduceMotion;
- (BOOL)shouldAdjustForInset;
- (BOOL)shouldDismissGracefullyForTextSizeChange;
- (BOOL)shouldPlayFlipInAnimation;
- (CGAffineTransform)finalBadgeTransform;
- (CGAffineTransform)finalPresentingVCTransform;
- (CGAffineTransform)initialBadgeTransform;
- (CGPoint)finalBadgeCenter;
- (CGPoint)initialBadgeCenter;
- (CGRect)finalBadgeFrame;
- (CGRect)initialBadgeFrame;
- (NSString)presentingViewControllerWeeTitle;
- (UIView)conversionView;
- (UIViewController)presentingViewController;
- (double)transitionDuration:(id)a3;
- (id)completionBlock;
- (id)didFinishAnimationBlock;
- (id)didStartAnimationBlock;
- (id)dismissBlock;
- (id)presentBlock;
- (id)willStartAnimationBlock;
- (void)animateDismissalWithContext:(id)a3;
- (void)animatePresentationWithContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)prepareForAnimationsWithContext:(id)a3;
- (void)reducedMotionAnimateDismissalWithContext:(id)a3;
- (void)reducedMotionAnimatePresentationWithContext:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setConversionView:(id)a3;
- (void)setDetailViewController:(id)a3;
- (void)setDidFinishAnimationBlock:(id)a3;
- (void)setDidStartAnimationBlock:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)setFinalBadgeCenter:(CGPoint)a3;
- (void)setFinalBadgeFrame:(CGRect)a3;
- (void)setFinalBadgeTransform:(CGAffineTransform *)a3;
- (void)setFinalPresentingVCTransform:(CGAffineTransform *)a3;
- (void)setInitialBadgeCenter:(CGPoint)a3;
- (void)setInitialBadgeFrame:(CGRect)a3;
- (void)setInitialBadgeTransform:(CGAffineTransform *)a3;
- (void)setIsWatch:(BOOL)a3;
- (void)setPresentBlock:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPresentingViewControllerWeeTitle:(id)a3;
- (void)setReduceMotion:(BOOL)a3;
- (void)setShouldAdjustForInset:(BOOL)a3;
- (void)setShouldDismissGracefullyForTextSizeChange:(BOOL)a3;
- (void)setShouldPlayFlipInAnimation:(BOOL)a3;
- (void)setWillStartAnimationBlock:(id)a3;
- (void)textSizeDidChange:(id)a3;
@end

@implementation AAUIAchievementDetailTransitionAnimator

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 presentAlongsideBlock:(id)a8 dismissAlongsideBlock:(id)a9 completionBlock:(id)a10
{
  return -[AAUIAchievementDetailTransitionAnimator initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:](self, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:", a3, a4, a5, a7, 0, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9, a10);
}

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 willStartAnimationBlock:(id)a8 presentAlongsideBlock:(id)a9 dismissAlongsideBlock:(id)a10 completionBlock:(id)a11
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v46 = a3;
  id v21 = a4;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  v48.receiver = self;
  v48.super_class = (Class)AAUIAchievementDetailTransitionAnimator;
  v27 = [(AAUIAchievementDetailTransitionAnimator *)&v48 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_presentingViewController, a3);
    objc_storeStrong((id *)&v28->_detailViewController, a4);
    objc_storeStrong((id *)&v28->_conversionView, a7);
    v28->_initialBadgeFrame.origin.CGFloat x = x;
    v28->_initialBadgeFrame.origin.CGFloat y = y;
    v28->_initialBadgeFrame.size.CGFloat width = width;
    v28->_initialBadgeFrame.size.CGFloat height = height;
    uint64_t v29 = [v23 copy];
    id willStartAnimationBlock = v28->_willStartAnimationBlock;
    v28->_id willStartAnimationBlock = (id)v29;

    uint64_t v31 = [v24 copy];
    id presentBlock = v28->_presentBlock;
    v28->_id presentBlock = (id)v31;

    uint64_t v33 = [v25 copy];
    id dismissBlock = v28->_dismissBlock;
    v28->_id dismissBlock = (id)v33;

    uint64_t v35 = [v26 copy];
    id completionBlock = v28->_completionBlock;
    v28->_id completionBlock = (id)v35;

    v37 = [MEMORY[0x263F0A980] sharedBehavior];
    v28->_isWatch = [v37 isAppleWatch];

    p_a = (_OWORD *)&v28->_finalPresentingVCTransform.a;
    if (v28->_isWatch)
    {
      uint64_t v39 = MEMORY[0x263F000D0];
      long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      _OWORD *p_a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v28->_finalPresentingVCTransform.c = v40;
      long long v41 = *(_OWORD *)(v39 + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v47, 0.95, 0.95);
      long long v42 = *(_OWORD *)&v47.c;
      _OWORD *p_a = *(_OWORD *)&v47.a;
      *(_OWORD *)&v28->_finalPresentingVCTransform.c = v42;
      long long v41 = *(_OWORD *)&v47.tx;
    }
    *(_OWORD *)&v28->_finalPresentingVCTransform.tCGFloat x = v41;
    v28->_shouldPlayFlipInAnimation = a5;
    v28->_shouldDismissGracefullyForTextSizeChange = 0;
    v43 = [MEMORY[0x263F08A00] defaultCenter];
    [v43 addObserver:v28 selector:sel_textSizeDidChange_ name:*MEMORY[0x263F83428] object:0];

    v28->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
    v28->_shouldAdjustForInset = 1;
  }

  return v28;
}

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 didStartAnimationBlock:(id)a8 didFinishAnimationBlock:(id)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v15 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = -[AAUIAchievementDetailTransitionAnimator initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:](self, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:", a3, a4, v15, a7, 0, 0, x, y, width, height, 0, 0);
  if (v21)
  {
    uint64_t v22 = [v19 copy];
    id didStartAnimationBlock = v21->_didStartAnimationBlock;
    v21->_id didStartAnimationBlock = (id)v22;

    uint64_t v24 = [v20 copy];
    id didFinishAnimationBlock = v21->_didFinishAnimationBlock;
    v21->_id didFinishAnimationBlock = (id)v24;
  }
  return v21;
}

- (void)textSizeDidChange:(id)a3
{
}

- (BOOL)isPresentingWithContext:(id)a3
{
  v4 = [a3 viewControllerForKey:*MEMORY[0x263F83C10]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 topViewController];

    v4 = (void *)v5;
  }
  v6 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  BOOL v7 = v4 == v6;

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)prepareForAnimationsWithContext:(id)a3
{
  v4 = [a3 containerView];
  uint64_t v5 = [(AAUIAchievementDetailTransitionAnimator *)self conversionView];
  [(AAUIAchievementDetailTransitionAnimator *)self initialBadgeFrame];
  objc_msgSend(v5, "convertRect:toView:", v4);
  CGFloat x = v6;
  CGFloat y = v8;
  double width = v10;
  CGFloat height = v12;

  if (self->_shouldAdjustForInset)
  {
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    double v16 = v15;

    if (v16 == 3.0) {
      double v17 = -4.66666667;
    }
    else {
      double v17 = -3.0;
    }
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.double width = width;
    v34.size.CGFloat height = height;
    CGRect v35 = CGRectInset(v34, v17, v17);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    double width = v35.size.width;
    CGFloat height = v35.size.height;
  }
  v18 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  [v18 badgeFrame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  CGAffineTransformMakeScale(&v33, width / v24, width / v24);
  CGAffineTransform v32 = v33;
  [(AAUIAchievementDetailTransitionAnimator *)self setInitialBadgeTransform:&v32];
  long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v31[0] = *MEMORY[0x263F000D0];
  v31[1] = v27;
  v31[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(AAUIAchievementDetailTransitionAnimator *)self setFinalBadgeTransform:v31];
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.double width = width;
  v36.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v36);
  v37.size.CGFloat height = height;
  double v29 = MidX;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = width;
  -[AAUIAchievementDetailTransitionAnimator setInitialBadgeCenter:](self, "setInitialBadgeCenter:", v29, CGRectGetMidY(v37));
  v38.origin.CGFloat x = v20;
  v38.origin.CGFloat y = v22;
  v38.size.double width = v24;
  v38.size.CGFloat height = v26;
  double v30 = CGRectGetMidX(v38);
  v39.origin.CGFloat x = v20;
  v39.origin.CGFloat y = v22;
  v39.size.double width = v24;
  v39.size.CGFloat height = v26;
  -[AAUIAchievementDetailTransitionAnimator setFinalBadgeCenter:](self, "setFinalBadgeCenter:", v30, CGRectGetMidY(v39));
  -[AAUIAchievementDetailTransitionAnimator setFinalBadgeFrame:](self, "setFinalBadgeFrame:", v20, v22, v24, v26);
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[AAUIAchievementDetailTransitionAnimator isPresentingWithContext:](self, "isPresentingWithContext:");
  BOOL v5 = [(AAUIAchievementDetailTransitionAnimator *)self reduceMotion];
  if (v4)
  {
    if (v5) {
      [(AAUIAchievementDetailTransitionAnimator *)self reducedMotionAnimatePresentationWithContext:v6];
    }
    else {
      [(AAUIAchievementDetailTransitionAnimator *)self animatePresentationWithContext:v6];
    }
  }
  else if (v5)
  {
    [(AAUIAchievementDetailTransitionAnimator *)self reducedMotionAnimateDismissalWithContext:v6];
  }
  else
  {
    [(AAUIAchievementDetailTransitionAnimator *)self animateDismissalWithContext:v6];
  }
}

- (void)reducedMotionAnimatePresentationWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 containerView];
  id v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  [(AAUIAchievementDetailTransitionAnimator *)self setPresentingViewController:v6];

  BOOL v7 = [v4 viewForKey:*MEMORY[0x263F83C18]];
  double v8 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  v9 = [v8 view];
  [v9 setAlpha:1.0];

  [v7 setAlpha:0.0];
  [v5 addSubview:v7];
  [v5 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  double v19 = [v18 view];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  double v20 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  double v21 = [v20 view];
  [v21 layoutIfNeeded];

  double v22 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  double v23 = [v22 badgeView];

  [v5 addSubview:v23];
  [(AAUIAchievementDetailTransitionAnimator *)self prepareForAnimationsWithContext:v4];
  [(AAUIAchievementDetailTransitionAnimator *)self finalBadgeFrame];
  objc_msgSend(v23, "setFrame:");
  [v23 setNeedsLayout];
  [v23 layoutIfNeeded];
  [v23 resizeBadgeForCurrentViewSize];
  [(AAUIAchievementDetailTransitionAnimator *)self finalBadgeTransform];
  v49[0] = v49[3];
  v49[1] = v49[4];
  v49[2] = v49[5];
  [v23 setTransform:v49];
  [v23 setPaused:0];
  double v24 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  [v24 placeBadgeViewInContainer];

  double v25 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  double v26 = [v25 navigationItem];
  long long v27 = [v26 _weeTitle];

  if (v27)
  {
    v28 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v29 = [v28 navigationItem];
    double v30 = [v29 _weeTitle];
    presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = v30;

    CGAffineTransform v32 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    CGAffineTransform v33 = [v32 navigationItem];
    [v33 _setWeeTitle:0];

    CGRect v34 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    CGRect v35 = [v34 navigationController];
    CGRect v36 = [v35 navigationBar];
    [v36 setNeedsLayout];

    CGRect v37 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    CGRect v38 = [v37 navigationController];
    CGRect v39 = [v38 navigationBar];
    [v39 layoutIfNeeded];
  }
  [(AAUIAchievementDetailTransitionAnimator *)self transitionDuration:v4];
  double v41 = v40;
  long long v42 = (void *)MEMORY[0x263F82E00];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke;
  v47[3] = &unk_264860D70;
  v47[4] = self;
  id v48 = v7;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke_2;
  v45[3] = &unk_264860EE0;
  id v46 = v4;
  id v43 = v4;
  id v44 = v7;
  [v42 animateWithDuration:v47 animations:v45 completion:v41];
}

uint64_t __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v3 = [v2 view];
  [v3 setAlpha:0.0];

  id v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:1.0];
}

uint64_t __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)animatePresentationWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 containerView];
  id v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  [(AAUIAchievementDetailTransitionAnimator *)self setPresentingViewController:v6];

  BOOL v7 = [v4 viewForKey:*MEMORY[0x263F83C18]];
  double v8 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  v9 = [v8 view];
  [v9 setAlpha:1.0];

  [v7 setAlpha:0.0];
  [v5 addSubview:v7];
  [v5 layoutIfNeeded];
  double v10 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  double v11 = [v10 badgeView];

  [v5 addSubview:v11];
  [(AAUIAchievementDetailTransitionAnimator *)self prepareForAnimationsWithContext:v4];
  [(AAUIAchievementDetailTransitionAnimator *)self finalBadgeFrame];
  objc_msgSend(v11, "setFrame:");
  [v11 setNeedsLayout];
  [v11 layoutIfNeeded];
  [v11 resizeBadgeForCurrentViewSize];
  [(AAUIAchievementDetailTransitionAnimator *)self initialBadgeTransform];
  v44[0] = v44[3];
  v44[1] = v44[4];
  v44[2] = v44[5];
  [v11 setTransform:v44];
  [(AAUIAchievementDetailTransitionAnimator *)self initialBadgeCenter];
  objc_msgSend(v11, "setCenter:");
  if ([(AAUIAchievementDetailTransitionAnimator *)self shouldPlayFlipInAnimation]) {
    [v11 playFlipInAnimation];
  }
  [v11 setPaused:0];
  [(AAUIAchievementDetailTransitionAnimator *)self transitionDuration:v4];
  double v13 = v12;
  double v14 = [(AAUIAchievementDetailTransitionAnimator *)self presentBlock];

  if (v14)
  {
    double v15 = [(AAUIAchievementDetailTransitionAnimator *)self presentBlock];
    v15[2](v13);
  }
  double v16 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  double v17 = [v16 navigationItem];
  v18 = [v17 _weeTitle];

  if (v18)
  {
    double v19 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v20 = [v19 navigationItem];
    double v21 = [v20 _weeTitle];
    presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = v21;

    double v23 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v24 = [v23 navigationItem];
    [v24 _setWeeTitle:0];

    double v25 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v26 = [v25 navigationController];
    long long v27 = [v26 navigationBar];
    [v27 setNeedsLayout];

    v28 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v29 = [v28 navigationController];
    double v30 = [v29 navigationBar];
    [v30 layoutIfNeeded];
  }
  uint64_t v31 = [(AAUIAchievementDetailTransitionAnimator *)self didStartAnimationBlock];

  if (v31)
  {
    CGAffineTransform v32 = [(AAUIAchievementDetailTransitionAnimator *)self didStartAnimationBlock];
    v32[2]();
  }
  CGAffineTransform v33 = [(AAUIAchievementDetailTransitionAnimator *)self willStartAnimationBlock];

  if (v33)
  {
    CGRect v34 = [(AAUIAchievementDetailTransitionAnimator *)self willStartAnimationBlock];
    v34[2](v34, 1);
  }
  CGRect v35 = (void *)MEMORY[0x263F82E00];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke;
  v41[3] = &unk_264860F08;
  v41[4] = self;
  id v42 = v7;
  id v43 = v11;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_5;
  v39[3] = &unk_264860F30;
  v39[4] = self;
  id v40 = v4;
  id v36 = v4;
  id v37 = v11;
  id v38 = v7;
  [v35 animateKeyframesWithDuration:0 delay:v41 options:v39 animations:v13 completion:0.0];
}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_2;
  v11[3] = &unk_264860DC0;
  v11[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v11 relativeDuration:0.0 animations:0.4];
  v2 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_3;
  v9[3] = &unk_264860DC0;
  id v10 = *(id *)(a1 + 40);
  [v2 addKeyframeWithRelativeStartTime:v9 relativeDuration:0.6 animations:0.4];
  v3 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_4;
  v6[3] = &unk_264860D70;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:1.0];
}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 finalPresentingVCTransform];
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  v3 = [v2 presentingViewController];
  id v4 = [v3 view];
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  [v4 setTransform:v7];

  if (([*(id *)(a1 + 32) isWatch] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) presentingViewController];
    id v6 = [v5 view];
    [v6 setAlpha:0.0];
  }
}

uint64_t __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 finalBadgeTransform];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setTransform:v5];
  [*(id *)(a1 + 40) finalBadgeCenter];
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v3 = [v2 view];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v12[0] = *MEMORY[0x263F000D0];
  v12[1] = v4;
  v12[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v12];

  uint64_t v5 = [*(id *)(a1 + 32) presentingViewController];
  long long v6 = [v5 view];
  [v6 setAlpha:1.0];

  long long v7 = [*(id *)(a1 + 32) detailViewController];
  [v7 placeBadgeViewInContainer];

  [*(id *)(a1 + 40) completeTransition:1];
  long long v8 = [*(id *)(a1 + 32) completionBlock];

  if (v8)
  {
    long long v9 = [*(id *)(a1 + 32) completionBlock];
    v9[2](v9, 1);
  }
  long long v10 = [*(id *)(a1 + 32) didFinishAnimationBlock];

  if (v10)
  {
    double v11 = [*(id *)(a1 + 32) didFinishAnimationBlock];
    v11[2]();
  }
}

- (void)reducedMotionAnimateDismissalWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerView];
  if ([v4 presentationStyle] == -1)
  {
    long long v6 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    long long v7 = [v6 view];
    [v7 setAlpha:0.0];

    long long v8 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    long long v9 = [v8 view];
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v34[0] = *MEMORY[0x263F000D0];
    v34[1] = v10;
    v34[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v9 setTransform:v34];

    double v11 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v12 = [v11 view];
    [v5 addSubview:v12];
  }
  double v13 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  [v5 addSubview:v13];
  [v5 layoutIfNeeded];
  [(AAUIAchievementDetailTransitionAnimator *)self transitionDuration:v4];
  double v15 = v14;
  presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
  if (presentingViewControllerWeeTitle)
  {
    double v17 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    v18 = [v17 navigationItem];
    [v18 _setWeeTitle:presentingViewControllerWeeTitle];

    double v19 = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = 0;

    double v20 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v21 = [v20 navigationController];
    double v22 = [v21 navigationBar];
    [v22 setNeedsLayout];

    double v23 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v24 = [v23 navigationController];
    double v25 = [v24 navigationBar];
    [v25 layoutIfNeeded];
  }
  double v26 = (void *)MEMORY[0x263F82E00];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke;
  _OWORD v31[3] = &unk_264860D70;
  id v32 = v13;
  CGAffineTransform v33 = self;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke_2;
  v29[3] = &unk_264860EE0;
  id v30 = v4;
  id v27 = v4;
  id v28 = v13;
  [v26 animateWithDuration:v31 animations:v29 completion:v15];
}

void __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v3 = [*(id *)(a1 + 40) presentingViewController];
  v2 = [v3 view];
  [v2 setAlpha:1.0];
}

uint64_t __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)animateDismissalWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerView];
  if ([v4 presentationStyle] == -1)
  {
    long long v6 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    long long v7 = [v6 view];
    [v7 setAlpha:0.0];

    long long v8 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    long long v9 = [v8 view];
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v66[0] = *MEMORY[0x263F000D0];
    v66[1] = v10;
    v66[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v9 setTransform:v66];

    double v11 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v12 = [v11 view];
    [v5 addSubview:v12];
  }
  double v13 = [v4 viewForKey:*MEMORY[0x263F83C08]];
  [v5 addSubview:v13];
  [v5 layoutIfNeeded];
  double v14 = [(AAUIAchievementDetailTransitionAnimator *)self detailViewController];
  double v15 = [v14 badgeView];

  if ([(AAUIAchievementDetailTransitionAnimator *)self shouldDismissGracefullyForTextSizeChange])
  {
    goto LABEL_5;
  }
  [v5 addSubview:v15];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:1];
  [(AAUIAchievementDetailTransitionAnimator *)self finalBadgeCenter];
  objc_msgSend(v15, "setCenter:");
  [(AAUIAchievementDetailTransitionAnimator *)self finalBadgeTransform];
  v65[0] = v65[3];
  v65[1] = v65[4];
  v65[2] = v65[5];
  [v15 setTransform:v65];
  [v15 playFlipOutAnimation];
  double v17 = v16;
  if (v16 < 2.22044605e-16)
  {
LABEL_5:
    [(AAUIAchievementDetailTransitionAnimator *)self transitionDuration:v4];
    double v17 = v18;
  }
  [(AAUIAchievementDetailTransitionAnimator *)self finalPresentingVCTransform];
  double v19 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  double v20 = [v19 view];
  v64[0] = v64[3];
  v64[1] = v64[4];
  v64[2] = v64[5];
  [v20 setTransform:v64];

  BOOL v21 = [(AAUIAchievementDetailTransitionAnimator *)self isWatch];
  double v22 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
  double v23 = [v22 view];
  double v24 = v23;
  if (v21)
  {
    [v23 setNeedsLayout];

    double v22 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v24 = [v22 view];
    [v24 layoutIfNeeded];
  }
  else
  {
    [v23 setAlpha:0.0];
  }

  double v25 = [(AAUIAchievementDetailTransitionAnimator *)self dismissBlock];

  if (v25)
  {
    double v26 = [(AAUIAchievementDetailTransitionAnimator *)self dismissBlock];
    v26[2](v17);
  }
  presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
  if (presentingViewControllerWeeTitle)
  {
    id v28 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    double v29 = [v28 navigationItem];
    [v29 _setWeeTitle:presentingViewControllerWeeTitle];

    id v30 = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = 0;

    uint64_t v31 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    id v32 = [v31 navigationController];
    CGAffineTransform v33 = [v32 navigationBar];
    [v33 setNeedsLayout];

    CGRect v34 = [(AAUIAchievementDetailTransitionAnimator *)self presentingViewController];
    CGRect v35 = [v34 navigationController];
    id v36 = [v35 navigationBar];
    [v36 layoutIfNeeded];
  }
  id v37 = [(AAUIAchievementDetailTransitionAnimator *)self didStartAnimationBlock];

  if (v37)
  {
    id v38 = [(AAUIAchievementDetailTransitionAnimator *)self didStartAnimationBlock];
    v38[2]();
  }
  CGRect v39 = [(AAUIAchievementDetailTransitionAnimator *)self willStartAnimationBlock];

  if (v39)
  {
    id v40 = [(AAUIAchievementDetailTransitionAnimator *)self willStartAnimationBlock];
    v40[2](v40, 0);
  }
  BOOL v41 = [(AAUIAchievementDetailTransitionAnimator *)self shouldDismissGracefullyForTextSizeChange];
  id v42 = (void *)MEMORY[0x263F82E00];
  if (v41)
  {
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_6;
    v53[3] = &unk_264860F08;
    id v43 = &v54;
    v54 = v13;
    id v55 = v15;
    v56 = self;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_9;
    v49[3] = &unk_264860F58;
    id v50 = v55;
    id v51 = v4;
    v52 = self;
    id v44 = v4;
    id v45 = v13;
    [v42 animateKeyframesWithDuration:1 delay:v53 options:v49 animations:v17 completion:0.0];

    id v46 = v55;
  }
  else
  {
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke;
    v61[3] = &unk_264860F08;
    id v43 = (id *)v62;
    v62[0] = v13;
    v62[1] = self;
    id v63 = v15;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_5;
    v57[3] = &unk_264860F58;
    id v58 = v63;
    id v59 = v4;
    v60 = self;
    id v47 = v4;
    id v48 = v13;
    [v42 animateKeyframesWithDuration:1 delay:v61 options:v57 animations:v17 completion:0.0];

    id v46 = v63;
  }
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_2;
  v10[3] = &unk_264860DC0;
  id v11 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v10 relativeDuration:0.0 animations:0.4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_3;
  v9[3] = &unk_264860DC0;
  void v9[4] = *(void *)(a1 + 40);
  [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v9 relativeDuration:0.6 animations:0.4];
  id v3 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_4;
  v6[3] = &unk_264860D70;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:1.0];
}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  id v3 = [v2 view];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v7[0] = *MEMORY[0x263F000D0];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v7];

  uint64_t v5 = [*(id *)(a1 + 32) presentingViewController];
  long long v6 = [v5 view];
  [v6 setAlpha:1.0];
}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 40) initialBadgeCenter];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 initialBadgeTransform];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  id v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  return [v3 setTransform:v5];
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_5(id *a1)
{
  [a1[4] removeFromSuperview];
  [a1[5] completeTransition:1];
  v2 = [a1[6] completionBlock];

  if (v2)
  {
    id v3 = [a1[6] completionBlock];
    v3[2](v3, 0);
  }
  long long v4 = [a1[6] didFinishAnimationBlock];

  if (v4)
  {
    uint64_t v5 = [a1[6] didFinishAnimationBlock];
    v5[2]();
  }
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_7;
  v4[3] = &unk_264860D70;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v2 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_8;
  v3[3] = &unk_264860DC0;
  v3[4] = *(void *)(a1 + 48);
  [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.6 animations:0.4];
}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  id v3 = [v2 view];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v7[0] = *MEMORY[0x263F000D0];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v7];

  id v5 = [*(id *)(a1 + 32) presentingViewController];
  id v6 = [v5 view];
  [v6 setAlpha:1.0];
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_9(id *a1)
{
  [a1[4] removeFromSuperview];
  [a1[5] completeTransition:1];
  v2 = [a1[6] completionBlock];

  if (v2)
  {
    id v3 = [a1[6] completionBlock];
    v3[2](v3, 0);
  }
  long long v4 = [a1[6] didFinishAnimationBlock];

  if (v4)
  {
    id v5 = [a1[6] didFinishAnimationBlock];
    v5[2]();
  }
}

- (BOOL)shouldAdjustForInset
{
  return self->_shouldAdjustForInset;
}

- (void)setShouldAdjustForInset:(BOOL)a3
{
  self->_shouldAdjustForInset = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (AnimatorDetailViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
}

- (UIView)conversionView
{
  return self->_conversionView;
}

- (void)setConversionView:(id)a3
{
}

- (CGRect)initialBadgeFrame
{
  double x = self->_initialBadgeFrame.origin.x;
  double y = self->_initialBadgeFrame.origin.y;
  double width = self->_initialBadgeFrame.size.width;
  double height = self->_initialBadgeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialBadgeFrame:(CGRect)a3
{
  self->_initialBadgeFrame = a3;
}

- (CGPoint)initialBadgeCenter
{
  double x = self->_initialBadgeCenter.x;
  double y = self->_initialBadgeCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialBadgeCenter:(CGPoint)a3
{
  self->_initialBadgeCenter = a3;
}

- (CGPoint)finalBadgeCenter
{
  double x = self->_finalBadgeCenter.x;
  double y = self->_finalBadgeCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFinalBadgeCenter:(CGPoint)a3
{
  self->_finalBadgeCenter = a3;
}

- (CGAffineTransform)initialBadgeTransform
{
  long long v3 = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].tx;
  return self;
}

- (void)setInitialBadgeTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_initialBadgeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_initialBadgeTransform.tdouble x = v4;
  *(_OWORD *)&self->_initialBadgeTransform.a = v3;
}

- (CGAffineTransform)finalBadgeTransform
{
  long long v3 = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].tx;
  return self;
}

- (void)setFinalBadgeTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalBadgeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalBadgeTransform.tdouble x = v4;
  *(_OWORD *)&self->_finalBadgeTransform.a = v3;
}

- (CGRect)finalBadgeFrame
{
  double x = self->_finalBadgeFrame.origin.x;
  double y = self->_finalBadgeFrame.origin.y;
  double width = self->_finalBadgeFrame.size.width;
  double height = self->_finalBadgeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFinalBadgeFrame:(CGRect)a3
{
  self->_finalBadgeFrame = a3;
}

- (CGAffineTransform)finalPresentingVCTransform
{
  long long v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].tx;
  return self;
}

- (void)setFinalPresentingVCTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalPresentingVCTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalPresentingVCTransform.tdouble x = v4;
  *(_OWORD *)&self->_finalPresentingVCTransform.a = v3;
}

- (id)willStartAnimationBlock
{
  return self->_willStartAnimationBlock;
}

- (void)setWillStartAnimationBlock:(id)a3
{
}

- (id)presentBlock
{
  return self->_presentBlock;
}

- (void)setPresentBlock:(id)a3
{
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)didStartAnimationBlock
{
  return self->_didStartAnimationBlock;
}

- (void)setDidStartAnimationBlock:(id)a3
{
}

- (id)didFinishAnimationBlock
{
  return self->_didFinishAnimationBlock;
}

- (void)setDidFinishAnimationBlock:(id)a3
{
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (BOOL)shouldPlayFlipInAnimation
{
  return self->_shouldPlayFlipInAnimation;
}

- (void)setShouldPlayFlipInAnimation:(BOOL)a3
{
  self->_shouldPlayFlipInAnimation = a3;
}

- (BOOL)shouldDismissGracefullyForTextSizeChange
{
  return self->_shouldDismissGracefullyForTextSizeChange;
}

- (void)setShouldDismissGracefullyForTextSizeChange:(BOOL)a3
{
  self->_shouldDismissGracefullyForTextSizeChange = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (NSString)presentingViewControllerWeeTitle
{
  return self->_presentingViewControllerWeeTitle;
}

- (void)setPresentingViewControllerWeeTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewControllerWeeTitle, 0);
  objc_storeStrong(&self->_didFinishAnimationBlock, 0);
  objc_storeStrong(&self->_didStartAnimationBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong(&self->_presentBlock, 0);
  objc_storeStrong(&self->_willStartAnimationBlock, 0);
  objc_storeStrong((id *)&self->_conversionView, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end