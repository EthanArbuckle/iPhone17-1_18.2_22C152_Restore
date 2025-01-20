@interface AVTPoseSelectionViewController
+ (CGRect)borderMaskRectForContentRect:(CGRect)a3;
+ (id)poseConfigurationsForTypes:(unint64_t)a3 avatarRecord:(id)a4;
- (AVTAnimojiPoseSelectionHeaderViewController)headerViewController;
- (AVTAvatarRecord)avatarRecord;
- (AVTCircularButton)discardButton;
- (AVTCircularButton)menuButton;
- (AVTPoseSelectionGridViewController)gridViewController;
- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3;
- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseConfigurations:(id)a4;
- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseTypes:(unint64_t)a4;
- (AVTPoseSelectionViewControllerDelegate)delegate;
- (AVTRecordingButton)captureButton;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldNotifyDelegateOnSelection;
- (BOOL)usesSingleButtonCaptureReview;
- (NSArray)stickerConfigurations;
- (NSLayoutConstraint)headerHeightConstraint;
- (UIBarButtonItem)doneButton;
- (UIMenu)headerMenu;
- (UIView)borderMaskView;
- (UIView)headerDropShadowView;
- (double)buttonEdgeLength;
- (double)buttonSymbolWeight;
- (double)captureButtonEdgeLength;
- (double)discardButtonEdgeLength;
- (double)discardButtonSymbolWeight;
- (id)keyCommands;
- (id)selectedPoseConfiguration;
- (unint64_t)mode;
- (unint64_t)poseTypes;
- (void)animateButtonConfiguration:(id)a3;
- (void)clearHeaderMenu;
- (void)configureButtonsForCapture;
- (void)configureButtonsForReview;
- (void)createCaptureButtonIfNeeded;
- (void)createDiscardButtonIfNeeded;
- (void)createMenuButtonIfNeeded;
- (void)didFinishMenuPresentationWithCompletion:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapCaptureButton:(id)a3;
- (void)didTapDiscardButton:(id)a3;
- (void)notifyDelegateOfModeChange:(unint64_t)a3;
- (void)notifyDelegateOfSelectedPose;
- (void)poseSelectionGridController:(id)a3 didSelectConfiguration:(id)a4;
- (void)poseSelectionGridControllerDidSelectCameraItem:(id)a3;
- (void)prepareForMenuPresentation;
- (void)returnPressed:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setBorderMaskView:(id)a3;
- (void)setCaptureButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscardButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setGridViewController:(id)a3;
- (void)setHeaderDropShadowView:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHeaderMenu:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setMenuButton:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNewAvatarRecord:(id)a3;
- (void)setPoseTypes:(unint64_t)a3;
- (void)setShouldNotifyDelegateOnSelection:(BOOL)a3;
- (void)setStickerConfigurations:(id)a3;
- (void)setUsesSingleButtonCaptureReview:(BOOL)a3;
- (void)updateForPoseConfiguration:(id)a3 animated:(BOOL)a4;
- (void)updateHeaderHeightConstraint;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVTPoseSelectionViewController

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

+ (id)poseConfigurationsForTypes:(unint64_t)a3 avatarRecord:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263EFF980] array];
  v7 = [MEMORY[0x263EFF980] array];
  if (a3 != 1)
  {
    v8 = (void *)MEMORY[0x263F29700];
    if (a3 != 2) {
      goto LABEL_5;
    }
    [v6 addObject:*MEMORY[0x263F29700]];
  }
  v8 = (void *)MEMORY[0x263F296E8];
LABEL_5:
  [v6 addObject:*v8];
  if (AVTUIShowPrereleaseStickerPack_once())
  {
    v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = AVTPrereleaseStickerPackForStickerPack();
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v9 = v6;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        int v22 = objc_msgSend(v5, "isEditable", (void)v28);
        v23 = (void *)MEMORY[0x263F296C8];
        if (v22)
        {
          v24 = [MEMORY[0x263F296C8] stickerConfigurationsForMemojiInStickerPack:v21];
          [v7 addObjectsFromArray:v24];
        }
        else
        {
          v24 = [v5 identifier];
          v25 = [v23 stickerConfigurationsForAnimojiNamed:v24 inStickerPack:v21];
          [v7 addObjectsFromArray:v25];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  v26 = (void *)[v7 copy];
  return v26;
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3
{
  return [(AVTPoseSelectionViewController *)self initWithSelectedRecord:a3 poseTypes:0];
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseTypes:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() poseConfigurationsForTypes:a4 avatarRecord:v6];
  v8 = [(AVTPoseSelectionViewController *)self initWithSelectedRecord:v6 poseConfigurations:v7];

  return v8;
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseConfigurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTPoseSelectionViewController;
  v9 = [(AVTPoseSelectionViewController *)&v13 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v10->_stickerConfigurations, a4);
    headerMenu = v10->_headerMenu;
    v10->_headerMenu = 0;
  }
  return v10;
}

- (void)viewDidLoad
{
  v118[12] = *MEMORY[0x263EF8340];
  v117.receiver = self;
  v117.super_class = (Class)AVTPoseSelectionViewController;
  [(AVTPoseSelectionViewController *)&v117 viewDidLoad];
  v3 = [(AVTPoseSelectionViewController *)self navigationItem];
  [v3 _setBackgroundHidden:1];

  v4 = [(AVTPoseSelectionViewController *)self navigationController];
  id v5 = [v4 navigationBar];
  char v6 = [v5 isTranslucent];

  if ((v6 & 1) == 0) {
    [(AVTPoseSelectionViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
  id v7 = [(AVTPoseSelectionViewController *)self navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  id v8 = [AVTAnimojiPoseSelectionHeaderViewController alloc];
  v9 = [(AVTPoseSelectionViewController *)self avatarRecord];
  id v10 = [(AVTAnimojiPoseSelectionHeaderViewController *)v8 initWithRecord:v9];
  headerViewController = self->_headerViewController;
  self->_headerViewController = v10;

  uint64_t v12 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(AVTPoseSelectionViewController *)self addChildViewController:self->_headerViewController];
  objc_super v13 = [(AVTPoseSelectionViewController *)self view];
  v14 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  [v13 addSubview:v14];

  [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController didMoveToParentViewController:self];
  BOOL v15 = [(AVTPoseSelectionViewController *)self allowsCameraCapture];
  id v16 = [AVTPoseSelectionGridViewController alloc];
  uint64_t v17 = [(AVTPoseSelectionViewController *)self avatarRecord];
  uint64_t v18 = [(AVTPoseSelectionViewController *)self stickerConfigurations];
  BOOL v73 = v15;
  uint64_t v19 = [(AVTPoseSelectionGridViewController *)v16 initWithAvatarRecord:v17 poseConfigurations:v18 allowsCameraCapture:v15];
  gridViewController = self->_gridViewController;
  self->_gridViewController = v19;

  [(AVTPoseSelectionGridViewController *)self->_gridViewController setDelegate:self];
  uint64_t v21 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(AVTPoseSelectionViewController *)self addChildViewController:self->_gridViewController];
  int v22 = [(AVTPoseSelectionViewController *)self view];
  v23 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  [v22 addSubview:v23];

  [(AVTPoseSelectionGridViewController *)self->_gridViewController didMoveToParentViewController:self];
  id v24 = objc_alloc(MEMORY[0x263F1CB60]);
  v25 = (UIView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  headerDropShadowView = self->_headerDropShadowView;
  self->_headerDropShadowView = v25;

  v27 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.25];
  [(UIView *)self->_headerDropShadowView setBackgroundColor:v27];

  [(UIView *)self->_headerDropShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v28 = [(AVTPoseSelectionViewController *)self view];
  [v28 addSubview:self->_headerDropShadowView];

  long long v29 = [MEMORY[0x263F1C920] mainScreen];
  [v29 scale];
  double v31 = v30;
  long long v32 = [MEMORY[0x263F1C920] mainScreen];
  [v32 nativeScale];
  double v34 = v33;

  if (v31 != v34)
  {
    id v35 = objc_alloc(MEMORY[0x263F1CB60]);
    v36 = objc_opt_class();
    v37 = [(AVTPoseSelectionViewController *)self view];
    [v37 bounds];
    objc_msgSend(v36, "borderMaskRectForContentRect:");
    uint64_t v38 = (UIView *)objc_msgSend(v35, "initWithFrame:");
    borderMaskView = self->_borderMaskView;
    self->_borderMaskView = v38;

    v40 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)self->_borderMaskView setBackgroundColor:v40];

    v41 = self->_borderMaskView;
    v42 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
    [v42 setMaskView:v41];
  }
  uint64_t v43 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel_];
  v44 = [(AVTPoseSelectionViewController *)self navigationItem];
  v116 = (void *)v43;
  [v44 setLeftBarButtonItem:v43];

  id v45 = objc_alloc(MEMORY[0x263F1C468]);
  v46 = AVTAvatarUIBundle();
  v47 = [v46 localizedStringForKey:@"NEXT" value:&stru_26BF058D0 table:@"Localized"];
  v48 = (UIBarButtonItem *)[v45 initWithTitle:v47 style:2 target:self action:sel_didTapDone_];
  doneButton = self->_doneButton;
  self->_doneButton = v48;

  v50 = self->_doneButton;
  v51 = [(AVTPoseSelectionViewController *)self navigationItem];
  [v51 setRightBarButtonItem:v50];

  v52 = [(AVTPoseSelectionViewController *)self view];
  v53 = [v52 window];
  v54 = [v53 screen];
  [v54 scale];
  double v56 = v55;

  if (v56 <= 0.0) {
    double v57 = 1.0;
  }
  else {
    double v57 = 1.0 / v56;
  }
  [(AVTPoseSelectionViewController *)self updateHeaderHeightConstraint];
  v115 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  v113 = [v115 topAnchor];
  v114 = [(AVTPoseSelectionViewController *)self view];
  v112 = [v114 topAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v118[0] = v111;
  v110 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  v108 = [v110 leadingAnchor];
  v109 = [(AVTPoseSelectionViewController *)self view];
  v107 = [v109 leadingAnchor];
  v106 = [v108 constraintEqualToAnchor:v107];
  v118[1] = v106;
  v105 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  v103 = [v105 trailingAnchor];
  v104 = [(AVTPoseSelectionViewController *)self view];
  v102 = [v104 trailingAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v118[2] = v101;
  v100 = [(AVTPoseSelectionViewController *)self headerHeightConstraint];
  v118[3] = v100;
  v98 = [(UIView *)self->_headerDropShadowView leadingAnchor];
  v99 = [(AVTPoseSelectionViewController *)self view];
  v97 = [v99 leadingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v118[4] = v96;
  v94 = [(UIView *)self->_headerDropShadowView trailingAnchor];
  v95 = [(AVTPoseSelectionViewController *)self view];
  v93 = [v95 trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v118[5] = v92;
  v90 = [(UIView *)self->_headerDropShadowView topAnchor];
  v91 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  v89 = [v91 bottomAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v118[6] = v88;
  v87 = [(UIView *)self->_headerDropShadowView heightAnchor];
  v86 = [v87 constraintEqualToConstant:v57];
  v118[7] = v86;
  v85 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  v83 = [v85 topAnchor];
  v84 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
  v82 = [v84 bottomAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v118[8] = v81;
  v80 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  v78 = [v80 leadingAnchor];
  v79 = [(AVTPoseSelectionViewController *)self view];
  v77 = [v79 leadingAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v118[9] = v76;
  v75 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  v74 = [v75 trailingAnchor];
  v58 = [(AVTPoseSelectionViewController *)self view];
  v59 = [v58 trailingAnchor];
  v60 = [v74 constraintEqualToAnchor:v59];
  v118[10] = v60;
  v61 = [(AVTPoseSelectionGridViewController *)self->_gridViewController view];
  v62 = [v61 bottomAnchor];
  v63 = [(AVTPoseSelectionViewController *)self view];
  v64 = [v63 bottomAnchor];
  v65 = [v62 constraintEqualToAnchor:v64];
  v118[11] = v65;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:12];

  [MEMORY[0x263F08938] activateConstraints:v66];
  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || (int IsGreenTea = AVTDeviceIsGreenTea(), !v73) || IsGreenTea)
  {
    [(AVTPoseSelectionViewController *)self setMode:0];
    v68 = [(AVTPoseSelectionViewController *)self stickerConfigurations];
    v69 = [v68 objectAtIndexedSubscript:0];
    v70 = [(AVTPoseSelectionViewController *)self gridViewController];
    [v70 setSelectedStickerConfiguration:v69];

    v71 = [(AVTPoseSelectionViewController *)self stickerConfigurations];
    v72 = [v71 objectAtIndexedSubscript:0];
    [(AVTPoseSelectionViewController *)self updateForPoseConfiguration:v72 animated:0];
  }
  else
  {
    [(AVTPoseSelectionViewController *)self setMode:1];
    [(UIBarButtonItem *)self->_doneButton setEnabled:0];
  }
}

- (void)setNewAvatarRecord:(id)a3
{
  id v5 = (AVTAvatarRecord *)a3;
  if (self->_avatarRecord != v5)
  {
    objc_storeStrong((id *)&self->_avatarRecord, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__AVTPoseSelectionViewController_setNewAvatarRecord___block_invoke;
    v7[3] = &unk_263FF03B0;
    objc_copyWeak(&v9, &location);
    char v6 = v5;
    id v8 = v6;
    [(AVTPoseSelectionViewController *)self didFinishMenuPresentationWithCompletion:v7];
    if (self->_menuButton) {
      [(AVTCircularButton *)self->_menuButton setHidden:[(AVTAvatarRecord *)v6 isEditable] ^ 1];
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __53__AVTPoseSelectionViewController_setNewAvatarRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [(id)objc_opt_class() poseConfigurationsForTypes:0 avatarRecord:*(void *)(a1 + 32)];
  [WeakRetained setStickerConfigurations:v2];

  v3 = [WeakRetained gridViewController];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained stickerConfigurations];
  [v3 updateWithAvatarRecord:v4 stickerConfigurations:v5];

  uint64_t v6 = [WeakRetained mode];
  id v7 = [WeakRetained headerViewController];
  [v7 updateForAvatarRecord:*(void *)(a1 + 32) discardPose:v6 == 0];

  id v8 = WeakRetained;
  if (!v6)
  {
    id v9 = [WeakRetained doneButton];
    [v9 setEnabled:0];

    if ([WeakRetained allowsCameraCapture] && (AVTDeviceIsGreenTea() & 1) == 0)
    {
      [WeakRetained setMode:1];
      uint64_t v11 = [WeakRetained gridViewController];
      [v11 setSelectedStickerConfiguration:0];
    }
    else
    {
      id v10 = [WeakRetained stickerConfigurations];
      uint64_t v11 = [v10 firstObject];

      uint64_t v12 = [WeakRetained headerViewController];
      [v12 updateForStickerConfiguration:v11 animated:0];

      objc_super v13 = [WeakRetained gridViewController];
      [v13 setSelectedStickerConfiguration:v11];

      [WeakRetained notifyDelegateOfSelectedPose];
    }

    id v8 = WeakRetained;
  }
}

- (id)keyCommands
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_didTapCancel_];
  uint64_t v4 = [v3 _nonRepeatableKeyCommand];
  [v2 addObject:v4];

  id v5 = (void *)MEMORY[0x263F1C708];
  uint64_t v6 = [NSString stringWithFormat:@"\r"];
  id v7 = [v5 keyCommandWithInput:v6 modifierFlags:0 action:sel_returnPressed_];

  id v8 = [v7 _nonRepeatableKeyCommand];
  [v2 addObject:v8];

  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionViewController;
  id v7 = a4;
  -[AVTPoseSelectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__AVTPoseSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_263FF0400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __85__AVTPoseSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeaderHeightConstraint];
}

- (void)updateHeaderHeightConstraint
{
  v3 = [(AVTPoseSelectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  uint64_t v6 = [(AVTPoseSelectionViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  double v9 = 336.0;
  if (v5 > v8) {
    double v9 = 162.666667;
  }
  double v10 = fmax(v9, 272.0);
  uint64_t v11 = [(AVTPoseSelectionViewController *)self headerHeightConstraint];

  if (v11)
  {
    id v14 = [(AVTPoseSelectionViewController *)self headerHeightConstraint];
    [v14 setConstant:v10];
  }
  else
  {
    id v14 = [(AVTAnimojiPoseSelectionHeaderViewController *)self->_headerViewController view];
    uint64_t v12 = [v14 heightAnchor];
    objc_super v13 = [v12 constraintEqualToConstant:v10];
    [(AVTPoseSelectionViewController *)self setHeaderHeightConstraint:v13];
  }
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        objc_initWeak(&location, self);
        double v7 = [(AVTPoseSelectionViewController *)self headerViewController];
        uint64_t v8 = MEMORY[0x263EF8330];
        uint64_t v9 = 3221225472;
        double v10 = __42__AVTPoseSelectionViewController_setMode___block_invoke;
        uint64_t v11 = &unk_263FF09D8;
        objc_copyWeak(&v12, &location);
        [v7 beginFaceTrackingWithCompletionBlock:&v8];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else if (!a3)
      {
        double v5 = [(AVTPoseSelectionViewController *)self discardButton];
        [v5 setHidden:1];

        uint64_t v6 = [(AVTPoseSelectionViewController *)self captureButton];
        [v6 setHidden:1];
LABEL_8:
      }
      -[AVTPoseSelectionViewController notifyDelegateOfModeChange:](self, "notifyDelegateOfModeChange:", a3, v8, v9, v10, v11);
      return;
    }
    [(AVTPoseSelectionViewController *)self createCaptureButtonIfNeeded];
    [(AVTPoseSelectionViewController *)self createDiscardButtonIfNeeded];
    [(AVTPoseSelectionViewController *)self configureButtonsForReview];
    uint64_t v6 = [(AVTPoseSelectionViewController *)self headerViewController];
    [v6 pauseFaceTracking];
    goto LABEL_8;
  }
}

void __42__AVTPoseSelectionViewController_setMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained mode] == 1)
  {
    [WeakRetained createCaptureButtonIfNeeded];
    [WeakRetained configureButtonsForCapture];
  }
}

- (void)configureButtonsForReview
{
  CGAffineTransformMakeScale(&v6, 0.75, 0.75);
  v3 = [(AVTPoseSelectionViewController *)self discardButton];
  CGAffineTransform v5 = v6;
  [v3 setTransform:&v5];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__AVTPoseSelectionViewController_configureButtonsForReview__block_invoke;
  v4[3] = &unk_263FF03D8;
  v4[4] = self;
  [(AVTPoseSelectionViewController *)self animateButtonConfiguration:v4];
}

void __59__AVTPoseSelectionViewController_configureButtonsForReview__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) discardButton];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v9[0] = *MEMORY[0x263F000D0];
  v9[1] = v3;
  v9[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v9];

  CGAffineTransformMakeScale(&v8, 0.5, 0.5);
  double v4 = [*(id *)(a1 + 32) captureButton];
  CGAffineTransform v7 = v8;
  [v4 setTransform:&v7];

  CGAffineTransform v5 = [*(id *)(a1 + 32) captureButton];
  [v5 setHidden:1];

  CGAffineTransform v6 = [*(id *)(a1 + 32) discardButton];
  [v6 setHidden:0];
}

- (void)configureButtonsForCapture
{
  CGAffineTransformMakeScale(&v7, 0.5, 0.5);
  long long v3 = [(AVTPoseSelectionViewController *)self captureButton];
  CGAffineTransform v6 = v7;
  [v3 setTransform:&v6];

  double v4 = [(AVTPoseSelectionViewController *)self captureButton];
  [v4 setHidden:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__AVTPoseSelectionViewController_configureButtonsForCapture__block_invoke;
  v5[3] = &unk_263FF03D8;
  v5[4] = self;
  [(AVTPoseSelectionViewController *)self animateButtonConfiguration:v5];
}

void __60__AVTPoseSelectionViewController_configureButtonsForCapture__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v8, 0.5, 0.5);
  v2 = [*(id *)(a1 + 32) discardButton];
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];

  long long v3 = [*(id *)(a1 + 32) captureButton];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v6[0] = *MEMORY[0x263F000D0];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v6];

  CGAffineTransform v5 = [*(id *)(a1 + 32) discardButton];
  [v5 setHidden:1];
}

- (void)animateButtonConfiguration:(id)a3
{
  long long v3 = (objc_class *)MEMORY[0x263F1C9B0];
  id v4 = a3;
  id v6 = (id)objc_msgSend([v3 alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 32.0, 0.0, 0.0);
  CGAffineTransform v5 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v6 timingParameters:0.4];
  [v5 addAnimations:v4];

  [v5 startAnimation];
}

- (void)createCaptureButtonIfNeeded
{
  v32[4] = *MEMORY[0x263EF8340];
  long long v3 = [(AVTPoseSelectionViewController *)self captureButton];

  if (!v3)
  {
    id v4 = objc_alloc_init(AVTRecordingButton);
    [(AVTPoseSelectionViewController *)self setCaptureButton:v4];

    CGAffineTransform v5 = [MEMORY[0x263F1C550] systemBlueColor];
    id v6 = [(AVTPoseSelectionViewController *)self captureButton];
    [v6 setCenterCircleColor:v5];

    CGAffineTransform v7 = [(AVTPoseSelectionViewController *)self captureButton];
    [v7 setIgnoresLongPress:1];

    CGAffineTransform v8 = [(AVTPoseSelectionViewController *)self captureButton];
    [v8 addTarget:self action:sel_didTapCaptureButton_ forControlEvents:64];

    uint64_t v9 = [(AVTPoseSelectionViewController *)self captureButton];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v10 = [(AVTPoseSelectionViewController *)self view];
    uint64_t v11 = [(AVTPoseSelectionViewController *)self captureButton];
    [v10 addSubview:v11];

    double v31 = [(AVTPoseSelectionViewController *)self captureButton];
    double v30 = [v31 widthAnchor];
    [(AVTPoseSelectionViewController *)self captureButtonEdgeLength];
    long long v29 = objc_msgSend(v30, "constraintEqualToConstant:");
    v32[0] = v29;
    long long v28 = [(AVTPoseSelectionViewController *)self captureButton];
    v26 = [v28 heightAnchor];
    v27 = [(AVTPoseSelectionViewController *)self captureButton];
    v25 = [v27 widthAnchor];
    id v24 = [v26 constraintEqualToAnchor:v25];
    v32[1] = v24;
    v23 = [(AVTPoseSelectionViewController *)self captureButton];
    int v22 = [v23 bottomAnchor];
    id v12 = [(AVTPoseSelectionViewController *)self headerViewController];
    objc_super v13 = [v12 view];
    id v14 = [v13 bottomAnchor];
    BOOL v15 = [v22 constraintEqualToAnchor:v14 constant:-20.0];
    v32[2] = v15;
    id v16 = [(AVTPoseSelectionViewController *)self captureButton];
    uint64_t v17 = [v16 trailingAnchor];
    uint64_t v18 = [(AVTPoseSelectionViewController *)self view];
    uint64_t v19 = [v18 trailingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19 constant:-20.0];
    v32[3] = v20;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];

    [MEMORY[0x263F08938] activateConstraints:v21];
  }
}

- (void)createDiscardButtonIfNeeded
{
  long long v3 = [(AVTPoseSelectionViewController *)self discardButton];

  if (!v3)
  {
    id v4 = [AVTCircularButton alloc];
    CGAffineTransform v5 = -[AVTCircularButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AVTPoseSelectionViewController *)self setDiscardButton:v5];

    id v6 = [(AVTPoseSelectionViewController *)self discardButton];
    [v6 addTarget:self action:sel_didTapDiscardButton_ forControlEvents:64];

    CGAffineTransform v7 = [(AVTPoseSelectionViewController *)self discardButton];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    CGAffineTransform v8 = (void *)MEMORY[0x263F1C6C8];
    [(AVTPoseSelectionViewController *)self discardButtonSymbolWeight];
    objc_msgSend(v8, "configurationWithPointSize:weight:", 5);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_usesSingleButtonCaptureReview)
    {
      uint64_t v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
      double v10 = [(AVTPoseSelectionViewController *)self discardButton];
      [v10 setTintColor:v9];

      uint64_t v11 = [(AVTPoseSelectionViewController *)self discardButton];
      [v11 setSymbolImageWithName:@"gobackward" configuration:v40];

      id v12 = [(AVTPoseSelectionViewController *)self discardButton];
      objc_super v13 = [MEMORY[0x263F1C550] systemBlueColor];
      [v12 setSymbolTintColor:v13];
    }
    else
    {
      id v14 = [MEMORY[0x263F1C550] redColor];
      BOOL v15 = [(AVTPoseSelectionViewController *)self discardButton];
      [v15 setTintColor:v14];

      id v12 = [(AVTPoseSelectionViewController *)self discardButton];
      [v12 setSymbolImageWithName:@"trash.fill" configuration:v40];
    }

    id v16 = [(AVTPoseSelectionViewController *)self view];
    uint64_t v17 = [(AVTPoseSelectionViewController *)self discardButton];
    [v16 addSubview:v17];

    id v38 = objc_alloc(MEMORY[0x263EFF980]);
    v37 = [(AVTPoseSelectionViewController *)self discardButton];
    v36 = [v37 widthAnchor];
    [(AVTPoseSelectionViewController *)self discardButtonEdgeLength];
    uint64_t v18 = objc_msgSend(v36, "constraintEqualToConstant:");
    id v35 = [(AVTPoseSelectionViewController *)self discardButton];
    double v34 = [v35 heightAnchor];
    uint64_t v19 = [(AVTPoseSelectionViewController *)self discardButton];
    v20 = [v19 widthAnchor];
    uint64_t v21 = [v34 constraintEqualToAnchor:v20];
    int v22 = [(AVTPoseSelectionViewController *)self discardButton];
    v23 = [v22 centerYAnchor];
    id v24 = [(AVTPoseSelectionViewController *)self captureButton];
    v25 = [v24 centerYAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    v39 = objc_msgSend(v38, "initWithObjects:", v18, v21, v26, 0);

    if (self->_usesSingleButtonCaptureReview || self->_headerMenu)
    {
      v27 = [(AVTPoseSelectionViewController *)self discardButton];
      long long v28 = [v27 centerXAnchor];
      long long v29 = [(AVTPoseSelectionViewController *)self captureButton];
      double v30 = [v29 centerXAnchor];
      double v31 = [v28 constraintEqualToAnchor:v30];
      long long v32 = v39;
      [v39 addObject:v31];
    }
    else
    {
      v27 = [(AVTPoseSelectionViewController *)self discardButton];
      long long v28 = [v27 leadingAnchor];
      long long v29 = [(AVTPoseSelectionViewController *)self headerViewController];
      double v30 = [v29 view];
      double v31 = [v30 leadingAnchor];
      double v33 = [v28 constraintEqualToAnchor:v31 constant:20.0];
      [v39 addObject:v33];

      long long v32 = v39;
    }

    [MEMORY[0x263F08938] activateConstraints:v32];
  }
}

- (void)createMenuButtonIfNeeded
{
  v38[4] = *MEMORY[0x263EF8340];
  if (!self->_menuButton)
  {
    long long v3 = [AVTCircularButton alloc];
    id v4 = -[AVTCircularButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    menuButton = self->_menuButton;
    self->_menuButton = v4;

    id v6 = [MEMORY[0x263F1C550] secondarySystemFillColor];
    [(AVTCircularButton *)self->_menuButton setTintColor:v6];

    [(AVTCircularButton *)self->_menuButton setShowsMenuAsPrimaryAction:1];
    CGAffineTransform v7 = (void *)MEMORY[0x263F1C6C8];
    [(AVTPoseSelectionViewController *)self buttonSymbolWeight];
    v37 = objc_msgSend(v7, "configurationWithPointSize:weight:", 5);
    [(AVTCircularButton *)self->_menuButton setSymbolImageWithName:@"ellipsis" configuration:v37];
    CGAffineTransform v8 = self->_menuButton;
    uint64_t v9 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(AVTCircularButton *)v8 setSymbolTintColor:v9];

    [(AVTCircularButton *)self->_menuButton setTranslatesAutoresizingMaskIntoConstraints:0];
    double v10 = [(AVTPoseSelectionViewController *)self view];
    uint64_t v11 = [(AVTPoseSelectionViewController *)self menuButton];
    [v10 addSubview:v11];

    [(AVTPoseSelectionViewController *)self buttonEdgeLength];
    double v13 = v12;
    [(AVTPoseSelectionViewController *)self captureButtonEdgeLength];
    double v15 = (v14 - v13) * 0.5 + 20.0;
    v36 = [(AVTPoseSelectionViewController *)self menuButton];
    id v35 = [v36 widthAnchor];
    double v34 = [v35 constraintEqualToConstant:v13];
    v38[0] = v34;
    double v33 = [(AVTPoseSelectionViewController *)self menuButton];
    double v31 = [v33 heightAnchor];
    long long v32 = [(AVTPoseSelectionViewController *)self menuButton];
    double v30 = [v32 widthAnchor];
    long long v29 = [v31 constraintEqualToAnchor:v30];
    v38[1] = v29;
    long long v28 = [(AVTPoseSelectionViewController *)self menuButton];
    v26 = [v28 bottomAnchor];
    v27 = [(AVTPoseSelectionViewController *)self headerViewController];
    id v16 = [v27 view];
    uint64_t v17 = [v16 bottomAnchor];
    uint64_t v18 = [v26 constraintEqualToAnchor:v17 constant:-v15];
    v38[2] = v18;
    uint64_t v19 = [(AVTPoseSelectionViewController *)self menuButton];
    v20 = [v19 leadingAnchor];
    uint64_t v21 = [(AVTPoseSelectionViewController *)self view];
    int v22 = [v21 leadingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:20.0];
    v38[3] = v23;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];

    [MEMORY[0x263F08938] activateConstraints:v25];
    id v24 = [[AVTTouchDownGestureRecognizer alloc] initWithTarget:self action:sel_prepareForMenuPresentation];
    [(AVTCircularButton *)self->_menuButton addGestureRecognizer:v24];
  }
}

- (double)buttonSymbolWeight
{
  int IsMacOrIPad = AVTDeviceIsMacOrIPad();
  double result = 18.0;
  if (IsMacOrIPad) {
    return 31.0;
  }
  return result;
}

- (double)discardButtonSymbolWeight
{
  if (self->_usesSingleButtonCaptureReview)
  {
    int IsMacOrIPad = AVTDeviceIsMacOrIPad();
    double result = 32.0;
    if (IsMacOrIPad) {
      return 56.0;
    }
  }
  else
  {
    [(AVTPoseSelectionViewController *)self buttonSymbolWeight];
  }
  return result;
}

- (double)buttonEdgeLength
{
  int IsMacOrIPad = AVTDeviceIsMacOrIPad();
  double result = 32.0;
  if (IsMacOrIPad) {
    return 56.0;
  }
  return result;
}

- (double)discardButtonEdgeLength
{
  if (self->_usesSingleButtonCaptureReview) {
    [(AVTPoseSelectionViewController *)self captureButtonEdgeLength];
  }
  else {
    [(AVTPoseSelectionViewController *)self buttonEdgeLength];
  }
  return result;
}

- (double)captureButtonEdgeLength
{
  int IsMacOrIPad = AVTDeviceIsMacOrIPad();
  double result = 52.0;
  if (IsMacOrIPad) {
    return 72.0;
  }
  return result;
}

- (void)setHeaderMenu:(id)a3
{
  CGAffineTransform v5 = (UIMenu *)a3;
  if (self->_headerMenu != v5)
  {
    id v6 = v5;
    if (v5)
    {
      [(AVTPoseSelectionViewController *)self createMenuButtonIfNeeded];
      objc_storeStrong((id *)&self->_headerMenu, a3);
      [(AVTCircularButton *)self->_menuButton setMenu:self->_headerMenu];
      [(AVTCircularButton *)self->_menuButton setHidden:[(AVTAvatarRecord *)self->_avatarRecord isEditable] ^ 1];
    }
    else
    {
      [(AVTPoseSelectionViewController *)self clearHeaderMenu];
    }
    CGAffineTransform v5 = v6;
  }
}

- (void)clearHeaderMenu
{
  menuButton = self->_menuButton;
  if (menuButton)
  {
    [(AVTCircularButton *)menuButton removeFromSuperview];
    id v4 = self->_menuButton;
    self->_menuButton = 0;
  }
  headerMenu = self->_headerMenu;
  self->_headerMenu = 0;
}

- (void)prepareForMenuPresentation
{
  headerViewController = self->_headerViewController;
  id v3 = [MEMORY[0x263F1C550] clearColor];
  [(AVTAnimojiPoseSelectionHeaderViewController *)headerViewController setCaptureBackgroundColor:v3];
}

- (void)didFinishMenuPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke;
  block[3] = &unk_263FF0A28;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained headerViewController];
  [v3 setCaptureBackgroundColor:0];

  if (*(void *)(a1 + 32))
  {
    dispatch_time_t v4 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke_2;
    block[3] = &unk_263FF0A00;
    id v6 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didTapCaptureButton:(id)a3
{
  [(AVTPoseSelectionViewController *)self setMode:2];
  doneButton = self->_doneButton;
  [(UIBarButtonItem *)doneButton setEnabled:1];
}

- (void)didTapDiscardButton:(id)a3
{
  [(AVTPoseSelectionViewController *)self setMode:1];
  doneButton = self->_doneButton;
  [(UIBarButtonItem *)doneButton setEnabled:0];
}

- (void)didTapCancel:(id)a3
{
  id v4 = [(AVTPoseSelectionViewController *)self delegate];
  [v4 poseSelectionControllerDidCancel:self];
}

- (void)returnPressed:(id)a3
{
  id v4 = a3;
  if ([(UIBarButtonItem *)self->_doneButton isEnabled]) {
    [(AVTPoseSelectionViewController *)self didTapDone:v4];
  }
}

- (void)notifyDelegateOfSelectedPose
{
  id v4 = [(AVTPoseSelectionViewController *)self selectedPoseConfiguration];
  id v3 = [(AVTPoseSelectionViewController *)self delegate];
  [v3 poseSelectionController:self didSelectPoseWithConfiguration:v4];
}

- (id)selectedPoseConfiguration
{
  id v3 = [(AVTPoseSelectionViewController *)self gridViewController];
  id v4 = [v3 selectedStickerConfiguration];

  if (!v4)
  {
    id v5 = [(AVTPoseSelectionViewController *)self headerViewController];
    id v4 = (void *)[v5 newStickerConfigurationFromCurrentPose];
  }
  return v4;
}

- (void)notifyDelegateOfModeChange:(unint64_t)a3
{
  id v5 = [(AVTPoseSelectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (a3 == 1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [(AVTPoseSelectionViewController *)self selectedPoseConfiguration];
    }
    id v9 = (id)v7;
    id v8 = [(AVTPoseSelectionViewController *)self delegate];
    [v8 poseSelectionController:self didSetMode:a3 withConfiguration:v9];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseSelectionViewController;
  [(AVTPoseSelectionViewController *)&v3 viewWillLayoutSubviews];
  [(AVTPoseSelectionViewController *)self updateHeaderHeightConstraint];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTPoseSelectionViewController;
  [(AVTPoseSelectionViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(AVTPoseSelectionViewController *)self headerViewController];
  [v4 endFaceTracking];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTPoseSelectionViewController;
  [(AVTPoseSelectionViewController *)&v5 viewWillAppear:a3];
  if ([(AVTPoseSelectionViewController *)self mode] == 1)
  {
    id v4 = [(AVTPoseSelectionViewController *)self headerViewController];
    [v4 beginFaceTrackingWithCompletionBlock:0];
  }
}

- (void)updateForPoseConfiguration:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  double v10 = __70__AVTPoseSelectionViewController_updateForPoseConfiguration_animated___block_invoke;
  uint64_t v11 = &unk_263FF0A50;
  objc_copyWeak(&v13, &location);
  id v7 = v6;
  id v12 = v7;
  BOOL v14 = a4;
  [(AVTPoseSelectionViewController *)self didFinishMenuPresentationWithCompletion:&v8];
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __70__AVTPoseSelectionViewController_updateForPoseConfiguration_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained headerViewController];
  [v2 updateForStickerConfiguration:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)poseSelectionGridControllerDidSelectCameraItem:(id)a3
{
  [(AVTPoseSelectionViewController *)self setMode:1];
  doneButton = self->_doneButton;
  [(UIBarButtonItem *)doneButton setEnabled:0];
}

- (void)poseSelectionGridController:(id)a3 didSelectConfiguration:(id)a4
{
  id v5 = a4;
  [(AVTPoseSelectionViewController *)self setMode:0];
  [(AVTPoseSelectionViewController *)self updateForPoseConfiguration:v5 animated:1];

  if ([(AVTPoseSelectionViewController *)self shouldNotifyDelegateOnSelection])
  {
    [(AVTPoseSelectionViewController *)self notifyDelegateOfSelectedPose];
  }
}

- (AVTPoseSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTPoseSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)poseTypes
{
  return self->_poseTypes;
}

- (void)setPoseTypes:(unint64_t)a3
{
  self->_poseTypes = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTRecordingButton)captureButton
{
  return self->_captureButton;
}

- (void)setCaptureButton:(id)a3
{
}

- (AVTCircularButton)discardButton
{
  return self->_discardButton;
}

- (void)setDiscardButton:(id)a3
{
}

- (AVTCircularButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAnimojiPoseSelectionHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
}

- (AVTPoseSelectionGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (NSArray)stickerConfigurations
{
  return self->_stickerConfigurations;
}

- (void)setStickerConfigurations:(id)a3
{
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)setHeaderDropShadowView:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void)setBorderMaskView:(id)a3
{
}

- (UIMenu)headerMenu
{
  return self->_headerMenu;
}

- (BOOL)shouldNotifyDelegateOnSelection
{
  return self->_shouldNotifyDelegateOnSelection;
}

- (void)setShouldNotifyDelegateOnSelection:(BOOL)a3
{
  self->_shouldNotifyDelegateOnSelection = a3;
}

- (BOOL)usesSingleButtonCaptureReview
{
  return self->_usesSingleButtonCaptureReview;
}

- (void)setUsesSingleButtonCaptureReview:(BOOL)a3
{
  self->_usesSingleButtonCaptureReview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerMenu, 0);
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_stickerConfigurations, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_discardButton, 0);
  objc_storeStrong((id *)&self->_captureButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end