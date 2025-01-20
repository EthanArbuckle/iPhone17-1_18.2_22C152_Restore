@interface BroadwayActivationStartViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BroadwayActivationStartViewController)initWithCoder:(id)a3;
- (void)animationDidComplete;
- (void)animationDidStart;
- (void)handleActivateButton:(id)a3;
- (void)handleCompletedIfReady;
- (void)handleDismissButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)prepareForRetry;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BroadwayActivationStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activateButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardViewHeight + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cardViewWidth + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)animationDidComplete
{
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BYTE1(self->_activationResult) = 1;

  [(BroadwayActivationStartViewController *)self handleCompletedIfReady];
}

- (void)animationDidStart
{
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handleCompletedIfReady
{
  if (!BYTE2(self->_activationResult))
  {
    if (*(void *)(&self->_activationStarted + 1) == 999 || !BYTE1(self->_activationResult))
    {
      if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      BYTE2(self->_activationResult) = 1;
      id mainController = self->super._mainController;
      uint64_t v4 = *(void *)(&self->_activationStarted + 1);
      _[mainController showCompletedUI:v4];
    }
  }
}

- (void)handleActivateButton:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_activationCode))
  {
    if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BYTE1(self->_activationCode) = 1;
    [*(id *)((char *)&self->_dismissButton + 1) setHidden:1];
    [*(id *)((char *)&self->_activateButton + 1) setHidden:0];
    [*(id *)((char *)&self->_activityLabel + 1) startAnimating];
    v5 = [(SVSBaseViewController *)self containerView];
    [v5 setSwipeDismissible:0];

    if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(uint64_t *)((char *)&self->_activityIndicatorView + 1);
      LogPrintF();
    }
    if (objc_msgSend(self->super._mainController, "test", v9)
      && [self->super._mainController forcedActivationResult] != (id)999)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100131ED0;
      handler[3] = &unk_1001A1B88;
      dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v13 = self;
      v6 = v12;
      dispatch_source_set_event_handler(v6, handler);
      SFDispatchTimerSet();
      dispatch_resume(v6);
    }
    else
    {
      v6 = [(objc_class *)off_1001CCCC8() sharedInstance];
      v7 = [self->super._mainController physicalCard];
      uint64_t v8 = *(uint64_t *)((char *)&self->_activityIndicatorView + 1);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100131F30;
      v10[3] = &unk_1001A16D8;
      v10[4] = self;
      [v6 activatePhysicalCard:v7 withActivationCode:v8 forFeatureIdentifier:2 completion:v10];
    }
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->_activationCode)) {
    return 0;
  }
  id v6 = a3;
  v7 = [a4 view];
  uint64_t v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)BroadwayActivationStartViewController;
  [(BroadwayActivationStartViewController *)&v6 viewDidDisappear:v3];
  [*(id *)((char *)&self->_cardViewHeight + 1) removeAnimationObserver:self];
  v5 = *(NSLayoutConstraint **)((char *)&self->_cardViewHeight + 1);
  *(NSLayoutConstraint **)((char *)&self->_cardViewHeight + 1) = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BroadwayActivationStartViewController;
  [(SVSBaseViewController *)&v14 viewDidAppear:a3];
  if (BYTE1(self->_activationResult))
  {
    [(BroadwayActivationStartViewController *)self handleActivateButton:0];
  }
  else
  {
    BOOL v4 = [self->super._mainController physicalCard];
    v5 = [v4 nameOnCard];
    id v6 = [v5 length];

    if (v6)
    {
      v7 = [self->super._mainController physicalCard];
      uint64_t v8 = [v7 nameOnCard];
      uint64_t v9 = v8;
      if (v8)
      {
        v10 = sub_100132554(v8);
      }
      else
      {
        v11 = objc_opt_new();
        v10 = sub_100132554(v11);
      }
      [*(id *)((char *)&self->_cardViewHeight + 1) setModelContents:v10];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10013275C;
    v13[3] = &unk_1001A1BD8;
    v13[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001327B8;
    v12[3] = &unk_1001A1898;
    v12[4] = self;
    +[UIView animateWithDuration:65538 delay:v13 options:v12 animations:1.5 completion:0.7];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v24.receiver = self;
  v24.super_class = (Class)BroadwayActivationStartViewController;
  [(SVSBaseViewController *)&v24 viewWillAppear:v3];
  if (!BYTE1(self->_activationResult))
  {
    v5 = [self->super._mainController _remoteViewControllerProxy];
    [v5 setStatusBarHidden:1 withDuration:0.0];

    id v6 = [self->super._mainController userInfo];
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1);
    *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1) = v7;

    id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
    [v9 setDelegate:self];
    [v9 setNumberOfTapsRequired:1];
    [v9 setCancelsTouchesInView:0];
    v10 = [(BroadwayActivationStartViewController *)self view];
    [v10 addGestureRecognizer:v9];

    v11 = [(SVSBaseViewController *)self containerView];
    [v11 setSwipeDismissible:1];

    dispatch_source_t v12 = SFFontForTextStyleWithAdditionalSymbolicTraits();
    [*(id *)((char *)&self->_cardView + 1) setFont:v12];

    [*(id *)((char *)&self->_cardView + 1) setAdjustsFontForContentSizeCategory:0];
    v13 = SFFontForTextStyleWithAdditionalSymbolicTraits();
    objc_super v14 = [*(id *)((char *)&self->_dismissButton + 1) titleLabel];
    [v14 setFont:v13];

    v15 = [*(id *)((char *)&self->_dismissButton + 1) titleLabel];
    [v15 setAdjustsFontForContentSizeCategory:0];

    v16 = +[UIColor systemExtraLightGrayColor];
    [*(id *)((char *)&self->_dismissButton + 1) setBackgroundColor:v16];

    v17 = SFFontForTextStyleWithAdditionalSymbolicTraits();
    [*(id *)((char *)&self->_progressView + 1) setFont:v17];

    [*(id *)((char *)&self->_progressView + 1) setAdjustsFontForContentSizeCategory:0];
    [*(id *)((char *)&self->_cardView + 1) setAlpha:0.0];
    [*(id *)((char *)&self->_dismissButton + 1) setAlpha:0.0];
    v18 = +[NSBundle mainBundle];
    v19 = [v18 URLForResource:@"Broadway" withExtension:@"mov"];

    v20 = +[NSBundle mainBundle];
    v21 = [v20 URLForResource:@"Broadway" withExtension:@"scnz"];

    [*(id *)((char *)&self->_cardViewHeight + 1) addAnimationObserver:self];
    if (SFDeviceModelCodeGet() == 1) {
      [*(id *)((char *)&self->_cardViewHeight + 1) _setContinuousCornerRadius:34.0];
    }
    [*(id *)((char *)&self->_cardViewHeight + 1) setVideoURL:v19 sceneURL:v21];
    [(SVSCardContainerView *)self->super._containerView frame];
    CGRectGetWidth(v25);
    [*(id *)((char *)&self->_cardViewHeight + 1) videoSizePoints];
    [(SVSCardContainerView *)self->super._containerView frame];
    CGRectGetHeight(v26);
    [*(id *)((char *)&self->_cardViewHeight + 1) videoSizePoints];
    [*(id *)((char *)&self->_cardViewHeight + 1) videoSizePoints];
    [*(id *)((char *)&self->_cardViewHeight + 1) videoSizePoints];
    UISizeRoundToViewScale();
    double v23 = v22;
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setConstant:];
    [*(id *)((char *)&self->_cardViewWidth + 1) setConstant:v23];
    [*(id *)((char *)&self->_cardViewHeight + 1) setPaused:0];
    if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)prepareForRetry
{
  BYTE1(self->_activationCode) = 0;
  *(void *)(&self->_activationStarted + 1) = 999;
  BYTE2(self->_activationResult) = 0;
}

- (BroadwayActivationStartViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationStartViewController;
  result = [(BroadwayActivationStartViewController *)&v4 initWithCoder:a3];
  if (result) {
    *(void *)(&result->_activationStarted + 1) = 999;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end