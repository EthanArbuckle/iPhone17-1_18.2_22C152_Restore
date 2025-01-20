@interface CFXCameraControlsViewController
- (BOOL)dockIsMagnified;
- (CAMBottomBar)bottomBar;
- (CAMCreativeCameraButton)effectButton;
- (CAMFlipButton)flipButton;
- (CFXCameraControlsViewController)init;
- (CFXCameraControlsViewController)initWithDelegate:(id)a3 captureMode:(int64_t)a4;
- (CFXCameraControlsViewControllerDelegate)delegate;
- (CFXFeedbackController)feedbackController;
- (CUShutterButton)shutterButton;
- (NSLayoutConstraint)appStripBackgroundContainerViewBottomConstraint;
- (NSLayoutConstraint)appStripBackgroundContainerViewHeightConstraint;
- (NSLayoutConstraint)appStripBackgroundContainerViewLeadingConstraint;
- (NSLayoutConstraint)appStripBackgroundContainerViewTopConstraint;
- (NSLayoutConstraint)appStripBackgroundContainerViewTrailingConstraint;
- (NSLayoutConstraint)backgroundViewHeightConstraint;
- (NSLayoutConstraint)bottomBlackViewHeightConstraint;
- (NSLayoutConstraint)bottomBlackViewTopConstraint;
- (NSLayoutConstraint)bottomBlackViewTrailingConstraint;
- (NSLayoutConstraint)bottomBlackViewWidthConstraint;
- (UIColor)backgroundColor;
- (UIView)appStripBackgroundContainerView;
- (UIView)appStripBackgroundView;
- (UIView)backgroundView;
- (UIView)bottomBlackView;
- (UIView)effectButtonContainerPad;
- (UIView)flipButtonContainerPad;
- (UIView)shutterButtonContainerPad;
- (double)CFX_smallPhoneDockHeightAdjustment;
- (double)dockMagnifiedHeightDelta;
- (int64_t)captureMode;
- (void)configureUIForOrientation;
- (void)effectsButtonTapped:(id)a3;
- (void)setAppStripBackgroundContainerView:(id)a3;
- (void)setAppStripBackgroundContainerViewBottomConstraint:(id)a3;
- (void)setAppStripBackgroundContainerViewHeightConstraint:(id)a3;
- (void)setAppStripBackgroundContainerViewLeadingConstraint:(id)a3;
- (void)setAppStripBackgroundContainerViewTopConstraint:(id)a3;
- (void)setAppStripBackgroundContainerViewTrailingConstraint:(id)a3;
- (void)setAppStripBackgroundView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewHeightConstraint:(id)a3;
- (void)setBottomBar:(id)a3;
- (void)setBottomBlackView:(id)a3;
- (void)setBottomBlackViewHeightConstraint:(id)a3;
- (void)setBottomBlackViewTopConstraint:(id)a3;
- (void)setBottomBlackViewTrailingConstraint:(id)a3;
- (void)setBottomBlackViewWidthConstraint:(id)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDockIsMagnified:(BOOL)a3;
- (void)setDockMagnifiedHeightDelta:(double)a3;
- (void)setEffectButton:(id)a3;
- (void)setEffectButtonContainerPad:(id)a3;
- (void)setFeedbackController:(id)a3;
- (void)setFlipButton:(id)a3;
- (void)setFlipButtonContainerPad:(id)a3;
- (void)setShutterButton:(id)a3;
- (void)setShutterButtonAlpha:(double)a3;
- (void)setShutterButtonContainerPad:(id)a3;
- (void)setShutterButtonEnabled:(BOOL)a3;
- (void)shutterButtonTapped:(id)a3;
- (void)switchCameraButtonTapped:(id)a3;
- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4;
- (void)updateUIForVideoRecording:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CFXCameraControlsViewController

- (CFXCameraControlsViewController)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = (void *)MEMORY[0x263F1C9E8];
  v6 = [MEMORY[0x263F086E0] jfxBundle];
  v7 = [v5 storyboardWithName:v4 bundle:v6];

  v8 = [v7 instantiateViewControllerWithIdentifier:v4];

  return v8;
}

- (CFXCameraControlsViewController)initWithDelegate:(id)a3 captureMode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(CFXCameraControlsViewController *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_captureMode = a4;
  }

  return v8;
}

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)CFXCameraControlsViewController;
  [(CFXCameraControlsViewController *)&v51 viewDidLoad];
  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

  LODWORD(v5) = CFXCaptureCapabilitiesIsCTMSupported();
  id v7 = objc_alloc(MEMORY[0x263F30798]);
  if (v5)
  {
    v8 = (void *)[v7 initForOverContent];
    [(CFXCameraControlsViewController *)self setEffectButton:v8];
  }
  else
  {
    v9 = (void *)[v7 initWithLayoutStyle:v6];
    [(CFXCameraControlsViewController *)self setEffectButton:v9];

    v10 = [(CFXCameraControlsViewController *)self effectButton];
    objc_msgSend(v10, "setTappableEdgeInsets:", 20.0, 20.0, 20.0, 20.0);

    v8 = [(CFXCameraControlsViewController *)self effectButton];
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  }

  v11 = [(CFXCameraControlsViewController *)self effectButton];
  [v11 setActive:1];

  v12 = [(CFXCameraControlsViewController *)self effectButton];
  [v12 addTarget:self action:sel_effectsButtonTapped_ forControlEvents:64];

  v13 = [(CFXCameraControlsViewController *)self effectButton];
  [v13 setExclusiveTouch:1];

  v14 = [MEMORY[0x263F30808] shutterButton];
  [(CFXCameraControlsViewController *)self setShutterButton:v14];

  v15 = [(CFXCameraControlsViewController *)self shutterButton];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, 80.0, 80.0);

  v16 = [(CFXCameraControlsViewController *)self shutterButton];
  [v16 addTarget:self action:sel_shutterButtonTapped_ forControlEvents:64];

  v17 = [(CFXCameraControlsViewController *)self shutterButton];
  [v17 setExclusiveTouch:1];

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 userInterfaceIdiom],
        v18,
        v19 == 1))
  {
    v20 = [MEMORY[0x263F307B8] flipButtonOverContent];
    [(CFXCameraControlsViewController *)self setFlipButton:v20];
  }
  else
  {
    v21 = [MEMORY[0x263F307B8] flipButtonWithLayoutStyle:v6];
    [(CFXCameraControlsViewController *)self setFlipButton:v21];

    v20 = [(CFXCameraControlsViewController *)self flipButton];
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  }

  v22 = [(CFXCameraControlsViewController *)self flipButton];
  [v22 addTarget:self action:sel_switchCameraButtonTapped_ forControlEvents:64];

  v23 = [(CFXCameraControlsViewController *)self flipButton];
  BOOL v24 = 1;
  [v23 setExclusiveTouch:1];

  v25 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];
  if (v26)
  {
    int v27 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263F1C920] mainScreen];
    [v2 bounds];
    if ((uint64_t)v28 <= 811)
    {
      v3 = [MEMORY[0x263F1C920] mainScreen];
      [v3 bounds];
      BOOL v24 = (uint64_t)v29 < 812;
      int v27 = 1;
    }
    else
    {
      int v27 = 0;
      BOOL v24 = 0;
    }
  }
  v30 = [(CFXCameraControlsViewController *)self bottomBlackView];
  [v30 setHidden:v24];

  if (v27) {
  if (!v26)
  }

  id v31 = objc_alloc_init(MEMORY[0x263F30770]);
  [(CFXCameraControlsViewController *)self setBottomBar:v31];

  v32 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v33 = [v32 userInterfaceIdiom];

  if (v33)
  {
    v34 = [(CFXCameraControlsViewController *)self view];
    v35 = [(CFXCameraControlsViewController *)self bottomBar];
    [v34 addSubview:v35];

    v36 = [(CFXCameraControlsViewController *)self delegate];
    v37 = [v36 doneButtonForCameraControlsViewController:self];
    v38 = [(CFXCameraControlsViewController *)self bottomBar];
    [v38 setDoneButton:v37];

    v39 = [(CFXCameraControlsViewController *)self delegate];
    v40 = [v39 flashButtonForCameraControlsViewController:self];
    v41 = [(CFXCameraControlsViewController *)self bottomBar];
    [v41 setFlashButton:v40];

    v42 = [(CFXCameraControlsViewController *)self bottomBar];
    [v42 setBackgroundStyle:1];
  }
  else
  {
    if (isStreamingMode([(CFXCameraControlsViewController *)self captureMode]))
    {
      v42 = [(CFXCameraControlsViewController *)self backgroundView];
      v43 = [(CFXCameraControlsViewController *)self bottomBar];
      [v42 addSubview:v43];
    }
    else
    {
      if (CFXCaptureCapabilitiesIsCTMSupported()) {
        goto LABEL_25;
      }
      v42 = [(CFXCameraControlsViewController *)self delegate];
      v43 = [(CFXCameraControlsViewController *)self bottomBar];
      [v42 insertCamBottomBar:v43];
    }
  }
LABEL_25:
  v44 = [(CFXCameraControlsViewController *)self bottomBar];
  [v44 setLayoutStyle:v6];

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    v45 = [(CFXCameraControlsViewController *)self effectButton];
    v46 = [(CFXCameraControlsViewController *)self bottomBar];
    [v46 setCreativeCameraButton:v45];

    v47 = [(CFXCameraControlsViewController *)self shutterButton];
    v48 = [(CFXCameraControlsViewController *)self bottomBar];
    [v48 setShutterButton:v47];

    v49 = [(CFXCameraControlsViewController *)self flipButton];
    v50 = [(CFXCameraControlsViewController *)self bottomBar];
    [v50 setFlipButton:v49];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CFXCameraControlsViewController;
  [(CFXCameraControlsViewController *)&v10 viewWillAppear:a3];
  BOOL v4 = [(CFXCameraControlsViewController *)self captureMode] == 2;
  v5 = [(CFXCameraControlsViewController *)self shutterButton];
  [v5 setMode:v4 animated:0];

  uint64_t v6 = [CFXFeedbackController alloc];
  id v7 = [(CFXCameraControlsViewController *)self shutterButton];
  v8 = [(CFXFeedbackController *)v6 initWithShutterButton:v7];
  [(CFXCameraControlsViewController *)self setFeedbackController:v8];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_JFX_orientationMonitorInterfaceOrientationNotification_ name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CFXCameraControlsViewController;
  [(CFXCameraControlsViewController *)&v16 viewDidAppear:a3];
  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v5 userInterfaceIdiom])
  {
  }
  else
  {
    uint64_t v6 = [(CFXCameraControlsViewController *)self appStripBackgroundView];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [(CFXCameraControlsViewController *)self setAppStripBackgroundView:v7];

      int64_t v8 = [(CFXCameraControlsViewController *)self captureMode];
      if (v8)
      {
        uint64_t v6 = [(CFXCameraControlsViewController *)self bottomBar];
        v3 = [v6 backgroundView];
        [v3 backgroundColor];
      }
      else
      {
        [MEMORY[0x263F1C550] blackColor];
      v9 = };
      objc_super v10 = [(CFXCameraControlsViewController *)self appStripBackgroundView];
      [v10 setBackgroundColor:v9];

      if (v8)
      {

        v9 = v6;
      }

      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        v11 = [(CFXCameraControlsViewController *)self delegate];
        if ([v11 needsBlackBackgroundForCTMControls]) {
          [MEMORY[0x263F1C550] blackColor];
        }
        else {
        v12 = [MEMORY[0x263F1C550] clearColor];
        }
        v13 = [(CFXCameraControlsViewController *)self appStripBackgroundView];
        [v13 setBackgroundColor:v12];
      }
      v14 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerView];
      v15 = [(CFXCameraControlsViewController *)self appStripBackgroundView];
      [v14 addSubview:v15];

      [(CFXCameraControlsViewController *)self configureUIForOrientation];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXCameraControlsViewController;
  [(CFXCameraControlsViewController *)&v5 viewDidDisappear:a3];
  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXCameraControlsViewController;
  [(CFXCameraControlsViewController *)&v3 viewWillLayoutSubviews];
  [(CFXCameraControlsViewController *)self configureUIForOrientation];
}

- (void)configureUIForOrientation
{
  if ([(CFXCameraControlsViewController *)self captureMode] != 1)
  {
    objc_super v3 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (!v4)
    {
      objc_super v5 = +[JFXOrientationMonitor keyWindow];
      [v5 bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      int64_t v14 = +[JFXOrientationMonitor interfaceOrientation];
      objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarFrameForReferenceBounds:", v7, v9, v11, v13);
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        v23 = [(CFXCameraControlsViewController *)self delegate];
        objc_msgSend(v23, "bottomBarCTMControlsFrameForWindowOrientation:bounds:", v14, v7, v9, v11, v13);
        CGFloat v16 = v24;
        CGFloat v18 = v25;
        CGFloat v20 = v26;
        CGFloat v22 = v27;
      }
      [(CFXCameraControlsViewController *)self CFX_smallPhoneDockHeightAdjustment];
      double v29 = v28;
      v30 = [(CFXCameraControlsViewController *)self bottomBar];
      [v30 frame];
      CGFloat Width = CGRectGetWidth(v67);

      v32 = [MEMORY[0x263F1C5C0] currentDevice];
      double v33 = 0.0;
      if (![v32 userInterfaceIdiom])
      {
        v34 = [MEMORY[0x263F1C920] mainScreen];
        [v34 bounds];
        double v33 = v29;
        if ((uint64_t)v35 != 568)
        {
          v36 = [MEMORY[0x263F1C920] mainScreen];
          [v36 bounds];
          if ((uint64_t)v37 == 568) {
            double v33 = v29;
          }
          else {
            double v33 = 0.0;
          }
        }
      }
      unint64_t v38 = v14 - 3;

      v68.origin.x = v16;
      v68.origin.y = v18;
      v68.size.width = v20;
      v68.size.height = v22;
      double Height = CGRectGetHeight(v68);
      v40 = [MEMORY[0x263F1C5C0] currentDevice];
      if (![v40 userInterfaceIdiom])
      {
        v41 = [MEMORY[0x263F1C920] mainScreen];
        [v41 bounds];
        double v43 = v29;
        if ((uint64_t)v42 != 568)
        {
          v44 = [MEMORY[0x263F1C920] mainScreen];
          [v44 bounds];
          if ((uint64_t)v45 == 568) {
            double v43 = v29;
          }
          else {
            double v43 = 0.0;
          }
        }
        double Height = Height - v43;
      }
      double v46 = 0.0;
      if ([(CFXCameraControlsViewController *)self dockIsMagnified]) {
        double v47 = -31.0;
      }
      else {
        double v47 = 0.0;
      }
      v48 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewTopConstraint];
      v50 = v48;
      if (v38 >= 2) {
        *(float *)&double v49 = 250.0;
      }
      else {
        *(float *)&double v49 = 750.0;
      }
      if (v38 >= 2) {
        float v51 = 750.0;
      }
      else {
        float v51 = 250.0;
      }
      [v48 setPriority:v49];

      v52 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewHeightConstraint];
      *(float *)&double v53 = v51;
      [v52 setPriority:v53];

      if (v14 == 1) {
        double v46 = -Height;
      }
      v54 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewBottomConstraint];
      [v54 setConstant:v46];

      v55 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewLeadingConstraint];
      [v55 setConstant:0.0];

      v56 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewTrailingConstraint];
      [v56 setConstant:0.0];

      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        v57 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewLeadingConstraint];
        [v57 setActive:0];

        v58 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewTrailingConstraint];
        [v58 setActive:0];
      }
      if (v38 > 1)
      {
        v63 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewHeightConstraint];
        [v63 setConstant:v33];

        if ([(CFXCameraControlsViewController *)self dockIsMagnified]) {
          double v33 = v33 + 31.0;
        }
        double v64 = 0.0;
        double v29 = Width;
      }
      else
      {
        v59 = [(CFXCameraControlsViewController *)self bottomBar];
        [v59 frame];
        double v33 = CGRectGetWidth(v69);

        if (v14 == 4)
        {
          v60 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewLeadingConstraint];
          v61 = v60;
          double v62 = Height;
        }
        else
        {
          v60 = [(CFXCameraControlsViewController *)self appStripBackgroundContainerViewTrailingConstraint];
          v61 = v60;
          double v62 = -Height;
        }
        [v60 setConstant:v62];

        double v47 = 0.0;
        if ([(CFXCameraControlsViewController *)self dockIsMagnified])
        {
          double v29 = v29 + 31.0;
          if (v14 == 3) {
            double v64 = -31.0;
          }
          else {
            double v64 = 0.0;
          }
        }
        else
        {
          double v64 = 0.0;
        }
      }
      id v65 = [(CFXCameraControlsViewController *)self appStripBackgroundView];
      objc_msgSend(v65, "setFrame:", v64, v47, v29, v33);
    }
  }
}

- (UIColor)backgroundColor
{
  [(CFXCameraControlsViewController *)self loadViewIfNeeded];
  objc_super v3 = [(CFXCameraControlsViewController *)self backgroundView];
  uint64_t v4 = [v3 backgroundColor];

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v7 = a3;
  [(CFXCameraControlsViewController *)self loadViewIfNeeded];
  if (isStreamingMode([(CFXCameraControlsViewController *)self captureMode])
    || ([MEMORY[0x263F1C5C0] currentDevice],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 userInterfaceIdiom],
        v4,
        v5 == 1))
  {
    double v6 = [(CFXCameraControlsViewController *)self backgroundView];
    [v6 setBackgroundColor:v7];
  }
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)!a3;
  double v6 = [(CFXCameraControlsViewController *)self effectButton];
  [v6 setAlpha:v5];

  id v7 = [(CFXCameraControlsViewController *)self flipButton];
  [v7 setAlpha:v5];

  double v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (!v9)
  {
    id v10 = [(CFXCameraControlsViewController *)self bottomBar];
    [v10 setBackgroundStyle:v3];
  }
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  [(CFXCameraControlsViewController *)self setDockIsMagnified:a3];
  [(CFXCameraControlsViewController *)self setDockMagnifiedHeightDelta:a4];
  [(CFXCameraControlsViewController *)self configureUIForOrientation];
  id v6 = [(CFXCameraControlsViewController *)self backgroundView];
  [v6 layoutIfNeeded];
}

- (void)setShutterButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CFXCameraControlsViewController *)self shutterButton];
  [v4 setEnabled:v3];
}

- (void)setShutterButtonAlpha:(double)a3
{
  id v4 = [(CFXCameraControlsViewController *)self shutterButton];
  [v4 setAlpha:a3];
}

- (CAMBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)effectsButtonTapped:(id)a3
{
  id v4 = [(CFXCameraControlsViewController *)self effectButton];
  [v4 setActive:0];

  double v5 = [(CFXCameraControlsViewController *)self delegate];

  if (v5)
  {
    id v6 = [(CFXCameraControlsViewController *)self delegate];
    [v6 cameraControlsViewControllerEffectsButtonWasTapped:self];
  }
}

- (void)shutterButtonTapped:(id)a3
{
  if (![(CFXCameraControlsViewController *)self captureMode]) {
    [(CFXCameraControlsViewController *)self setShutterButtonEnabled:0];
  }
  id v4 = [(CFXCameraControlsViewController *)self delegate];

  if (v4)
  {
    double v5 = [(CFXCameraControlsViewController *)self delegate];
    [v5 cameraControlsViewControllerShutterButtonWasTapped:self];

    if ([(CFXCameraControlsViewController *)self captureMode] == 2)
    {
      id v6 = [(CFXCameraControlsViewController *)self shutterButton];
      uint64_t v7 = [v6 mode];

      double v8 = [(CFXCameraControlsViewController *)self shutterButton];
      id v10 = v8;
      if (v7 == 6) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 6;
      }
      [v8 setMode:v9 animated:1];
    }
  }
}

- (void)switchCameraButtonTapped:(id)a3
{
  id v4 = [(CFXCameraControlsViewController *)self delegate];

  if (v4)
  {
    id v5 = [(CFXCameraControlsViewController *)self delegate];
    [v5 cameraControlsViewControllerSwitchCameraButtonWasTapped:self];
  }
}

- (double)CFX_smallPhoneDockHeightAdjustment
{
  v2 = +[JFXOrientationMonitor keyWindow];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(MEMORY[0x263F5E478], "cameraBottomBarFrameForReferenceBounds:", v4, v6, v8, v10);
  double v12 = v11;
  objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarFrameForReferenceBounds:", v4, v6, v8, v10);
  return v12 - v13;
}

- (CAMCreativeCameraButton)effectButton
{
  return self->_effectButton;
}

- (void)setEffectButton:(id)a3
{
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
}

- (CFXCameraControlsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXCameraControlsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)appStripBackgroundView
{
  return self->_appStripBackgroundView;
}

- (void)setAppStripBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
  return (UIView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)effectButtonContainerPad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effectButtonContainerPad);
  return (UIView *)WeakRetained;
}

- (void)setEffectButtonContainerPad:(id)a3
{
}

- (UIView)shutterButtonContainerPad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shutterButtonContainerPad);
  return (UIView *)WeakRetained;
}

- (void)setShutterButtonContainerPad:(id)a3
{
}

- (UIView)flipButtonContainerPad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flipButtonContainerPad);
  return (UIView *)WeakRetained;
}

- (void)setFlipButtonContainerPad:(id)a3
{
}

- (UIView)bottomBlackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBlackView);
  return (UIView *)WeakRetained;
}

- (void)setBottomBlackView:(id)a3
{
}

- (UIView)appStripBackgroundContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerView);
  return (UIView *)WeakRetained;
}

- (void)setAppStripBackgroundContainerView:(id)a3
{
}

- (NSLayoutConstraint)backgroundViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBackgroundViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBlackViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBlackViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomBlackViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBlackViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBlackViewTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomBlackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBlackViewWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBlackViewWidthConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomBlackViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBlackViewTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomBlackViewTrailingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomBlackViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)appStripBackgroundContainerViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAppStripBackgroundContainerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)appStripBackgroundContainerViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewBottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAppStripBackgroundContainerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)appStripBackgroundContainerViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAppStripBackgroundContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)appStripBackgroundContainerViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewLeadingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAppStripBackgroundContainerViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)appStripBackgroundContainerViewTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewTrailingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAppStripBackgroundContainerViewTrailingConstraint:(id)a3
{
}

- (CFXFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (void)setBottomBar:(id)a3
{
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)setShutterButton:(id)a3
{
}

- (BOOL)dockIsMagnified
{
  return self->_dockIsMagnified;
}

- (void)setDockIsMagnified:(BOOL)a3
{
  self->_dockIsMagnified = a3;
}

- (double)dockMagnifiedHeightDelta
{
  return self->_dockMagnifiedHeightDelta;
}

- (void)setDockMagnifiedHeightDelta:(double)a3
{
  self->_dockMagnifiedHeightDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewHeightConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewBottomConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewWidthConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewHeightConstraint);
  objc_destroyWeak((id *)&self->_backgroundViewHeightConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerView);
  objc_destroyWeak((id *)&self->_bottomBlackView);
  objc_destroyWeak((id *)&self->_flipButtonContainerPad);
  objc_destroyWeak((id *)&self->_shutterButtonContainerPad);
  objc_destroyWeak((id *)&self->_effectButtonContainerPad);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_appStripBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_effectButton, 0);
}

@end