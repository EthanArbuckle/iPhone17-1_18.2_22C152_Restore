@interface AVTransition
- (AVPresentationContext)presentationContext;
- (AVTransition)initWithTransitionContext:(id)a3;
- (AVTransitionDelegate)delegate;
- (CGAffineTransform)_transformForScale:(SEL)a3 translation:(double)a4 rotation:(CGPoint)a5 locationInWindow:(double)a6 sourceRectInContainerView:(CGPoint)a7;
- (CGRect)_finalFrameForPresentedView;
- (CGRect)_initialFrameForPresentedView;
- (CGRect)_sourceViewFrameInContainerView;
- (NSMutableArray)allAnimators;
- (UIViewControllerContextTransitioningEx)transitionContext;
- (UIViewPropertyAnimator)clientAnimator;
- (UIViewPropertyAnimator)transitionAnimator;
- (double)duration;
- (double)transitionAnimatorProgress;
- (void)_animateAlongsideInteractiveDismissalTransitionAnimationForCancelling;
- (void)_animateAlongsideInteractivePresentationTransitionAnimationForCancelling;
- (void)_animateFinishInteractiveTransition;
- (void)_dismissalTransitionDidEnd:(BOOL)a3;
- (void)_dismissalTransitionWillBegin;
- (void)_freezeDismissingViewForFinishing;
- (void)_presentationTransitionDidEnd:(BOOL)a3;
- (void)_presentationTransitionWillBegin;
- (void)_startOrContinueAnimatorsReversed:(BOOL)a3;
- (void)_updateCornerAppearanceAttributesOfView:(id)a3 toSourceView:(id)a4 similarity:(double)a5;
- (void)addRunAlongsideAnimationsIfNeeded;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)pauseInteractiveTransition;
- (void)setDelegate:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)startInteractiveTransition;
- (void)updateWithPercentComplete:(double)a3 scale:(double)a4 translation:(CGPoint)a5 rotation:(double)a6;
@end

@implementation AVTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAnimators, 0);
  objc_storeStrong((id *)&self->_clientAnimator, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

- (NSMutableArray)allAnimators
{
  return self->_allAnimators;
}

- (UIViewPropertyAnimator)clientAnimator
{
  return self->_clientAnimator;
}

- (UIViewPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (UIViewControllerContextTransitioningEx)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  return (UIViewControllerContextTransitioningEx *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTransitionDelegate *)WeakRetained;
}

- (void)setPresentationContext:(id)a3
{
}

- (AVPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (CGRect)_sourceViewFrameInContainerView
{
  v3 = [(AVTransition *)self transitionContext];
  v4 = [v3 containerView];
  [v4 bounds];
  CGFloat MidX = CGRectGetMidX(v57);
  v5 = [(AVTransition *)self transitionContext];
  v6 = [v5 containerView];
  [v6 bounds];
  double Height = CGRectGetHeight(v58);
  v7 = [(AVTransition *)self transitionContext];
  v8 = [v7 containerView];
  [v8 bounds];
  double MinY = CGRectGetMinY(v59);
  CGFloat v9 = *MEMORY[0x1E4F1DB30];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  v11 = [(AVTransition *)self presentationContext];
  uint64_t v12 = [v11 sourceView];
  double v54 = v10;
  double v52 = v9;
  if (!v12)
  {

    goto LABEL_5;
  }
  v13 = (void *)v12;
  v14 = [(AVTransition *)self presentationContext];
  v15 = [v14 sourceView];
  int v16 = [v15 _isInAWindow];

  if (!v16)
  {
LABEL_5:
    v17 = [(AVTransition *)self transitionContext];
    v18 = [v17 containerView];
    [v18 bounds];
    CGFloat v32 = CGRectGetMidX(v60);
    v19 = [(AVTransition *)self transitionContext];
    v20 = [v19 containerView];
    [v20 bounds];
    double v37 = CGRectGetHeight(v61);
    v29 = [(AVTransition *)self transitionContext];
    v30 = [v29 containerView];
    [v30 bounds];
    double v34 = CGRectGetMinY(v62) + v37 * 0.75;
    goto LABEL_6;
  }
  v17 = [(AVTransition *)self transitionContext];
  v18 = [v17 containerView];
  v19 = [(AVTransition *)self presentationContext];
  v20 = [v19 sourceView];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(AVTransition *)self presentationContext];
  v30 = [v29 sourceView];
  objc_msgSend(v18, "convertRect:fromView:", v30, v22, v24, v26, v28);
  CGFloat v32 = v31;
  double v34 = v33;
  CGFloat v9 = v35;
  CGFloat v10 = v36;
LABEL_6:

  v38 = [(AVTransition *)self transitionContext];
  v39 = [v38 containerView];
  [v39 bounds];
  v68.origin.CGFloat x = v40;
  v68.origin.CGFloat y = v41;
  v68.size.CGFloat width = v42;
  v68.size.height = v43;
  v63.origin.CGFloat x = v32;
  v63.origin.CGFloat y = v34;
  v63.size.CGFloat width = v9;
  v63.size.height = v10;
  CGRect v64 = CGRectIntersection(v63, v68);
  CGFloat x = v64.origin.x;
  CGFloat y = v64.origin.y;
  CGFloat width = v64.size.width;
  CGFloat v47 = v64.size.height;

  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.height = v47;
  if (CGRectIsEmpty(v65)
    || (v66.origin.CGFloat x = v32, v66.origin.y = v34, v66.size.width = v9, v66.size.height = v10, CGRectIsInfinite(v66)))
  {
    CGFloat v32 = MidX;
    CGFloat v9 = v52;
    double v34 = MinY + Height * 0.75;
    CGFloat v10 = v54;
  }
  double v48 = v32;
  double v49 = v34;
  double v50 = v9;
  double v51 = v10;
  result.size.height = v51;
  result.size.CGFloat width = v50;
  result.origin.CGFloat y = v49;
  result.origin.CGFloat x = v48;
  return result;
}

- (void)_updateCornerAppearanceAttributesOfView:(id)a3 toSourceView:(id)a4 similarity:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v13 = [v8 layer];
  CGFloat v9 = [v7 layer];

  double v10 = fmin(fmax(a5, 0.0), 1.0);
  [v8 setClipsToBounds:1];

  if (v10 <= 0.0)
  {
    [v13 setCornerCurve:*MEMORY[0x1E4F39EA0]];
  }
  else
  {
    v11 = [v9 cornerCurve];
    [v13 setCornerCurve:v11];
  }
  [v9 cornerRadius];
  [v13 setCornerRadius:v10 * v12];
  objc_msgSend(v13, "setMaskedCorners:", objc_msgSend(v9, "maskedCorners"));
}

- (CGAffineTransform)_transformForScale:(SEL)a3 translation:(double)a4 rotation:(CGPoint)a5 locationInWindow:(double)a6 sourceRectInContainerView:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v10 = a5.y;
  double v11 = a5.x;
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, a4, a4);
  v14 = [(AVTransition *)self transitionContext];
  v15 = [v14 containerView];
  int v16 = [(AVTransition *)self transitionContext];
  v17 = [v16 containerView];
  v18 = [v17 window];
  objc_msgSend(v15, "convertPoint:fromView:", v18, x - v11, y - v10);
  double v20 = v19;
  double v43 = v21;
  double v44 = v19;
  double v22 = v21;

  double v23 = v20 - CGRectGetMinX(a8);
  double v24 = v22 - CGRectGetMinY(a8);
  double v41 = v23 / CGRectGetWidth(a8);
  CGFloat Height = CGRectGetHeight(a8);
  CGAffineTransform v47 = v48;
  double v39 = v24 / Height;
  CGRect v49 = CGRectApplyAffineTransform(a8, &v47);
  CGFloat v26 = v49.origin.x;
  CGFloat v27 = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat v29 = v49.size.height;
  double v30 = CGRectGetWidth(v49);
  v50.origin.double x = v26;
  v50.origin.double y = v27;
  v50.size.CGFloat width = width;
  v50.size.height = v29;
  CGFloat v42 = CGRectGetMinX(v50) + v30 * v41;
  v51.origin.double x = v26;
  v51.origin.double y = v27;
  v51.size.CGFloat width = width;
  v51.size.height = v29;
  double v31 = CGRectGetHeight(v51);
  v52.origin.double x = v26;
  v52.origin.double y = v27;
  v52.size.CGFloat width = width;
  v52.size.height = v29;
  CGFloat v40 = CGRectGetMinY(v52) + v31 * v39;
  UIRectGetCenter();
  double v38 = v32;
  UIRectGetCenter();
  v48.tdouble x = v38 - v33;
  UIRectGetCenter();
  double v35 = v34;
  UIRectGetCenter();
  v48.tdouble x = v44 - v42 + a5.x + v48.tx;
  v48.tdouble y = v43 - v40 + a5.y + v35 - v36;
  CGAffineTransform v47 = v48;
  return CGAffineTransformRotate(retstr, &v47, a6);
}

- (CGRect)_finalFrameForPresentedView
{
  v3 = [(AVTransition *)self presentationContext];
  v4 = [v3 presentedViewController];
  if ([v4 isBeingPresented])
  {
    v5 = [(AVTransition *)self transitionContext];
    v6 = [(AVTransition *)self presentationContext];
    id v7 = [v6 presentedViewController];
    [v5 finalFrameForViewController:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [(AVTransition *)self _sourceViewFrameInContainerView];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)_initialFrameForPresentedView
{
  v3 = [(AVTransition *)self presentationContext];
  v4 = [v3 presentedViewController];
  if ([v4 isBeingPresented])
  {
    [(AVTransition *)self _sourceViewFrameInContainerView];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v13 = [(AVTransition *)self presentationContext];
    double v14 = [v13 presentedView];
    [v14 frame];
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
  }
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_startOrContinueAnimatorsReversed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(AVTransition *)self allAnimators];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    if (v3) {
      double v8 = 0.0;
    }
    else {
      double v8 = 0.6;
    }
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 state];
        if (v11 == 2) {
          goto LABEL_11;
        }
        if (v11 != 1)
        {
          if (v11) {
            continue;
          }
LABEL_11:
          [v10 startAnimation];
          continue;
        }
        if ([v10 isRunning]) {
          [v10 pauseAnimation];
        }
        [v10 setReversed:v3];
        double v12 = [v10 timingParameters];
        [v10 continueAnimationWithTimingParameters:v12 durationFactor:v8];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_dismissalTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    v4 = [(AVTransition *)self presentationContext];
    uint64_t v5 = [v4 backgroundView];
    [v5 setAlpha:1.0];

    uint64_t v6 = [(AVTransition *)self presentationContext];
    uint64_t v7 = [v6 touchBlockingView];
    [v7 setAlpha:1.0];

    double v8 = [(AVTransition *)self presentationContext];
    double v9 = [v8 backgroundView];
    double v10 = [(AVTransition *)self delegate];
    uint64_t v11 = [v10 transitionBackgroundViewBackgroundColor:self];
    [v9 setBackgroundColor:v11];

    double v12 = [(AVTransition *)self presentationContext];
    long long v13 = [v12 presentedView];
    long long v14 = [(AVTransition *)self delegate];
    long long v15 = [v14 transitionPresentedViewBackgroundColor:self];
    [v13 setBackgroundColor:v15];
  }
  id v17 = [(AVTransition *)self presentationContext];
  long long v16 = [v17 presentedView];
  [v16 setAlpha:1.0];
}

- (void)_presentationTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    v4 = [(AVTransition *)self presentationContext];
    uint64_t v5 = [v4 backgroundView];
    uint64_t v6 = [(AVTransition *)self delegate];
    uint64_t v7 = [v6 transitionBackgroundViewBackgroundColor:self];
    [v5 setBackgroundColor:v7];

    double v8 = [(AVTransition *)self presentationContext];
    double v9 = [v8 presentedView];
    double v10 = [(AVTransition *)self delegate];
    uint64_t v11 = [v10 transitionPresentedViewBackgroundColor:self];
    [v9 setBackgroundColor:v11];

    double v12 = [(AVTransition *)self presentationContext];
    long long v13 = [v12 backgroundView];
    [v13 setAlpha:1.0];

    long long v14 = [(AVTransition *)self presentationContext];
    long long v15 = [v14 touchBlockingView];
    [v15 setAlpha:1.0];
  }
  id v17 = [(AVTransition *)self presentationContext];
  long long v16 = [v17 presentedView];
  [v16 setAlpha:1.0];
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "NO";
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[AVTransition completeTransition:]";
    long long v13 = "didComplete";
    __int16 v12 = 2080;
    if (v3) {
      uint64_t v6 = "YES";
    }
    __int16 v14 = 2080;
    long long v15 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  uint64_t v7 = [(AVTransition *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__AVTransition_completeTransition___block_invoke;
  v8[3] = &unk_1E5FC3738;
  v8[4] = self;
  BOOL v9 = v3;
  [v7 transitionWillComplete:self success:v3 continueBlock:v8];
}

void __35__AVTransition_completeTransition___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    [v3 cancelInteractiveTransition];
  }
  else
  {
    if (*(unsigned char *)(a1 + 40)) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
    uint64_t v5 = [*(id *)(a1 + 32) transitionContext];
    [v5 updateInteractiveTransition:v4];

    uint64_t v6 = [*(id *)(a1 + 32) presentationContext];
    uint64_t v7 = [v6 transitionType];

    if (v7)
    {
      if (v7 == 1)
      {
        [*(id *)(a1 + 32) _presentationTransitionDidEnd:*(unsigned __int8 *)(a1 + 40)];
      }
      else if (v7 == 2)
      {
        [*(id *)(a1 + 32) _dismissalTransitionDidEnd:*(unsigned __int8 *)(a1 + 40)];
      }
    }
    else
    {
      double v8 = _AVLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_ERROR, "Unexpected", (uint8_t *)&v11, 2u);
      }
    }
    BOOL v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      __int16 v12 = "-[AVTransition completeTransition:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 507;
      _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v11, 0x12u);
    }

    double v10 = [*(id *)(a1 + 32) transitionContext];
    [v10 completeTransition:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)addRunAlongsideAnimationsIfNeeded
{
  BOOL v3 = [(AVTransition *)self clientAnimator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__AVTransition_addRunAlongsideAnimationsIfNeeded__block_invoke;
  v4[3] = &unk_1E5FC4698;
  v4[4] = self;
  [v3 addAnimations:v4];
}

void __49__AVTransition_addRunAlongsideAnimationsIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transitionContext];
  uint64_t v3 = [v2 _alongsideAnimationsCount];

  if (v3 >= 1)
  {
    id v4 = [*(id *)(a1 + 32) transitionContext];
    objc_msgSend(v4, "__runAlongsideAnimations");
  }
}

- (void)_animateAlongsideInteractiveDismissalTransitionAnimationForCancelling
{
  uint64_t v3 = [(AVTransition *)self presentationContext];
  id v4 = [v3 presentedView];
  uint64_t v5 = [(AVTransition *)self presentationContext];
  uint64_t v6 = [v5 sourceView];
  [(AVTransition *)self _updateCornerAppearanceAttributesOfView:v4 toSourceView:v6 similarity:0.0];

  uint64_t v7 = [(AVTransition *)self presentationContext];
  double v8 = [v7 presentedView];
  long long v9 = *(_OWORD *)&self->_destinationViewTransform.c;
  v12[0] = *(_OWORD *)&self->_destinationViewTransform.a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&self->_destinationViewTransform.tx;
  [v8 setTransform:v12];

  double v10 = [(AVTransition *)self presentationContext];
  int v11 = [v10 backgroundView];
  [v11 setAlpha:1.0];
}

- (void)_animateAlongsideInteractivePresentationTransitionAnimationForCancelling
{
  uint64_t v3 = [(AVTransition *)self presentationContext];
  id v4 = [v3 presentedView];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v5;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v14];

  uint64_t v6 = [(AVTransition *)self presentationContext];
  uint64_t v7 = [v6 presentedView];
  [(AVTransition *)self _sourceViewFrameInContainerView];
  objc_msgSend(v7, "setFrame:");

  double v8 = [(AVTransition *)self presentationContext];
  long long v9 = [v8 presentedView];
  double v10 = [(AVTransition *)self presentationContext];
  int v11 = [v10 sourceView];
  [(AVTransition *)self _updateCornerAppearanceAttributesOfView:v9 toSourceView:v11 similarity:1.0];

  __int16 v12 = [(AVTransition *)self presentationContext];
  __int16 v13 = [v12 backgroundView];
  [v13 setAlpha:0.0];
}

- (void)cancelInteractiveTransition
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v10 = "-[AVTransition cancelInteractiveTransition]";
    __int16 v11 = 1024;
    int v12 = 426;
    __int16 v13 = 2048;
    int v14 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  id v4 = [(AVTransition *)self transitionContext];
  [v4 cancelInteractiveTransition];

  long long v5 = [(AVTransition *)self transitionAnimator];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AVTransition_cancelInteractiveTransition__block_invoke;
  v8[3] = &unk_1E5FC4698;
  v8[4] = self;
  [v5 addAnimations:v8];

  uint64_t v6 = [(AVTransition *)self transitionAnimator];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AVTransition_cancelInteractiveTransition__block_invoke_9;
  v7[3] = &unk_1E5FC3710;
  v7[4] = self;
  [v6 addCompletion:v7];

  [(AVTransition *)self _startOrContinueAnimatorsReversed:1];
}

void __43__AVTransition_cancelInteractiveTransition__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v3 = [v2 transitionType];

  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      [v6 _animateAlongsideInteractiveDismissalTransitionAnimationForCancelling];
    }
    else if (v3 == 1)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 _animateAlongsideInteractivePresentationTransitionAnimationForCancelling];
    }
  }
  else
  {
    long long v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Unexpected", v7, 2u);
    }
  }
}

uint64_t __43__AVTransition_cancelInteractiveTransition__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:0];
}

- (void)_freezeDismissingViewForFinishing
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__AVTransition__freezeDismissingViewForFinishing__block_invoke;
  v2[3] = &unk_1E5FC4698;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __49__AVTransition__freezeDismissingViewForFinishing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v3 = [v2 presentedView];
  [v3 frame];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  id v4 = [*(id *)(a1 + 32) presentationContext];
  long long v5 = [v4 presentedView];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }

  long long v14 = 0uLL;
  uint64_t v7 = [*(id *)(a1 + 32) presentationContext];
  double v8 = [v7 presentedView];
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v8 setTransform:v11];

  long long v9 = [*(id *)(a1 + 32) presentationContext];
  double v10 = [v9 presentedView];
  UIRectGetCenter();
  objc_msgSend(v10, "setCenter:");
}

- (void)_animateFinishInteractiveTransition
{
  uint64_t v3 = [(AVTransition *)self presentationContext];
  id v4 = [v3 configuration];
  uint64_t v5 = [v4 transitionStyle];

  uint64_t v6 = [(AVTransition *)self presentationContext];
  uint64_t v7 = [v6 transitionType];

  switch(v7)
  {
    case 0:
      CGFloat v26 = _AVLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.a) = 0;
        _os_log_error_impl(&dword_1B05B7000, v26, OS_LOG_TYPE_ERROR, "Unexpected", (uint8_t *)&buf, 2u);
      }
      goto LABEL_41;
    case 2:
      CGFloat v27 = [(AVTransition *)self presentationContext];
      uint64_t v28 = [v27 sourceView];
      if (v28)
      {
        CGFloat v29 = (void *)v28;
        [(AVTransition *)self _sourceViewFrameInContainerView];
        IsEmptdouble y = CGRectIsEmpty(v128);

        if (!IsEmpty)
        {
          [(AVTransition *)self _freezeDismissingViewForFinishing];
          double v31 = [(AVTransition *)self presentationContext];
          double v32 = [v31 presentedView];
          long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&buf.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&buf.c = v33;
          *(_OWORD *)&buf.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          [v32 setTransform:&buf];

          double v34 = [(AVTransition *)self presentationContext];
          double v35 = [v34 presentedView];
          [(AVTransition *)self _sourceViewFrameInContainerView];
          objc_msgSend(v35, "setFrame:");

          double v36 = (void *)MEMORY[0x1E4FB1EB0];
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_4;
          v123[3] = &unk_1E5FC4698;
          v123[4] = self;
          double v37 = v123;
          goto LABEL_44;
        }
      }
      else
      {
      }
      v53 = [(AVTransition *)self presentationContext];
      double v54 = [v53 dismissingTransition];
      int v55 = [v54 wasInitiallyInteractive];

      if (!v55)
      {
        v67 = [(AVTransition *)self transitionContext];
        id v118 = [v67 viewForKey:*MEMORY[0x1E4FB30C0]];

        CGRect v68 = [(AVTransition *)self transitionContext];
        v69 = [v68 viewForKey:*MEMORY[0x1E4FB30D0]];

        [v118 frame];
        double v71 = v70;
        double v73 = v72;
        [v69 frame];
        double v75 = v74;
        double v77 = v76;
        double v79 = v78;
        double v81 = v80;
        objc_msgSend(v69, "convertPoint:toView:", v118, v71, v73);
        double v83 = v82;
        double v85 = v84;
        v129.origin.double x = v75;
        v129.origin.double y = v77;
        v129.size.CGFloat width = v79;
        v129.size.height = v81;
        double Height = CGRectGetHeight(v129);
        double v87 = Height;
        if (v75 == v83 && v77 == v85)
        {
          double v77 = Height;
        }
        else
        {
          v130.origin.double x = v75;
          v130.origin.double y = v77;
          v130.size.CGFloat width = v79;
          v130.size.height = v81;
          double Width = CGRectGetWidth(v130);
          if (v83 == v87)
          {
            double v75 = Width;
          }
          else if (v85 == Width)
          {
            v133.origin.double x = v75;
            v133.origin.double y = v77;
            v133.size.CGFloat width = v79;
            v133.size.height = v81;
            double v75 = -CGRectGetWidth(v133);
          }
          else
          {
            v134.origin.double x = v75;
            v134.origin.double y = v77;
            v134.size.CGFloat width = v79;
            v134.size.height = v81;
            double v77 = -CGRectGetHeight(v134);
          }
        }
        v109 = [(AVTransition *)self presentationContext];
        v110 = [v109 presentedView];
        objc_msgSend(v110, "setFrame:", v75, v77, v79, v81);

        v111 = [(AVTransition *)self presentationContext];
        v112 = [v111 backgroundView];
        [v112 setAlpha:0.0];

        if (!v5)
        {
          v113 = [(AVTransition *)self presentationContext];
          v114 = [v113 containerView];
          [v114 setAlpha:0.0];
        }

        return;
      }
      v56 = [(AVTransition *)self presentationContext];
      CGRect v57 = [v56 presentedView];
      CGRect v58 = [(AVTransition *)self presentationContext];
      CGRect v59 = [v58 sourceView];
      [(AVTransition *)self _updateCornerAppearanceAttributesOfView:v57 toSourceView:v59 similarity:1.0];

      CGRect v60 = [(AVTransition *)self presentationContext];
      CGRect v61 = [v60 backgroundView];
      [v61 setAlpha:0.0];

      [(AVTransition *)self _freezeDismissingViewForFinishing];
      CGRect v62 = [(AVTransition *)self presentationContext];
      CGRect v63 = [v62 presentedView];
      CGRect v64 = [(AVTransition *)self presentationContext];
      CGRect v65 = [v64 presentedView];
      CGRect v66 = v65;
      if (v65) {
        [v65 transform];
      }
      else {
        memset(&v121, 0, sizeof(v121));
      }
      CGAffineTransformScale(&v122, &v121, 0.001, 0.001);
      [v63 setTransform:&v122];

      double v36 = (void *)MEMORY[0x1E4FB1EB0];
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_7;
      v120[3] = &unk_1E5FC4698;
      v120[4] = self;
      double v37 = v120;
LABEL_44:
      [v36 animateKeyframesWithDuration:0 delay:v37 options:0 animations:0.0 completion:0.0];
      return;
    case 1:
      double v8 = [(AVTransition *)self presentationContext];
      long long v9 = [v8 presentingTransition];
      int v10 = [v9 wasInitiallyInteractive];

      __int16 v11 = [(AVTransition *)self presentationContext];
      long long v12 = v11;
      long long v13 = (_OWORD *)MEMORY[0x1E4F1DAB8];
      uint64_t v119 = v5;
      if (v10)
      {
        long long v14 = [v11 backgroundView];
        [v14 setAlpha:1.0];

        uint64_t v15 = [(AVTransition *)self presentationContext];
        uint64_t v16 = [v15 presentedView];
        id v17 = [(AVTransition *)self presentationContext];
        uint64_t v18 = [v17 sourceView];
        [(AVTransition *)self _updateCornerAppearanceAttributesOfView:v16 toSourceView:v18 similarity:0.0];

        double v19 = [(AVTransition *)self presentationContext];
        double v20 = [v19 presentedView];
        double v21 = [(AVTransition *)self transitionContext];
        double v22 = [v21 containerView];
        [v22 bounds];
        objc_msgSend(v20, "setFrame:");

        double v23 = [(AVTransition *)self presentationContext];
        double v24 = [v23 presentedView];
        long long v25 = v13[1];
        *(_OWORD *)&buf.a = *v13;
        *(_OWORD *)&buf.c = v25;
        *(_OWORD *)&buf.tdouble x = v13[2];
        [v24 setTransform:&buf];
      }
      else
      {
        double v38 = [v11 sourceView];

        if (v38)
        {
          v125[0] = MEMORY[0x1E4F143A8];
          v125[1] = 3221225472;
          v125[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke;
          v125[3] = &unk_1E5FC4698;
          v125[4] = self;
          [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:0 delay:v125 options:0 animations:0.0 completion:0.0];
        }
      }
      double v39 = [(AVTransition *)self presentationContext];
      CGFloat v40 = [v39 presentingTransition];
      char v41 = [v40 wasInitiallyInteractive];
      if ((v41 & 1) == 0)
      {
        CGFloat v42 = [(AVTransition *)self presentationContext];
        uint64_t v43 = [v42 sourceView];
        if (!v43)
        {

          goto LABEL_29;
        }
        uint64_t v115 = v43;
        id v117 = v42;
      }
      double v44 = [(AVTransition *)self presentationContext];
      v45 = [v44 presentingTransition];
      uint64_t v46 = [v45 initialInterfaceOrientation];
      CGAffineTransform v47 = [(AVTransition *)self presentationContext];
      CGAffineTransform v48 = [v47 presentingTransition];
      uint64_t v49 = [v48 finalInterfaceOrientation];

      if ((v41 & 1) == 0)
      {
      }
      if (v46 != v49)
      {
        memset(&buf, 0, sizeof(buf));
        CGRect v50 = [(AVTransition *)self presentationContext];
        CGRect v51 = [v50 presentingTransition];
        CGRect v52 = v51;
        if (v51) {
          [v51 rotationTransform];
        }
        else {
          memset(&buf, 0, sizeof(buf));
        }

        v97 = [(AVTransition *)self transitionContext];
        v98 = [v97 containerView];
        [v98 bounds];
        CGAffineTransform v124 = buf;
        CGRect v132 = CGRectApplyAffineTransform(v131, &v124);
        double v99 = v132.size.width;
        double v100 = v132.size.height;

        double v101 = *MEMORY[0x1E4F1DAD8];
        double v102 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        if (v99 < 0.0) {
          double v99 = -v99;
        }
        if (v100 < 0.0) {
          double v100 = -v100;
        }
        v103 = [(AVTransition *)self presentationContext];
        v104 = [v103 presentedView];
        objc_msgSend(v104, "setFrame:", v101, v102, v99, v100);

        v105 = [(AVTransition *)self presentationContext];
        v106 = [v105 presentedView];
        v107 = [(AVTransition *)self transitionContext];
        v108 = [v107 containerView];
        [v108 bounds];
        UIRectGetCenter();
        objc_msgSend(v106, "setCenter:");

        CGFloat v26 = [(AVTransition *)self presentationContext];
        v95 = [v26 presentedView];
        CGAffineTransform v124 = buf;
        [v95 setTransform:&v124];
LABEL_40:

LABEL_41:
        return;
      }
LABEL_29:
      v88 = [(AVTransition *)self presentationContext];
      v89 = [v88 presentedView];
      long long v90 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&buf.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&buf.c = v90;
      *(_OWORD *)&buf.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v89 setTransform:&buf];

      if (v119)
      {
        v91 = [(AVTransition *)self presentationContext];
        v92 = [v91 presentedView];
        v93 = [(AVTransition *)self transitionContext];
        v94 = [v93 containerView];
        [v94 bounds];
        objc_msgSend(v92, "setFrame:");

        return;
      }
      CGFloat v26 = [(AVTransition *)self transitionContext];
      v95 = [v26 containerView];
      [v95 setAlpha:1.0];
      goto LABEL_40;
  }
}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_2;
  v4[3] = &unk_1E5FC4698;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_3;
  v3[3] = &unk_1E5FC4698;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.5 animations:0.5];
}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_5;
  v4[3] = &unk_1E5FC4698;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_6;
  v3[3] = &unk_1E5FC4698;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.5 animations:0.5];
}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke_7(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_8;
  v2[3] = &unk_1E5FC4698;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v2 relativeDuration:0.25 animations:0.75];
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  v1 = [v2 presentedView];
  [v1 setAlpha:0.0];
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  v1 = [v2 backgroundView];
  [v1 setAlpha:0.0];
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [v2 presentationContext];
  uint64_t v3 = [v6 presentedView];
  id v4 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v5 = [v4 sourceView];
  [v2 _updateCornerAppearanceAttributesOfView:v3 toSourceView:v5 similarity:1.0];
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [v2 presentationContext];
  uint64_t v3 = [v6 presentedView];
  id v4 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v5 = [v4 sourceView];
  [v2 _updateCornerAppearanceAttributesOfView:v3 toSourceView:v5 similarity:0.0];
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  v1 = [v2 backgroundView];
  [v1 setAlpha:1.0];
}

- (void)finishInteractiveTransition
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 136315650;
    int v10 = "-[AVTransition finishInteractiveTransition]";
    __int16 v11 = 1024;
    int v12 = 262;
    __int16 v13 = 2048;
    long long v14 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  id v4 = [(AVTransition *)self transitionContext];
  [v4 finishInteractiveTransition];

  uint64_t v5 = [(AVTransition *)self transitionAnimator];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AVTransition_finishInteractiveTransition__block_invoke;
  v8[3] = &unk_1E5FC4698;
  v8[4] = self;
  [v5 addAnimations:v8];

  id v6 = [(AVTransition *)self transitionAnimator];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AVTransition_finishInteractiveTransition__block_invoke_2;
  v7[3] = &unk_1E5FC3710;
  v7[4] = self;
  [v6 addCompletion:v7];

  [(AVTransition *)self _startOrContinueAnimatorsReversed:0];
}

uint64_t __43__AVTransition_finishInteractiveTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateFinishInteractiveTransition];
}

uint64_t __43__AVTransition_finishInteractiveTransition__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)updateWithPercentComplete:(double)a3 scale:(double)a4 translation:(CGPoint)a5 rotation:(double)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __int16 v11 = [(AVTransition *)self transitionContext];
  [v11 updateInteractiveTransition:a3];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v12 = [(AVTransition *)self allAnimators];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v16++) setFractionComplete:a3];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  long long v17 = *(_OWORD *)&self->_destinationViewTransform.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&self->_destinationViewTransform.a;
  *(_OWORD *)&v21.c = v17;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&self->_destinationViewTransform.tx;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformTranslate(&v22, &v21, x, y);
  CGAffineTransform v20 = v22;
  CGAffineTransformScale(&v21, &v20, a4, a4);
  CGAffineTransform v22 = v21;
  uint64_t v18 = [(AVTransition *)self presentationContext];
  double v19 = [v18 presentedView];
  CGAffineTransform v21 = v22;
  [v19 setTransform:&v21];
}

- (void)pauseInteractiveTransition
{
  uint64_t v3 = [(AVTransition *)self transitionContext];
  [v3 pauseInteractiveTransition];

  id v4 = [(AVTransition *)self allAnimators];
  [v4 makeObjectsPerformSelector:sel_pauseAnimation];

  uint64_t v5 = [(AVTransition *)self transitionAnimator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke;
  v6[3] = &unk_1E5FC4698;
  v6[4] = self;
  [v5 addAnimations:v6];
}

uint64_t __42__AVTransition_pauseInteractiveTransition__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_2;
  v2[3] = &unk_1E5FC4698;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:0 delay:v2 options:0 animations:0.0 completion:0.0];
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v3 = [v2 transitionType];

  if (v3)
  {
    if (v3 == 2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_5;
      _OWORD v11[3] = &unk_1E5FC4698;
      v11[4] = *(void *)(a1 + 32);
      [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v11 relativeDuration:0.0 animations:0.5];
      id v4 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_6;
      v10[3] = &unk_1E5FC4698;
      v10[4] = *(void *)(a1 + 32);
      double v5 = 0.5;
      double v6 = 0.5;
      uint64_t v7 = v10;
    }
    else
    {
      if (v3 != 1) {
        return;
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_3;
      v13[3] = &unk_1E5FC4698;
      v13[4] = *(void *)(a1 + 32);
      [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v13 relativeDuration:0.0 animations:0.5];
      id v4 = (void *)MEMORY[0x1E4FB1EB0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_4;
      _OWORD v12[3] = &unk_1E5FC4698;
      v12[4] = *(void *)(a1 + 32);
      double v5 = 0.25;
      double v6 = 0.75;
      uint64_t v7 = v12;
    }
    [v4 addKeyframeWithRelativeStartTime:v7 relativeDuration:v5 animations:v6];
  }
  else
  {
    double v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_error_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_ERROR, "Unexpected", v9, 2u);
    }
  }
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [v2 presentationContext];
  uint64_t v3 = [v6 presentedView];
  id v4 = [*(id *)(a1 + 32) presentationContext];
  double v5 = [v4 sourceView];
  [v2 _updateCornerAppearanceAttributesOfView:v3 toSourceView:v5 similarity:0.0];
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  v1 = [v2 backgroundView];
  [v1 setAlpha:1.0];
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  v1 = [v2 backgroundView];
  [v1 setAlpha:0.0];
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [v2 presentationContext];
  uint64_t v3 = [v6 presentedView];
  id v4 = [*(id *)(a1 + 32) presentationContext];
  double v5 = [v4 sourceView];
  [v2 _updateCornerAppearanceAttributesOfView:v3 toSourceView:v5 similarity:1.0];
}

- (void)_dismissalTransitionWillBegin
{
  uint64_t v3 = [(AVTransition *)self presentationContext];
  id v4 = [v3 transitionContext];
  double v5 = [v4 containerView];
  id v6 = [(AVTransition *)self presentationContext];
  uint64_t v7 = [v6 backgroundView];
  double v8 = [(AVTransition *)self presentationContext];
  long long v9 = [v8 presentedView];
  [v5 insertSubview:v7 belowSubview:v9];

  int v10 = [(AVTransition *)self presentationContext];
  __int16 v11 = [v10 transitionContext];
  int v12 = [v11 containerView];
  uint64_t v13 = [(AVTransition *)self presentationContext];
  uint64_t v14 = [v13 touchBlockingView];
  uint64_t v15 = [(AVTransition *)self presentationContext];
  uint64_t v16 = [v15 presentedView];
  [v12 insertSubview:v14 belowSubview:v16];

  long long v17 = [(AVTransition *)self transitionContext];
  uint64_t v18 = [v17 viewForKey:*MEMORY[0x1E4FB30D0]];

  double v19 = [(AVTransition *)self transitionContext];
  CGAffineTransform v20 = [v19 viewForKey:*MEMORY[0x1E4FB30C0]];

  CGAffineTransform v21 = [(AVTransition *)self transitionContext];
  CGAffineTransform v22 = [v21 viewControllerForKey:*MEMORY[0x1E4FB30C8]];

  if (v20)
  {
    [v20 transform];
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
  }
  *(_OWORD *)&self->_destinationViewTransform.a = v54;
  *(_OWORD *)&self->_destinationViewTransform.c = v55;
  *(_OWORD *)&self->_destinationViewTransform.tCGFloat x = v56;
  if (v18)
  {
    long long v23 = [(AVTransition *)self transitionContext];
    [v23 finalFrameForViewController:v22];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    v57.origin.CGFloat x = v25;
    v57.origin.CGFloat y = v27;
    v57.size.CGFloat width = v29;
    v57.size.height = v31;
    if (!CGRectIsEmpty(v57))
    {
      double v32 = [v22 view];
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
    }
    long long v33 = [(AVTransition *)self transitionContext];
    double v34 = [v33 containerView];
    double v35 = [(AVTransition *)self presentationContext];
    double v36 = [v35 backgroundView];
    [v34 insertSubview:v18 belowSubview:v36];

    double v37 = [v22 view];
    [v37 layoutIfNeeded];

    double v38 = [v22 view];

    if (v18 != v38) {
      [v18 layoutIfNeeded];
    }
  }
  double v39 = [(AVTransition *)self presentationContext];
  CGFloat v40 = [v39 configuration];
  uint64_t v41 = [v40 transitionStyle];

  CGFloat v42 = [(AVTransition *)self transitionContext];
  if ([v42 isInteractive])
  {

LABEL_13:
    v45 = [(AVTransition *)self presentationContext];
    uint64_t v46 = [v45 backgroundView];
    [v46 setAlpha:1.0];

    goto LABEL_14;
  }
  uint64_t v43 = [(AVTransition *)self presentationContext];
  double v44 = [v43 sourceView];

  if (v44 || !v41) {
    goto LABEL_13;
  }
LABEL_14:
  CGAffineTransform v47 = [(AVTransition *)self presentationContext];
  CGAffineTransform v48 = [v47 presentedPresentationContainerView];
  uint64_t v49 = [(AVTransition *)self presentationContext];
  CGRect v50 = [v49 dismissingTransition];
  uint64_t v51 = [v50 initialInterfaceOrientation];
  CGRect v52 = [(AVTransition *)self presentationContext];
  v53 = [v52 dismissingTransition];
  objc_msgSend(v48, "willStartDismissalTransitionFromInterfaceOrientation:toOrientation:needsCounterRotation:", v51, objc_msgSend(v53, "finalInterfaceOrientation"), 0);
}

- (void)_presentationTransitionWillBegin
{
  uint64_t v3 = [(AVTransition *)self presentationContext];
  id v4 = [v3 configuration];
  uint64_t v5 = [v4 transitionStyle];

  id v6 = [(AVTransition *)self presentationContext];
  uint64_t v7 = [v6 presentedView];
  [v7 setAutoresizingMask:18];

  double v8 = [(AVTransition *)self presentationContext];
  long long v9 = [v8 backgroundView];
  [v9 setAutoresizingMask:18];

  int v10 = [(AVTransition *)self presentationContext];
  __int16 v11 = [v10 touchBlockingView];
  [v11 setAutoresizingMask:18];

  int v12 = [(AVTransition *)self transitionContext];
  uint64_t v13 = [v12 containerView];
  uint64_t v14 = [(AVTransition *)self presentationContext];
  uint64_t v15 = [v14 presentedView];
  [v13 addSubview:v15];

  uint64_t v16 = [(AVTransition *)self presentationContext];
  long long v17 = [v16 transitionContext];
  uint64_t v18 = [v17 containerView];
  double v19 = [(AVTransition *)self presentationContext];
  CGAffineTransform v20 = [v19 backgroundView];
  CGAffineTransform v21 = [(AVTransition *)self presentationContext];
  CGAffineTransform v22 = [v21 presentedView];
  [v18 insertSubview:v20 belowSubview:v22];

  long long v23 = [(AVTransition *)self presentationContext];
  double v24 = [v23 transitionContext];
  double v25 = [v24 containerView];
  double v26 = [(AVTransition *)self presentationContext];
  double v27 = [v26 touchBlockingView];
  double v28 = [(AVTransition *)self presentationContext];
  double v29 = [v28 presentedView];
  [v25 insertSubview:v27 belowSubview:v29];

  double v30 = [(AVTransition *)self presentationContext];
  double v31 = [v30 backgroundView];
  [v31 setAlpha:0.0];

  if (!v5)
  {
    double v32 = [(AVTransition *)self transitionContext];
    long long v33 = [v32 containerView];
    [v33 setAlpha:0.0];
  }
  double v34 = [(AVTransition *)self presentationContext];
  double v35 = [v34 sourceView];
  if (v35)
  {

LABEL_6:
    double v38 = [(AVTransition *)self presentationContext];
    double v39 = [v38 presentedView];
    CGFloat v40 = [(AVTransition *)self presentationContext];
    uint64_t v41 = [v40 sourceView];
    [(AVTransition *)self _updateCornerAppearanceAttributesOfView:v39 toSourceView:v41 similarity:1.0];

    CGFloat v42 = [(AVTransition *)self presentationContext];
    uint64_t v43 = [v42 presentedView];
    [(AVTransition *)self _sourceViewFrameInContainerView];
    double v44 = v43;
    goto LABEL_7;
  }
  double v36 = [(AVTransition *)self transitionContext];
  int v37 = [v36 isInteractive];

  if (v37) {
    goto LABEL_6;
  }
  uint64_t v51 = [(AVTransition *)self transitionContext];
  CGRect v52 = [v51 containerView];
  [v52 bounds];
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  CGFloat v60 = v59;

  if (v5 == 1)
  {
    v63.origin.CGFloat x = v54;
    v63.origin.CGFloat y = v56;
    v63.size.CGFloat width = v58;
    v63.size.height = v60;
    CGRectGetHeight(v63);
  }
  CGFloat v42 = [(AVTransition *)self presentationContext];
  double v44 = [v42 presentedView];
  uint64_t v43 = v44;
LABEL_7:
  objc_msgSend(v44, "setFrame:");

  id v61 = [(AVTransition *)self presentationContext];
  v45 = [v61 presentedPresentationContainerView];
  uint64_t v46 = [(AVTransition *)self presentationContext];
  CGAffineTransform v47 = [v46 presentingTransition];
  uint64_t v48 = [v47 initialInterfaceOrientation];
  uint64_t v49 = [(AVTransition *)self presentationContext];
  CGRect v50 = [v49 presentingTransition];
  objc_msgSend(v45, "willStartPresentationTransitionFromInterfaceOrientation:toOrientation:needsCounterRotation:", v48, objc_msgSend(v50, "finalInterfaceOrientation"), 0);
}

- (void)startInteractiveTransition
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 136315650;
    CGFloat v40 = "-[AVTransition startInteractiveTransition]";
    __int16 v41 = 1024;
    int v42 = 86;
    __int16 v43 = 2048;
    double v44 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  id v4 = [(AVTransition *)self presentationContext];
  int v5 = [v4 isPresenting];

  id v6 = [(AVTransition *)self presentationContext];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 presentingTransition];
LABEL_7:
    int v10 = (void *)v8;
    __int16 v11 = [(AVTransition *)self transitionContext];
    objc_msgSend(v10, "setWasInitiallyInteractive:", objc_msgSend(v11, "isInteractive"));

    goto LABEL_8;
  }
  int v9 = [v6 isDismissing];

  if (v9)
  {
    uint64_t v7 = [(AVTransition *)self presentationContext];
    uint64_t v8 = [v7 dismissingTransition];
    goto LABEL_7;
  }
LABEL_8:
  id v12 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  [(AVTransition *)self duration];
  double v14 = v13;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:5];
  uint64_t v16 = (UIViewPropertyAnimator *)[v12 initWithDuration:v15 timingParameters:v14];
  clientAnimator = self->_clientAnimator;
  self->_clientAnimator = v16;

  uint64_t v18 = [(AVTransition *)self clientAnimator];
  [v18 setScrubsLinearly:0];

  double v19 = [(AVTransition *)self allAnimators];
  CGAffineTransform v20 = [(AVTransition *)self clientAnimator];
  [v19 addObject:v20];

  id v21 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  [(AVTransition *)self duration];
  double v23 = v22;
  double v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1698]) initWithAnimationCurve:5];
  double v25 = (UIViewPropertyAnimator *)[v21 initWithDuration:v24 timingParameters:v23];
  transitionAnimator = self->_transitionAnimator;
  self->_transitionAnimator = v25;

  double v27 = [(AVTransition *)self transitionAnimator];
  [v27 setScrubsLinearly:0];

  double v28 = [(AVTransition *)self allAnimators];
  double v29 = [(AVTransition *)self transitionAnimator];
  [v28 addObject:v29];

  double v30 = [(AVTransition *)self presentationContext];
  double v31 = [v30 backgroundView];
  double v32 = [(AVTransition *)self delegate];
  long long v33 = [v32 transitionBackgroundViewBackgroundColor:self];
  [v31 setBackgroundColor:v33];

  double v34 = [(AVTransition *)self presentationContext];
  double v35 = [v34 presentedView];
  double v36 = [(AVTransition *)self delegate];
  int v37 = [v36 transitionPresentedViewBackgroundColor:self];
  [v35 setBackgroundColor:v37];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __42__AVTransition_startInteractiveTransition__block_invoke;
  v38[3] = &unk_1E5FC4698;
  v38[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v38];
}

void __42__AVTransition_startInteractiveTransition__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationContext];
  uint64_t v3 = [v2 transitionType];

  if (v3)
  {
    if (v3 == 2)
    {
      id v6 = *(void **)(a1 + 32);
      [v6 _dismissalTransitionWillBegin];
    }
    else if (v3 == 1)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 _presentationTransitionWillBegin];
    }
  }
  else
  {
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Unexpected", v7, 2u);
    }
  }
}

- (double)transitionAnimatorProgress
{
  uint64_t v3 = [(AVTransition *)self transitionAnimator];
  [v3 fractionComplete];
  double v5 = v4;

  id v6 = [(AVTransition *)self transitionAnimator];
  LODWORD(v3) = [v6 isReversed];

  double result = 1.0 - v5;
  if (!v3) {
    return v5;
  }
  return result;
}

- (double)duration
{
  id v2 = [(AVTransition *)self presentationContext];
  uint64_t v3 = [v2 presentedViewController];
  double v4 = [v3 transitionCoordinator];
  [v4 transitionDuration];
  double v6 = v5;

  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 136315650;
    double v6 = "-[AVTransition dealloc]";
    __int16 v7 = 1024;
    int v8 = 58;
    __int16 v9 = 2048;
    int v10 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVTransition;
  [(AVTransition *)&v4 dealloc];
}

- (AVTransition)initWithTransitionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTransition;
  double v5 = [(AVTransition *)&v10 init];
  if (v5)
  {
    double v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 136315650;
      id v12 = "-[AVTransition initWithTransitionContext:]";
      __int16 v13 = 1024;
      int v14 = 48;
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
    }

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    allAnimators = v5->_allAnimators;
    v5->_allAnimators = (NSMutableArray *)v7;

    objc_storeWeak((id *)&v5->_transitionContext, v4);
  }

  return v5;
}

@end