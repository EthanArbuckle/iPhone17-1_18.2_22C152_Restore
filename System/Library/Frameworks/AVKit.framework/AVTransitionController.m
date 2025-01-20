@interface AVTransitionController
- (AVDisplayLink)displayLink;
- (AVInteractiveTransitionGestureTracker)gestureTracker;
- (AVPresentationContext)presentationContext;
- (AVTransition)activeTransition;
- (AVTransitionControllerDelegate)delegate;
- (AVTransitionDriver)interactiveGestureTracker;
- (BOOL)transitionDriver:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5;
- (BOOL)transitionDriver:(id)a3 shouldDriveTransitionInteractionOfType:(int64_t)a4;
- (BOOL)wantsInteractiveStart;
- (CAMediaTimingFunction)easeInFunction;
- (CAMediaTimingFunction)easeOutFunction;
- (CGPoint)touchGravity;
- (UIView)interactionView;
- (UIView)sourceViewForNextPresentation;
- (double)transitionDuration:(id)a3;
- (id)transitionBackgroundViewBackgroundColor:(id)a3;
- (id)transitionDidBeginHandler;
- (id)transitionPresentedViewBackgroundColor:(id)a3;
- (int64_t)state;
- (void)_cancelTransition;
- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_ensurePresentationControllerWithTransitionContext:(id)a3;
- (void)_finishTransition;
- (void)_fireDidBeginHandlerIfNeeded;
- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_startObservingAnimatorProgress;
- (void)addTransitionDriver:(id)a3 toView:(id)a4;
- (void)animationEnded:(BOOL)a3;
- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 isInteractive:(BOOL)a5 completion:(id)a6;
- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 isInteractive:(BOOL)a5 completion:(id)a6;
- (void)ensurePresentationControllerWithPresentingViewController:(id)a3 presentedViewController:(id)a4;
- (void)setActiveTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setEaseInFunction:(id)a3;
- (void)setEaseOutFunction:(id)a3;
- (void)setInteractionView:(id)a3;
- (void)setInteractiveGestureTracker:(id)a3;
- (void)setSourceViewForNextPresentation:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTouchGravity:(CGPoint)a3;
- (void)setTransitionDidBeginHandler:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)transitionDriver:(id)a3 didBeginTrackingTransitionInteraction:(int64_t)a4 readyToProceedHandler:(id)a5;
- (void)transitionDriverDidCancelInteraction:(id)a3;
- (void)transitionDriverDidContinueInteraction:(id)a3;
- (void)transitionDriverDidFinishInteraction:(id)a3;
- (void)transitionWillComplete:(id)a3 success:(BOOL)a4 continueBlock:(id)a5;
@end

@implementation AVTransitionController

- (AVPresentationContext)presentationContext
{
  return [(AVPresentationController *)self->_presentationController context];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_easeOutFunction, 0);
  objc_storeStrong((id *)&self->_easeInFunction, 0);
  objc_storeStrong(&self->_transitionDidBeginHandler, 0);
  objc_destroyWeak((id *)&self->_sourceViewForNextPresentation);
  objc_storeStrong((id *)&self->_gestureTracker, 0);
  objc_storeStrong((id *)&self->_activeTransition, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_storeStrong((id *)&self->_interactiveGestureTracker, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_presentationController, 0);
}

- (void)setTouchGravity:(CGPoint)a3
{
  self->_touchGravity = a3;
}

- (CGPoint)touchGravity
{
  double x = self->_touchGravity.x;
  double y = self->_touchGravity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEaseOutFunction:(id)a3
{
}

- (CAMediaTimingFunction)easeOutFunction
{
  return self->_easeOutFunction;
}

- (void)setEaseInFunction:(id)a3
{
}

- (CAMediaTimingFunction)easeInFunction
{
  return self->_easeInFunction;
}

- (void)setTransitionDidBeginHandler:(id)a3
{
}

- (id)transitionDidBeginHandler
{
  return self->_transitionDidBeginHandler;
}

- (void)setSourceViewForNextPresentation:(id)a3
{
}

- (UIView)sourceViewForNextPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceViewForNextPresentation);

  return (UIView *)WeakRetained;
}

- (AVInteractiveTransitionGestureTracker)gestureTracker
{
  return self->_gestureTracker;
}

- (void)setActiveTransition:(id)a3
{
}

- (AVTransition)activeTransition
{
  return self->_activeTransition;
}

- (void)setDisplayLink:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (UIView)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);

  return (UIView *)WeakRetained;
}

- (AVTransitionDriver)interactiveGestureTracker
{
  return self->_interactiveGestureTracker;
}

- (AVTransitionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTransitionControllerDelegate *)WeakRetained;
}

- (void)_startObservingAnimatorProgress
{
  v3 = [(AVTransitionController *)self presentationContext];
  v4 = [v3 presentedViewController];
  v5 = [v4 transitioningDelegate];

  if (v5 == self)
  {
    id v6 = [(AVTransitionController *)self displayLink];
    [v6 startDisplayLinkUpdatesForObserver:self framesPerSecond:36 usingBlock:&__block_literal_global_21697];
  }
}

void __57__AVTransitionController__startObservingAnimatorProgress__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] >= 2)
  {
    v2 = [v5 delegate];
    v3 = [v5 activeTransition];
    [v3 transitionAnimatorProgress];
    *(float *)&double v4 = v4;
    [v2 transitionController:v5 animationProgressDidChange:v4];
  }
}

- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  [(AVTransitionController *)self ensurePresentationControllerWithPresentingViewController:v10 presentedViewController:v12];
  v13 = [v10 transitionCoordinator];

  if (v13)
  {
    v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_ERROR, "Attempted to present from source view controller that is transitioning.", buf, 2u);
    }
  }
  [v10 presentViewController:v12 animated:v7 completion:0];
  v15 = [v12 transitionCoordinator];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__AVTransitionController__present_fromViewController_animated_completion___block_invoke;
  v17[3] = &unk_1E5FC3FB8;
  id v18 = v11;
  id v16 = v11;
  [v15 animateAlongsideTransition:0 completion:v17];

  [(AVTransitionController *)self _startObservingAnimatorProgress];
}

uint64_t __74__AVTransitionController__present_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  double v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)_fireDidBeginHandlerIfNeeded
{
  uint64_t v4 = [(AVTransitionController *)self transitionDidBeginHandler];
  [(AVTransitionController *)self setTransitionDidBeginHandler:0];
  uint64_t v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    uint64_t v3 = (void *)v4;
  }
}

- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 transitionCoordinator];

  if (v13)
  {
    v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_ERROR, "Attempted to dismiss from source view controller that is transitioning.", buf, 2u);
    }
  }
  [v10 dismissViewControllerAnimated:v7 completion:0];
  v15 = [v12 transitionCoordinator];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__AVTransitionController__dismiss_fromViewController_animated_completion___block_invoke;
  v17[3] = &unk_1E5FC3FB8;
  id v18 = v11;
  id v16 = v11;
  [v15 animateAlongsideTransition:0 completion:v17];

  [(AVTransitionController *)self _startObservingAnimatorProgress];
}

uint64_t __74__AVTransitionController__dismiss_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)transitionWillComplete:(id)a3 success:(BOOL)a4 continueBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(AVTransitionController *)self delegate];
  [v8 transitionController:self transitionWillComplete:v5 continueBlock:v7];
}

- (id)transitionPresentedViewBackgroundColor:(id)a3
{
  uint64_t v4 = [(AVTransitionController *)self delegate];
  BOOL v5 = [v4 transitionControllerPresentedViewBackgroundColor:self];

  return v5;
}

- (id)transitionBackgroundViewBackgroundColor:(id)a3
{
  uint64_t v4 = [(AVTransitionController *)self delegate];
  BOOL v5 = [v4 transitionControllerBackgroundViewBackgroundColor:self];

  return v5;
}

- (void)animationEnded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AVPresentationController *)self->_presentationController presented]
    || [(AVPresentationController *)self->_presentationController presenting])
  {
    [(AVPresentationController *)self->_presentationController presentationTransitionDidEnd:v3];
  }
  else if ([(AVPresentationController *)self->_presentationController dismissed] {
         || [(AVPresentationController *)self->_presentationController dismissing])
  }
  {
    [(AVPresentationController *)self->_presentationController dismissalTransitionDidEnd:v3];
    presentationController = self->_presentationController;
    self->_presentationController = 0;
  }
  [(AVTransitionController *)self setActiveTransition:0];
  id v6 = [(AVTransitionController *)self displayLink];
  [v6 invalidate];

  [(AVTransitionController *)self setState:0];
  interactiveGestureTracker = self->_interactiveGestureTracker;
  if (interactiveGestureTracker) {
    id v8 = interactiveGestureTracker;
  }
  else {
    id v8 = objc_alloc_init(AVInteractiveTransitionGestureTracker);
  }
  v9 = v8;
  [(AVTransitionController *)self setInteractiveGestureTracker:v8];
  id v10 = _AVLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[AVTransitionController animationEnded:]";
    __int16 v13 = 1024;
    int v14 = 666;
    __int16 v15 = 2048;
    id v16 = self;
    _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v11, 0x1Cu);
  }
}

- (double)transitionDuration:(id)a3
{
  id v5 = a3;
  [(AVTransitionController *)self _ensurePresentationControllerWithTransitionContext:v5];
  if ([(AVPresentationController *)self->_presentationController presented]
    || [(AVPresentationController *)self->_presentationController presenting])
  {
    [(AVPresentationController *)self->_presentationController presentationTransitionWillBegin];
  }
  else if ([(AVPresentationController *)self->_presentationController dismissed] {
         || [(AVPresentationController *)self->_presentationController dismissing])
  }
  {
    [(AVPresentationController *)self->_presentationController dismissalTransitionWillBegin];
  }
  id v6 = [(AVTransitionController *)self presentationContext];
  id v7 = [v6 presentationWindow];
  id v8 = [v7 windowScene];

  uint64_t v9 = [v8 activationState];
  uint64_t v10 = v9;
  if (v9 == 2 || v9 == -1)
  {
    id v7 = [(AVTransitionController *)self presentationContext];
    BOOL v3 = [v7 presentationWindow];
    int v11 = objc_msgSend(v3, "avkit_isHostedInAnotherProcess") ^ 1;
  }
  else
  {
    int v11 = 0;
  }
  if (v10 == 2 || v10 == -1)
  {
  }
  double v12 = 0.0;
  if ((([v5 isAnimated] ^ 1 | v11) & 1) == 0)
  {
    __int16 v13 = [(AVTransitionController *)self presentationContext];
    int v14 = [v13 configuration];
    [v14 transitionDuration];
    double v12 = v15;
  }
  return v12;
}

- (void)_ensurePresentationControllerWithTransitionContext:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB30B8];
  id v5 = a3;
  id v8 = [v5 viewControllerForKey:v4];
  id v6 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  [(AVTransitionController *)self ensurePresentationControllerWithPresentingViewController:v8 presentedViewController:v6];
  id v7 = [(AVPresentationController *)self->_presentationController context];
  [v7 setTransitionContext:v5];
}

- (void)startInteractiveTransition:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[AVTransitionController startInteractiveTransition:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  id v6 = [(AVTransitionController *)self presentationContext];
  [v6 setTransitionContext:v4];

  id v7 = [[AVTransition alloc] initWithTransitionContext:v4];
  [(AVTransitionController *)self setActiveTransition:v7];

  id v8 = [(AVTransitionController *)self activeTransition];
  uint64_t v9 = [(AVTransitionController *)self presentationContext];
  [v8 setPresentationContext:v9];

  uint64_t v10 = [(AVTransitionController *)self activeTransition];
  [v10 setDelegate:self];

  int v11 = [(AVTransitionController *)self activeTransition];
  [v11 startInteractiveTransition];

  switch([(AVTransitionController *)self state])
  {
    case 0:
      goto LABEL_12;
    case 1:
      if ([v4 isInteractive])
      {
        [(AVTransitionController *)self setState:2];
        [(AVTransitionController *)self _fireDidBeginHandlerIfNeeded];
      }
      else
      {
        [(AVTransitionController *)self _fireDidBeginHandlerIfNeeded];
LABEL_12:
        int v14 = self;
        uint64_t v15 = 5;
LABEL_13:
        [(AVTransitionController *)v14 setState:v15];
      }
      break;
    case 2:
    case 5:
      double v12 = _AVLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        __int16 v13 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v13;
        _os_log_error_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_ERROR, "%@: Unexpected transition state.", buf, 0xCu);
      }
      goto LABEL_10;
    case 3:
      [(AVTransitionController *)self _fireDidBeginHandlerIfNeeded];
      int v14 = self;
      uint64_t v15 = 3;
      goto LABEL_13;
    case 4:
      [(AVTransitionController *)self _fireDidBeginHandlerIfNeeded];
      double v12 = [(AVTransitionController *)self delegate];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __53__AVTransitionController_startInteractiveTransition___block_invoke;
      v31[3] = &unk_1E5FC4698;
      v31[4] = self;
      [v12 transitionController:self prepareForFinishingInteractiveTransition:v31];
LABEL_10:

      break;
    default:
      break;
  }
  id v16 = [(AVPresentationController *)self->_presentationController context];
  uint64_t v17 = [v16 transitionType];

  if (v17)
  {
    if (v17 == 2)
    {
      v21 = [(AVTransitionController *)self delegate];
      v22 = [(AVPresentationController *)self->_presentationController context];
      v23 = [v22 presentedViewController];
      id v18 = [v21 transitionController:self targetViewForDismissingViewController:v23];

      v24 = [(AVTransitionController *)self presentationContext];
      [v24 setSourceView:v18];

      v25 = [(AVTransitionController *)self presentationContext];
      v26 = [(AVTransitionController *)self interactiveGestureTracker];
      objc_msgSend(v25, "setAllowsPausingWhenTransitionCompletes:", objc_msgSend(v26, "transitionInteraction") != 2);

      v19 = [(AVTransitionController *)self delegate];
      v20 = [(AVPresentationController *)self->_presentationController context];
      v27 = [v20 presentedViewController];
      [v19 transitionController:self willBeginDismissingViewController:v27];
    }
    else
    {
      if (v17 != 1) {
        goto LABEL_23;
      }
      id v18 = [(AVTransitionController *)self delegate];
      v19 = [(AVPresentationController *)self->_presentationController context];
      v20 = [v19 presentedViewController];
      [v18 transitionController:self willBeginPresentingViewController:v20];
    }
  }
  else
  {
    id v18 = _AVLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "Unexpected", buf, 2u);
    }
  }

LABEL_23:
  v28 = [(AVTransitionController *)self activeTransition];
  [v28 addRunAlongsideAnimationsIfNeeded];

  switch([(AVTransitionController *)self state])
  {
    case 0:
    case 1:
      v29 = _AVLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_error_impl(&dword_1B05B7000, v29, OS_LOG_TYPE_ERROR, "%@: Unexpected transition state.", buf, 0xCu);
      }
      goto LABEL_29;
    case 2:
      v29 = [(AVTransitionController *)self activeTransition];
      [v29 pauseInteractiveTransition];
      goto LABEL_29;
    case 3:
      v29 = [(AVTransitionController *)self activeTransition];
      [v29 cancelInteractiveTransition];
      goto LABEL_29;
    case 5:
      v29 = [(AVTransitionController *)self activeTransition];
      [v29 finishInteractiveTransition];
LABEL_29:

      break;
    default:
      break;
  }
}

void __53__AVTransitionController_startInteractiveTransition___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeTransition];
  [v1 finishInteractiveTransition];
}

- (BOOL)wantsInteractiveStart
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(AVTransitionController *)self state];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    int v6 = 136315650;
    id v7 = "-[AVTransitionController wantsInteractiveStart]";
    uint64_t v9 = "wantsInteractiveStart";
    __int16 v8 = 2080;
    if (v2 == 1) {
      id v4 = "YES";
    }
    __int16 v10 = 2080;
    int v11 = v4;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
  }

  return v2 == 1;
}

- (void)_finishTransition
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(AVTransitionController *)self state] != 2 && [(AVTransitionController *)self state] != 1)
  {
    BOOL v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = _AVMethodProem(self);
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      int64_t v11 = [(AVTransitionController *)self state];
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "%@ called with an invalid state %ld", buf, 0x16u);
    }
  }
  id v4 = [(AVTransitionController *)self activeTransition];

  if (v4)
  {
    [(AVTransitionController *)self setState:5];
    id v5 = [(AVTransitionController *)self delegate];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__AVTransitionController__finishTransition__block_invoke;
    v7[3] = &unk_1E5FC4698;
    v7[4] = self;
    [v5 transitionController:self prepareForFinishingInteractiveTransition:v7];
  }
  else
  {
    [(AVTransitionController *)self setState:4];
  }
}

void __43__AVTransitionController__finishTransition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeTransition];
  [v1 finishInteractiveTransition];
}

- (void)transitionDriverDidFinishInteraction:(id)a3
{
  id v4 = a3;
  switch([v4 transitionInteraction])
  {
    case 0:
      goto LABEL_37;
    case 1:
      [v4 pinchScale];
      if (v5 > 1.05)
      {
        [v4 pinchVelocity];
        if (v6 > 0.0) {
          goto LABEL_38;
        }
      }
      [v4 pinchVelocity];
      if (v7 > 1.5) {
        goto LABEL_38;
      }
      goto LABEL_37;
    case 2:
      [v4 pinchScale];
      if (v8 < 0.95)
      {
        [v4 pinchVelocity];
        if (v9 < 0.0) {
          goto LABEL_38;
        }
      }
      [v4 pinchVelocity];
      if (v10 < -2.5) {
        goto LABEL_38;
      }
      goto LABEL_37;
    case 3:
      [v4 locationInWindow];
      double v12 = v11;
      [v4 velocityInWindow];
      double v42 = v13;
      double v15 = v14;
      [v4 translationInWindow];
      double v17 = v16;
      double v18 = v12 - v16;
      v19 = [(AVTransitionController *)self presentationContext];
      v20 = [v19 presentationWindow];
      [v20 bounds];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      v29 = [(AVTransitionController *)self presentationContext];
      v30 = [v29 currentTransition];
      v31 = v30;
      if (v30) {
        [v30 rotationTransform];
      }
      else {
        memset(&v43, 0, sizeof(v43));
      }
      v44.origin.double x = v22;
      v44.origin.double y = v24;
      v44.size.width = v26;
      v44.size.double height = v28;
      CGRect v45 = CGRectApplyAffineTransform(v44, &v43);
      double height = v45.size.height;

      if (height <= 0.0) {
        double v33 = 1.0;
      }
      else {
        double v33 = v18 / height;
      }
      [v4 angleOfVelocityInWindow];
      double v35 = v34;
      int v36 = [v4 lastNonZeroVelocityWasDownward];
      double v37 = -v35;
      if (v35 >= 0.0) {
        double v37 = v35;
      }
      if (v37 >= v33 * 70.0 + (1.0 - v33) * 80.0 || v15 <= 0.0)
      {
        BOOL v38 = v15 != *(double *)(MEMORY[0x1E4F1DAD8] + 8) || v42 != *MEMORY[0x1E4F1DAD8];
        if (!v36) {
          goto LABEL_37;
        }
      }
      else
      {
        BOOL v38 = 0;
        if (!v36)
        {
LABEL_37:
          [(AVTransitionController *)self _cancelTransition];
          goto LABEL_39;
        }
      }
      if (v38) {
        goto LABEL_37;
      }
      double v39 = fmax(height - v18, 0.0);
      double v40 = 32.0;
      if (v17 < 0.0) {
        double v40 = 32.0 - v17;
      }
      double v41 = 44.0;
      if (v17 < 0.0) {
        double v41 = 44.0 - v17;
      }
      if (v40 >= v39) {
        double v39 = v40;
      }
      if (v39 >= v41) {
        double v39 = v41;
      }
      if (v17 < v39 && v12 + v15 * 0.001 * 0.995 / 0.005 - v18 < 96.0) {
        goto LABEL_37;
      }
LABEL_38:
      [(AVTransitionController *)self _finishTransition];
LABEL_39:

      return;
    default:
      goto LABEL_39;
  }
}

- (void)_cancelTransition
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVTransitionController *)self state])
  {
    if ([(AVTransitionController *)self state] != 2 && [(AVTransitionController *)self state] != 1)
    {
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        double v5 = _AVMethodProem(self);
        int v6 = 138412546;
        double v7 = v5;
        __int16 v8 = 2048;
        int64_t v9 = [(AVTransitionController *)self state];
        _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "%@ called with an invalid state %ld", (uint8_t *)&v6, 0x16u);
      }
    }
    [(AVTransitionController *)self setState:3];
    id v4 = [(AVTransitionController *)self activeTransition];
    [v4 cancelInteractiveTransition];
  }
}

- (void)transitionDriverDidCancelInteraction:(id)a3
{
  id v4 = [(AVTransitionController *)self presentationContext];
  if (![v4 isDismissing]) {
    goto LABEL_12;
  }
  double v5 = [(AVTransitionController *)self presentationContext];
  int v6 = [v5 dismissingTransition];
  if (![v6 isRotated]) {
    goto LABEL_10;
  }
  double v7 = [(AVTransitionController *)self presentationContext];
  if (![v7 wasInitiallyInteractive])
  {
LABEL_9:

LABEL_10:
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  __int16 v8 = [(AVTransitionController *)self presentationContext];
  int64_t v9 = [v8 presentationWindow];
  double v23 = [v9 windowScene];
  uint64_t v10 = [v23 interfaceOrientation];
  double v11 = [(AVTransitionController *)self presentationContext];
  double v12 = [v11 dismissingTransition];
  if (v10 != [v12 finalInterfaceOrientation])
  {

    goto LABEL_9;
  }
  double v13 = [(AVTransitionController *)self presentationContext];
  [v13 presentationWindow];
  double v14 = v21 = v8;
  [v14 windowScene];
  double v15 = v20 = v9;
  uint64_t v22 = [v15 activationState];

  if (v22)
  {
    double v16 = [(AVTransitionController *)self presentationContext];
    double v17 = [v16 rotatableSecondWindow];
    if (v17)
    {

LABEL_17:
      [(AVTransitionController *)self _finishTransition];
      return;
    }
    double v18 = [(AVTransitionController *)self presentationContext];
    v19 = [v18 avFullScreenViewController];

    if (v19) {
      goto LABEL_17;
    }
    id v4 = [(AVTransitionController *)self presentationContext];
    double v5 = [v4 dismissingTransition];
    [v5 setWasCancelledWithInactiveScene:1];
    goto LABEL_11;
  }
LABEL_13:

  [(AVTransitionController *)self _cancelTransition];
}

- (void)transitionDriverDidContinueInteraction:(id)a3
{
  id v4 = a3;
  if ([(AVTransitionController *)self state] != 2) {
    goto LABEL_31;
  }
  double v5 = [(AVPresentationController *)self->_presentationController context];
  int v6 = [v5 sourceView];

  [v4 translationInWindow];
  double v95 = v7;
  double v96 = v8;
  [v4 rotation];
  double v10 = v9;
  uint64_t v11 = [v4 transitionInteraction];
  double v12 = 0.5;
  double v13 = 1.125;
  if (v11 == 3)
  {
    double v17 = [(AVTransitionController *)self presentationContext];
    double v18 = [v17 transitionContext];
    v19 = [v18 containerView];
    [v19 frame];
    double v21 = v20;

    uint64_t v22 = [(AVTransitionController *)self presentationContext];
    double v23 = [v22 transitionContext];
    CGFloat v24 = [v23 containerView];
    [v24 frame];
    double v26 = v25;

    double v27 = [(AVTransitionController *)self presentationContext];
    CGFloat v28 = [v27 dismissingTransition];
    if ([v28 isRotated]) {
      double v21 = v26;
    }

    double v15 = v96 / v21;
    double v14 = 1.0 - v96 / v21;
    goto LABEL_11;
  }
  if (v11 == 2)
  {
    [v4 pinchScale];
    double v15 = 1.0 - v29;
  }
  else
  {
    double v14 = 1.0;
    double v15 = 1.0;
    if (v11 != 1) {
      goto LABEL_11;
    }
    [v4 pinchScale];
    double v15 = v16 + -1.0;
  }
  [v4 pinchScale];
  double v14 = v30;
  double v13 = 3.5;
  double v12 = 0.2;
LABEL_11:
  if (!self->_easeOutFunction || !self->_easeInFunction)
  {
    v31 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    easeInFunction = self->_easeInFunction;
    self->_easeInFunction = v31;

    double v33 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    easeOutFunction = self->_easeOutFunction;
    self->_easeOutFunction = v33;
  }
  double v35 = 1.0;
  if (v14 <= 1.0)
  {
    if (v14 < 1.0)
    {
      double v41 = [(AVTransitionController *)self easeInFunction];
      double v42 = fmax(v14, 0.0);
      *(float *)&double v42 = v42;
      [v41 _solveForInput:v42];
      double v44 = v43;

      double v35 = v12 + v44 * (1.0 - v12);
    }
  }
  else
  {
    double v36 = v13 - v12;
    double v37 = [(AVTransitionController *)self easeInFunction];
    double v38 = fmin(fmax((v14 + -1.0) / (v13 - v12), 0.0), 1.0);
    *(float *)&double v38 = v38;
    [v37 _solveForInput:v38];
    double v40 = v39;

    double v35 = v40 * v36 + 1.0;
  }
  double v45 = fmax(v15, 0.0);
  if (v6)
  {
    v46 = [(AVTransitionController *)self presentationContext];
    v47 = [v46 currentTransition];
    if ([v47 isRotated]) {
      double v48 = 3.14159265;
    }
    else {
      double v48 = 9.42477796;
    }
  }
  else
  {
    double v48 = 9.42477796;
  }
  double v49 = fmin(v45, 0.5);
  v50 = [(AVTransitionController *)self easeOutFunction];
  float v51 = v10 / v48;
  *(float *)&double v52 = fabsf(v51);
  [v50 _solveForInput:v52];
  if (v10 >= 0.0) {
    double v54 = v53 * 1.57079633;
  }
  else {
    double v54 = -(v53 * 1.57079633);
  }

  v55 = [(AVTransitionController *)self presentationContext];
  v56 = [v55 presentationWindow];
  [v56 bounds];
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;
  v65 = [(AVTransitionController *)self presentationContext];
  v66 = [v65 currentTransition];
  v67 = v66;
  if (v66) {
    [v66 rotationTransform];
  }
  else {
    memset(&v97, 0, sizeof(v97));
  }
  v98.origin.double x = v58;
  v98.origin.double y = v60;
  v98.size.CGFloat width = v62;
  v98.size.CGFloat height = v64;
  CGRect v99 = CGRectApplyAffineTransform(v98, &v97);
  CGFloat height = v99.size.height;
  CGFloat width = v99.size.width;

  [v4 locationInWindow];
  double v69 = v68;
  double v71 = v70;
  UIRectGetCenter();
  double v73 = v69 - v72;
  double v75 = v71 - v74;
  v76.f64[0] = v95;
  v76.f64[1] = v96;
  v77.f64[0] = width;
  v77.f64[1] = height;
  float64x2_t v78 = vdivq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v76), (int8x16_t)vnegq_f64(v76), (int8x16_t)v76), v77);
  __asm { FMOV            V1.2D, #1.0 }
  self->_touchGravitdouble y = (CGPoint)vminnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v78, (float64x2_t)self->_touchGravity), (int8x16_t)v78, (int8x16_t)self->_touchGravity), _Q1);
  [(AVTransitionController *)self touchGravity];
  double v85 = 1.0 - v84;
  [(AVTransitionController *)self touchGravity];
  double v87 = v73 * v86 + v85 * v95;
  [(AVTransitionController *)self touchGravity];
  double v89 = 1.0 - v88;
  [(AVTransitionController *)self touchGravity];
  double v91 = v75 * v90 + v89 * v96;
  v92 = [(AVTransitionController *)self activeTransition];
  objc_msgSend(v92, "updateWithPercentComplete:scale:translation:rotation:", v49, v35, v87, v91, v54);

LABEL_31:
}

- (void)transitionDriver:(id)a3 didBeginTrackingTransitionInteraction:(int64_t)a4 readyToProceedHandler:(id)a5
{
  id v7 = a3;
  double v8 = (void (**)(void))a5;
  -[AVTransitionController setTouchGravity:](self, "setTouchGravity:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (![(AVTransitionController *)self state])
  {
    uint64_t v10 = [v7 transitionInteraction];
    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1)
      {
        double v9 = _AVLog();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_3;
        }
        __int16 v15 = 0;
        double v12 = "Unexpected gesture kind.";
        double v13 = (uint8_t *)&v15;
LABEL_13:
        _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, v12, v13, 2u);
        goto LABEL_3;
      }
      [(AVTransitionController *)self setState:1];
      uint64_t v11 = [(AVTransitionController *)self delegate];
      [v11 transitionControllerBeginInteractivePresentationTransition:self];
    }
    else
    {
      [(AVTransitionController *)self setState:1];
      uint64_t v11 = [(AVTransitionController *)self delegate];
      [v11 transitionControllerBeginInteractiveDismissalTransition:self];
    }

    [(AVTransitionController *)self setTransitionDidBeginHandler:v8];
    goto LABEL_9;
  }
  double v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = 0;
    double v12 = "Unexpected transitioning state.";
    double v13 = (uint8_t *)&v14;
    goto LABEL_13;
  }
LABEL_3:

  v8[2](v8);
LABEL_9:
}

- (BOOL)transitionDriver:(id)a3 shouldDriveTransitionInteractionOfType:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 2) >= 2)
  {
    if (a4 == 1 && ![(AVTransitionController *)self state])
    {
      id v7 = [(AVTransitionController *)self delegate];
      char v9 = [v7 transitionControllerCanBeginInteractivePresentationTransition:self];
LABEL_10:

      goto LABEL_11;
    }
  }
  else if (![(AVTransitionController *)self state])
  {
    id v7 = [(AVTransitionController *)self presentationContext];
    if ([v7 canBeInteractivelyDismissed])
    {
      double v8 = [(AVTransitionController *)self delegate];
      char v9 = [v8 transitionControllerCanBeginInteractiveDismissalTransition:self];
    }
    else
    {
      char v9 = 0;
    }
    goto LABEL_10;
  }
  char v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)transitionDriver:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEnabled])
  {
    uint64_t v10 = [(AVTransitionController *)self delegate];
    char v11 = [v10 transitionController:self gestureRecognizer:v8 shouldReceiveTouch:v9];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)ensurePresentationControllerWithPresentingViewController:(id)a3 presentedViewController:(id)a4
{
  if (!self->_presentationController)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(AVTransitionController *)self delegate];
    id v15 = [v8 transitionController:self configurationForPresentedViewController:v6 presentingViewController:v7];

    id v9 = [(AVTransitionController *)self sourceViewForNextPresentation];
    uint64_t v10 = [AVPresentationController alloc];
    char v11 = [v6 presentationController];
    double v12 = [(AVPresentationController *)v10 initWithPresentationController:v11 presentedViewController:v6 presentingViewController:v7 withConfiguration:v15];

    double v13 = [(AVPresentationController *)v12 context];
    [v13 setSourceView:v9];

    [(AVTransitionController *)self setSourceViewForNextPresentation:0];
    presentationController = self->_presentationController;
    self->_presentationController = v12;
  }
}

- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 isInteractive:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void *)[a6 copy];
  char v11 = [v9 presentingViewController];

  if (!v11)
  {
    double v12 = _AVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_ERROR, "Tried to dismiss a view controller without a presenting view controller. This is hard.", buf, 2u);
    }
  }
  double v13 = [(AVTransitionController *)self presentationContext];
  __int16 v14 = [v13 presentedViewController];

  id v15 = [v9 transitionCoordinator];
  if (v15)
  {
    double v16 = _AVLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "Source view controller is transitioning. Will continue fullscreen dismissal once complete. %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__AVTransitionController_beginFullScreenDismissalOfViewController_animated_isInteractive_completion___block_invoke;
    v17[3] = &unk_1E5FC3F90;
    void v17[4] = self;
    id v18 = v9;
    id v19 = v14;
    BOOL v21 = v7;
    id v20 = v10;
    [v15 animateAlongsideTransition:0 completion:v17];
  }
  else
  {
    [(AVTransitionController *)self _dismiss:v9 fromViewController:v14 animated:v7 completion:v10];
  }
}

uint64_t __101__AVTransitionController_beginFullScreenDismissalOfViewController_animated_isInteractive_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 isInteractive:(BOOL)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  [(AVTransitionController *)self setSourceViewForNextPresentation:v10];
  [v9 setTransitioningDelegate:self];
  if (v10
    && ([MEMORY[0x1E4FB1EC0] _viewControllerForFullScreenPresentationFromView:v10],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v13 = (void *)v12;
  }
  else
  {
    __int16 v14 = (id *)MEMORY[0x1E4FB2608];
    if ([(id)*MEMORY[0x1E4FB2608] supportsMultipleScenes])
    {
      double v13 = 0;
    }
    else
    {

      id v19 = objc_msgSend(*v14, "avkit_possibleWindowForControllingOverallAppearance");
      for (uint64_t i = [v19 rootViewController];
      {
        double v13 = (void *)i;

        id v10 = [v13 presentedViewController];

        if (!v10) {
          break;
        }
        id v19 = v13;
        [v13 presentedViewController];
      }
    }
  }
  if (v9)
  {
    id v15 = (void *)[v11 copy];

    double v16 = [v13 transitionCoordinator];
    if (v16)
    {
      double v17 = _AVLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v26 = v13;
        _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "Source view controller is transitioning. Will continue fullscreen presentation once complete. %@", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __104__AVTransitionController_beginFullScreenPresentationOfViewController_fromView_isInteractive_completion___block_invoke;
      v21[3] = &unk_1E5FC3F68;
      v21[4] = self;
      id v22 = v9;
      id v23 = v13;
      id v24 = v15;
      [v16 animateAlongsideTransition:0 completion:v21];
    }
    else
    {
      [(AVTransitionController *)self _present:v9 fromViewController:v13 animated:1 completion:v15];
    }
  }
  else
  {
    id v18 = _AVLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "Cannot present view controller without a view controller from which to present.", buf, 2u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
    id v15 = v11;
  }
}

uint64_t __104__AVTransitionController_beginFullScreenPresentationOfViewController_fromView_isInteractive_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _present:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48) animated:1 completion:*(void *)(a1 + 56)];
}

- (void)addTransitionDriver:(id)a3 toView:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    [a4 addInteraction:v6];
    [v6 setTransitionDriverDelegate:self];
  }
}

- (void)setInteractionView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_interactionView, obj);
    double v5 = [(AVTransitionController *)self interactiveGestureTracker];
    [(AVTransitionController *)self addTransitionDriver:v5 toView:obj];
  }
}

- (void)setInteractiveGestureTracker:(id)a3
{
  double v5 = (AVTransitionDriver *)a3;
  if (self->_interactiveGestureTracker != v5)
  {
    __int16 v14 = v5;
    id v6 = [(AVTransitionController *)self interactiveGestureTracker];

    if (v6)
    {
      BOOL v7 = [(AVTransitionController *)self interactiveGestureTracker];
      id v8 = [v7 view];
      id v9 = [(AVTransitionController *)self interactiveGestureTracker];
      [v8 removeInteraction:v9];

      id v10 = [(AVTransitionController *)self interactiveGestureTracker];
      id v11 = [v10 contentTransitioningViewGestureRecognizer];
      [(AVTransitionDriver *)v14 setContentTransitioningViewGestureRecognizer:v11];
    }
    objc_storeStrong((id *)&self->_interactiveGestureTracker, a3);
    interactiveGestureTracker = self->_interactiveGestureTracker;
    double v13 = [(AVTransitionController *)self interactionView];
    [(AVTransitionController *)self addTransitionDriver:interactiveGestureTracker toView:v13];

    double v5 = v14;
  }
}

- (AVDisplayLink)displayLink
{
  displayLink = self->_displayLink;
  if (!displayLink)
  {
    id v4 = objc_alloc_init(AVDisplayLink);
    double v5 = self->_displayLink;
    self->_displayLink = v4;

    displayLink = self->_displayLink;
  }

  return displayLink;
}

@end