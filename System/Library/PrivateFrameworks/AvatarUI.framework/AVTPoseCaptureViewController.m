@interface AVTPoseCaptureViewController
+ (CGRect)borderMaskRectForContentRect:(CGRect)a3;
- (AVTAvatarRecord)avatarRecord;
- (AVTCircularButton)discardButton;
- (AVTPoseCaptureViewController)initWithSelectedRecord:(id)a3 avtViewSessionProvider:(id)a4;
- (AVTPoseCaptureViewControllerDelegate)delegate;
- (AVTRecordingButton)captureButton;
- (AVTStickerConfiguration)adHocConfiguration;
- (AVTViewSession)avtViewSession;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (BOOL)allowFacetracking;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isModalInPresentation;
- (BOOL)shouldHideUserInfoView;
- (NSLayoutConstraint)captureButtonBottomAnchor;
- (NSLayoutConstraint)headerHeightConstraint;
- (NSLayoutConstraint)headerTopAnchor;
- (UIBarButtonItem)doneButton;
- (UIColor)backgroundColor;
- (UIImageView)snapshotImageView;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)avtViewContainer;
- (UIView)borderMaskView;
- (UIView)headerView;
- (id)postSessionDidBecomeActiveHandler;
- (int64_t)bottomPadding;
- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3;
- (int64_t)topPadding;
- (unint64_t)mode;
- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3;
- (void)beginUsingAVTViewFromSession:(id)a3;
- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5;
- (void)configureUserInfoLabel;
- (void)createCaptureButtonIfNeeded;
- (void)createDiscardButtonIfNeeded;
- (void)didTapAvatarView:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapCaptureButton:(id)a3;
- (void)didTapDone:(id)a3;
- (void)setAdHocConfiguration:(id)a3;
- (void)setAllowFacetracking:(BOOL)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setAvtViewContainer:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderMaskView:(id)a3;
- (void)setBottomPadding:(int64_t)a3;
- (void)setCaptureButton:(id)a3;
- (void)setCaptureButtonBottomAnchor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscardButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHeaderTopAnchor:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPostSessionDidBecomeActiveHandler:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setSnapshotImageView:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTopPadding:(int64_t)a3;
- (void)switchToCaptureMode;
- (void)switchToReviewMode:(id)a3;
- (void)updateAVTViewContainerFrame;
- (void)updateHeaderHeightConstraint;
- (void)updatePaddingConstant;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVTPoseCaptureViewController

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

- (AVTPoseCaptureViewController)initWithSelectedRecord:(id)a3 avtViewSessionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTPoseCaptureViewController;
  v9 = [(AVTPoseCaptureViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v10->_avtViewSessionProvider, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v61[8] = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)AVTPoseCaptureViewController;
  [(AVTPoseCaptureViewController *)&v60 viewDidLoad];
  v3 = [(AVTPoseCaptureViewController *)self backgroundColor];
  v4 = [(AVTPoseCaptureViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  headerView = self->_headerView;
  self->_headerView = v5;

  [(UIView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(AVTPoseCaptureViewController *)self view];
  [v7 addSubview:self->_headerView];

  id v8 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)self->_headerView setBackgroundColor:v8];

  id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
  v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  snapshotImageView = self->_snapshotImageView;
  self->_snapshotImageView = v10;

  [(UIImageView *)self->_snapshotImageView setContentMode:1];
  [(UIImageView *)self->_snapshotImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_snapshotImageView setHidden:1];
  [(UIImageView *)self->_snapshotImageView setAlpha:0.0];
  objc_super v12 = [(AVTPoseCaptureViewController *)self view];
  [v12 addSubview:self->_snapshotImageView];

  uint64_t v13 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel_];
  v14 = [(AVTPoseCaptureViewController *)self navigationItem];
  v59 = (void *)v13;
  [v14 setLeftBarButtonItem:v13];

  v15 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone_];
  doneButton = self->_doneButton;
  self->_doneButton = v15;

  v17 = self->_doneButton;
  v18 = [(AVTPoseCaptureViewController *)self navigationItem];
  [v18 setRightBarButtonItem:v17];

  [(AVTPoseCaptureViewController *)self updateHeaderHeightConstraint];
  [(AVTPoseCaptureViewController *)self updatePaddingConstant];
  v19 = [(UIView *)self->_headerView topAnchor];
  v20 = [(AVTPoseCaptureViewController *)self view];
  v21 = [v20 topAnchor];
  v22 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, (double)-[AVTPoseCaptureViewController topPadding](self, "topPadding"));
  [(AVTPoseCaptureViewController *)self setHeaderTopAnchor:v22];

  v58 = [(AVTPoseCaptureViewController *)self headerTopAnchor];
  v61[0] = v58;
  v56 = [(UIView *)self->_headerView leadingAnchor];
  v57 = [(AVTPoseCaptureViewController *)self view];
  v55 = [v57 leadingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v61[1] = v54;
  v52 = [(UIView *)self->_headerView trailingAnchor];
  v53 = [(AVTPoseCaptureViewController *)self view];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v61[2] = v50;
  v49 = [(AVTPoseCaptureViewController *)self headerHeightConstraint];
  v61[3] = v49;
  v48 = [(UIImageView *)self->_snapshotImageView heightAnchor];
  v47 = [(UIView *)self->_headerView heightAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v61[4] = v46;
  v45 = [(UIImageView *)self->_snapshotImageView widthAnchor];
  v23 = [(UIView *)self->_headerView widthAnchor];
  v24 = [v45 constraintEqualToAnchor:v23];
  v61[5] = v24;
  v25 = [(UIImageView *)self->_snapshotImageView centerXAnchor];
  v26 = [(UIView *)self->_headerView centerXAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v61[6] = v27;
  v28 = [(UIImageView *)self->_snapshotImageView centerYAnchor];
  v29 = [(UIView *)self->_headerView centerYAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v61[7] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:8];

  [MEMORY[0x263F08938] activateConstraints:v31];
  char v32 = AVTUIIsFacetrackingSupported();
  self->_allowFacetracking = v32;
  if (v32)
  {
    [(AVTPoseCaptureViewController *)self setMode:1];
    [(UIBarButtonItem *)self->_doneButton setEnabled:0];
  }
  else
  {
    [(AVTPoseCaptureViewController *)self setMode:0];
  }
  v33 = [MEMORY[0x263F1C920] mainScreen];
  [v33 scale];
  double v35 = v34;
  v36 = [MEMORY[0x263F1C920] mainScreen];
  [v36 nativeScale];
  double v38 = v37;

  if (v35 != v38)
  {
    id v39 = objc_alloc(MEMORY[0x263F1CB60]);
    v40 = objc_opt_class();
    v41 = [(AVTPoseCaptureViewController *)self view];
    [v41 bounds];
    objc_msgSend(v40, "borderMaskRectForContentRect:");
    v42 = (UIView *)objc_msgSend(v39, "initWithFrame:");
    borderMaskView = self->_borderMaskView;
    self->_borderMaskView = v42;

    v44 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)self->_borderMaskView setBackgroundColor:v44];

    [(UIView *)self->_headerView setMaskView:self->_borderMaskView];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTPoseCaptureViewController;
  [(AVTPoseCaptureViewController *)&v4 viewWillAppear:a3];
  [(AVTPoseCaptureViewController *)self beginAVTViewSessionWithDidBeginBlock:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTPoseCaptureViewController;
  [(AVTPoseCaptureViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(AVTPoseCaptureViewController *)self avtViewSession];
  [v4 tearDownWithCompletionHandler:0];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCaptureViewController;
  [(AVTPoseCaptureViewController *)&v3 viewWillLayoutSubviews];
  [(AVTPoseCaptureViewController *)self updateHeaderHeightConstraint];
  [(AVTPoseCaptureViewController *)self updatePaddingConstant];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCaptureViewController;
  [(AVTPoseCaptureViewController *)&v3 viewDidLayoutSubviews];
  [(AVTPoseCaptureViewController *)self updateAVTViewContainerFrame];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseCaptureViewController;
  id v7 = a4;
  -[AVTPoseCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(AVTPoseCaptureViewController *)self updatePaddingConstant];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__AVTPoseCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_263FF0400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __83__AVTPoseCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHeaderHeightConstraint];
  [*(id *)(a1 + 32) updateAVTViewContainerFrame];
  id v3 = [*(id *)(a1 + 32) avtViewSession];
  v2 = [v3 avtView];
  [v2 updateInterfaceOrientation];
}

- (void)updateHeaderHeightConstraint
{
  id v3 = [(AVTPoseCaptureViewController *)self view];
  [v3 frame];
  double v5 = v4;
  v6 = [(AVTPoseCaptureViewController *)self view];
  [v6 frame];
  BOOL v8 = v5 > v7;

  double v9 = dbl_20AFF1FA0[v8];
  v10 = [(AVTPoseCaptureViewController *)self headerHeightConstraint];

  if (v10)
  {
    id v12 = [(AVTPoseCaptureViewController *)self headerHeightConstraint];
    [v12 setConstant:v9];
  }
  else
  {
    id v12 = [(UIView *)self->_headerView heightAnchor];
    v11 = [v12 constraintEqualToConstant:v9];
    [(AVTPoseCaptureViewController *)self setHeaderHeightConstraint:v11];
  }
}

- (void)updatePaddingConstant
{
  id v3 = [(AVTPoseCaptureViewController *)self view];
  double v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  v6 = [(AVTPoseCaptureViewController *)self view];
  [v6 frame];
  double v8 = v7;

  double v9 = v8 * 0.08;
  if (v8 * 0.08 < 20.0) {
    double v9 = 20.0;
  }
  double v10 = v8 * 0.15;
  if (v8 * 0.15 < 20.0) {
    double v10 = 20.0;
  }
  if (v5 == 2) {
    double v11 = 44.0;
  }
  else {
    double v11 = v9;
  }
  if (v5 == 2) {
    double v12 = 78.0;
  }
  else {
    double v12 = v10;
  }
  uint64_t v13 = [(AVTPoseCaptureViewController *)self view];
  [v13 frame];
  double v15 = v14;
  v16 = [(AVTPoseCaptureViewController *)self view];
  [v16 frame];
  double v18 = v17;

  BOOL v19 = v15 <= v18;
  if (v15 <= v18) {
    double v20 = v12;
  }
  else {
    double v20 = 20.0;
  }
  if (v19) {
    double v21 = v11;
  }
  else {
    double v21 = 20.0;
  }
  [(AVTPoseCaptureViewController *)self setTopPadding:(uint64_t)v21];
  [(AVTPoseCaptureViewController *)self setBottomPadding:(uint64_t)v20];
  double v22 = (double)[(AVTPoseCaptureViewController *)self topPadding];
  v23 = [(AVTPoseCaptureViewController *)self view];
  [v23 safeAreaInsets];
  double v25 = v24 + v22;
  v26 = [(AVTPoseCaptureViewController *)self headerTopAnchor];
  [v26 setConstant:v25];

  double v27 = (double)-[(AVTPoseCaptureViewController *)self bottomPadding];
  id v28 = [(AVTPoseCaptureViewController *)self captureButtonBottomAnchor];
  [v28 setConstant:v27];
}

- (void)updateAVTViewContainerFrame
{
  id v3 = [(AVTPoseCaptureViewController *)self avtViewContainer];
  double v4 = [v3 superview];
  uint64_t v5 = [(AVTPoseCaptureViewController *)self headerView];

  if (v4 == v5)
  {
    id v15 = [(AVTPoseCaptureViewController *)self headerView];
    [v15 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(AVTPoseCaptureViewController *)self avtViewContainer];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  }
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode == a3) {
    return;
  }
  self->_mode = a3;
  switch(a3)
  {
    case 2uLL:
      [(AVTPoseCaptureViewController *)self createCaptureButtonIfNeeded];
      [(AVTPoseCaptureViewController *)self createDiscardButtonIfNeeded];
      double v4 = [(AVTPoseCaptureViewController *)self discardButton];
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      goto LABEL_8;
    case 1uLL:
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __40__AVTPoseCaptureViewController_setMode___block_invoke;
      v8[3] = &unk_263FF0428;
      objc_copyWeak(&v9, &location);
      [(AVTPoseCaptureViewController *)self beginAVTViewSessionWithDidBeginBlock:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      return;
    case 0uLL:
      double v4 = [(AVTPoseCaptureViewController *)self discardButton];
      uint64_t v5 = v4;
      uint64_t v6 = 1;
LABEL_8:
      [v4 setHidden:v6];

      id v7 = [(AVTPoseCaptureViewController *)self captureButton];
      [v7 setHidden:1];

      break;
  }
}

void __40__AVTPoseCaptureViewController_setMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained mode] == 1)
  {
    [WeakRetained createCaptureButtonIfNeeded];
    v1 = [WeakRetained discardButton];
    [v1 setHidden:1];

    v2 = [WeakRetained captureButton];
    [v2 setHidden:0];
  }
}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(AVTPoseCaptureViewController *)self avtViewSession];
  int v6 = [v5 isActive];

  if (v6)
  {
    if (v4)
    {
      id v7 = [(AVTPoseCaptureViewController *)self avtViewSession];
      v4[2](v4, v7);
    }
  }
  else
  {
    double v8 = [(AVTPoseCaptureViewController *)self postSessionDidBecomeActiveHandler];

    if (v8)
    {
      id v9 = [(AVTPoseCaptureViewController *)self postSessionDidBecomeActiveHandler];
      v9[2](v9, 0);
    }
    [(AVTPoseCaptureViewController *)self setPostSessionDidBecomeActiveHandler:v4];
    objc_initWeak(&location, self);
    double v10 = [(AVTPoseCaptureViewController *)self avtViewSessionProvider];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
    v14[3] = &unk_263FF0428;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
    v12[3] = &unk_263FF0450;
    objc_copyWeak(&v13, &location);
    double v11 = [v10 sessionWithDidBecomeActiveHandler:v14 tearDownHandler:v12];
    [(AVTPoseCaptureViewController *)self setAvtViewSession:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginUsingAVTViewFromSession:v6];
  double v4 = [WeakRetained postSessionDidBecomeActiveHandler];

  if (v4)
  {
    uint64_t v5 = [WeakRetained postSessionDidBecomeActiveHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [WeakRetained setPostSessionDidBecomeActiveHandler:0];
}

void __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  double v8 = [v20 avtViewContainer];
  id v9 = [WeakRetained tapGestureRecognizer];
  [v8 removeGestureRecognizer:v9];

  [WeakRetained setTapGestureRecognizer:0];
  double v10 = [WeakRetained avtViewSessionProvider];
  double v11 = [v10 faceTrackingManager];
  double v12 = [v11 userInfoView];

  uint64_t v13 = [v12 superview];
  if (v13)
  {
    double v14 = (void *)v13;
    id v15 = [v12 superview];
    v16 = [WeakRetained headerView];

    if (v15 == v16)
    {
      [v12 setTranslatesAutoresizingMaskIntoConstraints:1];
      [v12 removeFromSuperview];
    }
  }
  double v17 = [WeakRetained avtViewSessionProvider];
  double v18 = [v17 faceTrackingManager];
  [v18 setDelegate:0];

  BOOL v19 = [v20 avtViewContainer];
  [v19 removeFromSuperview];

  [WeakRetained setAvtViewSession:0];
  v6[2](v6);
}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 avtViewContainer];
  [(AVTPoseCaptureViewController *)self setAvtViewContainer:v5];

  id v6 = [(AVTPoseCaptureViewController *)self avtViewContainer];
  [v6 setAlpha:1.0];

  id v7 = [(AVTPoseCaptureViewController *)self headerView];
  double v8 = [(AVTPoseCaptureViewController *)self avtViewContainer];
  [v7 addSubview:v8];

  [(AVTPoseCaptureViewController *)self updateAVTViewContainerFrame];
  id v9 = [(AVTPoseCaptureViewController *)self avatarRecord];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__AVTPoseCaptureViewController_beginUsingAVTViewFromSession___block_invoke;
  v11[3] = &unk_263FF0478;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(AVTPoseCaptureViewController *)self configureAVTViewSession:v10 withAvatarRecord:v9 completionBlock:v11];
}

void __61__AVTPoseCaptureViewController_beginUsingAVTViewFromSession___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:*(void *)(a1 + 32) action:sel_didTapAvatarView_];
  [*(id *)(a1 + 32) setTapGestureRecognizer:v2];

  id v3 = [*(id *)(a1 + 40) avtViewContainer];
  id v4 = [*(id *)(a1 + 32) tapGestureRecognizer];
  [v3 addGestureRecognizer:v4];

  uint64_t v5 = [*(id *)(a1 + 32) avtViewSessionProvider];
  id v6 = [v5 faceTrackingManager];
  [v6 setFaceTrackingManagementPaused:0];

  id v7 = *(void **)(a1 + 32);
  double v8 = [v7 avtViewSessionProvider];
  id v9 = [v8 faceTrackingManager];
  [v9 setDelegate:v7];

  id v10 = [*(id *)(a1 + 32) avtViewSessionProvider];
  double v11 = [v10 faceTrackingManager];
  [v11 resumeFaceTrackingIfNeededAnimated:0];

  [*(id *)(a1 + 32) configureUserInfoLabel];
  id v12 = [*(id *)(a1 + 32) view];
  [v12 setNeedsLayout];
}

- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v19 avtView];
  [v10 updateInterfaceOrientation];

  uint64_t v11 = AVTUIShowTrackingLostReticle_once();
  id v12 = [v19 avtView];
  [v12 setEnableReticle:v11];

  BOOL allowFacetracking = self->_allowFacetracking;
  double v14 = [v19 avtView];
  [v14 setEnableFaceTracking:allowFacetracking];

  id v15 = [(AVTPoseCaptureViewController *)self backgroundColor];

  if (v15)
  {
    v16 = [(AVTPoseCaptureViewController *)self backgroundColor];
    double v17 = [v19 avtView];
    [v17 setBackgroundColor:v16];
  }
  double v18 = [v19 avtViewUpdater];
  [v18 setAvatarRecord:v9 completionHandler:v8];
}

- (void)configureUserInfoLabel
{
  v21[3] = *MEMORY[0x263EF8340];
  if (![(AVTPoseCaptureViewController *)self shouldHideUserInfoView]
    && self->_allowFacetracking)
  {
    id v3 = [(AVTPoseCaptureViewController *)self avtViewSessionProvider];
    id v4 = [v3 faceTrackingManager];
    uint64_t v5 = [v4 userInfoView];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(AVTPoseCaptureViewController *)self backgroundColor];
    [v5 setContainerBackgroundColor:v6];

    id v7 = [(AVTPoseCaptureViewController *)self headerView];
    [v7 addSubview:v5];

    id v19 = [v5 leadingAnchor];
    id v20 = [(AVTPoseCaptureViewController *)self headerView];
    double v18 = [v20 leadingAnchor];
    double v17 = [v19 constraintEqualToAnchor:v18];
    v21[0] = v17;
    id v8 = [v5 trailingAnchor];
    id v9 = [(AVTPoseCaptureViewController *)self headerView];
    id v10 = [v9 trailingAnchor];
    uint64_t v11 = [v8 constraintEqualToAnchor:v10];
    v21[1] = v11;
    id v12 = [v5 bottomAnchor];
    uint64_t v13 = [(AVTPoseCaptureViewController *)self headerView];
    double v14 = [v13 bottomAnchor];
    id v15 = [v12 constraintEqualToAnchor:v14];
    v21[2] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

    [MEMORY[0x263F08938] activateConstraints:v16];
  }
}

- (void)didTapAvatarView:(id)a3
{
  id v4 = [(AVTPoseCaptureViewController *)self avtViewSession];
  int v5 = [v4 isActive];

  if (v5)
  {
    id v7 = [(AVTPoseCaptureViewController *)self avtViewSessionProvider];
    id v6 = [v7 faceTrackingManager];
    [v6 resumeFaceTrackingIfNeededAnimated:1];
  }
}

- (void)createCaptureButtonIfNeeded
{
  v32[4] = *MEMORY[0x263EF8340];
  id v3 = [(AVTPoseCaptureViewController *)self captureButton];

  if (!v3)
  {
    id v4 = objc_alloc_init(AVTRecordingButton);
    [(AVTPoseCaptureViewController *)self setCaptureButton:v4];

    int v5 = [MEMORY[0x263F1C550] systemBlueColor];
    id v6 = [(AVTPoseCaptureViewController *)self captureButton];
    [v6 setCenterCircleColor:v5];

    id v7 = [(AVTPoseCaptureViewController *)self captureButton];
    [v7 setIgnoresLongPress:1];

    id v8 = [(AVTPoseCaptureViewController *)self captureButton];
    [v8 addTarget:self action:sel_didTapCaptureButton_ forControlEvents:64];

    id v9 = [(AVTPoseCaptureViewController *)self captureButton];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v10 = [(AVTPoseCaptureViewController *)self view];
    uint64_t v11 = [(AVTPoseCaptureViewController *)self captureButton];
    [v10 addSubview:v11];

    id v12 = [(AVTPoseCaptureViewController *)self captureButton];
    uint64_t v13 = [v12 bottomAnchor];
    double v14 = [(AVTPoseCaptureViewController *)self view];
    id v15 = [v14 bottomAnchor];
    v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, (double)--[AVTPoseCaptureViewController bottomPadding](self, "bottomPadding"));
    [(AVTPoseCaptureViewController *)self setCaptureButtonBottomAnchor:v16];

    v31 = [(AVTPoseCaptureViewController *)self captureButton];
    v30 = [v31 widthAnchor];
    v29 = [v30 constraintEqualToConstant:79.0];
    v32[0] = v29;
    id v28 = [(AVTPoseCaptureViewController *)self captureButton];
    double v27 = [v28 heightAnchor];
    double v17 = [(AVTPoseCaptureViewController *)self captureButton];
    double v18 = [v17 widthAnchor];
    id v19 = [v27 constraintEqualToAnchor:v18];
    v32[1] = v19;
    id v20 = [(AVTPoseCaptureViewController *)self captureButton];
    double v21 = [v20 centerXAnchor];
    double v22 = [(AVTPoseCaptureViewController *)self view];
    v23 = [v22 centerXAnchor];
    double v24 = [v21 constraintEqualToAnchor:v23];
    v32[2] = v24;
    double v25 = [(AVTPoseCaptureViewController *)self captureButtonBottomAnchor];
    v32[3] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];

    [MEMORY[0x263F08938] activateConstraints:v26];
  }
}

- (void)createDiscardButtonIfNeeded
{
  v33[4] = *MEMORY[0x263EF8340];
  id v3 = [(AVTPoseCaptureViewController *)self discardButton];

  if (!v3)
  {
    id v4 = [AVTCircularButton alloc];
    int v5 = -[AVTCircularButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AVTPoseCaptureViewController *)self setDiscardButton:v5];

    id v6 = [MEMORY[0x263F1C550] redColor];
    id v7 = [(AVTPoseCaptureViewController *)self discardButton];
    [v7 setTintColor:v6];

    char v32 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:38.0];
    id v8 = [(AVTPoseCaptureViewController *)self discardButton];
    [v8 setSymbolImageWithName:@"trash.fill" configuration:v32];

    id v9 = [(AVTPoseCaptureViewController *)self discardButton];
    [v9 addTarget:self action:sel_didTapDiscardButton_ forControlEvents:64];

    id v10 = [(AVTPoseCaptureViewController *)self discardButton];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v11 = [(AVTPoseCaptureViewController *)self view];
    id v12 = [(AVTPoseCaptureViewController *)self discardButton];
    [v11 addSubview:v12];

    v31 = [(AVTPoseCaptureViewController *)self discardButton];
    v30 = [v31 widthAnchor];
    v29 = [v30 constraintEqualToConstant:69.0];
    v33[0] = v29;
    id v28 = [(AVTPoseCaptureViewController *)self discardButton];
    v26 = [v28 heightAnchor];
    double v27 = [(AVTPoseCaptureViewController *)self discardButton];
    double v25 = [v27 widthAnchor];
    double v24 = [v26 constraintEqualToAnchor:v25];
    v33[1] = v24;
    v23 = [(AVTPoseCaptureViewController *)self discardButton];
    uint64_t v13 = [v23 centerXAnchor];
    double v14 = [(AVTPoseCaptureViewController *)self captureButton];
    id v15 = [v14 centerXAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v33[2] = v16;
    double v17 = [(AVTPoseCaptureViewController *)self discardButton];
    double v18 = [v17 centerYAnchor];
    id v19 = [(AVTPoseCaptureViewController *)self captureButton];
    id v20 = [v19 centerYAnchor];
    double v21 = [v18 constraintEqualToAnchor:v20];
    v33[3] = v21;
    double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];

    [MEMORY[0x263F08938] activateConstraints:v22];
  }
}

- (void)didTapCaptureButton:(id)a3
{
  id v4 = (void *)MEMORY[0x263F296E0];
  int v5 = [(AVTPoseCaptureViewController *)self avtViewSession];
  uint64_t v6 = [v5 avtView];
  id v7 = [(AVTPoseCaptureViewController *)self avtViewSession];
  id v8 = [v7 avtView];
  id v9 = [v4 snapshotAVTView:v6 matchingViewSize:v8 highQuality:1 logger:0];

  id v10 = [(AVTPoseCaptureViewController *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v11 = [(AVTPoseCaptureViewController *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__AVTPoseCaptureViewController_didTapCaptureButton___block_invoke;
    v12[3] = &unk_263FF0078;
    void v12[4] = self;
    [v11 poseCaptureViewController:self willCaptureAvatarImage:v9 completion:v12];
  }
  else
  {
    [(AVTPoseCaptureViewController *)self switchToReviewMode:v9];
  }
}

uint64_t __52__AVTPoseCaptureViewController_didTapCaptureButton___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) switchToReviewMode:a2];
}

- (void)switchToReviewMode:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(AVTPoseCaptureViewController *)self snapshotImageView];
  [v5 setImage:v4];

  uint64_t v6 = [(AVTPoseCaptureViewController *)self snapshotImageView];
  [v6 setHidden:0];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke;
  v20[3] = &unk_263FF03D8;
  v20[4] = self;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke_2;
  v19[3] = &unk_263FF04A0;
  v19[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v20 animations:v19 completion:0.4];
  id v7 = [(AVTPoseCaptureViewController *)self avtViewSession];
  id v8 = [v7 avtView];
  id v9 = [v8 avatar];
  id v10 = [v9 physicsState];

  double v21 = @"memoji";
  v22[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v12 = objc_alloc(MEMORY[0x263F29668]);
  uint64_t v13 = [(AVTPoseCaptureViewController *)self avtViewSession];
  double v14 = [v13 avtView];
  id v15 = [v14 avatar];
  v16 = [v15 pose];
  double v17 = (void *)[v12 initWithPose:v16 physicsStates:v11];

  double v18 = (void *)[objc_alloc(MEMORY[0x263F296C8]) initWithName:@"custom_capture" pose:v17 props:0 shaders:0 camera:0 options:0];
  [(AVTPoseCaptureViewController *)self setAdHocConfiguration:v18];

  [(AVTPoseCaptureViewController *)self setMode:2];
  [(UIBarButtonItem *)self->_doneButton setEnabled:1];
}

void __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) headerView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) snapshotImageView];
  [v3 setAlpha:1.0];
}

void __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) headerView];
    [v2 setHidden:1];
  }
}

- (void)switchToCaptureMode
{
  [(AVTPoseCaptureViewController *)self setMode:1];
  [(UIBarButtonItem *)self->_doneButton setEnabled:0];
  id v3 = [(AVTPoseCaptureViewController *)self headerView];
  [v3 setHidden:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke;
  v5[3] = &unk_263FF03D8;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke_2;
  v4[3] = &unk_263FF04A0;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:v4 completion:0.4];
}

void __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) headerView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) snapshotImageView];
  [v3 setAlpha:0.0];
}

void __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) snapshotImageView];
    [v3 setImage:0];

    id v4 = [*(id *)(a1 + 32) snapshotImageView];
    [v4 setHidden:1];
  }
}

- (void)didTapCancel:(id)a3
{
  id v4 = [(AVTPoseCaptureViewController *)self delegate];
  [v4 poseCaptureViewControllerDidCancel:self];
}

- (void)didTapDone:(id)a3
{
  id v6 = [(AVTPoseCaptureViewController *)self delegate];
  id v4 = [(AVTPoseCaptureViewController *)self adHocConfiguration];
  int v5 = [(AVTPoseCaptureViewController *)self avatarRecord];
  [v6 poseCaptureViewController:self didCapturePoseWithConfiguration:v4 avatar:v5];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  id v3 = [(AVTPoseCaptureViewController *)self view];
  id v4 = [v3 window];
  int64_t v5 = [v4 _windowInterfaceOrientation];

  return v5;
}

- (AVTPoseCaptureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTPoseCaptureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
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

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (UIView)avtViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avtViewContainer);
  return (UIView *)WeakRetained;
}

- (void)setAvtViewContainer:(id)a3
{
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_BOOL allowFacetracking = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void)setBorderMaskView:(id)a3
{
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

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (NSLayoutConstraint)headerTopAnchor
{
  return self->_headerTopAnchor;
}

- (void)setHeaderTopAnchor:(id)a3
{
}

- (int64_t)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(int64_t)a3
{
  self->_topPadding = a3;
}

- (NSLayoutConstraint)captureButtonBottomAnchor
{
  return self->_captureButtonBottomAnchor;
}

- (void)setCaptureButtonBottomAnchor:(id)a3
{
}

- (int64_t)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(int64_t)a3
{
  self->_bottomPadding = a3;
}

- (AVTStickerConfiguration)adHocConfiguration
{
  return self->_adHocConfiguration;
}

- (void)setAdHocConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adHocConfiguration, 0);
  objc_storeStrong((id *)&self->_captureButtonBottomAnchor, 0);
  objc_storeStrong((id *)&self->_headerTopAnchor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_discardButton, 0);
  objc_storeStrong((id *)&self->_captureButton, 0);
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_destroyWeak((id *)&self->_avtViewContainer);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end