@interface SVSSubCredentialActivationStartViewController
- (BOOL)_canShowWhileLocked;
- (NSString)appName;
- (PRXAction)openAction;
- (PRXButton)openButton;
- (SubCredentialActivationMainController)mainController;
- (UIActivityIndicatorView)activityIndicator;
- (UIImage)appIconImage;
- (UIImageView)appIconImageView;
- (void)_handleEnterCode;
- (void)_handleOpenApp;
- (void)setActivityIndicator:(id)a3;
- (void)setAppIconImage:(id)a3;
- (void)setAppIconImageView:(id)a3;
- (void)setAppName:(id)a3;
- (void)setMainController:(id)a3;
- (void)setOpenAction:(id)a3;
- (void)setOpenButton:(id)a3;
- (void)updateAppName:(id)a3 image:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SVSSubCredentialActivationStartViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_openButton);
  objc_destroyWeak((id *)&self->_openAction);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_appIconImageView, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_destroyWeak((id *)&self->_mainController);
}

- (void)setOpenButton:(id)a3
{
}

- (PRXButton)openButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openButton);

  return (PRXButton *)WeakRetained;
}

- (void)setOpenAction:(id)a3
{
}

- (PRXAction)openAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openAction);

  return (PRXAction *)WeakRetained;
}

- (void)setAppIconImage:(id)a3
{
}

- (UIImage)appIconImage
{
  return self->_appIconImage;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setAppIconImageView:(id)a3
{
}

- (UIImageView)appIconImageView
{
  return self->_appIconImageView;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setMainController:(id)a3
{
}

- (SubCredentialActivationMainController)mainController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);

  return (SubCredentialActivationMainController *)WeakRetained;
}

- (void)_handleOpenApp
{
  if (dword_1001CCB18 <= 50 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3 = [(SVSSubCredentialActivationStartViewController *)self mainController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012D120;
  v4[3] = &unk_1001A1BD8;
  v4[4] = self;
  [v3 dismissAnimated:1 completion:v4];
}

- (void)_handleEnterCode
{
  if (dword_1001CCB18 <= 50 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SVSSubCredentialActivationStartViewController *)self mainController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012D394;
  v4[3] = &unk_1001A1BD8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [v3 dismissAnimated:1 completion:v4];
}

- (void)updateAppName:(id)a3 image:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (dword_1001CCB18 <= 50 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  [v7 setHidden:1];

  v8 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  [v8 stopAnimating];

  v9 = [(SVSSubCredentialActivationStartViewController *)self openButton];
  if ([v23 length])
  {
    v10 = [(SVSSubCredentialActivationStartViewController *)self mainController];
    v11 = [v10 appContent];
    unsigned int v12 = [v11 installed];

    if (v12) {
      v19 = @"SUBCREDENTIAL_OPEN_BUTTON_INSTALLED";
    }
    else {
      v19 = @"SUBCREDENTIAL_OPEN_BUTTON_UNINSTALLED";
    }
    v20 = sub_100138540(@"Localizable-Subcredential", v19, v13, v14, v15, v16, v17, v18, (uint64_t)v23);
    [v9 setTitle:v20 forState:0];
    [v9 setHidden:0];
  }
  else
  {
    [v9 setHidden:1];
  }
  [(SVSSubCredentialActivationStartViewController *)self setAppIconImage:v6];
  v21 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v21 setImage:v6];

  v22 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v22 setBackgroundColor:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SVSSubCredentialActivationStartViewController;
  [(SVSSubCredentialActivationStartViewController *)&v13 viewWillAppear:a3];
  v4 = [(SVSSubCredentialActivationStartViewController *)self mainController];
  id v5 = [v4 _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.3];

  id v6 = [(SVSSubCredentialActivationStartViewController *)self appIconImage];

  if (v6)
  {
    v7 = [(SVSSubCredentialActivationStartViewController *)self appName];
    v8 = [(SVSSubCredentialActivationStartViewController *)self appIconImage];
    [(SVSSubCredentialActivationStartViewController *)self updateAppName:v7 image:v8];
  }
  else
  {
    v9 = +[UIColor secondarySystemFillColor];
    v10 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
    [v10 setBackgroundColor:v9];

    v11 = [(SVSSubCredentialActivationStartViewController *)self openButton];
    [v11 setHidden:1];

    unsigned int v12 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
    [v12 setHidden:0];

    v7 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
    [v7 startAnimating];
  }
}

- (void)viewDidLoad
{
  v88.receiver = self;
  v88.super_class = (Class)SVSSubCredentialActivationStartViewController;
  [(SVSSubCredentialActivationStartViewController *)&v88 viewDidLoad];
  v78 = [(SVSSubCredentialActivationStartViewController *)self mainController];
  [(SVSSubCredentialActivationStartViewController *)self setDismissalType:3];
  id v3 = [v78 cardTitle];
  [(SVSSubCredentialActivationStartViewController *)self setTitle:v3];

  v4 = [v78 cardSubtitle];
  [(SVSSubCredentialActivationStartViewController *)self setSubtitle:v4];

  id location = 0;
  objc_initWeak(&location, self);
  v77 = sub_100138540(@"Localizable-Subcredential", @"SUBCREDENTIAL_ENTER_CODE", v5, v6, v7, v8, v9, v10, v42);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_10012E218;
  v85[3] = &unk_1001A19A0;
  objc_copyWeak(&v86, &location);
  v76 = +[PRXAction actionWithTitle:v77 style:0 handler:v85];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10012E258;
  v83[3] = &unk_1001A19A0;
  objc_copyWeak(&v84, &location);
  v75 = +[PRXAction actionWithTitle:&stru_1001A1DC0 style:1 handler:v83];
  -[SVSSubCredentialActivationStartViewController setOpenAction:](self, "setOpenAction:");
  id v11 = [(SVSSubCredentialActivationStartViewController *)self addAction:v76];
  id v12 = [(SVSSubCredentialActivationStartViewController *)self addAction:v75];
  id v13 = objc_alloc_init((Class)UIImageView);
  [(SVSSubCredentialActivationStartViewController *)self setAppIconImageView:v13];

  uint64_t v14 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v15 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v15 _setContinuousCornerRadius:20.0];

  uint64_t v16 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  uint64_t v17 = [v16 layer];
  [v17 setMasksToBounds:1];

  uint64_t v18 = +[UIColor labelColor];
  v19 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v19 setTintColor:v18];

  v20 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v21 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  [v20 addSubview:v21];

  id v22 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [(SVSSubCredentialActivationStartViewController *)self setActivityIndicator:v22];

  id v23 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  [v24 setHidden:1];

  v25 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v26 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  [v25 addSubview:v26];

  v74 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v71 = [v74 topAnchor];
  v73 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v72 = [v73 mainContentGuide];
  v70 = [v72 topAnchor];
  v69 = [v71 constraintGreaterThanOrEqualToAnchor:v70];
  v90[0] = v69;
  v68 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v65 = [v68 centerYAnchor];
  v67 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v66 = [v67 mainContentGuide];
  v64 = [v66 centerYAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v90[1] = v63;
  v62 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v59 = [v62 centerXAnchor];
  v61 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v60 = [v61 mainContentGuide];
  v58 = [v60 centerXAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v90[2] = v57;
  v56 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v55 = [v56 heightAnchor];
  v54 = [v55 constraintEqualToConstant:98.0];
  v90[3] = v54;
  v53 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v52 = [v53 widthAnchor];
  v51 = [v52 constraintEqualToConstant:98.0];
  v90[4] = v51;
  v50 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v47 = [v50 bottomAnchor];
  v49 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v48 = [v49 mainContentGuide];
  v46 = [v48 bottomAnchor];
  v45 = [v47 constraintLessThanOrEqualToAnchor:v46];
  v90[5] = v45;
  v44 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  v43 = [v44 centerXAnchor];
  v27 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v28 = [v27 centerXAnchor];
  v29 = [v43 constraintEqualToAnchor:v28];
  v90[6] = v29;
  v30 = [(SVSSubCredentialActivationStartViewController *)self activityIndicator];
  v31 = [v30 centerYAnchor];
  v32 = [(SVSSubCredentialActivationStartViewController *)self appIconImageView];
  v33 = [v32 centerYAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v90[7] = v34;
  v35 = +[NSArray arrayWithObjects:v90 count:8];
  +[NSLayoutConstraint activateConstraints:v35];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v36 = [(SVSSubCredentialActivationStartViewController *)self contentView];
  v37 = [v36 actionButtons];

  id v38 = [v37 countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v80;
    while (2)
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v80 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if (![v41 proximityButtonType])
        {
          id v38 = v41;
          goto LABEL_11;
        }
      }
      id v38 = [v37 countByEnumeratingWithState:&v79 objects:v89 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v38 setHidden:1];
  [(SVSSubCredentialActivationStartViewController *)self setOpenButton:v38];

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);

  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end