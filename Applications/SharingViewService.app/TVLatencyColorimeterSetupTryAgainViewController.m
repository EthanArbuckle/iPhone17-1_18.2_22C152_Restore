@interface TVLatencyColorimeterSetupTryAgainViewController
- (NSError)error;
- (void)_handleDismissButton;
- (void)_handleTryAgainButton;
- (void)setError:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencyColorimeterSetupTryAgainViewController

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)_handleDismissButton
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(TVLatencyColorimeterSetupBaseViewController *)self mainController];
  [v3 dismiss:5];
}

- (void)_handleTryAgainButton
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(TVLatencyColorimeterSetupBaseViewController *)self mainController];
  id v4 = [v3 testFlags];

  v5 = [(TVLatencyColorimeterSetupBaseViewController *)self mainController];
  [v5 showProgressUI];

  if (!v4)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001134A4;
    block[3] = &unk_1001A1BD8;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  [(TVLatencyColorimeterSetupTryAgainViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  [(TVLatencyColorimeterSetupTryAgainViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v56.receiver = self;
  v56.super_class = (Class)TVLatencyColorimeterSetupTryAgainViewController;
  [(TVLatencyColorimeterSetupTryAgainViewController *)&v56 viewDidLoad];
  [(TVLatencyColorimeterSetupTryAgainViewController *)self setDismissalType:3];
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = sub_100138280(@"Localizable", @"TRY_AGAIN");
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100113D3C;
  v53[3] = &unk_1001A19A0;
  objc_copyWeak(&v54, &location);
  v49 = +[PRXAction actionWithTitle:v3 style:0 handler:v53];

  id v4 = [(TVLatencyColorimeterSetupTryAgainViewController *)self addAction:v49];
  objc_super v5 = +[NSBundle mainBundle];
  dispatch_time_t v6 = [v5 localizedStringForKey:@"CANCEL" value:&stru_1001A1DC0 table:@"Localizable"];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100113D7C;
  v51[3] = &unk_1001A19A0;
  objc_copyWeak(&v52, &location);
  v48 = +[PRXAction actionWithTitle:v6 style:1 handler:v51];

  id v7 = [(TVLatencyColorimeterSetupTryAgainViewController *)self addAction:v48];
  v8 = +[NSBundle mainBundle];
  v9 = sub_100138304(v8, @"Localizable-TVLatencyColorimeter", @"TLV_COLOR_TRYAGAIN_TITLE");
  [(TVLatencyColorimeterSetupTryAgainViewController *)self setTitle:v9];

  v10 = +[NSBundle mainBundle];
  v11 = sub_100138304(v10, @"Localizable-TVLatencyColorimeter", @"TLV_COLOR_TRYAGAIN_SUBTITLE");
  [(TVLatencyColorimeterSetupTryAgainViewController *)self setSubtitle:v11];

  id v12 = objc_alloc((Class)UIImageView);
  v13 = +[UIImage imageNamed:@"TV_Colorimeter"];
  id v14 = [v12 initWithImage:v13];

  [v14 setContentMode:1];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [(TVLatencyColorimeterSetupTryAgainViewController *)self contentView];
  [v15 addSubview:v14];

  id v16 = objc_alloc((Class)UIImageView);
  v17 = +[UIImage systemImageNamed:@"exclamationmark.circle"];
  v18 = (UIImageView *)[v16 initWithImage:v17];
  statusImageViewIcon = self->super._statusImageViewIcon;
  self->super._statusImageViewIcon = v18;

  v20 = +[UIColor systemRedColor];
  [(UIImageView *)self->super._statusImageViewIcon setTintColor:v20];

  [(UIImageView *)self->super._statusImageViewIcon setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(TVLatencyColorimeterSetupTryAgainViewController *)self contentView];
  [v21 addSubview:self->super._statusImageViewIcon];

  v22 = [(TVLatencyColorimeterSetupTryAgainViewController *)self contentView];
  v50 = [v22 mainContentGuide];

  v47 = [v14 topAnchor];
  v46 = [v50 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v57[0] = v45;
  v44 = [v14 bottomAnchor];
  v43 = [v50 bottomAnchor];
  v42 = [v44 constraintLessThanOrEqualToAnchor:v43];
  v57[1] = v42;
  v41 = [v14 leadingAnchor];
  v40 = [v50 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v57[2] = v39;
  v38 = [v14 trailingAnchor];
  v37 = [v50 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v57[3] = v36;
  v35 = [v14 heightAnchor];
  v34 = [v35 constraintEqualToConstant:150.0];
  v57[4] = v34;
  v33 = [(UIImageView *)self->super._statusImageViewIcon centerXAnchor];
  v32 = [v14 centerXAnchor];
  v23 = [v33 constraintEqualToAnchor:v32];
  v57[5] = v23;
  v24 = [(UIImageView *)self->super._statusImageViewIcon centerYAnchor];
  v25 = [v14 centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:-6.0];
  v57[6] = v26;
  v27 = [(UIImageView *)self->super._statusImageViewIcon widthAnchor];
  v28 = [v27 constraintEqualToConstant:40.0];
  v57[7] = v28;
  v29 = [(UIImageView *)self->super._statusImageViewIcon heightAnchor];
  v30 = [v29 constraintEqualToConstant:40.0];
  v57[8] = v30;
  v31 = +[NSArray arrayWithObjects:v57 count:9];
  +[NSLayoutConstraint activateConstraints:v31];

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
}

@end