@interface IDSDeviceHeartbeatCenter
+ (id)sharedInstance;
- (BOOL)_fetchExpiryDatesIfNecessary;
- (BOOL)_scheduleDependentRegistrations;
- (IDSDeviceHeartbeatCenter)init;
- (id)_getNextExpirationDate;
- (void)_cleanupKeychain;
- (void)_heartBeat;
- (void)_heartbeatTimerFiredOnMain;
- (void)_scheduleRescueHeartBeat;
- (void)_updateDependentRegistrationTimerFiredOnMain;
- (void)_updateDependentRegistrations;
- (void)_updateExpiry:(double)a3 forUser:(id)a4;
- (void)accountsChanged;
- (void)dealloc;
- (void)invalidateTimer;
- (void)printInfo;
- (void)resetExpiryForUser:(id)a3;
- (void)setup;
@end

@implementation IDSDeviceHeartbeatCenter

+ (id)sharedInstance
{
  if (qword_100A4A220 != -1) {
    dispatch_once(&qword_100A4A220, &stru_10097E4A8);
  }
  v2 = (void *)qword_100A4A228;

  return v2;
}

- (IDSDeviceHeartbeatCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSDeviceHeartbeatCenter;
  v2 = [(IDSDeviceHeartbeatCenter *)&v8 init];
  if (v2)
  {
    v3 = +[IMSystemMonitor sharedInstance];
    [v3 addListener:v2];

    getDependentHeartbeatTimer = v2->_getDependentHeartbeatTimer;
    v2->_getDependentHeartbeatTimer = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usersToHeartbeatDatesMap = v2->_usersToHeartbeatDatesMap;
    v2->_usersToHeartbeatDatesMap = v5;
  }
  return v2;
}

- (void)setup
{
  if (!self->_isSetup)
  {
    self->_isSetup = 1;
    [(IDSDeviceHeartbeatCenter *)self accountsChanged];
    [(IDSDeviceHeartbeatCenter *)self printInfo];
    [(IDSDeviceHeartbeatCenter *)self _fetchExpiryDatesIfNecessary];
    [(IDSDeviceHeartbeatCenter *)self _cleanupKeychain];
  }
}

- (void)_heartBeat
{
  if (![(IDSDeviceHeartbeatCenter *)self _scheduleDependentRegistrations])
  {
    v3 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did not find any date to schedule a heart beat, triggering get dependent request", v5, 2u);
    }

    [(IDSDeviceHeartbeatCenter *)self _scheduleRescueHeartBeat];
    v4 = +[IDSDAccountController sharedInstance];
    [v4 issueGetDependentRequest];
  }
}

- (id)_getNextExpirationDate
{
  if (IMGetCachedDomainBoolForKey())
  {
    int v3 = (int)SecureRandomUInt() % 230 + 70;
    v4 = +[IMRGLog warning];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100708D2C();
    }
LABEL_8:

    id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:(double)v3];
    goto LABEL_9;
  }
  int v3 = IMGetCachedDomainIntForKey();
  if (v3)
  {
    v4 = +[IMRGLog warning];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100708DAC();
    }
    goto LABEL_8;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = [(NSMutableDictionary *)self->_usersToHeartbeatDatesMap allValues];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8)
  {

    v10 = 0;
LABEL_25:
    id v20 = 0;
    goto LABEL_26;
  }
  id v9 = v8;
  v10 = 0;
  char v11 = 0;
  uint64_t v12 = *(void *)v22;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if ((v11 & 1) == 0
        || ([*(id *)(*((void *)&v21 + 1) + 8 * i) doubleValue],
            double v16 = v15,
            [v10 doubleValue],
            v16 < v17))
      {
        id v18 = v14;

        v10 = v18;
      }
      char v11 = 1;
    }
    id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);

  if (!v10) {
    goto LABEL_25;
  }
  id v19 = objc_alloc((Class)NSDate);
  [v10 doubleValue];
  id v20 = objc_msgSend(v19, "initWithTimeIntervalSince1970:");
LABEL_26:
  id v5 = v20;

LABEL_9:

  return v5;
}

- (void)dealloc
{
  int v3 = +[IMSystemMonitor sharedInstance];
  [v3 removeListener:self];

  [(IDSDeviceHeartbeatCenter *)self invalidateTimer];
  v4.receiver = self;
  v4.super_class = (Class)IDSDeviceHeartbeatCenter;
  [(IDSDeviceHeartbeatCenter *)&v4 dealloc];
}

- (void)printInfo
{
  if (IMShouldLog())
  {
    int v3 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Expiration dates per user: ", buf, 2u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v4 = [(NSMutableDictionary *)self->_usersToHeartbeatDatesMap allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v20;
      *(void *)&long long v6 = 138412546;
      long long v18 = v6;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v9);
          char v11 = +[IMRGLog deviceHeartbeat];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [(NSMutableDictionary *)self->_usersToHeartbeatDatesMap objectForKey:v10];
            [v12 doubleValue];
            v13 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
            *(_DWORD *)buf = v18;
            long long v24 = v10;
            __int16 v25 = 2112;
            v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ => %@", buf, 0x16u);
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v7);
    }

    v14 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [(IDSDeviceHeartbeatCenter *)self _getNextExpirationDate];
      double v16 = [(IDSDeviceHeartbeatCenter *)self _getNextExpirationDate];
      [v16 timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      long long v24 = v15;
      __int16 v25 = 2048;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Next heartbeat date: %@ (in %.0f seconds)", buf, 0x16u);
    }
  }
}

- (void)invalidateTimer
{
  [(IMTimer *)self->_getDependentHeartbeatTimer invalidate];
  getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
  self->_getDependentHeartbeatTimer = 0;
}

- (BOOL)_scheduleDependentRegistrations
{
  [(IDSDeviceHeartbeatCenter *)self invalidateTimer];
  objc_super v4 = [(IDSDeviceHeartbeatCenter *)self _getNextExpirationDate];
  id v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceNow];
    double v7 = v6;
    uint64_t v8 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 134218242;
      double v15 = v7;
      __int16 v16 = 2112;
      double v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_scheduleDependentRegistrations for %.0f - %@", (uint8_t *)&v14, 0x16u);
    }

    id v9 = objc_alloc((Class)IMTimer);
    v10 = im_primary_queue();
    char v11 = (IMTimer *)[v9 initWithTimeInterval:@"com.apple.identityservices.device-hbi" name:0 shouldWake:self target:"_updateDependentRegistrations" selector:0 userInfo:v10 queue:v7];
    getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
    self->_getDependentHeartbeatTimer = v11;
  }
  else
  {
    v10 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We did not find any heartbeat to schedule", (uint8_t *)&v14, 2u);
    }
  }

  return v5 != 0;
}

- (void)_updateDependentRegistrationTimerFiredOnMain
{
  int v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012B0C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_scheduleRescueHeartBeat
{
  [(IDSDeviceHeartbeatCenter *)self invalidateTimer];
  if ([(NSMutableDictionary *)self->_usersToHeartbeatDatesMap count])
  {
    int v3 = +[IDSServerBag sharedInstanceForBagType:0];
    objc_super v4 = [v3 objectForKey:@"vc-temporary-get-dependent-interval"];

    [v4 doubleValue];
    double v6 = v5;

    double v7 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      double v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_scheduleRescueHeartBeat for %.0f", (uint8_t *)&v12, 0xCu);
    }

    id v8 = objc_alloc((Class)IMTimer);
    id v9 = im_primary_queue();
    v10 = (IMTimer *)[v8 initWithTimeInterval:@"com.apple.identityservices.device-hbi" name:0 shouldWake:self target:"_heartBeat" selector:0 userInfo:v9 queue:v6];
    getDependentHeartbeatTimer = self->_getDependentHeartbeatTimer;
    self->_getDependentHeartbeatTimer = v10;
  }
}

- (void)_heartbeatTimerFiredOnMain
{
  int v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D04;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateDependentRegistrations
{
  [(IDSDeviceHeartbeatCenter *)self _scheduleRescueHeartBeat];
  v2 = +[IDSDAccountController sharedInstance];
  [v2 updateExpiredDependent];

  int v3 = +[IMRGLog deviceHeartbeat];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_updateDependentRegistrations fired", v4, 2u);
  }

  if (qword_100A4A238 != -1) {
    dispatch_once(&qword_100A4A238, &stru_10097E4F0);
  }
  if (off_100A4A230) {
    ((void (*)(uint64_t, const __CFString *, NSDictionary *, void))off_100A4A230)(13, @"IdentityServicesDeviceHeartbeat", +[NSDictionary dictionaryWithObject:@"sending IdentityServices Device Heartbeat" forKey:@"action"], 0);
  }
}

- (void)resetExpiryForUser:(id)a3
{
  id v4 = a3;
  double v5 = +[IMRGLog deviceHeartbeat];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting expiry for %@", (uint8_t *)&v6, 0xCu);
  }

  [(IDSDeviceHeartbeatCenter *)self _updateExpiry:v4 forUser:0.0];
}

- (void)_updateExpiry:(double)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_isSetup)
  {
    double v17 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not setup yet, ignoring expiry update...", (uint8_t *)&v18, 2u);
    }
    goto LABEL_16;
  }
  if (![v6 length])
  {
    double v17 = +[IMRGLog warning];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100708E2C((uint64_t)v7, v17);
    }
LABEL_16:

    goto LABEL_17;
  }
  id v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  if (v11 > a3)
  {
    if (a3 > 2.22044605e-16)
    {
      int v12 = +[IMRGLog warning];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412802;
        CFStringRef v19 = @"DeviceHeartbeat";
        __int16 v20 = 2048;
        double v21 = 60.0;
        __int16 v22 = 2048;
        double v23 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ -  updateExpiry failed sanity check. Returning current date + %f seconds expiry was %f", (uint8_t *)&v18, 0x20u);
      }
    }
    a3 = v11 + 60.0;
  }
  double v13 = +[IMRGLog deviceHeartbeat];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = +[NSDate dateWithTimeIntervalSince1970:a3];
    int v18 = 138412802;
    CFStringRef v19 = v14;
    __int16 v20 = 2048;
    double v21 = a3;
    __int16 v22 = 2112;
    double v23 = *(double *)&v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting new expiry %@ (seconds %f) for user %@", (uint8_t *)&v18, 0x20u);
  }
  usersToHeartbeatDatesMap = self->_usersToHeartbeatDatesMap;
  __int16 v16 = +[NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)usersToHeartbeatDatesMap setObject:v16 forKey:v7];

  [(IDSDeviceHeartbeatCenter *)self _heartBeat];
LABEL_17:
}

- (void)accountsChanged
{
  BOOL isSetup = self->_isSetup;
  id v4 = +[IMRGLog deviceHeartbeat];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isSetup)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accounts changed, updating expiry map", buf, 2u);
    }

    [(NSMutableDictionary *)self->_usersToHeartbeatDatesMap removeAllObjects];
    id v6 = +[IDSDAccountController sharedInstance];
    id v7 = [v6 accounts];
    id v8 = [v7 _copyForEnumerating];

    id v9 = objc_alloc_init((Class)NSMutableSet);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (([v15 isAdHocAccount] & 1) == 0
            && [v15 isEnabled]
            && [v15 isRegistered])
          {
            __int16 v16 = [v15 registration];
            double v17 = [v16 idsUserID];

            if ([v17 length])
            {
              if (([v9 containsObject:v17] & 1) == 0)
              {
                int v18 = [v15 registration];
                CFStringRef v19 = [v18 dependentRegistrationsTTL];

                if (v19)
                {
                  [v19 timeIntervalSince1970];
                  -[IDSDeviceHeartbeatCenter _updateExpiry:forUser:](self, "_updateExpiry:forUser:", v17);
                  [v9 addObject:v17];
                }
                else
                {
                  __int16 v20 = +[IMRGLog deviceHeartbeat];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v27 = v17;
                    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Did not find existing expiry for user %@", buf, 0xCu);
                  }
                }
                goto LABEL_21;
              }
            }
            else
            {
              CFStringRef v19 = +[IMRGLog deviceHeartbeat];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v15;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Missing userID for account %@, ignoring...", buf, 0xCu);
              }
LABEL_21:
            }
            continue;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v12);
    }

    if (![(NSMutableDictionary *)self->_usersToHeartbeatDatesMap count]) {
      [(IDSDeviceHeartbeatCenter *)self invalidateTimer];
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not setup yet, ignoring accounts change...", buf, 2u);
    }
  }
}

- (BOOL)_fetchExpiryDatesIfNecessary
{
  if (self->_isSetup)
  {
    v2 = +[IDSDAccountController sharedInstance];
    int v3 = [v2 accounts];
    id v4 = [v3 _copyForEnumerating];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (!v6)
    {
LABEL_30:
      int v18 = v5;
LABEL_31:

      goto LABEL_32;
    }
    char v7 = 0;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = ((char *)i + 1))
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isAdHocAccount", (void)v20) & 1) == 0)
        {
          id v11 = [v10 registration];
          id v12 = [v11 dependentRegistrationResponseCode];
          id v13 = [v12 integerValue];
          if ([v10 isEnabled])
          {
            BOOL v14 = !v12 || v13 == 0;
            BOOL v15 = !v14;
            if ([v10 isRegistered] && !v15)
            {
              __int16 v16 = [v10 registration];
              double v17 = [v16 dependentRegistrationsTTL];

              if (v17)
              {

                LOBYTE(v6) = 0;
                goto LABEL_30;
              }
              char v7 = 1;
            }
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if (v7)
    {
      id v6 = +[IMRGLog deviceHeartbeat];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "There is one or more valid accounts but none of them has an expiry date, refreshing the entire list!", buf, 2u);
      }

      int v18 = +[IDSDAccountController sharedInstance];
      [v18 issueGetDependentRequest];
      LOBYTE(v6) = 1;
      goto LABEL_31;
    }
  }
  else
  {
    BOOL v5 = +[IMRGLog deviceHeartbeat];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not setup yet, ignoring _fetchExpiryTimeIfNecessary", buf, 2u);
    }
  }
  LOBYTE(v6) = 0;
LABEL_32:

  return (char)v6;
}

- (void)_cleanupKeychain
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usersToHeartbeatDatesMap, 0);

  objc_storeStrong((id *)&self->_getDependentHeartbeatTimer, 0);
}

@end