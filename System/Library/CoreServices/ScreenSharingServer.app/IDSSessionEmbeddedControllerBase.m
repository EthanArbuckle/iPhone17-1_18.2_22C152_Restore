@interface IDSSessionEmbeddedControllerBase
- (AVConference)avConference;
- (BOOL)allowsAudioChat;
- (BOOL)appleIDInviteWasAcceptedOrDeclined;
- (BOOL)audioChatEnabled;
- (BOOL)autoAcceptInvitation;
- (BOOL)controlModeEnabled;
- (BOOL)handledSessionEnd;
- (BOOL)isAudioChatMuted;
- (BOOL)isPaused;
- (BOOL)notificationTimedOut;
- (BOOL)pauseVideoSending:(BOOL)a3;
- (BOOL)sessionStartDelegateWasCalled;
- (BOOL)shouldShowDisconnectionUI;
- (BOOL)startOutPaused;
- (BOOL)stoppingSession;
- (BOOL)termsAccepted;
- (BOOL)termsAndConditionsAccepted;
- (IDSServiceEmbeddedController)idsServiceController;
- (IDSSession)idsSession;
- (IDSSessionEmbeddedControllerBase)init;
- (IDSSessionEmbeddedControllerBase)initWithRemoteID:(id)a3 session:(id)a4 direction:(int64_t)a5 inviteDictionary:(id)a6 andServiceController:(id)a7 autoAcceptInvite:(BOOL)a8 startOutPaused:(BOOL)a9 appleName:(id)a10;
- (NSDate)notificationStartTime;
- (NSDictionary)remoteAVConferenceInviteDictionary;
- (NSString)inviterFullName;
- (NSString)inviterID;
- (NSString)inviterIconPath;
- (NSString)sessionID;
- (NSString)uniqueID;
- (NSTimer)notificationTimeoutTimer;
- (NWConnectionManager)datagramConnectionManager;
- (NWDatagramConnection)datagramConnection;
- (OS_dispatch_semaphore)vsSemaphore;
- (VNCServer)vnc;
- (__CFUserNotification)invitationNotification;
- (id)dataForInviteDictionary:(id)a3;
- (id)inviteDictionaryForRemoteInviteDictionary:(id)a3;
- (id)inviterIDForDisplay;
- (int)idsSessionState;
- (int)inviterKind;
- (int)notifierToken;
- (int64_t)callID;
- (int64_t)direction;
- (void)addNotificationIconTo:(__CFDictionary *)a3;
- (void)cleanupSession;
- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4;
- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5;
- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5;
- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5;
- (void)dealloc;
- (void)doAcceptIDSInvitation;
- (void)doAcceptIDSInvitationWithAVConferenceInfo;
- (void)doDeclineIDSInvitationWithReasonString:(id)a3;
- (void)doEndSession;
- (void)initAVConference;
- (void)postInvitationNotification;
- (void)removeUserNotification;
- (void)sendScreenLockChangeMessage:(BOOL)a3;
- (void)serverDiedForConference:(id)a3;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedSessionEndFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setAppleIDInviteWasAcceptedOrDeclined:(BOOL)a3;
- (void)setAudioChatMuted:(BOOL)a3;
- (void)setAutoAcceptInvitation:(BOOL)a3;
- (void)setAvConference:(id)a3;
- (void)setCallID:(int64_t)a3;
- (void)setControlModeEnabled:(BOOL)a3;
- (void)setDatagramConnection:(id)a3;
- (void)setDatagramConnectionManager:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setHandledSessionEnd:(BOOL)a3;
- (void)setIdsServiceController:(id)a3;
- (void)setIdsSession:(id)a3;
- (void)setIdsSessionState:(int)a3;
- (void)setInvitationNotification:(__CFUserNotification *)a3;
- (void)setInviterID:(id)a3;
- (void)setInviterKind:(int)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setNotificationStartTime:(id)a3;
- (void)setNotificationTimedOut:(BOOL)a3;
- (void)setNotificationTimeoutTimer:(id)a3;
- (void)setNotifierToken:(int)a3;
- (void)setRemoteAVConferenceInviteDictionary:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionStartDelegateWasCalled:(BOOL)a3;
- (void)setStartOutPaused:(BOOL)a3;
- (void)setStoppingSession:(BOOL)a3;
- (void)setTermsAccepted:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)setVnc:(id)a3;
- (void)setVsSemaphore:(id)a3;
- (void)shouldStartScreenSharingSession;
- (void)startAVConferenceCallWithRemoteDictionary:(id)a3;
- (void)startSendingTheScreen;
- (void)termsAndConditionsResult:(id)a3;
- (void)userFinishedTermsAndConditions:(id)a3;
- (void)userNotificationTimeout:(id)a3;
@end

@implementation IDSSessionEmbeddedControllerBase

- (IDSSessionEmbeddedControllerBase)init
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 206, "-[IDSSessionEmbeddedControllerBase init]", 7, 0, "init called");
  v10.receiver = self;
  v10.super_class = (Class)IDSSessionEmbeddedControllerBase;
  v3 = [(IDSSessionEmbeddedControllerBase *)&v10 init];
  if (v3)
  {
    v4 = +[NSUUID UUID];
    v5 = [v4 UUIDString];
    [(IDSSessionEmbeddedControllerBase *)v3 setUniqueID:v5];

    [(IDSSessionEmbeddedControllerBase *)v3 setDirection:0];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    stopCallIDSemaphore = v3->_stopCallIDSemaphore;
    v3->_stopCallIDSemaphore = (OS_dispatch_semaphore *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    [(IDSSessionEmbeddedControllerBase *)v3 setVsSemaphore:v8];
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "new idssessioncontroller created %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 216, "-[IDSSessionEmbeddedControllerBase init]", 7, 0, "new idssessioncontroller created %p", v3);
  return v3;
}

- (void)dealloc
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dealloc called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 222, "-[IDSSessionEmbeddedControllerBase dealloc]", 7, 0, "dealloc called");
  stopCallIDSemaphore = self->_stopCallIDSemaphore;
  if (stopCallIDSemaphore)
  {
    self->_stopCallIDSemaphore = 0;
  }
  [(IDSSessionEmbeddedControllerBase *)self setVsSemaphore:0];
  [(IDSSessionEmbeddedControllerBase *)self setDatagramConnection:0];
  [(IDSSessionEmbeddedControllerBase *)self setDatagramConnectionManager:0];
  [(IDSSessionEmbeddedControllerBase *)self setVnc:0];
  [(IDSSessionEmbeddedControllerBase *)self setIdsSession:0];
  [(IDSSessionEmbeddedControllerBase *)self setAvConference:0];
  [(IDSSessionEmbeddedControllerBase *)self setInviterID:0];
  [(IDSSessionEmbeddedControllerBase *)self setNotificationStartTime:0];
  v4 = [(IDSSessionEmbeddedControllerBase *)self notificationTimeoutTimer];
  [v4 invalidate];

  [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:0];
  [(IDSSessionEmbeddedControllerBase *)self setUniqueID:0];
  [(IDSSessionEmbeddedControllerBase *)self setRemoteAVConferenceInviteDictionary:0];
  [(IDSSessionEmbeddedControllerBase *)self setIdsServiceController:0];
  [(IDSSessionEmbeddedControllerBase *)self setSessionID:0];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "done with dealloc", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 244, "-[IDSSessionEmbeddedControllerBase dealloc]", 7, 0, "done with dealloc");
  v5.receiver = self;
  v5.super_class = (Class)IDSSessionEmbeddedControllerBase;
  [(IDSSessionEmbeddedControllerBase *)&v5 dealloc];
}

- (IDSSessionEmbeddedControllerBase)initWithRemoteID:(id)a3 session:(id)a4 direction:(int64_t)a5 inviteDictionary:(id)a6 andServiceController:(id)a7 autoAcceptInvite:(BOOL)a8 startOutPaused:(BOOL)a9 appleName:(id)a10
{
  BOOL v10 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  v19 = [(IDSSessionEmbeddedControllerBase *)self init];
  if (v19)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v16 sessionID];
      *(_DWORD *)buf = 136315138;
      id v27 = [v20 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init with remoteid  %s", buf, 0xCu);
    }
    id v21 = [v16 sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 264, "-[IDSSessionEmbeddedControllerBase initWithRemoteID:session:direction:inviteDictionary:andServiceController:autoAcceptInvite:startOutPaused:appleName:]", 7, 0, "init with remoteid  %s", (const char *)[v21 UTF8String]);

    [(IDSSessionEmbeddedControllerBase *)v19 setInviterID:v15];
    [(IDSSessionEmbeddedControllerBase *)v19 setIdsSession:v16];
    v22 = [(IDSSessionEmbeddedControllerBase *)v19 idsSession];
    [v22 setDelegate:v19 queue:&_dispatch_main_q];

    v23 = [v16 sessionID];
    [(IDSSessionEmbeddedControllerBase *)v19 setSessionID:v23];

    v24 = [(IDSSessionEmbeddedControllerBase *)v19 idsSession];
    [v24 setInvitationTimeOut:25];

    [(IDSSessionEmbeddedControllerBase *)v19 setIdsServiceController:v18];
    [(IDSSessionEmbeddedControllerBase *)v19 setRemoteAVConferenceInviteDictionary:v17];
    [(IDSSessionEmbeddedControllerBase *)v19 setInviterKind:0];
    [(IDSSessionEmbeddedControllerBase *)v19 setStartOutPaused:a9];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "autoAcceptInvitationFlag %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 294, "-[IDSSessionEmbeddedControllerBase initWithRemoteID:session:direction:inviteDictionary:andServiceController:autoAcceptInvite:startOutPaused:appleName:]", 7, 0, "autoAcceptInvitationFlag %d", v10);
    [(IDSSessionEmbeddedControllerBase *)v19 setAutoAcceptInvitation:v10];
    if (v10) {
      [(IDSSessionEmbeddedControllerBase *)v19 doAcceptIDSInvitation];
    }
    else {
      [(IDSSessionEmbeddedControllerBase *)v19 postInvitationNotification];
    }
  }

  return v19;
}

- (void)addNotificationIconTo:(__CFDictionary *)a3
{
  objc_super v5 = [(IDSSessionEmbeddedControllerBase *)self inviterIconPath];
  if (v5)
  {
    CFURLRef v6 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v5, kCFURLPOSIXPathStyle, 0);
    if (v6)
    {
      CFURLRef v7 = v6;
      CFDictionaryAddValue(a3, kCFUserNotificationIconURLKey, v6);
      CFRelease(v7);
    }
    dispatch_semaphore_t v8 = [(IDSSessionEmbeddedControllerBase *)self inviterIconPath];
    CFDictionaryAddValue(a3, @"SBUserNotificationIconImagePath", v8);
  }
  else
  {
    if (sub_100035448())
    {
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v9) {
        sub_100036A88(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 343, "-[IDSSessionEmbeddedControllerBase addNotificationIconTo:]", 3, 0, "inviterIconPath is nil, did a subclass override the method?");
  }
}

- (void)termsAndConditionsResult:(id)a3
{
  id v3 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "termsAndConditionsResult not implemented", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 360, "-[IDSSessionEmbeddedControllerBase termsAndConditionsResult:]", 3, 0, "termsAndConditionsResult not implemented");
  exit(1);
}

- (void)postInvitationNotification
{
  SInt32 error = 0;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v4 = [v3 sessionID];
    *(_DWORD *)buf = 136315138;
    v33 = (IDSSessionEmbeddedControllerBase *)[v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postInvitationNotification for %s", buf, 0xCu);
  }
  objc_super v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v6 = [v5 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 372, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "postInvitationNotification for %s", (const char *)[v6 UTF8String]);

  if (qword_10005C920 != -1) {
    dispatch_once(&qword_10005C920, &stru_100054D50);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  dispatch_semaphore_t v8 = +[NSBundle mainBundle];
  BOOL v9 = [v8 localizedStringForKey:@"kSSShareYourScreen" value:&stru_1000553F0 table:0];
  uint64_t v10 = [(IDSSessionEmbeddedControllerBase *)self inviterID];
  uint64_t v11 = [v10 stringWithSchemeTrimmed];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);

  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v12);
  CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v12);
  uint64_t v13 = (const void *)SBUserNotificationLockScreenAlertHeaderKey;
  uint64_t v14 = [(IDSSessionEmbeddedControllerBase *)self inviterID];
  uint64_t v15 = [v14 stringWithSchemeTrimmed];
  CFDictionaryAddValue(Mutable, v13, v15);

  uint64_t v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"kSSTapAccept" value:&stru_1000553F0 table:0];
  id v18 = [(IDSSessionEmbeddedControllerBase *)self inviterFullName];
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);

  if (v19)
  {
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v19);
  }
  id v20 = +[NSBundle mainBundle];
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, [v20 localizedStringForKey:@"kSSDecline" value:&stru_1000553F0 table:0]);

  id v21 = +[NSBundle mainBundle];
  CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, [v21 localizedStringForKey:@"kSSAccept" value:&stru_1000553F0 table:0]);

  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  [(IDSSessionEmbeddedControllerBase *)self setInvitationNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
  CFRelease(Mutable);
  v22 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
  BOOL v23 = sub_100035448();
  if (v22)
  {
    if (v23 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = error;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 408, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "got error %d", error);
    RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSSessionEmbeddedControllerBase *)self invitationNotification], (CFUserNotificationCallBack)sub_10001DEEC, 0);
    BOOL v25 = sub_100035448();
    if (RunLoopSource)
    {
      if (v25 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v33 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "adding self %p to pending notifications", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 418, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "adding self %p to pending notifications", self);
      [(id)qword_10005C970 addObject:self];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (IDSSessionEmbeddedControllerBase *)[(id)qword_10005C970 count];
        *(_DWORD *)buf = 134217984;
        v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[gPendingUserNotifications count %lu", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 420, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "[gPendingUserNotifications count %lu", [(id)qword_10005C970 count]);
      id v27 = +[NSDate date];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationStartTime:v27];

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
      v29 = +[NSTimer scheduledTimerWithTimeInterval:self target:"userNotificationTimeout:" selector:0 userInfo:0 repeats:28.0];
      [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:v29];

      v30 = RunLoopSource;
    }
    else
    {
      if (v25 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 413, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "Failed to create run loop source for notification");
      v30 = [(IDSSessionEmbeddedControllerBase *)self invitationNotification];
    }
    CFRelease(v30);
  }
  else
  {
    if (v23 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 405, "-[IDSSessionEmbeddedControllerBase postInvitationNotification]", 7, 0, "failed to create notification");
  }
}

- (void)userNotificationTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification timeout", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 434, "-[IDSSessionEmbeddedControllerBase userNotificationTimeout:]", 7, 0, "notification timeout");
  [(IDSSessionEmbeddedControllerBase *)self removeUserNotification];
}

- (void)removeUserNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 440, "-[IDSSessionEmbeddedControllerBase removeUserNotification]", 7, 0, "remove notification called");
  if ([(IDSSessionEmbeddedControllerBase *)self invitationNotification])
  {
    [(IDSSessionEmbeddedControllerBase *)self setNotificationTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSSessionEmbeddedControllerBase *)self invitationNotification]);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 445, "-[IDSSessionEmbeddedControllerBase removeUserNotification]", 7, 0, "cancel err = %d", v3);
    [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:0];
  }
}

- (BOOL)shouldShowDisconnectionUI
{
  v2 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  SInt32 v3 = [v2 activeSessions];
  BOOL v4 = [v3 count] == (id)1;

  return v4;
}

- (void)doAcceptIDSInvitation
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    SInt32 v3 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v4 = [v3 sessionID];
    *(_DWORD *)buf = 136315138;
    id v10 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "@@Called [IDSSession doAcceptIDSInvitation] for %s", buf, 0xCu);
  }
  SInt32 v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v6 = [v5 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 461, "-[IDSSessionEmbeddedControllerBase doAcceptIDSInvitation]", 7, 0, "@@Called [IDSSession doAcceptIDSInvitation] for %s", (const char *)[v6 UTF8String]);

  [(IDSSessionEmbeddedControllerBase *)self setAppleIDInviteWasAcceptedOrDeclined:1];
  [(IDSSessionEmbeddedControllerBase *)self doAcceptIDSInvitationWithAVConferenceInfo];
  [(IDSSessionEmbeddedControllerBase *)self setTermsAccepted:0];
  CFURLRef v7 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FC30;
  block[3] = &unk_100054BB8;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)userFinishedTermsAndConditions:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  BOOL v5 = sub_100035448();
  if (v4)
  {
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
      id v7 = [v6 sessionID];
      *(_DWORD *)buf = 136315138;
      id v20 = [v7 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accepted terms and conditions for %s", buf, 0xCu);
    }
    dispatch_semaphore_t v8 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v9 = [v8 sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 478, "-[IDSSessionEmbeddedControllerBase userFinishedTermsAndConditions:]", 7, 0, "accepted terms and conditions for %s", (const char *)[v9 UTF8String]);

    [(IDSSessionEmbeddedControllerBase *)self setTermsAccepted:1];
    if ([(IDSSessionEmbeddedControllerBase *)self sessionStartDelegateWasCalled])
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
        id v11 = [v10 sessionID];
        id v12 = [v11 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionstart delegate was already called.  Start sending screen for %s", buf, 0xCu);
      }
      uint64_t v13 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
      id v14 = [v13 sessionID];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 484, "-[IDSSessionEmbeddedControllerBase userFinishedTermsAndConditions:]", 7, 0, "sessionstart delegate was already called.  Start sending screen for %s", (const char *)[v14 UTF8String]);

      [(IDSSessionEmbeddedControllerBase *)self startSendingTheScreen];
    }
  }
  else
  {
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
      id v16 = [v15 sessionID];
      *(_DWORD *)buf = 136315138;
      id v20 = [v16 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "declined terms.  endsession  %s", buf, 0xCu);
    }
    id v17 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v18 = [v17 sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 490, "-[IDSSessionEmbeddedControllerBase userFinishedTermsAndConditions:]", 7, 0, "declined terms.  endsession  %s", (const char *)[v18 UTF8String]);

    [(IDSSessionEmbeddedControllerBase *)self doDeclineIDSInvitationWithReasonString:@"UserDeclined"];
  }
}

- (void)doDeclineIDSInvitationWithReasonString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (const char *)[v4 UTF8String];
  id v6 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v7 = [v6 sessionID];
  sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 499, "-[IDSSessionEmbeddedControllerBase doDeclineIDSInvitationWithReasonString:]", 7, 0, "doDeclineIDSInvitationWithReasonString: %s for %s", v5, (const char *)[v7 UTF8String]);

  [(IDSSessionEmbeddedControllerBase *)self setAppleIDInviteWasAcceptedOrDeclined:1];
  CFStringRef v12 = @"REASON";
  id v13 = v4;
  dispatch_semaphore_t v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  id v9 = sub_10001E72C((uint64_t)v8);

  id v10 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  [v10 declineInvitationWithData:v9];

  [(IDSSessionEmbeddedControllerBase *)self setIdsSessionState:5];
  id v11 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  [v11 removeSession:self andEndIDSSession:0];
}

- (void)doAcceptIDSInvitationWithAVConferenceInfo
{
  [(IDSSessionEmbeddedControllerBase *)self initAVConference];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    SInt32 v3 = [(IDSSessionEmbeddedControllerBase *)self remoteAVConferenceInviteDictionary];
    id v4 = [v3 description];
    *(_DWORD *)buf = 136315138;
    id v15 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remote dict %s", buf, 0xCu);
  }
  BOOL v5 = [(IDSSessionEmbeddedControllerBase *)self remoteAVConferenceInviteDictionary];
  id v6 = [v5 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 512, "-[IDSSessionEmbeddedControllerBase doAcceptIDSInvitationWithAVConferenceInfo]", 7, 0, "remote dict %s", (const char *)[v6 UTF8String]);

  id v7 = [(IDSSessionEmbeddedControllerBase *)self remoteAVConferenceInviteDictionary];
  dispatch_semaphore_t v8 = [(IDSSessionEmbeddedControllerBase *)self inviteDictionaryForRemoteInviteDictionary:v7];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v8 description];
    id v10 = [v9 UTF8String];
    *(_DWORD *)buf = 134218242;
    id v15 = v8;
    __int16 v16 = 2080;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got acceptDictionary %p %s", buf, 0x16u);
  }
  id v11 = [v8 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 515, "-[IDSSessionEmbeddedControllerBase doAcceptIDSInvitationWithAVConferenceInfo]", 7, 0, "got acceptDictionary %p %s", v8, (const char *)[v11 UTF8String]);

  CFStringRef v12 = [(IDSSessionEmbeddedControllerBase *)self dataForInviteDictionary:v8];
  id v13 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  [v13 acceptInvitationWithData:v12];
}

- (void)doEndSession
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    dispatch_semaphore_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "doEndSession %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 524, "-[IDSSessionEmbeddedControllerBase doEndSession]", 7, 0, "doEndSession %p", self);
  [(IDSSessionEmbeddedControllerBase *)self setStoppingSession:1];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    id v4 = (IDSSessionEmbeddedControllerBase *)[v3 UTF8String];
    *(_DWORD *)buf = 136315138;
    dispatch_semaphore_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "called endSessionWithData for %s", buf, 0xCu);
  }
  id v5 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 527, "-[IDSSessionEmbeddedControllerBase doEndSession]", 7, 0, "called endSessionWithData for %s", (const char *)[v5 UTF8String]);

  id v6 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  [v6 endSessionWithData:0];

  [(IDSSessionEmbeddedControllerBase *)self cleanupSession];
}

- (BOOL)termsAndConditionsAccepted
{
  return 1;
}

- (void)shouldStartScreenSharingSession
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v4 = [v3 sessionID];
    *(_DWORD *)buf = 136315138;
    id v9 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "@@shouldstartscreensharingsession called for %s", buf, 0xCu);
  }
  id v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v6 = [v5 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 542, "-[IDSSessionEmbeddedControllerBase shouldStartScreenSharingSession]", 7, 0, "@@shouldstartscreensharingsession called for %s", (const char *)[v6 UTF8String]);

  [(IDSSessionEmbeddedControllerBase *)self setTermsAccepted:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000206CC;
  block[3] = &unk_100054BB8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startSendingTheScreen
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "startSendingTheScreen", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 553, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "startSendingTheScreen");
  [(IDSSessionEmbeddedControllerBase *)self setIdsSessionState:3];
  uint64_t v3 = [(IDSSessionEmbeddedControllerBase *)self allowsAudioChat] ^ 1;
  id v4 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  [v4 setIsMuted:v3];

  id v5 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
  id v6 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v7 = [v6 destination];
  dispatch_semaphore_t v8 = [v5 datagramConnectionFromIDS:v7];
  [(IDSSessionEmbeddedControllerBase *)self setDatagramConnection:v8];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSSessionEmbeddedControllerBase *)self datagramConnection];
    *(_DWORD *)buf = 134217984;
    id v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got datagramConnection %p", buf, 0xCu);
  }
  id v10 = [(IDSSessionEmbeddedControllerBase *)self datagramConnection];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 561, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "got datagramConnection %p", v10);

  id v11 = [(IDSSessionEmbeddedControllerBase *)self datagramConnection];

  if (v11)
  {
    CFStringRef v12 = [NWConnectionManager alloc];
    id v13 = [(IDSSessionEmbeddedControllerBase *)self datagramConnection];
    id v14 = [(NWConnectionManager *)v12 initWithNWConnection:v13];
    [(IDSSessionEmbeddedControllerBase *)self setDatagramConnectionManager:v14];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
      id v16 = [v15 stateString];
      id v17 = [v16 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v47 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "current state of connection %s", buf, 0xCu);
    }
    id v18 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
    id v19 = [v18 stateString];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 569, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "current state of connection %s", (const char *)[v19 UTF8String]);

    id v20 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
    [v20 waitForConnection:10000];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
      id v22 = [v21 stateString];
      id v23 = [v22 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v47 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "current state of connection %s", buf, 0xCu);
    }
    v24 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
    id v25 = [v24 stateString];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 571, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "current state of connection %s", (const char *)[v25 UTF8String]);

    v26 = [(IDSSessionEmbeddedControllerBase *)self datagramConnection];
    id v27 = [v26 connectionState];

    if (v27 == (id)3)
    {
      v28 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
      [v28 addActiveSession:self];

      v29 = [(IDSSessionEmbeddedControllerBase *)self remoteAVConferenceInviteDictionary];
      [(IDSSessionEmbeddedControllerBase *)self startAVConferenceCallWithRemoteDictionary:v29];

      [(IDSSessionEmbeddedControllerBase *)self setRemoteAVConferenceInviteDictionary:0];
      v30 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
      [v30 createStatusBar];

      v31 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
      [v31 createLockScreenNotifier];

      LODWORD(v31) = [(IDSSessionEmbeddedControllerBase *)self startOutPaused];
      BOOL v32 = sub_100035448();
      if (v31)
      {
        if (v32 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "want to start out paused", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 590, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "want to start out paused");
        avConference = self->_avConference;
        int64_t callID = self->_callID;
        uint64_t v45 = 0;
        if ([(AVConference *)avConference setPauseVideo:1 callID:callID error:&v45])
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "video should be paused", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 595, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "video should be paused");
        }
      }
      else
      {
        if (v32 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "not paused at start", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 598, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "not paused at start");
      }
      v40 = objc_alloc_init(VNCServer);
      [(IDSSessionEmbeddedControllerBase *)self setVnc:v40];

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [(IDSSessionEmbeddedControllerBase *)self vnc];
        *(_DWORD *)buf = 134217984;
        id v47 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "allocate screen sharing session %p", buf, 0xCu);
      }
      v42 = [(IDSSessionEmbeddedControllerBase *)self vnc];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 602, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 7, 0, "allocate screen sharing session %p", v42);

      v43 = [(IDSSessionEmbeddedControllerBase *)self vnc];
      v44 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
      [v43 startScreenSharingSession:1 NWConnectionManager:v44 sessionController:self];

      v38 = [(IDSSessionEmbeddedControllerBase *)self vnc];
      [v38 termsAndConditionsAccepted];
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
        id v36 = [v35 stateString];
        id v37 = [v36 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v47 = v37;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to init connection state %s", buf, 0xCu);
      }
      v38 = [(IDSSessionEmbeddedControllerBase *)self datagramConnectionManager];
      id v39 = [v38 stateString];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 574, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 5, 0, "unable to init connection state %s", (const char *)[v39 UTF8String]);
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to get datagram connection", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 564, "-[IDSSessionEmbeddedControllerBase startSendingTheScreen]", 5, 0, "unable to get datagram connection");
  }
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v6 = a4;
  id v7 = sub_10001E658((uint64_t)a5);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (sub_100035448())
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_100036AC4(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 622, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationAcceptFromID:withData:]", 3, 0, "receivedInvitationAcceptFromID with invalid dictionary - ignoring ");
  }
  else
  {
    dispatch_semaphore_t v8 = (const char *)[v6 UTF8String];
    id v9 = [v7 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 627, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationAcceptFromID:withData:]", 7, 0, "receivedInvitationAcceptFromID fromID:%s data:%s", v8, (const char *)[v9 UTF8String]);
  }
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v6 = a4;
  id v7 = sub_10001E658((uint64_t)a5);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (sub_100035448())
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_100036B00(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 641, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationDeclineFromID:withData:]", 3, 0, "receivedInvitationDeclineFromID with invalid dictionary - ignoring ");
  }
  else
  {
    dispatch_semaphore_t v8 = (const char *)[v6 UTF8String];
    id v9 = [v7 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 646, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationDeclineFromID:withData:]", 7, 0, "receivedInvitationDeclineFromID fromID:%s data:%s", v8, (const char *)[v9 UTF8String]);
  }
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v6 = a4;
  id v7 = sub_10001E658((uint64_t)a5);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (sub_100035448())
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_100036B3C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 668, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationCancelFromID:withData:]", 3, 0, "receivedInvitationCancelFromID with invalid dictionary - ignoring ");
  }
  else
  {
    dispatch_semaphore_t v8 = (const char *)[v6 UTF8String];
    id v9 = [v7 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 672, "-[IDSSessionEmbeddedControllerBase session:receivedInvitationCancelFromID:withData:]", 7, 0, "receivedInvitationCancelFromID fromID:%s data:%s", v8, (const char *)[v9 UTF8String]);
  }
}

- (void)session:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v6 = a4;
  id v7 = sub_10001E658((uint64_t)a5);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (sub_100035448())
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_100036B78(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 681, "-[IDSSessionEmbeddedControllerBase session:receivedSessionMessageFromID:withData:]", 3, 0, "receivedSessionMessageFromID with invalid dictionary - ignoring ");
  }
  else
  {
    dispatch_semaphore_t v8 = (const char *)[v6 UTF8String];
    id v9 = [v7 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 685, "-[IDSSessionEmbeddedControllerBase session:receivedSessionMessageFromID:withData:]", 7, 0, "receivedSessionMessageFromID fromID:%s data:%s", v8, (const char *)[v9 UTF8String]);
  }
}

- (void)sessionStarted:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    unsigned int v6 = [v5 socket];
    id v7 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v8 = [v7 sessionID];
    *(_DWORD *)buf = 67109378;
    unsigned int v22 = v6;
    __int16 v23 = 2080;
    id v24 = [v8 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionStarted session socket is %d  session is %s", buf, 0x12u);
  }
  id v9 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  unsigned int v10 = [v9 socket];
  uint64_t v11 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v12 = [v11 sessionID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 692, "-[IDSSessionEmbeddedControllerBase sessionStarted:]", 7, 0, "sessionStarted session socket is %d  session is %s", v10, (const char *)[v12 UTF8String]);

  uint64_t v13 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
  id v14 = [v13 destination];
  sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 694, "-[IDSSessionEmbeddedControllerBase sessionStarted:]", 7, 0, "destination string %s", (const char *)[v14 UTF8String]);

  [(IDSSessionEmbeddedControllerBase *)self setSessionStartDelegateWasCalled:1];
  if (a3
    && ([(IDSSessionEmbeddedControllerBase *)self idsSession],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v15 destination],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session is valid", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 706, "-[IDSSessionEmbeddedControllerBase sessionStarted:]", 7, 0, "session is valid");
    if ([(IDSSessionEmbeddedControllerBase *)self termsAccepted])
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms were already accepted", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 739, "-[IDSSessionEmbeddedControllerBase sessionStarted:]", 7, 0, "terms were already accepted");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021940;
      block[3] = &unk_100054BB8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    id v17 = [(IDSSessionEmbeddedControllerBase *)self description];
    id v18 = (const char *)[v17 UTF8String];
    id v19 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 748, "-[IDSSessionEmbeddedControllerBase sessionStarted:]", 5, 0, "sessionStarted bad session: session=%s, socket=%d", v18, [v19 socket]);
  }
}

- (void)session:(id)a3 receivedSessionEndFromID:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = sub_10001E658((uint64_t)a5);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (sub_100035448())
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_100036BB4(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 764, "-[IDSSessionEmbeddedControllerBase session:receivedSessionEndFromID:withData:]", 3, 0, "receivedSessionEndFromID with invalid dictionary - ignoring ");
  }
  else
  {
    uint64_t v11 = (const char *)[v9 UTF8String];
    id v12 = [v10 description];
    uint64_t v13 = (const char *)[v12 UTF8String];
    id v14 = [v8 sessionID];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 768, "-[IDSSessionEmbeddedControllerBase session:receivedSessionEndFromID:withData:]", 7, 0, "SESSION END receivedSessionEndFromID %s data: %s for session %s", v11, v13, (const char *)[v14 UTF8String]);
  }
  [(IDSSessionEmbeddedControllerBase *)self cleanupSession];
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = [a3 sessionID];
  unsigned int v10 = (const char *)[v9 UTF8String];
  uint64_t v11 = [v8 description];

  id v12 = v11;
  sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 776, "-[IDSSessionEmbeddedControllerBase sessionEnded:withReason:error:]", 7, 0, "SESSION END sessionEnded:session %s withReason:%d error:%s", v10, a4, (const char *)[v12 UTF8String]);

  [(IDSSessionEmbeddedControllerBase *)self cleanupSession];
}

- (void)cleanupSession
{
  unsigned __int8 v3 = [(IDSSessionEmbeddedControllerBase *)self handledSessionEnd];
  BOOL v4 = sub_100035448();
  if (v3)
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session already handled", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 818, "-[IDSSessionEmbeddedControllerBase cleanupSession]", 7, 0, "session already handled");
  }
  else
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
      *(_DWORD *)buf = 136315138;
      id v20 = [v5 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cleanup session %s", buf, 0xCu);
    }
    id v6 = [(IDSSessionEmbeddedControllerBase *)self sessionID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 784, "-[IDSSessionEmbeddedControllerBase cleanupSession]", 7, 0, "cleanup session %s", (const char *)[v6 UTF8String]);

    [(IDSSessionEmbeddedControllerBase *)self setHandledSessionEnd:1];
    id v7 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    [v7 setDelegate:0 queue:0];

    [(IDSSessionEmbeddedControllerBase *)self removeUserNotification];
    id v8 = [(IDSSessionEmbeddedControllerBase *)self vnc];

    if (v8)
    {
      id v9 = [(IDSSessionEmbeddedControllerBase *)self vnc];
      [v9 stopUDPSend];
    }
    unsigned int v10 = [(IDSSessionEmbeddedControllerBase *)self avConference];

    if (v10)
    {
      uint64_t v11 = [(IDSSessionEmbeddedControllerBase *)self avConference];
      [v11 stopCallID:self->_callID];

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to wait for semaphore", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 798, "-[IDSSessionEmbeddedControllerBase cleanupSession]", 7, 0, "going to wait for semaphore");
      stopCallIDSemaphore = self->_stopCallIDSemaphore;
      dispatch_time_t v13 = dispatch_time(0, 1000000000);
      intptr_t v14 = dispatch_semaphore_wait((dispatch_semaphore_t)stopCallIDSemaphore, v13);
      BOOL v15 = sub_100035448();
      if (v14)
      {
        if (v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "callid timeout", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 801, "-[IDSSessionEmbeddedControllerBase cleanupSession]", 7, 0, "callid timeout");
      }
      else
      {
        if (v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "semaphore did not time out", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 804, "-[IDSSessionEmbeddedControllerBase cleanupSession]", 7, 0, "semaphore did not time out");
      }
      uint64_t v16 = [(IDSSessionEmbeddedControllerBase *)self avConference];
      [v16 setDelegate:0];

      [(IDSSessionEmbeddedControllerBase *)self setAvConference:0];
    }
    uint64_t v17 = [(IDSSessionEmbeddedControllerBase *)self notificationTimeoutTimer];
    [v17 invalidate];

    [(IDSSessionEmbeddedControllerBase *)self setNotificationTimeoutTimer:0];
    [(IDSSessionEmbeddedControllerBase *)self setIdsSessionState:6];
    uint64_t v18 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    [v18 removeSession:self andEndIDSSession:0];
  }
}

- (void)initAVConference
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initializing AVConference", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 825, "-[IDSSessionEmbeddedControllerBase initAVConference]", 7, 0, "Initializing AVConference");
  id v3 = [objc_alloc((Class)AVConference) initWithClientUUID:0 transportType:1];
  [(IDSSessionEmbeddedControllerBase *)self setAvConference:v3];

  avConference = self->_avConference;
  if (avConference)
  {
    [(AVConference *)avConference setDelegate:self];
    [(AVConference *)self->_avConference setRequiresWifi:0];
    [(AVConference *)self->_avConference setShouldDisplayNetworkQualityGraph:0];
    self->_int64_t callID = (int64_t)[(AVConference *)self->_avConference initializeNewCallWithDeviceRole:5];
    id v5 = +[VCCapabilities screenSharingVCCapabilities];
    [v5 setDeviceRole:5];
    id v6 = [(AVConference *)self->_avConference capabilitiesForCallID:self->_callID];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [v6 isVideoPausedToStart];
      *(_DWORD *)buf = 67109120;
      unsigned int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "at init isVideoPausedToStart %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 841, "-[IDSSessionEmbeddedControllerBase initAVConference]", 7, 0, "at init isVideoPausedToStart %d", [v6 isVideoPausedToStart]);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: Unable to init AVConference class.", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 846, "-[IDSSessionEmbeddedControllerBase initAVConference]", 7, 0, "ERROR: Unable to init AVConference class.");
  }
}

- (void)startAVConferenceCallWithRemoteDictionary:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "startAVConferenceCallWithRemoteDictionary", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 852, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "startAVConferenceCallWithRemoteDictionary");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init capabilities", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 854, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "init capabilities");
  id v5 = +[VCCapabilities screenSharingVCCapabilities];
  [v5 setDeviceRole:5];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v5 isVideoSourceScreen];
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "video source screen %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 859, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "video source screen %d", [v5 isVideoSourceScreen]);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v5 requiresWifi];
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "requiresWifi %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 860, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "requiresWifi %d", [v5 requiresWifi]);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 isVideoPausedToStart];
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "isVideoPausedToStart %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 861, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "isVideoPausedToStart %d", [v5 isVideoPausedToStart]);
  if (v4)
  {
    avConference = self->_avConference;
    int64_t callID = self->_callID;
    uint64_t v11 = [(IDSSessionEmbeddedControllerBase *)self idsSession];
    id v12 = [v11 destination];
    id v16 = 0;
    LOBYTE(avConference) = [(AVConference *)avConference startConnectionWithCallID:callID inviteData:v4 isCaller:0 capabilities:v5 destination:v12 error:&v16];
    id v13 = v16;

    BOOL v14 = sub_100035448();
    if (avConference)
    {
      if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start call ok", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 882, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "start call ok");
    }
    else
    {
      if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "startCallSuccess FAILED", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 878, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "startCallSuccess FAILED");
      id v15 = [v13 localizedDescription];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 879, "-[IDSSessionEmbeddedControllerBase startAVConferenceCallWithRemoteDictionary:]", 7, 0, "error string %s", (const char *)[v15 UTF8String]);
    }
  }
}

- (id)inviteDictionaryForRemoteInviteDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100022A10;
  __int16 v23 = sub_100022A20;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100022A10;
  v17[4] = sub_100022A20;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int64_t callID = self->_callID;
    *(_DWORD *)buf = 134217984;
    int64_t v26 = callID;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trying to get invite dictionary %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 895, "-[IDSSessionEmbeddedControllerBase inviteDictionaryForRemoteInviteDictionary:]", 7, 0, "trying to get invite dictionary %ld", self->_callID);
  avConference = self->_avConference;
  int64_t v8 = self->_callID;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022A28;
  v13[3] = &unk_100054D78;
  id v15 = &v19;
  id v16 = v17;
  unsigned int v9 = v5;
  BOOL v14 = v9;
  unsigned int v10 = dispatch_get_global_queue(0, 0);
  [(AVConference *)avConference inviteDictionaryForCallID:v8 remoteInviteDictionary:v4 nonCellularCandidateTimeout:v13 block:v10 queue:0.0];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "woke up", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 909, "-[IDSSessionEmbeddedControllerBase inviteDictionaryForRemoteInviteDictionary:]", 7, 0, "woke up");
  id v11 = (id)v20[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (id)dataForInviteDictionary:(id)a3
{
  id v3 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dataForInviteDictionary", (uint8_t *)&buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 915, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 7, 0, "dataForInviteDictionary");
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 description];
    id v6 = [v5 UTF8String];
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*move data blob inDictionary %s", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [v3 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 919, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 7, 0, "*move data blob inDictionary %s", (const char *)[v7 UTF8String]);

  uint64_t v8 = AVConferenceInviteDataCallInfoBlob;
  unsigned int v9 = [v3 objectForKey:AVConferenceInviteDataCallInfoBlob];

  if (v9)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "has AVConferenceInviteDataCallInfoBlob", (uint8_t *)&buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 922, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 7, 0, "has AVConferenceInviteDataCallInfoBlob");
    unsigned int v10 = [v3 objectForKey:v8];
    [v4 setObject:v10 forKeyedSubscript:v8];
  }
  uint64_t v11 = AVConferenceInviteDataMediaBlob;
  id v12 = [v3 objectForKey:AVConferenceInviteDataMediaBlob];

  if (v12)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "has AVConferenceInviteDataMediaBlob", (uint8_t *)&buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 927, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 7, 0, "has AVConferenceInviteDataMediaBlob");
    id v13 = [v3 objectForKey:v11];
    [v4 setObject:v13 forKeyedSubscript:v11];
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v4 forKeyedSubscript:@"avconferenceAccept"];
  long long buf = 0uLL;
  uint64_t v33 = 0;
  id v15 = +[NSProcessInfo processInfo];
  id v16 = v15;
  if (v15)
  {
    [v15 operatingSystemVersion];
  }
  else
  {
    long long buf = 0uLL;
    uint64_t v33 = 0;
  }

  uint64_t v17 = (buf << 16) | (BYTE8(buf) << 8) | v33;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v30 = 67109120;
    int v31 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "osvers %x", v30, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 937, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 7, 0, "osvers %x", v17);
  id v18 = +[NSNumber numberWithUnsignedInt:v17];
  [v14 setObject:v18 forKeyedSubscript:@"osVersion"];

  [v14 setObject:@"iOS" forKeyedSubscript:@"osType"];
  uint64_t v29 = 0;
  uint64_t v19 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:&v29];
  if (v29)
  {
    if (sub_100035448())
    {
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20) {
        sub_100036BF0(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 947, "-[IDSSessionEmbeddedControllerBase dataForInviteDictionary:]", 3, 0, "could not serialize dictionary");
  }

  return v19;
}

- (BOOL)pauseVideoSending:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pause video %d", buf, 8u);
  }
  BOOL v5 = v3;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 957, "-[IDSSessionEmbeddedControllerBase pauseVideoSending:]", 7, 0, "pause video %d", v3);
  avConference = self->_avConference;
  int64_t callID = self->_callID;
  id v13 = 0;
  unsigned int v8 = [(AVConference *)avConference setPauseVideo:v3 callID:callID error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = [(IDSSessionEmbeddedControllerBase *)self vnc];
    [v10 sendPauseMessage:v5];
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_avConference;
      *(_DWORD *)long long buf = 134217984;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed %p", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 967, "-[IDSSessionEmbeddedControllerBase pauseVideoSending:]", 7, 0, "failed %p", self->_avConference);
    id v10 = [v9 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 968, "-[IDSSessionEmbeddedControllerBase pauseVideoSending:]", 5, 0, "error %s", (const char *)[v10 UTF8String]);
  }

  return v8;
}

- (void)sendScreenLockChangeMessage:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send lock change message", v6, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 977, "-[IDSSessionEmbeddedControllerBase sendScreenLockChangeMessage:]", 7, 0, "send lock change message");
  BOOL v5 = [(IDSSessionEmbeddedControllerBase *)self vnc];
  [v5 sendScreenLockChangeMessage:v3];
}

- (NSString)inviterFullName
{
  return (NSString *)[(IDSSessionEmbeddedControllerBase *)self inviterIDForDisplay];
}

- (NSString)inviterIconPath
{
  if ([(IDSSessionEmbeddedControllerBase *)self inviterKind] == 2) {
    return (NSString *)@"/System/Library/CoreServices/ScreenSharingServer.app/AppleCare.png";
  }
  else {
    return (NSString *)@"/System/Library/CoreServices/ScreenSharingServer.app/AppleSupport.png";
  }
}

- (id)inviterIDForDisplay
{
  v2 = [(IDSSessionEmbeddedControllerBase *)self inviterID];
  BOOL v3 = [v2 stringWithSchemeTrimmed];

  return v3;
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remoteMediaStalled delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1012, "-[IDSSessionEmbeddedControllerBase conference:withCallID:remoteMediaStalled:]", 7, 0, "remoteMediaStalled delegate called");
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didStartSession delegate called for session %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1016, "-[IDSSessionEmbeddedControllerBase conference:didStartSession:withUserInfo:]", 7, 0, "didStartSession delegate called for session %p", self);
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  id v6 = a5;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v6 description];
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = (IDSSessionEmbeddedControllerBase *)[v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AVConference didStopWithCallID delegate called %s", buf, 0xCu);
  }
  id v8 = [v6 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1022, "-[IDSSessionEmbeddedControllerBase conference:didStopWithCallID:error:]", 7, 0, "AVConference didStopWithCallID delegate called %s", (const char *)[v8 UTF8String]);

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop session %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1023, "-[IDSSessionEmbeddedControllerBase conference:didStopWithCallID:error:]", 7, 0, "stop session %p", self);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    stopCallIDSemaphore = self->_stopCallIDSemaphore;
    *(_DWORD *)long long buf = 134217984;
    uint64_t v11 = (IDSSessionEmbeddedControllerBase *)stopCallIDSemaphore;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to signal semaphore %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1024, "-[IDSSessionEmbeddedControllerBase conference:didStopWithCallID:error:]", 7, 0, "going to signal semaphore %p", self->_stopCallIDSemaphore);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stopCallIDSemaphore);
}

- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***updateInputFrequencyLevel delegate called", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1028, "-[IDSSessionEmbeddedControllerBase conference:updateInputFrequencyLevel:]", 7, 0, "***updateInputFrequencyLevel delegate called");
}

- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***updateOutputFrequencyLevel delegate called", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1030, "-[IDSSessionEmbeddedControllerBase conference:updateOutputFrequencyLevel:]", 7, 0, "***updateOutputFrequencyLevel delegate called");
}

- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***receivedFirstRemoteFrameForCallID delegate called", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1033, "-[IDSSessionEmbeddedControllerBase conference:receivedFirstRemoteFrameForCallID:]", 7, 0, "***receivedFirstRemoteFrameForCallID delegate called");
}

- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v5 = a4;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***remoteScreenAttributesChanged delegate called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1039, "-[IDSSessionEmbeddedControllerBase conference:remoteScreenAttributesChanged:callID:]", 7, 0, "***remoteScreenAttributesChanged delegate called");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    [v5 ratio];
    uint64_t v7 = v6;
    [v5 ratio];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screenAttributes.\"ratio\": (%f,%f)", buf, 0x16u);
  }
  [v5 ratio];
  double v10 = v9;
  [v5 ratio];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1040, "-[IDSSessionEmbeddedControllerBase conference:remoteScreenAttributesChanged:callID:]", 7, 0, "screenAttributes.\"ratio\": (%f,%f)", v10, v11);
}

- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v5 = a4;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***remoteVideoAttributesChanged delegate called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1047, "-[IDSSessionEmbeddedControllerBase conference:remoteVideoAttributesChanged:callID:]", 7, 0, "***remoteVideoAttributesChanged delegate called");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    [v5 ratio];
    uint64_t v7 = v6;
    [v5 ratio];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "videoAttributes.\"ratio\": (%f,%f)", buf, 0x16u);
  }
  [v5 ratio];
  double v10 = v9;
  [v5 ratio];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1048, "-[IDSSessionEmbeddedControllerBase conference:remoteVideoAttributesChanged:callID:]", 7, 0, "videoAttributes.\"ratio\": (%f,%f)", v10, v11);
}

- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***remoteAudioPaused delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1053, "-[IDSSessionEmbeddedControllerBase conference:remoteAudioPaused:callID:]", 7, 0, "***remoteAudioPaused delegate called");
}

- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v5 = a4;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***remoteVideoPaused delegate called  didPuae %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1057, "-[IDSSessionEmbeddedControllerBase conference:remoteVideoPaused:callID:]", 7, 0, "***remoteVideoPaused delegate called  didPuae %d", v5);
}

- (void)serverDiedForConference:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***serverDiedForConference delegate called.  fatal error server will exit", v8, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1061, "-[IDSSessionEmbeddedControllerBase serverDiedForConference:]", 5, 0, "***serverDiedForConference delegate called.  fatal error server will exit");
  sub_100036038(0, 0, 0.0, 0.0);
  BOOL v5 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];

  if (v5)
  {
    uint64_t v6 = [(IDSSessionEmbeddedControllerBase *)self idsServiceController];
    pid_t v7 = [v6 viewServicePID];

    if (v7 != -1) {
      kill(v7, 15);
    }
  }
  exit(0);
}

- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***inititiateRelayRequest delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1078, "-[IDSSessionEmbeddedControllerBase conference:inititiateRelayRequest:requestDict:]", 7, 0, "***inititiateRelayRequest delegate called");
}

- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***sendRelayUpdate delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1082, "-[IDSSessionEmbeddedControllerBase conference:sendRelayUpdate:updateDict:]", 7, 0, "***sendRelayUpdate delegate called");
}

- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***cancelRelayRequest delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1086, "-[IDSSessionEmbeddedControllerBase conference:cancelRelayRequest:requestDict:]", 7, 0, "***cancelRelayRequest delegate called");
}

- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    BOOL v9 = v7;
    __int16 v10 = 1024;
    BOOL v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***videoQualityNotificationForCallID delegate called  isDegraded %d isRemoteVideo %d", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1093, "-[IDSSessionEmbeddedControllerBase conference:videoQualityNotificationForCallID:isDegraded:isRemote:]", 7, 0, "***videoQualityNotificationForCallID delegate called  isDegraded %d isRemoteVideo %d", v7, v6);
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***networkHint delegate called", v5, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 1098, "-[IDSSessionEmbeddedControllerBase conference:withCallID:networkHint:]", 7, 0, "***networkHint delegate called");
}

- (BOOL)termsAccepted
{
  return self->termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->termsAccepted = a3;
}

- (BOOL)autoAcceptInvitation
{
  return self->_autoAcceptInvitation;
}

- (void)setAutoAcceptInvitation:(BOOL)a3
{
  self->_autoAcceptInvitation = a3;
}

- (OS_dispatch_semaphore)vsSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVsSemaphore:(id)a3
{
}

- (NSString)inviterID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInviterID:(id)a3
{
}

- (int)inviterKind
{
  return self->_inviterKind;
}

- (void)setInviterKind:(int)a3
{
  self->_inviterKind = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (BOOL)controlModeEnabled
{
  return self->_controlModeEnabled;
}

- (void)setControlModeEnabled:(BOOL)a3
{
  self->_controlModeEnabled = a3;
}

- (BOOL)isAudioChatMuted
{
  return self->_audioChatMuted;
}

- (void)setAudioChatMuted:(BOOL)a3
{
  self->_audioChatMuted = a3;
}

- (BOOL)allowsAudioChat
{
  return self->_allowsAudioChat;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (int)idsSessionState
{
  return self->_idsSessionState;
}

- (void)setIdsSessionState:(int)a3
{
  self->_idsSessionState = a3;
}

- (NSString)uniqueID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUniqueID:(id)a3
{
}

- (IDSServiceEmbeddedController)idsServiceController
{
  return (IDSServiceEmbeddedController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdsServiceController:(id)a3
{
}

- (IDSSession)idsSession
{
  return (IDSSession *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIdsSession:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSessionID:(id)a3
{
}

- (__CFUserNotification)invitationNotification
{
  return self->_invitationNotification;
}

- (void)setInvitationNotification:(__CFUserNotification *)a3
{
  self->_invitationNotification = a3;
}

- (NSTimer)notificationTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNotificationTimeoutTimer:(id)a3
{
}

- (BOOL)audioChatEnabled
{
  return self->_audioChatEnabled;
}

- (int)notifierToken
{
  return self->_notifierToken;
}

- (void)setNotifierToken:(int)a3
{
  self->_notifierToken = a3;
}

- (AVConference)avConference
{
  return (AVConference *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAvConference:(id)a3
{
}

- (int64_t)callID
{
  return self->_callID;
}

- (void)setCallID:(int64_t)a3
{
  self->_int64_t callID = a3;
}

- (BOOL)notificationTimedOut
{
  return self->_notificationTimedOut;
}

- (void)setNotificationTimedOut:(BOOL)a3
{
  self->_notificationTimedOut = a3;
}

- (NSDate)notificationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNotificationStartTime:(id)a3
{
}

- (BOOL)handledSessionEnd
{
  return self->_handledSessionEnd;
}

- (void)setHandledSessionEnd:(BOOL)a3
{
  self->_handledSessionEnd = a3;
}

- (BOOL)appleIDInviteWasAcceptedOrDeclined
{
  return self->_appleIDInviteWasAcceptedOrDeclined;
}

- (void)setAppleIDInviteWasAcceptedOrDeclined:(BOOL)a3
{
  self->_appleIDInviteWasAcceptedOrDeclined = a3;
}

- (NSDictionary)remoteAVConferenceInviteDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRemoteAVConferenceInviteDictionary:(id)a3
{
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

- (BOOL)sessionStartDelegateWasCalled
{
  return self->_sessionStartDelegateWasCalled;
}

- (void)setSessionStartDelegateWasCalled:(BOOL)a3
{
  self->_sessionStartDelegateWasCalled = a3;
}

- (NWDatagramConnection)datagramConnection
{
  return (NWDatagramConnection *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDatagramConnection:(id)a3
{
}

- (NWConnectionManager)datagramConnectionManager
{
  return (NWConnectionManager *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDatagramConnectionManager:(id)a3
{
}

- (VNCServer)vnc
{
  return (VNCServer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setVnc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vnc, 0);
  objc_storeStrong((id *)&self->_datagramConnectionManager, 0);
  objc_storeStrong((id *)&self->_datagramConnection, 0);
  objc_storeStrong((id *)&self->_remoteAVConferenceInviteDictionary, 0);
  objc_storeStrong((id *)&self->_notificationStartTime, 0);
  objc_storeStrong((id *)&self->_avConference, 0);
  objc_storeStrong((id *)&self->_notificationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_idsServiceController, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_inviterID, 0);
  objc_storeStrong((id *)&self->_vsSemaphore, 0);

  objc_storeStrong((id *)&self->_stopCallIDSemaphore, 0);
}

@end