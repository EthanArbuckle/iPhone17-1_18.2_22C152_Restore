@interface IDSDSignInResponder
- (BOOL)_gameCenterShouldSigninOnModify;
- (BOOL)_shouldServiceBeDisabledOnSignOut:(id)a3 forDomain:(int64_t)a4;
- (BOOL)_shouldServiceBeEnabledOnSignIn:(id)a3 forDomain:(int64_t)a4;
- (FTPasswordManager)passwordManager;
- (IDSDAccountController)accountController;
- (IDSDRegistrationControl)registrationControl;
- (IDSDServiceController)serviceController;
- (IDSDSignInResponder)initWithAccountController:(id)a3 serviceController:(id)a4 passwordManager:(id)a5 registrationConductor:(id)a6 deviceSupport:(id)a7 registrationControl:(id)a8 registrationController:(id)a9 userStore:(id)a10;
- (IDSDSignInResponder)initWithUserStore:(id)a3;
- (IDSDSignInResponderDeviceSupport)deviceSupport;
- (IDSRegistrationConductor)registrationConductor;
- (IDSRegistrationController)registrationController;
- (IDSServerBag)serverBag;
- (IDSUserStore)userStore;
- (id)accountStore;
- (void)_modifyDomainWithUsername:(id)a3;
- (void)_modifyGameCenterAccountPropertiesForUsername:(id)a3;
- (void)_reregisterAndReProvisionForEDULoginWithUsername:(id)a3;
- (void)_signInDomain:(int64_t)a3 withUsername:(id)a4 authToken:(id)a5 password:(id)a6 accountInfo:(id)a7 accountStatus:(id)a8 handles:(id)a9;
- (void)_signOutDomain:(int64_t)a3;
- (void)_updateDomainWithUsername:(id)a3 accountInfo:(id)a4;
- (void)gameCenterModifyForUserName:(id)a3;
- (void)gameCenterSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)gameCenterSignOut;
- (void)iCloudModifyForUsername:(id)a3;
- (void)iCloudSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)iCloudSignOut;
- (void)iCloudUpdateForUsername:(id)a3 accountInfo:(id)a4;
- (void)iTunesSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8;
- (void)iTunesSignOut;
- (void)setServerBag:(id)a3;
- (void)updateUserWithOldUsername:(id)a3 newUsername:(id)a4;
@end

@implementation IDSDSignInResponder

- (IDSDSignInResponder)initWithUserStore:(id)a3
{
  id v4 = a3;
  v5 = +[IDSDaemon sharedInstance];
  v6 = [v5 registrationConductor];

  v7 = +[IDSDAccountController sharedInstance];
  v8 = +[IDSDServiceController sharedInstance];
  v9 = +[FTPasswordManager sharedInstance];
  v10 = +[FTDeviceSupport sharedInstance];
  v11 = +[IDSDRegistrationControl sharedInstance];
  v12 = +[IDSRegistrationController sharedInstance];
  v13 = [(IDSDSignInResponder *)self initWithAccountController:v7 serviceController:v8 passwordManager:v9 registrationConductor:v6 deviceSupport:v10 registrationControl:v11 registrationController:v12 userStore:v4];

  return v13;
}

- (IDSDSignInResponder)initWithAccountController:(id)a3 serviceController:(id)a4 passwordManager:(id)a5 registrationConductor:(id)a6 deviceSupport:(id)a7 registrationControl:(id)a8 registrationController:(id)a9 userStore:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)IDSDSignInResponder;
  v18 = [(IDSDSignInResponder *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountController, a3);
    objc_storeStrong((id *)&v19->_serviceController, a4);
    objc_storeStrong((id *)&v19->_passwordManager, a5);
    objc_storeStrong((id *)&v19->_registrationConductor, a6);
    objc_storeStrong((id *)&v19->_deviceSupport, a7);
    objc_storeStrong((id *)&v19->_registrationControl, a8);
    objc_storeStrong((id *)&v19->_registrationController, a9);
    objc_storeStrong((id *)&v19->_userStore, a10);
    uint64_t v20 = +[IDSServerBag sharedInstance];
    serverBag = v19->_serverBag;
    v19->_serverBag = (IDSServerBag *)v20;
  }
  return v19;
}

- (id)accountStore
{
  id v2 = objc_alloc_init((Class)IMWeakLinkClass());

  return v2;
}

- (BOOL)_gameCenterShouldSigninOnModify
{
  id v2 = [(IDSDSignInResponder *)self serverBag];
  v3 = [v2 objectForKey:@"gamecenter-signin-on-modify"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)_shouldServiceBeEnabledOnSignIn:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  if ([v6 adHocServiceType]) {
    goto LABEL_2;
  }
  switch(a4)
  {
    case 3:
      v8 = [(IDSDSignInResponder *)self serviceController];
      id v9 = [v8 gameCenterService];
LABEL_9:
      unsigned __int8 v7 = v9 == v6;

      goto LABEL_10;
    case 2:
      v8 = [(IDSDSignInResponder *)self serviceController];
      id v9 = [v8 iTunesService];
      goto LABEL_9;
    case 1:
      unsigned __int8 v7 = [v6 iCloudBasedService];
      goto LABEL_10;
  }
LABEL_2:
  unsigned __int8 v7 = 0;
LABEL_10:

  return v7;
}

- (BOOL)_shouldServiceBeDisabledOnSignOut:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  if ([v6 adHocServiceType]) {
    goto LABEL_2;
  }
  switch(a4)
  {
    case 3:
      v8 = [(IDSDSignInResponder *)self serviceController];
      id v9 = [v8 gameCenterService];
LABEL_9:
      unsigned __int8 v7 = v9 == v6;

      goto LABEL_10;
    case 2:
      v8 = [(IDSDSignInResponder *)self serviceController];
      id v9 = [v8 iTunesService];
      goto LABEL_9;
    case 1:
      unsigned __int8 v7 = [v6 iCloudBasedService];
      goto LABEL_10;
  }
LABEL_2:
  unsigned __int8 v7 = 0;
LABEL_10:

  return v7;
}

- (void)iCloudSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)iCloudUpdateForUsername:(id)a3 accountInfo:(id)a4
{
}

- (void)iCloudModifyForUsername:(id)a3
{
}

- (void)iCloudSignOut
{
}

- (void)iTunesSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)iTunesSignOut
{
}

- (void)gameCenterSignInWithUsername:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8
{
}

- (void)gameCenterSignOut
{
}

- (void)gameCenterModifyForUserName:(id)a3
{
}

- (void)updateUserWithOldUsername:(id)a3 newUsername:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IDSDSignInResponder *)self passwordManager];
  [v8 updatePreviousUsername:v6 toNewUsername:v7];

  id v9 = self;
  v10 = [(IDSDSignInResponder *)self serviceController];
  v11 = [v10 allServices];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v27;
    *(void *)&long long v13 = 138413058;
    long long v24 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = +[IMRGLog iCloud];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [v17 identifier];
          *(_DWORD *)buf = 138412802;
          id v31 = v6;
          __int16 v32 = 2112;
          id v33 = v7;
          __int16 v34 = 2112;
          v35 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Checking if loginID update is needed for existing account on service { oldUsername: %@, newUsername: %@, serviceIdentifier: %@ }", buf, 0x20u);
        }
        uint64_t v20 = [(IDSDSignInResponder *)v9 accountController];
        v21 = [v20 existingAccountOnService:v17 withType:1 loginID:v6];

        if (v21)
        {
          v22 = +[IMRGLog iCloud];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v17 identifier];
            *(_DWORD *)buf = v24;
            id v31 = v6;
            __int16 v32 = 2112;
            id v33 = v7;
            __int16 v34 = 2112;
            v35 = v23;
            __int16 v36 = 2112;
            v37 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updating loginID on existing account { oldUsername: %@, newUsername: %@, serviceIdentifier: %@, account: %@ }", buf, 0x2Au);
          }
          [v21 setLoginID:v7];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v14);
  }
}

- (void)_signInDomain:(int64_t)a3 withUsername:(id)a4 authToken:(id)a5 password:(id)a6 accountInfo:(id)a7 accountStatus:(id)a8 handles:(id)a9
{
  id v107 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (__CFString *)a8;
  id v18 = a9;
  v19 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      CFStringRef v20 = @"Invalid";
    }
    else {
      CFStringRef v20 = *(&off_1009865D8 + a3);
    }
    id v21 = [v15 length];
    *(_DWORD *)buf = 138413570;
    CFStringRef v22 = @"YES";
    CFStringRef v127 = v20;
    __int16 v128 = 2112;
    if (!v21) {
      CFStringRef v22 = @"NO";
    }
    id v129 = v107;
    __int16 v130 = 2112;
    id v131 = v14;
    __int16 v132 = 2112;
    CFStringRef v133 = v22;
    __int16 v134 = 2112;
    v135 = v17;
    __int16 v136 = 2112;
    id v137 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "IDS responding to sign-in { domain: %@, username: %@, token: %@, hasPassword: %@, accountStatus: %@, handles: %@ }", buf, 0x3Eu);
  }

  id v23 = [(IDSDSignInResponder *)self accountController];
  unsigned int v24 = [v23 hasHardDeregistered];

  if (v24)
  {
    id v25 = +[IMRGLog iCloud];
    long long v26 = v107;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v27 = "Device has hard deregistered -- ignoring sign-in";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
      goto LABEL_89;
    }
    goto LABEL_89;
  }
  long long v26 = v107;
  if ([v107 length])
  {
    if (a3 == 1)
    {
      long long v28 = [(IDSDSignInResponder *)self deviceSupport];
      unsigned __int8 v29 = [v28 isGreenTea];

      if ((v29 & 1) == 0)
      {
        objc_super v30 = [(IDSDSignInResponder *)self registrationControl];
        [v30 updateRegistrationType:0 toState:2 error:0];
      }
      id v31 = [(IDSDSignInResponder *)self registrationController];
      [v31 noteiCloudSignInTime];

      long long v26 = v107;
    }
    uint64_t v32 = [v16 objectForKey:kIDSServiceDefaultsSelfHandleKey];
    uint64_t v33 = [v16 objectForKey:kIDSServiceDefaultsAuthorizationIDKey];
    v100 = (void *)v33;
    if ([v14 length])
    {
      __int16 v34 = [(IDSDSignInResponder *)self passwordManager];
      v35 = v26;
      __int16 v36 = v34;
      [v34 setAuthTokenForProfileID:v33 username:v35 service:IDSServiceKey authToken:v14 selfHandle:v32 accountStatus:&off_1009D1968 outRequestID:0 completionBlock:0];
    }
    else if ([v15 length])
    {
      __int16 v36 = [(IDSDSignInResponder *)self passwordManager];
      [v36 setPasswordForProfileID:v33 username:v107 service:IDSServiceKey password:v15 outRequestID:0 completionBlock:0];
    }
    else
    {
      if (!v17 || (id v37 = [(__CFString *)v17 integerValue]) != 0 && v37 != (id)5103 && v37 != (id)5100)
      {
LABEL_31:
        v95 = v17;
        id v97 = v15;
        id v98 = v14;
        v39 = (void *)v33;
        if (v18)
        {
          v40 = [(IDSDSignInResponder *)self passwordManager];
          [v40 setHandlesForProfileID:v33 username:v107 service:IDSServiceKey handles:v18];
        }
        id v94 = v18;
        id v96 = v16;
        id v108 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v16];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        v41 = [(IDSDSignInResponder *)self serviceController];
        v42 = [v41 allServices];

        id obj = v42;
        id v43 = [v42 countByEnumeratingWithState:&v119 objects:v125 count:16];
        long long v26 = v107;
        int64_t v44 = a3;
        if (!v43)
        {
LABEL_84:

          id v14 = v98;
          if (v44 == 1)
          {
            id v93 = [v26 length];
            if (v98)
            {
              if (v93) {
                [(IDSDSignInResponder *)self _reregisterAndReProvisionForEDULoginWithUsername:v26];
              }
            }
          }

          id v16 = v96;
          id v15 = v97;
          id v18 = v94;
          id v17 = v95;
          id v25 = v32;
          goto LABEL_89;
        }
        id v45 = v43;
        uint64_t v46 = *(void *)v120;
        uint64_t v99 = *(void *)v120;
LABEL_35:
        uint64_t v47 = 0;
        id v102 = v45;
        while (1)
        {
          if (*(void *)v120 != v46) {
            objc_enumerationMutation(obj);
          }
          v48 = *(__CFString **)(*((void *)&v119 + 1) + 8 * v47);
          if (![(IDSDSignInResponder *)self _shouldServiceBeEnabledOnSignIn:v48 forDomain:v44])goto LABEL_82; {
          id v49 = objc_alloc_init((Class)NSMutableArray);
          }
          v50 = [(IDSDSignInResponder *)self accountController];
          v51 = [v50 existingAccountOnService:v48 withType:1 loginID:v26];

          if (v51)
          {
            [(IDSDAccount *)v51 _updateAccountWithAccountInfo:v108];
            v52 = +[IMRGLog iCloud];
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = [(IDSDAccount *)v51 smallDescription];
              *(_DWORD *)buf = 138412546;
              CFStringRef v127 = v48;
              __int16 v128 = 2112;
              id v129 = v53;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Updated existing account with account info { service: %@, account: %@ }", buf, 0x16u);
            }
          }
          else
          {
            v54 = [IDSDAccount alloc];
            v55 = +[NSString stringGUID];
            v51 = [(IDSDAccount *)v54 initWithLoginID:v26 service:v48 uniqueID:v55 accountType:1 accountConfig:v108];

            v56 = +[IMRGLog iCloud];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v57 = [(IDSDAccount *)v51 smallDescription];
              *(_DWORD *)buf = 138412546;
              CFStringRef v127 = v48;
              __int16 v128 = 2112;
              id v129 = v57;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Created new account for sign-in { service: %@, account: %@ }", buf, 0x16u);
            }
            v52 = [(IDSDSignInResponder *)self accountController];
            [v52 addAccount:v51];
          }

          v58 = [(IDSDSignInResponder *)self deviceSupport];
          if (![v58 registrationSupported]) {
            goto LABEL_52;
          }
          v59 = [(IDSDSignInResponder *)self registrationController];
          if (([v59 systemSupportsPhoneNumberRegistration] & 1) == 0) {
            break;
          }
          unsigned int v60 = [(__CFString *)v48 wantsPhoneNumberAccount];

          if (v60)
          {
            v61 = +[IMRGLog iCloud];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Triggering DS realm reload", buf, 2u);
            }

            v58 = [(IDSDSignInResponder *)self userStore];
            [v58 reloadUsersForRealm:1];
            goto LABEL_52;
          }
LABEL_53:
          uint64_t v106 = v47;
          v104 = v49;
          [v49 addObject:v51];
          v62 = +[IDSDServiceController sharedInstance];
          v105 = v51;
          v63 = [(IDSDAccount *)v51 service];
          v64 = [v62 linkedServicesForService:v63];

          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v65 = v64;
          id v66 = [v65 countByEnumeratingWithState:&v115 objects:v124 count:16];
          if (v66)
          {
            id v67 = v66;
            uint64_t v68 = *(void *)v116;
            do
            {
              for (i = 0; i != v67; i = (char *)i + 1)
              {
                if (*(void *)v116 != v68) {
                  objc_enumerationMutation(v65);
                }
                v70 = *(__CFString **)(*((void *)&v115 + 1) + 8 * i);
                if ([(__CFString *)v70 disabledOnTinkerWatch])
                {
                  v71 = +[IDSPairingManager sharedInstance];
                  unsigned __int8 v72 = [v71 isCurrentDeviceTinkerConfiguredWatch];

                  if (v72) {
                    continue;
                  }
                }
                v73 = [(IDSDSignInResponder *)self accountController];
                v74 = [v73 existingAccountOnService:v70 withType:1 loginID:v26];

                if (v74)
                {
                  [(IDSDAccount *)v74 _updateAccountWithAccountInfo:v108];
                  v75 = +[IMRGLog iCloud];
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    v76 = [(IDSDAccount *)v74 smallDescription];
                    *(_DWORD *)buf = 138412546;
                    CFStringRef v127 = v70;
                    __int16 v128 = 2112;
                    id v129 = v76;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Updated existing linked account with account info { service: %@, account: %@ }", buf, 0x16u);

                    long long v26 = v107;
                  }
                }
                else
                {
                  v77 = [IDSDAccount alloc];
                  v78 = +[NSString stringGUID];
                  v74 = [(IDSDAccount *)v77 initWithLoginID:v26 service:v70 uniqueID:v78 accountType:1 accountConfig:v108];

                  v79 = +[IMRGLog iCloud];
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                  {
                    v80 = [(IDSDAccount *)v74 smallDescription];
                    *(_DWORD *)buf = 138412546;
                    CFStringRef v127 = v70;
                    __int16 v128 = 2112;
                    id v129 = v80;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Created new linked account for sign-in { service: %@, account: %@ }", buf, 0x16u);

                    long long v26 = v107;
                  }

                  v75 = [(IDSDSignInResponder *)self accountController];
                  [v75 addAccount:v74];
                }
              }
              id v67 = [v65 countByEnumeratingWithState:&v115 objects:v124 count:16];
            }
            while (v67);
          }

          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v81 = v104;
          id v82 = [v81 countByEnumeratingWithState:&v111 objects:v123 count:16];
          if (v82)
          {
            id v83 = v82;
            uint64_t v84 = *(void *)v112;
            do
            {
              for (j = 0; j != v83; j = (char *)j + 1)
              {
                if (*(void *)v112 != v84) {
                  objc_enumerationMutation(v81);
                }
                v86 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
                v87 = [(IDSDSignInResponder *)self accountController];
                v88 = [v86 uniqueID];
                [v87 enableAccountWithUniqueID:v88];

                v89 = [v86 linkedAccounts];
                v110[0] = _NSConcreteStackBlock;
                v110[1] = 3221225472;
                v110[2] = sub_10021B5D0;
                v110[3] = &unk_1009822F8;
                v110[4] = self;
                objc_msgSend(v89, "__imForEach:", v110);

                unsigned int v90 = [v86 registrationStatus];
                if (v90 != -1 && v90 != 5) {
                  [v86 registerAccount];
                }
                v92 = [v86 linkedAccounts];
                v109[0] = _NSConcreteStackBlock;
                v109[1] = 3221225472;
                v109[2] = sub_10021B648;
                v109[3] = &unk_1009822F8;
                v109[4] = v86;
                objc_msgSend(v92, "__imForEach:", v109);
              }
              id v83 = [v81 countByEnumeratingWithState:&v111 objects:v123 count:16];
            }
            while (v83);
          }

          long long v26 = v107;
          v39 = v100;
          int64_t v44 = a3;
          id v45 = v102;
          uint64_t v46 = v99;
          uint64_t v47 = v106;
LABEL_82:
          if ((id)++v47 == v45)
          {
            id v45 = [obj countByEnumeratingWithState:&v119 objects:v125 count:16];
            if (!v45) {
              goto LABEL_84;
            }
            goto LABEL_35;
          }
        }

LABEL_52:
        goto LABEL_53;
      }
      v38 = +[IMRGLog iCloud];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v127 = v17;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Saving status to the account { accountStatus: %@ }", buf, 0xCu);
      }

      __int16 v36 = [(IDSDSignInResponder *)self passwordManager];
      [v36 setAccountStatus:v17 forProfileID:v33 username:v107 service:IDSServiceKey];
    }

    goto LABEL_31;
  }
  id v25 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    long long v27 = "No username provided -- ignoring sign-in";
    goto LABEL_20;
  }
LABEL_89:
}

- (void)_signOutDomain:(int64_t)a3
{
  v5 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      CFStringRef v6 = @"Invalid";
    }
    else {
      CFStringRef v6 = *(&off_1009865D8 + a3);
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v50 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS responding to sign-out { domain: %@ }", buf, 0xCu);
  }

  id v7 = [(IDSDSignInResponder *)self accountController];
  unsigned int v8 = [v7 hasHardDeregistered];

  if (v8)
  {
    id v9 = +[IMRGLog iCloud];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device has hard deregistered -- ignoring sign-out", buf, 2u);
    }
    goto LABEL_34;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v10 = [(IDSDSignInResponder *)self serviceController];
  v11 = [v10 allServices];

  id obj = v11;
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    uint64_t v33 = *(void *)v44;
    int64_t v34 = a3;
    do
    {
      id v15 = 0;
      id v35 = v13;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v15);
        if ([(IDSDSignInResponder *)self _shouldServiceBeDisabledOnSignOut:v16 forDomain:a3])
        {
          id v37 = v15;
          id v17 = [(IDSDSignInResponder *)self accountController];
          id v18 = [v17 accountsOnService:v16];
          id v19 = [v18 _copyForEnumerating];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                unsigned int v26 = [v25 accountType];
                long long v27 = +[IMRGLog iCloud];
                BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26 == 1)
                {
                  if (v28)
                  {
                    unsigned __int8 v29 = [v25 smallDescription];
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v50 = v29;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing account for sign-out { account: %@ }", buf, 0xCu);
                  }
                  objc_super v30 = [(IDSDSignInResponder *)self accountController];
                  [v30 removeAccount:v25];

                  id v31 = [v25 linkedAccounts];
                  v38[0] = _NSConcreteStackBlock;
                  v38[1] = 3221225472;
                  v38[2] = sub_10021BB20;
                  v38[3] = &unk_1009822F8;
                  v38[4] = self;
                  objc_msgSend(v31, "__imForEach:", v38);
                }
                else
                {
                  if (v28)
                  {
                    uint64_t v32 = [v25 smallDescription];
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v50 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Skipping removal of non-Apple ID account for sign-out { account: %@ }", buf, 0xCu);
                  }
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v22);
          }

          uint64_t v14 = v33;
          a3 = v34;
          id v13 = v35;
          id v15 = v37;
        }
        id v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v13);
  }

  if (a3 == 1)
  {
    id v9 = [(IDSDSignInResponder *)self userStore];
    [v9 reloadUsersForRealm:1];
LABEL_34:
  }
}

- (void)_updateDomainWithUsername:(id)a3 accountInfo:(id)a4
{
  id v62 = a3;
  id v6 = a4;
  id v7 = IDSAuthenticationDelegateUpdateTimeOfLastAuthenticationResponseAndGetDelta();
  unsigned int v8 = (id *)IMRGLog_ptr;
  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v90 = v62;
    __int16 v91 = 2112;
    id v92 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDS responding to updated account info { username: %@, accountInfo: %@ }", buf, 0x16u);
  }

  v10 = [(IDSDSignInResponder *)self accountController];
  unsigned int v11 = [v10 hasHardDeregistered];

  if (!v11)
  {
    id v13 = [(IDSDSignInResponder *)self accountStore];
    if (qword_100A4AB10 != -1) {
      dispatch_once(&qword_100A4AB10, &stru_100986598);
    }
    id v12 = [v13 accountTypeWithAccountTypeIdentifier:qword_100A4AB18];
    if (v12)
    {
      [v13 accountsWithAccountType:v12];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = [v14 countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (v15)
      {
        id v16 = v15;
        id v65 = self;
        v58 = v12;
        unsigned int v60 = v7;
        uint64_t v17 = *(void *)v83;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v83 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            id v20 = objc_msgSend(v19, "accountPropertyForKey:", @"primaryAccount", v58);
            unsigned int v21 = [v20 BOOLValue];

            if (v21)
            {
              id v22 = [v19 username];
              unsigned __int8 v23 = [v62 isEqualToIgnoringCase:v22];

              if (v23)
              {
                char v24 = 1;
                goto LABEL_21;
              }
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v82 objects:v88 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        char v24 = 0;
LABEL_21:
        id v12 = v58;
        id v7 = v60;
        self = v65;
      }
      else
      {
        char v24 = 0;
      }

      unsigned int v8 = (id *)IMRGLog_ptr;
    }
    else
    {
      char v24 = 0;
    }

    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10021C2DC;
    v80[3] = &unk_100986578;
    id v6 = v6;
    id v81 = v6;
    id v25 = objc_retainBlock(v80);
    unsigned int v26 = +[IMRGLog registration];
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Update called but for the primary iCloud -- committing update to relevant accounts", buf, 2u);
      }
      v59 = v12;
      v61 = v7;

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      BOOL v28 = [(IDSDSignInResponder *)self serviceController];
      unsigned __int8 v29 = [v28 allServices];

      id v30 = [v29 countByEnumeratingWithState:&v76 objects:v87 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v77;
        uint64_t v33 = v25 + 16;
        v64 = v29;
        id v66 = self;
        uint64_t v63 = *(void *)v77;
        do
        {
          int64_t v34 = 0;
          id v67 = v31;
          do
          {
            if (*(void *)v77 != v32) {
              objc_enumerationMutation(v29);
            }
            id v35 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v34);
            if (objc_msgSend(v35, "iCloudBasedService", v59)
              && ![v35 adHocServiceType])
            {
              uint64_t v68 = v34;
              __int16 v36 = [(IDSDSignInResponder *)self accountController];
              id v37 = [v36 accountsOnService:v35 withType:1];
              id v38 = [v37 _copyForEnumerating];

              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v39 = v38;
              id v40 = [v39 countByEnumeratingWithState:&v72 objects:v86 count:16];
              if (v40)
              {
                id v41 = v40;
                uint64_t v42 = *(void *)v73;
                do
                {
                  long long v43 = 0;
                  id v69 = v41;
                  do
                  {
                    if (*(void *)v73 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    long long v44 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v43);
                    if ([v44 accountType] == 1)
                    {
                      long long v45 = [*v8 iCloud];
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                      {
                        [v44 smallDescription];
                        uint64_t v46 = v42;
                        id v47 = v39;
                        v48 = v25;
                        id v49 = v6;
                        CFStringRef v50 = v33;
                        v52 = v51 = v8;
                        *(_DWORD *)buf = 138412290;
                        id v90 = v52;
                        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Updating matching account (and linked accounts) with account info { account: %@ }", buf, 0xCu);

                        unsigned int v8 = v51;
                        uint64_t v33 = v50;
                        id v6 = v49;
                        id v25 = v48;
                        id v39 = v47;
                        uint64_t v42 = v46;
                        id v41 = v69;
                      }

                      v53 = (*((void (**)(char *, void *))v25 + 2))(v25, v44);

                      [v44 _updateAccountWithAccountInfo:v53];
                      v54 = [v44 linkedAccounts];
                      v70[0] = _NSConcreteStackBlock;
                      v70[1] = 3221225472;
                      v70[2] = sub_10021C44C;
                      v70[3] = &unk_1009822F8;
                      id v6 = v53;
                      id v71 = v6;
                      objc_msgSend(v54, "__imForEach:", v70);
                    }
                    long long v43 = (char *)v43 + 1;
                  }
                  while (v41 != v43);
                  id v41 = [v39 countByEnumeratingWithState:&v72 objects:v86 count:16];
                }
                while (v41);
              }

              unsigned __int8 v29 = v64;
              self = v66;
              uint64_t v32 = v63;
              id v31 = v67;
              int64_t v34 = v68;
            }
            int64_t v34 = (char *)v34 + 1;
          }
          while (v34 != v31);
          id v31 = [v29 countByEnumeratingWithState:&v76 objects:v87 count:16];
        }
        while (v31);
      }

      id v7 = v61;
      if (!v61)
      {
        id v12 = v59;
        goto LABEL_53;
      }
      id v55 = objc_alloc((Class)IDSRegistrationAuthenticationParametersReceivedMetric);
      [v61 doubleValue];
      unsigned int v26 = objc_msgSend(v55, "initWithErrorCode:timeIntervalSinceAuthenticationParameterRequest:", 0);
      v56 = +[IDSAWDLogger logger];
      [v56 logMetric:v26];

      v57 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v57 logMetric:v26];

      id v12 = v59;
    }
    else if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Update called but for account other than the primary iCloud -- ignoring update", buf, 2u);
    }

LABEL_53:
    goto LABEL_54;
  }
  id v12 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " Device has hard deregistered -- ignoring update", buf, 2u);
  }
LABEL_54:
}

- (void)_modifyDomainWithUsername:(id)a3
{
  id v4 = a3;
  v5 = (id *)IMRGLog_ptr;
  id v6 = +[IMRGLog registration];
  id v7 = &off_100793000;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS responding to account modification { username: %@ }", buf, 0xCu);
  }

  unsigned int v8 = [(IDSDSignInResponder *)self accountStore];
  if (qword_100A4AB20 != -1) {
    dispatch_once(&qword_100A4AB20, &stru_1009865B8);
  }
  id v9 = [v8 accountTypeWithAccountTypeIdentifier:qword_100A4AB28];
  if (v9)
  {
    [v8 accountsWithAccountType:v9];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v22 = self;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = [v14 username];
          unsigned int v16 = [v4 isEqualToIgnoringCase:v15];

          if (v16)
          {
            id v11 = v14;
            goto LABEL_16;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_16:
      self = v22;
      v5 = (id *)IMRGLog_ptr;
      id v7 = &off_100793000;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v17 = [*v5 iCloud];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v7 + 474);
    id v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Checking IdentityServices accounts to know if we should attempt a repair { foundAccount: %@ }", buf, 0xCu);
  }

  if (v11)
  {
    id v18 = [v11 credential];
    id v19 = [v18 token];

    if (v19)
    {
      id v20 = [*v5 iCloud];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Auth token found on account -- attempting to kick iCloud repair logic", buf, 2u);
      }

      unsigned int v21 = [(IDSDSignInResponder *)self registrationConductor];
      [v21 kickiCloudRepair];
    }
  }
}

- (void)_modifyGameCenterAccountPropertiesForUsername:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS responding to account modification for GameCenter domain { username: %@ }", (uint8_t *)&v19, 0xCu);
  }

  id v6 = [(IDSDSignInResponder *)self passwordManager];
  id v7 = [v6 gameCenterPropertiesFromAccountWithUsername:v4];

  unsigned int v8 = [(IDSDSignInResponder *)self serviceController];
  id v9 = [v8 gameCenterService];

  id v10 = [(IDSDSignInResponder *)self accountController];
  id v11 = [v10 existingAccountOnService:v9 withType:1 loginID:v4];

  if (v11)
  {
    uint64_t v12 = [v11 gameCenterData];
    unsigned __int8 v13 = [v12 isEqual:v7];
    id v14 = +[IMRGLog registration];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Account data is up to date with IDS, ignoring notification", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (v15)
      {
        int v19 = 138412546;
        id v20 = v12;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initiating a reregister to update Game Center specific user data. Data stored in IDS {%@}, updated data received from accounts {%@}", (uint8_t *)&v19, 0x16u);
      }

      [v11 reregister];
    }
  }
  else
  {
    unsigned int v16 = [(IDSDSignInResponder *)self _gameCenterShouldSigninOnModify];
    uint64_t v17 = +[IMRGLog registration];
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No GameCenter IDSDAccount found with username {%@}. Trying to sign in.", (uint8_t *)&v19, 0xCu);
      }

      [(IDSDSignInResponder *)self gameCenterSignInWithUsername:v4 authToken:0 password:0 accountInfo:0 accountStatus:0 handles:0];
    }
    else
    {
      if (v18)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No GameCenter IDSDAccount found with username {%@}. Cannot modify.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
}

- (void)_reregisterAndReProvisionForEDULoginWithUsername:(id)a3
{
  id v4 = a3;
  v5 = [(IDSDSignInResponder *)self deviceSupport];
  unsigned int v6 = [v5 isInMultiUserMode];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(IDSDSignInResponder *)self accountController];
    unsigned int v8 = [v7 accounts];

    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v13 isAdHocAccount] & 1) == 0)
          {
            if ([v13 isEnabled])
            {
              id v14 = [v13 loginID];
              unsigned int v15 = [v14 isEqualToIgnoringCase:v4];

              if (v15) {
                [v13 _reregisterAndReProvision];
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (FTPasswordManager)passwordManager
{
  return self->_passwordManager;
}

- (IDSRegistrationConductor)registrationConductor
{
  return self->_registrationConductor;
}

- (IDSDSignInResponderDeviceSupport)deviceSupport
{
  return self->_deviceSupport;
}

- (IDSDRegistrationControl)registrationControl
{
  return self->_registrationControl;
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_registrationControl, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_registrationConductor, 0);
  objc_storeStrong((id *)&self->_passwordManager, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end