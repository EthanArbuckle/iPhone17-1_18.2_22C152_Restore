@interface STKBaseAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)wantsTextView;
- (BOOL)_canShowWhileLocked;
- (BOOL)validateAction:(id)a3;
- (STKSessionAction)sessionAction;
- (UIView)bottomBar;
- (UIView)topBar;
- (id)newBottomBar;
- (id)newTopBar;
- (unint64_t)supportedInterfaceOrientations;
- (void)_displayDidTimeout;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_restartTimeoutTimer:(float)a3;
- (void)clearTimeoutTimer;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)setTextViewText:(id)a3;
- (void)startTimeoutTimerIfNecessary;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STKBaseAlertViewController

- (void)dealloc
{
  [(STKSessionAction *)self->_sessionAction invalidate];
  [(STKBaseAlertViewController *)self clearTimeoutTimer];
  v3.receiver = self;
  v3.super_class = (Class)STKBaseAlertViewController;
  [(STKBaseAlertViewController *)&v3 dealloc];
}

- (void)startTimeoutTimerIfNecessary
{
  objc_super v3 = [(STKSessionAction *)self->_sessionAction behavior];
  [v3 timeout];
  double v5 = v4;

  HIDWORD(v6) = 1065646817;
  if (v5 <= 0.01)
  {
    [(STKBaseAlertViewController *)self clearTimeoutTimer];
  }
  else
  {
    *(float *)&double v6 = v5;
    [(STKBaseAlertViewController *)self _restartTimeoutTimer:v6];
  }
}

- (void)clearTimeoutTimer
{
  [(NSTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;
}

- (void)dismiss
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007890;
  v3[3] = &unk_100018438;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000078D8;
  v2[3] = &unk_100018460;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.3];
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
  v73.receiver = self;
  v73.super_class = (Class)STKBaseAlertViewController;
  [(STKBaseAlertViewController *)&v73 viewDidLoad];
  unint64_t v3 = [(STKBaseAlertViewController *)self view];
  double v4 = +[UIColor colorWithRed:0.0431372549 green:0.0431372549 blue:0.0431372549 alpha:0.9];
  [v3 setBackgroundColor:v4];

  double v5 = [(STKBaseAlertViewController *)self newTopBar];
  topBar = self->_topBar;
  self->_topBar = v5;

  [(UIView *)self->_topBar setTranslatesAutoresizingMaskIntoConstraints:0];
  v72 = v3;
  if (self->_topBar)
  {
    [v3 addSubview:];
    v67 = [(UIView *)self->_topBar topAnchor];
    v70 = [v3 safeAreaLayoutGuide];
    v64 = [v70 topAnchor];
    v7 = [v67 constraintEqualToAnchor:v64];
    v76[0] = v7;
    v8 = [(UIView *)self->_topBar widthAnchor];
    v9 = [v3 widthAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v76[1] = v10;
    v11 = [(UIView *)self->_topBar centerXAnchor];
    v12 = [v72 centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v76[2] = v13;
    v14 = +[NSArray arrayWithObjects:v76 count:3];
    +[NSLayoutConstraint activateConstraints:v14];

    unint64_t v3 = v72;
  }
  v15 = [(STKBaseAlertViewController *)self newBottomBar];
  bottomBar = self->_bottomBar;
  self->_bottomBar = v15;

  [(UIView *)self->_bottomBar setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_bottomBar)
  {
    [v3 addSubview:];
    v17 = [(UIView *)self->_bottomBar bottomAnchor];
    v18 = [v3 safeAreaLayoutGuide];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    bottomBarBottomConstraint = self->_bottomBarBottomConstraint;
    self->_bottomBarBottomConstraint = v20;

    v75[0] = self->_bottomBarBottomConstraint;
    v68 = [(UIView *)self->_bottomBar widthAnchor];
    v65 = [v3 widthAnchor];
    v22 = [v68 constraintEqualToAnchor:v65];
    v75[1] = v22;
    v23 = [(UIView *)self->_bottomBar centerXAnchor];
    v24 = [v3 centerXAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v75[2] = v25;
    v26 = [(UIView *)self->_bottomBar heightAnchor];
    [(UIView *)self->_bottomBar bounds];
    v28 = [v26 constraintEqualToConstant:v27];
    v75[3] = v28;
    v29 = +[NSArray arrayWithObjects:v75 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    unint64_t v3 = v72;
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:self selector:"_keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];
  }
  if ([(id)objc_opt_class() wantsTextView])
  {
    v31 = (UITextView *)objc_alloc_init((Class)UITextView);
    textView = self->_textView;
    self->_textView = v31;

    [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = self->_textView;
    v34 = +[UIFont systemFontOfSize:18.0];
    [(UITextView *)v33 setFont:v34];

    v35 = self->_textView;
    v36 = +[UIColor whiteColor];
    [(UITextView *)v35 setTextColor:v36];

    v37 = self->_textView;
    v38 = +[UIColor clearColor];
    [(UITextView *)v37 setBackgroundColor:v38];

    [(UITextView *)self->_textView setTextAlignment:1];
    [(UITextView *)self->_textView setEditable:0];
    v39 = [(UITextView *)self->_textView centerYAnchor];
    v40 = [v3 centerYAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    textViewCenterYConstraint = self->_textViewCenterYConstraint;
    self->_textViewCenterYConstraint = v41;

    LODWORD(v43) = 1144766464;
    [(NSLayoutConstraint *)self->_textViewCenterYConstraint setPriority:v43];
    v44 = self->_bottomBar;
    if (v44)
    {
      uint64_t v45 = [(UIView *)v44 topAnchor];
    }
    else
    {
      v46 = [v3 safeAreaLayoutGuide];
      uint64_t v45 = [v46 bottomAnchor];
    }
    v47 = self->_topBar;
    if (v47)
    {
      uint64_t v48 = [(UIView *)v47 bottomAnchor];
    }
    else
    {
      v49 = [v3 safeAreaLayoutGuide];
      uint64_t v48 = [v49 topAnchor];
    }
    v61 = (void *)v48;
    [v3 addSubview:self->_textView];
    v71 = [(UITextView *)self->_textView leadingAnchor];
    v69 = [v3 leadingAnchor];
    v66 = [v71 constraintEqualToAnchor:v69 constant:30.0];
    v74[0] = v66;
    v63 = [(UITextView *)self->_textView trailingAnchor];
    v62 = [v3 trailingAnchor];
    v50 = [v63 constraintEqualToAnchor:v62 constant:-30.0];
    v74[1] = v50;
    v51 = [(UITextView *)self->_textView topAnchor];
    v52 = [v51 constraintEqualToAnchor:v48 constant:30.0];
    v74[2] = v52;
    v53 = [(UITextView *)self->_textView bottomAnchor];
    [v53 constraintEqualToAnchor:v45 constant:-30.0];
    v54 = v60 = (void *)v45;
    v74[3] = v54;
    v55 = [(UITextView *)self->_textView centerXAnchor];
    v56 = [v3 centerXAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v58 = self->_textViewCenterYConstraint;
    v74[4] = v57;
    v74[5] = v58;
    v59 = +[NSArray arrayWithObjects:v74 count:6];
    +[NSLayoutConstraint activateConstraints:v59];

    unint64_t v3 = v72;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STKBaseAlertViewController;
  [(STKBaseAlertViewController *)&v4 viewWillDisappear:a3];
  [(STKBaseAlertViewController *)self clearTimeoutTimer];
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
  v7 = [a3 actions];
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
        uint64_t v12 = +[STKSessionAction _sessionActionFromBSAction:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v12)
        {
          v13 = (void *)v12;
          if ([(STKBaseAlertViewController *)self validateAction:v12]) {
            objc_storeStrong((id *)&self->_sessionAction, v13);
          }

          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    sessionAction = self->_sessionAction;
    *(_DWORD *)buf = 138412290;
    v20 = sessionAction;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionAction = %@", buf, 0xCu);
  }
  if (v6) {
    v6[2](v6);
  }
}

+ (BOOL)wantsTextView
{
  return 0;
}

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)newTopBar
{
  return 0;
}

- (id)newBottomBar
{
  return 0;
}

- (void)setTextViewText:(id)a3
{
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  objc_super v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  double MinY = CGRectGetMinY(v20);
  long long v15 = [(STKBaseAlertViewController *)self view];
  [v15 bounds];
  double MaxY = CGRectGetMaxY(v21);

  double v17 = MaxY - MinY;
  [(NSLayoutConstraint *)self->_bottomBarBottomConstraint setConstant:-v17];
  textViewCenterYConstraint = self->_textViewCenterYConstraint;

  [(NSLayoutConstraint *)textViewCenterYConstraint setConstant:v17 * -0.5];
}

- (void)_restartTimeoutTimer:(float)a3
{
  [(STKBaseAlertViewController *)self clearTimeoutTimer];
  self->_timeoutTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_displayDidTimeout" selector:0 userInfo:0 repeats:a3];

  _objc_release_x1();
}

- (void)_displayDidTimeout
{
  [(STKSessionAction *)self->_sessionAction sendResponse:2];

  [(STKBaseAlertViewController *)self dismiss];
}

- (UIView)bottomBar
{
  return self->_bottomBar;
}

- (UIView)topBar
{
  return self->_topBar;
}

- (STKSessionAction)sessionAction
{
  return self->_sessionAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_bottomBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_sessionAction, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end