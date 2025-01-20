@interface FaceIdViewController
- (BOOL)dismissingTemporarily;
- (BOOL)isSuspended;
- (BOOL)isUiReady;
- (BOOL)processHomeButtonPressed;
- (FaceIdAlertViewController)alertController;
- (FaceIdToastViewController)toastController;
- (LAUIPearlGlyphView)glyphView;
- (ScreenDimmingView)dimmingView;
- (id)_coachingTextForFeedback:(int64_t)a3;
- (id)_createGlyphViewForRetryUI:(BOOL)a3;
- (int64_t)pearlUIState;
- (void)_destroyViewControllers;
- (void)_dismissAlertWithDelay:(double)a3 temporarily:(BOOL)a4 completion:(id)a5;
- (void)_dismissCoachingViews;
- (void)_dismissToastWithDelay:(double)a3 completion:(id)a4;
- (void)_handleBioLockout:(id)a3;
- (void)_handleMatch;
- (void)_handleNoMatchOrSensorInactive:(id)a3;
- (void)_handleSensorActive;
- (void)_handleToastPresented;
- (void)_hideGlyphWithSpecialUi:(BOOL)a3;
- (void)_presentAlertAnimated:(BOOL)a3 specialUi:(BOOL)a4;
- (void)_presentToast;
- (void)_processCoachingFeedback:(int64_t)a3;
- (void)_setActionButtons;
- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setGlyphToNoMatchWithSpecialUi:(BOOL)a3;
- (void)_setupToastWithGlyph:(id)a3;
- (void)_shake:(BOOL)a3;
- (void)_showFailAlert;
- (void)_uiCancelWithUnderlyingError;
- (void)_updatePearlViews;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)setAlertController:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setDismissingTemporarily:(BOOL)a3;
- (void)setGlyphView:(id)a3;
- (void)setPearlUIState:(int64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setToastController:(id)a3;
- (void)uiCancelByGestureIfPossible;
- (void)uiEvent:(int64_t)a3 options:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FaceIdViewController

- (void)loadView
{
  v3 = LACLogFaceIDUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v45 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "loadView on %{public}@", buf, 0xCu);
  }

  v4 = (UIView *)objc_opt_new();
  rootView = self->_rootView;
  self->_rootView = v4;

  [(FaceIdViewController *)self setView:self->_rootView];
  v6 = (ScreenDimmingView *)objc_opt_new();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v6;

  v8 = +[UIDevice currentDevice];
  unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(ScreenDimmingView *)self->_dimmingView setDimEnabled:1];
  }
  [(UIView *)self->_rootView addSubview:self->_dimmingView];
  self->_pearlUIState = 0;
  self->_fallbackVisible = 1;
  self->_showFallback = 0;
  self->_coachingFeedback = 1;
  v10 = [(TransitionViewController *)self options];
  v11 = [v10 objectForKeyedSubscript:&off_10008A180];

  if (v11)
  {
    id v43 = 0;
    v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v43];
    id v13 = v43;
    tintColor = self->_tintColor;
    self->_tintColor = v12;

    if (!self->_tintColor)
    {
      v15 = LACLogFaceIDUI();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100060D2C((uint64_t)v13, v15);
      }
    }
  }
  v16 = [(FaceIdViewController *)self _createGlyphViewForRetryUI:0];
  glyphView = self->_glyphView;
  self->_glyphView = v16;

  [(FaceIdViewController *)self _setupToastWithGlyph:self->_glyphView];
  v18 = [(TransitionViewController *)self internalInfo];
  v19 = [v18 objectForKeyedSubscript:@"FaceIdWithButton"];

  if ([v19 intValue] != 2)
  {
    id v20 = objc_alloc((Class)LAUIPhysicalButtonView);
    v21 = +[UIDevice currentDevice];
    unint64_t v22 = (unint64_t)[v21 userInterfaceIdiom];

    v23 = (LAUIPhysicalButtonView *)[v20 initWithStyle:(v22 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v23;

    v25 = [(TransitionViewController *)self options];
    v26 = [v25 objectForKeyedSubscript:&off_10008A198];
    if (v26)
    {
      [(LAUIPhysicalButtonView *)self->_physicalButtonView setInstruction:v26];
    }
    else
    {
      v27 = +[NSBundle bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"PEARL_DOUBLECLICK_TO_CONTINUE" value:&stru_100088CF0 table:@"MobileUI"];
      [(LAUIPhysicalButtonView *)self->_physicalButtonView setInstruction:v28];
    }
    [(LAUIPhysicalButtonView *)self->_physicalButtonView setAnimating:1];
    -[LAUIPhysicalButtonView setHidden:](self->_physicalButtonView, "setHidden:", [v19 intValue] == 0);
    [(ScreenDimmingView *)self->_dimmingView addSubview:self->_physicalButtonView];
    [(ScreenDimmingView *)self->_dimmingView bringSubviewToFront:self->_physicalButtonView];
  }
  v29 = +[UIDevice currentDevice];
  unint64_t v30 = (unint64_t)[v29 userInterfaceIdiom];

  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v31 = +[UIScreen mainScreen];
    [v31 bounds];
    double v33 = v32;

    v34 = (LAUIHorizontalArrowView *)objc_opt_new();
    horizontalArrowView = self->_horizontalArrowView;
    self->_horizontalArrowView = v34;

    [(LAUIHorizontalArrowView *)self->_horizontalArrowView sizeToFit];
    [(LAUIHorizontalArrowView *)self->_horizontalArrowView frame];
    [(LAUIHorizontalArrowView *)self->_horizontalArrowView setDisplacement:v33 * 0.5 - v36];
    v37 = [(FaceIdViewController *)self traitCollection];
    if ([v37 userInterfaceStyle] == (id)1)
    {
      v38 = [(FaceIdViewController *)self toastController];
      id v39 = [v38 lightweightUIMode];
      id v40 = (id)LACLightweightUIModeOverShield;

      if (v39 != v40)
      {
LABEL_21:
        v41 = [(FaceIdViewController *)self view];
        [v41 addSubview:self->_horizontalArrowView];

        v42 = [(FaceIdViewController *)self view];
        [v42 bringSubviewToFront:self->_horizontalArrowView];

        goto LABEL_22;
      }
      v37 = +[UIColor darkGrayColor];
      [(LAUIHorizontalArrowView *)self->_horizontalArrowView setTintColor:v37];
    }

    goto LABEL_21;
  }
LABEL_22:
  [(FaceIdViewController *)self _updatePearlViews];
}

- (id)_createGlyphViewForRetryUI:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_10001E3DC();
  v6 = [(TransitionViewController *)self options];
  uint64_t v7 = LACLightweightUIModeFromOptions();

  if (v5 && v7)
  {
    id v8 = 0;
  }
  else
  {
    if (v5)
    {
      id v9 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration];
      uint64_t v10 = 4;
    }
    else
    {
      id v9 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration];
      uint64_t v10 = 1;
    }
    if (v7) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v10;
    }
    if (!v7) {
      BOOL v3 = 1;
    }
    [v9 setInitialStyle:v11];
    [v9 setSecureVariantEnabled:1];
    [v9 setSecureVariantType:!v3];
    id v12 = [objc_alloc((Class)LAUIPearlGlyphView) initWithConfiguration:v9];
    id v13 = LACLogFaceIDUI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "glyph created: %@", (uint8_t *)&v21, 0xCu);
    }

    if ((sub_10001E3DC() & 1) == 0 && v7)
    {
      v14 = +[UIColor systemBlueColor];
      [v12 setIdleColor:v14 animated:0];
    }
    if (sub_10001E3DC())
    {
      v15 = [(TransitionViewController *)self options];
      v16 = [v15 objectForKeyedSubscript:&off_10008A1B0];
      v17 = [v16 objectForKeyedSubscript:&off_10008A1C8];
      v18 = [v17 objectForKeyedSubscript:&off_10008A1E0];
      id v19 = [v18 integerValue];

      if (v19 == (id)2) {
        [v12 setFaceVisibility:7 animated:0];
      }
    }
    id v8 = v12;
  }

  return v8;
}

- (void)_setupToastWithGlyph:(id)a3
{
  id v4 = a3;
  int v5 = [FaceIdToastViewController alloc];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v10 localizedStringForKey:@"PEARL" value:&stru_100088CF0 table:@"MobileUI"];
  uint64_t v7 = [(TransitionViewController *)self options];
  id v8 = [(FaceIdToastViewController *)v5 initWithGlyph:v4 presentingController:self title:v6 lightweightUIMode:LACLightweightUIModeFromOptions()];

  toastController = self->_toastController;
  self->_toastController = v8;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FaceIdViewController;
  [(FaceIdViewController *)&v3 viewWillLayoutSubviews];
  [(FaceIdViewController *)self _updatePearlViews];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FaceIdViewController;
  [(TransitionViewController *)&v9 viewDidAppear:a3];
  self->_animationStart = 0.0;
  if (self->_silentFallback)
  {
    id v4 = +[LAErrorHelper silentInternalErrorWithMessage:@"Silent UI fallback"];
    [(TransitionViewController *)self uiFailureWithError:v4];
LABEL_3:

    return;
  }
  if (!self->_hwIssueEvent)
  {
    v6 = [(TransitionViewController *)self internalInfo];
    id v4 = [v6 objectForKeyedSubscript:@"FaceIdWithButton"];

    if ([v4 intValue] == 2)
    {
      uint64_t v7 = LACLogFaceIDUI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend to wait for a double press", buf, 0xCu);
      }

      [(FaceIdViewController *)self setSuspended:1];
    }
    else
    {
      if ([(FaceIdToastViewController *)self->_toastController lightweightUI])
      {
        id v8 = LACLogFaceIDUI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v11 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend because of lightweight UI", buf, 0xCu);
        }

        [(FaceIdViewController *)self setSuspended:1];
      }
      [(FaceIdViewController *)self _presentToast];
    }
    goto LABEL_3;
  }
  int v5 = LACLogFaceIDUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is showing HW event UI", buf, 0xCu);
  }

  [(FaceIdViewController *)self _showFailAlert];
}

- (void)_presentToast
{
  if (self->_toastController)
  {
    if (([(FaceIdViewController *)self isBeingDismissed] & 1) != 0 || self->_dismissed)
    {
      objc_super v3 = LACLogFaceIDUI();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_dismissed) {
          CFStringRef v4 = @"dismissed";
        }
        else {
          CFStringRef v4 = @"being dismissed";
        }
        *(_DWORD *)buf = 138543618;
        id v12 = self;
        __int16 v13 = 2114;
        CFStringRef v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will not present Face ID glyph because %{public}@ is %{public}@", buf, 0x16u);
      }
    }
    else
    {
      int v5 = +[TransitionViewController rootController];
      unsigned int v6 = [v5 disappeared];

      if (v6)
      {
        uint64_t v7 = LACLogFaceIDUI();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will not present Face ID glyph because root controller has disappeared.", buf, 2u);
        }
      }
      else
      {
        if (self->_toastWasUsedForJindoPresentation)
        {
          [(FaceIdToastViewController *)self->_toastController dismissWithDelay:&stru_1000860B0 completion:0.0];
          [(FaceIdViewController *)self _setupToastWithGlyph:self->_glyphView];
        }
        if (sub_10001E3DC()) {
          self->_toastWasUsedForJindoPresentation = 1;
        }
        objc_initWeak((id *)buf, self);
        toastController = self->_toastController;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100008C1C;
        v9[3] = &unk_1000860D8;
        objc_copyWeak(&v10, (id *)buf);
        [(PresentationViewController *)toastController presentOnParentViewController:self animated:0 completionHandler:v9];
        objc_destroyWeak(&v10);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

- (void)_handleToastPresented
{
  if (!self->_toastWasUsedForJindoPresentation)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008D78;
    v7[3] = &unk_1000860D8;
    objc_copyWeak(&v8, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
  {
    if (([(LAUIPhysicalButtonView *)physicalButtonView isHidden] & 1) == 0)
    {
      UIAccessibilityNotifications v5 = UIAccessibilityAnnouncementNotification;
      unsigned int v6 = [(LAUIPhysicalButtonView *)self->_physicalButtonView instruction];
      UIAccessibilityPostNotification(v5, v6);
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FaceIdViewController;
  [(FaceIdViewController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  tintColor = self->_tintColor;
  unsigned int v6 = [(FaceIdViewController *)self view];
  uint64_t v7 = [v6 window];
  [v7 setTintColor:tintColor];
}

- (void)uiCancelByGestureIfPossible
{
  dispatch_time_t v3 = LACLogFaceIDUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t pearlUIState = self->_pearlUIState;
    int v7 = 138543618;
    objc_super v8 = self;
    __int16 v9 = 1024;
    int v10 = pearlUIState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requested cancel while in state:%d", (uint8_t *)&v7, 0x12u);
  }

  if (sub_10001E3DC()) {
    goto LABEL_11;
  }
  if (self->_coachingFeedback == 1)
  {
    int64_t v5 = self->_pearlUIState;
    if (v5 == 3 || v5 == 0)
    {
      [(ScreenDimmingView *)self->_dimmingView setDimEnabled:0];
LABEL_11:
      if (![(FaceIdViewController *)self processHomeButtonPressed]) {
        [(TransitionViewController *)self uiCancel];
      }
    }
  }
}

- (void)_showFailAlert
{
  objc_initWeak(&location, self);
  int v3 = sub_10001E3DC();
  CFStringRef v4 = [(FaceIdViewController *)self alertController];

  if (!v4)
  {
    if (v3)
    {
      id v7 = objc_loadWeakRetained(&location);
      [v7 _presentAlertAnimated:1 specialUi:1];

      goto LABEL_11;
    }
    objc_super v8 = [(FaceIdViewController *)self toastController];
    if ([v8 isViewLoaded])
    {
      __int16 v9 = [(FaceIdViewController *)self toastController];
      int v10 = [v9 view];
      uint64_t v11 = [v10 window];

      if (v11)
      {
        int64_t v5 = [(FaceIdViewController *)self toastController];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000920C;
        v12[3] = &unk_100086100;
        unsigned int v6 = &v13;
        objc_copyWeak(&v13, &location);
        char v14 = 0;
        [v5 dismissWithDelay:v12 completion:0.0];
        goto LABEL_3;
      }
    }
    else
    {
    }
    [(FaceIdViewController *)self _presentAlertAnimated:0 specialUi:0];
    goto LABEL_11;
  }
  [(FaceIdViewController *)self setDismissingTemporarily:1];
  int64_t v5 = [(FaceIdViewController *)self alertController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000918C;
  v15[3] = &unk_100086100;
  unsigned int v6 = &v16;
  objc_copyWeak(&v16, &location);
  char v17 = v3;
  [v5 dismissViewControllerAnimated:0 completion:v15];
LABEL_3:

  objc_destroyWeak(v6);
LABEL_11:
  objc_destroyWeak(&location);
}

- (void)_presentAlertAnimated:(BOOL)a3 specialUi:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    id v7 = [(TransitionViewController *)self options];
    objc_super v8 = [v7 objectForKeyedSubscript:&off_10008A1F8];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      [(FaceIdViewController *)self _setGlyphToNoMatchWithSpecialUi:1];
      [(FaceIdViewController *)self _shake:1];
      [(FaceIdViewController *)self setSuspended:1];
      int v10 = self->_toastController;
      dispatch_time_t v11 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009910;
      block[3] = &unk_100085F40;
      v50 = v10;
      id v12 = v10;
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

      return;
    }
  }
  objc_initWeak(&location, self);
  id v13 = objc_opt_new();
  [(FaceIdViewController *)self setAlertController:v13];

  char v14 = [(FaceIdViewController *)self alertController];
  [v14 setPreferredStyle:1];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000099D0;
  v46[3] = &unk_1000860D8;
  objc_copyWeak(&v47, &location);
  v15 = [(FaceIdViewController *)self alertController];
  [v15 setOnDismiss:v46];

  if (!v4 && [(FaceIdToastViewController *)self->_toastController lightweightUI])
  {
    id v16 = +[LACSecureFaceIDUIUtilities sharedInstance];
    if ([v16 isSupported] && objc_msgSend(v16, "isEnabled"))
    {
      char v17 = LACLogFaceIDUI();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will replace the small glyph with standard one", buf, 2u);
      }

      toastController = self->_toastController;
      self->_toastController = 0;

      [(LAUIPearlGlyphView *)self->_glyphView removeFromSuperview];
      id v19 = [(FaceIdViewController *)self _createGlyphViewForRetryUI:1];
      glyphView = self->_glyphView;
      self->_glyphView = v19;
    }
  }
  int v21 = [(FaceIdViewController *)self alertController];
  id v22 = v21;
  if (v4) {
    v23 = 0;
  }
  else {
    v23 = self->_glyphView;
  }
  [v21 setGlyph:v23];

  if (self->_pearlUIState == 5)
  {
    [(FaceIdViewController *)self _hideGlyphWithSpecialUi:v4];
    v24 = [(FaceIdViewController *)self alertController];
    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"PEARL_LOCKOUT" value:&stru_100088CF0 table:@"MobileUI"];
    [v24 setTitle:v26];

    v27 = [(FaceIdViewController *)self alertController];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"PEARL_LOCKOUT_DESCRIPTION" value:&stru_100088CF0 table:@"MobileUI"];
    [v27 setMessage:v29];
LABEL_25:

    goto LABEL_26;
  }
  if (!self->_hwIssueEvent)
  {
    v35 = [(FaceIdViewController *)self alertController];
    double v36 = +[NSBundle bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"PEARL_FAILED" value:&stru_100088CF0 table:@"MobileUI"];
    [v35 setTitle:v37];

    v38 = [(FaceIdViewController *)self alertController];
    id v39 = [(TransitionViewController *)self authenticationSubtitle];
    [v38 setMessage:v39];

    [(FaceIdViewController *)self _setGlyphToNoMatchWithSpecialUi:v4];
    if (v4) {
      [(FaceIdViewController *)self _shake:1];
    }
    goto LABEL_26;
  }
  [(FaceIdViewController *)self _hideGlyphWithSpecialUi:v4];
  unint64_t v30 = [(FaceIdViewController *)self alertController];
  v31 = +[NSBundle bundleForClass:objc_opt_class()];
  double v32 = [v31 localizedStringForKey:@"PEARL_HW_ISSUE_TITLE" value:&stru_100088CF0 table:@"MobileUI"];
  [v30 setTitle:v32];

  int64_t hwIssueEvent = self->_hwIssueEvent;
  if (hwIssueEvent == 9)
  {
    CFStringRef v34 = @"PEARL_HW_ISSUE_LOW_TEMPERATURE";
    goto LABEL_24;
  }
  if (hwIssueEvent == 10)
  {
    CFStringRef v34 = @"PEARL_HW_ISSUE_HIGH_TEMPERATURE";
LABEL_24:
    v27 = [(FaceIdViewController *)self alertController];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:v34 value:&stru_100088CF0 table:@"MobileUI"];
    [v27 setMessage:v29];
    goto LABEL_25;
  }
LABEL_26:
  [(FaceIdViewController *)self _setActionButtons];
  [(FaceIdViewController *)self _dismissCoachingViews];
  id v40 = [(FaceIdViewController *)self dimmingView];
  [v40 setDimEnabled:0];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100009A54;
  v41[3] = &unk_100086168;
  objc_copyWeak(&v42, &location);
  BOOL v43 = a3;
  BOOL v44 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v41);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)_hideGlyphWithSpecialUi:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(FaceIdViewController *)self toastController];
    [v3 dismissWithDelay:&stru_100086188 completion:0.0];
  }
  else
  {
    id v3 = [(FaceIdViewController *)self alertController];
    [v3 setGlyph:0];
  }
}

- (void)_setGlyphToNoMatchWithSpecialUi:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(LAUIPearlGlyphView *)self->_glyphView setShakeEnabled:0];
  }
  else
  {
    int64_t v5 = [(FaceIdViewController *)self glyphView];
    [v5 setStyle:2 animated:0];
  }

  [(FaceIdViewController *)self _setGlyphState:4 animated:v3];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(FaceIdViewController *)self toastController];
  unsigned int v6 = [v5 lightweightUI];

  uint64_t v7 = v6 | v3;
  objc_super v8 = LACLogFaceIDUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = "resumed";
    if (v7) {
      unsigned int v9 = "suspended";
    }
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2080;
    char v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has been %s", (uint8_t *)&v11, 0x16u);
  }

  int v10 = [(FaceIdViewController *)self dimmingView];
  [v10 setHidden:v7];

  self->_suspended = v7;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)_uiCancelWithUnderlyingError
{
}

- (void)_setActionButtons
{
  objc_initWeak(&location, self);
  BOOL v3 = [(TransitionViewController *)self options];
  BOOL v4 = [v3 objectForKeyedSubscript:&off_10008A210];
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  unsigned __int8 v98 = 0;
  v60 = v4;
  if (v4) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }
  unsigned __int8 v98 = v5;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  unsigned int v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v63 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100088CF0 table:@"MobileUI"];

  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  char v90 = 0;
  v64 = [v3 objectForKeyedSubscript:&off_10008A228];
  unsigned int fallbackVisible = [v64 BOOLValue];
  self->_unsigned int fallbackVisible = fallbackVisible;
  if (self->_pearlUIState == 7)
  {
    *((unsigned char *)v88 + 24) = 1;
    unsigned int fallbackVisible = self->_fallbackVisible;
  }
  if (!fallbackVisible) {
    *((unsigned char *)v96 + 24) = 1;
  }
  if (objc_msgSend(v64, "intValue", v60) == 2 || !*((unsigned char *)v96 + 24) || *((unsigned char *)v88 + 24)) {
    self->_BOOL showFallback = 1;
  }
  objc_super v8 = LACLogFaceIDUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(FaceIdViewController *)self alertController];
    BOOL v10 = self->_fallbackVisible;
    int v11 = *((unsigned __int8 *)v96 + 24);
    BOOL showFallback = self->_showFallback;
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    int v101 = v11;
    __int16 v102 = 1024;
    BOOL v103 = v10;
    __int16 v104 = 1024;
    BOOL v105 = showFallback;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@ with buttons - cancel:%d, fallback:%d, show fallback immediately:%d", buf, 0x28u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v101) = self->_showFallback;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10000AC5C;
  v71[3] = &unk_100086218;
  v71[4] = self;
  v73 = &v87;
  id v13 = v3;
  id v72 = v13;
  v74 = &v79;
  v75 = &v83;
  objc_copyWeak(&v78, &location);
  v76 = &v95;
  v77 = buf;
  v62 = objc_retainBlock(v71);
  int v14 = 0;
  switch(self->_pearlUIState)
  {
    case 2:
      alertController = self->_alertController;
      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      char v17 = [v16 localizedStringForKey:@"PEARL_TRY_AGAIN" value:&stru_100088CF0 table:@"MobileUI"];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10000AF54;
      v69[3] = &unk_1000860D8;
      v18 = &v70;
      objc_copyWeak(&v70, &location);
      [(FaceIdAlertViewController *)alertController _addActionWithTitle:v17 style:0 handler:v69 shouldDismissHandler:&stru_100086238];

      ((void (*)(void))v62[2])();
      if (self->_fallbackVisible)
      {
        int v14 = 1;
        if (!self->_showFallback) {
          self->_BOOL showFallback = 1;
        }
      }
      else
      {
        int v14 = 1;
      }
      goto LABEL_25;
    case 4:
      goto LABEL_23;
    case 5:
      if (self->_fallbackVisible && !self->_showFallback) {
        self->_BOOL showFallback = 1;
      }
      goto LABEL_23;
    case 6:
      id v19 = +[NSBundle bundleForClass:objc_opt_class()];
      id v20 = [v19 localizedStringForKey:@"FACE_ID_REQUIRED" value:&stru_100088CF0 table:@"MobileUI"];
      [(TransitionViewController *)self setAuthenticationTitle:v20];

      int v21 = +[NSBundle bundleForClass:objc_opt_class()];
      id v22 = [v21 localizedStringForKey:@"DTO_IS_ACTIVE" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
      [(TransitionViewController *)self setAuthenticationSubtitle:v22];

      v23 = self->_alertController;
      v24 = [(TransitionViewController *)self authenticationTitle];
      [(FaceIdAlertViewController *)v23 setTitle:v24];

      v25 = self->_alertController;
      v26 = [(TransitionViewController *)self authenticationSubtitle];
      [(FaceIdAlertViewController *)v25 setMessage:v26];

      v27 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v28 = [v27 localizedStringForKey:@"OK" value:&stru_100088CF0 table:@"MobileUI"];

      *((unsigned char *)v92 + 24) = 1;
      v29 = self->_alertController;
      unint64_t v30 = +[NSBundle bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"LEARN_MORE" value:&stru_100088CF0 table:@"MobileUI"];
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_10000B004;
      v67[3] = &unk_100086260;
      v18 = &v68;
      objc_copyWeak(&v68, &location);
      double v32 = +[UIAlertAction actionWithTitle:v31 style:0 handler:v67];
      [(FaceIdAlertViewController *)v29 addAction:v32];

      int v14 = 0;
      v63 = (void *)v28;
LABEL_25:
      objc_destroyWeak(v18);
      break;
    case 7:
      double v33 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v34 = [v33 localizedStringForKey:@"PASSCODE_TO_RETRY_FACE_ID" value:&stru_100088CF0 table:@"MobileUI"];
      [(TransitionViewController *)self setAuthenticationTitle:v34];

      v35 = +[NSBundle bundleForClass:objc_opt_class()];
      double v36 = [v35 localizedStringForKey:@"DTO_IS_ACTIVE" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
      [(TransitionViewController *)self setAuthenticationSubtitle:v36];

      v37 = self->_alertController;
      v38 = [(TransitionViewController *)self authenticationTitle];
      [(FaceIdAlertViewController *)v37 setTitle:v38];

      id v39 = self->_alertController;
      id v40 = [(TransitionViewController *)self authenticationSubtitle];
      [(FaceIdAlertViewController *)v39 setMessage:v40];

LABEL_23:
      ((void (*)(void))v62[2])();
      int v14 = 0;
      break;
    default:
      break;
  }
  if (*((unsigned char *)v96 + 24))
  {
    v41 = [v13 objectForKeyedSubscript:&off_10008A258];
    id v42 = +[LAUtils truncateString:v41 maxLength:32];

    if (v42)
    {
      BOOL v43 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      BOOL v44 = [v42 stringByTrimmingCharactersInSet:v43];

      if (v44 && [v44 length]) {
        goto LABEL_34;
      }
    }
    else
    {
      BOOL v44 = 0;
    }
    id v45 = v63;

    BOOL v44 = v45;
LABEL_34:
    v46 = self->_alertController;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10000B080;
    v65[3] = &unk_100086288;
    objc_copyWeak(&v66, &location);
    v65[4] = &v91;
    [(FaceIdAlertViewController *)v46 _addActionWithTitle:v44 style:1 handler:v65 shouldDismissHandler:&stru_1000862A8];
    objc_destroyWeak(&v66);
  }
  id v47 = [(FaceIdAlertViewController *)self->_alertController actions];
  v48 = [v47 objectAtIndexedSubscript:0];
  [(FaceIdAlertViewController *)self->_alertController setPreferredAction:v48];

  int64_t pearlUIState = self->_pearlUIState;
  if (pearlUIState != 5 && (unint64_t)(pearlUIState - 8) <= 0xFFFFFFFFFFFFFFFDLL && !self->_hwIssueEvent)
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      if (*((unsigned char *)v80 + 24))
      {
        v50 = [(TransitionViewController *)self options];
        v51 = [v50 objectForKeyedSubscript:&off_10008A1E0];
        v52 = +[LAUtils truncateString:v51 maxLength:512];
        [(TransitionViewController *)self setAuthenticationSubtitle:v52];
      }
      else
      {
        int v55 = *((unsigned __int8 *)v84 + 24);
        if (v14)
        {
          if (*((unsigned char *)v84 + 24))
          {
            v50 = +[NSBundle bundleForClass:objc_opt_class()];
            v51 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRY_AGAIN_OR_ENTER_PASSCODE"];
            v56 = [v50 localizedStringForKey:v51 value:&stru_100088CF0 table:@"MobileUI"];
          }
          else
          {
            v50 = +[NSBundle bundleForClass:objc_opt_class()];
            v56 = [v50 localizedStringForKey:@"TRY_AGAIN_OR_ENTER_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
            v51 = v56;
          }
          [(TransitionViewController *)self setAuthenticationSubtitle:v56];
          if (!v55) {
            goto LABEL_41;
          }
        }
        else
        {
          if (*((unsigned char *)v84 + 24))
          {
            v50 = +[NSBundle bundleForClass:objc_opt_class()];
            v51 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ENTER_PASSCODE"];
            v56 = [v50 localizedStringForKey:v51 value:&stru_100088CF0 table:@"MobileUI"];
          }
          else
          {
            v50 = +[NSBundle bundleForClass:objc_opt_class()];
            v56 = [v50 localizedStringForKey:@"ENTER_YOUR_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
            v51 = v56;
          }
          [(TransitionViewController *)self setAuthenticationSubtitle:v56];
          if (!v55) {
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      if (!v14)
      {
        [(TransitionViewController *)self setAuthenticationSubtitle:0];
        goto LABEL_50;
      }
      v53 = +[NSBundle bundleForClass:objc_opt_class()];
      v54 = [v53 localizedStringForKey:@"TRY_AGAIN" value:&stru_100088CF0 table:@"MobileUI"];
      [(TransitionViewController *)self setAuthenticationSubtitle:v54];

      if (!+[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]])
      {
LABEL_50:
        v57 = self->_alertController;
        v58 = [(TransitionViewController *)self authenticationSubtitle];
        [(FaceIdAlertViewController *)v57 setMessage:v58];

        goto LABEL_51;
      }
      if (self->_fallbackVisible)
      {
        v50 = +[NSBundle bundleForClass:objc_opt_class()];
        [v50 localizedStringForKey:@"TRY_AGAIN" value:&stru_100088CF0 table:@"MobileUI"];
      }
      else
      {
        v50 = +[NSBundle bundleForClass:objc_opt_class()];
        [v50 localizedStringForKey:@"FACE_ID_REQUIRED_MESSAGE" value:&stru_100088CF0 table:@"MobileUI"];
      uint64_t v59 = };
      [(TransitionViewController *)self setAuthenticationSubtitle:v59];
      v51 = (void *)v59;
    }
LABEL_41:

    goto LABEL_50;
  }
LABEL_51:

  objc_destroyWeak(&v78);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  objc_destroyWeak(&location);
}

- (void)_shake:(BOOL)a3
{
  if (a3) {
    [(FaceIdViewController *)self toastController];
  }
  else {
  BOOL v3 = [(FaceIdViewController *)self alertController];
  }
  [v3 shake];

  LODWORD(v3) = UIAccessibilityAnnouncementNotification;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v4 = [v5 localizedStringForKey:@"TRY_AGAIN" value:&stru_100088CF0 table:@"MobileUI"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  unsigned int v9 = (void (**)(void))a5;
  BOOL v10 = LACLogFaceIDUI();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = NSStringFromMechanismEventAndValue();
    int v14 = 138543874;
    v15 = self;
    __int16 v16 = 1024;
    int v17 = a3;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d (%@)", (uint8_t *)&v14, 0x1Cu);
  }
  underlyingError = self->_underlyingError;
  self->_underlyingError = 0;

  switch(a3)
  {
    case 1:
    case 6:
      id v13 = [v8 copy];
      [(FaceIdViewController *)self _handleNoMatchOrSensorInactive:v13];
      goto LABEL_16;
    case 2:
      [(FaceIdViewController *)self _handleMatch];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 3:
      self->_animationStart = CFAbsoluteTimeGetCurrent();
      [(FaceIdViewController *)self _setGlyphState:2 animated:1];
      if (self->_pearlUIState != 4) {
        goto LABEL_23;
      }
      self->_int64_t pearlUIState = 3;
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 5:
      [(FaceIdViewController *)self _handleSensorActive];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 7:
      id v13 = [v8 copy];
      [(FaceIdViewController *)self _handleBioLockout:v13];
LABEL_16:

      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 8:
    case 9:
    case 10:
      self->_int64_t hwIssueEvent = a3;
      if (![(TransitionViewController *)self appeared]) {
        goto LABEL_23;
      }
      [(FaceIdViewController *)self _showFailAlert];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 11:
      self->_silentFallback = 1;
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 12:
      [(LAUIPhysicalButtonView *)self->_physicalButtonView setHidden:1];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 13:
      [(LAUIPhysicalButtonView *)self->_physicalButtonView setHidden:0];
      goto LABEL_23;
    case 14:
      -[FaceIdViewController _processCoachingFeedback:](self, "_processCoachingFeedback:", (int)[v8 intValue]);
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_24;
    default:
LABEL_23:
      if (v9) {
LABEL_24:
      }
        v9[2](v9);
LABEL_25:

      return;
  }
}

- (void)_handleMatch
{
  self->_int64_t pearlUIState = 1;
  [(FaceIdViewController *)self _dismissCoachingViews];
  [(ScreenDimmingView *)self->_dimmingView setDimEnabled:0];
  BOOL v3 = [(FaceIdViewController *)self toastController];
  if ([v3 lightweightUI])
  {

    double v4 = 0.0;
  }
  else
  {
    double v4 = self->_animationStart - CFAbsoluteTimeGetCurrent() + 0.4;

    if (v4 > 0.0)
    {
      id v5 = LACLogFaceIDUI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v10 = self;
        __int16 v11 = 2048;
        double v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will extend animation time by %.02f sec", buf, 0x16u);
      }
    }
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B6A8;
  block[3] = &unk_1000860D8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSensorActive
{
  self->_animationStart = 0.0;
  if (self->_alertController)
  {
    self->_int64_t pearlUIState = 3;
    alertController = self->_alertController;
    double v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"PEARL" value:&stru_100088CF0 table:@"MobileUI"];
    [(FaceIdAlertViewController *)alertController setTitle:v5];
  }
  else if ([(FaceIdViewController *)self isSuspended] && self->_pearlUIState == 2)
  {
    self->_int64_t pearlUIState = 3;
    [(FaceIdViewController *)self _presentToast];
  }

  [(FaceIdViewController *)self _setGlyphState:1 animated:1];
}

- (void)_handleNoMatchOrSensorInactive:(id)a3
{
  id v4 = a3;
  int64_t pearlUIState = self->_pearlUIState;
  if (pearlUIState == 3 || pearlUIState == 0)
  {
    id v15 = v4;
    uint64_t v7 = [v4 objectForKeyedSubscript:&off_10008A270];
    unsigned __int8 v8 = [v7 BOOLValue];

    unsigned int v9 = [v15 objectForKeyedSubscript:&off_10008A240];
    unsigned int v10 = [v9 BOOLValue];

    if (+[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]])
    {
      if (v8)
      {
        int64_t v11 = 6;
        if (v10) {
          int64_t v11 = 4;
        }
        self->_int64_t pearlUIState = v11;
        if ((v10 & 1) == 0)
        {
          double v12 = [v15 objectForKeyedSubscript:&off_10008A1E0];
          underlyingError = self->_underlyingError;
          self->_underlyingError = v12;
        }
        goto LABEL_17;
      }
      int64_t v14 = 2;
    }
    else
    {
      int64_t v14 = 4;
      if (!self->_pearlUIState) {
        int64_t v14 = 2;
      }
    }
    self->_int64_t pearlUIState = v14;
LABEL_17:
    [(FaceIdViewController *)self _showFailAlert];
    id v4 = v15;
  }
}

- (void)_handleBioLockout:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if ((unint64_t)(self->_pearlUIState - 5) >= 3)
  {
    id v5 = [v4 objectForKeyedSubscript:&off_10008A240];
    unsigned int v6 = [v5 BOOLValue];

    unsigned int v7 = +[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]];
    unsigned __int8 v8 = [(TransitionViewController *)self options];
    unsigned int v9 = [v8 objectForKeyedSubscript:&off_10008A228];
    unsigned int v10 = [v9 BOOLValue];

    if (v7 && (v6 & 1) == 0)
    {
      self->_int64_t pearlUIState = 6;
LABEL_9:
      double v12 = [v14 objectForKeyedSubscript:&off_10008A1E0];
      underlyingError = self->_underlyingError;
      self->_underlyingError = v12;

      goto LABEL_11;
    }
    if (v7 & v6)
    {
      int64_t v11 = 7;
      if (v10) {
        int64_t v11 = 5;
      }
      self->_int64_t pearlUIState = v11;
      if ((v11 & 2) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      self->_int64_t pearlUIState = 5;
    }
  }
LABEL_11:
  [(FaceIdViewController *)self _showFailAlert];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  unsigned __int8 v8 = +[UIDevice currentDevice];
  unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000BBDC;
    v12[3] = &unk_1000862D0;
    void v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000BC38;
    v11[3] = &unk_1000862D0;
    [v7 animateAlongsideTransition:v12 completion:v11];
  }
  v10.receiver = self;
  v10.super_class = (Class)FaceIdViewController;
  -[FaceIdViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)_dismissCoachingViews
{
  if ([(LAUIHorizontalArrowView *)self->_horizontalArrowView isAnimating])
  {
    BOOL v3 = LACLogFaceIDUI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dismissing coaching views", v4, 2u);
    }

    [(LAUIHorizontalArrowView *)self->_horizontalArrowView setAnimating:0];
  }
}

- (void)_processCoachingFeedback:(int64_t)a3
{
  id v5 = LACLogFaceIDUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100060DA4(a3, (uint64_t)self, v5);
  }

  if (self->_dismissed) {
    a3 = 1;
  }
  if (a3 == 10)
  {
    if ([(FaceIdViewController *)self interfaceOrientation] != (id)2)
    {
      unsigned int v6 = LACLogFaceIDUI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        id v7 = "ignoring pose marginal coaching feedback because device is not upside down";
        unsigned __int8 v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        uint32_t v10 = 2;
        goto LABEL_14;
      }
LABEL_15:

      return;
    }
    if (self->_coachingFeedback != 10)
    {
      self->_coachingFeedback = 10;
      goto LABEL_20;
    }
LABEL_10:
    unsigned int v6 = LACLogFaceIDUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v23 = 134217984;
      int64_t v24 = a3;
      id v7 = "ignoring the same coaching feedback: %ld";
      unsigned __int8 v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v23, v10);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (a3 == self->_coachingFeedback) {
    goto LABEL_10;
  }
  self->_coachingFeedback = a3;
  if (a3 == 11)
  {
    int64_t v11 = [(TransitionViewController *)self options];
    double v12 = [v11 objectForKeyedSubscript:&off_10008A228];
    if ([v12 BOOLValue]
      && !+[LAUtils isBiometricOnlyPolicy:[(TransitionViewController *)self policy]])
    {
      __int16 v18 = [(TransitionViewController *)self options];
      id v19 = [v18 objectForKeyedSubscript:&off_10008A1B0];
      id v20 = [v19 objectForKeyedSubscript:&off_10008A1E0];
      int v21 = [v20 objectForKeyedSubscript:&off_10008A270];
      unsigned __int8 v22 = [v21 BOOLValue];

      if ((v22 & 1) == 0)
      {
        [(TransitionViewController *)self uiFallback];
        return;
      }
    }
    else
    {
    }
  }
LABEL_20:
  alertController = self->_alertController;
  if (alertController)
  {
    id v14 = [(FaceIdAlertViewController *)alertController view];
    id v15 = [v14 superview];
  }
  else
  {
    id v15 = [(FaceIdViewController *)self view];
  }
  __int16 v16 = [(LAUIHorizontalArrowView *)self->_horizontalArrowView superview];

  if (v16 != v15)
  {
    [(LAUIHorizontalArrowView *)self->_horizontalArrowView removeFromSuperview];
    [v15 addSubview:self->_horizontalArrowView];
    [v15 bringSubviewToFront:self->_horizontalArrowView];
  }
  int v17 = [(FaceIdViewController *)self _coachingTextForFeedback:a3];
  if (self->_pearlUIState)
  {
    [(FaceIdAlertViewController *)self->_alertController setTitle:v17];
  }
  else
  {
    [(FaceIdToastViewController *)self->_toastController setTitleText:v17];
    [(FaceIdToastViewController *)self->_toastController viewDidLayoutSubviews];
  }
  [(FaceIdViewController *)self _updatePearlViews];
}

- (id)_coachingTextForFeedback:(int64_t)a3
{
  if (a3 == 10)
  {
    BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = v3;
    CFStringRef v5 = @"PEARL_COACHING_LOOK_DOWN";
  }
  else if (a3 == 8)
  {
    BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = v3;
    CFStringRef v5 = @"PEARL_COACHING_CAMERA_COVERED";
  }
  else
  {
    BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = v3;
    CFStringRef v5 = @"PEARL";
  }
  unsigned int v6 = [v3 localizedStringForKey:v5 value:&stru_100088CF0 table:@"MobileUI"];

  return v6;
}

- (void)_destroyViewControllers
{
  glyphView = self->_glyphView;
  if (glyphView)
  {
    [(LAUIPearlGlyphView *)glyphView setPaused:1];
    [(LAUIPearlGlyphView *)self->_glyphView purgeBuffers];
    [(LAUIPearlGlyphView *)self->_glyphView removeFromSuperview];
    id v4 = LACLogFaceIDUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = self->_glyphView;
      int v10 = 138412290;
      int64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "glyph destroyed: %@", (uint8_t *)&v10, 0xCu);
    }

    unsigned int v6 = self->_glyphView;
    self->_glyphView = 0;
  }
  horizontalArrowView = self->_horizontalArrowView;
  self->_horizontalArrowView = 0;

  toastController = self->_toastController;
  self->_toastController = 0;

  alertController = self->_alertController;
  self->_alertController = 0;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C3F8;
  v9[3] = &unk_1000862F8;
  objc_copyWeak(&v11, &location);
  id v7 = v6;
  id v10 = v7;
  v8.receiver = self;
  v8.super_class = (Class)FaceIdViewController;
  [(FaceIdViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
  self->_dismissed = 1;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C64C;
  v12[3] = &unk_1000862F8;
  objc_copyWeak(&v14, &location);
  id v5 = v4;
  id v13 = v5;
  id v6 = objc_retainBlock(v12);
  if (!self->_dismissed && (self->_toastController || self->_alertController))
  {
    if (self->_pearlUIState == 1) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C6AC;
    v8[3] = &unk_100086348;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    os_log_type_t v9 = v6;
    [(FaceIdViewController *)self _dismissAlertWithDelay:0 temporarily:v8 completion:v7];

    objc_destroyWeak(&v10);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FaceIdViewController;
    [(TransitionViewController *)&v11 dismissChildWithCompletionHandler:v6];
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_dismissToastWithDelay:(double)a3 completion:(id)a4
{
  id v6 = (void (**)(id))a4;
  toastController = self->_toastController;
  if (toastController)
  {
    [(FaceIdToastViewController *)toastController dismissWithDelay:v6 completion:a3];
  }
  else if (v6)
  {
    v6[2](v6);
  }

  _objc_release_x1();
}

- (void)_dismissAlertWithDelay:(double)a3 temporarily:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  objc_super v8 = (void (**)(void, double))a5;
  [(FaceIdViewController *)self setDismissingTemporarily:v5];
  if (self->_alertController)
  {
    objc_initWeak(&location, self);
    alertController = self->_alertController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000C96C;
    v11[3] = &unk_100086370;
    double v12 = v8;
    objc_copyWeak(&v13, &location);
    [(FaceIdAlertViewController *)alertController dismissWithDelay:v11 completion:a3];
    id v10 = self->_alertController;
    self->_alertController = 0;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    v8[2](v8, a3);
  }
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  toastController = self->_toastController;
  if (toastController)
  {
    -[FaceIdToastViewController setGlyphState:animated:](toastController, "setGlyphState:animated:");
  }
  else
  {
    glyphView = self->_glyphView;
    if (glyphView && [(LAUIPearlGlyphView *)glyphView state] != (id)a3)
    {
      double v7 = self->_glyphView;
      -[LAUIPearlGlyphView setState:animated:withCompletion:](v7, "setState:animated:withCompletion:");
    }
  }
}

- (void)_updatePearlViews
{
  [(LAUIPhysicalButtonView *)self->_physicalButtonView updateFrame];
  horizontalArrowView = self->_horizontalArrowView;
  if (horizontalArrowView)
  {
    id v4 = [(LAUIHorizontalArrowView *)horizontalArrowView superview];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;

    id v13 = +[LACMobileGestalt faceIDCameraOrientation];
    switch((unint64_t)[(FaceIdViewController *)self interfaceOrientation])
    {
      case 1uLL:
        id v14 = self->_horizontalArrowView;
        if (v13 != (id)2) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 2uLL:
        id v14 = self->_horizontalArrowView;
        if (v13 != (id)2) {
          goto LABEL_11;
        }
        goto LABEL_9;
      case 3uLL:
        id v14 = self->_horizontalArrowView;
        if (v13 == (id)2) {
          goto LABEL_11;
        }
LABEL_9:
        v20.origin.x = v6;
        v20.origin.y = v8;
        v20.size.double width = v10;
        v20.size.double height = v12;
        -[LAUIHorizontalArrowView setCenter:](v14, "setCenter:", 80.0, CGRectGetMidY(v20));
        id v15 = self->_horizontalArrowView;
        uint64_t v16 = 0;
        goto LABEL_13;
      case 4uLL:
        id v14 = self->_horizontalArrowView;
        if (v13 == (id)2)
        {
LABEL_11:
          int v17 = v14;
          BOOL v18 = 0;
        }
        else
        {
LABEL_12:
          v21.origin.x = v6;
          v21.origin.y = v8;
          v21.size.double width = v10;
          v21.size.double height = v12;
          -[LAUIHorizontalArrowView setCenter:](v14, "setCenter:", v10 + -80.0, CGRectGetMidY(v21));
          id v15 = self->_horizontalArrowView;
          uint64_t v16 = 1;
LABEL_13:
          [(LAUIHorizontalArrowView *)v15 setDirection:v16];
          BOOL v18 = self->_coachingFeedback == 8;
          int v17 = self->_horizontalArrowView;
        }
        [(LAUIHorizontalArrowView *)v17 setAnimating:v18];
        break;
      default:
        return;
    }
  }
}

- (BOOL)processHomeButtonPressed
{
  int v3 = sub_10001E610();
  if (v3)
  {
    if ((id)[(TransitionViewController *)self policy] == (id)1004)
    {
      id v4 = LACLogFaceIDUI();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        CGFloat v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ recognized home gesture in Jindo for Stockholm", (uint8_t *)&v7, 0xCu);
      }

      [(FaceIdViewController *)self uiEvent:10 options:0];
      double v5 = [(FaceIdViewController *)self toastController];
      [v5 dismissWithDelay:&stru_1000863D0 completion:0.0];

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isUiReady
{
  return 0;
}

- (void)uiEvent:(int64_t)a3 options:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FaceIdViewController;
  [(TransitionViewController *)&v6 uiEvent:a3 options:a4];
  if (sub_10001E3DC())
  {
    if ((a3 | 4) == 6) {
      [(FaceIdViewController *)self _dismissAlertWithDelay:a3 == 6 temporarily:0 completion:0.0];
    }
  }
}

- (int64_t)pearlUIState
{
  return self->_pearlUIState;
}

- (void)setPearlUIState:(int64_t)a3
{
  self->_int64_t pearlUIState = a3;
}

- (FaceIdToastViewController)toastController
{
  return self->_toastController;
}

- (void)setToastController:(id)a3
{
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (FaceIdAlertViewController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (ScreenDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)dismissingTemporarily
{
  return self->_dismissingTemporarily;
}

- (void)setDismissingTemporarily:(BOOL)a3
{
  self->_dismissingTemporarily = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_toastController, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_horizontalArrowView, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_underlyingError, 0);
}

@end