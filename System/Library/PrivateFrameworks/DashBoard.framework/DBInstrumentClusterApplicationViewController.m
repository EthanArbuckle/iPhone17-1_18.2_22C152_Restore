@interface DBInstrumentClusterApplicationViewController
- (BOOL)buttonPressedWithType:(unint64_t)a3;
- (BOOL)foreground;
- (BOOL)sceneViewControllerIsForeground;
- (CGRect)layoutFrame;
- (DBEnvironment)environment;
- (DBInstrumentClusterApplicationViewController)initWithEnvironment:(id)a3;
- (DBInstrumentClusterApplicationViewController)initWithEnvironment:(id)a3 layoutFrame:(CGRect)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (DBInstrumentClusterSceneHostViewController)sceneHostViewController;
- (NSString)targetBundleIdentifier;
- (NSTimer)focusTimer;
- (NSURL)lastClusterURL;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)snapshotView;
- (id)pressSupportBundleIdentifiers;
- (void)_addSceneHostViewControllerForApplication:(id)a3;
- (void)_removeSceneHostViewController;
- (void)_updateSceneHostViewFrameScaleIfNecessary:(id)a3;
- (void)backgroundScene;
- (void)destroyFocusTimer;
- (void)discardSnapshotView;
- (void)foregroundSceneWithURL:(id)a3;
- (void)invalidate;
- (void)setEnvironment:(id)a3;
- (void)setFocusTimer:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setLastClusterURL:(id)a3;
- (void)setSceneHostViewController:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTargetBundleIdentifier:(id)a3;
- (void)startOrRestartFocusTimer;
- (void)switchToSnapshotView;
- (void)updateSceneWithAnimationSettings:(id)a3;
@end

@implementation DBInstrumentClusterApplicationViewController

- (DBInstrumentClusterApplicationViewController)initWithEnvironment:(id)a3
{
  return -[DBInstrumentClusterApplicationViewController initWithEnvironment:layoutFrame:safeAreaInsets:](self, "initWithEnvironment:layoutFrame:safeAreaInsets:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
}

- (DBInstrumentClusterApplicationViewController)initWithEnvironment:(id)a3 layoutFrame:(CGRect)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DBInstrumentClusterApplicationViewController;
  v15 = [(DBInstrumentClusterApplicationViewController *)&v18 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_environment, v14);
    v16->_layoutFrame.origin.CGFloat x = x;
    v16->_layoutFrame.origin.CGFloat y = y;
    v16->_layoutFrame.size.CGFloat width = width;
    v16->_layoutFrame.size.CGFloat height = height;
    v16->_safeAreaInsets.CGFloat top = top;
    v16->_safeAreaInsets.CGFloat left = left;
    v16->_safeAreaInsets.CGFloat bottom = bottom;
    v16->_safeAreaInsets.CGFloat right = right;
    v16->_foreground = 0;
  }

  return v16;
}

- (BOOL)sceneViewControllerIsForeground
{
  v3 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  if (v3)
  {
    v4 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    char v5 = [v4 sceneViewControllerIsForeground];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setTargetBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (NSString *)a3;
  if (self->_targetBundleIdentifier != v4)
  {
    [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
    char v5 = (NSString *)[(NSString *)v4 copy];
    targetBundleIdentifier = self->_targetBundleIdentifier;
    self->_targetBundleIdentifier = v5;

    v7 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v4;
      __int16 v14 = 1024;
      BOOL v15 = [(DBInstrumentClusterApplicationViewController *)self sceneViewControllerIsForeground];
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set target bundle ID: %{public}@ VC isForeground: %d", (uint8_t *)&v10, 0x1Cu);
    }

    [(DBInstrumentClusterApplicationViewController *)self _removeSceneHostViewController];
    v8 = +[DBApplicationController sharedInstance];
    v9 = [v8 applicationWithBundleIdentifier:v4];

    [(DBInstrumentClusterApplicationViewController *)self _addSceneHostViewControllerForApplication:v9];
  }
}

- (void)foregroundSceneWithURL:(id)a3
{
  v4 = (NSURL *)a3;
  [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
  char v5 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];

  if (v5)
  {
    v6 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];
    [v6 removeFromSuperview];

    [(DBInstrumentClusterApplicationViewController *)self setSnapshotView:0];
  }
  v7 = [(DBInstrumentClusterApplicationViewController *)self environment];
  v8 = [v7 environmentConfiguration];
  v9 = [v8 analytics];
  [v9 clusterForegroundElementDidChange:self->_targetBundleIdentifier];

  int v10 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v10 foregroundSceneWithURL:v4];

  self->_foreground = 1;
  lastClusterURL = self->_lastClusterURL;
  self->_lastClusterURL = v4;
}

- (void)updateSceneWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v5 updateSceneWithAnimationSettings:v4];
}

- (void)backgroundScene
{
  [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
  v3 = [(DBInstrumentClusterApplicationViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  id v5 = [v4 analytics];
  [v5 clusterForegroundElementDidChange:0];

  v6 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v6 backgroundSceneWithFence:0];

  v7 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v7 stopHostingScene];

  self->_foreground = 0;
}

- (void)switchToSnapshotView
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
  v3 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];

  if (!v3)
  {
    id v4 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      v7 = [(DBInstrumentClusterApplicationViewController *)self targetBundleIdentifier];
      int v25 = 138543618;
      v26 = v6;
      __int16 v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Switching instrument cluster scene %{public}@ to snapshot", (uint8_t *)&v25, 0x16u);
    }
    v8 = [MEMORY[0x263F82E90] _synchronizedDrawingFence];
    v9 = [(DBInstrumentClusterApplicationViewController *)self view];
    int v10 = [v9 snapshotViewAfterScreenUpdates:0];
    [(DBInstrumentClusterApplicationViewController *)self setSnapshotView:v10];

    v11 = [(DBInstrumentClusterApplicationViewController *)self view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    v21 = [(DBInstrumentClusterApplicationViewController *)self view];
    v22 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];
    [v21 addSubview:v22];

    v23 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    [v23 backgroundSceneWithFence:v8];

    v24 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    [v24 stopHostingScene];

    self->_foreground = 0;
  }
}

- (void)discardSnapshotView
{
  v3 = [(DBInstrumentClusterApplicationViewController *)self snapshotView];
  [v3 removeFromSuperview];

  [(DBInstrumentClusterApplicationViewController *)self setSnapshotView:0];
}

- (id)pressSupportBundleIdentifiers
{
  v25[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v23[0] = @"com.apple.CarTrip";
  v23[1] = @"com.apple.CarTirePressure";
  v24[0] = &unk_26E17ECA8;
  double v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  double v17 = [v2 setWithArray:v18];
  v25[0] = v17;
  v24[1] = &unk_26E17ECC0;
  v3 = (void *)MEMORY[0x263EFFA08];
  v22 = @"com.apple.CarTrip";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  id v5 = [v3 setWithArray:v4];
  v25[1] = v5;
  v24[2] = &unk_26E17ECD8;
  v6 = (void *)MEMORY[0x263EFFA08];
  v21 = @"com.apple.CarTrip";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v8 = [v6 setWithArray:v7];
  v25[2] = v8;
  v24[3] = &unk_26E17ECF0;
  v9 = (void *)MEMORY[0x263EFFA08];
  v20 = @"com.apple.CarTrip";
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v11 = [v9 setWithArray:v10];
  v25[3] = v11;
  v24[4] = &unk_26E17ED08;
  double v12 = (void *)MEMORY[0x263EFFA08];
  v19[0] = @"com.apple.CarTrip";
  v19[1] = @"com.apple.CarTirePressure";
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  double v14 = [v12 setWithArray:v13];
  v25[4] = v14;
  double v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

  return v15;
}

- (BOOL)buttonPressedWithType:(unint64_t)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFFA08];
  v21[0] = @"com.apple.CarTrip";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v7 = [v5 setWithArray:v6];

  v8 = [(DBInstrumentClusterApplicationViewController *)self pressSupportBundleIdentifiers];
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  int v10 = [v8 objectForKeyedSubscript:v9];
  int v11 = [v10 containsObject:self->_targetBundleIdentifier];

  if (!v11) {
    goto LABEL_11;
  }
  if (a3 == 5)
  {
    if (self->_focusTimer)
    {
      [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
      goto LABEL_14;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  if (a3 == 2) {
    goto LABEL_14;
  }
  if (a3 != 1)
  {
    if (self->_focusTimer && [v7 containsObject:self->_targetBundleIdentifier])
    {
LABEL_13:
      [(DBInstrumentClusterApplicationViewController *)self startOrRestartFocusTimer];
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (self->_focusTimer)
  {
    BOOL v12 = [(DBInstrumentClusterApplicationViewController *)self buttonPressedWithType:5];
    goto LABEL_17;
  }
  if ([(NSString *)self->_targetBundleIdentifier isEqual:@"com.apple.CarTrip"]) {
    goto LABEL_13;
  }
LABEL_14:
  double v13 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = [NSNumber numberWithUnsignedInteger:a3];
    int v19 = 138412290;
    v20 = v14;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Handling press type %@", (uint8_t *)&v19, 0xCu);
  }
  double v15 = (void *)[objc_alloc(MEMORY[0x263F31460]) initWithPressType:a3];
  double v16 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  double v17 = [MEMORY[0x263EFFA08] setWithObject:v15];
  [v16 sendSceneActions:v17];

  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (void)startOrRestartFocusTimer
{
  [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
  v3 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Starting hosted app focus timer", v6, 2u);
  }

  id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_destroyFocusTimer selector:0 userInfo:0 repeats:3.0];
  focusTimer = self->_focusTimer;
  self->_focusTimer = v4;
}

- (void)destroyFocusTimer
{
  if (self->_focusTimer)
  {
    v3 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Destroying hosted app focus timer", v5, 2u);
    }

    [(NSTimer *)self->_focusTimer invalidate];
    focusTimer = self->_focusTimer;
    self->_focusTimer = 0;
  }
}

- (void)invalidate
{
  [(DBInstrumentClusterApplicationViewController *)self destroyFocusTimer];
  id v3 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v3 invalidate];
}

- (void)_addSceneHostViewControllerForApplication:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v42 = 138543362;
    v43 = v7;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding scene host view controller", (uint8_t *)&v42, 0xCu);
  }
  v8 = [v4 appPolicy];
  if ([v8 launchUsingTemplateUI])
  {
    v9 = +[DBApplicationController sharedInstance];
    int v10 = [v9 templateUIHostApplication];
  }
  else
  {
    int v10 = 0;
  }
  int v11 = [DBInstrumentClusterSceneHostViewController alloc];
  BOOL v12 = [(DBInstrumentClusterApplicationViewController *)self environment];
  [(DBInstrumentClusterApplicationViewController *)self layoutFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(DBInstrumentClusterApplicationViewController *)self safeAreaInsets];
  int v25 = -[DBInstrumentClusterSceneHostViewController initWithApplication:proxyApplication:environment:layoutFrame:safeAreaInsets:](v11, "initWithApplication:proxyApplication:environment:layoutFrame:safeAreaInsets:", v4, v10, v12, v14, v16, v18, v20, v21, v22, v23, v24);
  [(DBInstrumentClusterApplicationViewController *)self setSceneHostViewController:v25];

  v26 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [(DBInstrumentClusterApplicationViewController *)self addChildViewController:v26];

  __int16 v27 = [(DBInstrumentClusterApplicationViewController *)self view];
  v28 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  uint64_t v29 = [v28 view];
  [v27 addSubview:v29];

  v30 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  [v30 didMoveToParentViewController:self];

  v31 = [(DBInstrumentClusterApplicationViewController *)self view];
  [v31 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
  v41 = [v40 view];
  objc_msgSend(v41, "setFrame:", v33, v35, v37, v39);

  [(DBInstrumentClusterApplicationViewController *)self _updateSceneHostViewFrameScaleIfNecessary:v4];
  if (self->_foreground) {
    [(DBInstrumentClusterApplicationViewController *)self foregroundSceneWithURL:self->_lastClusterURL];
  }
}

- (void)_removeSceneHostViewController
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];

  if (v3)
  {
    id v4 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v12 = 138543362;
      double v13 = v6;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Tearing down scene host view controller", (uint8_t *)&v12, 0xCu);
    }
    v7 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    [v7 invalidate];

    v8 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    [v8 willMoveToParentViewController:0];

    v9 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    int v10 = [v9 view];
    [v10 removeFromSuperview];

    int v11 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
    [v11 removeFromParentViewController];

    [(DBInstrumentClusterApplicationViewController *)self setSceneHostViewController:0];
  }
}

- (void)_updateSceneHostViewFrameScaleIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(DBInstrumentClusterApplicationViewController *)self environment];
  v6 = [v5 environmentConfiguration];
  if ([v6 supportsDisplayPlugin])
  {
    if ([v4 supportsInstrumentClusterNavigation])
    {

LABEL_6:
      v9 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
      int v10 = [v9 view];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;

      double v15 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
      double v16 = [v15 view];
      double v17 = [v16 layer];
      objc_msgSend(v17, "setAnchorPoint:", 0.0, 0.0);

      double v18 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
      double v19 = [v18 view];
      double v20 = [v19 layer];
      objc_msgSend(v20, "setPosition:", v12, v14);

      double v21 = [(DBInstrumentClusterApplicationViewController *)self environment];
      double v22 = [v21 environmentConfiguration];
      [v22 screenScale];
      CGFloat v24 = v23;

      int v25 = [(DBInstrumentClusterApplicationViewController *)self sceneHostViewController];
      v26 = [v25 view];
      CGAffineTransformMakeScale(&v27, v24, v24);
      [v26 setTransform:&v27];

      goto LABEL_7;
    }
    v7 = [v4 bundleIdentifier];
    int v8 = [v7 isEqualToString:@"com.apple.CarRadio"];

    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_7:
}

- (NSURL)lastClusterURL
{
  return self->_lastClusterURL;
}

- (void)setLastClusterURL:(id)a3
{
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBInstrumentClusterSceneHostViewController)sceneHostViewController
{
  return self->_sceneHostViewController;
}

- (void)setSceneHostViewController:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (CGRect)layoutFrame
{
  double x = self->_layoutFrame.origin.x;
  double y = self->_layoutFrame.origin.y;
  double width = self->_layoutFrame.size.width;
  double height = self->_layoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSTimer)focusTimer
{
  return self->_focusTimer;
}

- (void)setFocusTimer:(id)a3
{
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusTimer, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_sceneHostViewController, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastClusterURL, 0);
}

@end