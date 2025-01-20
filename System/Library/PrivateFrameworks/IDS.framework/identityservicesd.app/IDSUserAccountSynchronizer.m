@interface IDSUserAccountSynchronizer
- (BOOL)_allowHomeNumberForUser:(id)a3 simCarrierIdentifiers:(id)a4 userCarrierIdentifiers:(id)a5;
- (BOOL)midSynchronize;
- (CUTPromise)migrationPromise;
- (IDSCTAdapter)ctAdapter;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDataMigrationTracker)migrationTracker;
- (IDSRestrictions)restrictions;
- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 restrictions:(id)a7 queue:(id)a8;
- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 userDefaults:(id)a7 restrictions:(id)a8 ctAdapter:(id)a9 queue:(id)a10 accountBuilder:(id)a11;
- (IDSUserStore)userStore;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)cachedDisabledByService;
- (OS_dispatch_queue)queue;
- (id)_accountsForUser:(id)a3;
- (id)accountBuilder;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)dealloc;
- (void)setAccountBuilder:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setCachedDisabledByService:(id)a3;
- (void)setCtAdapter:(id)a3;
- (void)setMidSynchronize:(BOOL)a3;
- (void)setMigrationPromise:(id)a3;
- (void)setMigrationTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserStore:(id)a3;
- (void)synchronize;
- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4;
- (void)userStore:(id)a3 didUpdateUser:(id)a4;
@end

@implementation IDSUserAccountSynchronizer

- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 restrictions:(id)a7 queue:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[IMUserDefaults sharedDefaults];
  v21 = +[IDSCTAdapter sharedInstance];
  v22 = [(IDSUserAccountSynchronizer *)self initWithUserStore:v19 accountController:v18 serviceController:v17 migrationTracker:v16 userDefaults:v20 restrictions:v15 ctAdapter:v21 queue:v14 accountBuilder:&stru_10098B418];

  return v22;
}

- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 userDefaults:(id)a7 restrictions:(id)a8 ctAdapter:(id)a9 queue:(id)a10 accountBuilder:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)IDSUserAccountSynchronizer;
  id v19 = [(IDSUserAccountSynchronizer *)&v33 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountController, a4);
    objc_storeStrong((id *)&v20->_serviceController, a5);
    id v21 = objc_retainBlock(v18);
    id accountBuilder = v20->_accountBuilder;
    v20->_id accountBuilder = v21;

    objc_storeStrong((id *)&v20->_restrictions, a8);
    objc_storeStrong((id *)&v20->_migrationTracker, a6);
    objc_storeStrong((id *)&v20->_userDefaults, a7);
    objc_storeStrong((id *)&v20->_queue, a10);
    objc_storeStrong((id *)&v20->_userStore, a3);
    objc_storeStrong((id *)&v20->_ctAdapter, a9);
    -[IDSUserStore addActionListener:](v20->_userStore, "addActionListener:", v20, v25, v26, v27, v28, v29, v30, v31, v32);
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v20 selector:"_restrictionsChangedNotification:" name:@"__kIDSRestrictionsChangedNotification" object:0];
  }
  return v20;
}

- (void)dealloc
{
  [(IDSUserStore *)self->_userStore removeActionListener:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSUserAccountSynchronizer;
  [(IDSUserAccountSynchronizer *)&v3 dealloc];
}

- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4
{
  id v5 = a4;
  v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did remove auth cert -- reidentifying {user: %@}", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = -[IDSUserAccountSynchronizer _accountsForUser:](self, "_accountsForUser:", v5, 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) _reregisterAndReidentify:1];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)userStore:(id)a3 didUpdateUser:(id)a4
{
  id v5 = a4;
  if ([v5 realm] == (id)2)
  {
    id v6 = v5;
    if ([v6 hasBeenProvisioned])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v7 = [(IDSUserAccountSynchronizer *)self _accountsForUser:v6];
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
            long long v13 = [v6 expirationDate];
            [v12 setExpirationDate:v13];

            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
    if ([(IDSUserAccountSynchronizer *)self midSynchronize])
    {
      long long v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Mid synchronize -- ignoring", v15, 2u);
      }
    }
    else
    {
      [(IDSUserAccountSynchronizer *)self synchronize];
    }
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D3FB4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_accountsForUser:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueIdentifier];
  if ([v4 realm] && objc_msgSend(v4, "realm") != (id)2)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    id v6 = [(IDSDAccountController *)self->_accountController accountsWithType:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003D40C4;
    v9[3] = &unk_100983F58;
    id v10 = v5;
    v7 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v9);
  }

  return v7;
}

- (NSMutableDictionary)cachedDisabledByService
{
  objc_super v3 = [(IDSUserAccountSynchronizer *)self userDefaults];
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.serviceDisablement"];

  if (v4)
  {
    id v5 = [(IDSUserAccountSynchronizer *)self userDefaults];
    id v6 = [v5 copyMultipleForCurrentKeys:v4 appID:@"com.apple.identityservices.serviceDisablement"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return (NSMutableDictionary *)v8;
}

- (void)setCachedDisabledByService:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSUserAccountSynchronizer *)self userDefaults];
  [v5 setMultiple:v4 remove:0 appID:@"com.apple.identityservices.serviceDisablement"];

  id v6 = [(IDSUserAccountSynchronizer *)self userDefaults];
  [v6 synchronizeAppID:@"com.apple.identityservices.serviceDisablement"];
}

- (void)synchronize
{
  if ([(IDSDAccountController *)self->_accountController isLoading])
  {
    objc_super v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marshaller is waiting on accounts to load, the account controller isn't ready yet", buf, 2u);
    }
LABEL_4:

    return;
  }
  id v4 = +[IDSRegistrationReasonTracker sharedInstance];
  [v4 setMostRecentIDSRegistrationReason:1];

  id v5 = +[IDSRegistrationReasonTracker sharedInstance];
  id v6 = +[IDSRequestReasonContainer initialRequestWithSubreason:1 pathID:1];
  [v5 setRegistrationRequestReason:v6];

  if ([(IDSDataMigrationTracker *)self->_migrationTracker hasPerformedMigration])
  {
    v176 = self;
    v7 = +[FTDeviceSupport sharedInstance];
    unsigned int v8 = [v7 registrationSupported];

    if (v8)
    {
      [(IDSUserAccountSynchronizer *)self setMidSynchronize:1];
      unsigned int v175 = [(IDSDAccountController *)self->_accountController isiCloudSignedIn];
      if (v175) {
        unsigned int v184 = [(IDSDAccountController *)self->_accountController isiCloudHSA2];
      }
      else {
        unsigned int v184 = 0;
      }
      long long v19 = [(IDSUserStore *)self->_userStore usersWithRealms:&off_1009D2D70];
      id v20 = objc_alloc_init((Class)NSMutableArray);
      id v21 = objc_alloc_init((Class)NSMutableArray);
      v234[0] = _NSConcreteStackBlock;
      v234[1] = 3221225472;
      v234[2] = sub_1003D5D8C;
      v234[3] = &unk_10098B440;
      id v22 = v20;
      id v235 = v22;
      id v165 = v21;
      id v236 = v165;
      v173 = v19;
      v168 = [(__CFString *)v19 __imArrayByApplyingBlock:v234];
      v23 = [(IDSUserAccountSynchronizer *)self ctAdapter];
      id v233 = 0;
      v24 = [v23 currentSIMsWithError:&v233];
      id v163 = v233;
      id v25 = objc_msgSend(v24, "__imArrayByApplyingBlock:", &stru_10098B480);
      id v26 = +[NSSet setWithArray:v25];

      v164 = v22;
      id v27 = objc_msgSend(v22, "__imArrayByApplyingBlock:", &stru_10098B4C0);
      v182 = +[NSSet setWithArray:v27];

      id v183 = objc_alloc_init((Class)NSMutableDictionary);
      id v170 = objc_alloc_init((Class)NSMutableDictionary);
      id v28 = +[IMRGLog registration];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v243 = v173;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Synchronizing users to accounts {users: %@}", buf, 0xCu);
      }

      p_isa = (id *)&v176->super.isa;
      id v30 = [(IDSDAccountController *)v176->_accountController accountsWithType:0];
      id v31 = [v30 copy];

      long long v231 = 0u;
      long long v232 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      id obj = v31;
      id v32 = v173;
      v177 = v26;
      id v188 = [obj countByEnumeratingWithState:&v229 objects:v248 count:16];
      if (v188)
      {
        uint64_t v186 = *(void *)v230;
        if (v184) {
          CFStringRef v33 = @"YES";
        }
        else {
          CFStringRef v33 = @"NO";
        }
        CFStringRef v171 = v33;
        do
        {
          id v34 = 0;
          do
          {
            if (*(void *)v230 != v186) {
              objc_enumerationMutation(obj);
            }
            v192 = (char *)v34;
            v35 = *(__CFString **)(*((void *)&v229 + 1) + 8 * (void)v34);
            uint64_t v36 = [(__CFString *)v35 registration];
            if (([(__CFString *)v35 isAdHocAccount] & 1) != 0
              || (unsigned __int8 v37 = [(__CFString *)v35 isRegistered],
                  v38 = (void *)v36,
                  (v37 & 1) == 0))
            {
              v38 = v35;
            }
            id v190 = (id)v36;
            v198 = [v38 userUniqueIdentifier];

            v39 = [(__CFString *)v35 service];
            v228[0] = _NSConcreteStackBlock;
            v228[1] = 3221225472;
            v228[2] = sub_1003D5F34;
            v228[3] = &unk_100986C10;
            v228[4] = v35;
            v40 = [(__CFString *)v32 __imArrayByFilteringWithBlock:v228];
            uint64_t v41 = [v40 firstObject];

            v194 = (void *)v41;
            if (v41)
            {
              v196 = [p_isa[2] propertiesForUser:v41];
            }
            else
            {
              v196 = 0;
            }
            unsigned int v42 = [(__CFString *)v35 accountType];
            if ([p_isa[7] shouldDisableAccount:v35])
            {
              v43 = v39;
              [p_isa[3] forceRemoveAccount:v35];
              v44 = +[IMRGLog registration];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v243 = v198;
                __int16 v244 = 2112;
                uint64_t v245 = (uint64_t)v35;
                v45 = v44;
                v46 = "Removing account for restricted service {uniqueIdentifier: %@, account: %@}";
                uint32_t v47 = 22;
                goto LABEL_56;
              }
LABEL_57:
              id v26 = v177;
LABEL_58:
              v51 = v192;

              v39 = v43;
              goto LABEL_59;
            }
            if (!v42 && ![v39 wantsPhoneNumberAccount]
              || ((v175 | [v39 iCloudBasedService] ^ 1) & 1) == 0)
            {
              v43 = v39;
              [p_isa[3] forceRemoveAccount:v35];
              v44 = +[IMRGLog registration];
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              *(_DWORD *)buf = 138412290;
              CFStringRef v243 = v35;
              v45 = v44;
              v46 = "Removing unwanted account for service {account: %@}";
              uint32_t v47 = 12;
              goto LABEL_56;
            }
            if ([(__CFString *)v35 isTemporary]
              && ![(__CFString *)v35 accountType]
              && (!v184
               || ([p_isa _allowHomeNumberForUser:v41 simCarrierIdentifiers:v177 userCarrierIdentifiers:v182] & 1) == 0))
            {
              v43 = v39;
              [p_isa[3] forceRemoveAccount:v35];
              v44 = +[IMRGLog registration];
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              unsigned int v88 = [p_isa _allowHomeNumberForUser:v41 simCarrierIdentifiers:v177 userCarrierIdentifiers:v182];
              *(_DWORD *)buf = 138412802;
              CFStringRef v89 = @"NO";
              if (v88) {
                CFStringRef v89 = @"YES";
              }
              CFStringRef v243 = v35;
              id v26 = v177;
              __int16 v244 = 2112;
              uint64_t v245 = (uint64_t)v171;
              __int16 v246 = 2112;
              CFStringRef v247 = v89;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Removing unwanted temporary phone account for service {account: %@, isHSA2: %@, allowHomeNumber: %@}", buf, 0x20u);
              goto LABEL_58;
            }
            if (v41 && v196 && [(__CFString *)v196 disableRegistration])
            {
              v43 = v39;
              v48 = +[NSNumber numberWithBool:[(__CFString *)v35 isUserDisabled]];
              v49 = [(__CFString *)v35 service];
              v50 = [v49 identifier];
              [v183 setObject:v48 forKeyedSubscript:v50];

              [p_isa[3] forceRemoveAccount:v35];
              v44 = +[IMRGLog registration];
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              *(_DWORD *)buf = 138412802;
              CFStringRef v243 = v35;
              __int16 v244 = 2112;
              uint64_t v245 = v41;
              __int16 v246 = 2112;
              CFStringRef v247 = v196;
              v45 = v44;
              v46 = "Removing unwanted account for service, user is disabled {account: %@, matchingUser: %@, userProperties: %@}";
              uint32_t v47 = 32;
LABEL_56:
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v46, buf, v47);
              goto LABEL_57;
            }
            if (v198 || ![v168 count])
            {
              if (objc_msgSend(v168, "containsObject:"))
              {
                v178 = v39;
                long long v226 = 0u;
                long long v227 = 0u;
                long long v224 = 0u;
                long long v225 = 0u;
                v52 = v32;
                id v53 = [(__CFString *)v52 countByEnumeratingWithState:&v224 objects:v241 count:16];
                if (v53)
                {
                  id v54 = v53;
                  char v55 = 0;
                  uint64_t v56 = *(void *)v225;
                  do
                  {
                    for (i = 0; i != v54; i = (char *)i + 1)
                    {
                      if (*(void *)v225 != v56) {
                        objc_enumerationMutation(v52);
                      }
                      v58 = *(void **)(*((void *)&v224 + 1) + 8 * i);
                      if (![v58 realm])
                      {
                        v59 = [v58 uniqueIdentifier];
                        v60 = [(__CFString *)v35 userUniqueIdentifier];
                        unsigned int v61 = [v59 isEqualToString:v60];

                        if (v61)
                        {
                          id v62 = v58;
                          uint64_t v63 = [(__CFString *)v35 loginID];
                          if (v63)
                          {
                            v64 = (void *)v63;
                            v65 = [(__CFString *)v35 loginID];
                            unsigned int v66 = [v62 differsFromPhoneNumber:v65];

                            if (v66)
                            {
                              v67 = +[NSNumber numberWithBool:[(__CFString *)v35 isUserDisabled]];
                              v68 = [(__CFString *)v35 service];
                              v69 = [v68 identifier];
                              [v183 setObject:v67 forKeyedSubscript:v69];

                              v70 = +[IMRGLog registration];
                              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412802;
                                CFStringRef v243 = v198;
                                __int16 v244 = 2112;
                                uint64_t v245 = (uint64_t)v62;
                                __int16 v246 = 2112;
                                CFStringRef v247 = v35;
                                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Detected account has mismatching user. Marking for removal {uniqueIdentifier: %@, user: %@, account: %@}", buf, 0x20u);
                              }

                              char v55 = 1;
                            }
                          }
                        }
                      }
                    }
                    id v54 = [(__CFString *)v52 countByEnumeratingWithState:&v224 objects:v241 count:16];
                  }
                  while (v54);
                }
                else
                {
                  char v55 = 0;
                }

                int v81 = v55 & 1;
                p_isa = (id *)&v176->super.isa;
                v39 = v178;
              }
              else
              {
                v71 = v39;
                if (![(__CFString *)v35 accountType])
                {
                  id v72 = p_isa[3];
                  v73 = [(__CFString *)v35 service];
                  v74 = [v72 appleIDAccountOnService:v73];

                  v75 = [(__CFString *)v35 vettedAliases];
                  v76 = [v75 firstObject];

                  if (v74 && v76) {
                    [v74 markAsWasSelectedAlias:v76];
                  }
                }
                v77 = +[NSNumber numberWithBool:[(__CFString *)v35 isUserDisabled]];
                v78 = [(__CFString *)v35 service];
                v79 = [v78 identifier];
                [v183 setObject:v77 forKeyedSubscript:v79];

                [p_isa[3] forceRemoveAccount:v35];
                v80 = +[IMRGLog registration];
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v243 = v198;
                  __int16 v244 = 2112;
                  uint64_t v245 = (uint64_t)v35;
                  _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Removing account without matching user {uniqueIdentifier: %@, account: %@}", buf, 0x16u);
                }

                int v81 = 0;
                v39 = v71;
              }
            }
            else
            {
              v82 = [(__CFString *)v35 registration];
              unsigned int v83 = [v82 registrationType];

              v84 = v165;
              if (v83 == 2
                || ([(__CFString *)v35 registration],
                    v85 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v86 = [v85 registrationType],
                    v85,
                    v84 = v164,
                    !v86))
              {
                v90 = [v84 firstObject];
                uint64_t v91 = [v90 uniqueIdentifier];

                v87 = (__CFString *)v91;
              }
              else
              {
                v87 = 0;
              }
              v198 = v87;
              -[__CFString setUserUniqueIdentifier:](v35, "setUserUniqueIdentifier:");
              v92 = +[IMRGLog registration];
              p_isa = (id *)&v176->super.isa;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v243 = v198;
                __int16 v244 = 2112;
                uint64_t v245 = (uint64_t)v35;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Migrating account to use users {uniqueIdentifier: %@, account: %@}", buf, 0x16u);
              }

              int v81 = 0;
            }
            if (v198)
            {
              v93 = [(__CFString *)v35 service];
              v94 = [v93 identifier];

              if (v94)
              {
                v43 = v39;
                v95 = [(__CFString *)v35 service];
                v96 = [v95 identifier];
                v97 = [v170 objectForKeyedSubscript:v96];
                v98 = v97;
                if (v97)
                {
                  v44 = v97;
                }
                else
                {
                  v44 = +[NSSet set];
                }
                if (([v44 containsObject:v198] | v81))
                {
                  v99 = +[IMRGLog registration];
                  id v32 = v173;
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    CFStringRef v243 = v198;
                    __int16 v244 = 2112;
                    uint64_t v245 = (uint64_t)v35;
                    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Removing extra account for user without matching user {uniqueIdentifier: %@, account: %@}", buf, 0x16u);
                  }

                  [p_isa[3] forceRemoveAccount:v35];
                }
                else
                {
                  v100 = [v44 setByAddingObject:v198];
                  v101 = [(__CFString *)v35 service];
                  v102 = [v101 identifier];
                  [v170 setObject:v100 forKeyedSubscript:v102];

                  id v32 = v173;
                }
                goto LABEL_57;
              }
            }
            else
            {
              v198 = 0;
            }
            id v32 = v173;
            id v26 = v177;
            v51 = v192;
LABEL_59:

            id v34 = v51 + 1;
          }
          while (v34 != v188);
          id v103 = [obj countByEnumeratingWithState:&v229 objects:v248 count:16];
          id v188 = v103;
        }
        while (v103);
      }

      v104 = +[NSString stringGUID];
      v105 = [v170 description];
      v106 = [v183 description];
      v107 = +[IMRGLog registration];
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v243 = v104;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Logging current and disabled account info with guid %@", buf, 0xCu);
      }

      v218 = _NSConcreteStackBlock;
      uint64_t v219 = 3221225472;
      v220 = sub_1003D5F98;
      v221 = &unk_10097E440;
      v222 = v104;
      id v162 = v105;
      id v223 = v162;
      cut_dispatch_log_queue();
      v212 = _NSConcreteStackBlock;
      uint64_t v213 = 3221225472;
      v214 = sub_1003D6054;
      v215 = &unk_10097E440;
      v161 = v222;
      v216 = v161;
      id v160 = v106;
      id v217 = v160;
      cut_dispatch_log_queue();
      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      v108 = v176;
      v109 = [(IDSDServiceController *)v176->_serviceController allPrimaryServices];
      id v110 = [v109 countByEnumeratingWithState:&v208 objects:v240 count:16];
      if (v110)
      {
        id v111 = v110;
        uint64_t v112 = *(void *)v209;
        if (v184) {
          CFStringRef v113 = @"YES";
        }
        else {
          CFStringRef v113 = @"NO";
        }
        CFStringRef v179 = v113;
        p_info = IDSDAccount.info;
        uint64_t v166 = *(void *)v209;
        v167 = v109;
        do
        {
          v115 = 0;
          id v169 = v111;
          do
          {
            if (*(void *)v209 != v112) {
              objc_enumerationMutation(v109);
            }
            v116 = *(void **)(*((void *)&v208 + 1) + 8 * (void)v115);
            if (objc_msgSend(v116, "wantsPhoneNumberAccount", v160, v161, v162)
              && ![(IDSRestrictions *)v108->_restrictions shouldDisableService:v116]
              && (v175 | [v116 iCloudBasedService] ^ 1) == 1)
            {
              v172 = v115;
              v117 = [v116 identifier];
              uint64_t v118 = [v170 objectForKeyedSubscript:v117];

              v119 = (void *)v118;
              long long v206 = 0u;
              long long v207 = 0u;
              long long v204 = 0u;
              long long v205 = 0u;
              v191 = v173;
              id v195 = [(__CFString *)v191 countByEnumeratingWithState:&v204 objects:v239 count:16];
              if (!v195) {
                goto LABEL_188;
              }
              uint64_t v193 = *(void *)v205;
              v181 = v116;
              v189 = (void *)v118;
              while (1)
              {
                uint64_t v120 = 0;
                do
                {
                  if (*(void *)v205 != v193) {
                    objc_enumerationMutation(v191);
                  }
                  uint64_t v197 = v120;
                  v121 = *(void **)(*((void *)&v204 + 1) + 8 * v120);
                  v199 = [v121 uniqueIdentifier];
                  if ((objc_msgSend(v119, "containsObject:") & 1) == 0
                    && ([v121 realm] && objc_msgSend(v121, "realm") != (id)2
                     || [v116 wantsPhoneNumberAccount]))
                  {
                    if (![v116 disabledOnTinkerWatch]
                      || ([p_info + 56 sharedInstance],
                          v122 = objc_claimAutoreleasedReturnValue(),
                          unsigned __int8 v123 = [v122 isCurrentDeviceTinkerConfiguredWatch],
                          v122,
                          v119 = v189,
                          (v123 & 1) == 0))
                    {
                      if ([v121 realm] == (id)2
                        && (!v184
                         || ![(IDSUserAccountSynchronizer *)v108 _allowHomeNumberForUser:v121 simCarrierIdentifiers:v26 userCarrierIdentifiers:v182]))
                      {
                        v124 = +[IMRGLog registration];
                        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v131 = [(IDSUserAccountSynchronizer *)v108 _allowHomeNumberForUser:v121 simCarrierIdentifiers:v26 userCarrierIdentifiers:v182];
                          *(_DWORD *)buf = 138412546;
                          CFStringRef v132 = @"YES";
                          if (!v131) {
                            CFStringRef v132 = @"NO";
                          }
                          CFStringRef v243 = v179;
                          __int16 v244 = 2112;
                          uint64_t v245 = (uint64_t)v132;
                          _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "Not creating account for temporary user {isHSA2: %@, allowHomeNumber: %@}", buf, 0x16u);
                        }
                        goto LABEL_185;
                      }
                      v124 = [(IDSUserStore *)v108->_userStore propertiesForUser:v121];
                      if ([v124 disableRegistration])
                      {
LABEL_185:

                        goto LABEL_186;
                      }
                      v125 = +[IMRGLog registration];
                      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        CFStringRef v243 = v199;
                        __int16 v244 = 2112;
                        uint64_t v245 = (uint64_t)v116;
                        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Creating missing accounts for user {uniqueIdentifier: %@, service: %@}", buf, 0x16u);
                      }

                      v126 = [v116 identifier];
                      v127 = [v183 objectForKeyedSubscript:v126];

                      v185 = v127;
                      v187 = v124;
                      if (v127)
                      {
                        id v128 = [v127 BOOLValue];
                        LOBYTE(v129) = (_BYTE)v128;
                        id v130 = v128;
LABEL_176:
                        v148 = (*((void (**)(void))v108->_accountBuilder + 2))();
                        [v148 setUserUniqueIdentifier:v199];
                        if ([v121 realm] == (id)2)
                        {
                          [v148 setIsTemporary:1];
                          v149 = [v121 unprefixedIdentifier];
                          [v148 setLoginID:v149];

                          if ([v121 hasBeenProvisioned])
                          {
                            v150 = [v121 expirationDate];
                            [v148 setExpirationDate:v150];
                          }
                        }
                        [(IDSDAccountController *)v108->_accountController addAccount:v148];
                        if (v129)
                        {
                          v151 = +[IMRGLog registration];
                          if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            CFStringRef v243 = v199;
                            __int16 v244 = 2112;
                            uint64_t v245 = (uint64_t)v148;
                            _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "Disabling account {uniqueIdentifier: %@, account: %@}", buf, 0x16u);
                          }

                          accountController = v108->_accountController;
                          v153 = [v148 uniqueID];
                          [(IDSDAccountController *)accountController disableAccountWithUniqueID:v153];

                          [v148 setIsUserDisabled:v130];
                        }
                        else
                        {
                          v154 = v108->_accountController;
                          v155 = [v148 uniqueID];
                          [(IDSDAccountController *)v154 enableAccountWithUniqueID:v155];

                          [v148 registerAccount];
                        }
                        p_info = (__objc2_class_ro **)(IDSDAccount + 32);

                        v116 = v181;
                        v124 = v187;
                        v119 = v189;
                        goto LABEL_185;
                      }
                      v133 = [(IDSDAccountController *)v108->_accountController accountsOnService:v116];
                      v180 = v133;
                      if ([v133 count])
                      {
                        long long v202 = 0u;
                        long long v203 = 0u;
                        long long v200 = 0u;
                        long long v201 = 0u;
                        id v134 = v133;
                        id v135 = [v134 countByEnumeratingWithState:&v200 objects:v238 count:16];
                        if (v135)
                        {
                          id v136 = v135;
                          char v137 = 0;
                          unsigned __int8 v138 = 0;
                          unsigned __int8 v139 = 0;
                          char v140 = 0;
                          uint64_t v141 = *(void *)v201;
                          do
                          {
                            for (j = 0; j != v136; j = (char *)j + 1)
                            {
                              if (*(void *)v201 != v141) {
                                objc_enumerationMutation(v134);
                              }
                              v143 = *(void **)(*((void *)&v200 + 1) + 8 * (void)j);
                              if ([v121 realm] && objc_msgSend(v121, "realm") != (id)2
                                || [v143 accountType])
                              {
                                if (v139) {
                                  unsigned __int8 v139 = 1;
                                }
                                else {
                                  unsigned __int8 v139 = [v143 isUserDisabled];
                                }
                              }
                              else
                              {
                                unsigned __int8 v138 = [v143 isUserDisabled];
                                v137 |= v138;
                                char v140 = 1;
                              }
                            }
                            id v136 = [v134 countByEnumeratingWithState:&v200 objects:v238 count:16];
                          }
                          while (v136);

                          if (v137)
                          {
                            LOBYTE(v129) = 1;
                            v108 = v176;
                            goto LABEL_174;
                          }
                          v108 = v176;
                        }
                        else
                        {

                          char v140 = 0;
                          unsigned __int8 v139 = 0;
                          unsigned __int8 v138 = 0;
                        }
                        LOBYTE(v129) = (v140 ^ 1) & v139;
LABEL_174:
                        id v130 = (id)(v138 & 1);
                        id v26 = v177;
                      }
                      else
                      {
                        v144 = [(IDSUserAccountSynchronizer *)v108 cachedDisabledByService];
                        v145 = [v116 identifier];
                        v146 = [v144 objectForKeyedSubscript:v145];
                        id v129 = [v146 BOOLValue];

                        v147 = [v181 identifier];
                        [v183 setObject:&__kCFBooleanFalse forKeyedSubscript:v147];

                        id v130 = v129;
                      }

                      goto LABEL_176;
                    }
                  }
LABEL_186:

                  uint64_t v120 = v197 + 1;
                }
                while ((id)(v197 + 1) != v195);
                id v195 = [(__CFString *)v191 countByEnumeratingWithState:&v204 objects:v239 count:16];
                if (!v195)
                {
LABEL_188:

                  uint64_t v112 = v166;
                  v109 = v167;
                  id v111 = v169;
                  v115 = v172;
                  break;
                }
              }
            }
            v115 = (char *)v115 + 1;
          }
          while (v115 != v111);
          id v111 = [v109 countByEnumeratingWithState:&v208 objects:v240 count:16];
        }
        while (v111);
      }

      v156 = [(IDSUserAccountSynchronizer *)v108 cachedDisabledByService];
      id v157 = [v156 mutableCopy];
      v158 = v157;
      if (v157)
      {
        id v159 = v157;
      }
      else
      {
        id v159 = +[NSMutableDictionary dictionary];
      }
      [v159 addEntriesFromDictionary:v183];
      [(IDSUserAccountSynchronizer *)v176 setCachedDisabledByService:v159];
      [(IDSUserAccountSynchronizer *)v176 setMidSynchronize:0];
    }
    else
    {
      long long v14 = +[FTDeviceSupport sharedInstance];
      id v15 = [v14 deviceType];

      if (v15 == (id)2)
      {
        objc_super v3 = +[IMRGLog warning];
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = +[FTDeviceSupport sharedInstance];
          if ([v16 registrationSupported]) {
            CFStringRef v17 = @"YES";
          }
          else {
            CFStringRef v17 = @"NO";
          }
          if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
          {
            CFStringRef v18 = @"YES";
          }
          else
          {
            CFStringRef v18 = @"NO";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v243 = v17;
          __int16 v244 = 2112;
          uint64_t v245 = (uint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Can't setup phone number accounts { registrationSupported: %@, supportsSMSIdentification: %@ }", buf, 0x16u);
        }
        goto LABEL_4;
      }
    }
  }
  else
  {
    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Waiting on migration -- deferring synchronize", buf, 2u);
    }

    if (!self->_migrationPromise)
    {
      id v10 = +[IMRGLog registration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing migration if needed", buf, 2u);
      }

      v11 = [(IDSDataMigrationTracker *)self->_migrationTracker performMigrationIfNeeded];
      migrationPromise = self->_migrationPromise;
      self->_migrationPromise = v11;

      long long v13 = self->_migrationPromise;
      v237[0] = _NSConcreteStackBlock;
      v237[1] = 3221225472;
      v237[2] = sub_1003D5C8C;
      v237[3] = &unk_10097FCA8;
      v237[4] = self;
      [(CUTPromise *)v13 registerResultBlock:v237];
    }
  }
}

- (BOOL)_allowHomeNumberForUser:(id)a3 simCarrierIdentifiers:(id)a4 userCarrierIdentifiers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 realm] == (id)2)
  {
    id v10 = v7;
    id v11 = objc_alloc((Class)IMPair);
    long long v12 = [v10 countryCode];
    long long v13 = [v10 networkCode];
    id v14 = [v11 initWithFirst:v12 second:v13];

    if (+[IMUserDefaults bypassHomeNumberCarrierCheck]) {
      goto LABEL_3;
    }
    long long v16 = [v10 countryCode];
    if ([v16 length])
    {
    }
    else
    {
      CFStringRef v17 = [v10 networkCode];
      id v18 = [v17 length];

      if (!v18)
      {
LABEL_3:
        if ([v8 count]) {
          char v15 = 1;
        }
        else {
          char v15 = [v9 count] != 0;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    if ([v8 count])
    {
      if ((unint64_t)[v8 count] <= 1) {
        unsigned int v19 = [v8 containsObject:v14] ^ 1;
      }
      else {
        LOBYTE(v19) = 1;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
    if ([v9 count])
    {
      if ((unint64_t)[v9 count] <= 1) {
        unsigned int v20 = [v9 containsObject:v14] ^ 1;
      }
      else {
        LOBYTE(v20) = 1;
      }
    }
    else
    {
      LOBYTE(v20) = 0;
    }
    char v15 = v19 | v20;
    goto LABEL_21;
  }
  char v15 = 0;
LABEL_22:

  return v15;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
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

- (IDSDataMigrationTracker)migrationTracker
{
  return self->_migrationTracker;
}

- (void)setMigrationTracker:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (IDSCTAdapter)ctAdapter
{
  return self->_ctAdapter;
}

- (void)setCtAdapter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)accountBuilder
{
  return self->_accountBuilder;
}

- (void)setAccountBuilder:(id)a3
{
}

- (CUTPromise)migrationPromise
{
  return self->_migrationPromise;
}

- (void)setMigrationPromise:(id)a3
{
}

- (BOOL)midSynchronize
{
  return self->_midSynchronize;
}

- (void)setMidSynchronize:(BOOL)a3
{
  self->_midSynchronize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationPromise, 0);
  objc_storeStrong(&self->_accountBuilder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ctAdapter, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_migrationTracker, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);

  objc_storeStrong((id *)&self->_userStore, 0);
}

@end