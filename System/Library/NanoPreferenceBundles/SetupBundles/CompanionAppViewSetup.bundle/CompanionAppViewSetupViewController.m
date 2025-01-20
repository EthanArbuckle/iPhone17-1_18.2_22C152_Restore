@interface CompanionAppViewSetupViewController
- (BOOL)isTinker;
- (BOOL)legacyButtonStyles;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (CompanionAppViewSetupViewController)init;
- (NSString)bundleID;
- (id)bridgeController;
- (id)bundle;
- (id)detailString;
- (id)localize:(id)a3;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)launcherViewModeSettingChanged;
- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateViewChoice;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)watchChooser:(id)a3 madeChoice:(int64_t)a4;
@end

@implementation CompanionAppViewSetupViewController

- (CompanionAppViewSetupViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CompanionAppViewSetupViewController;
  v2 = [(CompanionAppViewSetupViewController *)&v7 initWithTitle:&stru_4218 detailText:0 icon:0 contentLayout:2];
  v3 = v2;
  if (v2)
  {
    [(CompanionAppViewSetupViewController *)v2 setStyle:2];
    v4 = (CSLPRFLauncherViewModeSetting *)objc_alloc_init((Class)CSLPRFLauncherViewModeSetting);
    appViewSetting = v3->_appViewSetting;
    v3->_appViewSetting = v4;

    [(CSLPRFLauncherViewModeSetting *)v3->_appViewSetting setDelegate:v3];
    if ([(CompanionAppViewSetupViewController *)v3 isTinker]) {
      v3->_tinkerLauncherMode = 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, ">>>> created %@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)CompanionAppViewSetupViewController;
  [(CompanionAppViewSetupViewController *)&v28 viewDidLoad];
  v3 = [(CompanionAppViewSetupViewController *)self view];
  [v3 setUserInteractionEnabled:1];

  v4 = [(CompanionAppViewSetupViewController *)self contentView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CompanionAppViewSetupViewController *)self contentView];
  [v5 setUserInteractionEnabled:1];

  v26 = +[CSLPRFWatchChoice watchChoices];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_155C;
  v27[3] = &unk_41A8;
  v27[4] = self;
  [v26 enumerateObjectsUsingBlock:v27];
  v6 = (CSLPRFAppViewChoiceView *)[objc_alloc((Class)CSLPRFAppViewChoiceView) initWithDelegate:self horizontalOffset:v26 choices:24.0];
  appViewChoiceView = self->_appViewChoiceView;
  self->_appViewChoiceView = v6;

  [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(CompanionAppViewSetupViewController *)self contentView];
  [v8 addSubview:self->_appViewChoiceView];

  v25 = [(CompanionAppViewSetupViewController *)self contentView];
  v24 = [v25 topAnchor];
  v23 = [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v29[0] = v22;
  v21 = [(CompanionAppViewSetupViewController *)self contentView];
  v20 = [v21 leadingAnchor];
  v19 = [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v29[1] = v18;
  v9 = [(CompanionAppViewSetupViewController *)self contentView];
  v10 = [v9 trailingAnchor];
  v11 = [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v29[2] = v12;
  v13 = [(CompanionAppViewSetupViewController *)self contentView];
  v14 = [v13 bottomAnchor];
  v15 = [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v29[3] = v16;
  v17 = +[NSArray arrayWithObjects:v29 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [(CompanionAppViewSetupViewController *)self updateViewChoice];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CompanionAppViewSetupViewController;
  [(CompanionAppViewSetupViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(CompanionAppViewSetupViewController *)self contentView];
  [v3 frame];
  -[CSLPRFAppViewChoiceView setHorizontalOffset:](self->_appViewChoiceView, "setHorizontalOffset:");
}

- (id)titleString
{
  return [(CompanionAppViewSetupViewController *)self localize:@"APP_VIEW_CHOICE_TITLE"];
}

- (id)detailString
{
  return [(CompanionAppViewSetupViewController *)self localize:@"APP_VIEW_CHOICE_DETAIL_STRING"];
}

- (id)suggestedButtonTitle
{
  return [(CompanionAppViewSetupViewController *)self localize:@"APP_VIEW_CHOICE_CONTINUE"];
}

- (void)suggestedButtonPressed:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(CompanionAppViewSetupViewController *)self miniFlowDelegate];
    int v6 = 138412290;
    objc_super v7 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, ">>>> suggestedButtonPressed calling %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(CompanionAppViewSetupViewController *)self miniFlowDelegate];
  [v5 miniFlowStepComplete:self];
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (NSString)bundleID
{
  uint64_t v2 = [(CompanionAppViewSetupViewController *)self bundle];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (id)localize:(id)a3
{
  id v4 = a3;
  v5 = [(CompanionAppViewSetupViewController *)self bundle];
  int v6 = [v5 localizedStringForKey:v4 value:0 table:@"CompanionAppViewSetup"];

  if (!v6 || [v6 isEqualToString:v4])
  {
    objc_super v7 = [(CompanionAppViewSetupViewController *)self bundle];
    uint64_t v8 = [v7 localizedStringForKey:v4 value:0 table:@"CarouselAppViewChoice"];

    int v6 = (void *)v8;
  }

  return v6;
}

- (id)bridgeController
{
  uint64_t v2 = +[UIApplication sharedApplication];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = +[UIApplication sharedApplication];
    v5 = [v4 bridgeController];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_2498();
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)isTinker
{
  uint64_t v2 = [(CompanionAppViewSetupViewController *)self bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];

  return v3;
}

- (void)watchChooser:(id)a3 madeChoice:(int64_t)a4
{
  if ([(CompanionAppViewSetupViewController *)self isTinker])
  {
    self->_tinkerLauncherMode = a4;
    int v6 = [(CompanionAppViewSetupViewController *)self bridgeController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(CompanionAppViewSetupViewController *)self bridgeController];
      [v8 tellWatchToSetLauncherViewMode:self->_tinkerLauncherMode];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_24E0();
    }
    [(CompanionAppViewSetupViewController *)self updateViewChoice];
  }
  else
  {
    appViewSetting = self->_appViewSetting;
    [(CSLPRFLauncherViewModeSetting *)appViewSetting setLauncherViewMode:a4 reason:1];
  }
}

- (void)updateViewChoice
{
  unsigned int v3 = [(CompanionAppViewSetupViewController *)self isTinker];
  appViewChoiceView = self->_appViewChoiceView;
  if (v3) {
    id tinkerLauncherMode = self->_tinkerLauncherMode;
  }
  else {
    id tinkerLauncherMode = [(CSLPRFLauncherViewModeSetting *)self->_appViewSetting launcherViewMode];
  }

  [(CSLPRFAppViewChoiceView *)appViewChoiceView setWatchChoice:tinkerLauncherMode];
}

- (void)launcherViewModeSettingChanged
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1B78;
  v2[3] = &unk_41D0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  v10 = [(CompanionAppViewSetupViewController *)self bridgeController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v12 = [(CompanionAppViewSetupViewController *)self bridgeController];
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, ">>>> asking bridge controller %@ to retrieve app view image", buf, 0xCu);
    }
    v13 = [(CompanionAppViewSetupViewController *)self bridgeController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1D60;
    v14[3] = &unk_41F8;
    v14[4] = self;
    id v15 = v9;
    int64_t v16 = a3;
    objc_msgSend(v13, "retrieveAppViewListImageFromGizmo:completion:", v14, width, height);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_2528(self);
  }
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_appViewChoiceView, 0);

  objc_storeStrong((id *)&self->_appViewSetting, 0);
}

@end