@interface MBServiceAccount
+ (NSArray)allServiceAccounts;
+ (OS_dispatch_queue)accountsQueue;
+ (id)_stringForAccountCredentialRenewResult:(int64_t)a3;
+ (id)serviceAccountFromPreferences;
+ (unint64_t)_optionsFromACAccount:(id)a3 currentOptions:(unint64_t)a4;
+ (void)_setBackupEnabled:(BOOL)a3 account:(id)a4 completion:(id)a5;
+ (void)enableBackupInPreferences;
+ (void)setBackupEnabled:(BOOL)a3 completion:(id)a4;
- (BOOL)enabled;
- (BOOL)enabledForBackup;
- (BOOL)hasAppleAccount;
- (BOOL)isAuthenticated;
- (BOOL)isBackupOnCellularEnabled;
- (BOOL)isBeneficiaryAccount;
- (BOOL)isCloudPhotosEnabled;
- (BOOL)isEmailVerified;
- (BOOL)isEnabled;
- (BOOL)isEnabledForBackup;
- (BOOL)isManagedAppleID;
- (BOOL)isPrimaryAccount;
- (BOOL)useMockChunkStore;
- (BOOL)verifyAppleAccountCredentialsWithContext:(BOOL)a3;
- (MBPersona)persona;
- (MBServiceAccount)initWithPersona:(id)a3 account:(id)a4 options:(unint64_t)a5;
- (MBServiceAccount)initWithPersona:(id)a3 accountIdentifier:(id)a4 dsid:(id)a5 altDSID:(id)a6 serviceURL:(id)a7 chunkStoreURL:(id)a8 options:(unint64_t)a9;
- (MBServiceAccount)initWithPersona:(id)a3 error:(id *)a4;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)clientInfoHeader;
- (NSString)dsid;
- (NSURL)chunkStoreURL;
- (NSURL)serviceURL;
- (id)appleID;
- (id)description;
- (id)reloaded;
- (id)updateAppleAccountSync;
- (id)updateApplePasswordSync:(id)a3;
- (unint64_t)_refreshIsBackupOnCellularEnabledWithCurrentOptions:(unint64_t)a3;
- (void)_reloadAccountPropertiesFromACAccount:(id)a3;
- (void)_reloadAccounts;
- (void)renewCredentials;
- (void)setAccountIdentifier:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBackupEnabled:(BOOL)a3 completion:(id)a4;
- (void)setChunkStoreURL:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledForBackup:(BOOL)a3;
- (void)setPersona:(id)a3;
- (void)setServiceURL:(id)a3;
- (void)setUseMockChunkStore:(BOOL)a3;
- (void)updateAppleAccount:(id)a3;
- (void)updateApplePassword:(id)a3 completionHandler:(id)a4;
@end

@implementation MBServiceAccount

+ (OS_dispatch_queue)accountsQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11258;
  block[3] = &unk_28C88;
  block[4] = a1;
  if (qword_2EB30 != -1) {
    dispatch_once(&qword_2EB30, block);
  }
  v2 = (void *)qword_2EB28;

  return (OS_dispatch_queue *)v2;
}

+ (id)serviceAccountFromPreferences
{
  CFPreferencesAppSynchronize(@"com.apple.MobileBackup");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"IsEnabled", @"com.apple.MobileBackup", &keyExistsAndHasValidFormat)) {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = !v3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseMockChunkStore", @"com.apple.MobileBackup", 0);
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"AccountID", @"com.apple.MobileBackup");
  if (!v6) {
    sub_19C40();
  }
  v7 = (void *)v6;
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(@"ServiceURL", @"com.apple.MobileBackup");
  if (!v8) {
    sub_19C6C();
  }
  v9 = (void *)v8;
  id v10 = [objc_alloc((Class)NSURL) initWithString:v8];
  CFPropertyListRef v11 = CFPreferencesCopyAppValue(@"ChunkStoreURL", @"com.apple.MobileBackup");
  if (!v11) {
    sub_19C98();
  }
  v12 = (void *)v11;
  id v13 = [objc_alloc((Class)NSURL) initWithString:v11];
  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v4;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Loaded account properties from preferences, enabled:%d", buf, 8u);
    _MBLog();
  }

  id v23 = 0;
  v15 = +[MBPersona personalPersonaWithError:&v23];
  id v16 = v23;
  if (!v15)
  {
    v22 = +[NSAssertionHandler currentHandler];
    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MBServiceAccount serviceAccountFromPreferences]");
    [v22 handleFailureInFunction:v21, @"MBServiceAccount.m", 137, @"nil personal persona: %@", v16 file lineNumber description];
  }
  uint64_t v17 = 3;
  if (!v4) {
    uint64_t v17 = 0;
  }
  if (AppBooleanValue) {
    uint64_t v18 = v17 | 0x40;
  }
  else {
    uint64_t v18 = v17;
  }
  id v19 = [objc_alloc((Class)a1) initWithPersona:v15 accountIdentifier:@"EMPTY" dsid:v7 altDSID:0 serviceURL:v10 chunkStoreURL:v13 options:v18];

  return v19;
}

+ (NSArray)allServiceAccounts
{
  v2 = +[ACAccountStore defaultStore];
  v27 = [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
  v28 = v2;
  BOOL v3 = objc_msgSend(v2, "accountsWithAccountType:");
  int v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = [v3 count];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Found %ld system accounts", buf, 0xCu);
    v25 = [v3 count];
    _MBLog();
  }

  id v29 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
    uint64_t v8 = AAAccountClassPrimary;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v9);
        v12 = [v10 personaIdentifier];
        if (v12)
        {
          uint64_t v13 = +[UMUserPersonaAttributes personaAttributesForIdentifier:v12];
          if (v13)
          {
            v14 = (void *)v13;
            if (objc_msgSend(v10, "aa_isAccountClass:", v8))
            {
LABEL_19:
              id v16 = @"/private/var/mobile";
              goto LABEL_20;
            }
            if ([v14 isEnterprisePersona])
            {
              v15 = [v14 personaLayoutPathURL];
              id v16 = [v15 path];

              if (!v16)
              {
                uint64_t v17 = MBGetDefaultLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v37 = v12;
                  _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "nil volumeMountPoint for %{public}@", buf, 0xCu);
                  v25 = v12;
                  _MBLog();
                }
                id v16 = 0;
LABEL_32:
                id v19 = 0;
LABEL_33:

                goto LABEL_34;
              }
LABEL_20:
              uint64_t v17 = +[MBPersona personaWithAttributes:volumeMountPoint:](MBPersona, "personaWithAttributes:volumeMountPoint:", v14, v16, v25, v26);
              id v19 = [objc_alloc((Class)a1) initWithPersona:v17 account:v10 options:0];
              if (v19) {
                [v29 addObject:v19];
              }
              goto LABEL_33;
            }
            id v16 = 0;
LABEL_27:
            id v19 = 0;
            uint64_t v17 = v12;
            v12 = 0;
            goto LABEL_33;
          }
          id v16 = MBGetDefaultLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v14 = 0;
            id v19 = 0;
            goto LABEL_34;
          }
          v20 = objc_msgSend(v10, "aa_accountClass");
          *(_DWORD *)buf = 138543618;
          v37 = v12;
          __int16 v38 = 2112;
          v39 = v20;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for persona %{public}@ accountClass %@", buf, 0x16u);

          uint64_t v17 = objc_msgSend(v10, "aa_accountClass");
          v25 = v12;
          int v26 = v17;
          _MBLog();
LABEL_31:
          v14 = 0;
          goto LABEL_32;
        }
        if (!objc_msgSend(v10, "aa_isAccountClass:", v8))
        {
          id v16 = 0;
          v14 = 0;
          goto LABEL_27;
        }
        uint64_t v18 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
        if (!v18)
        {
          uint64_t v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for personal persona", buf, 2u);
            _MBLog();
          }
          id v16 = 0;
          v12 = 0;
          goto LABEL_31;
        }
        v14 = v18;
        v12 = [v18 userPersonaUniqueString];
        if (v12) {
          goto LABEL_19;
        }
        id v19 = 0;
        id v16 = @"/private/var/mobile";
LABEL_34:

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v21 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      id v6 = v21;
    }
    while (v21);
  }

  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v23 = [v29 count];
    *(_DWORD *)buf = 134217984;
    v37 = v23;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "Found %lu service accounts", buf, 0xCu);
    [v29 count];
    _MBLog();
  }

  return (NSArray *)v29;
}

- (MBServiceAccount)initWithPersona:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    sub_19CC4();
  }
  uint64_t v7 = v6;
  if (!v6) {
    sub_19CF0();
  }
  uint64_t v8 = +[MBPersona personaWithUMPersona:v6 error:a4];
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 personaIdentifier];
    CFPropertyListRef v11 = +[ACAccountStore defaultStore];
    if ([v9 isPersonalPersona])
    {
      objc_msgSend(v11, "aa_primaryAppleAccount");
      v12 = (MBServiceAccount *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (![v9 isEnterprisePersona])
      {
        v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v10;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Found an unexpected persona type for persona %{public}@", buf, 0xCu);
          _MBLog();
        }

        uint64_t v13 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v11, "mb_accountForPersonaIdentifier:", v10);
      v12 = (MBServiceAccount *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;
    if (v12)
    {
      uint64_t v15 = [(MBServiceAccount *)v12 personaIdentifier];
      if (v15
        && (id v16 = (void *)v15,
            [(MBServiceAccount *)v14 personaIdentifier],
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v18 = [v17 isEqualToString:v10],
            v17,
            v16,
            (v18 & 1) == 0))
      {
        id v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = [(MBServiceAccount *)v14 personaIdentifier];
          *(_DWORD *)buf = 138543618;
          v28 = v24;
          __int16 v29 = 2114;
          v30 = v10;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Persona identifier mismatch: %{public}@ != %{public}@", buf, 0x16u);

          int v26 = [(MBServiceAccount *)v14 personaIdentifier];
          _MBLog();
        }
        *a4 = +[MBError errorWithCode:1 format:@"Persona identifier mismatch"];

        uint64_t v13 = 0;
        self = v14;
      }
      else
      {
        id v19 = [v9 volumeMountPoint];
        v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v28 = v10;
          __int16 v29 = 2048;
          v30 = 0;
          __int16 v31 = 2112;
          long long v32 = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Found personaIdentifier:%@, options:0x%lx, volumeMountPoint:\"%@\"", buf, 0x20u);
          _MBLog();
        }

        self = [(MBServiceAccount *)self initWithPersona:v9 account:v14 options:0];
        uint64_t v13 = self;
      }
    }
    else
    {
      id v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v10;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Failed to find the account for persona %{public}@", buf, 0xCu);
        _MBLog();
      }

      +[MBError errorWithCode:210 format:@"No account found"];
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:

    goto LABEL_25;
  }

  uint64_t v13 = 0;
LABEL_25:

  return v13;
}

+ (unint64_t)_optionsFromACAccount:(id)a3 currentOptions:(unint64_t)a4
{
  uint64_t v5 = kAccountDataclassBackup;
  id v6 = a3;
  if ([v6 isEnabledForDataclass:v5]) {
    unint64_t v7 = a4 | 0x11;
  }
  else {
    unint64_t v7 = a4 & 0xFFFFFFFFFFFFFE40 | 0x10;
  }
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFE51;
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified")) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  unsigned int v10 = [v6 isEnabledForDataclass:kAccountDataclassCloudPhotos];
  uint64_t v11 = 4;
  if (!v10) {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v8 | v9 | v11;
  unsigned int v13 = objc_msgSend(v6, "aa_isManagedAppleID");
  uint64_t v14 = 8;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 | v14;
  id v16 = [v6 credential];
  uint64_t v17 = [v16 token];
  BOOL v18 = v17 != 0;

  uint64_t v19 = v15 | (32 * v18);
  if (objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary)) {
    uint64_t v20 = 128;
  }
  else {
    uint64_t v20 = 0;
  }
  unsigned int v21 = objc_msgSend(v6, "aa_useCellularForDataclass:", v5);

  uint64_t v22 = 256;
  if (!v21) {
    uint64_t v22 = 0;
  }
  return v19 | v20 | v22;
}

- (MBServiceAccount)initWithPersona:(id)a3 account:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    sub_19D1C();
  }
  unsigned int v10 = v9;
  unint64_t v11 = +[MBServiceAccount _optionsFromACAccount:v9 currentOptions:a5];
  v27 = self;
  unint64_t v12 = [v10 propertiesForDataclass:kAccountDataclassBackup];
  unsigned int v13 = [v12 objectForKeyedSubscript:@"url"];
  uint64_t v14 = +[NSURL URLWithString:v13];

  uint64_t v15 = [v10 username];
  id v16 = [v14 URLByInsertingUser:v15];

  uint64_t v17 = [v10 propertiesForDataclass:kAccountDataclassContent];
  BOOL v18 = [v17 objectForKeyedSubscript:@"url"];
  uint64_t v19 = +[NSURL URLWithString:v18];

  uint64_t v20 = [v10 username];
  unsigned int v21 = [v19 URLByInsertingUser:v20];

  uint64_t v22 = [v10 identifier];
  id v23 = objc_msgSend(v10, "aa_personID");
  v24 = objc_msgSend(v10, "aa_altDSID");
  v25 = [(MBServiceAccount *)v27 initWithPersona:v8 accountIdentifier:v22 dsid:v23 altDSID:v24 serviceURL:v16 chunkStoreURL:v21 options:v11];

  return v25;
}

- (MBServiceAccount)initWithPersona:(id)a3 accountIdentifier:(id)a4 dsid:(id)a5 altDSID:(id)a6 serviceURL:(id)a7 chunkStoreURL:(id)a8 options:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v38 = a6;
  id v37 = a7;
  id v19 = a8;
  if (!v16) {
    sub_19D48();
  }
  v36 = v19;
  v39.receiver = self;
  v39.super_class = (Class)MBServiceAccount;
  uint64_t v20 = [(MBServiceAccount *)&v39 init];
  unsigned int v21 = v20;
  if (v20)
  {
    id v35 = v18;
    objc_storeStrong((id *)&v20->_persona, a3);
    objc_storeStrong((id *)&v21->_accountIdentifier, a4);
    objc_storeStrong((id *)&v21->_dsid, a5);
    objc_storeStrong((id *)&v21->_altDSID, a6);
    objc_storeStrong((id *)&v21->_serviceURL, a7);
    objc_storeStrong((id *)&v21->_chunkStoreURL, a8);
    v21->_unint64_t options = a9;
    v21->_unint64_t options = [(MBServiceAccount *)v21 _refreshIsBackupOnCellularEnabledWithCurrentOptions:a9];
    uint64_t v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v16 personaIdentifier];
      unsigned int v24 = [(MBServiceAccount *)v21 isEnabled];
      unsigned int v25 = [(MBServiceAccount *)v21 isEnabledForBackup];
      unsigned int v26 = [(MBServiceAccount *)v21 isEmailVerified];
      unsigned int v27 = [(MBServiceAccount *)v21 isAuthenticated];
      id v34 = v17;
      unint64_t options = v21->_options;
      __int16 v29 = [v16 volumeMountPoint];
      unsigned int v30 = [(MBServiceAccount *)v21 isBackupOnCellularEnabled];
      *(_DWORD *)buf = 138545666;
      id v41 = v34;
      __int16 v42 = 2114;
      v43 = v23;
      __int16 v44 = 2112;
      id v45 = v35;
      __int16 v46 = 1024;
      unsigned int v47 = v24;
      __int16 v48 = 1024;
      unsigned int v49 = v25;
      __int16 v50 = 1024;
      unsigned int v51 = v26;
      __int16 v52 = 1024;
      unsigned int v53 = v27;
      __int16 v54 = 2048;
      unint64_t v55 = options;
      __int16 v56 = 2114;
      v57 = v29;
      __int16 v58 = 1024;
      unsigned int v59 = v30;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Loaded properties for account %{public}@, persona:%{public}@, dsid:%@, enabled:%d, enabledForBackup:%d, emailVerified:%d, authenticated:%d, options:0x%lx, volume:%{public}@, isBackupOnCellularEnabled:%d", buf, 0x52u);

      __int16 v31 = [v16 personaIdentifier];
      [(MBServiceAccount *)v21 isEnabled];
      [(MBServiceAccount *)v21 isEnabledForBackup];
      [(MBServiceAccount *)v21 isEmailVerified];
      [(MBServiceAccount *)v21 isAuthenticated];
      long long v33 = [v16 volumeMountPoint];
      [(MBServiceAccount *)v21 isBackupOnCellularEnabled];
      id v17 = v34;
      _MBLog();
    }
    id v18 = v35;
  }

  return v21;
}

- (unint64_t)_refreshIsBackupOnCellularEnabledWithCurrentOptions:(unint64_t)a3
{
  char v9 = 0;
  int v4 = [(MBServiceAccount *)self persona];
  unsigned int v5 = [v4 getBooleanValueForKey:@"EnableBackupOnCellular" keyExists:&v9];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v9 == 0;
  }
  uint64_t v7 = 512;
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v7 | a3 & 0xFFFFFFFFFFFFFDFFLL;
}

- (void)_reloadAccountPropertiesFromACAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 identifier];
  id v6 = [(id)objc_opt_class() _optionsFromACAccount:v4 currentOptions:self->_options];
  self->_unint64_t options = (unint64_t)v6;
  self->_unint64_t options = [(MBServiceAccount *)self _refreshIsBackupOnCellularEnabledWithCurrentOptions:v6];
  uint64_t v7 = objc_msgSend(v4, "aa_personID");
  [(MBServiceAccount *)self setDsid:v7];

  objc_storeStrong((id *)&self->_accountIdentifier, v5);
  id v8 = objc_msgSend(v4, "aa_altDSID");
  [(MBServiceAccount *)self setAltDSID:v8];

  char v9 = [v4 propertiesForDataclass:kAccountDataclassBackup];
  unsigned int v10 = [v9 objectForKeyedSubscript:@"url"];
  unint64_t v11 = +[NSURL URLWithString:v10];

  unint64_t v12 = [v4 username];
  unsigned int v13 = [v11 URLByInsertingUser:v12];
  [(MBServiceAccount *)self setServiceURL:v13];

  uint64_t v14 = [v4 propertiesForDataclass:kAccountDataclassContent];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"url"];
  id v16 = +[NSURL URLWithString:v15];

  id v17 = [v4 username];

  id v18 = [v16 URLByInsertingUser:v17];
  [(MBServiceAccount *)self setChunkStoreURL:v18];

  id v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    dsid = self->_dsid;
    unsigned int v21 = [(MBServiceAccount *)self isEnabled];
    unsigned int v22 = [(MBServiceAccount *)self isEnabledForBackup];
    unsigned int v23 = [(MBServiceAccount *)self isEmailVerified];
    unsigned int v24 = [(MBServiceAccount *)self isAuthenticated];
    unint64_t options = self->_options;
    *(_DWORD *)buf = 138545154;
    unsigned int v27 = v5;
    __int16 v28 = 2112;
    __int16 v29 = dsid;
    __int16 v30 = 1024;
    unsigned int v31 = v21;
    __int16 v32 = 1024;
    unsigned int v33 = v22;
    __int16 v34 = 1024;
    unsigned int v35 = v23;
    __int16 v36 = 1024;
    unsigned int v37 = v24;
    __int16 v38 = 2048;
    unint64_t v39 = options;
    __int16 v40 = 1024;
    unsigned int v41 = [(MBServiceAccount *)self isBackupOnCellularEnabled];
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Reloaded properties for account %{public}@, dsid:%@, enabled:%d, enabledForBackup:%d, emailVerified:%d, authenticated:%d, options:0x%lx, isBackupOnCellularEnabled:%d", buf, 0x3Eu);
    [(MBServiceAccount *)self isEnabled];
    [(MBServiceAccount *)self isEnabledForBackup];
    [(MBServiceAccount *)self isEmailVerified];
    [(MBServiceAccount *)self isAuthenticated];
    [(MBServiceAccount *)self isBackupOnCellularEnabled];
    _MBLog();
  }
}

- (BOOL)isEnabledForBackup
{
  BOOL v3 = [(MBServiceAccount *)self isEnabled];
  if (v3) {
    LOBYTE(v3) = self->_options & 1;
  }
  return v3;
}

- (BOOL)isEnabled
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 isEphemeralMultiUser];

  if (v4) {
    return 0;
  }
  if (self->_options) {
    return (self->_options & 2) != 0;
  }
  return 0;
}

- (BOOL)isCloudPhotosEnabled
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)isAuthenticated
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)isManagedAppleID
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)isBackupOnCellularEnabled
{
  return (~LODWORD(self->_options) & 0x300) == 0;
}

- (BOOL)isBeneficiaryAccount
{
  v2 = [(MBServiceAccount *)self altDSID];
  if (v2)
  {
    BOOL v3 = +[AKAccountManager sharedInstance];
    unsigned __int8 v4 = [v3 authKitAccountWithAltDSID:v2];

    unsigned int v5 = +[AKAccountManager sharedInstance];
    unsigned __int8 v6 = [v5 isBeneficiaryForAccount:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)hasAppleAccount
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)isEmailVerified
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)isPrimaryAccount
{
  return LOBYTE(self->_options) >> 7;
}

- (void)_reloadAccounts
{
  BOOL v3 = [(id)objc_opt_class() accountsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12B50;
  block[3] = &unk_28CB0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)reloaded
{
  return self;
}

- (NSString)clientInfoHeader
{
  return (NSString *)+[AADeviceInfo clientInfoHeader];
}

+ (void)_setBackupEnabled:(BOOL)a3 account:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v7) {
    sub_19D74();
  }
  char v9 = (void (**)(void, void))v8;
  if (!v8) {
    sub_19DA0();
  }
  unsigned int v10 = [v7 identifier];
  id v11 = kAccountDataclassBackup;
  unint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    if (v6) {
      unsigned int v13 = "Enabling";
    }
    else {
      unsigned int v13 = "Disabling";
    }
    unsigned int v25 = v13;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    __int16 v29 = v10;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s \"%{public}@\" on account %{public}@ : %d", buf, 0x26u);
    _MBLog();
  }

  uint64_t v14 = +[MCProfileConnection sharedConnection];
  unsigned int v15 = [v14 isEphemeralMultiUser];

  if (v15)
  {
    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unsigned int v25 = (const char *)v10;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Not changing the \"%{public}@\" state on account %{public}@ since the device is in EDU mode", buf, 0x16u);
      _MBLog();
    }

    v9[2](v9, 0);
  }
  else
  {
    if (qword_2EB40 != -1) {
      dispatch_once(&qword_2EB40, &stru_28CD0);
    }
    id v17 = qword_2EB38;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_12F78;
    block[3] = &unk_28D20;
    BOOL v23 = v6;
    id v19 = v7;
    id v20 = v11;
    id v21 = v10;
    unsigned int v22 = v9;
    dispatch_async(v17, block);
  }
}

+ (void)setBackupEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6) {
    sub_19DCC();
  }
  id v7 = (void (**)(void, void))v6;
  id v8 = +[ACAccountStore defaultStore];
  char v9 = objc_msgSend(v8, "aa_primaryAppleAccount");

  if (v9)
  {
    [a1 _setBackupEnabled:v4 account:v9 completion:v7];
  }
  else
  {
    unsigned int v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the primary account", v12, 2u);
      _MBLog();
    }

    id v11 = +[MBError errorWithCode:210 format:@"Failed to fetch the primary account"];
    ((void (**)(void, void *))v7)[2](v7, v11);
  }
}

- (void)setBackupEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6) {
    sub_19DF8();
  }
  id v7 = (void (**)(void, void))v6;
  uint64_t v8 = [(MBServiceAccount *)self accountIdentifier];
  if (!v8) {
    sub_19E24();
  }
  char v9 = (void *)v8;
  unsigned int v10 = +[ACAccountStore defaultStore];
  id v14 = 0;
  id v11 = [v10 accountWithIdentifier:v9 error:&v14];
  id v12 = v14;

  if (v11)
  {
    [(id)objc_opt_class() _setBackupEnabled:v4 account:v11 completion:v7];
  }
  else
  {
    uint64_t v13 = +[MBError errorWithCode:210 error:v12 format:@"Failed to fetch the account"];

    v7[2](v7, v13);
    id v12 = (id)v13;
  }
}

+ (void)enableBackupInPreferences
{
  CFPreferencesSetAppValue(@"IsEnabled", &__kCFBooleanTrue, @"com.apple.MobileBackup");
  CFPreferencesAppSynchronize(@"com.apple.MobileBackup");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, (CFNotificationName)ACAccountStoreDidChangeNotification, 0, 0, 4uLL);
}

+ (id)_stringForAccountCredentialRenewResult:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"failed to renew with unknown result";
  }
  else {
    return *(&off_28E98 + a3);
  }
}

- (void)renewCredentials
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Renewing account credentials", buf, 2u);
    _MBLog();
  }

  if ([(MBServiceAccount *)self hasAppleAccount])
  {
    BOOL v4 = [(id)objc_opt_class() accountsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_136BC;
    block[3] = &unk_28CB0;
    void block[4] = self;
    dispatch_sync(v4, block);
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  accountIdentifier = self->_accountIdentifier;
  unsigned int v5 = [(MBServiceAccount *)self persona];
  id v6 = [v5 personaIdentifier];
  dsid = self->_dsid;
  uint64_t v8 = [(MBServiceAccount *)self persona];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; id=(%@,%@,%@), persona=%@ isPrimary=%d, isEnabled=%d, isEnabledForBackup=%d, options=0x%lx>",
    v3,
    self,
    accountIdentifier,
    v6,
    dsid,
    v8,
    [(MBServiceAccount *)self isPrimaryAccount],
    [(MBServiceAccount *)self isEnabled],
    [(MBServiceAccount *)self isEnabledForBackup],
  char v9 = self->_options);

  return v9;
}

- (void)updateAppleAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "Updating Apple Account", buf, 2u);
    _MBLog();
  }

  if ([(MBServiceAccount *)self hasAppleAccount])
  {
    id v6 = [(id)objc_opt_class() accountsQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_13AF4;
    v7[3] = &unk_28DB0;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(v6, v7);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)updateAppleAccountSync
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_13FD4;
  id v14 = sub_13FE4;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_13FEC;
  v6[3] = &unk_28DD8;
  id v8 = &v10;
  char v9 = v16;
  uint64_t v3 = dispatch_semaphore_create(0);
  id v7 = v3;
  [(MBServiceAccount *)self updateAppleAccount:v6];
  MBSemaphoreWaitForever();
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v16, 8);

  return v4;
}

- (id)appleID
{
  if ([(MBServiceAccount *)self hasAppleAccount])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = sub_13FD4;
    id v11 = sub_13FE4;
    id v12 = 0;
    uint64_t v3 = [(id)objc_opt_class() accountsQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1418C;
    v6[3] = &unk_28E00;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateApplePassword:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MBServiceAccount *)self hasAppleAccount])
  {
    id v8 = [(id)objc_opt_class() accountsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_14354;
    block[3] = &unk_28E50;
    void block[4] = self;
    id v11 = v7;
    id v10 = v6;
    dispatch_sync(v8, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)updateApplePasswordSync:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_13FD4;
  id v16 = sub_13FE4;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_148A8;
  v8[3] = &unk_28DD8;
  id v10 = &v12;
  id v11 = v18;
  unsigned int v5 = dispatch_semaphore_create(0);
  uint64_t v9 = v5;
  [(MBServiceAccount *)self updateApplePassword:v4 completionHandler:v8];
  MBSemaphoreWaitForever();
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);

  return v6;
}

- (BOOL)verifyAppleAccountCredentialsWithContext:(BOOL)a3
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Verifying account credentials", buf, 2u);
    _MBLog();
  }

  unsigned int v5 = objc_opt_new();
  id v6 = [(MBServiceAccount *)self appleID];
  [v5 setUsername:v6];

  [v5 setIsUsernameEditable:0];
  [v5 setServiceType:1];
  [v5 _setProxyingForApp:1];
  [v5 _setProxiedAppBundleID:@"com.apple.purplebuddy"];
  id v7 = MBLocalizedStringFromTable();
  [v5 setReason:v7];

  id v8 = objc_opt_new();
  *(void *)buf = 0;
  __int16 v28 = buf;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_13FD4;
  BOOL v31 = sub_13FE4;
  id v32 = 0;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unsigned int v24 = sub_13FD4;
  unsigned int v25 = sub_13FE4;
  id v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_14D70;
  v17[3] = &unk_28E78;
  char v19 = buf;
  id v20 = &v21;
  uint64_t v9 = dispatch_semaphore_create(0);
  id v18 = v9;
  [v8 authenticateWithContext:v5 completion:v17];
  MBSemaphoreWaitForever();
  if (!*((void *)v28 + 5))
  {
    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v22[5];
      *(_DWORD *)unsigned int v33 = 138412290;
      uint64_t v34 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Account credential verification failed to get password: %@", v33, 0xCu);
      _MBLog();
    }
    goto LABEL_9;
  }
  uint64_t v10 = -[MBServiceAccount updateApplePasswordSync:](self, "updateApplePasswordSync:");
  id v11 = (void *)v22[5];
  v22[5] = v10;

  if (v22[5])
  {
    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = v22[5];
      *(_DWORD *)unsigned int v33 = 138412290;
      uint64_t v34 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Account credential verification failed: %@", v33, 0xCu);
      _MBLog();
    }
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v33 = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Account credential verification succeeded", v33, 2u);
    _MBLog();
  }
  BOOL v15 = 1;
LABEL_13:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)accountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (MBPersona)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSURL)chunkStoreURL
{
  return self->_chunkStoreURL;
}

- (void)setChunkStoreURL:(id)a3
{
}

- (BOOL)useMockChunkStore
{
  return self->_useMockChunkStore;
}

- (void)setUseMockChunkStore:(BOOL)a3
{
  self->_useMockChunkStore = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabledForBackup
{
  return self->_enabledForBackup;
}

- (void)setEnabledForBackup:(BOOL)a3
{
  self->_enabledForBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_chunkStoreURL, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_clientInfoHeader, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end