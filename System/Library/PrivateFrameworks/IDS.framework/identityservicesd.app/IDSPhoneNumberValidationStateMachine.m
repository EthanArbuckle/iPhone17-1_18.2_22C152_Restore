@interface IDSPhoneNumberValidationStateMachine
- (BOOL)_canDeliverSMSNow;
- (BOOL)_deviceCanRegisterPresently;
- (BOOL)_isAwaitingUserSelectionDuringSetup;
- (BOOL)_isPhoneNumberIdentificationSupported;
- (BOOL)_isUserSubscriptionSelectionStillPending;
- (BOOL)_userHasDisabledSMSRegistration;
- (BOOL)_validSIMStateForRegistration;
- (BOOL)commCenterDead;
- (BOOL)didReceiveSIMSetupCompleteNotification;
- (BOOL)hasAcceptedSMSRequest;
- (BOOL)isSMSWarningUp;
- (BOOL)needsToCheckPhoneNumberState;
- (IDSCTPNR)CTPNR;
- (IDSPersistentMap)dailyMetricData;
- (IDSPhoneNumberValidationModeArbiter)arbiter;
- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4;
- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4 HTTPDelivery:(id)a5 pushHandler:(id)a6 lockdownManager:(id)a7 systemMonitor:(id)a8 arbiter:(id)a9 systemAccountAdapter:(id)a10 dailyMetricData:(id)a11;
- (IDSPhoneNumberValidationStateMachineLockdownManager)lockdownManager;
- (IDSPhoneNumberValidationStateMachineMessageDelivery)httpMessageDelivery;
- (IDSPreflightStack)currentPreflightStack;
- (IDSPreflightStackStore)preflighStackStore;
- (IDSPushHandler)pushHandler;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IMSystemMonitor)systemMonitor;
- (IMTimer)lastSendSMSTimer;
- (NSDate)nextSendSMSDate;
- (NSDate)phoneNumberValidationStartDate;
- (NSDate)smsSendDate;
- (NSMutableArray)handlers;
- (NSMutableArray)registrations;
- (NSString)description;
- (id)_getHighestPriorityMechanism;
- (id)identifyPhoneNumberForRequestor:(id)a3 queue:(id)a4;
- (id)inFlightHeartbeatBlock;
- (id)inFlightSMSTimeoutBlock;
- (int64_t)_errorCodeForRegistrationError:(int64_t)a3;
- (int64_t)_registrationControlStatus;
- (int64_t)reason;
- (int64_t)status;
- (unsigned)loadNumberOfPreflightAttempts;
- (unsigned)loadNumberOfSuccessfulValidationSends;
- (unsigned)numberOfAttemptsWithoutSuccessfulSend;
- (unsigned)numberOfPreflights;
- (unsigned)numberOfSuccessfulSends;
- (void)PNRReadyStateChanged:(BOOL)a3;
- (void)PNRRequestSentWithRequestData:(id)a3;
- (void)PNRResponseReceivedWithResponseData:(id)a3;
- (void)_SIMSetupDidComplete;
- (void)_cancelScheduledHeartbeat;
- (void)_cancelScheduledSMSTimeout;
- (void)_clearSMSDeliveryTimeout;
- (void)_deviceIDChangedNotification:(id)a3;
- (void)_failPromisesWithError:(int64_t)a3;
- (void)_fulfillPromisesWithPhoneNumber:(id)a3 token:(id)a4;
- (void)_issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:(id)a3 mechanism:(id)a4;
- (void)_keychainMigrationComplete:(id)a3;
- (void)_lastSendSMSTimerFiredOnMain;
- (void)_lockdownStateChanged:(id)a3;
- (void)_notifyFailureWithError:(int64_t)a3;
- (void)_notifySuccess:(id)a3;
- (void)_performHighestPriorityPreflightVerification;
- (void)_popHighestPriorityPreflightVerification;
- (void)_registerForDeviceCenterNotifications;
- (void)_registerForLockdownNotifications;
- (void)_requestUserConsentForPhoneNumberValidationWithCompletion:(id)a3;
- (void)_scheduleHeartbeat:(double)a3;
- (void)_scheduleSMSTimeout:(double)a3;
- (void)_sendPreflightVerificationIfNeeded;
- (void)_sendPreflightVerificationWithIMSI:(id)a3 PLMN:(id)a4;
- (void)_sendSMSVerificationWithMechanism:(id)a3;
- (void)_setSMSDeliveryTimeout:(double)a3;
- (void)_smsDeliveryClear;
- (void)_tryToSendSMSIdentification;
- (void)addListener:(id)a3;
- (void)addPhoneNumberValidationRequestor:(id)a3;
- (void)dealloc;
- (void)handleIncomingSMSForResponse:(id)a3;
- (void)handleRegistrationSMSDeliveryFailed;
- (void)handleRegistrationSMSDeliveryFailedWithShouldBypassRetry:(BOOL)a3;
- (void)handleRegistrationSMSSuccessfullyDeliveredWithTelephonyTimeout:(id)a3;
- (void)heartbeat;
- (void)invalidate;
- (void)persistNumberOfPreflightAttempts:(unsigned int)a3;
- (void)persistNumberOfSuccessfulValidationSends:(unsigned int)a3;
- (void)removeListener:(id)a3;
- (void)removePhoneNumberValidationRequestor:(id)a3;
- (void)resetSMSCounter;
- (void)setArbiter:(id)a3;
- (void)setCTPNR:(id)a3;
- (void)setCommCenterDead:(BOOL)a3;
- (void)setCurrentPreflightStack:(id)a3;
- (void)setDailyMetricData:(id)a3;
- (void)setDidReceiveSIMSetupCompleteNotification:(BOOL)a3;
- (void)setHandlers:(id)a3;
- (void)setHasAcceptedSMSRequest:(BOOL)a3;
- (void)setHttpMessageDelivery:(id)a3;
- (void)setInFlightHeartbeatBlock:(id)a3;
- (void)setInFlightSMSTimeoutBlock:(id)a3;
- (void)setIsSMSWarningUp:(BOOL)a3;
- (void)setLastSendSMSTimer:(id)a3;
- (void)setLockdownManager:(id)a3;
- (void)setNeedsToCheckPhoneNumberState:(BOOL)a3;
- (void)setNextSendSMSDate:(id)a3;
- (void)setNumberOfAttemptsWithoutSuccessfulSend:(unsigned int)a3;
- (void)setNumberOfPreflights:(unsigned int)a3;
- (void)setNumberOfSuccessfulSends:(unsigned int)a3;
- (void)setPhoneNumberValidationStartDate:(id)a3;
- (void)setPreflighStackStore:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setRegistrations:(id)a3;
- (void)setSmsSendDate:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)systemDidFinishMigration;
- (void)systemDidStopBackup;
- (void)systemRestoreStateDidChange;
- (void)timedOutWaitingForSMS;
@end

@implementation IDSPhoneNumberValidationStateMachine

- (BOOL)_isPhoneNumberIdentificationSupported
{
  unsigned __int8 v2 = [(IDSCTPNR *)self->_CTPNR isPNRSupported];
  if ((v2 & 1) == 0)
  {
    v3 = +[IMRGLog sms];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registration is not supported on this device", v5, 2u);
    }
  }
  return v2;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t status = self->_status;
  if (status > 3) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = *(&off_100987850 + status);
  }
  return +[NSString stringWithFormat:@"<%@: %p state: %@, lastSendDate: %@, numberOfPreflights: %u, numberOfAttemptsWithoutSuccessfulSend: %u, numberOfSuccessfulSends: %u>", v3, self, v5, self->_smsSendDate, self->_numberOfPreflights, self->_numberOfAttemptsWithoutSuccessfulSend, self->_numberOfSuccessfulSends];
}

- (void)_scheduleHeartbeat:(double)a3
{
  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledHeartbeat];
  if (a3 > 0.0 && self->_status)
  {
    CFStringRef v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling heartbeat in %f seconds", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100283060;
    block[3] = &unk_10097E4D0;
    block[4] = self;
    dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
    [(IDSPhoneNumberValidationStateMachine *)self setInFlightHeartbeatBlock:v6];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v8 = im_primary_queue();
    dispatch_after(v7, v8, v6);
  }
}

- (void)_cancelScheduledHeartbeat
{
  uint64_t v3 = [(IDSPhoneNumberValidationStateMachine *)self inFlightHeartbeatBlock];

  if (v3)
  {
    v4 = [(IDSPhoneNumberValidationStateMachine *)self inFlightHeartbeatBlock];
    dispatch_block_cancel(v4);

    [(IDSPhoneNumberValidationStateMachine *)self setInFlightHeartbeatBlock:0];
  }
}

- (void)_scheduleSMSTimeout:(double)a3
{
  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledSMSTimeout];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100283208;
  double v11 = &unk_100981000;
  objc_copyWeak(&v12, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &v8);
  -[IDSPhoneNumberValidationStateMachine setInFlightSMSTimeoutBlock:](self, "setInFlightSMSTimeoutBlock:", v5, v8, v9, v10, v11);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_time_t v7 = im_primary_queue();
  dispatch_after(v6, v7, v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_cancelScheduledSMSTimeout
{
  uint64_t v3 = [(IDSPhoneNumberValidationStateMachine *)self inFlightSMSTimeoutBlock];

  if (v3)
  {
    v4 = [(IDSPhoneNumberValidationStateMachine *)self inFlightSMSTimeoutBlock];
    dispatch_block_cancel(v4);

    [(IDSPhoneNumberValidationStateMachine *)self setInFlightSMSTimeoutBlock:0];
  }
}

- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4 HTTPDelivery:(id)a5 pushHandler:(id)a6 lockdownManager:(id)a7 systemMonitor:(id)a8 arbiter:(id)a9 systemAccountAdapter:(id)a10 dailyMetricData:(id)a11
{
  id v17 = a3;
  id v47 = a4;
  id v46 = a5;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  id v40 = a11;
  if (!v17)
  {
    v18 = +[IMRGLog sms];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10071BB48((uint64_t)self, v18);
    }

    id v17 = 0;
  }
  v48.receiver = self;
  v48.super_class = (Class)IDSPhoneNumberValidationStateMachine;
  v19 = [(IDSPhoneNumberValidationStateMachine *)&v48 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_systemMonitor, a8);
    [(IMSystemMonitor *)v20->_systemMonitor addListener:v20];
    objc_storeStrong((id *)&v20->_pushHandler, a6);
    objc_storeStrong((id *)&v20->_CTPNR, a3);
    id v21 = v17;
    [v17 setPNRDelegate:v20];
    objc_storeStrong((id *)&v20->_httpMessageDelivery, a5);
    objc_storeStrong((id *)&v20->_lockdownManager, a7);
    objc_storeStrong((id *)&v20->_arbiter, a9);
    objc_storeStrong((id *)&v20->_systemAccountAdapter, a10);
    objc_storeStrong((id *)&v20->_preflighStackStore, a4);
    v20->_reason = 0;
    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requestors = v20->_requestors;
    v20->_requestors = v22;

    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    promises = v20->_promises;
    v20->_promises = v24;

    v20->_unsigned int numberOfSuccessfulSends = [(IDSPhoneNumberValidationStateMachine *)v20 loadNumberOfSuccessfulValidationSends];
    v20->_numberOfPreflights = [(IDSPhoneNumberValidationStateMachine *)v20 loadNumberOfPreflightAttempts];
    v26 = +[IMRGLog sms];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfSuccessfulSends = v20->_numberOfSuccessfulSends;
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = numberOfSuccessfulSends;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Phone Number Validation registration agent has sent %d SMSs", buf, 8u);
    }

    v28 = +[IMRGLog sms];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(IDSPhoneNumberValidationStateMachine *)v20 lockdownManager];
      *(_DWORD *)buf = 138412290;
      v50 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Lockdown state: %@", buf, 0xCu);
    }
    v20->_unint64_t status = 0;
    v30 = +[IMRGLog sms];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "1. Setting SMS status to: IDSSMSIdentificationStatusIdle", buf, 2u);
    }

    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v20 selector:"_keychainMigrationComplete:" name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

    [(IDSPhoneNumberValidationStateMachine *)v20 _registerForDeviceCenterNotifications];
    [(IDSPhoneNumberValidationStateMachine *)v20 _registerForLockdownNotifications];
    if (qword_100A4C478
      || ((v32 = (void **)IMWeakLinkSymbol()) == 0 ? (v33 = 0) : (v33 = *v32),
          objc_storeStrong((id *)&qword_100A4C478, v33),
          qword_100A4C478))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v20, (CFNotificationCallback)sub_10028374C, (CFStringRef)qword_100A4C478, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    else
    {
      v36 = +[FTDeviceSupport sharedInstance];
      id v37 = [v36 deviceType];

      if (v37 == (id)2)
      {
        v38 = +[IMRGLog sms];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          sub_10071BB04(v38);
        }
      }
    }
    IDSSetPhoneNumberChangeNotificationEnabled();
    IDSFetchPhoneNumber();
    objc_storeStrong((id *)&v20->_dailyMetricData, a11);
    id v17 = v21;
  }

  return v20;
}

- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v21 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  v20 = +[IMLockdownManager sharedInstance];
  v19 = +[IMSystemMonitor sharedInstance];
  id v18 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]);
  [v18 setLogToRegistration:1];
  dispatch_time_t v7 = +[IDSRegistrationRequestTracker sharedInstance];
  [v18 addRequestObserver:v7];

  v16 = objc_alloc_init(IDSPhoneNumberValidationModeArbiter);
  v8 = [IDSSystemAccountAdapter alloc];
  uint64_t v9 = im_primary_queue();
  v10 = [(IDSSystemAccountAdapter *)v8 initWithQueue:v9];

  double v11 = [IDSPersistentMap alloc];
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.identityservices.dailyPNRData.%lu", [v6 slotID]);
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  id v12 = +[NSArray arrayWithObjects:v24 count:2];
  v13 = +[NSSet setWithArray:v12];
  v14 = [(IDSPersistentMap *)v11 initWithIdentifier:v17 versionNumber:0 decodableClasses:v13 migrationBlock:0];
  v23 = [(IDSPhoneNumberValidationStateMachine *)self initWithCTPNR:v6 preflightStackStore:v5 HTTPDelivery:v18 pushHandler:v21 lockdownManager:v20 systemMonitor:v19 arbiter:v16 systemAccountAdapter:v10 dailyMetricData:v14];

  return v23;
}

- (void)invalidate
{
  [(IMSystemMonitor *)self->_systemMonitor removeListener:self];
  uint64_t v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Phone Number Validation agent dealloc", v6, 2u);
  }

  [(IDSPhoneNumberValidationStateMachine *)self _clearSMSDeliveryTimeout];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:0 object:0];
}

- (void)dealloc
{
  [(IDSPhoneNumberValidationStateMachine *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IDSPhoneNumberValidationStateMachine;
  [(IDSPhoneNumberValidationStateMachine *)&v3 dealloc];
}

- (void)_registerForDeviceCenterNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_deviceIDChangedNotification:" name:FaceTimeDeviceRegistrationStateChangedNotification object:0];
}

- (IDSPreflightStack)currentPreflightStack
{
  id v3 = [(IDSPhoneNumberValidationStateMachine *)self preflighStackStore];
  v4 = [(IDSCTPNR *)self->_CTPNR uniqueIdentifier];
  id v5 = [v3 preflightStackForIdentifier:v4];

  return (IDSPreflightStack *)v5;
}

- (void)setCurrentPreflightStack:(id)a3
{
  id v4 = a3;
  id v6 = [(IDSPhoneNumberValidationStateMachine *)self preflighStackStore];
  id v5 = [(IDSCTPNR *)self->_CTPNR uniqueIdentifier];
  [v6 setPreflightStack:v4 forIdentifier:v5];
}

- (int64_t)_registrationControlStatus
{
  unsigned __int8 v2 = +[IDSDRegistrationControl sharedInstance];
  id v3 = [v2 registrationStateForRegistrationType:0 error:0];

  return (int64_t)v3;
}

- (BOOL)_userHasDisabledSMSRegistration
{
  id v3 = +[FTDeviceSupport sharedInstance];
  if ([v3 faceTimeBlocked]
    && [v3 callingBlocked]
    && [v3 iMessageBlocked])
  {
    unsigned int v4 = [v3 multiwayBlocked];
  }
  else
  {
    unsigned int v4 = 0;
  }
  id v5 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iCloudSystemAccountWithError:0];

  id v6 = +[IMRGLog sms];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4 || v5)
  {
    if (v7)
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration Control Checking On the state of Phone Number registration disablement", v12, 2u);
    }

    uint64_t v9 = +[FTDeviceSupport sharedInstance];
    unsigned int v10 = [v9 isGreenTea];

    if (v10) {
      BOOL v8 = (id)[(IDSPhoneNumberValidationStateMachine *)self _registrationControlStatus] == (id)1;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A configuration profile disables SMS for iMessage and FaceTime -- denying", buf, 2u);
    }

    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_isUserSubscriptionSelectionStillPending
{
  id v3 = +[IDSCTAdapter sharedInstance];
  unsigned int v4 = [v3 dualSIMCapabilityEnabled];

  id v5 = +[FTUserConfiguration sharedInstance];
  id v6 = [v5 selectedPhoneNumberRegistrationSubscriptionLabels];
  id v7 = [v6 count];

  if (v4) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = v8 && !self->_didReceiveSIMSetupCompleteNotification;
  unsigned int v10 = +[IMRGLog sms];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v4) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    BOOL didReceiveSIMSetupCompleteNotification = self->_didReceiveSIMSetupCompleteNotification;
    if (v7) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    int v16 = 138412802;
    CFStringRef v17 = v12;
    __int16 v18 = 2112;
    CFStringRef v19 = v14;
    if (didReceiveSIMSetupCompleteNotification) {
      CFStringRef v11 = @"YES";
    }
    __int16 v20 = 2112;
    CFStringRef v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Determined whether user subscription selection is still pending { isDualSIM: %@, hasSelectedPhoneNumber: %@, didReceiveSIMSetupCompleteNotification: %@ }", (uint8_t *)&v16, 0x20u);
  }

  return v9;
}

- (BOOL)_isAwaitingUserSelectionDuringSetup
{
  BOOL v3 = +[IDSRegistrationController isBuddyShowing];
  if (v3)
  {
    unsigned int v4 = +[FTDeviceSupport sharedInstance];
    unsigned int v5 = [v4 isGreenTea];

    unsigned int v6 = [(IDSPhoneNumberValidationStateMachine *)self _isUserSubscriptionSelectionStillPending];
    id v7 = (char *)[(IDSPhoneNumberValidationStateMachine *)self _registrationControlStatus]
       - 3;
    if ((unint64_t)v7 < 0xFFFFFFFFFFFFFFFELL) {
      char v8 = v5;
    }
    else {
      char v8 = 0;
    }
    if ((v8 & 1) != 0 || v6)
    {
      BOOL v9 = +[IMRGLog sms];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = @"NO";
        if (v5) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        if ((unint64_t)v7 >= 0xFFFFFFFFFFFFFFFELL) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        int v14 = 138412802;
        CFStringRef v15 = v11;
        __int16 v16 = 2112;
        CFStringRef v17 = v12;
        if (v6) {
          CFStringRef v10 = @"YES";
        }
        __int16 v18 = 2112;
        CFStringRef v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Currently awaiting selection { doesDeviceNeedExplicitPhoneAuthConsent: %@, isRegistrationControlStateSet: %@, needToWaitForSubscriptionSelection: %@ }", (uint8_t *)&v14, 0x20u);
      }

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_notifyFailureWithError:(int64_t)a3
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v45 = _os_activity_create((void *)&_mh_execute_header, "SMS registration center notify failure", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v45, &state);
  v34 = [(IDSPhoneNumberValidationStateMachine *)self _getHighestPriorityMechanism];
  int64_t v5 = [(IDSPhoneNumberValidationStateMachine *)self _errorCodeForRegistrationError:a3];
  if (v5 == -3000 && v34 && [v34 type] == (id)1)
  {
    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v41;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v7);
          }
          CFStringRef v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 validator:self handleABCEvent:203];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v8);
    }
  }
  CFStringRef v12 = +[IDSPACStateTracker sharedInstance];
  [v12 notePNRError:v5];

  [(NSMutableArray *)self->_requestors removeAllObjects];
  self->_unint64_t status = 0;
  self->_hasAcceptedSMSRequest = 0;
  v13 = +[IMRGLog sms];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "2. Setting SMS status to: IDSSMSIdentificationStatusIdle", buf, 2u);
  }

  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledHeartbeat];
  [(IDSPhoneNumberValidationStateMachine *)self _failPromisesWithError:a3];
  id v14 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v36;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v15);
        }
        CFStringRef v19 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector()) {
          [v19 validator:self failedIdentificationWithRegistrationError:a3];
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v16);
  }

  __int16 v20 = +[NSDate date];
  [v20 timeIntervalSinceDate:self->_phoneNumberValidationStartDate];
  double v22 = v21;

  sub_1001BC738(a3);
  v23 = +[NSNumber numberWithDouble:v22];
  v24 = +[NSNumber numberWithUnsignedInt:self->_numberOfSuccessfulSends];
  FTAWDLogRegistrationPhoneNumberValidationFinished();

  id v25 = objc_alloc((Class)IDSRegistrationPhoneNumberValidationFinishedMetric);
  uint64_t v26 = sub_1001BC738(a3);
  v27 = +[NSNumber numberWithDouble:v22];
  v28 = +[NSNumber numberWithUnsignedInt:self->_numberOfSuccessfulSends];
  id v29 = [v25 initWithGuid:0 registrationError:v26 validationDuration:v27 numberOfSMSSent:v28];

  v30 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v30 logMetric:v29];

  phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
  self->_phoneNumberValidationStartDate = 0;

  [(IDSPersistentMap *)self->_dailyMetricData setObject:&__kCFBooleanFalse forKey:IDSPNRRegStatusMetricPNRdKey];
  dailyMetricData = self->_dailyMetricData;
  v33 = +[NSNumber numberWithInteger:v5];
  [(IDSPersistentMap *)dailyMetricData setObject:v33 forKey:IDSPNRRegStatusMetricPNRErrorCodeKey];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifySuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v44 = _os_activity_create((void *)&_mh_execute_header, "SMS registration center notify success", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  int64_t v5 = [v4 phoneNumber];
  id v6 = [v4 phoneBookNumber];
  v33 = v4;
  id v7 = [v4 signature];
  id v8 = [v7 _FTStringFromBaseData];

  if ([(NSMutableArray *)self->_requestors count])
  {
    [(NSMutableArray *)self->_requestors removeAllObjects];
    self->_unint64_t status = 0;
    self->_hasAcceptedSMSRequest = 0;
    uint64_t v9 = +[IMRGLog sms];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "3. Setting SMS status to: IDSSMSIdentificationStatusIdle", buf, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledHeartbeat];
    [(IDSPhoneNumberValidationStateMachine *)self _fulfillPromisesWithPhoneNumber:v5 token:v8];
    id v10 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v35;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v14);
          if (objc_opt_respondsToSelector()) {
            [v15 validator:self identifiedPhoneNumber:v5 token:v8 phoneBookNumber:v6];
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v12);
    }

    id v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:self->_phoneNumberValidationStartDate];
    double v18 = v17;

    sub_1001BC738(-1);
    CFStringRef v19 = +[NSNumber numberWithDouble:v18];
    __int16 v20 = +[NSNumber numberWithUnsignedInt:self->_numberOfSuccessfulSends];
    FTAWDLogRegistrationPhoneNumberValidationFinished();

    id v21 = objc_alloc((Class)IDSRegistrationPhoneNumberValidationFinishedMetric);
    uint64_t v22 = sub_1001BC738(-1);
    v23 = +[NSNumber numberWithDouble:v18];
    v24 = +[NSNumber numberWithUnsignedInt:self->_numberOfSuccessfulSends];
    id v25 = [v21 initWithGuid:0 registrationError:v22 validationDuration:v23 numberOfSMSSent:v24];

    uint64_t v26 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v26 logMetric:v25];

    phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
    self->_phoneNumberValidationStartDate = 0;

    [(IDSPersistentMap *)self->_dailyMetricData setObject:&__kCFBooleanTrue forKey:IDSPNRRegStatusMetricPNRdKey];
  }
  else
  {
    id v28 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v25 = v28;
    id v29 = [v25 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v40;
      do
      {
        v31 = 0;
        do
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v25);
          }
          v32 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v31);
          if (objc_opt_respondsToSelector()) {
            [v32 validator:self identifiedPhoneNumber:v5 token:v8 phoneBookNumber:v6];
          }
          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v29 = [v25 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v29);
    }
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_fulfillPromisesWithPhoneNumber:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[IDSPhoneNumberIdentification alloc] initWithPhoneNumber:v6 phoneToken:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_promises;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "fulfillWithValue:", v8, (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_promises removeAllObjects];
}

- (void)_failPromisesWithError:(int64_t)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", @"IDSPhoneNumberValidationErrorDomain", -[IDSPhoneNumberValidationStateMachine _errorCodeForRegistrationError:](self, "_errorCodeForRegistrationError:", a3), 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = self->_promises;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "failWithError:", v4, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_promises removeAllObjects];
}

- (int64_t)_errorCodeForRegistrationError:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) < 2) {
    return -2000;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    return -3000;
  }
  if (a3 > 34)
  {
    if (a3 != 35)
    {
      if (a3 == 36) {
        return -5000;
      }
      return -1000;
    }
    return -4000;
  }
  if (!a3) {
    return -6000;
  }
  if (a3 == 2) {
    return -4000;
  }
  return -1000;
}

- (BOOL)_deviceCanRegisterPresently
{
  BOOL v3 = [(IDSPhoneNumberValidationStateMachine *)self lockdownManager];
  unsigned __int8 v4 = [v3 isActivated];

  if (v4)
  {
    if ([(IDSPhoneNumberValidationStateMachine *)self _validSIMStateForRegistration]
      && !IDSDebuggingShouldFakeBadSIM())
    {
      return 1;
    }
    int64_t v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SIM is not ready to proceed with registration", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    int64_t v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(IDSPhoneNumberValidationStateMachine *)self lockdownManager];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is currently locked down, we're not able to proceed (State: %@)", (uint8_t *)&v8, 0xCu);
    }
  }

  return 0;
}

- (BOOL)_validSIMStateForRegistration
{
  BOOL v3 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration];
  if (v3)
  {
    if ([(IDSCTPNR *)self->_CTPNR isSIMReady])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      unsigned __int8 v4 = +[IMRGLog registration];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " SIM State says cannot register, registration State", v6, 2u);
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_lockdownStateChanged:(id)a3
{
  unsigned __int8 v4 = +[IMRGLog sms];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lockdown changed", buf, 2u);
  }

  int64_t v5 = [(IDSPhoneNumberValidationStateMachine *)self lockdownManager];
  unsigned int v6 = [v5 isActivated];

  if (v6)
  {
    id v7 = +[IMRGLog sms];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "     ==> We're activated, let's go, waiting...", v8, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:5.0];
  }
}

- (void)_registerForLockdownNotifications
{
  BOOL v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering %@ for lockdown changes", (uint8_t *)&v5, 0xCu);
  }

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_lockdownStateChanged:" name:IMLockdownDeviceActivatedChangedNotification object:0];
}

- (void)_deviceIDChangedNotification:(id)a3
{
  unsigned __int8 v4 = +[IMRGLog sms];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device ID Changed", buf, 2u);
  }

  if ([(IDSPhoneNumberValidationStateMachine *)self _validSIMStateForRegistration])
  {
    int v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "     ==> We're in a good SIM State, checking heartbeat, waiting...", v6, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:5.0];
  }
}

- (void)PNRReadyStateChanged:(BOOL)a3
{
}

- (void)PNRRequestSentWithRequestData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 success];
  unsigned int v6 = [v4 timeout];
  id v7 = +[IMRGLog sms];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    uint64_t v9 = [v4 token];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v17 = 2112;
    double v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CT phone number registration request sent { success: %@, timeout: %@, pushTokenHexEncoding: %@ }", buf, 0x20u);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  long long v10 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100285734;
  block[3] = &unk_100985C10;
  objc_copyWeak(&v14, (id *)buf);
  char v15 = v5;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)PNRResponseReceivedWithResponseData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CT phone number registration response received { data: %@ }", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  unsigned int v6 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10028599C;
  v8[3] = &unk_100981968;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)systemDidFinishMigration
{
  int v3 = IMGetCachedDomainBoolForKey();
  id v4 = +[IMRGLog sms];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking to see if we restored from backup: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    unsigned int v6 = +[IMRGLog sms];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "     ==> Restored from backup, and we need to re-register here, waiting...", (uint8_t *)&v7, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:20.0];
  }
}

- (void)systemDidStopBackup
{
  if (!+[IDSRegistrationController isBuddyBlockingRegistration])
  {
    int v3 = +[IMRGLog sms];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "     ==> System backup complete, waiting...", v4, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:5.0];
  }
}

- (void)systemRestoreStateDidChange
{
  if (!+[IDSRegistrationController isBuddyBlockingRegistration])
  {
    int v3 = +[IMRGLog sms];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "     ==> System restore state changed, waiting...", v4, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:5.0];
  }
}

- (void)_SIMSetupDidComplete
{
  self->_BOOL didReceiveSIMSetupCompleteNotification = 1;
  int v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "     ==> SIM setup did complete -- kicking heartbeat", v4, 2u);
  }

  [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:1.0];
}

- (void)_keychainMigrationComplete:(id)a3
{
  id v4 = +[IDSRegistrationKeyManager sharedInstance];
  unsigned __int8 v5 = [v4 requiresKeychainMigration];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = +[IMRGLog sms];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "     ==> Keychain migration complete, waiting...", v7, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:20.0];
  }
}

- (void)_clearSMSDeliveryTimeout
{
  [(IMTimer *)self->_lastSendSMSTimer invalidate];
  lastSendSMSTimer = self->_lastSendSMSTimer;
  self->_lastSendSMSTimer = 0;
}

- (void)_smsDeliveryClear
{
  int v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Phone Number Validation Request Delivery clear timer fired", buf, 2u);
  }

  [(IDSPhoneNumberValidationStateMachine *)self _clearSMSDeliveryTimeout];
  if (self->_status)
  {
    if ([(IDSPhoneNumberValidationStateMachine *)self _validSIMStateForRegistration])
    {
      id v4 = +[IMRGLog sms];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "     ==> We're in a good SIM State, checking heartbeat, waiting...", v6, 2u);
      }

      [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:5.0];
    }
  }
  else
  {
    unsigned __int8 v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We're idle, bailing", v7, 2u);
    }
  }
}

- (BOOL)_canDeliverSMSNow
{
  return self->_lastSendSMSTimer == 0;
}

- (void)_setSMSDeliveryTimeout:(double)a3
{
  if (!self->_lastSendSMSTimer)
  {
    [(IDSPhoneNumberValidationStateMachine *)self _clearSMSDeliveryTimeout];
    if (qword_100A4C488 != -1) {
      dispatch_once(&qword_100A4C488, &stru_100987830);
    }
    if (byte_100A4C480)
    {
      a3 = (double)IMGetDomainIntForKey();
      unsigned __int8 v5 = +[IMRGLog warning];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218498;
        double v11 = a3;
        __int16 v12 = 2112;
        CFStringRef v13 = @"com.apple.registration";
        __int16 v14 = 2112;
        CFStringRef v15 = @"overrideSMSTimeout";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding Phone Number Validation Request timeout for registration with: %f   remove %@: %@    to stop this", (uint8_t *)&v10, 0x20u);
      }
    }
    id v6 = objc_alloc((Class)IMTimer);
    int v7 = im_primary_queue();
    CFStringRef v8 = (IMTimer *)[v6 initWithTimeInterval:@"com.apple.identityservices.sms-delivery-hbi" name:1 shouldWake:self target:"_smsDeliveryClear" selector:0 userInfo:v7 queue:a3];
    lastSendSMSTimer = self->_lastSendSMSTimer;
    self->_lastSendSMSTimer = v8;
  }
}

- (void)_lastSendSMSTimerFiredOnMain
{
  int v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002862D0;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_sendSMSVerificationWithMechanism:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to send SMS verification { mechanism: %@ }", (uint8_t *)&v17, 0xCu);
  }

  if ([(IDSPhoneNumberValidationStateMachine *)self _canDeliverSMSNow])
  {
    id v6 = [(IDSPushHandler *)self->_pushHandler pushToken];
    if (v6)
    {
      self->_unint64_t status = 2;
      int v7 = +[IMRGLog sms];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "6. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationDelivery", (uint8_t *)&v17, 2u);
      }

      [(IDSPhoneNumberValidationStateMachine *)self _issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:v6 mechanism:v4];
      id v8 = objc_msgSend(objc_alloc((Class)IDSPNRMetric), "initWithPNRReason:mechanism:", -[IDSPhoneNumberValidationStateMachine reason](self, "reason"), objc_msgSend(v4, "type"));
      id v9 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v9 logMetric:v8];

      dailyMetricData = self->_dailyMetricData;
      double v11 = +[IDSCTPNRValidationMechanism mechanismStringForMechanism:](IDSCTPNRValidationMechanism, "mechanismStringForMechanism:", [v4 type]);
      [(IDSPersistentMap *)dailyMetricData setObject:v11 forKey:IDSPNRRegStatusMetricPNRMechanismKey];

      __int16 v12 = self->_dailyMetricData;
      CFStringRef v13 = +[IDSCurrentServerTime sharedInstance];
      [v13 currentServerTimeInterval];
      __int16 v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(IDSPersistentMap *)v12 setObject:v14 forKey:IDSPNRRegStatusMetricPNRTimestampKey];
    }
    else
    {
      self->_unint64_t status = 1;
      CFStringRef v15 = +[IMRGLog sms];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "4. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification", (uint8_t *)&v17, 2u);
      }

      long long v16 = +[IMRGLog sms];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "     ==> We have no push token, bailing, waiting...", (uint8_t *)&v17, 2u);
      }

      [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:20.0];
    }
  }
  else
  {
    id v6 = +[IMRGLog sms];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Still waiting on timeout to clear for next Phone Number Validation request to be delivered, waiting", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:(id)a3 mechanism:(id)a4
{
  CTPNR = self->_CTPNR;
  uint64_t numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002866D0;
  v8[3] = &unk_100982B28;
  void v8[4] = self;
  if (([(IDSCTPNR *)CTPNR issuePNRForMechanism:a4 pushToken:a3 attemptCount:numberOfSuccessfulSends completion:v8] & 1) == 0)
  {
    int v7 = +[IMRGLog sms];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10071BBCC(v7);
    }

    [(IDSPhoneNumberValidationStateMachine *)self handleRegistrationSMSDeliveryFailed];
  }
}

- (void)_sendPreflightVerificationIfNeeded
{
  int v3 = [(IDSCTPNR *)self->_CTPNR PNRInfo];
  id v4 = [v3 IMSI];
  unsigned __int8 v5 = [v3 PLMN];
  uint64_t v6 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
  if (v6)
  {
    int v7 = (void *)v6;
    id v8 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
    if ([v8 containsMechanisms])
    {
      id v9 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
      unsigned __int8 v10 = [v9 matchesIMSI:v4 PLMN:v5];

      if (v10)
      {
        double v11 = +[IMRGLog sms];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
          int v18 = 138412290;
          v19[0] = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We're currently iterating over Preflight mechanisms -- continuing { currentPreflightStack: %@ }", (uint8_t *)&v18, 0xCu);
        }
        [(IDSPhoneNumberValidationStateMachine *)self _performHighestPriorityPreflightVerification];
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  CFStringRef v13 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
  unsigned int v14 = [v13 maxAllowableNumberOfPreflightRequests];

  if (self->_numberOfPreflights >= v14)
  {
    int v17 = +[IMRGLog warning];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10071BC10(v14, v17);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:3];
    [(IDSPhoneNumberValidationStateMachine *)self resetSMSCounter];
  }
  else
  {
    CFStringRef v15 = +[IMRGLog sms];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfPreflights = self->_numberOfPreflights;
      int v18 = 67109376;
      LODWORD(v19[0]) = numberOfPreflights;
      WORD2(v19[0]) = 1024;
      *(_DWORD *)((char *)v19 + 6) = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Haven't completed max number of Preflights yet { preflights: %d, maxPreflights: %d }", (uint8_t *)&v18, 0xEu);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _sendPreflightVerificationWithIMSI:v4 PLMN:v5];
  }
LABEL_15:
}

- (id)_getHighestPriorityMechanism
{
  int v3 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
  unsigned int v4 = [v3 containsMechanisms];

  if (v4)
  {
    unsigned __int8 v5 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
    uint64_t v6 = [v5 topMechanism];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_popHighestPriorityPreflightVerification
{
  int v3 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
  unsigned int v4 = [v3 containsMechanisms];

  if (v4)
  {
    id v6 = [(IDSPhoneNumberValidationStateMachine *)self currentPreflightStack];
    unsigned __int8 v5 = [v6 preflightStackByPoppingMechanism];
    [(IDSPhoneNumberValidationStateMachine *)self setCurrentPreflightStack:v5];
  }
}

- (void)_performHighestPriorityPreflightVerification
{
  id v3 = [(IDSPhoneNumberValidationStateMachine *)self _getHighestPriorityMechanism];
  [(IDSPhoneNumberValidationStateMachine *)self _sendSMSVerificationWithMechanism:v3];
}

- (void)_sendPreflightVerificationWithIMSI:(id)a3 PLMN:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending Preflight message", buf, 2u);
  }

  id v9 = objc_alloc_init(IDSPreflightMessage);
  unsigned __int8 v10 = +[NSNumber numberWithUnsignedInt:self->_numberOfPreflights];
  [(IDSPreflightMessage *)v9 setPhoneNumberValidationRetryCount:v10];

  double v11 = [(IDSPushHandler *)self->_pushHandler pushToken];
  [(IDSPreflightMessage *)v9 setPushToken:v11];

  IDSAssignPushIdentityToMessage();
  __int16 v12 = +[FTDeviceSupport sharedInstance];
  CFStringRef v13 = [v12 model];

  unsigned int v14 = +[FTDeviceSupport sharedInstance];
  CFStringRef v15 = [v14 productOSVersion];

  long long v16 = +[FTDeviceSupport sharedInstance];
  int v17 = [v16 productBuildVersion];

  int v18 = +[FTDeviceSupport sharedInstance];
  __int16 v19 = [v18 deviceName];

  [(IDSPreflightMessage *)v9 setHardwareVersion:v13];
  [(IDSPreflightMessage *)v9 setOsVersion:v15];
  [(IDSPreflightMessage *)v9 setSoftwareVersion:v17];
  [(IDSPreflightMessage *)v9 setDeviceName:v19];
  [(IDSPreflightMessage *)v9 setTimeout:36000.0];
  __int16 v20 = +[NSNumber numberWithInteger:[(IDSPhoneNumberValidationStateMachine *)self reason]];
  [(IDSPreflightMessage *)v9 setPnrReason:v20];

  id v21 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
  id v22 = [v21 validationMode];

  if (v22 == (id)3)
  {
    v23 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
    v24 = [v23 preflightTestDataOverride];

    id v25 = +[IMRGLog sms];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Setting test data on preflight message { testData: %@ }", buf, 0xCu);
    }

    [(IDSPreflightMessage *)v9 setTestData:v24];
  }
  uint64_t v26 = +[IMRGLog sms];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Setting IMSI and PLMN on preflight message { IMSI: %@, PLMN: %@ }", buf, 0x16u);
  }

  if (v6) {
    [(IDSPreflightMessage *)v9 setIMSI:v6];
  }
  if (v7) {
    [(IDSPreflightMessage *)v9 setPLMN:v7];
  }
  sub_1001DE1A4();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100287200;
  v30[3] = &unk_100984250;
  v30[4] = self;
  id v31 = v6;
  id v32 = v7;
  id v27 = v7;
  id v28 = v6;
  [(IDSPreflightMessage *)v9 setCompletionBlock:v30];
  id v29 = [(IDSPhoneNumberValidationStateMachine *)self httpMessageDelivery];
  [v29 sendMessage:v9];

  ++self->_numberOfPreflights;
  -[IDSPhoneNumberValidationStateMachine persistNumberOfPreflightAttempts:](self, "persistNumberOfPreflightAttempts:");
}

- (void)_tryToSendSMSIdentification
{
  id v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t status = self->_status;
    *(_DWORD *)buf = 67109120;
    int v37 = status;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_tryToSendSMSIdentification   state: %d", buf, 8u);
  }

  if (!self->_status)
  {
    self->_int64_t status = 1;
    unsigned __int8 v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "7. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification", buf, 2u);
    }
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _isPhoneNumberIdentificationSupported])return; {
  id v6 = +[IMRGLog sms];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking if user has disabled SMS Registration", buf, 2u);
  }

  if ([(IDSPhoneNumberValidationStateMachine *)self _userHasDisabledSMSRegistration])
  {
    id v7 = +[IMRGLog sms];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone Number Validation has been disabled by the user", buf, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:35];
    return;
  }
  if ([(IDSPhoneNumberValidationStateMachine *)self _isAwaitingUserSelectionDuringSetup])
  {
    id v8 = +[IMRGLog sms];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Required user selection has not yet been set and system setup is in progress -- deferring SMS identification", buf, 2u);
    }

    double v9 = 20.0;
LABEL_18:
    [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:v9];
    return;
  }
  if (self->_status != 1)
  {
    v23 = +[IMRGLog sms];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    v24 = "     ==> We're not in the right state to being Phone Number Validation request identification, waiting...";
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_52;
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _deviceCanRegisterPresently])
  {
    v23 = +[IMRGLog sms];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    v24 = "     ==> Device can't register now, waiting...";
    goto LABEL_51;
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _validSIMStateForRegistration])
  {
    v23 = +[IMRGLog sms];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    v24 = "     ==> SIM is not ready to register, waiting...";
    goto LABEL_51;
  }
  if (self->_hasAcceptedSMSRequest
    || ([(IDSCTPNR *)self->_CTPNR userOptInRequired] & 1) == 0
    && !IDSDebuggingShouldFakeSMSCharge())
  {
    if ([(IDSPhoneNumberValidationStateMachine *)self _canDeliverSMSNow])
    {
      unsigned __int8 v10 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
      unsigned int v11 = [v10 isValidationModeLegacy];

      if (v11)
      {
        __int16 v12 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
        unsigned int v13 = [v12 maxAllowableNumberOfSuccessfullySentVerifications];

        if (self->_numberOfSuccessfulSends >= v13)
        {
          v33 = +[IMRGLog warning];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            sub_10071BC88(v13, v33);
          }

          [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:3];
          [(IDSPhoneNumberValidationStateMachine *)self resetSMSCounter];
          return;
        }
        unsigned int v14 = +[IMRGLog sms];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
          *(_DWORD *)buf = 67109376;
          int v37 = numberOfSuccessfulSends;
          __int16 v38 = 1024;
          unsigned int v39 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Haven't sent max number of SMS yet { sends: %d, maxSMSSends: %d }", buf, 0xEu);
        }
      }
      if (!self->_phoneNumberValidationStartDate)
      {
        long long v16 = (NSDate *)objc_alloc_init((Class)NSDate);
        phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
        self->_phoneNumberValidationStartDate = v16;
      }
      self->_int64_t status = 2;
      int v18 = +[IMRGLog sms];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "8. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationDelivery", buf, 2u);
      }

      __int16 v19 = +[NSString stringWithFormat:@"Trying to send phone number validation request { preflights: %d, sends: %d, attemptsWithoutSend: %d }", self->_numberOfPreflights, self->_numberOfSuccessfulSends, self->_numberOfAttemptsWithoutSuccessfulSend];
      sub_1001484DC(0, @"Registration attempt", v19, 0);

      __int16 v20 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
      unsigned int v21 = [v20 isValidationModeLegacy];

      if (v21)
      {
        id v22 = +[IMRGLog sms];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Preflight disabled; sending legacy phone number verification",
            buf,
            2u);
        }

        [(IDSPhoneNumberValidationStateMachine *)self _sendSMSVerificationWithMechanism:0];
      }
      else
      {
        id v27 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
        unsigned int v28 = [v27 isValidationModeShortCircuitingPreflight];

        id v29 = +[IMRGLog sms];
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Preflight short-circuiting; sending phone number verification with overrides",
              buf,
              2u);
          }

          id v31 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
          id v32 = [v31 preflightShortCircuitMechanismOverride];
          [(IDSPhoneNumberValidationStateMachine *)self _sendSMSVerificationWithMechanism:v32];
        }
        else
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Beginning preflight", buf, 2u);
          }

          [(IDSPhoneNumberValidationStateMachine *)self _sendPreflightVerificationIfNeeded];
        }
      }
      return;
    }
    v23 = +[IMRGLog sms];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "     ==> Can't send Phone Number Validation requests right now, need to wait for timeout, waiting...";
      goto LABEL_51;
    }
LABEL_52:

    [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledHeartbeat];
    return;
  }
  if (+[IDSRegistrationController isBuddyBlockingRegistration])
  {
    id v25 = +[IMRGLog sms];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Need to request user permission for SMS, but system setup is in progress -- deferring SMS identification", buf, 2u);
    }

    double v9 = 60.0;
    goto LABEL_18;
  }
  if (self->_isSMSWarningUp)
  {
    uint64_t v26 = +[IMRGLog sms];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Phone Number Validation Request Notification request is up", buf, 2u);
    }
  }
  else
  {
    self->_isSMSWarningUp = 1;
    id v34 = +[IMRGLog sms];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Should notify about Phone Number Validation requests for this carrier", buf, 2u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100287C3C;
    v35[3] = &unk_10097FE58;
    v35[4] = self;
    [(IDSPhoneNumberValidationStateMachine *)self _requestUserConsentForPhoneNumberValidationWithCompletion:v35];
  }
}

- (void)_requestUserConsentForPhoneNumberValidationWithCompletion:(id)a3
{
  requestors = self->_requestors;
  id v5 = a3;
  if ([(NSMutableArray *)requestors count])
  {
    id v7 = [(NSMutableArray *)self->_requestors firstObject];
    [v7 requestUserConsentToValidatePhoneNumberForCTPNR:self->_CTPNR completion:v5];
  }
  else
  {
    id v6 = +[IMRGLog sms];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No requestors are present for delegation of SMS permission", buf, 2u);
    }

    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (void)handleRegistrationSMSDeliveryFailed
{
}

- (void)handleRegistrationSMSDeliveryFailedWithShouldBypassRetry:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v26 = _os_activity_create((void *)&_mh_execute_header, "SMS registration handle SMS delivery failed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v26, &state);
  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledSMSTimeout];
  id v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int numberOfAttemptsWithoutSuccessfulSend = self->_numberOfAttemptsWithoutSuccessfulSend;
    unsigned int numberOfPreflights = self->_numberOfPreflights;
    unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
    *(_DWORD *)buf = 67109632;
    unsigned int v28 = numberOfPreflights;
    __int16 v29 = 1024;
    unsigned int v30 = numberOfSuccessfulSends;
    __int16 v31 = 1024;
    LODWORD(v32) = numberOfAttemptsWithoutSuccessfulSend;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration request failed delivery { preflights: %d, sends: %d, attemptsWithoutSend: %d }", buf, 0x14u);
  }

  if ([(NSMutableArray *)self->_requestors count])
  {
    double v9 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
    unsigned int v10 = [v9 maxAllowableNumberOfValidationAttemptsWhileNoneHaveSentSuccessfully];

    if (self->_numberOfAttemptsWithoutSuccessfulSend < v10 && !v3)
    {
      unsigned int v11 = +[IMRGLog sms];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = self->_numberOfAttemptsWithoutSuccessfulSend;
        *(_DWORD *)buf = 67109376;
        unsigned int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrying this validation { attemptsWithoutSuccessfulSend: %d, maxRetries: %d }", buf, 0xEu);
      }

      unsigned int v13 = +[NSString stringWithFormat:@"Failed sending registration Phone Number Validation request #%d, trying again", self->_numberOfSuccessfulSends];
      sub_1001484DC(0, @"Failed Sending Phone Number Validation", v13, 1073);

      ++self->_numberOfAttemptsWithoutSuccessfulSend;
      self->_int64_t status = 1;
      unsigned int v14 = +[IMRGLog sms];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "9. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification", buf, 2u);
      }

      int64_t v15 = 1;
      goto LABEL_25;
    }
    int v17 = +[IMRGLog sms];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = self->_numberOfAttemptsWithoutSuccessfulSend;
      CFStringRef v19 = @"NO";
      *(_DWORD *)buf = 67109634;
      if (v3) {
        CFStringRef v19 = @"YES";
      }
      unsigned int v28 = v18;
      __int16 v29 = 1024;
      unsigned int v30 = v10;
      __int16 v31 = 2112;
      CFStringRef v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not retrying this validation { attemptsWithoutSuccessfulSend: %d, maxRetries: %d, shouldBypassRetry: %@ }", buf, 0x18u);
    }

    self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = 0;
    __int16 v20 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
    unsigned __int8 v21 = [v20 isValidationModeLegacy];

    if ((v21 & 1) == 0)
    {
      [(IDSPhoneNumberValidationStateMachine *)self _popHighestPriorityPreflightVerification];
      self->_int64_t status = 1;
      int64_t v15 = 2;
LABEL_25:
      self->_reason = v15;
      [(IDSPhoneNumberValidationStateMachine *)self _scheduleHeartbeat:20.0];
      goto LABEL_26;
    }
    id v22 = +[IMRGLog sms];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Max retries consumed -- failing phone number validation", buf, 2u);
    }

    self->_int64_t status = 0;
    v23 = +[IMRGLog sms];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "10. Setting SMS status to: IDSSMSIdentificationStatusIdle", buf, 2u);
    }

    v24 = +[NSString stringWithFormat:@"Failed sending registration Phone Number Validation request #%d, giving up", self->_numberOfSuccessfulSends];
    sub_1001484DC(0, @"Failed Phone Number Validation", v24, 1073);

    [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:4];
  }
  else
  {
    long long v16 = +[IMRGLog sms];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No requestors -- we must have been cancelled", buf, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:0];
  }
LABEL_26:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)handleRegistrationSMSSuccessfullyDeliveredWithTelephonyTimeout:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v18 = _os_activity_create((void *)&_mh_execute_header, "SMS registration center handle SMS successfully delivered", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledSMSTimeout];
  id v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration request successfully delivered", buf, 2u);
  }

  if ([(NSMutableArray *)self->_requestors count])
  {
    ++self->_numberOfSuccessfulSends;
    -[IDSPhoneNumberValidationStateMachine persistNumberOfSuccessfulValidationSends:](self, "persistNumberOfSuccessfulValidationSends:");
    self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = 0;
    [(IDSPhoneNumberValidationStateMachine *)self _popHighestPriorityPreflightVerification];
    id v6 = +[NSString stringWithFormat:@"Succeeded sending registration Phone Number Validation request #%d", self->_numberOfSuccessfulSends];
    sub_1001484DC(0, @"Phone Number Validation Sending", v6, 1004);

    self->_int64_t status = 3;
    id v7 = +[IMRGLog sms];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "11. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationResponse", buf, 2u);
    }

    [v4 doubleValue];
    if (v8 <= 5.0)
    {
      double v11 = 1800.0;
    }
    else
    {
      double v9 = +[IMRGLog sms];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v20 = *(double *)&v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using telephony-provided timeout { telephonyTimeout: %@ }", buf, 0xCu);
      }

      [v4 doubleValue];
      double v11 = v10;
    }
    unsigned int v13 = [(IDSPhoneNumberValidationStateMachine *)self arbiter];
    [v13 minimumIntervalBetweenValidationAttempts];
    double v15 = v14;

    if (v11 <= v15) {
      double v11 = v15;
    }
    long long v16 = +[IMRGLog sms];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      double v20 = v11;
      __int16 v21 = 2048;
      double v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 0x409C200000000000;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting timeout for Phone Number Validation Request { timeoutInSeconds: %f, minimumReasonableTimeout: %f, defaultTimeout: %f, telephonyTimeout: %@ }", buf, 0x2Au);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _scheduleSMSTimeout:v11];
  }
  else
  {
    unsigned int v12 = +[IMRGLog sms];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No requestors -- we must have been cancelled", buf, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _notifyFailureWithError:0];
    [(IDSPhoneNumberValidationStateMachine *)self resetSMSCounter];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)handleIncomingSMSForResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 phoneNumber];
  id v6 = [v4 signature];
  __int16 v29 = _os_activity_create((void *)&_mh_execute_header, "SMS registration center handle incoming SMS", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v29, &state);
  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledSMSTimeout];
  id v7 = +[IMRGLog sms];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received registration request response SMS", buf, 2u);
  }

  double v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412546;
    __int16 v31 = v5;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone number: %@     Class: %@", buf, 0x16u);
  }
  double v11 = +[IMRGLog sms];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = (objc_class *)objc_opt_class();
    unsigned int v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    __int16 v31 = v6;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Signature: %@        Class: %@", buf, 0x16u);
  }
  sub_1001484DC(0, @"Registration SMS", @"Received registration SMS", 1007);
  double v14 = +[NSDate date];
  [v14 timeIntervalSinceDate:self->_smsSendDate];
  double v16 = v15;

  int v17 = +[NSNumber numberWithDouble:v16];
  FTAWDLogRegistrationPhoneNumberReceivedSMS();

  id v18 = objc_alloc((Class)IDSRegistrationPhoneNumberReceivedSMSMetric);
  CFStringRef v19 = +[NSNumber numberWithDouble:v16];
  id v20 = [v18 initWithGuid:0 smsRoundTripDuration:v19];

  __int16 v21 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v21 logMetric:v20];

  smsSendDate = self->_smsSendDate;
  self->_smsSendDate = 0;

  if ((id)[(IDSPhoneNumberValidationStateMachine *)self status] == (id)3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_int64_t status = 0;
        __int16 v23 = +[IMRGLog sms];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "12. Setting SMS status to: IDSSMSIdentificationStatusIdle", buf, 2u);
        }

        id v25 = v4;
        im_dispatch_after_primary_queue();
      }
      else
      {
        id v26 = v6;
        im_dispatch_after_primary_queue();
      }
    }
    else
    {
      id v27 = v5;
      im_dispatch_after_primary_queue();
    }
  }
  else
  {
    uint64_t v24 = +[IMRGLog sms];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Discarding registration request response, because we are not in the correct state to accept it", buf, 2u);
    }
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)resetSMSCounter
{
  if (self->_numberOfSuccessfulSends)
  {
    BOOL v3 = +[IMRGLog sms];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
      int v7 = 67109120;
      unsigned int v8 = numberOfSuccessfulSends;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting Phone Number Validation Attempt counter from %d to 0", (uint8_t *)&v7, 8u);
    }

    self->_unsigned int numberOfSuccessfulSends = 0;
  }
  if (self->_numberOfPreflights)
  {
    id v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfPreflights = self->_numberOfPreflights;
      int v7 = 67109120;
      unsigned int v8 = numberOfPreflights;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting Phone Number Preflight attempts to 0 { _numberOfPreflights : %d }", (uint8_t *)&v7, 8u);
    }

    self->_unsigned int numberOfPreflights = 0;
  }
  [(IDSPhoneNumberValidationStateMachine *)self setCurrentPreflightStack:0];
  [(IDSPhoneNumberValidationStateMachine *)self persistNumberOfSuccessfulValidationSends:0];
  [(IDSPhoneNumberValidationStateMachine *)self persistNumberOfPreflightAttempts:0];
}

- (void)timedOutWaitingForSMS
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v20 = _os_activity_create((void *)&_mh_execute_header, "SMS registration center timed out waiting for SMS", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  BOOL v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timed out waiting for Phone Number Validation response", buf, 2u);
  }

  id v4 = +[IMRGLog sms];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending another", buf, 2u);
  }

  id v5 = [(IDSPhoneNumberValidationStateMachine *)self _getHighestPriorityMechanism];
  id v6 = v5;
  if (v5 && [v5 type] == (id)1)
  {
    id v7 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        double v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          unsigned int v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
          if (objc_opt_respondsToSelector()) {
            [v12 validator:self handleABCEvent:204];
          }
          double v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v9);
    }
  }
  unsigned int v13 = +[NSString stringWithFormat:@"Timed out waiting for Phone Number Validation request #%d", self->_numberOfSuccessfulSends];
  sub_1001484DC(0, @"Phone Number Validation Timeout", v13, 1073);

  [(IDSPhoneNumberValidationStateMachine *)self handleRegistrationSMSDeliveryFailed];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = +[NSMutableArray nonRetainingArray];
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    [(NSMutableArray *)handlers addObject:v7];
  }
}

- (void)removeListener:(id)a3
{
}

- (void)addPhoneNumberValidationRequestor:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestors = self->_requestors;
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = requestors;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding phone number valiation requestor { requestor: %@, requestors: %@ }", (uint8_t *)&v7, 0x16u);
  }

  if (v4 && ([(NSMutableArray *)self->_requestors containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_requestors addObject:v4];
  }
  if ([(NSMutableArray *)self->_requestors count]) {
    [(IDSPhoneNumberValidationStateMachine *)self _tryToSendSMSIdentification];
  }
}

- (id)identifyPhoneNumberForRequestor:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)CUTPromiseSeal) initWithQueue:v6];

  [(NSMutableArray *)self->_promises addObject:v8];
  [(IDSPhoneNumberValidationStateMachine *)self addPhoneNumberValidationRequestor:v7];

  __int16 v9 = [v8 promise];

  return v9;
}

- (void)removePhoneNumberValidationRequestor:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog sms];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestors = self->_requestors;
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    double v11 = requestors;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing phone number valiation requestor { requestor: %@, requestors: %@ }", (uint8_t *)&v8, 0x16u);
  }

  if (v4 && [(NSMutableArray *)self->_requestors containsObject:v4]) {
    [(NSMutableArray *)self->_requestors removeObject:v4];
  }
  if (![(NSMutableArray *)self->_requestors count])
  {
    self->_int64_t status = 0;
    id v7 = +[IMRGLog sms];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "13. Setting SMS status to: IDSSMSIdentificationStatusIdle", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)heartbeat
{
  BOOL v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Heartbeat", (uint8_t *)v13, 2u);
  }

  [(IDSPhoneNumberValidationStateMachine *)self _cancelScheduledHeartbeat];
  if (_IMWillLog())
  {
    switch(self->_status)
    {
      case 0:
        id v4 = +[IMRGLog sms];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          id v5 = "    State: Idle";
          goto LABEL_15;
        }
        break;
      case 1:
        id v4 = +[IMRGLog sms];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          id v5 = "    State: Waiting to begin Phone Number Validation request identity verification";
          goto LABEL_15;
        }
        break;
      case 2:
        id v4 = +[IMRGLog sms];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          id v5 = "    State: Waiting for Phone Number Validation request identity delivery";
          goto LABEL_15;
        }
        break;
      case 3:
        id v4 = +[IMRGLog sms];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13[0]) = 0;
          id v5 = "    State: Waiting for Phone Number Validation request identity response";
LABEL_15:
          id v7 = v4;
          uint32_t v8 = 2;
          goto LABEL_16;
        }
        break;
      default:
        id v4 = +[IMRGLog sms];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int64_t status = self->_status;
          v13[0] = 67109120;
          v13[1] = status;
          id v5 = "    State: Unknown: %d";
          id v7 = v4;
          uint32_t v8 = 8;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v13, v8);
        }
        break;
    }
  }
  int64_t v9 = self->_status;
  if (v9 == 3)
  {
    __int16 v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      double v11 = "     ==> Waiting for identity response, waiting...";
      goto LABEL_37;
    }
LABEL_38:

    return;
  }
  if (!v9)
  {
    __int16 v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      double v11 = "     ==> We're idle, ending this heartbeat madness now";
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v13, 2u);
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _deviceCanRegisterPresently])
  {
    __int16 v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      double v11 = "     ==> Device can't register now, waiting...";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _validSIMStateForRegistration])
  {
    __int16 v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      double v11 = "     ==> SIM is not ready to register, waiting...";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  if (![(IDSPhoneNumberValidationStateMachine *)self _isPhoneNumberIdentificationSupported])
  {
    __int16 v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      double v11 = "     ==> Registration is not supported, skipping heartbeat";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  if (self->_status == 1)
  {
    unsigned int v12 = +[IMRGLog sms];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "     ==> Waiting to begin SMS, starting now", (uint8_t *)v13, 2u);
    }

    [(IDSPhoneNumberValidationStateMachine *)self _tryToSendSMSIdentification];
  }
}

- (unsigned)loadNumberOfSuccessfulValidationSends
{
  return IMGetCachedDomainIntForKey();
}

- (void)persistNumberOfSuccessfulValidationSends:(unsigned int)a3
{
}

- (unsigned)loadNumberOfPreflightAttempts
{
  return IMGetCachedDomainIntForKey();
}

- (void)persistNumberOfPreflightAttempts:(unsigned int)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (IDSPhoneNumberValidationStateMachineMessageDelivery)httpMessageDelivery
{
  return self->_httpMessageDelivery;
}

- (void)setHttpMessageDelivery:(id)a3
{
}

- (IDSPhoneNumberValidationStateMachineLockdownManager)lockdownManager
{
  return self->_lockdownManager;
}

- (void)setLockdownManager:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSPhoneNumberValidationModeArbiter)arbiter
{
  return self->_arbiter;
}

- (void)setArbiter:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSPreflightStackStore)preflighStackStore
{
  return self->_preflighStackStore;
}

- (void)setPreflighStackStore:(id)a3
{
}

- (id)inFlightHeartbeatBlock
{
  return self->_inFlightHeartbeatBlock;
}

- (void)setInFlightHeartbeatBlock:(id)a3
{
}

- (id)inFlightSMSTimeoutBlock
{
  return self->_inFlightSMSTimeoutBlock;
}

- (void)setInFlightSMSTimeoutBlock:(id)a3
{
}

- (IDSCTPNR)CTPNR
{
  return self->_CTPNR;
}

- (void)setCTPNR:(id)a3
{
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (unsigned)numberOfSuccessfulSends
{
  return self->_numberOfSuccessfulSends;
}

- (void)setNumberOfSuccessfulSends:(unsigned int)a3
{
  self->_unsigned int numberOfSuccessfulSends = a3;
}

- (unsigned)numberOfAttemptsWithoutSuccessfulSend
{
  return self->_numberOfAttemptsWithoutSuccessfulSend;
}

- (void)setNumberOfAttemptsWithoutSuccessfulSend:(unsigned int)a3
{
  self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = a3;
}

- (unsigned)numberOfPreflights
{
  return self->_numberOfPreflights;
}

- (void)setNumberOfPreflights:(unsigned int)a3
{
  self->_unsigned int numberOfPreflights = a3;
}

- (BOOL)isSMSWarningUp
{
  return self->_isSMSWarningUp;
}

- (void)setIsSMSWarningUp:(BOOL)a3
{
  self->_isSMSWarningUp = a3;
}

- (BOOL)hasAcceptedSMSRequest
{
  return self->_hasAcceptedSMSRequest;
}

- (void)setHasAcceptedSMSRequest:(BOOL)a3
{
  self->_hasAcceptedSMSRequest = a3;
}

- (BOOL)commCenterDead
{
  return self->_commCenterDead;
}

- (void)setCommCenterDead:(BOOL)a3
{
  self->_commCenterDead = a3;
}

- (BOOL)needsToCheckPhoneNumberState
{
  return self->_needsToCheckPhoneNumberState;
}

- (void)setNeedsToCheckPhoneNumberState:(BOOL)a3
{
  self->_needsToCheckPhoneNumberState = a3;
}

- (BOOL)didReceiveSIMSetupCompleteNotification
{
  return self->_didReceiveSIMSetupCompleteNotification;
}

- (void)setDidReceiveSIMSetupCompleteNotification:(BOOL)a3
{
  self->_BOOL didReceiveSIMSetupCompleteNotification = a3;
}

- (NSDate)nextSendSMSDate
{
  return self->_nextSendSMSDate;
}

- (void)setNextSendSMSDate:(id)a3
{
}

- (NSDate)phoneNumberValidationStartDate
{
  return self->_phoneNumberValidationStartDate;
}

- (void)setPhoneNumberValidationStartDate:(id)a3
{
}

- (NSDate)smsSendDate
{
  return self->_smsSendDate;
}

- (void)setSmsSendDate:(id)a3
{
}

- (IMTimer)lastSendSMSTimer
{
  return self->_lastSendSMSTimer;
}

- (void)setLastSendSMSTimer:(id)a3
{
}

- (IDSPersistentMap)dailyMetricData
{
  return self->_dailyMetricData;
}

- (void)setDailyMetricData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyMetricData, 0);
  objc_storeStrong((id *)&self->_nextSendSMSDate, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_CTPNR, 0);
  objc_storeStrong(&self->_inFlightSMSTimeoutBlock, 0);
  objc_storeStrong(&self->_inFlightHeartbeatBlock, 0);
  objc_storeStrong((id *)&self->_preflighStackStore, 0);
  objc_storeStrong((id *)&self->_systemAccountAdapter, 0);
  objc_storeStrong((id *)&self->_arbiter, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_lockdownManager, 0);
  objc_storeStrong((id *)&self->_httpMessageDelivery, 0);
  objc_storeStrong((id *)&self->_lastSendSMSTimer, 0);
  objc_storeStrong((id *)&self->_smsSendDate, 0);
  objc_storeStrong((id *)&self->_phoneNumberValidationStartDate, 0);
  objc_storeStrong((id *)&self->_promises, 0);
  objc_storeStrong((id *)&self->_requestors, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_pushHandler, 0);
}

@end