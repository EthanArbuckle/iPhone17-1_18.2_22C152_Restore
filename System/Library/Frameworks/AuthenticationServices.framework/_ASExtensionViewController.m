@interface _ASExtensionViewController
- (BOOL)_shouldUseNonUIRequestTimer;
- (BOOL)dismissOnBackground;
- (NSExtension)extension;
- (NSExtensionContext)nonUIHostContext;
- (_ASExtensionViewController)initWithExtension:(id)a3;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (void)_beginNonUIRequest:(BOOL)a3 connectionHandler:(id)a4;
- (void)_beginRequestWithConnectionHandler:(id)a3;
- (void)_extensionRequestDidFinish:(BOOL)a3;
- (void)_invalidateNonUIRequestTimerIfNeeded;
- (void)_nonUIRequestTimedOut;
- (void)_setRemoteViewController:(id)a3;
- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5;
- (void)setDismissOnBackground:(BOOL)a3;
@end

@implementation _ASExtensionViewController

- (_ASExtensionViewController)initWithExtension:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ASExtensionViewController;
  v6 = [(_ASExtensionViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    [(_ASExtensionViewController *)v7 setModalPresentationStyle:2];
    v8 = v7;
  }

  return v7;
}

- (void)_extensionRequestDidFinish:(BOOL)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___ASExtensionViewController__extensionRequestDidFinish___block_invoke;
  block[3] = &unk_264395C88;
  objc_copyWeak(&v5, &location);
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setRemoteViewController:(id)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  v4 = (UIViewController *)a3;
  [(_ASExtensionViewController *)self _endDelayingPresentation];
  id v5 = [(UIViewController *)v4 view];
  BOOL v6 = [(_ASExtensionViewController *)self view];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;
  v20 = v4;

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIViewController *)self->_remoteViewController willMoveToParentViewController:self];
  [v6 addSubview:v5];
  [(_ASExtensionViewController *)self addChildViewController:self->_remoteViewController];
  v16 = (void *)MEMORY[0x263F08938];
  v22 = [v5 leftAnchor];
  v21 = [v6 leftAnchor];
  v19 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v19;
  v18 = [v5 topAnchor];
  v17 = [v6 topAnchor];
  v8 = [v18 constraintEqualToAnchor:v17];
  v23[1] = v8;
  v9 = [v5 rightAnchor];
  objc_super v10 = [v6 rightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[2] = v11;
  v12 = [v5 bottomAnchor];
  v13 = [v6 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v23[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v16 activateConstraints:v15];
}

- (void)setDismissOnBackground:(BOOL)a3
{
  if (self->_dismissOnBackground != a3)
  {
    if (a3)
    {
      objc_initWeak(&location, self);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __53___ASExtensionViewController_setDismissOnBackground___block_invoke;
      v5[3] = &unk_264395360;
      objc_copyWeak(&v6, &location);
      [(UIViewController *)self _as_setApplicationBackgroundBlock:v5];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      [(UIViewController *)self _as_setApplicationBackgroundBlock:0];
    }
    self->_dismissOnBackground = a3;
  }
}

- (void)_beginRequestWithConnectionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(_ASExtensionViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
  extension = self->_extension;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke;
  v7[3] = &unk_264395D00;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NSExtension *)extension _as_instantiateViewControllerWithConnectionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_beginNonUIRequest:(BOOL)a3 connectionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  self->_allowRequestingUIFromNonUIRequest = a3;
  extension = self->_extension;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke;
  v14 = &unk_264395D00;
  v15 = self;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v16 = v8;
  [(NSExtension *)extension _as_instantiateViewControllerWithConnectionHandler:&v11];
  if ([(_ASExtensionViewController *)self _shouldUseNonUIRequestTimer])
  {
    id v9 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__nonUIRequestTimedOut selector:0 userInfo:0 repeats:3.0];
    [v9 setTolerance:0.2];
    objc_super v10 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v10 addTimer:v9 forMode:*MEMORY[0x263EFF588]];

    objc_storeWeak((id *)&self->_nonUIRequestTimer, v9);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldUseNonUIRequestTimer
{
  return 1;
}

- (void)_invalidateNonUIRequestTimerIfNeeded
{
  p_nonUIRequestTimer = &self->_nonUIRequestTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nonUIRequestTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_nonUIRequestTimer, 0);
}

- (void)_nonUIRequestTimedOut
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Killing extension due to timeout during non-UI request", v1, 2u);
}

- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85___ASExtensionViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke;
  v14[3] = &unk_264395530;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_remoteViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)dismissOnBackground
{
  return self->_dismissOnBackground;
}

- (NSExtensionContext)nonUIHostContext
{
  return (NSExtensionContext *)self->_nonUIHostContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_nonUIRequestTimer);
  objc_storeStrong((id *)&self->_nonUIHostContext, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end