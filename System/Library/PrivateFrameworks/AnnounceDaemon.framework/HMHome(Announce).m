@interface HMHome(Announce)
- (BOOL)isAnnounceEnabledForAnyAccessory;
- (BOOL)isAnnounceEnabledForAnyAccessoryOrUser;
- (BOOL)isAnnounceSupported;
- (id)_homePodsSupportingAnnounceIncludingCurrentAccessory:()Announce;
- (id)_homePodsWithAnnounceEnabledIncludingCurrentAccessory:()Announce;
- (id)_usersWithAnnounceEnabledIncludingCurrentUser:()Announce;
- (id)usersIncludingCurrentUserWithAnnounceAndRemoteAccessEnabled;
- (uint64_t)an_announceNotificationsEnabledForCurrentUserWithOverrideHomeLocationStatus:()Announce;
- (uint64_t)announceAccessAllowedForCurrentUser;
- (uint64_t)announceAccessAllowedForUser:()Announce;
- (uint64_t)homePodsIncludingCurrentAccessorySupportingAnnounce;
- (uint64_t)homePodsIncludingCurrentAccessoryWithAnnounceEnabled;
- (uint64_t)isAnnounceAvailable;
- (uint64_t)usersIncludingCurrentUserWithAnnounceEnabled;
- (uint64_t)usersWithAnnounceEnabled;
@end

@implementation HMHome(Announce)

- (BOOL)isAnnounceSupported
{
  v1 = [a1 homePodsIncludingCurrentAccessorySupportingAnnounce];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)isAnnounceAvailable
{
  BOOL v2 = +[ANHomeManager shared];
  v3 = [v2 currentAccessory];

  if (!v3) {
    goto LABEL_5;
  }
  v4 = [v3 home];
  v5 = [v4 uniqueIdentifier];
  v6 = [a1 uniqueIdentifier];
  int v7 = [v5 isEqual:v6];

  if (!v7)
  {
LABEL_5:
    if (![a1 announceAccessAllowedForCurrentUser]) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v8 = [a1 isAnnounceEnabledForAnyAccessoryOrUser];
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "an_isAnnounceEnabled")) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isAnnounceEnabledForAnyAccessory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ANHomeManager shared];
  v3 = [v2 currentAccessory];

  if (!v3) {
    goto LABEL_4;
  }
  v4 = [v3 home];
  v5 = [v4 uniqueIdentifier];
  v6 = [a1 uniqueIdentifier];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F2E4F8];
    v9 = [a1 accessories];
    v10 = [v8 announceAccessoriesWithAnnounceEnabledFromAccessories:v9];

    v11 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hmu_accessoriesExcludingCurrentAccessoryFromAccessories:", v10);
    v12 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hmu_accessoriesFromAccessories:excludingStereoCompanionForAccessory:", v11, v3);
  }
  else
  {
LABEL_4:
    v13 = (void *)MEMORY[0x1E4F2E4F8];
    v10 = [a1 accessories];
    v12 = [v13 announceAccessoriesWithAnnounceEnabledFromAccessories:v10];
  }

  v14 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v12 count];
    uint64_t v16 = [v12 count];
    v17 = "ies";
    v21 = &stru_1F34A0E10;
    int v20 = 138412802;
    if (v16 == 1) {
      v17 = "y";
    }
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    __int16 v24 = 2080;
    v25 = v17;
    _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%@%lu accessor%s with announce enabled", (uint8_t *)&v20, 0x20u);
  }

  BOOL v18 = [v12 count] != 0;
  return v18;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryOrUser
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ANHomeManager shared];
  v3 = [v2 currentAccessory];

  if (!v3) {
    goto LABEL_4;
  }
  v4 = [v3 home];
  v5 = [v4 uniqueIdentifier];
  v6 = [a1 uniqueIdentifier];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F2E4F8];
    v9 = [a1 accessories];
    v10 = [v8 announceAccessoriesWithAnnounceEnabledFromAccessories:v9];

    v11 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hmu_accessoriesExcludingCurrentAccessoryFromAccessories:", v10);
    v12 = objc_msgSend(MEMORY[0x1E4F2E4F8], "hmu_accessoriesFromAccessories:excludingStereoCompanionForAccessory:", v11, v3);
    v13 = [a1 usersIncludingCurrentUserWithAnnounceEnabled];
  }
  else
  {
LABEL_4:
    v14 = (void *)MEMORY[0x1E4F2E4F8];
    uint64_t v15 = [a1 accessories];
    v12 = [v14 announceAccessoriesWithAnnounceEnabledFromAccessories:v15];

    v13 = [a1 usersWithAnnounceEnabled];
  }
  uint64_t v16 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v12 count];
    if ([v12 count] == 1) {
      BOOL v18 = "y";
    }
    else {
      BOOL v18 = "ies";
    }
    uint64_t v19 = [v13 count];
    uint64_t v20 = [v13 count];
    int v24 = 138413314;
    v25 = &stru_1F34A0E10;
    v21 = "s";
    uint64_t v27 = v17;
    __int16 v26 = 2048;
    __int16 v28 = 2080;
    if (v20 == 1) {
      v21 = "";
    }
    v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    __int16 v32 = 2080;
    v33 = v21;
    _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@%lu accessor%s with announce enabled.  %ld user%s with announce enabled", (uint8_t *)&v24, 0x34u);
  }

  if ([v12 count]) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = [v13 count] != 0;
  }

  return v22;
}

- (uint64_t)announceAccessAllowedForCurrentUser
{
  BOOL v2 = [a1 currentUser];
  uint64_t v3 = [a1 announceAccessAllowedForUser:v2];

  return v3;
}

- (uint64_t)announceAccessAllowedForUser:()Announce
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 homeAccessControlForUser:v4];
  uint64_t v6 = [v5 isAnnounceAccessAllowed];

  int v7 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    v9 = [v4 uniqueIdentifier];
    v10 = [NSNumber numberWithBool:v6];
    int v18 = 138413058;
    uint64_t v19 = &stru_1F34A0E10;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Announce Access Allowed For User (Name = %@, ID = %@): %@", (uint8_t *)&v18, 0x2Au);
  }
  v11 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  uint64_t v12 = [v11 BOOLForDefault:*MEMORY[0x1E4F4A638]];

  if (v12)
  {
    v13 = ANLogHandleHome_Announce();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v4 name];
      uint64_t v15 = [v4 uniqueIdentifier];
      int v18 = 138412802;
      uint64_t v19 = &stru_1F34A0E10;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      uint64_t v16 = "%@[Override] Force Allow Announce For User (Name = %@, ID = %@) Enabled";
LABEL_10:
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    v13 = ANLogHandleHome_Announce();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v4 name];
      uint64_t v15 = [v4 uniqueIdentifier];
      int v18 = 138412802;
      uint64_t v19 = &stru_1F34A0E10;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      uint64_t v16 = "%@Announce is DISABLED For User (Name = %@, ID = %@)";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = 1;
LABEL_12:

  return v12;
}

- (uint64_t)usersIncludingCurrentUserWithAnnounceEnabled
{
  return [a1 _usersWithAnnounceEnabledIncludingCurrentUser:1];
}

- (uint64_t)usersWithAnnounceEnabled
{
  return [a1 _usersWithAnnounceEnabledIncludingCurrentUser:0];
}

- (id)usersIncludingCurrentUserWithAnnounceAndRemoteAccessEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([a1 announceAccessAllowedForUser:v8]
          && objc_msgSend(a1, "hmu_isRemoteAccessAllowedForUser:", v8))
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (uint64_t)homePodsIncludingCurrentAccessorySupportingAnnounce
{
  return [a1 _homePodsSupportingAnnounceIncludingCurrentAccessory:1];
}

- (uint64_t)homePodsIncludingCurrentAccessoryWithAnnounceEnabled
{
  return [a1 _homePodsWithAnnounceEnabledIncludingCurrentAccessory:1];
}

- (uint64_t)an_announceNotificationsEnabledForCurrentUserWithOverrideHomeLocationStatus:()Announce
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 homeLocationStatus];
  uint64_t v6 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138413058;
    uint64_t v17 = &stru_1F34A0E10;
    __int16 v18 = 2048;
    uint64_t v19 = (uint64_t)a3;
    __int16 v20 = 2048;
    uint64_t v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = a1;
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Override Home Location Status: %ld, Current Home Location Status: %ld, Home: %@", (uint8_t *)&v16, 0x2Au);
  }

  int v7 = [a1 currentUser];
  uint64_t v8 = [v7 announceUserSettings];
  uint64_t v9 = [v8 deviceNotificationMode];

  long long v10 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = &stru_1F34A0E10;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Current User Announce Notification Mode: %ld", (uint8_t *)&v16, 0x16u);
  }

  long long v11 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v12 = [v11 BOOLForDefault:*MEMORY[0x1E4F4A640]];

  if (v12)
  {
    long long v13 = ANLogHandleHome_Announce();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@[Override] Force Announce Notifications Enabled", (uint8_t *)&v16, 0xCu);
    }

    return 1;
  }
  if (v9 == 3) {
    return 1;
  }
  if (v9 != 2) {
    return 0;
  }
  uint64_t result = 1;
  if (a3 != (void *)1 && v5 != 1)
  {
    uint64_t v15 = ANLogHandleHome_Announce();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      uint64_t v17 = &stru_1F34A0E10;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)a1;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_ERROR, "%@Current User is not in Home %@ (Current Home Location Status = %ld). Not posting user notification.", (uint8_t *)&v16, 0x20u);
    }

    return 0;
  }
  return result;
}

- (id)_usersWithAnnounceEnabledIncludingCurrentUser:()Announce
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3) {
    objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  }
  else {
  uint64_t v5 = [a1 users];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HMHome_Announce___usersWithAnnounceEnabledIncludingCurrentUser___block_invoke;
  v12[3] = &unk_1E6BCE678;
  v12[4] = a1;
  uint64_t v6 = objc_msgSend(v5, "na_filter:", v12);
  int v7 = ANLogHandleHome_Announce();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    if (a3) {
      uint64_t v9 = " (including current user)";
    }
    else {
      uint64_t v9 = "";
    }
    uint64_t v10 = [v6 count];
    *(_DWORD *)buf = 138413058;
    v14 = &stru_1F34A0E10;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_INFO, "%@Home has %ld users%s, %ld have intercom enabled", buf, 0x2Au);
  }

  return v6;
}

- (id)_homePodsWithAnnounceEnabledIncludingCurrentAccessory:()Announce
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3) {
    objc_msgSend(a1, "hmu_homePodsIncludingCurrentAccessoryDictionary");
  }
  else {
  uint64_t v3 = objc_msgSend(a1, "hmu_homePodsDictionary");
  }
  uint64_t v4 = [v3 allValues];

  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "an_supportsAnnounce", (void)v13)
          && objc_msgSend(v11, "an_isAnnounceEnabled"))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_homePodsSupportingAnnounceIncludingCurrentAccessory:()Announce
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3) {
    objc_msgSend(a1, "hmu_homePodsIncludingCurrentAccessoryDictionary");
  }
  else {
  uint64_t v3 = objc_msgSend(a1, "hmu_homePodsDictionary");
  }
  uint64_t v4 = [v3 allValues];

  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "an_supportsAnnounce", (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

@end