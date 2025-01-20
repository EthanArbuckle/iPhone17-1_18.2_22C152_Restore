@interface PHCarPlayDialerViewController
- (BOOL)_viewControllerWasSelected;
- (PHCarPlayDialerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preferredFocusEnvironments;
- (void)callButtonPressed:(id)a3;
- (void)dealloc;
- (void)deleteButtonPressed:(id)a3;
- (void)hardwareControlEventNotification:(id)a3;
- (void)limitedUINotification:(id)a3;
- (void)loadView;
- (void)postMessageOverlayIfNeeded;
- (void)setLimitedSoftPhoneKeypad:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCarPlayDialerViewController

- (PHCarPlayDialerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PHCarPlayDialerViewController;
  v4 = [(PHCarPlayGenericViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[AVExternalDevice currentCarPlayExternalDevice];
    [(PHCarPlayGenericDialerViewController *)v4 setCarPlayExternalDevice:v5];

    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = AVExternalDeviceLimitedUIChangedNotification;
    v8 = [(PHCarPlayGenericDialerViewController *)v4 carPlayExternalDevice];
    [v6 addObserver:v4 selector:"limitedUINotification:" name:v7 object:v8];
  }
  return v4;
}

- (void)loadView
{
  [(PHCarPlayGenericViewController *)self setRespondsToEventsWhileInCall:0];
  v3 = [(PHCarPlayDialerViewController *)self navigationItem];
  v4 = [v3 navigationBar];
  [v4 setHidden:1];

  id v5 = objc_alloc_init((Class)UIView);
  [(PHCarPlayDialerViewController *)self setView:v5];

  v6 = [[DialerController alloc] initWithDialerType:1];
  [(PHCarPlayGenericDialerViewController *)self setDialerController:v6];

  uint64_t v7 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v8 = [v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  [v9 setShouldHideDeleteButtonWhenEmpty:1];

  objc_super v10 = [(PHCarPlayDialerViewController *)self view];
  v11 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v12 = [v11 view];
  [v10 addSubview:v12];

  v13 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  [(PHCarPlayDialerViewController *)self addChildViewController:v13];

  v14 = [(PHCarPlayDialerViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v24 = [v23 view];
  [v24 setFrame:v16, v18, v20, v22];

  v25 = +[UIColor tableBackgroundColor];
  v26 = [(PHCarPlayDialerViewController *)self view];
  [v26 setBackgroundColor:v25];

  v70 = [(PHCarPlayDialerViewController *)self view];
  v69 = [v70 safeAreaLayoutGuide];
  v67 = [v69 topAnchor];
  v68 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v66 = [v68 view];
  v65 = [v66 topAnchor];
  v64 = [v67 constraintEqualToAnchor:v65];
  v71[0] = v64;
  v63 = [(PHCarPlayDialerViewController *)self view];
  v62 = [v63 safeAreaLayoutGuide];
  v60 = [v62 bottomAnchor];
  v61 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v59 = [v61 view];
  v58 = [v59 bottomAnchor];
  v57 = [v60 constraintEqualToAnchor:v58];
  v71[1] = v57;
  v56 = [(PHCarPlayDialerViewController *)self view];
  v55 = [v56 safeAreaLayoutGuide];
  v53 = [v55 leftAnchor];
  v54 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v52 = [v54 view];
  v51 = [v52 leftAnchor];
  v27 = [v53 constraintEqualToAnchor:v51];
  v71[2] = v27;
  v28 = [(PHCarPlayDialerViewController *)self view];
  v29 = [v28 safeAreaLayoutGuide];
  v30 = [v29 rightAnchor];
  v31 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v32 = [v31 view];
  v33 = [v32 rightAnchor];
  v34 = [v30 constraintEqualToAnchor:v33];
  v71[3] = v34;
  v35 = +[NSArray arrayWithObjects:v71 count:4];
  +[NSLayoutConstraint activateConstraints:v35];

  v36 = +[NSNotificationCenter defaultCenter];
  v37 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v38 = [v37 dialerView];
  v39 = [v38 deleteButton];
  [v36 addObserver:self selector:"deleteButtonHide:" name:@"kPHCarPlayDeleteButtonHideNotification" object:v39];

  [(PHCarPlayDialerViewController *)self setLimitedSoftPhoneKeypad:+[PHCarPlayUtilities shouldLimitKeypadAccess]];
  id v40 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"deleteButtonPressed:"];
  [v40 setMinimumPressDuration:0.0];
  [v40 setAllowedPressTypes:&off_10028CD40];
  v41 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v42 = [v41 dialerView];
  v43 = [v42 deleteButton];
  [v43 addGestureRecognizer:v40];

  id v44 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"callButtonPressed:"];
  [v44 setMinimumPressDuration:0.0];
  [v44 setAllowedPressTypes:&off_10028CD58];
  v45 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v46 = [v45 dialerView];
  v47 = [v46 callButton];
  [v47 addGestureRecognizer:v44];

  id v48 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_noOpGestureAction:"];
  [v48 setAllowedPressTypes:&off_10028CD70];
  v49 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v50 = [v49 dialerView];
  [v50 addGestureRecognizer:v48];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayDialerViewController;
  [(PHCarPlayDialerViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayDialerViewController;
  [(PHCarPlayDialerViewController *)&v4 viewWillAppear:a3];
  [(PHCarPlayDialerViewController *)self setLimitedSoftPhoneKeypad:+[PHCarPlayUtilities shouldLimitKeypadAccess]];
  [(PHCarPlayDialerViewController *)self postMessageOverlayIfNeeded];
}

- (void)limitedUINotification:(id)a3
{
  BOOL v4 = +[PHCarPlayUtilities shouldLimitKeypadAccess];

  [(PHCarPlayDialerViewController *)self setLimitedSoftPhoneKeypad:v4];
}

- (void)setLimitedSoftPhoneKeypad:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __59__PHCarPlayDialerViewController_setLimitedSoftPhoneKeypad___block_invoke;
  v3[3] = &unk_10027C838;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id __59__PHCarPlayDialerViewController_setLimitedSoftPhoneKeypad___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)PHCarPlayDialerViewController;
  [super setLimitedSoftPhoneKeypad:v2];
  return [*(id *)(a1 + 32) postMessageOverlayIfNeeded];
}

- (void)postMessageOverlayIfNeeded
{
  if ([(PHCarPlayGenericDialerViewController *)self limitedSoftPhoneKeypad]
    && ([(PHCarPlayGenericDialerViewController *)self noContentBannerView],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v7 = -[PHCarPlayNoContentBannerView initWithFrame:]([PHCarPlayNoContentBannerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(PHCarPlayGenericDialerViewController *)self setNoContentBannerView:v7];

    v8 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(PHCarPlayDialerViewController *)self view];
    objc_super v10 = [v9 backgroundColor];
    v11 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v11 setBackgroundColor:v10];

    v12 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v12 setAlpha:0.95];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"KEYPAD_ACCESS_IS_LIMITED" value:&stru_100285990 table:@"PHCarPlay"];
    double v15 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v15 setTitleString:v14];

    double v16 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v16 setHidden:0];

    double v17 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    double v18 = [v17 view];
    [v18 setUserInteractionEnabled:0];

    double v19 = [(PHCarPlayDialerViewController *)self view];
    double v20 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v19 addSubview:v20];

    id v46 = [(PHCarPlayDialerViewController *)self view];
    id v44 = [v46 safeAreaLayoutGuide];
    v42 = [v44 topAnchor];
    v43 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v41 = [v43 topAnchor];
    id v40 = [v42 constraintEqualToAnchor:v41];
    v47[0] = v40;
    v39 = [(PHCarPlayDialerViewController *)self view];
    v38 = [v39 safeAreaLayoutGuide];
    v36 = [v38 bottomAnchor];
    v37 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v35 = [v37 bottomAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v47[1] = v34;
    v33 = [(PHCarPlayDialerViewController *)self view];
    v32 = [v33 safeAreaLayoutGuide];
    v30 = [v32 leftAnchor];
    v31 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    double v21 = [v31 leftAnchor];
    double v22 = [v30 constraintEqualToAnchor:v21];
    v47[2] = v22;
    v23 = [(PHCarPlayDialerViewController *)self view];
    v24 = [v23 safeAreaLayoutGuide];
    v25 = [v24 rightAnchor];
    v26 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v27 = [v26 rightAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v47[3] = v28;
    v29 = +[NSArray arrayWithObjects:v47 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    [(PHCarPlayDialerViewController *)self setNeedsFocusUpdate];
  }
  else if (![(PHCarPlayGenericDialerViewController *)self limitedSoftPhoneKeypad])
  {
    objc_super v4 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];

    if (v4)
    {
      id v5 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
      [v5 removeFromSuperview];

      [(PHCarPlayGenericDialerViewController *)self setNoContentBannerView:0];
      id v45 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      v6 = [v45 view];
      [v6 setUserInteractionEnabled:1];
    }
  }
}

- (BOOL)_viewControllerWasSelected
{
  v3.receiver = self;
  v3.super_class = (Class)PHCarPlayDialerViewController;
  return [(PHCarPlayDialerViewController *)&v3 _viewControllerWasSelected];
}

- (void)callButtonPressed:(id)a3
{
  id v4 = [a3 state];
  id v17 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  id v5 = [v17 dialerView];
  v6 = [v5 callButton];
  uint64_t v7 = v6;
  if (v4 == (id)1)
  {
    [v6 setHighlighted:1];

LABEL_3:

    return;
  }
  [v6 setHighlighted:0];

  if (v4 != (id)3) {
    return;
  }
  v8 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  unsigned int v9 = [v8 digitsEntered];

  objc_super v10 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  id v17 = v10;
  if (!v9)
  {
    [v10 restoreLastDialedNumber];
    goto LABEL_3;
  }
  v11 = [v10 callProviderManager];
  v12 = [v11 telephonyProvider];

  if (v12)
  {
    v13 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    v14 = [v13 dialerView];
    double v15 = [v14 callButton];
    [v15 setSelected:1];

    double v16 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    [v16 performCallActionForCallProvider:v12];
  }
  else
  {
    double v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DialerController phonePad:keyUp:](v16);
    }
  }
}

- (void)deleteButtonPressed:(id)a3
{
  id v4 = [a3 state];
  id v8 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  id v5 = [v8 dialerView];
  v6 = [v5 deleteButton];
  uint64_t v7 = v6;
  if (v4 == (id)1)
  {
    [v6 setHighlighted:1];

    id v8 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    [v8 performDeleteAction];
  }
  else
  {
    [v6 setHighlighted:0];
  }
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayDialerViewController received hardware control event notification: %@", (uint8_t *)&v17, 0xCu);
  }

  if ([(PHCarPlayGenericViewController *)self shouldRespondToHardwareControlEvent])
  {
    v6 = [v4 userInfo];
    uint64_t v7 = [v6 valueForKey:kTUCarPlayHardwareControlButtonKey];

    if (v7 == (void *)kTUCarPlayHardwareControlButtonGreenTelephone
      || v7 == (void *)kTUCarPlayHardwareControlButtonWhiteTelephone)
    {
      unsigned int v9 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      unsigned int v10 = [v9 digitsEntered];

      v11 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      v12 = v11;
      if (!v10)
      {
        [v11 restoreLastDialedNumber];
        v14 = v12;
        goto LABEL_20;
      }
      v13 = [v11 callProviderManager];
      v14 = [v13 telephonyProvider];

      if (v14)
      {
        double v15 = [(PHCarPlayGenericDialerViewController *)self dialerController];
        [v15 performCallActionForCallProvider:v14];
      }
      else
      {
        double v15 = PHDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[DialerController phonePad:keyUp:](v15);
        }
      }
    }
    else
    {
      if (v7 != (void *)kTUCarPlayHardwareControlButtonKeypad)
      {
        if (v7 != (void *)kTUCarPlayHardwareControlButtonDelete)
        {
LABEL_21:

          goto LABEL_22;
        }
        v14 = [(PHCarPlayGenericDialerViewController *)self dialerController];
        [v14 performDeleteAction];
LABEL_20:

        goto LABEL_21;
      }
      v14 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      double v15 = [v4 userInfo];
      double v16 = [v15 valueForKey:kTUCarPlayHardwareControlKeypadValueKey];
      [v14 performCharacterAddAction:v16];
    }
    goto LABEL_20;
  }
LABEL_22:
}

- (id)preferredFocusEnvironments
{
  objc_super v3 = [(PHCarPlayGenericDialerViewController *)self dialerController];

  if (v3)
  {
    id v4 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    id v5 = [v4 dialerView];
    v6 = [v5 phonePadView];
    unsigned int v10 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PHCarPlayDialerViewController;
    uint64_t v7 = [(PHCarPlayDialerViewController *)&v9 preferredFocusEnvironments];
  }

  return v7;
}

@end