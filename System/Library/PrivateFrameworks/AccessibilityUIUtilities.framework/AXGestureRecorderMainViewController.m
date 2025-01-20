@interface AXGestureRecorderMainViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (AXAssertion)disableSystemGesturesAssertion;
- (AXGestureRecorderControlsView)controlsView;
- (AXGestureRecorderMainViewController)init;
- (AXGestureRecorderMainViewController)initWithType:(int64_t)a3;
- (AXGestureRecorderMainViewControllerDelegate)delegate;
- (AXGestureRecorderStyleProvider)styleProvider;
- (AXGestureRecorderViewController)gestureRecorderViewController;
- (BOOL)_canSaveGestureWithName:(id)a3;
- (BOOL)_ignoreAppSupportedOrientations;
- (BOOL)_isForRealTimeGesture;
- (BOOL)isChromeVisibleForGestureRecorderViewController:(id)a3;
- (BOOL)isDisplayLinkInEffect;
- (BOOL)isInReplayMode;
- (UIBarButtonItem)saveButton;
- (UILabel)instructionsLabel;
- (UIView)lineView;
- (UIView)topView;
- (double)gestureRecordingDidStartTimeInterval;
- (double)maximumDurationOfRecordedGestureForGestureRecorderViewController:(id)a3;
- (id)_defaultInstructionalText;
- (id)appDidResignActiveNotificationHandlerToken;
- (int64_t)recorderType;
- (unint64_t)leftButtonIdentifier;
- (unint64_t)rightButtonIdentifier;
- (unint64_t)supportedInterfaceOrientations;
- (void)_clearProgressView;
- (void)_commonInit;
- (void)_didSaveGestureWithName:(id)a3;
- (void)_enterReplayMode;
- (void)_enterWaitingMode;
- (void)_getButtonPropertiesForIdentifier:(unint64_t)a3 enabled:(BOOL)a4 color:(int *)a5 title:(id *)a6;
- (void)_hide;
- (void)_hideChrome;
- (void)_hideChromeButtonTapped:(id)a3;
- (void)_manageDisplayLinkManager:(BOOL)a3;
- (void)_releaseOutlets;
- (void)_reset;
- (void)_saveButtonTapped:(id)a3;
- (void)_savePoint:(CGPoint)a3;
- (void)_saveReplayableGesture;
- (void)_saveWithMessage:(id)a3;
- (void)_setLeftButtonIdentifier:(unint64_t)a3 enabled:(BOOL)a4 rightButtonIdentifier:(unint64_t)a5 enabled:(BOOL)a6 animate:(BOOL)a7 completion:(id)a8;
- (void)_unhideChrome;
- (void)_updateProgressView:(id)a3;
- (void)dealloc;
- (void)gestureRecorderControlsView:(id)a3 buttonTappedAtIndex:(unint64_t)a4;
- (void)gestureRecorderViewController:(id)a3 didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a4;
- (void)gestureRecorderViewController:(id)a3 setChromeVisible:(BOOL)a4;
- (void)gestureRecorderViewControllerDidFinishReplayingRecordedGesture:(id)a3;
- (void)gestureRecorderViewControllerDidStopRecordingAtomicFingerPath:(id)a3;
- (void)loadView;
- (void)setAppDidResignActiveNotificationHandlerToken:(id)a3;
- (void)setControlsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableSystemGesturesAssertion:(id)a3;
- (void)setGestureRecorderViewController:(id)a3;
- (void)setGestureRecordingDidStartTimeInterval:(double)a3;
- (void)setInReplayMode:(BOOL)a3;
- (void)setInstructionsLabel:(id)a3;
- (void)setIsDisplayLinkInEffect:(BOOL)a3;
- (void)setLeftButtonIdentifier:(unint64_t)a3;
- (void)setLineView:(id)a3;
- (void)setRecorderType:(int64_t)a3;
- (void)setRightButtonIdentifier:(unint64_t)a3;
- (void)setSaveButton:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTopView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AXGestureRecorderMainViewController

- (void)_commonInit
{
  v3 = objc_opt_new();
  [(AXGestureRecorderMainViewController *)self setStyleProvider:v3];
  v4 = objc_opt_new();
  objc_msgSend(v4, "setRecorderType:", -[AXGestureRecorderMainViewController recorderType](self, "recorderType"));
  [v4 setStyleProvider:v3];
  [v4 setDelegate:self];
  [(AXGestureRecorderMainViewController *)self addChildViewController:v4];
  [(AXGestureRecorderMainViewController *)self setGestureRecorderViewController:v4];
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v7 = *MEMORY[0x1E4FB2738];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __50__AXGestureRecorderMainViewController__commonInit__block_invoke;
  v12 = &unk_1E649C1E8;
  objc_copyWeak(&v13, &location);
  v8 = [v5 addObserverForName:v7 object:0 queue:v6 usingBlock:&v9];
  -[AXGestureRecorderMainViewController setAppDidResignActiveNotificationHandlerToken:](self, "setAppDidResignActiveNotificationHandlerToken:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __50__AXGestureRecorderMainViewController__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDisableSystemGesturesAssertion:0];
}

- (AXGestureRecorderMainViewController)init
{
  return [(AXGestureRecorderMainViewController *)self initWithType:0];
}

- (AXGestureRecorderMainViewController)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXGestureRecorderMainViewController;
  v4 = [(AXGestureRecorderMainViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(AXGestureRecorderMainViewController *)v4 setRecorderType:a3];
    [(AXGestureRecorderMainViewController *)v5 _commonInit];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(AXGestureRecorderMainViewController *)self appDidResignActiveNotificationHandlerToken];
  [v3 removeObserver:v4];

  [(AXGestureRecorderMainViewController *)self _releaseOutlets];
  [(AXGestureRecorderViewController *)self->_gestureRecorderViewController setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)AXGestureRecorderMainViewController;
  [(AXGestureRecorderMainViewController *)&v5 dealloc];
}

- (void)loadView
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  objc_super v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setAutoresizingMask:18];
  [v5 setAutoresizesSubviews:1];
  [(AXGestureRecorderMainViewController *)self setView:v5];
  [v5 bounds];
  CGFloat x = v65.origin.x;
  CGFloat y = v65.origin.y;
  CGFloat width = v65.size.width;
  CGFloat height = v65.size.height;
  double v10 = CGRectGetWidth(v65);
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v66);
  if ([(AXGestureRecorderMainViewController *)self recorderType] != 2)
  {
    +[AXGestureRecorderControlsView defaultHeight];
    id v13 = -[AXGestureRecorderControlsView initWithFrame:]([AXGestureRecorderControlsView alloc], "initWithFrame:", 0.0, v11 - v12, v10, v12);
    [(AXGestureRecorderControlsView *)v13 setAutoresizingMask:10];
    [(AXGestureRecorderControlsView *)v13 setDelegate:self];
    [v5 addSubview:v13];
    [(AXGestureRecorderMainViewController *)self setControlsView:v13];
  }
  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  topView = self->_topView;
  self->_topView = v14;

  v16 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(UIView *)self->_topView setBackgroundColor:v16];

  v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  lineView = self->_lineView;
  self->_lineView = v17;

  v19 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_lineView setBackgroundColor:v19];

  [v5 addSubview:self->_topView];
  [(UIView *)self->_topView addSubview:self->_lineView];
  v20 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  v21 = [v20 gestureRecorderView];

  objc_msgSend(v21, "setFrame:", 0.0, 0.0, v10, v11);
  [v21 setAutoresizingMask:18];
  v62 = v21;
  [v5 insertSubview:v21 atIndex:0];
  uint64_t v22 = [(AXGestureRecorderMainViewController *)self _defaultInstructionalText];
  v23 = [(AXGestureRecorderMainViewController *)self styleProvider];
  uint64_t v24 = [v23 instructionsLabelFont];
  v25 = [v23 instructionsLabelTextColor];
  uint64_t v26 = [v23 instructionsLabelBackgroundColor];
  uint64_t v27 = [v23 instructionsLabelShadowColor];
  v60 = v23;
  [v23 instructionsLabelShadowOffset];
  double v29 = v28;
  double v31 = v30;
  id v32 = objc_alloc(MEMORY[0x1E4FB1930]);
  v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  v59 = (void *)v24;
  [v33 setFont:v24];
  [v33 setAdjustsFontSizeToFitWidth:1];
  v58 = v25;
  [v33 setTextColor:v25];
  v57 = (void *)v26;
  [v33 setBackgroundColor:v26];
  v56 = (void *)v27;
  [v33 setShadowColor:v27];
  objc_msgSend(v33, "setShadowOffset:", v29, v31);
  v61 = (void *)v22;
  [v33 setText:v22];
  [v33 setTextAlignment:1];
  [v33 setLineBreakMode:4];
  [v33 setNumberOfLines:0];
  [v33 setUserInteractionEnabled:0];
  [v33 setAdjustsFontForContentSizeCategory:1];
  [v33 setIsAccessibilityElement:0];
  [v5 addSubview:v33];
  [(AXGestureRecorderMainViewController *)self setInstructionsLabel:v33];
  v34 = [(AXGestureRecorderMainViewController *)self styleProvider];
  [v34 instructionsLabelHorizontalInset];
  double v36 = v35;

  v37 = [v5 safeAreaLayoutGuide];
  v48 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [v33 leadingAnchor];
  v54 = [v37 leadingAnchor];
  v55 = v38;
  v53 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36);
  v64[0] = v53;
  v39 = [v37 trailingAnchor];
  v51 = [v33 trailingAnchor];
  v52 = v39;
  v50 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v36);
  v64[1] = v50;
  v40 = [v33 topAnchor];
  v41 = [v37 topAnchor];
  v49 = v40;
  v42 = [v40 constraintEqualToAnchor:v41];
  v64[2] = v42;
  v43 = [v33 bottomAnchor];
  v44 = [(AXGestureRecorderMainViewController *)self controlsView];
  v63 = v5;
  if (v44)
  {
    v25 = [(AXGestureRecorderMainViewController *)self controlsView];
    [v25 topAnchor];
  }
  else
  {
    [v37 bottomAnchor];
  v45 = };
  v46 = [v43 constraintEqualToAnchor:v45];
  v64[3] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
  [v48 activateConstraints:v47];

  if (v44)
  {

    v45 = v25;
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)AXGestureRecorderMainViewController;
  [(AXGestureRecorderMainViewController *)&v16 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped_];
  if ([(AXGestureRecorderMainViewController *)self recorderType] == 2) {
    v4 = @"ChoosePointNavControllerTitle";
  }
  else {
    v4 = @"CustomGesturesNavControllerTitle";
  }
  objc_super v5 = AXUILocalizedStringForKey(v4);
  [(AXGestureRecorderMainViewController *)self setTitle:v5];

  v6 = [(AXGestureRecorderMainViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v3];

  if ([(AXGestureRecorderMainViewController *)self recorderType] != 2)
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:3 target:self action:sel__saveButtonTapped_];
    [v7 setEnabled:0];
    v8 = [(AXGestureRecorderMainViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];

    [(AXGestureRecorderMainViewController *)self setSaveButton:v7];
  }
  [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:2 enabled:0 animate:0 completion:&__block_literal_global_3];
  switch([(AXGestureRecorderMainViewController *)self recorderType])
  {
    case 0:
      double v10 = [(AXGestureRecorderMainViewController *)self controlsView];
      [v10 setMiddleButton:0];
      goto LABEL_13;
    case 1:
    case 3:
      uint64_t v9 = [(AXGestureRecorderMainViewController *)self controlsView];
      double v10 = [v9 makeButton];

      double v11 = AXUILocalizedStringForKey(@"CustomGesturesHideControls");
      [v10 setTitle:v11 forState:0];

      [v10 addTarget:self action:sel__hideChromeButtonTapped_ forControlEvents:64];
      double v12 = [(AXGestureRecorderMainViewController *)self controlsView];
      [v12 setMiddleButton:v10];
      goto LABEL_12;
    case 2:
      id v13 = [(AXGestureRecorderMainViewController *)self controlsView];

      if (v13) {
        _AXAssert();
      }
      id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v15 = AXUILocalizedStringForKey(@"CustomGesturesHideControls");
      double v10 = (void *)[v14 initWithTitle:v15 style:0 target:self action:sel__hideChromeButtonTapped_];

      double v12 = [(AXGestureRecorderMainViewController *)self navigationItem];
      [v12 setRightBarButtonItem:v10];
LABEL_12:

LABEL_13:
      break;
    default:
      break;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderMainViewController;
  [(AXGestureRecorderMainViewController *)&v6 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4F49420] assertionWithType:*MEMORY[0x1E4F49050] identifier:@"AST Gesture Recorder"];
  [(AXGestureRecorderMainViewController *)self setDisableSystemGesturesAssertion:v4];

  [(AXGestureRecorderMainViewController *)self _reset];
  objc_super v5 = [(AXGestureRecorderMainViewController *)self view];
  [v5 layoutSubviews];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXGestureRecorderMainViewController;
  [(AXGestureRecorderMainViewController *)&v4 viewDidDisappear:a3];
  [(AXGestureRecorderMainViewController *)self setDisableSystemGesturesAssertion:0];
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)AXGestureRecorderMainViewController;
  [(AXGestureRecorderMainViewController *)&v20 viewDidLayoutSubviews];
  id v3 = [(AXGestureRecorderMainViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  [v4 frame];
  double v6 = v5;

  objc_super v7 = [(AXGestureRecorderMainViewController *)self view];
  v8 = [v7 safeAreaLayoutGuide];
  [v8 layoutFrame];
  -[UIView setFrame:](self->_topView, "setFrame:", 0.0, 0.0, v6, v9);

  [(UIView *)self->_topView bounds];
  double v11 = v10;
  [(UIView *)self->_topView bounds];
  double v13 = v12;
  [(UIView *)self->_topView bounds];
  double v15 = v13 + v14 + -1.0;
  [(UIView *)self->_topView bounds];
  double v17 = v16;
  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  -[UIView setFrame:](self->_lineView, "setFrame:", v11, v15, v17, 1.0 / v19);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  double v5 = [(AXGestureRecorderMainViewController *)self view];
  [v5 layoutSubviews];
}

- (void)_saveButtonTapped:(id)a3
{
  int64_t v4 = [(AXGestureRecorderMainViewController *)self recorderType];
  if (v4 == 3)
  {
LABEL_4:
    [(AXGestureRecorderMainViewController *)self _saveWithMessage:0];
    return;
  }
  if (v4 != 1)
  {
    if (v4)
    {
      [(AXGestureRecorderMainViewController *)self recorderType];
      _AXAssert();
      return;
    }
    goto LABEL_4;
  }
  [(AXGestureRecorderMainViewController *)self _saveReplayableGesture];
}

- (void)_unhideChrome
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__unhideChrome object:0];
  id v3 = [(AXGestureRecorderMainViewController *)self navigationController];
  [v3 setNavigationBarHidden:0 animated:1];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke;
  v5[3] = &unk_1E649BED8;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.25];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke_2;
  v4[3] = &unk_1E649BED8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.25];
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], 0);
}

void __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) controlsView];
  [v1 setAlpha:1.0];
}

void __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) instructionsLabel];
  [v1 setAlpha:0.0];
}

- (void)_hideChrome
{
  id v3 = [(AXGestureRecorderMainViewController *)self navigationController];
  [v3 setNavigationBarHidden:1 animated:1];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AXGestureRecorderMainViewController__hideChrome__block_invoke;
  v4[3] = &unk_1E649BED8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.25];
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], 0);
}

void __50__AXGestureRecorderMainViewController__hideChrome__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) controlsView];
  [v1 setAlpha:0.0];
}

- (void)_hideChromeButtonTapped:(id)a3
{
  int64_t v4 = NSString;
  double v5 = AXUILocalizedStringForKey(@"CustomHideChromeInstructionsFormat");
  objc_super v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, 10);
  objc_super v7 = [(AXGestureRecorderMainViewController *)self instructionsLabel];
  [v7 setText:v6];

  v8 = [(AXGestureRecorderMainViewController *)self instructionsLabel];
  [v8 alpha];
  double v10 = v9;

  if (v10 != 1.0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__AXGestureRecorderMainViewController__hideChromeButtonTapped___block_invoke;
    v11[3] = &unk_1E649BED8;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.25];
  }
  [(AXGestureRecorderMainViewController *)self _hideChrome];
  [(AXGestureRecorderMainViewController *)self performSelector:sel__unhideChrome withObject:0 afterDelay:10.0];
}

void __63__AXGestureRecorderMainViewController__hideChromeButtonTapped___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) instructionsLabel];
  [v1 setAlpha:1.0];
}

- (void)_setLeftButtonIdentifier:(unint64_t)a3 enabled:(BOOL)a4 rightButtonIdentifier:(unint64_t)a5 enabled:(BOOL)a6 animate:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v13 = a8;
  [(AXGestureRecorderMainViewController *)self setLeftButtonIdentifier:a3];
  [(AXGestureRecorderMainViewController *)self setRightButtonIdentifier:a5];
  unsigned int v19 = 2;
  unsigned int v20 = 2;
  id v18 = 0;
  [(AXGestureRecorderMainViewController *)self _getButtonPropertiesForIdentifier:a3 enabled:v10 color:&v20 title:&v18];
  id v14 = v18;
  id v17 = 0;
  [(AXGestureRecorderMainViewController *)self _getButtonPropertiesForIdentifier:a5 enabled:v8 color:&v19 title:&v17];
  id v15 = v17;
  double v16 = [(AXGestureRecorderMainViewController *)self controlsView];
  [v16 setLeftButtonColor:v20 title:v14 enabled:v10 rightButtonColor:v19 title:v15 enabled:v8 animationDuration:0.0 completion:v13];
}

- (void)_getButtonPropertiesForIdentifier:(unint64_t)a3 enabled:(BOOL)a4 color:(int *)a5 title:(id *)a6
{
  switch(a3)
  {
    case 1uLL:
      char v8 = 0;
      if (a4) {
        int v7 = 2;
      }
      else {
        int v7 = 1;
      }
      double v9 = @"RE_RECORD";
      if (a5) {
        goto LABEL_12;
      }
      break;
    case 2uLL:
    case 4uLL:
      int v7 = 0;
      char v8 = 0;
      double v9 = @"Stop";
      if (a5) {
        goto LABEL_12;
      }
      break;
    case 3uLL:
      char v8 = 0;
      double v9 = @"Play";
      int v7 = 1;
      if (a5) {
        goto LABEL_12;
      }
      break;
    default:
      int v7 = 0;
      double v9 = 0;
      char v8 = 1;
      if (a5) {
LABEL_12:
      }
        *a5 = v7;
      break;
  }
  if (a6)
  {
    if (v8)
    {
      id v10 = 0;
    }
    else
    {
      AXUILocalizedStringForKey(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v10;
  }
}

- (void)_updateProgressView:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(AXGestureRecorderMainViewController *)self gestureRecordingDidStartTimeInterval];
  float v6 = (Current - v5) / 60.0;
  if (v6 >= 1.0)
  {
    [(AXGestureRecorderMainViewController *)self _manageDisplayLinkManager:0];
    if ([(AXGestureRecorderMainViewController *)self _isForRealTimeGesture])
    {
      int v7 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
      [v7 freezeAllDynamicFingerPaths];

      char v8 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
      [v8 preventFurtherRecording];
    }
    float v6 = 1.0;
  }
  id v10 = [(AXGestureRecorderMainViewController *)self controlsView];
  *(float *)&double v9 = v6;
  [v10 setProgress:v9];
}

- (void)_clearProgressView
{
  id v3 = [(AXGestureRecorderMainViewController *)self controlsView];
  [v3 setProgress:0.0];

  [(AXGestureRecorderMainViewController *)self _manageDisplayLinkManager:0];
}

- (void)_enterWaitingMode
{
  [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:1 rightButtonIdentifier:1 enabled:1 animate:1 completion:&__block_literal_global_334];
  id v3 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  [v3 preventFurtherRecording];

  [(AXGestureRecorderMainViewController *)self _clearProgressView];
}

- (void)_enterReplayMode
{
  [(AXGestureRecorderMainViewController *)self setInReplayMode:1];
  [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:1 enabled:0 animate:1 completion:&__block_literal_global_336];
  id v3 = [(AXGestureRecorderMainViewController *)self controlsView];
  [v3 setProgress:0.0];

  [(AXGestureRecorderMainViewController *)self setGestureRecordingDidStartTimeInterval:CFAbsoluteTimeGetCurrent()];
  [(AXGestureRecorderMainViewController *)self _manageDisplayLinkManager:1];
  id v4 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  [v4 replayRecordedGesture];
}

- (void)_releaseOutlets
{
  [(AXGestureRecorderMainViewController *)self setControlsView:0];
  [(AXGestureRecorderMainViewController *)self setInstructionsLabel:0];
  [(AXGestureRecorderMainViewController *)self setSaveButton:0];
}

- (void)_reset
{
  id v3 = [(AXGestureRecorderMainViewController *)self saveButton];
  [v3 setEnabled:0];

  id v4 = [(AXGestureRecorderMainViewController *)self _defaultInstructionalText];
  double v5 = [(AXGestureRecorderMainViewController *)self instructionsLabel];
  [v5 setText:v4];

  float v6 = [(AXGestureRecorderMainViewController *)self instructionsLabel];
  [v6 setAlpha:1.0];

  [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:2 enabled:0 animate:0 completion:&__block_literal_global_338];
  int v7 = [(AXGestureRecorderMainViewController *)self controlsView];
  [v7 setProgress:0.0];

  char v8 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  [v8 deleteAllFingerPaths];

  double v9 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  [v9 hideStaticView];

  id v10 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  double v11 = [v10 view];
  [v11 setNeedsLayout];

  [(AXGestureRecorderMainViewController *)self setGestureRecordingDidStartTimeInterval:0.0];
  [(AXGestureRecorderMainViewController *)self _manageDisplayLinkManager:0];
}

- (void)_hide
{
  [(AXGestureRecorderMainViewController *)self _reset];
  [(AXGestureRecorderMainViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_340_0];
}

- (void)_saveWithMessage:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = a3;
  float v6 = AXUILocalizedStringForKey(@"SaveAlertTitle");
  int v7 = [v4 alertControllerWithTitle:v6 message:v5 preferredStyle:1];

  char v8 = (void *)MEMORY[0x1E4FB1410];
  double v9 = AXUILocalizedStringForKey(@"CANCEL");
  id v10 = [v8 actionWithTitle:v9 style:1 handler:&__block_literal_global_351];

  [v7 addAction:v10];
  double v11 = (void *)MEMORY[0x1E4FB1410];
  double v12 = AXUILocalizedStringForKey(@"SAVE");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_2;
  v16[3] = &unk_1E649C250;
  id v17 = v7;
  id v18 = self;
  id v13 = v7;
  id v14 = [v11 actionWithTitle:v12 style:0 handler:v16];

  [v13 addAction:v14];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_4;
  v15[3] = &unk_1E649C278;
  v15[4] = self;
  [v13 addTextFieldWithConfigurationHandler:v15];
  [(AXGestureRecorderMainViewController *)self presentViewController:v13 animated:1 completion:0];
}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  id v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 text];

  if ([*(id *)(a1 + 40) _canSaveGestureWithName:v4])
  {
    [*(id *)(a1 + 40) _didSaveGestureWithName:v4];
    [*(id *)(a1 + 40) _reset];
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  AXUILocalizedStringForKey(@"name.in.use");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _saveWithMessage:v2];
}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = AXUILocalizedStringForKey(@"GestureNamePlaceholder");
  [v4 setPlaceholder:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 setAutocapitalizationType:2];
  [v4 setAutocorrectionType:1];
  [v4 setEnablesReturnKeyAutomatically:1];
}

- (BOOL)_canSaveGestureWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(AXGestureRecorderMainViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(AXGestureRecorderMainViewController *)self delegate];
    char v8 = [v7 gestureRecorder:self canSaveGestureWithName:v4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)_didSaveGestureWithName:(id)a3
{
  id v14 = a3;
  if ([(AXGestureRecorderMainViewController *)self recorderType] == 3)
  {
    id v4 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
    id v5 = [v4 recordedReplayableGestureRepresentation];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F49450]);
      [v6 setName:v14];
      [v6 addPointsFromReplayableGesture:v5];
      int v7 = [(AXGestureRecorderMainViewController *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        double v9 = [(AXGestureRecorderMainViewController *)self delegate];
        [v9 gestureRecorder:self saveNamedReplayableGesture:v6];
      }
    }
    [(AXGestureRecorderMainViewController *)self _hide];
LABEL_7:

    goto LABEL_9;
  }
  if (![(AXGestureRecorderMainViewController *)self recorderType])
  {
    id v10 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
    id v5 = [v10 recordedGesturePropertyListRepresentationWithName:v14];

    if (v5)
    {
      double v11 = [(AXGestureRecorderMainViewController *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = [(AXGestureRecorderMainViewController *)self delegate];
        [v13 gestureRecorder:self saveGestureWithPropertyListRepresentation:v5];
      }
    }
    goto LABEL_7;
  }
LABEL_9:
  [(AXGestureRecorderMainViewController *)self _hide];
}

- (void)_saveReplayableGesture
{
  id v3 = [(AXGestureRecorderMainViewController *)self gestureRecorderViewController];
  id v7 = [v3 recordedReplayableGestureRepresentation];

  if (v7)
  {
    id v4 = [(AXGestureRecorderMainViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(AXGestureRecorderMainViewController *)self delegate];
      [v6 gestureRecorder:self saveReplayableGesture:v7];
    }
  }
  [(AXGestureRecorderMainViewController *)self _hide];
}

- (void)_savePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AXGestureRecorderMainViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(AXGestureRecorderMainViewController *)self delegate];
    objc_msgSend(v8, "gestureRecorder:savePoint:", self, x, y);
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __50__AXGestureRecorderMainViewController__savePoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hide];
}

- (id)_defaultInstructionalText
{
  unint64_t v2 = [(AXGestureRecorderMainViewController *)self recorderType];
  if (v2 > 3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = AXUILocalizedStringForKey(off_1E649C2C0[v2]);
  }
  return v3;
}

- (BOOL)_isForRealTimeGesture
{
  uint64_t v2 = [(AXGestureRecorderMainViewController *)self recorderType];
  return AXGestureRecorderTypeIsForRealTimeGesture(v2);
}

- (void)_manageDisplayLinkManager:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AXGestureRecorderMainViewController *)self isDisplayLinkInEffect];
  if (v3)
  {
    if (v5) {
      return;
    }
    id v6 = [MEMORY[0x1E4F49430] currentDisplayLinkManager];
    [v6 addTarget:self selector:sel__updateProgressView_];
  }
  else
  {
    if (!v5) {
      return;
    }
    id v6 = [MEMORY[0x1E4F49430] currentDisplayLinkManager];
    [v6 removeTarget:self selector:sel__updateProgressView_];
  }

  [(AXGestureRecorderMainViewController *)self setIsDisplayLinkInEffect:v3];
}

- (double)maximumDurationOfRecordedGestureForGestureRecorderViewController:(id)a3
{
  return 60.0;
}

- (void)gestureRecorderViewController:(id)a3 didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(AXGestureRecorderMainViewController *)self recorderType] == 2)
  {
    -[AXGestureRecorderMainViewController _savePoint:](self, "_savePoint:", x, y);
    [(AXGestureRecorderMainViewController *)self _enterWaitingMode];
  }
  else
  {
    char v7 = [(AXGestureRecorderMainViewController *)self saveButton];
    [v7 setEnabled:1];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110__AXGestureRecorderMainViewController_gestureRecorderViewController_didStartRecordingAtomicFingerPathAtPoint___block_invoke;
    v10[3] = &unk_1E649BED8;
    v10[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:0.25];
    if ([(AXGestureRecorderMainViewController *)self rightButtonIdentifier] == 2) {
      [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:2 enabled:1 animate:1 completion:&__block_literal_global_386];
    }
    if (![(AXGestureRecorderMainViewController *)self recorderType]
      || ([(AXGestureRecorderMainViewController *)self gestureRecordingDidStartTimeInterval], v8 == 0.0))
    {
      double v9 = [(AXGestureRecorderMainViewController *)self controlsView];
      [v9 setProgress:0.0];

      [(AXGestureRecorderMainViewController *)self setGestureRecordingDidStartTimeInterval:CFAbsoluteTimeGetCurrent()];
    }
    [(AXGestureRecorderMainViewController *)self _manageDisplayLinkManager:1];
  }
}

void __110__AXGestureRecorderMainViewController_gestureRecorderViewController_didStartRecordingAtomicFingerPathAtPoint___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) instructionsLabel];
  [v1 setAlpha:0.0];
}

- (void)gestureRecorderViewControllerDidStopRecordingAtomicFingerPath:(id)a3
{
  if (![(AXGestureRecorderMainViewController *)self _isForRealTimeGesture])
  {
    id v4 = [MEMORY[0x1E4F49430] currentDisplayLinkManager];
    char v5 = [v4 isPaused];

    if ((v5 & 1) == 0)
    {
      [(AXGestureRecorderMainViewController *)self _clearProgressView];
    }
  }
}

- (void)gestureRecorderViewControllerDidFinishReplayingRecordedGesture:(id)a3
{
  id v4 = a3;
  [(AXGestureRecorderMainViewController *)self _clearProgressView];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__AXGestureRecorderMainViewController_gestureRecorderViewControllerDidFinishReplayingRecordedGesture___block_invoke;
  v5[3] = &unk_1E649C2A0;
  objc_copyWeak(&v6, &location);
  [(AXGestureRecorderMainViewController *)self _setLeftButtonIdentifier:3 enabled:1 rightButtonIdentifier:1 enabled:1 animate:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __102__AXGestureRecorderMainViewController_gestureRecorderViewControllerDidFinishReplayingRecordedGesture___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _manageDisplayLinkManager:0];
}

- (BOOL)isChromeVisibleForGestureRecorderViewController:(id)a3
{
  BOOL v3 = [(AXGestureRecorderMainViewController *)self navigationController];
  char v4 = [v3 isNavigationBarHidden] ^ 1;

  return v4;
}

- (void)gestureRecorderViewController:(id)a3 setChromeVisible:(BOOL)a4
{
  if (a4) {
    [(AXGestureRecorderMainViewController *)self _unhideChrome];
  }
  else {
    [(AXGestureRecorderMainViewController *)self _hideChrome];
  }
}

- (void)gestureRecorderControlsView:(id)a3 buttonTappedAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v9 = v6;
    unint64_t v7 = [(AXGestureRecorderMainViewController *)self rightButtonIdentifier];
  }
  else
  {
    if (a4) {
      goto LABEL_13;
    }
    id v9 = v6;
    unint64_t v7 = [(AXGestureRecorderMainViewController *)self leftButtonIdentifier];
  }
  if (v7 == 1)
  {
    [(AXGestureRecorderMainViewController *)self _reset];
    goto LABEL_12;
  }
  if (v7 == 3)
  {
    [(AXGestureRecorderMainViewController *)self _enterReplayMode];
    goto LABEL_12;
  }
  BOOL v8 = v7 == 2;
  id v6 = v9;
  if (v8)
  {
    [(AXGestureRecorderMainViewController *)self _enterWaitingMode];
LABEL_12:
    id v6 = v9;
  }
LABEL_13:
}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (AXGestureRecorderViewController)gestureRecorderViewController
{
  return self->_gestureRecorderViewController;
}

- (void)setGestureRecorderViewController:(id)a3
{
}

- (AXGestureRecorderControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (unint64_t)leftButtonIdentifier
{
  return self->_leftButtonIdentifier;
}

- (void)setLeftButtonIdentifier:(unint64_t)a3
{
  self->_leftButtonIdentifier = a3;
}

- (unint64_t)rightButtonIdentifier
{
  return self->_rightButtonIdentifier;
}

- (void)setRightButtonIdentifier:(unint64_t)a3
{
  self->_rightButtonIdentifier = a3;
}

- (double)gestureRecordingDidStartTimeInterval
{
  return self->_gestureRecordingDidStartTimeInterval;
}

- (void)setGestureRecordingDidStartTimeInterval:(double)a3
{
  self->_gestureRecordingDidStartTimeInterval = a3;
}

- (BOOL)isInReplayMode
{
  return self->_inReplayMode;
}

- (void)setInReplayMode:(BOOL)a3
{
  self->_inReplayMode = a3;
}

- (AXGestureRecorderMainViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXGestureRecorderMainViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
}

- (id)appDidResignActiveNotificationHandlerToken
{
  id WeakRetained = objc_loadWeakRetained(&self->_appDidResignActiveNotificationHandlerToken);
  return WeakRetained;
}

- (void)setAppDidResignActiveNotificationHandlerToken:(id)a3
{
}

- (int64_t)recorderType
{
  return self->_recorderType;
}

- (void)setRecorderType:(int64_t)a3
{
  self->_recorderType = a3;
}

- (BOOL)isDisplayLinkInEffect
{
  return self->_isDisplayLinkInEffect;
}

- (void)setIsDisplayLinkInEffect:(BOOL)a3
{
  self->_isDisplayLinkInEffect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_appDidResignActiveNotificationHandlerToken);
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_gestureRecorderViewController, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end