@interface IDSSIMResponder
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSRegistrationController)registrationController;
- (IDSRestrictions)restrictions;
- (IDSSIMResponder)initWithAccountController:(id)a3 serviceController:(id)a4 restrictions:(id)a5 registrationController:(id)a6;
- (NSDate)registrationStateChangedDate;
- (int64_t)registrationStateChangedCounter;
- (void)_checkTechChange;
- (void)_enumeratePrimaryAccountsOfType:(int)a3 block:(id)a4;
- (void)handleRegistrationStateChanged:(BOOL)a3;
- (void)handleSIMInserted;
- (void)handleSIMRemoved;
- (void)setAccountController:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setRegistrationStateChangedCounter:(int64_t)a3;
- (void)setRegistrationStateChangedDate:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSSIMResponder

- (IDSSIMResponder)initWithAccountController:(id)a3 serviceController:(id)a4 restrictions:(id)a5 registrationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSSIMResponder;
  v15 = [(IDSSIMResponder *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountController, a3);
    objc_storeStrong((id *)&v16->_serviceController, a4);
    objc_storeStrong((id *)&v16->_restrictions, a5);
    objc_storeStrong((id *)&v16->_registrationController, a6);
  }

  return v16;
}

- (void)_enumeratePrimaryAccountsOfType:(int)a3 block:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(IDSSIMResponder *)self accountController];
  v8 = [v7 accounts];

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 accountType] == a3)
        {
          id v14 = [v13 service];
          v6[2](v6, v13, v14);
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_checkTechChange
{
  if (!+[IDSRegistrationController validSIMStateForRegistration])
  {
    v5 = +[IMRGLog registration];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      return;
    }
    *(_WORD *)buf = 0;
    v6 = "SIM Is not ready for registration, ignoring this.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_10;
  }
  v3 = +[IMLockdownManager sharedInstance];
  unsigned int v4 = [v3 isExpired];

  if (v4)
  {
    if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
    return;
  }
  v7 = +[FTEntitlementSupport sharedInstance];
  unsigned int v8 = [v7 faceTimeNonWiFiEntitled];

  if (!v8)
  {
    v5 = +[IMRGLog registration];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v6 = "  => Device is not entitled for this, ignoring tech change";
    goto LABEL_9;
  }
  id v9 = +[FTDeviceSupport sharedInstance];
  unsigned int v10 = [v9 isC2KEquipment];

  uint64_t v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  => Is CDMA: %@", buf, 0xCu);
  }

  id v13 = [(IDSSIMResponder *)self registrationController];
  id v14 = [v13 trackedRegistrations];

  id v15 = [v14 count];
  long long v16 = +[IMRGLog registration];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      unsigned int v18 = [v14 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v16 = v14;
    id v19 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v16);
          }
          v23 = (__CFString *)*(id *)(*((void *)&v28 + 1) + 8 * i);
          if (![(__CFString *)v23 registrationType])
          {
            v24 = [(__CFString *)v23 isCDMA];
            unsigned int v25 = [v24 intValue];

            v26 = +[IMRGLog registration];
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25 == v10)
            {
              if (v27)
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v34 = v23;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Registration matches, not re-registering: %@", buf, 0xCu);
              }
            }
            else
            {
              if (v27)
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v34 = v23;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Re-HTTP registering registration: %@", buf, 0xCu);
              }

              v26 = +[IDSRegistrationCenter sharedInstance];
              [v26 sendRegistration:v23];
            }
          }
        }
        id v20 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }
  }
  else if (v17)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
  }
}

- (void)handleSIMInserted
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100024A5C;
  v24[3] = &unk_10097E888;
  v24[4] = self;
  [(IDSSIMResponder *)self _enumeratePrimaryAccountsOfType:0 block:v24];
  v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIM Inserted. Checking to see if we need to re-register due to SIM swap.", buf, 2u);
  }

  unsigned int v4 = +[IMLockdownManager sharedInstance];
  unsigned int v5 = [v4 isExpired];

  if (v5)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  else
  {
    v6 = [(IDSSIMResponder *)self registrationController];
    v7 = [v6 trackedRegistrations];

    id v8 = [v7 count];
    id v9 = +[IMRGLog registration];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        unsigned int v11 = [v7 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v7;
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        id v19 = v7;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v9);
            }
            long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (![v16 registrationType])
            {
              BOOL v17 = +[IMRGLog registration];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  => Re-sending HTTP registration for SMS registration: %@", buf, 0xCu);
              }

              unsigned int v18 = +[IDSRegistrationCenter sharedInstance];
              [v18 sendRegistration:v16];
            }
          }
          id v13 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
        }
        while (v13);
        v7 = v19;
      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
    }
  }
}

- (void)handleRegistrationStateChanged:(BOOL)a3
{
  [(IDSSIMResponder *)self _checkTechChange];
  if (a3)
  {
    registrationStateChangedDate = self->_registrationStateChangedDate;
    if (registrationStateChangedDate)
    {
      [(NSDate *)registrationStateChangedDate timeIntervalSinceNow];
      if (v6 < 0.0) {
        double v6 = -v6;
      }
      BOOL v7 = v6 <= 86400.0;
    }
    else
    {
      BOOL v7 = 0;
    }
    int64_t registrationStateChangedCounter = self->_registrationStateChangedCounter;
    BOOL v10 = +[IDSServerBag sharedInstanceForBagType:0];
    unsigned int v11 = [v10 objectForKey:@"registration-state-changed-max-count"];

    if (v11) {
      uint64_t v12 = (uint64_t)[v11 integerValue];
    }
    else {
      uint64_t v12 = 10;
    }

    if (registrationStateChangedCounter >= v12 && v7)
    {
      uint64_t v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007090F4(v14);
      }
    }
    else
    {
      if (!v7)
      {
        id v15 = self->_registrationStateChangedDate;
        self->_registrationStateChangedDate = 0;

        self->_int64_t registrationStateChangedCounter = 0;
      }
      *(void *)buf = 0;
      unsigned int v25 = buf;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100024EA8;
      v23[3] = &unk_10097E8B0;
      v23[4] = self;
      v23[5] = buf;
      [(IDSSIMResponder *)self _enumeratePrimaryAccountsOfType:0 block:v23];
      if (v25[24])
      {
        long long v16 = self->_registrationStateChangedDate;
        if (v16)
        {
          BOOL v17 = v16;
        }
        else
        {
          BOOL v17 = +[NSDate date];
        }
        unsigned int v18 = self->_registrationStateChangedDate;
        self->_registrationStateChangedDate = v17;

        ++self->_registrationStateChangedCounter;
      }
      id v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v20 = @"NO";
        long long v21 = self->_registrationStateChangedDate;
        int64_t v22 = self->_registrationStateChangedCounter;
        if (v7) {
          CFStringRef v20 = @"YES";
        }
        *(_DWORD *)long long v28 = 138412802;
        CFStringRef v29 = v20;
        __int16 v30 = 2112;
        long long v31 = v21;
        __int16 v32 = 2048;
        int64_t v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Registration state changed processed {withinTimeRange: %@, _registrationStateChangedDate: %@, _registrationStateChangedCounter: %lld}", v28, 0x20u);
      }

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registration state changed but we can't register; not enabling phone number accounts",
        buf,
        2u);
    }
  }
}

- (void)handleSIMRemoved
{
  v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIM Removed. Checking to see if we need to re-register due to SIM removal.", buf, 2u);
  }

  unsigned int v4 = +[IMLockdownManager sharedInstance];
  unsigned int v5 = [v4 isExpired];

  if (v5)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  else
  {
    double v6 = [(IDSSIMResponder *)self registrationController];
    BOOL v7 = [v6 trackedRegistrations];

    id v8 = [v7 count];
    id v9 = +[IMRGLog registration];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        unsigned int v11 = [v7 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v7;
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v12)
      {
        id v13 = v12;
        id v19 = v7;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v9);
            }
            long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (![v16 registrationType])
            {
              BOOL v17 = +[IMRGLog registration];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unsigned int v25 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  => Sending HTTP *deregistration* for SMS registration: %@", buf, 0xCu);
              }

              unsigned int v18 = +[IDSRegistrationCenter sharedInstance];
              [v18 sendDeregistration:v16];
            }
          }
          id v13 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v13);
        BOOL v7 = v19;
      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
    }
  }
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (NSDate)registrationStateChangedDate
{
  return self->_registrationStateChangedDate;
}

- (void)setRegistrationStateChangedDate:(id)a3
{
}

- (int64_t)registrationStateChangedCounter
{
  return self->_registrationStateChangedCounter;
}

- (void)setRegistrationStateChangedCounter:(int64_t)a3
{
  self->_int64_t registrationStateChangedCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationStateChangedDate, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end