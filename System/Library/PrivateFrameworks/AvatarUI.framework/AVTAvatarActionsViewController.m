@interface AVTAvatarActionsViewController
- (AVTAvatarActionsViewController)initWithAVTViewSessionProvider:(id)a3 actionsController:(id)a4 environment:(id)a5;
- (AVTAvatarActionsViewControllerDelegate)delegate;
- (AVTAvatarActionsViewControllerLayout)currentLayout;
- (AVTAvatarEditorViewController)editorViewController;
- (AVTAvatarInlineActionsController)actionsController;
- (AVTImageTransitioningContainerView)avatarContainer;
- (AVTToolBar)toolbar;
- (AVTUIEnvironment)environment;
- (AVTViewSession)avtViewSession;
- (AVTViewSessionProvider)sessionProvider;
- (BOOL)allowFacetracking;
- (BOOL)isAnimating;
- (BOOL)shouldHideUserInfoView;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (UIImageView)transitionImageView;
- (UIStackView)buttonsView;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)deleteMoveInDelay;
- (double)deleteMoveInDuration;
- (double)duplicateScaleDelay;
- (double)duplicateScaleDuration;
- (id)actionsModel:(id)a3 recordUpdateForDeletingRecord:(id)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)postSessionDidBecomeActiveHandler;
- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3;
- (void)actionsController:(id)a3 didAddRecord:(id)a4;
- (void)actionsController:(id)a3 didCancelEditingRecord:(id)a4;
- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6;
- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5;
- (void)actionsController:(id)a3 didEditRecord:(id)a4;
- (void)actionsController:(id)a3 presentAlertController:(id)a4;
- (void)actionsControllerDidFinish:(id)a3;
- (void)applyLayout:(id)a3;
- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3;
- (void)beginUsingAVTViewFromSession:(id)a3;
- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5;
- (void)configureNavigationItems;
- (void)configureUserInfoLabel;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)controllerPresentationWillObstructView:(id)a3;
- (void)createTransitionImageViewIfNeeded;
- (void)didTapAvatarView:(id)a3;
- (void)didTapDone:(id)a3;
- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)layoutViewForActionsController;
- (void)loadView;
- (void)performEdit;
- (void)performTransitionAfterDeleteToRecord:(id)a3 fromLeft:(BOOL)a4 previousRecordImage:(id)a5 completionBlock:(id)a6;
- (void)performTransitionAfterDuplicateToRecord:(id)a3 previousRecordImage:(id)a4 completionBlock:(id)a5;
- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4;
- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5;
- (void)rebuildLayout;
- (void)setActionsController:(id)a3;
- (void)setAllowFacetracking:(BOOL)a3;
- (void)setAvatarContainer:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setButtonsView:(id)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorViewController:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setPostSessionDidBecomeActiveHandler:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setTransitionImageView:(id)a3;
- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willPresentAvatarRecord:(id)a3;
@end

@implementation AVTAvatarActionsViewController

- (AVTAvatarActionsViewController)initWithAVTViewSessionProvider:(id)a3 actionsController:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarActionsViewController;
  v12 = [(AVTAvatarActionsViewController *)&v15 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionProvider, a3);
    objc_storeStrong((id *)&v13->_actionsController, a4);
    objc_storeStrong((id *)&v13->_environment, a5);
    [v10 setDelegate:v13];
    v13->_allowFacetracking = AVTUIIsFacetrackingSupported();
  }

  return v13;
}

- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v20 avtView];
  [v10 updateInterfaceOrientation];

  uint64_t v11 = AVTUIShowTrackingLostReticle_once();
  v12 = [v20 avtView];
  [v12 setEnableReticle:v11];

  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || AVTDeviceIsGreenTea()) {
    int v13 = AVTUIHasDisplayedCameraDisclosureSplashScreen();
  }
  else {
    int v13 = 1;
  }
  uint64_t v14 = [(AVTAvatarActionsViewController *)self allowFacetracking] & v13;
  objc_super v15 = [v20 avtView];
  [v15 setEnableFaceTracking:v14];

  v16 = [(AVTAvatarActionsViewController *)self view];
  v17 = [v16 backgroundColor];
  v18 = [v20 avtView];
  [v18 setBackgroundColor:v17];

  v19 = [v20 avtViewUpdater];
  [v19 setAvatarRecord:v9 completionHandler:v8];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  v5 = objc_msgSend(v3, "initWithFrame:");
  [(AVTAvatarActionsViewController *)self setView:v5];

  v6 = +[AVTUIColorRepository modalBackgroundColor];
  v7 = [(AVTAvatarActionsViewController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [AVTImageTransitioningContainerView alloc];
  id v9 = [(AVTAvatarActionsViewController *)self view];
  [v9 bounds];
  id v10 = -[AVTImageTransitioningContainerView initWithFrame:layoutMode:](v8, "initWithFrame:layoutMode:", 1);
  [(AVTAvatarActionsViewController *)self setAvatarContainer:v10];

  uint64_t v11 = [(AVTAvatarActionsViewController *)self sessionProvider];
  [v11 avtViewBackingSize];
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVTAvatarActionsViewController *)self avatarContainer];
  objc_msgSend(v16, "setAspectRatio:", v13, v15);

  id v18 = [(AVTAvatarActionsViewController *)self view];
  v17 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v18 addSubview:v17];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarActionsViewController;
  [(AVTAvatarActionsViewController *)&v3 viewDidLoad];
  [(AVTAvatarActionsViewController *)self layoutViewForActionsController];
}

- (void)layoutViewForActionsController
{
  objc_super v3 = [(AVTAvatarActionsViewController *)self actionsController];
  id v12 = [v3 inlineActionButtons];

  v4 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v12];
  [v4 setAxis:1];
  [v4 setDistribution:1];
  [v4 setSpacing:10.0];
  v5 = [(AVTAvatarActionsViewController *)self view];
  [v5 addSubview:v4];

  v6 = [(AVTAvatarActionsViewController *)self buttonsView];

  if (v6)
  {
    v7 = [(AVTAvatarActionsViewController *)self buttonsView];
    [v7 removeFromSuperview];
  }
  [(AVTAvatarActionsViewController *)self setButtonsView:v4];
  [(AVTAvatarActionsViewController *)self configureNavigationItems];
  id v8 = [(AVTAvatarActionsViewController *)self currentLayout];
  uint64_t v9 = [v8 buttonCount];
  uint64_t v10 = [v12 count];

  if (v9 == v10)
  {
    uint64_t v11 = [(AVTAvatarActionsViewController *)self currentLayout];
    [(AVTAvatarActionsViewController *)self applyLayout:v11];
  }
  else
  {
    [(AVTAvatarActionsViewController *)self rebuildLayout];
  }
}

- (void)configureNavigationItems
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(AVTAvatarActionsViewController *)self environment];
  int v4 = [v3 deviceIsMac];

  if (v4)
  {
    v5 = [AVTToolbarButton alloc];
    v6 = AVTAvatarUIBundle();
    v7 = [v6 localizedStringForKey:@"DONE" value:&stru_26BF058D0 table:@"Localized"];
    id v8 = [(AVTToolbarButton *)v5 initWithTitle:v7 isDefault:1];

    uint64_t v9 = [AVTToolBar alloc];
    v24[0] = v8;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v11 = [(AVTToolBar *)v9 initWithButtons:v10];

    id v12 = [(AVTAvatarActionsViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    +[AVTToolBar defaultToolBarHeight];
    -[AVTToolBar setFrame:](v11, "setFrame:", v14, v18 - v19, v16, v19);
    [(AVTToolBar *)v11 setAutoresizingMask:10];
    [(AVTToolBar *)v11 setDelegate:self];
    id v20 = [(AVTAvatarActionsViewController *)self view];
    [v20 addSubview:v11];

    [(AVTAvatarActionsViewController *)self setToolbar:v11];
    v21 = [(AVTAvatarActionsViewController *)self navigationController];
    [v21 setNavigationBarHidden:1];
  }
  else
  {
    id v23 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone_];
    v22 = [(AVTAvatarActionsViewController *)self navigationItem];
    [v22 setRightBarButtonItem:v23];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarActionsViewController;
  [(AVTAvatarActionsViewController *)&v5 viewWillAppear:a3];
  int v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  [(AVTAvatarActionsViewController *)self beginAVTViewSessionWithDidBeginBlock:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarActionsViewController;
  [(AVTAvatarActionsViewController *)&v6 viewWillDisappear:a3];
  int v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  objc_super v5 = [(AVTAvatarActionsViewController *)self avtViewSession];
  [v5 tearDownWithCompletionHandler:0];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  int v4 = [(AVTAvatarActionsViewController *)self actionsController];
  [v4 updateForChangedContentCategorySize];

  [(AVTAvatarActionsViewController *)self layoutViewForActionsController];
}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  objc_super v5 = [(AVTAvatarActionsViewController *)self avtViewSession];
  int v6 = [v5 isActive];

  if (v6)
  {
    if (v4)
    {
      v7 = [(AVTAvatarActionsViewController *)self avtViewSession];
      v4[2](v4, v7);
    }
  }
  else
  {
    id v8 = [(AVTAvatarActionsViewController *)self postSessionDidBecomeActiveHandler];

    if (v8)
    {
      uint64_t v9 = [(AVTAvatarActionsViewController *)self postSessionDidBecomeActiveHandler];
      v9[2](v9, 0);
    }
    [(AVTAvatarActionsViewController *)self setPostSessionDidBecomeActiveHandler:v4];
    objc_initWeak(&location, self);
    uint64_t v10 = [(AVTAvatarActionsViewController *)self sessionProvider];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
    v14[3] = &unk_263FF0428;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
    v12[3] = &unk_263FF0450;
    objc_copyWeak(&v13, &location);
    uint64_t v11 = [v10 sessionWithDidBecomeActiveHandler:v14 tearDownHandler:v12];
    [(AVTAvatarActionsViewController *)self setAvtViewSession:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginUsingAVTViewFromSession:v6];
  int v4 = [WeakRetained postSessionDidBecomeActiveHandler];

  if (v4)
  {
    objc_super v5 = [WeakRetained postSessionDidBecomeActiveHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [WeakRetained setPostSessionDidBecomeActiveHandler:0];
}

void __71__AVTAvatarActionsViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int v4 = (id *)(a1 + 32);
  objc_super v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [v6 avtViewContainer];

  id v8 = [WeakRetained tapGestureRecognizer];
  [v7 removeGestureRecognizer:v8];

  [WeakRetained setTapGestureRecognizer:0];
  if (([WeakRetained shouldHideUserInfoView] & 1) == 0)
  {
    uint64_t v9 = [WeakRetained sessionProvider];
    uint64_t v10 = [v9 faceTrackingManager];
    uint64_t v11 = [v10 userInfoView];
    [v11 removeFromSuperview];
  }
  id v12 = [WeakRetained sessionProvider];
  id v13 = [v12 faceTrackingManager];
  [v13 setDelegate:0];

  double v14 = (void *)MEMORY[0x263F296E0];
  id v15 = [WeakRetained avtViewSession];
  double v16 = [v15 avtView];
  double v17 = [WeakRetained avatarContainer];
  double v18 = [WeakRetained environment];
  double v19 = [v18 logger];
  id v20 = [v14 snapshotAVTView:v16 matchingViewSize:v17 highQuality:1 logger:v19];

  v21 = [WeakRetained avatarContainer];
  [v21 setStaticImage:v20];

  v22 = [WeakRetained avatarContainer];
  [v22 setLiveView:0];

  id v23 = [WeakRetained avatarContainer];
  [v23 transitionStaticViewToFront];

  [WeakRetained setAvtViewSession:0];
  v5[2](v5);
}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AVTAvatarActionsViewController *)self avatarContainer];
  id v6 = [v4 avtViewContainer];
  [v5 setLiveView:v6];

  v7 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v7 transitionLiveViewToFront];

  id v8 = [(AVTAvatarActionsViewController *)self actionsController];
  uint64_t v9 = [v8 actionsModel];
  uint64_t v10 = [v9 avatarRecord];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__AVTAvatarActionsViewController_beginUsingAVTViewFromSession___block_invoke;
  v12[3] = &unk_263FF0478;
  void v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(AVTAvatarActionsViewController *)self configureAVTViewSession:v11 withAvatarRecord:v10 completionBlock:v12];
}

void __63__AVTAvatarActionsViewController_beginUsingAVTViewFromSession___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:*(void *)(a1 + 32) action:sel_didTapAvatarView_];
  [*(id *)(a1 + 32) setTapGestureRecognizer:v2];

  objc_super v3 = [*(id *)(a1 + 40) avtViewContainer];
  id v4 = [*(id *)(a1 + 32) tapGestureRecognizer];
  [v3 addGestureRecognizer:v4];

  if ([*(id *)(a1 + 32) allowFacetracking])
  {
    objc_super v5 = [*(id *)(a1 + 32) sessionProvider];
    id v6 = [v5 faceTrackingManager];
    [v6 setFaceTrackingManagementPaused:0];

    v7 = *(void **)(a1 + 32);
    id v8 = [v7 sessionProvider];
    uint64_t v9 = [v8 faceTrackingManager];
    [v9 setDelegate:v7];

    uint64_t v10 = [*(id *)(a1 + 32) sessionProvider];
    id v11 = [v10 faceTrackingManager];
    [v11 resumeFaceTrackingIfNeededAnimated:0];

    id v12 = [*(id *)(a1 + 40) avtView];
    [v12 transitionToFaceTrackingWithDuration:0 completionHandler:0.0];

    if (([*(id *)(a1 + 32) shouldHideUserInfoView] & 1) == 0)
    {
      [*(id *)(a1 + 32) configureUserInfoLabel];
      id v13 = [*(id *)(a1 + 32) view];
      double v14 = [*(id *)(a1 + 32) sessionProvider];
      id v15 = [v14 faceTrackingManager];
      double v16 = [v15 userInfoView];
      [v13 bringSubviewToFront:v16];
    }
  }
  id v17 = [*(id *)(a1 + 32) view];
  [v17 setNeedsLayout];
}

- (void)configureUserInfoLabel
{
  objc_super v3 = [(AVTAvatarActionsViewController *)self sessionProvider];
  id v4 = [v3 faceTrackingManager];
  id v10 = [v4 userInfoView];

  objc_super v5 = [(AVTAvatarActionsViewController *)self currentLayout];

  if (v5)
  {
    id v6 = [(AVTAvatarActionsViewController *)self currentLayout];
    [v6 userInfoFrame];
    objc_msgSend(v10, "setFrame:");
  }
  v7 = [(AVTAvatarActionsViewController *)self view];
  id v8 = [v7 backgroundColor];
  [v10 setContainerBackgroundColor:v8];

  uint64_t v9 = [(AVTAvatarActionsViewController *)self view];
  [v9 addSubview:v10];
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  objc_super v3 = [(AVTAvatarActionsViewController *)self toolbar];
  if (v3)
  {
    id v4 = [(AVTAvatarActionsViewController *)self toolbar];
    [v4 bounds];
    double v6 = v5;

    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  else
  {
    double v9 = *MEMORY[0x263F1D1C0];
    double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v10 = v9;
  double v11 = v8;
  double v12 = v6;
  double v13 = v7;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)AVTAvatarActionsViewController;
  [(AVTAvatarActionsViewController *)&v30 viewDidLayoutSubviews];
  objc_super v3 = [(AVTAvatarActionsViewController *)self currentLayout];
  [v3 containerSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(AVTAvatarActionsViewController *)self view];
  [v8 bounds];
  if (v5 != v10 || v7 != v9)
  {

LABEL_6:
    [(AVTAvatarActionsViewController *)self rebuildLayout];
    return;
  }
  double v12 = [(AVTAvatarActionsViewController *)self currentLayout];
  [v12 edgeInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(AVTAvatarActionsViewController *)self view];
  [v21 safeAreaInsets];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  if (v16 != v25 || v14 != v23 || v20 != v29 || v18 != v27) {
    goto LABEL_6;
  }
}

- (void)rebuildLayout
{
  objc_super v3 = [(AVTAvatarActionsViewController *)self environment];
  if ([v3 deviceIsPad])
  {

LABEL_4:
    double v6 = AVTAvatarActionsViewControllerPadLayout;
    goto LABEL_6;
  }
  double v4 = [(AVTAvatarActionsViewController *)self environment];
  int v5 = [v4 deviceIsMac];

  if (v5) {
    goto LABEL_4;
  }
  double v6 = AVTAvatarActionsViewControllerLayout;
LABEL_6:
  id v7 = [v6 alloc];
  double v8 = [(AVTAvatarActionsViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(AVTAvatarActionsViewController *)self view];
  [v13 safeAreaInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(AVTAvatarActionsViewController *)self buttonsView];
  double v23 = [v22 arrangedSubviews];
  uint64_t v24 = [v23 count];
  double v25 = [(AVTAvatarActionsViewController *)self sessionProvider];
  id v26 = (id)objc_msgSend(v7, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v24, v25, v10, v12, v15, v17, v19, v21);

  [(AVTAvatarActionsViewController *)self applyLayout:v26];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarActionsViewController;
  id v7 = a4;
  -[AVTAvatarActionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__AVTAvatarActionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_263FF0400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __85__AVTAvatarActionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avtViewSession];
  v1 = [v2 avtView];
  [v1 updateInterfaceOrientation];
}

- (void)applyLayout:(id)a3
{
  id v40 = a3;
  uint64_t v4 = [(AVTAvatarActionsViewController *)self isAnimating];
  id v5 = v40;
  if (v40 && (v4 & 1) == 0)
  {
    double v6 = [(AVTAvatarActionsViewController *)self avtViewSession];
    int v7 = [v6 isActive];

    if (v7)
    {
      [v40 avatarContainerViewFrame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v16 = [(AVTAvatarActionsViewController *)self avatarContainer];
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

      if (![(AVTAvatarActionsViewController *)self shouldHideUserInfoView])
      {
        [v40 userInfoFrame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v25 = [(AVTAvatarActionsViewController *)self sessionProvider];
        id v26 = [v25 faceTrackingManager];
        double v27 = [v26 userInfoView];
        objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);
      }
    }
    [v40 actionButtonsViewAlpha];
    double v29 = v28;
    objc_super v30 = [(AVTAvatarActionsViewController *)self buttonsView];
    [v30 setAlpha:v29];

    [v40 actionButtonsViewFrame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v39 = [(AVTAvatarActionsViewController *)self buttonsView];
    objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

    uint64_t v4 = [(AVTAvatarActionsViewController *)self setCurrentLayout:v40];
    id v5 = v40;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)createTransitionImageViewIfNeeded
{
  objc_super v3 = [(AVTAvatarActionsViewController *)self transitionImageView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(AVTAvatarActionsViewController *)self setTransitionImageView:v4];

    id v5 = [(AVTAvatarActionsViewController *)self transitionImageView];
    [v5 setContentMode:1];

    double v6 = [(AVTAvatarActionsViewController *)self avtViewSession];
    int v7 = [v6 isActive];

    if (v7)
    {
      id v17 = [(AVTAvatarActionsViewController *)self avatarContainer];
      [v17 frame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v16 = [(AVTAvatarActionsViewController *)self transitionImageView];
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
    }
  }
}

- (void)didTapAvatarView:(id)a3
{
  id v4 = [(AVTAvatarActionsViewController *)self avtViewSession];
  int v5 = [v4 isActive];

  if (v5)
  {
    id v7 = [(AVTAvatarActionsViewController *)self sessionProvider];
    double v6 = [v7 faceTrackingManager];
    [v6 resumeFaceTrackingIfNeededAnimated:1];
  }
}

- (void)didTapDone:(id)a3
{
  id v4 = [(AVTAvatarActionsViewController *)self delegate];
  [v4 avatarActionsViewControllerDidFinish:self];
}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__AVTAvatarActionsViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke;
  v10[3] = &unk_263FF2158;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(AVTAvatarActionsViewController *)self beginAVTViewSessionWithDidBeginBlock:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __89__AVTAvatarActionsViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLayout:*(void *)(a1 + 32)];
  id v2 = [WeakRetained view];
  [v2 layoutIfNeeded];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5
{
  id v9 = a3;
  -[AVTAvatarActionsViewController setEditorViewController:](self, "setEditorViewController:");
  if (a5
    || +[AVTAvatarEditorViewController shouldShowSplashScreen])
  {
    id v7 = [[AVTTransparentNavigationController alloc] initWithRootViewController:v9];
    [(AVTAvatarActionsViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v8 = [(AVTAvatarActionsViewController *)self navigationController];
    [v8 setDelegate:self];

    id v7 = [(AVTAvatarActionsViewController *)self navigationController];
    [(AVTTransparentNavigationController *)v7 pushViewController:v9 animated:1];
  }
}

- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v19 = a3;
  id v14 = a4;
  double v15 = (void (**)(void))a8;
  if (a5
    || ([(AVTAvatarActionsViewController *)self presentedViewController],
        double v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    if (!a6)
    {
      [(AVTAvatarActionsViewController *)self dismissViewControllerAnimated:v9 completion:v15];
      goto LABEL_8;
    }
  }
  else
  {
    id v17 = [(AVTAvatarActionsViewController *)self navigationController];
    id v18 = (id)[v17 popViewControllerAnimated:1];
  }
  if (v15) {
    v15[2](v15);
  }
LABEL_8:
  [(AVTAvatarActionsViewController *)self setEditorViewController:0];
}

- (void)actionsController:(id)a3 didAddRecord:(id)a4
{
  id v8 = a4;
  int v5 = [(AVTAvatarActionsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVTAvatarActionsViewController *)self delegate];
    [v7 avatarActionsViewController:self didPerformAction:3 withAvatarRecord:v8];
  }
  [(AVTAvatarActionsViewController *)self willPresentAvatarRecord:v8];
}

- (void)actionsController:(id)a3 didEditRecord:(id)a4
{
  id v8 = a4;
  int v5 = [(AVTAvatarActionsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVTAvatarActionsViewController *)self delegate];
    [v7 avatarActionsViewController:self didPerformAction:0 withAvatarRecord:v8];
  }
  [(AVTAvatarActionsViewController *)self willPresentAvatarRecord:v8];
}

- (void)actionsController:(id)a3 didCancelEditingRecord:(id)a4
{
}

- (void)willPresentAvatarRecord:(id)a3
{
  id v7 = a3;
  id v4 = [(AVTAvatarActionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(AVTAvatarActionsViewController *)self delegate];
    [v6 avatarActionsViewController:self willPresentAvatarRecord:v7];
  }
}

- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(AVTAvatarActionsViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(AVTAvatarActionsViewController *)self delegate];
    [v11 avatarActionsViewController:self didPerformAction:3 withAvatarRecord:v7];
  }
  id v12 = (void *)MEMORY[0x263F296E0];
  id v13 = [(AVTAvatarActionsViewController *)self avtViewSession];
  id v14 = [v13 avtView];
  double v15 = [(AVTAvatarActionsViewController *)self avatarContainer];
  double v16 = [(AVTAvatarActionsViewController *)self environment];
  id v17 = [v16 logger];
  id v18 = [v12 snapshotAVTView:v14 matchingViewSize:v15 highQuality:1 logger:v17];

  [(AVTAvatarActionsViewController *)self createTransitionImageViewIfNeeded];
  [(AVTAvatarActionsViewController *)self setIsAnimating:1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__AVTAvatarActionsViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke;
  v20[3] = &unk_263FF06C0;
  v20[4] = self;
  id v21 = v8;
  id v19 = v8;
  [(AVTAvatarActionsViewController *)self performTransitionAfterDuplicateToRecord:v7 previousRecordImage:v18 completionBlock:v20];
}

uint64_t __89__AVTAvatarActionsViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimating:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)actionsModel:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5 = a4;
  char v6 = [(AVTAvatarActionsViewController *)self delegate];
  id v7 = [v6 avatarActionsViewController:self recordUpdateForDeletingRecord:v5];

  return v7;
}

- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = [(AVTAvatarActionsViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(AVTAvatarActionsViewController *)self delegate];
    [v14 avatarActionsViewController:self didPerformAction:2 withAvatarRecord:v9];
  }
  double v15 = [v11 avatarRecord];
  [(AVTAvatarActionsViewController *)self willPresentAvatarRecord:v15];

  double v16 = (void *)MEMORY[0x263F296E0];
  id v17 = [(AVTAvatarActionsViewController *)self avtViewSession];
  id v18 = [v17 avtView];
  id v19 = [(AVTAvatarActionsViewController *)self avtViewSession];
  double v20 = [v19 avtView];
  id v21 = [(AVTAvatarActionsViewController *)self environment];
  [v21 logger];
  double v22 = v27 = v9;
  double v23 = [v16 snapshotAVTView:v18 matchingViewSize:v20 highQuality:1 logger:v22];

  [(AVTAvatarActionsViewController *)self createTransitionImageViewIfNeeded];
  [(AVTAvatarActionsViewController *)self setIsAnimating:1];
  double v24 = [v11 avatarRecord];
  uint64_t v25 = [v11 fromLeft];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __101__AVTAvatarActionsViewController_actionsController_didDeleteRecord_withRecordUpdate_completionBlock___block_invoke;
  v28[3] = &unk_263FF06C0;
  v28[4] = self;
  id v29 = v10;
  id v26 = v10;
  [(AVTAvatarActionsViewController *)self performTransitionAfterDeleteToRecord:v24 fromLeft:v25 previousRecordImage:v23 completionBlock:v28];
}

uint64_t __101__AVTAvatarActionsViewController_actionsController_didDeleteRecord_withRecordUpdate_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimating:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)actionsControllerDidFinish:(id)a3
{
  id v4 = [(AVTAvatarActionsViewController *)self delegate];
  [v4 avatarActionsViewControllerDidFinish:self];
}

- (void)actionsController:(id)a3 presentAlertController:(id)a4
{
}

- (double)duplicateScaleDuration
{
  id v2 = +[AVTUIEnvironment defaultEnvironment];
  [v2 actionAnimationsMultiplier];
  double v4 = v3 * 0.84 * 0.6;

  return v4;
}

- (double)duplicateScaleDelay
{
  id v2 = +[AVTUIEnvironment defaultEnvironment];
  [v2 actionAnimationsMultiplier];
  double v4 = v3 * 0.84 * 0.4;

  return v4;
}

- (void)performTransitionAfterDuplicateToRecord:(id)a3 previousRecordImage:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v11 frame];
  CGRect v52 = CGRectInset(v51, 20.0, 20.0);
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat width = v52.size.width;
  CGFloat height = v52.size.height;

  double v15 = [(AVTAvatarActionsViewController *)self environment];
  uint64_t v16 = [v15 userInterfaceLayoutDirection];

  id v17 = [(AVTAvatarActionsViewController *)self view];
  [v17 bounds];
  if (v16) {
    double v19 = -v18;
  }
  else {
    double v19 = v18;
  }

  memset(&v50, 0, sizeof(v50));
  CGAffineTransformMakeScale(&v50, 0.0, 0.0);
  double v20 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v20 setImage:v9];

  id v21 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  objc_super v30 = [(AVTAvatarActionsViewController *)self transitionImageView];
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  double v31 = [(AVTAvatarActionsViewController *)self view];
  double v32 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v31 addSubview:v32];

  CGAffineTransform v49 = v50;
  double v33 = [(AVTAvatarActionsViewController *)self avatarContainer];
  CGAffineTransform v48 = v49;
  [v33 setTransform:&v48];

  double v34 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v34 setAlpha:0.0];

  double v35 = [(AVTAvatarActionsViewController *)self avtViewSession];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke;
  v38[3] = &unk_263FF21D0;
  CGFloat v40 = x;
  CGFloat v41 = y;
  CGFloat v42 = width;
  CGFloat v43 = height;
  double v44 = v19;
  CGFloat v45 = y;
  CGFloat v46 = width;
  CGFloat v47 = height;
  v38[4] = self;
  id v39 = v8;
  id v36 = v8;
  [(AVTAvatarActionsViewController *)self configureAVTViewSession:v35 withAvatarRecord:v10 completionBlock:v38];
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = (void *)MEMORY[0x263F1CB60];
    double v4 = +[AVTUIEnvironment defaultEnvironment];
    [v4 actionAnimationsMultiplier];
    double v6 = v5 * 0.84;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    long long v7 = *(_OWORD *)(a1 + 64);
    long long v18 = *(_OWORD *)(a1 + 48);
    long long v19 = v7;
    long long v8 = *(_OWORD *)(a1 + 96);
    long long v20 = *(_OWORD *)(a1 + 80);
    v16[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_2;
    v16[3] = &unk_263FF21A8;
    uint64_t v17 = *(void *)(a1 + 32);
    long long v21 = v8;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_6;
    v14[3] = &unk_263FF1368;
    void v14[4] = v17;
    id v15 = *(id *)(a1 + 40);
    [v3 animateKeyframesWithDuration:0 delay:v16 options:v14 animations:v6 completion:0.0];

    id v9 = (void *)MEMORY[0x263F1CB60];
    [*(id *)(a1 + 32) duplicateScaleDuration];
    double v11 = v10;
    [*(id *)(a1 + 32) duplicateScaleDelay];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_7;
    v13[3] = &unk_263FF03D8;
    v13[4] = *(void *)(a1 + 32);
    [v9 animateWithDuration:0 delay:v13 usingSpringWithDamping:0 initialSpringVelocity:v11 options:v12 animations:0.6 completion:0.0];
  }
}

uint64_t __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_2(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_3;
  v7[3] = &unk_263FF2180;
  v7[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:0.1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_4;
  v4[3] = &unk_263FF2180;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 88);
  [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.2 animations:0.6];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_5;
  v3[3] = &unk_263FF03D8;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.4 animations:0.5];
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionImageView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_4(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionImageView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) avatarContainer];
  [v1 setAlpha:1.0];
}

uint64_t __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    double v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Duplicate transtion interrupted unexpectedly!" userInfo:0];
    [v3 raise];
  }
  double v4 = [*(id *)(a1 + 32) transitionImageView];
  [v4 removeFromSuperview];

  id v5 = [*(id *)(a1 + 32) transitionImageView];
  [v5 setAlpha:1.0];

  long long v6 = [*(id *)(a1 + 32) transitionImageView];
  [v6 setImage:0];

  long long v7 = [*(id *)(a1 + 32) avatarContainer];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [*(id *)(a1 + 32) transitionImageView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v18 = *(uint64_t (**)(void))(result + 16);
    return v18();
  }
  return result;
}

void __110__AVTAvatarActionsViewController_performTransitionAfterDuplicateToRecord_previousRecordImage_completionBlock___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) avatarContainer];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (double)deleteMoveInDuration
{
  long long v2 = +[AVTUIEnvironment defaultEnvironment];
  [v2 actionAnimationsMultiplier];
  double v4 = v3 * 0.84 * 0.5;

  return v4;
}

- (double)deleteMoveInDelay
{
  long long v2 = +[AVTUIEnvironment defaultEnvironment];
  [v2 actionAnimationsMultiplier];
  double v4 = v3 * 0.84 * 0.5;

  return v4;
}

- (void)performTransitionAfterDeleteToRecord:(id)a3 fromLeft:(BOOL)a4 previousRecordImage:(id)a5 completionBlock:(id)a6
{
  int v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  double v13 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v13 frame];
  uint64_t v15 = v14;
  double v58 = v17;
  double v59 = v16;
  double v19 = v18;

  long long v20 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v20 frame];
  CGRect v83 = CGRectInset(v82, -20.0, -20.0);
  CGFloat y = v83.origin.y;
  CGFloat x = v83.origin.x;
  CGFloat height = v83.size.height;
  CGFloat width = v83.size.width;

  long long v21 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23 + v27 * 0.5;
  double v31 = v25 + v29 * 0.5;
  double v32 = [(AVTAvatarActionsViewController *)self environment];
  int v33 = [v32 userInterfaceLayoutDirection] != 0;

  uint64_t v64 = v15;
  if (v33 == v8)
  {
    double v35 = [(AVTAvatarActionsViewController *)self view];
    [v35 bounds];
    double MaxX = CGRectGetMaxX(v84);
  }
  else
  {
    double MaxX = 0.0 - v19;
  }
  id v36 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v36 setImage:v12];

  double v37 = [(AVTAvatarActionsViewController *)self avatarContainer];
  [v37 frame];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  CGFloat v46 = [(AVTAvatarActionsViewController *)self transitionImageView];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  CGFloat v47 = [(AVTAvatarActionsViewController *)self view];
  CGAffineTransform v48 = [(AVTAvatarActionsViewController *)self transitionImageView];
  [v47 addSubview:v48];

  CGAffineTransform v49 = [(AVTAvatarActionsViewController *)self avatarContainer];
  objc_msgSend(v49, "setFrame:", MaxX, v59, v19, v58);

  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke;
  v68[3] = &unk_263FF2220;
  v68[4] = self;
  CGFloat v70 = x;
  CGFloat v71 = y;
  CGFloat v72 = width;
  CGFloat v73 = height;
  double v74 = v30;
  double v75 = v31;
  __asm { FMOV            V0.2D, #1.0 }
  long long v76 = _Q0;
  id v55 = v11;
  id v69 = v55;
  BOOL v81 = v10 != 0;
  uint64_t v77 = v64;
  double v78 = v59;
  double v79 = v19;
  double v80 = v58;
  uint64_t v56 = MEMORY[0x210530210](v68);
  v57 = (void *)v56;
  if (v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_8;
    block[3] = &unk_263FF2248;
    block[4] = self;
    id v66 = v10;
    id v67 = v57;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v56 + 16))(v56, 1);
  }
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = (void *)MEMORY[0x263F1CB60];
    double v4 = +[AVTUIEnvironment defaultEnvironment];
    [v4 actionAnimationsMultiplier];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    long long v5 = *(_OWORD *)(a1 + 64);
    long long v27 = *(_OWORD *)(a1 + 48);
    long long v28 = v5;
    long long v6 = *(_OWORD *)(a1 + 96);
    long long v29 = *(_OWORD *)(a1 + 80);
    double v8 = v7 * 0.84;
    v25[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_2;
    v25[3] = &unk_263FF21A8;
    uint64_t v26 = *(void *)(a1 + 32);
    long long v30 = v6;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_5;
    v22[3] = &unk_263FF21F8;
    v22[4] = v26;
    id v23 = *(id *)(a1 + 40);
    char v24 = *(unsigned char *)(a1 + 144);
    [v3 animateKeyframesWithDuration:0 delay:v25 options:v22 animations:v8 completion:0.0];

    if (*(unsigned char *)(a1 + 144))
    {
      double v9 = (void *)MEMORY[0x263F1CB60];
      [*(id *)(a1 + 32) deleteMoveInDuration];
      double v11 = v10;
      [*(id *)(a1 + 32) deleteMoveInDelay];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      long long v12 = *(_OWORD *)(a1 + 128);
      long long v20 = *(_OWORD *)(a1 + 112);
      long long v21 = v12;
      v19[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_6;
      v19[3] = &unk_263FF2180;
      v19[4] = *(void *)(a1 + 32);
      [v9 animateWithDuration:0 delay:v19 usingSpringWithDamping:0 initialSpringVelocity:v11 options:v13 animations:0.8 completion:0.0];
    }
    else
    {
      uint64_t v14 = +[AVTUIEnvironment defaultEnvironment];
      [v14 actionAnimationsMultiplier];
      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 0.84 * 0.2 * 1000000000.0));
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_7;
      v17[3] = &unk_263FF0A00;
      id v18 = *(id *)(a1 + 40);
      dispatch_after(v16, MEMORY[0x263EF83A0], v17);
    }
  }
}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_2(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_3;
  v7[3] = &unk_263FF2180;
  v7[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = v2;
  [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:0.1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_4;
  v4[3] = &unk_263FF2180;
  v4[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 88);
  return [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.2 animations:0.3];
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) transitionImageView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  long long v6 = [*(id *)(a1 + 32) transitionImageView];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 32) transitionImageView];
  [v7 setAlpha:0.0];
}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_5(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    double v3 = [*(id *)(result + 32) transitionImageView];
    [v3 removeFromSuperview];

    double v4 = [*(id *)(v2 + 32) transitionImageView];
    [v4 setAlpha:1.0];

    double v5 = [*(id *)(v2 + 32) transitionImageView];
    [v5 setImage:0];

    long long v6 = [*(id *)(v2 + 32) avatarContainer];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [*(id *)(v2 + 32) transitionImageView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    uint64_t result = *(void *)(v2 + 40);
    if (result)
    {
      if (*(unsigned char *)(v2 + 48))
      {
        dispatch_time_t v16 = *(uint64_t (**)(void))(result + 16);
        return v16();
      }
    }
  }
  return result;
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_6(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) avatarContainer];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_8(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [v2 avtViewSession];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_9;
  v5[3] = &unk_263FF0620;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 configureAVTViewSession:v3 withAvatarRecord:v4 completionBlock:v5];
}

uint64_t __116__AVTAvatarActionsViewController_performTransitionAfterDeleteToRecord_fromLeft_previousRecordImage_completionBlock___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  double v8 = [(AVTAvatarActionsViewController *)self currentLayout];
  if (v8)
  {
    double v9 = [(AVTAvatarActionsViewController *)self currentLayout];
    [v9 userInfoFrame];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  if (a4 == 1) {
    double v12 = AVTActionsToAttributeEditorTransitionAnimator;
  }
  else {
    double v12 = AVTAttributeEditorToActionsTransitionAnimator;
  }
  id v13 = [v12 alloc];
  double v14 = [(AVTAvatarActionsViewController *)self sessionProvider];
  double v15 = [(AVTAvatarActionsViewController *)self traitCollection];
  BOOL v16 = [v15 layoutDirection] == 1;
  double v17 = [(AVTAvatarActionsViewController *)self environment];
  id v18 = (void *)[v13 initWithAVTViewLayoutInfo:v14 userInfoViewHeight:v16 RTL:v17 environment:v11];

  return v18;
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  double v3 = [(AVTAvatarActionsViewController *)self view];
  uint64_t v4 = [v3 window];
  int64_t v5 = [v4 _windowInterfaceOrientation];

  return v5;
}

- (void)controllerPresentationWillObstructView:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(AVTAvatarActionsViewController *)self editorViewController];

  if (v4)
  {
    int64_t v5 = [(AVTAvatarActionsViewController *)self editorViewController];
    [v5 controllerPresentationWillObstructView:v10];
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v6 = [(AVTAvatarActionsViewController *)self presentedViewController];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(AVTAvatarActionsViewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int64_t v5 = [(AVTAvatarActionsViewController *)self presentedViewController];
      [v5 dismissViewControllerAnimated:0 completion:0];
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (AVTAvatarActionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarActionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarActionsViewControllerLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (UIStackView)buttonsView
{
  return self->_buttonsView;
}

- (void)setButtonsView:(id)a3
{
}

- (AVTImageTransitioningContainerView)avatarContainer
{
  return self->_avatarContainer;
}

- (void)setAvatarContainer:(id)a3
{
}

- (AVTToolBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (AVTAvatarInlineActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
}

- (AVTViewSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
}

- (UIImageView)transitionImageView
{
  return self->_transitionImageView;
}

- (void)setTransitionImageView:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_allowFacetracking = a3;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarEditorViewController)editorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorViewController);
  return (AVTAvatarEditorViewController *)WeakRetained;
}

- (void)setEditorViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editorViewController);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionImageView, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_avatarContainer, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performEdit
{
  id v3 = [(AVTAvatarActionsViewController *)self actionsController];
  double v2 = [v3 actionsModel];
  [v2 didTapEdit];
}

@end