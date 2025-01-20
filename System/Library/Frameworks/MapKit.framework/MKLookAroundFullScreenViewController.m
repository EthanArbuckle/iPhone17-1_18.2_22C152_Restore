@interface MKLookAroundFullScreenViewController
- (MKLookAroundFullScreenViewControllerDelegate)delegate;
- (UIView)contentView;
- (int64_t)overrideUserInterfaceStyle;
- (unint64_t)originalAutoresizingMask;
- (void)attachContentView;
- (void)detachContentView;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginalAutoresizingMask:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MKLookAroundFullScreenViewController

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  [(MKLookAroundFullScreenViewController *)&v5 viewWillAppear:a3];
  if ([(MKLookAroundFullScreenViewController *)self isBeingPresented])
  {
    v4 = [(MKLookAroundFullScreenViewController *)self delegate];
    [v4 fullScreenViewControllerWillPresent:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  [(MKLookAroundFullScreenViewController *)&v5 viewDidAppear:a3];
  if ([(MKLookAroundFullScreenViewController *)self isBeingPresented])
  {
    [(MKLookAroundFullScreenViewController *)self attachContentView];
    v4 = [(MKLookAroundFullScreenViewController *)self delegate];
    [v4 fullScreenViewControllerDidPresent:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  [(MKLookAroundFullScreenViewController *)&v5 viewWillDisappear:a3];
  if ([(MKLookAroundFullScreenViewController *)self isBeingDismissed])
  {
    [(MKLookAroundFullScreenViewController *)self detachContentView];
    v4 = [(MKLookAroundFullScreenViewController *)self delegate];
    [v4 fullScreenViewControllerWillDismiss:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  [(MKLookAroundFullScreenViewController *)&v5 viewDidDisappear:a3];
  if ([(MKLookAroundFullScreenViewController *)self isBeingDismissed])
  {
    v4 = [(MKLookAroundFullScreenViewController *)self delegate];
    [v4 fullScreenViewControllerDidDismiss:self];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [(MKLookAroundFullScreenViewController *)self delegate];
  objc_msgSend(v8, "fullScreenViewController:viewWillTransitionToSize:coordinator:", self, v7, width, height);

  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)MKLookAroundFullScreenViewController;
  [(MKLookAroundFullScreenViewController *)&v16 viewDidLayoutSubviews];
  v3 = [(MKLookAroundFullScreenViewController *)self contentView];
  v4 = [v3 superview];
  objc_super v5 = [(MKLookAroundFullScreenViewController *)self view];

  if (v4 == v5)
  {
    v6 = [(MKLookAroundFullScreenViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(MKLookAroundFullScreenViewController *)self contentView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  }
}

- (void)attachContentView
{
  v3 = [(MKLookAroundFullScreenViewController *)self delegate];

  if (v3)
  {
    v4 = [(MKLookAroundFullScreenViewController *)self delegate];
    id v9 = [v4 viewForFullScreenViewController:self];

    objc_super v5 = [(MKLookAroundFullScreenViewController *)self view];
    char v6 = [v9 isDescendantOfView:v5];

    if ((v6 & 1) == 0)
    {
      -[MKLookAroundFullScreenViewController setOriginalAutoresizingMask:](self, "setOriginalAutoresizingMask:", [v9 autoresizingMask]);
      [v9 setAutoresizingMask:18];
      double v7 = [(MKLookAroundFullScreenViewController *)self view];
      [v7 bounds];
      objc_msgSend(v9, "setFrame:");

      double v8 = [(MKLookAroundFullScreenViewController *)self view];
      [v8 addSubview:v9];

      [(MKLookAroundFullScreenViewController *)self setContentView:v9];
    }
  }
}

- (void)detachContentView
{
  id v5 = [(MKLookAroundFullScreenViewController *)self contentView];
  v3 = [(MKLookAroundFullScreenViewController *)self view];
  int v4 = [v5 isDescendantOfView:v3];

  if (v4)
  {
    [v5 removeFromSuperview];
    objc_msgSend(v5, "setAutoresizingMask:", -[MKLookAroundFullScreenViewController originalAutoresizingMask](self, "originalAutoresizingMask"));
  }
}

- (MKLookAroundFullScreenViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKLookAroundFullScreenViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (UIView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (unint64_t)originalAutoresizingMask
{
  return self->_originalAutoresizingMask;
}

- (void)setOriginalAutoresizingMask:(unint64_t)a3
{
  self->_originalAutoresizingMask = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end