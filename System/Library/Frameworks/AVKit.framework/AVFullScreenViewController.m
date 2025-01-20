@interface AVFullScreenViewController
- (AVFullScreenViewController)associatedFullScreenViewController;
- (AVFullScreenViewController)sourceFullScreenViewController;
- (AVFullScreenViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)avkit_isEffectivelyFullScreen;
- (BOOL)canBecomeFirstResponder;
- (BOOL)modalPresentationCapturesStatusBarAppearance;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (UIView)contentView;
- (id)keyCommands;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)attachContentView;
- (void)loadView;
- (void)setAssociatedFullScreenViewController:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSourceFullScreenViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillMoveToWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVFullScreenViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_sourceFullScreenViewController);
  objc_destroyWeak((id *)&self->_associatedFullScreenViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (UIView *)WeakRetained;
}

- (void)setSourceFullScreenViewController:(id)a3
{
}

- (AVFullScreenViewController)sourceFullScreenViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceFullScreenViewController);

  return (AVFullScreenViewController *)WeakRetained;
}

- (void)setAssociatedFullScreenViewController:(id)a3
{
}

- (AVFullScreenViewController)associatedFullScreenViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedFullScreenViewController);

  return (AVFullScreenViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVFullScreenViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVFullScreenViewControllerDelegate *)WeakRetained;
}

- (BOOL)avkit_isEffectivelyFullScreen
{
  return 1;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [(AVFullScreenViewController *)self delegate];
  objc_msgSend(v8, "fullScreenViewController:viewWillTransitionToSize:coordinator:", self, v7, width, height);

  v9.receiver = self;
  v9.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (int64_t)preferredStatusBarStyle
{
  v3 = [(AVFullScreenViewController *)self delegate];
  int64_t v4 = [v3 preferredStatusStyleForFullScreenViewController:self];

  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  v3 = [(AVFullScreenViewController *)self delegate];
  LOBYTE(v2) = [v3 prefersStatusBarHiddenForFullScreenViewController:v2];

  return (char)v2;
}

- (BOOL)shouldAutorotate
{
  v2 = [(AVFullScreenViewController *)self delegate];
  char v3 = [v2 shouldAutorotate];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(AVFullScreenViewController *)self delegate];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v2 = [(AVFullScreenViewController *)self delegate];
  int64_t v3 = [v2 preferredInterfaceOrientationForPresentation];

  return v3;
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVFullScreenViewController;
  [(AVFullScreenViewController *)&v4 viewDidAppear:a3];
  [(UIViewController *)self avkit_setNeedsUpdatePreferencesIfNeeded];
}

- (void)attachContentView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(AVFullScreenViewController *)self delegate];

  if (v3)
  {
    objc_super v4 = [(AVFullScreenViewController *)self delegate];
    v5 = [v4 viewForFullScreenViewController:self];

    if (!v5)
    {
      v6 = _AVLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v18 = _AVMethodProem(self);
        v19 = [(AVFullScreenViewController *)self delegate];
        int v20 = 138412546;
        v21 = v18;
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "%@ did not receive a view from its delegate, %@.", (uint8_t *)&v20, 0x16u);
      }
    }
    id v7 = [(AVFullScreenViewController *)self view];
    char v8 = [v5 isDescendantOfView:v7];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = [(AVFullScreenViewController *)self delegate];
      [v9 fullScreenViewControllerWillAttachContentView:self];

      [v5 setAutoresizingMask:18];
      v10 = [(AVFullScreenViewController *)self view];
      [v10 bounds];
      objc_msgSend(v5, "setFrame:");

      v11 = [(AVFullScreenViewController *)self view];
      [v11 setPresentationContainerContentView:v5];

      v12 = [(AVFullScreenViewController *)self view];
      v13 = [v12 appearanceProxy];
      v14 = [(AVFullScreenViewController *)self delegate];
      v15 = [v14 playbackContainerViewForFullScreenViewController:self];
      [v13 setActualView:v15];

      v16 = [(AVFullScreenViewController *)self view];
      [v16 addSubview:v5];

      v17 = [(AVFullScreenViewController *)self delegate];
      [v17 fullScreenViewControllerDidAttachContentView:self];

      [(AVFullScreenViewController *)self setContentView:v5];
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVFullScreenViewController;
  [(AVFullScreenViewController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    v6 = [(AVFullScreenViewController *)self contentView];

    if (!v6)
    {
      id v7 = [(AVFullScreenViewController *)self delegate];
      [v7 fullScreenViewControllerWillBeginFullScreenPresentation:self];

      [(AVFullScreenViewController *)self attachContentView];
    }
  }
}

- (void)viewWillMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (!a3)
  {
    if ([(AVFullScreenViewController *)self isBeingDismissed])
    {
      v5 = [(AVFullScreenViewController *)self delegate];
      [v5 fullScreenViewControllerWillEndFullScreenPresentation:self];
    }
  }
}

- (void)loadView
{
  int64_t v3 = objc_alloc_init(AVPresentationContainerView);
  [(AVFullScreenViewController *)self setView:v3];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(AVFullScreenViewController *)self delegate];
    objc_super v8 = [v7 keyCommandResponderForFullScreenViewController:self];

    if ([v8 canPerformAction:a3 withSender:v6])
    {
      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVFullScreenViewController;
  objc_super v8 = [(AVFullScreenViewController *)&v10 targetForAction:a3 withSender:v6];
LABEL_7:

  return v8;
}

- (id)keyCommands
{
  int64_t v3 = [(AVFullScreenViewController *)self delegate];
  objc_super v4 = [v3 keyCommandResponderForFullScreenViewController:self];
  v5 = [v4 keyCommands];

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  v2 = [(AVFullScreenViewController *)self delegate];
  char v3 = [v2 _canShowWhileLocked];

  return v3;
}

@end