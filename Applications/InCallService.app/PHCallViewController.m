@interface PHCallViewController
+ (NSString)dismissalAssertionReason;
+ (double)_bottomBarBottomMarginForView:(id)a3;
+ (double)_yOffsetForLoweredButtons;
+ (double)homeButtonOffsetForView:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsBanners;
- (BOOL)allowsMenuButtonDismissal;
- (BOOL)allowsOrientationChangeEvents;
- (BOOL)allowsOtherAlertsToStackOnTop;
- (BOOL)desiresLockButtonEvents;
- (BOOL)isPresentingCustomMessageController;
- (BOOL)needsDismissalAssertion;
- (BOOL)shouldShowActionTypeSendToVoicemail;
- (BOOL)wantsApplicationDismissalStyle;
- (CGRect)sourceRectForDeclineWithMessagePopover;
- (CGRect)sourceRectForDeclineWithReminderPopover;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (CNKFaceTimeConstraintsController)controlsConstraintsController;
- (NSCache)punchoutImageCache;
- (PHAlertController)failureAlertController;
- (PHBottomBar)bottomBar;
- (PHCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHDeclineWithMessageController)declineWithMessageController;
- (PHInCallRootViewControllerProtocol)inCallRootViewController;
- (TUCallProviderManager)providerManager;
- (TUContactsDataProvider)contactsDataProvider;
- (TUSenderIdentityClient)senderIdentityClient;
- (UIImage)frontmostCallProviderIcon;
- (id)imageForItemInBar:(id)a3 withActionType:(int64_t)a4;
- (int64_t)bottomBarCallStateInBar:(id)a3;
- (unint64_t)desiredButtonEvents;
- (unint64_t)desiredButtonEventsForCallContainer:(id)a3;
- (unint64_t)desiredSceneButtonEvents;
- (unsigned)currentState;
- (void)activateProviderInBackgroundForCall:(id)a3;
- (void)activateProviderInBackgroundWithBundleID:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)configureDeclineWithReminderButton:(id)a3 declineWithMessageButton:(id)a4 forIncomingCall:(id)a5;
- (void)handleDismissedCallDisplayStyle;
- (void)obtainDismissalAssertionIfNeeded;
- (void)providersChangedForProviderManager:(id)a3;
- (void)punchOutToVoIPApplicationForCurrentCall;
- (void)releaseDismissalAssertion;
- (void)releaseDismissalAssertionIfNeeded;
- (void)setBottomBar:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsDataProvider:(id)a3;
- (void)setControlsConstraintsController:(id)a3;
- (void)setCurrentState:(unsigned __int16)a3;
- (void)setDeclineWithMessageController:(id)a3;
- (void)setFailureAlertController:(id)a3;
- (void)setInCallRootViewController:(id)a3;
- (void)setProviderManager:(id)a3;
- (void)setPunchoutImageCache:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4;
- (void)setWantsApplicationDismissalStyle:(BOOL)a3;
- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4;
- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6;
- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6 otherButton:(id)a7 otherButtonURL:(id)a8;
- (void)transitionToIdleAfterDelay;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PHCallViewController

- (PHCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PHCallViewController;
  v4 = [(PHCallViewController *)&v11 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_currentState = 0;
    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    punchoutImageCache = v5->_punchoutImageCache;
    v5->_punchoutImageCache = v6;

    v8 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    providerManager = v5->_providerManager;
    v5->_providerManager = v8;

    [(TUCallProviderManager *)v5->_providerManager addDelegate:v5 queue:&_dispatch_main_q];
  }
  return v5;
}

- (BOOL)isPresentingCustomMessageController
{
  v2 = [(PHCallViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setCurrentState:(unsigned __int16)a3
{
  self->_currentState = a3;
  if ([(PHCallViewController *)self currentState] != 1) {
    return;
  }
  v3 = +[TUCallCenter sharedInstance];
  uint64_t v4 = [v3 incomingCall];
  if (v4)
  {
    id v17 = (id)v4;
  }
  else
  {
    v5 = +[TUCallCenter sharedInstance];
    id v17 = [v5 incomingVideoCall];

    if (!v17)
    {
      id v17 = 0;
      goto LABEL_7;
    }
  }
  v6 = +[TUMetadataClientController sharedInstance];
  [v6 updateMetadataForCall:v17];

LABEL_7:
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 delegate];
  v9 = [v8 currentInCallScene];
  v10 = [v9 delegate];
  objc_super v11 = [v10 callAnalyticsLogger];
  v12 = +[UIApplication sharedApplication];
  v13 = [v12 delegate];
  v14 = [v13 currentInCallScene];
  id v15 = [v14 presentationMode];
  v16 = +[ICSPreferences sharedPreferences];
  [v11 createAnalyticsViewForCall:v17 initialPresentationMode:v15 bannersEnabled:[v16 hasBannersEnabled]];
}

- (void)transitionToIdleAfterDelay
{
  if ([(PHCallViewController *)self currentState] == 1) {
    int64_t v3 = 500000000;
  }
  else {
    int64_t v3 = 1000000000;
  }
  dispatch_time_t v4 = dispatch_time(0, v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023FB0;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)allowsMenuButtonDismissal
{
  return 1;
}

- (BOOL)allowsOtherAlertsToStackOnTop
{
  return 1;
}

- (BOOL)allowsBanners
{
  return 1;
}

- (BOOL)allowsOrientationChangeEvents
{
  return 0;
}

- (unint64_t)desiredButtonEvents
{
  return 0;
}

- (unint64_t)desiredSceneButtonEvents
{
  return 0;
}

- (BOOL)desiresLockButtonEvents
{
  return 0;
}

- (unint64_t)desiredButtonEventsForCallContainer:(id)a3
{
  return 0;
}

- (void)configureDeclineWithReminderButton:(id)a3 declineWithMessageButton:(id)a4 forIncomingCall:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!TUCallScreeningEnabledM3()
    || ![(PHCallViewController *)self isPresentingCustomMessageController]
    || ([(PHCallViewController *)self declineWithMessageController],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    if (v16) {
      +[PHDeclineWithReminderController configureButton:v16 forIncomingCall:v9 presenter:self];
    }
    if (v8)
    {
      objc_super v11 = objc_opt_new();
      v12 = +[TUCallCenter sharedInstance];
      v13 = [v11 makeWithCallCenter:v12];

      v14 = [[PHDeclineWithMessageController alloc] initWithIncomingCall:v9 customMessagePresentingViewController:self declineCallService:v13];
      [(PHCallViewController *)self setDeclineWithMessageController:v14];

      id v15 = [(PHCallViewController *)self declineWithMessageController];
      [v15 configureDeclineMessageForButton:v8];
    }
  }
}

- (CGRect)sourceRectForDeclineWithMessagePopover
{
  int64_t v3 = [(PHCallViewController *)self bottomBar];
  [v3 frameForControlWithActionType:9];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  v29.origin.x = v5;
  v29.origin.CGFloat y = v7;
  v29.size.CGFloat width = v9;
  v29.size.CGFloat height = v11;
  v32.origin.x = CGRectZero.origin.x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (CGRectEqualToRect(v29, v32))
  {
    id v15 = [(PHCallViewController *)self bottomBar];
    [v15 frameForControlWithActionType:12];
    CGFloat v5 = v16;
    CGFloat v7 = v17;
    CGFloat v9 = v18;
    CGFloat v11 = v19;
  }
  v30.origin.x = v5;
  v30.origin.CGFloat y = v7;
  v30.size.CGFloat width = v9;
  v30.size.CGFloat height = v11;
  v33.origin.x = CGRectZero.origin.x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  if (CGRectEqualToRect(v30, v33))
  {
    v20 = [(PHCallViewController *)self bottomBar];
    [v20 frameForControlWithActionType:28];
    CGFloat v5 = v21;
    CGFloat v7 = v22;
    CGFloat v9 = v23;
    CGFloat v11 = v24;
  }
  double v25 = v5;
  double v26 = v7;
  double v27 = v9;
  double v28 = v11;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)sourceRectForDeclineWithReminderPopover
{
  v2 = [(PHCallViewController *)self bottomBar];
  [v2 frameForControlWithActionType:13];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  id v6 = [(PHCallViewController *)self inCallRootViewController];
  [v6 setStatusBarHidden:v5 withDuration:a4];
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    double v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    BOOL v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHCallViewController;
  [(PHCallViewController *)&v4 viewDidDisappear:a3];
  [(PHCallViewController *)self handleDismissedCallDisplayStyle];
}

- (void)handleDismissedCallDisplayStyle
{
  double v3 = [(PHCallViewController *)self presentedViewController];
  objc_super v4 = [v3 presentingViewController];

  if (v4 == self)
  {
    BOOL v5 = [(PHCallViewController *)self presentedViewController];
    [v5 dismissViewControllerAnimated:0 completion:0];
  }
  id v6 = [(PHCallViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PHCallViewController *)self dismissViewControllerAnimated:1 completion:0];
  }

  [(PHCallViewController *)self releaseDismissalAssertionIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[NSBundle mainBundle];
  double v8 = [v7 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];
  id v10 = +[IMUserNotification userNotificationWithIdentifier:@"InCallService" title:v6 message:v5 defaultButton:v8 alternateButton:0 otherButton:0];

  [v10 setShowInLockScreen:1];
  double v9 = +[IMUserNotificationCenter sharedInstance];
  [v9 addUserNotification:v10 listener:0];
}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6 otherButton:(id)a7 otherButtonURL:(id)a8
{
  id v13 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  double v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];
  double v21 = +[IMUserNotification userNotificationWithIdentifier:@"InCallService" title:v18 message:v17 defaultButton:v20 alternateButton:v16 otherButton:v15];

  double v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  double v28 = sub_1000247E0;
  CGRect v29 = &unk_1002CDD10;
  id v30 = v13;
  id v31 = v14;
  id v22 = v14;
  id v23 = v13;
  double v24 = objc_retainBlock(&v26);
  [v21 setShowInLockScreen:1 v26, v27, v28, v29];
  double v25 = +[IMUserNotificationCenter sharedInstance];
  [v25 addUserNotification:v21 listener:0 completionHandler:v24];
}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6
{
}

- (BOOL)shouldShowActionTypeSendToVoicemail
{
  v2 = +[ICSApplicationServices sharedInstance];
  double v3 = +[TUCallCenter sharedInstance];
  objc_super v4 = [v3 incomingCall];

  id v5 = [v2 accountManager];
  id v6 = [v5 accounts];
  if ([v6 count])
  {
    double v7 = [v4 model];
    if ([v7 supportsSendingToVoicemail]
      && ([v4 isRTT] & 1) == 0)
    {
      unsigned int v8 = [v4 isTTY] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (double)homeButtonOffsetForView:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if ((id)+[PHUIConfiguration pipStatusBarPadding] == (id)5)
  {
    id v5 = [v3 safeAreaLayoutGuide];
    [v5 layoutFrame];
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;

    v17.origin.x = v7;
    v17.origin.CGFloat y = v9;
    v17.size.CGFloat width = v11;
    v17.size.CGFloat height = v13;
    if (!CGRectIsEmpty(v17))
    {
      id v14 = +[UIScreen mainScreen];
      [v14 bounds];
      double v4 = v15 - (v9 + v13);
    }
  }

  return v4;
}

+ (double)_bottomBarBottomMarginForView:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024AF0;
  v8[3] = &unk_1002CDD38;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_100325DA0;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_100325DA0, v8);
  }
  double v6 = *(double *)&qword_100325D98;

  return v6;
}

+ (double)_yOffsetForLoweredButtons
{
  if (qword_100325DB0 != -1) {
    dispatch_once(&qword_100325DB0, &stru_1002CDD58);
  }
  return *(double *)&qword_100325DA8;
}

- (BOOL)needsDismissalAssertion
{
  return 0;
}

+ (NSString)dismissalAssertionReason
{
  return 0;
}

- (void)obtainDismissalAssertionIfNeeded
{
  if ([(PHCallViewController *)self needsDismissalAssertion])
  {
    v2 = [(id)objc_opt_class() dismissalAssertionReason];

    if (v2)
    {
      id v3 = [(id)objc_opt_class() dismissalAssertionReason];
      +[PHInCallRootViewController obtainDismissalAssertionForReason:v3];
    }
  }
}

- (void)releaseDismissalAssertionIfNeeded
{
  if (![(PHCallViewController *)self needsDismissalAssertion])
  {
    [(PHCallViewController *)self releaseDismissalAssertion];
  }
}

- (void)releaseDismissalAssertion
{
  v2 = [(id)objc_opt_class() dismissalAssertionReason];

  if (v2)
  {
    id v3 = [(id)objc_opt_class() dismissalAssertionReason];
    +[PHInCallRootViewController releaseDismissalAssertionForReason:v3];
  }
}

- (UIImage)frontmostCallProviderIcon
{
  id v3 = +[TUCallCenter sharedInstance];
  uint64_t v4 = [v3 frontmostAudioOrVideoCall];

  if (!v4)
  {
    id v9 = 0;
    goto LABEL_20;
  }
  id v5 = [v4 provider];
  double v6 = [(PHCallViewController *)self punchoutImageCache];
  CGFloat v7 = [v5 identifier];
  double v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    id v10 = [v5 iconTemplateImageData];

    if (!v10)
    {
      id v9 = 0;
      goto LABEL_19;
    }
    id v11 = objc_alloc((Class)UIImage);
    double v12 = [v5 iconTemplateImageData];
    id v13 = [v11 initWithData:v12];

    if (v13)
    {
      v25.CGFloat width = 40.0;
      v25.CGFloat height = 40.0;
      UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
      [v13 drawInRect:CGRectMake(0.0, 0.0, 40.0, 40.0)];
      UIGraphicsGetImageFromCurrentImageContext();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      id v14 = sub_1000D5130();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v15)
        {
          id v16 = [v5 identifier];
          int v20 = 138412546;
          id v21 = v9;
          __int16 v22 = 2112;
          id v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding punchout image (%@) to cache for key: %@", (uint8_t *)&v20, 0x16u);
        }
        id v14 = [(PHCallViewController *)self punchoutImageCache];
        CGRect v17 = [v5 identifier];
        [v14 setObject:v9 forKey:v17];

        goto LABEL_18;
      }
      if (v15)
      {
        LOWORD(v20) = 0;
        id v18 = "[WARN] Could not get image from current image context";
        goto LABEL_16;
      }
    }
    else
    {
      id v14 = sub_1000D5130();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        id v18 = "[WARN] Could not generate image from iconTemplateImageData from provider";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 2u);
      }
    }
    id v9 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v9 = v8;
LABEL_19:

LABEL_20:

  return (UIImage *)v9;
}

- (void)punchOutToVoIPApplicationForCurrentCall
{
  dispatch_time_t v2 = dispatch_time(0, 250000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1002CDD78);
}

- (void)activateProviderInBackgroundForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCallViewController: Requested background activation", buf, 2u);
  }

  dispatch_time_t v6 = dispatch_time(0, 250000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000254BC;
  v8[3] = &unk_1002CDDE0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)activateProviderInBackgroundWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Punching out to app with bundle identifier %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init((Class)_LSOpenConfiguration);
  uint64_t v8 = FBSOpenApplicationOptionKeyActivateSuspended;
  id v9 = &__kCFBooleanTrue;
  dispatch_time_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v5 setFrontBoardOptions:v6];

  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  [v7 openApplicationWithBundleIdentifier:v3 configuration:v5 completionHandler:&stru_1002CDE20];
}

- (id)imageForItemInBar:(id)a3 withActionType:(int64_t)a4
{
  if (a4 == 29)
  {
    dispatch_time_t v6 = [(PHCallViewController *)self frontmostCallProviderIcon];
  }
  else
  {
    dispatch_time_t v6 = 0;
  }
  return v6;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  return 2;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHCallViewController *)self providerManager];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Call providers changed. Invalidating punchout image cache", buf, 2u);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(PHCallViewController *)self providerManager];
    id v9 = [v8 providers];

    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
          BOOL v15 = [(PHCallViewController *)self punchoutImageCache];
          id v16 = [v14 identifier];
          [v15 removeObjectForKey:v16];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if (a4 == 4) {
    [(PHCallViewController *)self handleDismissedCallDisplayStyle];
  }
}

- (PHInCallRootViewControllerProtocol)inCallRootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inCallRootViewController);

  return (PHInCallRootViewControllerProtocol *)WeakRetained;
}

- (void)setInCallRootViewController:(id)a3
{
}

- (BOOL)wantsApplicationDismissalStyle
{
  return self->_wantsApplicationDismissalStyle;
}

- (void)setWantsApplicationDismissalStyle:(BOOL)a3
{
  self->_wantsApplicationDismissalStyle = a3;
}

- (PHBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)setBottomBar:(id)a3
{
}

- (CNKFaceTimeConstraintsController)controlsConstraintsController
{
  return self->_controlsConstraintsController;
}

- (void)setControlsConstraintsController:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (TUContactsDataProvider)contactsDataProvider
{
  return self->_contactsDataProvider;
}

- (void)setContactsDataProvider:(id)a3
{
}

- (NSCache)punchoutImageCache
{
  return (NSCache *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPunchoutImageCache:(id)a3
{
}

- (TUCallProviderManager)providerManager
{
  return (TUCallProviderManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProviderManager:(id)a3
{
}

- (PHAlertController)failureAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_failureAlertController);

  return (PHAlertController *)WeakRetained;
}

- (void)setFailureAlertController:(id)a3
{
}

- (PHDeclineWithMessageController)declineWithMessageController
{
  return self->_declineWithMessageController;
}

- (void)setDeclineWithMessageController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineWithMessageController, 0);
  objc_destroyWeak((id *)&self->_failureAlertController);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_punchoutImageCache, 0);
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_controlsConstraintsController, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_destroyWeak((id *)&self->_inCallRootViewController);

  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

@end