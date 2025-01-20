@interface MRUViewServiceContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldUsePopoverAnchor;
- (MPMediaControlsConfiguration)configuration;
- (MRUViewServiceContainerViewController)init;
- (MRUViewServiceRoutingViewController)routingViewController;
- (MTMaterialView)materialView;
- (UIView)sourceView;
- (id)customRowTappedBlock;
- (id)dismissalBlock;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCustomRowTappedBlock:(id)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setRoutingViewController:(id)a3;
- (void)setSourceView:(id)a3;
- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)updateMaterialForPresenting:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewServiceRoutingViewControllerDidChangeSize:(id)a3;
- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3;
- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3 withCustomRowTapped:(id)a4;
@end

@implementation MRUViewServiceContainerViewController

- (MRUViewServiceContainerViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUViewServiceContainerViewController;
  v2 = [(MRUViewServiceContainerViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MRUViewServiceRoutingViewController);
    routingViewController = v2->_routingViewController;
    v2->_routingViewController = v3;

    [(MRUViewServiceRoutingViewController *)v2->_routingViewController setDelegate:v2];
    [(MRUViewServiceRoutingViewController *)v2->_routingViewController setTransitioningDelegate:v2];
    [(MRUViewServiceRoutingViewController *)v2->_routingViewController setModalPresentationStyle:4];
  }
  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MRUViewServiceContainerViewController;
  [(MRUViewServiceContainerViewController *)&v13 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(MPMediaControlsConfiguration *)self->_configuration sourceRect];
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  sourceView = self->_sourceView;
  self->_sourceView = v4;

  objc_super v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)self->_sourceView setBackgroundColor:v6];

  v7 = [(MRUViewServiceContainerViewController *)self view];
  [v7 addSubview:self->_sourceView];

  v8 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 options:0 initialWeighting:0.0];
  materialView = self->_materialView;
  self->_materialView = v8;

  [(MTMaterialView *)self->_materialView setUserInteractionEnabled:0];
  v10 = [(MTMaterialView *)self->_materialView visualStylingProviderForCategory:1];
  v11 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v10];
  [(MRUViewServiceRoutingViewController *)self->_routingViewController setStylingProvider:v11];

  v12 = [(MRUViewServiceContainerViewController *)self view];
  [v12 addSubview:self->_materialView];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceContainerViewController;
  [(MRUViewServiceContainerViewController *)&v4 viewDidLayoutSubviews];
  [(MPMediaControlsConfiguration *)self->_configuration sourceRect];
  -[UIView setFrame:](self->_sourceView, "setFrame:");
  id v3 = [(MRUViewServiceContainerViewController *)self view];
  [v3 bounds];
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  if (![(MRUViewServiceContainerViewController *)self shouldUsePopoverAnchor]) {
    return 1;
  }
  id v3 = (void *)MEMORY[0x1E4F28B50];
  objc_super v4 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];
  LOBYTE(v3) = objc_msgSend(v3, "mru_isSpringBoardBundleIdentifier:", v4);

  return (char)v3;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  [(MRUViewServiceRoutingViewController *)self->_routingViewController setConfiguration:v5];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[MRUPopoverPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  if ([(MRUViewServiceContainerViewController *)self shouldUsePopoverAnchor]) {
    [(MRUPopoverPresentationController *)v9 setSourceView:self->_sourceView];
  }
  CCUIExpandedModuleContinuousCornerRadius();
  -[MRUPopoverPresentationController _setCornerRadius:](v9, "_setCornerRadius:");
  v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v12 = 15;
  }
  else {
    uint64_t v12 = 3;
  }
  [(MRUPopoverPresentationController *)v9 setPermittedArrowDirections:v12];
  [(MRUPopoverPresentationController *)v9 setDelegate:self];

  return v9;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  routingViewController = self->_routingViewController;
  id v5 = a3;
  id v9 = [(MRUViewServiceRoutingViewController *)routingViewController view];
  objc_super v6 = [(MRUViewServiceContainerViewController *)self view];
  [v6 bounds];
  objc_msgSend(v9, "sizeThatFits:", v7, v8);
  objc_msgSend(v5, "setPopoverContentSize:");
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_super v4 = [(MRUViewServiceContainerViewController *)self dismissalBlock];

  if (v4)
  {
    id v5 = [(MRUViewServiceContainerViewController *)self dismissalBlock];
    v5[2]();
  }
}

- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    [(MRUViewServiceContainerViewController *)self presentViewController:self->_routingViewController animated:a4 completion:0];
  }
  else
  {
    double v7 = [(MRUViewServiceContainerViewController *)self dismissalBlock];
    [(MRUViewServiceContainerViewController *)self dismissViewControllerAnimated:v4 completion:v7];
  }

  [(MRUViewServiceContainerViewController *)self updateMaterialForPresenting:v5];
}

- (void)viewServiceRoutingViewControllerDidChangeSize:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MRUViewServiceContainerViewController *)self routingViewController];
  objc_super v6 = [v5 transitionCoordinator];

  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidChangeSize___block_invoke_2;
    v11[3] = &unk_1E5F0F320;
    id v12 = v4;
    objc_super v13 = self;
    [v6 animateAlongsideTransition:&__block_literal_global_43 completion:v11];
  }
  else
  {
    double v7 = [v4 view];
    double v8 = [(MRUViewServiceContainerViewController *)self view];
    [v8 bounds];
    objc_msgSend(v7, "sizeThatFits:", v9, v10);
    objc_msgSend(v4, "setPreferredContentSize:");
  }
}

void __87__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidChangeSize___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) view];
  v2 = [*(id *)(a1 + 40) view];
  [v2 bounds];
  objc_msgSend(v5, "sizeThatFits:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
}

- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3
{
  id v4 = [(MRUViewServiceContainerViewController *)self dismissalBlock];
  [(MRUViewServiceContainerViewController *)self dismissViewControllerAnimated:1 completion:v4];
}

- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3 withCustomRowTapped:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidDismiss_withCustomRowTapped___block_invoke;
  v9[3] = &unk_1E5F0D870;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(MRUViewServiceContainerViewController *)self dismissViewControllerAnimated:1 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __104__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidDismiss_withCustomRowTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained customRowTappedBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (BOOL)shouldUsePopoverAnchor
{
  double v3 = [(MRUViewServiceContainerViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UIView *)self->_sourceView frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  CGFloat MinX = CGRectGetMinX(v39);
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  CGFloat rect1_16 = CGRectGetMinY(v40);
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  CGFloat rect1_8 = CGRectGetWidth(v41);
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  CGFloat rect1 = CGRectGetMinX(v42);
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  double MaxY = CGRectGetMaxY(v43);
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  CGFloat Width = CGRectGetWidth(v44);
  v20 = [(MRUViewServiceContainerViewController *)self view];
  v21 = [v20 window];
  v22 = [v21 windowScene];
  v23 = [v22 screen];

  v24 = [v23 displayIdentity];
  char v25 = [v24 isExternal];

  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  if (CGRectIsEmpty(v45))
  {
    BOOL v26 = 1;
  }
  else
  {
    v46.origin.x = v5;
    v46.origin.y = v7;
    v46.size.width = v9;
    v46.size.height = v11;
    v49.origin.x = v13;
    v49.origin.y = v15;
    v49.size.width = v17;
    v49.size.height = v19;
    BOOL v26 = !CGRectContainsRect(v46, v49);
  }
  v27 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  v47.origin.x = MinX;
  v47.size.width = rect1_8;
  v47.origin.y = rect1_16;
  v47.size.height = 200.0;
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  if (!CGRectContainsRect(v47, v50))
  {
    v48.size.width = Width;
    v48.origin.y = MaxY - 200.0;
    v48.origin.x = rect1;
    v48.size.height = 200.0;
    v51.origin.x = v13;
    v51.origin.y = v15;
    v51.size.width = v17;
    v51.size.height = v19;
    BOOL v29 = CGRectContainsRect(v48, v51);
    if (!v26) {
      goto LABEL_6;
    }
LABEL_11:
    char v31 = 0;
    goto LABEL_12;
  }
  BOOL v29 = 1;
  if (v26) {
    goto LABEL_11;
  }
LABEL_6:
  char v30 = (v28 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v29;
  char v31 = v30 & ~v25;
LABEL_12:

  return v31;
}

- (void)updateMaterialForPresenting:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MRUViewServiceContainerViewController *)self shouldUsePopoverAnchor])
  {
    CGFloat v5 = [(MRUViewServiceContainerViewController *)self routingViewController];
    double v6 = [v5 transitionCoordinator];

    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __69__MRUViewServiceContainerViewController_updateMaterialForPresenting___block_invoke;
      v8[3] = &unk_1E5F0E298;
      v8[4] = self;
      BOOL v9 = v3;
      [v6 animateAlongsideTransition:v8 completion:0];
    }
    else
    {
      double v7 = 0.0;
      if (v3) {
        double v7 = 1.0;
      }
      [(MTMaterialView *)self->_materialView setWeighting:v7];
    }
  }
}

uint64_t __69__MRUViewServiceContainerViewController_updateMaterialForPresenting___block_invoke(uint64_t a1)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1016) setWeighting:v2];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 setNeedsStatusBarAppearanceUpdate];
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (id)customRowTappedBlock
{
  return self->_customRowTappedBlock;
}

- (void)setCustomRowTappedBlock:(id)a3
{
}

- (MRUViewServiceRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong(&self->_customRowTappedBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end