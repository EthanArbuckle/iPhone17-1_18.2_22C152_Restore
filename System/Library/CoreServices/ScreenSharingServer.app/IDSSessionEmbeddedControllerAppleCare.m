@interface IDSSessionEmbeddedControllerAppleCare
- (BOOL)showUserTermsAndConditions;
- (BOOL)startOutPaused;
- (BOOL)stoppingSession;
- (BOOL)termsAccepted;
- (IDSSessionEmbeddedControllerAppleCare)initWithRemoteID:(id)a3 session:(id)a4 direction:(int64_t)a5 inviteDictionary:(id)a6 andServiceController:(id)a7 autoAcceptInvite:(BOOL)a8 startOutPaused:(BOOL)a9 appleName:(id)a10;
- (id)inviterFullName;
- (void)doAcceptIDSInvitation;
- (void)postInvitationNotification;
- (void)setStartOutPaused:(BOOL)a3;
- (void)setStoppingSession:(BOOL)a3;
- (void)setTermsAccepted:(BOOL)a3;
- (void)shouldStartScreenSharingSession;
- (void)termsAndConditionsResult:(id)a3;
@end

@implementation IDSSessionEmbeddedControllerAppleCare

- (IDSSessionEmbeddedControllerAppleCare)initWithRemoteID:(id)a3 session:(id)a4 direction:(int64_t)a5 inviteDictionary:(id)a6 andServiceController:(id)a7 autoAcceptInvite:(BOOL)a8 startOutPaused:(BOOL)a9 appleName:(id)a10
{
  BOOL v10 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  v20 = [(IDSSessionEmbeddedControllerBase *)self init];
  if (v20)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v16 sessionID];
      *(_DWORD *)buf = 136315138;
      id v28 = [v21 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init with remoteid session %s", buf, 0xCu);
    }
    id v22 = [v16 sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 80, "-[IDSSessionEmbeddedControllerAppleCare initWithRemoteID:session:direction:inviteDictionary:andServiceController:autoAcceptInvite:startOutPaused:appleName:]", 7, 0, "init with remoteid session %s", (const char *)[v22 UTF8String]);

    [(IDSSessionEmbeddedControllerBase *)v20 setInviterID:v15];
    [(IDSSessionEmbeddedControllerBase *)v20 setIdsSession:v16];
    v23 = [(IDSSessionEmbeddedControllerBase *)v20 idsSession];
    [v23 setDelegate:v20 queue:&_dispatch_main_q];

    v24 = [v16 sessionID];
    [(IDSSessionEmbeddedControllerBase *)v20 setSessionID:v24];

    v25 = [(IDSSessionEmbeddedControllerBase *)v20 idsSession];
    [v25 setInvitationTimeOut:25];

    [(IDSSessionEmbeddedControllerBase *)v20 setIdsServiceController:v18];
    [(IDSSessionEmbeddedControllerBase *)v20 setRemoteAVConferenceInviteDictionary:v17];
    [(IDSSessionEmbeddedControllerAppleCare *)v20 setStartOutPaused:a9];
    [(IDSSessionEmbeddedControllerBase *)v20 setInviterKind:2];
    if (v19)
    {
      if ([v19 isEqualToString:@"AS"])
      {
        [(IDSSessionEmbeddedControllerBase *)v20 setInviterKind:3];
      }
      else if (([v19 isEqualToString:@"AC"] & 1) == 0)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown name specifier - using AppleCare", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 108, "-[IDSSessionEmbeddedControllerAppleCare initWithRemoteID:session:direction:inviteDictionary:andServiceController:autoAcceptInvite:startOutPaused:appleName:]", 7, 0, "unknown name specifier - using AppleCare");
      }
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "autoAcceptInvitationFlag %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 112, "-[IDSSessionEmbeddedControllerAppleCare initWithRemoteID:session:direction:inviteDictionary:andServiceController:autoAcceptInvite:startOutPaused:appleName:]", 7, 0, "autoAcceptInvitationFlag %d", v10);
    [(IDSSessionEmbeddedControllerBase *)v20 setAutoAcceptInvitation:v10];
    if (v10) {
      [(IDSSessionEmbeddedControllerAppleCare *)v20 doAcceptIDSInvitation];
    }
    else {
      [(IDSSessionEmbeddedControllerAppleCare *)v20 postInvitationNotification];
    }
  }

  return v20;
}

- (void)postInvitationNotification
{
  SInt32 error = 0;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v4 = [v3 sessionID];
    *(_DWORD *)buf = 136315138;
    v39 = (IDSSessionEmbeddedControllerAppleCare *)[v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postInvitationNotification for %s", buf, 0xCu);
  }
  v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v6 = [v5 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 130, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "postInvitationNotification for %s", (const char *)[v6 UTF8String]);

  if (qword_10005C8F0 != -1) {
    dispatch_once(&qword_10005C8F0, &stru_100054C68);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  [(IDSSessionEmbeddedControllerBase *)self addNotificationIconTo:Mutable];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];
    v9 = (IDSSessionEmbeddedControllerAppleCare *)[v8 UTF8String];
    *(_DWORD *)buf = 136315138;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "inviter name %s", buf, 0xCu);
  }
  id v10 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 152, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "inviter name %s", (const char *)[v10 UTF8String]);

  if ([(IDSSessionEmbeddedControllerBase *)self inviterKind] != 3)
  {
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"kSSShareYourScreen" value:&stru_1000553F0 table:0];
    id v15 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
    v12 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v12) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  MainBundle = CFBundleGetMainBundle();
  v12 = CFBundleCopyLocalizedString(MainBundle, @"kSSShareYourScreenAppleSupport", @"kSSShareYourScreenAppleSupport", 0);
  if (v12)
  {
LABEL_13:
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v12);
    CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v12);
    CFRelease(v12);
  }
LABEL_14:
  id v16 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];

  if (v16) {
    CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v16);
  }
  if ([(IDSSessionEmbeddedControllerBase *)self inviterKind] != 3)
  {
    id v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"kSSTapAccept" value:&stru_1000553F0 table:0];
    id v21 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);
    id v18 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v17 = CFBundleGetMainBundle();
  id v18 = CFBundleCopyLocalizedString(v17, @"kSSTapAcceptAppleSupport", @"kSSTapAcceptAppleSupport", 0);
  if (v18)
  {
LABEL_20:
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v18);
    CFRelease(v18);
  }
LABEL_21:
  id v22 = CFBundleGetMainBundle();
  CFStringRef v23 = CFBundleCopyLocalizedString(v22, @"kSSDecline", @"kSSDecline", 0);
  if (v23)
  {
    CFStringRef v24 = v23;
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v23);
    CFRelease(v24);
  }
  v25 = CFBundleGetMainBundle();
  CFStringRef v26 = CFBundleCopyLocalizedString(v25, @"kSSAccept", @"kSSAccept", 0);
  if (v26)
  {
    CFStringRef v27 = v26;
    CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v26);
    CFRelease(v27);
  }
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  [(IDSSessionEmbeddedControllerBase *)self setInvitationNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
  if (Mutable) {
    CFRelease(Mutable);
  }
  id v28 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
  BOOL v29 = sub_100035448();
  if (v28)
  {
    if (v29 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = error;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 204, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "got error %d", error);
    RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSSessionEmbeddedControllerBase *)self invitationNotification], (CFUserNotificationCallBack)sub_10001DEEC, 0);
    BOOL v31 = sub_100035448();
    if (RunLoopSource)
    {
      if (v31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v39 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "adding self %p to pending notifications", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 214, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "adding self %p to pending notifications", self);
      [(id)qword_10005C970 addObject:self];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (IDSSessionEmbeddedControllerAppleCare *)[(id)qword_10005C970 count];
        *(_DWORD *)buf = 134217984;
        v39 = v32;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[gPendingUserNotifications count %lu", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 216, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "[gPendingUserNotifications count %lu", [(id)qword_10005C970 count]);
      v33 = +[NSDate date];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationStartTime:v33];

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
      v35 = +[NSTimer scheduledTimerWithTimeInterval:self target:"userNotificationTimeout:" selector:0 userInfo:0 repeats:28.0];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:v35];

      v36 = RunLoopSource;
    }
    else
    {
      if (v31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 209, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "Failed to create run loop source for notification");
      v36 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
    }
    CFRelease(v36);
  }
  else
  {
    if (v29 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 201, "-[IDSSessionEmbeddedControllerAppleCare postInvitationNotification]", 7, 0, "failed to create notification");
  }
}

- (void)termsAndConditionsResult:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleCare termsAndConditionsResult called from viewservice", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 229, "-[IDSSessionEmbeddedControllerAppleCare termsAndConditionsResult:]", 7, 0, "AppleCare termsAndConditionsResult called from viewservice");
  v5 = [v4 objectForKey:@"result"];

  -[IDSSessionEmbeddedControllerAppleCare setTermsAccepted:](self, "setTermsAccepted:", [v5 BOOLValue]);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(IDSSessionEmbeddedControllerAppleCare *)self termsAccepted];
    v7 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v8 = [v7 sessionID];
    id v9 = [v8 UTF8String];
    *(_DWORD *)buf = 67109378;
    unsigned int v16 = v6;
    __int16 v17 = 2080;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "termsAndConditionsResult:%d  session %s", buf, 0x12u);
  }
  unsigned int v10 = [(IDSSessionEmbeddedControllerAppleCare *)self termsAccepted];
  v11 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v12 = [v11 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 232, "-[IDSSessionEmbeddedControllerAppleCare termsAndConditionsResult:]", 7, 0, "termsAndConditionsResult:%d  session %s", v10, (const char *)[v12 UTF8String]);

  v13 = [(IDSSessionEmbeddedControllerBase *)self vsSemaphore];

  if (v13)
  {
    v14 = [(IDSSessionEmbeddedControllerBase *)self vsSemaphore];
    dispatch_semaphore_signal(v14);

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "signaled semaphore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 236, "-[IDSSessionEmbeddedControllerAppleCare termsAndConditionsResult:]", 7, 0, "signaled semaphore");
  }
}

- (void)doAcceptIDSInvitation
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v4 = [v3 sessionID];
    *(_DWORD *)buf = 136315138;
    id v11 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Called [IDSSession doAcceptIDSInvitation] for %s", buf, 0xCu);
  }
  v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v6 = [v5 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 242, "-[IDSSessionEmbeddedControllerAppleCare doAcceptIDSInvitation]", 7, 0, "Called [IDSSession doAcceptIDSInvitation] for %s", (const char *)[v6 UTF8String]);

  v7 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  [v7 inviteWasAccepted:self];

  [(IDSSessionEmbeddedControllerBase *)self doAcceptIDSInvitationWithAVConferenceInfo];
  [(IDSSessionEmbeddedControllerAppleCare *)self setTermsAccepted:0];
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B370;
  block[3] = &unk_100054BB8;
  block[4] = self;
  dispatch_async(v8, block);
}

- (BOOL)showUserTermsAndConditions
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Applecare show terms and conditions", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 257, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]", 7, 0, "Applecare show terms and conditions");
  v25[0] = SBSUIRemoteAlertOptionViewControllerClass;
  v25[1] = SBSUIRemoteAlertOptionDismissWithHomeButton;
  v26[0] = @"TermsConditionsViewController";
  v26[1] = &__kCFBooleanFalse;
  v25[2] = SBSUIRemoteAlertOptionStatusBarStyle;
  v3 = +[NSNumber numberWithInteger:0];
  v26[2] = v3;
  v26[3] = &__kCFBooleanTrue;
  v25[3] = SBSUIRemoteAlertOptionDisableFadeInAnimation;
  v25[4] = SBSUIRemoteAlertOptionUserInfo;
  CFStringRef v23 = @"isAppleSupportRequest";
  id v4 = +[NSNumber numberWithBool:[(IDSSessionEmbeddedControllerBase *)self inviterKind] == 3];
  CFStringRef v24 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[4] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];

  int v7 = SBSUIActivateRemoteAlertWithLifecycleNotifications();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RemoteAlert: %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 289, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]", 7, 0, "RemoteAlert: %d", v7);
  id v8 = [(IDSSessionEmbeddedControllerBase *)self vsSemaphore];
  dispatch_time_t v9 = dispatch_time(0, 600000000000);
  intptr_t v10 = dispatch_semaphore_wait(v8, v9);
  BOOL v11 = v10 == 0;

  if (v10)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
      id v13 = [v12 sessionID];
      id v14 = [v13 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms and conditions timeout for %s", buf, 0xCu);
    }
    id v15 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v16 = [v15 sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 295, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]", 7, 0, "terms and conditions timeout for %s", (const char *)[v16 UTF8String]);
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "woke up from sempahore", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 298, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]", 7, 0, "woke up from sempahore");
  if (![(IDSSessionEmbeddedControllerAppleCare *)self termsAccepted])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      id v18 = [v17 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms not accepted for %s", buf, 0xCu);
    }
    id v19 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 301, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]", 7, 0, "terms not accepted for %s", (const char *)[v19 UTF8String]);

    BOOL v11 = 0;
  }

  return v11;
}

- (void)shouldStartScreenSharingSession
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "check if should show terms", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 311, "-[IDSSessionEmbeddedControllerAppleCare shouldStartScreenSharingSession]", 7, 0, "check if should show terms");
  if ([(IDSSessionEmbeddedControllerBase *)self autoAcceptInvitation])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to show terms and conditions", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 323, "-[IDSSessionEmbeddedControllerAppleCare shouldStartScreenSharingSession]", 7, 0, "going to show terms and conditions");
    unsigned int v3 = [(IDSSessionEmbeddedControllerAppleCare *)self showUserTermsAndConditions];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      id v5 = [v4 UTF8String];
      *(_DWORD *)buf = 67109378;
      unsigned int v10 = v3;
      __int16 v11 = 2080;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "termsConditionsAccepted = %d for %s", buf, 0x12u);
    }
    id v6 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 325, "-[IDSSessionEmbeddedControllerAppleCare shouldStartScreenSharingSession]", 7, 0, "termsConditionsAccepted = %d for %s", v3, (const char *)[v6 UTF8String]);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BD14;
  block[3] = &unk_100054BE0;
  block[4] = self;
  char v8 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)inviterFullName
{
  unsigned int v2 = [(IDSSessionEmbeddedControllerBase *)self inviterKind];
  unsigned int v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2 == 2) {
    CFStringRef v5 = @"kSSAppleCare";
  }
  else {
    CFStringRef v5 = @"kSSAppleSupport";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1000553F0 table:0];

  return v6;
}

- (BOOL)termsAccepted
{
  return self->termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->termsAccepted = a3;
}

- (BOOL)stoppingSession
{
  return self->_stoppingSession;
}

- (void)setStoppingSession:(BOOL)a3
{
  self->_stoppingSession = a3;
}

- (BOOL)startOutPaused
{
  return self->_startOutPaused;
}

- (void)setStartOutPaused:(BOOL)a3
{
  self->_startOutPaused = a3;
}

@end