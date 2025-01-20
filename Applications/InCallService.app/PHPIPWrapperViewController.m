@interface PHPIPWrapperViewController
- (BOOL)pipIsBeingResized;
- (CGSize)preferredContentSize;
- (PHPIPWrapperViewController)init;
- (PHPIPWrapperViewControllerDelegateProtocol)delegate;
- (UIViewController)wrappedViewController;
- (id)didAnimatePictureInPictureStopCompletionBlock;
- (id)willAnimatePictureInPictureStopCompletionBlock;
- (void)_layoutWrappedSubview;
- (void)actionButtonTapped;
- (void)dealloc;
- (void)didAnimatePictureInPictureStop;
- (void)setDelegate:(id)a3;
- (void)setDidAnimatePictureInPictureStopCompletionBlock:(id)a3;
- (void)setPipIsBeingResized:(BOOL)a3;
- (void)setWillAnimatePictureInPictureStopCompletionBlock:(id)a3;
- (void)setWrappedViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidResize;
- (void)viewWillResize;
- (void)willAnimatePictureInPictureStart;
- (void)willAnimatePictureInPictureStop;
@end

@implementation PHPIPWrapperViewController

- (PHPIPWrapperViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  return [(PHPIPWrapperViewController *)&v3 initWithNibName:0 bundle:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PHPIPWrapperViewController;
  [(PHPIPWrapperViewController *)&v6 viewDidLoad];
  objc_super v3 = +[UIColor clearColor];
  v4 = [(PHPIPWrapperViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(PHPIPWrapperViewController *)self view];
  [v5 setOpaque:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  [(PHPIPWrapperViewController *)&v3 viewDidLayoutSubviews];
  [(PHPIPWrapperViewController *)self _layoutWrappedSubview];
}

- (void)setWrappedViewController:(id)a3
{
  id obj = a3;
  p_wrappedViewController = &self->_wrappedViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedViewController);

  objc_super v6 = obj;
  if (WeakRetained != obj)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_wrappedViewController);
    v8 = [v7 parentViewController];

    if (v8 == self)
    {
      [v7 willMoveToParentViewController:0];
      v9 = [v7 view];
      [v9 removeFromSuperview];

      [v7 removeFromParentViewController];
    }
    objc_storeWeak((id *)p_wrappedViewController, obj);

    objc_super v6 = obj;
  }
}

- (void)willAnimatePictureInPictureStart
{
  objc_super v3 = [(PHPIPWrapperViewController *)self wrappedViewController];

  v4 = sub_1000D5250();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v22 = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Moving content into the wrapping PIP controller", (uint8_t *)&v22, 0xCu);
    }
    objc_super v6 = [(PHPIPWrapperViewController *)self wrappedViewController];
    [(PHPIPWrapperViewController *)self addChildViewController:v6];

    id v7 = [(PHPIPWrapperViewController *)self view];
    v8 = [(PHPIPWrapperViewController *)self wrappedViewController];
    v9 = [v8 view];
    [v7 addSubview:v9];

    v10 = [(PHPIPWrapperViewController *)self wrappedViewController];
    [v10 didMoveToParentViewController:self];

    v11 = [(PHPIPWrapperViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [(PHPIPWrapperViewController *)self wrappedViewController];
    v21 = [v20 view];
    [v21 setFrame:v13, v15, v17, v19];
  }
  else if (v5)
  {
    int v22 = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Warning: Not moving content into wrapped PIP controller because wrappedViewController is nil", (uint8_t *)&v22, 0xCu);
  }
}

- (void)willAnimatePictureInPictureStop
{
  objc_super v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "willAnimatePictureInPictureStop", v6, 2u);
  }
  v4 = [(PHPIPWrapperViewController *)self willAnimatePictureInPictureStopCompletionBlock];

  if (v4)
  {
    BOOL v5 = [(PHPIPWrapperViewController *)self willAnimatePictureInPictureStopCompletionBlock];
    v5[2](v5, 1);
  }
}

- (void)didAnimatePictureInPictureStop
{
  objc_super v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    double v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP Animation to fullscreen did complete", (uint8_t *)&v12, 0xCu);
  }
  v4 = [(PHPIPWrapperViewController *)self didAnimatePictureInPictureStopCompletionBlock];

  if (v4)
  {
    BOOL v5 = [(PHPIPWrapperViewController *)self delegate];
    unsigned int v6 = [v5 wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:self];

    if (v6)
    {
      id v7 = [(PHPIPWrapperViewController *)self wrappedViewController];
    }
    else
    {
      id v7 = 0;
    }
    v9 = sub_1000D5250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      double v13 = self;
      __int16 v14 = 2112;
      double v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling didAnimatePictureInPictureStopCompletionBlock with viewControllerToSteal: %@", (uint8_t *)&v12, 0x16u);
    }
    v10 = [(PHPIPWrapperViewController *)self didAnimatePictureInPictureStopCompletionBlock];
    ((void (**)(void, uint64_t, void *))v10)[2](v10, 1, v7);

    [(PHPIPWrapperViewController *)self setDidAnimatePictureInPictureStopCompletionBlock:0];
  }
  else
  {
    v8 = sub_1000D5250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      double v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Block didAnimatePictureInPictureStopCompletionBlock isn't set, won't restore view controller", (uint8_t *)&v12, 0xCu);
    }
  }
  v11 = [(PHPIPWrapperViewController *)self delegate];
  [v11 wrapperViewControllerNeedsCleanup:self];
}

- (CGSize)preferredContentSize
{
  objc_super v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating preferredContentSize to use for the PIP wrapper view controller", (uint8_t *)&v20, 0xCu);
  }
  v4 = [(PHPIPWrapperViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unsigned int v6 = [(PHPIPWrapperViewController *)self delegate];
    [v6 wrapperViewControllerPreferredContentSize:self];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    v11 = sub_1000D5250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      int v12 = "%{public}@: Found delegate with preferred size width=%f, height=%f";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    double v13 = [(PHPIPWrapperViewController *)self wrappedViewController];
    unsigned int v14 = [v13 conformsToProtocol:&OBJC_PROTOCOL___PHInCallRootViewControllerProtocol];

    if (!v14)
    {
      uint64_t v10 = 0x4059000000000000;
      uint64_t v8 = 0x4059000000000000;
      goto LABEL_11;
    }
    double v15 = [(PHPIPWrapperViewController *)self wrappedViewController];
    [v15 preferredPIPContentAspectRatio];
    uint64_t v8 = v16;
    uint64_t v10 = v17;

    v11 = sub_1000D5250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      int v12 = "%{public}@: Found child view controller with preferred size width=%f, height=%f";
      goto LABEL_9;
    }
  }
LABEL_11:
  double v18 = *(double *)&v8;
  double v19 = *(double *)&v10;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)actionButtonTapped
{
  objc_super v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP action button tapped, will disconnect the current video call", (uint8_t *)&v7, 0xCu);
  }
  v4 = +[TUCallCenter sharedInstance];
  char v5 = +[TUCallCenter sharedInstance];
  unsigned int v6 = [v5 currentVideoCall];
  [v4 disconnectCall:v6];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_wrappedViewController, 0);
  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  [(PHPIPWrapperViewController *)&v3 dealloc];
}

- (void)viewWillResize
{
  [(PHPIPWrapperViewController *)self setPipIsBeingResized:1];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHPIPControllerDidStartResizingNotification" object:self];
}

- (void)viewDidResize
{
  [(PHPIPWrapperViewController *)self setPipIsBeingResized:0];
  id v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP view did resize", (uint8_t *)&v5, 0xCu);
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PHPIPControllerDidFinishResizingNotification" object:self];
}

- (void)_layoutWrappedSubview
{
  id v3 = [(PHPIPWrapperViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(PHPIPWrapperViewController *)self preferredContentSize];
  if (v8 == v9)
  {
    if (v5 >= v7) {
      double v10 = v7;
    }
    else {
      double v10 = v5;
    }
    double v11 = v10;
  }
  else if (v8 <= v9)
  {
    double v11 = v8 * (v7 / fmax(v9, 1.0));
    double v10 = v7;
  }
  else
  {
    double v10 = v9 * (v5 / fmax(v8, 1.0));
    double v11 = v5;
  }
  id v13 = [(PHPIPWrapperViewController *)self wrappedViewController];
  int v12 = [v13 view];
  [v12 setFrame:(v5 - v11) * 0.5, (v7 - v10) * 0.5, v11, v10];
}

- (UIViewController)wrappedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedViewController);

  return (UIViewController *)WeakRetained;
}

- (PHPIPWrapperViewControllerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHPIPWrapperViewControllerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)willAnimatePictureInPictureStopCompletionBlock
{
  return self->_willAnimatePictureInPictureStopCompletionBlock;
}

- (void)setWillAnimatePictureInPictureStopCompletionBlock:(id)a3
{
}

- (id)didAnimatePictureInPictureStopCompletionBlock
{
  return self->_didAnimatePictureInPictureStopCompletionBlock;
}

- (void)setDidAnimatePictureInPictureStopCompletionBlock:(id)a3
{
}

- (BOOL)pipIsBeingResized
{
  return self->_pipIsBeingResized;
}

- (void)setPipIsBeingResized:(BOOL)a3
{
  self->_pipIsBeingResized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didAnimatePictureInPictureStopCompletionBlock, 0);
  objc_storeStrong(&self->_willAnimatePictureInPictureStopCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_wrappedViewController);
}

@end