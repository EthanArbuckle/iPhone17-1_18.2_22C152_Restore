@interface MFPreferencesURL
+ (id)_accountInfoSettingsURLForAccount:(id)a3 preferenceURLType:(int64_t)a4;
+ (id)_pathComponentsForAccount:(id)a3 preferenceURLType:(int64_t)a4;
+ (id)_urlForRoot:(id)a3 pathComponents:(id)a4;
+ (id)accountInfoURLForAccount:(id)a3;
+ (id)accountURLForAccount:(id)a3;
+ (id)addAccountURL;
+ (id)advancedAccountInfoURLForAccount:(id)a3;
+ (id)blockedSenderURL;
+ (id)customizeNotificationURL;
+ (id)hideMyEmailURL;
+ (id)storageManagementURL;
+ (id)vipSenderListURL;
@end

@implementation MFPreferencesURL

+ (id)accountURLForAccount:(id)a3
{
  v3 = [a1 _accountInfoSettingsURLForAccount:a3 preferenceURLType:0];

  return v3;
}

+ (id)accountInfoURLForAccount:(id)a3
{
  v3 = [a1 _accountInfoSettingsURLForAccount:a3 preferenceURLType:1];

  return v3;
}

+ (id)advancedAccountInfoURLForAccount:(id)a3
{
  v3 = [a1 _accountInfoSettingsURLForAccount:a3 preferenceURLType:2];

  return v3;
}

+ (id)addAccountURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"ADD_ACCOUNT";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"ACCOUNTS_AND_PASSWORDS" pathComponents:v3];

  return v4;
}

+ (id)storageManagementURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"STORAGE_MGMT";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"General" pathComponents:v3];

  return v4;
}

+ (id)vipSenderListURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"com.apple.mobilemail/custom/com.apple.mobilemail.bulletin-subsection.VIP";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"NOTIFICATIONS_ID" pathComponents:v3];

  return v4;
}

+ (id)customizeNotificationURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"com.apple.mobilemail/custom";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"NOTIFICATIONS_ID" pathComponents:v3];

  return v4;
}

+ (id)blockedSenderURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Blocked";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"MAIL" pathComponents:v3];

  return v4;
}

+ (id)hideMyEmailURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [a1 _urlForRoot:@"APPLE_ACCOUNT" pathComponents:v3];

  return v4;
}

+ (id)_urlForRoot:(id)a3 pathComponents:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F290C8];
  v8 = [v6 componentsJoinedByString:@"/"];
  v9 = [v7 queryItemWithName:@"path" value:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v10 setScheme:@"prefs"];
  v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"root" value:v5];
  v16[0] = v11;
  v16[1] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v10 setQueryItems:v12];

  v13 = [v10 query];
  [v10 setPath:v13];

  [v10 setQuery:0];
  v14 = [v10 URL];

  return v14;
}

+ (id)_pathComponentsForAccount:(id)a3 preferenceURLType:(int64_t)a4
{
  int64_t v34 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 mailAccountIfAvailable];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F60DF0] pairWithFirst:v5 second:0];

      if (v6)
      {
        v7 = 0;
        goto LABEL_27;
      }
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E4F77C70], "mailAccounts", v34);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    v7 = 0;
    uint64_t v10 = *(void *)v37;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
        if ([v12 isEqual:v4])
        {
          id v13 = 0;
          v12 = v4;
        }
        else
        {
          v14 = [v12 deliveryAccount];
          int v15 = [v14 isEqual:v4];

          if (!v15)
          {
            if (!v7)
            {
              v16 = [v12 deliveryAccountAlternates];
              int v17 = [v16 containsObject:v4];

              if (v17)
              {
                v7 = [MEMORY[0x1E4F60DF0] pairWithFirst:v12 second:v4];
              }
              else
              {
                v7 = 0;
              }
            }
            goto LABEL_17;
          }
          if ([v12 derivesDeliveryAccountInfoFromMailAccount]) {
            id v13 = 0;
          }
          else {
            id v13 = v4;
          }
        }
        id v6 = [MEMORY[0x1E4F60DF0] pairWithFirst:v12 second:v13];
        if (v6) {
          goto LABEL_26;
        }
LABEL_17:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v18 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      uint64_t v9 = v18;
      if (!v18)
      {
        id v6 = 0;
        goto LABEL_26;
      }
    }
  }
  id v6 = 0;
  v7 = 0;
LABEL_26:

LABEL_27:
  if (v6) {
    v19 = v6;
  }
  else {
    v19 = v7;
  }
  id v20 = v19;
  v21 = [v20 first];
  v35 = [v20 second];
  v22 = [v21 parentAccount];
  v23 = [v22 identifier];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [v21 identifier];
  }
  v26 = v25;

  v27 = [v35 identifier];
  if (v26)
  {
    v28 = (void *)MEMORY[0x1E4F1CA48];
    v40 = v26;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v30 = [v28 arrayWithArray:v29];

    if ((unint64_t)(v34 - 1) <= 1) {
      [v30 addObject:@"ACCOUNT_INFO"];
    }
    if (v34 != 2 && v27)
    {
      [v30 addObject:@"SMTP_INFORMATION_KEY"];
      v31 = v27;
LABEL_42:
      objc_msgSend(v30, "addObject:", v31, v34);
      goto LABEL_43;
    }
    if (v34 == 2)
    {
      v31 = @"ADVANCED_SPECIFIER_KEY";
      goto LABEL_42;
    }
  }
  else
  {
    v30 = 0;
  }
LABEL_43:
  id v32 = v30;

  return v32;
}

+ (id)_accountInfoSettingsURLForAccount:(id)a3 preferenceURLType:(int64_t)a4
{
  id v5 = [a1 _pathComponentsForAccount:a3 preferenceURLType:a4];
  if (v5)
  {
    id v6 = [a1 _urlForRoot:@"ACCOUNTS_AND_PASSWORDS" pathComponents:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end