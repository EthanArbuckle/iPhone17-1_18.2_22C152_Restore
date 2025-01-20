@interface ACAccountStore(AppleIDAuthentication)
- (id)_primaryiCloudAccount;
- (id)aida_AppleIDAuthenticationAccounts;
- (id)aida_accountForAltDSID:()AppleIDAuthentication;
- (id)aida_accountForPrimaryiCloudAccount;
- (id)aida_accountForiCloudAccount:()AppleIDAuthentication;
- (id)aida_iCloudAccountMatchingAppleIDAuthAccount:()AppleIDAuthentication;
- (uint64_t)aida_AppleIDAuthenticationAccountType;
- (uint64_t)aida_renewCredentialsForAccount:()AppleIDAuthentication services:completion:;
- (void)aida_renewCredentialsForAccount:()AppleIDAuthentication services:force:completion:;
@end

@implementation ACAccountStore(AppleIDAuthentication)

- (id)aida_accountForPrimaryiCloudAccount
{
  v2 = [a1 _primaryiCloudAccount];
  v3 = objc_msgSend(a1, "aida_accountForiCloudAccount:", v2);

  return v3;
}

- (id)_primaryiCloudAccount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  [a1 accountsWithAccountType:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "accountPropertyForKey:", @"primaryAccount", (void)v13);
        char v10 = [v9 BOOLValue];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)aida_accountForiCloudAccount:()AppleIDAuthentication
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  uint64_t v4 = objc_msgSend(v18, "aida_alternateDSID");
  objc_msgSend(a1, "aida_AppleIDAuthenticationAccounts");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "aida_alternateDSID");
        if ([v10 isEqualToString:v4]) {
          goto LABEL_14;
        }
        id v11 = [v9 accountPropertyForKey:@"adsid"];
        if ([v11 isEqualToString:v4])
        {

LABEL_14:
LABEL_15:
          id v15 = v9;
          goto LABEL_16;
        }
        v12 = [v9 username];
        long long v13 = [v18 username];
        char v14 = [v12 isEqualToString:v13];

        if (v14) {
          goto LABEL_15;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v15 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)aida_AppleIDAuthenticationAccounts
{
  v2 = objc_msgSend(a1, "aida_AppleIDAuthenticationAccountType");
  id v3 = [a1 accountsWithAccountType:v2];

  return v3;
}

- (uint64_t)aida_AppleIDAuthenticationAccountType
{
  return [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17760]];
}

- (id)aida_accountForAltDSID:()AppleIDAuthentication
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "aida_AppleIDAuthenticationAccounts");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "aida_alternateDSID", (void)v16);
        if ([v11 isEqualToString:v4])
        {

LABEL_13:
          id v14 = v10;
          goto LABEL_14;
        }
        v12 = [v10 accountPropertyForKey:@"adsid"];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)aida_iCloudAccountMatchingAppleIDAuthAccount:()AppleIDAuthentication
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 accountPropertyForKey:@"altDSID"];
  if (!v5) {
    id v6 = (id)[v4 accountPropertyForKey:@"adsid"];
  }
  uint64_t v7 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  [a1 accountsWithAccountType:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v18 = v4;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v13 accountPropertyForKey:@"altDSID"];
        int v15 = [v14 isEqual:v5];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    id v16 = 0;
LABEL_13:
    id v4 = v18;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (uint64_t)aida_renewCredentialsForAccount:()AppleIDAuthentication services:completion:
{
  return objc_msgSend(a1, "aida_renewCredentialsForAccount:services:force:completion:", a3, a4, 0, a5);
}

- (void)aida_renewCredentialsForAccount:()AppleIDAuthentication services:force:completion:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F17A40];
  v17[0] = @"Services";
  v17[1] = v10;
  v18[0] = a4;
  uint64_t v11 = NSNumber;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  int v15 = [v11 numberWithBool:a5];
  v18[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  [a1 renewCredentialsForAccount:v14 options:v16 completion:v12];
}

@end