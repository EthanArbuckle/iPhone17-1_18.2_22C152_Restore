@interface IMBackgroundMessagingAPIDataAccess
+ (id)appBundleIDs;
+ (id)recipientsForBundleID:(id)a3;
+ (id)recipientsForBundleIDFromPreferences:(id)a3;
+ (unint64_t)numberOfAppsUsingBackgroundMessaging;
+ (void)deleteAllData;
+ (void)resetStorageIfNeeded;
+ (void)saveAppBundleIDs:(id)a3;
+ (void)saveRecipients:(id)a3 forBundleID:(id)a4;
+ (void)saveRecipientsToPreferences:(id)a3 forBundleID:(id)a4;
+ (void)toggleEnablement:(BOOL)a3 forRecipient:(id)a4 inAppBundleID:(id)a5;
@end

@implementation IMBackgroundMessagingAPIDataAccess

+ (void)deleteAllData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [a1 appBundleIDs];
  CFPreferencesSetAppValue(@"ApprovedApps", 0, @"com.apple.messages.critical-messaging.storage");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v8 + 1) + 8 * v7++), 0, @"com.apple.messages.critical-messaging.storage");
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  CFPreferencesAppSynchronize(@"com.apple.messages.critical-messaging.storage");
}

+ (void)resetStorageIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)CFPreferencesCopyAppValue(@"StorageVersion", @"com.apple.messages.critical-messaging.storage");
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      long long v8 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "storageVersion %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (int)[v3 intValue] <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Deleting all data", (uint8_t *)&v7, 2u);
      }
    }
    [a1 deleteAllData];
    uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithInt:1];
    CFPreferencesSetAppValue(@"StorageVersion", v6, @"com.apple.messages.critical-messaging.storage");
    CFPreferencesAppSynchronize(@"com.apple.messages.critical-messaging.storage");
  }
}

+ (unint64_t)numberOfAppsUsingBackgroundMessaging
{
  v2 = +[IMBackgroundMessagingAPIDataAccess appBundleIDs];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 count];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)appBundleIDs
{
  v2 = (void *)CFPreferencesCopyAppValue(@"ApprovedApps", @"com.apple.messages.critical-messaging.storage");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Failed to parse appBundleIDs", v6, 2u);
      }
    }
    id v3 = 0;
  }

  return v3;
}

+ (void)saveAppBundleIDs:(id)a3
{
  CFPreferencesSetAppValue(@"ApprovedApps", a3, @"com.apple.messages.critical-messaging.storage");

  CFPreferencesAppSynchronize(@"com.apple.messages.critical-messaging.storage");
}

+ (id)recipientsForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 recipientsForBundleIDFromPreferences:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [v3 objectForKey:v9];
        long long v11 = [v10 objectForKey:@"DisplayNameKey"];
        v12 = [v10 objectForKey:@"AuthorizationStatusKey"];
        uint64_t v13 = objc_alloc_init(IMBackgroundMessageRecipient);
        [(IMBackgroundMessageRecipient *)v13 setPhoneNumber:v9];
        [(IMBackgroundMessageRecipient *)v13 setDisplayName:v11];
        [v4 setObject:v12 forKey:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)recipientsForBundleIDFromPreferences:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = (void *)CFPreferencesCopyAppValue(v3, @"com.apple.messages.critical-messaging.storage");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v8 = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Failed to parse appBundleIDs", v8, 2u);
      }
    }
    id v5 = 0;
  }

  return v5;
}

+ (void)saveRecipientsToPreferences:(id)a3 forBundleID:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.messages.critical-messaging.storage");

  CFPreferencesAppSynchronize(@"com.apple.messages.critical-messaging.storage");
}

+ (void)saveRecipients:(id)a3 forBundleID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = a4;
  uint64_t v21 = +[IMBackgroundMessagingAPIDataAccess appBundleIDs];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1A083F12C;
  v27[3] = &unk_1E5A13758;
  id v20 = v5;
  id v28 = v20;
  v29 = &v30;
  [v21 enumerateObjectsUsingBlock:v27];
  if (!*((unsigned char *)v31 + 24))
  {
    if (v21) {
      id v6 = (id)[v21 mutableCopy];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v7 = v6;
    [v6 addObject:v20];
    +[IMBackgroundMessagingAPIDataAccess saveAppBundleIDs:v7];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v22 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v34[0] = @"AuthorizationStatusKey";
        v14 = [v22 objectForKey:v13];
        v34[1] = @"DisplayNameKey";
        v35[0] = v14;
        uint64_t v15 = [v13 displayName];
        long long v16 = (void *)v15;
        long long v17 = &stru_1EF2CAD28;
        if (v15) {
          long long v17 = (__CFString *)v15;
        }
        v35[1] = v17;
        long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

        long long v19 = [v13 phoneNumber];
        [v8 setObject:v18 forKey:v19];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v10);
  }

  +[IMBackgroundMessagingAPIDataAccess saveRecipientsToPreferences:v8 forBundleID:v20];
  _Block_object_dispose(&v30, 8);
}

+ (void)toggleEnablement:(BOOL)a3 forRecipient:(id)a4 inAppBundleID:(id)a5
{
  BOOL v6 = a3;
  id v17 = a4;
  id v8 = a5;
  uint64_t v9 = [a1 recipientsForBundleIDFromPreferences:v8];
  if (v9)
  {
    uint64_t v10 = [v17 phoneNumber];
    uint64_t v11 = [v9 objectForKey:v10];

    if (v11)
    {
      if (v6) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      uint64_t v13 = [NSNumber numberWithInt:v12];
      v14 = (void *)[v11 mutableCopy];
      [v14 setObject:v13 forKey:@"AuthorizationStatusKey"];
      uint64_t v15 = (void *)[v9 mutableCopy];
      long long v16 = [v17 phoneNumber];
      [v15 setObject:v14 forKey:v16];

      +[IMBackgroundMessagingAPIDataAccess saveRecipientsToPreferences:v15 forBundleID:v8];
    }
  }
}

@end