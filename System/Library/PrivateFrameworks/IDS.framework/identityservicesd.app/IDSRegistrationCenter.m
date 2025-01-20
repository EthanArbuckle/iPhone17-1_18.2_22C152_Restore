@interface IDSRegistrationCenter
+ (IDSRegistrationCenter)sharedInstance;
- (BOOL)_checkOverRegistrations;
- (BOOL)_hasCurrentAuthenticationsOrRegistrations;
- (BOOL)_hasOngoingAuthentications;
- (BOOL)_hasRegistration:(id)a3 inQueue:(id)a4;
- (BOOL)_queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5;
- (BOOL)_sendKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5;
- (BOOL)_sendKTOptInStatusUpdateForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)_sendPseudonymMessageOperation:(unint64_t)a3 forURI:(id)a4 pseudonymURI:(id)a5 properties:(id)a6 requestProperties:(id)a7 forRegistration:(id)a8 completionBlock:(id)a9;
- (BOOL)authenticateRegistration:(id)a3;
- (BOOL)isRegistering:(id)a3;
- (BOOL)provisionPseudonymFor:(id)a3 withURI:(id)a4 properties:(id)a5 requestProperties:(id)a6 completionBlock:(id)a7;
- (BOOL)queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5;
- (BOOL)renewPseudonym:(id)a3 forRegistration:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 completionBlock:(id)a7;
- (BOOL)revokePseudonym:(id)a3 forRegistration:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)sendDeregistration:(id)a3;
- (BOOL)sendRegistration:(id)a3;
- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5;
- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5;
- (CUTDeferredTaskQueue)cleanupAbsintheTask;
- (CUTDeferredTaskQueue)sendAuthenticateRegistrationTask;
- (CUTDeferredTaskQueue)sendDeregistrationTask;
- (CUTDeferredTaskQueue)sendRegistrationTask;
- (IDSRegistrationCenter)init;
- (IDSRegistrationCenter)initWithMessageDelivery:(id)a3 pushHandler:(id)a4 keyTransparencyVerifier:(id)a5;
- (IDSValidationQueue)validationQueue;
- (double)_updatePseudonymExpiryEpoch:(double)a3;
- (id)_URIsToRegisterForRegistration:(id)a3;
- (id)_authDSMessageForRegistration:(id)a3 realm:(id)a4;
- (id)_authMessageCompletionWithRegistration:(id)a3 withOverallSuccessBlock:(id)a4 overallFailure:(id)a5;
- (id)_authMessageForRegistration:(id)a3;
- (id)_authUsersMessageForRegistration:(id)a3 realm:(id)a4;
- (id)_geoRegion;
- (id)_keyTransparencyAccountKeyFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_keyTransparencyDeviceSignatureFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_keyTransparencyLoggableDataFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5;
- (id)_provTemporaryPhoneMessageForRegistration:(id)a3;
- (id)_trustedDeviceForRegistrations:(id)a3 transparencyLoggableDatasByServiceType:(id)a4 transparencyDeviceSignaturesByServiceType:(id)a5;
- (id)activeRegistrations;
- (id)dateLastRegistered;
- (id)gdrCenter;
- (id)keyTransparencyVerifier;
- (id)privateDeviceDataForKVSSuccess:(BOOL)a3;
- (id)registrationReasonTracker;
- (int64_t)_authSubsystemForInfo:(id)a3;
- (int64_t)_countOfMessagesQueuedOfType:(Class)a3 matchingCriteria:(id)a4;
- (unint64_t)_disableSecondaryRegistrationPercentage;
- (void)__dumpState;
- (void)__reallySendAuthenticateRegistration;
- (void)__reallySendDeregistration;
- (void)__reallySendRegistration;
- (void)__sendMessage:(id)a3;
- (void)_dequeuePendingRequestsIfNecessary;
- (void)_noteRegistration;
- (void)_notifyAllSuccessfulRegistrations:(id)a3;
- (void)_notifyEmailQueryFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyEmailQuerySuccess:(id)a3 emailInfo:(id)a4;
- (void)_notifyIDSAuthenticationSuccess:(id)a3;
- (void)_notifyProvisionFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 fatal:(BOOL)a7 info:(id)a8;
- (void)_notifyRegistrationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyRegistrationIdentitiesUpdated;
- (void)_notifyRegistrationSuccess:(id)a3;
- (void)_processGetHandlesMessage:(id)a3 registrations:(id)a4 deliveredWithError:(id)a5 resultCode:(int64_t)a6 resultDictionary:(id)a7 allowPasswordPrompt:(BOOL)a8;
- (void)_processRegistrationMessage:(id)a3 sentRegistrations:(id)a4 descriptionString:(id)a5 actionID:(id)a6 actionString:(id)a7 isDeregister:(BOOL)a8 deliveredWithError:(id)a9 resultCode:(int64_t)a10 resultDictionary:(id)a11;
- (void)_sendAuthenticateRegistration:(id)a3;
- (void)_sendDeregistration:(id)a3;
- (void)_sendIDSAuthRequest:(id)a3 forInfo:(id)a4;
- (void)_sendRegistrationAsDeregister:(BOOL)a3;
- (void)_shouldDisableSecondaryRegistration;
- (void)addListener:(id)a3;
- (void)buildValidationCredentialsIfNeeded;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)cancelRegisterActionsForRegistrationInfo:(id)a3;
- (void)dealloc;
- (void)engramKeyStoreDidUpdateIdentities:(id)a3;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)logState;
- (void)removeListener:(id)a3;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 registration:(id)a6 withCompletion:(id)a7;
- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5;
- (void)reportSpamMessage:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportSpamWithMessages:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportUnknownSenderMessage:(id)a3 selfURI:(id)a4 registration:(id)a5;
- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 completionBlock:(id)a5;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 selfURI:(id)a8 registration:(id)a9;
- (void)retrieveFeatureToggleStateForFeatureID:(id)a3 registration:(id)a4 completionBlock:(id)a5;
- (void)sendDeactivationRequestWithSIM:(id)a3 Info:(id)a4;
- (void)sendHardDeregisterCompletionBlock:(id)a3;
- (void)sendValidateCredential:(id)a3 withDeliveryCompletionBlock:(id)a4;
- (void)updateFeatureToggleState:(unint64_t)a3 forFeatureID:(id)a4 registration:(id)a5 completionBlock:(id)a6;
@end

@implementation IDSRegistrationCenter

+ (IDSRegistrationCenter)sharedInstance
{
  if (qword_100A4C300 != -1) {
    dispatch_once(&qword_100A4C300, &stru_1009868C0);
  }
  v2 = (void *)qword_100A4C308;

  return (IDSRegistrationCenter *)v2;
}

- (IDSRegistrationCenter)initWithMessageDelivery:(id)a3 pushHandler:(id)a4 keyTransparencyVerifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v61.receiver = self;
  v61.super_class = (Class)IDSRegistrationCenter;
  v12 = [(IDSRegistrationCenter *)&v61 init];
  if (v12)
  {
    id v54 = v9;
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    currentAuthentications = v12->_currentAuthentications;
    v12->_currentAuthentications = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    currentRegistrations = v12->_currentRegistrations;
    v12->_currentRegistrations = v15;

    objc_storeStrong((id *)&v12->_httpMessageDelivery, a3);
    [(IDSRegistrationCenterMessageDelivery *)v12->_httpMessageDelivery setUserAgent:@"com.apple.invitation-registration"];
    [(IDSRegistrationCenterMessageDelivery *)v12->_httpMessageDelivery setRetryInAirplaneMode:1];
    [(IDSRegistrationCenterMessageDelivery *)v12->_httpMessageDelivery setLogToRegistration:1];
    objc_storeStrong((id *)&v12->_pushHandler, a4);
    pushHandler = v12->_pushHandler;
    v18 = im_primary_queue();
    [(IDSPushHandler *)pushHandler addListener:v12 topics:0 commands:0 queue:v18];

    v19 = [IDSValidationQueue alloc];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100230F4C;
    v59[3] = &unk_100985F88;
    v20 = v12;
    v60 = v20;
    v21 = [(IDSValidationQueue *)v19 initWithValidationMessageSendBlock:v59];
    validationQueue = v20->_validationQueue;
    v20->_validationQueue = v21;

    objc_storeStrong((id *)&v20->_keyTransparencyVerifier, a5);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100230F58;
    v57[3] = &unk_100985F88;
    v23 = v20;
    v58 = v23;
    v24 = objc_retainBlock(v57);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100230FB4;
    v55[3] = &unk_10097E4D0;
    v25 = v23;
    v56 = v25;
    v26 = objc_retainBlock(v55);
    v27 = [IDSGetDependentRegistrationsCenter alloc];
    v28 = v12->_pushHandler;
    v29 = +[IMLockdownManager sharedInstance];
    v30 = +[IDSDeviceHeartbeatCenter sharedInstance];
    +[FTNetworkSupport sharedInstance];
    id v53 = v11;
    v32 = id v31 = v10;
    v33 = [(IDSGetDependentRegistrationsCenter *)v27 initWithPushHandler:v28 lockdownManager:v29 heartbeatCenter:v30 ftNetworkSupport:v32 sendMessageHandlerBlock:v24 messageResponseHandlerBlock:v26];
    gdrCenter = v25->_gdrCenter;
    v25->_gdrCenter = v33;

    id v35 = objc_alloc((Class)CUTDeferredTaskQueue);
    v36 = im_primary_queue();
    v37 = (CUTDeferredTaskQueue *)[v35 initWithQueue:v36 block:&stru_100986900];
    sendAuthenticateRegistrationTask = v25->_sendAuthenticateRegistrationTask;
    v25->_sendAuthenticateRegistrationTask = v37;

    id v39 = objc_alloc((Class)CUTDeferredTaskQueue);
    v40 = im_primary_queue();
    v41 = (CUTDeferredTaskQueue *)[v39 initWithCapacity:1 queue:v40 block:&stru_100986920];
    sendRegistrationTask = v25->_sendRegistrationTask;
    v25->_sendRegistrationTask = v41;

    id v43 = objc_alloc((Class)CUTDeferredTaskQueue);
    v44 = im_primary_queue();
    v45 = (CUTDeferredTaskQueue *)[v43 initWithCapacity:1 queue:v44 block:&stru_100986940];
    sendDeregistrationTask = v25->_sendDeregistrationTask;
    v25->_sendDeregistrationTask = v45;

    id v47 = objc_alloc((Class)CUTDeferredTaskQueue);
    v48 = im_primary_queue();
    v49 = v47;
    id v9 = v54;
    v50 = (CUTDeferredTaskQueue *)[v49 initWithCapacity:1 queue:v48 block:&stru_100986960];
    cleanupAbsintheTask = v25->_cleanupAbsintheTask;
    v25->_cleanupAbsintheTask = v50;

    id v10 = v31;
    id v11 = v53;
  }
  return v12;
}

- (IDSRegistrationCenter)init
{
  v3 = +[IDSDependencyProvider messageDeliveryFactory];
  v4 = [v3 createHTTPMessageDelivery];

  v5 = +[IDSRegistrationRequestTracker sharedInstance];
  [v4 addRequestObserver:v5];

  v6 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  v7 = +[IDSKeyTransparencyVerifier sharedInstance];
  v8 = [(IDSRegistrationCenter *)self initWithMessageDelivery:v4 pushHandler:v6 keyTransparencyVerifier:v7];

  return v8;
}

- (void)dealloc
{
  [(IDSPushHandler *)self->_pushHandler removeListener:self];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  queuedRegistrations = self->_queuedRegistrations;
  self->_queuedRegistrations = 0;

  [(IDSValidationQueue *)self->_validationQueue cleanupValidationInfoForSubsystemMechanism:1];
  [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery invalidate];
  v5.receiver = self;
  v5.super_class = (Class)IDSRegistrationCenter;
  [(IDSRegistrationCenter *)&v5 dealloc];
}

- (id)gdrCenter
{
  return self->_gdrCenter;
}

- (id)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (id)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance];
}

- (void)engramKeyStoreDidUpdateIdentities:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IMRGLog engram];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IDS registration center notified that Engram key store did update identities; notifying listeners",
      buf,
      2u);
  }

  id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 centerUpdatedRegistrationIdentities:self];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)__dumpState
{
  v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "======= Registration State =======", (uint8_t *)&v29, 2u);
  }

  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dateSentLastHTTPMessage = self->_dateSentLastHTTPMessage;
    int v29 = 138412290;
    v30 = dateSentLastHTTPMessage;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "     Last sent message: %@", (uint8_t *)&v29, 0xCu);
  }

  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dateLastRegistered = self->_dateLastRegistered;
    int v29 = 138412290;
    v30 = dateLastRegistered;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "       Last registered: %@", (uint8_t *)&v29, 0xCu);
  }

  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  uint64_t v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery currentMessage];
    int v29 = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "     Message in Flight: %@", (uint8_t *)&v29, 0xCu);
  }
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery queuedMessages];
    int v29 = 138412290;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "       Messages queued: %@", (uint8_t *)&v29, 0xCu);
  }
  long long v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  long long v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    queuedAuthentications = self->_queuedAuthentications;
    int v29 = 138412290;
    v30 = queuedAuthentications;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "          Queued Auths: %@", (uint8_t *)&v29, 0xCu);
  }

  v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    queuedRegistrations = self->_queuedRegistrations;
    int v29 = 138412290;
    v30 = queuedRegistrations;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "            Queued Reg: %@", (uint8_t *)&v29, 0xCu);
  }

  v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    currentAuthentications = self->_currentAuthentications;
    int v29 = 138412290;
    v30 = currentAuthentications;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "         Current Auths: %@", (uint8_t *)&v29, 0xCu);
  }

  v20 = +[IMRGLog registration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    currentRegistrations = self->_currentRegistrations;
    int v29 = 138412290;
    v30 = currentRegistrations;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "           Current Reg: %@", (uint8_t *)&v29, 0xCu);
  }

  v22 = +[IMRGLog registration];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = [(IDSValidationQueue *)self->_validationQueue isBuildingContextForSubsystem:1];
    CFStringRef v25 = @"NO";
    if (v24) {
      CFStringRef v25 = @"YES";
    }
    int v29 = 138412290;
    v30 = (void *)v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "     Building Absinthe: %@", (uint8_t *)&v29, 0xCu);
  }

  v26 = +[IMRGLog registration];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t registrations = self->_registrations;
    int v29 = 67109120;
    LODWORD(v30) = registrations;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  Recent Registrations: %d", (uint8_t *)&v29, 8u);
  }

  v28 = +[IMRGLog registration];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "==================================", (uint8_t *)&v29, 2u);
  }
}

- (void)logState
{
  [(IDSRegistrationCenter *)self __dumpState];
  NSLog(@"======= Registration State =======");
  NSLog(@"     Last sent message: %@", self->_dateSentLastHTTPMessage);
  NSLog(@"       Last registered: %@", self->_dateLastRegistered);
  NSLog(&stru_10099BE78.isa);
  v3 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery currentMessage];
  NSLog(@"     Message in Flight: %@", v3);

  id v4 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery queuedMessages];
  NSLog(@"       Messages queued: %@", v4);

  NSLog(&stru_10099BE78.isa);
  NSLog(@"          Queued Auths: %@", self->_queuedAuthentications);
  NSLog(@"            Queued Reg: %@", self->_queuedRegistrations);
  NSLog(@"         Current Auths: %@", self->_currentAuthentications);
  NSLog(@"           Current Reg: %@", self->_currentRegistrations);
  NSLog(&stru_10099BE78.isa);
  unsigned int v5 = [(IDSValidationQueue *)self->_validationQueue isBuildingContextForSubsystem:1];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  NSLog(@"     Building Absinthe: %@", v6);
  NSLog(@"  Recent Registrations: %d", self->_registrations);
  NSLog(@"==================================");
}

- (void)__sendMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "*** Sending message: %@", (uint8_t *)&v8, 0xCu);
  }

  [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery sendMessage:v4];
  CFStringRef v6 = (NSDate *)objc_alloc_init((Class)NSDate);
  dateSentLastHTTPMessage = self->_dateSentLastHTTPMessage;
  self->_dateSentLastHTTPMessage = v6;

  [(IDSRegistrationCenter *)self __dumpState];
}

- (BOOL)_hasOngoingAuthentications
{
  return [(NSMutableArray *)self->_queuedAuthentications count]
      || [(NSMutableArray *)self->_currentAuthentications count] != 0;
}

- (BOOL)_hasCurrentAuthenticationsOrRegistrations
{
  return [(NSMutableArray *)self->_currentAuthentications count]
      || [(NSMutableArray *)self->_currentRegistrations count] != 0;
}

- (void)_shouldDisableSecondaryRegistration
{
  unint64_t v2 = [(IDSRegistrationCenter *)self _disableSecondaryRegistrationPercentage];
  v3 = +[IMUserDefaults secondaryRegistrationDisabledDiceRoll];
  if (!v3)
  {
    id v6 = +[NSNumber numberWithUnsignedInt:arc4random_uniform(0x64u)];
    +[IMUserDefaults setSecondaryRegistrationDisabledDiceRoll:v6];
    v3 = v6;
  }
  id v7 = v3;
  unsigned int v4 = [v3 unsignedIntValue];
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
  if (v2 > v4 != [v5 BOOLForKey:@"SecondaryRegistrationDisabled"]) {
    [v5 setBool:v2 > v4 forKey:@"SecondaryRegistrationDisabled"];
  }
}

- (unint64_t)_disableSecondaryRegistrationPercentage
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"ids-disable-secondary-wave2-registration-percentage"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = [v3 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (void)_dequeuePendingRequestsIfNecessary
{
  if (!self->_pendingDequeue)
  {
    if ([(IDSRegistrationCenter *)self _checkOverRegistrations])
    {
      v3 = +[IMRGLog warning];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_10071AFEC();
      }

      id v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472;
      int v8 = sub_100231FDC;
      id v9 = &unk_10097E4D0;
      id v10 = self;
    }
    else
    {
      self->_pendingDequeue = 1;
      id v4 = +[IMRGLog registration];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Kicking dequeue of pending requests", buf, 2u);
      }
    }
    im_dispatch_after_primary_queue();
  }
}

- (void)_notifyProvisionFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 fatal:(BOOL)a7 info:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v52 = a6;
  id v14 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v58 = _os_activity_create((void *)&_mh_execute_header, "ids/authenticate/fail", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v58, &state);
  unint64_t add = atomic_fetch_add(&cut_log_group_generation, 1uLL);
  v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v13 mainID];
    *(_DWORD *)buf = 134218242;
    unint64_t v61 = add;
    __int16 v62 = 2112;
    v63 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }
  v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v13 serviceIdentifier];
    *(_DWORD *)buf = 134218242;
    unint64_t v61 = add;
    __int16 v62 = 2112;
    v63 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }
  v20 = +[IMRGLog registration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v61 = add;
    __int16 v62 = 2112;
    v63 = &__kCFBooleanFalse;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) successful=%@", buf, 0x16u);
  }

  v21 = +[IMRGLog registration];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v61 = add;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) authenticate", buf, 0xCu);
  }

  [(IDSValidationQueue *)self->_validationQueue cleanupValidationInfoForSubsystemMechanism:[(IDSRegistrationCenter *)self _authSubsystemForInfo:v13]];
  [(NSMutableArray *)self->_queuedRegistrations removeObjectIdenticalTo:v13];
  [(NSMutableArray *)self->_queuedAuthentications removeObjectIdenticalTo:v13];
  [(NSMutableArray *)self->_currentRegistrations removeObjectIdenticalTo:v13];
  [(NSMutableArray *)self->_currentAuthentications removeObjectIdenticalTo:v13];
  if (v9 && (uint64_t)[v13 registrationStatus] <= 7) {
    [v13 setRegistrationStatus:-1];
  }
  sub_1001484DC(0, @"Registration", @"IDS Authentication failure", 1073);
  id v22 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v23 = v22;
  id v24 = [v23 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v54;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v27 center:self failedIDSAuthentication:v13 error:a5 info:v14];
        }
      }
      id v24 = [v23 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v24);
  }

  v28 = [v52 domain];
  unsigned int v51 = [v28 isEqualToString:NSPOSIXErrorDomain];

  int v29 = [v52 domain];
  if ([v29 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v30 = 1;
  }
  else
  {
    id v31 = [v52 domain];
    unsigned int v30 = [v31 isEqualToString:kCFErrorDomainCFNetwork];
  }
  v32 = +[FTNetworkSupport sharedInstance];
  unsigned int v33 = [v32 wiFiActiveAndReachable];

  if (v33) {
    int v34 = 2;
  }
  else {
    int v34 = 1;
  }
  unsigned int v49 = v34;
  unsigned int v48 = [v13 registrationType];
  unsigned int v47 = [v13 registrationType];
  sub_1001BC02C(a4);
  sub_1001BC738(a5);
  if ((v30 | v51))
  {
    id v35 = 0;
    if (v30)
    {
LABEL_29:
      v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v52 code]);
      goto LABEL_32;
    }
  }
  else
  {
    id v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v52 code]);
    if (v30) {
      goto LABEL_29;
    }
  }
  v36 = 0;
LABEL_32:
  if (v51)
  {
    v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v52 code]);
  }
  else
  {
    v37 = 0;
  }
  v45 = v36;
  FTAWDLogRegistrationAuthenticate();
  if (v51) {

  }
  if (v30) {
  if (((v30 | v51) & 1) == 0)
  }

  id v46 = objc_alloc((Class)IDSRegistrationAuthenticateMetric);
  uint64_t v38 = sub_1001BC02C(a4);
  uint64_t v39 = sub_1001BC738(a5);
  if ((v30 | v51))
  {
    v40 = 0;
    if (v30)
    {
LABEL_43:
      v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v52, "code", v45));
      goto LABEL_46;
    }
  }
  else
  {
    v40 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v52, "code", v36, v37));
    if (v30) {
      goto LABEL_43;
    }
  }
  v41 = 0;
LABEL_46:
  if (v51)
  {
    v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v52 code]);
  }
  else
  {
    v42 = 0;
  }
  LOBYTE(v45) = v47 == 1;
  id v43 = [v46 initWithGuid:0 success:0 connectionType:v49 resultCode:v38 registrationError:v39 isPhoneUser:v48 == 0 isDSUser:v45 genericError:v40 URLError:v41 POSIXError:v42];
  if (v51) {

  }
  if (v30) {
  if (((v30 | v51) & 1) == 0)
  }

  v44 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v44 logMetric:v43];

  [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyIDSAuthenticationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v33 = _os_activity_create((void *)&_mh_execute_header, "ids/authenticate/success", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v33, &state);
  unint64_t add = atomic_fetch_add(&cut_log_group_generation, 1uLL);
  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 mainID];
    *(_DWORD *)buf = 134218242;
    unint64_t v36 = add;
    __int16 v37 = 2112;
    uint64_t v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }
  int v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v4 serviceIdentifier];
    *(_DWORD *)buf = 134218242;
    unint64_t v36 = add;
    __int16 v37 = 2112;
    uint64_t v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }
  id v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v36 = add;
    __int16 v37 = 2112;
    uint64_t v38 = &__kCFBooleanTrue;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) successful=%@", buf, 0x16u);
  }

  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v36 = add;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) authenticate", buf, 0xCu);
  }

  [(NSMutableArray *)self->_queuedAuthentications removeObjectIdenticalTo:v4];
  [(NSMutableArray *)self->_currentAuthentications removeObjectIdenticalTo:v4];
  if (![(NSMutableArray *)self->_queuedAuthentications count])
  {
    queuedAuthentications = self->_queuedAuthentications;
    self->_queuedAuthentications = 0;
  }
  id v13 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v18 center:self succeededIDSAuthentication:v4];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v15);
  }

  v19 = +[FTNetworkSupport sharedInstance];
  unsigned int v20 = [v19 wiFiActiveAndReachable];

  if (v20) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
  unsigned int v22 = [v4 registrationType];
  unsigned int v23 = [v4 registrationType];
  sub_1001BC02C(0);
  sub_1001BC738(-1);
  FTAWDLogRegistrationAuthenticate();
  id v24 = objc_alloc((Class)IDSRegistrationAuthenticateMetric);
  uint64_t v25 = sub_1001BC02C(0);
  id v26 = [v24 initWithGuid:0 success:1 connectionType:v21 resultCode:v25 registrationError:sub_1001BC738(-1) isPhoneUser:v22 == 0 isDSUser:v23 == 1 genericError:0 URLError:0 POSIXError:0];
  v27 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v27 logMetric:v26];

  [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyRegistrationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v11 = a3;
  id v57 = a6;
  id v12 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v71 = _os_activity_create((void *)&_mh_execute_header, "ids/registration/fail", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v71, &state);
  unint64_t add = atomic_fetch_add(&cut_log_group_generation, 1uLL);
  id v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 mainID];
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = add;
    __int16 v76 = 2112;
    v77 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }
  uint64_t v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v11 serviceIdentifier];
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = add;
    __int16 v76 = 2112;
    v77 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }
  v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v75 = add;
    __int16 v76 = 2112;
    v77 = &__kCFBooleanFalse;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) successful=%@", buf, 0x16u);
  }

  v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v75 = add;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) register", buf, 0xCu);
  }

  [(NSMutableArray *)self->_queuedRegistrations removeObjectIdenticalTo:v11];
  [(NSMutableArray *)self->_queuedAuthentications removeObjectIdenticalTo:v11];
  [(NSMutableArray *)self->_currentRegistrations removeObjectIdenticalTo:v11];
  [(NSMutableArray *)self->_currentAuthentications removeObjectIdenticalTo:v11];
  if (![(NSMutableArray *)self->_queuedRegistrations count])
  {
    queuedRegistrations = self->_queuedRegistrations;
    self->_queuedRegistrations = 0;
  }
  [(IDSValidationQueue *)self->_validationQueue cleanupValidationInfoForSubsystemMechanism:1];
  if (![v11 registrationType])
  {
    [v11 setMainID:0];
    [v11 setAuthenticationToken:0];
  }
  [v11 setUris:0];
  [v11 setVettedEmails:0];
  [v11 setRegistrationCert:0];
  [v11 saveToKeychain];
  sub_1001484DC(0, @"Registration", @"IDS registration failure", 1073);
  if (_os_feature_enabled_impl())
  {
    if (a5 == 47)
    {
      keyTransparencyVerifier = self->_keyTransparencyVerifier;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100233B84;
      v66[3] = &unk_100986988;
      uint64_t v69 = 47;
      v66[4] = self;
      id v67 = v11;
      id v68 = v12;
      [(IDSKeyTransparencyVerifier *)keyTransparencyVerifier fetchKTCDPStatus:v66];
    }
    else
    {
      id v28 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v29 = v28;
      id v30 = [v29 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v63;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(v29);
            }
            unsigned int v33 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v33 center:self failedRegistration:v11 error:a5 info:v12];
            }
          }
          id v30 = [v29 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }
        while (v30);
      }
    }
  }
  else
  {
    id v22 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v59;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v59 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector()) {
            [v27 center:self failedRegistration:v11 error:a5 info:v12];
          }
        }
        id v24 = [v23 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v24);
    }
  }
  int v34 = [v57 domain];
  unsigned int v56 = [v34 isEqualToString:NSPOSIXErrorDomain];

  id v35 = [v57 domain];
  if ([v35 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v36 = 1;
  }
  else
  {
    __int16 v37 = [v57 domain];
    unsigned int v36 = [v37 isEqualToString:kCFErrorDomainCFNetwork];
  }
  uint64_t v38 = +[FTNetworkSupport sharedInstance];
  unsigned int v39 = [v38 wiFiActiveAndReachable];

  if (v39) {
    int v40 = 2;
  }
  else {
    int v40 = 1;
  }
  unsigned int v53 = v40;
  sub_1001BC02C(a4);
  sub_1001BC738(a5);
  if ((v36 | v56))
  {
    v41 = 0;
    if (v36)
    {
LABEL_44:
      v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v57 code]);
      goto LABEL_47;
    }
  }
  else
  {
    v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v57 code]);
    if (v36) {
      goto LABEL_44;
    }
  }
  v42 = 0;
LABEL_47:
  if (v56)
  {
    id v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v57 code]);
  }
  else
  {
    id v43 = 0;
  }
  v50 = v42;
  unsigned int v51 = v43;
  FTAWDLogRegistrationRegister();
  if (v56) {

  }
  if (v36) {
  if (((v36 | v56) & 1) == 0)
  }

  id v52 = objc_alloc((Class)IDSRegistrationOperationRegisterMetric);
  unsigned int v55 = sub_1001BC02C(a4);
  uint64_t v44 = sub_1001BC738(a5);
  if ((v36 | v56))
  {
    v45 = 0;
    if (v36)
    {
LABEL_58:
      id v46 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v57, "code", v50, v51));
      goto LABEL_61;
    }
  }
  else
  {
    v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v57, "code", v42, v43));
    if (v36) {
      goto LABEL_58;
    }
  }
  id v46 = 0;
LABEL_61:
  if (v56)
  {
    unsigned int v47 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v57 code]);
  }
  else
  {
    unsigned int v47 = 0;
  }
  id v48 = [v52 initWithGuid:0 success:0 connectionType:v53 resultCode:v55 registrationType:v44 isHeartbeatRegister:0 heartbeatDelay:0 genericError:v45 URLError:v46 POSIXError:v47];
  if (v56) {

  }
  if (v36) {
  if (((v36 | v56) & 1) == 0)
  }

  unsigned int v49 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v49 logMetric:v48];

  [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyRegistrationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v32 = _os_activity_create((void *)&_mh_execute_header, "ids/registration/success", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v32, &state);
  unint64_t add = atomic_fetch_add(&cut_log_group_generation, 1uLL);
  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 mainID];
    *(_DWORD *)buf = 134218242;
    unint64_t v35 = add;
    __int16 v36 = 2112;
    __int16 v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) main-id=%@", buf, 0x16u);
  }
  int v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v4 serviceIdentifier];
    *(_DWORD *)buf = 134218242;
    unint64_t v35 = add;
    __int16 v36 = 2112;
    __int16 v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) service-id=%@", buf, 0x16u);
  }
  id v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v35 = add;
    __int16 v36 = 2112;
    __int16 v37 = &__kCFBooleanTrue;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "!setGroupState(%llu) successful=%@", buf, 0x16u);
  }

  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v35 = add;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "!addGroup(%llu) register", buf, 0xCu);
  }

  [(NSMutableArray *)self->_queuedRegistrations removeObjectIdenticalTo:v4];
  [(NSMutableArray *)self->_currentRegistrations removeObjectIdenticalTo:v4];
  if (![(NSMutableArray *)self->_queuedRegistrations count])
  {
    queuedRegistrations = self->_queuedRegistrations;
    self->_queuedRegistrations = 0;
  }
  [v4 setRegistrationStatus:8];
  id v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS registration success", buf, 2u);
  }

  id v14 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v18);
        if (objc_opt_respondsToSelector()) {
          [v19 center:self succeededRegistration:v4];
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v16);
  }

  unsigned int v20 = +[FTNetworkSupport sharedInstance];
  unsigned int v21 = [v20 wiFiActiveAndReachable];

  if (v21) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  sub_1001BC02C(0);
  sub_1001BC738(-1);
  FTAWDLogRegistrationRegister();
  id v23 = objc_alloc((Class)IDSRegistrationOperationRegisterMetric);
  uint64_t v24 = sub_1001BC02C(0);
  id v25 = [v23 initWithGuid:0 success:0 connectionType:v22 resultCode:v24 registrationType:sub_1001BC738(-1) isHeartbeatRegister:0 heartbeatDelay:0 genericError:0 URLError:0 POSIXError:0];
  id v26 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v26 logMetric:v25];

  [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyAllSuccessfulRegistrations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "All IDS registrations success", buf, 2u);
    }

    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
          if (objc_opt_respondsToSelector()) {
            [v11 center:self allSucceededRegistrations:v4];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_notifyEmailQueryFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v12 = a3;
  id v41 = a6;
  id v13 = a7;
  if ([v12 isDisabled])
  {
    long long v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not reflecting back email query failure, registration is disabled: %@", buf, 0xCu);
    }
    goto LABEL_44;
  }
  int64_t v39 = a4;
  sub_1001484DC(0, @"Registration", @"Email query failure", 1073);
  id v15 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v43;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v16);
        }
        unsigned int v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v20 center:self failedCurrentEmailsRequest:v12 error:a5 info:v13];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v17);
  }

  unsigned int v21 = [v41 domain];
  unsigned __int8 v40 = [v21 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v22 = [v41 domain];
  if ([v22 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v23 = 1;
  }
  else
  {
    uint64_t v24 = [v41 domain];
    unsigned int v23 = [v24 isEqualToString:kCFErrorDomainCFNetwork];
  }
  id v25 = +[FTNetworkSupport sharedInstance];
  unsigned int v26 = [v25 wiFiActiveAndReachable];

  if (v26) {
    int v27 = 2;
  }
  else {
    int v27 = 1;
  }
  unsigned int v38 = v27;
  sub_1001BC02C(v39);
  sub_1001BC738(a5);
  if ((v23 | v40))
  {
    long long v28 = 0;
    if (v23)
    {
LABEL_21:
      long long v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
      goto LABEL_24;
    }
  }
  else
  {
    long long v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
    if (v23) {
      goto LABEL_21;
    }
  }
  long long v29 = 0;
LABEL_24:
  if (v40)
  {
    long long v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
    FTAWDLogRegistrationGetHandles();
  }
  else
  {
    FTAWDLogRegistrationGetHandles();
  }
  if (v23) {

  }
  if (((v23 | v40) & 1) == 0) {
  id v31 = objc_alloc((Class)IDSRegistrationOperationGetHandlesMetric);
  }
  uint64_t v32 = sub_1001BC02C(v39);
  uint64_t v33 = sub_1001BC738(a5);
  if ((v23 | v40))
  {
    int v34 = 0;
    if (v23)
    {
LABEL_33:
      unint64_t v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
      goto LABEL_36;
    }
  }
  else
  {
    int v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
    if (v23) {
      goto LABEL_33;
    }
  }
  unint64_t v35 = 0;
LABEL_36:
  if (v40)
  {
    __int16 v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
    long long v14 = [v31 initWithGuid:0 success:0 connectionType:v38 resultCode:v32 registrationType:v33 genericError:v34 URLError:v35 POSIXError:v36];

    if (!v23) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  long long v14 = [v31 initWithGuid:0 success:0 connectionType:v38 resultCode:v32 registrationType:v33 genericError:v34 URLError:v35 POSIXError:0];
  if (v23) {
LABEL_40:
  }

LABEL_41:
  if (((v23 | v40) & 1) == 0) {

  }
  __int16 v37 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v37 logMetric:v14];

LABEL_44:
}

- (void)_notifyEmailQuerySuccess:(id)a3 emailInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDisabled])
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not reflecting back email query success, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v13);
          if (objc_opt_respondsToSelector()) {
            [v14 center:self succeededCurrentEmailsRequest:v6 emailInfo:v7];
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v15 = +[FTNetworkSupport sharedInstance];
    unsigned int v16 = [v15 wiFiActiveAndReachable];

    if (v16) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    sub_1001BC02C(0);
    sub_1001BC738(-1);
    FTAWDLogRegistrationGetHandles();
    id v18 = objc_alloc((Class)IDSRegistrationOperationGetHandlesMetric);
    uint64_t v19 = sub_1001BC02C(0);
    id v8 = [v18 initWithGuid:0 success:0 connectionType:v17 resultCode:v19 registrationType:sub_1001BC738(-1) genericError:0 URLError:0 POSIXError:0];
    unsigned int v20 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v20 logMetric:v8];
  }
}

- (void)_notifyRegistrationIdentitiesUpdated
{
  v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registration identities updated; notifying listeners",
      buf,
      2u);
  }

  id v4 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 centerUpdatedRegistrationIdentities:self];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)_hasRegistration:(id)a3 inQueue:(id)a4
{
  id v5 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v6; i = ((char *)i + 1))
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v10 = [v9 pushToken];
        long long v11 = [v5 pushToken];
        if (v10 == v11)
        {
          unsigned int v14 = 1;
        }
        else
        {
          long long v12 = [v9 pushToken];
          long long v13 = [v5 pushToken];
          unsigned int v14 = [v12 isEqualToData:v13];
        }
        id v15 = [v9 mainID];
        unsigned int v16 = [v5 mainID];
        if (v15 != v16)
        {
          uint64_t v17 = [v9 mainID];
          id v18 = [v5 mainID];
          v14 &= [v17 isEqualToString:v18];
        }
        unsigned int v19 = [v9 registrationType];
        if (v19 == [v5 registrationType]) {
          unsigned int v20 = v14;
        }
        else {
          unsigned int v20 = 0;
        }
        long long v21 = [v9 serviceType];
        uint64_t v22 = [v5 serviceType];
        if (v21 == (void *)v22)
        {

          if (v20)
          {
LABEL_21:
            id v6 = +[IMRGLog registration];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              int v34 = v9;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, " => Has registration in queue: %@", buf, 0xCu);
            }

            LOBYTE(v6) = 1;
            goto LABEL_24;
          }
        }
        else
        {
          long long v23 = (void *)v22;
          long long v24 = [v9 serviceType];
          id v25 = [v5 serviceType];
          unsigned int v26 = v20 & [v24 isEqualToString:v25];

          if (v26 == 1) {
            goto LABEL_21;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  return (char)v6;
}

- (int64_t)_countOfMessagesQueuedOfType:(Class)a3 matchingCriteria:(id)a4
{
  id v6 = (unsigned int (**)(id, void))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery queuedMessages];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (!a3 || (objc_opt_isKindOfClass() & 1) != 0) {
          v10 += v6[2](v6, v13);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_keyTransparencyAccountKeyFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [a3 services];
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    long long v29 = v9;
    id v30 = v7;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v13 = 0;
      id v28 = v11;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v13);
        long long v15 = [v14 objectForKey:@"service"];
        if ([v15 isEqualToString:v7])
        {
          long long v31 = v15;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v16 = [v14 objectForKey:@"users"];
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v33;
            while (2)
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v22 = [v21 objectForKey:@"uris"];
                CFStringRef v40 = @"uri";
                long long v23 = [v8 prefixedURI];
                id v41 = v23;
                long long v24 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

                if ([v22 containsObject:v24])
                {
                  id v25 = [v21 objectForKey:@"kt-account-key"];

                  id v9 = v29;
                  id v7 = v30;
                  goto LABEL_21;
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v29;
          id v7 = v30;
          uint64_t v12 = v27;
          id v11 = v28;
          long long v15 = v31;
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
      id v25 = 0;
    }
    while (v11);
  }
  else
  {
    id v25 = 0;
  }
LABEL_21:

  return v25;
}

- (id)_keyTransparencyLoggableDataFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [a3 services];
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    long long v29 = v9;
    id v30 = v7;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v13 = 0;
      id v28 = v11;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v13);
        long long v15 = [v14 objectForKey:@"service"];
        if ([v15 isEqualToString:v7])
        {
          long long v31 = v15;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v16 = [v14 objectForKey:@"users"];
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v33;
            while (2)
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v22 = [v21 objectForKey:@"uris"];
                CFStringRef v40 = @"uri";
                long long v23 = [v8 prefixedURI];
                id v41 = v23;
                long long v24 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

                if ([v22 containsObject:v24])
                {
                  id v25 = [v21 objectForKey:@"kt-loggable-data"];

                  id v9 = v29;
                  id v7 = v30;
                  goto LABEL_21;
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v32 objects:v42 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v29;
          id v7 = v30;
          uint64_t v12 = v27;
          id v11 = v28;
          long long v15 = v31;
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
      id v25 = 0;
    }
    while (v11);
  }
  else
  {
    id v25 = 0;
  }
LABEL_21:

  return v25;
}

- (id)_keyTransparencyDeviceSignatureFromRegistrationMessage:(id)a3 service:(id)a4 URI:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = [a3 services];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    id v30 = v9;
    id v31 = v7;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v13 = 0;
      id v29 = v11;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v13);
        long long v15 = [v14 objectForKey:@"service"];
        if ([v15 isEqualToString:v7])
        {
          long long v32 = v15;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v16 = [v14 objectForKey:@"users"];
          id v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v34;
            while (2)
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                uint64_t v22 = [v21 objectForKey:@"uris"];
                CFStringRef v41 = @"uri";
                long long v23 = [v8 prefixedURI];
                long long v42 = v23;
                long long v24 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

                if ([v22 containsObject:v24])
                {
                  unsigned int v26 = [v21 objectForKey:@"client-data"];
                  id v25 = [v26 objectForKey:@"device-key-signature"];

                  id v9 = v30;
                  id v7 = v31;
                  goto LABEL_21;
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v9 = v30;
          id v7 = v31;
          uint64_t v12 = v28;
          id v11 = v29;
          long long v15 = v32;
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
      id v25 = 0;
    }
    while (v11);
  }
  else
  {
    id v25 = 0;
  }
LABEL_21:

  return v25;
}

- (void)_processRegistrationMessage:(id)a3 sentRegistrations:(id)a4 descriptionString:(id)a5 actionID:(id)a6 actionString:(id)a7 isDeregister:(BOOL)a8 deliveredWithError:(id)a9 resultCode:(int64_t)a10 resultDictionary:(id)a11
{
  BOOL v324 = a8;
  id v320 = a3;
  id v16 = a4;
  id v271 = a5;
  id v275 = a6;
  id v272 = a7;
  id v312 = a9;
  id v273 = a11;
  v395 = _os_activity_create((void *)&_mh_execute_header, "Registration center process registration message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v395, &state);
  [(IDSRegistrationCenter *)self _noteRegistration];
  v270 = v16;
  id v17 = [v16 _copyForEnumerating];
  id v18 = +[IMRGLog registration];
  v323 = self;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v404 = v17;
    *(_WORD *)&v404[8] = 2112;
    *(void *)&v404[10] = v275;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Final Active registrations: %@  (For: %@)", buf, 0x16u);
  }

  uint64_t v19 = +[IMRGLog registration];
  unint64_t v20 = a10;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(void *)v404 = v22;
    *(_WORD *)&v404[8] = 2112;
    *(void *)&v404[10] = v312;
    *(_WORD *)&v404[18] = 1024;
    *(_DWORD *)&v404[20] = a10;
    *(_WORD *)&v404[24] = 2112;
    *(void *)&v404[26] = v273;
    *(_WORD *)&v404[34] = 2112;
    *(void *)&v404[36] = v275;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Message class: %@  delivered with error: %@  code: %d result: %@   ID: %@", buf, 0x30u);
  }
  if (qword_100A4C318 != -1) {
    dispatch_once(&qword_100A4C318, &stru_1009869A8);
  }
  if (byte_100A4C310)
  {
    unint64_t v20 = IMGetDomainIntForKey();
    long long v23 = +[IMRGLog warning];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v404 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Overriding response code registration message! {overrideResultCode: %ld}", buf, 0xCu);
    }
  }
  if (byte_100A4C311)
  {
    long long v24 = IMGetDomainValueForKey();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }
    id v26 = v25;

    uint64_t v27 = IMGetDomainValueForKey();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0;
    }
    id v29 = v28;

    id v30 = +[IMRGLog warning];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v404 = v26;
      *(_WORD *)&v404[8] = 2112;
      *(void *)&v404[10] = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Overriding response alert on specified services! {phoneOverrideService: %@, emailOverrideService: %@}", buf, 0x16u);
    }

    if ([v26 length] || objc_msgSend(v29, "length"))
    {
      long long v393 = 0u;
      long long v392 = 0u;
      long long v391 = 0u;
      long long v390 = 0u;
      id v31 = [v320 responseServices];
      id v32 = [v31 countByEnumeratingWithState:&v390 objects:v413 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v391;
        while (2)
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v391 != v33) {
              objc_enumerationMutation(v31);
            }
            long long v35 = [*(id *)(*((void *)&v390 + 1) + 8 * i) objectForKey:@"service"];
            if (([v26 isEqualToString:v35] & 1) != 0
              || [v29 isEqualToString:v35])
            {
              [v320 setResponseAlertInfo:&off_1009D2E20];

              goto LABEL_33;
            }
          }
          id v32 = [v31 countByEnumeratingWithState:&v390 objects:v413 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
LABEL_33:
    }
    else
    {
      [v320 setResponseAlertInfo:&off_1009D2E20];
    }
  }
  if (v20)
  {
    long long v36 = +[IMRGLog registration];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v404 = v20;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "  Message delivery failed with code: %d", buf, 8u);
    }
  }
  if (v312)
  {
    long long v37 = +[IMRGLog registration];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v404 = v20;
      *(_WORD *)&v404[4] = 2112;
      *(void *)&v404[6] = v312;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "  Message delivery failed with result code: %d  error: %@", buf, 0x12u);
    }
  }
  id v315 = objc_alloc_init((Class)NSMutableDictionary);
  long long v389 = 0u;
  long long v388 = 0u;
  long long v387 = 0u;
  long long v386 = 0u;
  id obj = v17;
  id v38 = [obj countByEnumeratingWithState:&v386 objects:v412 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v387;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v387 != v39) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v41 = *(void **)(*((void *)&v386 + 1) + 8 * (void)j);
        long long v42 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v41 absintheRetries]);
        long long v43 = [v41 guid];
        [v315 setObject:v42 forKey:v43];

        [v41 setAbsintheRetries:0];
      }
      id v38 = [obj countByEnumeratingWithState:&v386 objects:v412 count:16];
    }
    while (v38);
  }

  v285 = [v320 responseAlertInfo];
  switch(v20)
  {
    case 0x1771uLL:
      v82 = +[IMRGLog registration];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Server rejected registration; failing all candidate registrations",
          buf,
          2u);
      }

      long long v348 = 0u;
      long long v349 = 0u;
      long long v346 = 0u;
      long long v347 = 0u;
      id v306 = obj;
      id v83 = [v306 countByEnumeratingWithState:&v346 objects:v400 count:16];
      if (v83)
      {
        uint64_t v84 = *(void *)v347;
        do
        {
          for (k = 0; k != v83; k = (char *)k + 1)
          {
            if (*(void *)v347 != v84) {
              objc_enumerationMutation(v306);
            }
            [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v346 + 1) + 8 * (void)k) responseCode:6001 registrationError:31 error:v312 info:v285];
          }
          id v83 = [v306 countByEnumeratingWithState:&v346 objects:v400 count:16];
        }
        while (v83);
      }
      goto LABEL_395;
    case 0x1772uLL:
    case 0x1773uLL:
    case 0x1776uLL:
    case 0x1777uLL:
      goto LABEL_100;
    case 0x1774uLL:
      v90 = +[IMRGLog warning];
      if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
        sub_10071B064();
      }

      [(IDSValidationQueue *)v323->_validationQueue cleanupValidationInfoForSubsystemMechanism:1];
      long long v357 = 0u;
      long long v356 = 0u;
      long long v354 = 0u;
      long long v355 = 0u;
      id v306 = obj;
      id v91 = [v306 countByEnumeratingWithState:&v354 objects:v402 count:16];
      if (!v91) {
        goto LABEL_395;
      }
      char v92 = 0;
      uint64_t v93 = *(void *)v355;
      do
      {
        for (m = 0; m != v91; m = (char *)m + 1)
        {
          if (*(void *)v355 != v93) {
            objc_enumerationMutation(v306);
          }
          v95 = *(void **)(*((void *)&v354 + 1) + 8 * (void)m);
          v96 = [v95 guid];
          v97 = [v315 objectForKey:v96];
          int v98 = [v97 intValue];

          if (v98 > 2)
          {
            v100 = +[IMRGLog registration];
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v404 = v95;
              _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, " Maximum absinthe retries reached, failing registration %@", buf, 0xCu);
            }

            [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:v95 responseCode:6004 registrationError:29 error:v312 info:v285];
          }
          else
          {
            v99 = +[IMRGLog registration];
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v404 = v98;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, " Retries so far: %d  trying again", buf, 8u);
            }

            [v95 setAbsintheRetries:(v98 + 1)];
            char v92 = 1;
          }
        }
        id v91 = [v306 countByEnumeratingWithState:&v354 objects:v402 count:16];
      }
      while (v91);

      p_isa = (id *)&v323->super.isa;
      if (v92)
      {
        [(IDSValidationQueue *)v323->_validationQueue removeFromQueue:v320 subsystem:1];
        [(IDSRegistrationCenter *)v323 _sendRegistrationAsDeregister:v324];
      }
      goto LABEL_396;
    case 0x1775uLL:
    case 0x1778uLL:
      long long v44 = +[IMRGLog registration];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Bad signature, will refresh credentials for all registrations", buf, 2u);
      }

      sub_1001484DC(0, @"Registration", @"Bad signature, need to send SMS", 1073);
      long long v344 = 0u;
      long long v345 = 0u;
      long long v342 = 0u;
      long long v343 = 0u;
      id v306 = obj;
      id v45 = [v306 countByEnumeratingWithState:&v342 objects:v399 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v343;
        do
        {
          for (n = 0; n != v45; n = (char *)n + 1)
          {
            if (*(void *)v343 != v46) {
              objc_enumerationMutation(v306);
            }
            [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v342 + 1) + 8 * (void)n) responseCode:v20 registrationError:37 error:v312 info:v285];
          }
          id v45 = [v306 countByEnumeratingWithState:&v342 objects:v399 count:16];
        }
        while (v45);
      }
      goto LABEL_395;
    case 0x1779uLL:
      v86 = +[IMRGLog registration];
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Server rejected registration permanently; failing all candidate registrations",
          buf,
          2u);
      }

      long long v352 = 0u;
      long long v353 = 0u;
      long long v350 = 0u;
      long long v351 = 0u;
      id v306 = obj;
      id v87 = [v306 countByEnumeratingWithState:&v350 objects:v401 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v351;
        do
        {
          for (ii = 0; ii != v87; ii = (char *)ii + 1)
          {
            if (*(void *)v351 != v88) {
              objc_enumerationMutation(v306);
            }
            [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v350 + 1) + 8 * (void)ii) responseCode:6009 registrationError:38 error:v312 info:v285];
          }
          id v87 = [v306 countByEnumeratingWithState:&v350 objects:v401 count:16];
        }
        while (v87);
      }
      goto LABEL_395;
    default:
      if (!v20)
      {
        id v48 = +[FTDeviceSupport sharedInstance];
        id v306 = [v48 deviceName];

        IMSetDomainBoolForKey();
        id v307 = objc_alloc_init((Class)NSMutableDictionary);
        long long v385 = 0u;
        long long v384 = 0u;
        long long v383 = 0u;
        long long v382 = 0u;
        unsigned int v49 = [v320 services];
        id v50 = [v49 countByEnumeratingWithState:&v382 objects:v411 count:16];
        id v289 = v49;
        if (v50)
        {
          v287 = 0;
          id v288 = v50;
          v283 = 0;
          v284 = 0;
          allocator = 0;
          uint64_t v291 = *(void *)v383;
          uint64_t v299 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
          uint64_t v301 = _IDSIdentityClientDataMessageProtectionIdentityKey;
          uint64_t v297 = IDSRegistrationPropertyKeyTransparencyDeviceKeySignature;
          do
          {
            for (jj = 0; jj != v288; jj = (char *)jj + 1)
            {
              if (*(void *)v383 != v291) {
                objc_enumerationMutation(v289);
              }
              unsigned int v51 = *(void **)(*((void *)&v382 + 1) + 8 * (void)jj);
              long long v378 = 0u;
              long long v379 = 0u;
              long long v380 = 0u;
              long long v381 = 0u;
              v304 = v51;
              id v295 = [v51 objectForKey:@"users"];
              id v309 = [v295 countByEnumeratingWithState:&v378 objects:v410 count:16];
              if (v309)
              {
                uint64_t v302 = *(void *)v379;
                do
                {
                  for (kk = 0; kk != v309; kk = (char *)kk + 1)
                  {
                    if (*(void *)v379 != v302) {
                      objc_enumerationMutation(v295);
                    }
                    id v52 = *(void **)(*((void *)&v378 + 1) + 8 * (void)kk);
                    v325 = [v52 objectForKey:@"client-data"];
                    unsigned int v53 = [v325 objectForKey:v301];
                    v313 = v52;
                    id v310 = v53;
                    if (v53)
                    {
                      id v54 = v53;

                      v287 = v54;
                    }
                    v318 = [v325 objectForKey:v299];
                    unsigned int v55 = [IDSProtoKeyTransparencyLoggableData alloc];
                    unsigned int v56 = [v313 objectForKey:@"kt-loggable-data"];
                    v327 = [(IDSProtoKeyTransparencyLoggableData *)v55 initWithData:v56];

                    v321 = [(IDSProtoKeyTransparencyLoggableData *)v327 ngmPublicIdentity];
                    if (v321 && v318)
                    {
                      id v57 = v321;

                      id v58 = v318;
                      v283 = v58;
                      v284 = v57;
                    }
                    if ([(IDSProtoKeyTransparencyLoggableData *)v327 applicationPublicIdentitysCount])
                    {
                      long long v377 = 0u;
                      long long v376 = 0u;
                      long long v375 = 0u;
                      long long v374 = 0u;
                      long long v59 = [(IDSProtoKeyTransparencyLoggableData *)v327 applicationPublicIdentitys];
                      id v60 = [v59 countByEnumeratingWithState:&v374 objects:v409 count:16];
                      if (v60)
                      {
                        uint64_t v61 = *(void *)v375;
                        do
                        {
                          for (mm = 0; mm != v60; mm = (char *)mm + 1)
                          {
                            if (*(void *)v375 != v61) {
                              objc_enumerationMutation(v59);
                            }
                            long long v63 = *(void **)(*((void *)&v374 + 1) + 8 * (void)mm);
                            if ([v63 hasKeyIndex]
                              && [v63 hasPublicIdentity])
                            {
                              long long v64 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v63 keyIndex]);
                              long long v65 = [v63 publicIdentity];
                              CFMutableDictionaryRef Mutable = allocator;
                              if (!allocator) {
                                CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                              }
                              allocator = Mutable;
                              [(__CFDictionary *)Mutable setObject:v65 forKeyedSubscript:v64];
                            }
                          }
                          id v60 = [v59 countByEnumeratingWithState:&v374 objects:v409 count:16];
                        }
                        while (v60);
                      }
                    }
                    id v67 = [v304 objectForKey:@"service"];
                    id v68 = +[IDSDServiceController sharedInstance];
                    uint64_t v69 = [v68 serviceWithIdentifier:v67];

                    if ([v69 adHocServiceType])
                    {
                      v70 = +[IDSDServiceController sharedInstance];
                      uint64_t v71 = objc_msgSend(v70, "primaryServiceForAdhocServiceType:", objc_msgSend(v69, "adHocServiceType"));

                      uint64_t v69 = (void *)v71;
                    }
                    if ([v69 ktRegistrationDataIndex])
                    {
                      id v72 = objc_alloc_init((Class)IDSKTRegistrationData);
                      v73 = [v313 objectForKey:@"kt-loggable-data"];
                      v74 = [v313 objectForKey:@"kt-account-key"];
                      unint64_t v75 = [v325 objectForKey:v297];
                      [v72 setKtDataForRegistration:v73];
                      [v72 setKtPublicAccountKey:v74];
                      [v72 setKtDataSignature:v75];
                      __int16 v76 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v69 ktRegistrationDataIndex]);
                      [v307 setObject:v72 forKeyedSubscript:v76];
                    }
                  }
                  id v309 = [v295 countByEnumeratingWithState:&v378 objects:v410 count:16];
                }
                while (v309);
              }
            }
            id v288 = [v289 countByEnumeratingWithState:&v382 objects:v411 count:16];
          }
          while (v288);
        }
        else
        {
          v287 = 0;
          v283 = 0;
          v284 = 0;
          allocator = 0;
        }

        v111 = +[IDSRegistrationKeyManager sharedInstance];
        [v111 notePublicIdentityDidRegisterLegacyData:v287 ngmIdentityData:v284 ngmPrekeyData:v283 keyIndexToIdentityData:allocator];

        v112 = [v320 responseServices];
        v264 = [v320 responseHBI];
        v113 = +[IMRGLog registration];
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v404 = v275;
          *(_WORD *)&v404[8] = 2112;
          *(void *)&v404[10] = v264;
          *(_WORD *)&v404[18] = 2112;
          *(void *)&v404[20] = v112;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Received registration response for: %@   HBI: %@  services: %@", buf, 0x20u);
        }

        v114 = +[FTDeviceSupport sharedInstance];
        unsigned int v266 = [v114 isC2KEquipment];

        id v277 = [objc_alloc((Class)NSMutableArray) initWithArray:obj];
        long long v373 = 0u;
        long long v372 = 0u;
        long long v371 = 0u;
        long long v370 = 0u;
        id v257 = v112;
        id v115 = [v257 countByEnumeratingWithState:&v370 objects:v408 count:16];
        if (!v115)
        {
          v241 = v257;
          goto LABEL_387;
        }
        char v305 = 0;
        uint64_t v116 = *(void *)v371;
        v261 = (void *)kIDSServiceDefaultsSentinelAlias;
        uint64_t v251 = *(void *)v371;
        while (1)
        {
          uint64_t v117 = 0;
          id v252 = v115;
          do
          {
            if (*(void *)v371 != v116) {
              objc_enumerationMutation(v257);
            }
            v118 = *(void **)(*((void *)&v370 + 1) + 8 * v117);
            v322 = [v118 objectForKey:@"service"];
            uint64_t v119 = [v118 objectForKey:@"status"];
            v120 = [v118 objectForKey:@"users"];
            v260 = v118;
            uint64_t v121 = [v118 objectForKey:@"message"];
            v122 = +[IMRGLog registration];
            uint64_t v253 = v117;
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)v404 = v322;
              *(_WORD *)&v404[8] = 2112;
              *(void *)&v404[10] = v119;
              *(_WORD *)&v404[18] = 2114;
              *(void *)&v404[20] = v121;
              _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Processing registration response for service { service: %@, status: %@, serverErrorDetail: %{public}@ }", buf, 0x20u);
            }
            v254 = (void *)v119;
            v255 = (void *)v121;

            long long v369 = 0u;
            long long v368 = 0u;
            long long v367 = 0u;
            long long v366 = 0u;
            id v259 = v120;
            id v123 = [v259 countByEnumeratingWithState:&v366 objects:v407 count:16];
            if (v123)
            {
              uint64_t v258 = *(void *)v367;
              do
              {
                v263 = 0;
                id v256 = v123;
                do
                {
                  if (*(void *)v367 != v258) {
                    objc_enumerationMutation(v259);
                  }
                  v124 = *(void **)(*((void *)&v366 + 1) + 8 * (void)v263);
                  v280 = [v124 objectForKey:@"user-id"];
                  v265 = v124;
                  v125 = [v124 objectForKey:@"status"];
                  v262 = [v260 objectForKey:@"message"];
                  if ([v280 hasPrefix:@"P:"]
                    && IDSDebuggingShouldFakePhoneNumberChallenge())
                  {
                    v126 = IMGetDomainValueForKey();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0
                      || ![v126 length]
                      || [v126 isEqualToString:v322])
                    {
                      goto LABEL_203;
                    }
LABEL_378:
                    v278 = v125;
                    goto LABEL_204;
                  }
                  if ([v280 hasPrefix:@"D:"]
                    && IDSDebuggingShouldFakeEmailChallenge())
                  {
                    v126 = IMGetDomainValueForKey();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && [v126 length]
                      && ![v126 isEqualToString:v322])
                    {
                      goto LABEL_378;
                    }
LABEL_203:
                    v278 = +[NSNumber numberWithInteger:IMGetDomainIntForKey()];

LABEL_204:
                    goto LABEL_206;
                  }
                  v278 = v125;
LABEL_206:
                  v127 = +[IMRGLog registration];
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413058;
                    *(void *)v404 = v280;
                    *(_WORD *)&v404[8] = 2112;
                    *(void *)&v404[10] = v322;
                    *(_WORD *)&v404[18] = 2112;
                    *(void *)&v404[20] = v278;
                    *(_WORD *)&v404[28] = 2114;
                    *(void *)&v404[30] = v262;
                    _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Processing registration response for user { user: %@, service: %@, status: %@, serverErrorDetail: %{public}@ }", buf, 0x2Au);
                  }

                  uint64_t v128 = [v265 objectForKey:@"alert"];
                  v129 = v285;
                  v269 = (void *)v128;
                  if (v128) {
                    v129 = (void *)v128;
                  }
                  id v276 = v129;
                  v274 = [v265 objectForKey:@"cert"];
                  v268 = [v265 objectForKey:@"uris"];
                  v130 = v264;
                  if (!v264)
                  {
                    v130 = [v265 objectForKey:@"next-hbi"];
                  }
                  v264 = v130;
                  [v130 doubleValue];
                  double v132 = v131;
                  if (v131 < 60.0)
                  {
                    v133 = +[IDSHeartbeatCenter sharedInstance];
                    [v133 registrationHBI];
                    double v132 = v134;

                    v135 = +[IMRGLog registration];
                    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      *(double *)v404 = v132;
                      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "No value in response, we're using HBI: %f", buf, 0xCu);
                    }
                  }
                  if (v132 <= 60.0)
                  {
                    v136 = +[IMRGLog registration];
                    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Success, Using fallback registration date", buf, 2u);
                    }
                    v267 = 0;
                  }
                  else
                  {
                    v267 = +[NSDate dateWithTimeIntervalSinceNow:v132];
                    v136 = +[IMRGLog registration];
                    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v404 = v267;
                      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Success, next registration date is: %@", buf, 0xCu);
                    }
                  }

                  long long v365 = 0u;
                  long long v364 = 0u;
                  long long v363 = 0u;
                  long long v362 = 0u;
                  id v279 = obj;
                  id v282 = [v279 countByEnumeratingWithState:&v362 objects:v406 count:16];
                  if (v282)
                  {
                    uint64_t v281 = *(void *)v363;
                    do
                    {
                      v292 = 0;
                      do
                      {
                        if (*(void *)v363 != v281) {
                          objc_enumerationMutation(v279);
                        }
                        v303 = *(void **)(*((void *)&v362 + 1) + 8 * (void)v292);
                        v137 = [v303 serviceType];
                        v314 = sub_100148844(v137);

                        if ([v322 isEqualToIgnoringCase:v314])
                        {
                          v138 = [v303 idsUserID];
                          unsigned int v139 = [v280 isEqualToString:v138];

                          unsigned int v140 = [v303 registrationType];
                          v141 = v323;
                          if (v140 == 1)
                          {
                            v142 = [v303 profileID];
                            unsigned int v143 = [v280 isEqualToString:v142];

                            v141 = v323;
                          }
                          else
                          {
                            unsigned int v143 = 0;
                          }
                          if ((v139 | v143) == 1)
                          {
                            [(NSMutableArray *)v141->_currentRegistrations removeObjectIdenticalTo:v303];
                            [v277 removeObjectIdenticalTo:v303];
                            v144 = +[IMRGLog registration];
                            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
                            {
                              id v145 = [v303 idsUserID];
                              *(_DWORD *)buf = 138412546;
                              *(void *)v404 = v145;
                              *(_WORD *)&v404[8] = 2112;
                              *(void *)&v404[10] = v280;
                              _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "*** Matched registration user ID: %@ for user ID: %@", buf, 0x16u);
                            }
                            v146 = +[IMRGLog registration];
                            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(void *)v404 = v278;
                              _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, " Result status: %@", buf, 0xCu);
                            }

                            unsigned int v147 = [v278 intValue];
                            switch(v147)
                            {
                              case 0x1775u:
                              case 0x1778u:
                                v148 = +[IMRGLog registration];
                                if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  *(void *)v404 = v303;
                                  _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, " *** Need new credentials { candidateRegistration: %@ }", buf, 0xCu);
                                }

                                if (![v303 registrationType])
                                {
                                  v149 = [(IDSRegistrationCenter *)v323 registrationReasonTracker];
                                  v150 = [v303 userUniqueIdentifier];
                                  [v149 setPNRReason:14 forUserUniqueIdentifier:v150];

                                  v151 = +[IDSPACStateTracker sharedInstance];
                                  [v151 notePhoneAuthCertLost:1];
                                }
                                [v303 setAuthenticationCert:0];
                                uint64_t v152 = 37;
                                goto LABEL_323;
                              case 0x1776u:
                              case 0x1777u:
                              case 0x177Au:
                              case 0x177Bu:
                              case 0x177Cu:
                                goto LABEL_247;
                              case 0x1779u:
                                v161 = +[IMRGLog registration];
                                if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  *(void *)v404 = v303;
                                  _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, " *** Server rejected registration permanently { candidateRegistration: %@ }", buf, 0xCu);
                                }

                                sub_1002396B0(v269);
                                uint64_t v152 = 38;
                                goto LABEL_323;
                              case 0x177Du:
                                v158 = +[IMRGLog registration];
                                if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  *(void *)v404 = v303;
                                  _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, " *** Server rejected registration, need new Account Key for KT. { candidateRegistration: %@ }", buf, 0xCu);
                                }

                                if (!_os_feature_enabled_impl()) {
                                  goto LABEL_256;
                                }
                                v159 = [v265 objectForKey:@"kt-account-key"];
                                id v160 = objc_alloc_init((Class)TransparencyDaemon);
                                [v160 transparencyCheckKTAccountKey:v159 complete:&stru_1009869C8];

                                uint64_t v152 = 47;
                                goto LABEL_322;
                              default:
                                if (!v147)
                                {
                                  v155 = +[IMRGLog registration];
                                  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_WORD *)buf = 0;
                                    v156 = v155;
                                    v157 = " Success!";
LABEL_262:
                                    _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, v157, buf, 2u);
                                  }
LABEL_263:

                                  v162 = (NSDate *)objc_alloc_init((Class)NSDate);
                                  dateLastRegistered = v323->_dateLastRegistered;
                                  v323->_dateLastRegistered = v162;

                                  id v300 = objc_alloc_init((Class)NSMutableArray);
                                  id v290 = objc_alloc_init((Class)NSMutableArray);
                                  v164 = v323;
                                  long long v361 = 0u;
                                  long long v360 = 0u;
                                  long long v359 = 0u;
                                  long long v358 = 0u;
                                  id v311 = v268;
                                  id v165 = [v311 countByEnumeratingWithState:&v358 objects:v405 count:16];
                                  if (v165)
                                  {
                                    uint64_t v317 = *(void *)v359;
                                    do
                                    {
                                      id v319 = v165;
                                      for (nn = 0; nn != v319; nn = (char *)nn + 1)
                                      {
                                        if (*(void *)v359 != v317) {
                                          objc_enumerationMutation(v311);
                                        }
                                        v167 = *(void **)(*((void *)&v358 + 1) + 8 * (void)nn);
                                        v168 = [v167 objectForKey:@"uri"];
                                        v328 = [v167 objectForKey:@"status"];
                                        uint64_t v169 = [v167 objectForKey:@"kt-status"];
                                        if (v168)
                                        {
                                          id v170 = +[IDSURI URIWithPrefixedURI:v168];

                                          v164 = v323;
                                        }
                                        else
                                        {
                                          id v170 = 0;
                                        }
                                        v326 = [(IDSRegistrationCenter *)v164 _keyTransparencyAccountKeyFromRegistrationMessage:v320 service:v322 URI:v170];
                                        uint64_t v171 = [v167 objectForKey:@"kt-blob"];
                                        v172 = +[IMRGLog registration];
                                        if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
                                        {
                                          *(_DWORD *)buf = 138412546;
                                          *(void *)v404 = v314;
                                          *(_WORD *)&v404[8] = 2112;
                                          *(void *)&v404[10] = v167;
                                          _os_log_debug_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEBUG, "Received per-URI status dictionary in register response { service: %@, binding: %@ }", buf, 0x16u);
                                        }

                                        if (v168 && ![v328 intValue])
                                        {
                                          [v300 addObject:v168];
                                        }
                                        else
                                        {
                                          v173 = +[IMRGLog registration];
                                          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 138412802;
                                            *(void *)v404 = v314;
                                            *(_WORD *)&v404[8] = 2112;
                                            *(void *)&v404[10] = v168;
                                            *(_WORD *)&v404[18] = 2112;
                                            *(void *)&v404[20] = v328;
                                            _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "Invalid status returned for a URI in register response -- dropping { service: %@, URI: %@, status: %@ }", buf, 0x20u);
                                          }
                                        }
                                        if (v169 | v171)
                                        {
                                          v174 = +[IDSFoundationLog KeyTransparency];
                                          if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 138413314;
                                            *(void *)v404 = v314;
                                            *(_WORD *)&v404[8] = 2112;
                                            *(void *)&v404[10] = v168;
                                            *(_WORD *)&v404[18] = 2112;
                                            *(void *)&v404[20] = v326;
                                            *(_WORD *)&v404[28] = 2112;
                                            *(void *)&v404[30] = v169;
                                            *(_WORD *)&v404[38] = 2112;
                                            *(void *)&v404[40] = v171;
                                            _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "KT data returned in register response { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }", buf, 0x34u);
                                          }
                                        }
                                        if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
                                        {
                                          v175 = +[IDSDServiceController sharedInstance];
                                          v176 = [v175 serviceWithIdentifier:v322];

                                          if ([v176 adHocServiceType])
                                          {
                                            v177 = +[IDSDServiceController sharedInstance];
                                            uint64_t v178 = objc_msgSend(v177, "primaryServiceForAdhocServiceType:", objc_msgSend(v176, "adHocServiceType"));

                                            v176 = (void *)v178;
                                          }
                                          if ([v176 ktRegistrationDataIndex])
                                          {
                                            id v179 = [v176 ktRegistrationDataIndex];
                                            v180 = +[IDSRegistrationKeyManager sharedInstance];
                                            v181 = +[NSNumber numberWithUnsignedShort:v179];
                                            v182 = [v307 objectForKeyedSubscript:v181];
                                            [v180 noteDidRegisterKTData:v182 forKeyIndex:v179];

                                            char v305 = 1;
                                          }
                                          if (v169 && v170 && ![(id)v169 integerValue])
                                          {
                                            if (v326)
                                            {
                                              [v290 addObject:v168];
                                              v183 = [IDSKeyTransparencyIndex alloc];
                                              v184 = [v303 serviceIdentifier];
                                              v298 = [(IDSKeyTransparencyIndex *)v183 initWithServiceIdentifier:v184 accountKey:v326 URI:v170];

                                              v294 = [[IDSKeyTransparencyVerificationState alloc] initWithTransparencyStatus:v169 transparencyBlob:v171];
                                              id v296 = [(IDSRegistrationCenter *)v323 _keyTransparencyLoggableDataFromRegistrationMessage:v320 service:v322 URI:v170];
                                              v185 = [(IDSRegistrationCenter *)v323 _keyTransparencyDeviceSignatureFromRegistrationMessage:v320 service:v322 URI:v170];
                                              v186 = [v303 pushToken];
                                              if (v185 && v296 && v186)
                                              {
                                                id v286 = v186;
                                                v187 = [IDSKeyTransparencyEntry alloc];
                                                v188 = [v303 pushToken];
                                                v189 = [(IDSKeyTransparencyEntry *)v187 initWithPushToken:v188 loggableData:v296 signedData:v185];

                                                [(IDSKeyTransparencyEntry *)v189 setKtCapable:1];
                                                v190 = [(IDSRegistrationCenter *)v323 keyTransparencyVerifier];
                                                id v191 = [v190 transparencyTicketForRegistrationWithIndex:v298 verificationState:v294 entry:v189];

                                                v186 = v286;
                                              }
                                            }
                                            else
                                            {
                                              v192 = +[IDSFoundationLog KeyTransparency];
                                              v298 = (IDSKeyTransparencyIndex *)v192;
                                              if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                                              {
                                                *(_WORD *)buf = 0;
                                                _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_DEFAULT, "Received no KTAccount key.", buf, 2u);
                                              }
                                            }
                                          }
                                        }

                                        v164 = v323;
                                      }
                                      id v165 = [v311 countByEnumeratingWithState:&v358 objects:v405 count:16];
                                    }
                                    while (v165);
                                  }

                                  v193 = v300;
                                  v194 = [v303 serviceType];
                                  char v195 = IDSIsFaceTimeRegistrationServiceType();

                                  if ((v195 & 1) != 0
                                    || ([v303 serviceType],
                                        v196 = objc_claimAutoreleasedReturnValue(),
                                        int v197 = IDSIsCallingRegistrationServiceType(),
                                        v196,
                                        v197))
                                  {
                                    uint64_t v198 = _IDSInvitationProtocolVersionNumber();
                                  }
                                  else
                                  {
                                    v215 = [v303 serviceType];
                                    int v216 = IDSIsiMessageRegistrationServiceType();

                                    if (v216) {
                                      _IDSiMessageProtocolVersionNumber();
                                    }
                                    else {
                                    uint64_t v198 = _IDSAlloyProtocolVersionNumber();
                                    }
                                  }
                                  v199 = (void *)v198;
                                  [v303 setRegistrationCert:v274];
                                  v200 = +[NSDate date];
                                  [v303 setRegistrationDate:v200];

                                  [v303 setNextRegistrationDate:v267];
                                  v201 = +[IDSServerBag sharedInstance];
                                  v202 = [v201 apsEnvironmentName];
                                  [v303 setEnvironment:v202];

                                  v203 = [v320 pushToken];
                                  [v303 setPushToken:v203];

                                  [v303 setApplicationVersion:v199];
                                  v204 = _IDSIdentityVersionNumber();
                                  [v303 setIdentityVersion:v204];

                                  v205 = _IDSIDProtocolVersionNumber();
                                  [v303 setIDSVersion:v205];

                                  [v303 setRegistrationStatus:8];
                                  [v303 setDeviceName:v306];
                                  v206 = +[NSNumber numberWithBool:v266];
                                  [v303 setIsCDMA:v206];

                                  if ([v303 isDisabled])
                                  {
                                    v207 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 138412290;
                                      *(void *)v404 = v303;
                                      v208 = v207;
                                      v209 = "Registration disabled, not saving. { candidateRegistration : %@ }";
                                      goto LABEL_311;
                                    }
                                  }
                                  else
                                  {
                                    [v303 saveToKeychain];
                                    v207 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 138412290;
                                      *(void *)v404 = v303;
                                      v208 = v207;
                                      v209 = "Registration not disabled, saving. { candidateRegistration : %@ }";
LABEL_311:
                                      _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_DEFAULT, v209, buf, 0xCu);
                                    }
                                  }

                                  if (![v303 registrationType])
                                  {
                                    v210 = [v193 _IDsFromURIs];
                                    v211 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "Extracted IDs from bindings", buf, 2u);
                                    }

                                    v212 = objc_msgSend(v210, "__imFirstObject");
                                    if ([v212 length])
                                    {
                                      v213 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 138412546;
                                        *(void *)v404 = v212;
                                        *(_WORD *)&v404[8] = 2112;
                                        *(void *)&v404[10] = v303;
                                        _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "Setting number: %@  on registration: %@", buf, 0x16u);
                                      }

                                      [v303 setPhoneNumber:v212];
                                    }
                                    else
                                    {
                                      v217 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "Number is empty, not adjusting", buf, 2u);
                                      }
                                    }
                                  }
                                  v218 = v193;
                                  if ([v303 registrationType] != 1) {
                                    goto LABEL_354;
                                  }
                                  v218 = v193;
                                  if ([v193 count]) {
                                    goto LABEL_354;
                                  }
                                  if ([v303 shouldRegisterUsingDSHandle])
                                  {
                                    v219 = [v303 dsHandle];

                                    if (v219)
                                    {
                                      v220 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_DEFAULT, " => Adding self handle", buf, 2u);
                                      }

                                      v221 = [v303 dsHandle];
                                      uint64_t v222 = IMSingleObjectArray();
LABEL_352:
                                      v218 = (void *)v222;
                                      v224 = v193;
LABEL_353:

LABEL_354:
                                      v225 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)v404 = v218;
                                        _os_log_impl((void *)&_mh_execute_header, v225, OS_LOG_TYPE_DEFAULT, "Success, registered URIs are: %@", buf, 0xCu);
                                      }

                                      v226 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)v404 = v290;
                                        _os_log_debug_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_DEBUG, "KT enrolled URIs are: %@", buf, 0xCu);
                                      }

                                      [v303 setUris:v218];
                                      [v303 setKeyTransparencyEnrolledURIs:v290];
                                      v227 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)v404 = v303;
                                        _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, " Notifying for success of: %@", buf, 0xCu);
                                      }

                                      v228 = OSLogHandleForIDSCategory();
                                      if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                                      {
                                        id v229 = [v303 mainID];
                                        id v230 = [v303 serviceIdentifier];
                                        *(_DWORD *)buf = 138412546;
                                        *(void *)v404 = v229;
                                        *(_WORD *)&v404[8] = 2112;
                                        *(void *)&v404[10] = v230;
                                        _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEFAULT, "Registration SUCCESS for %@ on %@", buf, 0x16u);
                                      }
                                      v231 = v323;
                                      if (os_log_shim_legacy_logging_enabled())
                                      {
                                        v232 = [v303 mainID];
                                        [v303 serviceIdentifier];
                                        v250 = v249 = v232;
                                        _IDSLogEventV();

                                        v231 = v323;
                                      }
                                      -[IDSRegistrationCenter _notifyRegistrationSuccess:](v231, "_notifyRegistrationSuccess:", v303, v249, v250);
                                      successfulRegistrations = v231->_successfulRegistrations;
                                      if (!successfulRegistrations)
                                      {
                                        id v234 = objc_alloc_init((Class)NSMutableArray);
                                        v236 = v231->_successfulRegistrations;
                                        p_successfulRegistrations = (void **)&v231->_successfulRegistrations;
                                        *p_successfulRegistrations = v234;

                                        successfulRegistrations = *p_successfulRegistrations;
                                      }
                                      [successfulRegistrations addObject:v303];
LABEL_367:

                                      break;
                                    }
                                    v223 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, " => Adding sentinel, registration doesn't have a self-handle yet", buf, 2u);
                                    }
                                  }
                                  else
                                  {
                                    if (!+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
                                    {
                                      if (sub_1002399C4())
                                      {
                                        v224 = +[IMRGLog registration];
                                        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_DEFAULT, " => Registration is allowed to continue with empty identities", buf, 2u);
                                        }
                                        v221 = v193;
                                        v218 = &__NSArray0__struct;
                                        goto LABEL_353;
                                      }
                                      v237 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)v404 = v303;
                                        _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_DEFAULT, " => ***** No registered identities, failing registration: %@ ******", buf, 0xCu);
                                      }

                                      v238 = +[IMRGLog registration];
                                      if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)v404 = v303;
                                        _os_log_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEFAULT, "***** Notifying, empty URI response: %@ *****", buf, 0xCu);
                                      }

                                      [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:v303 responseCode:0 registrationError:42 error:v312 info:v276];
                                      v218 = v193;
                                      goto LABEL_367;
                                    }
                                    v223 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, " => Adding sentinel binding", buf, 2u);
                                    }
                                  }

                                  v221 = [v261 lowercaseString];
                                  uint64_t v222 = IMSingleObjectArray();
                                  goto LABEL_352;
                                }
                                if (v147 == 6001)
                                {
                                  v153 = +[IMRGLog registration];
                                  if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    *(void *)v404 = v303;
                                    _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, " *** Server rejected registration { candidateRegistration: %@ }", buf, 0xCu);
                                  }

                                  sub_1002396B0(v269);
LABEL_256:
                                  uint64_t v152 = 31;
                                }
                                else
                                {
LABEL_247:
                                  v154 = +[IMRGLog registration];
                                  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    *(void *)v404 = v278;
                                    _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, " *** Unhandled status code: %@", buf, 0xCu);
                                  }

                                  if ([v274 length])
                                  {
                                    v155 = +[IMRGLog registration];
                                    if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      v156 = v155;
                                      v157 = " => We have a cert, treating as success";
                                      goto LABEL_262;
                                    }
                                    goto LABEL_263;
                                  }
                                  v159 = +[IMRGLog registration];
                                  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_WORD *)buf = 0;
                                    _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, " => We have no cert, treating as failure", buf, 2u);
                                  }
                                  uint64_t v152 = 9;
LABEL_322:
                                }
LABEL_323:
                                v214 = +[IMRGLog registration];
                                if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138412802;
                                  *(void *)v404 = v278;
                                  *(_WORD *)&v404[8] = 1024;
                                  *(_DWORD *)&v404[10] = v152;
                                  *(_WORD *)&v404[14] = 2112;
                                  *(void *)&v404[16] = v303;
                                  _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, " ***** Notifying for failure (code: %@:%d) of: %@", buf, 0x1Cu);
                                }

                                [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:v303 responseCode:0 registrationError:v152 error:v312 info:v276];
                                break;
                            }
                          }
                        }

                        v292 = (char *)v292 + 1;
                      }
                      while (v292 != v282);
                      id v239 = [v279 countByEnumeratingWithState:&v362 objects:v406 count:16];
                      id v282 = v239;
                    }
                    while (v239);
                  }

                  v263 = (char *)v263 + 1;
                }
                while (v263 != v256);
                id v123 = [v259 countByEnumeratingWithState:&v366 objects:v407 count:16];
              }
              while (v123);
            }

            uint64_t v117 = v253 + 1;
            uint64_t v116 = v251;
          }
          while ((id)(v253 + 1) != v252);
          id v115 = [v257 countByEnumeratingWithState:&v370 objects:v408 count:16];
          if (!v115)
          {

            if (v305)
            {
              v240 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "Serializing and persisting updates to KT registration data.", buf, 2u);
              }

              v241 = +[IDSRegistrationKeyManager sharedInstance];
              [v241 _serializeAndPersistKTRegistrationDataDeleteIfNull:1];
LABEL_387:
            }
            [(IDSRegistrationCenter *)v323 _notifyAllSuccessfulRegistrations:v323->_successfulRegistrations];
            v242 = v323->_successfulRegistrations;
            v323->_successfulRegistrations = 0;

            if ([v277 count])
            {
              v243 = +[IMRGLog registration];
              if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v244 = [v277 count];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v404 = v244;
                *(_WORD *)&v404[4] = 2112;
                *(void *)&v404[6] = v277;
                v245 = " *** We have %d unhandled registrations leftover from this: %@";
                v246 = v243;
                uint32_t v247 = 18;
                goto LABEL_393;
              }
            }
            else
            {
              v243 = +[IMRGLog registration];
              if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v245 = " All registrations were handled, we're good to go";
                v246 = v243;
                uint32_t v247 = 2;
LABEL_393:
                _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, v245, buf, v247);
              }
            }

            v248 = +[IDSHeartbeatCenter sharedInstance];
            [v248 updateHeartbeat];

            goto LABEL_395;
          }
        }
      }
LABEL_100:
      if (v20 >> 1 == 4000)
      {
        v77 = +[IMRGLog registration];
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Failed constructing validation data", buf, 2u);
        }

        long long v340 = 0u;
        long long v341 = 0u;
        if (v20 == 8001) {
          uint64_t v78 = 45;
        }
        else {
          uint64_t v78 = 44;
        }
        long long v338 = 0uLL;
        long long v339 = 0uLL;
        id v306 = obj;
        id v79 = [v306 countByEnumeratingWithState:&v338 objects:v398 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v339;
          do
          {
            for (i1 = 0; i1 != v79; i1 = (char *)i1 + 1)
            {
              if (*(void *)v339 != v80) {
                objc_enumerationMutation(v306);
              }
              [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v338 + 1) + 8 * (void)i1) responseCode:v20 registrationError:v78 error:v312 info:v285];
            }
            id v79 = [v306 countByEnumeratingWithState:&v338 objects:v398 count:16];
          }
          while (v79);
        }
      }
      else if (v312 || v20 != 1)
      {
        v106 = +[IMRGLog registration];
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v404 = v20;
          *(_WORD *)&v404[4] = 2112;
          *(void *)&v404[6] = v312;
          *(_WORD *)&v404[14] = 2112;
          *(void *)&v404[16] = v273;
          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Registration attempt failed with status code: %d   error: %@   result: %@", buf, 0x1Cu);
        }

        v107 = +[IMRGLog registration];
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Communicating with registration server failed", buf, 2u);
        }

        long long v332 = 0u;
        long long v333 = 0u;
        long long v330 = 0u;
        long long v331 = 0u;
        id v306 = obj;
        id v108 = [v306 countByEnumeratingWithState:&v330 objects:v396 count:16];
        if (v108)
        {
          uint64_t v109 = *(void *)v331;
          do
          {
            for (i2 = 0; i2 != v108; i2 = (char *)i2 + 1)
            {
              if (*(void *)v331 != v109) {
                objc_enumerationMutation(v306);
              }
              [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v330 + 1) + 8 * (void)i2) responseCode:v20 registrationError:46 error:v312 info:v285];
            }
            id v108 = [v306 countByEnumeratingWithState:&v330 objects:v396 count:16];
          }
          while (v108);
        }
      }
      else
      {
        v102 = +[IMRGLog registration];
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Registration attempt failed with no status code", buf, 2u);
        }

        long long v336 = 0u;
        long long v337 = 0u;
        long long v334 = 0u;
        long long v335 = 0u;
        id v306 = obj;
        id v103 = [v306 countByEnumeratingWithState:&v334 objects:v397 count:16];
        if (v103)
        {
          uint64_t v104 = *(void *)v335;
          do
          {
            for (i3 = 0; i3 != v103; i3 = (char *)i3 + 1)
            {
              if (*(void *)v335 != v104) {
                objc_enumerationMutation(v306);
              }
              [(IDSRegistrationCenter *)v323 _notifyRegistrationFailure:*(void *)(*((void *)&v334 + 1) + 8 * (void)i3) responseCode:1 registrationError:15 error:0 info:v285];
            }
            id v103 = [v306 countByEnumeratingWithState:&v334 objects:v397 count:16];
          }
          while (v103);
        }
      }
LABEL_395:

      p_isa = (id *)&v323->super.isa;
LABEL_396:
      sub_1002396B0(v285);
      [p_isa[18] removeFromQueue:v320 subsystem:1];
      [p_isa _dequeuePendingRequestsIfNecessary];

      os_activity_scope_leave(&state);
      cut_arc_os_release();

      return;
  }
}

- (id)_URIsToRegisterForRegistration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (![v3 registrationType] || objc_msgSend(v3, "registrationType") == 2)
  {
    id v5 = [v3 phoneNumber];
    id v6 = IMSingleObjectArray();
    id v7 = [v6 _URIsFromIDs];
    id v8 = objc_msgSend(v7, "__imArrayByApplyingBlock:", &stru_1009869E8);
    [v4 addObjectsFromArray:v8];

LABEL_4:
    goto LABEL_5;
  }
  if ([v3 registrationType] == 1)
  {
    id v5 = [v3 emailsToRegister];
    id v6 = [v5 _URIsFromIDs];
    id v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_100986A08);
    [v4 addObjectsFromArray:v7];
    goto LABEL_4;
  }
LABEL_5:
  id v9 = +[NSSet setWithArray:v4];

  return v9;
}

- (id)_trustedDeviceForRegistrations:(id)a3 transparencyLoggableDatasByServiceType:(id)a4 transparencyDeviceSignaturesByServiceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v44;
    id v31 = v8;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10023A010;
        v42[3] = &unk_100986A30;
        v42[4] = v11;
        uint64_t v12 = objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v42, v31);
        if ([v12 count])
        {
          uint64_t v13 = [v12 firstObject];
          long long v37 = [v13 serviceIdentifier];
        }
        else
        {
          long long v37 = 0;
        }
        id v14 = objc_alloc_init((Class)NSMutableSet);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v39;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v15);
              }
              unint64_t v20 = [(IDSRegistrationCenter *)self _URIsToRegisterForRegistration:*(void *)(*((void *)&v38 + 1) + 8 * (void)j)];
              [v14 unionSet:v20];
            }
            id v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v17);
        }

        long long v21 = [obj objectForKeyedSubscript:v11];
        uint64_t v22 = [v34 objectForKeyedSubscript:v11];
        long long v23 = (void *)v22;
        if (v21 && v22)
        {
          long long v24 = objc_alloc_init(IDSProtoKeyTransparencyTrustedService);
          [(IDSProtoKeyTransparencyTrustedService *)v24 setServiceIdentifier:v37];
          id v25 = [v14 allObjects];
          id v26 = objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_100986A50);
          id v27 = [v26 mutableCopy];
          [(IDSProtoKeyTransparencyTrustedService *)v24 setUris:v27];

          id v8 = v31;
          [(IDSProtoKeyTransparencyTrustedService *)v24 setKtLoggableData:v21];
          [(IDSProtoKeyTransparencyTrustedService *)v24 setDeviceSignature:v23];
          [v32 addObject:v24];
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v35);
  }

  uint64_t v28 = objc_alloc_init(IDSProtoKeyTransparencyTrustedDevice);
  id v29 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSProtoKeyTransparencyTrustedDevice *)v28 setPushToken:v29];

  [(IDSProtoKeyTransparencyTrustedDevice *)v28 setTrustedServices:v32];

  return v28;
}

- (id)privateDeviceDataForKVSSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[FTDeviceSupport sharedInstance];
  id v53 = [v4 deviceType];

  id v5 = +[FTDeviceSupport sharedInstance];
  value = [v5 deviceColor];

  id v6 = +[FTDeviceSupport sharedInstance];
  unsigned int v56 = [v6 enclosureColor];

  id v7 = +[IDSCurrentDevice sharedInstance];
  unsigned int v55 = [v7 deviceIdentifier];

  id v8 = +[NSDate date];
  [v8 timeIntervalSinceReferenceDate];
  id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v54 = [v9 stringValue];

  if (v3) {
    id v10 = &off_1009D1998;
  }
  else {
    id v10 = &off_1009D19B0;
  }
  id v52 = [v10 stringValue];
  unsigned int v51 = +[NSNumber numberWithLongLong:kTransparencyAnalyticsVersion];
  uint64_t v11 = +[FTDeviceSupport sharedInstance];
  id v12 = [v11 supportsSMS];

  uint64_t v13 = +[FTDeviceSupport sharedInstance];
  unsigned int v50 = [v13 supportsMMS];

  id v14 = +[FTDeviceSupport sharedInstance];
  id v15 = [v14 supportsApplePay];

  id v16 = +[FTDeviceSupport sharedInstance];
  id v17 = [v16 supportsHandoff];

  uint64_t v18 = +[FTDeviceSupport sharedInstance];
  id v19 = [v18 supportsTethering];

  unint64_t v20 = +[IDSCTAdapter sharedInstance];
  if ([v20 supportsIdentification])
  {
    long long v21 = +[FTDeviceSupport sharedInstance];
    BOOL v22 = [v21 deviceType] == (id)2;
  }
  else
  {
    BOOL v22 = 0;
  }

  long long v23 = +[FTDeviceSupport sharedInstance];
  id v24 = [v23 isGreenTea];

  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  id v26 = _IDSPrivateDeviceDataVersionNumber();
  id v27 = [v26 stringValue];
  [v25 setObject:v27 forKey:IDSPrivateDeviceDataVersion];

  uint64_t v28 = +[NSNumber numberWithBool:v15];
  id v29 = [v28 stringValue];
  [v25 setObject:v29 forKey:IDSPrivateDeviceDataSupportsApplePay];

  id v30 = +[NSNumber numberWithBool:v17];
  id v31 = [v30 stringValue];
  [v25 setObject:v31 forKey:IDSPrivateDeviceDataSupportsHandoff];

  id v32 = +[NSNumber numberWithBool:v19];
  uint64_t v33 = [v32 stringValue];
  [v25 setObject:v33 forKey:IDSPrivateDeviceDataSupportsTethering];

  id v34 = +[NSNumber numberWithBool:v12];
  id v35 = [v34 stringValue];
  [v25 setObject:v35 forKey:IDSPrivateDeviceDataSupportsSMSRelay];

  long long v36 = +[NSNumber numberWithBool:v50];
  long long v37 = [v36 stringValue];
  [v25 setObject:v37 forKey:IDSPrivateDeviceDataSupportsMMSRelay];

  long long v38 = +[NSNumber numberWithBool:v22];
  long long v39 = [v38 stringValue];
  [v25 setObject:v39 forKey:IDSPrivateDeviceDataSupportsPhoneCalls];

  long long v40 = +[NSNumber numberWithBool:v24];
  long long v41 = [v40 stringValue];
  [v25 setObject:v41 forKey:IDSPrivateDeviceDataGreenTea];

  long long v42 = +[IMDeviceSupport sharedInstance];
  long long v43 = [v42 productBuildVersion];

  if (v43) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductBuildVersion, v43);
  }

  long long v44 = +[IMDeviceSupport sharedInstance];
  long long v45 = [v44 productName];

  if (v45) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductName, v45);
  }

  long long v46 = +[IMDeviceSupport sharedInstance];
  unsigned int v47 = [v46 productVersion];

  if (v47) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataProductVersion, v47);
  }

  if (v55) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataUniqueID, v55);
  }
  if (v54) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataRegistrationDate, v54);
  }
  id v48 = +[NSNumber numberWithInteger:v53];
  if (v48) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataDeviceType, v48);
  }

  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataColor, value);
  }
  if (v56) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataEnclosureColor, v56);
  }
  if (v52) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataKeyTransparencyFlags, v52);
  }
  if (v51) {
    CFDictionarySetValue((CFMutableDictionaryRef)v25, IDSPrivateDeviceDataTransparencyVersion, v51);
  }

  return v25;
}

- (void)_sendRegistrationAsDeregister:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v62 = _os_activity_create((void *)&_mh_execute_header, "Registration center send registration message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v62, &state);
  if (v3)
  {
    if (!self->_pendingDeregistration)
    {
      id v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "This is a deregister, and we have no pending deregistration, bailing", buf, 2u);
      }
      goto LABEL_23;
    }
    CFStringRef v5 = @"deregistration";
    CFStringRef v6 = @"deregister";
  }
  else
  {
    CFStringRef v5 = @"registration";
    CFStringRef v6 = @"register";
  }
  id v7 = [(IDSPushHandler *)self->_pushHandler pushToken];
  if (+[IDSRegistrationController canCompleteRegistration])
  {
    if (![v7 length])
    {
      id v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(IDSPushHandler *)self->_pushHandler pushToken];
        currentRegistrations = self->_currentRegistrations;
        *(_DWORD *)buf = 138412546;
        long long v64 = v9;
        __int16 v65 = 2112;
        v66 = currentRegistrations;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push handler returned push token: %@, deferring (%@)", buf, 0x16u);
      }
      [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
    }
    if ([(NSMutableArray *)self->_currentRegistrations count])
    {
      uint64_t v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = self->_currentRegistrations;
        *(_DWORD *)buf = 138412290;
        long long v64 = v12;
        uint64_t v13 = "*** We have current (de)registrations, deferring (%@)";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    id v15 = +[IMLockdownManager sharedInstance];
    unsigned int v16 = [v15 isExpired];

    if (v16)
    {
      uint64_t v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v64 = (void *)v5;
        uint64_t v13 = "*** Lockdown state is expired, not sending %@";
        goto LABEL_21;
      }
LABEL_22:

      [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
      goto LABEL_23;
    }
    if ([(IDSRegistrationCenter *)self _checkOverRegistrations])
    {
      id v17 = +[IMRGLog warning];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_10071AFEC();
      }

      unsigned int v51 = _NSConcreteStackBlock;
      uint64_t v52 = 3221225472;
      id v53 = sub_10023AE20;
      id v54 = &unk_10097E4D0;
      unsigned int v55 = self;
      im_dispatch_after_primary_queue();
    }
    else if ([(IDSRegistrationCenter *)self _hasOngoingAuthentications])
    {
      uint64_t v18 = +[IMRGLog registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "*** We have an ongoing authentication, deferring register", buf, 2u);
      }

      long long v46 = _NSConcreteStackBlock;
      uint64_t v47 = 3221225472;
      id v48 = sub_10023AE28;
      unsigned int v49 = &unk_10097E4D0;
      unsigned int v50 = self;
      im_dispatch_after_primary_queue();
    }
    else
    {
      [(IDSRegistrationCenter *)self _shouldDisableSecondaryRegistration];
      id v19 = +[IDSCTAdapter sharedInstance];
      unsigned __int8 v37 = [v19 hasMultipleSIMs];

      unint64_t v20 = +[IDSCTAdapter sharedInstance];
      unsigned __int8 v36 = [v20 dualSIMCapabilityEnabled];

      long long v21 = +[FTUserConfiguration sharedInstance];
      unsigned __int8 v35 = [v21 isDeviceInDualPhoneIdentityMode];

      BOOL v22 = +[NSString stringGUID];
      id v34 = objc_alloc_init(IDSRegistrationMessage);
      long long v23 = +[NSString stringWithFormat:@"Sending IDS %@", v5];
      sub_1001484DC(0, @"Registration", v23, 0);

      id v24 = +[IDSRegistrationController sharedInstance];
      id v25 = [v24 activeRegistrationsToRegister];
      id v26 = [v25 _copyForEnumerating];

      [(NSMutableArray *)self->_currentRegistrations addObjectsFromArray:v26];
      id v27 = +[IMRGLog registration];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Constructing client data objects", buf, 2u);
      }

      uint64_t v28 = +[IDSRegistrationKeyManager sharedInstance];
      id v29 = +[IDSKeyTransparencyVerifier sharedInstance];
      id v30 = +[IDSClientDataGenerator clientDatasForRegistrations:v26 keyStore:v28 keyTransparencyVerifier:v29];

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10023AE30;
      v38[3] = &unk_100986B08;
      v38[4] = self;
      id v31 = v26;
      id v39 = v31;
      char v44 = (v36 | v37) & v35;
      id v32 = v34;
      long long v40 = v32;
      id v33 = v22;
      id v41 = v33;
      long long v42 = (__CFString *)v5;
      long long v43 = (__CFString *)v6;
      BOOL v45 = v3;
      [v30 registerResultBlock:v38];
    }
  }
  else
  {
    id v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Waiting for setup/first unlock to complete before sending registration message -- deferring registration", buf, 2u);
    }

    unsigned int v56 = _NSConcreteStackBlock;
    uint64_t v57 = 3221225472;
    id v58 = sub_10023AE18;
    long long v59 = &unk_10097E4D0;
    id v60 = self;
    im_dispatch_after_primary_queue();
  }
LABEL_23:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)__reallySendDeregistration
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending deregistration now...", v4, 2u);
  }

  self->_pendingDeregistration = 1;
  [(IDSRegistrationCenter *)self _sendRegistrationAsDeregister:1];
}

- (void)_sendDeregistration:(id)a3
{
  id v4 = a3;
  sub_1001484DC(0, @"Registration", @"Sending IDS deregistration", 0);
  CFStringRef v5 = +[IMLockdownManager sharedInstance];
  unsigned int v6 = [v5 isExpired];

  id v7 = +[IMRGLog registration];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not sending de-registration", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deferring deregistration for %@", (uint8_t *)&v9, 0xCu);
    }

    [(CUTDeferredTaskQueue *)self->_sendDeregistrationTask enqueueExecutionWithTarget:self afterDelay:6.0];
  }
}

- (void)sendHardDeregisterCompletionBlock:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  char v44 = _os_activity_create((void *)&_mh_execute_header, "Registration center send hard deregister", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  CFStringRef v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending hard deregistration now...", buf, 2u);
  }

  [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery invalidate];
  [(CUTDeferredTaskQueue *)self->_sendAuthenticateRegistrationTask cancelPendingExecutions];
  [(CUTDeferredTaskQueue *)self->_sendDeregistrationTask cancelPendingExecutions];
  [(CUTDeferredTaskQueue *)self->_sendRegistrationTask cancelPendingExecutions];
  queuedAuthentications = self->_queuedAuthentications;
  self->_queuedAuthentications = 0;

  queuedRegistrations = self->_queuedRegistrations;
  self->_queuedRegistrations = 0;

  [(IDSValidationQueue *)self->_validationQueue clearQueueForSubsystem:1];
  BOOL v8 = +[IMLockdownManager sharedInstance];
  unsigned int v9 = [v8 isExpired];

  if (v9)
  {
    id v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"hard deregister";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not sending %@", buf, 0xCu);
    }

    [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  }
  else
  {
    uint64_t v11 = +[NSString stringGUID];
    id v12 = objc_alloc_init(IDSRegistrationMessage);
    uint64_t v13 = +[NSString stringWithFormat:@"Sending IDS %@", @"hard deregister"];
    sub_1001484DC(0, @"Registration", v13, 0);

    id v14 = +[FTDeviceSupport sharedInstance];
    id v15 = [v14 model];

    unsigned int v16 = +[FTDeviceSupport sharedInstance];
    id v17 = [v16 productOSVersion];

    uint64_t v18 = +[FTDeviceSupport sharedInstance];
    id v19 = [v18 productBuildVersion];

    unint64_t v20 = +[FTDeviceSupport sharedInstance];
    long long v21 = [v20 deviceName];

    IDSAssignPushIdentityToMessage();
    BOOL v22 = +[NSArray array];
    [(IDSRegistrationMessage *)v12 setServices:v22];

    [(IDSRegistrationMessage *)v12 setDeviceName:v21];
    long long v23 = [(IDSPushHandler *)self->_pushHandler pushToken];
    [(IDSRegistrationMessage *)v12 setPushToken:v23];

    id v24 = +[IMRGLog registration];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(IDSPushHandler *)self->_pushHandler pushToken];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Push handler returned push token: %@", buf, 0xCu);
    }
    [(IDSRegistrationMessage *)v12 setHardwareVersion:v15];
    [(IDSRegistrationMessage *)v12 setOsVersion:v17];
    [(IDSRegistrationMessage *)v12 setSoftwareVersion:v19];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10023DD78;
    v38[3] = &unk_100986B30;
    v38[4] = self;
    id v39 = @"hard deregister";
    id v26 = v11;
    id v40 = v26;
    id v41 = @"deregister";
    id v42 = v4;
    [(IDSRegistrationMessage *)v12 setCompletionBlock:v38];
    [(IDSRegistrationMessage *)v12 setTimeout:36000.0];
    sub_1001DE1A4();
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    validationQueue = self->_validationQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10023DDF8;
    v32[3] = &unk_100986AE0;
    id v33 = @"hard deregister";
    id v28 = v26;
    id v34 = v28;
    unsigned __int8 v35 = self;
    id v29 = v12;
    unsigned __int8 v36 = v29;
    unsigned __int8 v37 = @"deregister";
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10023DFE8;
    v30[3] = &unk_100985BE8;
    objc_copyWeak(&v31, (id *)buf);
    [(IDSValidationQueue *)validationQueue queueBuildingValidationDataIfNecessaryForMessage:v29 subsystem:1 withQueueCompletion:v32 sendBlock:v30];
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (id)_authMessageCompletionWithRegistration:(id)a3 withOverallSuccessBlock:(id)a4 overallFailure:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10023E14C;
  v13[3] = &unk_100986B98;
  v13[4] = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  id v10 = objc_retainBlock(v13);
  uint64_t v11 = objc_retainBlock(v10);

  return v11;
}

- (int64_t)_authSubsystemForInfo:(id)a3
{
  return 1;
}

- (id)_authDSMessageForRegistration:(id)a3 realm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 profileID];
  id v9 = [v8 _IDFromFZIDType:2];

  id v10 = [v6 authenticationToken];
  uint64_t v11 = [(IDSPushHandler *)self->_pushHandler pushToken];
  id v12 = _AuthenticationDictionaryFromParameters();

  uint64_t v13 = +[IDSRegistrationKeyManager sharedInstance];
  id v14 = [v6 mainID];
  id v15 = [v13 generateCSRForUserID:v14];

  id v16 = objc_alloc_init(IDSAuthenticateMessage);
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "      User ID: %@", buf, 0xCu);
  }

  uint64_t v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "     AuthInfo: %@", buf, 0xCu);
  }

  [(IDSAuthenticateMessage *)v16 setUserID:v9];
  [(IDSAuthenticateMessage *)v16 setRealm:v7];

  [(IDSAuthenticateMessage *)v16 setCsr:v15];
  [(IDSAuthenticateMessage *)v16 setAuthenticationInfo:v12];
  id v19 = sub_100265CA0(v6);
  [(IDSAuthenticateMessage *)v16 setDSAuthID:v19];

  IDSAssignPushIdentityToMessage();
  unint64_t v20 = +[NSDictionary dictionaryWithObject:v6 forKey:@"info"];
  [(IDSAuthenticateMessage *)v16 setUserInfo:v20];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10023E970;
  v27[3] = &unk_100986BC0;
  id v28 = v6;
  id v29 = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10023ED1C;
  v24[3] = &unk_100986BE8;
  id v25 = v28;
  id v26 = self;
  id v21 = v28;
  BOOL v22 = [(IDSRegistrationCenter *)self _authMessageCompletionWithRegistration:v21 withOverallSuccessBlock:v27 overallFailure:v24];
  [(IDSAuthenticateMessage *)v16 setCompletionBlock:v22];

  return v16;
}

- (id)_authUsersMessageForRegistration:(id)a3 realm:(id)a4
{
  id v39 = a3;
  id v41 = a4;
  CFStringRef v5 = +[IDSDaemon sharedInstance];
  id v6 = [v5 registrationConductor];
  id v7 = [v6 userStore];

  id v8 = [v7 usersWithRealm:0];
  id v9 = objc_alloc_init(IDSAuthenticateUsersMessage);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v57;
    id v42 = v9;
    BOOL v45 = v7;
    do
    {
      uint64_t v13 = 0;
      id v46 = v11;
      do
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(__CFString **)(*((void *)&v56 + 1) + 8 * (void)v13);
        id v15 = [v7 authenticationCertificateForUser:v14];
        id v16 = [(__CFString *)v14 realmPrefixedIdentifier];
        if (v15)
        {
          id v17 = +[IMRGLog registration];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v61 = v16;
            __int16 v62 = 2112;
            long long v63 = v14;
            __int16 v64 = 2112;
            __int16 v65 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "     Authing user with cert {rpi: %@, user: %@, cert: %@}", buf, 0x20u);
          }

          uint64_t v18 = [(__CFString *)v15 dataRepresentation];
          [(IDSAuthenticateUsersMessage *)v9 addRequestWithID:v16 cert:v18];
        }
        else
        {
          id v19 = [v7 credentialForUser:v14];
          uint64_t v18 = v19;
          if (v19
            && ![v19 realm]
            && ([v18 smsSignature], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            unint64_t v20 = v21;
            BOOL v22 = +[IDSCTAdapter sharedInstance];
            long long v23 = [(__CFString *)v14 uniqueIdentifier];
            id v24 = [v22 SIMForIdentifier:v23];

            char v44 = v24;
            id v25 = [v24 slot];
            id v26 = @"SIM2";
            if (!v25) {
              id v26 = @"SIM1";
            }
            id v27 = v26;
            uint64_t v28 = [v20 _FTDataFromBase64String];
            id v29 = +[IMRGLog registration];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v61 = v27;
              __int16 v62 = 2112;
              long long v63 = v16;
              __int16 v64 = 2112;
              __int16 v65 = v14;
              __int16 v66 = 2112;
              uint64_t v67 = v28;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "     Authing user with sig {tag: %@, rpi: %@, user: %@, sigData: %@}", buf, 0x2Au);
            }

            id v30 = +[IDSRegistrationKeyManager sharedInstance];
            id v31 = [(__CFString *)v14 unprefixedIdentifier];
            [v30 generateCSRForUserID:v31];
            long long v43 = v27;
            id v33 = v32 = (void *)v28;

            [(IDSAuthenticateUsersMessage *)v42 addRequestWithID:v16 sig:v32 csr:v33 tag:v43];
            id v9 = v42;
          }
          else
          {
            unint64_t v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v61 = v14;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "     User lacking cert or credential: %@", buf, 0xCu);
            }
          }

          id v7 = v45;
          id v11 = v46;
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v11);
  }

  [(IDSAuthenticateUsersMessage *)v9 setRealm:v41];
  id v34 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSAuthenticateUsersMessage *)v9 setPushToken:v34];

  IDSAssignPushIdentityToMessage();
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10023F404;
  v52[3] = &unk_100986C38;
  id v53 = v7;
  id v54 = v39;
  unsigned int v55 = self;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10023FB44;
  v48[3] = &unk_100986C60;
  id v49 = v54;
  id v50 = v53;
  unsigned int v51 = self;
  id v35 = v53;
  id v36 = v54;
  unsigned __int8 v37 = [(IDSRegistrationCenter *)self _authMessageCompletionWithRegistration:v36 withOverallSuccessBlock:v52 overallFailure:v48];
  [(IDSAuthenticateUsersMessage *)v9 setCompletionBlock:v37];

  return v9;
}

- (id)_provTemporaryPhoneMessageForRegistration:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[IDSDaemon sharedInstance];
  id v6 = [v5 registrationConductor];
  id v7 = [v6 userStore];

  id v8 = [v4 userUniqueIdentifier];
  id v9 = [v7 userWithUniqueIdentifier:v8];

  id v10 = [v7 credentialForUser:v9];
  if ([v10 realm] == (id)2)
  {
    id v11 = v10;
    uint64_t v12 = objc_alloc_init(IDSProvisionTemporaryPhoneMessage);
    IDSAssignPushIdentityToMessage();
    uint64_t v13 = [(IDSPushHandler *)self->_pushHandler pushToken];
    [(IDSProvisionTemporaryPhoneMessage *)v12 setPushToken:v13];

    id v14 = [v4 profileID];
    [(IDSProvisionTemporaryPhoneMessage *)v12 setProfileID:v14];

    id v15 = [v4 authenticationToken];
    [(IDSProvisionTemporaryPhoneMessage *)v12 setAuthToken:v15];

    id v16 = [v9 countryCode];
    [(IDSProvisionTemporaryPhoneMessage *)v12 setCountryCode:v16];

    id v17 = [v9 networkCode];
    [(IDSProvisionTemporaryPhoneMessage *)v12 setNetworkCode:v17];

    uint64_t v18 = [v11 phoneAuthenticationCertificate];
    id v19 = [v18 dataRepresentation];
    unint64_t v20 = [v4 idsUserID];
    [(IDSProvisionTemporaryPhoneMessage *)v12 addPhoneAuthenticationCertificate:v19 withUserID:v20];

    uint64_t v21 = [v4 idsUserID];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10024005C;
    v33[3] = &unk_100986C88;
    id v34 = v7;
    id v35 = v21;
    id v36 = v4;
    unsigned __int8 v37 = self;
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    id v27 = sub_1002406EC;
    uint64_t v28 = &unk_100986CB0;
    id v29 = v36;
    id v30 = v34;
    id v31 = v35;
    id v32 = self;
    id v22 = v35;
    long long v23 = [(IDSRegistrationCenter *)self _authMessageCompletionWithRegistration:v29 withOverallSuccessBlock:v33 overallFailure:&v25];
    -[IDSProvisionTemporaryPhoneMessage setCompletionBlock:](v12, "setCompletionBlock:", v23, v25, v26, v27, v28);
  }
  else
  {
    id v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10071B168((uint64_t)v4, (uint64_t)v10, v11);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_authMessageForRegistration:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 serviceType];
  id v6 = sub_100148844(v5);

  id v7 = sub_1001488E4([v4 registrationType]);
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDS authenticating registration info: %@", (uint8_t *)&v20, 0xCu);
  }

  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(IDSPushHandler *)self->_pushHandler pushToken];
    id v11 = [v10 debugDescription];
    int v20 = 138412290;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "    Push handler returned push token: %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v12 = +[IMRGLog registration];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "      Service: %@", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "        Realm: %@", (uint8_t *)&v20, 0xCu);
  }

  id v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = IMGetEnvironmentName();
    int v20 = 138412290;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  Environment: %@", (uint8_t *)&v20, 0xCu);
  }
  unsigned int v16 = [v4 registrationType];
  switch(v16)
  {
    case 0u:
      uint64_t v17 = [(IDSRegistrationCenter *)self _authUsersMessageForRegistration:v4 realm:v7];
      goto LABEL_17;
    case 2u:
      uint64_t v17 = [(IDSRegistrationCenter *)self _provTemporaryPhoneMessageForRegistration:v4];
      goto LABEL_17;
    case 1u:
      uint64_t v17 = [(IDSRegistrationCenter *)self _authDSMessageForRegistration:v4 realm:v7];
LABEL_17:
      uint64_t v18 = (void *)v17;
      goto LABEL_19;
  }
  uint64_t v18 = 0;
LABEL_19:

  return v18;
}

- (void)_sendAuthenticateRegistration:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v17 = _os_activity_create((void *)&_mh_execute_header, "Registration center send authenticate registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  if ([(NSMutableArray *)self->_currentAuthentications count])
  {
    CFStringRef v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      currentAuthentications = self->_currentAuthentications;
      *(_DWORD *)buf = 138412290;
      id v19 = currentAuthentications;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "*** We have current IDS Authentications, deferring (%@)", buf, 0xCu);
    }

    [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  }
  else
  {
    id v7 = [(IDSPushHandler *)self->_pushHandler pushToken];
    if ([v7 length])
    {
      if (v4)
      {
        id v8 = +[IMLockdownManager sharedInstance];
        unsigned int v9 = [v8 isExpired];

        if (v9)
        {
          id v10 = +[IMRGLog registration];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not sending IDS Authentication", buf, 2u);
          }
        }
        else
        {
          [(NSMutableArray *)self->_currentAuthentications addObject:v4];
          id v10 = [(IDSRegistrationCenter *)self _authMessageForRegistration:v4];
          if (v10)
          {
            id v14 = +[IDSPACStateTracker sharedInstance];
            [v14 noteAuthenticationStarted];

            [(IDSRegistrationCenter *)self _sendIDSAuthRequest:v10 forInfo:v4];
          }
          else
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v19 = v4;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not sending nil IDS Authentication request: %@", buf, 0xCu);
            }

            [(NSMutableArray *)self->_currentAuthentications removeObject:v4];
            [(NSMutableArray *)self->_queuedAuthentications removeObject:v4];
          }
        }
      }
    }
    else
    {
      id v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(IDSPushHandler *)self->_pushHandler pushToken];
        uint64_t v13 = self->_currentAuthentications;
        *(_DWORD *)buf = 138412546;
        id v19 = v12;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Push handler returned push token: %@, deferring (%@)", buf, 0x16u);
      }
      [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
    }
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_sendIDSAuthRequest:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setTimeout:36000.0];
  sub_1001484DC(0, @"Registration", @"Sending IDS Authentication request", 0);
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = +[FTDeviceSupport sharedInstance];
    id v10 = [v9 deviceInformationString];
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    unsigned int v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending IDS Authentication request: %@   (Environment: %@)", (uint8_t *)&v13, 0x16u);
  }
  if (![v7 registrationType])
  {
    ct_green_tea_logger_create_static();
    id v11 = getCTGreenTeaOsLogHandle();
    uint64_t v12 = v11;
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Transmitting phone number", (uint8_t *)&v13, 2u);
    }
  }
  [(IDSRegistrationCenter *)self __sendMessage:v6];
  [(IDSRegistrationCenter *)self cancelRegisterActionsForRegistrationInfo:v7];
}

- (void)reportSpamMessage:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(IDSReportGeneralSpamMessage);
  uint64_t v12 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSReportGeneralSpamMessage *)v11 setPushToken:v12];

  int v13 = [v8 registrationCert];

  [(IDSReportGeneralSpamMessage *)v11 setIDCertificate:v13];
  id v14 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSReportGeneralSpamMessage setIdentityPrivateKey:](v11, "setIdentityPrivateKey:", [v14 identityPrivateKey]);

  [(IDSReportGeneralSpamMessage *)v11 setSpamMessage:v10];
  [(IDSReportGeneralSpamMessage *)v11 setSelfURI:v9];

  __int16 v15 = +[IMRGLog spamReporting];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending report spam message", v16, 2u);
  }

  [(IDSReportGeneralSpamMessage *)v11 setCompletionBlock:&stru_100986CF0];
  [(IDSRegistrationCenter *)self __sendMessage:v11];
}

- (void)reportUnknownSenderMessage:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSServerBag sharedInstance];
  uint64_t v12 = [v11 objectForKey:@"ft-should-report-unknown-sender"];

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      id v14 = +[IMRGLog spamReporting];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Server has disabled unknown sender reporting.", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v14 = objc_alloc_init(IDSReportGeneralUnknownSenderMessage);
  __int16 v15 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [v14 setPushToken:v15];

  unsigned int v16 = [v10 registrationCert];
  [v14 setIDCertificate:v16];

  uint64_t v17 = +[IDSRegistrationKeyManager sharedInstance];
  -[NSObject setIdentityPrivateKey:](v14, "setIdentityPrivateKey:", [v17 identityPrivateKey]);

  [v14 setUnknownSenderInfo:v8];
  [v14 setSelfURI:v9];
  uint64_t v18 = +[IMRGLog spamReporting];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending report unknown sender", v19, 2u);
  }

  [v14 setCompletionBlock:&stru_100986D10];
  [(IDSRegistrationCenter *)self __sendMessage:v14];
LABEL_10:
}

- (void)reportSpamWithMessages:(id)a3 selfURI:(id)a4 registration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(IDSReportSpamMessage);
  uint64_t v12 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSReportSpamMessage *)v11 setPushToken:v12];

  unsigned __int8 v13 = [v8 registrationCert];

  [(IDSReportSpamMessage *)v11 setIDCertificate:v13];
  id v14 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSReportSpamMessage setIdentityPrivateKey:](v11, "setIdentityPrivateKey:", [v14 identityPrivateKey]);

  [(IDSReportSpamMessage *)v11 setSpamMessages:v10];
  [(IDSReportSpamMessage *)v11 setSelfURI:v9];

  __int16 v15 = +[IMRGLog iMessageSpam];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending report spam message", v16, 2u);
  }

  [(IDSReportSpamMessage *)v11 setCompletionBlock:&stru_100986D30];
  [(IDSRegistrationCenter *)self __sendMessage:v11];
}

- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(IDSReportClientEventMessage);
  uint64_t v12 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSReportClientEventMessage *)v11 setPushToken:v12];

  unsigned __int8 v13 = [v10 registrationCert];

  [(IDSReportClientEventMessage *)v11 setIDCertificate:v13];
  id v14 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSReportClientEventMessage setIdentityPrivateKey:](v11, "setIdentityPrivateKey:", [v14 identityPrivateKey]);

  __int16 v15 = [v8 report];
  [(IDSReportClientEventMessage *)v11 setReport:v15];

  unsigned int v16 = [v8 reportType];
  [(IDSReportClientEventMessage *)v11 setReportType:v16];

  uint64_t v17 = [v8 timeout];

  if (v17)
  {
    uint64_t v18 = [v8 timeout];
    [v18 doubleValue];
    [(IDSReportClientEventMessage *)v11 setTimeout:"setTimeout:"];
  }
  id v19 = +[FTDeviceSupport sharedInstance];
  __int16 v20 = [v19 model];

  id v21 = +[FTDeviceSupport sharedInstance];
  id v22 = [v21 productOSVersion];

  [(IDSReportClientEventMessage *)v11 setOsVersion:v22];
  [(IDSReportClientEventMessage *)v11 setHardwareVersion:v20];
  IDSAssignPushIdentityToMessage();
  long long v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending report client event message", buf, 2u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100241B60;
  v25[3] = &unk_100986D58;
  id v26 = v9;
  id v24 = v9;
  [(IDSReportClientEventMessage *)v11 setCompletionBlock:v25];
  [(IDSRegistrationCenter *)self __sendMessage:v11];
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 selfURI:(id)a8 registration:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(IDSReportUnknownSenderMessage);
  id v22 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSReportUnknownSenderMessage *)v21 setPushToken:v22];

  long long v23 = [v16 registrationCert];

  [(IDSReportUnknownSenderMessage *)v21 setIDCertificate:v23];
  id v24 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSReportUnknownSenderMessage setIdentityPrivateKey:](v21, "setIdentityPrivateKey:", [v24 identityPrivateKey]);

  [(IDSReportUnknownSenderMessage *)v21 setSelfURI:v17];
  [(IDSReportUnknownSenderMessage *)v21 setUnknownSenderURI:v20];

  [(IDSReportUnknownSenderMessage *)v21 setMessageID:v19];
  [(IDSReportUnknownSenderMessage *)v21 setIsBlackholed:v12];
  [(IDSReportUnknownSenderMessage *)v21 setIsJunked:v11];
  id v25 = [v18 intValue];

  [(IDSReportUnknownSenderMessage *)v21 setMessageServerTimestamp:v25];
  id v26 = +[IMRGLog iMessageSpam];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending report iMessage unknown sender message", v27, 2u);
  }

  [(IDSReportUnknownSenderMessage *)v21 setCompletionBlock:&stru_100986D78];
  [(IDSRegistrationCenter *)self __sendMessage:v21];
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 registration:(id)a6 withCompletion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_alloc_init(IDSReportApprovedTempUser);
  id v17 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSReportApprovedTempUser *)v16 setPushToken:v17];

  IDSAssignPushIdentityToMessage();
  id v18 = [v13 registrationCert];

  [(IDSReportApprovedTempUser *)v16 setIDCertificate:v18];
  id v19 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSReportApprovedTempUser setIdentityPrivateKey:](v16, "setIdentityPrivateKey:", [v19 identityPrivateKey]);

  id v20 = [v14 prefixedURI];

  [(IDSReportApprovedTempUser *)v16 setSelfURI:v20];
  id v21 = [v15 prefixedURI];

  [(IDSReportApprovedTempUser *)v16 setTempUserID:v21];
  [(IDSReportApprovedTempUser *)v16 setReportAction:a3];
  id v22 = +[IMRGLog registration];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending report approved temp handle message", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100242250;
  v24[3] = &unk_100986D58;
  id v25 = v12;
  id v23 = v12;
  [(IDSReportApprovedTempUser *)v16 setCompletionBlock:v24];
  [(IDSRegistrationCenter *)self __sendMessage:v16];
}

- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = objc_alloc_init(IDSCheckUnknownSenderMessage);
  id v12 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSCheckUnknownSenderMessage *)v11 setPushToken:v12];

  id v13 = +[FTDeviceSupport sharedInstance];
  id v14 = [v13 model];
  [(IDSCheckUnknownSenderMessage *)v11 setHardwareVersion:v14];

  id v15 = +[FTDeviceSupport sharedInstance];
  id v16 = [v15 productOSVersion];
  [(IDSCheckUnknownSenderMessage *)v11 setOSVersion:v16];

  id v17 = +[FTDeviceSupport sharedInstance];
  id v18 = [v17 productBuildVersion];
  [(IDSCheckUnknownSenderMessage *)v11 setSoftwareVersion:v18];

  [(IDSCheckUnknownSenderMessage *)v11 setSender:v10];
  id v19 = [(IDSRegistrationCenter *)self _geoRegion];
  [(IDSCheckUnknownSenderMessage *)v11 setGeo:v19];

  [(IDSCheckUnknownSenderMessage *)v11 setAttemptCount:v9];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100242554;
  v21[3] = &unk_100986D58;
  id v22 = v8;
  id v20 = v8;
  [(IDSCheckUnknownSenderMessage *)v11 setCompletionBlock:v21];
  [(IDSRegistrationCenter *)self __sendMessage:v11];
}

- (id)_geoRegion
{
  unint64_t v2 = +[APSConnection geoRegion];
  if ([v2 length]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = @"UNKNOWN";
  }

  return v3;
}

- (BOOL)isRegistering:(id)a3
{
  id v4 = a3;
  if ([(IDSRegistrationCenter *)self _hasRegistration:v4 inQueue:self->_queuedRegistrations])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(IDSRegistrationCenter *)self _hasRegistration:v4 inQueue:self->_queuedAuthentications];
  }

  return v5;
}

- (void)_processGetHandlesMessage:(id)a3 registrations:(id)a4 deliveredWithError:(id)a5 resultCode:(int64_t)a6 resultDictionary:(id)a7 allowPasswordPrompt:(BOOL)a8
{
  BOOL v52 = a8;
  id v12 = a3;
  id v58 = a4;
  id v54 = a5;
  id v13 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v70 = _os_activity_create((void *)&_mh_execute_header, "Registration center process handles message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v70, &state);
  long long v56 = v12;
  id v14 = [v12 responseHandles];
  id v57 = objc_alloc_init((Class)NSMutableArray);
  id v53 = objc_alloc_init((Class)NSMutableArray);
  id v50 = v13;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v66;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v19 = [v18 objectForKey:@"status"];
        BOOL v20 = [v19 intValue] == 5051;

        if (v20)
        {
          id v21 = [v18 objectForKey:@"uri"];
          id v22 = [v21 _stripFZIDPrefix];

          id v23 = [v18 objectForKey:@"device-name"];
          id v24 = [v18 objectForKey:@"is-user-visible"];
          id v25 = [v18 objectForKey:@"pseudonyms"];
          id v26 = v25;
          if (v25)
          {
            id v27 = v25;
          }
          else
          {
            id v27 = [v18 objectForKey:@"aliases"];
          }
          uint64_t v28 = v27;

          id v29 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v30 = v22;
          if (v30) {
            CFDictionarySetValue(v29, @"uri", v30);
          }

          id v31 = v23;
          if (v31) {
            CFDictionarySetValue(v29, @"device-name", v31);
          }

          id v32 = v24;
          if (v32) {
            CFDictionarySetValue(v29, @"is-user-visible", v32);
          }

          id v33 = v28;
          if (v33) {
            CFDictionarySetValue(v29, @"pseudonyms", v33);
          }

          [v57 addObject:v29];
          if (v30) {
            [v53 addObject:v30];
          }
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
    }
    while (v15);
  }

  id v34 = [v56 selfHandle];
  unsigned int v51 = [v34 objectForKey:@"uri"];
  id v35 = +[IMRGLog registration];
  id v49 = v34;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v73 = a6;
    *(_WORD *)&v73[4] = 2112;
    *(void *)&v73[6] = v53;
    __int16 v74 = 2112;
    unint64_t v75 = v51;
    __int16 v76 = 2112;
    id v77 = obj;
    __int16 v78 = 2112;
    id v79 = v54;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "  Received handles query response with result: %d   handles: %@   selfHandle: %@   (actual: %@)   (error: %@)", buf, 0x30u);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v55 = v58;
  id v36 = [v55 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v62;
    do
    {
      long long v38 = 0;
      do
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v55);
        }
        id v39 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v38);
        id v40 = +[IMRGLog registration];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v73 = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "  Updating %@ with getHandles info", buf, 0xCu);
        }

        unsigned int v41 = [v39 registrationType];
        if (a6 == 6006)
        {
          sub_1001484DC(0, @"Registration", @"Need to re-register", 1073);
          BOOL v45 = +[IMRGLog registration];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v73 = v39;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Requesting re-registration for registration: %@", buf, 0xCu);
          }

          [(IDSRegistrationCenter *)self sendRegistration:v39];
        }
        else
        {
          unsigned int v42 = v41;
          if (a6 == 6005)
          {
            if (v41 == 1)
            {
              sub_1001484DC(0, @"Registration", @"Need to re-authenticate", 1073);
              [v39 setAuthenticationToken:0];
              if (v52)
              {
                long long v43 = +[IMRGLog registration];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v73 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Requesting new authentication for registration: %@", buf, 0xCu);
                }

                char v44 = +[IDSAppleIDRegistrationCenter sharedInstance];
                [v44 authenticateRegistration:v39 forceNewToken:1];
              }
              else
              {
                sub_1001484DC(0, @"Registration", @"Email query failed", 1073);
                char v44 = [v56 responseAlertInfo];
                [(IDSRegistrationCenter *)self _notifyEmailQueryFailure:v39 responseCode:6005 registrationError:37 error:v54 info:v44];
              }
            }
            else
            {
LABEL_44:
              sub_1001484DC(0, @"Registration", @"Email query failed", 1073);
              char v44 = [v56 responseAlertInfo];
              [(IDSRegistrationCenter *)self _notifyEmailQueryFailure:v39 responseCode:a6 registrationError:46 error:v54 info:v44];
            }

            goto LABEL_49;
          }
          if (a6) {
            goto LABEL_44;
          }
          if ([obj count])
          {
            if (v42 == 1)
            {
              [v39 setVettedEmails:v53];
              [v39 setDSHandle:v51];
            }
            [(IDSRegistrationCenter *)self _notifyEmailQuerySuccess:v39 emailInfo:v57];
          }
          else
          {
            id v46 = [v56 responseAlertInfo];
            [(IDSRegistrationCenter *)self _notifyEmailQueryFailure:v39 responseCode:1 registrationError:32 error:v54 info:v46];

            uint64_t v47 = +[IMRGLog registration];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v73 = v39;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Failing registration, empty get handles response { queuedRegistration : %@ }", buf, 0xCu);
            }

            [(NSMutableArray *)self->_queuedRegistrations removeObject:v39];
            [(NSMutableArray *)self->_currentRegistrations removeObject:v39];
            if (v42 == 1) {
              [(IDSRegistrationCenter *)self _notifyRegistrationFailure:v39 responseCode:1 registrationError:32 error:0 info:0];
            }
          }
        }
LABEL_49:
        long long v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      id v48 = [v55 countByEnumeratingWithState:&v61 objects:v71 count:16];
      id v36 = v48;
    }
    while (v48);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (BOOL)_queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v49 = _os_activity_create((void *)&_mh_execute_header, "Registration center query handles", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v49, &state);
  id v9 = [v7 guid];
  uint64_t v10 = [v7 idsUserID];
  BOOL v11 = (void *)v10;
  if (v7) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12 || v10 == 0;
  char v14 = v13;
  char v44 = v14;
  if (v13)
  {
    id v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "  => Ignoring query, we have no registration, %@", buf, 0xCu);
    }

    if (v8) {
      (*((void (**)(id, id, uint64_t, void, void))v8 + 2))(v8, v7, 1, 0, 0);
    }
  }
  else
  {
    id v43 = [v8 copy];

    currentGetHandlesRegistrations = self->_currentGetHandlesRegistrations;
    if (!currentGetHandlesRegistrations)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v18 = self->_currentGetHandlesRegistrations;
      self->_currentGetHandlesRegistrations = Mutable;

      currentGetHandlesRegistrations = self->_currentGetHandlesRegistrations;
    }
    id v19 = [(NSMutableDictionary *)currentGetHandlesRegistrations objectForKey:v11];
    id v20 = [v19 count];
    if (![v19 count])
    {
      id v21 = objc_alloc_init((Class)NSMutableSet);

      [(NSMutableDictionary *)self->_currentGetHandlesRegistrations setObject:v21 forKey:v11];
      id v19 = v21;
    }
    [v19 addObject:v7];

    id v22 = +[IMRGLog registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v51 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Added registration %p to getHandles", buf, 0xCu);
    }

    if (v43)
    {
      currentGetHandlesBlocks = self->_currentGetHandlesBlocks;
      if (!currentGetHandlesBlocks)
      {
        id v24 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v25 = self->_currentGetHandlesBlocks;
        self->_currentGetHandlesBlocks = v24;

        currentGetHandlesBlocks = self->_currentGetHandlesBlocks;
      }
      id v26 = [(NSMutableDictionary *)currentGetHandlesBlocks objectForKey:v9];
      if (![v26 count])
      {
        id v27 = objc_alloc_init((Class)NSMutableArray);

        [(NSMutableDictionary *)self->_currentGetHandlesBlocks setObject:v27 forKey:v9];
        id v26 = v27;
      }
      id v28 = objc_retainBlock(v43);
      [v26 addObject:v28];

      id v29 = +[IMRGLog registration];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = objc_retainBlock(v43);
        *(_DWORD *)buf = 134217984;
        id v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Adding completion block %p to getHandles queue", buf, 0xCu);
      }
    }
    if (!v20)
    {
      id v31 = objc_alloc_init(IDSProfileGetHandlesMessage);
      IDSAssignPushIdentityToMessage();
      id v32 = [v7 pushToken];
      [(IDSProfileGetHandlesMessage *)v31 setPushToken:v32];

      id v33 = [v7 idsUserID];
      id v34 = [v7 authenticationCert];
      id v35 = +[IDSRegistrationKeyManager sharedInstance];
      id v36 = [v35 identityPrivateKey];
      uint64_t v37 = +[IDSRegistrationKeyManager sharedInstance];
      -[IDSProfileGetHandlesMessage addAuthUserID:certificate:privateKey:publicKey:](v31, "addAuthUserID:certificate:privateKey:publicKey:", v33, v34, v36, [v37 identityPublicKey]);

      long long v38 = sub_100265CA0(v7);
      [(IDSProfileGetHandlesMessage *)v31 setDSAuthID:v38];

      id v39 = +[NSDictionary dictionaryWithObject:v7 forKey:@"info"];
      [(IDSProfileGetHandlesMessage *)v31 setUserInfo:v39];

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100243540;
      v45[3] = &unk_100986DA0;
      v45[4] = self;
      id v46 = v11;
      BOOL v47 = a4;
      [(IDSProfileGetHandlesMessage *)v31 setCompletionBlock:v45];
      id v40 = +[IMRGLog registration];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v7;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sending email query for: %@", buf, 0xCu);
      }

      [(IDSRegistrationCenter *)self __sendMessage:v31];
    }
    id v8 = v43;
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v44 ^ 1;
}

- (void)retrieveFeatureToggleStateForFeatureID:(id)a3 registration:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[IDSFoundationLog FeatureToggler];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrieving feature toggle state { featureID: %@, registration: %@", buf, 0x16u);
  }

  BOOL v12 = objc_alloc_init(IDSGetFeatureToggleStateMessage);
  BOOL v13 = [v9 registrationCert];
  [(IDSGetFeatureToggleStateMessage *)v12 setIDCertificate:v13];

  char v14 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSGetFeatureToggleStateMessage setIdentityPrivateKey:](v12, "setIdentityPrivateKey:", [v14 identityPrivateKey]);

  id v15 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSGetFeatureToggleStateMessage *)v12 setPushToken:v15];

  IDSAssignPushIdentityToMessage();
  [(IDSGetFeatureToggleStateMessage *)v12 setFeatureID:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100243A74;
  v18[3] = &unk_100984D48;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  [(IDSGetFeatureToggleStateMessage *)v12 setCompletionBlock:v18];
  [(IDSRegistrationCenter *)self __sendMessage:v12];
}

- (void)updateFeatureToggleState:(unint64_t)a3 forFeatureID:(id)a4 registration:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = +[IDSFoundationLog FeatureToggler];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating feature toggle state { state: %lu, featureID: %@, registration: %@", buf, 0x20u);
  }

  char v14 = objc_alloc_init(IDSFeatureToggleMessage);
  id v15 = [v11 registrationCert];
  [(IDSFeatureToggleMessage *)v14 setIDCertificate:v15];

  id v16 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSFeatureToggleMessage setIdentityPrivateKey:](v14, "setIdentityPrivateKey:", [v16 identityPrivateKey]);

  id v17 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSFeatureToggleMessage *)v14 setPushToken:v17];

  IDSAssignPushIdentityToMessage();
  [(IDSFeatureToggleMessage *)v14 setFeatureID:v10];
  [(IDSFeatureToggleMessage *)v14 setState:a3];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100243DD0;
  v20[3] = &unk_100984D48;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v18 = v12;
  id v19 = v11;
  [(IDSFeatureToggleMessage *)v14 setCompletionBlock:v20];
  [(IDSRegistrationCenter *)self __sendMessage:v14];
}

- (BOOL)provisionPseudonymFor:(id)a3 withURI:(id)a4 properties:(id)a5 requestProperties:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)id v33 = v13;
    *(_WORD *)&v33[8] = 2112;
    *(void *)id v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Provisioning pseudonym {URI: %@, registration: %@}", buf, 0x16u);
  }

  uint64_t v18 = objc_opt_class();
  __int16 v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  id v29 = sub_1002441BC;
  id v30 = &unk_100986DC8;
  id v19 = v14;
  id v31 = v19;
  uint64_t v20 = [(IDSRegistrationCenter *)self _countOfMessagesQueuedOfType:v18 matchingCriteria:&v27];
  if (v20 < 3)
  {
    BOOL v25 = -[IDSRegistrationCenter _sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:](self, "_sendPseudonymMessageOperation:forURI:pseudonymURI:properties:requestProperties:forRegistration:completionBlock:", 0, v13, 0, v19, v15, v12, v16, v27, v28, v29, v30);
  }
  else
  {
    int v21 = v20;
    id v22 = +[IMRGLog registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = [v19 featureID];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v33 = v21;
      *(_WORD *)&void v33[4] = 1024;
      *(_DWORD *)&v33[6] = 3;
      *(_WORD *)id v34 = 2112;
      *(void *)&v34[2] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Too many provisions inflight for this feature -- failing {similiarCount: %d, maxAllowedInFlight: %d, featureID: %@}", buf, 0x18u);
    }
    [(IDSRegistrationCenter *)self __dumpState];
    unint64_t v24 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:900 userInfo:0];
    BOOL v25 = 1;
    (*((void (**)(id, id, uint64_t, void, void, void *))v16 + 2))(v16, v12, 1, 0, 0, v24);
  }
  return v25;
}

- (BOOL)renewPseudonym:(id)a3 forRegistration:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Renewing pseudonym {pseudonym: %@, registration: %@}", buf, 0x16u);
  }

  id v17 = [v12 maskedURI];
  uint64_t v18 = [v12 URI];
  id v19 = [v12 properties];
  uint64_t v20 = [v19 withUpdatedExpiryEpoch:a5];
  BOOL v21 = [(IDSRegistrationCenter *)self _sendPseudonymMessageOperation:1 forURI:v17 pseudonymURI:v18 properties:v20 requestProperties:v15 forRegistration:v13 completionBlock:v14];

  return v21;
}

- (BOOL)revokePseudonym:(id)a3 forRegistration:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Revoking pseudonym {pseudonym: %@, registration: %@}", buf, 0x16u);
  }

  id v15 = [v10 maskedURI];
  id v16 = [v10 URI];
  id v17 = [v10 properties];
  BOOL v18 = [(IDSRegistrationCenter *)self _sendPseudonymMessageOperation:2 forURI:v15 pseudonymURI:v16 properties:v17 requestProperties:v13 forRegistration:v11 completionBlock:v12];

  return v18;
}

- (double)_updatePseudonymExpiryEpoch:(double)a3
{
  id v4 = +[IDSServerBag sharedInstance];
  BOOL v5 = [v4 objectForKey:@"use-local-time"];

  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v5 BOOLValue] & 1) == 0)
  {
    id v6 = +[IDSCurrentServerTime sharedInstance];
    [v6 currentServerTimeInterval];
    double v8 = v7;

    id v9 = +[NSDate date];
    [v9 timeIntervalSince1970];
    double v11 = v10;

    double v12 = v8 - v11;
    if (v8 - v11 < 0.0) {
      double v12 = -(v8 - v11);
    }
    if (v12 > 60.0)
    {
      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134218240;
        double v17 = v11;
        __int16 v18 = 2048;
        double v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Local time on device and server time are out of sync. Using server time for pseudonym expiry. Local Time: %f, Server Time: %f", (uint8_t *)&v16, 0x16u);
      }

      double v14 = v11 - a3;
      if (v11 - a3 < 0.0) {
        double v14 = -(v11 - a3);
      }
      a3 = v8 + v14;
    }
  }

  return a3;
}

- (BOOL)_sendPseudonymMessageOperation:(unint64_t)a3 forURI:(id)a4 pseudonymURI:(id)a5 properties:(id)a6 requestProperties:(id)a7 forRegistration:(id)a8 completionBlock:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v69 = a9;
  double v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    unint64_t v81 = a3;
    __int16 v82 = 2112;
    id v83 = v14;
    __int16 v84 = 2112;
    id v85 = v16;
    __int16 v86 = 2112;
    id v87 = v18;
    __int16 v88 = 2112;
    id v89 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Performing pseudonym operation {op: %lu, URI: %@, pseudonymProperties: %@, requestProperties: %@, registration: %@}", buf, 0x34u);
  }

  uint64_t v20 = [v18 authenticationCert];

  if (v20)
  {
    uint64_t v21 = [v18 guid];
    uint64_t v22 = [v18 idsUserID];
    long long v66 = (void *)v22;
    long long v67 = (void *)v21;
    if (v18) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    BOOL v24 = v23 || v22 == 0;
    char v25 = v24;
    char v65 = v25;
    if (v24)
    {
      id v26 = +[IMRGLog registration];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v81 = (unint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Ignoring provision, we have no registration, %@", buf, 0xCu);
      }

      __int16 v27 = v69;
      if (v69) {
        (*((void (**)(id, id, uint64_t, void, void, void))v69 + 2))(v69, v18, 1, 0, 0, 0);
      }
    }
    else
    {
      id v30 = objc_alloc_init(IDSProvisionPseudonymMessage);
      id v60 = v18;
      id v31 = [v18 registrationCert];
      [(IDSProvisionPseudonymMessage *)v30 setIDCertificate:v31];

      id v32 = +[IDSRegistrationKeyManager sharedInstance];
      -[IDSProvisionPseudonymMessage setIdentityPrivateKey:](v30, "setIdentityPrivateKey:", [v32 identityPrivateKey]);

      id v58 = [(IDSPushHandler *)self->_pushHandler pushToken];
      -[IDSProvisionPseudonymMessage setPushToken:](v30, "setPushToken:");
      id v61 = v17;
      [v17 requestTimeoutInterval];
      [(IDSProvisionPseudonymMessage *)v30 setTimeout:"setTimeout:"];
      IDSAssignPushIdentityToMessage();
      [(IDSProvisionPseudonymMessage *)v30 setOperation:a3];
      id v64 = v14;
      id v33 = [v14 prefixedURI];
      [(IDSProvisionPseudonymMessage *)v30 setSelfURI:v33];

      id v34 = [v16 featureID];
      [(IDSProvisionPseudonymMessage *)v30 setFeatureID:v34];

      id v35 = [v16 scopeID];
      [(IDSProvisionPseudonymMessage *)v30 setScopeID:v35];

      id v63 = v15;
      id v36 = [v15 prefixedURI];
      [(IDSProvisionPseudonymMessage *)v30 setPseudonymAlias:v36];

      [v16 expiryEpoch];
      -[IDSRegistrationCenter _updatePseudonymExpiryEpoch:](self, "_updatePseudonymExpiryEpoch:");
      long long v59 = v30;
      -[IDSProvisionPseudonymMessage setExpiryEpoch:](v30, "setExpiryEpoch:");
      id v37 = objc_alloc_init((Class)NSMutableDictionary);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v62 = v16;
      id obj = [v16 allowedServices];
      id v38 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v71 = *(void *)v76;
        id v40 = IDSValidationQueue;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v76 != v71) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            id v43 = [&v40[80] sharedInstance];
            char v44 = [v43 serviceWithIdentifier:v42];

            if ([v44 adHocServiceType])
            {
              BOOL v45 = v40;
              id v46 = [&v40[80] sharedInstance];
              BOOL v47 = objc_msgSend(v46, "primaryServiceForAdhocServiceType:", objc_msgSend(v44, "adHocServiceType"));

              id v48 = [v47 identifier];
              id v49 = [v37 objectForKeyedSubscript:v48];
              id v50 = v49;
              if (v49)
              {
                id v51 = v49;
              }
              else
              {
                id v51 = +[NSMutableArray array];
              }
              id v55 = v51;

              if (([v55 containsObject:v42] & 1) == 0) {
                [v55 addObject:v42];
              }
              long long v56 = [v47 identifier];
              [v37 setObject:v55 forKey:v56];

              id v40 = v45;
            }
            else
            {
              BOOL v52 = [v37 objectForKeyedSubscript:v42];
              id v53 = v52;
              if (v52)
              {
                id v54 = v52;
              }
              else
              {
                id v54 = +[NSMutableArray array];
              }
              BOOL v47 = v54;

              [v37 setObject:v47 forKey:v42];
            }
          }
          id v39 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
        }
        while (v39);
      }

      [(IDSProvisionPseudonymMessage *)v59 setSubservicesByPrimaryService:v37];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_100244DAC;
      v72[3] = &unk_100984D48;
      v72[4] = self;
      id v18 = v60;
      id v73 = v60;
      id v74 = v69;
      [(IDSProvisionPseudonymMessage *)v59 setCompletionBlock:v72];
      [(IDSRegistrationCenter *)self __sendMessage:v59];

      __int16 v27 = v69;
      id v15 = v63;
      id v14 = v64;
      id v17 = v61;
      id v16 = v62;
    }
    char v29 = v65 ^ 1;
  }
  else
  {
    uint64_t v28 = +[IMRGLog registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "  => Ignoring provision, we have no auth cert", buf, 2u);
    }

    __int16 v27 = v69;
    if (v69) {
      (*((void (**)(id, id, uint64_t, void, void, void))v69 + 2))(v69, v18, 1, 0, 0, 0);
    }
    char v29 = 0;
  }

  return v29;
}

- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    int v14 = 138412546;
    CFStringRef v15 = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating KT Opt-in status for registration {isOptedIn: %@, registration: %@}", (uint8_t *)&v14, 0x16u);
  }

  BOOL v12 = [(IDSRegistrationCenter *)self _sendKTOptInStatusUpdateForRegistration:v8 withOptInStatus:v6 withCompletion:v9];
  return v12;
}

- (BOOL)updateKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating KT Opt-in status for registration {OptInOutRequest: %@, registration: %@}", (uint8_t *)&v14, 0x16u);
  }

  BOOL v12 = [(IDSRegistrationCenter *)self _sendKTOptInStatusForRegistration:v8 withOptInOutRequest:v9 withCompletion:v10];
  return v12;
}

- (BOOL)_sendKTOptInStatusForRegistration:(id)a3 withOptInOutRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v62 = v9;
    __int16 v63 = 2112;
    id v64 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing Key Transparency opt-in status update {optInOutRequest: %@, registration: %@}", buf, 0x16u);
  }

  BOOL v12 = [v8 authenticationCert];

  if (v12)
  {
    id v13 = [v8 guid];
    uint64_t v14 = [v8 idsUserID];
    id v15 = (void *)v14;
    if (v8) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || v14 == 0;
    char v18 = v17;
    if (v17)
    {
      double v19 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v62 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " => Ignoring KT Opt In status update, we have no registration, %@", buf, 0xCu);
      }

      if (v10) {
        (*((void (**)(id, id, uint64_t, void, void, void))v10 + 2))(v10, v8, 1, 0, 0, 0);
      }
    }
    else
    {
      char v47 = v18;
      id v49 = (void *)v14;
      id v50 = v13;
      uint64_t v22 = objc_alloc_init(IDSKTOptInStatusMessage);
      id v51 = v8;
      BOOL v23 = [v8 registrationCert];
      [(IDSKTOptInStatusMessage *)v22 setIDCertificate:v23];

      BOOL v24 = +[IDSRegistrationKeyManager sharedInstance];
      -[IDSKTOptInStatusMessage setIdentityPrivateKey:](v22, "setIdentityPrivateKey:", [v24 identityPrivateKey]);

      id v48 = self;
      BOOL v45 = [(IDSPushHandler *)self->_pushHandler pushToken];
      -[IDSKTOptInStatusMessage setPushToken:](v22, "setPushToken:");
      IDSAssignPushIdentityToMessage();
      char v25 = +[FTDeviceSupport sharedInstance];
      uint64_t v26 = [v25 model];

      __int16 v27 = +[FTDeviceSupport sharedInstance];
      uint64_t v28 = [v27 productOSVersion];

      char v44 = (void *)v26;
      [(IDSKTOptInStatusMessage *)v22 setHardwareVersion:v26];
      id v46 = v22;
      id v43 = (void *)v28;
      [(IDSKTOptInStatusMessage *)v22 setOsVersion:v28];
      id v29 = objc_alloc_init((Class)NSMutableArray);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v30 = [v9 applicationsToOptInStatusData];
      id v31 = [v30 allValues];

      id obj = v31;
      id v32 = [v31 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v57;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v57 != v34) {
              objc_enumerationMutation(obj);
            }
            id v36 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            id v37 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v38 = [v36 serviceIdentifier];
            if (v38) {
              CFDictionarySetValue(v37, @"service", v38);
            }

            id v39 = [v36 optInStatus];
            id v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v39 BOOLValue]);

            if (v40) {
              CFDictionarySetValue(v37, @"kt-opt-in", v40);
            }

            unsigned int v41 = [v36 publicAccountKey];
            if (v41) {
              CFDictionarySetValue(v37, @"kt-account-key", v41);
            }

            [v29 addObject:v37];
          }
          id v33 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v33);
      }

      [(IDSKTOptInStatusMessage *)v46 setServices:v29];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1002456B8;
      v53[3] = &unk_100984D48;
      v53[4] = v48;
      id v8 = v51;
      id v54 = v51;
      id v55 = v10;
      [(IDSKTOptInStatusMessage *)v46 setCompletionBlock:v53];
      [(IDSRegistrationCenter *)v48 __sendMessage:v46];

      id v15 = v49;
      id v13 = v50;
      char v18 = v47;
    }
    char v21 = v18 ^ 1;
  }
  else
  {
    uint64_t v20 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Ignoring KT Opt In status update, we have no auth cert", buf, 2u);
    }

    if (v10) {
      (*((void (**)(id, id, uint64_t, void, void, void))v10 + 2))(v10, v8, 1, 0, 0, 0);
    }
    char v21 = 0;
  }

  return v21;
}

- (BOOL)_sendKTOptInStatusUpdateForRegistration:(id)a3 withOptInStatus:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v37 = v11;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing Key Transparency opt-in status update {optInStatus: %@, registration: %@}", buf, 0x16u);
  }

  BOOL v12 = [(__CFString *)v8 authenticationCert];

  if (v12)
  {
    id v13 = [(__CFString *)v8 guid];
    uint64_t v14 = [(__CFString *)v8 idsUserID];
    id v15 = (void *)v14;
    if (v8) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || v14 == 0;
    char v18 = v17;
    if (v17)
    {
      double v19 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "  => Ignoring KT Opt In status update, we have no registration, %@", buf, 0xCu);
      }

      if (v9) {
        (*((void (**)(id, __CFString *, uint64_t, void, void, void))v9 + 2))(v9, v8, 1, 0, 0, 0);
      }
    }
    else
    {
      uint64_t v22 = objc_alloc_init(IDSKTOptInStatusMessage);
      [(__CFString *)v8 registrationCert];
      BOOL v23 = v32 = v18;
      [(IDSKTOptInStatusMessage *)v22 setIDCertificate:v23];

      BOOL v24 = +[IDSRegistrationKeyManager sharedInstance];
      -[IDSKTOptInStatusMessage setIdentityPrivateKey:](v22, "setIdentityPrivateKey:", [v24 identityPrivateKey]);

      id v31 = [(IDSPushHandler *)self->_pushHandler pushToken];
      [(IDSKTOptInStatusMessage *)v22 setPushToken:v31];
      IDSAssignPushIdentityToMessage();
      char v25 = +[FTDeviceSupport sharedInstance];
      uint64_t v26 = [v25 model];

      __int16 v27 = +[FTDeviceSupport sharedInstance];
      uint64_t v28 = [v27 productOSVersion];

      char v18 = v32;
      id v29 = +[NSNumber numberWithBool:v6];
      [(IDSKTOptInStatusMessage *)v22 setIsOptIn:v29];

      [(IDSKTOptInStatusMessage *)v22 setHardwareVersion:v26];
      [(IDSKTOptInStatusMessage *)v22 setOsVersion:v28];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100245DEC;
      v33[3] = &unk_100984D48;
      void v33[4] = self;
      uint64_t v34 = v8;
      id v35 = v9;
      [(IDSKTOptInStatusMessage *)v22 setCompletionBlock:v33];
      [(IDSRegistrationCenter *)self __sendMessage:v22];
    }
    char v21 = v18 ^ 1;
  }
  else
  {
    uint64_t v20 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "  => Ignoring KT Opt In status update, we have no auth cert", buf, 2u);
    }

    if (v9) {
      (*((void (**)(id, __CFString *, uint64_t, void, void, void))v9 + 2))(v9, v8, 1, 0, 0, 0);
    }
    char v21 = 0;
  }

  return v21;
}

- (BOOL)queryValidatedEmailsForRegistration:(id)a3 allowPasswordPrompt:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting validated emails for: %@", (uint8_t *)&v15, 0xCu);
  }

  CFStringRef v11 = [v8 authenticationCert];

  if (v11)
  {
    BOOL v12 = [(IDSRegistrationCenter *)self _queryValidatedEmailsForRegistration:v8 allowPasswordPrompt:v6 completionBlock:v9];
  }
  else
  {
    id v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Ignoring query, we have no auth cert", (uint8_t *)&v15, 2u);
    }

    if (v9) {
      (*((void (**)(id, id, uint64_t, void, void))v9 + 2))(v9, v8, 1, 0, 0);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)__reallySendAuthenticateRegistration
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending authenticate registration now...", v5, 2u);
  }

  id v4 = [(NSMutableArray *)self->_queuedAuthentications lastObject];
  if (v4) {
    [(IDSRegistrationCenter *)self _sendAuthenticateRegistration:v4];
  }
}

- (BOOL)authenticateRegistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v29 = _os_activity_create((void *)&_mh_execute_header, "Registration center authenticate registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v29, &state);
  if (v4)
  {
    BOOL v5 = [v4 mainID];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      CFStringRef v11 = +[IMRGLog registration];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      double v19 = "Not sending IDS authentication, we have no main ID for registration: %@";
    }
    else
    {
      if ([v4 registrationType] != 1
        && [v4 registrationType] != 2
        || ([v4 profileID],
            double v7 = objc_claimAutoreleasedReturnValue(),
            BOOL v8 = [v7 length] == 0,
            v7,
            !v8))
      {
        id v9 = [v4 authenticationToken];
        BOOL v10 = v9 == 0;

        if (!v10)
        {
          CFStringRef v11 = [v4 authenticationToken];
          if (v11)
          {
            BOOL v12 = +[IMRGLog registration];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v4;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding IDS authentication to the queue: %@", buf, 0xCu);
            }

            id v13 = +[IMRGLog registration];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, " => Really adding", buf, 2u);
            }

            queuedAuthentications = self->_queuedAuthentications;
            if (!queuedAuthentications)
            {
              int v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
              id v16 = self->_queuedAuthentications;
              self->_queuedAuthentications = v15;

              queuedAuthentications = self->_queuedAuthentications;
            }
            if ([(NSMutableArray *)queuedAuthentications containsObject:v4])
            {
              BOOL v17 = +[IMRGLog registration];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v31 = v4;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " => Removing old registration info object: %@", buf, 0xCu);
              }

              [(NSMutableArray *)self->_queuedAuthentications removeObject:v4];
            }
            else
            {
              uint64_t v26 = +[IMRGLog registration];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v31 = v4;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, " => Simply adding registration info object: %@", buf, 0xCu);
              }
            }
            [(NSMutableArray *)self->_queuedAuthentications addObject:v4];
            [(CUTDeferredTaskQueue *)self->_sendAuthenticateRegistrationTask enqueueExecutionWithTarget:self afterDelay:3.0];
            BOOL v18 = 1;
            goto LABEL_39;
          }
          uint64_t v20 = [v4 authenticationCert];
          if (v20 && (BOOL v21 = [v4 registrationType] == 0, v20, v21))
          {
            uint64_t v22 = +[IMRGLog registration];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              BOOL v23 = "*** Cannot authenticate, missing SMS signature";
              BOOL v24 = v22;
              uint32_t v25 = 2;
              goto LABEL_36;
            }
          }
          else
          {
            uint64_t v22 = +[IMRGLog registration];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v4;
              BOOL v23 = "Not IDS authenticating, we have no authentication token for: %@";
              BOOL v24 = v22;
              uint32_t v25 = 12;
LABEL_36:
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
            }
          }

          goto LABEL_38;
        }
        CFStringRef v11 = +[IMRGLog registration];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v4;
          double v19 = "Not sending IDS authentication, we have no auth token for registration: %@";
          goto LABEL_25;
        }
LABEL_38:
        BOOL v18 = 0;
LABEL_39:

        goto LABEL_40;
      }
      CFStringRef v11 = +[IMRGLog registration];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      double v19 = "Not sending IDS authentication, we have no profile ID for registration: %@";
    }
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_38;
  }
  BOOL v18 = 0;
LABEL_40:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v18;
}

- (void)__reallySendRegistration
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending registrations now...", v4, 2u);
  }

  [(IDSRegistrationCenter *)self _sendRegistrationAsDeregister:0];
}

- (BOOL)sendRegistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v20 = _os_activity_create((void *)&_mh_execute_header, "Registration center send registration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  BOOL v5 = [v4 authenticationCert];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    uint64_t v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      int v15 = "Not registering, we have no cert for: %@";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }
LABEL_22:

LABEL_23:
    BOOL v16 = 0;
    goto LABEL_24;
  }
  if (([v4 canSendRegistration] & 1) == 0)
  {
    uint64_t v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      int v15 = "Not registering, not able to register: %@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  unsigned __int8 v7 = [v4 stopAtAuthentication];
  if (v4) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if (v8) {
    goto LABEL_23;
  }
  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending registration for %@", buf, 0xCu);
  }

  if ((uint64_t)[v4 registrationStatus] <= 7) {
    [v4 setRegistrationStatus:7];
  }
  queuedRegistrations = self->_queuedRegistrations;
  if (!queuedRegistrations)
  {
    CFStringRef v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    BOOL v12 = self->_queuedRegistrations;
    self->_queuedRegistrations = v11;

    queuedRegistrations = self->_queuedRegistrations;
  }
  if ([(NSMutableArray *)queuedRegistrations containsObject:v4])
  {
    id v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating registration to the queue (replacing existing): %@", buf, 0xCu);
    }

    [(NSMutableArray *)self->_queuedRegistrations removeObject:v4];
  }
  else
  {
    BOOL v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding registration to the queue: %@", buf, 0xCu);
    }
  }
  [(NSMutableArray *)self->_queuedRegistrations addObject:v4];
  [(CUTDeferredTaskQueue *)self->_sendRegistrationTask enqueueExecutionWithTarget:self afterDelay:3.0];
  BOOL v16 = 1;
LABEL_24:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v16;
}

- (BOOL)sendDeregistration:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v9 = _os_activity_create((void *)&_mh_execute_header, "Registration center send deregistration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v9, &state);
  BOOL v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding deregistration to the queue: %@", buf, 0xCu);
  }

  if (v4)
  {
    BOOL v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, " => Really adding", buf, 2u);
    }

    [(IDSRegistrationCenter *)self _sendDeregistration:v4];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v4 != 0;
}

- (void)cancelRegisterActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v5 = [(IDSRegistrationCenterMessageDelivery *)self->_httpMessageDelivery queuedMessages];
    id v6 = [v5 _copyForEnumerating];

    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      CFStringRef v9 = @"info";
      uint64_t v10 = *(void *)v25;
      do
      {
        id v11 = 0;
        id v23 = v8;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
          id v13 = [v12 userInfo];
          uint64_t v14 = [v13 objectForKey:v9];
          if ([v14 isEqual:v4])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = v10;
              CFStringRef v16 = v9;
              id v17 = v4;
              id v18 = v6;
              double v19 = self;
              uint64_t v20 = +[IMRGLog registration];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cancelling current registration", buf, 2u);
              }

              self = v19;
              [(IDSRegistrationCenterMessageDelivery *)v19->_httpMessageDelivery cancelMessage:v12];
              id v6 = v18;
              id v4 = v17;
              CFStringRef v9 = v16;
              uint64_t v10 = v15;
              id v8 = v23;
            }
          }

          id v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }

    if ([(NSMutableArray *)self->_currentRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_currentRegistrations removeObject:v4];
      BOOL v21 = +[IMRGLog registration];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing current registration: %@", buf, 0xCu);
      }
    }
    if ([(NSMutableArray *)self->_queuedRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_queuedRegistrations removeObject:v4];
      id v22 = +[IMRGLog registration];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v4;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Cancelling queued registration: %@", buf, 0xCu);
      }
    }
    [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  }
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSMutableArray *)self->_currentRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_currentRegistrations removeObject:v4];
      BOOL v5 = +[IMRGLog registration];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing current registration", buf, 2u);
      }
    }
    if ([(NSMutableArray *)self->_currentAuthentications containsObject:v4])
    {
      [(NSMutableArray *)self->_currentAuthentications removeObject:v4];
      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing current authentication", v11, 2u);
      }
    }
    if ([(NSMutableArray *)self->_queuedAuthentications containsObject:v4])
    {
      [(NSMutableArray *)self->_queuedAuthentications removeObject:v4];
      id v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling queued authentications", v10, 2u);
      }
    }
    if ([(NSMutableArray *)self->_queuedRegistrations containsObject:v4])
    {
      [(NSMutableArray *)self->_queuedRegistrations removeObject:v4];
      id v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cancelling queued registration", v9, 2u);
      }
    }
    [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  }
}

- (id)activeRegistrations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableArray *)self->_queuedRegistrations count]) {
    [v3 addObjectsFromArray:self->_queuedRegistrations];
  }
  if ([(NSMutableArray *)self->_queuedAuthentications count]) {
    [v3 addObjectsFromArray:self->_queuedAuthentications];
  }
  if (![v3 count])
  {

    id v3 = 0;
  }

  return v3;
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      BOOL v5 = +[NSMutableArray nonRetainingArray];
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    [(NSMutableArray *)handlers addObject:v7];
  }
}

- (void)removeListener:(id)a3
{
  [(NSMutableArray *)self->_handlers removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_handlers count])
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  if (objc_msgSend(a4, "length", a3))
  {
    BOOL v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Token changed, _dequeuePendingRequestsIfNecessary", v6, 2u);
    }

    [(IDSRegistrationCenter *)self _dequeuePendingRequestsIfNecessary];
  }
}

- (BOOL)_checkOverRegistrations
{
  accountingHour = self->_accountingHour;
  id v4 = +[NSDate date];
  [(NSDate *)accountingHour timeIntervalSinceDate:v4];
  double v6 = fabs(v5);

  if (v6 < 1800.0) {
    return self->_registrations > 0x64;
  }
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t registrations = self->_registrations;
    v11[0] = 67109120;
    v11[1] = registrations;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "  * Forcing a reset on the registration count, enough time has passed   %d -> 0", (uint8_t *)v11, 8u);
  }

  uint64_t v10 = self->_accountingHour;
  self->_accountingHour = 0;

  BOOL result = 0;
  self->_unint64_t registrations = 0;
  return result;
}

- (void)_noteRegistration
{
  id v3 = (NSDate *)objc_alloc_init((Class)NSDate);
  p_accountingHour = &self->_accountingHour;
  accountingHour = self->_accountingHour;
  if (!accountingHour)
  {
    objc_storeStrong((id *)&self->_accountingHour, v3);
    accountingHour = *p_accountingHour;
  }
  [(NSDate *)accountingHour timeIntervalSinceDate:v3];
  if (fabs(v6) >= 1800.0)
  {
    if (*p_accountingHour != v3) {
      objc_storeStrong((id *)&self->_accountingHour, v3);
    }
    self->_unint64_t registrations = 1;
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t registrations = self->_registrations;
      int v13 = 67109376;
      int v14 = registrations;
      __int16 v15 = 1024;
      int v16 = 100;
      CFStringRef v9 = "Restarting number of registrations at %d (Max: %d)";
      uint64_t v10 = v7;
      uint32_t v11 = 14;
      goto LABEL_10;
    }
  }
  else
  {
    ++self->_registrations;
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = self->_registrations;
      int v13 = 67109632;
      int v14 = 30;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = 100;
      CFStringRef v9 = "Noting another registration in the last %d minutes, we're now at %d registrations  (Max: %d)";
      uint64_t v10 = v7;
      uint32_t v11 = 20;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
}

- (id)dateLastRegistered
{
  return self->_dateLastRegistered;
}

- (void)sendValidateCredential:(id)a3 withDeliveryCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_alloc_init(IDSValidateCredentialsMessage);
  CFStringRef v9 = [v6 pushToken];
  [(IDSValidateCredentialsMessage *)v8 setPushToken:v9];

  IDSAssignPushIdentityToMessage();
  uint64_t v10 = [v6 idsUserID];
  uint32_t v11 = [v6 authenticationCert];
  BOOL v12 = +[IDSRegistrationKeyManager sharedInstance];
  id v13 = [v12 identityPrivateKey];
  int v14 = +[IDSRegistrationKeyManager sharedInstance];
  -[IDSValidateCredentialsMessage addAuthUserID:certificate:privateKey:publicKey:](v8, "addAuthUserID:certificate:privateKey:publicKey:", v10, v11, v13, [v14 identityPublicKey]);

  __int16 v15 = sub_100265CA0(v6);
  [(IDSValidateCredentialsMessage *)v8 setDSAuthID:v15];

  if ([v6 registrationType])
  {
    int v16 = [v6 profileID];
    [(IDSValidateCredentialsMessage *)v8 setAuthenticationDataUserID:v16];

    __int16 v17 = [v6 authenticationToken];
    [(IDSValidateCredentialsMessage *)v8 setAuthenticationDataAuthToken:v17];
  }
  else
  {
    int v18 = [v6 userID];
    [(IDSValidateCredentialsMessage *)v8 setAuthenticationDataUserID:v18];

    __int16 v17 = [v6 authenticationToken];
    double v19 = [v17 _FTDataFromBase64String];
    [(IDSValidateCredentialsMessage *)v8 setAuthenticationDataSig:v19];
  }
  [(IDSValidateCredentialsMessage *)v8 setCompletionBlock:v7];

  if (![v6 registrationType])
  {
    ct_green_tea_logger_create_static();
    uint64_t v20 = getCTGreenTeaOsLogHandle();
    BOOL v21 = v20;
    if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Transmitting phone number", v22, 2u);
    }
  }
  [(IDSRegistrationCenter *)self __sendMessage:v8];
}

- (void)buildValidationCredentialsIfNeeded
{
  id v2 = [(IDSRegistrationCenter *)self validationQueue];
  [v2 buildValidationCredentialsIfNeededForSubsystem:1];
}

- (void)sendDeactivationRequestWithSIM:(id)a3 Info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_alloc_init(IDSSIMDeactivationInfoMessage);
  CFStringRef v9 = +[IDSDaemon sharedInstance];
  uint64_t v10 = [v9 registrationConductor];
  uint32_t v11 = [v10 userStore];

  BOOL v12 = [v7 SIMIdentifier];

  id v13 = [v11 userWithUniqueIdentifier:v12];

  int v14 = [v11 authenticationCertificateForUser:v13];
  if (v14)
  {
    __int16 v15 = [v13 realmPrefixedIdentifier];
    [v14 dataRepresentation];
    id v29 = v11;
    v17 = int v16 = v6;
    int v18 = self;
    double v19 = +[IDSRegistrationKeyManager sharedInstance];
    id v20 = [v19 identityPrivateKey];
    BOOL v21 = +[IDSRegistrationKeyManager sharedInstance];
    -[IDSSIMDeactivationInfoMessage addAuthUserID:certificate:privateKey:publicKey:](v8, "addAuthUserID:certificate:privateKey:publicKey:", v15, v17, v20, [v21 identityPublicKey]);

    id v6 = v16;
    id v22 = [(IDSPushHandler *)v18->_pushHandler pushToken];
    [(IDSSIMDeactivationInfoMessage *)v8 setPushToken:v22];
    IDSAssignPushIdentityToMessage();
    id v23 = +[NSDate date];
    [v23 timeIntervalSince1970];
    double v25 = v24;

    [(IDSSIMDeactivationInfoMessage *)v8 setDeviceTime:(uint64_t)v25];
    long long v26 = [v16 homePlmn];
    [(IDSSIMDeactivationInfoMessage *)v8 setHomePlmn:v26];

    long long v27 = [v16 events];
    [(IDSSIMDeactivationInfoMessage *)v8 setEvents:v27];

    [(IDSSIMDeactivationInfoMessage *)v8 setCompletionBlock:&stru_100986DE8];
    uint32_t v11 = v29;
    [(IDSRegistrationCenter *)v18 __sendMessage:v8];
  }
  else
  {
    uint64_t v28 = +[IMRGLog registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No PAC found for user : %@, stopping sim deactivation request", buf, 0xCu);
    }
  }
}

- (IDSValidationQueue)validationQueue
{
  return (IDSValidationQueue *)objc_getProperty(self, a2, 144, 1);
}

- (CUTDeferredTaskQueue)sendAuthenticateRegistrationTask
{
  return self->_sendAuthenticateRegistrationTask;
}

- (CUTDeferredTaskQueue)sendRegistrationTask
{
  return self->_sendRegistrationTask;
}

- (CUTDeferredTaskQueue)sendDeregistrationTask
{
  return self->_sendDeregistrationTask;
}

- (CUTDeferredTaskQueue)cleanupAbsintheTask
{
  return self->_cleanupAbsintheTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupAbsintheTask, 0);
  objc_storeStrong((id *)&self->_sendDeregistrationTask, 0);
  objc_storeStrong((id *)&self->_sendRegistrationTask, 0);
  objc_storeStrong((id *)&self->_sendAuthenticateRegistrationTask, 0);
  objc_storeStrong((id *)&self->_validationQueue, 0);
  objc_storeStrong((id *)&self->_keyTransparencyVerifier, 0);
  objc_storeStrong((id *)&self->_gdrCenter, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_httpMessageDelivery, 0);
  objc_storeStrong((id *)&self->_accountingHour, 0);
  objc_storeStrong((id *)&self->_dateLastRegistered, 0);
  objc_storeStrong((id *)&self->_dateSentLastHTTPMessage, 0);
  objc_storeStrong((id *)&self->_successfulRegistrations, 0);
  objc_storeStrong((id *)&self->_currentGetHandlesRegistrations, 0);
  objc_storeStrong((id *)&self->_currentGetHandlesBlocks, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_currentRegistrations, 0);
  objc_storeStrong((id *)&self->_currentAuthentications, 0);
  objc_storeStrong((id *)&self->_queuedAuthentications, 0);

  objc_storeStrong((id *)&self->_queuedRegistrations, 0);
}

@end