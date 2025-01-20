@interface IDSStewieCoordinator
- (BOOL)isStewieEnabled;
- (IDSRateLimiter)rateLimiter;
- (IDSServerBag)bag;
- (IDSStewieCTClient)ctClient;
- (IDSStewieCoordinator)initWithUserStore:(id)a3 bag:(id)a4 queue:(id)a5 systemMonitor:(id)a6;
- (IDSStewieDeviceInfoManager)deviceInfoManager;
- (IDSStewiePhoneNumberManager)phoneNumberManager;
- (IDSStewiePushHandler)pushHandler;
- (IDSStewieRequester)requester;
- (IDSStewieSessionKeyManager)sessionKeyManager;
- (IDSStewieStore)store;
- (IDSUserStore)userStore;
- (IMDispatchTimer)heartbeatTimer;
- (IMDispatchTimer)rollKeysTimer;
- (IMDispatchTimer)rollSMSConfigTimer;
- (IMSystemMonitor)systemMonitor;
- (OS_dispatch_queue)queue;
- (id)fetchCurrentState;
- (void)checkComponentsAtStartup;
- (void)clearAllState;
- (void)deviceInfoManager:(id)a3 deviceInfoChanged:(id)a4;
- (void)heartbeatTimerFired;
- (void)phoneNumberManager:(id)a3 phoneNumberInfosChanged:(id)a4;
- (void)pushHandler:(id)a3 receivedRollKeysPushWithDelay:(double)a4;
- (void)pushHandler:(id)a3 receivedRollSMSConfigPushWithDelay:(double)a4;
- (void)requester:(id)a3 receivedFailuresForPhoneNumberInfos:(id)a4;
- (void)requester:(id)a3 receivedFailuresForSessionKeyInfos:(id)a4;
- (void)requester:(id)a3 receivedSuccessForClearInfo:(id)a4;
- (void)requester:(id)a3 receivedSuccessForDeviceInfo:(id)a4;
- (void)requester:(id)a3 receivedSuccessForPhoneNumberInfos:(id)a4;
- (void)requester:(id)a3 receivedSuccessForSessionKeyInfos:(id)a4;
- (void)requester:(id)a3 succeededRequest:(id)a4;
- (void)rollAndClearKeys;
- (void)rollKeysTimerFired;
- (void)sessionKeyManager:(id)a3 sessionKeyInfosToUpdate:(id)a4;
- (void)sessionKeyManager:(id)a3 stewieMessageConfigChanged:(id)a4;
- (void)setBag:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDeviceInfoManager:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setPhoneNumberManager:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setRequester:(id)a3;
- (void)setRollKeysTimer:(id)a3;
- (void)setRollSMSConfigTimer:(id)a3;
- (void)setSessionKeyManager:(id)a3;
- (void)setStore:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUserStore:(id)a3;
@end

@implementation IDSStewieCoordinator

- (IDSStewieCoordinator)initWithUserStore:(id)a3 bag:(id)a4 queue:(id)a5 systemMonitor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)IDSStewieCoordinator;
  v15 = [(IDSStewieCoordinator *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userStore, a3);
    objc_storeStrong((id *)&v16->_queue, a5);
    v17 = [[IDSStewieCTClient alloc] initWithQueue:v13];
    ctClient = v16->_ctClient;
    v16->_ctClient = v17;

    v19 = [[IDSStewieSessionKeyManager alloc] initWithDelegate:v16 ctClient:v16->_ctClient];
    sessionKeyManager = v16->_sessionKeyManager;
    v16->_sessionKeyManager = v19;

    v21 = [[IDSStewiePushHandler alloc] initWithDelegate:v16 queue:v13 bag:v12 ctClient:v16->_ctClient];
    pushHandler = v16->_pushHandler;
    v16->_pushHandler = v21;

    v23 = objc_alloc_init(IDSStewieStore);
    store = v16->_store;
    v16->_store = v23;

    v25 = [[IDSStewieRequester alloc] initWithDelegate:v16 queue:v13 ctClient:v16->_ctClient store:v16->_store userStore:v11 bag:v12];
    requester = v16->_requester;
    v16->_requester = v25;

    objc_storeStrong((id *)&v16->_bag, a4);
    objc_storeStrong((id *)&v16->_systemMonitor, a6);
    heartbeatTimer = v16->_heartbeatTimer;
    v16->_heartbeatTimer = 0;

    rollKeysTimer = v16->_rollKeysTimer;
    v16->_rollKeysTimer = 0;

    id v29 = objc_alloc((Class)IDSRateLimiter);
    uint64_t v30 = sub_100422E10(v16);
    v31 = (IDSRateLimiter *)[v29 initWithLimit:v30 timeLimit:sub_100422E94(v16)];
    rateLimiter = v16->_rateLimiter;
    v16->_rateLimiter = v31;
  }
  return v16;
}

- (void)checkComponentsAtStartup
{
  v3 = [(IDSStewieCoordinator *)self systemMonitor];
  unsigned int v4 = [v3 isUnderFirstDataProtectionLock];

  if (v4)
  {
    v5 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is still under first data protection lock, not checking stewie components", buf, 2u);
    }
  }
  else
  {
    v6 = [(IDSStewieCoordinator *)self ctClient];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100423024;
    v7[3] = &unk_10097E688;
    v7[4] = self;
    [v6 fetchStewieEnabledWithCompletion:v7];
  }
}

- (BOOL)isStewieEnabled
{
  v2 = [(IDSStewieCoordinator *)self store];
  unsigned __int8 v3 = [v2 persistedStewieEnabledFlag];

  return v3;
}

- (void)heartbeatTimerFired
{
  unsigned __int8 v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stewie heartbeat fired", v6, 2u);
  }

  unsigned int v4 = [(IDSStewieCoordinator *)self ctClient];
  [v4 forceRollSMSConfigWipeAll:0];

  v5 = [(IDSStewieCoordinator *)self requester];
  [v5 addHeartbeat];

  sub_100423D10(self);
}

- (void)rollKeysTimerFired
{
  unsigned __int8 v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stewie roll keys fired", v8, 2u);
  }

  unsigned int v4 = [(IDSStewieCoordinator *)self ctClient];
  unsigned int v5 = [v4 forceRollKeys];

  if (v5)
  {
    v6 = [(IDSStewieCoordinator *)self requester];
    v7 = [[IDSStewieClearInfo alloc] initWithClearType:1];
    [v6 addClearRequest:v7];
  }
  [(IDSStewieCoordinator *)self setRollKeysTimer:0];
}

- (void)deviceInfoManager:(id)a3 deviceInfoChanged:(id)a4
{
  id v5 = a4;
  v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified device info changed { deviceInfo: %@ }", (uint8_t *)&v18, 0xCu);
  }

  v7 = [(IDSStewieCoordinator *)self store];
  v8 = [v7 persistedDeviceInfo];
  unsigned __int8 v9 = [v5 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    v17 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device info differs from persisted, scheduling request { deviceInfo: %@ }", (uint8_t *)&v18, 0xCu);
    }

    v16 = [(IDSStewieCoordinator *)self requester];
    [v16 addDeviceInfoRequest:v5];
    goto LABEL_11;
  }
  v10 = [v5 accessTokens];
  id v11 = [(IDSStewieCoordinator *)self store];
  id v12 = [v11 persistedDeviceInfo];
  id v13 = [v12 accessTokens];
  unsigned __int8 v14 = [v10 isEqualToArray:v13];

  if ((v14 & 1) == 0)
  {
    v15 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device info feature IDs have not changed, but access tokens have. Persisting latest tokens { deviceInfo: %@ }", (uint8_t *)&v18, 0xCu);
    }

    v16 = [(IDSStewieCoordinator *)self store];
    [v16 persistDeviceInfo:v5];
LABEL_11:
  }
}

- (void)phoneNumberManager:(id)a3 phoneNumberInfosChanged:(id)a4
{
  id v5 = a4;
  v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified phone info changed { phoneNumberInfos: %@ }", buf, 0xCu);
  }

  v7 = [(IDSStewieCoordinator *)self store];
  v8 = [v7 persistedPhoneNumberInfos];

  id v9 = [v8 count];
  id v10 = [v5 count];
  if ([v8 count]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = [v5 count] == 0;
  }
  if (v9 == v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          if (!objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v16), (void)v20))
          {
            int v17 = 0;
            goto LABEL_18;
          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    int v17 = 1;
LABEL_18:
  }
  else
  {
    int v17 = 0;
  }
  if (((v17 | v11) & 1) == 0)
  {
    int v18 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Phone info differs from persisted, scheduling request { phoneNumberInfos: %@ }", buf, 0xCu);
    }

    id v19 = [(IDSStewieCoordinator *)self requester];
    [v19 addPhoneNumbersRequest:v5];
  }
}

- (void)sessionKeyManager:(id)a3 sessionKeyInfosToUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(IDSStewieCoordinator *)self requester];
  [v6 addSessionKeyRequest:v5];
}

- (void)sessionKeyManager:(id)a3 stewieMessageConfigChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified sms config changed { smsConfig: %@ }", (uint8_t *)&v12, 0xCu);
  }

  v7 = [(IDSStewieCoordinator *)self store];
  v8 = [v7 persistedSMSConfig];
  unsigned __int8 v9 = [v5 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SMS Config differs from persisted, scheduling request { SMSConfig: %@ }", (uint8_t *)&v12, 0xCu);
    }

    BOOL v11 = [(IDSStewieCoordinator *)self requester];
    [v11 addSMSConfig:v5];
  }
}

- (void)requester:(id)a3 succeededRequest:(id)a4
{
  id v5 = a4;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:sub_100423E3C(self)];
  v7 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Completed stewie request. Scheduling next heartbeat { nextHeartbeat: %@ }", (uint8_t *)&v17, 0xCu);
  }

  v8 = [(IDSStewieCoordinator *)self store];
  [v8 persistNextHeartbeat:v6];

  sub_1004234C8(self, v6);
  if (CUTIsInternalInstall())
  {
    unsigned __int8 v9 = IMGetSPSEnvironmentName();
    id v10 = [(IDSStewieCoordinator *)self store];
    [v10 persistSPSEnvironment:v9];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  BOOL v11 = [v5 smsConfig];

  if (v11)
  {
    int v12 = [(IDSStewieCoordinator *)self store];
    id v13 = [v5 smsConfig];
    [v12 persistSMSConfig:v13];

    id v14 = [(IDSStewieCoordinator *)self ctClient];
    uint64_t v15 = [v5 smsConfig];
    v16 = [v15 configID];
    [v14 notifyStewieSMSConfigUpdated:v16 withError:0 forSPSEnv:v9];
  }
}

- (void)requester:(id)a3 receivedSuccessForDeviceInfo:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provisioned stewie device info { deviceInfo: %@ }", (uint8_t *)&v8, 0xCu);
  }

  v7 = [(IDSStewieCoordinator *)self store];
  [v7 persistDeviceInfo:v5];
}

- (void)requester:(id)a3 receivedSuccessForPhoneNumberInfos:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provisioned stewie phone number infos { phoneNumberInfos: %@ }", (uint8_t *)&v8, 0xCu);
  }

  v7 = [(IDSStewieCoordinator *)self store];
  [v7 persistPhoneNumberInfos:v5];
}

- (void)requester:(id)a3 receivedFailuresForPhoneNumberInfos:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100725470((uint64_t)v5, v6);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = [v12 responseCode];
        if (v13 != (id)6005)
        {
          if (v13 != (id)6002) {
            goto LABEL_14;
          }
          id v14 = [v12 additionalInfo];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"retry-interval"];
          [v15 doubleValue];
          double v17 = v16;

          int v18 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v24 = [v12 request];
            *(_DWORD *)buf = 134218242;
            uint64_t v31 = (uint64_t)v17;
            __int16 v32 = 2112;
            v33 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Retry with delay given for phone info { delay: %ld, info: %@ }", buf, 0x16u);
          }
          id v25 = v7;
          im_dispatch_after_primary_queue();
        }
        id v19 = [(IDSStewieCoordinator *)self phoneNumberManager];
        long long v20 = [v12 request];
        [v19 clearCredentialsForInfo:v20];

LABEL_14:
        long long v21 = +[IDSFoundationLog stewieProvisioning];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v12 responseCode];
          long long v23 = [v12 request];
          *(_DWORD *)buf = 134218242;
          uint64_t v31 = (uint64_t)v22;
          __int16 v32 = 2112;
          v33 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unknown error returned for phone info { code: %ld, info: %@ }", buf, 0x16u);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }
}

- (void)requester:(id)a3 receivedSuccessForSessionKeyInfos:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    id v9 = [v5 count];
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received success for session key infos to add { count: %ld, sessionKeyInfos: %@ }", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(IDSStewieCoordinator *)self sessionKeyManager];
  [v7 handleSuccessForSessionKeyInfos:v5];
}

- (void)requester:(id)a3 receivedFailuresForSessionKeyInfos:(id)a4
{
  id v4 = a4;
  id v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v31 = [v4 count];
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received failure for session key infos to add { count: %ld, sessionKeyInfoResponses: %@ }", buf, 0x16u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v11 responseCode] == (id)6012)
        {
          id v19 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            long long v20 = [v11 request];
            *(_DWORD *)buf = 138412290;
            id v31 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Replace all session keys given for key info { info: %@ } - rolling all session keys", buf, 0xCu);
          }
          [(IDSStewieCoordinator *)self rollAndClearKeys];
          int v18 = v6;
          goto LABEL_21;
        }
        if ([v11 responseCode] == (id)6001)
        {
          id v12 = v6;
          id v13 = [v11 request];
          id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v13 ctIndex]);
          uint64_t v15 = [(IDSStewieCoordinator *)self rateLimiter];
          [v15 noteItem:v14];

          double v16 = [(IDSStewieCoordinator *)self rateLimiter];
          unsigned int v17 = [v16 underLimitForItem:v14];

          if (!v17)
          {
            long long v21 = +[IDSFoundationLog stewieProvisioning];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v11 request];
              uint64_t v23 = sub_100422E10(self);
              *(_DWORD *)buf = 138412546;
              id v31 = v22;
              __int16 v32 = 2048;
              uint64_t v33 = v23;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Too many repeated key attempts given for key info { info: %@ } - rolling all session keys { self.rollKeysRateLimitCount : %ld }", buf, 0x16u);
            }
            [(IDSStewieCoordinator *)self rollAndClearKeys];

            id v6 = v12;
            int v18 = v12;
            goto LABEL_21;
          }

          id v6 = v12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  int v18 = [(IDSStewieCoordinator *)self sessionKeyManager];
  [v18 handleFailureForSessionKeyInfos:v6];
LABEL_21:
}

- (void)rollAndClearKeys
{
  unsigned __int8 v3 = [(IDSStewieCoordinator *)self sessionKeyManager];
  [v3 clearState];

  id v4 = [(IDSStewieCoordinator *)self ctClient];
  unsigned int v5 = [v4 forceRollKeys];

  if (v5)
  {
    id v6 = [(IDSStewieCoordinator *)self requester];
    id v7 = [[IDSStewieClearInfo alloc] initWithClearType:1];
    [v6 addClearRequest:v7];
  }
  id v8 = [(IDSStewieCoordinator *)self rateLimiter];
  [v8 clearAllItems];
}

- (void)requester:(id)a3 receivedSuccessForClearInfo:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleared provisioned stewie info { clearInfo: %@ }", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [v5 clearType];
  if (v7 == (id)1)
  {
    id v11 = [(IDSStewieCoordinator *)self store];
    [v11 persistNextRollKeys:0];
    goto LABEL_7;
  }
  if (!v7)
  {
    id v8 = [(IDSStewieCoordinator *)self store];
    [v8 persistDeviceInfo:0];

    uint64_t v9 = [(IDSStewieCoordinator *)self store];
    [v9 persistPhoneNumberInfos:0];

    __int16 v10 = [(IDSStewieCoordinator *)self store];
    [v10 persistNextRollKeys:0];

    id v11 = [(IDSStewieCoordinator *)self store];
    [v11 persistSMSConfig:0];
LABEL_7:
  }
}

- (void)pushHandler:(id)a3 receivedRollKeysPushWithDelay:(double)a4
{
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithDouble:a4];
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received roll keys push { delay: %@ }", (uint8_t *)&v10, 0xCu);
  }
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v9 = [(IDSStewieCoordinator *)self store];
  [v9 persistNextRollKeys:v8];

  sub_100423648(self, v8);
}

- (void)pushHandler:(id)a3 receivedRollSMSConfigPushWithDelay:(double)a4
{
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithDouble:a4];
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received roll sms config push { delay: %@ }", (uint8_t *)&v10, 0xCu);
  }
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  uint64_t v9 = [(IDSStewieCoordinator *)self store];
  [v9 persistNextRollSMSConfig:v8];

  sub_1004237C0(self, v8);
}

- (void)clearAllState
{
  unsigned __int8 v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing stewie state...", buf, 2u);
  }

  id v4 = [(IDSStewieCoordinator *)self store];
  [v4 clearPersistentMap];

  id v5 = [(IDSStewieCoordinator *)self ctClient];
  LODWORD(v4) = [v5 forceRollKeys];

  if (v4)
  {
    id v6 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CT finished rolling keys in clearing stewie state", v7, 2u);
    }
  }
}

- (id)fetchCurrentState
{
  unsigned __int8 v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching current stewie state...", buf, 2u);
  }

  id v4 = [(IDSStewieCoordinator *)self store];
  unsigned int v30 = [v4 persistedStewieEnabledFlag];

  id v5 = [(IDSStewieCoordinator *)self store];
  __int16 v32 = [v5 persistedDeviceInfo];

  id v6 = [(IDSStewieCoordinator *)self store];
  id v7 = [v6 persistedPhoneNumberInfos];

  id v8 = [(IDSStewieCoordinator *)self store];
  id v31 = [v8 persistedNextHeartbeat];

  uint64_t v9 = [(IDSStewieCoordinator *)self store];
  int v10 = [v9 persistedNextRollKeys];

  id v11 = [(IDSStewieCoordinator *)self store];
  int v12 = [v11 persistedSPSEnvironment];

  id v13 = [(IDSStewieCoordinator *)self store];
  id v14 = [v13 persistedSMSConfig];

  id v15 = objc_alloc_init((Class)NSMutableString);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = [*(id *)(*((void *)&v33 + 1) + 8 * i) description];
        [v15 appendFormat:@"        %@", v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v18);
  }

  id v22 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v23 = +[NSNumber numberWithBool:v30];
  if (v23) {
    CFDictionarySetValue(v22, @"StewieEnabled", v23);
  }

  v24 = [v32 description];
  if (v24) {
    CFDictionarySetValue(v22, @"DeviceInfo", v24);
  }

  if (v15) {
    CFDictionarySetValue(v22, @"PhoneNumbers", v15);
  }
  long long v25 = [v31 description];
  if (v25) {
    CFDictionarySetValue(v22, @"NextHeartbeat", v25);
  }

  long long v26 = [v10 description];
  if (v26) {
    CFDictionarySetValue(v22, @"NextRollKeys", v26);
  }

  long long v27 = [v12 description];
  if (v27) {
    CFDictionarySetValue(v22, @"SPSEnvironment", v27);
  }

  long long v28 = [v14 description];
  if (v28) {
    CFDictionarySetValue(v22, @"SMSConfig", v28);
  }

  return v22;
}

- (IDSStewieCTClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (IDSStewieSessionKeyManager)sessionKeyManager
{
  return self->_sessionKeyManager;
}

- (void)setSessionKeyManager:(id)a3
{
}

- (IDSStewieDeviceInfoManager)deviceInfoManager
{
  return self->_deviceInfoManager;
}

- (void)setDeviceInfoManager:(id)a3
{
}

- (IDSStewiePhoneNumberManager)phoneNumberManager
{
  return self->_phoneNumberManager;
}

- (void)setPhoneNumberManager:(id)a3
{
}

- (IDSStewiePushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSStewieRequester)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (IDSStewieStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IMDispatchTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (IMDispatchTimer)rollKeysTimer
{
  return self->_rollKeysTimer;
}

- (void)setRollKeysTimer:(id)a3
{
}

- (IMDispatchTimer)rollSMSConfigTimer
{
  return self->_rollSMSConfigTimer;
}

- (void)setRollSMSConfigTimer:(id)a3
{
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_rollSMSConfigTimer, 0);
  objc_storeStrong((id *)&self->_rollKeysTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_phoneNumberManager, 0);
  objc_storeStrong((id *)&self->_deviceInfoManager, 0);
  objc_storeStrong((id *)&self->_sessionKeyManager, 0);

  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end