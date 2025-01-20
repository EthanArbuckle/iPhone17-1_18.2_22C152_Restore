@interface TVLatencyColorimeterSetupDoneViewController
- (BOOL)completed;
- (NSError)error;
- (void)_handleDismissButton;
- (void)setCompleted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencyColorimeterSetupDoneViewController

- (void).cxx_destruct
{
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
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

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  [(TVLatencyColorimeterSetupDoneViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v20.receiver = self;
  v20.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  [(TVLatencyColorimeterSetupDoneViewController *)&v20 viewWillAppear:v3];
  error = self->_error;
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (error)
  {
    v8 = sub_100138304(v6, @"Localizable-TVLatencyColorimeter", @"TLV_COLOR_FAILED_TITLE");
    [(TVLatencyColorimeterSetupDoneViewController *)self setTitle:v8];

    v9 = +[NSBundle mainBundle];
    v10 = sub_100138304(v9, @"Localizable-TVLatencyColorimeter", @"TLV_COLOR_FAILED_SUBTITLE");
    [(TVLatencyColorimeterSetupDoneViewController *)self setSubtitle:v10];

    v11 = +[UIColor systemRedColor];
    CFStringRef v12 = @"exclamationmark.circle";
  }
  else
  {
    if (self->_completed) {
      v13 = @"TVL_COLOR_SUCCESS_TITLE";
    }
    else {
      v13 = @"TVL_COLOR_SUCCESS2_TITLE";
    }
    v14 = sub_100138304(v6, @"Localizable-TVLatencyColorimeter", v13);
    [(TVLatencyColorimeterSetupDoneViewController *)self setTitle:v14];

    v15 = +[NSBundle mainBundle];
    v16 = v15;
    if (self->_completed) {
      v17 = @"TVL_COLOR_SUCCESS_SUBTITLE";
    }
    else {
      v17 = @"TVL_COLOR_SUCCESS2_SUBTITLE";
    }
    v18 = sub_100138304(v15, @"Localizable-TVLatencyColorimeter", v17);
    [(TVLatencyColorimeterSetupDoneViewController *)self setSubtitle:v18];

    v11 = +[UIColor colorWithRed:0.203921569 green:0.470588235 blue:0.964705882 alpha:1.0];
    CFStringRef v12 = @"checkmark.circle";
  }
  [(UIImageView *)self->super._statusImageViewIcon setTintColor:v11];

  v19 = +[UIImage systemImageNamed:v12];
  [(UIImageView *)self->super._statusImageViewIcon setImage:v19];
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)TVLatencyColorimeterSetupDoneViewController;
  [(TVLatencyColorimeterSetupDoneViewController *)&v46 viewDidLoad];
  [(TVLatencyColorimeterSetupDoneViewController *)self setDismissalType:3];
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = sub_100138280(@"Localizable", @"DONE");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100115D60;
  v43[3] = &unk_1001A19A0;
  objc_copyWeak(&v44, &location);
  v41 = +[PRXAction actionWithTitle:v3 style:0 handler:v43];

  id v4 = [(TVLatencyColorimeterSetupDoneViewController *)self addAction:v41];
  id v5 = objc_alloc((Class)UIImageView);
  v6 = +[UIImage imageNamed:@"TV_Colorimeter"];
  id v7 = [v5 initWithImage:v6];

  [v7 setContentMode:1];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(TVLatencyColorimeterSetupDoneViewController *)self contentView];
  [v8 addSubview:v7];

  id v9 = objc_alloc((Class)UIImageView);
  v10 = +[UIImage systemImageNamed:@"exclamationmark.circle"];
  v11 = (UIImageView *)[v9 initWithImage:v10];
  statusImageViewIcon = self->super._statusImageViewIcon;
  self->super._statusImageViewIcon = v11;

  v13 = +[UIColor systemRedColor];
  [(UIImageView *)self->super._statusImageViewIcon setTintColor:v13];

  [(UIImageView *)self->super._statusImageViewIcon setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(TVLatencyColorimeterSetupDoneViewController *)self contentView];
  [v14 addSubview:self->super._statusImageViewIcon];

  v15 = [(TVLatencyColorimeterSetupDoneViewController *)self contentView];
  v42 = [v15 mainContentGuide];

  v40 = [v7 topAnchor];
  v39 = [v42 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v47[0] = v38;
  v37 = [v7 bottomAnchor];
  v36 = [v42 bottomAnchor];
  v35 = [v37 constraintLessThanOrEqualToAnchor:v36];
  v47[1] = v35;
  v34 = [v7 leadingAnchor];
  v33 = [v42 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v47[2] = v32;
  v31 = [v7 trailingAnchor];
  v30 = [v42 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v47[3] = v29;
  v28 = [v7 heightAnchor];
  v27 = [v28 constraintEqualToConstant:150.0];
  v47[4] = v27;
  v26 = [(UIImageView *)self->super._statusImageViewIcon centerXAnchor];
  v25 = [v7 centerXAnchor];
  v16 = [v26 constraintEqualToAnchor:v25];
  v47[5] = v16;
  v17 = [(UIImageView *)self->super._statusImageViewIcon centerYAnchor];
  v18 = [v7 centerYAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-6.0];
  v47[6] = v19;
  objc_super v20 = [(UIImageView *)self->super._statusImageViewIcon widthAnchor];
  v21 = [v20 constraintEqualToConstant:40.0];
  v47[7] = v21;
  v22 = [(UIImageView *)self->super._statusImageViewIcon heightAnchor];
  v23 = [v22 constraintEqualToConstant:40.0];
  v47[8] = v23;
  v24 = +[NSArray arrayWithObjects:v47 count:9];
  +[NSLayoutConstraint activateConstraints:v24];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

@end