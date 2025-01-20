@interface STKClass0SMSViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (STKClass0SMSSessionAction)sessionAction;
- (id)alertContainerView;
- (id)blurEffectContainerView;
- (id)contentContainerView;
- (id)darkBlurView;
- (id)dismissButton;
- (id)learnMoreButton;
- (id)messageTextLabel;
- (id)messageTitleLabel;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)learnMoreButtonClicked:(id)a3;
- (void)setMessageString:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STKClass0SMSViewController

- (void)dealloc
{
  [(STKClass0SMSSessionAction *)self->_sessionAction invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STKClass0SMSViewController;
  [(STKClass0SMSViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)STKClass0SMSViewController;
  [(STKClass0SMSViewController *)&v4 viewDidLoad];
  unint64_t v3 = [(STKClass0SMSViewController *)self _remoteViewControllerProxy];
  [v3 setAllowsAlertStacking:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STKClass0SMSViewController;
  [(STKClass0SMSViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(STKClass0SMSViewController *)self sessionAction];
  v5 = [v4 sessionData];
  v6 = [v5 body];
  [(STKClass0SMSViewController *)self setMessageString:v6];
}

- (void)viewDidLayoutSubviews
{
  v74.receiver = self;
  v74.super_class = (Class)STKClass0SMSViewController;
  [(STKClass0SMSViewController *)&v74 viewDidLayoutSubviews];
  unint64_t v3 = [(STKClass0SMSViewController *)self view];
  [v3 bounds];
  double v71 = v5;
  double v72 = v4;
  double v70 = v6;
  double v73 = v7;

  v8 = [(STKClass0SMSViewController *)self view];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v17 = [(STKClass0SMSViewController *)self messageTitleLabel];
  v18 = [(STKClass0SMSViewController *)self learnMoreButton];
  v19 = [(STKClass0SMSViewController *)self messageTextLabel];
  v75.origin.x = v10;
  v75.origin.CGFloat y = v12;
  CGFloat v20 = v12;
  v75.size.width = v14;
  v75.size.height = v16;
  CGFloat v21 = CGRectGetHeight(v75) + -40.0 + -52.0 + -24.0;
  [v17 frame];
  CGFloat v22 = v21 - (CGRectGetHeight(v76) + 16.0);
  [v18 frame];
  double v23 = v22 - (CGRectGetHeight(v77) + 32.0) + -44.0;
  [v19 sizeThatFits:];
  if (v24 >= v23) {
    double v24 = v23;
  }
  double rect_16 = v24;
  CGFloat y = CGRectZero.origin.y;
  CGFloat v26 = v24 + 52.0 + 44.0 + 24.0;
  v78.origin.x = v10;
  v78.origin.CGFloat y = v20;
  v78.size.width = v14;
  v78.size.height = v16;
  CGFloat v27 = CGRectGetWidth(v78) * 0.5;
  v79.origin.x = CGRectZero.origin.x;
  CGFloat rect_8 = y;
  v79.origin.CGFloat y = y;
  v79.size.width = 270.0;
  v79.size.height = v26;
  CGFloat v28 = v27 - CGRectGetWidth(v79) * 0.5;
  v80.origin.x = v10;
  v80.origin.CGFloat y = v20;
  v80.size.width = v14;
  v80.size.height = v16;
  CGFloat v29 = CGRectGetHeight(v80) * 0.5;
  v81.origin.x = v28;
  v81.origin.CGFloat y = y;
  v81.size.width = 270.0;
  v81.size.height = v26;
  CGFloat v30 = v29 - CGRectGetHeight(v81) * 0.5;
  v31 = [(STKClass0SMSViewController *)self contentContainerView];
  v32 = [(STKClass0SMSViewController *)self blurEffectContainerView];
  [v32 setFrame:v28, v30, 270.0, v26];
  CGFloat recta = v30;
  CGFloat v33 = v26;
  [v31 setFrame:v28, v30, 270.0, v26];
  v34 = [(STKClass0SMSViewController *)self view];
  [v34 bringSubviewToFront:v31];

  [v17 frame];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  double v40 = v39;
  double v42 = v41;
  v82.origin.x = v28;
  v82.origin.CGFloat y = v30;
  v82.size.width = 270.0;
  v82.size.height = v33;
  CGFloat v43 = CGRectGetWidth(v82) * 0.5;
  v83.origin.x = v36;
  v83.origin.CGFloat y = v38;
  v83.size.width = v40;
  v83.size.height = v42;
  CGFloat v44 = v43 - CGRectGetWidth(v83) * 0.5;
  v84.origin.x = v44;
  v84.origin.CGFloat y = v38;
  v84.size.width = v40;
  v84.size.height = v42;
  CGFloat v45 = 36.0 - CGRectGetHeight(v84);
  [v17 setFrame:v44, v45, v40, v42];
  v85.origin.x = v44;
  v85.origin.CGFloat y = v45;
  v85.size.width = v40;
  v85.size.height = v42;
  CGFloat v46 = CGRectGetMaxY(v85) + 16.0;
  [v19 setFrame:20.0, v46, 230.0, rect_16];
  v47 = [(STKClass0SMSViewController *)self dismissButton];
  [v32 frame];
  double Width = CGRectGetWidth(v86);
  v87.origin.x = v28;
  v87.size.width = 270.0;
  v87.origin.CGFloat y = recta;
  v87.size.height = v33;
  CGFloat v49 = CGRectGetWidth(v87) * 0.5;
  v88.origin.x = CGRectZero.origin.x;
  v88.origin.CGFloat y = rect_8;
  v88.size.width = Width;
  v88.size.height = 44.0;
  CGFloat v50 = v49 - CGRectGetWidth(v88) * 0.5;
  v89.origin.x = 20.0;
  v89.origin.CGFloat y = v46;
  v89.size.width = 230.0;
  v89.size.height = rect_16;
  [v47 setFrame:v50, CGRectGetMaxY(v89) + 24.0, Width, 44.0];
  lineLayer = self->_lineLayer;
  [v47 frame];
  double v53 = v52;
  [v47 frame];
  -[CALayer setFrame:](lineLayer, "setFrame:", v53, -1.0, CGRectGetWidth(v90), 1.0);
  v54 = [(STKClass0SMSViewController *)self alertContainerView];
  [v54 setFrame:v72, v71, v70, v73];
  v55 = [(STKClass0SMSViewController *)self darkBlurView];
  [v55 setFrame:v72, v71, v70, v73];
  [v18 sizeToFit];
  [v18 frame];
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  double v61 = v60;
  double v63 = v62;
  v91.origin.x = v72;
  v91.origin.CGFloat y = v71;
  v91.size.width = v70;
  v91.size.height = v73;
  CGFloat v64 = CGRectGetHeight(v91) + -32.0;
  v92.origin.x = v57;
  v92.origin.CGFloat y = v59;
  v92.size.width = v61;
  v92.size.height = v63;
  CGFloat v65 = v64 - CGRectGetHeight(v92);
  v93.origin.x = v72;
  v93.origin.CGFloat y = v71;
  v93.size.width = v70;
  v93.size.height = v73;
  CGFloat v66 = CGRectGetWidth(v93) * 0.5;
  v94.origin.x = v57;
  v94.origin.CGFloat y = v65;
  v94.size.width = v61;
  v94.size.height = v63;
  [v18 setFrame:CGRectMake(v66 - CGRectGetWidth(v94) * 0.5, v65, v61, v63)];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = [a3 actions];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v12 = +[STKSessionAction _sessionActionFromBSAction:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          sessionAction = self->_sessionAction;
          self->_sessionAction = v12;

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v14 = self->_sessionAction;
    *(_DWORD *)buf = 138412290;
    CGFloat v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionAction = %@", buf, 0xCu);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)learnMoreButtonClicked:(id)a3
{
  double v5 = [[STKClass0SMSAboutViewController alloc] initWithNibName:0 bundle:0];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [(STKClass0SMSViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dismiss
{
  [(STKClass0SMSSessionAction *)self->_sessionAction sendResponse:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009048;
  v4[3] = &unk_100018438;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009090;
  v3[3] = &unk_100018460;
  v3[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 completion:0.3];
}

- (void)setMessageString:(id)a3
{
  id v4 = a3;
  double v5 = [(STKClass0SMSViewController *)self sessionAction];
  double v6 = [v5 sessionData];

  double v7 = [v6 address];
  if ([v7 length] && objc_msgSend(v6, "showsFromAddress"))
  {
    id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    id v9 = [v8 localizedStringForKey:@"CLASS_0_ALERT_MESSAGE_FROM" value:&stru_100018540 table:@"SIMToolkitUI"];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);

    v15[0] = v10;
    v15[1] = v4;
    double v11 = +[NSArray arrayWithObjects:v15 count:2];
    uint64_t v12 = [v11 componentsJoinedByString:@"\n"];

    id v4 = (id)v12;
  }
  double v13 = [(STKClass0SMSViewController *)self messageTextLabel];
  [v13 setText:v4];

  CGFloat v14 = [(STKClass0SMSViewController *)self view];
  [v14 setNeedsLayout];
}

- (id)contentContainerView
{
  contentContainerView = self->_contentContainerView;
  if (!contentContainerView)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_contentContainerView;
    self->_contentContainerView = v4;

    double v6 = self->_contentContainerView;
    double v7 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v7];

    id v8 = [(STKClass0SMSViewController *)self view];
    [v8 addSubview:self->_contentContainerView];

    contentContainerView = self->_contentContainerView;
  }

  return contentContainerView;
}

- (id)messageTitleLabel
{
  messageTitleLabel = self->_messageTitleLabel;
  if (!messageTitleLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_messageTitleLabel;
    self->_messageTitleLabel = v4;

    double v6 = self->_messageTitleLabel;
    double v7 = +[UIFont boldSystemFontOfSize:17.0];
    [(UILabel *)v6 setFont:v7];

    id v8 = self->_messageTitleLabel;
    id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    uint64_t v10 = [v9 localizedStringForKey:@"CLASS0SMS_ALERT_TITLE" value:&stru_100018540 table:@"SIMToolkitUI"];
    [(UILabel *)v8 setText:v10];

    double v11 = self->_messageTitleLabel;
    uint64_t v12 = +[UIColor whiteColor];
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)self->_messageTitleLabel sizeToFit];
    double v13 = [(STKClass0SMSViewController *)self contentContainerView];
    [v13 addSubview:self->_messageTitleLabel];

    messageTitleLabel = self->_messageTitleLabel;
  }

  return messageTitleLabel;
}

- (id)messageTextLabel
{
  messageTextLabel = self->_messageTextLabel;
  if (!messageTextLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_messageTextLabel;
    self->_messageTextLabel = v4;

    [(UILabel *)self->_messageTextLabel setTextAlignment:1];
    double v6 = self->_messageTextLabel;
    double v7 = +[UIFont systemFontOfSize:15.0];
    [(UILabel *)v6 setFont:v7];

    id v8 = self->_messageTextLabel;
    id v9 = +[UIColor whiteColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)self->_messageTextLabel setLineBreakMode:0];
    [(UILabel *)self->_messageTextLabel setNumberOfLines:0];
    uint64_t v10 = [(STKClass0SMSViewController *)self contentContainerView];
    [v10 addSubview:self->_messageTextLabel];

    messageTextLabel = self->_messageTextLabel;
  }

  return messageTextLabel;
}

- (id)dismissButton
{
  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    id v4 = +[UIButton buttonWithType:1];
    double v5 = self->_dismissButton;
    self->_dismissButton = v4;

    double v6 = self->_dismissButton;
    double v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    id v8 = [v7 localizedStringForKey:@"CLASS0SMS_DISMISS" value:&stru_100018540 table:@"SIMToolkitUI"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    id v9 = [(UIButton *)self->_dismissButton titleLabel];
    uint64_t v10 = +[UIFont boldSystemFontOfSize:17.0];
    [v9 setFont:v10];

    double v11 = [(UIButton *)self->_dismissButton titleLabel];
    [v11 sizeToFit];

    uint64_t v12 = self->_dismissButton;
    double v13 = +[UIColor whiteColor];
    [(UIButton *)v12 setTitleColor:v13 forState:0];

    [(UIButton *)self->_dismissButton addTarget:self action:"dismissButtonClicked:" forControlEvents:64];
    CGFloat v14 = [(STKClass0SMSViewController *)self contentContainerView];
    [v14 addSubview:self->_dismissButton];

    long long v15 = +[CALayer layer];
    lineLayer = self->_lineLayer;
    self->_lineLayer = v15;

    long long v17 = self->_lineLayer;
    id v18 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v17, "setBackgroundColor:", [v18 CGColor]);

    LODWORD(v19) = 1036831949;
    [(CALayer *)self->_lineLayer setOpacity:v19];
    CGFloat v20 = [(UIButton *)self->_dismissButton layer];
    [v20 addSublayer:self->_lineLayer];

    dismissButton = self->_dismissButton;
  }

  return dismissButton;
}

- (id)learnMoreButton
{
  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    id v4 = +[UIButton buttonWithType:1];
    double v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    double v6 = self->_learnMoreButton;
    double v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    id v8 = [v7 localizedStringForKey:@"CLASS0SMS_ALERT_LEARN_MORE_TITLE" value:&stru_100018540 table:@"SIMToolkitUI"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    [(UIButton *)self->_learnMoreButton addTarget:self action:"learnMoreButtonClicked:" forControlEvents:64];
    id v9 = self->_learnMoreButton;
    uint64_t v10 = +[UIColor whiteColor];
    [(UIButton *)v9 setTitleColor:v10 forState:0];

    double v11 = [(STKClass0SMSViewController *)self alertContainerView];
    uint64_t v12 = [v11 contentView];
    [v12 addSubview:self->_learnMoreButton];

    learnMoreButton = self->_learnMoreButton;
  }

  return learnMoreButton;
}

- (id)darkBlurView
{
  darkBlurView = self->_darkBlurView;
  if (!darkBlurView)
  {
    id v4 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    double v5 = self->_darkBlurView;
    self->_darkBlurView = v4;

    double v6 = +[UIBlurEffect effectWithStyle:2];
    [(UIVisualEffectView *)self->_darkBlurView setEffect:v6];
    double v7 = [(STKClass0SMSViewController *)self view];
    [v7 insertSubview:self->_darkBlurView atIndex:0];

    darkBlurView = self->_darkBlurView;
  }

  return darkBlurView;
}

- (id)alertContainerView
{
  alertContainerView = self->_alertContainerView;
  if (!alertContainerView)
  {
    id v4 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    double v5 = self->_alertContainerView;
    self->_alertContainerView = v4;

    double v6 = +[UIBlurEffect effectWithStyle:2];
    double v7 = +[UIVibrancyEffect effectForBlurEffect:v6];

    [(UIVisualEffectView *)self->_alertContainerView setEffect:v7];
    id v8 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];

    uint64_t v10 = [(UIVisualEffectView *)self->_alertContainerView contentView];
    [v10 addSubview:v8];

    double v11 = [(STKClass0SMSViewController *)self view];
    [v11 insertSubview:self->_alertContainerView atIndex:0];

    uint64_t v12 = [(STKClass0SMSViewController *)self view];
    [v12 setNeedsLayout];

    alertContainerView = self->_alertContainerView;
  }

  return alertContainerView;
}

- (id)blurEffectContainerView
{
  blurEffectContainerView = self->_blurEffectContainerView;
  if (!blurEffectContainerView)
  {
    id v4 = [objc_alloc((Class)UIVisualEffectView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_blurEffectContainerView;
    self->_blurEffectContainerView = v4;

    double v6 = +[UIBlurEffect effectWithStyle:1];
    [(UIVisualEffectView *)self->_blurEffectContainerView setEffect:v6];
    [(UIVisualEffectView *)self->_blurEffectContainerView setAlpha:0.6];
    double v7 = [(UIVisualEffectView *)self->_blurEffectContainerView layer];
    [v7 setCornerRadius:13.0];

    [(UIVisualEffectView *)self->_blurEffectContainerView setClipsToBounds:1];
    id v8 = [(STKClass0SMSViewController *)self view];
    [v8 addSubview:self->_blurEffectContainerView];

    blurEffectContainerView = self->_blurEffectContainerView;
  }

  return blurEffectContainerView;
}

- (STKClass0SMSSessionAction)sessionAction
{
  return self->_sessionAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAction, 0);
  objc_storeStrong((id *)&self->_lineLayer, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageTitleLabel, 0);
  objc_storeStrong((id *)&self->_messageTextLabel, 0);
  objc_storeStrong((id *)&self->_darkBlurView, 0);
  objc_storeStrong((id *)&self->_blurEffectContainerView, 0);
  objc_storeStrong((id *)&self->_alertContainerView, 0);

  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end