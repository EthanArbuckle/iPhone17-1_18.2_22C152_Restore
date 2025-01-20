@interface BKUIPearlEnrollController
+ (BOOL)isDisplayZoomEnabled;
+ (BOOL)isPearlAvailable;
+ (BOOL)isPearlInterlocked;
+ (void)preloadWithCompletion:(id)a3;
- (BKIdentity)existingIdentity;
- (BKUIOrientationStateHandler)orientationStateHandler;
- (BKUIPearlCoachingController)coachingController;
- (BKUIPearlEnrollController)init;
- (BKUIPearlEnrollController)initWithPreloadedState:(id)a3;
- (BKUIPearlEnrollControllerDelegate)delegate;
- (BKUIPearlEnrollControllerPreloadedState)preloadState;
- (BKUIPearlEnrollViewController)enrollViewController;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)hasBeenPortrait;
- (BOOL)inBuddy;
- (BOOL)inSheet;
- (BOOL)isModalInPresentation;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (CGSize)preferredContentSize;
- (NSObject)rotationChangeToken;
- (NSObject)rotationLockToken;
- (UINavigationBar)navbarCopy;
- (id)navigationItem;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)enrollmentConfiguration;
- (void)_copyAndShowInternalNavBar;
- (void)_startObserving;
- (void)coachingSkipped;
- (void)dealloc;
- (void)deviceOrientationChanged:(int64_t)a3;
- (void)deviceOrientationChanged:(int64_t)a3 duration:(double)a4;
- (void)deviceOrientationDidChange:(id)a3;
- (void)diffSystemAndForcedRotationOrientations;
- (void)pearlEnrollControllerCompleted:(id)a3;
- (void)pearlEnrollViewController:(id)a3 finishedEnrollWithError:(id)a4;
- (void)primeWithExternalizedAuthContext:(id)a3;
- (void)primeWithPasscode:(id)a3;
- (void)resetLayout;
- (void)setCoachingController:(id)a3;
- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setCustomDetailString:(id)a3 forState:(int)a4;
- (void)setCustomInstructionString:(id)a3 forState:(int)a4;
- (void)setDelegate:(id)a3;
- (void)setEnrollViewController:(id)a3;
- (void)setEnrollmentConfiguration:(unint64_t)a3;
- (void)setExistingIdentity:(id)a3;
- (void)setHasBeenPortrait:(BOOL)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setOrientationStateHandler:(id)a3;
- (void)setPreloadState:(id)a3;
- (void)setRotationChangeToken:(id)a3;
- (void)setRotationLockToken:(id)a3;
- (void)setTransparencyForCoachingController;
- (void)startInternalGlassesFlow;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BKUIPearlEnrollController

- (BKUIPearlEnrollController)initWithPreloadedState:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKUIPearlEnrollController;
  v6 = [(BKUIPearlEnrollController *)&v15 init];
  if (v6)
  {
    v7 = objc_alloc_init(BKUIOrientationStateHandler);
    orientationStateHandler = v6->_orientationStateHandler;
    v6->_orientationStateHandler = v7;

    v9 = objc_alloc_init(BKUIPearlCoachingController);
    coachingController = v6->_coachingController;
    v6->_coachingController = v9;

    [(BKUIPearlCoachingController *)v6->_coachingController setDelegate:v6];
    -[BKUIPearlCoachingController setIsDisplayZoomEnabled:](v6->_coachingController, "setIsDisplayZoomEnabled:", [(id)objc_opt_class() isDisplayZoomEnabled]);
    [(BKUIPearlEnrollController *)v6 addChildViewController:v6->_coachingController];
    objc_storeStrong((id *)&v6->_preloadState, a3);
    if (+[BKUIUtils containerEnrollmentStyleEnabled]) {
      v11 = BKUIPearlJindoEnrollViewController;
    }
    else {
      v11 = BKUIPearlEnrollViewController;
    }
    uint64_t v12 = [[v11 alloc] initWithPreloadedState:v5];
    enrollViewController = v6->_enrollViewController;
    v6->_enrollViewController = (BKUIPearlEnrollViewController *)v12;

    [(BKUIPearlEnrollViewController *)v6->_enrollViewController setDelegate:v6];
    -[BKUIPearlEnrollViewController setIsDisplayZoomEnabled:](v6->_enrollViewController, "setIsDisplayZoomEnabled:", [(id)objc_opt_class() isDisplayZoomEnabled]);
    [(BKUIPearlEnrollController *)v6 addChildViewController:v6->_enrollViewController];
    [(BKUIPearlEnrollController *)v6 setEnrollmentConfiguration:0];
  }

  return v6;
}

- (BKUIPearlEnrollController)init
{
  return [(BKUIPearlEnrollController *)self initWithPreloadedState:0];
}

- (BOOL)isModalInPresentation
{
  v2 = [(BKUIPearlEnrollController *)self enrollViewController];
  char v3 = [v2 isModalInPresentation];

  return v3;
}

- (void)startInternalGlassesFlow
{
  char v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: startInternalGlassesFlow", buf, 2u);
  }

  BOOL v4 = +[BKUIUtils containerEnrollmentStyleEnabled];
  id v5 = off_1E6EA1B08;
  if (!v4) {
    id v5 = off_1E6EA1AF8;
  }
  v6 = (void *)[objc_alloc(*v5) initWithPreloadedState:self->_preloadState];
  [v6 setEnrollmentConfiguration:4];
  [v6 setDelegate:self];
  objc_msgSend(v6, "setIsDisplayZoomEnabled:", objc_msgSend((id)objc_opt_class(), "isDisplayZoomEnabled"));
  v7 = [(BKUIPearlEnrollController *)self enrollViewController];
  objc_msgSend(v6, "setInBuddy:", objc_msgSend(v7, "inBuddy"));

  [v6 setGlassesMidFlowUpsell:1];
  v8 = [(BKUIPearlEnrollController *)self enrollViewController];
  v9 = [v8 currentOperationHandler];
  v10 = [v9 externalizedAuthContext];
  [v6 primeWithExternalizedAuthContext:v10];

  v11 = [(BKUIPearlEnrollController *)self enrollViewController];
  uint64_t v12 = [v11 currentOperationHandler];
  v13 = [v12 credential];
  [v6 primeWithPasscode:v13];

  [(BKUIPearlEnrollController *)self addChildViewController:v6];
  v14 = [(BKUIPearlEnrollController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v6 view];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(BKUIPearlEnrollController *)self view];
  v25 = [v6 view];
  [v24 addSubview:v25];

  [v6 didMoveToParentViewController:self];
  objc_msgSend(v6, "setInBuddyGlassesFollowUp:", -[BKUIPearlEnrollController inBuddy](self, "inBuddy"));
  v26 = +[BKUIPearlEnrollAnimationManager sharedManager];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__BKUIPearlEnrollController_startInternalGlassesFlow__block_invoke;
  v28[3] = &unk_1E6EA2180;
  v28[4] = self;
  id v29 = v6;
  id v27 = v6;
  [v26 transitionTo:v27 completion:v28];
}

uint64_t __53__BKUIPearlEnrollController_startInternalGlassesFlow__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) enrollViewController];
  [v2 removeFromParentViewController];

  char v3 = [*(id *)(a1 + 32) enrollViewController];
  BOOL v4 = [v3 view];
  [v4 removeFromSuperview];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 setEnrollViewController:v6];
}

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)BKUIPearlEnrollController;
  [(BKUIPearlEnrollController *)&v51 viewDidLoad];
  char v3 = [(BKUIPearlEnrollController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(BKUIPearlEnrollController *)self view];
  v13 = [MEMORY[0x1E4F428B8] blackColor];
  [v12 setBackgroundColor:v13];

  v14 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(BKUIPearlEnrollController *)self _startObserving];
    double v16 = [(BKUIPearlEnrollController *)self orientationStateHandler];
    int v17 = [v16 rotationLockStatusIsLocked];

    double v18 = [(BKUIPearlEnrollController *)self orientationStateHandler];
    uint64_t v19 = [v18 rawDeviceOrientationIgnoringOrientationLocks];

    int64_t v20 = [(UIViewController *)self bkui_uiforDeviceOrientation:v19];
    int64_t v21 = +[BKUIUtils activeInterfaceOrientationForView:0];
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F42FF8], "bkui_reverseLeftRight:", v21);
    if (v20) {
      int64_t v23 = v20;
    }
    else {
      int64_t v23 = v22;
    }
    if (!v17) {
      int64_t v23 = v22;
    }
    self->_orientation = v23;
    v24 = [(BKUIPearlEnrollController *)self coachingController];
    [v24 setOrientation:self->_orientation];

    v25 = [(BKUIPearlEnrollController *)self coachingController];
    [v25 deviceOrientationChanged];

    v26 = [(BKUIPearlEnrollController *)self view];
    int64_t v27 = +[BKUIUtils activeInterfaceOrientationForView:v26];

    if (v27 == 1) {
      [(BKUIPearlEnrollController *)self setHasBeenPortrait:1];
    }
  }
  v28 = [(BKUIPearlEnrollController *)self enrollViewController];
  id v29 = [v28 view];
  objc_msgSend(v29, "setFrame:", v5, v7, v9, v11);

  v30 = [(BKUIPearlEnrollController *)self view];
  v31 = [(BKUIPearlEnrollController *)self enrollViewController];
  v32 = [v31 view];
  [v30 addSubview:v32];

  v33 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v33 didMoveToParentViewController:self];

  v34 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v36 = [(BKUIPearlEnrollController *)self view];
    v37 = [(BKUIPearlEnrollController *)self coachingController];
    v38 = [v37 view];
    [v36 addSubview:v38];

    v39 = [(BKUIPearlEnrollController *)self coachingController];
    [v39 didMoveToParentViewController:self];

    [(BKUIPearlEnrollController *)self setTransparencyForCoachingController];
    v40 = [(BKUIPearlEnrollController *)self coachingController];
    v41 = [v40 view];
    objc_msgSend(v41, "setFrame:", v5, v7, v9, v11);

    v42 = [(BKUIPearlEnrollController *)self view];
    v43 = [(BKUIPearlEnrollController *)self navbarCopy];
    [v42 bringSubviewToFront:v43];
  }
  if (![(BKUIPearlEnrollController *)self inBuddy])
  {
    objc_initWeak(&location, self);
    v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v45 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v46 = *MEMORY[0x1E4F43660];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __40__BKUIPearlEnrollController_viewDidLoad__block_invoke;
    v48[3] = &unk_1E6EA2798;
    objc_copyWeak(&v49, &location);
    id v47 = (id)[v44 addObserverForName:v46 object:0 queue:v45 usingBlock:v48];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
}

void __40__BKUIPearlEnrollController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)setTransparencyForCoachingController
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134) {
      goto LABEL_7;
    }
    uint64_t v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454) {
      goto LABEL_7;
    }
    uint64_t v4 = 2487868872;
  }
  if (v3 == v4)
  {
LABEL_7:
    if (self->_orientation == 4) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    goto LABEL_10;
  }
  if (self->_orientation == 1) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
LABEL_10:
  double v6 = [(BKUIPearlEnrollController *)self coachingController];
  double v7 = [v6 view];
  [v7 setAlpha:v5];

  double v8 = _BKUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [(BKUIPearlEnrollController *)self coachingController];
    double v10 = [v9 view];
    [v10 alpha];
    int64_t orientation = self->_orientation;
    int v13 = 134218240;
    uint64_t v14 = v12;
    __int16 v15 = 2048;
    int64_t v16 = orientation;
    _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "Coaching controller transparency: %f for orientation: %ld", (uint8_t *)&v13, 0x16u);
  }
}

- (unint64_t)enrollmentConfiguration
{
  v2 = [(BKUIPearlEnrollController *)self enrollViewController];
  unint64_t v3 = [v2 enrollmentConfiguration];

  return v3;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  id v4 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v4 setEnrollmentConfiguration:a3];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

+ (BOOL)isDisplayZoomEnabled
{
  v2 = (void *)MGCopyAnswer();
  unint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 _referenceBounds];
  double v5 = v4;
  double v7 = v6;

  if (v2)
  {
    double v8 = [v2 objectForKeyedSubscript:@"zoomed"];
    if ((unint64_t)[v8 count] < 4)
    {
      BOOL v12 = 0;
    }
    else
    {
      double v9 = [v8 objectAtIndexedSubscript:1];
      double v10 = [v8 objectAtIndexedSubscript:3];
      double v11 = v10;
      BOOL v12 = 0;
      if (v9 && v10)
      {
        [v10 floatValue];
        double v14 = v13;
        [v9 floatValue];
        BOOL v12 = v7 == v15 && v5 == v14;
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BKUIPearlEnrollController;
  -[BKUIPearlEnrollController viewWillAppear:](&v23, sel_viewWillAppear_);
  double v5 = [(BKUIPearlEnrollController *)self view];
  double v6 = [MEMORY[0x1E4F428B8] blackColor];
  [v5 setBackgroundColor:v6];

  double v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(BKUIPearlEnrollController *)self _copyAndShowInternalNavBar];
    double v9 = [(BKUIPearlEnrollController *)self navbarCopy];
    double v10 = [(BKUIPearlEnrollController *)self view];
    id v11 = v9;
    [v10 size];
    double v13 = v12;
    [v11 size];
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v13, v14);

    float v15 = [(BKUIPearlEnrollController *)self view];
    int64_t v16 = [v15 layer];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v22[5] = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v22[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v22[7] = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v22[0] = *MEMORY[0x1E4F39B10];
    v22[1] = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v22[3] = v20;
    [v16 setTransform:v22];

    int64_t v21 = [(BKUIPearlEnrollController *)self coachingController];
    LODWORD(v16) = [v21 needsToShow];

    [(BKUIPearlEnrollController *)self setCoachingHidden:v16 ^ 1 animated:v3];
    [(BKUIPearlEnrollController *)self diffSystemAndForcedRotationOrientations];
  }
}

- (id)navigationItem
{
  BOOL v3 = [(BKUIPearlEnrollController *)self navbarCopy];
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlEnrollController;
  double v4 = [(BKUIPearlEnrollController *)&v8 navigationItem];
  [v3 _pushNavigationItem:v4 transition:0];

  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlEnrollController;
  double v5 = [(BKUIPearlEnrollController *)&v7 navigationItem];

  return v5;
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlEnrollController;
  [(BKUIPearlEnrollController *)&v19 viewWillLayoutSubviews];
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [MEMORY[0x1E4F83A70] preferredContentSize];
    double v6 = v5;
    double v8 = v7;
    if (![(BKUIPearlEnrollController *)self inSheet])
    {
      double v9 = [MEMORY[0x1E4F42D90] mainScreen];
      double v10 = [v9 fixedCoordinateSpace];
      [v10 bounds];
      double v6 = v11;
      double v8 = v12;
    }
    double v13 = [(BKUIPearlEnrollController *)self view];
    [v13 bounds];
    double MidX = CGRectGetMidX(v20);
    float v15 = [(BKUIPearlEnrollController *)self view];
    [v15 bounds];
    double MidY = CGRectGetMidY(v21);

    long long v17 = [(BKUIPearlEnrollController *)self enrollViewController];
    long long v18 = [v17 view];
    objc_msgSend(v18, "setFrame:", MidX - v6 * 0.5, MidY - v8 * 0.5, v6, v8);
  }
}

- (CGSize)preferredContentSize
{
  [MEMORY[0x1E4F83AF8] preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v7 userInterfaceIdiom] != 1) {
    goto LABEL_10;
  }
  double v8 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  if (([v8 rotationLockStatusIsLocked] & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  double v9 = [(BKUIPearlEnrollController *)self view];
  double v10 = [v9 window];
  double v11 = [v10 windowScene];
  unint64_t v12 = [v11 interfaceOrientation] - 3;

  if (v12 <= 1) {
    double v13 = v6;
  }
  else {
    double v13 = v4;
  }
  if (v12 <= 1) {
    double v6 = v4;
  }
  double v4 = v13;
LABEL_11:
  double v14 = v4;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)deviceOrientationChanged:(int64_t)a3
{
}

- (void)deviceOrientationChanged:(int64_t)a3 duration:(double)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  double v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0].f64[0]) = 134218240;
    *(void *)((char *)buf[0].f64 + 4) = a3;
    WORD2(buf[0].f64[1]) = 2048;
    *(double *)((char *)&buf[0].f64[1] + 6) = a4;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "deviceOrientationChanged: int64_t orientation = %lu, duration = %f", (uint8_t *)buf, 0x16u);
  }

  double v8 = [(BKUIPearlEnrollController *)self coachingController];
  [v8 setOrientation:a3];

  double v9 = [(BKUIPearlEnrollController *)self coachingController];
  char v10 = [v9 needsToShow];

  int64_t orientation = self->_orientation;
  self->_int64_t orientation = a3;
  unint64_t v12 = [(BKUIPearlEnrollController *)self coachingController];
  [v12 setOrientation:a3];

  double v13 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  if ([v13 rotationLockStatusIsLocked])
  {
    BOOL v14 = !self->_systemRotationAnimating;

    if (v14)
    {
      int64_t v15 = [(UIViewController *)self bkui_deviceOrientationForIterfaceOrientation:orientation];
      int64_t v16 = [(UIViewController *)self bkui_deviceOrientationForIterfaceOrientation:self->_orientation];
      objc_initWeak((id *)buf, self);
      long long v17 = [(BKUIPearlEnrollController *)self navigationController];
      long long v18 = [v17 view];
      [v18 bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      int64_t v27 = [(BKUIPearlEnrollController *)self view];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke;
      v55[3] = &unk_1E6EA27C0;
      v55[4] = self;
      char v56 = v10;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_2;
      v52[3] = &unk_1E6EA27E8;
      objc_copyWeak(&v53, (id *)buf);
      v52[4] = self;
      char v54 = v10;
      -[UIViewController bkui_rotateView:fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:](self, "bkui_rotateView:fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:", v27, v15, v16, v55, v52, v20, v22, v24, v26, a4);

      objc_destroyWeak(&v53);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {
  }
  [(BKUIPearlEnrollController *)self resetLayout];
  v28 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v29 = [v28 userInterfaceIdiom];

  if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v30 = [(BKUIPearlEnrollController *)self orientationStateHandler];
    int64_t v31 = -[UIViewController bkui_uiforDeviceOrientation:](self, "bkui_uiforDeviceOrientation:", [v30 rawDeviceOrientationIgnoringOrientationLocks]);
    v32 = [(BKUIPearlEnrollController *)self coachingController];
    [v32 setOrientation:v31];

    v33 = [(BKUIPearlEnrollController *)self coachingController];
    int v34 = [v33 needsToShow];

    uint64_t v35 = [(BKUIPearlEnrollController *)self enrollViewController];
    v36 = [(BKUIPearlEnrollController *)self coachingController];
    objc_msgSend(v35, "animateWithOrientation:", objc_msgSend(v36, "orientation"));

    if ((v34 & 1) == 0)
    {
      v37 = [(BKUIPearlEnrollController *)self enrollViewController];
      [v37 setEnrollMovieViewHidden:0];
    }
    v38 = _BKUILoggingFacility();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].f64[0]) = 0;
      _os_log_impl(&dword_1E4B6C000, v38, OS_LOG_TYPE_DEFAULT, "Enroll controller completed size transition", (uint8_t *)buf, 2u);
    }

    if ([(BKUIPearlEnrollController *)self hasBeenPortrait])
    {
      long long v58 = 0u;
      memset(buf, 0, sizeof(buf));
      v39 = [(BKUIPearlEnrollController *)self enrollViewController];
      v40 = [v39 view];
      v41 = v40;
      if (v40)
      {
        [v40 transform];
      }
      else
      {
        long long v58 = 0u;
        memset(buf, 0, sizeof(buf));
      }

      buf[0] = vrndaq_f64(buf[0]);
      buf[1] = vrndaq_f64(buf[1]);
      float64x2_t v50 = buf[1];
      long long v51 = v58;
      float64x2_t v49 = buf[0];
      v42 = [(BKUIPearlEnrollController *)self enrollViewController];
      v43 = [v42 view];
      v48[0] = v49;
      v48[1] = v50;
      v48[2] = v51;
      [v43 setTransform:v48];
    }
    objc_initWeak((id *)buf, self);
    if (v34)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_28;
      v46[3] = &unk_1E6EA2098;
      objc_copyWeak(&v47, (id *)buf);
      [(BKUIPearlEnrollController *)self setCoachingHidden:0 animated:1 completion:v46];
      objc_destroyWeak(&v47);
    }
    else
    {
      [(BKUIPearlEnrollController *)self setCoachingHidden:1 animated:1];
    }
    v44 = [(BKUIPearlEnrollController *)self view];
    BOOL v45 = +[BKUIUtils activeInterfaceOrientationForView:v44] == 1;

    if (v45) {
      [(BKUIPearlEnrollController *)self setHasBeenPortrait:1];
    }
    self->_systemRotationAnimating = 0;
    objc_destroyWeak((id *)buf);
  }
}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  double v3 = [MEMORY[0x1E4F428B8] redColor];
  id v4 = (id)objc_msgSend(v2, "bkui_debugBorder:withWidth:", v3, 1);

  double v5 = [*(id *)(a1 + 32) coachingController];
  [v5 stopCoachingAnimation];

  [*(id *)(a1 + 32) setCoachingHidden:*(unsigned char *)(a1 + 40) == 0 animated:1];
  double v6 = [*(id *)(a1 + 32) enrollViewController];
  [v6 animateWithOrientation:*(void *)(*(void *)(a1 + 32) + 1032)];

  if (!*(unsigned char *)(a1 + 40))
  {
    double v7 = [*(id *)(a1 + 32) enrollViewController];
    [v7 setEnrollMovieViewHidden:0];
  }
  id v9 = [*(id *)(a1 + 32) navigationController];
  double v8 = [v9 view];
  [v8 layoutIfNeeded];
}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Enroll controller completed size transition", buf, 2u);
  }

  if ([*(id *)(a1 + 32) hasBeenPortrait])
  {
    float64x2_t v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)buf = 0u;
    id v4 = [*(id *)(a1 + 32) enrollViewController];
    double v5 = [v4 view];
    double v6 = v5;
    if (v5)
    {
      [v5 transform];
    }
    else
    {
      float64x2_t v18 = 0u;
      long long v19 = 0u;
      *(_OWORD *)buf = 0u;
    }

    *(float64x2_t *)buf = vrndaq_f64(*(float64x2_t *)buf);
    float64x2_t v18 = vrndaq_f64(v18);
    float64x2_t v15 = v18;
    long long v16 = v19;
    long long v14 = *(_OWORD *)buf;
    double v7 = [*(id *)(a1 + 32) enrollViewController];
    double v8 = [v7 view];
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    [v8 setTransform:v13];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v9 = [*(id *)(a1 + 32) enrollViewController];
    [v9 setEnrollMovieViewHidden:1];
  }
  char v10 = [*(id *)(a1 + 32) view];
  int64_t v11 = +[BKUIUtils activeInterfaceOrientationForView:v10];

  if (v11 == 1) {
    [*(id *)(a1 + 32) setHasBeenPortrait:1];
  }
  unint64_t v12 = [*(id *)(a1 + 32) coachingController];
  [v12 deviceOrientationChanged];
}

void __63__BKUIPearlEnrollController_deviceOrientationChanged_duration___block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 center];
  double v3 = v2;
  double v5 = v4;
  double v6 = [WeakRetained coachingController];
  double v7 = [v6 view];
  objc_msgSend(v7, "setCenter:", v3, v5);

  double v8 = [WeakRetained enrollViewController];
  [v8 setEnrollMovieViewHidden:1];

  id v9 = [WeakRetained coachingController];
  [v9 deviceOrientationChanged];
}

- (void)_startObserving
{
  objc_initWeak(&location, self);
  double v3 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  double v7 = __44__BKUIPearlEnrollController__startObserving__block_invoke;
  double v8 = &unk_1E6EA2810;
  objc_copyWeak(&v9, &location);
  [v3 registerRotationObserver:&v5];

  double v4 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  [v4 registerRotationLockObserver:&__block_literal_global_3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__BKUIPearlEnrollController__startObserving__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = objc_msgSend(WeakRetained, "bkui_uiforDeviceOrientation:", a2);
  uint64_t v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "ForcedRotation: orientation changed: deviceOrientation = %lu, int64_t orientation = %lu", (uint8_t *)&v11, 0x16u);
  }

  if (!a2
    || (unint64_t)(a2 - 5) < 2
    || (unint64_t)(a2 - 5) < 2 == a2
    || ([MEMORY[0x1E4F42738] sharedApplication],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 applicationState],
        v6,
        v7))
  {
    double v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v10 = [v9 applicationState];
      int v11 = 134218240;
      uint64_t v12 = v10;
      __int16 v13 = 2048;
      uint64_t v14 = a2;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "ForcedRotration:[orientation stat change callback pruned] - application state %li, orientation %li", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [WeakRetained deviceOrientationChanged:v4];
    [WeakRetained setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

void __44__BKUIPearlEnrollController__startObserving__block_invoke_31(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  double v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "ForcedRotration:[rotation lock status changed] - locked:%i", (uint8_t *)v4, 8u);
  }
}

- (void)resetLayout
{
  double v3 = [(BKUIPearlEnrollController *)self view];
  uint64_t v4 = [MEMORY[0x1E4F428B8] greenColor];
  id v5 = (id)objc_msgSend(v3, "bkui_debugBorder:withWidth:", v4, 1);

  uint64_t v6 = [(BKUIPearlEnrollController *)self coachingController];
  [v6 stopCoachingAnimation];

  uint64_t v7 = [(BKUIPearlEnrollController *)self view];
  double v8 = [v7 layer];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v13[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v13[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v13[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v13[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v13[0] = *MEMORY[0x1E4F39B10];
  v13[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  _OWORD v13[3] = v12;
  [v8 setTransform:v13];
}

- (void)diffSystemAndForcedRotationOrientations
{
  double v3 = [(BKUIPearlEnrollController *)self view];
  self->_int64_t orientation = [(UIViewController *)self bkui_reverseLeftRight:+[BKUIUtils activeInterfaceOrientationForView:v3]];

  uint64_t v4 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  int64_t v5 = -[UIViewController bkui_uiforDeviceOrientation:](self, "bkui_uiforDeviceOrientation:", [v4 rawDeviceOrientationIgnoringOrientationLocks]);

  if (v5)
  {
    [(BKUIPearlEnrollController *)self deviceOrientationChanged:v5 duration:0.0];
  }
}

- (void)_copyAndShowInternalNavBar
{
  double v3 = [(BKUIPearlEnrollController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  int64_t v5 = +[BKUITypeSafeCopier copy:v4];
  navbarCopy = self->_navbarCopy;
  self->_navbarCopy = v5;

  uint64_t v7 = [(BKUIPearlEnrollController *)self navbarCopy];
  double v8 = [(BKUIPearlEnrollController *)self navigationItem];
  [v7 _pushNavigationItem:v8 transition:0];

  long long v9 = [(BKUIPearlEnrollController *)self navigationController];
  [v9 setNavigationBarHidden:1 animated:0];

  id v11 = [(BKUIPearlEnrollController *)self view];
  long long v10 = [(BKUIPearlEnrollController *)self navbarCopy];
  [v11 addSubview:v10];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollController;
  [(BKUIPearlEnrollController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = [(BKUIPearlEnrollController *)self navbarCopy];
  [v4 removeFromSuperview];

  int64_t v5 = [(BKUIPearlEnrollController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollController;
  [(BKUIPearlEnrollController *)&v5 viewDidDisappear:a3];
  [(BKUIPearlEnrollController *)self setRotationLockToken:0];
  [(BKUIPearlEnrollController *)self setRotationChangeToken:0];
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  objc_super v5 = [(BKUIPearlEnrollController *)self orientationStateHandler];
  char v6 = [v5 rotationLockStatusIsLocked];

  return v6;
}

- (void)deviceOrientationDidChange:(id)a3
{
  uint64_t v4 = [(BKUIPearlEnrollController *)self coachingController];
  int v5 = [v4 needsToShow];

  [(BKUIPearlEnrollController *)self setCoachingHidden:v5 ^ 1u animated:1];
}

- (void)coachingSkipped
{
  id v4 = [(BKUIPearlEnrollController *)self delegate];
  double v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:0];
  [v4 pearlEnrollController:self finishedEnrollWithError:v3];
}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v9 = _BKUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v5;
    _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "Setting coaching hidden: %i animated: %i", buf, 0xEu);
  }

  if (v5) {
    double v10 = 0.389999986;
  }
  else {
    double v10 = 0.0;
  }
  uint64_t v11 = MEMORY[0x1E4F42FF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke;
  v16[3] = &unk_1E6EA2858;
  v16[4] = self;
  BOOL v17 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke_2;
  _OWORD v13[3] = &unk_1E6EA2880;
  BOOL v15 = v6;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  +[UIView bkui_animateWithDuration:animations:completion:](v10, v11, v16, v13);
}

void __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v3 = [*(id *)(a1 + 32) coachingController];
  double v2 = [v3 view];
  [v2 setAlpha:v1];
}

uint64_t __67__BKUIPearlEnrollController_setCoachingHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    double v2 = [*(id *)(a1 + 32) enrollViewController];
    [v2 restartEnroll];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(BKUIPearlEnrollController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v8 = [(BKUIPearlEnrollController *)self enrollViewController];
    id v3 = v8;
  }
  int64_t v9 = [v8 preferredStatusBarStyle];

  return v9;
}

- (BOOL)inBuddy
{
  double v2 = [(BKUIPearlEnrollController *)self enrollViewController];
  char v3 = [v2 inBuddy];

  return v3;
}

- (void)setInBuddy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v5 setInBuddy:v3];

  id v6 = [(BKUIPearlEnrollController *)self coachingController];
  [v6 setInBuddy:v3];
}

- (void)setInSheet:(BOOL)a3
{
  BOOL v3 = a3;
  self->_inSheet = a3;
  uint64_t v5 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v5 setInSheet:v3];

  id v6 = [(BKUIPearlEnrollController *)self coachingController];
  [v6 setInSheet:v3];
}

- (void)setExistingIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v5 setExistingIdentity:v4];
}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v7 setCustomInstructionString:v6 forState:v4];
}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v7 setCustomDetailString:v6 forState:v4];
}

- (void)primeWithPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v5 primeWithPasscode:v4];
}

- (void)primeWithExternalizedAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollController *)self enrollViewController];
  [v5 primeWithExternalizedAuthContext:v4];
}

- (void)pearlEnrollViewController:(id)a3 finishedEnrollWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(BKUIPearlEnrollController *)self delegate];
  [v6 pearlEnrollController:self finishedEnrollWithError:v5];
}

- (void)pearlEnrollControllerCompleted:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BKUIPearlEnrollController_pearlEnrollControllerCompleted___block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__BKUIPearlEnrollController_pearlEnrollControllerCompleted___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) navbarCopy];
  [v2 _setHidesShadow:1];

  id v4 = [*(id *)(a1 + 32) coachingController];
  BOOL v3 = [v4 view];
  [v3 removeFromSuperview];
}

+ (BOOL)isPearlAvailable
{
  id BKDeviceClass = getBKDeviceClass();
  BOOL v3 = [getBKDeviceDescriptorClass() deviceDescriptorForType:2];
  uint64_t v9 = 0;
  id v4 = [BKDeviceClass deviceWithDescriptor:v3 error:&v9];
  uint64_t v5 = v9;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v6;

  return v7;
}

+ (BOOL)isPearlInterlocked
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id BKDeviceClass = getBKDeviceClass();
  BOOL v3 = [getBKDeviceDescriptorClass() deviceDescriptorForType:2];
  id v15 = 0;
  id v4 = [BKDeviceClass deviceWithDescriptor:v3 error:&v15];
  id v5 = v15;

  if (v4)
  {
    uint64_t v14 = 0;
    id v13 = 0;
    uint64_t v6 = [v4 bioLockoutState:&v14 forUser:getuid() error:&v13];
    id v7 = v13;
    id v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [NSNumber numberWithInteger:v14];
      double v10 = [NSNumber numberWithBool:v6];
      *(_DWORD *)buf = 138413058;
      BOOL v17 = v4;
      __int16 v18 = 2112;
      BOOL v19 = v9;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      double v23 = v10;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "Biolockout state for device: %@, state: %@, error: %@, success: %@", buf, 0x2Au);
    }
    BOOL v11 = v14 == 7;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)preloadWithCompletion:(id)a3
{
}

- (void)dealloc
{
  coachingController = self->_coachingController;
  self->_coachingController = 0;

  enrollViewController = self->_enrollViewController;
  self->_enrollViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollController;
  [(BKUIPearlEnrollController *)&v5 dealloc];
}

- (BKUIPearlEnrollControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIPearlEnrollControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (BKIdentity)existingIdentity
{
  return self->_existingIdentity;
}

- (BKUIPearlEnrollViewController)enrollViewController
{
  return self->_enrollViewController;
}

- (void)setEnrollViewController:(id)a3
{
}

- (BKUIPearlCoachingController)coachingController
{
  return self->_coachingController;
}

- (void)setCoachingController:(id)a3
{
}

- (BOOL)hasBeenPortrait
{
  return self->_hasBeenPortrait;
}

- (void)setHasBeenPortrait:(BOOL)a3
{
  self->_hasBeenPortrait = a3;
}

- (NSObject)rotationChangeToken
{
  return self->_rotationChangeToken;
}

- (void)setRotationChangeToken:(id)a3
{
}

- (NSObject)rotationLockToken
{
  return self->_rotationLockToken;
}

- (void)setRotationLockToken:(id)a3
{
}

- (UINavigationBar)navbarCopy
{
  return self->_navbarCopy;
}

- (BKUIOrientationStateHandler)orientationStateHandler
{
  return self->_orientationStateHandler;
}

- (void)setOrientationStateHandler:(id)a3
{
}

- (BKUIPearlEnrollControllerPreloadedState)preloadState
{
  return self->_preloadState;
}

- (void)setPreloadState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadState, 0);
  objc_storeStrong((id *)&self->_orientationStateHandler, 0);
  objc_storeStrong((id *)&self->_navbarCopy, 0);
  objc_storeStrong((id *)&self->_rotationLockToken, 0);
  objc_storeStrong((id *)&self->_rotationChangeToken, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_enrollViewController, 0);
  objc_storeStrong((id *)&self->_existingIdentity, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end