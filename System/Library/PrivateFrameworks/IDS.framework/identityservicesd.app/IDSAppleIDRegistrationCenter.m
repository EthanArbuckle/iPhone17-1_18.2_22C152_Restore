@interface IDSAppleIDRegistrationCenter
+ (id)sharedInstance;
- (BOOL)_haveQueuedMessageForRegistration:(id)a3 inQueueForKey:(id)a4;
- (BOOL)_queryInitialInvitationContextForRegistration:(id)a3;
- (BOOL)_registrationIsAuthenticating:(id)a3;
- (BOOL)_registrationNeedsAuthentication:(id)a3;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 failIfNotSilent:(BOOL)a5;
- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 forceRenewal:(BOOL)a5 failIfNotSilent:(BOOL)a6;
- (BOOL)_validateRegionID:(id)a3 phoneNumber:(id)a4 registration:(id)a5;
- (BOOL)authenticateRegistration:(id)a3;
- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4;
- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4 requireSilentAuth:(BOOL)a5;
- (BOOL)authenticateRegistration:(id)a3 forceRenewal:(BOOL)a4 requireSilentAuth:(BOOL)a5;
- (BOOL)authenticateRegistration:(id)a3 requireSilentAuth:(BOOL)a4;
- (BOOL)queryInitialInvitationContextForRegistration:(id)a3;
- (BOOL)validateRegion:(id)a3 phoneNumber:(id)a4 forRegistration:(id)a5;
- (IDSAppleIDRegistrationCenter)init;
- (IDSAppleIDRegistrationCenter)initWithMessageDelivery:(id)a3 passwordManager:(id)a4;
- (id)_queueForKey:(id)a3;
- (void)_fetchTokenForRegistrationInfo:(id)a3 failIfNotSilent:(BOOL)a4 failureBlock:(id)a5;
- (void)_noteSuccessfulToken:(id)a3 profileID:(id)a4 selfID:(id)a5 forRegistrationInfo:(id)a6 wasFetched:(BOOL)a7;
- (void)_notifyAuthenticating:(id)a3;
- (void)_notifyAuthenticationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyAuthenticationSuccess:(id)a3;
- (void)_notifyInitialRegionQuerySuccess:(id)a3;
- (void)_notifyRegionValidationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7;
- (void)_notifyRegionValidationSuccess:(id)a3 regionID:(id)a4 phoneNumber:(id)a5 context:(id)a6 verified:(BOOL)a7;
- (void)_postUserNotificationWithTitle:(id)a3 message:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (void)_processDefaultInvitationContextMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6;
- (void)_processRegionValidationMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6;
- (void)_removeMessageForRegistration:(id)a3 fromQueueForKey:(id)a4;
- (void)_renewTokenForRegistrationInfo:(id)a3 forceRenewal:(BOOL)a4 failIfNotSilent:(BOOL)a5;
- (void)_serviceQueueForKey:(id)a3;
- (void)_setQueue:(id)a3 forKey:(id)a4;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
@end

@implementation IDSAppleIDRegistrationCenter

+ (id)sharedInstance
{
  if (qword_100A4C8D8 != -1) {
    dispatch_once(&qword_100A4C8D8, &stru_10098B288);
  }
  v2 = (void *)qword_100A4C8E0;

  return v2;
}

- (IDSAppleIDRegistrationCenter)initWithMessageDelivery:(id)a3 passwordManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSAppleIDRegistrationCenter;
  v9 = [(IDSAppleIDRegistrationCenter *)&v12 init];
  if (v9)
  {
    v10 = +[IMSystemMonitor sharedInstance];
    [v10 addListener:v9];

    objc_storeStrong((id *)&v9->_messageDelivery, a3);
    [(IDSAppleIDRegistrationCenterMessageDelivery *)v9->_messageDelivery setUserAgent:@"com.apple.invitation-registration"];
    [(IDSAppleIDRegistrationCenterMessageDelivery *)v9->_messageDelivery setLogToRegistration:1];
    objc_storeStrong((id *)&v9->_passwordManager, a4);
  }

  return v9;
}

- (IDSAppleIDRegistrationCenter)init
{
  id v3 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]);
  v4 = +[IDSRegistrationRequestTracker sharedInstance];
  [v3 addRequestObserver:v4];

  v5 = +[FTPasswordManager sharedInstance];
  v6 = [(IDSAppleIDRegistrationCenter *)self initWithMessageDelivery:v3 passwordManager:v5];

  return v6;
}

- (void)dealloc
{
  id v3 = +[IMSystemMonitor sharedInstance];
  [v3 removeListener:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:0 object:0];

  [(IDSAppleIDRegistrationCenterMessageDelivery *)self->_messageDelivery invalidate];
  v5.receiver = self;
  v5.super_class = (Class)IDSAppleIDRegistrationCenter;
  [(IDSAppleIDRegistrationCenter *)&v5 dealloc];
}

- (id)_queueForKey:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v6 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_queues objectForKey:v4];
  id v6 = (id)v5;
  if (self->_queues)
  {
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    queues = self->_queues;
    self->_queues = Mutable;

    if (v6) {
      goto LABEL_8;
    }
  }
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [(NSMutableDictionary *)self->_queues setObject:v6 forKey:v4];
LABEL_8:

  return v6;
}

- (void)_setQueue:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    queues = self->_queues;
    id v8 = v11;
    if (v11)
    {
      if (!queues)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v10 = self->_queues;
        self->_queues = Mutable;

        id v8 = v11;
        queues = self->_queues;
      }
      [(NSMutableDictionary *)queues setObject:v8 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)queues removeObjectForKey:v6];
    }
  }
}

- (void)_serviceQueueForKey:(id)a3
{
  [(IDSAppleIDRegistrationCenter *)self _queueForKey:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v14 = long long v20 = 0u;
  id obj = [v14 _copyForEnumerating];
  id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v7 userInfo];
        v9 = [v8 objectForKey:@"info"];

        if (objc_opt_respondsToSelector())
        {
          v10 = [v9 authenticationToken];
          [v7 setAuthToken:v10];
        }
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v9 profileID];
          [v7 setProfileID:v11];
        }
        if (objc_opt_respondsToSelector())
        {
          objc_super v12 = [v9 pushToken];
          [v7 setPushToken:v12];
        }
        if (objc_opt_respondsToSelector())
        {
          v13 = sub_100265CA0(v9);
          [v7 setDSAuthID:v13];
        }
        [(IDSAppleIDRegistrationCenterMessageDelivery *)self->_messageDelivery sendMessage:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  [v14 removeAllObjects];
}

- (BOOL)_haveQueuedMessageForRegistration:(id)a3 inQueueForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  BOOL v9 = 0;
  if (v6 && v8)
  {
    [(IDSAppleIDRegistrationCenter *)self _queueForKey:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "userInfo", (void)v18);
          id v16 = [v15 objectForKey:@"info"];

          if (v16 == v6)
          {
            id v16 = v6;
LABEL_15:

            BOOL v9 = 1;
            goto LABEL_16;
          }
          if ([v16 isEqual:v6]) {
            goto LABEL_15;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v9 = 0;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
LABEL_16:
  }
  return v9;
}

- (void)_removeMessageForRegistration:(id)a3 fromQueueForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  if (v6 && v8)
  {
    long long v19 = self;
    id v20 = v7;
    BOOL v9 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:v7];
    id v10 = [v9 mutableCopy];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = [v16 userInfo];
          id v18 = [v17 objectForKey:@"info"];

          if (v18 == v6 || [v18 isEqual:v6]) {
            [v10 removeObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v7 = v20;
    [(IDSAppleIDRegistrationCenter *)v19 _setQueue:v10 forKey:v20];
  }
}

- (void)_notifyInitialRegionQuerySuccess:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not reflecting back initial region query success, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443B8];
    [v6 removeObjectIdenticalTo:v4];

    id v7 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = v7;
    id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
          if (objc_opt_respondsToSelector()) {
            [v11 center:self succeededInitialRegionQuery:v4];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_notifyRegionValidationSuccess:(id)a3 regionID:(id)a4 phoneNumber:(id)a5 context:(id)a6 verified:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v32 = a4;
  id v13 = a5;
  id v14 = a6;
  v33 = v12;
  unsigned int v15 = [v12 isDisabled];
  id v16 = +[IMRGLog registration];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not reflecting back region validation success, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v17)
    {
      CFStringRef v18 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v40 = v12;
      if (v7) {
        CFStringRef v18 = @"YES";
      }
      __int16 v41 = 2112;
      id v42 = v32;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v14;
      __int16 v47 = 2112;
      CFStringRef v48 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notifying of region validation success for registration: %@    region: %@   phone number: %@   context: %@  verified: %@", buf, 0x34u);
    }

    [v12 setRegionID:v32];
    [v12 setRegionBasePhoneNumber:v13];
    [v12 setRegionServerContext:v14];
    long long v19 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C0];
    [v19 removeObjectIdenticalTo:v12];

    id v20 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v35;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v25 center:self succeededRegionValidation:v33 regionID:v32 phoneNumber:v13 extraContext:v14 verified:v7];
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }

    v26 = +[FTNetworkSupport sharedInstance];
    unsigned int v27 = [v26 wiFiActiveAndReachable];

    if (v27) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 1;
    }
    sub_1001BC02C(0);
    sub_1001BC738(-1);
    FTAWDLogRegistrationProfileValidateInvitationContext();
    id v29 = objc_alloc((Class)IDSRegistrationProfileOperationValidateInvitationContext);
    uint64_t v30 = sub_1001BC02C(0);
    id v16 = [v29 initWithGuid:0 success:1 connectionType:v28 resultCode:v30 registrationError:sub_1001BC738(-1) genericError:0 URLError:0 POSIXError:0];
    v31 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v31 logMetric:v16];
  }
}

- (void)_notifyRegionValidationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v12 = a3;
  id v42 = a6;
  id v13 = a7;
  if ([v12 isDisabled])
  {
    id v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not reflecting back region validation success, registration is disabled: %@", buf, 0xCu);
    }
    goto LABEL_44;
  }
  int64_t v40 = a4;
  unsigned int v15 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C0];
  [v15 removeObjectIdenticalTo:v12];

  sub_1001484DC(0, @"Registration", @"Region Validation failed", 1073);
  id v16 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v44;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v21 center:self failedRegionValidation:v12 error:a5 info:v13];
        }
      }
      id v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v18);
  }

  id v22 = [v42 domain];
  unsigned __int8 v41 = [v22 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v23 = [v42 domain];
  if ([v23 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v24 = 1;
  }
  else
  {
    v25 = [v42 domain];
    unsigned int v24 = [v25 isEqualToString:kCFErrorDomainCFNetwork];
  }
  v26 = +[FTNetworkSupport sharedInstance];
  unsigned int v27 = [v26 wiFiActiveAndReachable];

  if (v27) {
    int v28 = 2;
  }
  else {
    int v28 = 1;
  }
  unsigned int v39 = v28;
  sub_1001BC02C(v40);
  sub_1001BC738(a5);
  if ((v24 | v41))
  {
    id v29 = 0;
    if (v24)
    {
LABEL_21:
      uint64_t v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
      goto LABEL_24;
    }
  }
  else
  {
    id v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
    if (v24) {
      goto LABEL_21;
    }
  }
  uint64_t v30 = 0;
LABEL_24:
  if (v41)
  {
    v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
    FTAWDLogRegistrationProfileValidateInvitationContext();
  }
  else
  {
    FTAWDLogRegistrationProfileValidateInvitationContext();
  }
  if (v24) {

  }
  if (((v24 | v41) & 1) == 0) {
  id v32 = objc_alloc((Class)IDSRegistrationProfileOperationValidateInvitationContext);
  }
  uint64_t v33 = sub_1001BC02C(v40);
  uint64_t v34 = sub_1001BC738(a5);
  if ((v24 | v41))
  {
    long long v35 = 0;
    if (v24)
    {
LABEL_33:
      long long v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
      goto LABEL_36;
    }
  }
  else
  {
    long long v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
    if (v24) {
      goto LABEL_33;
    }
  }
  long long v36 = 0;
LABEL_36:
  if (v41)
  {
    long long v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 code]);
    id v14 = [v32 initWithGuid:0 success:0 connectionType:v39 resultCode:v33 registrationError:v34 genericError:v35 URLError:v36 POSIXError:v37];

    if (!v24) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  id v14 = [v32 initWithGuid:0 success:0 connectionType:v39 resultCode:v33 registrationError:v34 genericError:v35 URLError:v36 POSIXError:0];
  if (v24) {
LABEL_40:
  }

LABEL_41:
  if (((v24 | v41) & 1) == 0) {

  }
  v38 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v38 logMetric:v14];

LABEL_44:
}

- (void)_notifyAuthenticating:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not reflecting back started authenticating, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    if ((uint64_t)[v4 registrationStatus] <= 5) {
      [v4 setRegistrationStatus:5];
    }
    id v6 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = v6;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (objc_opt_respondsToSelector()) {
            [v10 center:self startedAuthenticating:v4];
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyAuthenticationFailure:(id)a3 responseCode:(int64_t)a4 registrationError:(int64_t)a5 error:(id)a6 info:(id)a7
{
  id v11 = a3;
  id v30 = a6;
  id v12 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v36 = _os_activity_create((void *)&_mh_execute_header, "Apple ID registration center notify authentication failure", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v36, &state);
  if ([v11 isDisabled])
  {
    long long v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not reflecting back authentication failure, registration is disabled: %@", buf, 0xCu);
    }
LABEL_30:

    goto LABEL_31;
  }
  long long v14 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C8];
  [v14 removeObject:v11];

  if ((uint64_t)[v11 registrationStatus] <= 6) {
    [v11 setRegistrationStatus:-1];
  }
  sub_1001484DC(0, @"Registration", @"Authentication failure", 1073);
  id v15 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v20 center:self failedAuthentication:v11 error:a5 info:v12];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v17);
  }

  id v21 = [v30 domain];
  unsigned int v22 = [v21 isEqualToString:NSPOSIXErrorDomain];

  uint64_t v23 = [v30 domain];
  if ([v23 isEqualToString:NSURLErrorDomain])
  {
    unsigned int v24 = 1;
  }
  else
  {
    v25 = [v30 domain];
    unsigned int v24 = [v25 isEqualToString:kCFErrorDomainCFNetwork];
  }
  v26 = +[FTNetworkSupport sharedInstance];
  [v26 wiFiActiveAndReachable];

  sub_1001BC02C(a4);
  sub_1001BC738(a5);
  if ((v24 | v22))
  {
    long long v13 = 0;
    if (v24) {
      goto LABEL_20;
    }
LABEL_23:
    unsigned int v27 = 0;
    if (!v22) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
  long long v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
  if (!v24) {
    goto LABEL_23;
  }
LABEL_20:
  unsigned int v27 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
  if (!v22)
  {
LABEL_21:
    int v28 = 0;
    goto LABEL_25;
  }
LABEL_24:
  int v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
LABEL_25:
  FTAWDLogRegistrationProfileAuthenticate();
  if (v22) {

  }
  if (v24) {
  if (((v24 | v22) & 1) == 0)
  }
    goto LABEL_30;
LABEL_31:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_notifyAuthenticationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v19 = _os_activity_create((void *)&_mh_execute_header, "Apple ID registration center notify authentication success", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v19, &state);
  if ([v4 isDisabled])
  {
    uint64_t v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not reflecting back authentication success, registration is disabled: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C8];
    [v6 removeObject:v4];

    id v7 = [(NSMutableArray *)self->_handlers _copyForEnumerating];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 center:self succeededAuthentication:v4];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v9);
    }

    long long v13 = +[FTNetworkSupport sharedInstance];
    [v13 wiFiActiveAndReachable];

    sub_1001BC02C(0);
    sub_1001BC738(-1);
    FTAWDLogRegistrationProfileAuthenticate();
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_postUserNotificationWithTitle:(id)a3 message:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v17 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v13 = IMLocalizedStringFromTableInBundle();
  long long v14 = IMLocalizedStringFromTableInBundle();
  long long v15 = +[IMUserNotification userNotificationWithIdentifier:v10 title:v12 message:v11 defaultButton:v13 alternateButton:v14 otherButton:0];

  long long v16 = +[IMUserNotificationCenter sharedInstance];
  [v16 addUserNotification:v15 listener:0 completionHandler:v9];
}

- (void)_processDefaultInvitationContextMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109634;
    v20[1] = a5;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  Received default invitation context with result: %d  error: %@  result dictionary: %@", (uint8_t *)v20, 0x1Cu);
  }

  long long v14 = [v10 userInfo];
  long long v15 = [v14 objectForKey:@"info"];

  if (a5 == 6005)
  {
    sub_1001484DC(0, @"Registration", @"Need to re-authenticate", 1073);
    [v15 setAuthenticationToken:0];
  }
  else if (a5)
  {
    sub_1001484DC(0, @"Registration", @"Default context query failed", 1073);
  }
  else
  {
    long long v16 = [v10 responseRegionID];
    if (v16)
    {
      id v17 = [v10 responseRegionID];
    }
    else
    {
      id v17 = &stru_10099BE78;
    }
    uint64_t v18 = [v10 responseBasePhoneNumber];
    uint64_t v19 = [v10 responseExtraInfo];
    -[IDSAppleIDRegistrationCenter _notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:](self, "_notifyRegionValidationSuccess:regionID:phoneNumber:context:verified:", v15, v17, v18, v19, [v10 responseValidated]);

    if (v16) {
  }
    }
  [(IDSAppleIDRegistrationCenter *)self _notifyInitialRegionQuerySuccess:v15];
}

- (void)_processRegionValidationMessage:(id)a3 deliveredWithError:(id)a4 resultCode:(int64_t)a5 resultDictionary:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109378;
    v19[1] = a5;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  Received region validation response with result: %d  error: %@", (uint8_t *)v19, 0x12u);
  }

  id v12 = [v9 userInfo];
  long long v13 = [v12 objectForKey:@"info"];

  if (a5 == 6005)
  {
    sub_1001484DC(0, @"Registration", @"Need to re-authenticate", 1073);
    [v13 setAuthenticationToken:0];
    [(IDSAppleIDRegistrationCenter *)self _renewTokenForRegistrationInfo:v13 forceRenewal:0 failIfNotSilent:0];
  }
  else if (a5)
  {
    sub_1001484DC(0, @"Registration", @"Region validation failed", 1073);
    long long v16 = [v9 responseAlertInfo];
    [(IDSAppleIDRegistrationCenter *)self _notifyRegionValidationFailure:v13 responseCode:a5 registrationError:46 error:v10 info:v16];
  }
  else
  {
    long long v14 = [v9 responseRegionID];
    if (v14)
    {
      long long v15 = [v9 responseRegionID];
    }
    else
    {
      long long v15 = &stru_10099BE78;
    }
    id v17 = [v9 responseBasePhoneNumber];
    uint64_t v18 = [v9 responseExtraInfo];
    [(IDSAppleIDRegistrationCenter *)self _notifyRegionValidationSuccess:v13 regionID:v15 phoneNumber:v17 context:v18 verified:1];

    if (v14) {
  }
    }
}

- (void)_noteSuccessfulToken:(id)a3 profileID:(id)a4 selfID:(id)a5 forRegistrationInfo:(id)a6 wasFetched:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v25 = _os_activity_create((void *)&_mh_execute_header, "Apple ID registration center note successful token", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v25, &state);
  long long v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 134219010;
    id v27 = v12;
    if (v7) {
      CFStringRef v17 = @"YES";
    }
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    CFStringRef v33 = v17;
    __int16 v34 = 2112;
    id v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Noting successful token: %p   for profile ID: %@   self handle: %@  wasFetched: %@  registration: %@", buf, 0x34u);
  }

  if ([v13 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = [v15 profileID];
    if (!v18
      || ([v15 profileID],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v20 = [v19 isEqualToString:v13],
          v19,
          v18,
          (v20 & 1) == 0))
    {
      [v15 setProfileID:v13];
    }
  }
  else
  {
    id v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10071FDF4((uint64_t)v13, v21);
    }

    IMLogBacktrace();
  }
  if ([v14 length]) {
    [v15 setDSHandle:v14];
  }
  if (!v7)
  {
    id v22 = [v15 authenticationToken];
    __int16 v23 = v22;
    if (!v22 || ([v22 isEqualToString:v12] & 1) == 0) {
      [v15 setAuthenticationToken:v12];
    }
  }
  [(IDSAppleIDRegistrationCenter *)self _notifyAuthenticationSuccess:v15];
  [(IDSAppleIDRegistrationCenter *)self _serviceQueueForKey:off_100A443B8];
  [(IDSAppleIDRegistrationCenter *)self _serviceQueueForKey:off_100A443C0];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_renewTokenForRegistrationInfo:(id)a3 forceRenewal:(BOOL)a4 failIfNotSilent:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = +[IMRGLog registration];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting renew for %@", buf, 0xCu);
    }

    passwordManager = self->_passwordManager;
    id v12 = [v8 profileID];
    id v13 = [v8 email];
    id v14 = IMStripLoginID();
    id v15 = [v14 lowercaseString];
    long long v16 = [v8 serviceType];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003C4ABC;
    v18[3] = &unk_10098B2B0;
    uint64_t v19 = v8;
    unsigned __int8 v20 = self;
    LOBYTE(v17) = a5;
    [(FTPasswordManager *)passwordManager requestAuthTokenForProfileID:v12 username:v15 service:v16 badPassword:0 showForgotPassword:0 forceRenewal:v6 failIfNotSilent:v17 outRequestID:0 completionBlock:v18];

    id v9 = v19;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Empty registration info supplied for password fetch, bailing", buf, 2u);
  }
}

- (void)_fetchTokenForRegistrationInfo:(id)a3 failIfNotSilent:(BOOL)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  BOOL v10 = +[IMRGLog registration];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting token fetch for %@", buf, 0xCu);
    }

    passwordManager = self->_passwordManager;
    id v13 = [v8 profileID];
    id v14 = [v8 email];
    id v15 = [v14 lowercaseString];
    long long v16 = [v8 serviceType];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003C4F44;
    v17[3] = &unk_10098B2D8;
    id v18 = v8;
    uint64_t v19 = self;
    unsigned __int8 v20 = v9;
    BOOL v21 = a4;
    [(FTPasswordManager *)passwordManager fetchAuthTokenForProfileID:v13 username:v15 service:v16 outRequestID:0 completionBlock:v17];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Empty registration info supplied for password fetch, bailing", buf, 2u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4
{
  return [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:a3 forceNew:a4 forceRenewal:0 failIfNotSilent:0];
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 failIfNotSilent:(BOOL)a5
{
  return [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:a3 forceNew:a4 forceRenewal:0 failIfNotSilent:a5];
}

- (BOOL)_sendAuthenticationRequest:(id)a3 forceNew:(BOOL)a4 forceRenewal:(BOOL)a5 failIfNotSilent:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v22 = _os_activity_create((void *)&_mh_execute_header, "Apple ID registration center authentication request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v22, &state);
  if ((uint64_t)[v10 registrationStatus] <= 3) {
    [v10 setRegistrationStatus:4];
  }
  BOOL v11 = [v10 email];
  id v12 = [v11 length];

  if (v12)
  {
    id v13 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C8];
    if ([v13 containsObject:v10])
    {
      id v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not adding this to the queue, we're already trying to authenticate: %@", buf, 0xCu);
      }
    }
    else
    {
      [v13 addObject:v10];
      BOOL v16 = a6 || [v10 registrationType] == 2;
      uint64_t v17 = +[IMRGLog registration];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = +[FTDeviceSupport sharedInstance];
        uint64_t v19 = [v18 deviceInformationString];
        *(_DWORD *)buf = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching password for: %@  (Environment: %@)", buf, 0x16u);
      }
      if (v8) {
        [(IDSAppleIDRegistrationCenter *)self _renewTokenForRegistrationInfo:v10 forceRenewal:v7 failIfNotSilent:v16];
      }
      else {
        [(IDSAppleIDRegistrationCenter *)self _fetchTokenForRegistrationInfo:v10 failIfNotSilent:v16 failureBlock:0];
      }
    }
  }
  else
  {
    id v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No email present for registration: %@", buf, 0xCu);
    }

    [(IDSAppleIDRegistrationCenter *)self _notifyAuthenticationFailure:v10 responseCode:1 registrationError:16 error:0 info:0];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v12 != 0;
}

- (BOOL)_registrationIsAuthenticating:(id)a3
{
  id v4 = off_100A443C8;
  id v5 = a3;
  BOOL v6 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:v4];
  LOBYTE(v4) = [v6 containsObject:v5];

  return (char)v4;
}

- (BOOL)_registrationNeedsAuthentication:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 authenticationToken];
  BOOL v7 = (!v4
     || (id v5 = (void *)v4,
         [v3 profileID],
         BOOL v6 = objc_claimAutoreleasedReturnValue(),
         v6,
         v5,
         !v6))
    && [v3 registrationType] == 1;

  return v7;
}

- (BOOL)_validateRegionID:(id)a3 phoneNumber:(id)a4 registration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = objc_alloc_init(IDSProfileValidateInvitationContext);
  id v12 = sub_100265CA0(v10);
  [(IDSProfileValidateInvitationContext *)v11 setDSAuthID:v12];

  id v13 = [v10 pushToken];
  [(IDSProfileMessage *)v11 setPushToken:v13];

  id v14 = [v10 profileID];
  [(IDSProfileMessage *)v11 setProfileID:v14];

  id v15 = [v10 authenticationToken];
  [(IDSProfileMessage *)v11 setAuthToken:v15];

  [(IDSProfileValidateInvitationContext *)v11 setRegionID:v8];
  [(IDSProfileValidateInvitationContext *)v11 setBasePhoneNumber:v9];
  BOOL v16 = +[NSDictionary dictionaryWithObject:v10 forKey:@"info"];
  [(IDSProfileValidateInvitationContext *)v11 setUserInfo:v16];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  _DWORD v20[2] = sub_1003C58E0;
  v20[3] = &unk_1009878C0;
  v20[4] = self;
  [(IDSProfileValidateInvitationContext *)v11 setCompletionBlock:v20];
  if ([(IDSAppleIDRegistrationCenter *)self _registrationNeedsAuthentication:v10])
  {
    uint64_t v17 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C0];
    [v17 addObject:v11];

    if (![(IDSAppleIDRegistrationCenter *)self _registrationIsAuthenticating:v10]) {
      [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v10 forceNew:0];
    }
  }
  else
  {
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending region validation request: %@ number: %@ (%@)", buf, 0x20u);
    }

    [(IDSAppleIDRegistrationCenterMessageDelivery *)self->_messageDelivery sendMessage:v11];
  }

  return 1;
}

- (BOOL)_queryInitialInvitationContextForRegistration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(IDSProfileGetDefaultInvitationContext);
  BOOL v6 = sub_100265CA0(v4);
  [(IDSProfileGetDefaultInvitationContext *)v5 setDSAuthID:v6];

  BOOL v7 = [v4 pushToken];
  [(IDSProfileMessage *)v5 setPushToken:v7];

  id v8 = [v4 profileID];
  [(IDSProfileMessage *)v5 setProfileID:v8];

  id v9 = [v4 authenticationToken];
  [(IDSProfileMessage *)v5 setAuthToken:v9];

  id v10 = +[NSDictionary dictionaryWithObject:v4 forKey:@"info"];
  [(IDSProfileGetDefaultInvitationContext *)v5 setUserInfo:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003C5B38;
  v14[3] = &unk_1009878C0;
  v14[4] = self;
  [(IDSProfileGetDefaultInvitationContext *)v5 setCompletionBlock:v14];
  if ([(IDSAppleIDRegistrationCenter *)self _registrationNeedsAuthentication:v4])
  {
    BOOL v11 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443B8];
    [v11 addObject:v5];

    if (![(IDSAppleIDRegistrationCenter *)self _registrationIsAuthenticating:v4]) {
      [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v4 forceNew:0];
    }
  }
  else
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending initial context request for: %@", buf, 0xCu);
    }

    [(IDSAppleIDRegistrationCenterMessageDelivery *)self->_messageDelivery sendMessage:v5];
  }

  return 1;
}

- (BOOL)queryInitialInvitationContextForRegistration:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial context for: %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(IDSAppleIDRegistrationCenter *)self _queryInitialInvitationContextForRegistration:v4];
  return v6;
}

- (BOOL)validateRegion:(id)a3 phoneNumber:(id)a4 forRegistration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting region validation for: %@  number: %@, %@", (uint8_t *)&v14, 0x20u);
  }

  BOOL v12 = [(IDSAppleIDRegistrationCenter *)self _validateRegionID:v8 phoneNumber:v9 registration:v10];
  return v12;
}

- (BOOL)authenticateRegistration:(id)a3 forceRenewal:(BOOL)a4 requireSilentAuth:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Kicking off authentication request for: %@", (uint8_t *)&v12, 0xCu);
  }

  BOOL v10 = [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v8 forceNew:v6 forceRenewal:v6 failIfNotSilent:v5];
  return v10;
}

- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4 requireSilentAuth:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Kicking off authentication request for: %@", (uint8_t *)&v12, 0xCu);
  }

  BOOL v10 = [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v8 forceNew:v6 failIfNotSilent:v5];
  return v10;
}

- (BOOL)authenticateRegistration:(id)a3 forceNewToken:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Kicking off authentication request for: %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v6 forceNew:v4 failIfNotSilent:0];
  return v8;
}

- (BOOL)authenticateRegistration:(id)a3 requireSilentAuth:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Kicking off authentication request for: %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v8 = [(IDSAppleIDRegistrationCenter *)self _sendAuthenticationRequest:v6 forceNew:0 failIfNotSilent:v4];
  return v8;
}

- (BOOL)authenticateRegistration:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Kicking off authentication request for: %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(IDSAppleIDRegistrationCenter *)self authenticateRegistration:v4 forceNewToken:0];
  return v6;
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  if (a3)
  {
    id v4 = off_100A443B8;
    id v5 = a3;
    [(IDSAppleIDRegistrationCenter *)self _removeMessageForRegistration:v5 fromQueueForKey:v4];
    [(IDSAppleIDRegistrationCenter *)self _removeMessageForRegistration:v5 fromQueueForKey:off_100A443C0];
    id v6 = [(IDSAppleIDRegistrationCenter *)self _queueForKey:off_100A443C8];
    [v6 removeObject:v5];
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
  [(NSMutableArray *)self->_handlers removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_handlers count])
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordManager, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_queues, 0);
}

@end