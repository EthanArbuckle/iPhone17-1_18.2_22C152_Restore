@interface AVPresentationContext
+ (BOOL)supportsInteractiveCounterRotationDismissals;
- (AVFullScreenViewController)avFullScreenViewController;
- (AVFullScreenViewController)rotatableWindowViewController;
- (AVPresentationConfiguration)configuration;
- (AVPresentationContainerView)presentedPresentationContainerView;
- (AVPresentationContext)initWithPresentationController:(id)a3 configuration:(id)a4;
- (AVPresentationContextTransition)currentTransition;
- (AVPresentationContextTransition)dismissingTransition;
- (AVPresentationContextTransition)presentingTransition;
- (AVPresentationController)presentationController;
- (BOOL)allowsPausingWhenTransitionCompletes;
- (BOOL)allowsSecondWindowPresentations;
- (BOOL)canBeInteractivelyDismissed;
- (BOOL)hasActiveTransition;
- (BOOL)isDismissing;
- (BOOL)isPresenting;
- (BOOL)wasInitiallyInteractive;
- (BOOL)wasInitiallyPresentedWithoutSecondWindow;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)presentedView;
- (UIView)sourceView;
- (UIView)touchBlockingView;
- (UIViewController)presentedViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (UIWindow)presentationWindow;
- (UIWindow)rotatableSecondWindow;
- (id)fromView;
- (id)presentingView;
- (id)toView;
- (int64_t)transitionType;
- (void)setAllowsPausingWhenTransitionCompletes:(BOOL)a3;
- (void)setAllowsSecondWindowPresentations:(BOOL)a3;
- (void)setDismissingTransition:(id)a3;
- (void)setPresentingTransition:(id)a3;
- (void)setRotatableSecondWindow:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setWasInitiallyPresentedWithoutSecondWindow:(BOOL)a3;
@end

@implementation AVPresentationContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationController);
  objc_storeStrong((id *)&self->_dismissingTransition, 0);
  objc_storeStrong((id *)&self->_presentingTransition, 0);
  objc_destroyWeak((id *)&self->_avFullScreenViewController);
  objc_storeStrong((id *)&self->_rotatableSecondWindow, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_destroyWeak((id *)&self->_sourceView);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (AVPresentationController)presentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);

  return (AVPresentationController *)WeakRetained;
}

- (void)setAllowsPausingWhenTransitionCompletes:(BOOL)a3
{
  self->_allowsPausingWhenTransitionCompletes = a3;
}

- (BOOL)allowsPausingWhenTransitionCompletes
{
  return self->_allowsPausingWhenTransitionCompletes;
}

- (void)setDismissingTransition:(id)a3
{
}

- (AVPresentationContextTransition)dismissingTransition
{
  return self->_dismissingTransition;
}

- (void)setPresentingTransition:(id)a3
{
}

- (AVPresentationContextTransition)presentingTransition
{
  return self->_presentingTransition;
}

- (AVFullScreenViewController)avFullScreenViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avFullScreenViewController);

  return (AVFullScreenViewController *)WeakRetained;
}

- (void)setRotatableSecondWindow:(id)a3
{
}

- (UIWindow)rotatableSecondWindow
{
  return self->_rotatableSecondWindow;
}

- (void)setWasInitiallyPresentedWithoutSecondWindow:(BOOL)a3
{
  self->_wasInitiallyPresentedWithoutSecondWindow = a3;
}

- (BOOL)wasInitiallyPresentedWithoutSecondWindow
{
  return self->_wasInitiallyPresentedWithoutSecondWindow;
}

- (void)setAllowsSecondWindowPresentations:(BOOL)a3
{
  self->_allowsSecondWindowPresentations = a3;
}

- (BOOL)allowsSecondWindowPresentations
{
  return self->_allowsSecondWindowPresentations;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  return (UIViewControllerContextTransitioning *)WeakRetained;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (AVPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (id)toView
{
  v2 = [(AVPresentationContext *)self transitionContext];
  v3 = [v2 viewForKey:*MEMORY[0x1E4FB30D0]];

  return v3;
}

- (int64_t)transitionType
{
  if ([(AVPresentationContext *)self isPresenting]) {
    return 1;
  }
  if ([(AVPresentationContext *)self isDismissing]) {
    return 2;
  }
  return 0;
}

- (BOOL)wasInitiallyInteractive
{
  if ([(AVPresentationContext *)self isPresenting])
  {
    v3 = [(AVPresentationContext *)self presentingTransition];
LABEL_5:
    v5 = v3;
    char v6 = [v3 wasInitiallyInteractive];

    LOBYTE(v4) = v6;
    return v4;
  }
  BOOL v4 = [(AVPresentationContext *)self isDismissing];
  if (v4)
  {
    v3 = [(AVPresentationContext *)self dismissingTransition];
    goto LABEL_5;
  }
  return v4;
}

- (void)setTransitionContext:(id)a3
{
  id obj = a3;
  p_transitionContext = &self->_transitionContext;
  id WeakRetained = objc_loadWeakRetained((id *)p_transitionContext);

  char v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_transitionContext, obj);
    char v6 = obj;
  }
}

- (AVFullScreenViewController)rotatableWindowViewController
{
  v2 = [(AVPresentationContext *)self rotatableSecondWindow];
  v3 = [v2 rootViewController];

  return (AVFullScreenViewController *)v3;
}

- (UIWindow)presentationWindow
{
  v3 = [(AVPresentationContext *)self presentationController];
  BOOL v4 = [v3 containerView];
  id v5 = [v4 window];

  if (!v5)
  {
    char v6 = [(AVPresentationContext *)self presentationController];
    v7 = [v6 presentingViewController];
    v8 = [v7 view];
    v9 = [v8 window];
    v10 = v9;
    if (v9)
    {
      id v5 = v9;
    }
    else
    {
      v11 = [(AVPresentationContext *)self presentationController];
      v12 = [v11 presentedViewController];
      v13 = [v12 view];
      id v5 = [v13 window];
    }
  }

  return (UIWindow *)v5;
}

- (id)presentingView
{
  if ([(AVPresentationContext *)self isPresenting])
  {
    v3 = [(AVPresentationContext *)self fromView];
  }
  else if ([(AVPresentationContext *)self isDismissing])
  {
    v3 = [(AVPresentationContext *)self toView];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (UIViewController)presentedViewController
{
  v2 = [(AVPresentationContext *)self presentationController];
  v3 = [v2 presentedViewController];

  return (UIViewController *)v3;
}

- (AVPresentationContainerView)presentedPresentationContainerView
{
  v3 = [(AVPresentationContext *)self presentedView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(AVPresentationContext *)self presentedView];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0)
    {
      v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Presented view is not of type AVPresentationContainerView. Falling back to out-of-band presented view.", v10, 2u);
      }
    }
    v8 = [(AVPresentationContext *)self presentationController];
    id v5 = [v8 presentedPresentationContainerView];
  }

  return (AVPresentationContainerView *)v5;
}

- (UIView)presentedView
{
  v2 = [(AVPresentationContext *)self presentedViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isPresenting
{
  v2 = [(AVPresentationContext *)self presentationController];
  char v3 = [v2 presenting];

  return v3;
}

- (BOOL)isDismissing
{
  v2 = [(AVPresentationContext *)self presentationController];
  char v3 = [v2 dismissing];

  return v3;
}

- (BOOL)hasActiveTransition
{
  if ([(AVPresentationContext *)self isPresenting]) {
    return 1;
  }

  return [(AVPresentationContext *)self isDismissing];
}

- (id)fromView
{
  v2 = [(AVPresentationContext *)self transitionContext];
  char v3 = [v2 viewForKey:*MEMORY[0x1E4FB30C0]];

  return v3;
}

- (AVPresentationContextTransition)currentTransition
{
  if ([(AVPresentationContext *)self isPresenting])
  {
    char v3 = [(AVPresentationContext *)self presentingTransition];
  }
  else if ([(AVPresentationContext *)self isDismissing])
  {
    char v3 = [(AVPresentationContext *)self dismissingTransition];
  }
  else
  {
    char v3 = 0;
  }

  return (AVPresentationContextTransition *)v3;
}

- (UIView)containerView
{
  char v3 = [(AVPresentationContext *)self presentationController];
  BOOL v4 = [v3 containerView];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(AVPresentationContext *)self transitionContext];
    id v6 = [v7 containerView];
  }

  return (UIView *)v6;
}

- (BOOL)canBeInteractivelyDismissed
{
  BOOL v3 = 1;
  if (!+[AVPresentationContext supportsInteractiveCounterRotationDismissals])
  {
    BOOL v4 = [(AVPresentationContext *)self presentationController];
    id v5 = [v4 containerView];
    id v6 = [v5 window];

    uint64_t v7 = [(id)*MEMORY[0x1E4FB2608] _supportedInterfaceOrientationsForWindow:v6];
    v8 = [(AVPresentationContext *)self presentationController];
    v9 = [v8 presentingViewController];
    uint64_t v10 = [v9 supportedInterfaceOrientations];

    BOOL v3 = ((1 << [v6 _windowInterfaceOrientation]) & ~(v10 & v7)) == 0;
  }
  return v3;
}

- (AVPresentationContext)initWithPresentationController:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVPresentationContext;
  v8 = [(AVPresentationContext *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentationController, v6);
    uint64_t v10 = [v6 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v6 presentedViewController];
      objc_storeWeak((id *)&v9->_avFullScreenViewController, v11);
    }
    else
    {
      objc_storeWeak((id *)&v9->_avFullScreenViewController, 0);
    }

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v12;

    [(UIView *)v9->_backgroundView setUserInteractionEnabled:0];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    touchBlockingView = v9->_touchBlockingView;
    v9->_touchBlockingView = v14;

    objc_storeStrong((id *)&v9->_configuration, a4);
  }

  return v9;
}

+ (BOOL)supportsInteractiveCounterRotationDismissals
{
  return objc_msgSend(MEMORY[0x1E4FB1F58], "avkit_supportsInteractiveCounterRotationDismissals");
}

@end