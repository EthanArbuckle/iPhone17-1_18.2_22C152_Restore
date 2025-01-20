@interface PHCarPlayInCallKeypadViewController
+ (double)fakeNavigationBarHeight;
- (PHCarPlayInCallKeyPadButton)backButton;
- (PHCarPlayInCallKeyPadButton)endButton;
- (PHCarPlayInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)fakeNavigationBar;
- (id)preferredFocusEnvironments;
- (void)backButtonTapped:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)endButtonTapped:(id)a3;
- (void)hardwareControlEventNotification:(id)a3;
- (void)limitedUINotification:(id)a3;
- (void)loadView;
- (void)postMessageOverlayIfNeeded;
- (void)setBackButton:(id)a3;
- (void)setEndButton:(id)a3;
- (void)setFakeNavigationBar:(id)a3;
- (void)setLimitedSoftPhoneKeypad:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHCarPlayInCallKeypadViewController

- (PHCarPlayInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PHCarPlayInCallKeypadViewController;
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

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallKeypadViewController;
  [(PHCarPlayInCallKeypadViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v114 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  uint64_t v7 = +[UIColor tableBackgroundColor];
  [v114 setBackgroundColor:v7];

  [(PHCarPlayInCallKeypadViewController *)self setView:v114];
  v113 = [[DialerController alloc] initWithDialerType:2];
  [(PHCarPlayGenericDialerViewController *)self setDialerController:v113];
  v8 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v9 = [v8 view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v10 = [(PHCarPlayInCallKeypadViewController *)self view];
  v11 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v12 = [v11 view];
  [v10 addSubview:v12];

  [(PHCarPlayInCallKeypadViewController *)self addChildViewController:v113];
  v13 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  v14 = *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1);
  *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1) = v13;

  [*(id *)((char *)&self->_endButton + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = +[UIColor tableBackgroundColor];
  [*(id *)((char *)&self->_endButton + 1) setBackgroundColor:v15];

  v16 = [(PHCarPlayInCallKeypadViewController *)self view];
  [v16 addSubview:*(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1)];

  v17 = [(PHCarPlayInCallKeypadViewController *)self view];
  [v17 sendSubviewToBack:*(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1)];

  v18 = [[PHCarPlayInCallKeyPadButton alloc] initWithKeyPadButtonType:0 usingSmallFont:0];
  v19 = *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1);
  *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1) = (AVExternalDevice *)v18;

  [*(id *)((char *)&self->super._carPlayExternalDevice + 1) addTarget:self action:"backButtonTapped:" forControlEvents:64];
  id v112 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"backButtonTapped:"];
  [v112 setAllowedPressTypes:&off_10028CCB0];
  v20 = [(PHCarPlayInCallKeypadViewController *)self view];
  [v20 addGestureRecognizer:v112];

  v21 = [(PHCarPlayInCallKeypadViewController *)self view];
  [v21 addSubview:*(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1)];

  v22 = [[PHCarPlayInCallKeyPadButton alloc] initWithKeyPadButtonType:1 usingSmallFont:0];
  v23 = *(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1);
  *(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1) = v22;

  [*(id *)((char *)&self->_backButton + 1) addTarget:self action:"endButtonTapped:" forControlEvents:64];
  v24 = [(PHCarPlayInCallKeypadViewController *)self view];
  [v24 addSubview:*(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1)];

  v116[0] = @"backButton";
  v25 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  v117[0] = v25;
  v116[1] = @"dialer";
  v26 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v27 = [v26 view];
  v117[1] = v27;
  v116[2] = @"endButton";
  v28 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  v117[2] = v28;
  v111 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:3];

  v109 = [*(id *)((char *)&self->_endButton + 1) leftAnchor];
  v110 = [(PHCarPlayInCallKeypadViewController *)self view];
  v108 = [v110 safeAreaLayoutGuide];
  v107 = [v108 leftAnchor];
  v106 = [v109 constraintEqualToAnchor:v107];
  v115[0] = v106;
  v104 = [*(id *)((char *)&self->_endButton + 1) rightAnchor];
  v105 = [(PHCarPlayInCallKeypadViewController *)self view];
  v103 = [v105 safeAreaLayoutGuide];
  v102 = [v103 rightAnchor];
  v101 = [v104 constraintEqualToAnchor:v102];
  v115[1] = v101;
  v100 = [*(id *)((char *)&self->_endButton + 1) heightAnchor];
  [(id)objc_opt_class() fakeNavigationBarHeight];
  v99 = [v100 constraintEqualToConstant:];
  v115[2] = v99;
  v97 = [*(id *)((char *)&self->_endButton + 1) topAnchor];
  v98 = [(PHCarPlayInCallKeypadViewController *)self view];
  v96 = [v98 safeAreaLayoutGuide];
  v95 = [v96 topAnchor];
  v94 = [v97 constraintEqualToAnchor:v95];
  v115[3] = v94;
  v93 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v92 = [v93 view];
  v91 = [v92 topAnchor];
  v90 = [*(id *)((char *)&self->_endButton + 1) topAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v115[4] = v89;
  v88 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v87 = [v88 view];
  v85 = [v87 bottomAnchor];
  v86 = [(PHCarPlayInCallKeypadViewController *)self view];
  v84 = [v86 safeAreaLayoutGuide];
  v83 = [v84 bottomAnchor];
  v82 = [v85 constraintEqualToAnchor:v83];
  v115[5] = v82;
  v81 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v80 = [v81 view];
  v78 = [v80 leftAnchor];
  v79 = [(PHCarPlayInCallKeypadViewController *)self view];
  v77 = [v79 safeAreaLayoutGuide];
  v76 = [v77 leftAnchor];
  v75 = [v78 constraintEqualToAnchor:v76];
  v115[6] = v75;
  v74 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v73 = [v74 view];
  v71 = [v73 rightAnchor];
  v72 = [(PHCarPlayInCallKeypadViewController *)self view];
  v70 = [v72 safeAreaLayoutGuide];
  v69 = [v70 rightAnchor];
  v68 = [v71 constraintEqualToAnchor:v69];
  v115[7] = v68;
  v67 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  v64 = [v67 firstBaselineAnchor];
  v66 = [(PHCarPlayInCallKeypadViewController *)self view];
  v65 = [v66 safeAreaLayoutGuide];
  v63 = [v65 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:30.0];
  v115[8] = v62;
  v61 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  v58 = [v61 rightAnchor];
  v60 = [(PHCarPlayInCallKeypadViewController *)self view];
  v59 = [v60 safeAreaLayoutGuide];
  v57 = [v59 rightAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:-7.0];
  v115[9] = v56;
  v55 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  v52 = [v55 leftAnchor];
  v54 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v53 = [v54 dialerView];
  v51 = [v53 lcdView];
  v50 = [v51 rightAnchor];
  v49 = [v52 constraintGreaterThanOrEqualToAnchor:v50];
  v115[10] = v49;
  v48 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  v46 = [v48 firstBaselineAnchor];
  v47 = [(PHCarPlayInCallKeypadViewController *)self view];
  v45 = [v47 safeAreaLayoutGuide];
  v44 = [v45 topAnchor];
  v43 = [v46 constraintEqualToAnchor:v44 constant:30.0];
  v115[11] = v43;
  v42 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  v39 = [v42 leftAnchor];
  v41 = [(PHCarPlayInCallKeypadViewController *)self view];
  v40 = [v41 safeAreaLayoutGuide];
  v29 = [v40 leftAnchor];
  v30 = [v39 constraintEqualToAnchor:v29 constant:7.0];
  v115[12] = v30;
  v31 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  v32 = [v31 rightAnchor];
  v33 = [(PHCarPlayGenericDialerViewController *)self dialerController];
  v34 = [v33 dialerView];
  v35 = [v34 lcdView];
  v36 = [v35 leftAnchor];
  v37 = [v32 constraintLessThanOrEqualToAnchor:v36];
  v115[13] = v37;
  v38 = +[NSArray arrayWithObjects:v115 count:14];
  +[NSLayoutConstraint activateConstraints:v38];
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = [(PHCarPlayInCallKeypadViewController *)self traitCollection];
  if (([v4 interactionModel] & 2) != 0)
  {

    goto LABEL_5;
  }
  v5 = [(PHCarPlayInCallKeypadViewController *)self traitCollection];
  id v6 = [v5 primaryInteractionModel];

  if (v6 == (id)8)
  {
LABEL_5:
    id v7 = objc_alloc_init((Class)UIFocusContainerGuide);
    v8 = [(PHCarPlayInCallKeypadViewController *)self view];
    [v8 addLayoutGuide:v7];

    id v9 = objc_alloc_init((Class)UIFocusContainerGuide);
    objc_super v10 = [(PHCarPlayInCallKeypadViewController *)self view];
    [v10 addLayoutGuide:v9];

    v43 = [v7 topAnchor];
    v45 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    v44 = [v45 dialerView];
    v42 = [v44 phonePadView];
    v41 = [v42 topAnchor];
    v40 = [v43 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v36 = [v7 bottomAnchor];
    v38 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    v37 = [v38 dialerView];
    v35 = [v37 phonePadView];
    v34 = [v35 bottomAnchor];
    v33 = [v36 constraintEqualToAnchor:v34];
    v46[1] = v33;
    v39 = v7;
    v31 = [v7 leftAnchor];
    v32 = [(PHCarPlayInCallKeypadViewController *)self view];
    v30 = [v32 leftAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v46[2] = v29;
    v26 = [v7 rightAnchor];
    v27 = [(PHCarPlayInCallKeypadViewController *)self view];
    v25 = [v27 rightAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v46[3] = v24;
    v22 = [v9 topAnchor];
    v21 = [*(id *)((char *)&self->_endButton + 1) topAnchor];
    v11 = [v22 constraintEqualToAnchor:v21];
    v46[4] = v11;
    v12 = [v9 bottomAnchor];
    v13 = [*(id *)((char *)&self->_endButton + 1) bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v46[5] = v14;
    v28 = v9;
    v15 = [v9 leftAnchor];
    v16 = [*(id *)((char *)&self->_endButton + 1) leftAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v46[6] = v17;
    v18 = [v9 rightAnchor];
    v19 = [*(id *)((char *)&self->_endButton + 1) rightAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v46[7] = v20;
    v23 = +[NSArray arrayWithObjects:v46 count:8];

    +[NSLayoutConstraint activateConstraints:v23];
  }
}

- (void)backButtonTapped:(id)a3
{
  id v3 = [(PHCarPlayInCallKeypadViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)endButtonTapped:(id)a3
{
  objc_super v4 = +[TUCallCenter sharedInstance];
  [v4 disconnectCurrentCallAndActivateHeld];

  id v5 = [(PHCarPlayInCallKeypadViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallKeypadViewController;
  [(PHCarPlayInCallKeypadViewController *)&v4 viewWillAppear:a3];
  [(PHCarPlayInCallKeypadViewController *)self setLimitedSoftPhoneKeypad:+[PHCarPlayUtilities shouldLimitKeypadAccess]];
  [(PHCarPlayInCallKeypadViewController *)self postMessageOverlayIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  id v19 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  unsigned __int8 v6 = [v19 isUsingSmallFont];
  if ((v6 & 1) == 0)
  {
    v2 = [(PHCarPlayInCallKeypadViewController *)self endButton];
    id v3 = [v2 currentAttributedTitle];
    [v3 size];
    double v8 = v7;
    objc_super v4 = [(PHCarPlayInCallKeypadViewController *)self endButton];
    [v4 frame];
    if (v8 > v9)
    {

      goto LABEL_10;
    }
  }
  objc_super v10 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  if ([v10 isUsingSmallFont])
  {

    if ((v6 & 1) == 0)
    {
    }
    goto LABEL_11;
  }
  v11 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  v12 = [v11 currentAttributedTitle];
  [v12 size];
  double v14 = v13;
  v15 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  [v15 frame];
  double v17 = v16;

  if ((v6 & 1) == 0)
  {
  }
  if (v14 > v17)
  {
LABEL_10:
    v18 = [(PHCarPlayInCallKeypadViewController *)self endButton];
    [v18 setUsingSmallFont:1];

    id v19 = [(PHCarPlayInCallKeypadViewController *)self backButton];
    [v19 setUsingSmallFont:1];
LABEL_11:
  }
}

+ (double)fakeNavigationBarHeight
{
  return 44.0;
}

- (void)limitedUINotification:(id)a3
{
  BOOL v4 = +[PHCarPlayUtilities shouldLimitKeypadAccess];

  [(PHCarPlayInCallKeypadViewController *)self setLimitedSoftPhoneKeypad:v4];
}

- (void)setLimitedSoftPhoneKeypad:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __65__PHCarPlayInCallKeypadViewController_setLimitedSoftPhoneKeypad___block_invoke;
  v3[3] = &unk_10027C838;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id __65__PHCarPlayInCallKeypadViewController_setLimitedSoftPhoneKeypad___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)PHCarPlayInCallKeypadViewController;
  [super setLimitedSoftPhoneKeypad:v2];
  return [*(id *)(a1 + 32) postMessageOverlayIfNeeded];
}

- (void)postMessageOverlayIfNeeded
{
  if ([(PHCarPlayGenericDialerViewController *)self limitedSoftPhoneKeypad]
    && ([(PHCarPlayGenericDialerViewController *)self noContentBannerView],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    double v7 = -[PHCarPlayNoContentBannerView initWithFrame:]([PHCarPlayNoContentBannerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(PHCarPlayGenericDialerViewController *)self setNoContentBannerView:v7];

    double v8 = [(PHCarPlayInCallKeypadViewController *)self view];
    double v9 = [v8 backgroundColor];
    objc_super v10 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v10 setBackgroundColor:v9];

    v11 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v11 setAlpha:0.95];

    v12 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v13 = +[NSBundle bundleForClass:objc_opt_class()];
    double v14 = [v13 localizedStringForKey:@"KEYPAD_ACCESS_IS_LIMITED" value:&stru_100285990 table:@"PHCarPlay"];
    v15 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v15 setTitleString:v14];

    double v16 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v16 setHidden:0];

    double v17 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    v18 = [v17 view];
    [v18 setUserInteractionEnabled:0];

    id v19 = [(PHCarPlayInCallKeypadViewController *)self view];
    v20 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    [v19 addSubview:v20];

    id v45 = [(PHCarPlayInCallKeypadViewController *)self fakeNavigationBar];
    v42 = [v45 bottomAnchor];
    v43 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v41 = [v43 topAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v39 = [(PHCarPlayInCallKeypadViewController *)self view];
    v38 = [v39 safeAreaLayoutGuide];
    v36 = [v38 bottomAnchor];
    v37 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v35 = [v37 bottomAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v46[1] = v34;
    v33 = [(PHCarPlayInCallKeypadViewController *)self view];
    v32 = [v33 safeAreaLayoutGuide];
    v30 = [v32 leftAnchor];
    v31 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v21 = [v31 leftAnchor];
    v22 = [v30 constraintEqualToAnchor:v21];
    v46[2] = v22;
    v23 = [(PHCarPlayInCallKeypadViewController *)self view];
    v24 = [v23 safeAreaLayoutGuide];
    v25 = [v24 rightAnchor];
    v26 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
    v27 = [v26 rightAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v46[3] = v28;
    v29 = +[NSArray arrayWithObjects:v46 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    [(PHCarPlayInCallKeypadViewController *)self setNeedsFocusUpdate];
  }
  else if (![(PHCarPlayGenericDialerViewController *)self limitedSoftPhoneKeypad])
  {
    objc_super v4 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];

    if (v4)
    {
      id v5 = [(PHCarPlayGenericDialerViewController *)self noContentBannerView];
      [v5 removeFromSuperview];

      [(PHCarPlayGenericDialerViewController *)self setNoContentBannerView:0];
      id v44 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      unsigned __int8 v6 = [v44 view];
      [v6 setUserInteractionEnabled:1];
    }
  }
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallKeypadViewController received hardware control event notification: %@", (uint8_t *)&v12, 0xCu);
  }

  if ([(PHCarPlayGenericViewController *)self shouldRespondToHardwareControlEvent])
  {
    unsigned __int8 v6 = [v4 userInfo];
    double v7 = [v6 valueForKey:kTUCarPlayHardwareControlButtonKey];
    double v8 = (void *)kTUCarPlayHardwareControlButtonKeypad;

    if (v7 == v8)
    {
      double v9 = [(PHCarPlayGenericDialerViewController *)self dialerController];
      objc_super v10 = [v4 userInfo];
      v11 = [v10 valueForKey:kTUCarPlayHardwareControlKeypadValueKey];
      [v9 performCharacterAddAction:v11];
    }
  }
}

- (id)preferredFocusEnvironments
{
  if ([(PHCarPlayGenericDialerViewController *)self limitedSoftPhoneKeypad])
  {
    id v3 = [(PHCarPlayInCallKeypadViewController *)self endButton];
    double v9 = v3;
    id v4 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v3 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    id v5 = [v3 dialerView];
    unsigned __int8 v6 = [v5 phonePadView];
    double v8 = v6;
    id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHCarPlayInCallKeypadViewController;
  [(PHCarPlayInCallKeypadViewController *)&v18 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  double v7 = +[UIColor clearColor];
  double v8 = [(PHCarPlayInCallKeypadViewController *)self backButton];
  [v8 setBackgroundColor:v7];

  double v9 = +[UIColor clearColor];
  objc_super v10 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  [v10 setBackgroundColor:v9];

  v11 = [v6 nextFocusedItem];
  uint64_t v12 = [(PHCarPlayInCallKeypadViewController *)self endButton];
  if (v11 == (void *)v12)
  {

LABEL_5:
    double v16 = [v6 nextFocusedItem];
    double v17 = +[UIColor dynamicCarFocusedColor];
    [v16 setBackgroundColor:v17];

    goto LABEL_6;
  }
  id v13 = (void *)v12;
  double v14 = [v6 nextFocusedItem];
  v15 = [(PHCarPlayInCallKeypadViewController *)self backButton];

  if (v14 == v15) {
    goto LABEL_5;
  }
LABEL_6:
}

- (PHCarPlayInCallKeyPadButton)backButton
{
  return (PHCarPlayInCallKeyPadButton *)objc_getProperty(self, a2, 49, 1);
}

- (void)setBackButton:(id)a3
{
}

- (PHCarPlayInCallKeyPadButton)endButton
{
  return (PHCarPlayInCallKeyPadButton *)objc_getProperty(self, a2, 57, 1);
}

- (void)setEndButton:(id)a3
{
}

- (UIView)fakeNavigationBar
{
  return (UIView *)objc_getProperty(self, a2, 65, 1);
}

- (void)setFakeNavigationBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_endButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_backButton + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._carPlayExternalDevice + 1), 0);
}

@end