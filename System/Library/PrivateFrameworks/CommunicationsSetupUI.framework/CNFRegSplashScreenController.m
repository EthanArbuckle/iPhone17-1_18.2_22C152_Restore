@interface CNFRegSplashScreenController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CNFRegController)regController;
- (CNFRegFirstRunDelegate)delegate;
- (CNFRegSplashScreenController)init;
- (CNFRegSplashScreenController)initWithRegController:(id)a3 account:(id)a4;
- (UIBarButtonItem)customLeftButton;
- (UIBarButtonItem)customRightButton;
- (id)userInteractionColor;
- (int64_t)currentAppearanceStyle;
- (void)_getStartedPressed:(id)a3;
- (void)_learnMorePressed:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setCustomLeftButton:(id)a3;
- (void)setCustomRightButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRegController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation CNFRegSplashScreenController

- (CNFRegSplashScreenController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNFRegSplashScreenController;
  v2 = [(CNFRegSplashScreenController *)&v7 init];
  if (v2)
  {
    v3 = CommunicationsSetupUIBundle();
    v4 = CNFRegStringTableName();
    v5 = [v3 localizedStringForKey:@"FACETIME" value:&stru_26D05D4F8 table:v4];
    [(CNFRegSplashScreenController *)v2 setTitle:v5];
  }
  return v2;
}

- (CNFRegSplashScreenController)initWithRegController:(id)a3 account:(id)a4
{
  id v5 = a3;
  v6 = [(CNFRegSplashScreenController *)self init];
  objc_super v7 = v6;
  if (v6) {
    [(CNFRegSplashScreenController *)v6 setRegController:v5];
  }

  return v7;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegSplashScreenController;
  [(CNFRegSplashScreenController *)&v2 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  id v69 = (id)objc_msgSend(v3, "initWithFrame:");

  [v69 setAutoresizesSubviews:0];
  [v69 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v12 = v5;
  if (v5 >= 580.0) {
    double v13 = 131.0;
  }
  else {
    double v13 = v5 / 580.0 * 131.0;
  }
  v14 = [MEMORY[0x263F825C8] whiteColor];
  [v69 setBackgroundColor:v14];

  v71.origin.x = v7;
  v71.origin.y = v9;
  v71.size.width = v11;
  v71.size.height = v12;
  double v15 = CGRectGetWidth(v71) + -70.0;
  id v16 = objc_alloc(MEMORY[0x263F828E0]);
  v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v18 = [MEMORY[0x263F81708] fontWithName:@"Helvetica Neue Light" size:18.0];
  [v17 setFont:v18];

  v19 = [MEMORY[0x263F3BB18] sharedInstance];
  int v20 = [v19 supportsWLAN];
  int v21 = _os_feature_enabled_impl();
  v22 = CNFRegStringTableName();
  v23 = CommunicationsSetupUIBundle();
  v24 = @"FACETIME_SPLASH_SYNOPSIS_WLAN";
  if (v21) {
    v24 = @"FACETIME_SPLASH_SYNOPSIS_WLAN_APPLEACCOUNT";
  }
  v25 = @"FACETIME_SPLASH_SYNOPSIS_WIFI_APPLEACCOUNT";
  if (!v21) {
    v25 = @"FACETIME_SPLASH_SYNOPSIS_WIFI";
  }
  if (v20) {
    v26 = v24;
  }
  else {
    v26 = v25;
  }
  v27 = CNFLocalizedStringFromTableInBundleWithFallback(v26, v22, v23);
  [v17 setText:v27];

  v28 = [MEMORY[0x263F825C8] blackColor];
  [v17 setTextColor:v28];

  [v17 setTextAlignment:1];
  [v17 setLineBreakMode:0];
  [v17 setNumberOfLines:0];
  [v17 sizeToFit];
  objc_msgSend(v17, "sizeThatFits:", v15, 1.79769313e308);
  double v30 = v29;
  double v32 = v31;
  v72.origin.x = v7;
  v72.origin.y = v9;
  v72.size.width = v11;
  v72.size.height = v12;
  CGFloat v33 = floor(CGRectGetMidX(v72) + v30 * -0.5);
  objc_msgSend(v17, "setFrame:", v33, v13, v30, v32);
  [v69 addSubview:v17];
  v73.origin.x = v33;
  v73.origin.y = v13;
  v73.size.width = v30;
  v73.size.height = v32;
  CGFloat v34 = v12;
  double v35 = CGRectGetMaxY(v73) + 20.5;
  CGFloat rect = v11;
  if (self->_learnMoreButton)
  {
    CGFloat v36 = v9;
  }
  else
  {
    v37 = CommunicationsSetupUIBundle();
    v38 = CNFRegStringTableName();
    v39 = [v37 localizedStringForKey:@"FACETIME_SPLASH_LEARN_MORE" value:&stru_26D05D4F8 table:v38];
    v40 = [(CNFRegSplashScreenController *)self userInteractionColor];
    v41 = +[CNFRegLearnMoreButton roundedButtonWithText:v39 color:v40];
    learnMoreButton = self->_learnMoreButton;
    self->_learnMoreButton = v41;

    [(UIButton *)self->_learnMoreButton setAutoresizingMask:5];
    [(UIButton *)self->_learnMoreButton addTarget:self action:sel__learnMorePressed_ forControlEvents:64];
    [(UIButton *)self->_learnMoreButton sizeToFit];
    [(UIButton *)self->_learnMoreButton bounds];
    CGFloat v45 = v44;
    double v67 = v35;
    CGFloat v47 = v46;
    double v49 = v48;
    if (v43 <= v11) {
      double v50 = v43;
    }
    else {
      double v50 = v11;
    }
    v74.origin.x = v7;
    v74.origin.y = v9;
    v74.size.width = v11;
    v74.size.height = v34;
    CGFloat MidX = CGRectGetMidX(v74);
    double v52 = v9;
    double v53 = MidX;
    v75.origin.x = v45;
    v75.origin.y = v47;
    CGFloat v36 = v52;
    v75.size.width = v50;
    v75.size.height = v49;
    CGFloat v54 = floor(v53 + CGRectGetWidth(v75) * -0.5);
    -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v54, v67, v50, v49);
    [v69 addSubview:self->_learnMoreButton];
    v76.origin.x = v54;
    v76.origin.y = v67;
    v76.size.width = v50;
    v76.size.height = v49;
    double v35 = CGRectGetMaxY(v76) + 58.0;
  }
  v55 = [MEMORY[0x263F824E8] buttonWithType:1];
  v56 = CommunicationsSetupUIBundle();
  v57 = CNFRegStringTableName();
  v58 = [v56 localizedStringForKey:@"FACETIME_SPLASH_GET_STARTED" value:&stru_26D05D4F8 table:v57];
  [v55 setTitle:v58 forState:0];

  v59 = [(CNFRegSplashScreenController *)self userInteractionColor];
  [v55 setTitleColor:v59 forState:0];

  v60 = [v55 titleLabel];
  v61 = [MEMORY[0x263F81708] fontWithName:@"Helvetica Neue Medium" size:18.0];
  [v60 setFont:v61];

  objc_msgSend(v55, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  objc_msgSend(v55, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
  [v55 sizeToFit];
  [v55 frame];
  double v63 = v62;
  double v65 = v64;
  v77.origin.x = v7;
  v77.origin.y = v36;
  v77.size.width = rect;
  v77.size.height = v34;
  double v66 = CGRectGetMidX(v77);
  [v55 frame];
  objc_msgSend(v55, "setFrame:", v66 + CGRectGetWidth(v78) * -0.5, v35 - v65, v63, v65);
  [v55 addTarget:self action:sel__getStartedPressed_ forControlEvents:64];
  [v69 addSubview:v55];
  [(CNFRegSplashScreenController *)self setView:v69];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashScreenController;
  [(CNFRegSplashScreenController *)&v3 willBecomeActive];
  [(UIButton *)self->_learnMoreButton setSelected:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIButton *)self->_learnMoreButton setSelected:0];
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSplashScreenController;
  [(CNFRegSplashScreenController *)&v5 viewWillAppear:v3];
}

- (id)userInteractionColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.145098039 green:0.439215686 blue:0.843137255 alpha:1.0];
}

- (void)_learnMorePressed:(id)a3
{
  BOOL v3 = (void *)*MEMORY[0x263F83300];
  CNFRegLocalizedSplashScreenURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 openURL:v4 withCompletionHandler:0];
}

- (void)_getStartedPressed:(id)a3
{
  id v4 = [CNFRegSignInController alloc];
  objc_super v5 = [(CNFRegSplashScreenController *)self regController];
  double v10 = [(CNFRegFirstRunController *)v4 initWithRegController:v5];

  [(CNFRegSignInController *)v10 setHideLearnMoreButton:1];
  double v6 = [(CNFRegSplashScreenController *)self delegate];
  [(CNFRegFirstRunController *)v10 setDelegate:v6];

  CGFloat v7 = [(CNFRegSplashScreenController *)self rootController];
  [(CNFRegSignInController *)v10 setRootController:v7];

  double v8 = [(CNFRegSplashScreenController *)self parentController];
  [(CNFRegSignInController *)v10 setParentController:v8];

  CGFloat v9 = [(CNFRegSplashScreenController *)self rootController];
  [v9 showController:v10];
}

- (int64_t)currentAppearanceStyle
{
  return 2;
}

- (void)setCustomLeftButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegSplashScreenController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];
}

- (UIBarButtonItem)customLeftButton
{
  objc_super v2 = [(CNFRegSplashScreenController *)self navigationItem];
  BOOL v3 = [v2 leftBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)setCustomRightButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegSplashScreenController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (UIBarButtonItem)customRightButton
{
  objc_super v2 = [(CNFRegSplashScreenController *)self navigationItem];
  BOOL v3 = [v2 rightBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (CNFRegFirstRunDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegFirstRunDelegate *)a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regController, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end