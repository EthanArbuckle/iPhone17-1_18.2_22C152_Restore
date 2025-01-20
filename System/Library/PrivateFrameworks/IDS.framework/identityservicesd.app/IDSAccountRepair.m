@interface IDSAccountRepair
+ (double)_phoneNumberRepairIntervalForCount:(int64_t)a3;
- (BOOL)_checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:(id)a3;
- (BOOL)_hasActiveAppleIDBasedAccountOnService:(id)a3;
- (BOOL)_isPhoneAccount:(id)a3 registeredAndMatchingThisAccount:(id)a4;
- (BOOL)_repairPhoneNumberAccounts;
- (BOOL)_shouldBypassRepairLogic;
- (BOOL)_shouldNotSetupPhoneNumberRepairTimer;
- (BOOL)shouldSupressRepairLogic;
- (BOOL)waitingForMigration;
- (IDSAccountRepair)initWithAccountController:(id)a3 systemAccountAdapter:(id)a4 userDefaults:(id)a5 keyTransparencyVerifier:(id)a6;
- (IDSDAccountController)accountController;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IMDispatchTimer)phoneRepairTimer;
- (IMDispatchTimer)repairTimer;
- (IMUserDefaults)userDefaults;
- (double)lastBagRepairInterval;
- (id)_activeAppleIDAccount;
- (id)_createiTunesAccountFromSystemIfNeeded;
- (id)_lastRepairIntervalFromPrefs;
- (id)_totalRepairCountFromPrefs;
- (void)_createAndEnableExistingSystemAccounts;
- (void)_phoneNumberRepairTimerHit:(id)a3;
- (void)_registerForAccountRepairActivity;
- (void)_repairAccountsWithSuccessfulPhoneNumberRegistration;
- (void)_repairAccountsWithSuccessfullAppleIDRegistrationForDSID:(id)a3 service:(id)a4;
- (void)_repairKTAccount:(id)a3;
- (void)_repairKVSEntriesForKT;
- (void)_repairTimerHit:(id)a3;
- (void)_repairiTunesBasedAccounts;
- (void)_resetPhoneNumberRepairCounter;
- (void)forceRepairAccounts:(id)a3;
- (void)kickRepairForAllRegistrationsSucceeded:(id)a3;
- (void)recalculatePhoneRepairTimer;
- (void)repairAccounts;
- (void)repairService:(id)a3 withPrimaryUserName:(id)a4;
- (void)repairiCloudBasedAccounts;
- (void)setAccountController:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setLastBagRepairInterval:(double)a3;
- (void)setPhoneRepairTimer:(id)a3;
- (void)setRepairTimer:(id)a3;
- (void)setShouldSupressRepairLogic:(BOOL)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setWaitingForMigration:(BOOL)a3;
- (void)setupPhoneNumberRepairTimer;
@end

@implementation IDSAccountRepair

- (IDSAccountRepair)initWithAccountController:(id)a3 systemAccountAdapter:(id)a4 userDefaults:(id)a5 keyTransparencyVerifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IDSAccountRepair;
  v15 = [(IDSAccountRepair *)&v29 init];
  v16 = v15;
  if (v15)
  {
    v15->_waitingForMigration = 1;
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a4);
    objc_storeStrong((id *)&v16->_accountController, a3);
    objc_storeStrong((id *)&v16->_userDefaults, a5);
    objc_storeStrong((id *)&v16->_keyTransparencyVerifier, a6);
    id v17 = objc_alloc((Class)IMDispatchTimer);
    v18 = im_primary_queue();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100101D60;
    v27[3] = &unk_100980598;
    v19 = v16;
    v28 = v19;
    v20 = (IMDispatchTimer *)[v17 initWithQueue:v18 interval:604800 repeats:1 handlerBlock:v27];
    repairTimer = v19->_repairTimer;
    v19->_repairTimer = v20;

    [(IDSAccountRepair *)v19 setupPhoneNumberRepairTimer];
    if (sub_100101D6C()) {
      [(IDSAccountRepair *)v19 _registerForAccountRepairActivity];
    }
    v22 = +[IDSDataMigrationTracker sharedInstance];
    v23 = [v22 performMigrationIfNeeded];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100101DF4;
    v25[3] = &unk_10097FCA8;
    v26 = v19;
    [v23 registerResultBlock:v25];
  }
  return v16;
}

- (void)forceRepairAccounts:(id)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v23;
    *(void *)&long long v4 = 138412802;
    long long v19 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v9 = objc_msgSend(v8, "isUserDisabled", v19);
        unsigned int v10 = [v8 isRegistered];
        id v11 = +[IDSRestrictions sharedInstance];
        id v12 = [v8 service];
        unsigned int v13 = [v11 shouldDisableService:v12];

        id v14 = +[IMRGLog registration];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if (v9) {
            CFStringRef v15 = @"YES";
          }
          else {
            CFStringRef v15 = @"NO";
          }
          *(_DWORD *)buf = v19;
          CFStringRef v27 = v15;
          if (v10) {
            CFStringRef v16 = @"YES";
          }
          else {
            CFStringRef v16 = @"NO";
          }
          __int16 v28 = 2112;
          CFStringRef v29 = v16;
          __int16 v30 = 2112;
          v31 = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Checking if account is candidate for force repair {isUserDisabled: %@, isRegistered: %@, account: %@}", buf, 0x20u);
        }

        if (((v9 | v10 | v13) & 1) == 0)
        {
          id v17 = [(IDSAccountRepair *)self accountController];
          v18 = [v8 uniqueID];
          [v17 enableAccountWithUniqueID:v18];

          [v8 registerAccount];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }
}

- (void)_repairTimerHit:(id)a3
{
  id v4 = a3;
  if (self->_waitingForMigration)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100710B8C();
    }
  }
  else
  {
    uint64_t v6 = +[IMSystemMonitor sharedInstance];
    unsigned int v7 = [v6 isUnderFirstDataProtectionLock];

    v8 = +[IMRGLog registration];
    unsigned int v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100710B58();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Repair timer fired: %@", (uint8_t *)&v10, 0xCu);
      }

      [(IDSAccountRepair *)self repairAccounts];
    }
  }
}

- (BOOL)_shouldBypassRepairLogic
{
  if ([(IDSAccountRepair *)self shouldSupressRepairLogic])
  {
    id v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v4 = "Bypassing repair -> Safeview?";
      id v5 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(IDSAccountRepair *)self accountController];
  unsigned int v7 = [v6 hasHardDeregistered];

  if (v7)
  {
    id v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v4 = "Bypassing repair -> hasHardDeregistered";
      id v5 = (uint8_t *)&v9;
      goto LABEL_7;
    }
LABEL_8:

    return 1;
  }
  return 0;
}

- (void)kickRepairForAllRegistrationsSucceeded:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSAccountRepair *)self accountController];
  unsigned int v6 = [v5 isLoading];

  if (v6)
  {
    unsigned int v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting on accounts to load, the account controller isn't ready yet", buf, 2u);
    }
  }
  else
  {
    v34 = objc_alloc_init((Class)NSMutableSet);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v33 = v4;
    id obj = v4;
    id v38 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v38)
    {
      int v8 = 0;
      char v35 = 0;
      uint64_t v37 = *(void *)v46;
      __int16 v9 = (id *)IMRGLog_ptr;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v12 = +[IDSDServiceController sharedInstance];
          unsigned int v13 = [v11 serviceIdentifier];
          id v14 = [v12 serviceWithIdentifier:v13];

          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          CFStringRef v15 = [(IDSAccountRepair *)self accountController];
          CFStringRef v16 = [v15 accounts];

          id v17 = [v16 countByEnumeratingWithState:&v41 objects:v55 count:16];
          if (v17)
          {
            v39 = v14;
            int v40 = v8;
            v18 = v9;
            long long v19 = self;
            uint64_t v20 = *(void *)v42;
            while (2)
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v42 != v20) {
                  objc_enumerationMutation(v16);
                }
                long long v22 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
                long long v23 = [v22 registration];

                if (v23 == v11)
                {
                  id v17 = v22;
                  goto LABEL_19;
                }
              }
              id v17 = [v16 countByEnumeratingWithState:&v41 objects:v55 count:16];
              if (v17) {
                continue;
              }
              break;
            }
LABEL_19:
            self = v19;
            __int16 v9 = v18;
            int v8 = v40;
            id v14 = v39;
          }

          long long v24 = [*v9 registration];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v50 = v14;
            __int16 v51 = 2112;
            v52 = v11;
            __int16 v53 = 2112;
            id v54 = v17;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notified of registration success for service: %@   registration: %@   account: %@", buf, 0x20u);
          }

          unsigned int v25 = [v17 accountType];
          if (v8 & 1 | (v25 != 0))
          {
            if (v25 == 1)
            {
              v26 = [v17 service];
              unsigned __int8 v27 = [v26 iCloudBasedService];

              if (!(v35 & 1 | ((v27 & 1) == 0)))
              {
                __int16 v28 = [*v9 registration];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Kicking Apple ID iCloud based accounts repair", buf, 2u);
                }

                [(IDSAccountRepair *)self repairiCloudBasedAccounts];
                char v35 = 1;
              }
              if ((v27 & 1) == 0)
              {
                CFStringRef v29 = [v17 dsID];
                if (([v34 containsObject:v29] & 1) == 0)
                {
                  __int16 v30 = [*v9 registration];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v50 = v29;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Kicking Apple ID non-iCloud based accounts matching dsID: %@ repair", buf, 0xCu);
                  }

                  v31 = [v17 service];
                  [(IDSAccountRepair *)self _repairAccountsWithSuccessfullAppleIDRegistrationForDSID:v29 service:v31];

                  [v34 addObject:v29];
                }
              }
            }
          }
          else
          {
            v32 = [*v9 registration];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Kicking phone number accounts repair", buf, 2u);
            }

            [(IDSAccountRepair *)self _repairAccountsWithSuccessfulPhoneNumberRegistration];
            int v8 = 1;
          }
        }
        id v38 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v38);
    }

    id v4 = v33;
    unsigned int v7 = v34;
  }
}

- (void)_repairAccountsWithSuccessfulPhoneNumberRegistration
{
  v2 = [(IDSAccountRepair *)self accountController];
  unsigned int v3 = [v2 isLoading];

  id v4 = +[IMRGLog registration];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      unsigned int v6 = "Waiting on accounts to load, the account controller isn't ready yet";
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "   => This was an SMS registration, let's see what we should repair", buf, 2u);
  }

  if (![(IDSAccountRepair *)self _shouldBypassRepairLogic])
  {
    [(IDSAccountRepair *)self _resetPhoneNumberRepairCounter];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    unsigned int v7 = [(IDSAccountRepair *)self accountController];
    int v8 = [v7 accounts];

    __int16 v9 = self;
    id v10 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (!v10) {
      goto LABEL_68;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v72;
    v57 = v8;
    uint64_t v59 = *(void *)v72;
    while (1)
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v13);
        if (!objc_msgSend(v14, "accountType", v57))
        {
          CFStringRef v15 = [v14 service];
          unsigned int v16 = [v15 wantsPhoneNumberAccount];

          if (v16)
          {
            if (([v14 isAdHocAccount] & 1) == 0)
            {
              v63 = v14;
              if ([v14 isRegistered]) {
                goto LABEL_20;
              }
              id v17 = +[IMRGLog registration];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v18 = [v14 registrationError];
                *(_DWORD *)buf = 67109120;
                LODWORD(v76) = v18;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " => Failed account, let's see if we should kick it (Registration Error: %d)", buf, 8u);
              }

              unint64_t v19 = (unint64_t)[v14 registrationError];
              if (v19 > 0x31) {
                goto LABEL_35;
              }
              if (((1 << v19) & 0x3824088600000) != 0) {
                goto LABEL_20;
              }
              if (v19 != 2)
              {
                if (v19 == 39)
                {
                  __int16 v30 = [(IDSAccountRepair *)v9 accountController];
                  [v14 service];
                  v32 = v31 = v14;
                  id v33 = [v30 appleIDAccountOnService:v32];

                  if ([v33 isEnabled])
                  {
                    v34 = +[IMRGLog registration];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, " => Matching Apple ID account on this service is enabled: %@", buf, 0xCu);
                    }

                    id v14 = v63;
                    goto LABEL_57;
                  }
                  unsigned __int8 v52 = [(IDSAccountRepair *)v9 _checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:v31];

                  id v14 = v31;
                  if (v52) {
                    goto LABEL_57;
                  }
                  goto LABEL_20;
                }
LABEL_35:
                if (v19 + 1 >= 2
                  && (v19 != 1
                   || [(IDSAccountRepair *)v9 _checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:v14]))
                {
                  goto LABEL_57;
                }
                goto LABEL_20;
              }
              id v58 = v11;
              char v35 = [(IDSAccountRepair *)v9 accountController];
              v36 = [v35 accountsWithType:0];

              long long v69 = 0u;
              long long v70 = 0u;
              long long v68 = 0u;
              long long v67 = 0u;
              id v37 = v36;
              id v38 = [v37 countByEnumeratingWithState:&v67 objects:v77 count:16];
              if (!v38)
              {

                goto LABEL_20;
              }
              id v39 = v38;
              unsigned __int8 v40 = 0;
              id obj = v37;
              uint64_t v62 = *(void *)v68;
              do
              {
                for (i = 0; i != v39; i = (char *)i + 1)
                {
                  if (*(void *)v68 != v62) {
                    objc_enumerationMutation(obj);
                  }
                  long long v42 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                  long long v43 = [v42 userUniqueIdentifier];
                  long long v44 = [v14 userUniqueIdentifier];
                  if ([v43 isEqual:v44])
                  {
                    long long v45 = [v42 uniqueID];
                    long long v46 = [v63 uniqueID];
                    unsigned __int8 v47 = [v45 isEqual:v46];

                    __int16 v9 = self;
                    id v14 = v63;

                    if ((v47 & 1) == 0)
                    {
                      long long v48 = +[IMRGLog registration];
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v76 = v42;
                        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, " => Kicking alternate SMS based account: %@", buf, 0xCu);
                      }

                      v49 = [(IDSAccountRepair *)self accountController];
                      v50 = [v42 uniqueID];
                      [v49 enableAccountWithUniqueID:v50];

                      [v42 registerAccount];
                      __int16 v51 = [v42 linkedAccounts];
                      v66[0] = _NSConcreteStackBlock;
                      v66[1] = 3221225472;
                      v66[2] = sub_10010317C;
                      v66[3] = &unk_1009822F8;
                      v66[4] = self;
                      objc_msgSend(v51, "__imForEach:", v66);

                      id v14 = v63;
                    }
                  }
                  else
                  {
                  }
                  if ((v40 & 1) == 0) {
                    unsigned __int8 v40 = [(IDSAccountRepair *)v9 _isPhoneAccount:v42 registeredAndMatchingThisAccount:v14];
                  }
                }
                id v39 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
              }
              while (v39);

              int v8 = v57;
              id v11 = v58;
              if (v40)
              {
LABEL_57:
                __int16 v53 = +[IMRGLog registration];
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, " => Kicking SMS based account: %@", buf, 0xCu);
                }

                id v54 = [(IDSAccountRepair *)v9 accountController];
                v55 = [v14 uniqueID];
                [v54 enableAccountWithUniqueID:v55];

                __int16 v28 = v63;
                [v63 registerAccount];
                CFStringRef v29 = [v63 linkedAccounts];
                v65[0] = _NSConcreteStackBlock;
                v65[1] = 3221225472;
                v65[2] = sub_100103278;
                v65[3] = &unk_1009822F8;
                v65[4] = v9;
                objc_msgSend(v29, "__imForEach:", v65);
                uint64_t v12 = v59;
LABEL_60:

                uint64_t v20 = +[IMRGLog registration];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v28;
                  long long v24 = v20;
                  unsigned int v25 = " ** Tried to repair account: %@";
LABEL_62:
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
                }
              }
              else
              {
LABEL_20:
                uint64_t v20 = [v14 service];
                if ([v20 iCloudBasedService])
                {
                  unsigned __int8 v21 = [v14 isEnabled];

                  uint64_t v12 = v59;
                  if (v21) {
                    goto LABEL_64;
                  }
                  id v22 = [v14 registrationError];
                  uint64_t v20 = +[IMRGLog registration];
                  BOOL v23 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
                  if (v22 != (id)38)
                  {
                    if (v23)
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v14;
                      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Kicking iCloud SMS based account: %@", buf, 0xCu);
                    }

                    v26 = [(IDSAccountRepair *)v9 accountController];
                    unsigned __int8 v27 = [v14 uniqueID];
                    [v26 enableAccountWithUniqueID:v27];

                    __int16 v28 = v63;
                    [v63 registerAccount];
                    CFStringRef v29 = [v63 linkedAccounts];
                    v64[0] = _NSConcreteStackBlock;
                    v64[1] = 3221225472;
                    v64[2] = sub_100103374;
                    v64[3] = &unk_1009822F8;
                    v64[4] = v9;
                    objc_msgSend(v29, "__imForEach:", v64);
                    goto LABEL_60;
                  }
                  if (v23)
                  {
                    *(_DWORD *)buf = 138412290;
                    v76 = v14;
                    long long v24 = v20;
                    unsigned int v25 = " => Not kicking iCloud SMS based account: %@";
                    goto LABEL_62;
                  }
                }
                else
                {
                  uint64_t v12 = v59;
                }
              }
            }
          }
        }
LABEL_64:
        unsigned int v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v56 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
      id v11 = v56;
      if (!v56)
      {
LABEL_68:

        id v4 = +[IMRGLog registration];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          unsigned int v6 = " => Done repair attempt";
LABEL_70:
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
        }
LABEL_71:

        return;
      }
    }
  }
}

- (BOOL)_isPhoneAccount:(id)a3 registeredAndMatchingThisAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isAdHocAccount])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    int v8 = [v5 userUniqueIdentifier];
    __int16 v9 = [v6 userUniqueIdentifier];
    if ([v8 isEqual:v9]) {
      unsigned __int8 v7 = [v5 isRegistered];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSAccountRepair *)self accountController];
  id v6 = [v5 accountsWithType:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[IDSAccountRepair _isPhoneAccount:registeredAndMatchingThisAccount:](self, "_isPhoneAccount:registeredAndMatchingThisAccount:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)_repairAccountsWithSuccessfullAppleIDRegistrationForDSID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSAccountRepair *)self accountController];
  unsigned int v9 = [v8 isLoading];

  uint64_t v10 = +[IMRGLog registration];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      BOOL v12 = "Waiting on accounts to load, the account controller isn't ready yet";
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "   => This was an AppleID registration, let's see what we should repair", buf, 2u);
  }

  if (![(IDSAccountRepair *)self _shouldBypassRepairLogic])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v34 = self;
    unsigned int v13 = [(IDSAccountRepair *)self accountController];
    long long v14 = [v13 accounts];

    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (!v15) {
      goto LABEL_33;
    }
    id v17 = v15;
    uint64_t v18 = *(void *)v38;
    id v33 = v36;
    *(void *)&long long v16 = 138412290;
    long long v32 = v16;
    while (1)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v20, "accountType", v32, v33) == 1
          && ([v20 isAdHocAccount] & 1) == 0)
        {
          unsigned __int8 v21 = [v20 dsID];
          if (([v21 isEqualToIgnoringCase:v6] & 1) == 0) {
            goto LABEL_30;
          }
          id v22 = [v20 service];

          if (v22 != v7)
          {
            BOOL v23 = +[IMRGLog registration];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v6;
              __int16 v43 = 2112;
              long long v44 = v20;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => DSIDs match to %@, kicking for repair %@", buf, 0x16u);
            }

            if (([v20 isRegistered] & 1) == 0)
            {
              long long v24 = +[IMRGLog registration];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v25 = [v20 registrationError];
                *(_DWORD *)buf = 67109120;
                LODWORD(v42) = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " => Failed account, let's see if we should kick it (Registration Error: %d)", buf, 8u);
              }

              unint64_t v26 = (unint64_t)[v20 registrationError] + 1;
              if (v26 > 0x32) {
                goto LABEL_26;
              }
              if (((1 << v26) & 0x718A310C0000DLL) != 0) {
                continue;
              }
              if (((1 << v26) & 0x40000000002) == 0) {
                goto LABEL_26;
              }
              unsigned __int8 v21 = [v20 service];
              if ([v21 iCloudBasedService])
              {
                unsigned __int8 v27 = [(IDSSystemAccountAdapter *)v34->_systemAccountAdapter iCloudSystemAccountWithError:0];

                if (!v27) {
                  continue;
                }
LABEL_26:
                __int16 v28 = +[IMRGLog registration];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v32;
                  id v42 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " => Kicking Apple ID based account: %@", buf, 0xCu);
                }

                CFStringRef v29 = [(IDSAccountRepair *)v34 accountController];
                __int16 v30 = [v20 uniqueID];
                [v29 enableAccountWithUniqueID:v30];

                [v20 registerAccount];
                v31 = [v20 linkedAccounts];
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v36[0] = sub_100103B90;
                v36[1] = &unk_1009822F8;
                v36[2] = v34;
                objc_msgSend(v31, "__imForEach:", v35);

                unsigned __int8 v21 = +[IMRGLog registration];
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v32;
                  id v42 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, " ** Tried to repair account: %@", buf, 0xCu);
                }
              }
LABEL_30:

              continue;
            }
          }
        }
      }
      id v17 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (!v17)
      {
LABEL_33:

        uint64_t v10 = +[IMRGLog registration];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          BOOL v12 = " => Done repair attempt";
LABEL_35:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
        }
LABEL_36:

        break;
      }
    }
  }
}

- (void)_registerForAccountRepairActivity
{
  unsigned int v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for account repair activity.", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100103DB4;
  handler[3] = &unk_100982630;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.accountrepair", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)repairAccounts
{
  unsigned int v3 = [(IDSAccountRepair *)self accountController];
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Waiting on accounts to load, the account controller isn't ready yet";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_128;
    }
    goto LABEL_128;
  }
  id v7 = +[IMSystemMonitor sharedInstance];
  unsigned int v8 = [v7 isUnderFirstDataProtectionLock];

  if (v8)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100710B58();
    }
    goto LABEL_128;
  }
  BOOL waitingForMigration = self->_waitingForMigration;
  id v5 = +[IMRGLog registration];
  BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!waitingForMigration)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Account repair timer fired", buf, 2u);
    }

    v87 = self;
    [(IDSAccountRepair *)self _createAndEnableExistingSystemAccounts];
    BOOL v11 = +[NSArray arrayWithObjects:@"iMessage", @"com.apple.private.alloy.maps", @"FaceTime", @"FaceTime_temporary", @"iMessage_temporary", @"IDS_temporary", 0];
    BOOL v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up dead keychain items", buf, 2u);
    }

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    unsigned int v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v99 objects:v112 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v100;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v100 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          unint64_t v19 = +[IMRGLog registration];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v104 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cleaning up keychain items for service: %@", buf, 0xCu);
          }

          IMDeleteItemsForService();
        }
        id v15 = [v13 countByEnumeratingWithState:&v99 objects:v112 count:16];
      }
      while (v15);
    }
    v86 = v13;

    uint64_t v20 = +[IMRGLog registration];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Done", buf, 2u);
    }

    unsigned __int8 v21 = +[IDSRegistrationReasonTracker sharedInstance];
    [v21 setMostRecentIDSRegistrationReason:3];

    id v22 = +[IDSRegistrationReasonTracker sharedInstance];
    BOOL v23 = +[IDSRequestReasonContainer repairRequestWithSubreason:1 pathID:3];
    [v22 setRegistrationRequestReason:v23];

    long long v24 = +[FTPasswordManager sharedInstance];
    [v24 performCleanUpWithCompletion:0];

    unsigned int v25 = v87;
    unint64_t v26 = [(IDSAccountRepair *)v87 accountController];
    unsigned __int8 v27 = [v26 accounts];
    id v28 = [v27 _copyForEnumerating];

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (!v30)
    {
LABEL_125:

      [(IDSAccountRepair *)v25 repairiCloudBasedAccounts];
      [(IDSAccountRepair *)v25 _repairiTunesBasedAccounts];
      [(IDSAccountRepair *)v25 _repairKVSEntriesForKT];
      v85 = +[IMRGLog registration];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, " *** Done", buf, 2u);
      }

      id v5 = v86;
      goto LABEL_128;
    }
    id v31 = v30;
    uint64_t v32 = *(void *)v96;
    uint64_t v33 = IDSServiceNameiMessage;
    uint64_t v91 = IDSServiceNameFaceTime;
    uint64_t v89 = IDSServiceNameFaceTimeMulti;
    uint64_t v90 = IDSServiceNameCalling;
    uint64_t v92 = IDSServiceNameiMessage;
    uint64_t v93 = *(void *)v96;
    id v88 = v29;
LABEL_28:
    uint64_t v34 = 0;
    id v94 = v31;
    while (1)
    {
      if (*(void *)v96 != v32) {
        objc_enumerationMutation(v29);
      }
      char v35 = *(void **)(*((void *)&v95 + 1) + 8 * v34);
      v36 = [v35 service];
      long long v37 = [v35 uniqueID];
      if ([(__CFString *)v36 iCloudBasedService]) {
        goto LABEL_123;
      }
      long long v38 = [v35 service];
      long long v39 = [v38 identifier];

      if (([v39 isEqualToString:v33] & 1) != 0
        || ([v39 isEqualToString:v91] & 1) != 0
        || [v39 isEqualToString:v90])
      {
        break;
      }
      unsigned int v52 = [v39 isEqualToString:v89];
      unsigned int v40 = [v39 isEqualToString:v33];
      if (v52) {
        goto LABEL_36;
      }
LABEL_58:
      if (([v35 isUserDisabled] & 1) == 0)
      {
        __int16 v53 = +[IDSRestrictions sharedInstance];
        unsigned int v54 = v40 & ~[v53 shouldDisableService:v36];

        if (v54 == 1)
        {
          v55 = +[IDSRegistrationKeyManager sharedInstance];
          unsigned int v56 = [v55 registrationNeedsKTDataUpdated];

          v57 = +[IDSFoundationLog KeyTransparency];
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          if (v56)
          {
            if (v58)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Registering to update KT Data.", buf, 2u);
            }

            uint64_t v59 = [(IDSAccountRepair *)v25 accountController];
            [v59 enableAccountWithUniqueID:v37];

            [v35 registerAccount];
          }
          else
          {
            if (v58)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Not reregistering to update KT Data.", buf, 2u);
            }
          }
        }
      }
      unsigned int v60 = [v35 isEnabled];
      v61 = +[IMRGLog registration];
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      if (v60)
      {
        if (v62)
        {
          *(_DWORD *)buf = 138412546;
          v104 = v37;
          __int16 v105 = 2112;
          CFStringRef v106 = v36;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, " => Enabled, account uniqueID: %@, service name: %@", buf, 0x16u);
        }

        v61 = [(IDSAccountRepair *)v25 accountController];
        id v63 = v35;
        if ([v63 accountType] != 2)
        {
          unsigned int v64 = [v63 registrationStatus];
          switch(v64)
          {
            case 0xFFFFFFFF:
              long long v67 = +[IMRGLog registration];
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v68 = [v63 registrationError];
                *(_DWORD *)buf = 67109120;
                LODWORD(v104) = v68;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, " => Failed account, let's see if we should kick it (Registration Error: %d)", buf, 8u);
              }

              switch((unint64_t)[v63 registrationError])
              {
                case 0uLL:
                case 1uLL:
                case 2uLL:
                case 0x15uLL:
                case 0x16uLL:
                case 0x1BuLL:
                case 0x1FuLL:
                case 0x24uLL:
                case 0x26uLL:
                case 0x29uLL:
                  long long v69 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_119;
                  }
                  goto LABEL_103;
                case 3uLL:
                case 4uLL:
                  long long v69 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_119;
                  }
                  *(_WORD *)buf = 0;
                  long long v70 = v69;
                  long long v71 = " => We sent too many SMS, not retrying, disabling account";
                  goto LABEL_83;
                case 5uLL:
                case 6uLL:
                  v83 = +[IMRGLog registration];
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, " => Garbage SMS signature, disabling", buf, 2u);
                  }

                  v65 = [v63 uniqueID];
                  [v61 disablePrimaryAccountWithUniqueID:v65];
                  goto LABEL_120;
                case 7uLL:
                case 8uLL:
                case 9uLL:
                case 0x2CuLL:
                case 0x2DuLL:
                case 0x2EuLL:
                  long long v74 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_93;
                  }
                  *(_WORD *)buf = 0;
                  v79 = v74;
                  v80 = " => This appeared to be a server or connectivity error, re-registering";
                  goto LABEL_92;
                case 0xAuLL:
                  long long v74 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_93;
                  }
                  *(_WORD *)buf = 0;
                  v79 = v74;
                  v80 = " => We need a new signature (server authentication failed), re-registering";
                  goto LABEL_92;
                case 0xBuLL:
                  long long v74 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_93;
                  }
                  *(_WORD *)buf = 0;
                  v79 = v74;
                  v80 = " => We were missing auth credentials, re-registering";
                  goto LABEL_92;
                case 0xCuLL:
                case 0xDuLL:
                case 0xEuLL:
                case 0xFuLL:
                case 0x10uLL:
                case 0x11uLL:
                case 0x12uLL:
                case 0x13uLL:
                case 0x14uLL:
                case 0x17uLL:
                case 0x18uLL:
                case 0x19uLL:
                case 0x1AuLL:
                case 0x1CuLL:
                case 0x1DuLL:
                case 0x20uLL:
                case 0x2AuLL:
                case 0x2BuLL:
                  long long v69 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_119;
                  }
                  goto LABEL_103;
                case 0x1EuLL:
                  long long v74 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_93;
                  }
                  *(_WORD *)buf = 0;
                  v79 = v74;
                  v80 = " => This appeared to be a rate limit error, re-registering";
                  goto LABEL_92;
                case 0x2FuLL:
                case 0x30uLL:
                case 0x31uLL:
                  long long v69 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_119;
                  }
LABEL_103:
                  unsigned int v82 = [v63 registrationError];
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v104) = v82;
                  long long v70 = v69;
                  long long v71 = " => Not retrying for error: %d, disabling account";
                  break;
                default:
                  long long v69 = +[IMRGLog registration];
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_119;
                  }
                  unsigned int v84 = [v63 registrationError];
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v104) = v84;
                  long long v70 = v69;
                  long long v71 = " => Default error: %d   disabling";
                  break;
              }
              uint32_t v72 = 8;
              goto LABEL_118;
            case 0u:
              long long v69 = +[IMRGLog registration];
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                long long v70 = v69;
                long long v71 = " => Unknown account status, let's disable it";
LABEL_83:
                uint32_t v72 = 2;
LABEL_118:
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, v71, buf, v72);
              }
LABEL_119:

              v65 = [v63 uniqueID];
              [v61 disableAccountWithUniqueID:v65];
              goto LABEL_120;
            case 1u:
              long long v73 = +[IMRGLog registration];
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, " => Unregistered account, let's see if we can register it", buf, 2u);
              }

              long long v74 = [v63 vettedAliases];
              if ([v74 count]) {
                goto LABEL_93;
              }
              unsigned __int8 v75 = [v63 hasEverRegistered];

              if (v75) {
                goto LABEL_94;
              }
              v65 = +[IMRGLog registration];
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v76 = v65;
              v77 = " => account has no vetted aliases, and it's never registered, let's ignore it";
              uint32_t v78 = 2;
              break;
            case 2u:
            case 5u:
              v65 = +[IMRGLog registration];
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                v66 = _IDSStringFromIDSRegistrationStatus();
                *(_DWORD *)buf = 138412290;
                v104 = v66;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, " => %@", buf, 0xCu);
              }
              goto LABEL_120;
            case 3u:
              long long v74 = +[IMRGLog registration];
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v79 = v74;
                v80 = " => Authenticated, kicking a register";
LABEL_92:
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, v80, buf, 2u);
              }
LABEL_93:

LABEL_94:
              v81 = [v63 uniqueID];
              [v61 enableAccountWithUniqueID:v81];

              [v63 registerAccount];
              goto LABEL_121;
            default:
              v65 = +[IMRGLog registration];
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_DWORD *)buf = 67109120;
              LODWORD(v104) = v64;
              v76 = v65;
              v77 = " => *** Other status: %d";
              uint32_t v78 = 8;
              break;
          }
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, v77, buf, v78);
LABEL_120:
        }
LABEL_121:
      }
      else if (v62)
      {
        *(_DWORD *)buf = 138412546;
        v104 = v37;
        __int16 v105 = 2112;
        CFStringRef v106 = v36;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, " => Disabled, skipping: %@, service name: %@", buf, 0x16u);
      }

      uint64_t v32 = v93;
      id v31 = v94;
      uint64_t v33 = v92;
LABEL_123:

      if (v31 == (id)++v34)
      {
        id v31 = [v29 countByEnumeratingWithState:&v95 objects:v111 count:16];
        if (!v31) {
          goto LABEL_125;
        }
        goto LABEL_28;
      }
    }
    unsigned int v40 = [v39 isEqualToString:v33];
LABEL_36:
    if (([v35 isUserDisabled] & 1) == 0
      && ([v35 isRegistered] & 1) == 0)
    {
      long long v41 = +[IDSRestrictions sharedInstance];
      unsigned __int8 v42 = [v41 shouldDisableService:v36];

      if ((v42 & 1) == 0)
      {
        unint64_t v43 = (unint64_t)[v35 registrationError];
        unsigned int v44 = (v43 < 0x32) & (0x3800000000000uLL >> v43);
        BOOL v45 = ((0x7320779FFFF9uLL >> v43) & 1) == 0 && v43 < 0x32;
        long long v46 = +[IMRGLog registration];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          if (v45) {
            CFStringRef v47 = @"NO";
          }
          else {
            CFStringRef v47 = @"YES";
          }
          id v48 = [v35 registrationError];
          *(_DWORD *)buf = 138413058;
          CFStringRef v49 = @"NO";
          if (v44) {
            CFStringRef v49 = @"YES";
          }
          v104 = v39;
          __int16 v105 = 2112;
          CFStringRef v106 = v47;
          unsigned int v25 = v87;
          __int16 v107 = 2048;
          id v108 = v48;
          __int16 v109 = 2112;
          CFStringRef v110 = v49;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Checking disabled account {serviceIdentifier: %@, shouldRepair: %@, registrationError: %lld, shouldCheckKTStates: %@ }", buf, 0x2Au);
        }

        if (!v45)
        {
          v50 = [(IDSAccountRepair *)v25 accountController];
          [v50 enableAccountWithUniqueID:v37];

          [v35 registerAccount];
        }
        if ((v44 & _os_feature_enabled_impl()) == 1)
        {
          __int16 v51 = +[IDSFoundationLog KeyTransparency];
          id v29 = v88;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Registration failed due to bad KT Account Key. Checking state to see if are ready to register.", buf, 2u);
          }

          [(IDSAccountRepair *)v25 _repairKTAccount:v35];
        }
        else
        {
          id v29 = v88;
        }
      }
    }
    goto LABEL_58;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    id v6 = "Waiting for migration, not repairing accounts";
    goto LABEL_10;
  }
LABEL_128:
}

- (void)repairService:(id)a3 withPrimaryUserName:(id)a4
{
  id v6 = a3;
  id v64 = a4;
  id v7 = [v6 pushTopic];
  unsigned int v8 = [v7 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

  if ([v6 adHocServiceType] != 2 || v8)
  {
    unsigned int v9 = [v6 adHocServiceType] == 2 ? v8 : 0;
    if (v9 != 1
      || ([(IDSAccountRepair *)self accountController],
          BOOL v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 isLocalSetupEnabled],
          v10,
          v11))
    {
      if ([v6 adHocServiceType] != 5)
      {
        if (![v6 disabledOnTinkerWatch]
          || (+[IDSPairingManager sharedInstance],
              BOOL v12 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v13 = [v12 isCurrentDeviceTinkerConfiguredWatch],
              v12,
              (v13 & 1) == 0))
        {
          if (![v6 enabledOnlyWhenPaired]
            || ([(IDSAccountRepair *)self accountController],
                id v14 = objc_claimAutoreleasedReturnValue(),
                unsigned int v15 = [v14 isTraditionalLocalSetupEnabled],
                v14,
                v15))
          {
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            uint64_t v16 = [(IDSAccountRepair *)self accountController];
            id v61 = v6;
            id v17 = [v16 accountsOnService:v6 withType:1];

            id v18 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v73;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v73 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  id v22 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                  if (([v22 isAdHocAccount] & 1) == 0)
                  {
                    BOOL v23 = +[IMRGLog registration];
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v77 = v22;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "   Checking account for deletion: %@", buf, 0xCu);
                    }

                    long long v24 = [v22 loginID];
                    int v25 = IMAreEmailsLogicallyTheSame();

                    unint64_t v26 = +[IMRGLog registration];
                    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
                    if (v25)
                    {
                      if (v27)
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "   Account is primary, it should not be deleted", buf, 2u);
                      }
                    }
                    else
                    {
                      if (v27)
                      {
                        id v28 = [v22 loginID];
                        *(_DWORD *)buf = 138412546;
                        id v77 = v64;
                        __int16 v78 = 2112;
                        v79 = v28;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Account does not appear to be primary, disabling it, and deleting it  (%@ <> %@)", buf, 0x16u);
                      }
                      unint64_t v26 = [(IDSAccountRepair *)self accountController];
                      [v26 removeAccount:v22];
                    }
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v72 objects:v80 count:16];
              }
              while (v19);
            }

            id v6 = v61;
            unsigned __int8 v29 = [(IDSAccountRepair *)self _hasActiveAppleIDBasedAccountOnService:v61];
            id v30 = [(IDSAccountRepair *)self accountController];
            id v31 = [v30 accountsOnService:v61];
            uint64_t v32 = objc_msgSend(v31, "__imArrayByFilteringWithBlock:", &stru_100982690);

            uint64_t v34 = sub_100105970(v33, 1, v32);
            char v35 = sub_100105970((uint64_t)v34, 0, v32);
            v36 = sub_100105970((uint64_t)v35, 2, v32);
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_100105A48;
            v68[3] = &unk_1009826B8;
            unsigned __int8 v71 = v29;
            id v63 = v64;
            id v69 = v63;
            long long v70 = self;
            objc_msgSend(v34, "__imForEach:", v68);
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_100105DD0;
            v67[3] = &unk_1009826E0;
            v67[4] = self;
            objc_msgSend(v35, "__imForEach:", v67);
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_100106034;
            v66[3] = &unk_1009826E0;
            v66[4] = self;
            objc_msgSend(v36, "__imForEach:", v66);
            long long v37 = [(IDSAccountRepair *)self accountController];
            long long v38 = [v37 accountsOnService:v61 withType:1];
            id v39 = [v38 count];

            if (!v39)
            {
              BOOL v62 = v32;
              BOOL v58 = v35;
              contexta = v36;
              long long v41 = +[IMRGLog registration];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v77 = v61;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, " => We have no active apple ID based accounts for service: %@", buf, 0xCu);
              }

              unsigned __int8 v42 = [(IDSAccountRepair *)self _activeAppleIDAccount];
              if (v42)
              {
                id v43 = v63;
                unsigned int v44 = [v42 loginID];
                int v45 = IMAreEmailsLogicallyTheSame();

                if (v45)
                {
                  long long v46 = +[IMRGLog registration];
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v47 = [v42 loginID];
                    *(_DWORD *)buf = 138412546;
                    id v77 = v61;
                    __int16 v78 = 2112;
                    v79 = v47;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Creating new account based on existing account with service %@ login ID %@", buf, 0x16u);
                  }
                  id v48 = v40;

                  uint64_t v49 = [v42 loginID];

                  v50 = [v42 accountInfo];
                  id v43 = (id)v49;
                }
                else
                {
                  id v48 = v40;
                  v50 = 0;
                }
                unsigned int v52 = [IDSDAccount alloc];
                __int16 v53 = +[NSString stringGUID];
                __int16 v51 = [(IDSDAccount *)v52 initWithLoginID:v43 service:v61 uniqueID:v53 accountType:1 accountConfig:v50];

                unsigned int v54 = [(IDSAccountRepair *)self accountController];
                [v54 addPrimaryAccount:v51];

                v55 = [(IDSAccountRepair *)self accountController];
                unsigned int v56 = [v51 uniqueID];
                [v55 enablePrimaryAccountWithUniqueID:v56];

                id v6 = v61;
                v57 = [v51 linkedAccounts];
                v65[0] = _NSConcreteStackBlock;
                v65[1] = 3221225472;
                v65[2] = sub_10010610C;
                v65[3] = &unk_1009822F8;
                v65[4] = self;
                objc_msgSend(v57, "__imForEach:", v65);

                [v51 setupAccountWithCompletionBlock:0];
                unsigned int v40 = v48;
              }
              else
              {
                __int16 v51 = +[IMRGLog registration];
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, " => No other signed in AppleID accounts, skipping", buf, 2u);
                }
              }

              char v35 = v58;
              v36 = contexta;
              uint64_t v32 = v62;
            }
          }
        }
      }
    }
  }
}

- (id)_activeAppleIDAccount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(IDSAccountRepair *)self accountController];
  unsigned int v3 = [v2 accounts];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 accountType] == 1
          && [v7 isEnabled]
          && (int)[v7 registrationStatus] >= 2
          && ![v7 isAdHocAccount])
        {
          id v4 = v7;
          goto LABEL_14;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v4;
}

- (BOOL)_hasActiveAppleIDBasedAccountOnService:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(IDSAccountRepair *)self accountController];
  id v6 = [v5 accountsOnService:v4];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 accountType] == 1
          && [v10 isEnabled]
          && (int)[v10 registrationStatus] >= 2
          && ![v10 isAdHocAccount])
        {
          LOBYTE(v7) = 1;
          goto LABEL_14;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v7;
}

- (id)_createiTunesAccountFromSystemIfNeeded
{
  unsigned int v3 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iTunesSystemAccountWithError:0];
  if (v3)
  {
    id v4 = +[IDSDServiceController sharedInstance];
    uint64_t v5 = [v4 iTunesService];

    id v6 = [(IDSAccountRepair *)self accountController];
    id v7 = [v3 username];
    uint64_t v8 = [v6 existingAccountOnService:v5 withType:1 loginID:v7];

    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v5 == 0;
    }
    if (v9)
    {
      long long v11 = 0;
    }
    else
    {
      long long v10 = [v3 username];
      long long v11 = (IDSDAccount *)[v10 length];

      if (v11)
      {
        long long v12 = [v3 DSID];
        id v13 = [v12 length];

        if (v13)
        {
          uint64_t v26 = kIDSServiceDefaultsAuthorizationIDKey;
          long long v14 = [v3 DSID];
          BOOL v27 = v14;
          long long v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        }
        else
        {
          long long v15 = 0;
        }
        uint64_t v16 = [IDSDAccount alloc];
        id v17 = [v3 username];
        id v18 = +[NSString stringGUID];
        long long v11 = [(IDSDAccount *)v16 initWithLoginID:v17 service:v5 uniqueID:v18 accountType:1 accountConfig:v15];

        id v19 = +[IMRGLog iCloud];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [(IDSDAccount *)v11 smallDescription];
          int v22 = 138412546;
          BOOL v23 = v5;
          __int16 v24 = 2112;
          int v25 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created new iTunes account based on system account { service: %@, account: %@ }", (uint8_t *)&v22, 0x16u);
        }
      }
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)_createAndEnableExistingSystemAccounts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(IDSAccountRepair *)self _createiTunesAccountFromSystemIfNeeded];
  if (v4) {
    [v3 addObject:v4];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v9);
        long long v11 = [(IDSAccountRepair *)self accountController];
        [v11 addAccount:v10];

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
        id v18 = [(IDSAccountRepair *)self accountController];
        id v19 = [v17 uniqueID];
        [v18 enablePrimaryAccountWithUniqueID:v19];

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }
}

- (void)_repairiTunesBasedAccounts
{
  id v3 = [(IDSAccountRepair *)self accountController];
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting on accounts to load, the account controller isn't ready yet", buf, 2u);
    }
  }
  else
  {
    if ([(IDSAccountRepair *)self _shouldBypassRepairLogic]) {
      return;
    }
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IDSAccountRepair *)self accountController];
      unsigned int v8 = [v7 hasActiveSMSAccount];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   => Has SMS Account active: %@", buf, 0xCu);
    }
    uint64_t v10 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iTunesSystemAccountWithError:0];
    id v5 = v10;
    if (v10)
    {
      long long v11 = [v10 username];
      id v12 = +[IMRGLog registration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Repairing iTunes based accounts if needed (Primary account: %@)", buf, 0xCu);
      }

      id v13 = +[IDSDServiceController sharedInstance];
      id v14 = [v13 iTunesService];

      [(IDSAccountRepair *)self repairService:v14 withPrimaryUserName:v11];
      uint64_t v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, " => Done repair attempt", buf, 2u);
      }
    }
    else
    {
      uint64_t v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iTunes isn't signed in, no repair needed, signing out", buf, 2u);
      }

      im_dispatch_after_primary_queue();
    }
  }
}

- (void)repairiCloudBasedAccounts
{
  id v3 = [(IDSAccountRepair *)self accountController];
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting on accounts to load, the account controller isn't ready yet", buf, 2u);
    }
  }
  else
  {
    if ([(IDSAccountRepair *)self _shouldBypassRepairLogic]) {
      return;
    }
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IDSAccountRepair *)self accountController];
      unsigned int v8 = [v7 hasActiveSMSAccount];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   => Has SMS Account active: %@", buf, 0xCu);
    }
    uint64_t v10 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iCloudSystemAccountWithError:0];
    id v5 = v10;
    if (v10)
    {
      long long v11 = [v10 username];
      id v12 = +[IMRGLog registration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Repairing iCloud based accounts if needed (Primary account: %@)", buf, 0xCu);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = +[IDSDServiceController sharedInstance];
      id v14 = [v13 allServices];

      id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v19 iCloudBasedService]) {
              [(IDSAccountRepair *)self repairService:v19 withPrimaryUserName:v11];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v16);
      }

      long long v20 = +[IMRGLog registration];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Done repair attempt", buf, 2u);
      }
    }
    else
    {
      long long v21 = +[IMRGLog registration];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "iCloud isn't signed in, no repair needed, signing out", buf, 2u);
      }

      im_dispatch_after_primary_queue();
      long long v22 = [(IDSAccountRepair *)self accountController];
      [v22 updateDevicePropertiesWithDevices:0];
    }
  }
}

- (void)_repairKTAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking to see if we can repair the KT account.", buf, 2u);
  }

  keyTransparencyVerifier = self->_keyTransparencyVerifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010729C;
  v8[3] = &unk_100982708;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(IDSKeyTransparencyVerifier *)keyTransparencyVerifier fetchKTCDPStatus:v8];
}

- (void)_repairKVSEntriesForKT
{
  v2 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking to see if we need to repair KVS.", v4, 2u);
  }

  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
  {
    id v3 = +[IDSKeyTransparencyVerifier sharedInstance];
    [v3 repairKVSDeviceEntryIfNeeded];
  }
  else
  {
    id v3 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100710BC0();
    }
  }
}

+ (double)_phoneNumberRepairIntervalForCount:(int64_t)a3
{
  double v4 = sub_1001074D0();
  double v5 = sub_10010755C();
  double v6 = exp2((double)a3);
  if (v4 * (double)(uint64_t)v6 >= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v4 * (double)(uint64_t)v6;
  }
  unsigned int v8 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218752;
    double v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = (uint64_t)v6;
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    double v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current repair interval: %f multiplier: %ld index: %ld max: %f", (uint8_t *)&v10, 0x2Au);
  }

  return v7;
}

- (BOOL)_shouldNotSetupPhoneNumberRepairTimer
{
  v2 = +[FTDeviceSupport sharedInstance];
  if ([v2 registrationSupported]) {
    unsigned int v3 = !+[IDSRegistrationController systemSupportsPhoneNumberRegistration];
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (id)_lastRepairIntervalFromPrefs
{
  v2 = [(IDSAccountRepair *)self userDefaults];
  unsigned int v3 = [v2 appValueForKey:@"LastRepairInterval"];

  return v3;
}

- (id)_totalRepairCountFromPrefs
{
  v2 = [(IDSAccountRepair *)self userDefaults];
  unsigned int v3 = [v2 appValueForKey:@"TotalRepairCount"];

  return v3;
}

- (void)setupPhoneNumberRepairTimer
{
  unsigned int v3 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isUnderFirstDataProtectionLock];

  if ((v4 & 1) == 0)
  {
    if ([(IDSAccountRepair *)self _shouldNotSetupPhoneNumberRepairTimer])
    {
      double v5 = +[IMRGLog phoneRepair];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = +[FTDeviceSupport sharedInstance];
        if ([v6 registrationSupported]) {
          CFStringRef v7 = @"YES";
        }
        else {
          CFStringRef v7 = @"NO";
        }
        if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
        {
          CFStringRef v8 = @"YES";
        }
        else
        {
          CFStringRef v8 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v42 = v7;
        __int16 v43 = 2112;
        CFStringRef v44 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not setting up repair (registrationSupported: %@) (supportsSMSIdentification: %@)", buf, 0x16u);
      }
LABEL_35:

      return;
    }
    [(IMDispatchTimer *)self->_phoneRepairTimer invalidate];
    phoneRepairTimer = self->_phoneRepairTimer;
    self->_phoneRepairTimer = 0;

    +[NSDate timeIntervalSinceReferenceDate];
    double v11 = v10;
    __int16 v12 = [(IDSAccountRepair *)self _lastRepairIntervalFromPrefs];
    double v5 = v12;
    if (v12)
    {
      [v12 doubleValue];
      double v14 = v13;
      int64_t v15 = +[IMRGLog phoneRepair];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [v5 doubleValue];
        +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        __int16 v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded last repair date %@", buf, 0xCu);
      }
      double v17 = [(IDSAccountRepair *)self _totalRepairCountFromPrefs];
      CFStringRef v18 = v17;
      if (v17) {
        uint64_t v19 = (uint64_t)[v17 integerValue] - 1;
      }
      else {
        uint64_t v19 = -1;
      }
      uint64_t v25 = v19 & ~(v19 >> 63);
      self->_lastBagRepairInterval = sub_1001074D0();
      +[IDSAccountRepair _phoneNumberRepairIntervalForCount:v25];
      double v22 = v14 + v26;
      if (v22 < v11)
      {
        long long v27 = +[IMRGLog phoneRepair];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v22];
          *(_DWORD *)buf = 138412290;
          CFStringRef v42 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "We've missed the next repair date %@, repairing now...", buf, 0xCu);
        }
        [(IDSAccountRepair *)self _phoneNumberRepairTimerHit:0];

        goto LABEL_35;
      }
LABEL_32:

      double v33 = v22 - v11;
      uint64_t v34 = +[IMRGLog phoneRepair];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        char v35 = +[NSDate dateWithTimeIntervalSinceNow:v33];
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Next repair date %@", buf, 0xCu);
      }
      id v36 = objc_alloc((Class)IMDispatchTimer);
      long long v37 = im_primary_queue();
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100107D3C;
      v40[3] = &unk_100980598;
      v40[4] = self;
      long long v38 = (IMDispatchTimer *)[v36 initWithQueue:v37 interval:(unint64_t)v33 repeats:0 handlerBlock:v40];
      id v39 = self->_phoneRepairTimer;
      self->_phoneRepairTimer = v38;

      goto LABEL_35;
    }
    long long v20 = [(IDSAccountRepair *)self userDefaults];
    CFStringRef v18 = [v20 appValueForKey:@"InitialRepairInterval"];

    if (v18)
    {
      [v18 doubleValue];
      double v22 = v21;
      long long v23 = +[IMRGLog phoneRepair];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        goto LABEL_32;
      }
      long long v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v22];
      *(_DWORD *)buf = 138412290;
      CFStringRef v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loaded initial repair date %@", buf, 0xCu);
    }
    else
    {
      uint32_t v29 = arc4random_uniform(0x278D00u);
      if (IDSDebuggingShouldForcePhoneRepairTimer()) {
        IDSDebuggingPhoneRepairTimerOverride();
      }
      else {
        double v30 = (double)v29;
      }
      double v22 = v11 + v30;
      id v31 = +[IMRGLog phoneRepair];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v22];
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Generated inital repair date %@", buf, 0xCu);
      }
      long long v23 = [(IDSAccountRepair *)self userDefaults];
      long long v24 = +[NSNumber numberWithDouble:v22];
      [v23 setAppValue:v24 forKey:@"InitialRepairInterval"];
    }

    goto LABEL_31;
  }
}

- (void)recalculatePhoneRepairTimer
{
  unsigned int v3 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bag reloaded, setting up new phone number repair timer", buf, 2u);
  }

  double v4 = floor(self->_lastBagRepairInterval);
  if (v4 > 0.0 && v4 != floor(sub_1001074D0()))
  {
    double v5 = +[IMRGLog phoneRepair];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Repair intervals differ, setting up new repair timer", v6, 2u);
    }

    [(IDSAccountRepair *)self setupPhoneNumberRepairTimer];
  }
}

- (void)_resetPhoneNumberRepairCounter
{
  unsigned int v3 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting phone number repair counter", v5, 2u);
  }

  double v4 = [(IDSAccountRepair *)self userDefaults];
  [v4 removeAppValueForKey:@"TotalRepairCount"];
}

- (void)_phoneNumberRepairTimerHit:(id)a3
{
  double v4 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Phone repair timer hit", buf, 2u);
  }

  [(IMDispatchTimer *)self->_phoneRepairTimer invalidate];
  if (![(IDSAccountRepair *)self _repairPhoneNumberAccounts]) {
    [(IDSAccountRepair *)self _resetPhoneNumberRepairCounter];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v6 = [(IDSAccountRepair *)self _totalRepairCountFromPrefs];
  CFStringRef v7 = v6;
  if (v6) {
    CFStringRef v8 = (char *)[v6 integerValue];
  }
  else {
    CFStringRef v8 = 0;
  }
  id v9 = +[NSNumber numberWithInteger:v8 + 1];
  double v10 = [(IDSAccountRepair *)self userDefaults];
  [v10 removeAppValueForKey:@"InitialRepairInterval"];

  double v11 = [(IDSAccountRepair *)self userDefaults];
  [v11 setAppValue:v5 forKey:@"LastRepairInterval"];

  __int16 v12 = [(IDSAccountRepair *)self userDefaults];
  [v12 setAppValue:v9 forKey:@"TotalRepairCount"];

  +[IDSAccountRepair _phoneNumberRepairIntervalForCount:v8];
  double v14 = v13;
  int64_t v15 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = +[NSDate dateWithTimeIntervalSinceNow:v14];
    *(_DWORD *)buf = 138412290;
    long long v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Next repair date %@", buf, 0xCu);
  }
  id v17 = objc_alloc((Class)IMDispatchTimer);
  CFStringRef v18 = im_primary_queue();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100108188;
  v21[3] = &unk_100980598;
  v21[4] = self;
  uint64_t v19 = (IMDispatchTimer *)[v17 initWithQueue:v18 interval:(unint64_t)v14 repeats:0 handlerBlock:v21];
  phoneRepairTimer = self->_phoneRepairTimer;
  self->_phoneRepairTimer = v19;
}

- (BOOL)_repairPhoneNumberAccounts
{
  unsigned int v3 = +[IMRGLog phoneRepair];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Repairing phone number accounts", buf, 2u);
  }

  double v4 = +[FTDeviceSupport sharedInstance];
  if (![v4 registrationSupported])
  {

    return 0;
  }
  unsigned int v5 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration];

  if (!v5 || [(IDSAccountRepair *)self _shouldBypassRepairLogic]) {
    return 0;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  double v6 = +[IDSDServiceController sharedInstance];
  CFStringRef v7 = [v6 allServices];

  id v8 = [v7 countByEnumeratingWithState:&v76 objects:v97 count:16];
  if (v8)
  {
    id v9 = v8;
    char v66 = 0;
    uint64_t v10 = *(void *)v77;
    long long v67 = self;
    uint64_t v62 = *(void *)v77;
    id v63 = v7;
    do
    {
      double v11 = 0;
      id v64 = v9;
      do
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v11);
        double v13 = objc_msgSend(v12, "pushTopic", v62, v63);
        unsigned int v14 = [v13 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

        if ([v12 adHocServiceType] != 2 || v14 != 0)
        {
          unsigned int v16 = [v12 adHocServiceType] == 2 ? v14 : 0;
          if (v16 != 1
            || ([(IDSAccountRepair *)self accountController],
                id v17 = objc_claimAutoreleasedReturnValue(),
                unsigned int v18 = [v17 isLocalSetupEnabled],
                v17,
                v18))
          {
            if ([v12 adHocServiceType] != 5)
            {
              if (![v12 disabledOnTinkerWatch]
                || (+[IDSPairingManager sharedInstance],
                    uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v20 = [v19 isCurrentDeviceTinkerConfiguredWatch],
                    v19,
                    (v20 & 1) == 0))
              {
                if (![v12 enabledOnlyWhenPaired]
                  || ([(IDSAccountRepair *)self accountController],
                      double v21 = objc_claimAutoreleasedReturnValue(),
                      unsigned int v22 = [v21 isTraditionalLocalSetupEnabled],
                      v21,
                      v22))
                {
                  v65 = v11;
                  long long v23 = [(IDSAccountRepair *)self accountController];
                  long long v24 = [v23 accountsOnService:v12];

                  long long v74 = 0u;
                  long long v75 = 0u;
                  long long v72 = 0u;
                  long long v73 = 0u;
                  id v25 = v24;
                  id v26 = [v25 countByEnumeratingWithState:&v72 objects:v96 count:16];
                  if (v26)
                  {
                    id v27 = v26;
                    uint64_t v28 = *(void *)v73;
                    id v68 = v25;
                    do
                    {
                      for (i = 0; i != v27; i = (char *)i + 1)
                      {
                        if (*(void *)v73 != v28) {
                          objc_enumerationMutation(v25);
                        }
                        double v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                        if (![v30 accountType]
                          && ([v30 isAdHocAccount] & 1) == 0)
                        {
                          unsigned int v70 = [v30 isRegistered];
                          id v31 = [(IDSAccountRepair *)self accountController];
                          uint64_t v32 = [v30 uniqueID];
                          unsigned int v69 = [v31 isEnabledAccount:v32];

                          double v33 = [v30 service];
                          unsigned int v34 = [v33 shouldAutoRegisterAllHandles];

                          unsigned int v71 = [v30 isUserDisabled];
                          LODWORD(v33) = [v30 registrationStatus];
                          unint64_t v35 = (unint64_t)[v30 registrationError];
                          unint64_t v36 = v35;
                          LODWORD(v37) = 0;
                          if (v33 == -1 && v35 <= 0x2E) {
                            unint64_t v37 = (0x700040000FE0uLL >> v35) & 1;
                          }
                          long long v38 = [(IDSAccountRepair *)self accountController];
                          id v39 = [v30 service];
                          unsigned int v40 = [v38 appleIDAccountOnService:v39];

                          unsigned int v41 = [v40 isRegistered];
                          unsigned int v42 = v41;
                          if (((v37 & 1) != 0 || ((v34 | v41) & 1) != 0 || v71 != 1)
                            && (v70 & v69 & 1) == 0
                            && v36 != 38)
                          {
                            unsigned int v52 = +[IMRGLog phoneRepair];
                            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v53 = [v30 smallDescription];
                              *(_DWORD *)buf = 138414082;
                              if (v34) {
                                CFStringRef v54 = @"YES";
                              }
                              else {
                                CFStringRef v54 = @"NO";
                              }
                              uint64_t v81 = v53;
                              v55 = (void *)v53;
                              if (v42) {
                                CFStringRef v56 = @"YES";
                              }
                              else {
                                CFStringRef v56 = @"NO";
                              }
                              __int16 v82 = 2112;
                              if (v71) {
                                CFStringRef v57 = @"YES";
                              }
                              else {
                                CFStringRef v57 = @"NO";
                              }
                              CFStringRef v83 = v54;
                              if (v37) {
                                CFStringRef v58 = @"YES";
                              }
                              else {
                                CFStringRef v58 = @"NO";
                              }
                              __int16 v84 = 2112;
                              if (v70) {
                                CFStringRef v59 = @"YES";
                              }
                              else {
                                CFStringRef v59 = @"NO";
                              }
                              CFStringRef v85 = v56;
                              if (v69) {
                                CFStringRef v60 = @"YES";
                              }
                              else {
                                CFStringRef v60 = @"NO";
                              }
                              __int16 v86 = 2112;
                              CFStringRef v87 = v57;
                              __int16 v88 = 1024;
                              int v89 = v36;
                              __int16 v90 = 2112;
                              CFStringRef v91 = v58;
                              __int16 v92 = 2112;
                              CFStringRef v93 = v59;
                              __int16 v94 = 2112;
                              CFStringRef v95 = v60;
                              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "REPAIR %@ (shouldAutoRegister: %@) (companionAccountRegistered: %@) (isUserDisabled: %@) (registrationError: %d  -  shouldRepairFailedAccount: %@) (registered: %@) (enabled: %@)", buf, 0x4Eu);
                            }
                            self = v67;
                            im_dispatch_after_primary_queue();
                            char v66 = 1;
                          }
                          else
                          {
                            __int16 v43 = +[IMRGLog phoneRepair];
                            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v44 = [v30 smallDescription];
                              int v45 = (void *)v44;
                              *(_DWORD *)buf = 138414082;
                              if (v34) {
                                CFStringRef v46 = @"YES";
                              }
                              else {
                                CFStringRef v46 = @"NO";
                              }
                              uint64_t v81 = v44;
                              if (v42) {
                                CFStringRef v47 = @"YES";
                              }
                              else {
                                CFStringRef v47 = @"NO";
                              }
                              __int16 v82 = 2112;
                              if (v71) {
                                CFStringRef v48 = @"YES";
                              }
                              else {
                                CFStringRef v48 = @"NO";
                              }
                              CFStringRef v83 = v46;
                              if (v37) {
                                CFStringRef v49 = @"YES";
                              }
                              else {
                                CFStringRef v49 = @"NO";
                              }
                              __int16 v84 = 2112;
                              if (v70) {
                                CFStringRef v50 = @"YES";
                              }
                              else {
                                CFStringRef v50 = @"NO";
                              }
                              CFStringRef v85 = v47;
                              if (v69) {
                                CFStringRef v51 = @"YES";
                              }
                              else {
                                CFStringRef v51 = @"NO";
                              }
                              __int16 v86 = 2112;
                              CFStringRef v87 = v48;
                              __int16 v88 = 1024;
                              int v89 = v36;
                              __int16 v90 = 2112;
                              CFStringRef v91 = v49;
                              __int16 v92 = 2112;
                              CFStringRef v93 = v50;
                              __int16 v94 = 2112;
                              CFStringRef v95 = v51;
                              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "GOOD   %@ (shouldAutoRegister: %@) (companionAccountRegistered: %@) (isUserDisabled: %@) (registrationError: %d  -  shouldRepairFailedAccount: %@) (registered: %@) (enabled: %@)", buf, 0x4Eu);
                            }
                            self = v67;
                          }

                          id v25 = v68;
                        }
                      }
                      id v27 = [v25 countByEnumeratingWithState:&v72 objects:v96 count:16];
                    }
                    while (v27);
                  }

                  uint64_t v10 = v62;
                  CFStringRef v7 = v63;
                  id v9 = v64;
                  double v11 = v65;
                }
              }
            }
          }
        }
        double v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v76 objects:v97 count:16];
    }
    while (v9);
  }
  else
  {
    char v66 = 0;
  }

  return v66 & 1;
}

- (BOOL)shouldSupressRepairLogic
{
  return self->_shouldSupressRepairLogic;
}

- (void)setShouldSupressRepairLogic:(BOOL)a3
{
  self->_shouldSupressRepairLogic = a3;
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (IMDispatchTimer)repairTimer
{
  return self->_repairTimer;
}

- (void)setRepairTimer:(id)a3
{
}

- (IMDispatchTimer)phoneRepairTimer
{
  return self->_phoneRepairTimer;
}

- (void)setPhoneRepairTimer:(id)a3
{
}

- (double)lastBagRepairInterval
{
  return self->_lastBagRepairInterval;
}

- (void)setLastBagRepairInterval:(double)a3
{
  self->_lastBagRepairInterval = a3;
}

- (BOOL)waitingForMigration
{
  return self->_waitingForMigration;
}

- (void)setWaitingForMigration:(BOOL)a3
{
  self->_BOOL waitingForMigration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneRepairTimer, 0);
  objc_storeStrong((id *)&self->_repairTimer, 0);
  objc_storeStrong((id *)&self->_keyTransparencyVerifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_systemAccountAdapter, 0);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end