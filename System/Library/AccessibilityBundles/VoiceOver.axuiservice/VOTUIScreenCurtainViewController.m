@interface VOTUIScreenCurtainViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)enabled;
- (BOOL)hostingWindowShouldMoveForReachability;
- (NSString)screenshotActionHandlerIdentifier;
- (VOTUIScreenCurtainView)curtainView;
- (void)_updateScreenCurtainForInvertColors:(id)a3;
- (void)removeFromParentViewController;
- (void)setCurtainView:(id)a3;
- (void)setEnabled:(BOOL)a3 animate:(BOOL)a4;
- (void)setScreenshotActionHandlerIdentifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUIScreenCurtainViewController

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3 animate:(BOOL)a4
{
  if (self->_enabled && !a3)
  {
    double v6 = 0.3;
    if (!a4) {
      double v6 = 0.0;
    }
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_11F48;
    v17 = &unk_3D2B0;
    v18 = self;
    v7 = &v14;
LABEL_13:
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_14;
  }
  if (!self->_enabled && a3)
  {
    double v6 = 0.3;
    if (!a4) {
      double v6 = 0.0;
    }
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_11F90;
    v12 = &unk_3D2B0;
    v13 = self;
    v7 = &v9;
    goto LABEL_13;
  }
LABEL_14:
  self->_enabled = a3;
  [(VOTUIScreenCurtainViewController *)self _updateScreenCurtainForInvertColors:0];
}

- (void)removeFromParentViewController
{
  v6.receiver = self;
  v6.super_class = (Class)VOTUIScreenCurtainViewController;
  [(VOTUIScreenCurtainViewController *)&v6 removeFromParentViewController];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[AXSpringBoardServer server];
  v5 = [(VOTUIScreenCurtainViewController *)self screenshotActionHandlerIdentifier];
  [v4 removeActionHandler:v5];
}

- (void)_updateScreenCurtainForInvertColors:(id)a3
{
  if (!self->_enabled) {
    return;
  }
  v3 = self;
  if (AXIsInternalInstall())
  {
    if (CFPreferencesGetAppBooleanValue(@"UseAlpha1ScreenCurtain", kAXSAccessibilityPreferenceDomain, 0)) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.999999881;
    }
  }
  else
  {
    double v4 = 0.999999881;
  }
  id v8 = [v3 curtainView];
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  if (IsInvertColorsEnabled
    || (+[AXSettings sharedInstance],
        v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 classicInvertColors] & 1) != 0))
  {
    objc_super v6 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:v4];
    [v8 setBackgroundColor:v6];

    if (IsInvertColorsEnabled) {
      goto LABEL_14;
    }
  }
  else
  {
    v7 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:v4];
    [v8 setBackgroundColor:v7];
  }
LABEL_14:
}

- (void)viewDidLoad
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUIScreenCurtainViewController *)self setView:v7];

  id v8 = [(VOTUIScreenCurtainViewController *)self view];
  [v8 setAutoresizingMask:18];

  v9 = [(VOTUIScreenCurtainViewController *)self view];
  [v9 autoresizesSubviews];

  uint64_t v10 = -[VOTUIScreenCurtainView initWithFrame:]([VOTUIScreenCurtainView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUIScreenCurtainViewController *)self setCurtainView:v10];

  v11 = [(VOTUIScreenCurtainViewController *)self curtainView];
  [v11 setAutoresizingMask:18];

  v12 = [(VOTUIScreenCurtainViewController *)self curtainView];
  [v12 setUserInteractionEnabled:0];

  if (self->_enabled)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1259C;
    v26[3] = &unk_3D2B0;
    v26[4] = self;
    +[UIView animateWithDuration:v26 animations:0.3];
  }
  else
  {
    v13 = [(VOTUIScreenCurtainViewController *)self curtainView];
    [v13 setAlpha:0.0];
  }
  v14 = [(VOTUIScreenCurtainViewController *)self view];
  uint64_t v15 = [(VOTUIScreenCurtainViewController *)self curtainView];
  [v14 addSubview:v15];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_125F0;
  v24[4] = sub_12600;
  v16 = self;
  v25 = v16;
  v17 = +[AXSpringBoardServer server];
  v22[4] = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_12608;
  v23[3] = &unk_3D4E0;
  v23[4] = v24;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_126DC;
  v22[3] = &unk_3D508;
  [v17 registerSpringBoardActionHandler:v23 withIdentifierCallback:v22];

  v18 = +[AXSettings sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_126E8;
  v21[3] = &unk_3D238;
  v21[4] = v24;
  [v18 registerUpdateBlock:v21 forRetrieveSelector:"classicInvertColors" withListener:v16];

  v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:v16 selector:"_updateScreenCurtainForInvertColors:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  v20.receiver = v16;
  v20.super_class = (Class)VOTUIScreenCurtainViewController;
  [(VOTUIScreenCurtainViewController *)&v20 viewDidLoad];
  _Block_object_dispose(v24, 8);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 0;
}

- (VOTUIScreenCurtainView)curtainView
{
  return self->_curtainView;
}

- (void)setCurtainView:(id)a3
{
}

- (NSString)screenshotActionHandlerIdentifier
{
  return self->_screenshotActionHandlerIdentifier;
}

- (void)setScreenshotActionHandlerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotActionHandlerIdentifier, 0);

  objc_storeStrong((id *)&self->_curtainView, 0);
}

@end