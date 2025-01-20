@interface IDSSessionEmbeddedControllerShareSettings
- (BOOL)showUserTermsAndConditions;
- (BOOL)useAppleCareName;
- (IDSSessionEmbeddedControllerShareSettings)init;
- (IDSSessionEmbeddedControllerShareSettings)initWithRemoteID:(id)a3 sessionID:(id)a4 andServiceController:(id)a5 appleName:(id)a6;
- (void)dealloc;
- (void)doAcceptIDSInvitation;
- (void)doDeclineIDSInvitationWithReasonString:(id)a3;
- (void)handleTermsAndConditions;
- (void)postInvitationNotification;
- (void)sendSharedSettings;
- (void)setUseAppleCareName:(BOOL)a3;
- (void)userFinishedTermsAndConditions:(id)a3;
@end

@implementation IDSSessionEmbeddedControllerShareSettings

- (IDSSessionEmbeddedControllerShareSettings)init
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 32, "-[IDSSessionEmbeddedControllerShareSettings init]", 7, 0, "init called");
  v4.receiver = self;
  v4.super_class = (Class)IDSSessionEmbeddedControllerShareSettings;
  return [(IDSSessionEmbeddedControllerBase *)&v4 init];
}

- (void)dealloc
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dealloc called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 42, "-[IDSSessionEmbeddedControllerShareSettings dealloc]", 7, 0, "dealloc called");
  v3.receiver = self;
  v3.super_class = (Class)IDSSessionEmbeddedControllerShareSettings;
  [(IDSSessionEmbeddedControllerBase *)&v3 dealloc];
}

- (IDSSessionEmbeddedControllerShareSettings)initWithRemoteID:(id)a3 sessionID:(id)a4 andServiceController:(id)a5 appleName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(IDSSessionEmbeddedControllerShareSettings *)self init];
  v15 = v14;
  if (v14)
  {
    [(IDSSessionEmbeddedControllerBase *)v14 setInviterID:v10];
    [(IDSSessionEmbeddedControllerBase *)v15 setIdsServiceController:v12];
    [(IDSSessionEmbeddedControllerBase *)v15 setInviterKind:2];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set inviter kind to AppleCare self = %p", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 54, "-[IDSSessionEmbeddedControllerShareSettings initWithRemoteID:sessionID:andServiceController:appleName:]", 7, 0, "set inviter kind to AppleCare self = %p", v15);
    [(IDSSessionEmbeddedControllerBase *)v15 setSessionID:v11];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (IDSSessionEmbeddedControllerShareSettings *)[v11 UTF8String];
      *(_DWORD *)buf = 136315138;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session ID = %s", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 57, "-[IDSSessionEmbeddedControllerShareSettings initWithRemoteID:sessionID:andServiceController:appleName:]", 7, 0, "session ID = %s", (const char *)[v11 UTF8String]);
    [(IDSSessionEmbeddedControllerShareSettings *)v15 setUseAppleCareName:1];
    if (v13)
    {
      if ([v13 isEqualToString:@"AS"])
      {
        [(IDSSessionEmbeddedControllerShareSettings *)v15 setUseAppleCareName:0];
      }
      else if (([v13 isEqualToString:@"AC"] & 1) == 0)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown name specifier - using AppleCare", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 65, "-[IDSSessionEmbeddedControllerShareSettings initWithRemoteID:sessionID:andServiceController:appleName:]", 7, 0, "unknown name specifier - using AppleCare");
      }
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [(IDSSessionEmbeddedControllerShareSettings *)v15 useAppleCareName];
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "useAppleCareName %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 67, "-[IDSSessionEmbeddedControllerShareSettings initWithRemoteID:sessionID:andServiceController:appleName:]", 7, 0, "useAppleCareName %d", [(IDSSessionEmbeddedControllerShareSettings *)v15 useAppleCareName]);
  }

  return v15;
}

- (void)postInvitationNotification
{
  SInt32 error = 0;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    *(_DWORD *)buf = 136315138;
    v38 = (IDSSessionEmbeddedControllerShareSettings *)[v3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postInvitationNotification for %s", buf, 0xCu);
  }
  id v4 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 80, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "postInvitationNotification for %s", (const char *)[v4 UTF8String]);

  if (qword_10005C8E8 != -1) {
    dispatch_once(&qword_10005C8E8, &stru_100054B90);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = [(IDSSessionEmbeddedControllerBase *)self inviterIconPath];

  if (v6)
  {
    v7 = [(IDSSessionEmbeddedControllerBase *)self inviterIconPath];
    CFDictionaryAddValue(Mutable, @"SBUserNotificationIconImagePath", v7);
  }
  unsigned int v8 = [(IDSSessionEmbeddedControllerBase *)self inviterKind];
  MainBundle = CFBundleGetMainBundle();
  if (v8 == 3) {
    CFStringRef v10 = @"kSSShareSettingsAppleSupport";
  }
  else {
    CFStringRef v10 = @"kSSShareSettings";
  }
  CFStringRef v11 = CFBundleCopyLocalizedString(MainBundle, v10, v10, 0);
  if (v11)
  {
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v11);
    CFRelease(v11);
  }
  id v12 = [(IDSSessionEmbeddedControllerAppleCare *)self inviterFullName];

  if (v12) {
    CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v12);
  }
  unsigned int v13 = [(IDSSessionEmbeddedControllerBase *)self inviterKind];
  v14 = CFBundleGetMainBundle();
  if (v13 == 3) {
    CFStringRef v15 = @"kSSShareSettingsAppleSupport";
  }
  else {
    CFStringRef v15 = @"kSSShareSettings";
  }
  CFStringRef v16 = CFBundleCopyLocalizedString(v14, v15, v15, 0);
  if (v16)
  {
    CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v16);
    CFRelease(v16);
  }
  unsigned int v17 = [(IDSSessionEmbeddedControllerBase *)self inviterKind];
  v18 = CFBundleGetMainBundle();
  if (v17 == 3) {
    CFStringRef v19 = @"kSSTapShareSettingsAppleSupport";
  }
  else {
    CFStringRef v19 = @"kSSTapShareSettings";
  }
  CFStringRef v20 = CFBundleCopyLocalizedString(v18, v19, v19, 0);
  if (v20)
  {
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v20);
    CFRelease(v20);
  }
  v21 = CFBundleGetMainBundle();
  CFStringRef v22 = CFBundleCopyLocalizedString(v21, @"kSSDecline", @"kSSDecline", 0);
  if (v22)
  {
    CFStringRef v23 = v22;
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v22);
    CFRelease(v23);
  }
  v24 = CFBundleGetMainBundle();
  CFStringRef v25 = CFBundleCopyLocalizedString(v24, @"kSSAccept", @"kSSAccept", 0);
  if (v25)
  {
    CFStringRef v26 = v25;
    CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v25);
    CFRelease(v26);
  }
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  [(IDSSessionEmbeddedControllerBase *)self setInvitationNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
  CFRelease(Mutable);
  v27 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
  BOOL v28 = sub_100035448();
  if (v27)
  {
    if (v28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = error;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got CFUserNotificationCreate error %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 151, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "got CFUserNotificationCreate error %d", error);
    RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSSessionEmbeddedControllerBase *)self invitationNotification], (CFUserNotificationCallBack)sub_10001DEEC, 0);
    BOOL v30 = sub_100035448();
    if (RunLoopSource)
    {
      if (v30 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v38 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "adding self %p to pending notifications", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 161, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "adding self %p to pending notifications", self);
      [(id)qword_10005C970 addObject:self];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (IDSSessionEmbeddedControllerShareSettings *)[(id)qword_10005C970 count];
        *(_DWORD *)buf = 134217984;
        v38 = v31;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[gPendingUserNotifications count %lu", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 163, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "[gPendingUserNotifications count %lu", [(id)qword_10005C970 count]);
      v32 = +[NSDate date];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationStartTime:v32];

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
      v34 = +[NSTimer scheduledTimerWithTimeInterval:self target:"userNotificationTimeout:" selector:0 userInfo:0 repeats:28.0];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:v34];

      v35 = RunLoopSource;
    }
    else
    {
      if (v30 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 156, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "Failed to create run loop source for notification");
      v35 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
    }
    CFRelease(v35);
  }
  else
  {
    if (v28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 148, "-[IDSSessionEmbeddedControllerShareSettings postInvitationNotification]", 7, 0, "failed to create notification");
  }
}

- (void)doAcceptIDSInvitation
{
  unsigned __int8 v3 = [(IDSSessionEmbeddedControllerBase *)self handledSessionEnd];
  BOOL v4 = sub_100035448();
  if (v3)
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session already ended - ignore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 189, "-[IDSSessionEmbeddedControllerShareSettings doAcceptIDSInvitation]", 7, 0, "session already ended - ignore");
  }
  else
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user accepted invite", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 178, "-[IDSSessionEmbeddedControllerShareSettings doAcceptIDSInvitation]", 7, 0, "user accepted invite");
    [(IDSSessionEmbeddedControllerBase *)self setAppleIDInviteWasAcceptedOrDeclined:1];
    v5 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    [v5 inviteWasAccepted:self];

    v6 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009198;
    block[3] = &unk_100054BB8;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)handleTermsAndConditions
{
  unsigned __int8 v3 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  BOOL v4 = [(IDSSessionEmbeddedControllerBase *)self inviterID];
  unsigned int v5 = [v3 inviterIsInActiveSession:v4];

  if (!v5) {
    goto LABEL_15;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "inviter is in active session", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 200, "-[IDSSessionEmbeddedControllerShareSettings handleTermsAndConditions]", 7, 0, "inviter is in active session");
  if (CFPreferencesGetAppBooleanValue(@"ForceTC", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat))
  {
    BOOL v6 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "forceTermsAndConditions: %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 204, "-[IDSSessionEmbeddedControllerShareSettings handleTermsAndConditions]", 7, 0, "forceTermsAndConditions: %d", v7);
  if (!v7)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no need to ask for T&C just send TCAccepted message", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 215, "-[IDSSessionEmbeddedControllerShareSettings handleTermsAndConditions]", 7, 0, "no need to ask for T&C just send TCAccepted message");
    id v11 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    [v11 sendMessageTCAccepted];
    LOBYTE(v8) = 1;
  }
  else
  {
LABEL_15:
    unsigned int v8 = [(IDSSessionEmbeddedControllerShareSettings *)self showUserTermsAndConditions];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      id v10 = [v9 UTF8String];
      *(_DWORD *)buf = 67109378;
      unsigned int v16 = v8;
      __int16 v17 = 2080;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "termsConditionsAccepted = %d for %s", buf, 0x12u);
    }
    id v11 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 211, "-[IDSSessionEmbeddedControllerShareSettings handleTermsAndConditions]", 7, 0, "termsConditionsAccepted = %d for %s", v8, (const char *)[v11 UTF8String]);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009524;
  block[3] = &unk_100054BE0;
  block[4] = self;
  char v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)userFinishedTermsAndConditions:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "###userFinishedTermsAndConditions", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 227, "-[IDSSessionEmbeddedControllerShareSettings userFinishedTermsAndConditions:]", 7, 0, "###userFinishedTermsAndConditions");
  unsigned int v5 = [v4 BOOLValue];

  BOOL v6 = sub_100035448();
  if (v5)
  {
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accepted terms and conditions", v9, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 230, "-[IDSSessionEmbeddedControllerShareSettings userFinishedTermsAndConditions:]", 7, 0, "accepted terms and conditions");
    [(IDSSessionEmbeddedControllerShareSettings *)self sendSharedSettings];
    int v7 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    [v7 removeSession:self andEndIDSSession:0];
  }
  else
  {
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "declined terms", v8, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 236, "-[IDSSessionEmbeddedControllerShareSettings userFinishedTermsAndConditions:]", 7, 0, "declined terms");
    [(IDSSessionEmbeddedControllerShareSettings *)self doDeclineIDSInvitationWithReasonString:@"decline"];
  }
}

- (void)doDeclineIDSInvitationWithReasonString:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IDSSessionEmbeddedControllerBase *)self handledSessionEnd];
  BOOL v6 = sub_100035448();
  if (v5)
  {
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session already ended - ignore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 251, "-[IDSSessionEmbeddedControllerShareSettings doDeclineIDSInvitationWithReasonString:]", 7, 0, "session already ended - ignore");
  }
  else
  {
    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = [v4 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user declined.  reason %s", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 245, "-[IDSSessionEmbeddedControllerShareSettings doDeclineIDSInvitationWithReasonString:]", 7, 0, "user declined. reason %s", (const char *)[v4 UTF8String]);
    [(IDSSessionEmbeddedControllerBase *)self setAppleIDInviteWasAcceptedOrDeclined:1];
    int v7 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    unsigned int v8 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    [v7 sendMessageShareSettingsUserDecline:v8];

    id v9 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    [v9 removeSession:self andEndIDSSession:0];
  }
}

- (void)sendSharedSettings
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user accepted T&C send system info", v6, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 256, "-[IDSSessionEmbeddedControllerShareSettings sendSharedSettings]", 7, 0, "user accepted T&C send system info");
  unsigned __int8 v3 = +[ShareSettingsInfo gatherSystemInfo];
  id v4 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  unsigned __int8 v5 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
  [v4 sendMessageShareStatusResult:v5 systemInfo:v3];
}

- (BOOL)showUserTermsAndConditions
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "show share settings terms and conditions", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 263, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "show share settings terms and conditions");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [(IDSSessionEmbeddedControllerShareSettings *)self useAppleCareName];
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "useAppleCareName %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 266, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "useAppleCareName %d", [(IDSSessionEmbeddedControllerShareSettings *)self useAppleCareName]);
  id v4 = +[NSNumber numberWithBool:[(IDSSessionEmbeddedControllerShareSettings *)self useAppleCareName] ^ 1];
  v26[0] = @"isShareSettings";
  v26[1] = @"isAppleSupportRequest";
  v27[0] = &__kCFBooleanTrue;
  v27[1] = v4;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v24[0] = SBSUIRemoteAlertOptionViewControllerClass;
  v24[1] = SBSUIRemoteAlertOptionDismissWithHomeButton;
  v25[0] = @"TermsConditionsViewController";
  v25[1] = &__kCFBooleanFalse;
  v24[2] = SBSUIRemoteAlertOptionStatusBarStyle;
  BOOL v6 = +[NSNumber numberWithInteger:0];
  v25[2] = v6;
  v25[3] = &__kCFBooleanTrue;
  v24[3] = SBSUIRemoteAlertOptionDisableFadeInAnimation;
  v24[4] = SBSUIRemoteAlertOptionUserInfo;
  v25[4] = v5;
  int v7 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

  int v8 = SBSUIActivateRemoteAlertWithLifecycleNotifications();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RemoteAlert: %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 292, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "RemoteAlert: %d", v8);
  id v9 = [(IDSSessionEmbeddedControllerBase *)self vsSemaphore];
  dispatch_time_t v10 = dispatch_time(0, 600000000000);
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  BOOL v12 = v11 == 0;

  if (v11)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      id v14 = [v13 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms and conditions timeout for %s", buf, 0xCu);
    }
    id v15 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 296, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "terms and conditions timeout for %s", (const char *)[v15 UTF8String]);
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "woke up from sempahore", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 299, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "woke up from sempahore");
  unsigned __int8 v16 = [(IDSSessionEmbeddedControllerAppleCare *)self termsAccepted];
  BOOL v17 = sub_100035448();
  if (v16)
  {
    if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms were accepted", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 307, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "terms were accepted");
  }
  else
  {
    if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      id v19 = [v18 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms not accepted for %s", buf, 0xCu);
    }
    id v20 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 303, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]", 7, 0, "terms not accepted for %s", (const char *)[v20 UTF8String]);

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)useAppleCareName
{
  return *(&self->super._startOutPaused + 1);
}

- (void)setUseAppleCareName:(BOOL)a3
{
  *(&self->super._startOutPaused + 1) = a3;
}

@end