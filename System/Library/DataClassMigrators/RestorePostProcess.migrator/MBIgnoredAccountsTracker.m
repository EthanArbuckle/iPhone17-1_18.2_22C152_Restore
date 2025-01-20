@interface MBIgnoredAccountsTracker
+ (BOOL)_isEnterpriseAccount:(id)a3;
- (BOOL)addAccountWithDSID:(id)a3;
- (BOOL)isIgnoredAppleID:(id)a3;
- (MBIgnoredAccountsTracker)init;
@end

@implementation MBIgnoredAccountsTracker

- (MBIgnoredAccountsTracker)init
{
  v12.receiver = self;
  v12.super_class = (Class)MBIgnoredAccountsTracker;
  v2 = [(MBIgnoredAccountsTracker *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    allowedDSIDs = v2->_allowedDSIDs;
    v2->_allowedDSIDs = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    ignoredDSIDs = v2->_ignoredDSIDs;
    v2->_ignoredDSIDs = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    ignoredAppleIDs = v2->_ignoredAppleIDs;
    v2->_ignoredAppleIDs = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    allowedAppleIDs = v2->_allowedAppleIDs;
    v2->_allowedAppleIDs = (NSMutableSet *)v9;
  }
  return v2;
}

+ (BOOL)_isEnterpriseAccount:(id)a3
{
  uint64_t v3 = a3;
  if (!v3) {
    sub_19BE8();
  }
  v4 = v3;
  uint64_t v5 = [v3 personaIdentifier];
  if (v5)
  {
    v6 = +[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:v5];
    BOOL v7 = v6 != 0;
    v8 = MBGetDefaultLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543362;
        v13 = v5;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch the persona attributes for persona %{public}@", buf, 0xCu);
        goto LABEL_15;
      }
LABEL_16:

      goto LABEL_17;
    }
    if (v9)
    {
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Fetched the attributes for persona %{public}@: %@", buf, 0x16u);
      _MBLog();
    }

    v10 = [v6 userPersonaUniqueString];
    if (([v5 isEqualToString:v10] & 1) == 0) {
      sub_19C14();
    }

    if ([v6 isEnterprisePersona])
    {
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v5;
        __int16 v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found an enterprise persona (%@) for account %@", buf, 0x16u);
LABEL_15:
        _MBLog();
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "Found nil personaIdentifier for %@", buf, 0xCu);
      _MBLog();
    }
  }
  BOOL v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)addAccountWithDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 isEqualToNumber:&off_2A1C0] & 1) == 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    if ([(NSMutableSet *)v8->_ignoredDSIDs containsObject:v5])
    {
      objc_sync_exit(v8);

      BOOL v6 = 0;
      goto LABEL_4;
    }
    unsigned __int8 v9 = [(NSMutableSet *)v8->_allowedDSIDs containsObject:v5];
    objc_sync_exit(v8);

    if ((v9 & 1) == 0)
    {
      v10 = +[ACAccountStore defaultStore];
      v11 = [v5 stringValue];
      objc_super v12 = objc_msgSend(v10, "aa_appleAccountWithPersonID:", v11);

      if (v12)
      {
        v13 = [v12 username];
        unsigned int v14 = [(id)objc_opt_class() _isEnterpriseAccount:v12];
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          if (v14) {
            v16 = "Ignoring";
          }
          else {
            v16 = "Found";
          }
          v23 = v16;
          __int16 v24 = 2112;
          v25 = v13;
          __int16 v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "%s account: %@/%@", buf, 0x20u);
          v20 = v13;
          v21 = v5;
          v19 = v16;
          _MBLog();
        }

        v17 = v8;
        objc_sync_enter(v17);
        if (v14)
        {
          [(NSMutableSet *)v8->_ignoredDSIDs addObject:v5];
          if (v13) {
            [v17[4] addObject:v13];
          }
          BOOL v6 = 0;
LABEL_24:
          objc_sync_exit(v8);

          goto LABEL_4;
        }
      }
      else
      {
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = (const char *)v5;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "No account found for %@", buf, 0xCu);
          v19 = (const char *)v5;
          _MBLog();
        }

        objc_sync_enter(v8);
        v13 = 0;
      }
      -[NSMutableSet addObject:](v8->_allowedDSIDs, "addObject:", v5, v19, v20, v21);
      if (v13) {
        [(NSMutableSet *)v8->_allowedAppleIDs addObject:v13];
      }
      BOOL v6 = 1;
      goto LABEL_24;
    }
  }
  BOOL v6 = 1;
LABEL_4:

  return v6;
}

- (BOOL)isIgnoredAppleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    unsigned __int8 v6 = [(NSMutableSet *)v5->_ignoredAppleIDs containsObject:v4];
    if ((v6 & 1) == 0) {
      [(NSMutableSet *)v5->_allowedAppleIDs containsObject:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredAppleIDs, 0);
  objc_storeStrong((id *)&self->_allowedAppleIDs, 0);
  objc_storeStrong((id *)&self->_ignoredDSIDs, 0);

  objc_storeStrong((id *)&self->_allowedDSIDs, 0);
}

@end