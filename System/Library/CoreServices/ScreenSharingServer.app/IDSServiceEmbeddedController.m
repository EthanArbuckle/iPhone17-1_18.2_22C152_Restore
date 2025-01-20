@interface IDSServiceEmbeddedController
+ (id)sharedIDServiceController;
- (BOOL)askToCopyToPasteboardTimedOut;
- (BOOL)askToOpenURLTimedOut;
- (BOOL)askToResumeTimedOut;
- (BOOL)inviterIsInActiveSession:(id)a3;
- (BOOL)lockScreenObserverActive;
- (BOOL)screenLocked;
- (BOOL)screenPausedBeforeLock;
- (BOOL)sessionPaused;
- (BOOL)showUserMessageTimedOut;
- (BOOL)showViewerPausedTimedOut;
- (BOOL)validInviteDictionary:(id)a3;
- (BOOL)validateRedwoodRequestDictionary:(id)a3 account:(id)a4 fromID:(id)a5 error:(id *)a6;
- (IDSService)idsService;
- (IDSServiceEmbeddedController)init;
- (IDSSessionEmbeddedControllerBase)idsSessionController;
- (IDSSessionEmbeddedControllerBase)pendingSession;
- (NSData)urlResponseData;
- (NSDate)notificationStartTime;
- (NSMutableDictionary)activeSessions;
- (NSString)askToCopyToPasteboardUserMessage;
- (NSString)idsIDQueryListenerID;
- (NSString)sanitizedFromID;
- (NSString)showUserMessage;
- (NSString)urlToOpen;
- (NSString)validationURL;
- (NSTimer)askToCopyToPasteboardTimeoutTimer;
- (NSTimer)askToOpenURLTimeoutTimer;
- (NSTimer)askToResumeTimeoutTimer;
- (NSTimer)exitTimer;
- (NSTimer)showUserMessageTimeoutTimer;
- (NSTimer)showViewerPausedTimeoutTimer;
- (OS_os_transaction)osTransaction;
- (SBSAssertion)wallpaperSuspensionAssertion;
- (SBSStatusBarStyleOverridesAssertion)doubleHeightStatusBarAssertion;
- (SSUserResponseDelegate)askToCopyToPasteboardDelegate;
- (SSUserResponseDelegate)askToOpenURLDelegate;
- (SSUserResponseDelegate)askToResumeDelegate;
- (ViewServiceHelper)vsHelper;
- (__CFUserNotification)askToCopyToPasteboardNotification;
- (__CFUserNotification)askToOpenURLNotification;
- (__CFUserNotification)askToResumeNotification;
- (__CFUserNotification)showUserMessageNotification;
- (__CFUserNotification)showViewerPausedNotification;
- (id)activeViewerStatusString;
- (id)datagramConnectionFromIDS:(id)a3;
- (int)viewServicePID;
- (unsigned)askToCopyToPasteboardToken;
- (unsigned)askToOpenURLToken;
- (unsigned)askToResumeToken;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)addActiveSession:(id)a3;
- (void)askToCopyToPasteboard:(id)a3 senderToken:(unsigned int)a4 message:(id)a5;
- (void)askToOpenURL:(id)a3 senderToken:(unsigned int)a4 URL:(id)a5 sessionController:(id)a6;
- (void)askToOpenURLTimeout:(id)a3;
- (void)askToResumeTimeout:(id)a3;
- (void)askToToCopyToPasteboardTimeout:(id)a3;
- (void)checkIfNoSessions;
- (void)closeAllSessions;
- (void)createLockScreenNotifier;
- (void)createStatusBar;
- (void)dealloc;
- (void)exitTimerCallback:(id)a3;
- (void)initScreenSharingIDSService;
- (void)initViewServiceHelper;
- (void)inviteWasAccepted:(id)a3;
- (void)pauseResumeResult:(id)a3;
- (void)pauseScreenSharing:(BOOL)a3;
- (void)pauseScreenSharing:(BOOL)a3 pausingDueToScreenLock:(BOOL)a4;
- (void)pidNotification:(id)a3;
- (void)postAskToCopyToPasteboardNotification;
- (void)postAskToOpenURLNotification;
- (void)postAskToResumeNotification;
- (void)postAskToResumeNotification:(id)a3 senderToken:(unsigned int)a4;
- (void)postShowUserMessageNotification;
- (void)postViewerPausedMessageNotification;
- (void)removeAskToCopyToPasteboardNotification;
- (void)removeAskToOpenURLNotification;
- (void)removeSession:(id)a3 andEndIDSSession:(BOOL)a4;
- (void)removeShowUserMessageNotification;
- (void)removeUserAskToResumeNotification;
- (void)removeViewerPausedNotification;
- (void)sendLockScreenChangeMessageToAllSessions:(BOOL)a3;
- (void)sendMessageAutoAccept:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendMessageInviteAccepted:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendMessageInviteDisplayed:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendMessageInviteIgnored:(id)a3 sessionID:(id)a4 service:(id)a5 error:(id)a6;
- (void)sendMessageShareSettingsUserDecline:(id)a3;
- (void)sendMessageShareStatusResult:(id)a3 systemInfo:(id)a4;
- (void)sendMessageShareStatusResultInfo:(id)a3 sessionID:(id)a4 service:(id)a5 systemInfo:(id)a6;
- (void)sendMessageShareStatusUserDeclined:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendMessageStartScreenSend:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendMessageStatusMessage:(id)a3 sessionID:(id)a4 service:(id)a5 status:(id)a6;
- (void)sendMessageTCAccepted;
- (void)sendMessageTCAccepted:(id)a3 sessionID:(id)a4 service:(id)a5;
- (void)sendServiceMessage:(id)a3 destination:(id)a4 service:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)serviceAllowedTrafficClassifiersDidReset:(id)a3;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)sessionState:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setAskToCopyToPasteboardDelegate:(id)a3;
- (void)setAskToCopyToPasteboardNotification:(__CFUserNotification *)a3;
- (void)setAskToCopyToPasteboardTimedOut:(BOOL)a3;
- (void)setAskToCopyToPasteboardTimeoutTimer:(id)a3;
- (void)setAskToCopyToPasteboardToken:(unsigned int)a3;
- (void)setAskToCopyToPasteboardUserMessage:(id)a3;
- (void)setAskToOpenURLDelegate:(id)a3;
- (void)setAskToOpenURLNotification:(__CFUserNotification *)a3;
- (void)setAskToOpenURLTimedOut:(BOOL)a3;
- (void)setAskToOpenURLTimeoutTimer:(id)a3;
- (void)setAskToOpenURLToken:(unsigned int)a3;
- (void)setAskToResumeDelegate:(id)a3;
- (void)setAskToResumeNotification:(__CFUserNotification *)a3;
- (void)setAskToResumeTimedOut:(BOOL)a3;
- (void)setAskToResumeTimeoutTimer:(id)a3;
- (void)setAskToResumeToken:(unsigned int)a3;
- (void)setDoubleHeightStatusBarAssertion:(id)a3;
- (void)setExitTimer:(id)a3;
- (void)setIdsIDQueryListenerID:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIdsSessionController:(id)a3;
- (void)setLockScreenObserverActive:(BOOL)a3;
- (void)setNotificationStartTime:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPendingSession:(id)a3;
- (void)setSanitizedFromID:(id)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)setScreenPausedBeforeLock:(BOOL)a3;
- (void)setSessionPaused:(BOOL)a3;
- (void)setShowUserMessage:(id)a3;
- (void)setShowUserMessageNotification:(__CFUserNotification *)a3;
- (void)setShowUserMessageTimedOut:(BOOL)a3;
- (void)setShowUserMessageTimeoutTimer:(id)a3;
- (void)setShowViewerPausedNotification:(__CFUserNotification *)a3;
- (void)setShowViewerPausedTimedOut:(BOOL)a3;
- (void)setShowViewerPausedTimeoutTimer:(id)a3;
- (void)setUrlResponseData:(id)a3;
- (void)setUrlToOpen:(id)a3;
- (void)setValidationURL:(id)a3;
- (void)setViewServicePID:(int)a3;
- (void)setVsHelper:(id)a3;
- (void)setWallpaperSuspensionAssertion:(id)a3;
- (void)showMessageToUser:(id)a3;
- (void)showUserMessageTimeout:(id)a3;
- (void)showViewerPausedTimeout:(id)a3;
- (void)termsAndConditionsResult:(id)a3;
@end

@implementation IDSServiceEmbeddedController

+ (id)sharedIDServiceController
{
  v2 = (void *)qword_10005C8F8;
  if (!qword_10005C8F8)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init shared service controller", v6, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 191, "+[IDSServiceEmbeddedController sharedIDServiceController]", 7, 0, "init shared service controller");
    v3 = objc_alloc_init(IDSServiceEmbeddedController);
    v4 = (void *)qword_10005C8F8;
    qword_10005C8F8 = (uint64_t)v3;

    v2 = (void *)qword_10005C8F8;
  }

  return v2;
}

- (IDSServiceEmbeddedController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSServiceEmbeddedController;
  v2 = [(IDSServiceEmbeddedController *)&v7 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(IDSServiceEmbeddedController *)v2 setActiveSessions:v3];

    [(IDSServiceEmbeddedController *)v2 setPendingSession:0];
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    url_sem = v2->url_sem;
    v2->url_sem = (OS_dispatch_semaphore *)v4;

    v2->_osTransactionLock = 0;
    [(IDSServiceEmbeddedController *)v2 setViewServicePID:0xFFFFFFFFLL];
    objc_storeStrong((id *)&qword_10005C900, v2);
  }
  return v2;
}

- (void)initScreenSharingIDSService
{
  v3 = [(IDSServiceEmbeddedController *)self idsService];

  if (!v3)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100054CC8);
    id v4 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.safeview"];
    [(IDSServiceEmbeddedController *)self setIdsService:v4];

    v5 = [(IDSServiceEmbeddedController *)self idsService];
    [v5 addDelegate:self queue:&_dispatch_main_q];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(IDSServiceEmbeddedController *)self idsService];
      *(_DWORD *)buf = 134217984;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setup safeview service %p", buf, 0xCu);
    }
    objc_super v7 = [(IDSServiceEmbeddedController *)self idsService];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 229, "-[IDSServiceEmbeddedController initScreenSharingIDSService]", 7, 0, "setup safeview service %p", v7);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  double v12 = COERCE_DOUBLE(a3);
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [a7 serverReceivedTime];
  [v16 timeIntervalSinceNow];
  double v18 = v17;

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v110 = 0.0 - v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incoming message sent %f seconds ago", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 259, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "incoming message sent %f seconds ago", 0.0 - v18);
  BOOL v19 = sub_100035448();
  if (v18 >= -45.0)
  {
    if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(IDSServiceEmbeddedController *)self idsService];
      *(_DWORD *)buf = 134218240;
      double v110 = v12;
      __int16 v111 = 2048;
      id v112 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "service = %p  self.idsService %p", buf, 0x16u);
    }
    v21 = [(IDSServiceEmbeddedController *)self idsService];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 266, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "service = %p  self.idsService %p", *(const void **)&v12, v21);

    v22 = [(IDSServiceEmbeddedController *)self exitTimer];
    [v22 invalidate];

    [(IDSServiceEmbeddedController *)self setExitTimer:0];
    _os_nospin_lock_lock();
    v23 = [(IDSServiceEmbeddedController *)self osTransaction];

    if (!v23)
    {
      v24 = (void *)os_transaction_create();
      [(IDSServiceEmbeddedController *)self setOsTransaction:v24];

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = [(IDSServiceEmbeddedController *)self osTransaction];
        *(_DWORD *)buf = 134217984;
        double v110 = v25;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "transaction %p", buf, 0xCu);
      }
      v26 = [(IDSServiceEmbeddedController *)self osTransaction];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 275, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "transaction %p", v26);
    }
    _os_nospin_lock_unlock();
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = COERCE_DOUBLE([v15 UTF8String]);
      *(_DWORD *)buf = 136315138;
      double v110 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "service message received from %s", buf, 0xCu);
    }
    id v28 = v15;
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 279, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "service message received from %s", (const char *)[v28 UTF8String]);
    if (![(IDSServiceEmbeddedController *)self validInviteDictionary:v14])
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        double v57 = COERCE_DOUBLE([v56 UTF8String]);
        *(_DWORD *)buf = 136315138;
        double v110 = v57;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid invite dictionary from %s - ignoring", buf, 0xCu);
      }
      id v58 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 284, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "invalid invite dictionary from %s - ignoring", (const char *)[v58 UTF8String]);

      goto LABEL_56;
    }
    id v29 = [v14 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 287, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "inviteOptions:%s", (const char *)[v29 UTF8String]);

    v30 = [v14 objectForKeyedSubscript:@"com.apple.private.applecare"];
    v31 = (void *)IDSCopyAddressDestinationForDestination();
    [(IDSServiceEmbeddedController *)self setSanitizedFromID:v31];

    v32 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    unsigned int v33 = [v32 isEmailAddress];

    if (v33)
    {
      v34 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      v35 = (void *)IDSCopyIDForEmailAddress();
      [(IDSServiceEmbeddedController *)self setSanitizedFromID:v35];
    }
    v36 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    unsigned int v37 = [v36 isPhoneNumber];

    if (v37)
    {
      v38 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      v39 = (void *)IDSCopyIDForPhoneNumber();
      [(IDSServiceEmbeddedController *)self setSanitizedFromID:v39];
    }
    id v106 = v13;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      double v41 = COERCE_DOUBLE([v40 UTF8String]);
      *(_DWORD *)buf = 136315138;
      double v110 = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.sanitizedFromID %s", buf, 0xCu);
    }
    id v42 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 302, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "self.sanitizedFromID %s", (const char *)[v42 UTF8String]);

    Boolean keyExistsAndHasValidFormat = 0;
    int v43 = 0;
    if (sub_10001A484())
    {
      if (CFPreferencesGetAppBooleanValue(@"AllowAny", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat))
      {
        BOOL v44 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        BOOL v44 = 1;
      }
      int v43 = !v44;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v110) = v43;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "allowAny: %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 312, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "allowAny: %d", v43);
    }
    v45 = [v14 objectForKeyedSubscript:@"cmd"];
    v46 = v45;
    if (v45
      && (([v45 isEqualToString:@"alreadyAccepted"] & 1) != 0
       || [v46 isEqualToString:@"alreadyDeclined"]))
    {
      double v47 = v12;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got message accepted or declined elsewhere", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 318, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "got message accepted or declined elsewhere");
      v48 = [(IDSServiceEmbeddedController *)self pendingSession];

      if (v48)
      {
        v49 = [v14 objectForKeyedSubscript:@"sessionID"];
        v50 = [(IDSServiceEmbeddedController *)self pendingSession];
        v51 = [v50 sessionID];
        unsigned int v52 = [v51 isEqualToString:v49];

        if (!v52)
        {
          double v12 = v47;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "not current session", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 334, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "not current session");
          goto LABEL_123;
        }
        v53 = [(IDSServiceEmbeddedController *)self pendingSession];
        unsigned __int8 v54 = [v53 appleIDInviteWasAcceptedOrDeclined];

        BOOL v55 = sub_100035448();
        double v12 = v47;
        if (v54)
        {
          if (v55 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "local session was already accepted or declined", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 331, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "local session was already accepted or declined", v96);
          goto LABEL_123;
        }
        if (v55 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          double v91 = COERCE_DOUBLE([v49 UTF8String]);
          *(_DWORD *)buf = 136315138;
          double v110 = v91;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove session %s", buf, 0xCu);
        }
        [v49 UTF8String];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 326, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "remove session %s");
LABEL_122:
        v92 = [(IDSServiceEmbeddedController *)self pendingSession];
        [v92 doEndSession];

        [(IDSServiceEmbeddedController *)self setPendingSession:0];
LABEL_123:
        id v13 = v106;

        goto LABEL_57;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no pending share settings session", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 337, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "no pending share settings session");
LABEL_93:
      id v59 = 0;
      double v12 = v47;
LABEL_94:
      id v13 = v106;
      goto LABEL_58;
    }
    unsigned int v60 = [v46 isEqualToString:@"endSession"];
    BOOL v61 = sub_100035448();
    if (v60)
    {
      double v47 = v12;
      if (v61 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got endsession message", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 342, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "got endsession message");
      v62 = [(IDSServiceEmbeddedController *)self pendingSession];

      if (v62)
      {
        v49 = [v14 objectForKeyedSubscript:@"sessionID"];
        v63 = [(IDSServiceEmbeddedController *)self pendingSession];
        v64 = [v63 sessionID];
        unsigned int v65 = [v64 isEqualToString:v49];

        BOOL v66 = sub_100035448();
        if (!v65)
        {
          double v12 = v47;
          if (v66 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            double v79 = COERCE_DOUBLE([v49 UTF8String]);
            *(_DWORD *)buf = 136315138;
            double v110 = v79;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown sessionid  %s", buf, 0xCu);
          }
          [v49 UTF8String];
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 353, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "unknown sessionid  %s");
          goto LABEL_123;
        }
        double v12 = v47;
        if (v66 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          double v67 = COERCE_DOUBLE([v49 UTF8String]);
          *(_DWORD *)buf = 136315138;
          double v110 = v67;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "endsession for %s", buf, 0xCu);
        }
        [v49 UTF8String];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 348, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "endsession for %s");
        goto LABEL_122;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no pending share settings session", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 356, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "no pending share settings session");
      goto LABEL_93;
    }
    if (v61 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown cmd", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 360, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "unknown cmd");
    BOOL v68 = sub_100035448();
    if (v30)
    {
      double v104 = v12;
      if (v68 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v69 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        double v70 = COERCE_DOUBLE([v69 UTF8String]);
        v71 = [(IDSServiceEmbeddedController *)self activeSessions];
        id v72 = [v71 count];
        *(_DWORD *)buf = 136315394;
        double v110 = v70;
        __int16 v111 = 2048;
        id v112 = v72;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sanitized from %s  active session count %lu", buf, 0x16u);
      }
      id v73 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      v74 = (const char *)[v73 UTF8String];
      v75 = [(IDSServiceEmbeddedController *)self activeSessions];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 364, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "sanitized from %s  active session count %lu", v74, [v75 count]);

      v76 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      id v107 = 0;
      unsigned int v77 = [(IDSServiceEmbeddedController *)self validateRedwoodRequestDictionary:v30 account:v106 fromID:v76 error:&v107];
      id v59 = v107;

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v110) = v77;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "result %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 367, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "result %d", v77);
      if (v77)
      {
        int v78 = 1;
      }
      else
      {
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 371, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "Not a valid request: %s", (const char *)[v28 UTF8String]);
        if (!v43)
        {
          double v12 = v104;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignore", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 375, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "ignore");
          goto LABEL_94;
        }
        int v78 = 0;
      }
      double v12 = v104;
    }
    else
    {
      if (v68 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no dictionary", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 382, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "no dictionary");
      id v59 = 0;
      if (!v43)
      {
        v30 = 0;
        goto LABEL_94;
      }
      int v78 = 1;
    }
    id v13 = v106;
    if (![v46 isEqualToString:@"share"]) {
      goto LABEL_58;
    }
    v80 = [v14 objectForKeyedSubscript:@"sessionID"];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v81 = COERCE_DOUBLE([v80 UTF8String]);
      *(_DWORD *)buf = 136315138;
      double v110 = v81;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "share settings sessionID = %s", buf, 0xCu);
    }
    int v103 = v78;
    id v105 = v80;
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 393, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "share settings sessionID = %s", (const char *)[v105 UTF8String]);
    double v82 = [v30 objectForKeyedSubscript:@"AppleName"];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v83 = [*(id *)&v82 UTF8String];
      *(_DWORD *)buf = 134218242;
      double v110 = v82;
      __int16 v111 = 2080;
      id v112 = v83;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "appleNameSpecifier %p  %s", buf, 0x16u);
    }
    id v84 = *(id *)&v82;
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 396, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "appleNameSpecifier %p  %s", v84, (const char *)[v84 UTF8String]);
    v85 = [(IDSServiceEmbeddedController *)self pendingSession];

    if (v85)
    {
      v101 = [(IDSServiceEmbeddedController *)self pendingSession];
      id v99 = [v101 inviterID];
      v97 = (const char *)[v99 UTF8String];
      v98 = [(IDSServiceEmbeddedController *)self pendingSession];
      [v98 idsSession];
      v87 = double v86 = v12;
      id v88 = [v87 sessionID];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 401, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "Ignoring invitation -- pendingSession already active from: %s %s", v97, (const char *)[v88 UTF8String]);

      double v12 = v86;
      id v13 = v106;

      v89 = v84;
      if (!v103)
      {
LABEL_129:

        goto LABEL_58;
      }
      v90 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      [(IDSServiceEmbeddedController *)self sendMessageInviteIgnored:v90 sessionID:v105 service:*(void *)&v12 error:@"Ignore_PendingInvite"];
    }
    else
    {
      v93 = [IDSSessionEmbeddedControllerShareSettings alloc];
      v100 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      id v102 = v84;
      v94 = [(IDSSessionEmbeddedControllerShareSettings *)v93 initWithRemoteID:v100 sessionID:v105 andServiceController:self appleName:v84];
      [(IDSServiceEmbeddedController *)self setPendingSession:v94];

      if (v103)
      {
        v95 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        [(IDSServiceEmbeddedController *)self sendMessageInviteDisplayed:v95 sessionID:v105 service:*(void *)&v12];
      }
      [(IDSServiceEmbeddedController *)self initViewServiceHelper];
      v90 = [(IDSServiceEmbeddedController *)self pendingSession];
      [v90 postInvitationNotification];
      v89 = v102;
    }

    goto LABEL_129;
  }
  if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "message rejected", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 262, "-[IDSServiceEmbeddedController service:account:incomingMessage:fromID:context:]", 7, 0, "message rejected");
LABEL_56:
  v46 = 0;
  v30 = 0;
LABEL_57:
  id v59 = 0;
LABEL_58:
  [(IDSServiceEmbeddedController *)self checkIfNoSessions];
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v142 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  Boolean keyExistsAndHasValidFormat = 0;
  v16 = [(IDSServiceEmbeddedController *)self exitTimer];
  [v16 invalidate];

  [(IDSServiceEmbeddedController *)self setExitTimer:0];
  _os_nospin_lock_lock();
  double v17 = [(IDSServiceEmbeddedController *)self osTransaction];

  if (!v17)
  {
    double v18 = (void *)os_transaction_create();
    [(IDSServiceEmbeddedController *)self setOsTransaction:v18];

    if (sub_100035448())
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(IDSServiceEmbeddedController *)self osTransaction];
        *(_DWORD *)buf = 134217984;
        id v153 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "transaction %p", buf, 0xCu);
      }
    }
    v21 = [(IDSServiceEmbeddedController *)self osTransaction];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 439, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "transaction %p", v21);
  }
  _os_nospin_lock_unlock();
  id v22 = v14;
  sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 443, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "inviteReceivedForSession from %s", (const char *)[v22 UTF8String]);
  if (sub_100035448())
  {
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v15 length];
      *(_DWORD *)buf = 134217984;
      id v153 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invite context size %lu", buf, 0xCu);
    }
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 446, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "invite context size %lu", [v15 length]);
  double v25 = sub_10001E658((uint64_t)v15);
  v26 = (void *)IDSCopyAddressDestinationForDestination();
  [(IDSServiceEmbeddedController *)self setSanitizedFromID:v26];

  double v27 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  unsigned int v28 = [v27 isEmailAddress];

  if (v28)
  {
    id v29 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    v30 = (void *)IDSCopyIDForEmailAddress();
    [(IDSServiceEmbeddedController *)self setSanitizedFromID:v30];
  }
  v31 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  unsigned int v32 = [v31 isPhoneNumber];

  if (v32)
  {
    unsigned int v33 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    v34 = (void *)IDSCopyIDForPhoneNumber();
    [(IDSServiceEmbeddedController *)self setSanitizedFromID:v34];
  }
  if ([(IDSServiceEmbeddedController *)self validInviteDictionary:v25])
  {
    v140 = v13;
    id v35 = [v25 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 467, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "inviteOptions:%s", (const char *)[v35 UTF8String]);

    v36 = [v25 objectForKeyedSubscript:@"com.apple.private.applecare"];
    if (sub_10001A484())
    {
      if (CFPreferencesGetAppBooleanValue(@"AllowAny", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat))
      {
        BOOL v37 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        BOOL v37 = 1;
      }
      int v38 = !v37;
      if (sub_100035448())
      {
        id v39 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v153) = v38;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "allowAny: %d", buf, 8u);
        }
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 474, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "allowAny: %d", v38);
    }
    else
    {
      int v38 = 0;
    }
    BOOL v43 = sub_100035448();
    if (v36)
    {
      if (v43)
      {
        id v44 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
          id v46 = [v45 UTF8String];
          double v47 = [(IDSServiceEmbeddedController *)self activeSessions];
          id v48 = [v47 count];
          *(_DWORD *)buf = 136315394;
          id v153 = v46;
          __int16 v154 = 2048;
          id v155 = v48;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sanitized from %s  active session count %lu", buf, 0x16u);
        }
      }
      id v49 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      v50 = (const char *)[v49 UTF8String];
      v51 = [(IDSServiceEmbeddedController *)self activeSessions];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 479, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "sanitized from %s  active session count %lu", v50, [v51 count]);

      unsigned int v52 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      LODWORD(v50) = [(IDSServiceEmbeddedController *)self inviterIsInActiveSession:v52];

      if (v50)
      {
        id v53 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 482, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "Ignoring invitation.  Session already established with fromID %s.", (const char *)[v53 UTF8String]);

LABEL_55:
        id v13 = v140;
        goto LABEL_84;
      }
      id v54 = v12;
      BOOL v55 = v36;
      id v56 = [v36 objectForKeyedSubscript:@"aaToken"];
      if (v56)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v57 = [v56 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v153 = v57;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "aaToken %s", buf, 0xCu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 489, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "aaToken %s", (const char *)[v56 UTF8String]);
        id v13 = v140;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "live monitoring request - ignore", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 490, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "live monitoring request - ignore");
        [(IDSServiceEmbeddedController *)self checkIfNoSessions];
LABEL_53:

        id v12 = v54;
        goto LABEL_84;
      }
      id v58 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      id v147 = 0;
      unsigned int v138 = [(IDSServiceEmbeddedController *)self validateRedwoodRequestDictionary:v36 account:v54 fromID:v58 error:&v147];
      id v137 = v147;

      if (sub_100035448())
      {
        id v59 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v153) = v138;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "result %d", buf, 8u);
        }
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 496, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "result %d", v138);
      if ((v138 & 1) == 0)
      {
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 500, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "Not a valid request: %s", (const char *)[v22 UTF8String]);
        if (!v38)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "decline", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 504, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "decline");
          v150[0] = @"REASON";
          v150[1] = @"ERROR";
          v151[0] = @"TokenAuthenticationFailed";
          uint64_t v106 = [v137 description];
          v139 = (void *)v106;
          CFStringRef v107 = &stru_1000553F0;
          if (v106) {
            CFStringRef v107 = (const __CFString *)v106;
          }
          v151[1] = v107;
          v108 = +[NSDictionary dictionaryWithObjects:v151 forKeys:v150 count:2];
          v109 = sub_10001E72C((uint64_t)v108);
          id v13 = v140;
          [v140 declineInvitationWithData:v109];

          [(IDSServiceEmbeddedController *)self checkIfNoSessions];
          BOOL v55 = v36;
          goto LABEL_53;
        }
      }
      unsigned int v60 = [v36 objectForKeyedSubscript:@"appleName"];
      id v12 = v54;
      if (sub_100035448())
      {
        id v61 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v62 = [v60 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v153 = v62;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "appleNameSpecifier:  %s", buf, 0xCu);
        }
      }
      id v136 = v60;
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 514, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "appleNameSpecifier:  %s", (const char *)[v136 UTF8String]);
    }
    else
    {
      if (v43 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no dictionary", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 518, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "no dictionary");
      if (!v38)
      {
        [(IDSServiceEmbeddedController *)self checkIfNoSessions];
        goto LABEL_55;
      }
      id v136 = 0;
      id v137 = 0;
      unsigned int v138 = 0;
    }
    v63 = +[MCProfileConnection sharedConnection];
    unsigned int v64 = [v63 effectiveBoolValueForSetting:MCFeatureRemoteScreenObservationAllowed];

    if (v64 == 2)
    {
      if (sub_100035448())
      {
        id v65 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring invitation because allowRemoteScreenObservation restriction set", buf, 2u);
        }
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 531, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "ignoring invitation because allowRemoteScreenObservation restriction set");
    }
    BOOL v66 = +[MCProfileConnection sharedConnection];
    unsigned int v67 = [v66 effectiveBoolValueForSetting:MCFeatureScreenShotAllowed];

    id v13 = v140;
    if (v67 == 2)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring invitation because allowScreenShot restriction set", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 538, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "ignoring invitation because allowScreenShot restriction set");
      goto LABEL_79;
    }
    if (v64 == 2)
    {
LABEL_79:
      if (v138)
      {
        BOOL v68 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        id v69 = [v140 sessionID];
        [(IDSServiceEmbeddedController *)self sendMessageInviteIgnored:v68 sessionID:v69 service:v142 error:@"Ignore_ScreenSharingRestricted"];
      }
      [(IDSServiceEmbeddedController *)self checkIfNoSessions];

      goto LABEL_82;
    }
    v132 = v36;
    id v133 = v12;
    double v70 = [(IDSServiceEmbeddedController *)self pendingSession];

    if (!v70)
    {
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      double v79 = [(IDSServiceEmbeddedController *)self activeSessions];
      v80 = [v79 allValues];

      id obj = v80;
      id v81 = [v80 countByEnumeratingWithState:&v143 objects:v149 count:16];
      if (v81)
      {
        id v82 = v81;
        uint64_t v83 = *(void *)v144;
        while (2)
        {
          for (i = 0; i != v82; i = (char *)i + 1)
          {
            if (*(void *)v144 != v83) {
              objc_enumerationMutation(obj);
            }
            v85 = *(void **)(*((void *)&v143 + 1) + 8 * i);
            if (sub_100035448())
            {
              id v86 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v87 = [v85 inviterID];
                id v88 = [v87 UTF8String];
                *(_DWORD *)buf = 136315138;
                id v153 = v88;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "active session %s", buf, 0xCu);
              }
            }
            id v89 = [v85 inviterID];
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 565, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "active session %s", (const char *)[v89 UTF8String]);

            v90 = [v85 inviterID];
            double v91 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
            unsigned int v92 = [v90 isEqualToString:v91];

            if (v92)
            {
              id v110 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
              sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 568, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "Ignoring invitation.  Session already established with fromID %s.", (const char *)[v110 UTF8String]);

              id v13 = v140;
              if (v138)
              {
                __int16 v111 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
                id v112 = [v140 sessionID];
                [(IDSServiceEmbeddedController *)self sendMessageInviteIgnored:v111 sessionID:v112 service:v142 error:@"Ignore_AlreadyInSession"];
              }
              [(IDSServiceEmbeddedController *)self checkIfNoSessions];

              id v12 = v133;
              goto LABEL_84;
            }
            id v13 = v140;
          }
          id v82 = [obj countByEnumeratingWithState:&v143 objects:v149 count:16];
          if (v82) {
            continue;
          }
          break;
        }
      }

      uint64_t v93 = [v25 objectForKeyedSubscript:@"avconference"];
      BOOL v94 = sub_100035448();
      v141 = (void *)v93;
      if (v93)
      {
        id v12 = v133;
        if (v94)
        {
          id v95 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenceDict available", buf, 2u);
          }
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 578, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "avconferenceDict available");
        if (sub_100035448())
        {
          id v96 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v97 = [(IDSServiceEmbeddedController *)self activeSessions];
            id v98 = [v97 count];
            *(_DWORD *)buf = 134217984;
            id v153 = v98;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "active session count %lu", buf, 0xCu);
          }
        }
        id v99 = [(IDSServiceEmbeddedController *)self activeSessions];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 587, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "active session count %lu", [v99 count]);

        v100 = [(IDSServiceEmbeddedController *)self activeSessions];
        id v101 = [v100 count];

        id v102 = v101;
        if (v101)
        {
          if (sub_100035448())
          {
            id v103 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "auto accept invite", buf, 2u);
            }
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 591, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "auto accept invite");
          if (v138)
          {
            double v104 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
            id v105 = [v13 sessionID];
            [(IDSServiceEmbeddedController *)self sendMessageAutoAccept:v104 sessionID:v105 service:v142];
          }
        }
        else
        {
          [(IDSServiceEmbeddedController *)self setSessionPaused:0];
          [(IDSServiceEmbeddedController *)self setScreenPausedBeforeLock:0];
        }
        obja = [IDSSessionEmbeddedControllerAppleCare alloc];
        if (sub_100035448())
        {
          id v113 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v114 = [(IDSServiceEmbeddedController *)self sessionPaused];
            *(_DWORD *)buf = 67109120;
            LODWORD(v153) = v114;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start out paused %d", buf, 8u);
          }
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 608, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "start out paused %d", [(IDSServiceEmbeddedController *)self sessionPaused]);
        if (sub_100035448())
        {
          id v115 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v153) = v138;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "isValidatedRedwoodRequest %d", buf, 8u);
          }
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 610, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "isValidatedRedwoodRequest %d", v138);
        if (v138)
        {
          v116 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
          v117 = [v13 sessionID];
          [(IDSServiceEmbeddedController *)self sendMessageInviteDisplayed:v116 sessionID:v117 service:v142];
        }
        if (sub_100035448())
        {
          id v118 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v119 = [v136 UTF8String];
            *(_DWORD *)buf = 136315138;
            id v153 = v119;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "appleNameSpecifier %s", buf, 0xCu);
          }
        }
        v120 = (__CFString *)v136;
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 614, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "appleNameSpecifier %s", (const char *)[(__CFString *)v120 UTF8String]);
        Boolean keyExistsAndHasValidFormat = 0;
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseAppleCareName", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat);
        if (keyExistsAndHasValidFormat)
        {
          int v122 = AppBooleanValue;
          if (sub_100035448())
          {
            id v123 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v153) = v122;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleCare name flag %d", buf, 8u);
            }
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 620, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "AppleCare name flag %d", v122);

          if (v122) {
            v120 = @"AC";
          }
          else {
            v120 = @"AS";
          }
        }
        BOOL v124 = v102 != 0;
        v125 = obja;
        v126 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
        LOBYTE(v131) = [(IDSServiceEmbeddedController *)self sessionPaused];
        v127 = [(IDSSessionEmbeddedControllerAppleCare *)v125 initWithRemoteID:v126 session:v13 direction:1 inviteDictionary:v141 andServiceController:self autoAcceptInvite:v124 startOutPaused:v131 appleName:v120];
        [(IDSServiceEmbeddedController *)self setPendingSession:v127];

        if (sub_100035448())
        {
          id v128 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v129 = [(IDSServiceEmbeddedController *)self pendingSession];
            *(_DWORD *)buf = 134217984;
            id v153 = v129;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PENDING SESSION IS %p", buf, 0xCu);
          }
        }
        v130 = [(IDSServiceEmbeddedController *)self pendingSession];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 628, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "PENDING SESSION IS %p", v130);

        [(IDSServiceEmbeddedController *)self initViewServiceHelper];
        goto LABEL_83;
      }
      id v12 = v133;
      if (v94 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "nil AVC dictionary - reject invitation", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 581, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 5, 0, "nil AVC dictionary - reject invitation");
      [(IDSServiceEmbeddedController *)self checkIfNoSessions];

LABEL_82:
LABEL_83:

      goto LABEL_84;
    }
    v71 = [(IDSServiceEmbeddedController *)self pendingSession];
    id v72 = [v71 inviterID];
    id v73 = (const char *)[v72 UTF8String];
    v74 = [(IDSServiceEmbeddedController *)self pendingSession];
    v75 = [v74 idsSession];
    id v76 = [v75 sessionID];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 553, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "Ignoring invitation -- pendingSession already active from: %s %s", v73, (const char *)[v76 UTF8String]);

    id v13 = v140;
    if (v138)
    {
      unsigned int v77 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      int v78 = [v140 sessionID];
      [(IDSServiceEmbeddedController *)self sendMessageInviteIgnored:v77 sessionID:v78 service:v142 error:@"Ignore_PendingInvite"];
    }
    [(IDSServiceEmbeddedController *)self checkIfNoSessions];

    id v12 = v133;
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      id v41 = [v40 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v153 = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid invite dictionary from %s - ignoring", buf, 0xCu);
    }
    id v42 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 463, "-[IDSServiceEmbeddedController service:account:inviteReceivedForSession:fromID:withContext:]", 7, 0, "invalid invite dictionary from %s - ignoring", (const char *)[v42 UTF8String]);

    [(IDSServiceEmbeddedController *)self checkIfNoSessions];
  }
LABEL_84:
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void, void *))a5;
  v9 = [v7 protectionSpace];
  v10 = [v9 authenticationMethod];
  unsigned int v11 = [v10 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v11)
  {
    id v12 = [(IDSServiceEmbeddedController *)self validationURL];
    id v13 = +[NSURLComponents componentsWithString:v12];

    id v14 = [v13 host];

    if (v14)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"PinningDisabled", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat))
      {
        BOOL v15 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        BOOL v15 = 1;
      }
      int v16 = !v15;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SecTrustResultType v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PinningDisabled:%d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 653, "-[IDSServiceEmbeddedController URLSession:didReceiveChallenge:completionHandler:]", 7, 0, "PinningDisabled:%d", v16);
      double v17 = [v13 host];
      if (v16)
      {
        SSL = SecPolicyCreateSSL(1u, v17);

        if (!SSL) {
          goto LABEL_21;
        }
      }
      else
      {
        SSL = (const void *)SecPolicyCreateAppleSSLPinned();
      }
      id v19 = [v7 protectionSpace];
      v20 = (__SecTrust *)[v19 serverTrust];

      OSStatus v21 = SecTrustSetPolicies(v20, SSL);
      if (SSL) {
        CFRelease(SSL);
      }
      if (!v21)
      {
        SecTrustResultType result = kSecTrustResultInvalid;
        if (!SecTrustEvaluate(v20, &result))
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            SecTrustResultType v26 = result;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trustResult:%d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 688, "-[IDSServiceEmbeddedController URLSession:didReceiveChallenge:completionHandler:]", 7, 0, "trustResult:%d", result);
          if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
          {
            id v22 = +[NSURLCredential credentialForTrust:v20];
            v8[2](v8, 0, v22);

            goto LABEL_22;
          }
        }
      }
    }
LABEL_21:
    v8[2](v8, 2, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->url_sem);
LABEL_22:

    goto LABEL_23;
  }
  v8[2](v8, 1, 0);
LABEL_23:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5)
  {
    objc_msgSend(a5, "description", a3, a4);
    id v6 = objc_claimAutoreleasedReturnValue();
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 717, "-[IDSServiceEmbeddedController URLSession:task:didCompleteWithError:]", 7, 0, "URLSession:task:didCompleteWithError:%s", (const char *)[v6 UTF8String]);

    [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "URLSession:task:didCompleteWithError:", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 721, "-[IDSServiceEmbeddedController URLSession:task:didCompleteWithError:]", 7, 0, "URLSession:task:didCompleteWithError:");
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->url_sem);
}

- (BOOL)validateRedwoodRequestDictionary:(id)a3 account:(id)a4 fromID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 objectForKeyedSubscript:@"sessionToken"];
  if (v13)
  {
    id v14 = (void *)v13;
    BOOL v15 = [v10 objectForKeyedSubscript:@"resourcepath"];

    if (v15)
    {
      int v16 = [v10 objectForKeyedSubscript:@"appleName"];
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "name specifier is invalid", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 755, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "name specifier is invalid");
          goto LABEL_30;
        }
        if ((unint64_t)[v16 length] >= 0xB)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "name length is invalid", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 761, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "name length is invalid");
LABEL_30:
          LOBYTE(v17) = 0;
LABEL_77:

          goto LABEL_78;
        }
      }
      double v18 = [v10 objectForKeyedSubscript:@"shareType"];
      id v19 = v18;
      if (v18 && (unint64_t)[v18 length] >= 0x1F)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "shareType length is invalid", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 772, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "shareType length is invalid");
        LOBYTE(v17) = 0;
        goto LABEL_76;
      }
      uint64_t v83 = a6;
      id v86 = v19;
      v96[0] = @"version";
      v96[1] = @"params";
      v97[0] = @"1.0";
      v94[0] = @"sessionToken";
      v20 = [v10 objectForKeyedSubscript:@"sessionToken"];
      v95[0] = v20;
      v94[1] = @"fromID";
      OSStatus v21 = [v12 stringWithSchemeTrimmed];
      v95[1] = v21;
      v94[2] = @"toID";
      [v11 aliasStrings];
      id v22 = v85 = v16;
      v95[2] = v22;
      id v23 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];
      v97[1] = v23;
      id v24 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
      id v25 = [v24 mutableCopy];

      int v16 = v85;
      if (v85) {
        [v25 setObject:v85 forKeyedSubscript:@"appleName"];
      }
      id v19 = v86;
      if (v86) {
        [v25 setObject:v86 forKeyedSubscript:@"shareType"];
      }
      id v89 = 0;
      id v84 = v25;
      SecTrustResultType v26 = +[NSJSONSerialization dataWithJSONObject:v25 options:1 error:&v89];
      id v27 = v89;
      if (v27)
      {
        id v28 = v27;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error on serialization", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 801, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "error on serialization");

        goto LABEL_72;
      }
      id v82 = v26;
      id v29 = [v10 objectForKeyedSubscript:@"timeout"];
      [v29 floatValue];
      if (v30 == 0.0) {
        double v31 = 60.0;
      }
      else {
        double v31 = v30;
      }

      unsigned int v32 = [v10 objectForKeyedSubscript:@"isprod"];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 813, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "hostIdentifier: %s", (const char *)[(__CFString *)v32 UTF8String]);
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"AllowNonProductionServers", @"com.apple.screensharingserver", &keyExistsAndHasValidFormat))
      {
        BOOL v33 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        BOOL v33 = 1;
      }
      int v34 = !v33;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v93 = v34;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "allowNonProductionServers:%d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 817, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "allowNonProductionServers:%d", v34);
      id v35 = +[NSMutableDictionary dictionaryWithCapacity:12];
      [v35 addEntriesFromDictionary:&off_100056A70];
      if (v34)
      {
        [v35 addEntriesFromDictionary:&off_100056A98];
        [v35 addEntriesFromDictionary:&off_100056AC0];
      }
      v36 = [v35 objectForKeyedSubscript:v32];
      [(IDSServiceEmbeddedController *)self setValidationURL:v36];

      BOOL v37 = [(IDSServiceEmbeddedController *)self validationURL];
      int v38 = +[NSURL URLWithString:v37];
      id v39 = [v10 objectForKeyedSubscript:@"resourcepath"];
      uint64_t v17 = [v38 URLByAppendingPathComponent:v39];

      double v79 = (void *)v17;
      v80 = v35;
      id v81 = self;
      if (!v17)
      {
        NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
        CFStringRef v53 = &stru_1000553F0;
        if (v32) {
          CFStringRef v53 = v32;
        }
        id v54 = +[NSString stringWithFormat:@"Bad isprod value:\"%@\"", v53];
        double v91 = v54;
        BOOL v55 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];

        id v28 = +[NSError errorWithDomain:@"com.apple.ssinvitationagent" code:-1 userInfo:v55];
        int v51 = 10;
        int v16 = v85;
        id v19 = v86;
LABEL_71:

        self = v81;
        if (v51 != 10)
        {
LABEL_75:

LABEL_76:
          goto LABEL_77;
        }
LABEL_72:
        id v72 = +[NSString stringWithFormat:@"Redwood Validation Failed: %@", v28];
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 888, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "%s", (const char *)[v72 UTF8String]);

        if (v83) {
          *uint64_t v83 = v28;
        }
        [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
        [(IDSServiceEmbeddedController *)self setValidationURL:0];
        [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
        LOBYTE(v17) = 0;
        goto LABEL_75;
      }
      [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
      uint64_t v17 = +[NSMutableURLRequest requestWithURL:v17 cachePolicy:1 timeoutInterval:v31];
      [(id)v17 setHTTPBody:v82];
      [(id)v17 setValue:@"application/json" forHTTPHeaderField:@"content-type"];
      objc_msgSend((id)v17, "setValue:forHTTPHeaderField:", @"SafeView/1.0 (Macintosh; Intel Mac OS X 10_10)",
        @"User-Agent");
      [(id)v17 setHTTPMethod:@"POST"];
      uint64_t v75 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      int v78 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:");
      id v40 = [v78 dataTaskWithRequest:v17];
      [v40 resume];

      url_sem = self->url_sem;
      dispatch_time_t v42 = dispatch_time(0, 60000000000);
      id v19 = v86;
      id v76 = (void *)v17;
      unsigned int v77 = v32;
      if (dispatch_semaphore_wait((dispatch_semaphore_t)url_sem, v42))
      {
        int v16 = v85;
        if (sub_100035448())
        {
          BOOL v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v43) {
            sub_100036A10(v43, v44, v45, v46, v47, v48, v49, v50);
          }
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 863, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 3, 0, "no response from validation server");
      }
      else
      {
        id v56 = [(IDSServiceEmbeddedController *)self urlResponseData];

        int v16 = v85;
        if (v56)
        {
          id v57 = [(IDSServiceEmbeddedController *)self urlResponseData];
          id v87 = 0;
          v74 = +[NSJSONSerialization JSONObjectWithData:v57 options:0 error:&v87];
          id v28 = v87;

          BOOL v58 = sub_100035448();
          if (v28)
          {
            id v19 = v86;
            unsigned int v52 = (void *)v75;
            if (v58 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error in serialization", buf, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 876, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "got error in serialization");
            int v51 = 10;
            id v59 = v74;
          }
          else
          {
            id v59 = v74;
            unsigned int v52 = (void *)v75;
            if (v58 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v68 = [v74 objectForKeyedSubscript:@"isAppleCare"];
              unsigned int v69 = [v68 BOOLValue];
              *(_DWORD *)buf = 67109120;
              unsigned int v93 = v69;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to return %d", buf, 8u);
            }
            double v70 = [v74 objectForKeyedSubscript:@"isAppleCare"];
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 880, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 7, 0, "going to return %d", [v70 BOOLValue]);

            [(IDSServiceEmbeddedController *)v81 setValidationURL:0];
            [(IDSServiceEmbeddedController *)v81 setUrlResponseData:0];
            [v78 invalidateAndCancel];
            v71 = [v74 objectForKeyedSubscript:@"isAppleCare"];
            LOBYTE(v17) = [v71 BOOLValue];

            int v51 = 1;
            id v19 = v86;
          }

          goto LABEL_70;
        }
        if (sub_100035448())
        {
          BOOL v60 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v60) {
            sub_1000369D4(v60, v61, v62, v63, v64, v65, v66, v67);
          }
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 869, "-[IDSServiceEmbeddedController validateRedwoodRequestDictionary:account:fromID:error:]", 3, 0, "no data from validation server");
      }
      id v28 = 0;
      int v51 = 10;
      unsigned int v52 = (void *)v75;
LABEL_70:

      BOOL v55 = v76;
      unsigned int v32 = v77;
      goto LABEL_71;
    }
  }
  LOBYTE(v17) = 0;
LABEL_78:

  return v17 & 1;
}

- (id)datagramConnectionFromIDS:(id)a3
{
  id v4 = a3;
  v5 = [(IDSServiceEmbeddedController *)self idsService];
  id v11 = 0;
  id v6 = [v5 datagramConnectionForSessionDestination:v4 error:&v11];

  id v7 = v11;
  if (v7)
  {
    id v8 = [v7 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 906, "-[IDSServiceEmbeddedController datagramConnectionFromIDS:]", 5, 0, "NWDatagramConnection error: %s", (const char *)[v8 UTF8String]);

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (void)addActiveSession:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Add Active Session", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 915, "-[IDSServiceEmbeddedController addActiveSession:]", 7, 0, "Add Active Session");
  [(IDSServiceEmbeddedController *)self closeAllSessions];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "add active session %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 926, "-[IDSServiceEmbeddedController addActiveSession:]", 7, 0, "add active session %p", v4);
  v5 = [(IDSServiceEmbeddedController *)self activeSessions];
  id v6 = [v4 uniqueID];
  [v5 setObject:v4 forKeyedSubscript:v6];

  [(IDSServiceEmbeddedController *)self setPendingSession:0];
  id v7 = [(IDSServiceEmbeddedController *)self wallpaperSuspensionAssertion];

  if (!v7) {
    SBSAcquireWallpaperAnimationSuspensionAssertion();
  }
  if ([v4 inviterKind] == 2 || objc_msgSend(v4, "inviterKind") == 3)
  {
    id v8 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    id v9 = [v4 sessionID];
    id v10 = [(IDSServiceEmbeddedController *)self idsService];
    [(IDSServiceEmbeddedController *)self sendMessageStartScreenSend:v8 sessionID:v9 service:v10];
  }
}

- (void)removeSession:(id)a3 andEndIDSSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v11 = v4;
    __int16 v12 = 2048;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removeSession: shouldEndIDSSession:%d for session %p", buf, 0x12u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 948, "-[IDSServiceEmbeddedController removeSession:andEndIDSSession:]", 7, 0, "removeSession: shouldEndIDSSession:%d for session %p", v4, v6);
  sub_100036038(0, 0, 0.0, 0.0);
  if ([(IDSServiceEmbeddedController *)self viewServicePID] != -1)
  {
    kill([(IDSServiceEmbeddedController *)self viewServicePID], 15);
    [(IDSServiceEmbeddedController *)self setViewServicePID:0xFFFFFFFFLL];
  }
  if (v6)
  {
    id v7 = [(IDSServiceEmbeddedController *)self pendingSession];

    if (v7 == v6)
    {
      [(IDSServiceEmbeddedController *)self setPendingSession:0];
      if (!v4) {
        goto LABEL_10;
      }
    }
    else if (!v4)
    {
LABEL_10:
      id v8 = [(IDSServiceEmbeddedController *)self activeSessions];
      id v9 = [v6 uniqueID];
      [v8 removeObjectForKey:v9];

      [(IDSServiceEmbeddedController *)self checkIfNoSessions];
      goto LABEL_11;
    }
    [v6 doEndSession];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)closeAllSessions
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "closeAllSessions", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 979, "-[IDSServiceEmbeddedController closeAllSessions]", 7, 0, "closeAllSessions");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  BOOL v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(IDSServiceEmbeddedController *)self removeSession:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) andEndIDSSession:1];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)exitTimerCallback:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "exit timer called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 987, "-[IDSServiceEmbeddedController exitTimerCallback:]", 7, 0, "exit timer called");
  id v5 = [(IDSServiceEmbeddedController *)self pendingSession];
  if (v5)
  {
  }
  else
  {
    id v6 = [(IDSServiceEmbeddedController *)self activeSessions];
    id v7 = [v6 count];

    if (!v7)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "exiting", v8, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 990, "-[IDSServiceEmbeddedController exitTimerCallback:]", 7, 0, "exiting");
      exit(0);
    }
  }
  [(IDSServiceEmbeddedController *)self setExitTimer:0];
}

- (void)checkIfNoSessions
{
  v3 = [(IDSServiceEmbeddedController *)self pendingSession];
  if (v3)
  {
  }
  else
  {
    id v4 = [(IDSServiceEmbeddedController *)self activeSessions];
    id v5 = [v4 count];

    if (!v5)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no active or pending sessions", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1002, "-[IDSServiceEmbeddedController checkIfNoSessions]", 7, 0, "no active or pending sessions");
      doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
      if (doubleHeightStatusBarAssertion)
      {
        [(SBSStatusBarStyleOverridesAssertion *)doubleHeightStatusBarAssertion invalidate];
        [(IDSServiceEmbeddedController *)self setDoubleHeightStatusBarAssertion:0];
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "released status bar assertion", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1018, "-[IDSServiceEmbeddedController checkIfNoSessions]", 7, 0, "released status bar assertion");
      }
      id v7 = [(IDSServiceEmbeddedController *)self wallpaperSuspensionAssertion];

      if (v7)
      {
        id v8 = [(IDSServiceEmbeddedController *)self wallpaperSuspensionAssertion];
        [v8 invalidate];

        [(IDSServiceEmbeddedController *)self setWallpaperSuspensionAssertion:0];
      }
      _os_nospin_lock_lock();
      long long v9 = [(IDSServiceEmbeddedController *)self osTransaction];

      if (v9) {
        [(IDSServiceEmbeddedController *)self setOsTransaction:0];
      }
      _os_nospin_lock_unlock();
      long long v10 = [(IDSServiceEmbeddedController *)self exitTimer];

      if (!v10)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100010DA8;
        block[3] = &unk_100054BB8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (id)activeViewerStatusString
{
  v2 = [(IDSServiceEmbeddedController *)self activeSessions];
  v3 = [v2 allValues];
  id v4 = [v3 lastObject];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"kSSviewingScreen" value:&stru_1000553F0 table:0];
  id v7 = [v4 inviterFullName];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

  return v8;
}

- (void)createStatusBar
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "createStatusBar", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1058, "-[IDSServiceEmbeddedController createStatusBar]", 7, 0, "createStatusBar");
  if (self->_doubleHeightStatusBarAssertion)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "already have menu bar assertion", v5, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1096, "-[IDSServiceEmbeddedController createStatusBar]", 7, 0, "already have menu bar assertion");
  }
  else
  {
    v3 = [(IDSServiceEmbeddedController *)self activeViewerStatusString];
    id v4 = [objc_alloc((Class)SBSStatusBarStyleOverridesAssertion) initWithStatusBarStyleOverrides:0x4000 forPID:getpid() exclusive:1 showsWhenForeground:0];
    [(IDSServiceEmbeddedController *)self setDoubleHeightStatusBarAssertion:v4];

    [(SBSStatusBarStyleOverridesAssertion *)self->_doubleHeightStatusBarAssertion setStatusString:v3];
    [(SBSStatusBarStyleOverridesAssertion *)self->_doubleHeightStatusBarAssertion acquireWithHandler:&stru_100054D10 invalidationHandler:&stru_100054D30];
  }
}

- (void)createLockScreenNotifier
{
  if (![(IDSServiceEmbeddedController *)self lockScreenObserverActive])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100011300, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(IDSServiceEmbeddedController *)self setLockScreenObserverActive:1];
  }
}

- (void)sendLockScreenChangeMessageToAllSessions:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(IDSServiceEmbeddedController *)self activeSessions];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send screen lock change message", v11, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1116, "-[IDSServiceEmbeddedController sendLockScreenChangeMessageToAllSessions:]", 7, 0, "send screen lock change message");
        [v10 sendScreenLockChangeMessage:v3];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)askToCopyToPasteboard:(id)a3 senderToken:(unsigned int)a4 message:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v12 = a5;
  [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardDelegate:a3];
  [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardToken:v5];
  if ((unint64_t)[v12 length] > 0xC7) {
    uint64_t v8 = 200;
  }
  else {
    uint64_t v8 = (uint64_t)[v12 length];
  }
  id v9 = objc_msgSend(v12, "rangeOfComposedCharacterSequencesForRange:", 0, v8);
  long long v11 = objc_msgSend(v12, "substringWithRange:", v9, v10);
  [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardUserMessage:v11];
  [(IDSServiceEmbeddedController *)self postAskToCopyToPasteboardNotification];
}

- (void)postAskToCopyToPasteboardNotification
{
  SInt32 error = 0;
  BOOL v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 lastObject];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postAskToCopyToPasteboardNotification", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1143, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]", 7, 0, "postAskToCopyToPasteboardNotification");
  if ([(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification active - ignore request", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1147, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]", 7, 0, "notification active - ignore request");
  }
  else
  {
    [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardTimedOut:0];
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [v5 addNotificationIconTo:Mutable];
    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"kSSAddToClipboardMessage" value:&stru_1000553F0 table:0];
    id v9 = [v5 inviterFullName];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    if (v10)
    {
      long long v11 = [(IDSServiceEmbeddedController *)self askToCopyToPasteboardUserMessage];

      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v10);
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v11);
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v10);
    }
    id v12 = [v5 inviterFullName];

    if (v12) {
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v12);
    }
    MainBundle = CFBundleGetMainBundle();
    CFStringRef v14 = CFBundleCopyLocalizedString(MainBundle, @"kSSCancel", @"kSSCancel", 0);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v14);
      CFRelease(v15);
    }
    int v16 = CFBundleGetMainBundle();
    CFStringRef v17 = CFBundleCopyLocalizedString(v16, @"kSSCopy", @"kSSCopy", 0);
    if (v17)
    {
      CFStringRef v18 = v17;
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v17);
      CFRelease(v18);
    }
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
    [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
    CFRelease(Mutable);
    id v19 = [(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification];
    BOOL v20 = sub_100035448();
    if (v19)
    {
      if (v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SInt32 v27 = error;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1197, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]", 7, 0, "got error %d", error);
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification], (CFUserNotificationCallBack)sub_100011DB0, 0);
      if (RunLoopSource)
      {
        id v22 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v22, kCFRunLoopDefaultMode);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100012418;
        block[3] = &unk_100054BB8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        CFRelease(v22);
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1202, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]", 7, 0, "Failed to create run loop source for notification");
        CFRelease([(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification]);
        [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardNotification:0];
      }
    }
    else
    {
      if (v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1194, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]", 7, 0, "failed to create notification");
    }
  }
}

- (void)askToToCopyToPasteboardTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "askToToCopyToPasteboardTimeout", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1278, "-[IDSServiceEmbeddedController askToToCopyToPasteboardTimeout:]", 7, 0, "askToToCopyToPasteboardTimeout");
  [(IDSServiceEmbeddedController *)self removeAskToCopyToPasteboardNotification];
}

- (void)removeAskToCopyToPasteboardNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1284, "-[IDSServiceEmbeddedController removeAskToCopyToPasteboardNotification]", 7, 0, "remove notification called");
  if ([(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification])
  {
    [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSServiceEmbeddedController *)self askToCopyToPasteboardNotification]);
    if (v3)
    {
      SInt32 v4 = v3;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SInt32 v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1290, "-[IDSServiceEmbeddedController removeAskToCopyToPasteboardNotification]", 7, 0, "cancel err = %d", v4);
    }
    uint64_t v5 = [(IDSServiceEmbeddedController *)self askToCopyToPasteboardTimeoutTimer];

    if (v5)
    {
      id v6 = [(IDSServiceEmbeddedController *)self askToCopyToPasteboardTimeoutTimer];
      [v6 invalidate];

      [(IDSServiceEmbeddedController *)self setAskToCopyToPasteboardTimeoutTimer:0];
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1298, "-[IDSServiceEmbeddedController removeAskToCopyToPasteboardNotification]", 7, 0, "no notification");
  }
}

- (void)askToOpenURL:(id)a3 senderToken:(unsigned int)a4 URL:(id)a5 sessionController:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  if ((unint64_t)[v10 length] > 0xC7) {
    uint64_t v11 = 200;
  }
  else {
    uint64_t v11 = (uint64_t)[v10 length];
  }
  id v12 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v11);
  CFStringRef v14 = objc_msgSend(v10, "substringWithRange:", v12, v13);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v29 = [v14 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "newURL = %s", buf, 0xCu);
  }
  id v15 = v14;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1308, "-[IDSServiceEmbeddedController askToOpenURL:senderToken:URL:sessionController:]", 7, 0, "newURL = %s", (const char *)[v15 UTF8String]);
  int v16 = +[NSURL URLWithString:v15];
  CFStringRef v17 = [v16 scheme];
  if ([v17 isEqualToString:@"http"])
  {

LABEL_10:
    [(IDSServiceEmbeddedController *)self setUrlToOpen:v15];
    [(IDSServiceEmbeddedController *)self setAskToOpenURLDelegate:v9];
    [(IDSServiceEmbeddedController *)self setAskToOpenURLToken:v7];
    [(IDSServiceEmbeddedController *)self postAskToOpenURLNotification];
    goto LABEL_15;
  }
  CFStringRef v18 = [v16 scheme];
  unsigned int v19 = [v18 isEqualToString:@"https"];

  if (v19) {
    goto LABEL_10;
  }
  if (sub_100035448())
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_100036A4C(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1321, "-[IDSServiceEmbeddedController askToOpenURL:senderToken:URL:sessionController:]", 3, 0, "URL not  http or https - ignoring");
LABEL_15:
}

- (void)postAskToOpenURLNotification
{
  SInt32 error = 0;
  SInt32 v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  SInt32 v4 = [v3 allValues];
  uint64_t v5 = [v4 lastObject];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postAskToOpenURLNotification", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1334, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]", 7, 0, "postAskToOpenURLNotification");
  if ([(IDSServiceEmbeddedController *)self askToOpenURLNotification])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification active - ignore request", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1338, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]", 7, 0, "notification active - ignore request");
  }
  else
  {
    [(IDSServiceEmbeddedController *)self setAskToOpenURLTimedOut:0];
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [v5 addNotificationIconTo:Mutable];
    uint64_t v7 = +[NSBundle mainBundle];
    SInt32 v8 = [v7 localizedStringForKey:@"kSSOpenURLMessage" value:&stru_1000553F0 table:0];
    id v9 = [v5 inviterFullName];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    if (v10)
    {
      uint64_t v11 = [(IDSServiceEmbeddedController *)self urlToOpen];

      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v10);
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v11);
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v10);
    }
    id v12 = [v5 inviterFullName];

    if (v12) {
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v12);
    }
    MainBundle = CFBundleGetMainBundle();
    CFStringRef v14 = CFBundleCopyLocalizedString(MainBundle, @"kSSCancel", @"kSSCancel", 0);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v14);
      CFRelease(v15);
    }
    int v16 = CFBundleGetMainBundle();
    CFStringRef v17 = CFBundleCopyLocalizedString(v16, @"kSSOpen", @"kSSOpen", 0);
    if (v17)
    {
      CFStringRef v18 = v17;
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v17);
      CFRelease(v18);
    }
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
    [(IDSServiceEmbeddedController *)self setAskToOpenURLNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
    CFRelease(Mutable);
    if ([(IDSServiceEmbeddedController *)self askToOpenURLNotification])
    {
      if (error)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          SInt32 v25 = error;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1389, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]", 7, 0, "got error %d", error);
      }
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSServiceEmbeddedController *)self askToOpenURLNotification], (CFUserNotificationCallBack)sub_10001301C, 0);
      if (RunLoopSource)
      {
        BOOL v20 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v20, kCFRunLoopDefaultMode);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100013754;
        block[3] = &unk_100054BB8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        CFRelease(v20);
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1394, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]", 7, 0, "Failed to create run loop source for notification");
        CFRelease([(IDSServiceEmbeddedController *)self askToOpenURLNotification]);
        [(IDSServiceEmbeddedController *)self setAskToOpenURLNotification:0];
      }
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1385, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]", 7, 0, "failed to create notification");
    }
  }
}

- (void)askToOpenURLTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SInt32 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ask to open URL timed out", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1469, "-[IDSServiceEmbeddedController askToOpenURLTimeout:]", 7, 0, "ask to open URL timed out");
  [(IDSServiceEmbeddedController *)self removeAskToOpenURLNotification];
}

- (void)removeAskToOpenURLNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1476, "-[IDSServiceEmbeddedController removeAskToOpenURLNotification]", 7, 0, "remove notification called");
  if ([(IDSServiceEmbeddedController *)self askToOpenURLNotification])
  {
    [(IDSServiceEmbeddedController *)self setAskToOpenURLTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSServiceEmbeddedController *)self askToOpenURLNotification]);
    if (v3)
    {
      SInt32 v4 = v3;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SInt32 v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1482, "-[IDSServiceEmbeddedController removeAskToOpenURLNotification]", 7, 0, "cancel err = %d", v4);
    }
    uint64_t v5 = [(IDSServiceEmbeddedController *)self askToOpenURLTimeoutTimer];

    if (v5)
    {
      id v6 = [(IDSServiceEmbeddedController *)self askToOpenURLTimeoutTimer];
      [v6 invalidate];

      [(IDSServiceEmbeddedController *)self setAskToOpenURLTimeoutTimer:0];
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1490, "-[IDSServiceEmbeddedController removeAskToOpenURLNotification]", 7, 0, "no notification");
  }
}

- (void)postAskToResumeNotification:(id)a3 senderToken:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(IDSServiceEmbeddedController *)self setAskToResumeDelegate:a3];
  [(IDSServiceEmbeddedController *)self setAskToResumeToken:v4];

  [(IDSServiceEmbeddedController *)self postAskToResumeNotification];
}

- (void)postAskToResumeNotification
{
  SInt32 error = 0;
  SInt32 v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = [v4 lastObject];

  if ([(IDSServiceEmbeddedController *)self sessionPaused])
  {
    id v6 = [(IDSServiceEmbeddedController *)self askToResumeNotification];
    BOOL v7 = sub_100035448();
    if (v6)
    {
      if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification active - ignore request", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1517, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "notification active - ignore request");
    }
    else
    {
      if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unsigned int v32 = [(IDSServiceEmbeddedController *)self askToResumeNotification];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.askToResumeNotification  %p", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1520, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "self.askToResumeNotification  %p", [(IDSServiceEmbeddedController *)self askToResumeNotification]);
      [(id)qword_10005C900 setAskToResumeTimedOut:0];
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      [v5 addNotificationIconTo:Mutable];
      id v9 = +[NSBundle mainBundle];
      id v10 = [v9 localizedStringForKey:@"kSSAskToResume" value:&stru_1000553F0 table:0];
      uint64_t v11 = [v5 inviterFullName];
      id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

      if (v12)
      {
        CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v12);
      }
      uint64_t v13 = [v5 inviterFullName];

      if (v13) {
        CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v13);
      }
      MainBundle = CFBundleGetMainBundle();
      CFStringRef v15 = CFBundleCopyLocalizedString(MainBundle, @"KSSAskToResumeMessageLockScreen", @"KSSAskToResumeMessageLockScreen", 0);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v15);
        CFRelease(v16);
      }
      CFStringRef v17 = CFBundleGetMainBundle();
      CFStringRef v18 = CFBundleCopyLocalizedString(v17, @"kSSDecline", @"kSSDecline", 0);
      if (v18)
      {
        CFStringRef v19 = v18;
        CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v18);
        CFRelease(v19);
      }
      BOOL v20 = CFBundleGetMainBundle();
      CFStringRef v21 = CFBundleCopyLocalizedString(v20, @"kSSResume", @"kSSResume", 0);
      if (v21)
      {
        CFStringRef v22 = v21;
        CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v21);
        CFRelease(v22);
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "did not get string2", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1562, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "did not get string2");
      }
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
      if ([(IDSServiceEmbeddedController *)self showViewerPausedNotification]) {
        [(IDSServiceEmbeddedController *)self removeViewerPausedNotification];
      }
      [(IDSServiceEmbeddedController *)self setAskToResumeNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
      CFRelease(Mutable);
      uint64_t v23 = [(IDSServiceEmbeddedController *)self askToResumeNotification];
      BOOL v24 = sub_100035448();
      if (v23)
      {
        if (v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = error;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1576, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "got error %d", error);
        CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSServiceEmbeddedController *)self askToResumeNotification], (CFUserNotificationCallBack)sub_100014278, 0);
        if (RunLoopSource)
        {
          uint64_t v26 = RunLoopSource;
          uint64_t v27 = +[NSDate date];
          [(IDSServiceEmbeddedController *)self setNotificationStartTime:v27];

          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, v26, kCFRunLoopDefaultMode);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000148F8;
          block[3] = &unk_100054BB8;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          CFRelease(v26);
        }
        else
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1581, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "Failed to create run loop source for notification");
          CFRelease([(IDSServiceEmbeddedController *)self askToResumeNotification]);
          [(IDSServiceEmbeddedController *)self setAskToResumeNotification:0];
        }
      }
      else
      {
        if (v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1573, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "failed to create notification");
      }
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "not paused - ignore request", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1511, "-[IDSServiceEmbeddedController postAskToResumeNotification]", 7, 0, "not paused - ignore request");
  }
}

- (void)askToResumeTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "askToResumeTimeout", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1657, "-[IDSServiceEmbeddedController askToResumeTimeout:]", 7, 0, "askToResumeTimeout");
  [(IDSServiceEmbeddedController *)self removeUserAskToResumeNotification];
}

- (void)removeUserAskToResumeNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1663, "-[IDSServiceEmbeddedController removeUserAskToResumeNotification]", 7, 0, "remove notification called");
  if ([(IDSServiceEmbeddedController *)self askToResumeNotification])
  {
    [(IDSServiceEmbeddedController *)self setAskToResumeTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSServiceEmbeddedController *)self askToResumeNotification]);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1668, "-[IDSServiceEmbeddedController removeUserAskToResumeNotification]", 7, 0, "cancel err = %d", v3);
    uint64_t v4 = [(IDSServiceEmbeddedController *)self askToResumeTimeoutTimer];

    if (v4)
    {
      uint64_t v5 = [(IDSServiceEmbeddedController *)self askToResumeTimeoutTimer];
      [v5 invalidate];

      [(IDSServiceEmbeddedController *)self setAskToResumeTimeoutTimer:0];
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1676, "-[IDSServiceEmbeddedController removeUserAskToResumeNotification]", 7, 0, "no notification");
  }
}

- (void)showMessageToUser:(id)a3
{
  id v8 = a3;
  if ((unint64_t)[v8 length] > 0xC7) {
    uint64_t v4 = 200;
  }
  else {
    uint64_t v4 = (uint64_t)[v8 length];
  }
  id v5 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, v4);
  SInt32 v7 = objc_msgSend(v8, "substringWithRange:", v5, v6);
  [(IDSServiceEmbeddedController *)self setShowUserMessage:v7];
  [(IDSServiceEmbeddedController *)self postShowUserMessageNotification];
}

- (void)postShowUserMessageNotification
{
  SInt32 error = 0;
  SInt32 v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  uint64_t v4 = [v3 allValues];
  id v5 = [v4 lastObject];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postShowUserMessageNotification", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1698, "-[IDSServiceEmbeddedController postShowUserMessageNotification]", 7, 0, "postShowUserMessageNotification");
  if ([(IDSServiceEmbeddedController *)self showUserMessageNotification])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification active - ignore request", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1702, "-[IDSServiceEmbeddedController postShowUserMessageNotification]", 7, 0, "notification active - ignore request");
  }
  else
  {
    [(IDSServiceEmbeddedController *)self setShowUserMessageTimedOut:0];
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [v5 addNotificationIconTo:Mutable];
    SInt32 v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"kSSSentMessage" value:&stru_1000553F0 table:0];
    id v9 = [v5 inviterFullName];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    if (v10)
    {
      uint64_t v11 = [(IDSServiceEmbeddedController *)self showUserMessage];

      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v10);
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v11);
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v10);
    }
    id v12 = [v5 inviterFullName];

    if (v12) {
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v12);
    }
    MainBundle = CFBundleGetMainBundle();
    CFStringRef v14 = CFBundleCopyLocalizedString(MainBundle, @"kSSOK", @"kSSOK", 0);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v14);
      CFRelease(v15);
    }
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
    [(IDSServiceEmbeddedController *)self setShowUserMessageNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
    CFRelease(Mutable);
    if ([(IDSServiceEmbeddedController *)self showUserMessageNotification])
    {
      if (error)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          SInt32 v22 = error;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1746, "-[IDSServiceEmbeddedController postShowUserMessageNotification]", 7, 0, "got error %d", error);
      }
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSServiceEmbeddedController *)self showUserMessageNotification], (CFUserNotificationCallBack)sub_1000152EC, 0);
      if (RunLoopSource)
      {
        CFStringRef v17 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v17, kCFRunLoopDefaultMode);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001581C;
        block[3] = &unk_100054BB8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        CFRelease(v17);
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1751, "-[IDSServiceEmbeddedController postShowUserMessageNotification]", 7, 0, "Failed to create run loop source for notification");
        CFRelease([(IDSServiceEmbeddedController *)self showUserMessageNotification]);
        [(IDSServiceEmbeddedController *)self setShowUserMessageNotification:0];
      }
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1742, "-[IDSServiceEmbeddedController postShowUserMessageNotification]", 7, 0, "failed to create notification");
    }
  }
}

- (void)showUserMessageTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showUserMessageTimeout", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1820, "-[IDSServiceEmbeddedController showUserMessageTimeout:]", 7, 0, "showUserMessageTimeout");
  [(IDSServiceEmbeddedController *)self removeShowUserMessageNotification];
}

- (void)removeShowUserMessageNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1826, "-[IDSServiceEmbeddedController removeShowUserMessageNotification]", 7, 0, "remove notification called");
  if ([(IDSServiceEmbeddedController *)self showUserMessageNotification])
  {
    [(IDSServiceEmbeddedController *)self setShowUserMessageTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSServiceEmbeddedController *)self showUserMessageNotification]);
    if (v3)
    {
      SInt32 v4 = v3;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SInt32 v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1832, "-[IDSServiceEmbeddedController removeShowUserMessageNotification]", 7, 0, "cancel err = %d", v4);
    }
    id v5 = [(IDSServiceEmbeddedController *)self showUserMessageTimeoutTimer];

    if (v5)
    {
      uint64_t v6 = [(IDSServiceEmbeddedController *)self showUserMessageTimeoutTimer];
      [v6 invalidate];

      [(IDSServiceEmbeddedController *)self setShowUserMessageTimeoutTimer:0];
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1840, "-[IDSServiceEmbeddedController removeShowUserMessageNotification]", 7, 0, "no notification");
  }
}

- (void)postViewerPausedMessageNotification
{
  SInt32 error = 0;
  SInt32 v3 = [(IDSServiceEmbeddedController *)self activeSessions];
  SInt32 v4 = [v3 allValues];
  id v5 = [v4 lastObject];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "postViewerPausedMessageNotification", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1853, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]", 7, 0, "postViewerPausedMessageNotification");
  if ([(IDSServiceEmbeddedController *)self showViewerPausedNotification])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification active - ignore request", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1857, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]", 7, 0, "notification active - ignore request");
  }
  else
  {
    [(IDSServiceEmbeddedController *)self setShowViewerPausedTimedOut:0];
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [v5 addNotificationIconTo:Mutable];
    SInt32 v7 = +[NSBundle mainBundle];
    SInt32 v8 = [v7 localizedStringForKey:@"kSSPaused" value:&stru_1000553F0 table:0];
    id v9 = [v5 inviterFullName];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    if (v10)
    {
      CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v10);
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertMessageKey, v10);
    }
    uint64_t v11 = [v5 inviterFullName];

    if (v11) {
      CFDictionaryAddValue(Mutable, SBUserNotificationLockScreenAlertHeaderKey, v11);
    }
    MainBundle = CFBundleGetMainBundle();
    CFStringRef v13 = CFBundleCopyLocalizedString(MainBundle, @"kSSOK", @"kSSOK", 0);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFDictionaryAddValue(Mutable, kCFUserNotificationOtherButtonTitleKey, v13);
      CFRelease(v14);
    }
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
    [(IDSServiceEmbeddedController *)self setShowViewerPausedNotification:CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, Mutable)];
    CFRelease(Mutable);
    if ([(IDSServiceEmbeddedController *)self showViewerPausedNotification])
    {
      if (error)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          SInt32 v21 = error;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got error %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1900, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]", 7, 0, "got error %d", error);
      }
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, [(IDSServiceEmbeddedController *)self showViewerPausedNotification], (CFUserNotificationCallBack)sub_100016148, 0);
      if (RunLoopSource)
      {
        CFStringRef v16 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v16, kCFRunLoopDefaultMode);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001627C;
        block[3] = &unk_100054BB8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        CFRelease(v16);
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create run loop source for notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1905, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]", 7, 0, "Failed to create run loop source for notification");
        CFRelease([(IDSServiceEmbeddedController *)self showViewerPausedNotification]);
        [(IDSServiceEmbeddedController *)self setShowViewerPausedNotification:0];
      }
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create notification", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1896, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]", 7, 0, "failed to create notification");
    }
  }
}

- (void)showViewerPausedTimeout:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SInt32 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showViewerPausedTimeout", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1936, "-[IDSServiceEmbeddedController showViewerPausedTimeout:]", 7, 0, "showViewerPausedTimeout");
  [(IDSServiceEmbeddedController *)self removeViewerPausedNotification];
}

- (void)removeViewerPausedNotification
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remove notification called", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1942, "-[IDSServiceEmbeddedController removeViewerPausedNotification]", 7, 0, "remove notification called");
  if ([(IDSServiceEmbeddedController *)self showViewerPausedNotification])
  {
    [(IDSServiceEmbeddedController *)self setShowViewerPausedTimedOut:1];
    SInt32 v3 = CFUserNotificationCancel([(IDSServiceEmbeddedController *)self showViewerPausedNotification]);
    if (v3)
    {
      SInt32 v4 = v3;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SInt32 v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel err = %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1948, "-[IDSServiceEmbeddedController removeViewerPausedNotification]", 7, 0, "cancel err = %d", v4);
    }
    id v5 = [(IDSServiceEmbeddedController *)self showViewerPausedTimeoutTimer];

    if (v5)
    {
      uint64_t v6 = [(IDSServiceEmbeddedController *)self showViewerPausedTimeoutTimer];
      [v6 invalidate];

      [(IDSServiceEmbeddedController *)self setShowViewerPausedTimeoutTimer:0];
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1956, "-[IDSServiceEmbeddedController removeViewerPausedNotification]", 7, 0, "no notification");
  }
}

- (void)pauseScreenSharing:(BOOL)a3 pausingDueToScreenLock:(BOOL)a4
{
  BOOL v5 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v25 = v5;
    __int16 v26 = 1024;
    unsigned int v27 = [(IDSServiceEmbeddedController *)self sessionPaused];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pauseScreenSharing %d  %d", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1962, "-[IDSServiceEmbeddedController pauseScreenSharing:pausingDueToScreenLock:]", 7, 0, "pauseScreenSharing %d  %d", v5, [(IDSServiceEmbeddedController *)self sessionPaused]);
  if ([(IDSServiceEmbeddedController *)self sessionPaused] == v5)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1988, "-[IDSServiceEmbeddedController pauseScreenSharing:pausingDueToScreenLock:]", 7, 0, "ignore");
  }
  else
  {
    [(IDSServiceEmbeddedController *)self setSessionPaused:v5];
    doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
    if (v5)
    {
      SInt32 v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"kSSScreenSharingPaused" value:&stru_1000553F0 table:0];
      id v10 = +[NSString stringWithFormat:@"%@", v9];
      [(SBSStatusBarStyleOverridesAssertion *)doubleHeightStatusBarAssertion setStatusString:v10];

      if (!a4) {
        [(IDSServiceEmbeddedController *)self setScreenPausedBeforeLock:1];
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = [(IDSServiceEmbeddedController *)self screenPausedBeforeLock];
        *(_DWORD *)buf = 67109120;
        int v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen paused before lock %d", buf, 8u);
      }
      [(IDSServiceEmbeddedController *)self screenPausedBeforeLock];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1973, "-[IDSServiceEmbeddedController pauseScreenSharing:pausingDueToScreenLock:]", 7, 0, "screen paused before lock %d");
    }
    else
    {
      id v12 = [(IDSServiceEmbeddedController *)self activeViewerStatusString];
      [(SBSStatusBarStyleOverridesAssertion *)doubleHeightStatusBarAssertion setStatusString:v12];

      [(IDSServiceEmbeddedController *)self setScreenPausedBeforeLock:0];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen not paused", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1981, "-[IDSServiceEmbeddedController pauseScreenSharing:pausingDueToScreenLock:]", 7, 0, "screen not paused");
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    CFStringRef v13 = [(IDSServiceEmbeddedController *)self activeSessions];
    CFStringRef v14 = [v13 allValues];

    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        CFStringRef v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) pauseVideoSending:v5];
          CFStringRef v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (void)inviteWasAccepted:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(IDSServiceEmbeddedController *)self idsService];
    *(_DWORD *)buf = 134217984;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invite accepted   self.idsService %p", buf, 0xCu);
  }
  uint64_t v6 = [(IDSServiceEmbeddedController *)self idsService];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1996, "-[IDSServiceEmbeddedController inviteWasAccepted:]", 7, 0, "invite accepted   self.idsService %p", v6);

  if ([v4 inviterKind] == 2 || objc_msgSend(v4, "inviterKind") == 3)
  {
    SInt32 v7 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    SInt32 v8 = [v4 sessionID];
    id v9 = [(IDSServiceEmbeddedController *)self idsService];
    [(IDSServiceEmbeddedController *)self sendMessageInviteAccepted:v7 sessionID:v8 service:v9];
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "do not send invite accpeted message", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2000, "-[IDSServiceEmbeddedController inviteWasAccepted:]", 7, 0, "do not send invite accpeted message");
  }
}

- (void)pauseScreenSharing:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v7 = v3;
    __int16 v8 = 1024;
    unsigned int v9 = [(IDSServiceEmbeddedController *)self sessionPaused];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pauseScreenSharing %d  %d", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2008, "-[IDSServiceEmbeddedController pauseScreenSharing:]", 7, 0, "pauseScreenSharing %d  %d", v3, [(IDSServiceEmbeddedController *)self sessionPaused]);
  [(IDSServiceEmbeddedController *)self pauseScreenSharing:v3 pausingDueToScreenLock:0];
  BOOL v5 = [(IDSServiceEmbeddedController *)self vsHelper];
  [v5 sendSessionInfoToClient];
}

- (void)pauseResumeResult:(id)a3
{
  id v4 = [a3 objectForKey:@"result"];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = [v4 integerValue];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pauseResumeResult: %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2018, "-[IDSServiceEmbeddedController pauseResumeResult:]", 7, 0, "pauseResumeResult: %ld", [v4 integerValue]);
  switch([v4 integerValue])
  {
    case 0u:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cancel chosen", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2024, "-[IDSServiceEmbeddedController pauseResumeResult:]", 7, 0, "cancel chosen");
      break;
    case 1u:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pause chosen", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2028, "-[IDSServiceEmbeddedController pauseResumeResult:]", 7, 0, "pause chosen");
      BOOL v5 = self;
      uint64_t v6 = 1;
      goto LABEL_17;
    case 2u:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "resume chosen", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2033, "-[IDSServiceEmbeddedController pauseResumeResult:]", 7, 0, "resume chosen");
      BOOL v5 = self;
      uint64_t v6 = 0;
LABEL_17:
      [(IDSServiceEmbeddedController *)v5 pauseScreenSharing:v6];
      break;
    case 3u:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "end session chosen", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2038, "-[IDSServiceEmbeddedController pauseResumeResult:]", 7, 0, "end session chosen");
      [(IDSServiceEmbeddedController *)self closeAllSessions];
      break;
    default:
      break;
  }
  [(IDSServiceEmbeddedController *)self setViewServicePID:0xFFFFFFFFLL];
}

- (void)sessionState:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v19[0]) = [(IDSServiceEmbeddedController *)self sessionPaused];
    WORD2(v19[0]) = 1024;
    *(_DWORD *)((char *)v19 + 6) = [(IDSServiceEmbeddedController *)self screenLocked];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sessionState is called, paused:%d, screenLocked:%d", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2047, "-[IDSServiceEmbeddedController sessionState:]", 7, 0, "sessionState is called, paused:%d, screenLocked:%d", [(IDSServiceEmbeddedController *)self sessionPaused], [(IDSServiceEmbeddedController *)self screenLocked]);
  if (v4)
  {
    BOOL v5 = +[NSNumber numberWithBool:[(IDSServiceEmbeddedController *)self sessionPaused]];
    [v4 setObject:v5 forKeyedSubscript:@"paused"];

    uint64_t v6 = +[NSNumber numberWithBool:[(IDSServiceEmbeddedController *)self screenLocked]];
    [v4 setObject:v6 forKeyedSubscript:@"screenLocked"];

    BOOL v7 = [(IDSServiceEmbeddedController *)self activeSessions];
    id v8 = [v7 allValues];
    unsigned int v9 = [v8 lastObject];

    if (!v9)
    {
      unsigned int v9 = [(IDSServiceEmbeddedController *)self pendingSession];
    }
    id v10 = [v9 inviterFullName];
    [v4 setObject:v10 forKeyedSubscript:@"viewerName"];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 objectForKeyedSubscript:@"viewerName"];
      id v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315138;
      v19[0] = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer info %s", buf, 0xCu);
    }
    id v13 = [v4 objectForKeyedSubscript:@"viewerName"];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2060, "-[IDSServiceEmbeddedController sessionState:]", 7, 0, "viewer info %s", (const char *)[v13 UTF8String]);

    CFStringRef v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 inviterKind] == 3);
    [v4 setObject:v14 forKeyedSubscript:@"isAppleSupportRequest"];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v4 description];
      id v16 = [v15 UTF8String];
      *(_DWORD *)buf = 136315138;
      v19[0] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "returning sessionState: %s", buf, 0xCu);
    }
    id v17 = [v4 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2065, "-[IDSServiceEmbeddedController sessionState:]", 7, 0, "returning sessionState: %s", (const char *)[v17 UTF8String]);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dictionary is nil", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2068, "-[IDSServiceEmbeddedController sessionState:]", 7, 0, "dictionary is nil");
  }
}

- (void)termsAndConditionsResult:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    *(_DWORD *)buf = 136315138;
    id v19 = [v5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms and conditions result  %s", buf, 0xCu);
  }
  id v6 = [v4 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2074, "-[IDSServiceEmbeddedController termsAndConditionsResult:]", 7, 0, "terms and conditions result  %s", (const char *)[v6 UTF8String]);

  BOOL v7 = [v4 objectForKey:@"result"];
  if (!v7)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no result", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2077, "-[IDSServiceEmbeddedController termsAndConditionsResult:]", 7, 0, "no result");
  }
  if ([v7 BOOLValue])
  {
    id v8 = [(IDSServiceEmbeddedController *)self pendingSession];
    if ([v8 inviterKind] == 2)
    {

      goto LABEL_17;
    }
    unsigned int v9 = [(IDSServiceEmbeddedController *)self pendingSession];
    unsigned int v10 = [v9 inviterKind];

    if (v10 == 3)
    {
LABEL_17:
      id v11 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
      id v12 = [(IDSServiceEmbeddedController *)self pendingSession];
      id v13 = [v12 sessionID];
      CFStringRef v14 = [(IDSServiceEmbeddedController *)self idsService];
      [(IDSServiceEmbeddedController *)self sendMessageTCAccepted:v11 sessionID:v13 service:v14];

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sent terms and condition accepted message", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2083, "-[IDSServiceEmbeddedController termsAndConditionsResult:]", 7, 0, "sent terms and condition accepted message");
      goto LABEL_21;
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(IDSServiceEmbeddedController *)self pendingSession];
      *(_DWORD *)buf = 134217984;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "not applecare  pending session %p", buf, 0xCu);
    }
    id v17 = [(IDSServiceEmbeddedController *)self pendingSession];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2086, "-[IDSServiceEmbeddedController termsAndConditionsResult:]", 7, 0, "not applecare  pending session %p", v17);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms not accepted", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2089, "-[IDSServiceEmbeddedController termsAndConditionsResult:]", 7, 0, "terms not accepted");
  }
LABEL_21:
  id v15 = [(IDSServiceEmbeddedController *)self pendingSession];
  [v15 termsAndConditionsResult:v4];
}

- (void)pidNotification:(id)a3
{
  id v4 = [a3 objectForKey:@"pid"];
  -[IDSServiceEmbeddedController setViewServicePID:](self, "setViewServicePID:", [v4 intValue]);

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v6 = [(IDSServiceEmbeddedController *)self viewServicePID];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pidNotification: %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2096, "-[IDSServiceEmbeddedController pidNotification:]", 7, 0, "pidNotification: %d", [(IDSServiceEmbeddedController *)self viewServicePID]);
}

- (BOOL)validInviteDictionary:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 valueForKey:@"avconference"];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v12 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    unsigned int v6 = [v4 valueForKey:@"com.apple.private.applecare"];
    if (!v6) {
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_33;
    }
    BOOL v7 = [v6 objectForKeyedSubscript:@"sessionToken"];
    if (!v7) {
      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    id v8 = [v6 objectForKeyedSubscript:@"resourcepath"];

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_44;
      }
      BOOL v7 = [v6 objectForKeyedSubscript:@"isprod"];

      if (!v7) {
        goto LABEL_34;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      id v8 = [v6 objectForKeyedSubscript:@"aaToken"];

      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_44;
        }
      }
      BOOL v7 = [v6 objectForKeyedSubscript:@"timeout"];

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_34;
        }
      }
      id v8 = [v6 objectForKeyedSubscript:@"appleName"];

      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v7 = [v6 objectForKeyedSubscript:@"shareType"];

        if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFStringRef v14 = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invite dictionary is ok", v14, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2149, "-[IDSServiceEmbeddedController validInviteDictionary:]", 7, 0, "invite dictionary is ok");

LABEL_24:
          unsigned int v9 = [v4 objectForKeyedSubscript:@"cmd"];
          if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            BOOL v12 = 0;
          }
          else
          {
            unsigned int v10 = [v4 objectForKeyedSubscript:@"version"];
            if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              BOOL v12 = 0;
            }
            else
            {
              id v11 = [v4 objectForKeyedSubscript:@"sessionID"];
              BOOL v12 = 1;
              if (v11)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  BOOL v12 = 0;
                }
              }
            }
          }

          goto LABEL_41;
        }
      }
      else
      {
LABEL_44:
        BOOL v7 = v8;
      }
    }
    else
    {
LABEL_33:
      BOOL v7 = 0;
    }
LABEL_34:

    BOOL v12 = 0;
LABEL_41:

    goto LABEL_42;
  }
  BOOL v12 = 0;
LABEL_43:

  return v12;
}

- (void)dealloc
{
  [(IDSServiceEmbeddedController *)self setSanitizedFromID:0];
  [(IDSServiceEmbeddedController *)self setValidationURL:0];
  [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
  [(IDSServiceEmbeddedController *)self setUrlResponseData:0];
  [(IDSServiceEmbeddedController *)self setValidationURL:0];
  [(IDSServiceEmbeddedController *)self setVsHelper:0];
  [(IDSServiceEmbeddedController *)self setExitTimer:0];
  [(IDSServiceEmbeddedController *)self setWallpaperSuspensionAssertion:0];
  [(IDSServiceEmbeddedController *)self setNotificationStartTime:0];
  [(IDSServiceEmbeddedController *)self setUrlToOpen:0];
  [(IDSServiceEmbeddedController *)self setActiveSessions:0];
  [(IDSServiceEmbeddedController *)self setPendingSession:0];
  id v3 = [(IDSServiceEmbeddedController *)self idsService];
  [v3 removeDelegate:self];

  [(IDSServiceEmbeddedController *)self setIdsService:0];
  v4.receiver = self;
  v4.super_class = (Class)IDSServiceEmbeddedController;
  [(IDSServiceEmbeddedController *)&v4 dealloc];
}

- (void)sendMessageShareStatusResult:(id)a3 systemInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 description];
    *(_DWORD *)buf = 136315138;
    id v16 = [v8 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "share status result info %s", buf, 0xCu);
  }
  id v9 = [v6 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2194, "-[IDSServiceEmbeddedController sendMessageShareStatusResult:systemInfo:]", 7, 0, "share status result info %s", (const char *)[v9 UTF8String]);

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    id v11 = [v10 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send to %s", buf, 0xCu);
  }
  id v12 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2195, "-[IDSServiceEmbeddedController sendMessageShareStatusResult:systemInfo:]", 7, 0, "send to %s", (const char *)[v12 UTF8String]);

  id v13 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  CFStringRef v14 = [(IDSServiceEmbeddedController *)self idsService];
  [(IDSServiceEmbeddedController *)self sendMessageShareStatusResultInfo:v13 sessionID:v7 service:v14 systemInfo:v6];
}

- (void)sendMessageShareSettingsUserDecline:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "share status user decline", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2201, "-[IDSServiceEmbeddedController sendMessageShareSettingsUserDecline:]", 7, 0, "share status user decline");
  id v5 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  id v6 = [(IDSServiceEmbeddedController *)self idsService];
  [(IDSServiceEmbeddedController *)self sendMessageStatusMessage:v5 sessionID:v4 service:v6 status:@"UserDeclined"];
}

- (void)sendMessageInviteDisplayed:(id)a3 sessionID:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invite displayed", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2207, "-[IDSServiceEmbeddedController sendMessageInviteDisplayed:sessionID:service:]", 7, 0, "invite displayed");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    id v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136315394;
    id v15 = v12;
    __int16 v16 = 2048;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send to %s with service %p", buf, 0x16u);
  }
  id v13 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2208, "-[IDSServiceEmbeddedController sendMessageInviteDisplayed:sessionID:service:]", 7, 0, "send to %s with service %p", (const char *)[v13 UTF8String], v8);

  [(IDSServiceEmbeddedController *)self sendMessageStatusMessage:v10 sessionID:v9 service:v8 status:@"InviteDisplayed"];
}

- (void)sendMessageAutoAccept:(id)a3 sessionID:(id)a4 service:(id)a5
{
}

- (void)sendMessageInviteIgnored:(id)a3 sessionID:(id)a4 service:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:@"InviteIgnored", @"status", a4, @"sessionID", a6, @"REASON", 0];
  [(IDSServiceEmbeddedController *)self sendServiceMessage:v12 destination:v11 service:v10];
}

- (void)sendMessageInviteAccepted:(id)a3 sessionID:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    *(_DWORD *)buf = 136315394;
    id v14 = [v11 UTF8String];
    __int16 v15 = 2048;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invite accepted - send to %s with service %p", buf, 0x16u);
  }
  id v12 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2229, "-[IDSServiceEmbeddedController sendMessageInviteAccepted:sessionID:service:]", 7, 0, "invite accepted - send to %s with service %p", (const char *)[v12 UTF8String], v8);

  [(IDSServiceEmbeddedController *)self sendMessageStatusMessage:v10 sessionID:v9 service:v8 status:@"InviteAccepted"];
}

- (void)sendMessageTCAccepted
{
  id v6 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  id v3 = [(IDSServiceEmbeddedController *)self pendingSession];
  id v4 = [v3 sessionID];
  id v5 = [(IDSServiceEmbeddedController *)self idsService];
  [(IDSServiceEmbeddedController *)self sendMessageTCAccepted:v6 sessionID:v4 service:v5];
}

- (void)sendMessageTCAccepted:(id)a3 sessionID:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
    *(_DWORD *)buf = 136315394;
    id v14 = [v11 UTF8String];
    __int16 v15 = 2048;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TC accepted - send to %s with service %p", buf, 0x16u);
  }
  id v12 = [(IDSServiceEmbeddedController *)self sanitizedFromID];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2240, "-[IDSServiceEmbeddedController sendMessageTCAccepted:sessionID:service:]", 7, 0, "TC accepted - send to %s with service %p", (const char *)[v12 UTF8String], v8);

  [(IDSServiceEmbeddedController *)self sendMessageStatusMessage:v10 sessionID:v9 service:v8 status:@"TCAccepted"];
}

- (void)sendMessageStartScreenSend:(id)a3 sessionID:(id)a4 service:(id)a5
{
}

- (void)sendMessageStatusMessage:(id)a3 sessionID:(id)a4 service:(id)a5 status:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = [v12 UTF8String];
    __int16 v23 = 2080;
    id v24 = [v10 UTF8String];
    __int16 v25 = 2048;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "status message %s destination %s service %p", buf, 0x20u);
  }
  id v14 = v12;
  __int16 v15 = (const char *)[v14 UTF8String];
  id v16 = v10;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2251, "-[IDSServiceEmbeddedController sendMessageStatusMessage:sessionID:service:status:]", 7, 0, "status message %s destination %s service %p", v15, (const char *)[v16 UTF8String], v11);
  id v17 = +[NSDictionary dictionaryWithObjectsAndKeys:v14, @"status", v13, @"sessionID", 0];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v17 description];
    id v19 = [v18 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "status message dict %s", buf, 0xCu);
  }
  id v20 = [v17 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2256, "-[IDSServiceEmbeddedController sendMessageStatusMessage:sessionID:service:status:]", 7, 0, "status message dict %s", (const char *)[v20 UTF8String]);

  [(IDSServiceEmbeddedController *)self sendServiceMessage:v17 destination:v16 service:v11];
}

- (void)sendMessageShareStatusResultInfo:(id)a3 sessionID:(id)a4 service:(id)a5 systemInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [v10 setObject:a4 forKeyedSubscript:@"sessionID"];
  [v10 setObject:@"Settings" forKeyedSubscript:@"status"];
  [(IDSServiceEmbeddedController *)self sendServiceMessage:v10 destination:v12 service:v11];
}

- (void)sendMessageShareStatusUserDeclined:(id)a3 sessionID:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:@"UserDeclined", @"status", a4, @"sessionID", 0];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v10 description];
    *(_DWORD *)buf = 136315138;
    id v14 = [v11 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "decline status request %s", buf, 0xCu);
  }
  id v12 = [v10 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2274, "-[IDSServiceEmbeddedController sendMessageShareStatusUserDeclined:sessionID:service:]", 7, 0, "decline status request %s", (const char *)[v12 UTF8String]);

  [(IDSServiceEmbeddedController *)self sendServiceMessage:v10 destination:v9 service:v8];
}

- (void)sendServiceMessage:(id)a3 destination:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v28[0] = IDSSendMessageOptionFireAndForgetKey;
  v28[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v29[0] = &__kCFBooleanTrue;
  v29[1] = &__kCFBooleanTrue;
  v28[2] = IDSSendMessageOptionAlwaysSkipSelfKey;
  v29[2] = &__kCFBooleanTrue;
  id v10 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 description];
    *(_DWORD *)buf = 136315650;
    *(void *)__int16 v25 = [v11 UTF8String];
    *(_WORD *)&v25[8] = 2080;
    *(void *)&v25[10] = [v8 UTF8String];
    __int16 v26 = 2048;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sendServiceMessage dict = %s  destination %s  sercice %p", buf, 0x20u);
  }
  id v12 = [v7 description];
  id v13 = (const char *)[v12 UTF8String];
  id v14 = v8;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2289, "-[IDSServiceEmbeddedController sendServiceMessage:destination:service:]", 7, 0, "sendServiceMessage dict = %s  destination %s  sercice %p", v13, (const char *)[v14 UTF8String], v9);

  __int16 v15 = +[NSSet setWithObject:v14];
  id v22 = 0;
  id v23 = 0;
  unsigned int v16 = [v9 sendMessage:v7 toDestinations:v15 priority:300 options:v10 identifier:&v23 error:&v22];
  id v17 = v23;
  id v18 = v22;

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v17 UTF8String];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)__int16 v25 = v16;
    *(_WORD *)&v25[4] = 2080;
    *(void *)&v25[6] = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sendMessage result %d message uuid %s", buf, 0x12u);
  }
  id v20 = v17;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2296, "-[IDSServiceEmbeddedController sendServiceMessage:destination:service:]", 7, 0, "sendMessage result %d message uuid %s", v16, (const char *)[v20 UTF8String]);
  if (v18)
  {
    id v21 = [v18 description];
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2298, "-[IDSServiceEmbeddedController sendServiceMessage:destination:service:]", 7, 0, "sendMessage error: %s", (const char *)[v21 UTF8String]);
  }
}

- (void)initViewServiceHelper
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001915C;
  block[3] = &unk_100054BB8;
  block[4] = self;
  if (qword_10005C908 != -1) {
    dispatch_once(&qword_10005C908, block);
  }
}

- (BOOL)inviterIsInActiveSession:(id)a3
{
  id v4 = a3;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "check if %s in active session", buf, 0xCu);
  }
  id v5 = v4;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2314, "-[IDSServiceEmbeddedController inviterIsInActiveSession:]", 7, 0, "check if %s in active session", (const char *)[v5 UTF8String]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(IDSServiceEmbeddedController *)self activeSessions];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v12 inviterID];
          id v14 = [v13 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v26 = v14;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "check active session inviterID %s", buf, 0xCu);
        }
        id v15 = [v12 inviterID];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2317, "-[IDSServiceEmbeddedController inviterIsInActiveSession:]", 7, 0, "check active session inviterID %s", (const char *)[v15 UTF8String]);

        unsigned int v16 = [v12 inviterID];
        unsigned __int8 v17 = [v16 isEqualToString:v5];

        if (v17)
        {
          BOOL v18 = 1;
          goto LABEL_17;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_17:

  return v18;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v6 = a5;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hasBeenDeliveredWithContext %s", buf, 0xCu);
  }
  id v7 = v6;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2329, "-[IDSServiceEmbeddedController service:account:identifier:hasBeenDeliveredWithContext:]", 7, 0, "hasBeenDeliveredWithContext %s", (const char *)[v7 UTF8String]);
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incomingPendingMessageOfType", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2334, "-[IDSServiceEmbeddedController service:account:incomingPendingMessageOfType:fromID:context:]", 7, 0, "incomingPendingMessageOfType");
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "connectedDevicesChanged", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2339, "-[IDSServiceEmbeddedController service:connectedDevicesChanged:]", 7, 0, "connectedDevicesChanged");
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "linkedDevicesChanged", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2344, "-[IDSServiceEmbeddedController service:linkedDevicesChanged:]", 7, 0, "linkedDevicesChanged");
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 sentBytes:(int64_t)a6 totalBytes:(int64_t)a7
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sentBytes", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2349, "-[IDSServiceEmbeddedController service:account:identifier:sentBytes:totalBytes:]", 7, 0, "sentBytes");
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incomingData", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2353, "-[IDSServiceEmbeddedController service:account:incomingData:fromID:context:]", 7, 0, "incomingData");
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incomingUnhandledProtobuf", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2357, "-[IDSServiceEmbeddedController service:account:incomingUnhandledProtobuf:fromID:context:]", 7, 0, "incomingUnhandledProtobuf");
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incomingResourceAtURL", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2361, "-[IDSServiceEmbeddedController service:account:incomingResourceAtURL:fromID:context:]", 7, 0, "incomingResourceAtURL");
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "incomingResourceAtURL", v8, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2365, "-[IDSServiceEmbeddedController service:account:incomingResourceAtURL:metadata:fromID:context:]", 7, 0, "incomingResourceAtURL");
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2370, "-[IDSServiceEmbeddedController service:activeAccountsChanged:]", 7, 0, "activeAccountsChanged");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "devicesChanged", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2374, "-[IDSServiceEmbeddedController service:devicesChanged:]", 7, 0, "devicesChanged");
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "nearbyDevicesChanged", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2378, "-[IDSServiceEmbeddedController service:nearbyDevicesChanged:]", 7, 0, "nearbyDevicesChanged");
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v9 = a5;
  id v10 = a7;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v14 = v8;
    __int16 v15 = 2048;
    id v16 = [v10 code];
    __int16 v17 = 2080;
    id v18 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didSendWithSuccess success %d error code %ld  id %s", buf, 0x1Cu);
  }
  id v11 = [v10 code];
  id v12 = v9;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2382, "-[IDSServiceEmbeddedController service:account:identifier:didSendWithSuccess:error:]", 7, 0, "didSendWithSuccess success %d error code %ld  id %s", v8, v11, (const char *)[v12 UTF8String]);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  id v10 = a5;
  id v11 = a7;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v15 = v9;
    __int16 v16 = 2048;
    id v17 = [v11 code];
    __int16 v18 = 2080;
    id v19 = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didSendWithSuccess success %d error code %ld  id %s", buf, 0x1Cu);
  }
  id v12 = [v11 code];
  id v13 = v10;
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2386, "-[IDSServiceEmbeddedController service:account:identifier:didSendWithSuccess:error:context:]", 7, 0, "didSendWithSuccess success %d error code %ld  id %s", v9, v12, (const char *)[v13 UTF8String]);
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "serviceSpaceDidBecomeAvailable", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2390, "-[IDSServiceEmbeddedController serviceSpaceDidBecomeAvailable:]", 7, 0, "serviceSpaceDidBecomeAvailable");
}

- (void)serviceAllowedTrafficClassifiersDidReset:(id)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "serviceAllowedTrafficClassifiersDidReset", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2394, "-[IDSServiceEmbeddedController serviceAllowedTrafficClassifiersDidReset:]", 7, 0, "serviceAllowedTrafficClassifiersDidReset");
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsService:(id)a3
{
}

- (NSData)urlResponseData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUrlResponseData:(id)a3
{
}

- (NSString)validationURL
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setValidationURL:(id)a3
{
}

- (int)viewServicePID
{
  return self->viewServicePID;
}

- (void)setViewServicePID:(int)a3
{
  self->viewServicePID = a3;
}

- (NSString)idsIDQueryListenerID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdsIDQueryListenerID:(id)a3
{
}

- (IDSSessionEmbeddedControllerBase)idsSessionController
{
  return (IDSSessionEmbeddedControllerBase *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIdsSessionController:(id)a3
{
}

- (NSMutableDictionary)activeSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActiveSessions:(id)a3
{
}

- (BOOL)sessionPaused
{
  return self->_sessionPaused;
}

- (void)setSessionPaused:(BOOL)a3
{
  self->_sessionPaused = a3;
}

- (ViewServiceHelper)vsHelper
{
  return (ViewServiceHelper *)objc_getProperty(self, a2, 104, 1);
}

- (void)setVsHelper:(id)a3
{
}

- (NSTimer)exitTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExitTimer:(id)a3
{
}

- (SBSAssertion)wallpaperSuspensionAssertion
{
  return (SBSAssertion *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWallpaperSuspensionAssertion:(id)a3
{
}

- (BOOL)screenPausedBeforeLock
{
  return self->_screenPausedBeforeLock;
}

- (void)setScreenPausedBeforeLock:(BOOL)a3
{
  self->_screenPausedBeforeLock = a3;
}

- (__CFUserNotification)askToResumeNotification
{
  return self->_askToResumeNotification;
}

- (void)setAskToResumeNotification:(__CFUserNotification *)a3
{
  self->_askToResumeNotification = a3;
}

- (NSTimer)askToResumeTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAskToResumeTimeoutTimer:(id)a3
{
}

- (BOOL)askToResumeTimedOut
{
  return self->_askToResumeTimedOut;
}

- (void)setAskToResumeTimedOut:(BOOL)a3
{
  self->_askToResumeTimedOut = a3;
}

- (NSDate)notificationStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationStartTime:(id)a3
{
}

- (SSUserResponseDelegate)askToResumeDelegate
{
  return self->_askToResumeDelegate;
}

- (void)setAskToResumeDelegate:(id)a3
{
  self->_askToResumeDelegate = (SSUserResponseDelegate *)a3;
}

- (unsigned)askToResumeToken
{
  return self->_askToResumeToken;
}

- (void)setAskToResumeToken:(unsigned int)a3
{
  self->_askToResumeToken = a3;
}

- (SSUserResponseDelegate)askToCopyToPasteboardDelegate
{
  return self->_askToCopyToPasteboardDelegate;
}

- (void)setAskToCopyToPasteboardDelegate:(id)a3
{
  self->_askToCopyToPasteboardDelegate = (SSUserResponseDelegate *)a3;
}

- (unsigned)askToCopyToPasteboardToken
{
  return self->_askToCopyToPasteboardToken;
}

- (void)setAskToCopyToPasteboardToken:(unsigned int)a3
{
  self->_askToCopyToPasteboardToken = a3;
}

- (NSString)askToCopyToPasteboardUserMessage
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAskToCopyToPasteboardUserMessage:(id)a3
{
}

- (__CFUserNotification)askToCopyToPasteboardNotification
{
  return self->_askToCopyToPasteboardNotification;
}

- (void)setAskToCopyToPasteboardNotification:(__CFUserNotification *)a3
{
  self->_askToCopyToPasteboardNotification = a3;
}

- (NSTimer)askToCopyToPasteboardTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAskToCopyToPasteboardTimeoutTimer:(id)a3
{
}

- (BOOL)askToCopyToPasteboardTimedOut
{
  return self->_askToCopyToPasteboardTimedOut;
}

- (void)setAskToCopyToPasteboardTimedOut:(BOOL)a3
{
  self->_askToCopyToPasteboardTimedOut = a3;
}

- (NSString)showUserMessage
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setShowUserMessage:(id)a3
{
}

- (BOOL)showUserMessageTimedOut
{
  return self->_showUserMessageTimedOut;
}

- (void)setShowUserMessageTimedOut:(BOOL)a3
{
  self->_showUserMessageTimedOut = a3;
}

- (NSTimer)showUserMessageTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 200, 1);
}

- (void)setShowUserMessageTimeoutTimer:(id)a3
{
}

- (__CFUserNotification)showUserMessageNotification
{
  return self->_showUserMessageNotification;
}

- (void)setShowUserMessageNotification:(__CFUserNotification *)a3
{
  self->_showUserMessageNotification = a3;
}

- (NSString)sanitizedFromID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSanitizedFromID:(id)a3
{
}

- (BOOL)showViewerPausedTimedOut
{
  return self->_showViewerPausedTimedOut;
}

- (void)setShowViewerPausedTimedOut:(BOOL)a3
{
  self->_showViewerPausedTimedOut = a3;
}

- (NSTimer)showViewerPausedTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 224, 1);
}

- (void)setShowViewerPausedTimeoutTimer:(id)a3
{
}

- (__CFUserNotification)showViewerPausedNotification
{
  return self->_showViewerPausedNotification;
}

- (void)setShowViewerPausedNotification:(__CFUserNotification *)a3
{
  self->_showViewerPausedNotification = a3;
}

- (NSString)urlToOpen
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUrlToOpen:(id)a3
{
}

- (BOOL)askToOpenURLTimedOut
{
  return self->_askToOpenURLTimedOut;
}

- (void)setAskToOpenURLTimedOut:(BOOL)a3
{
  self->_askToOpenURLTimedOut = a3;
}

- (NSTimer)askToOpenURLTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAskToOpenURLTimeoutTimer:(id)a3
{
}

- (__CFUserNotification)askToOpenURLNotification
{
  return self->_askToOpenURLNotification;
}

- (void)setAskToOpenURLNotification:(__CFUserNotification *)a3
{
  self->_askToOpenURLNotification = a3;
}

- (unsigned)askToOpenURLToken
{
  return self->_askToOpenURLToken;
}

- (void)setAskToOpenURLToken:(unsigned int)a3
{
  self->_askToOpenURLToken = a3;
}

- (SSUserResponseDelegate)askToOpenURLDelegate
{
  return self->_askToOpenURLDelegate;
}

- (void)setAskToOpenURLDelegate:(id)a3
{
  self->_askToOpenURLDelegate = (SSUserResponseDelegate *)a3;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (BOOL)lockScreenObserverActive
{
  return self->_lockScreenObserverActive;
}

- (void)setLockScreenObserverActive:(BOOL)a3
{
  self->_lockScreenObserverActive = a3;
}

- (IDSSessionEmbeddedControllerBase)pendingSession
{
  return (IDSSessionEmbeddedControllerBase *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPendingSession:(id)a3
{
}

- (OS_os_transaction)osTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOsTransaction:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)doubleHeightStatusBarAssertion
{
  return (SBSStatusBarStyleOverridesAssertion *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDoubleHeightStatusBarAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleHeightStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_pendingSession, 0);
  objc_storeStrong((id *)&self->_askToOpenURLTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_urlToOpen, 0);
  objc_storeStrong((id *)&self->_showViewerPausedTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_sanitizedFromID, 0);
  objc_storeStrong((id *)&self->_showUserMessageTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_showUserMessage, 0);
  objc_storeStrong((id *)&self->_askToCopyToPasteboardTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_askToCopyToPasteboardUserMessage, 0);
  objc_storeStrong((id *)&self->_notificationStartTime, 0);
  objc_storeStrong((id *)&self->_askToResumeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_wallpaperSuspensionAssertion, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_vsHelper, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_idsSessionController, 0);
  objc_storeStrong((id *)&self->_idsIDQueryListenerID, 0);
  objc_storeStrong((id *)&self->validationURL, 0);
  objc_storeStrong((id *)&self->urlResponseData, 0);
  objc_storeStrong((id *)&self->_idsService, 0);

  objc_storeStrong((id *)&self->url_sem, 0);
}

@end