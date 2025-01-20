@interface ACAccountsMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_oldAccountsPlistPath;
- (id)dataClassName;
- (void)_migrateOutdatedKeychainItems;
- (void)_removeAccountsPlist;
- (void)_removeMultipleTencentWeiboAccounts;
- (void)_runAccountMigrationPlugins;
- (void)_scheduleBackupIfNonexistent;
- (void)removeObsoleteAccountsFromStore:(id)a3;
@end

@implementation ACAccountsMigrator

- (id)dataClassName
{
  return @"acaccounts";
}

- (BOOL)performMigration
{
  CFPreferencesSetAppValue(@"iToolsMember", 0, kCFPreferencesAnyApplication);
  CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "\"Migrations are done! Removing accountsettings.plist.\"", buf, 2u);
  }

  [(ACAccountsMigrator *)self _removeAccountsPlist];
  [(ACAccountsMigrator *)self _removeMultipleTencentWeiboAccounts];
  [(ACAccountsMigrator *)self _migrateOutdatedKeychainItems];
  [(ACAccountsMigrator *)self _scheduleBackupIfNonexistent];
  if (+[ACAccountMigrationState migrationFinishedForKey:@"LastAccountMigrationPluginsRunVersion"])
  {
    v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "\"Migration plugin run should only happen once per version to be safe!\"", v6, 2u);
    }
  }
  else
  {
    +[ACAccountMigrationState writeMigrationVersionPrefForKey:@"LastAccountMigrationPluginsRunVersion"];
    [(ACAccountsMigrator *)self _runAccountMigrationPlugins];
  }
  return 1;
}

- (void)_removeAccountsPlist
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(ACAccountsMigrator *)self _oldAccountsPlistPath];
  if ([v3 fileExistsAtPath:v4 isDirectory:0])
  {
    id v8 = 0;
    unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v8];
    v6 = v8;
    if ((v5 & 1) == 0)
    {
      v7 = _ACLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_2EE4((uint64_t)v4, (uint64_t)v6, v7);
      }
    }
  }
  else
  {
    v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "\"The legacy accounts plist could not be found at: %@\"", buf, 0xCu);
    }
  }
}

- (id)_oldAccountsPlistPath
{
  v2 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();

  return v2;
}

- (void)_removeMultipleTencentWeiboAccounts
{
  v2 = +[ACAccountStore defaultStore];
  v3 = [v2 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTencentWeiboDeprecated];
  id v4 = [v2 accountsWithAccountType:v3];

  if ((unint64_t)[v4 count] >= 2)
  {
    unsigned __int8 v5 = objc_msgSend(v4, "subarrayWithRange:", 1, (char *)objc_msgSend(v4, "count") - 1);

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v5;
    id v7 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v10);
          v12 = _ACLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "\"Removing account %@ because we only support a single Tencent Weibo account\"", buf, 0xCu);
          }

          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_21B4;
          v16[3] = &unk_4198;
          v13 = v6;
          v17 = v13;
          [v2 removeAccount:v11 withCompletionHandler:v16];
          dispatch_time_t v14 = dispatch_time(0, 2000000000);
          if (dispatch_semaphore_wait(v13, v14))
          {
            v15 = _ACLogSystem();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v23 = v11;
              _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "\"Timed out removing %@\"", buf, 0xCu);
            }
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }
  }
}

- (void)_migrateOutdatedKeychainItems
{
  v2 = +[ACAccountStore defaultStore];
  v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "\"Attempting to migrate all keychain items if necessary.\"", buf, 2u);
  }

  id v8 = 0;
  unsigned int v4 = [v2 triggerKeychainMigrationIfNecessary:&v8];
  id v5 = v8;
  dispatch_semaphore_t v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "\"Keychain migration finished with success %@, error: %@\"", buf, 0x16u);
  }
}

- (void)removeObsoleteAccountsFromStore:(id)a3
{
  id v3 = a3;
  v43[0] = ACAccountTypeIdentifierTwitterDeprecated;
  v43[1] = ACAccountTypeIdentifierFacebookDeprecated;
  v43[2] = ACAccountTypeIdentifierSinaWeiboDeprecated;
  v43[3] = ACAccountTypeIdentifierTencentWeiboDeprecated;
  v43[4] = ACAccountTypeIdentifierFlickr;
  v43[5] = ACAccountTypeIdentifierVimeo;
  uint64_t v4 = +[NSArray arrayWithObjects:v43 count:6];
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete accounts with type identifiers %@\"", buf, 0xCu);
  }

  id v37 = 0;
  v24 = (void *)v4;
  dispatch_semaphore_t v6 = [v3 accountsWithAccountTypeIdentifiers:v4 error:&v37];
  id v7 = v37;
  id v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v40 = (uint64_t)v6;
    __int16 v41 = 2112;
    id v42 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "\"Fetched obsolete accounts %@ error %@\"", buf, 0x16u);
  }
  uint64_t v23 = v7;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v26 = *(void *)v34;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
        id v32 = 0;
        v13 = objc_msgSend(v3, "dataclassActionsForAccountDeletion:error:", v12, &v32, v23);
        id v14 = v32;
        v15 = _ACLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = (uint64_t)v12;
          __int16 v41 = 2112;
          id v42 = v13;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "\"Gathered account %@ potential dataclass actions for deletion %@\"", buf, 0x16u);
        }

        id v16 = objc_alloc_init((Class)NSMutableDictionary);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_28D0;
        v29[3] = &unk_41C0;
        id v17 = v16;
        id v30 = v17;
        v31 = v12;
        [v13 enumerateKeysAndObjectsUsingBlock:v29];
        long long v18 = _ACLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = (uint64_t)v12;
          __int16 v41 = 2112;
          id v42 = v17;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete account %@ with dataclass actions %@\"", buf, 0x16u);
        }

        dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_2A44;
        v27[3] = &unk_41E8;
        v27[4] = v12;
        long long v20 = v19;
        v28 = v20;
        [v3 removeAccount:v12 withDataclassActions:v17 completion:v27];
        dispatch_time_t v21 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v20, v21))
        {
          v22 = _ACLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = (uint64_t)v12;
            _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "\"Timed out removing %@\"", buf, 0xCu);
          }
        }
        __int16 v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }
}

- (void)_scheduleBackupIfNonexistent
{
  v2 = +[ACAccountStore defaultStore];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2C40;
  v6[3] = &unk_4198;
  id v3 = dispatch_semaphore_create(0);
  id v7 = v3;
  [v2 scheduleBackupIfNonexistent:v6];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    id v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2FD8(v5);
    }
  }
}

- (void)_runAccountMigrationPlugins
{
  v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "\"Will run account migration plugins\"", buf, 2u);
  }

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  dispatch_time_t v4 = +[ACAccountStore defaultStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2DC8;
  v9[3] = &unk_4198;
  id v5 = v3;
  id v10 = v5;
  [v4 runAccountMigrationPlugins:v9];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_301C(v7);
    }
  }
  id v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "\"Ran account migration plugins\"", buf, 2u);
  }
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

@end