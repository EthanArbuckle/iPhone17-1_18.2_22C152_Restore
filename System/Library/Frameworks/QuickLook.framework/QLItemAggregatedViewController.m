@interface QLItemAggregatedViewController
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canBeLocked;
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canEnterFullScreen;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)canPinchToDismiss;
- (BOOL)canShowNavBar;
- (BOOL)canShowToolBar;
- (BOOL)canSwipeToDismiss;
- (BOOL)canToggleFullScreen;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)navigationBarShouldBeChromeless;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldRecognizeGestureRecognizer:(id)a3;
- (BOOL)supportsChromeless;
- (BOOL)toolbarShouldBeChromeless;
- (CGRect)contentFrame;
- (CGSize)preferredContentSize;
- (QLItemViewController)currentPreviewViewController;
- (double)edgePanGestureWidth;
- (id)accessoryView;
- (id)appearance;
- (id)delegate;
- (id)draggableView;
- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3;
- (id)fullscreenBackgroundColor;
- (id)parallaxView;
- (id)printer;
- (id)registeredKeyCommands;
- (id)safeAreaLayoutGuide;
- (id)scrollView;
- (id)stateRestorationDictionary;
- (id)title;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (id)transitioningView;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)actionSheetDidDismiss;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)documentMenuActionWillBegin;
- (void)handlePerformedKeyCommandIfNeeded:(id)a3;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(id)a3;
- (void)hostSceneWillDeactivate;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)notifyStateRestorationWithUserInfo:(id)a3;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)prepareForActionSheetPresentation;
- (void)prepareForInvalidationWithCompletionHandler:(id)a3;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewIsAppearingWithProgress:(double)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)previewWillFinishAppearing;
- (void)requestLockForCurrentItem;
- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentPreviewViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showPreviewViewController:(id)a3;
- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
@end

@implementation QLItemAggregatedViewController

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4
{
  BOOL v4 = a4;
  v68[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [v7 parentViewController];

  if (v8 != self)
  {
    v9 = [v7 parentViewController];

    if (v9)
    {
      [v7 willMoveToParentViewController:0];
      v10 = [v7 view];
      [v10 removeFromSuperview];

      [v7 removeFromParentViewController];
    }
    [v7 willMoveToParentViewController:self];
    v11 = [(QLItemAggregatedViewController *)self view];
    v12 = [v7 view];
    [v11 addSubview:v12];

    [(QLItemAggregatedViewController *)self addChildViewController:v7];
    [v7 didMoveToParentViewController:self];
    if (self->_isVisible || self->_isAppearing) {
      [v7 previewWillAppear:self->_currentPreviewViewController != 0];
    }
    v13 = [(QLItemAggregatedViewController *)self view];
    v14 = v13;
    if (v13)
    {
      [v13 transform];
    }
    else
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v62 = 0u;
    }
    v15 = [v7 view];
    v61[0] = v62;
    v61[1] = v63;
    v61[2] = v64;
    [v15 setTransform:v61];

    v16 = [(QLItemAggregatedViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [v7 view];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    v26 = [v7 view];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = [(QLItemAggregatedViewController *)self view];
    v28 = (void *)MEMORY[0x263F08938];
    v67 = @"preview";
    v29 = [v7 view];
    v68[0] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    v31 = [v28 constraintsWithVisualFormat:@"H:|[preview]|" options:0 metrics:0 views:v30];
    [v27 addConstraints:v31];

    v32 = [(QLItemAggregatedViewController *)self view];
    v33 = (void *)MEMORY[0x263F08938];
    v65 = @"preview";
    v34 = [v7 view];
    v66 = v34;
    v35 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v36 = [v33 constraintsWithVisualFormat:@"V:|[preview]|" options:0 metrics:0 views:v35];
    [v32 addConstraints:v36];

    v37 = [(QLItemAggregatedViewController *)self delegate];
    [v7 setDelegate:v37];

    v38 = [(QLItemViewController *)self presentingDelegate];
    [v7 setPresentingDelegate:v38];

    p_currentPreviewViewController = &self->_currentPreviewViewController;
    currentPreviewViewController = self->_currentPreviewViewController;
    if (currentPreviewViewController)
    {
      v41 = currentPreviewViewController;
      [(QLItemViewController *)v41 previewWillDisappear:0];
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke;
      aBlock[3] = &unk_2642F5078;
      v42 = v41;
      v58 = v42;
      v59 = self;
      id v43 = v7;
      id v60 = v43;
      v44 = (void (**)(void))_Block_copy(aBlock);
      v45 = [v43 view];
      v46 = v45;
      if (v4)
      {
        [v45 setAlpha:0.0];

        v47 = (void *)MEMORY[0x263F82E00];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_2;
        v55[3] = &unk_2642F5430;
        v56 = v42;
        [v47 animateWithDuration:0x10000 delay:v55 options:0 animations:0.5 completion:0.1];
        v48 = (void *)MEMORY[0x263F82E00];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_3;
        v53[3] = &unk_2642F5430;
        id v54 = v43;
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_4;
        v51[3] = &unk_2642F5E08;
        v52 = v44;
        [v48 animateWithDuration:v53 animations:v51 completion:0.5];
      }
      else
      {
        [v45 setAlpha:1.0];

        v44[2](v44);
      }
    }
    else if (self->_isVisible)
    {
      [v7 previewDidAppear:1];
      self->_isAppearing = 0;
    }
    objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
    v49 = [(QLItemAggregatedViewController *)self delegate];
    [(QLItemViewController *)*p_currentPreviewViewController setDelegate:v49];

    [(QLItemViewController *)*p_currentPreviewViewController setAppearance:self->_appearance];
    [(QLItemViewController *)*p_currentPreviewViewController previewBecameFullScreen:self->_fullScreen animated:0];
    v50 = [(QLItemAggregatedViewController *)self delegate];
    [v50 previewItemViewControllerDidChangeCurrentPreviewController:self];
  }
}

uint64_t __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t result = [*(id *)(a1 + 32) previewDidDisappear:1];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 1112))
  {
    uint64_t result = [*(id *)(a1 + 48) previewDidAppear:1];
    *(unsigned char *)(*(void *)(a1 + 40) + 1113) = 0;
  }
  return result;
}

void __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showPreviewViewController:(id)a3
{
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_appearance, a3);
  id v7 = a3;
  [(QLItemViewController *)self->_currentPreviewViewController setAppearance:v7 animated:v4];
}

- (id)appearance
{
  return self->_appearance;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(QLItemViewController *)self->_currentPreviewViewController setDelegate:v5];
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewWillAppear:](&v7, sel_previewWillAppear_);
  if (self->_isVisible)
  {
    id v5 = (NSObject **)MEMORY[0x263F62940];
    v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEBUG, "previewWillAppear was called when the controller was already visible (after previewDidAppear) (%@) #AggregatedViewController", buf, 0xCu);
    }
  }
  self->_isAppearing = 1;
  [(QLItemViewController *)self->_currentPreviewViewController previewWillAppear:v3];
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v5, sel_previewIsAppearingWithProgress_);
  [(QLItemViewController *)self->_currentPreviewViewController previewIsAppearingWithProgress:a3];
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(QLItemAggregatedViewController *)self delegate];
  currentPreviewViewController = self->_currentPreviewViewController;
  [(QLItemViewController *)currentPreviewViewController edgePanGestureWidth];
  objc_msgSend(v5, "previewItemViewController:wantsToSetRemoteEdgePanGestureWidth:", currentPreviewViewController);

  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  [(QLItemViewController *)&v7 previewDidAppear:v3];
  self->_isVisible = 1;
  self->_isAppearing = 0;
  [(QLItemViewController *)self->_currentPreviewViewController previewDidAppear:v3];
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewWillDisappear:](&v5, sel_previewWillDisappear_);
  [(QLItemViewController *)self->_currentPreviewViewController previewWillDisappear:v3];
}

- (void)previewDidDisappear:(BOOL)a3
{
  self->_isAppearing = 0;
  if (self->_isVisible)
  {
    BOOL v3 = a3;
    self->_isVisible = 0;
    v5.receiver = self;
    v5.super_class = (Class)QLItemAggregatedViewController;
    -[QLItemViewController previewDidDisappear:](&v5, sel_previewDidDisappear_);
    [(QLItemViewController *)self->_currentPreviewViewController previewDidDisappear:v3];
  }
}

- (void)previewWillFinishAppearing
{
  v3.receiver = self;
  v3.super_class = (Class)QLItemAggregatedViewController;
  [(QLItemViewController *)&v3 previewWillFinishAppearing];
  [(QLItemViewController *)self->_currentPreviewViewController previewWillFinishAppearing];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_fullScreen = a3;
  -[QLItemViewController previewBecameFullScreen:animated:](self->_currentPreviewViewController, "previewBecameFullScreen:animated:");
  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  [(QLItemViewController *)&v7 previewBecameFullScreen:v5 animated:v4];
}

- (void)hostApplicationDidBecomeActive
{
}

- (void)hostSceneWillDeactivate
{
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
}

- (void)prepareForActionSheetPresentation
{
}

- (void)actionSheetDidDismiss
{
}

- (void)documentMenuActionWillBegin
{
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
}

- (BOOL)canEnterFullScreen
{
  currentPreviewViewController = self->_currentPreviewViewController;
  return !currentPreviewViewController
      || [(QLItemViewController *)currentPreviewViewController canEnterFullScreen];
}

- (id)accessoryView
{
  return [(QLItemViewController *)self->_currentPreviewViewController accessoryView];
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  return [(QLItemViewController *)self->_currentPreviewViewController toolbarButtonsForTraitCollection:a3];
}

- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3
{
  return [(QLItemViewController *)self->_currentPreviewViewController excludedToolbarButtonIdentifiersForTraitCollection:a3];
}

- (id)registeredKeyCommands
{
  return [(QLItemViewController *)self->_currentPreviewViewController registeredKeyCommands];
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  if (self->_currentPreviewViewController)
  {
    currentPreviewViewController = self->_currentPreviewViewController;
    return [(QLItemViewController *)currentPreviewViewController shouldAcceptTouch:a3 ofGestureRecognizer:a4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)QLItemAggregatedViewController;
    return [(QLItemViewController *)&v6 shouldAcceptTouch:a3 ofGestureRecognizer:a4];
  }
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  return [(QLItemViewController *)self->_currentPreviewViewController shouldRecognizeGestureRecognizer:a3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return [(QLItemViewController *)self->_currentPreviewViewController gestureRecognizer:a3 shouldRequireFailureOfGestureRecognizer:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return [(QLItemViewController *)self->_currentPreviewViewController gestureRecognizer:a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:a4];
}

- (id)safeAreaLayoutGuide
{
  objc_super v3 = [(QLItemAggregatedViewController *)self parentViewController];
  if (v3)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 parentViewController];

      objc_super v3 = (void *)v4;
    }
    while (v4);
  }
  BOOL v5 = [v3 safeAreaLayoutGuide];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)QLItemAggregatedViewController;
    id v7 = [(QLItemAggregatedViewController *)&v10 safeAreaLayoutGuide];
  }
  v8 = v7;

  return v8;
}

- (BOOL)canSwipeToDismiss
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController canSwipeToDismiss];
  }
  return (char)currentPreviewViewController;
}

- (BOOL)canToggleFullScreen
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController canToggleFullScreen];
  }
  return (char)currentPreviewViewController;
}

- (BOOL)canClickToToggleFullscreen
{
  if (self->_currentPreviewViewController)
  {
    currentPreviewViewController = self->_currentPreviewViewController;
    return [(QLItemViewController *)currentPreviewViewController canClickToToggleFullscreen];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)QLItemAggregatedViewController;
    return [(QLItemViewController *)&v4 canClickToToggleFullscreen];
  }
}

- (BOOL)canPinchToDismiss
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController canPinchToDismiss];
  }
  return (char)currentPreviewViewController;
}

- (BOOL)canShowToolBar
{
  currentPreviewViewController = self->_currentPreviewViewController;
  return !currentPreviewViewController
      || [(QLItemViewController *)currentPreviewViewController canShowToolBar];
}

- (BOOL)canShowNavBar
{
  currentPreviewViewController = self->_currentPreviewViewController;
  return !currentPreviewViewController
      || [(QLItemViewController *)currentPreviewViewController canShowNavBar];
}

- (BOOL)canBeLocked
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController canBeLocked];
  }
  return (char)currentPreviewViewController;
}

- (void)requestLockForCurrentItem
{
}

- (id)scrollView
{
  return [(QLItemViewController *)self->_currentPreviewViewController scrollView];
}

- (id)parallaxView
{
  return [(QLItemViewController *)self->_currentPreviewViewController parallaxView];
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return [(QLItemViewController *)self->_currentPreviewViewController canPerformFirstTimeAppearanceActions:a3];
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
}

- (void)notifyStateRestorationWithUserInfo:(id)a3
{
}

- (id)stateRestorationDictionary
{
  return [(QLItemViewController *)self->_currentPreviewViewController stateRestorationDictionary];
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController automaticallyUpdateScrollViewContentOffset];
  }
  return (char)currentPreviewViewController;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController automaticallyUpdateScrollViewContentInset];
  }
  return (char)currentPreviewViewController;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController) {
    LOBYTE(currentPreviewViewController) = [(QLItemViewController *)currentPreviewViewController automaticallyUpdateScrollViewIndicatorInset];
  }
  return (char)currentPreviewViewController;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  int64_t result = (int64_t)self->_currentPreviewViewController;
  if (result) {
    return [(id)result preferredWhitePointAdaptivityStyle];
  }
  return result;
}

- (id)printer
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(QLItemViewController *)self->_currentPreviewViewController printer];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (CGSize)preferredContentSize
{
  [(QLItemViewController *)self->_currentPreviewViewController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)title
{
  return (id)[(QLItemViewController *)self->_currentPreviewViewController title];
}

- (id)fullscreenBackgroundColor
{
  return [(QLItemViewController *)self->_currentPreviewViewController fullscreenBackgroundColor];
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
}

- (double)edgePanGestureWidth
{
  return 0.0;
}

- (CGRect)contentFrame
{
  [(QLItemViewController *)self->_currentPreviewViewController contentFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)supportsChromeless
{
  return [(QLItemViewController *)self->_currentPreviewViewController supportsChromeless];
}

- (BOOL)navigationBarShouldBeChromeless
{
  return [(QLItemViewController *)self->_currentPreviewViewController navigationBarShouldBeChromeless];
}

- (BOOL)toolbarShouldBeChromeless
{
  return [(QLItemViewController *)self->_currentPreviewViewController toolbarShouldBeChromeless];
}

- (id)transitioningView
{
  if (self->_currentPreviewViewController) {
    [(QLItemViewController *)self->_currentPreviewViewController transitioningView];
  }
  else {
  double v2 = [(QLItemAggregatedViewController *)self view];
  }

  return v2;
}

- (void)transitionDidStart:(BOOL)a3
{
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (id)draggableView
{
  return 0;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (QLItemViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_appearance, 0);
}

@end