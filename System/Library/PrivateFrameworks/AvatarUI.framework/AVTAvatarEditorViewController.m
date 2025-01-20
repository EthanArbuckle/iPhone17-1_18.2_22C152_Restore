@interface AVTAvatarEditorViewController
+ (BOOL)shouldShowSplashScreen;
+ (id)defaultSessionProvider;
+ (id)viewControllerForCreatingAvatarInStore:(id)a3;
+ (id)viewControllerForCreatingAvatarInStore:(id)a3 avtViewSessionProvider:(id)a4;
+ (id)viewControllerForEditingAvatar:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5;
+ (id)viewControllerForEditingAvatar:(id)a3 store:(id)a4;
- (AVTAvatarAttributeEditorViewController)attributeEditorViewController;
- (AVTAvatarEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5 enviroment:(id)a6 isCreating:(BOOL)a7;
- (AVTAvatarEditorViewControllerDelegate)delegate;
- (AVTAvatarRecord)initialAvatarRecord;
- (AVTAvatarStoreInternal)store;
- (AVTSplashScreenViewController)splashScreenViewController;
- (AVTToolBar)toolbar;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disableAvatarSnapshotting;
- (BOOL)hasChanges;
- (BOOL)isCreating;
- (BOOL)isModalInPresentation;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldHideUserInfoView;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (id)appropriatePresentationController;
- (id)keyCommands;
- (id)visibleLayout;
- (unint64_t)editorPresentationContext;
- (void)applyLayout:(id)a3;
- (void)attributeEditor:(id)a3 didUpdateVisibleLayout:(id)a4;
- (void)attributeEditorDidMakeFirstSelection:(id)a3;
- (void)cancel:(id)a3;
- (void)configureEditorNavigationItems;
- (void)configurePPTMemoji;
- (void)configureSplashNavigationItems;
- (void)confirmCancel:(id)a3;
- (void)controllerPresentationWillObstructView:(id)a3;
- (void)enableDoneButton:(BOOL)a3;
- (void)escPressed:(id)a3;
- (void)finish:(id)a3;
- (void)handleDiscardAttempt;
- (void)loadAttributeEditorViewWithAvatarRecord:(id)a3;
- (void)loadSplashScreen;
- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4;
- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4;
- (void)returnPressed:(id)a3;
- (void)setCancelButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAvatarSnapshotting:(BOOL)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditorPresentationContext:(unint64_t)a3;
- (void)setHasChanges:(BOOL)a3;
- (void)setInitialAvatarRecord:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setToolbar:(id)a3;
- (void)setupInitialViewState;
- (void)splashScreenViewControllerDidCancel:(id)a3;
- (void)splashScreenViewControllerDidConfirm:(id)a3;
- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5;
- (void)updateToolBarForLayout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AVTAvatarEditorViewController

+ (BOOL)shouldShowSplashScreen
{
  if (AVTUIAlwaysShowSplashScreen_once()) {
    LOBYTE(v2) = 1;
  }
  else {
    int v2 = AVTUIHasDisplayedSplashScreen() ^ 1;
  }
  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || AVTDeviceIsGreenTea()) {
    int v3 = AVTUIHasDisplayedCameraDisclosureSplashScreen() ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v2 | v3;
}

+ (id)defaultSessionProvider
{
  int v2 = +[AVTViewSessionProvider creatorForAVTView];
  int v3 = +[AVTUIEnvironment defaultEnvironment];
  +[AVTViewSessionProvider backingSizeForEnvironment:v3];
  v6 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v2, v3, v4, v5);

  return v6;
}

+ (id)viewControllerForEditingAvatar:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 defaultSessionProvider];
  v9 = [a1 viewControllerForEditingAvatar:v7 avtViewSessionProvider:v8 store:v6];

  return v9;
}

+ (id)viewControllerForEditingAvatar:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (([v9 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v9 format];
  }
  id v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v8 format];
  }
  id v12 = v8;
  v13 = +[AVTUIEnvironment defaultEnvironment];
  v14 = (void *)[objc_alloc((Class)a1) initWithAvatarRecord:v12 avtViewSessionProvider:v10 store:v11 enviroment:v13 isCreating:0];

  return v14;
}

+ (id)viewControllerForCreatingAvatarInStore:(id)a3
{
  id v4 = a3;
  double v5 = [a1 defaultSessionProvider];
  id v6 = [a1 viewControllerForCreatingAvatarInStore:v4 avtViewSessionProvider:v5];

  return v6;
}

+ (id)viewControllerForCreatingAvatarInStore:(id)a3 avtViewSessionProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v6 format];
  }
  id v8 = v6;
  id v9 = +[AVTUIEnvironment defaultEnvironment];
  id v10 = [MEMORY[0x263F29728] defaultAvatarRecord];
  id v11 = (void *)[objc_alloc((Class)a1) initWithAvatarRecord:v10 avtViewSessionProvider:v7 store:v8 enviroment:v9 isCreating:1];

  return v11;
}

- (AVTAvatarEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5 enviroment:(id)a6 isCreating:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarEditorViewController;
  v17 = [(AVTAvatarEditorViewController *)&v22 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initialAvatarRecord, a3);
    objc_storeStrong((id *)&v18->_store, a5);
    objc_storeStrong((id *)&v18->_environment, a6);
    uint64_t v19 = [v16 logger];
    logger = v18->_logger;
    v18->_logger = (AVTUILogger *)v19;

    objc_storeStrong((id *)&v18->_avtViewSessionProvider, a4);
    v18->_isCreating = a7;
  }

  return v18;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarEditorViewController;
  [(AVTAvatarEditorViewController *)&v7 viewDidLoad];
  int v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [(AVTAvatarEditorViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(AVTAvatarEditorViewController *)self setupInitialViewState];
  double v5 = [(AVTAvatarEditorViewController *)self navigationItem];
  [v5 setLargeTitleDisplayMode:2];

  id v6 = [(AVTAvatarEditorViewController *)self navigationItem];
  [v6 _setBackgroundHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarEditorViewController;
  [(AVTAvatarEditorViewController *)&v5 viewWillAppear:a3];
  id v4 = [(AVTAvatarEditorViewController *)self visibleLayout];
  [(AVTAvatarEditorViewController *)self updateToolBarForLayout:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarEditorViewController;
  [(AVTAvatarEditorViewController *)&v12 viewDidAppear:a3];
  id v4 = [(AVTAvatarEditorViewController *)self navigationController];
  if (v4)
  {
    objc_super v5 = [(AVTAvatarEditorViewController *)self navigationController];
    id v6 = [v5 viewControllers];
    objc_super v7 = [v6 objectAtIndexedSubscript:0];
    BOOL v8 = v7 == self;
  }
  else
  {
    BOOL v8 = 0;
  }

  id v9 = [(AVTAvatarEditorViewController *)self navigationController];

  if (v8 || !v9)
  {
    id v10 = [(AVTAvatarEditorViewController *)self appropriatePresentationController];
    id v11 = [v10 delegate];

    if (!v11) {
      [v10 setDelegate:self];
    }
  }
}

- (id)appropriatePresentationController
{
  int v2 = self;
  int v3 = [(AVTAvatarEditorViewController *)v2 parentViewController];

  if (v3)
  {
    do
    {
      id v4 = [(AVTAvatarEditorViewController *)v2 parentViewController];

      objc_super v5 = [(AVTAvatarEditorViewController *)v4 parentViewController];

      int v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  id v6 = [(AVTAvatarEditorViewController *)v4 presentationController];

  return v6;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setDisableAvatarSnapshotting:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];

  if (v5)
  {
    id v6 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
    [v6 setDisableAvatarSnapshotting:v3];
  }
}

- (BOOL)disableAvatarSnapshotting
{
  int v2 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
  char v3 = [v2 disableAvatarSnapshotting];

  return v3;
}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_super v7 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];

  if (v7)
  {
    [(AVTAvatarEditorViewController *)self updateToolBarForLayout:v9];
    BOOL v8 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
    [v8 prepareForAnimatedTransitionWithLayout:v9 completionBlock:v6];
  }
}

- (void)applyLayout:(id)a3
{
  id v6 = a3;
  id v4 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];

  if (v4)
  {
    [(AVTAvatarEditorViewController *)self updateToolBarForLayout:v6];
    objc_super v5 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
    [v5 applyLayout:v6];
  }
}

- (id)visibleLayout
{
  char v3 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];

  if (v3)
  {
    id v4 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
    objc_super v5 = [v4 visibleLayout];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)setupInitialViewState
{
  if ([(id)objc_opt_class() shouldShowSplashScreen])
  {
    [(AVTAvatarEditorViewController *)self loadSplashScreen];
  }
  else
  {
    id v3 = [(AVTAvatarEditorViewController *)self initialAvatarRecord];
    [(AVTAvatarEditorViewController *)self loadAttributeEditorViewWithAvatarRecord:v3];
  }
}

- (void)loadSplashScreen
{
  v27 = objc_alloc_init(AVTSplashScreenConfiguration);
  id v3 = AVTAvatarUIBundle();
  id v4 = [v3 localizedStringForKey:@"MEMOJI_SPLASH_TITLE" value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v27 setTitleString:v4];

  LODWORD(v3) = AVTUIIsFacetrackingSupported();
  objc_super v5 = AVTAvatarUIBundle();
  id v6 = v5;
  if (v3) {
    objc_super v7 = @"MEMOJI_SPLASH_SUBTITLE";
  }
  else {
    objc_super v7 = @"MEMOJI_SPLASH_SUBTITLE_NO_FACE_TRACKING";
  }
  BOOL v8 = [v5 localizedStringForKey:v7 value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v27 setSubTitleString:v8];

  id v9 = AVTAvatarUIBundle();
  id v10 = [v9 localizedStringForKey:@"MEMOJI_SPLASH_CREATE_YOURS" value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v27 setButtonString:v10];

  id v11 = AVTAvatarEditorSplashVideo();
  [(AVTSplashScreenConfiguration *)v27 setPrimaryPlayerItem:v11];

  objc_super v12 = [[AVTSplashScreenViewController alloc] initWithConfiguration:v27];
  splashScreenViewController = self->_splashScreenViewController;
  self->_splashScreenViewController = v12;

  [(AVTSplashScreenViewController *)self->_splashScreenViewController setDelegate:self];
  id v14 = [(AVTAvatarEditorViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(AVTSplashScreenViewController *)self->_splashScreenViewController view];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(AVTSplashScreenViewController *)self->_splashScreenViewController view];
  [v24 setAutoresizingMask:18];

  v25 = [(AVTAvatarEditorViewController *)self view];
  v26 = [(AVTSplashScreenViewController *)self->_splashScreenViewController view];
  [v25 addSubview:v26];

  [(AVTAvatarEditorViewController *)self addChildViewController:self->_splashScreenViewController];
  [(AVTSplashScreenViewController *)self->_splashScreenViewController didMoveToParentViewController:self];
  [(AVTAvatarEditorViewController *)self configureSplashNavigationItems];
}

- (void)loadAttributeEditorViewWithAvatarRecord:(id)a3
{
  id v4 = a3;
  objc_super v5 = [AVTAvatarAttributeEditorViewController alloc];
  id v6 = [(AVTAvatarEditorViewController *)self avtViewSessionProvider];
  objc_super v7 = [(AVTAvatarEditorViewController *)self environment];
  BOOL v8 = [(AVTAvatarAttributeEditorViewController *)v5 initWithAvatarRecord:v4 avtViewSessionProvider:v6 environment:v7 isCreating:[(AVTAvatarEditorViewController *)self isCreating]];

  attributeEditorViewController = self->_attributeEditorViewController;
  self->_attributeEditorViewController = v8;

  [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController setDelegate:self];
  [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController setShouldHideUserInfoView:[(AVTAvatarEditorViewController *)self shouldHideUserInfoView]];
  [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController setEditorPresentationContext:[(AVTAvatarEditorViewController *)self editorPresentationContext]];
  [(AVTAvatarEditorViewController *)self addChildViewController:self->_attributeEditorViewController];
  id v10 = [(AVTAvatarEditorViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController view];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  double v20 = [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController view];
  [v20 setAutoresizingMask:18];

  double v21 = [(AVTAvatarEditorViewController *)self view];
  double v22 = [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController view];
  [v21 addSubview:v22];

  [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController didMoveToParentViewController:self];
  [(AVTAvatarEditorViewController *)self configureEditorNavigationItems];
}

- (void)configureSplashNavigationItems
{
  id v3 = [(AVTAvatarEditorViewController *)self environment];
  char v4 = [v3 deviceIsMac];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [(AVTAvatarEditorViewController *)self setCancelButtonItem:v5];

    id v7 = [(AVTAvatarEditorViewController *)self cancelButtonItem];
    id v6 = [(AVTAvatarEditorViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:v7];
  }
}

- (void)configureEditorNavigationItems
{
  v30[2] = *MEMORY[0x263EF8340];
  id v3 = [(AVTAvatarEditorViewController *)self environment];
  int v4 = [v3 deviceIsMac];

  if (v4)
  {
    objc_super v5 = [(AVTAvatarEditorViewController *)self toolbar];
    [v5 removeFromSuperview];

    id v6 = [AVTToolbarButton alloc];
    id v7 = AVTAvatarUIBundle();
    BOOL v8 = [v7 localizedStringForKey:@"DONE" value:&stru_26BF058D0 table:@"Localized"];
    id v9 = [(AVTToolbarButton *)v6 initWithTitle:v8 isDefault:1];

    id v10 = [AVTToolbarButton alloc];
    double v11 = AVTAvatarUIBundle();
    double v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_26BF058D0 table:@"Localized"];
    double v13 = [(AVTToolbarButton *)v10 initWithTitle:v12 isDefault:0];

    double v14 = [AVTToolBar alloc];
    v30[0] = v13;
    v30[1] = v9;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    double v16 = [(AVTToolBar *)v14 initWithButtons:v15];

    double v17 = [(AVTAvatarEditorViewController *)self view];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;

    +[AVTToolBar defaultToolBarHeight];
    -[AVTToolBar setFrame:](v16, "setFrame:", 0.0, v21 - v22, v19, v22);
    [(AVTToolBar *)v16 setAutoresizingMask:10];
    [(AVTToolBar *)v16 setDelegate:self];
    v23 = [(AVTAvatarEditorViewController *)self view];
    v24 = [(AVTAvatarAttributeEditorViewController *)self->_attributeEditorViewController view];
    [v23 insertSubview:v16 aboveSubview:v24];

    [(AVTAvatarEditorViewController *)self setToolbar:v16];
    v25 = [(AVTAvatarEditorViewController *)self navigationController];
    [v25 setNavigationBarHidden:1];
  }
  else
  {
    v26 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [(AVTAvatarEditorViewController *)self setCancelButtonItem:v26];

    v27 = [(AVTAvatarEditorViewController *)self cancelButtonItem];
    v28 = [(AVTAvatarEditorViewController *)self navigationItem];
    [v28 setLeftBarButtonItem:v27];

    v29 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_finish_];
    [(AVTAvatarEditorViewController *)self setDoneButtonItem:v29];

    id v9 = [(AVTAvatarEditorViewController *)self doneButtonItem];
    double v13 = [(AVTAvatarEditorViewController *)self navigationItem];
    [(AVTToolbarButton *)v13 setRightBarButtonItem:v9];
  }

  [(AVTAvatarEditorViewController *)self enableDoneButton:[(AVTAvatarEditorViewController *)self isCreating]];
}

- (id)keyCommands
{
  int v2 = [MEMORY[0x263EFF980] array];
  id v3 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_escPressed_];
  int v4 = [v3 _nonRepeatableKeyCommand];
  [v2 addObject:v4];

  objc_super v5 = (void *)MEMORY[0x263F1C708];
  id v6 = [NSString stringWithFormat:@"\r"];
  id v7 = [v5 keyCommandWithInput:v6 modifierFlags:0 action:sel_returnPressed_];

  BOOL v8 = [v7 _nonRepeatableKeyCommand];
  [v2 addObject:v8];

  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)updateToolBarForLayout:(id)a3
{
  id v21 = a3;
  int v4 = [(AVTAvatarEditorViewController *)self toolbar];

  if (v4)
  {
    objc_super v5 = [(AVTAvatarEditorViewController *)self toolbar];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;

    [v21 attributesContentViewFrame];
    double v11 = v10;
    [v21 attributesContentViewFrame];
    double v13 = v12;
    [MEMORY[0x263F1CB60] inheritedAnimationDuration];
    BOOL v15 = v14 > 0.0;
    double v16 = [(AVTAvatarEditorViewController *)self toolbar];
    [v16 setIsAnimating:v15];

    double v17 = [(AVTAvatarEditorViewController *)self toolbar];
    objc_msgSend(v17, "setFrame:", v11, v7, v13, v9);

    double v18 = [(AVTAvatarEditorViewController *)self toolbar];
    double v19 = [v18 window];

    if (v19)
    {
      double v20 = [(AVTAvatarEditorViewController *)self toolbar];
      [v20 layoutIfNeeded];
    }
  }
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  id v3 = [(AVTAvatarEditorViewController *)self toolbar];
  if (v3)
  {
    int v4 = [(AVTAvatarEditorViewController *)self toolbar];
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

- (void)enableDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AVTAvatarEditorViewController *)self doneButtonItem];
  [v5 setEnabled:v3];

  id v6 = [(AVTAvatarEditorViewController *)self toolbar];
  [v6 setEnabled:v3 forButtonAtIndex:1];
}

- (void)escPressed:(id)a3
{
}

- (void)cancel:(id)a3
{
  id v8 = a3;
  if ([(AVTAvatarEditorViewController *)self hasChanges])
  {
    [(AVTAvatarEditorViewController *)self confirmCancel:v8];
  }
  else
  {
    int v4 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
    [v4 didFinishEditing];

    double v5 = [(AVTAvatarEditorViewController *)self splashScreenViewController];

    if (v5)
    {
      id v6 = [(AVTAvatarEditorViewController *)self splashScreenViewController];
      [v6 stopPlayingVideos];
    }
    double v7 = [(AVTAvatarEditorViewController *)self delegate];
    [v7 avatarEditorViewControllerDidCancel:self];
  }
}

- (void)returnPressed:(id)a3
{
  if ([(AVTAvatarEditorViewController *)self isCreating]
    || [(AVTAvatarEditorViewController *)self hasChanges])
  {
    [(AVTAvatarEditorViewController *)self finish:0];
  }
}

- (void)finish:(id)a3
{
  int v4 = [(AVTAvatarEditorViewController *)self logger];
  double v5 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
  [v5 didFinishEditing];

  id v6 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
  double v7 = [v6 avatarRecord];

  BOOL v8 = [(AVTAvatarEditorViewController *)self isCreating];
  double v9 = [(AVTAvatarEditorViewController *)self environment];
  double v10 = [v9 usageTrackingSession];
  double v11 = v10;
  if (v8) {
    [v10 didCreateAvatar:v7];
  }
  else {
    [v10 didEditAvatar:v7];
  }

  double v12 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
  double v13 = [v12 avatar];

  double v14 = [(AVTAvatarEditorViewController *)self store];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__AVTAvatarEditorViewController_finish___block_invoke;
  v17[3] = &unk_263FF07F8;
  id v18 = v4;
  double v19 = self;
  id v20 = v7;
  id v15 = v7;
  id v16 = v4;
  [v14 saveAvatarRecord:v15 thumbnailAvatar:v13 completionBlock:v17 thumbnailGenerationCompletionBlock:0];
}

void __40__AVTAvatarEditorViewController_finish___block_invoke(uint64_t a1, int a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  if (a2)
  {
    [*(id *)(a1 + 32) logDidFinishEditingWithSuccess];
  }
  else
  {
    double v5 = [a3 description];
    [v4 logDidFinishEditingWithError:v5];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__AVTAvatarEditorViewController_finish___block_invoke_2;
  v7[3] = &unk_263FF0780;
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __40__AVTAvatarEditorViewController_finish___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 avatarEditorViewController:*(void *)(a1 + 32) didFinishWithAvatarRecord:*(void *)(a1 + 40)];
}

- (void)splashScreenViewControllerDidCancel:(id)a3
{
  id v4 = [(AVTAvatarEditorViewController *)self delegate];
  [v4 avatarEditorViewControllerDidCancel:self];
}

- (void)splashScreenViewControllerDidConfirm:(id)a3
{
  AVTUISetHasDisplayedSplashScreen();
  AVTUISetHasDisplayedCameraDisclosureSplashScreen();
  id v4 = [(AVTAvatarEditorViewController *)self initialAvatarRecord];
  [(AVTAvatarEditorViewController *)self loadAttributeEditorViewWithAvatarRecord:v4];

  double v5 = [(AVTAvatarEditorViewController *)self splashScreenViewController];
  [v5 willMoveToParentViewController:0];

  id v6 = [(AVTAvatarEditorViewController *)self splashScreenViewController];
  double v7 = [v6 view];
  [v7 removeFromSuperview];

  id v8 = [(AVTAvatarEditorViewController *)self splashScreenViewController];
  [v8 removeFromParentViewController];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return ![(AVTAvatarEditorViewController *)self hasChanges];
}

- (void)handleDiscardAttempt
{
  if ([(AVTAvatarEditorViewController *)self hasChanges])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__AVTAvatarEditorViewController_handleDiscardAttempt__block_invoke;
    block[3] = &unk_263FF03D8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v3 = [(AVTAvatarEditorViewController *)self delegate];
    [v3 avatarEditorViewControllerDidCancel:self];
  }
}

void __53__AVTAvatarEditorViewController_handleDiscardAttempt__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 cancelButtonItem];
  [v1 confirmCancel:v2];
}

- (void)confirmCancel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTAvatarEditorViewController *)self isCreating];
  id v6 = AVTAvatarUIBundle();
  double v7 = v6;
  if (v5) {
    id v8 = @"EDITING_CREATE_DISCARD_CONFIRMATION_TITLE";
  }
  else {
    id v8 = @"EDITING_DISCARD_CONFIRMATION_TITLE";
  }
  double v9 = [v6 localizedStringForKey:v8 value:&stru_26BF058D0 table:@"Localized"];

  double v10 = +[AVTAlertController alertControllerWithTitle:v9 message:0 preferredStyle:0];
  double v11 = (void *)MEMORY[0x263F1C3F0];
  double v12 = AVTAvatarUIBundle();
  double v13 = [v12 localizedStringForKey:@"EDITING_DISCARD_CONFIRM" value:&stru_26BF058D0 table:@"Localized"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__AVTAvatarEditorViewController_confirmCancel___block_invoke;
  v24[3] = &unk_263FF0D90;
  v24[4] = self;
  double v14 = [v11 actionWithTitle:v13 style:2 handler:v24];
  [v10 addAction:v14];

  id v15 = (void *)MEMORY[0x263F1C3F0];
  id v16 = AVTAvatarUIBundle();
  double v17 = [v16 localizedStringForKey:@"EDITING_DISCARD_CANCEL" value:&stru_26BF058D0 table:@"Localized"];
  uint64_t v18 = [v15 actionWithTitle:v17 style:1 handler:0];
  [v10 addAction:v18];

  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();
  double v19 = [v10 popoverPresentationController];
  id v20 = v19;
  if (v18) {
    [v19 setBarButtonItem:v4];
  }
  else {
    [v19 setSourceView:v4];
  }

  id v21 = [(AVTAvatarEditorViewController *)self cancelButtonItem];
  if (v21 == v4) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 15;
  }
  v23 = [v10 popoverPresentationController];
  [v23 setPermittedArrowDirections:v22];

  [(AVTAvatarEditorViewController *)self presentViewController:v10 animated:1 completion:0];
}

void __47__AVTAvatarEditorViewController_confirmCancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributeEditorViewController];
  [v2 didFinishEditing];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 avatarEditorViewControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)attributeEditorDidMakeFirstSelection:(id)a3
{
  [(AVTAvatarEditorViewController *)self enableDoneButton:1];
  [(AVTAvatarEditorViewController *)self setHasChanges:1];
}

- (void)attributeEditor:(id)a3 didUpdateVisibleLayout:(id)a4
{
}

- (void)controllerPresentationWillObstructView:(id)a3
{
  id v3 = [(AVTAvatarEditorViewController *)self attributeEditorViewController];
  id v5 = [v3 presentedViewController];

  id v4 = v5;
  if (v5)
  {
    [v5 dismissViewControllerAnimated:0 completion:0];
    id v4 = v5;
  }
}

- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5
{
  if (a5) {
    [(AVTAvatarEditorViewController *)self finish:a4];
  }
  else {
    [(AVTAvatarEditorViewController *)self cancel:a4];
  }
}

- (AVTAvatarEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (unint64_t)editorPresentationContext
{
  return self->_editorPresentationContext;
}

- (void)setEditorPresentationContext:(unint64_t)a3
{
  self->_editorPresentationContext = a3;
}

- (AVTAvatarRecord)initialAvatarRecord
{
  return self->_initialAvatarRecord;
}

- (void)setInitialAvatarRecord:(id)a3
{
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)isCreating
{
  return self->_isCreating;
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (AVTToolBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (AVTSplashScreenViewController)splashScreenViewController
{
  return self->_splashScreenViewController;
}

- (AVTAvatarAttributeEditorViewController)attributeEditorViewController
{
  return self->_attributeEditorViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeEditorViewController, 0);
  objc_storeStrong((id *)&self->_splashScreenViewController, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_initialAvatarRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4
{
}

- (void)configurePPTMemoji
{
  attributeEditorViewController = self->_attributeEditorViewController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__AVTAvatarEditorViewController_UIApplicationTesting__configurePPTMemoji__block_invoke;
  v3[3] = &unk_263FF03D8;
  v3[4] = self;
  [(AVTAvatarAttributeEditorViewController *)attributeEditorViewController configurePPTMemoji:v3];
}

uint64_t __73__AVTAvatarEditorViewController_UIApplicationTesting__configurePPTMemoji__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish:0];
}

@end