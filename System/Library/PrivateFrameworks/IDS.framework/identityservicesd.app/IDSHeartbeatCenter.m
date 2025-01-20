@interface IDSHeartbeatCenter
+ (IDSHeartbeatCenter)sharedInstance;
- (BOOL)_registration:(id)a3 needsRenewal:(double *)a4;
- (CUTDeferredTaskQueue)reallyUpdateRegistrationHeartbeatTask;
- (IDSHeartbeatCenter)init;
- (double)_nextRegistrationHeartbeatTime;
- (double)registrationHBI;
- (id)_registrationsPendingHeartbeat;
- (void)__reallyUpdateRegistrationHeartbeat;
- (void)_bagReloaded:(id)a3;
- (void)_serverHeartBeat:(id)a3;
- (void)_serverHeartBeatTimerHit:(id)a3;
- (void)_serverHeartBeatTimerHitOnMain:(id)a3;
- (void)_startRegistrationHeartbeat;
- (void)_stopRegistrationHeartbeat;
- (void)_updateRegistrationHeartbeat;
- (void)addRegistrationInfo:(id)a3;
- (void)checkHeartbeat;
- (void)noteRegistrationStateChanged;
- (void)removeRegistrationInfo:(id)a3;
- (void)updateHeartbeat;
@end

@implementation IDSHeartbeatCenter

+ (IDSHeartbeatCenter)sharedInstance
{
  if (qword_100A4A528 != -1) {
    dispatch_once(&qword_100A4A528, &stru_100980218);
  }
  v2 = (void *)qword_100A4A530;

  return (IDSHeartbeatCenter *)v2;
}

- (IDSHeartbeatCenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)IDSHeartbeatCenter;
  v2 = [(IDSHeartbeatCenter *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CUTDeferredTaskQueue);
    v4 = im_primary_queue();
    v5 = (CUTDeferredTaskQueue *)[v3 initWithCapacity:1 queue:v4 block:&stru_100980258];
    reallyUpdateRegistrationHeartbeatTask = v2->_reallyUpdateRegistrationHeartbeatTask;
    v2->_reallyUpdateRegistrationHeartbeatTask = v5;

    v7 = +[IMSystemMonitor sharedInstance];
    [v7 addListener:v2];
  }
  return v2;
}

- (void)_serverHeartBeat:(id)a3
{
  [a3 invalidate];
  v4 = +[IDSRegistrationReasonTracker sharedInstance];
  [v4 setMostRecentIDSRegistrationReason:2];

  v5 = +[IDSRegistrationReasonTracker sharedInstance];
  v6 = +[IDSRequestReasonContainer scheduledRequestWithSubreason:1 pathID:2];
  [v5 setRegistrationRequestReason:v6];

  v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting pending registrations...", buf, 2u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v26 = self;
  v8 = [(IDSHeartbeatCenter *)self _registrationsPendingHeartbeat];
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v9)
  {
    char v11 = 0;
    goto LABEL_30;
  }
  id v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v28;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
      if ([v14 registrationType]
        || +[IDSRegistrationController validSIMStateForRegistration])
      {
        v15 = +[IMRGLog registration];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        v16 = +[IDSRegistrationCenter sharedInstance];
        unsigned __int8 v17 = [v16 sendRegistration:v14];

        if (v17)
        {
          v18 = +[IMRGLog registration];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v19 = v18;
            v20 = "   * sent";
            uint32_t v21 = 2;
            goto LABEL_21;
          }
        }
        else
        {
          unsigned int v22 = [v14 canSendRegistration];
          v18 = +[IMRGLog registration];
          BOOL v23 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "   * NOT sent, forcing through the registration controller", buf, 2u);
            }

            v18 = +[IDSRegistrationController sharedInstance];
            [v18 registerInfo:v14];
          }
          else if (v23)
          {
            *(_DWORD *)buf = 138412290;
            v32 = v14;
            v19 = v18;
            v20 = "   * Registration says it can't register, not registering: %@";
            uint32_t v21 = 12;
LABEL_21:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
          }
        }
        char v11 = 1;
        goto LABEL_23;
      }
      v18 = +[IMRGLog registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping this registration for heartbeat consideration, it is an SMS one - and the SIM is not present: %@", buf, 0xCu);
      }
LABEL_23:

      v13 = (char *)v13 + 1;
    }
    while (v10 != v13);
    id v24 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    id v10 = v24;
  }
  while (v24);
LABEL_30:

  v25 = +[IMRGLog registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "...Done", buf, 2u);
  }

  if (v11)
  {
    if (qword_100A4A540 != -1) {
      dispatch_once(&qword_100A4A540, &stru_100980278);
    }
    if (off_100A4A538) {
      ((void (*)(uint64_t, const __CFString *, NSDictionary *, void))off_100A4A538)(13, @"IdentityServicesHeartbeat", +[NSDictionary dictionaryWithObject:@"sending IdentityServices Heartbeat" forKey:@"action"], 0);
    }
  }
  [(IDSHeartbeatCenter *)v26 updateHeartbeat];
}

- (void)_serverHeartBeatTimerHit:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server heartbeat hit", v6, 2u);
  }

  sub_1001484DC(0, @"Server Heartbeat", @"Need to re-register now", 1109);
  [(IDSHeartbeatCenter *)self _serverHeartBeat:v4];
}

- (BOOL)_registration:(id)a3 needsRenewal:(double *)a4
{
  id v5 = a3;
  double v6 = -[IDSHeartbeatCenter registrationHBI]_0();
  v7 = [v5 registrationDate];
  v8 = [v5 nextRegistrationDate];
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    if (v8)
    {
      [v8 timeIntervalSinceNow];
      double v6 = v10;
    }
    else
    {
      double v6 = v6 - fabs(v9);
    }
  }
  if ([v5 registrationType])
  {
    if (([v5 canSendRegistration] & 1) == 0)
    {
      char v11 = +[IMRGLog registration];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v16 = 138412290;
      double v17 = *(double *)&v5;
      uint64_t v12 = "Skipping this registration for heartbeat consideration, it is an Apple ID one - and it apparently can't register: %@";
      goto LABEL_18;
    }
LABEL_10:
    BOOL v13 = v6 < 0.0;
    if (v6 < 0.0)
    {
      v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = fabs(v6);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "*************** Heartbeat: We need to register now! {timeToNextRegister: %f} *********************", (uint8_t *)&v16, 0xCu);
      }
    }
    if (a4) {
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (+[IDSRegistrationController validSIMStateForRegistration])
  {
    goto LABEL_10;
  }
  char v11 = +[IMRGLog registration];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_19;
  }
  int v16 = 138412290;
  double v17 = *(double *)&v5;
  uint64_t v12 = "Skipping this registration for heartbeat consideration, it is an SMS one - and the SIM is not present: %@";
LABEL_18:
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
LABEL_19:

  BOOL v13 = 0;
  if (a4)
  {
    if (v6 < 14400.0) {
      double v6 = 14400.0;
    }
LABEL_22:
    *a4 = v6;
  }
LABEL_23:

  return v13;
}

- (double)registrationHBI
{
  if (IMGetCachedDomainBoolForKey())
  {
    int v0 = (int)SecureRandomUInt() % 230 + 70;
    v1 = +[IMRGLog warning];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10070B770(v0, v1);
    }
LABEL_4:

    return (double)v0;
  }
  int v0 = IMGetCachedDomainIntForKey();
  if (v0 >= 1)
  {
    v1 = +[IMRGLog warning];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10070B7E8(v0, v1);
    }
    goto LABEL_4;
  }
  id v3 = +[IDSServerBag sharedInstance];
  id v4 = [v3 objectForKey:@"vc-registration-hbi"];

  if (!v4 || ([v4 doubleValue], double v2 = v5, v5 < 580.0))
  {
    double v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10070B860((uint64_t)v4, v6);
    }

    double v2 = 2592000.0;
  }

  return v2;
}

- (double)_nextRegistrationHeartbeatTime
{
  double v3 = -[IDSHeartbeatCenter registrationHBI]_0();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_registrations;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412290;
    long long v18 = v6;
    double v9 = v3;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = +[IDSRegistrationCenter sharedInstance];
        unsigned __int8 v13 = [v12 isRegistering:v11];

        if ((v13 & 1) == 0)
        {
          if ([v11 registrationType])
          {
            if (([v11 canSendRegistration] & 1) == 0)
            {
              v14 = +[IMRGLog registration];
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v18;
                *(void *)&uint8_t buf[4] = v11;
                v15 = v14;
                int v16 = "Skipping this registration for heartbeat consideration, it is an Apple ID one - and it apparently "
                      "can't register: %@";
                goto LABEL_17;
              }
              goto LABEL_18;
            }
          }
          else if (!+[IDSRegistrationController validSIMStateForRegistration])
          {
            v14 = +[IMRGLog registration];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              *(void *)&uint8_t buf[4] = v11;
              v15 = v14;
              int v16 = "Skipping this registration for heartbeat consideration, it is an SMS one - and the SIM is not present: %@";
LABEL_17:
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
            }
LABEL_18:

            continue;
          }
          *(double *)buf = v3;
          [(IDSHeartbeatCenter *)self _registration:v11 needsRenewal:buf];
          if (*(double *)buf < v9) {
            double v9 = *(double *)buf;
          }
        }
      }
      id v7 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (!v7) {
        goto LABEL_23;
      }
    }
  }
  double v9 = v3;
LABEL_23:

  return fmax(v9, 1.0);
}

- (id)_registrationsPendingHeartbeat
{
  id v18 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v3 = self->_registrations;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v9 = +[IDSRegistrationCenter sharedInstance];
        unsigned int v10 = [v9 isRegistering:v8];

        if (v10)
        {
          char v11 = +[IMRGLog registration];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v8;
            uint64_t v12 = v11;
            unsigned __int8 v13 = "  => *NOT* adding pending registration: %@, we're currently registering";
            goto LABEL_15;
          }
          goto LABEL_16;
        }
        unsigned int v14 = [(IDSHeartbeatCenter *)self _registration:v8 needsRenewal:0];
        char v11 = +[IMRGLog registration];
        BOOL v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (!v14)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v8;
            uint64_t v12 = v11;
            unsigned __int8 v13 = "  => *NOT* adding pending registration: %@";
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
          }
LABEL_16:

          continue;
        }
        if (v15)
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  => adding pending registration: %@", buf, 0xCu);
        }

        [v18 addObject:v8];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }

  int v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registrations pending heartbeat: %@", buf, 0xCu);
  }

  return v18;
}

- (void)__reallyUpdateRegistrationHeartbeat
{
  self->_pendingHeartbeat = 0;
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating registration heartbeat", v4, 2u);
  }

  [(IDSHeartbeatCenter *)self _startRegistrationHeartbeat];
}

- (void)_updateRegistrationHeartbeat
{
  if (!self->_pendingHeartbeat)
  {
    self->_pendingHeartbeat = 1;
    [(CUTDeferredTaskQueue *)self->_reallyUpdateRegistrationHeartbeatTask cancelPendingExecutions];
    [(CUTDeferredTaskQueue *)self->_reallyUpdateRegistrationHeartbeatTask enqueueExecutionWithTarget:self afterDelay:10.0];
    double v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting pending registration heartbeat update", v4, 2u);
    }
  }
}

- (void)_startRegistrationHeartbeat
{
  [(IMTimer *)self->_registrationHeartbeatTimer invalidate];
  registrationHeartbeatTimer = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = 0;

  double v4 = -[IDSHeartbeatCenter registrationHBI]_0();
  [(IDSHeartbeatCenter *)self _nextRegistrationHeartbeatTime];
  double v6 = v5;
  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = IDSServerBagFinishedLoadingNotification;
  [v7 removeObserver:self name:IDSServerBagFinishedLoadingNotification object:0];

  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_bagReloaded:" name:v8 object:0];

  self->_listeningForRegStateChanges = 1;
  unsigned int v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting registration heartbeat with interval: %f", (uint8_t *)&v22, 0xCu);
  }

  char v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "                    Time to next registration: %f", (uint8_t *)&v22, 0xCu);
  }

  int v12 = IMGetCachedDomainIntForKey();
  double v13 = (double)v12;
  if (v12 <= 0) {
    double v13 = v6;
  }
  if (v13 <= 0.0) {
    double v14 = 300.0;
  }
  else {
    double v14 = v13;
  }
  BOOL v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "                  Setting heartbeat timer for: %f", (uint8_t *)&v22, 0xCu);
  }

  int v16 = +[NSDate dateWithTimeIntervalSinceNow:v14];
  registrationHeartbeatDate = self->_registrationHeartbeatDate;
  self->_registrationHeartbeatDate = v16;

  id v18 = objc_alloc((Class)IMTimer);
  long long v19 = im_primary_queue();
  long long v20 = (IMTimer *)[v18 initWithTimeInterval:@"com.apple.identityservices.registration-hbi" name:1 shouldWake:self target:"_serverHeartBeatTimerHit:" selector:0 userInfo:v19 queue:v14];
  long long v21 = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = v20;
}

- (void)_serverHeartBeatTimerHitOnMain:(id)a3
{
  id v4 = a3;
  double v5 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005EFB4;
  v7[3] = &unk_10097E440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_stopRegistrationHeartbeat
{
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping registration heartbeat", v6, 2u);
  }

  [(IMTimer *)self->_registrationHeartbeatTimer invalidate];
  registrationHeartbeatTimer = self->_registrationHeartbeatTimer;
  self->_registrationHeartbeatTimer = 0;

  self->_pendingHeartbeat = 0;
  [(CUTDeferredTaskQueue *)self->_reallyUpdateRegistrationHeartbeatTask cancelPendingExecutions];
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:IDSServerBagFinishedLoadingNotification object:0];

  self->_listeningForRegStateChanges = 0;
}

- (void)checkHeartbeat
{
  [(NSDate *)self->_registrationHeartbeatDate timeIntervalSinceNow];
  if (v3 < 0.0)
  {
    id v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We missed a heartbeat, we should fire", v5, 2u);
    }

    [(IDSHeartbeatCenter *)self _serverHeartBeatTimerHit:self->_registrationHeartbeatTimer];
  }
}

- (void)updateHeartbeat
{
  id v3 = [(NSMutableArray *)self->_registrations count];
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating heartbeats if necessary", v5, 2u);
  }

  if (v3) {
    [(IDSHeartbeatCenter *)self _updateRegistrationHeartbeat];
  }
  else {
    [(IDSHeartbeatCenter *)self _stopRegistrationHeartbeat];
  }
}

- (void)noteRegistrationStateChanged
{
  if (self->_listeningForRegStateChanges)
  {
    id v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registration state changed, re-checking registrations", v4, 2u);
    }

    [(IDSHeartbeatCenter *)self _serverHeartBeat:self->_registrationHeartbeatTimer];
  }
}

- (void)_bagReloaded:(id)a3
{
  id v4 = a3;
  if (self->_registrationHeartbeatTimer)
  {
    double v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bag reloaded, checking intervals", buf, 2u);
    }

    double v6 = -[IDSHeartbeatCenter registrationHBI]_0();
    if (floor(v6) != floor(self->_baseRegistrationHBI))
    {
      self->_baseRegistrationHBI = v6;
      id v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "These differ, reseting timer!", v8, 2u);
      }

      [(IDSHeartbeatCenter *)self _updateRegistrationHeartbeat];
    }
  }
}

- (void)addRegistrationInfo:(id)a3
{
  id v4 = a3;
  registrations = self->_registrations;
  if (!registrations)
  {
    double v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_registrations;
    self->_registrations = v6;

    registrations = self->_registrations;
  }
  if (([(NSMutableArray *)registrations containsObject:v4] & 1) == 0)
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding registration info to heartbeat: %@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableArray *)self->_registrations addObject:v4];
    [(IDSHeartbeatCenter *)self updateHeartbeat];
  }
}

- (void)removeRegistrationInfo:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_registrations containsObject:v4])
  {
    double v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing registration info from heartbeat: %@", (uint8_t *)&v7, 0xCu);
    }

    [(NSMutableArray *)self->_registrations removeObject:v4];
    [(IDSHeartbeatCenter *)self updateHeartbeat];
  }
  if (![(NSMutableArray *)self->_registrations count])
  {
    registrations = self->_registrations;
    self->_registrations = 0;
  }
}

- (CUTDeferredTaskQueue)reallyUpdateRegistrationHeartbeatTask
{
  return self->_reallyUpdateRegistrationHeartbeatTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reallyUpdateRegistrationHeartbeatTask, 0);
  objc_storeStrong((id *)&self->_registrationHeartbeatTimer, 0);
  objc_storeStrong((id *)&self->_registrationHeartbeatDate, 0);

  objc_storeStrong((id *)&self->_registrations, 0);
}

@end