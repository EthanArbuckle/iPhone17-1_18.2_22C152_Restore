@interface ICDocCamImageQuadEditViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)didAdjustQuad;
- (BOOL)didCallCompletion;
- (BOOL)didPressSave;
- (BOOL)inCaptureMode;
- (BOOL)invisibleButtonContainer;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAdjustForApectFitIfNecessary;
- (BOOL)showImageAsAspectFit;
- (CAShapeLayer)overlayMask;
- (CGRect)imageFrameInOverlayCoordinates;
- (CGRect)rectAvailableForDefaultRect;
- (CGRect)unitImageRectForOverlayRect:(CGRect)a3;
- (DCScanDataDelegate)scanDataDelegate;
- (ICDocCamImageQuad)initialQuad;
- (ICDocCamImageQuad)quad;
- (ICDocCamImageQuadEditImageView)backgroundImageView;
- (ICDocCamImageQuadEditImageView)imageView;
- (ICDocCamImageQuadEditOverlay)overlay;
- (ICDocCamImageQuadEditViewController)initWithImage:(id)a3 quad:(id)a4 scanDataDelegate:(id)a5 orientation:(int64_t)a6 completionHandler:(id)a7;
- (NSLayoutConstraint)buttonContainerHeightConstraint;
- (NSNumber)startOrientationIsPortrait;
- (UIBezierPath)overlayMaskPath;
- (UIButton)cancelButton;
- (UIButton)saveButton;
- (UIColor)knobColor;
- (UIImage)image;
- (UILabel)userPromptLabel;
- (UIScrollView)scrollView;
- (UIView)buttonContainer;
- (UIView)placard;
- (double)currentZoomFactorForOverlay;
- (double)knobHeight;
- (id)adjustedQuad;
- (id)completionHandler;
- (id)finalQuad;
- (id)finalQuadFromOverlay;
- (id)quadForOverlay;
- (id)quadForOverlay:(id)a3;
- (id)uiInitialQuadForOverlay:(id)a3;
- (id)uiQuadForOverlay:(id)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)orientation;
- (void)applicationWillResignActive:(id)a3;
- (void)callCompletionHandler:(BOOL)a3 withImage:(id)a4 quad:(id)a5 preparingForDismissal:(BOOL)a6;
- (void)cancelButtonPressed:(id)a3;
- (void)centerAndScaleImageInScrollView;
- (void)dealloc;
- (void)overlayDidLayout:(id)a3;
- (void)prepareForDismissal;
- (void)saveButtonPressed:(id)a3;
- (void)scanWasDeleted:(id)a3;
- (void)selectedKnobDidChange:(id)a3;
- (void)selectedKnobDidPanToRect:(CGRect)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setButtonContainer:(id)a3;
- (void)setButtonContainerHeightConstraint:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDidAdjustQuad:(BOOL)a3;
- (void)setDidCallCompletion:(BOOL)a3;
- (void)setDidPressSave:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setInCaptureMode:(BOOL)a3;
- (void)setInitialQuad:(id)a3;
- (void)setInvisibleButtonContainer:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlay:(id)a3;
- (void)setOverlayMask:(id)a3;
- (void)setOverlayMaskPath:(id)a3;
- (void)setPlacard:(id)a3;
- (void)setQuad:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldAdjustForApectFitIfNecessary:(BOOL)a3;
- (void)setShowImageAsAspectFit:(BOOL)a3;
- (void)setStartOrientationIsPortrait:(id)a3;
- (void)setUpImageView;
- (void)setUserPromptLabel:(id)a3;
- (void)setupAccessibility;
- (void)updateButtonTitles;
- (void)updateFonts;
- (void)updateOverlayScrimMask;
- (void)updateToAspectFitIfNecessary;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICDocCamImageQuadEditViewController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamImageQuadEditViewController;
  [(ICDocCamImageQuadEditViewController *)&v4 dealloc];
}

- (ICDocCamImageQuadEditViewController)initWithImage:(id)a3 quad:(id)a4 scanDataDelegate:(id)a5 orientation:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v40.receiver = self;
  v40.super_class = (Class)ICDocCamImageQuadEditViewController;
  v18 = [(ICDocCamImageQuadEditViewController *)&v40 initWithNibName:0 bundle:v17];

  if (!v18) {
    goto LABEL_16;
  }
  if (!v13)
  {
    v19 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v19);
    }

    if (v16) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    v20 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v20);
    }
  }
LABEL_11:
  uint64_t v21 = [v14 copy];
  quad = v18->_quad;
  v18->_quad = (ICDocCamImageQuad *)v21;

  v23 = v18->_quad;
  if (!v23)
  {
    v24 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v24);
    }

    +[ICDocCamImageQuad quadFromCGRect:](ICDocCamImageQuad, "quadFromCGRect:", 0.05, 0.05, 0.9, 0.9);
    v25 = (ICDocCamImageQuad *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuad flipPointsWithSourceFrame:](v25, "flipPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
    v26 = v18->_quad;
    v18->_quad = v25;

    v23 = v18->_quad;
  }
  -[ICDocCamImageQuad clampQuadToRect:](v23, "clampQuadToRect:", 0.0, 0.0, 1.0, 1.0);
  v18->_orientation = a6;
  -[ICDocCamImageQuad applyOrientation:boundingBox:](v18->_quad, "applyOrientation:boundingBox:", a6, 0.0, 0.0, 1.0, 1.0);
  uint64_t v27 = [v14 copy];
  initialQuad = v18->_initialQuad;
  v18->_initialQuad = (ICDocCamImageQuad *)v27;

  -[ICDocCamImageQuad clampQuadToRect:](v18->_initialQuad, "clampQuadToRect:", 0.0, 0.0, 1.0, 1.0);
  -[ICDocCamImageQuad applyOrientation:boundingBox:](v18->_initialQuad, "applyOrientation:boundingBox:", v18->_orientation, 0.0, 0.0, 1.0, 1.0);
  objc_storeStrong((id *)&v18->_image, a3);
  uint64_t v29 = [v16 copy];
  id completionHandler = v18->_completionHandler;
  v18->_id completionHandler = (id)v29;

  v18->_invisibleButtonContainer = 0;
  v31 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  overlayMask = v18->_overlayMask;
  v18->_overlayMask = v31;

  id v33 = [MEMORY[0x263F1C550] whiteColor];
  -[CAShapeLayer setFillColor:](v18->_overlayMask, "setFillColor:", [v33 CGColor]);

  v34 = (UIBezierPath *)objc_alloc_init(MEMORY[0x263F1C478]);
  overlayMaskPath = v18->_overlayMaskPath;
  v18->_overlayMaskPath = v34;

  objc_storeStrong((id *)&v18->_scanDataDelegate, a5);
  v18->_shouldAdjustForApectFitIfNecessary = 1;
  [(ICDocCamImageQuadEditOverlay *)v18->_overlay knobHeight];
  v18->_knobHeight = v36;
  uint64_t v37 = [(ICDocCamImageQuadEditOverlay *)v18->_overlay knobColor];
  knobColor = v18->_knobColor;
  v18->_knobColor = (UIColor *)v37;

  v18->_didPressSave = 0;
  v18->_didCallCompletion = 0;
  [(ICDocCamImageQuadEditViewController *)v18 setModalPresentationStyle:0];
LABEL_16:

  return v18;
}

- (void)viewDidLoad
{
  v60[3] = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)ICDocCamImageQuadEditViewController;
  [(ICDocCamImageQuadEditViewController *)&v59 viewDidLoad];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "dc_editBackgroundColor");
  objc_super v4 = [(ICDocCamImageQuadEditViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(ICDocCamImageQuadEditViewController *)self setUpImageView];
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  v6 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v6 frame];
  v7 = objc_msgSend(v5, "initWithFrame:");

  v8 = [(ICDocCamImageQuadEditViewController *)self backgroundImageView];
  [v7 addSubview:v8];

  v9 = [(ICDocCamImageQuadEditViewController *)self imageView];
  v58 = v7;
  [v7 addSubview:v9];

  v10 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  v11 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  [v11 setBackgroundColor:v10];

  v12 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v12 setMinimumZoomScale:0.01];

  id v13 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v13 setMaximumZoomScale:20.0];

  id v14 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  v19 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v19, "setContentSize:", v16, v18);

  v20 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v20 addSubview:v7];

  uint64_t v21 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v21 setDelegate:self];

  v22 = [(ICDocCamImageQuadEditViewController *)self quad];
  v23 = [(ICDocCamImageQuadEditViewController *)self overlay];
  [v23 setQuad:v22];

  v24 = [(ICDocCamImageQuadEditViewController *)self overlay];
  [v24 setDelegate:self];

  v25 = [(ICDocCamImageQuadEditViewController *)self overlay];
  v26 = [(ICDocCamImageQuadEditViewController *)self image];
  objc_msgSend(v25, "setImage:orientation:", v26, -[ICDocCamImageQuadEditViewController orientation](self, "orientation"));

  uint64_t v27 = [(ICDocCamImageQuadEditViewController *)self buttonContainerHeightConstraint];
  [v27 constant];
  double v29 = v28;

  v57 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  v55 = [v57 topAnchor];
  v56 = [(ICDocCamImageQuadEditViewController *)self view];
  v54 = [v56 safeAreaLayoutGuide];
  v53 = [v54 bottomAnchor];
  v52 = [v55 constraintEqualToAnchor:v53 constant:-v29];
  v60[0] = v52;
  v51 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  v49 = [v51 leadingAnchor];
  v50 = [(ICDocCamImageQuadEditViewController *)self view];
  v30 = [v50 safeAreaLayoutGuide];
  v31 = [v30 leadingAnchor];
  v32 = [v49 constraintEqualToAnchor:v31];
  v60[1] = v32;
  id v33 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  v34 = [v33 trailingAnchor];
  v35 = [(ICDocCamImageQuadEditViewController *)self view];
  double v36 = [v35 safeAreaLayoutGuide];
  uint64_t v37 = [v36 trailingAnchor];
  v38 = [v34 constraintEqualToAnchor:v37];
  v60[2] = v38;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];

  [MEMORY[0x263F08938] activateConstraints:v48];
  [(ICDocCamImageQuadEditViewController *)self updateButtonTitles];
  v39 = [(ICDocCamImageQuadEditViewController *)self placard];
  objc_super v40 = [v39 layer];
  [v40 setCornerRadius:4.0];

  v41 = [MEMORY[0x263F08A00] defaultCenter];
  [v41 addObserver:self selector:sel_scanWasDeleted_ name:@"DCScanWasDeletedNotification" object:0];

  v42 = [MEMORY[0x263F08A00] defaultCenter];
  [v42 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  v43 = [MEMORY[0x263F08A00] defaultCenter];
  [v43 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  [(ICDocCamImageQuadEditViewController *)self setupAccessibility];
  v44 = [(ICDocCamImageQuadEditViewController *)self cancelButton];
  id v45 = objc_alloc_init(MEMORY[0x263F1C878]);
  [v44 addInteraction:v45];

  v46 = [(ICDocCamImageQuadEditViewController *)self saveButton];
  id v47 = objc_alloc_init(MEMORY[0x263F1C878]);
  [v46 addInteraction:v47];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id v5 = [(ICDocCamImageQuadEditViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];

  [(ICDocCamImageQuadEditViewController *)self updateFonts];
  [(ICDocCamImageQuadEditViewController *)self setDidCallCompletion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ICDocCamImageQuadEditViewController;
  [(ICDocCamImageQuadEditViewController *)&v16 viewDidAppear:a3];
  objc_super v4 = [(ICDocCamImageQuadEditViewController *)self view];
  uint64_t v5 = [v4 window];
  uint64_t v6 = [(id)v5 interfaceOrientation];

  v7 = [(ICDocCamImageQuadEditViewController *)self startOrientationIsPortrait];
  LOBYTE(v5) = [v7 BOOLValue];

  if ((v5 & 1) == 0)
  {
    v8 = [NSNumber numberWithBool:(unint64_t)(v6 - 1) < 2];
    [(ICDocCamImageQuadEditViewController *)self setStartOrientationIsPortrait:v8];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke;
  v13[3] = &unk_2642A9450;
  objc_copyWeak(&v14, &location);
  dc_dispatchMainAfterDelay(v13, 5.0);
  v9 = [(ICDocCamImageQuadEditViewController *)self overlay];
  v10 = [v9 accessibilityElements];
  v11 = [v10 firstObject];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v11);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_4;
  v12[3] = &unk_2642A9250;
  v12[4] = self;
  dc_dispatchMainAfterDelay(v12, 1.0);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained placard];
  [v2 alpha];
  if (v3 == 0.0)
  {
  }
  else
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v4 placard];
    char v6 = [v5 isHidden];

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x263F1CB60];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_2;
      v11[3] = &unk_2642A9450;
      objc_copyWeak(&v12, v1);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_3;
      v9[3] = &unk_2642A9D60;
      objc_copyWeak(&v10, v1);
      [v7 animateWithDuration:v11 animations:v9 completion:0.5];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
    }
  }
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained placard];
  [v1 setAlpha:0.0];
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained placard];
  [v1 setHidden:1];
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_4(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CDC8];
  id v3 = [*(id *)(a1 + 32) userPromptLabel];
  v2 = [v3 text];
  UIAccessibilityPostNotification(v1, v2);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setInCaptureMode:(BOOL)a3
{
  self->_inCaptureMode = a3;
  [(ICDocCamImageQuadEditViewController *)self updateButtonTitles];
}

- (void)setUpImageView
{
  id v15 = [(ICDocCamImageQuadEditViewController *)self image];
  id v3 = [ICDocCamImageQuadEditImageView alloc];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[ICDocCamImageQuadEditImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  v9 = -[ICDocCamImageQuadEditImageView initWithFrame:]([ICDocCamImageQuadEditImageView alloc], "initWithFrame:", v4, v5, v6, v7);
  [(ICDocCamImageQuadEditImageView *)v8 setImage:v15 orientation:[(ICDocCamImageQuadEditViewController *)self orientation]];
  [(ICDocCamImageQuadEditImageView *)v9 setImage:v15 orientation:[(ICDocCamImageQuadEditViewController *)self orientation]];
  char matched = dc_clockwiseRotationsFromUpToMatchOrientation([(ICDocCamImageQuadEditViewController *)self orientation]);
  [v15 size];
  double v12 = v11;
  [v15 size];
  if (matched) {
    double v14 = v12;
  }
  else {
    double v14 = v13;
  }
  if (matched) {
    double v12 = v13;
  }
  -[ICDocCamImageQuadEditImageView setFrame:](v8, "setFrame:", 0.0, 0.0, v12, v14);
  -[ICDocCamImageQuadEditImageView setFrame:](v9, "setFrame:", 0.0, 0.0, v12, v14);
  [(ICDocCamImageQuadEditViewController *)self setImageView:v8];
  [(ICDocCamImageQuadEditViewController *)self setBackgroundImageView:v9];
  [(ICDocCamImageQuadEditImageView *)v9 setImageOpacity:0.7];
}

- (void)updateButtonTitles
{
  id v8 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  id v3 = +[DCLocalization localizedStringForKey:@"Done" value:@"Done" table:@"Localizable"];
  if ([(ICDocCamImageQuadEditViewController *)self inCaptureMode])
  {
    uint64_t v4 = +[DCLocalization localizedStringForKey:@"Retake" value:@"Retake" table:@"Localizable"];

    uint64_t v5 = +[DCLocalization localizedStringForKey:@"Keep Scan" value:@"Keep Scan" table:@"Localizable"];

    id v8 = (id)v4;
    id v3 = (void *)v5;
  }
  double v6 = [(ICDocCamImageQuadEditViewController *)self cancelButton];
  [v6 setTitle:v8 forState:0];

  double v7 = [(ICDocCamImageQuadEditViewController *)self saveButton];
  [v7 setTitle:v3 forState:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(ICDocCamImageQuadEditViewController *)self adjustedQuad];
  [(ICDocCamImageQuadEditViewController *)self setQuad:v8];

  if ([v7 isAnimated])
  {
    v9 = [(ICDocCamImageQuadEditViewController *)self overlay];
    [v9 unselectAllKnobs];

    id v10 = [(ICDocCamImageQuadEditViewController *)self overlay];
    [v10 setHidden:1];

    double v11 = [(ICDocCamImageQuadEditViewController *)self imageView];
    double v12 = [(ICDocCamImageQuadEditViewController *)self imageView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = [(ICDocCamImageQuadEditViewController *)self imageView];
    v22 = [v21 superview];
    objc_msgSend(v11, "convertRect:toView:", v22, v14, v16, v18, v20);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    v31 = -[ICDocCamImageQuadEditOverlay initWithFrame:]([ICDocCamImageQuadEditOverlay alloc], "initWithFrame:", v24, v26, v28, v30);
    [(ICDocCamImageQuadEditOverlay *)v31 setAutoresizingMask:18];
    [(ICDocCamImageQuadEditOverlay *)v31 setIsTempOverlay:1];
    v32 = [(ICDocCamImageQuadEditViewController *)self overlay];
    -[ICDocCamImageQuadEditOverlay setTempOverlayQuadIsValid:](v31, "setTempOverlayQuadIsValid:", [v32 isQuadValid]);

    id v33 = [(ICDocCamImageQuadEditViewController *)self adjustedQuad];
    [(ICDocCamImageQuadEditOverlay *)v31 setQuad:v33];

    [(ICDocCamImageQuadEditOverlay *)v31 setDelegate:self];
    [(ICDocCamImageQuadEditOverlay *)v31 setImage:0 orientation:[(ICDocCamImageQuadEditViewController *)self orientation]];
    v34 = [(ICDocCamImageQuadEditViewController *)self imageView];
    v35 = [v34 superview];
    [v35 addSubview:v31];

    double v36 = [(ICDocCamImageQuadEditViewController *)self scrollView];
    [v36 zoomScale];
    -[ICDocCamImageQuadEditOverlay setTempOverlayMagnification:animationDuration:](v31, "setTempOverlayMagnification:animationDuration:");

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v41[3] = &unk_2642A9D88;
    v41[4] = self;
    v42 = v31;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v39[3] = &unk_2642A9D88;
    v39[4] = self;
    objc_super v40 = v42;
    uint64_t v37 = v42;
    [v7 animateAlongsideTransition:v41 completion:v39];
  }
  v38.receiver = self;
  v38.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v38, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if (([v3 showImageAsAspectFit] & 1) == 0)
  {
    [*(id *)(a1 + 32) setShouldAdjustForApectFitIfNecessary:1];
    [*(id *)(a1 + 32) updateToAspectFitIfNecessary];
  }
  uint64_t v5 = *(void **)(a1 + 40);
  double v6 = [*(id *)(a1 + 32) scrollView];
  [v6 zoomScale];
  double v8 = v7;
  [v4 transitionDuration];
  double v10 = v9;

  [v5 setTempOverlayMagnification:v8 animationDuration:v10];
  id v11 = [*(id *)(a1 + 32) view];
  [v11 setNeedsUpdateConstraints];
}

uint64_t __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) overlay];
  [v2 setHidden:0];

  id v3 = *(void **)(a1 + 40);

  return [v3 removeFromSuperview];
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamImageQuadEditViewController;
  [(ICDocCamImageQuadEditViewController *)&v20 viewDidLayoutSubviews];
  [(ICDocCamImageQuadEditViewController *)self centerAndScaleImageInScrollView];
  id v3 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v3 frame];
  double v5 = v4;
  double v6 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v6 frame];
  double v8 = v7;

  double v9 = [(ICDocCamImageQuadEditViewController *)self view];
  [v9 frame];
  double v11 = v10;
  double v12 = [(ICDocCamImageQuadEditViewController *)self view];
  [v12 frame];
  double v14 = v13;

  if ((unint64_t)([(UIViewController *)self dc_effectiveInterfaceOrientation]
                        - 3) > 1
    || (float v15 = v11 / v14 * 100.0, v16 = v5 / v8 * 100.0, (float)(roundf(v16) / 100.0) >= (float)(roundf(v15) / 100.0)))
  {
    double v17 = objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
    double v18 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
    [v18 setBackgroundColor:v17];
    uint64_t v19 = 0;
  }
  else
  {
    double v17 = [MEMORY[0x263F1C550] clearColor];
    double v18 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
    [v18 setBackgroundColor:v17];
    uint64_t v19 = 1;
  }

  [(ICDocCamImageQuadEditViewController *)self setInvisibleButtonContainer:v19];
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
  [v3 unselectAllKnobs];
}

- (CGRect)unitImageRectForOverlayRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(ICDocCamImageQuadEditViewController *)self overlay];
  double v9 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(ICDocCamImageQuadEditViewController *)self imageView];
  uint64_t v19 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v18, "convertRect:fromView:", v19, v11, v13, v15, v17);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  double v28 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v28 frame];
  DCTSDNormalizedSubrectInRect(v21, v23, v25, v27);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (CGRect)imageFrameInOverlayCoordinates
{
  id v3 = [(ICDocCamImageQuadEditViewController *)self imageView];
  double v4 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v3, "convertRect:toView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [(ICDocCamImageQuadEditViewController *)self overlay];
  CGFloat v23 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (double)currentZoomFactorForOverlay
{
  v2 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v2 zoomScale];
  double v4 = v3;

  return v4;
}

- (id)quadForOverlay:(id)a3
{
  id v4 = a3;
  double v5 = [(ICDocCamImageQuadEditViewController *)self quad];

  if (v5)
  {
    uint64_t v6 = [(ICDocCamImageQuadEditViewController *)self uiQuadForOverlay:v4];
  }
  else
  {
    double v7 = [(ICDocCamImageQuadEditViewController *)self overlay];
    [v7 frame];
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    double v16 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
    [v16 frame];
    double v21 = DCTSDRectSubtractingRect(v9, v11, v13, v15, v17, v18, v19, v20);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    double v28 = DCTSDCenterOfRect(v21, v23, v25, v27);
    if (v25 >= v27) {
      double v30 = v27;
    }
    else {
      double v30 = v25;
    }
    uint64_t v6 = +[ICDocCamImageQuad quadFromCGRect:DCTSDRectWithCenterAndSize(v28, v29, v30 * 0.8)];
  }
  double v31 = (void *)v6;

  return v31;
}

- (CGRect)rectAvailableForDefaultRect
{
  double v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
  [v3 frame];
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  [v12 frame];
  double v17 = DCTSDRectSubtractingRect(v5, v7, v9, v11, v13, v14, v15, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)selectedKnobDidChange:(id)a3
{
  double v5 = [(ICDocCamImageQuadEditViewController *)self view];
  if (a3) {
    [(ICDocCamImageQuadEditViewController *)self overlay];
  }
  else {
  double v6 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  }
  [v5 bringSubviewToFront:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke;
  v8[3] = &unk_2642A9250;
  v8[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke_2;
  v7[3] = &unk_2642A92E8;
  v7[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v8 animations:v7 completion:0.15];
}

void __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) placard];
  [v1 setAlpha:0.0];
}

void __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) placard];
  [v1 setHidden:1];
}

- (void)selectedKnobDidPanToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(ICDocCamImageQuadEditViewController *)self overlay];
  CGFloat v9 = [(ICDocCamImageQuadEditViewController *)self view];
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);

  double v10 = [(ICDocCamImageQuadEditViewController *)self buttonContainer];
  [v10 frame];
  v24.origin.double x = v11;
  v24.origin.double y = v12;
  v24.size.double width = v13;
  v24.size.double height = v14;
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  BOOL v15 = CGRectIntersectsRect(v23, v24);

  if (![(ICDocCamImageQuadEditViewController *)self invisibleButtonContainer])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__ICDocCamImageQuadEditViewController_selectedKnobDidPanToRect___block_invoke;
    v21[3] = &unk_2642A9DB0;
    v21[4] = self;
    BOOL v22 = v15;
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v21 options:0 animations:0.25 completion:0.0];
  }
  [(ICDocCamImageQuadEditViewController *)self setDidAdjustQuad:1];
  double v16 = [(ICDocCamImageQuadEditViewController *)self overlay];
  uint64_t v17 = [v16 isQuadValid];

  double v18 = [(ICDocCamImageQuadEditViewController *)self saveButton];
  [v18 setEnabled:v17];

  if (v17) {
    double v19 = 1.0;
  }
  else {
    double v19 = 0.5;
  }
  double v20 = [(ICDocCamImageQuadEditViewController *)self saveButton];
  [v20 setAlpha:v19];

  [(ICDocCamImageQuadEditViewController *)self updateOverlayScrimMask];
}

void __64__ICDocCamImageQuadEditViewController_selectedKnobDidPanToRect___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) buttonContainer];
  [v2 setAlpha:v1];
}

- (void)overlayDidLayout:(id)a3
{
  [a3 unselectAllKnobs];

  [(ICDocCamImageQuadEditViewController *)self updateOverlayScrimMask];
}

- (void)updateOverlayScrimMask
{
  double v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
  double v4 = [v3 adjustedQuad];
  double v5 = [(ICDocCamImageQuadEditViewController *)self overlay];
  double v6 = [(ICDocCamImageQuadEditViewController *)self imageView];
  id v25 = [v4 quadByConvertingFromView:v5 toView:v6 isNormalized:0];

  CGFloat v7 = [(ICDocCamImageQuadEditViewController *)self overlayMaskPath];
  [v7 removeAllPoints];
  [v25 topLeft];
  objc_msgSend(v7, "moveToPoint:");
  [v25 topRight];
  objc_msgSend(v7, "addLineToPoint:");
  [v25 bottomRight];
  objc_msgSend(v7, "addLineToPoint:");
  [v25 bottomLeft];
  objc_msgSend(v7, "addLineToPoint:");
  [v7 closePath];
  double v8 = [(ICDocCamImageQuadEditViewController *)self imageView];
  CGFloat v9 = [v8 layer];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(ICDocCamImageQuadEditViewController *)self overlayMask];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  id v19 = v7;
  uint64_t v20 = [v19 CGPath];
  double v21 = [(ICDocCamImageQuadEditViewController *)self overlayMask];
  [v21 setPath:v20];

  BOOL v22 = [(ICDocCamImageQuadEditViewController *)self overlayMask];
  CGRect v23 = [(ICDocCamImageQuadEditViewController *)self imageView];
  CGRect v24 = [v23 layer];
  [v24 setMask:v22];
}

- (void)centerAndScaleImageInScrollView
{
  double v3 = [(ICDocCamImageQuadEditViewController *)self view];
  double v4 = [v3 window];
  unint64_t v5 = [v4 interfaceOrientation] - 1;

  double v6 = [(ICDocCamImageQuadEditViewController *)self startOrientationIsPortrait];
  int v7 = [v6 BOOLValue];

  double v8 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v8 bounds];
  double v10 = v9;
  double v11 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v11 frame];
  double v13 = v10 / v12;

  double v14 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v14 bounds];
  double v16 = v15;
  double v17 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v17 frame];
  double v19 = v16 / v18;

  BOOL v20 = [(ICDocCamImageQuadEditViewController *)self showImageAsAspectFit];
  if (v19 >= v13) {
    double v21 = v13;
  }
  else {
    double v21 = v19;
  }
  if (v5 >= 2) {
    double v22 = v19;
  }
  else {
    double v22 = v13;
  }
  if (v20 | (v5 < 2) ^ v7) {
    double v23 = v21;
  }
  else {
    double v23 = v22;
  }
  CGRect v24 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v24 setZoomScale:v23];

  id v25 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  double v26 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v26 center];
  double v28 = v27;
  double v30 = v29;
  double v31 = [(ICDocCamImageQuadEditViewController *)self imageView];
  double v32 = [v31 superview];
  objc_msgSend(v25, "convertPoint:fromView:", v32, v28, v30);
  double v34 = v33;
  double v36 = v35;

  double v37 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v37 contentOffset];

  double v38 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v38 center];
  double v40 = -(v39 - v34);

  v41 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v41 center];
  double v43 = -(v42 - v36);

  v44 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  objc_msgSend(v44, "setContentOffset:", v40, v43);

  id v45 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  [v45 layoutIfNeeded];

  [(ICDocCamImageQuadEditViewController *)self updateOverlayScrimMask];

  [(ICDocCamImageQuadEditViewController *)self updateToAspectFitIfNecessary];
}

- (void)updateToAspectFitIfNecessary
{
  if ([(ICDocCamImageQuadEditViewController *)self shouldAdjustForApectFitIfNecessary])
  {
    [(ICDocCamImageQuadEditViewController *)self setShouldAdjustForApectFitIfNecessary:0];
    if (![(ICDocCamImageQuadEditViewController *)self showImageAsAspectFit])
    {
      double v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
      [v3 setNeedsLayout];

      double v4 = [(ICDocCamImageQuadEditViewController *)self overlay];
      [v4 layoutIfNeeded];

      unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self overlay];
      char v6 = [v5 containsPointOutsideOfOverlayBounds];

      if ((v6 & 1) == 0)
      {
        [(ICDocCamImageQuadEditViewController *)self setShowImageAsAspectFit:1];
        [(ICDocCamImageQuadEditViewController *)self centerAndScaleImageInScrollView];
        int v7 = [(ICDocCamImageQuadEditViewController *)self overlay];
        [v7 setNeedsLayout];

        id v8 = [(ICDocCamImageQuadEditViewController *)self overlay];
        [v8 layoutIfNeeded];
      }
    }
  }
}

- (id)uiInitialQuadForOverlay:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self initialQuad];
  char v6 = [(ICDocCamImageQuadEditViewController *)self imageView];
  int v7 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  id v8 = [v5 quadByConvertingFromView:v6 toView:v7 isNormalized:1];

  double v9 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  double v10 = [v8 quadByConvertingFromView:v9 toView:v4 isNormalized:0];

  [v4 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v10, "flipPointsWithSourceFrame:", v12, v14, v16, v18);

  return v10;
}

- (id)uiQuadForOverlay:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self quad];
  char v6 = [(ICDocCamImageQuadEditViewController *)self imageView];
  int v7 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  id v8 = [v5 quadByConvertingFromView:v6 toView:v7 isNormalized:1];

  double v9 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  double v10 = [v8 quadByConvertingFromView:v9 toView:v4 isNormalized:0];

  [v4 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v10, "flipPointsWithSourceFrame:", v12, v14, v16, v18);

  return v10;
}

- (id)adjustedQuad
{
  double v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
  id v4 = [v3 adjustedQuad];

  unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self overlay];
  char v6 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  int v7 = [v4 quadByConvertingFromView:v5 toView:v6 isNormalized:0];

  id v8 = [(ICDocCamImageQuadEditViewController *)self scrollView];
  double v9 = [(ICDocCamImageQuadEditViewController *)self imageView];
  double v10 = [(ICDocCamImageQuadEditViewController *)self imageView];
  [v10 frame];
  double v13 = objc_msgSend(v7, "normalizedQuadByConvertingFromView:toView:toViewSize:", v8, v9, v11, v12);

  objc_msgSend(v13, "flipPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
  double v14 = [(ICDocCamImageQuadEditViewController *)self image];
  [v14 size];
  double v16 = v15;
  double v17 = [(ICDocCamImageQuadEditViewController *)self image];
  [v17 size];
  objc_msgSend(v13, "setBoundingBox:", 0.0, 0.0, v16, v18);

  return v13;
}

- (id)finalQuad
{
  if ([(ICDocCamImageQuadEditViewController *)self didAdjustQuad]
    || ([(ICDocCamImageQuadEditViewController *)self quad], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self adjustedQuad];
  }
  else
  {
    id v4 = (void *)v3;
    unint64_t v5 = [(ICDocCamImageQuadEditViewController *)self quad];
  }
  objc_msgSend(v5, "removeOrientation:boundingBox:", -[ICDocCamImageQuadEditViewController orientation](self, "orientation"), 0.0, 0.0, 1.0, 1.0);
  [v5 orientIfNecessary];

  return v5;
}

- (void)saveButtonPressed:(id)a3
{
  id v4 = [(ICDocCamImageQuadEditViewController *)self overlay];
  char v5 = [v4 isDraggingKnob];

  if ((v5 & 1) == 0)
  {
    [(ICDocCamImageQuadEditViewController *)self setDidPressSave:1];
    id v7 = [(ICDocCamImageQuadEditViewController *)self image];
    char v6 = [(ICDocCamImageQuadEditViewController *)self finalQuad];
    [(ICDocCamImageQuadEditViewController *)self callCompletionHandler:1 withImage:v7 quad:v6 preparingForDismissal:0];
  }
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = [(ICDocCamImageQuadEditViewController *)self overlay];
  char v5 = [v4 isDraggingKnob];

  if ((v5 & 1) == 0)
  {
    [(ICDocCamImageQuadEditViewController *)self callCompletionHandler:0 withImage:0 quad:0 preparingForDismissal:0];
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self imageView];
  id v4 = [v3 superview];

  return v4;
}

- (void)scanWasDeleted:(id)a3
{
  id v4 = [a3 object];
  char v5 = [v4 identifier];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ICDocCamImageQuadEditViewController_scanWasDeleted___block_invoke;
  v7[3] = &unk_2642A9360;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dc_performBlockOnMainThread(v7);
}

void __54__ICDocCamImageQuadEditViewController_scanWasDeleted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) scanDataDelegate];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  if (v4)
  {
    [*(id *)(a1 + 32) callCompletionHandler:0 withImage:0 quad:0 preparingForDismissal:0];
    char v5 = *(void **)(a1 + 32);
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)setupAccessibility
{
  id v2 = [(ICDocCamImageQuadEditViewController *)self userPromptLabel];
  [v2 setIsAccessibilityElement:0];
}

- (void)updateFonts
{
  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", *MEMORY[0x263F1D260], 16.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self userPromptLabel];
  [v3 setFont:v4];
}

- (id)quadForOverlay
{
  uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
  id v4 = [(ICDocCamImageQuadEditViewController *)self quadForOverlay:v3];

  return v4;
}

- (id)finalQuadFromOverlay
{
  if ([(ICDocCamImageQuadEditViewController *)self didPressSave]
    && [(ICDocCamImageQuadEditViewController *)self didAdjustQuad])
  {
    uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
    uint64_t v4 = [v3 adjustedQuad];
  }
  else
  {
    uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self overlay];
    uint64_t v4 = [(ICDocCamImageQuadEditViewController *)self uiInitialQuadForOverlay:v3];
  }
  char v5 = (void *)v4;

  return v5;
}

- (void)callCompletionHandler:(BOOL)a3 withImage:(id)a4 quad:(id)a5 preparingForDismissal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v12 = a4;
  id v10 = a5;
  if (![(ICDocCamImageQuadEditViewController *)self didCallCompletion])
  {
    [(ICDocCamImageQuadEditViewController *)self setDidCallCompletion:1];
    double v11 = [(ICDocCamImageQuadEditViewController *)self completionHandler];
    ((void (**)(void, BOOL, id, id, BOOL))v11)[2](v11, v8, v12, v10, v6);
  }
}

- (void)prepareForDismissal
{
  [(ICDocCamImageQuadEditViewController *)self setDidPressSave:1];
  id v4 = [(ICDocCamImageQuadEditViewController *)self image];
  uint64_t v3 = [(ICDocCamImageQuadEditViewController *)self finalQuad];
  [(ICDocCamImageQuadEditViewController *)self callCompletionHandler:1 withImage:v4 quad:v3 preparingForDismissal:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (ICDocCamImageQuadEditImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (ICDocCamImageQuadEditImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIView)buttonContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonContainer);

  return (UIView *)WeakRetained;
}

- (void)setButtonContainer:(id)a3
{
}

- (ICDocCamImageQuadEditOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (double)knobHeight
{
  return self->_knobHeight;
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (UIView)placard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placard);

  return (UIView *)WeakRetained;
}

- (void)setPlacard:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (DCScanDataDelegate)scanDataDelegate
{
  return self->_scanDataDelegate;
}

- (BOOL)showImageAsAspectFit
{
  return self->_showImageAsAspectFit;
}

- (void)setShowImageAsAspectFit:(BOOL)a3
{
  self->_showImageAsAspectFit = a3;
}

- (BOOL)inCaptureMode
{
  return self->_inCaptureMode;
}

- (CAShapeLayer)overlayMask
{
  return self->_overlayMask;
}

- (void)setOverlayMask:(id)a3
{
}

- (UIBezierPath)overlayMaskPath
{
  return self->_overlayMaskPath;
}

- (void)setOverlayMaskPath:(id)a3
{
}

- (ICDocCamImageQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (ICDocCamImageQuad)initialQuad
{
  return self->_initialQuad;
}

- (void)setInitialQuad:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIButton)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);

  return (UIButton *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)saveButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_saveButton);

  return (UIButton *)WeakRetained;
}

- (void)setSaveButton:(id)a3
{
}

- (UILabel)userPromptLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userPromptLabel);

  return (UILabel *)WeakRetained;
}

- (void)setUserPromptLabel:(id)a3
{
}

- (NSLayoutConstraint)buttonContainerHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonContainerHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setButtonContainerHeightConstraint:(id)a3
{
}

- (NSNumber)startOrientationIsPortrait
{
  return self->_startOrientationIsPortrait;
}

- (void)setStartOrientationIsPortrait:(id)a3
{
}

- (BOOL)didAdjustQuad
{
  return self->_didAdjustQuad;
}

- (void)setDidAdjustQuad:(BOOL)a3
{
  self->_didAdjustQuad = a3;
}

- (BOOL)shouldAdjustForApectFitIfNecessary
{
  return self->_shouldAdjustForApectFitIfNecessary;
}

- (void)setShouldAdjustForApectFitIfNecessary:(BOOL)a3
{
  self->_shouldAdjustForApectFitIfNecessardouble y = a3;
}

- (BOOL)invisibleButtonContainer
{
  return self->_invisibleButtonContainer;
}

- (void)setInvisibleButtonContainer:(BOOL)a3
{
  self->_invisibleButtonContainer = a3;
}

- (BOOL)didPressSave
{
  return self->_didPressSave;
}

- (void)setDidPressSave:(BOOL)a3
{
  self->_didPressSave = a3;
}

- (BOOL)didCallCompletion
{
  return self->_didCallCompletion;
}

- (void)setDidCallCompletion:(BOOL)a3
{
  self->_didCallCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOrientationIsPortrait, 0);
  objc_destroyWeak((id *)&self->_buttonContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_userPromptLabel);
  objc_destroyWeak((id *)&self->_saveButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_initialQuad, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_overlayMaskPath, 0);
  objc_storeStrong((id *)&self->_overlayMask, 0);
  objc_storeStrong((id *)&self->_scanDataDelegate, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_placard);
  objc_storeStrong((id *)&self->_knobColor, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_buttonContainer);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)initWithImage:(os_log_t)log quad:scanDataDelegate:orientation:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Trying to load recrop for scan, but the quad is nil, setting starting UI recrop to a 95%% unit rect", v1, 2u);
}

- (void)initWithImage:(os_log_t)log quad:scanDataDelegate:orientation:completionHandler:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "completionHandler";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

- (void)initWithImage:(os_log_t)log quad:scanDataDelegate:orientation:completionHandler:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "image";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end