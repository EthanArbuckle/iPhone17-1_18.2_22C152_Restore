@interface IDSSIMPhoneUserSynchronizer
- (BOOL)_isInDualPhoneIdentityModeForSims:(id)a3;
- (FTUserConfiguration)userConfiguration;
- (IDSCTAdapter)CTAdapter;
- (IDSPairingManager)pairingManager;
- (IDSRegistrationController)registrationController;
- (IDSSIMPhoneUserSynchronizer)initWithUserStore:(id)a3 queue:(id)a4 lockdownManager:(id)a5 systemMonitor:(id)a6 CTAdapter:(id)a7 userConfiguration:(id)a8 registrationController:(id)a9 pairingManager:(id)a10;
- (IDSUserStore)userStore;
- (IMLockdownManager)lockdownManager;
- (IMSystemMonitor)systemMonitor;
- (NSMutableDictionary)cachedIsSameSIM;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)SIMInformationDidChange;
- (void)_checkRegistrationStatus;
- (void)_setupForCurrentSubscriptionState;
- (void)dealloc;
- (void)didUpdatePairedDevice:(id)a3;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)selectedSubscriptionLabelDidChange:(id)a3;
- (void)setCTAdapter:(id)a3;
- (void)setCachedIsSameSIM:(id)a3;
- (void)setLockdownManager:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)setUserStore:(id)a3;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
- (void)verifyState;
@end

@implementation IDSSIMPhoneUserSynchronizer

- (IDSSIMPhoneUserSynchronizer)initWithUserStore:(id)a3 queue:(id)a4 lockdownManager:(id)a5 systemMonitor:(id)a6 CTAdapter:(id)a7 userConfiguration:(id)a8 registrationController:(id)a9 pairingManager:(id)a10
{
  id v28 = a3;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v16 = a9;
  id v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)IDSSIMPhoneUserSynchronizer;
  v18 = [(IDSSIMPhoneUserSynchronizer *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userStore, a3);
    objc_storeStrong((id *)&v19->_lockdownManager, a5);
    objc_storeStrong((id *)&v19->_systemMonitor, a6);
    objc_storeStrong((id *)&v19->_userConfiguration, a8);
    objc_storeStrong((id *)&v19->_CTAdapter, a7);
    objc_storeStrong((id *)&v19->_registrationController, a9);
    objc_storeStrong((id *)&v19->_pairingManager, a10);
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedIsSameSIM = v19->_cachedIsSameSIM;
    v19->_cachedIsSameSIM = v20;

    [(IDSCTAdapter *)v19->_CTAdapter addListener:v19];
    [(IDSPairingManager *)v19->_pairingManager addDelegate:v19];
    [(IDSUserStore *)v19->_userStore addActionListener:v19];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v19 selector:"selectedSubscriptionLabelDidChange:" name:FTUserConfigurationSelectedSubscriptionLabelDidChange object:0];
  }
  return v19;
}

- (void)dealloc
{
  [(IDSUserStore *)self->_userStore removeActionListener:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSSIMPhoneUserSynchronizer;
  [(IDSSIMPhoneUserSynchronizer *)&v3 dealloc];
}

- (void)verifyState
{
  objc_super v3 = +[IMRGLog sms];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initial state check for Phone numbers", v4, 2u);
  }

  [(IDSSIMPhoneUserSynchronizer *)self _setupForCurrentSubscriptionState];
}

- (BOOL)_isInDualPhoneIdentityModeForSims:(id)a3
{
  v4 = objc_msgSend(a3, "__imArrayByApplyingBlock:", &stru_100986650);
  id v5 = [v4 count];

  v6 = +[IMUserDefaults sharedDefaults];
  v7 = [v6 appValueForKey:@"isInDualSIMIdentifier"];

  v8 = +[IDSCurrentDevice sharedInstance];
  v9 = [v8 deviceIdentifier];

  if ([(FTUserConfiguration *)self->_userConfiguration isDeviceInDualPhoneIdentityMode]&& ([(__CFString *)v7 isEqualToString:v9] & 1) == 0)
  {
    [(FTUserConfiguration *)self->_userConfiguration setIsDeviceInDualPhoneIdentityMode:0];
    v10 = +[IMRGLog sms];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      CFStringRef v23 = v7;
      __int16 v24 = 2112;
      CFStringRef v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device identifier differs disabling dual mode {persistedDeviceIdentifier: %@, currentDeviceIdentifier: %@}", (uint8_t *)&v22, 0x16u);
    }
  }
  if (([(FTUserConfiguration *)self->_userConfiguration isDeviceInDualPhoneIdentityMode] & 1) == 0&& (unint64_t)v5 >= 2)
  {
    [(FTUserConfiguration *)self->_userConfiguration setIsDeviceInDualPhoneIdentityMode:1];
    v11 = +[IMUserDefaults sharedDefaults];
    [v11 setAppValue:v9 forKey:@"isInDualSIMIdentifier"];
  }
  unsigned int v12 = [(IDSCTAdapter *)self->_CTAdapter dualSIMCapabilityEnabled];
  unsigned int v13 = [(FTUserConfiguration *)self->_userConfiguration isDeviceInDualPhoneIdentityMode];
  unsigned int v14 = v13;
  if ((unint64_t)v5 > 1) {
    int v15 = 1;
  }
  else {
    int v15 = v12;
  }
  int v16 = v15 & v13;
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    if (v16) {
      CFStringRef v19 = @"YES";
    }
    else {
      CFStringRef v19 = @"NO";
    }
    if ((unint64_t)v5 <= 1) {
      CFStringRef v20 = @"NO";
    }
    else {
      CFStringRef v20 = @"YES";
    }
    int v22 = 138412802;
    CFStringRef v23 = v19;
    __int16 v24 = 2112;
    CFStringRef v25 = v20;
    if (v14) {
      CFStringRef v18 = @"YES";
    }
    __int16 v26 = 2112;
    CFStringRef v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Determined if device is in dual phone identity mode { isDualIdentity: %@, multipleInsertedSims: %@, isDeviceInDualPhoneIdentityMode: %@ }", (uint8_t *)&v22, 0x20u);
  }

  return v16;
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_10071A664((uint64_t)v4, v5);
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v5 = a4;
  v6 = [(IDSSIMPhoneUserSynchronizer *)self registrationController];
  unsigned __int8 v7 = [v6 systemSupportsPhoneNumberRegistration];

  if (v7)
  {
    uint64_t v8 = [(FTUserConfiguration *)self->_userConfiguration selectedPhoneNumberRegistrationSubscriptionLabels];
    v9 = (__CFString *)[v5 mutableCopy];
    CTAdapter = self->_CTAdapter;
    id v131 = 0;
    v11 = [(IDSCTAdapter *)CTAdapter currentSIMsWithError:&v131];
    id v102 = v131;
    unsigned int v12 = [(IDSSIMPhoneUserSynchronizer *)self cachedIsSameSIM];
    [v12 removeAllObjects];

    unsigned int v13 = [(IDSSIMPhoneUserSynchronizer *)self _isInDualPhoneIdentityModeForSims:v11];
    unsigned int v103 = [(FTUserConfiguration *)self->_userConfiguration isDeviceInManualPhoneSelectionMode];
    unsigned int v14 = 0;
    if (v13)
    {
      int v15 = [(IDSSIMPhoneUserSynchronizer *)self userStore];
      int v16 = [v15 usersWithRealm:2];
      unsigned int v14 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_100986690);
    }
    uint64_t v17 = objc_msgSend(v11, "__imArrayByApplyingBlock:", &stru_1009866D0);
    v104 = self;
    v105 = v14;
    v101 = (void *)v17;
    if (v14)
    {
      CFStringRef v18 = (void *)v17;
      CFStringRef v19 = objc_msgSend(v14, "__imSetFromArray");
      CFStringRef v20 = objc_msgSend(v18, "__imSetFromArray");
      unsigned int v21 = [v19 intersectsSet:v20];
    }
    else
    {
      unsigned int v21 = 0;
    }
    v109 = (void *)v8;
    if (v8) {
      int v24 = 1;
    }
    else {
      int v24 = v21;
    }
    unsigned int v98 = v13;
    int v25 = v24 & (v13 | v103);
    id v26 = objc_alloc_init((Class)NSMutableArray);
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id obj = v11;
    int v112 = v25;
    id v117 = [obj countByEnumeratingWithState:&v127 objects:v148 count:16];
    if (v117)
    {
      uint64_t v116 = *(void *)v128;
      id v110 = v5;
      v111 = v9;
      do
      {
        for (i = 0; i != v117; i = (char *)i + 1)
        {
          if (*(void *)v128 != v116) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          objc_super v29 = [v28 SIMIdentifier];
          if (v29
            && (!v25
             || ([v109 containsObject:v29] & 1) != 0
             || [v105 containsObject:v29]))
          {
            v114 = v28;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            v30 = (IDSPhoneUser *)v5;
            id v31 = [(IDSPhoneUser *)v30 countByEnumeratingWithState:&v123 objects:v147 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v124;
LABEL_24:
              uint64_t v34 = 0;
              while (1)
              {
                if (*(void *)v124 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v123 + 1) + 8 * v34);
                v36 = [v35 uniqueIdentifier];
                unsigned int v37 = [v36 isEqualToString:v29];

                if (v37) {
                  break;
                }
                if (v32 == (id)++v34)
                {
                  id v32 = [(IDSPhoneUser *)v30 countByEnumeratingWithState:&v123 objects:v147 count:16];
                  if (v32) {
                    goto LABEL_24;
                  }
                  goto LABEL_30;
                }
              }
              [v26 addObject:v29];
              if ([v35 realm])
              {
                v9 = v111;
                goto LABEL_59;
              }
              v43 = v35;
              v44 = v104->_CTAdapter;
              v45 = [(__CFString *)v43 phoneNumber];
              v46 = [(__CFString *)v43 phoneBookNumber];
              v47 = [(__CFString *)v43 uniqueIdentifier];
              id v122 = 0;
              LODWORD(v44) = [(IDSCTAdapter *)v44 isPNRNumber:v45 andPhoneBookNumber:v46 differentEnoughFromSIMIdentifier:v47 toReregisterWithNewNumber:&v122];
              id v107 = v122;

              int v48 = (int)v44;
              v49 = +[NSNumber numberWithInt:v44 ^ 1];
              v50 = [(IDSSIMPhoneUserSynchronizer *)v104 cachedIsSameSIM];
              v51 = [(__CFString *)v43 uniqueIdentifier];
              [v50 setObject:v49 forKeyedSubscript:v51];

              v52 = [v114 mobileCountryCode];
              if ([v52 length]) {
                [v114 mobileCountryCode];
              }
              else {
              v53 = [(__CFString *)v43 countryCode];
              }

              v54 = [v114 mobileNetworkCode];
              if ([v54 length]) {
                [v114 mobileNetworkCode];
              }
              else {
              v108 = [(__CFString *)v43 networkCode];
              }

              v106 = v53;
              if (v48)
              {
                v55 = [IDSPhoneUser alloc];
                id v56 = [v114 isDefaultVoiceSIM];
                v57 = [v114 mobileCountryCode];
                v58 = [v114 mobileNetworkCode];
                v59 = [(IDSPhoneUser *)v55 initWithLabelID:v29 phoneBookNumber:v107 isDefaultUser:v56 countryCode:v57 networkCode:v58];

                v60 = +[IMRGLog registration];
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  CFStringRef v133 = v29;
                  __int16 v134 = 2112;
                  CFStringRef v135 = v43;
                  __int16 v136 = 2112;
                  CFStringRef v137 = (const __CFString *)v59;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Recognized phone number change without labelID change {labelID: %@, currentUser: %@, newUser: %@}", buf, 0x20u);
                }

                v9 = v111;
                [(__CFString *)v111 removeObject:v43];
                [(__CFString *)v111 addObject:v59];
                v61 = +[IDSRegistrationReasonTracker sharedInstance];
                v62 = [(IDSPhoneUser *)v59 uniqueIdentifier];
                [v61 setPNRReason:4 forUserUniqueIdentifier:v62];

                goto LABEL_57;
              }
              unsigned int v63 = [(__CFString *)v43 isDefaultUser];
              v9 = v111;
              if (v63 == [v114 isDefaultVoiceSIM])
              {
                v64 = [(__CFString *)v43 countryCode];
                if ([v64 isEqualToString:v53])
                {
                  v65 = [(__CFString *)v43 networkCode];
                  unsigned __int8 v66 = [v65 isEqualToString:v108];

                  v53 = v106;
                  if (v66) {
                    goto LABEL_58;
                  }
                }
                else
                {
                }
              }
              -[__CFString phoneUserWithUpdatedDefaultUser:countryCode:networkCode:](v43, "phoneUserWithUpdatedDefaultUser:countryCode:networkCode:", [v114 isDefaultVoiceSIM], v53, v108);
              v59 = (IDSPhoneUser *)objc_claimAutoreleasedReturnValue();
              v67 = +[IMRGLog registration];
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                if ([(__CFString *)v43 isDefaultUser]) {
                  CFStringRef v68 = @"YES";
                }
                else {
                  CFStringRef v68 = @"NO";
                }
                CFStringRef v100 = v68;
                if ([(IDSPhoneUser *)v59 isDefaultUser]) {
                  CFStringRef v69 = @"YES";
                }
                else {
                  CFStringRef v69 = @"NO";
                }
                CFStringRef v99 = v69;
                v115 = [(__CFString *)v43 countryCode];
                uint64_t v70 = [(IDSPhoneUser *)v59 countryCode];
                v71 = [(__CFString *)v43 networkCode];
                uint64_t v72 = [(IDSPhoneUser *)v59 networkCode];
                *(_DWORD *)buf = 138413570;
                CFStringRef v133 = v100;
                __int16 v134 = 2112;
                CFStringRef v135 = v99;
                __int16 v136 = 2112;
                CFStringRef v137 = v115;
                __int16 v138 = 2112;
                uint64_t v139 = v70;
                v73 = (void *)v70;
                __int16 v140 = 2112;
                v141 = v71;
                __int16 v142 = 2112;
                uint64_t v143 = v72;
                v74 = (void *)v72;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Recognized SIM property change {currentUser.defaultUser: %@, newUser.defaultUser: %@, currentUser.mcc: %@, newUser.mcc: %@, currentUser.mnc: %@, newUser.mnc: %@}", buf, 0x3Eu);

                v9 = v111;
              }

              [(__CFString *)v9 removeObject:v43];
              [(__CFString *)v9 addObject:v59];
LABEL_57:

              v53 = v106;
LABEL_58:

              goto LABEL_59;
            }
LABEL_30:

            v38 = [IDSPhoneUser alloc];
            v39 = [v114 phoneNumber];
            id v40 = [v114 isDefaultVoiceSIM];
            v41 = [v114 mobileCountryCode];
            v42 = [v114 mobileNetworkCode];
            v30 = [(IDSPhoneUser *)v38 initWithLabelID:v29 phoneBookNumber:v39 isDefaultUser:v40 countryCode:v41 networkCode:v42];

            v9 = v111;
            [(__CFString *)v111 addObject:v30];
LABEL_59:

            id v5 = v110;
            int v25 = v112;
            if (!v112)
            {

              goto LABEL_64;
            }
          }
        }
        id v117 = [obj countByEnumeratingWithState:&v127 objects:v148 count:16];
      }
      while (v117);
    }
LABEL_64:

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v75 = (__CFString *)v5;
    id v76 = [(__CFString *)v75 countByEnumeratingWithState:&v118 objects:v146 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v119;
      do
      {
        for (j = 0; j != v77; j = (char *)j + 1)
        {
          if (*(void *)v119 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = *(void **)(*((void *)&v118 + 1) + 8 * (void)j);
          v81 = [v80 uniqueIdentifier];
          unsigned __int8 v82 = [v26 containsObject:v81];

          if ((v82 & 1) == 0) {
            [(__CFString *)v9 removeObject:v80];
          }
        }
        id v77 = [(__CFString *)v75 countByEnumeratingWithState:&v118 objects:v146 count:16];
      }
      while (v77);
    }

    v83 = [(__CFString *)v9 __imSetByApplyingBlock:&stru_1009866F0];
    if (v112)
    {
      unsigned int v85 = 0;
      v86 = v109;
      if (!v109)
      {
LABEL_75:
        v87 = objc_msgSend(v105, "__imSetFromArray");
        unsigned int v88 = [v87 isEqualToSet:v83];

        v86 = v109;
LABEL_78:
        if ((v85 | v88) == 1)
        {
          if ((unint64_t)[v86 count] < 2)
          {
            id v91 = +[NSMutableSet set];
          }
          else
          {
            v90 = objc_msgSend(v86, "__imSetFromArray");
            id v91 = [v90 mutableCopy];
          }
          [v91 unionSet:v83];
          userConfiguration = v104->_userConfiguration;
          v93 = [v91 allObjects];
          [(FTUserConfiguration *)userConfiguration silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels:v93];

          v86 = v109;
        }
        v94 = +[IMRGLog registration];
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          if (v98) {
            CFStringRef v95 = @"YES";
          }
          else {
            CFStringRef v95 = @"NO";
          }
          *(_DWORD *)buf = 138413826;
          if (v103) {
            CFStringRef v96 = @"YES";
          }
          else {
            CFStringRef v96 = @"NO";
          }
          CFStringRef v133 = v75;
          __int16 v134 = 2112;
          CFStringRef v135 = v9;
          __int16 v136 = 2112;
          CFStringRef v137 = v95;
          __int16 v138 = 2112;
          uint64_t v139 = (uint64_t)v96;
          __int16 v140 = 2112;
          v141 = v86;
          __int16 v142 = 2112;
          uint64_t v143 = (uint64_t)v105;
          __int16 v144 = 2112;
          id v145 = obj;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Finished synchronizing Sims to users {currentUsers: %@, updatedUsers: %@, dualMode: %@, inManualSelectionMode %@, selectedLabelIDs: %@, tempLabelIDs: %@, sims: %@}", buf, 0x48u);
        }

        CFStringRef v23 = v9;
        goto LABEL_92;
      }
    }
    else
    {
      v86 = v109;
      v89 = objc_msgSend(v109, "__imSetFromArray");
      unsigned int v85 = [v83 isSubsetOfSet:v89] ^ 1;

      if (!v109) {
        goto LABEL_75;
      }
    }
    unsigned int v88 = 0;
    goto LABEL_78;
  }
  int v22 = +[IMRGLog registration];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "This device does not support identification -- returning no users", buf, 2u);
  }

  CFStringRef v23 = +[NSSet set];
LABEL_92:

  return v23;
}

- (void)selectedSubscriptionLabelDidChange:(id)a3
{
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
  id v6 = a4;
  if (![v6 realm])
  {
    id v5 = +[IDSSMSRegistrationCenter sharedInstance];
    [v5 clearConsentDenialsForPhoneUser:v6];
  }
}

- (void)SIMInformationDidChange
{
}

- (void)_setupForCurrentSubscriptionState
{
  [(IDSUserStore *)self->_userStore reloadUsersForRealm:0];

  [(IDSSIMPhoneUserSynchronizer *)self _checkRegistrationStatus];
}

- (void)_checkRegistrationStatus
{
  objc_super v3 = [(IDSSIMPhoneUserSynchronizer *)self lockdownManager];
  unsigned __int8 v4 = [v3 isActivated];

  if (v4)
  {
    if (+[IDSRegistrationController isBuddyBlockingRegistration])
    {
      id v5 = +[IMRGLog sms];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v6 = "****** Device is not configured yet, bailing";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else
    {
      unsigned __int8 v7 = +[IDSRegistrationKeyManager sharedInstance];
      unsigned int v8 = [v7 requiresKeychainMigration];

      if (v8)
      {
        id v5 = +[IMRGLog sms];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v6 = "****** Under first lock and keychain upgrade pending, bailing";
          goto LABEL_10;
        }
      }
      else
      {
        id v5 = [(IDSUserStore *)self->_userStore usersWithRealm:0];
        id v9 = [v5 count];
        v10 = +[IMRGLog sms];
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_DWORD *)buf = 138412290;
            v41 = v5;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "** Found Tracked Phone Number users: %@", buf, 0xCu);
          }

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v33 = v5;
          id obj = v5;
          id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v36;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v36 != v14) {
                  objc_enumerationMutation(obj);
                }
                int v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                objc_msgSend(v16, "phoneNumber", v33);
                id v17 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v18 = [v16 phoneBookNumber];
                CFStringRef v19 = (void *)v18;
                if (v17) {
                  BOOL v20 = 1;
                }
                else {
                  BOOL v20 = v18 == 0;
                }
                if (!v20)
                {
                  unsigned int v21 = [(IDSUserStore *)self->_userStore authenticationCertificateForUser:v16];

                  if (v21)
                  {
                    userStore = self->_userStore;
                    CFStringRef v23 = [v16 phoneUserWithUpdatedPhoneNumber:v19];
                    [(IDSUserStore *)userStore updateUser:v23];

                    id v17 = v19;
                  }
                  else
                  {
                    id v17 = 0;
                  }
                }
                int v24 = [(IDSSIMPhoneUserSynchronizer *)self cachedIsSameSIM];
                int v25 = [v16 uniqueIdentifier];
                id v26 = [v24 objectForKeyedSubscript:v25];

                if (!v26 || ([v26 BOOLValue] & 1) == 0)
                {
                  CTAdapter = self->_CTAdapter;
                  id v28 = [v16 uniqueIdentifier];
                  LODWORD(CTAdapter) = [(IDSCTAdapter *)CTAdapter isPNRNumber:v17 andPhoneBookNumber:v19 differentEnoughFromSIMIdentifier:v28 toReregisterWithNewNumber:0];

                  if (CTAdapter)
                  {
                    objc_super v29 = +[IMRGLog sms];
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "** Dispatching request to re-register via SMS", buf, 2u);
                    }

                    v30 = +[IDSRegistrationReasonTracker sharedInstance];
                    id v31 = [v16 uniqueIdentifier];
                    [v30 setPNRReason:3 forUserUniqueIdentifier:v31];

                    id v32 = +[IDSPACStateTracker sharedInstance];
                    [v32 notePhoneAuthCertLost:8];

                    [(IDSUserStore *)self->_userStore setAuthenticationCertificate:0 forUser:v16];
                  }
                }
              }
              id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
            }
            while (v13);
          }

          v10 = +[IDSHeartbeatCenter sharedInstance];
          [v10 checkHeartbeat];
          id v5 = v33;
        }
        else if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "** Found no tracked Phone Number registration", buf, 2u);
        }
      }
    }
  }
  else
  {
    id v5 = +[IMRGLog sms];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "****** Device isn't in a state that can register right now, bailing";
      goto LABEL_10;
    }
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSSIMPhoneUserSynchronizer *)self pairingManager];
  unsigned int v6 = [v5 isCurrentDeviceTinkerConfiguredWatch];

  unsigned __int8 v7 = [v4 objectForKey:IDSDevicePropertyPairingType];

  id v8 = [v7 integerValue];
  id v9 = +[IMRGLog registration];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 && v8 == (id)1)
  {
    if (v10)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDSSIMPhoneUserSynchronizer received an update to the paired tinker device", (uint8_t *)v11, 2u);
    }

    [(IDSUserStore *)self->_userStore reloadUsersForRealm:0];
  }
  else
  {
    if (v10)
    {
      v11[0] = 67109376;
      v11[1] = v6;
      __int16 v12 = 2048;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDSSimPhoneUserSynchronizer does not support non-tinker devices. isTinkerConfiguredWatch: %d pairingType: %ld", (uint8_t *)v11, 0x12u);
    }
  }
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
}

- (IMLockdownManager)lockdownManager
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

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (FTUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (NSMutableDictionary)cachedIsSameSIM
{
  return self->_cachedIsSameSIM;
}

- (void)setCachedIsSameSIM:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIsSameSIM, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_lockdownManager, 0);
  objc_storeStrong((id *)&self->_CTAdapter, 0);

  objc_storeStrong((id *)&self->_userStore, 0);
}

@end