@interface CFXEffectBrowserViewController
+ (CGSize)CFX_droppedSizeForSticker:(id)a3 dropTarget:(id)a4;
+ (CGSize)CFX_sizeOfImageAtURL:(id)a3;
- (BOOL)expandedAppShouldDismissOnDragSuccess;
- (BOOL)shouldRotateCellsForDeviceOrientation;
- (BOOL)showAppIconBorders;
- (CFXEffectBrowserContentPresenterDelegate)contentPresenterDelegate;
- (CFXEffectBrowserViewController)initWithDelegate:(id)a3 contentPresenter:(id)a4;
- (CFXEffectBrowserViewControllerDelegate)delegate;
- (CFXEffectPickerViewController)effectPickerViewController;
- (CGSize)expandedAppViewControllerSize;
- (IMADockViewController)messagesAppsDockViewController;
- (NSLayoutConstraint)madBottomConstraint;
- (NSLayoutConstraint)madExpandedAppButtonsHeightConstraint;
- (NSLayoutConstraint)madHeightConstraint;
- (NSLayoutConstraint)madLeadingConstraint;
- (NSLayoutConstraint)madTopConstraint;
- (NSLayoutConstraint)madTrailingConstraint;
- (NSLayoutConstraint)madWidthConstraint;
- (NSString)selectedAppIdentifier;
- (OS_dispatch_group)animatedPreviewProcessingGroup;
- (OS_dispatch_queue)animatedPreviewWritingQueue;
- (OS_dispatch_queue)animojiLoadingQueue;
- (OS_dispatch_semaphore)animatedPreviewWritingSemaphore;
- (UIView)messagesAppsDockContainerView;
- (UIViewController)contentPresenter;
- (UIViewController)dockPresentationViewController;
- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3;
- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3;
- (id)selectedFilterIdentifierForEffectPickerViewController:(id)a3;
- (void)CFX_addSticker:(id)a3 atDropTarget:(id)a4;
- (void)CFX_updateAVTAvatarPickerforMessagesAppViewController:(id)a3;
- (void)addSticker:(id)a3;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)avatarPickerDidEndCameraSession:(id)a3;
- (void)avatarPickerWillStartCameraSession:(id)a3;
- (void)commitAnimatedLayoutChanges;
- (void)compactCurrentMessagesApp;
- (void)configureUIForOrientation;
- (void)dealloc;
- (void)didSelectAppWithBundleIdentifier:(id)a3;
- (void)dismissExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)displayPickerForEffectTypeIdentifier:(id)a3 messagesAppViewController:(id)a4 embedInMessageAppViewController:(BOOL)a5;
- (void)dockDidMagnify:(BOOL)a3;
- (void)effectPickerViewController:(id)a3 didPickEffect:(id)a4;
- (void)hideBrowserAnimated:(BOOL)a3 completion:(id)a4;
- (void)initMessagesAppsDockViewController;
- (void)loadView;
- (void)presentExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)refreshEffectBrowserForCameraFlip;
- (void)removeEffectPickerViewController;
- (void)setAnimatedPreviewProcessingGroup:(id)a3;
- (void)setAnimatedPreviewWritingQueue:(id)a3;
- (void)setAnimatedPreviewWritingSemaphore:(id)a3;
- (void)setAnimojiLoadingQueue:(id)a3;
- (void)setContentPresenter:(id)a3;
- (void)setContentPresenterDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectPickerViewController:(id)a3;
- (void)setMadBottomConstraint:(id)a3;
- (void)setMadExpandedAppButtonsHeightConstraint:(id)a3;
- (void)setMadHeightConstraint:(id)a3;
- (void)setMadLeadingConstraint:(id)a3;
- (void)setMadTopConstraint:(id)a3;
- (void)setMadTrailingConstraint:(id)a3;
- (void)setMadWidthConstraint:(id)a3;
- (void)setMessagesAppsDockContainerView:(id)a3;
- (void)setMessagesAppsDockViewController:(id)a3;
- (void)setSelectedAppIdentifier:(id)a3;
- (void)setShowAppIconBorders:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CFXEffectBrowserViewController

- (CFXEffectBrowserViewController)initWithDelegate:(id)a3 contentPresenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CFXEffectBrowserViewController;
  v8 = [(CFXEffectBrowserViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_contentPresenter, v7);
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("AnimojiLoadingQueue", v10);
    animojiLoadingQueue = v9->_animojiLoadingQueue;
    v9->_animojiLoadingQueue = (OS_dispatch_queue *)v11;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v3 cleanupRunningApps];

  v4.receiver = self;
  v4.super_class = (Class)CFXEffectBrowserViewController;
  [(CFXEffectBrowserViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(CFXEffectBrowserView);
  [(CFXEffectBrowserViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CFXEffectBrowserViewController;
  [(CFXEffectBrowserViewController *)&v3 viewDidLoad];
  [(CFXEffectBrowserViewController *)self initMessagesAppsDockViewController];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXEffectBrowserViewController;
  [(CFXEffectBrowserViewController *)&v3 viewDidLayoutSubviews];
  [(CFXEffectBrowserViewController *)self configureUIForOrientation];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CFXEffectBrowserViewController;
  -[CFXEffectBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  id v7 = [MEMORY[0x263F1C5C0] currentDevice];
  if (![v7 userInterfaceIdiom])
  {
    v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 bounds];
    if ((uint64_t)v9 == 667)
    {
    }
    else
    {
      v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 bounds];
      uint64_t v12 = (uint64_t)v11;

      if (v12 != 667) {
        return;
      }
    }
    if (height <= width) {
      double v13 = 0.0;
    }
    else {
      double v13 = -3.0;
    }
    id v7 = [(CFXEffectBrowserViewController *)self madTopConstraint];
    [v7 setConstant:v13];
  }
}

- (void)configureUIForOrientation
{
  id v60 = [MEMORY[0x263F1C5C0] currentDevice];
  if (![v60 userInterfaceIdiom])
  {
    objc_super v3 = [(CFXEffectBrowserViewController *)self delegate];
    int v4 = [v3 allowLandscapeForEffectBrowserViewController:self];

    if (!v4) {
      return;
    }
    int64_t v5 = +[JFXOrientationMonitor interfaceOrientation];
    if ((unint64_t)(v5 - 3) > 1)
    {
      v20 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
      int v7 = 1132068864;
      LODWORD(v21) = 1132068864;
      [v20 setPriority:v21];

      v22 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
      LODWORD(v23) = 1144750080;
      [v22 setPriority:v23];

      v24 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
      LODWORD(v25) = 1144750080;
      [v24 setPriority:v25];

      v26 = [(CFXEffectBrowserViewController *)self madTrailingConstraint];
      LODWORD(v27) = 1144750080;
      [v26 setPriority:v27];

      v28 = [(CFXEffectBrowserViewController *)self madTopConstraint];
      LODWORD(v29) = 1144750080;
      [v28 setPriority:v29];

      v18 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
    }
    else
    {
      id v6 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
      int v7 = 1144750080;
      LODWORD(v8) = 1144750080;
      [v6 setPriority:v8];

      double v9 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
      LODWORD(v10) = 1132068864;
      [v9 setPriority:v10];

      double v11 = [(CFXEffectBrowserViewController *)self madTopConstraint];
      LODWORD(v12) = 1144750080;
      [v11 setPriority:v12];

      double v13 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
      LODWORD(v14) = 1144750080;
      [v13 setPriority:v14];

      v15 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
      v17 = v15;
      if (v5 != 4)
      {
        LODWORD(v16) = 1144750080;
        [v15 setPriority:v16];

        v18 = [(CFXEffectBrowserViewController *)self madTrailingConstraint];
        v30 = v18;
        LODWORD(v19) = 1132068864;
LABEL_12:
        [v18 setPriority:v19];

        v31 = +[JFXOrientationMonitor keyWindow];
        [v31 bounds];
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        objc_msgSend(MEMORY[0x263F5E478], "cameraBottomBarGeometryForReferenceBounds:withOrientation:", v5, v33, v35, v37, v39);
        objc_msgSend(MEMORY[0x263F5E478], "cameraBottomBarFrameForReferenceBounds:", v33, v35, v37, v39);
        double Width = CGRectGetWidth(v72);
        v41 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
        [v41 minimizedDockHeight];
        double v43 = v42;

        long long v62 = v68;
        long long v63 = v69;
        long long v64 = v70;
        v44 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
        v45 = [v44 view];
        v61[0] = v62;
        v61[1] = v63;
        v61[2] = v64;
        [v45 setTransform:v61];

        v46 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
        v47 = [v46 view];
        objc_msgSend(v47, "setBounds:", 0.0, 0.0, Width, v43);

        if ((unint64_t)(v5 - 3) > 1)
        {
          double v52 = Width * 0.5;
          double Width = v43;
LABEL_24:
          v58 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
          v59 = [v58 view];
          objc_msgSend(v59, "setCenter:", v52, Width * 0.5);

          return;
        }
        double v48 = v43 * 0.5;
        v49 = [MEMORY[0x263F1C5C0] currentDevice];
        if ([v49 userInterfaceIdiom])
        {

LABEL_15:
          char v50 = 0;
          double v51 = 0.0;
LABEL_21:
          if (((v5 == 3) & v50) != 0) {
            double v51 = -v51;
          }
          double v52 = v48 + v51;
          goto LABEL_24;
        }
        v53 = [MEMORY[0x263F1C920] mainScreen];
        [v53 bounds];
        if ((uint64_t)v54 == 667)
        {
        }
        else
        {
          v55 = [MEMORY[0x263F1C920] mainScreen];
          [v55 bounds];
          uint64_t v57 = (uint64_t)v56;

          if (v57 != 667) {
            goto LABEL_15;
          }
        }
        double v51 = 3.0;
        char v50 = 1;
        goto LABEL_21;
      }
      LODWORD(v16) = 1132068864;
      [v15 setPriority:v16];

      v18 = [(CFXEffectBrowserViewController *)self madTrailingConstraint];
    }
    v30 = v18;
    LODWORD(v19) = v7;
    goto LABEL_12;
  }
}

- (void)compactCurrentMessagesApp
{
  v2 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  int v4 = [v2 currentAppViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v4;
    if ([v3 presentationStyle] == 1) {
      [v3 requestPresentationStyle:0];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)displayPickerForEffectTypeIdentifier:(id)a3 messagesAppViewController:(id)a4 embedInMessageAppViewController:(BOOL)a5
{
  BOOL v5 = a5;
  v44[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
  double v11 = [v10 effectType];
  double v12 = [v11 identifier];
  if ([v12 isEqualToString:v8])
  {
    double v13 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
    id v14 = [v13 parentViewController];

    if (v14 == v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v15 = [(CFXEffectBrowserViewController *)self effectPickerViewController];

  if (v15) {
    [(CFXEffectBrowserViewController *)self removeEffectPickerViewController];
  }
  double v16 = +[CFXEffectPickerViewController effectPickerViewController];
  [(CFXEffectBrowserViewController *)self setEffectPickerViewController:v16];

  v17 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
  [v17 setDelegate:self];

  v18 = +[CFXEffectType effectTypeWithIdentifier:v8];
  uint64_t v19 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
  [(id)v19 setEffectType:v18];

  v20 = [(CFXEffectBrowserViewController *)self delegate];
  LOBYTE(v19) = objc_opt_respondsToSelector();

  if (v19)
  {
    double v21 = [(CFXEffectBrowserViewController *)self delegate];
    v22 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
    double v23 = [v22 effectType];
    [v21 effectBrowserViewController:self didPresentPickerForEffectType:v23];
  }
  v24 = [(CFXEffectBrowserViewController *)self delegate];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __129__CFXEffectBrowserViewController_displayPickerForEffectTypeIdentifier_messagesAppViewController_embedInMessageAppViewController___block_invoke;
  v43[3] = &unk_264C0C0D8;
  v43[4] = self;
  objc_msgSend(v24, "effectBrowserViewController:filterPickerPreviewBackgroundImageAtSizeInPixels:completion:", self, v43, 200.0, 200.0);

  double v25 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
  if (v5)
  {
    [v9 jfxAddChildViewController:v25 constrainRelativeToSafeAreas:0];
  }
  else
  {
    [(UIViewController *)self jfxAddChildViewController:v25];

    v26 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
    double v25 = [v26 view];

    double v27 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v37 = (void *)MEMORY[0x263F08938];
    double v42 = [v25 leftAnchor];
    v41 = [v27 leftAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v44[0] = v40;
    double v39 = [v25 rightAnchor];
    double v38 = [v27 rightAnchor];
    double v36 = [v39 constraintEqualToAnchor:v38];
    v44[1] = v36;
    v28 = [v25 heightAnchor];
    double v29 = [v28 constraintEqualToConstant:300.0];
    v44[2] = v29;
    v30 = [v25 topAnchor];
    v31 = [v27 topAnchor];
    double v32 = [v30 constraintEqualToAnchor:v31];
    v44[3] = v32;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    id v33 = v9;
    v35 = id v34 = v8;
    [v37 activateConstraints:v35];

    id v8 = v34;
    id v9 = v33;
  }
LABEL_13:
}

void __129__CFXEffectBrowserViewController_displayPickerForEffectTypeIdentifier_messagesAppViewController_embedInMessageAppViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 effectPickerViewController];
  [v5 setPreviewBackgroundImage:v4];

  id v6 = [*(id *)(a1 + 32) effectPickerViewController];
  [v6 startPreviewing];
}

- (void)initMessagesAppsDockViewController
{
  v144[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F88E88]);
  [(CFXEffectBrowserViewController *)self setMessagesAppsDockViewController:v3];

  id v4 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v4 setDelegate:self];

  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CFXEffectBrowserViewController *)self setMessagesAppsDockContainerView:v6];

  int v7 = [(CFXEffectBrowserViewController *)self view];
  id v8 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  [v7 addSubview:v8];

  id v9 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
    uint64_t v13 = [v12 shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:self];

LABEL_7:
    long long v70 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    [v70 setAlwaysPresentAppsExpanded:v13];

    goto LABEL_8;
  }
  id v14 = [(CFXEffectBrowserViewController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
  {
    uint64_t v13 = 0;
    goto LABEL_7;
  }
  double v16 = [(CFXEffectBrowserViewController *)self delegate];
  uint64_t v17 = [v16 shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:self];

  v18 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v18 setAlwaysPresentAppsExpanded:v17];

  if (v17)
  {
    uint64_t v19 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    v20 = [v19 widthAnchor];
    double v21 = [v20 constraintEqualToConstant:375.0];
    [(CFXEffectBrowserViewController *)self setMadWidthConstraint:v21];

    v22 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
    LODWORD(v23) = 1144750080;
    [v22 setPriority:v23];

    v24 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    double v25 = [v24 heightAnchor];
    v26 = [v25 constraintEqualToConstant:81.0];
    [(CFXEffectBrowserViewController *)self setMadHeightConstraint:v26];

    double v27 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
    LODWORD(v28) = 1144750080;
    [v27 setPriority:v28];

    double v29 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    v30 = [v29 leadingAnchor];
    v31 = [(CFXEffectBrowserViewController *)self view];
    double v32 = [v31 leadingAnchor];
    id v33 = [v30 constraintEqualToAnchor:v32 constant:36.0];
    [(CFXEffectBrowserViewController *)self setMadLeadingConstraint:v33];

    id v34 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
    LODWORD(v35) = 1144750080;
    [v34 setPriority:v35];

    double v36 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    double v37 = [v36 bottomAnchor];
    double v38 = [(CFXEffectBrowserViewController *)self view];
    double v39 = [v38 bottomAnchor];
    v40 = [v37 constraintEqualToAnchor:v39 constant:-36.0];
    [(CFXEffectBrowserViewController *)self setMadBottomConstraint:v40];

    v41 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
    LODWORD(v42) = 1144750080;
    [v41 setPriority:v42];

    double v43 = (void *)MEMORY[0x263F08938];
    v44 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
    v143[0] = v44;
    v45 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
    v143[1] = v45;
    v46 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
    v143[2] = v46;
    v47 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
    v143[3] = v47;
    double v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:4];
    [v43 activateConstraints:v48];

    v49 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    char v50 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    [(UIViewController *)self jfxAddChildViewController:v49 containerView:v50];

    double v51 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    double v52 = [v51 view];

    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    v53 = [v52 heightAnchor];
    double v54 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    [v54 minimizedDockHeight];
    v55 = objc_msgSend(v53, "constraintEqualToConstant:");
    [(CFXEffectBrowserViewController *)self setMadExpandedAppButtonsHeightConstraint:v55];

    v135 = (void *)MEMORY[0x263F08938];
    v140 = [v52 leftAnchor];
    v141 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    v139 = [v141 leftAnchor];
    v138 = [v140 constraintEqualToAnchor:v139];
    v142[0] = v138;
    v136 = [v52 rightAnchor];
    v137 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    double v56 = [v137 rightAnchor];
    uint64_t v57 = [v136 constraintEqualToAnchor:v56];
    v142[1] = v57;
    v58 = [(CFXEffectBrowserViewController *)self madExpandedAppButtonsHeightConstraint];
    v142[2] = v58;
    v59 = [v52 centerYAnchor];
    id v60 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    v61 = [v60 centerYAnchor];
    long long v62 = [v59 constraintEqualToAnchor:v61];
    v142[3] = v62;
    long long v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:4];
    [v135 activateConstraints:v63];

    long long v64 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    long long v65 = [v64 layer];
    [v65 setCornerRadius:12.0];

    long long v66 = (void *)MEMORY[0x263F1C550];
    long long v67 = [MEMORY[0x263F086E0] jfxBundle];
    long long v68 = [v66 colorNamed:@"appDockBackground" inBundle:v67 compatibleWithTraitCollection:0];
    long long v69 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    [v69 setBackgroundColor:v68];

LABEL_11:
    return;
  }
LABEL_8:
  v71 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  CGRect v72 = [v71 widthAnchor];
  v73 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v73 minimizedDockHeight];
  v74 = objc_msgSend(v72, "constraintEqualToConstant:");
  [(CFXEffectBrowserViewController *)self setMadWidthConstraint:v74];

  v75 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
  LODWORD(v76) = 1132068864;
  [v75 setPriority:v76];

  v77 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v78 = [v77 heightAnchor];
  v79 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v79 minimizedDockHeight];
  v80 = objc_msgSend(v78, "constraintEqualToConstant:");
  [(CFXEffectBrowserViewController *)self setMadHeightConstraint:v80];

  v81 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
  LODWORD(v82) = 1144750080;
  [v81 setPriority:v82];

  v83 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v84 = [v83 leadingAnchor];
  v85 = [(CFXEffectBrowserViewController *)self view];
  v86 = [v85 leadingAnchor];
  v87 = [v84 constraintEqualToAnchor:v86];
  [(CFXEffectBrowserViewController *)self setMadLeadingConstraint:v87];

  v88 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
  LODWORD(v89) = 1144750080;
  [v88 setPriority:v89];

  v90 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v91 = [v90 trailingAnchor];
  v92 = [(CFXEffectBrowserViewController *)self view];
  v93 = [v92 trailingAnchor];
  v94 = [v91 constraintEqualToAnchor:v93];
  [(CFXEffectBrowserViewController *)self setMadTrailingConstraint:v94];

  v95 = [(CFXEffectBrowserViewController *)self madTrailingConstraint];
  LODWORD(v96) = 1144750080;
  [v95 setPriority:v96];

  v97 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v98 = [v97 topAnchor];
  v99 = [(CFXEffectBrowserViewController *)self view];
  v100 = [v99 topAnchor];
  v101 = [v98 constraintEqualToAnchor:v100];
  [(CFXEffectBrowserViewController *)self setMadTopConstraint:v101];

  v102 = [(CFXEffectBrowserViewController *)self madTopConstraint];
  LODWORD(v103) = 1144750080;
  [v102 setPriority:v103];

  v104 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v105 = [v104 bottomAnchor];
  v106 = [(CFXEffectBrowserViewController *)self view];
  v107 = [v106 bottomAnchor];
  v108 = [v105 constraintEqualToAnchor:v107];
  [(CFXEffectBrowserViewController *)self setMadBottomConstraint:v108];

  v109 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
  LODWORD(v110) = 1132068864;
  [v109 setPriority:v110];

  v111 = (void *)MEMORY[0x263F08938];
  v112 = [(CFXEffectBrowserViewController *)self madWidthConstraint];
  v144[0] = v112;
  v113 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
  v144[1] = v113;
  v114 = [(CFXEffectBrowserViewController *)self madLeadingConstraint];
  v144[2] = v114;
  v115 = [(CFXEffectBrowserViewController *)self madTrailingConstraint];
  v144[3] = v115;
  v116 = [(CFXEffectBrowserViewController *)self madTopConstraint];
  v144[4] = v116;
  v117 = [(CFXEffectBrowserViewController *)self madBottomConstraint];
  v144[5] = v117;
  v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:6];
  [v111 activateConstraints:v118];

  v119 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  v120 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
  v121 = [(CFXEffectBrowserViewController *)self delegate];
  -[UIViewController jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:](self, "jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:", v119, v120, [v121 allowLandscapeForEffectBrowserViewController:self] ^ 1, 0);

  v122 = [(CFXEffectBrowserViewController *)self delegate];
  LODWORD(v120) = [v122 allowLandscapeForEffectBrowserViewController:self];

  if (v120)
  {
    v123 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    [v123 frame];
    double Width = CGRectGetWidth(v145);
    v125 = [(CFXEffectBrowserViewController *)self messagesAppsDockContainerView];
    [v125 frame];
    double Height = CGRectGetHeight(v146);
    v127 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    v128 = [v127 view];
    objc_msgSend(v128, "setFrame:", 0.0, 0.0, Width, Height);
  }
  double v52 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v52 userInterfaceIdiom]) {
    goto LABEL_11;
  }
  v129 = [MEMORY[0x263F1C920] mainScreen];
  [v129 bounds];
  if ((uint64_t)v130 == 667)
  {
    int64_t v131 = +[JFXOrientationMonitor interfaceOrientation];

    if (v131 == 1)
    {
LABEL_18:
      double v52 = [(CFXEffectBrowserViewController *)self madTopConstraint];
      [v52 setConstant:-3.0];
      goto LABEL_11;
    }
  }
  else
  {
    v132 = [MEMORY[0x263F1C920] mainScreen];
    [v132 bounds];
    if ((uint64_t)v133 != 667)
    {

      goto LABEL_11;
    }
    int64_t v134 = +[JFXOrientationMonitor interfaceOrientation];

    if (v134 == 1) {
      goto LABEL_18;
    }
  }
}

- (void)removeEffectPickerViewController
{
  id v3 = [(CFXEffectBrowserViewController *)self effectPickerViewController];

  if (v3)
  {
    id v4 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
    id v9 = [v4 effectType];

    id v5 = [(CFXEffectBrowserViewController *)self effectPickerViewController];
    [v5 jfxRemoveFromParentViewController];

    [(CFXEffectBrowserViewController *)self setEffectPickerViewController:0];
    id v6 = [(CFXEffectBrowserViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXEffectBrowserViewController *)self delegate];
      [v8 effectBrowserViewController:self didDismissPickerForEffectType:v9];
    }
  }
}

- (void)hideBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v7 hideAppViewControllerAnimated:v4 completion:v6];
}

- (void)refreshEffectBrowserForCameraFlip
{
  id v3 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  id v4 = [v3 currentAppViewController];

  [(CFXEffectBrowserViewController *)self CFX_updateAVTAvatarPickerforMessagesAppViewController:v4];
}

- (BOOL)showAppIconBorders
{
  [(CFXEffectBrowserViewController *)self loadViewIfNeeded];
  id v3 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  char v4 = [v3 showIconBorders];

  return v4;
}

- (void)setShowAppIconBorders:(BOOL)a3
{
  BOOL v3 = a3;
  [(CFXEffectBrowserViewController *)self loadViewIfNeeded];
  id v5 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
  [v5 setShowIconBorders:v3];
}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JFXLog_pickerUI();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      -[CFXEffectBrowserViewController avatarPicker:didSelectAvatarRecord:](v7, v8);
    }

    double v10 = [(CFXEffectBrowserViewController *)self animojiLoadingQueue];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke;
    v20 = &unk_264C09F10;
    id v21 = v7;
    v22 = self;
    dispatch_async(v10, &v17);

    char v11 = v21;
    goto LABEL_9;
  }
  if (v9) {
    -[CFXEffectBrowserViewController avatarPicker:didSelectAvatarRecord:]();
  }

  double v12 = [(CFXEffectBrowserViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    char v11 = [(CFXEffectBrowserViewController *)self delegate];
    id v14 = +[CFXEffectType effectTypeWithIdentifier:@"Animoji"];
    [v11 effectBrowserViewController:self didRemoveAllEffectsOfType:v14];

LABEL_9:
  }
  char v15 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", v17, v18, v19, v20);
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (!v16) {
    [(CFXEffectBrowserViewController *)self compactCurrentMessagesApp];
  }
}

void __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = AVTAvatarKitVersionNumber();
  BOOL v3 = [MEMORY[0x263F29780] avatarForRecord:*(void *)(a1 + 32)];
  char v4 = [v3 dataRepresentation];

  if (v4)
  {
    v15[0] = @"JFXAnimojiEffectDataRepresentationKey";
    v15[1] = @"JFXAnimojiEffectAvatarVersionNumberKey";
    v16[0] = v4;
    id v5 = [NSNumber numberWithUnsignedInteger:v2];
    v16[1] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[JFXEffectFactory sharedInstance];
  id v8 = [*(id *)(a1 + 32) identifier];
  BOOL v9 = [v7 createEffectForType:7 fromID:v8 withProperties:v6];

  double v10 = +[CFXEffect effectWithJTEffect:v9];
  char v11 = [*(id *)(a1 + 40) delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke_2;
    block[3] = &unk_264C09F10;
    block[4] = *(void *)(a1 + 40);
    id v14 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 effectBrowserViewController:*(void *)(a1 + 32) didSelectEffect:*(void *)(a1 + 40)];
}

- (void)avatarPickerDidEndCameraSession:(id)a3
{
  char v4 = JFXLog_pickerUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CFXEffectBrowserViewController avatarPickerDidEndCameraSession:]();
  }

  id v5 = [(CFXEffectBrowserViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CFXEffectBrowserViewController *)self delegate];
    [v7 effectBrowserViewControllerDidStartCaptureSession:self];
  }
}

- (void)avatarPickerWillStartCameraSession:(id)a3
{
  char v4 = JFXLog_pickerUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CFXEffectBrowserViewController avatarPickerWillStartCameraSession:]();
  }

  id v5 = [(CFXEffectBrowserViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CFXEffectBrowserViewController *)self delegate];
    [v7 effectBrowserViewControllerDidStopCaptureSession:self];
  }
}

- (void)effectPickerViewController:(id)a3 didPickEffect:(id)a4
{
  id v10 = a4;
  id v5 = [(CFXEffectBrowserViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CFXEffectBrowserViewController *)self delegate];
    [v7 effectBrowserViewController:self didSelectEffect:v10];
  }
  id v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (!v9) {
    [(CFXEffectBrowserViewController *)self compactCurrentMessagesApp];
  }
}

- (id)selectedFilterIdentifierForEffectPickerViewController:(id)a3
{
  char v4 = [(CFXEffectBrowserViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CFXEffectBrowserViewController *)self delegate];
    id v7 = [v6 selectedFilterIdentifierForEffectBrowserViewController:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  BOOL v3 = [(CFXEffectBrowserViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(CFXEffectBrowserViewController *)self delegate];
  char v6 = [v5 shouldRotateCellsForDeviceOrientation];

  return v6;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  char v4 = [(CFXEffectBrowserViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CFXEffectBrowserViewController *)self delegate];
    id v7 = [v6 selectedAnimojiIdentifierForEffectBrowserViewController:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  char v4 = [(CFXEffectBrowserViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CFXEffectBrowserViewController *)self delegate];
    id v7 = [v6 localizedPromptForHidingAnimojiForEffectBrowserViewController:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)addSticker:(id)a3
{
}

+ (CGSize)CFX_sizeOfImageAtURL:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  CGImageSourceRef v5 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v5)
  {
    char v6 = v5;
    uint64_t v16 = *MEMORY[0x263F0F600];
    v17[0] = MEMORY[0x263EFFA80];
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v6, 0, v7);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      id v10 = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x263F0F4F8]);
      char v11 = CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F0F4F0]);
      [v10 floatValue];
      double v3 = v12;
      [v11 floatValue];
      double v4 = v13;
      CFRelease(v9);
    }
    CFRelease(v6);
  }
  double v14 = v3;
  double v15 = v4;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (CGSize)CFX_droppedSizeForSticker:(id)a3 dropTarget:(id)a4
{
  id v6 = a4;
  CFDictionaryRef v7 = [a3 fileURL];
  objc_msgSend(a1, "CFX_sizeOfImageAtURL:", v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = *MEMORY[0x263F001B0];
  double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v9 != *MEMORY[0x263F001B0] || v11 != v13)
  {
    [v6 scale];
    double v16 = v15;
    [MEMORY[0x263F88E90] screenScale];
    double v18 = 1.0 / v17;
    double v19 = CGSizeScale(v9, v11, v16);
    double v12 = CGSizeScale(v19, v20, v18);
    double v13 = v21;
  }

  double v22 = v12;
  double v23 = v13;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)CFX_addSticker:(id)a3 atDropTarget:(id)a4
{
  v49[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 stickerName];
  id v9 = +[CFXEffectMessagesStickerUtilities overlayIDFromAnimatedPreviewFileName:v8];

  if (v9)
  {
    double v10 = 0;
    goto LABEL_8;
  }
  double v11 = [v6 fileURL];

  if (v11)
  {
    double v12 = [v6 fileURL];
    double v13 = [v12 lastPathComponent];
    double v10 = [@"CFX" stringByAppendingString:v13];

    double v14 = NSTemporaryDirectory();
    double v15 = [v14 stringByAppendingPathComponent:v10];

    double v16 = [MEMORY[0x263F08850] defaultManager];
    char v17 = [v16 fileExistsAtPath:v15];

    if (v17)
    {
LABEL_7:
      uint64_t v48 = *MEMORY[0x263F61720];
      v49[0] = v15;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
      id v9 = (id)*MEMORY[0x263F61538];

      double v10 = v23;
LABEL_8:
      v24 = JFXLog_pickerUI();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:]((uint64_t)v9, v24);
      }

      double v25 = +[JFXEffectFactory sharedInstance];
      v26 = [v25 createEffectForType:2 fromID:v9 withProperties:v10];

      double v27 = [v6 accessibilityLabel];
      [v26 setAccessibilityOverlayEffectLabel:v27];

      double v28 = +[CFXEffect effectWithJTEffect:v26];
      if (v7)
      {
        objc_msgSend((id)objc_opt_class(), "CFX_droppedSizeForSticker:dropTarget:", v6, v7);
        double v31 = v30;
        double v32 = v29;
        if (v30 == *MEMORY[0x263F001B0] && v29 == *(double *)(MEMORY[0x263F001B0] + 8))
        {
          id v33 = JFXLog_pickerUI();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:]();
          }
        }
        else
        {
          [v26 pickerScale];
          if (v36 != 1.0)
          {
            double v31 = CGSizeScale(v31, v32, v36);
            double v32 = v37;
          }
          [v7 screenCoordinate];
          double v39 = v38;
          double v41 = v40;
          [v7 rotation];
          double v43 = v42;
          id v33 = [(CFXEffectBrowserViewController *)self delegate];
          -[NSObject effectBrowserViewController:didDropOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:](v33, "effectBrowserViewController:didDropOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:", self, v28, v39, v41, v31, v32, v43);
        }
      }
      else
      {
        id v34 = [(CFXEffectBrowserViewController *)self delegate];
        char v35 = objc_opt_respondsToSelector();

        if ((v35 & 1) == 0)
        {
LABEL_21:
          v44 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
          int v45 = [v44 alwaysPresentAppsExpanded];

          if (v45) {
            [(CFXEffectBrowserViewController *)self hideBrowserAnimated:1 completion:0];
          }

          goto LABEL_24;
        }
        id v33 = [(CFXEffectBrowserViewController *)self delegate];
        [v33 effectBrowserViewController:self didSelectEffect:v28];
      }

      goto LABEL_21;
    }
    double v18 = [MEMORY[0x263F08850] defaultManager];
    double v19 = [v6 fileURL];
    double v20 = [v19 path];
    id v47 = 0;
    char v21 = [v18 copyItemAtPath:v20 toPath:v15 error:&v47];
    id v22 = v47;

    if (v21)
    {

      goto LABEL_7;
    }
    v46 = JFXLog_pickerUI();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:].cold.4(v6, (uint64_t)v22, v46);
    }
  }
  else
  {
    double v10 = JFXLog_pickerUI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:]();
    }
  }
LABEL_24:
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  id v11 = a3;
  -[CFXEffectBrowserViewController setSelectedAppIdentifier:](self, "setSelectedAppIdentifier:");
  double v4 = [(CFXEffectBrowserViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CFXEffectBrowserViewController *)self delegate];
    [v6 effectBrowserViewController:self didSelectAppWithIdentifier:v11];
  }
  if (v11)
  {
    uint64_t v7 = [v11 isEqualToString:@"com.apple.FunCamera.Filters"];
    if (v7) {
      double v8 = @"Filter";
    }
    else {
      double v8 = 0;
    }
    id v9 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    double v10 = [v9 currentAppViewController];

    if (v8)
    {
      [(CFXEffectBrowserViewController *)self displayPickerForEffectTypeIdentifier:v8 messagesAppViewController:v10 embedInMessageAppViewController:v7];
    }
    else
    {
      [(CFXEffectBrowserViewController *)self removeEffectPickerViewController];
      [(CFXEffectBrowserViewController *)self CFX_updateAVTAvatarPickerforMessagesAppViewController:v10];
    }
  }
  else
  {
    [(CFXEffectBrowserViewController *)self removeEffectPickerViewController];
    double v8 = [(CFXEffectBrowserViewController *)self messagesAppsDockViewController];
    [(__CFString *)v8 cleanupRunningApps];
  }
}

- (void)dockDidMagnify:(BOOL)a3
{
  BOOL v4 = a3;
  if (a3) {
    double v6 = 75.0;
  }
  else {
    double v6 = 44.0;
  }
  uint64_t v7 = [(CFXEffectBrowserViewController *)self madExpandedAppButtonsHeightConstraint];

  if (v7)
  {
    double v8 = [(CFXEffectBrowserViewController *)self madExpandedAppButtonsHeightConstraint];
LABEL_8:
    id v11 = v8;
    double v12 = v6;
    goto LABEL_9;
  }
  id v9 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v8 = [(CFXEffectBrowserViewController *)self madHeightConstraint];
    goto LABEL_8;
  }
  double v18 = [MEMORY[0x263F1C5C0] currentDevice];
  double v19 = 0.0;
  if (![v18 userInterfaceIdiom])
  {
    double v20 = [MEMORY[0x263F1C920] mainScreen];
    [v20 bounds];
    uint64_t v22 = (uint64_t)v21;
    if ((uint64_t)v21 != 667
      && ([MEMORY[0x263F1C920] mainScreen],
          double v3 = objc_claimAutoreleasedReturnValue(),
          [v3 bounds],
          (uint64_t)v23 != 667)
      || (+[JFXOrientationMonitor interfaceOrientation] != 1
        ? (double v19 = 0.0)
        : (double v19 = -3.0),
          v22 != 667))
    {
    }
  }

  if (v4) {
    double v19 = 31.0;
  }
  double v8 = [(CFXEffectBrowserViewController *)self madTopConstraint];
  id v11 = v8;
  double v12 = v19;
LABEL_9:
  [v8 setConstant:v12];

  double v13 = [(CFXEffectBrowserViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v15 = [(CFXEffectBrowserViewController *)self delegate];
    [v15 effectBrowserViewController:self willChangeDockHeight:v6];
  }
  double v16 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v24 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
    [v24 effectBrowserViewController:self willChangeDockHeight:v6];
  }
}

- (UIViewController)dockPresentationViewController
{
  double v3 = [(CFXEffectBrowserViewController *)self contentPresenter];
  if (v3)
  {
    BOOL v4 = [(CFXEffectBrowserViewController *)self contentPresenter];
  }
  else
  {
    BOOL v4 = self;
  }
  char v5 = v4;

  return (UIViewController *)v5;
}

- (BOOL)expandedAppShouldDismissOnDragSuccess
{
  id v2 = [(CFXEffectBrowserViewController *)self selectedAppIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.FunCamera.TextPicker.MessagesExtension"];

  return v3;
}

- (void)CFX_updateAVTAvatarPickerforMessagesAppViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(CFXEffectBrowserViewController *)self localizedPromptForHidingAnimojiForEffectBrowserViewController:self];
  if (![v4 conformsToProtocol:&unk_26E878990]) {
    goto LABEL_10;
  }
  id v6 = v4;
  [v6 setAvatarPickerDelegate:self];
  if (!v5)
  {
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke;
    void v16[3] = &unk_264C0A888;
    id v17 = v6;
    double v18 = self;
    id v19 = v17;
    dispatch_after(v10, MEMORY[0x263EF83A0], v16);

    id v9 = v17;
    goto LABEL_6;
  }
  if ([v6 conformsToProtocol:&unk_26E8789F0])
  {
    id v7 = v6;
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke_2;
    block[3] = &unk_264C09F10;
    id v14 = v7;
    id v15 = v5;
    id v9 = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);

LABEL_6:
  }
  id v11 = JFXLog_pickerUI();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "animoji picker with avatar delegate found", v12, 2u);
  }

LABEL_10:
}

void __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke(id *a1)
{
  id v2 = a1[4];
  [v2 endHidingInterface];
  id v3 = [a1[5] selectedAnimojiIdentifierForEffectBrowserViewController:a1[5]];
  [a1[6] selectAvatarRecordWithIdentifier:v3 animated:0];
}

uint64_t __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginHidingInterfaceWithMessage:*(void *)(a1 + 40)];
}

- (CGSize)expandedAppViewControllerSize
{
  id v3 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  }
  else
  {
    id v6 = [(CFXEffectBrowserViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      double v10 = *MEMORY[0x263F001B0];
      double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
      goto LABEL_7;
    }
    char v5 = [(CFXEffectBrowserViewController *)self delegate];
  }
  dispatch_time_t v8 = v5;
  [v5 expandedAppViewControllerSizeForEffectBrowserViewController:self];
  double v10 = v9;
  double v12 = v11;

LABEL_7:
  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)presentExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  double v9 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  }
  else
  {
    double v12 = [(CFXEffectBrowserViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_6;
    }
    double v11 = [(CFXEffectBrowserViewController *)self delegate];
  }
  double v14 = v11;
  [v11 effectBrowserViewController:self presentExpandedAppViewController:v15 animated:v6 completion:v8];

LABEL_6:
}

- (void)dismissExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  double v9 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CFXEffectBrowserViewController *)self contentPresenterDelegate];
  }
  else
  {
    double v12 = [(CFXEffectBrowserViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_6;
    }
    double v11 = [(CFXEffectBrowserViewController *)self delegate];
  }
  double v14 = v11;
  [v11 effectBrowserViewController:self dismissExpandedAppViewController:v15 animated:v6 completion:v8];

LABEL_6:
}

- (void)commitAnimatedLayoutChanges
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__CFXEffectBrowserViewController_commitAnimatedLayoutChanges__block_invoke;
  v2[3] = &unk_264C09FA8;
  v2[4] = self;
  +[JTAnimation performAnimation:v2 duration:0 completion:0.4];
}

void __61__CFXEffectBrowserViewController_commitAnimatedLayoutChanges__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (CFXEffectBrowserContentPresenterDelegate)contentPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresenterDelegate);
  return (CFXEffectBrowserContentPresenterDelegate *)WeakRetained;
}

- (void)setContentPresenterDelegate:(id)a3
{
}

- (NSString)selectedAppIdentifier
{
  return self->_selectedAppIdentifier;
}

- (void)setSelectedAppIdentifier:(id)a3
{
}

- (CFXEffectBrowserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXEffectBrowserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CFXEffectPickerViewController)effectPickerViewController
{
  return self->_effectPickerViewController;
}

- (void)setEffectPickerViewController:(id)a3
{
}

- (UIView)messagesAppsDockContainerView
{
  return self->_messagesAppsDockContainerView;
}

- (void)setMessagesAppsDockContainerView:(id)a3
{
}

- (IMADockViewController)messagesAppsDockViewController
{
  return self->_messagesAppsDockViewController;
}

- (void)setMessagesAppsDockViewController:(id)a3
{
}

- (OS_dispatch_semaphore)animatedPreviewWritingSemaphore
{
  return self->_animatedPreviewWritingSemaphore;
}

- (void)setAnimatedPreviewWritingSemaphore:(id)a3
{
}

- (OS_dispatch_queue)animatedPreviewWritingQueue
{
  return self->_animatedPreviewWritingQueue;
}

- (void)setAnimatedPreviewWritingQueue:(id)a3
{
}

- (OS_dispatch_group)animatedPreviewProcessingGroup
{
  return self->_animatedPreviewProcessingGroup;
}

- (void)setAnimatedPreviewProcessingGroup:(id)a3
{
}

- (UIViewController)contentPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresenter);
  return (UIViewController *)WeakRetained;
}

- (void)setContentPresenter:(id)a3
{
}

- (NSLayoutConstraint)madWidthConstraint
{
  return self->_madWidthConstraint;
}

- (void)setMadWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)madHeightConstraint
{
  return self->_madHeightConstraint;
}

- (void)setMadHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)madLeadingConstraint
{
  return self->_madLeadingConstraint;
}

- (void)setMadLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)madTrailingConstraint
{
  return self->_madTrailingConstraint;
}

- (void)setMadTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)madTopConstraint
{
  return self->_madTopConstraint;
}

- (void)setMadTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)madBottomConstraint
{
  return self->_madBottomConstraint;
}

- (void)setMadBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)madExpandedAppButtonsHeightConstraint
{
  return self->_madExpandedAppButtonsHeightConstraint;
}

- (void)setMadExpandedAppButtonsHeightConstraint:(id)a3
{
}

- (OS_dispatch_queue)animojiLoadingQueue
{
  return self->_animojiLoadingQueue;
}

- (void)setAnimojiLoadingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiLoadingQueue, 0);
  objc_storeStrong((id *)&self->_madExpandedAppButtonsHeightConstraint, 0);
  objc_storeStrong((id *)&self->_madBottomConstraint, 0);
  objc_storeStrong((id *)&self->_madTopConstraint, 0);
  objc_storeStrong((id *)&self->_madTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_madLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_madHeightConstraint, 0);
  objc_storeStrong((id *)&self->_madWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_contentPresenter);
  objc_storeStrong((id *)&self->_animatedPreviewProcessingGroup, 0);
  objc_storeStrong((id *)&self->_animatedPreviewWritingQueue, 0);
  objc_storeStrong((id *)&self->_animatedPreviewWritingSemaphore, 0);
  objc_storeStrong((id *)&self->_messagesAppsDockViewController, 0);
  objc_storeStrong((id *)&self->_messagesAppsDockContainerView, 0);
  objc_storeStrong((id *)&self->_effectPickerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedAppIdentifier, 0);
  objc_destroyWeak((id *)&self->_contentPresenterDelegate);
}

- (void)avatarPicker:didSelectAvatarRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "none selected in animoji picker", v2, v3, v4, v5, v6);
}

- (void)avatarPicker:(void *)a1 didSelectAvatarRecord:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "selected animoji %@", (uint8_t *)&v4, 0xCu);
}

- (void)avatarPickerDidEndCameraSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "animoji picker did end camera session", v2, v3, v4, v5, v6);
}

- (void)avatarPickerWillStartCameraSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "animoji picker did start camera session", v2, v3, v4, v5, v6);
}

- (void)CFX_addSticker:atDropTarget:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "rdar://110255981 Ignoring sticker with nil fileURL", v1, 2u);
}

- (void)CFX_addSticker:atDropTarget:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "could not insert overlay on drag and drop because its screen size could not be determined", v1, 2u);
}

- (void)CFX_addSticker:(uint64_t)a1 atDropTarget:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "sticker dropped for overlay %@", (uint8_t *)&v2, 0xCu);
}

- (void)CFX_addSticker:(NSObject *)a3 atDropTarget:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 fileURL];
  uint8_t v6 = [v5 path];
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_234C41000, a3, OS_LOG_TYPE_ERROR, "could not copy sticker file %@ to temporary directory. Error %@", (uint8_t *)&v7, 0x16u);
}

@end