@interface ACAccount(DeviceManagementClient)
+ (id)dmc_createManagementAccountWithStore:()DeviceManagementClient;
- (BOOL)dmc_isVisibleRemoteManagementAccount;
- (id)dmc_accountQuotaString;
- (id)dmc_bearerToken;
- (id)dmc_remoteManagementAccount;
- (uint64_t)dmc_DSID;
- (uint64_t)dmc_accountScheme;
- (uint64_t)dmc_altDSID;
- (uint64_t)dmc_bearerReauthParams;
- (uint64_t)dmc_bearerReauthURL;
- (uint64_t)dmc_enrollmentMethod;
- (uint64_t)dmc_enrollmentToken;
- (uint64_t)dmc_enrollmentType;
- (uint64_t)dmc_enrollmentURL;
- (uint64_t)dmc_isAccountSchemeSharediPad;
- (uint64_t)dmc_isManagementProfileLocked;
- (uint64_t)dmc_isPrimaryAccount;
- (uint64_t)dmc_managementProfileIdentifier;
- (uint64_t)dmc_mdmServerToken;
- (uint64_t)dmc_personaIdentifier;
- (uint64_t)dmc_remoteManagingAccountIdentifier;
- (uint64_t)dmc_setAccountScheme:()DeviceManagementClient;
- (uint64_t)dmc_setAltDSID:()DeviceManagementClient;
- (uint64_t)dmc_setBearerReauthParams:()DeviceManagementClient;
- (uint64_t)dmc_setBearerReauthURL:()DeviceManagementClient;
- (uint64_t)dmc_setDSID:()DeviceManagementClient;
- (uint64_t)dmc_setEnrollmentToken:()DeviceManagementClient;
- (uint64_t)dmc_setEnrollmentURL:()DeviceManagementClient;
- (uint64_t)dmc_setManagementProfileIdentifier:()DeviceManagementClient;
- (uint64_t)dmc_setPersonaIdentifier:()DeviceManagementClient;
- (uint64_t)dmc_setRemoteManagingAccountIdentifier:()DeviceManagementClient;
- (uint64_t)dmc_setSignInUserIdentifier:()DeviceManagementClient;
- (uint64_t)dmc_signInUserIdentifier;
- (void)dmc_setBearerToken:()DeviceManagementClient;
- (void)dmc_setEnrollmentMethod:()DeviceManagementClient;
- (void)dmc_setEnrollmentType:()DeviceManagementClient;
- (void)dmc_setManagementProfileLocked:()DeviceManagementClient;
@end

@implementation ACAccount(DeviceManagementClient)

+ (id)dmc_createManagementAccountWithStore:()DeviceManagementClient
{
  v3 = (objc_class *)MEMORY[0x1E4F179B0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "dmc_RemoteManagementAccountType");

  v7 = (void *)[v5 initWithAccountType:v6];
  objc_msgSend(v7, "dmc_setAccountScheme:", @"Bearer");
  [v7 setAuthenticated:1];
  return v7;
}

- (uint64_t)dmc_accountScheme
{
  return [a1 objectForKeyedSubscript:@"DMCAccountScheme"];
}

- (uint64_t)dmc_setAccountScheme:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"DMCAccountScheme"];
}

- (uint64_t)dmc_altDSID
{
  return [a1 objectForKeyedSubscript:@"altDSID"];
}

- (uint64_t)dmc_setAltDSID:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"altDSID"];
}

- (uint64_t)dmc_bearerReauthURL
{
  return [a1 objectForKeyedSubscript:@"DMCBearerReauthURL"];
}

- (uint64_t)dmc_setBearerReauthURL:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"DMCBearerReauthURL"];
}

- (uint64_t)dmc_bearerReauthParams
{
  return [a1 objectForKeyedSubscript:@"DMCBearerReauthParams"];
}

- (uint64_t)dmc_setBearerReauthParams:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"DMCBearerReauthParams"];
}

- (id)dmc_bearerToken
{
  v1 = [a1 credential];
  v2 = [v1 token];

  return v2;
}

- (void)dmc_setBearerToken:()DeviceManagementClient
{
  id v6 = a3;
  id v4 = [a1 credential];
  if (!v4)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = *MEMORY[0x1E4F178C8];
    [v4 setCredentialType:*MEMORY[0x1E4F178C8]];
    [a1 setCredential:v4];
    [a1 setCredentialType:v5];
  }
  [v4 setToken:v6];
}

- (uint64_t)dmc_DSID
{
  return [a1 objectForKeyedSubscript:@"DSID"];
}

- (uint64_t)dmc_setDSID:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"DSID"];
}

- (uint64_t)dmc_enrollmentMethod
{
  v1 = [a1 objectForKeyedSubscript:@"DMCEnrollmentMethod"];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (void)dmc_setEnrollmentMethod:()DeviceManagementClient
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"DMCEnrollmentMethod"];
}

- (uint64_t)dmc_enrollmentToken
{
  return [a1 objectForKeyedSubscript:@"RMEnrollmentToken"];
}

- (uint64_t)dmc_setEnrollmentToken:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMEnrollmentToken"];
}

- (uint64_t)dmc_enrollmentType
{
  v1 = [a1 objectForKeyedSubscript:@"DMCEnrollmentType"];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (void)dmc_setEnrollmentType:()DeviceManagementClient
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"DMCEnrollmentType"];
}

- (uint64_t)dmc_enrollmentURL
{
  return [a1 objectForKeyedSubscript:@"RMEnrollmentURL"];
}

- (uint64_t)dmc_setEnrollmentURL:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMEnrollmentURL"];
}

- (uint64_t)dmc_managementProfileIdentifier
{
  return [a1 objectForKeyedSubscript:@"RMManagementProfileIdentifier"];
}

- (uint64_t)dmc_setManagementProfileIdentifier:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"RMManagementProfileIdentifier"];
}

- (uint64_t)dmc_isManagementProfileLocked
{
  v1 = [a1 objectForKeyedSubscript:@"DMCIsManagementProfileLocked"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)dmc_setManagementProfileLocked:()DeviceManagementClient
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"DMCIsManagementProfileLocked"];
}

- (uint64_t)dmc_remoteManagingAccountIdentifier
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F176F8]];
}

- (uint64_t)dmc_setRemoteManagingAccountIdentifier:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F176F8]];
}

- (id)dmc_remoteManagementAccount
{
  id v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17848]];

  if (v4)
  {
    id v5 = a1;
  }
  else
  {
    id v6 = objc_msgSend(a1, "dmc_remoteManagingAccountIdentifier");

    if (v6)
    {
      v7 = [MEMORY[0x1E4F179C8] defaultStore];
      v8 = objc_msgSend(a1, "dmc_remoteManagingAccountIdentifier");
      id v5 = [v7 accountWithIdentifier:v8];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (uint64_t)dmc_personaIdentifier
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F176E8]];
}

- (uint64_t)dmc_setPersonaIdentifier:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F176E8]];
}

- (uint64_t)dmc_signInUserIdentifier
{
  return [a1 objectForKeyedSubscript:@"DMCSignInUserIdentifier"];
}

- (uint64_t)dmc_setSignInUserIdentifier:()DeviceManagementClient
{
  return [a1 setObject:a3 forKeyedSubscript:@"DMCSignInUserIdentifier"];
}

- (uint64_t)dmc_mdmServerToken
{
  AppleAccountLibrary();
  return objc_msgSend(a1, "aa_mdmServerToken");
}

- (BOOL)dmc_isVisibleRemoteManagementAccount
{
  id v2 = objc_msgSend(a1, "dmc_managementProfileIdentifier");

  if (!v2) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(a1, "dmc_enrollmentType");
  if (objc_msgSend(a1, "dmc_enrollmentMethod")) {
    BOOL v4 = objc_msgSend(a1, "dmc_enrollmentMethod") != 3;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 && v4;
}

- (uint64_t)dmc_isPrimaryAccount
{
  v1 = [a1 objectForKeyedSubscript:@"primaryAccount"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)dmc_accountQuotaString
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = &stru_1EFD813E0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  uint64_t v3 = (void *)getAAQuotaInfoRequestClass_softClass;
  uint64_t v22 = getAAQuotaInfoRequestClass_softClass;
  if (!getAAQuotaInfoRequestClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getAAQuotaInfoRequestClass_block_invoke;
    v18[3] = &unk_1E5CFD440;
    v18[4] = &v19;
    __getAAQuotaInfoRequestClass_block_invoke((uint64_t)v18);
    uint64_t v3 = (void *)v20[3];
  }
  BOOL v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = (void *)[[v4 alloc] initDetailedRequestWithAccount:a1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ACAccount_DeviceManagementClient__dmc_accountQuotaString__block_invoke;
  v9[3] = &unk_1E5CFD3E0;
  v11 = &v12;
  v9[4] = a1;
  id v6 = v2;
  v10 = v6;
  [v5 performRequestWithHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (uint64_t)dmc_isAccountSchemeSharediPad
{
  v1 = objc_msgSend(a1, "dmc_accountScheme");
  uint64_t v2 = [v1 isEqualToString:@"SharediPad"];

  return v2;
}

@end