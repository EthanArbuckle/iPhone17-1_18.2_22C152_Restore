@interface IDSSMSRegistrationCenter
+ (id)sharedInstance;
- (BOOL)_hasThresholdReachedForSMSTimeoutForIdentifier:(id)a3;
- (IDSPreflightStackStore)preflightStackStore;
- (IDSPushHandler)pushHandler;
- (IDSRateLimiter)registrationAttemptRateLimiter;
- (IDSRateLimiter)smallWindowSMSTimeoutRateLimiter;
- (IDSRateLimiter)wideWindowSMSTimeoutRateLimiter;
- (IDSRegistrationReasonTracker)registrationReasonTracker;
- (IDSRestoreMonitor)restoreMonitor;
- (IDSSMSRegistrationCenter)init;
- (IDSSMSRegistrationCenter)initWithRestoreMonitor:(id)a3 systemMonitor:(id)a4;
- (IDSUserStore)userStore;
- (IMSystemMonitor)systemMonitor;
- (NSArray)validators;
- (NSMapTable)CTPNRByConsentCompletion;
- (NSMutableArray)handlers;
- (NSMutableArray)registrations;
- (NSMutableDictionary)stateMachineByUserID;
- (NSMutableSet)userConsentDeniedForCTPNR;
- (id)_identifierForValidator:(id)a3;
- (void)_cleanupUntrackedValidators;
- (void)_clearConsentDenialsForUniqueIdentifier:(id)a3;
- (void)_noteRegistrationAttemptForIdentifier:(id)a3 withRegistrationInfo:(id)a4;
- (void)_notifyFailureWithError:(int64_t)a3 registration:(id)a4 identifier:(id)a5;
- (void)_notifyNeedsNewIdentification;
- (void)_notifySuccess:(id)a3 token:(id)a4 identifier:(id)a5;
- (void)_postPendingConsentAlerts;
- (void)_reportDailyPNRStatusForSimSlot:(unint64_t)a3;
- (void)_resetRateLimitersForSMSTimeoutForIdentifier:(id)a3;
- (void)_sendABCForFailureForIdentifier:(id)a3 WithEvent:(int64_t)a4 context:(id)a5;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)clearConsentDenialsForPhoneUser:(id)a3;
- (void)clearConsentDenialsForRegistration:(id)a3;
- (void)dealloc;
- (void)notePhoneNumberRegistrationReset;
- (void)removeListener:(id)a3;
- (void)reportDailyMetric;
- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4;
- (void)sendRegistration:(id)a3;
- (void)setCTPNRByConsentCompletion:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setRegistrationAttemptRateLimiter:(id)a3;
- (void)setRegistrationReasonTracker:(id)a3;
- (void)setRestoreMonitor:(id)a3;
- (void)setSmallWindowSMSTimeoutRateLimiter:(id)a3;
- (void)setStateMachineByUserID:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUserConsentDeniedForCTPNR:(id)a3;
- (void)setWideWindowSMSTimeoutRateLimiter:(id)a3;
- (void)validator:(id)a3 failedIdentificationWithRegistrationError:(int64_t)a4;
- (void)validator:(id)a3 handleABCEvent:(int64_t)a4;
- (void)validator:(id)a3 identifiedPhoneNumber:(id)a4 token:(id)a5 phoneBookNumber:(id)a6;
@end

@implementation IDSSMSRegistrationCenter

+ (id)sharedInstance
{
  if (qword_100A4A8A8 != -1) {
    dispatch_once(&qword_100A4A8A8, &stru_1009845A8);
  }
  v2 = (void *)qword_100A4A8B0;

  return v2;
}

- (NSArray)validators
{
  return (NSArray *)[(NSMutableDictionary *)self->_stateMachineByUserID allValues];
}

- (IDSUserStore)userStore
{
  v2 = +[IDSDaemon sharedInstance];
  v3 = [v2 registrationConductor];
  v4 = [v3 userStore];

  return (IDSUserStore *)v4;
}

- (IDSRegistrationReasonTracker)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance];
}

- (IDSSMSRegistrationCenter)init
{
  v3 = +[IDSRestoreMonitor sharedInstance];
  v4 = +[IMSystemMonitor sharedInstance];
  v5 = [(IDSSMSRegistrationCenter *)self initWithRestoreMonitor:v3 systemMonitor:v4];

  return v5;
}

- (IDSSMSRegistrationCenter)initWithRestoreMonitor:(id)a3 systemMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IDSSMSRegistrationCenter;
  v9 = [(IDSSMSRegistrationCenter *)&v27 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    registrations = v9->_registrations;
    v9->_registrations = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stateMachineByUserID = v9->_stateMachineByUserID;
    v9->_stateMachineByUserID = v12;

    v14 = (IDSPreflightStackStore *)objc_alloc_init((Class)NSMutableDictionary);
    preflightStackStore = v9->_preflightStackStore;
    v9->_preflightStackStore = v14;

    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    userConsentDeniedForCTPNR = v9->_userConsentDeniedForCTPNR;
    v9->_userConsentDeniedForCTPNR = v16;

    uint64_t v18 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    pushHandler = v9->_pushHandler;
    v9->_pushHandler = (IDSPushHandler *)v18;

    objc_storeStrong((id *)&v9->_restoreMonitor, a3);
    objc_storeStrong((id *)&v9->_systemMonitor, a4);
    v20 = (IDSRateLimiter *)[objc_alloc((Class)IDSRateLimiter) initWithLimit:3 timeLimit:10800.0];
    smallWindowSMSTimeoutRateLimiter = v9->_smallWindowSMSTimeoutRateLimiter;
    v9->_smallWindowSMSTimeoutRateLimiter = v20;

    v22 = (IDSRateLimiter *)[objc_alloc((Class)IDSRateLimiter) initWithLimit:10 timeLimit:259200.0];
    wideWindowSMSTimeoutRateLimiter = v9->_wideWindowSMSTimeoutRateLimiter;
    v9->_wideWindowSMSTimeoutRateLimiter = v22;

    v24 = (IDSRateLimiter *)[objc_alloc((Class)IDSRateLimiter) initWithLimit:10 timeLimit:259200.0];
    registrationAttemptRateLimiter = v9->_registrationAttemptRateLimiter;
    v9->_registrationAttemptRateLimiter = v24;
  }
  return v9;
}

- (void)dealloc
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSMutableDictionary *)self->_stateMachineByUserID allValues];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) removeListener:self];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:FTUserConfigurationSelectedSubscriptionLabelDidChange object:0];

  v9.receiver = self;
  v9.super_class = (Class)IDSSMSRegistrationCenter;
  [(IDSSMSRegistrationCenter *)&v9 dealloc];
}

- (void)sendRegistration:(id)a3
{
  id v4 = (IDSSMSRegistrationCenter *)a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(IDSSMSRegistrationCenter *)v4 userUniqueIdentifier];

    if (v6)
    {
      if (([(NSMutableArray *)self->_registrations containsObjectIdenticalTo:v5] & 1) == 0)
      {
        [(NSMutableArray *)self->_registrations addObject:v5];
        id v7 = +[IMRGLog sms];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [(IDSSMSRegistrationCenter *)self pushHandler];
          objc_super v9 = [v8 pushToken];
          int v26 = 138412290;
          objc_super v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Push handler returned push token: %@", (uint8_t *)&v26, 0xCu);
        }
        long long v10 = [(IDSSMSRegistrationCenter *)self pushHandler];
        long long v11 = [v10 pushToken];
        [(IDSSMSRegistrationCenter *)v5 setPushToken:v11];

        long long v12 = +[IMRGLog sms];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          long long v13 = [(IDSSMSRegistrationCenter *)v5 pushToken];
          int v26 = 138412546;
          objc_super v27 = v5;
          __int16 v28 = 2112;
          v29 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting Phone Number Validation request for %@   with token: %@", (uint8_t *)&v26, 0x16u);
        }
        v14 = [(IDSSMSRegistrationCenter *)v5 userUniqueIdentifier];
        v15 = [(IDSSMSRegistrationCenter *)self userStore];
        v16 = [v15 userWithUniqueIdentifier:v14];

        if (v16)
        {
          v17 = +[IDSCTAdapter sharedInstance];
          uint64_t v18 = [v17 SIMForIdentifier:v14];

          if (v18)
          {
            v19 = +[IDSCTAdapter sharedInstance];
            v20 = [v19 CTPNRForSIM:v18];

            userConsentDeniedForCTPNR = self->_userConsentDeniedForCTPNR;
            v22 = [v20 uniqueIdentifier];
            LODWORD(userConsentDeniedForCTPNR) = [(NSMutableSet *)userConsentDeniedForCTPNR containsObject:v22];

            if (userConsentDeniedForCTPNR)
            {
              v23 = +[IMRGLog sms];
              if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR)) {
                sub_1007140AC((uint64_t)self, v20, &v23->super);
              }
            }
            else
            {
              v23 = [(NSMutableDictionary *)self->_stateMachineByUserID objectForKeyedSubscript:v14];
              if (!v23)
              {
                v23 = [[IDSPhoneNumberValidationStateMachine alloc] initWithCTPNR:v20 preflightStackStore:self->_preflightStackStore];
                v24 = [(IDSSMSRegistrationCenter *)self registrationReasonTracker];
                -[IDSPhoneNumberValidationStateMachine setReason:](v23, "setReason:", [v24 getPNRReasonForUserUniqueIdentifier:v14]);

                [(IDSPhoneNumberValidationStateMachine *)v23 addListener:self];
                [(NSMutableDictionary *)self->_stateMachineByUserID setObject:v23 forKeyedSubscript:v14];
                v25 = +[IMRGLog sms];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  int v26 = 138412546;
                  objc_super v27 = self;
                  __int16 v28 = 2112;
                  v29 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Adding new validations state machine {self: %@, uniqueIdentifier: %@}", (uint8_t *)&v26, 0x16u);
                }
              }
              [(IDSSMSRegistrationCenter *)self _noteRegistrationAttemptForIdentifier:v14 withRegistrationInfo:v5];
              [(IDSPhoneNumberValidationStateMachine *)v23 addPhoneNumberValidationRequestor:self];
            }
          }
          else
          {
            uint64_t v18 = +[IMRGLog sms];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100714044();
            }
          }
        }
        else
        {
          uint64_t v18 = +[IMRGLog sms];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100713FDC();
          }
        }
      }
    }
  }
}

- (void)_cleanupUntrackedValidators
{
  v3 = [(NSMutableArray *)self->_registrations __imArrayByApplyingBlock:&stru_1009845E8];
  id v4 = objc_msgSend(v3, "__imSetFromArray");

  id v5 = [(NSMutableDictionary *)self->_stateMachineByUserID allKeys];
  uint64_t v6 = objc_msgSend(v5, "__imSetFromArray");
  id v7 = [v6 mutableCopy];

  [v7 minusSet:v4];
  id v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [(NSMutableDictionary *)self->_stateMachineByUserID allKeys];
    registrations = self->_registrations;
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 2112;
    objc_super v27 = v4;
    __int16 v28 = 2112;
    v29 = v9;
    __int16 v30 = 2112;
    v31 = registrations;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_cleanupUntrackedValidators {self: %@, remainingUsers: %@, _stateMachineByUserIDKeys: %@, _registrations: %@}", buf, 0x2Au);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17 = [(NSMutableDictionary *)self->_stateMachineByUserID objectForKeyedSubscript:v16];
        [v17 removePhoneNumberValidationRequestor:self];
        uint64_t v18 = +[IMRGLog sms];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = self;
          __int16 v26 = 2112;
          objc_super v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing self as a phone number validation requestor {self: %@, uniqueIdentifier: %@}", buf, 0x16u);
        }

        [v17 invalidate];
        [(NSMutableDictionary *)self->_stateMachineByUserID setObject:0 forKeyedSubscript:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

- (void)clearConsentDenialsForRegistration:(id)a3
{
  id v4 = [a3 userUniqueIdentifier];
  [(IDSSMSRegistrationCenter *)self _clearConsentDenialsForUniqueIdentifier:v4];
}

- (void)clearConsentDenialsForPhoneUser:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  [(IDSSMSRegistrationCenter *)self _clearConsentDenialsForUniqueIdentifier:v4];
}

- (void)_clearConsentDenialsForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSCTAdapter sharedInstance];
  id v12 = [v5 SIMForIdentifier:v4];

  uint64_t v6 = +[IDSCTAdapter sharedInstance];
  id v7 = [v6 CTPNRForSIM:v12];

  userConsentDeniedForCTPNR = self->_userConsentDeniedForCTPNR;
  objc_super v9 = [v7 uniqueIdentifier];
  LODWORD(userConsentDeniedForCTPNR) = [(NSMutableSet *)userConsentDeniedForCTPNR containsObject:v9];

  if (userConsentDeniedForCTPNR)
  {
    long long v10 = self->_userConsentDeniedForCTPNR;
    id v11 = [v7 uniqueIdentifier];
    [(NSMutableSet *)v10 removeObject:v11];
  }
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObjectIdenticalTo:](self->_registrations, "containsObjectIdenticalTo:"))
  {
    [(NSMutableArray *)self->_registrations removeObjectIdenticalTo:v4];
    [(IDSSMSRegistrationCenter *)self _notifyFailureWithError:0 registration:v4 identifier:0];
    [(IDSSMSRegistrationCenter *)self _cleanupUntrackedValidators];
  }
}

- (void)reportDailyMetric
{
  [(IDSSMSRegistrationCenter *)self _reportDailyPNRStatusForSimSlot:0];

  [(IDSSMSRegistrationCenter *)self _reportDailyPNRStatusForSimSlot:1];
}

- (void)_reportDailyPNRStatusForSimSlot:(unint64_t)a3
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = +[IDSCTAdapter sharedInstance];
  id v5 = [v4 currentSIMsWithError:0];

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    while (2)
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v32 + 1) + 8 * (void)v9) slot] == (id)a3)
        {

          id v11 = [IDSPersistentMap alloc];
          id v12 = +[NSString stringWithFormat:@"com.apple.identityservices.dailyPNRData.%lu", a3];
          v36[0] = objc_opt_class();
          v36[1] = objc_opt_class();
          id v13 = +[NSArray arrayWithObjects:v36 count:2];
          uint64_t v14 = +[NSSet setWithArray:v13];
          long long v10 = [(IDSPersistentMap *)v11 initWithIdentifier:v12 versionNumber:0 decodableClasses:v14 migrationBlock:0];

          id v15 = [v10 copyDictionaryRepresentation];
          v16 = +[IDSCTAdapter sharedInstance];
          id v17 = [v16 hasMultipleSIMs];

          uint64_t v18 = [v15 objectForKey:IDSPNRRegStatusMetricPNRdKey];
          id v19 = [v18 BOOLValue];

          long long v20 = [v15 objectForKey:IDSPNRRegStatusMetricPNRTimestampKey];
          [v20 doubleValue];
          double v22 = v21;

          v23 = +[IDSCurrentServerTime sharedInstance];
          [v23 currentServerTimeInterval];
          double v25 = v24;

          if (v25 - v22 >= 0.0) {
            double v26 = v25 - v22;
          }
          else {
            double v26 = -(v25 - v22);
          }
          objc_super v27 = [v15 objectForKey:IDSPNRRegStatusMetricPNRMechanismKey];
          __int16 v28 = 0;
          if (v26 <= 86400.0 && v19 != 0)
          {
            __int16 v28 = [v15 objectForKey:IDSPNRRegStatusMetricPNRErrorCodeKey];
          }
          id v30 = [objc_alloc((Class)IDSRegistrationDailyPNRStatusMetric) initWithPNRCurrentlyRegistered:v19 pnrRegisteredToday:v26 <= 86400.0 pnrMechanism:v27 errorCode:v28 hasMultipleSIMs:v17];
          v31 = +[IDSCoreAnalyticsLogger defaultLogger];
          [v31 logMetric:v30];

          goto LABEL_20;
        }
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v10 = +[IMRGLog sms];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v38 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No sim present in slot, not reporting anything. { simSlot: %lu }", buf, 0xCu);
  }
LABEL_20:
}

- (void)notePhoneNumberRegistrationReset
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_stateMachineByUserID allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetSMSCounter];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(IDSPreflightStackStore *)self->_preflightStackStore clearAllPreflightStacks];
}

- (void)_noteRegistrationAttemptForIdentifier:(id)a3 withRegistrationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = [v7 registrationStatus];
    __int16 v16 = 1024;
    unsigned int v17 = [v7 registrationType];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Noting registration attempt for user identifier {%@} with current registration state {%ld} of type {%d}", buf, 0x1Cu);
  }

  [(IDSRateLimiter *)self->_registrationAttemptRateLimiter noteItem:v6];
  if (+[IDSAutoBugCapture isSupported]
    && ([(IDSRateLimiter *)self->_registrationAttemptRateLimiter underLimitForItem:v6] & 1) == 0)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Registration attempted exceeded for user identifier {%@} with current registration state {%ld} of type {%d}", v6, [v7 registrationStatus], objc_msgSend(v7, "registrationType"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10018BCB0;
    v10[3] = &unk_100980830;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v11;
    +[IDSAutoBugCapture triggerCaptureWithEvent:205 context:v9 completion:v10];
    [(IDSRateLimiter *)self->_registrationAttemptRateLimiter clearItem:v6];
  }
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

- (void)_notifyFailureWithError:(int64_t)a3 registration:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v30 = a5;
  registrations = self->_registrations;
  objc_super v27 = v8;
  if (!v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [(NSMutableArray *)registrations copy];
    id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(id *)(*((void *)&v36 + 1) + 8 * i);
          id v19 = [v18 userUniqueIdentifier];
          unsigned int v20 = [v19 isEqualToString:v30];

          if (v20)
          {
            [v18 setRegistrationStatus:-1];
            id v21 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v22 = v21;
            id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v33;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v33 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  double v26 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                  if (objc_opt_respondsToSelector()) {
                    [v26 center:self failedIdentification:v18 error:a3];
                  }
                }
                id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
              }
              while (v23);
            }

            [(NSMutableArray *)self->_registrations removeObjectIdenticalTo:v18];
          }
        }
        id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v31);
    }
    id v12 = obj;
    id v10 = obj;
    goto LABEL_32;
  }
  if (([(NSMutableArray *)registrations containsObjectIdenticalTo:v8] & 1) == 0)
  {
    id v10 = v8;
    [(NSMutableArray *)self->_registrations removeObjectIdenticalTo:v10];
    [v10 setRegistrationStatus:-1];
    id v11 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      do
      {
        for (k = 0; k != v13; k = (char *)k + 1)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v12);
          }
          __int16 v16 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
          if (objc_opt_respondsToSelector()) {
            [v16 center:self failedIdentification:v10 error:a3];
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v13);
    }

LABEL_32:
  }
}

- (void)_notifySuccess:(id)a3 token:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  id v34 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableArray *)self->_registrations count])
  {
    id v10 = +[IDSPACStateTracker sharedInstance];
    [v10 notePNRSuccess];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v11 = self->_registrations;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v53;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          __int16 v16 = [v15 userUniqueIdentifier];
          unsigned int v17 = [v16 isEqualToString:v38];

          if (v17)
          {
            [v15 setAuthenticationCert:0];
            id v18 = +[IDSPACStateTracker sharedInstance];
            [v18 notePhoneAuthCertLost:7];

            [v15 setPhoneNumber:v8];
            [v15 setMainID:v8];
            [v15 setAuthenticationToken:v9];
            [v15 setRegistrationCert:0];
            [v15 setUris:0];
            id v19 = +[IMRGLog sms];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = v15;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating registration info: %@", buf, 0xCu);
            }

            [v34 addObject:v15];
          }
        }
        id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v11 = +[IMRGLog sms];
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v11->super.super, OS_LOG_TYPE_DEFAULT, "No registration info present, we must have been cancelled", buf, 2u);
    }
  }

  if ([(NSMutableArray *)self->_registrations count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v34;
    id v37 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v45;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v45 != v35)
          {
            uint64_t v21 = v20;
            objc_enumerationMutation(obj);
            uint64_t v20 = v21;
          }
          uint64_t v39 = v20;
          id v22 = *(id *)(*((void *)&v44 + 1) + 8 * v20);
          [(NSMutableArray *)self->_registrations removeObjectIdenticalTo:v22];
          if ([v22 isDisabled])
          {
            id v23 = +[IMRGLog registration];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = v22;
              _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Not reflecting back succeeded identification, registration is disabled: %@", buf, 0xCu);
            }
          }
          else
          {
            if ((uint64_t)[v22 registrationStatus] <= 5) {
              [v22 setRegistrationStatus:6];
            }
            id v24 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v23 = v24;
            id v25 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v41;
              do
              {
                for (j = 0; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v41 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  __int16 v28 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
                  if (objc_opt_respondsToSelector()) {
                    [v28 center:self succeededIdentification:v22 phoneNumber:v8 token:v9];
                  }
                }
                id v25 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
              }
              while (v25);
            }
          }
          uint64_t v20 = v39 + 1;
        }
        while ((id)(v39 + 1) != v37);
        id v37 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v37);
    }
  }
  else
  {
    id v29 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v29;
    id v30 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v49;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(obj);
          }
          long long v33 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
          if (objc_opt_respondsToSelector()) {
            [v33 center:self succeededIdentification:0 phoneNumber:v8 token:v9];
          }
        }
        id v30 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v30);
    }
  }
}

- (void)_notifyNeedsNewIdentification
{
  id v3 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 centerNeedsNewIdentification:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_identifierForValidator:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_stateMachineByUserID;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stateMachineByUserID, "objectForKeyedSubscript:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)validator:(id)a3 identifiedPhoneNumber:(id)a4 token:(id)a5 phoneBookNumber:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(IDSSMSRegistrationCenter *)self _identifierForValidator:a3];
  if (v12)
  {
    uint64_t v13 = [(IDSSMSRegistrationCenter *)self userStore];
    long long v14 = [v13 userWithUniqueIdentifier:v12];

    long long v15 = [v14 phoneUserWithUpdatedPhoneNumber:v21 phoneBookNumber:v11];

    long long v16 = [(IDSSMSRegistrationCenter *)self userStore];
    [v16 updateUser:v15];

    long long v17 = [[IDSPhoneUserCredential alloc] initWithSMSSignature:v10];
    id v18 = [(IDSSMSRegistrationCenter *)self userStore];
    [v18 setCredential:v17 forUser:v15];

    id v19 = [(IDSSMSRegistrationCenter *)self registrationReasonTracker];
    [v19 clearPNRReasonForUserUniqueIdentifier:v12];

    uint64_t v20 = [v15 uniqueIdentifier];
    [(IDSSMSRegistrationCenter *)self _notifySuccess:v21 token:v10 identifier:v20];
  }
  [(IDSSMSRegistrationCenter *)self _cleanupUntrackedValidators];
}

- (void)validator:(id)a3 failedIdentificationWithRegistrationError:(int64_t)a4
{
  id v7 = [(IDSSMSRegistrationCenter *)self _identifierForValidator:a3];
  if (v7)
  {
    id v6 = [(IDSSMSRegistrationCenter *)self registrationReasonTracker];
    [v6 clearPNRReasonForUserUniqueIdentifier:v7];
  }
  [(IDSSMSRegistrationCenter *)self _notifyFailureWithError:a4 registration:0 identifier:v7];
  [(IDSSMSRegistrationCenter *)self _cleanupUntrackedValidators];
}

- (void)validator:(id)a3 handleABCEvent:(int64_t)a4
{
  uint64_t v6 = [(IDSSMSRegistrationCenter *)self _identifierForValidator:a3];
  if (a4 == 204)
  {
    uint64_t v9 = v6;
    if (![(IDSSMSRegistrationCenter *)self _hasThresholdReachedForSMSTimeoutForIdentifier:v6])goto LABEL_7; {
    id v7 = +[NSString stringWithFormat:@"PNR Registration failed for Identifier: %@ Failure: SMS timeout threshold reached", v9];
    }
    [(IDSSMSRegistrationCenter *)self _sendABCForFailureForIdentifier:v9 WithEvent:204 context:v7];
    [(IDSSMSRegistrationCenter *)self _resetRateLimitersForSMSTimeoutForIdentifier:v9];
  }
  else
  {
    if (a4 != 203) {
      goto LABEL_7;
    }
    uint64_t v8 = v6;
    id v7 = +[NSString stringWithFormat:@"PNR Registration failed for Identifier: %@ Failure: SMS quota exhausted", v6];
    [(IDSSMSRegistrationCenter *)self _sendABCForFailureForIdentifier:v8 WithEvent:203 context:v7];
  }

LABEL_7:

  _objc_release_x1();
}

- (BOOL)_hasThresholdReachedForSMSTimeoutForIdentifier:(id)a3
{
  id v4 = a3;
  [(IDSRateLimiter *)self->_smallWindowSMSTimeoutRateLimiter noteItem:v4];
  [(IDSRateLimiter *)self->_wideWindowSMSTimeoutRateLimiter noteItem:v4];
  if ([(IDSRateLimiter *)self->_smallWindowSMSTimeoutRateLimiter underLimitForItem:v4])unsigned int v5 = [(IDSRateLimiter *)self->_wideWindowSMSTimeoutRateLimiter underLimitForItem:v4] ^ 1; {
  else
  }
    LOBYTE(v5) = 1;

  return v5;
}

- (void)_resetRateLimitersForSMSTimeoutForIdentifier:(id)a3
{
  smallWindowSMSTimeoutRateLimiter = self->_smallWindowSMSTimeoutRateLimiter;
  id v5 = a3;
  [(IDSRateLimiter *)smallWindowSMSTimeoutRateLimiter clearItem:v5];
  [(IDSRateLimiter *)self->_wideWindowSMSTimeoutRateLimiter clearItem:v5];
}

- (void)_sendABCForFailureForIdentifier:(id)a3 WithEvent:(int64_t)a4 context:(id)a5
{
  id v6 = a5;
  if (+[IDSAutoBugCapture isSupported])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10018D014;
    v7[3] = &unk_100980830;
    id v8 = v6;
    +[IDSAutoBugCapture triggerCaptureWithEvent:a4 context:v8 completion:v7];
  }
}

- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    uint64_t v9 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018D1F0;
    block[3] = &unk_100981860;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_after(v8, v9, block);
  }
}

- (void)_postPendingConsentAlerts
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(IDSSMSRegistrationCenter *)self CTPNRByConsentCompletion];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      dispatch_time_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        id v10 = +[IMRGLog sms];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing pending SMS alerts after restore {CTPNR: %@}", buf, 0xCu);
        }

        id v11 = [(IDSSMSRegistrationCenter *)self CTPNRByConsentCompletion];
        id v12 = [v11 objectForKey:v9];

        [(IDSSMSRegistrationCenter *)self requestUserConsentToValidatePhoneNumberForCTPNR:v9 completion:v12];
        dispatch_time_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  [(IDSSMSRegistrationCenter *)self setCTPNRByConsentCompletion:0];
}

- (IDSPushHandler)pushHandler
{
  return (IDSPushHandler *)+[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
}

- (NSMutableDictionary)stateMachineByUserID
{
  return self->_stateMachineByUserID;
}

- (void)setStateMachineByUserID:(id)a3
{
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (IDSPreflightStackStore)preflightStackStore
{
  return self->_preflightStackStore;
}

- (void)setPushHandler:(id)a3
{
}

- (NSMutableSet)userConsentDeniedForCTPNR
{
  return self->_userConsentDeniedForCTPNR;
}

- (void)setUserConsentDeniedForCTPNR:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSRestoreMonitor)restoreMonitor
{
  return self->_restoreMonitor;
}

- (void)setRestoreMonitor:(id)a3
{
}

- (NSMapTable)CTPNRByConsentCompletion
{
  return self->_CTPNRByConsentCompletion;
}

- (void)setCTPNRByConsentCompletion:(id)a3
{
}

- (IDSRateLimiter)smallWindowSMSTimeoutRateLimiter
{
  return self->_smallWindowSMSTimeoutRateLimiter;
}

- (void)setSmallWindowSMSTimeoutRateLimiter:(id)a3
{
}

- (IDSRateLimiter)wideWindowSMSTimeoutRateLimiter
{
  return self->_wideWindowSMSTimeoutRateLimiter;
}

- (void)setWideWindowSMSTimeoutRateLimiter:(id)a3
{
}

- (IDSRateLimiter)registrationAttemptRateLimiter
{
  return self->_registrationAttemptRateLimiter;
}

- (void)setRegistrationAttemptRateLimiter:(id)a3
{
}

- (void)setRegistrationReasonTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationReasonTracker, 0);
  objc_storeStrong((id *)&self->_registrationAttemptRateLimiter, 0);
  objc_storeStrong((id *)&self->_wideWindowSMSTimeoutRateLimiter, 0);
  objc_storeStrong((id *)&self->_smallWindowSMSTimeoutRateLimiter, 0);
  objc_storeStrong((id *)&self->_CTPNRByConsentCompletion, 0);
  objc_storeStrong((id *)&self->_restoreMonitor, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_userConsentDeniedForCTPNR, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_preflightStackStore, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_registrations, 0);

  objc_storeStrong((id *)&self->_stateMachineByUserID, 0);
}

@end