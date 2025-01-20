@interface IDSDRegistrationControl
+ (id)sharedInstance;
- (BOOL)_setKeychainData:(id)a3 withServiceName:(id)a4 withAccountKey:(id)a5 withIDSRegistrationAccesssGroup:(id)a6 error:(int)a7;
- (BOOL)updateRegistrationType:(int64_t)a3 toState:(int64_t)a4 error:(id *)a5;
- (int64_t)registrationStateForRegistrationType:(int64_t)a3 error:(id *)a4;
@end

@implementation IDSDRegistrationControl

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001169D4;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4A6C0 != -1) {
    dispatch_once(&qword_100A4A6C0, block);
  }
  v2 = (void *)qword_100A4A6B8;

  return v2;
}

- (BOOL)updateRegistrationType:(int64_t)a3 toState:(int64_t)a4 error:(id *)a5
{
  v13 = self;
  id v47 = 0;
  int64_t v8 = [(IDSDRegistrationControl *)self registrationStateForRegistrationType:a3 error:&v47];
  id v9 = v47;
  v10 = +[NSString stringWithFormat:@"%@-%ld", IDSRegistrationControlKeychainAccountName, a3];
  v11 = +[NSNumber numberWithInteger:a4];
  v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

  LODWORD(v13) = [(IDSDRegistrationControl *)v13 _setKeychainData:v12 withServiceName:IDSRegistrationControlKeychainServiceName withAccountKey:v10 withIDSRegistrationAccesssGroup:IDSRegistrationControlKeychainAccessGroup error:0];
  if (!v13)
  {
    if (!a5) {
      goto LABEL_29;
    }
    id v22 = objc_alloc((Class)NSError);
    id v23 = [v22 initWithDomain:IDSRegistrationControlErrorDomain code:1 userInfo:0];
    goto LABEL_28;
  }
  if (a4 == 2 && v8 == 1)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v14 = +[IDSDAccountController sharedInstance];
    v15 = [v14 accountsWithType:0];

    id v16 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v16)
    {
      id v17 = v16;
      v38 = a5;
      char v18 = (char)v13;
      v13 = v12;
      v19 = v10;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) reregister];
        }
        id v17 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v17);
      v10 = v19;
      v12 = v13;
      LOBYTE(v13) = v18;
LABEL_24:
      a5 = v38;
    }
  }
  else
  {
    if (a4 != 1 || v8 == 1) {
      goto LABEL_26;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v24 = +[IDSDAccountController sharedInstance];
    v15 = [v24 accountsWithType:0];

    id v25 = [v15 countByEnumeratingWithState:&v39 objects:v54 count:16];
    if (v25)
    {
      id v26 = v25;
      id v37 = v9;
      v38 = a5;
      char v34 = (char)v13;
      v35 = v12;
      v36 = v10;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v15);
          }
          v29 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          v30 = +[IDSDAccountController sharedInstance];
          v31 = [v29 uniqueID];
          [v30 disableAccountWithUniqueID:v31];

          [v29 setIsUserDisabled:1];
        }
        id v26 = [v15 countByEnumeratingWithState:&v39 objects:v54 count:16];
      }
      while (v26);
      v10 = v36;
      id v9 = v37;
      v12 = v35;
      LOBYTE(v13) = v34;
      goto LABEL_24;
    }
  }

LABEL_26:
  if (!a5) {
    goto LABEL_29;
  }
  id v23 = 0;
LABEL_28:
  *a5 = v23;
LABEL_29:
  v32 = +[IMRGLog registration];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v49 = a3;
    __int16 v50 = 2048;
    int64_t v51 = a4;
    __int16 v52 = 1024;
    int v53 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Updating registration control state { registrationType: %lld, toState: %lld, err: %d }", buf, 0x1Cu);
  }

  return (char)v13;
}

- (int64_t)registrationStateForRegistrationType:(int64_t)a3 error:(id *)a4
{
  v6 = +[NSString stringWithFormat:@"%@-%ld", IDSRegistrationControlKeychainAccountName, a3];
  int v7 = IMGetKeychainData();
  id v8 = 0;
  if (v7)
  {
    id v9 = +[NSKeyedUnarchiver ids_secureUnarchiveObjectOfClass:objc_opt_class() withData:v8];
    id v10 = 0;
  }
  else
  {
    v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registration control state can't be loaded because of a keychain error { err: %d }", buf, 8u);
    }

    id v12 = objc_alloc((Class)NSError);
    id v10 = [v12 initWithDomain:IDSRegistrationControlErrorDomain code:1 userInfo:0];
    id v9 = &off_1009D1080;
  }
  v13 = +[IMRGLog registration];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Loaded registration control state { registrationType: %lld, state: %@, error: %@ }", buf, 0x20u);
  }

  if (a4) {
    *a4 = v10;
  }
  id v14 = [v9 integerValue];

  return (int64_t)v14;
}

- (BOOL)_setKeychainData:(id)a3 withServiceName:(id)a4 withAccountKey:(id)a5 withIDSRegistrationAccesssGroup:(id)a6 error:(int)a7
{
  return IMSetKeychainData();
}

@end