@interface IDSRestrictions
+ (IDSRestrictions)sharedInstance;
- (BOOL)_isDisabledService:(id)a3;
- (BOOL)active;
- (BOOL)shouldDisableAccount:(id)a3;
- (BOOL)shouldDisableService:(id)a3;
- (BOOL)shouldPostNotifications;
- (IDSRestrictions)init;
- (unint64_t)_restrictionReasonForService:(id)a3;
- (unint64_t)restrictionReasonForService:(id)a3;
- (void)_managedPrefsNotification:(id)a3;
- (void)_setRestrictionReason:(unint64_t)a3 forService:(id)a4;
- (void)_updateParentalSettings;
- (void)_updateParentalSettingsIfFTInstallChanged;
- (void)_updateParentalSettingsIfMessagesInstallChanged;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)refreshStateForAccount:(id)a3;
- (void)setShouldPostNotifications:(BOOL)a3;
- (void)updateAccountActivation;
@end

@implementation IDSRestrictions

- (unint64_t)restrictionReasonForService:(id)a3
{
  id v4 = a3;
  if (![v4 adHocServiceType]) {
    goto LABEL_3;
  }
  v5 = +[IDSDServiceController sharedInstance];
  v6 = objc_msgSend(v5, "primaryServiceForAdhocServiceType:", objc_msgSend(v4, "adHocServiceType"));

  v7 = [v6 identifier];
  unint64_t v8 = [(IDSRestrictions *)self _restrictionReasonForService:v7];

  if (!v8)
  {
LABEL_3:
    v9 = [v4 identifier];
    unint64_t v8 = [(IDSRestrictions *)self _restrictionReasonForService:v9];
  }
  return v8;
}

- (unint64_t)_restrictionReasonForService:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_parentalControls objectForKey:v4];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_parentalControls objectForKey:v4];
    unint64_t v7 = [v6 unsignedIntValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (IDSRestrictions)sharedInstance
{
  if (qword_100A4A8B8 != -1) {
    dispatch_once(&qword_100A4A8B8, &stru_100984650);
  }
  if (qword_100A4A8C0 != -1) {
    dispatch_once(&qword_100A4A8C0, &stru_100984670);
  }
  if (qword_100A4A8C8 != -1) {
    dispatch_once(&qword_100A4A8C8, &stru_100984690);
  }
  v2 = (void *)qword_100A4A8D0;

  return (IDSRestrictions *)v2;
}

- (IDSRestrictions)init
{
  v15.receiver = self;
  v15.super_class = (Class)IDSRestrictions;
  v2 = [(IDSRestrictions *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parentalControls = v2->_parentalControls;
    v2->_parentalControls = v3;

    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      uint64_t v5 = +[LSApplicationWorkspace defaultWorkspace];
      applicationWorkspace = v2->_applicationWorkspace;
      v2->_applicationWorkspace = (LSApplicationWorkspace *)v5;

      [(LSApplicationWorkspace *)v2->_applicationWorkspace addObserver:v2];
      v2->_cachedFTInstallState = [(LSApplicationWorkspace *)v2->_applicationWorkspace applicationIsInstalled:@"com.apple.facetime"];
      v2->_cachedMessagesInstallState = [(LSApplicationWorkspace *)v2->_applicationWorkspace applicationIsInstalled:@"com.apple.MobileSMS"];
      unint64_t v7 = +[IMRGLog registration];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = @"YES";
        if (v2->_cachedFTInstallState) {
          CFStringRef v9 = @"YES";
        }
        else {
          CFStringRef v9 = @"NO";
        }
        if (!v2->_cachedMessagesInstallState) {
          CFStringRef v8 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v17 = v9;
        __int16 v18 = 2112;
        CFStringRef v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initial FT App Install State %@, Initial Messages App Install State %@", buf, 0x16u);
      }
    }
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_managedPrefsNotification:" name:kCFManagedPreferencesMCXNotificationName object:kCFManagedPreferencesMCXObjectName];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRegistrationCapabilityChangedNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceCapabilityChangedNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRestictionsChangedNotification object:0];
  }
  return v2;
}

- (void)_updateParentalSettingsIfFTInstallChanged
{
  unsigned int v3 = [(LSApplicationWorkspace *)self->_applicationWorkspace applicationIsInstalled:@"com.apple.facetime"];
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v9 = 138412290;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking FT App Install State %@", (uint8_t *)&v9, 0xCu);
  }

  if (self->_cachedFTInstallState != v3)
  {
    v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"YES";
      if (self->_cachedFTInstallState) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if (!v3) {
        CFStringRef v7 = @"NO";
      }
      int v9 = 138412546;
      CFStringRef v10 = v8;
      __int16 v11 = 2112;
      CFStringRef v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received FaceTime App Install State change {old: %@, new: %@}", (uint8_t *)&v9, 0x16u);
    }

    self->_cachedFTInstallState = v3;
    [(IDSRestrictions *)self _updateParentalSettings];
  }
}

- (void)_updateParentalSettingsIfMessagesInstallChanged
{
  unsigned int v3 = [(LSApplicationWorkspace *)self->_applicationWorkspace applicationIsInstalled:@"com.apple.MobileSMS"];
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v9 = 138412290;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking Messages App Install State %@", (uint8_t *)&v9, 0xCu);
  }

  if (self->_cachedMessagesInstallState != v3)
  {
    v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"YES";
      if (self->_cachedMessagesInstallState) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if (!v3) {
        CFStringRef v7 = @"NO";
      }
      int v9 = 138412546;
      CFStringRef v10 = v8;
      __int16 v11 = 2112;
      CFStringRef v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received Messages App Install State change {old: %@, new: %@}", (uint8_t *)&v9, 0x16u);
    }

    self->_cachedMessagesInstallState = v3;
    [(IDSRestrictions *)self _updateParentalSettings];
  }
}

- (BOOL)_isDisabledService:(id)a3
{
  unsigned int v3 = [(NSMutableDictionary *)self->_parentalControls objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_setRestrictionReason:(unint64_t)a3 forService:(id)a4
{
  parentalControls = self->_parentalControls;
  if (a3)
  {
    id v6 = a4;
    id v7 = +[NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableDictionary setObject:forKey:](parentalControls, "setObject:forKey:");
  }
  else
  {
    id v7 = a4;
    -[NSMutableDictionary removeObjectForKey:](parentalControls, "removeObjectForKey:");
  }
}

- (void)_updateParentalSettings
{
  v2 = self;
  BOOL v3 = !self->_active;
  if (!self->_active) {
    self->_active = 1;
  }
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = [(IDSRestrictions *)v2 _restrictionReasonForService:@"com.apple.ess"];
  id v6 = +[FTDeviceSupport sharedInstance];
  if ([v6 faceTimeSupported])
  {
    id v7 = +[FTDeviceSupport sharedInstance];
    if ([v7 faceTimeBlocked]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  if (_os_feature_enabled_impl() && !v2->_cachedFTInstallState) {
    uint64_t v8 = 3;
  }
  if ((id)v8 != v5)
  {
    [(IDSRestrictions *)v2 _setRestrictionReason:v8 forService:@"com.apple.ess"];
    [v4 addObject:@"com.apple.ess"];
    BOOL v3 = 1;
  }
  id v9 = [(IDSRestrictions *)v2 _restrictionReasonForService:@"com.apple.private.ac"];
  CFStringRef v10 = +[FTDeviceSupport sharedInstance];
  if ([v10 callingSupported])
  {
    __int16 v11 = +[FTDeviceSupport sharedInstance];
    if ([v11 callingBlocked]) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  if (_os_feature_enabled_impl() && !v2->_cachedFTInstallState) {
    uint64_t v12 = 3;
  }
  if ((id)v12 != v9)
  {
    [(IDSRestrictions *)v2 _setRestrictionReason:v12 forService:@"com.apple.private.ac"];
    [v4 addObject:@"com.apple.private.ac"];
    BOOL v3 = 1;
  }
  id v13 = [(IDSRestrictions *)v2 _restrictionReasonForService:@"com.apple.private.alloy.facetime.multi"];
  v14 = +[FTDeviceSupport sharedInstance];
  if ([v14 multiwaySupported])
  {
    objc_super v15 = +[FTDeviceSupport sharedInstance];
    if ([v15 multiwayBlocked]) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }

  if (_os_feature_enabled_impl() && !v2->_cachedFTInstallState) {
    uint64_t v16 = 3;
  }
  if ((id)v16 != v13)
  {
    [(IDSRestrictions *)v2 _setRestrictionReason:v16 forService:@"com.apple.private.alloy.facetime.multi"];
    [v4 addObject:@"com.apple.private.alloy.facetime.multi"];
    BOOL v3 = 1;
  }
  id v17 = [(IDSRestrictions *)v2 _restrictionReasonForService:@"com.apple.madrid"];
  __int16 v18 = +[FTDeviceSupport sharedInstance];
  if ([v18 iMessageSupported])
  {
    CFStringRef v19 = +[FTDeviceSupport sharedInstance];
    if ([v19 iMessageBlocked]) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 1;
  }

  if (_os_feature_enabled_impl() && !v2->_cachedMessagesInstallState) {
    uint64_t v20 = 3;
  }
  if ((id)v20 != v17)
  {
    [(IDSRestrictions *)v2 _setRestrictionReason:v20 forService:@"com.apple.madrid"];
    [v4 addObject:@"com.apple.madrid"];
    BOOL v3 = 1;
  }
  v21 = +[IMRGLog registration];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = [(IDSRestrictions *)v2 active];
    CFStringRef v23 = @"NO";
    if (v22) {
      CFStringRef v23 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v67 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDSRestrictions - Active: %@", buf, 0xCu);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v24 = v2->_parentalControls;
  id v25 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v61;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v61 != v27) {
          objc_enumerationMutation(v24);
        }
        CFStringRef v29 = *(const __CFString **)(*((void *)&v60 + 1) + 8 * i);
        v30 = +[IMRGLog registration];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          [(NSMutableDictionary *)v2->_parentalControls objectForKey:v29];
          v32 = v31 = v2;
          id v33 = [v32 unsignedLongValue];
          *(_DWORD *)buf = 138412546;
          CFStringRef v67 = v29;
          __int16 v68 = 2048;
          id v69 = v33;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "IDSRestrictions - %@ Restriction Reason: %lu", buf, 0x16u);

          v2 = v31;
        }
      }
      id v26 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v26);
  }

  char v34 = !v3;
  if (!v2->_shouldPostNotifications) {
    char v34 = 1;
  }
  if ((v34 & 1) == 0)
  {
    v35 = +[NSNotificationCenter defaultCenter];
    objc_msgSend(v35, "__mainThreadPostNotificationName:object:", @"__kIDSRestrictionsChangedNotification", 0);

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v49;
    id v36 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v57;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
          unint64_t v41 = [(IDSRestrictions *)v2 _restrictionReasonForService:v40];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10018F8BC;
          v55[3] = &unk_1009846E8;
          v55[4] = v40;
          v55[5] = v41;
          v42 = objc_retainBlock(v55);
          ((void (*)(void *, uint64_t))v42[2])(v42, v40);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v43 = +[IDSDServiceController sharedInstance];
          v44 = [v43 adHocServicesForIdentifier:v40];

          id v45 = [v44 countByEnumeratingWithState:&v51 objects:v64 count:16];
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v52;
            do
            {
              for (k = 0; k != v46; k = (char *)k + 1)
              {
                if (*(void *)v52 != v47) {
                  objc_enumerationMutation(v44);
                }
                ((void (*)(void *, void))v42[2])(v42, *(void *)(*((void *)&v51 + 1) + 8 * (void)k));
              }
              id v46 = [v44 countByEnumeratingWithState:&v51 objects:v64 count:16];
            }
            while (v46);
          }
        }
        id v37 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v37);
    }
  }
  [(IDSRestrictions *)v2 updateAccountActivation];
}

- (void)updateAccountActivation
{
  BOOL v3 = +[IDSDAccountController sharedInstance];
  unsigned __int8 v4 = [v3 accountsLoaded];
  id v5 = +[IMRGLog registration];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " Updating account activation if needed", buf, 2u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [v3 accounts];
    id v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v19;
      *(void *)&long long v8 = 138412290;
      long long v17 = v8;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isAdHocAccount", v17) & 1) == 0)
          {
            if ([v12 isEnabled]
              && [(IDSRestrictions *)self shouldDisableAccount:v12])
            {
              id v13 = +[IMRGLog registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                CFStringRef v23 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDSRestrictions - Disabling account: %@", buf, 0xCu);
              }

              v14 = [v12 uniqueID];
              [v3 disableAccountWithUniqueID:v14];

              [v12 setWasDisabledAutomatically:1];
            }
            else if (([v12 isEnabled] & 1) == 0 {
                   && ![(IDSRestrictions *)self shouldDisableAccount:v12]
            }
                   && [v12 wasDisabledAutomatically])
            {
              objc_super v15 = +[IMRGLog registration];
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                CFStringRef v23 = v12;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IDSRestrictions - Re-activating a disabled account: %@", buf, 0xCu);
              }

              uint64_t v16 = [v12 uniqueID];
              [v3 enableAccountWithUniqueID:v16];
            }
          }
        }
        id v9 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting on account activate, the account controller isn't ready yet", buf, 2u);
  }
}

- (BOOL)shouldDisableService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(IDSRestrictions *)self active])
    {
      id v5 = [v4 identifier];
      BOOL v6 = [(IDSRestrictions *)self _isDisabledService:v5];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)shouldDisableAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(IDSRestrictions *)self active])
    {
      id v5 = [v4 service];
      BOOL v6 = [(IDSRestrictions *)self shouldDisableService:v5];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)refreshStateForAccount:(id)a3
{
  id v8 = a3;
  id v4 = [v8 serviceType];
  int v5 = IDSIsAnyFaceTimeRelatedRegistrationServiceType();

  if (v5)
  {
    [(IDSRestrictions *)self _updateParentalSettingsIfFTInstallChanged];
  }
  else
  {
    BOOL v6 = [v8 serviceType];
    int v7 = IDSIsiMessageRegistrationServiceType();

    if (v7) {
      [(IDSRestrictions *)self _updateParentalSettingsIfMessagesInstallChanged];
    }
  }
}

- (void)_managedPrefsNotification:(id)a3
{
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDSRestrictions -  Manged prefs changed", v5, 2u);
  }

  [(IDSRestrictions *)self _updateParentalSettings];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018FFD8;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019009C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v4, block);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentalControls, 0);

  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
}

@end