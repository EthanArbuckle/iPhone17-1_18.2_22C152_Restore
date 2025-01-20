@interface ParentalControls
+ (id)objectForKey:(id)a3;
+ (id)standardControls;
- (BOOL)active;
- (BOOL)disableAV;
- (BOOL)disableAccount:(id)a3;
- (BOOL)disableService:(id)a3;
- (BOOL)disableServiceSession:(id)a3;
- (BOOL)forceAllowlistForServiceSession:(id)a3;
- (BOOL)forceChatLogging;
- (BOOL)shouldPostNotifications;
- (ParentalControls)init;
- (id)_serviceWithName:(id)a3;
- (id)allowlistForServiceSession:(id)a3;
- (void)_managedPrefsNotification:(id)a3;
- (void)_updateParentalSettings;
- (void)setShouldPostNotifications:(BOOL)a3;
- (void)updateAccountActivation;
@end

@implementation ParentalControls

+ (id)standardControls
{
  id result = (id)qword_10007D320;
  if (!qword_10007D320)
  {
    qword_10007D320 = objc_alloc_init(ParentalControls);
    [(id)qword_10007D320 setShouldPostNotifications:0];
    [(id)qword_10007D320 _updateParentalSettings];
    [(id)qword_10007D320 setShouldPostNotifications:1];
    return (id)qword_10007D320;
  }
  return result;
}

- (ParentalControls)init
{
  v8.receiver = self;
  v8.super_class = (Class)ParentalControls;
  v2 = [(ParentalControls *)&v8 init];
  if (v2)
  {
    v2->_parentalControls = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:v2 selector:"_managedPrefsNotification:" name:kCFManagedPreferencesMCXNotificationName object:kCFManagedPreferencesMCXObjectName];
    v4 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v4 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRegistrationCapabilityChangedNotification object:0];
    v5 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v5 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceCapabilityChangedNotification object:0];
    v6 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v6 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRestictionsChangedNotification object:0];
  }
  return v2;
}

- (id)_serviceWithName:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:");
  if (!result)
  {
    v6 = objc_alloc_init(ParentalControlsService);
    [(ParentalControlsService *)v6 setName:a3];
    [(NSMutableDictionary *)self->_parentalControls setObject:v6 forKey:a3];
    return v6;
  }
  return result;
}

- (void)_updateParentalSettings
{
  BOOL active = self->_active;
  if (self->_active) {
    self->_BOOL active = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [(NSMutableDictionary *)self->_parentalControls allValues];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (_IMWillLog())
        {
          id v8 = [v7 name];
          if ([v7 disableService]) {
            CFStringRef v9 = @"YES";
          }
          else {
            CFStringRef v9 = @"NO";
          }
          id v13 = v8;
          CFStringRef v14 = v9;
          _IMAlwaysLog();
        }
        if (_IMWillLog())
        {
          id v10 = [v7 name];
          if ([v7 forceAllowlist]) {
            CFStringRef v11 = @"YES";
          }
          else {
            CFStringRef v11 = @"NO";
          }
          id v13 = v10;
          CFStringRef v14 = v11;
          _IMAlwaysLog();
        }
        if (_IMWillLog())
        {
          id v13 = [v7 name];
          CFStringRef v14 = (const __CFString *)[v7 allowlist];
          _IMAlwaysLog();
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  if (active && self->_shouldPostNotifications)
  {
    v12 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v12 __mainThreadPostNotificationName:IMDManagedPreferencesChangedNotification object:self];
  }
  [(ParentalControls *)self updateAccountActivation];
}

+ (id)objectForKey:(id)a3
{
  id result = [a3 length];
  if (result)
  {
    id v5 = [@"Setting." stringByAppendingString:a3];
    return +[NSUserDefaults _IMAgentObjectForKey:v5];
  }
  return result;
}

- (void)updateAccountActivation
{
  id v3 = +[IMDAccountController sharedAccountController];
  unsigned int v4 = [v3 isLoading];
  id v5 = +[IMRGLog registration];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting on account activate, the account controller isn't ready yet", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " Updating account activation if needed", buf, 2u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v3 accounts];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v17;
      *(void *)&long long v9 = 138412290;
      long long v15 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "isActive", v15)
            && [(ParentalControls *)self disableAccount:v13])
          {
            objc_msgSend(v3, "deactivateAccount:", objc_msgSend(v13, "accountID"));
            [v13 setWasDisabledAutomatically:1];
          }
          else if (([v13 isActive] & 1) == 0 {
                 && ![(ParentalControls *)self disableAccount:v13]
          }
                 && [v13 wasDisabledAutomatically])
          {
            CFStringRef v14 = +[IMRGLog registration];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Re-activating a disabled account: %@", buf, 0xCu);
            }
            objc_msgSend(v3, "activateAccount:", objc_msgSend(v13, "accountID"));
            objc_msgSend(objc_msgSend(v13, "session"), "login");
          }
        }
        id v10 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)disableAV
{
  BOOL v3 = [(ParentalControls *)self active];
  if (v3) {
    LOBYTE(v3) = self->_disableAV;
  }
  return v3;
}

- (BOOL)forceChatLogging
{
  BOOL v3 = [(ParentalControls *)self active];
  if (v3) {
    LOBYTE(v3) = self->_forceChatLogging;
  }
  return v3;
}

- (BOOL)disableService:(id)a3
{
  if (a3)
  {
    unsigned int v5 = [(ParentalControls *)self active];
    if (v5)
    {
      id v6 = -[ParentalControls _serviceWithName:](self, "_serviceWithName:", [a3 internalName]);
      LOBYTE(v5) = [v6 disableService];
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)disableAccount:(id)a3
{
  id v4 = [a3 service];

  return [(ParentalControls *)self disableService:v4];
}

- (BOOL)disableServiceSession:(id)a3
{
  id v4 = [a3 service];

  return [(ParentalControls *)self disableService:v4];
}

- (id)allowlistForServiceSession:(id)a3
{
  id result = [a3 service];
  if (result)
  {
    id v5 = result;
    if ([(ParentalControls *)self active])
    {
      id v6 = objc_msgSend(-[ParentalControls _serviceWithName:](self, "_serviceWithName:", objc_msgSend(v5, "internalName")), "allowlist");
      if ([v6 count]) {
        return v6;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)forceAllowlistForServiceSession:(id)a3
{
  id v4 = [a3 service];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = [(ParentalControls *)self active];
    if (v6)
    {
      id v7 = -[ParentalControls _serviceWithName:](self, "_serviceWithName:", [v5 internalName]);
      LOBYTE(v6) = [v7 forceAllowlist];
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_managedPrefsNotification:(id)a3
{
  [(ParentalControls *)self _updateParentalSettings];
  id v3 = +[IMDAccountController sharedAccountController];

  _[v3 load];
}

- (BOOL)shouldPostNotifications
{
  return self->_shouldPostNotifications;
}

- (void)setShouldPostNotifications:(BOOL)a3
{
  self->_shouldPostNotifications = a3;
}

- (BOOL)active
{
  return self->_active;
}

@end