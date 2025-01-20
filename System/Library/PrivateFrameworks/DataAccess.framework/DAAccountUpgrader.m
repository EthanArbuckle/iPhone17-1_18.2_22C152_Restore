@interface DAAccountUpgrader
+ (void)_moveExchangeCredentialsToAppleAccessGroup;
+ (void)_notifyDaHolidaySubCalAccount;
+ (void)_updateFacebookAccountAuthenticationTypes;
+ (void)_upgradeDAAccounts;
+ (void)upgradeAccounts:(BOOL)a3;
@end

@implementation DAAccountUpgrader

+ (void)_moveExchangeCredentialsToAppleAccessGroup
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
  v31 = (const void *)*MEMORY[0x1E4F3B998];
  v32 = (const void *)*MEMORY[0x1E4F3B978];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B998]);
  key = (void *)*MEMORY[0x1E4F3B550];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.cfnetwork");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BB80], (const void *)*MEMORY[0x1E4F3BB88]);
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching(Mutable, &result);
  if (v4 != -25300 && v4 != 0)
  {
    OSStatus v6 = v4;
    CFAllocatorRef v7 = v2;
    v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v41 = v6;
      _os_log_impl(&dword_1BA384000, v8, v9, "Could not search for Exchange credentials.  %d", buf, 8u);
    }

    CFAllocatorRef v2 = v7;
  }
  CFRelease(Mutable);
  if (result)
  {
    attributesToUpdate = CFDictionaryCreateMutable(v2, 0, 0, 0);
    CFDictionaryAddValue(attributesToUpdate, key, @"apple");
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      CFIndex v13 = 0;
      v14 = (const void *)*MEMORY[0x1E4F3B7C8];
      v15 = (const void *)*MEMORY[0x1E4F3B848];
      v38 = (void *)*MEMORY[0x1E4F3B7B8];
      CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F3B7E8];
      CFTypeRef v34 = (CFTypeRef)*MEMORY[0x1E4F3B7F8];
      v30 = (void *)*MEMORY[0x1E4F3B838];
      os_log_type_t type = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      *(void *)&long long v11 = 67109120;
      long long v28 = v11;
      CFAllocatorRef v33 = v2;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)result, v13);
        Value = CFDictionaryGetValue(ValueAtIndex, v14);
        v18 = CFDictionaryGetValue(ValueAtIndex, v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v18 = 0;
        }
        v19 = CFDictionaryGetValue(ValueAtIndex, v38);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v19 = 0;
        }
        if (Value
          && (CFEqual(Value, cf2) || CFEqual(Value, v34))
          && objc_msgSend(v18, "length", v28)
          && [v19 isEqualToString:@"/Microsoft-Server-ActiveSync"])
        {
          v20 = CFDictionaryCreateMutable(v2, 0, 0, 0);
          CFDictionarySetValue(v20, v32, v31);
          v21 = CFDictionaryGetValue(ValueAtIndex, key);
          CFDictionarySetValue(v20, key, v21);
          v22 = CFDictionaryGetValue(ValueAtIndex, v15);
          CFDictionarySetValue(v20, v15, v22);
          v23 = CFDictionaryGetValue(ValueAtIndex, v14);
          CFDictionarySetValue(v20, v14, v23);
          v24 = CFDictionaryGetValue(ValueAtIndex, v30);
          if (v24) {
            CFDictionarySetValue(v20, v30, v24);
          }
          OSStatus v25 = SecItemUpdate(v20, attributesToUpdate);
          CFAllocatorRef v2 = v33;
          if (v25 != -25300)
          {
            OSStatus v26 = v25;
            if (v25)
            {
              v27 = DALoggingwithCategory();
              if (os_log_type_enabled(v27, type))
              {
                *(_DWORD *)buf = v28;
                OSStatus v41 = v26;
                _os_log_impl(&dword_1BA384000, v27, type, "Could not move Exchange credential to apple keychain access group.  %d", buf, 8u);
              }

              CFAllocatorRef v2 = v33;
            }
          }
          CFRelease(v20);
        }

        ++v13;
      }
      while (v12 != v13);
    }
    CFRelease(attributesToUpdate);
    CFRelease(result);
  }
}

+ (void)_updateFacebookAccountAuthenticationTypes
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = objc_opt_new();
  v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177A0]];
  if (v3)
  {
    OSStatus v4 = [v2 accountsWithAccountType:v3];
    if ([v4 count])
    {
      v23 = v3;
      long long v28 = v2;
      v5 = dispatch_group_create();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obj = v4;
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      uint64_t v26 = v6;
      if (v6)
      {
        uint64_t v25 = *(void *)v36;
        uint64_t v8 = *MEMORY[0x1E4F17A58];
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = v9;
            v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v11 = [v10 childAccounts];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v32 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  v17 = [v16 authenticationType];
                  char v18 = [v17 isEqualToString:v8];

                  if ((v18 & 1) == 0)
                  {
                    [v16 setAuthenticationType:v8];
                    dispatch_group_enter(v5);
                    v19 = DALoggingwithCategory();
                    if (os_log_type_enabled(v19, v7))
                    {
                      v20 = [v16 identifier];
                      *(_DWORD *)buf = 138412290;
                      v40 = v20;
                      _os_log_impl(&dword_1BA384000, v19, v7, "Saving child account %@", buf, 0xCu);
                    }
                    v29[0] = MEMORY[0x1E4F143A8];
                    v29[1] = 3221225472;
                    v29[2] = __62__DAAccountUpgrader__updateFacebookAccountAuthenticationTypes__block_invoke;
                    v29[3] = &unk_1E6211CD0;
                    v29[4] = v16;
                    v30 = v5;
                    [v28 saveVerifiedAccount:v16 withCompletionHandler:v29];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
              }
              while (v13);
            }

            uint64_t v9 = v27 + 1;
          }
          while (v27 + 1 != v26);
          uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v26);
      }
      OSStatus v4 = obj;

      v21 = DALoggingwithCategory();
      if (os_log_type_enabled(v21, v7))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v21, v7, "DAAccountMigrator: Waiting for child accounts to save...", buf, 2u);
      }

      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      CFAllocatorRef v2 = v28;
      v3 = v23;
    }
  }
  else
  {
    OSStatus v4 = DALoggingwithCategory();
    os_log_type_t v22 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v4, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA384000, v4, v22, "Couldn't get a Facebook account type", buf, 2u);
    }
  }
}

void __62__DAAccountUpgrader__updateFacebookAccountAuthenticationTypes__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = DALoggingwithCategory();
  os_log_type_t v7 = v6;
  if (a2)
  {
    os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v6, v8))
    {
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      int v15 = 138412290;
      v16 = v9;
      v10 = "Child account %@ saved";
      long long v11 = v7;
      os_log_type_t v12 = v8;
      uint32_t v13 = 12;
LABEL_6:
      _os_log_impl(&dword_1BA384000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else
  {
    int v14 = *(unsigned __int8 *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, *(os_log_type_t *)(MEMORY[0x1E4F5E9A0] + 3)))
    {
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      v10 = "Child account %@ failed to save: %@";
      long long v11 = v7;
      os_log_type_t v12 = v14;
      uint32_t v13 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)_upgradeDAAccounts
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = DALoggingwithCategory();
  uint64_t v3 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v2, v4, "Upgrading all DataAccess accounts...", buf, 2u);
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  long long v33 = buf;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__4;
  long long v36 = __Block_byref_object_dispose__4;
  id v37 = 0;
  uint64_t v6 = sharedDAAccountStore();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke;
  v29[3] = &unk_1E6211C00;
  long long v31 = buf;
  dispatch_semaphore_t dsema = v5;
  dispatch_semaphore_t v30 = dsema;
  objc_msgSend(v6, "da_loadDAAccountsWithCompletion:", v29);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = [*((id *)v33 + 5) sortedArrayUsingComparator:&__block_literal_global_6];
  os_log_type_t v8 = (void *)*((void *)v33 + 5);
  *((void *)v33 + 5) = v7;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = *((id *)v33 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    os_log_type_t type = *(unsigned char *)(v3 + 3);
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint32_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v14 = DALoggingwithCategory();
        if (os_log_type_enabled(v14, v4))
        {
          *(_WORD *)long long v38 = 0;
          _os_log_impl(&dword_1BA384000, v14, v4, "Calling DAAccount Upgrader to upgrade Accounts", v38, 2u);
        }

        if ([v13 upgradeAccount])
        {
          int v15 = DALoggingwithCategory();
          if (os_log_type_enabled(v15, v4))
          {
            id v16 = [v13 accountDescription];
            __int16 v17 = [v13 publicDescription];
            *(_DWORD *)long long v38 = 138412546;
            id v39 = v16;
            __int16 v40 = 2114;
            id v41 = v17;
            _os_log_impl(&dword_1BA384000, v15, v4, "Account \"%@\" (%{public}@) was upgraded. Saving account.", v38, 0x16u);
          }
          id v24 = 0;
          char v18 = [v13 saveAccountPropertiesWithError:&v24];
          id v19 = v24;
          if ((v18 & 1) == 0)
          {
            v20 = DALoggingwithCategory();
            if (os_log_type_enabled(v20, type))
            {
              v21 = [v13 accountID];
              *(_DWORD *)long long v38 = 138543618;
              id v39 = v21;
              __int16 v40 = 2112;
              id v41 = v19;
              _os_log_impl(&dword_1BA384000, v20, type, "Error saving account %{public}@: %@", v38, 0x16u);
            }
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v42 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

void __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 conformsToProtocol:&unk_1F13F4918];
  unsigned int v6 = [v4 conformsToProtocol:&unk_1F13F4918];

  if (v5 ^ 1 | v6) {
    return v5 ^ v6;
  }
  else {
    return -1;
  }
}

+ (void)_notifyDaHolidaySubCalAccount
{
  CFAllocatorRef v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BA384000, v2, v3, "DAD: DataAccess Migrator sending notification: com.apple.dataaccess.checkHolidayCalendarAccount", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.dataaccess.checkHolidayCalendarAccount", 0, 0, 1u);
}

+ (void)upgradeAccounts:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = DALoggingwithCategory();
  uint64_t v6 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v5, v7))
  {
    *(_WORD *)__int16 v17 = 0;
    _os_log_impl(&dword_1BA384000, v5, v7, "DAD: DataAccess Migrator Request For Performing Asynchronous Data Migration", v17, 2u);
  }

  if (v3)
  {
    os_log_type_t v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(v6 + 6);
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_1BA384000, v8, v9, "DAAccountMigrator: Starting Exchange Credential Move to Apple Access Group", v17, 2u);
    }

    [a1 _moveExchangeCredentialsToAppleAccessGroup];
    uint64_t v10 = DALoggingwithCategory();
    if (os_log_type_enabled(v10, v9))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_1BA384000, v10, v9, "DAAccountMigrator: Starting Update Facebook Authentication types.", v17, 2u);
    }

    [a1 _updateFacebookAccountAuthenticationTypes];
    uint64_t v11 = DALoggingwithCategory();
    if (os_log_type_enabled(v11, v9))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_1BA384000, v11, v9, "DAAccountMigrator: Starting Upgrade DAAccount types.", v17, 2u);
    }

    [a1 _upgradeDAAccounts];
    os_log_type_t v12 = DALoggingwithCategory();
    if (os_log_type_enabled(v12, v9))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_1BA384000, v12, v9, "DAAccountMigrator: Writing Device specificID.", v17, 2u);
    }

    [a1 _writeDeviceSpecificID];
  }
  else
  {
    uint32_t v13 = DALoggingwithCategory();
    if (os_log_type_enabled(v13, v7))
    {
      *(_WORD *)__int16 v17 = 0;
      _os_log_impl(&dword_1BA384000, v13, v7, "DAD: DataAccess Migrator skipped several tasks because user logs in for the first time.", v17, 2u);
    }

    os_log_type_t v9 = *(unsigned char *)(v6 + 6);
  }
  int v14 = DALoggingwithCategory();
  if (os_log_type_enabled(v14, v9))
  {
    *(_WORD *)__int16 v17 = 0;
    _os_log_impl(&dword_1BA384000, v14, v9, "DAAccountMigrator: Posting HolidaySubCal Account Check Notification.", v17, 2u);
  }

  [a1 _notifyDaHolidaySubCalAccount];
  int v15 = DALoggingwithCategory();
  if (os_log_type_enabled(v15, v9))
  {
    *(_WORD *)__int16 v17 = 0;
    _os_log_impl(&dword_1BA384000, v15, v9, "DAAccountMigrator: Updating migration Version.", v17, 2u);
  }

  DAUpdateMigrationVersion();
  id v16 = DALoggingwithCategory();
  if (os_log_type_enabled(v16, v9))
  {
    *(_WORD *)__int16 v17 = 0;
    _os_log_impl(&dword_1BA384000, v16, v9, "DAAccountMigrator: Finished Migrator For dataaccess..returning YES/Success.", v17, 2u);
  }
}

@end