@interface ACAccount(AppleAccount)
- (AARegionInfo)aa_regionInfo;
- (AASuspensionInfo)aa_suspensionInfo;
- (BOOL)_hasMailDataclassProperties;
- (BOOL)aa_isAuthKitAccount;
- (BOOL)aa_isRemotelyManaged;
- (BOOL)aa_isUsingiCloud;
- (BOOL)aa_updateAccountClassIfNecessary;
- (BOOL)aa_updateTokensWithProvisioningResponse:()AppleAccount;
- (__CFString)aa_accountClass;
- (id)_aa_rawPassword;
- (id)_aa_termsServerInfo;
- (id)aa_authToken;
- (id)aa_authTokenWithError:()AppleAccount;
- (id)aa_childMailAccount;
- (id)aa_cloudKitAccount;
- (id)aa_fmfAccount;
- (id)aa_fmipAccount;
- (id)aa_fmipToken;
- (id)aa_formattedUsername;
- (id)aa_fullName;
- (id)aa_mapsToken;
- (id)aa_mdmServerToken;
- (id)aa_normalizedPersonID;
- (id)aa_password;
- (id)aa_personID;
- (id)aa_repairState;
- (uint64_t)_aa_isExistingAccount:()AppleAccount;
- (uint64_t)_dataclassIsDisabledForProperties:()AppleAccount;
- (uint64_t)aa_ageCategory;
- (uint64_t)aa_altDSID;
- (uint64_t)aa_appleIDAliases;
- (uint64_t)aa_appleId;
- (uint64_t)aa_firstName;
- (uint64_t)aa_hasDuplicateAccount;
- (uint64_t)aa_hasOptionalTerms;
- (uint64_t)aa_hsaTokenWithError:()AppleAccount;
- (uint64_t)aa_isAccountClass:()AppleAccount;
- (uint64_t)aa_isCloudDocsMigrationComplete;
- (uint64_t)aa_isCloudSubscriber;
- (uint64_t)aa_isDuplicateAccount:()AppleAccount;
- (uint64_t)aa_isFamilyEligible;
- (uint64_t)aa_isManagedAppleID;
- (uint64_t)aa_isNotesMigrated;
- (uint64_t)aa_isPrimaryAccount;
- (uint64_t)aa_isPrimaryEmailVerified;
- (uint64_t)aa_isRemindersAutoMigratableToCK;
- (uint64_t)aa_isRemindersMigrated;
- (uint64_t)aa_isSandboxAccount;
- (uint64_t)aa_isSuspended;
- (uint64_t)aa_isUsingCloudDocs;
- (uint64_t)aa_lastAgreedTermsInfo;
- (uint64_t)aa_lastKnownQuota;
- (uint64_t)aa_lastName;
- (uint64_t)aa_middleName;
- (uint64_t)aa_needsEmailConfiguration;
- (uint64_t)aa_needsToVerifyTerms;
- (uint64_t)aa_primaryEmail;
- (uint64_t)aa_serverDisabledDataclass:()AppleAccount;
- (uint64_t)aa_setLastKnownQuota:()AppleAccount;
- (uint64_t)aa_setPrimaryAccount:()AppleAccount;
- (uint64_t)aa_useCellularForDataclass:()AppleAccount;
- (void)_aa_clearRawPassword;
- (void)_aa_setAltDSID:()AppleAccount;
- (void)_aa_setAppleID:()AppleAccount;
- (void)_aa_setPrimaryEmail:()AppleAccount;
- (void)_aa_setRawPassword:()AppleAccount;
- (void)_aa_setTermsServerInfo:()AppleAccount;
- (void)aa_hasDuplicateAccount;
- (void)aa_isPrimaryAccount;
- (void)aa_setAccountClass:()AppleAccount;
- (void)aa_setAuthToken:()AppleAccount;
- (void)aa_setCloudDocsMigrationComplete:()AppleAccount;
- (void)aa_setFirstName:()AppleAccount;
- (void)aa_setIsCloudSubscriber:()AppleAccount;
- (void)aa_setLastName:()AppleAccount;
- (void)aa_setMDMServerToken:()AppleAccount;
- (void)aa_setMapsToken:()AppleAccount;
- (void)aa_setMiddleName:()AppleAccount;
- (void)aa_setNeedsToVerifyTerms:()AppleAccount;
- (void)aa_setPassword:()AppleAccount;
- (void)aa_setPrimaryEmailVerified:()AppleAccount;
- (void)aa_setRepairState:()AppleAccount;
- (void)aa_setUseCellular:()AppleAccount forDataclass:;
- (void)aa_setUsesCloudDocs:()AppleAccount;
- (void)aa_updateAccountClassIfNecessary;
- (void)aa_updateWithProvisioningResponse:()AppleAccount;
@end

@implementation ACAccount(AppleAccount)

- (uint64_t)aa_useCellularForDataclass:()AppleAccount
{
  id v4 = a3;
  v5 = [a1 accountPropertyForKey:@"dataclassesDisabledForCellular"];
  int v6 = [v5 containsObject:v4];

  return v6 ^ 1u;
}

- (id)aa_personID
{
  v1 = [a1 accountPropertyForKey:@"personID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 stringValue];
  }
  else
  {
    id v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (uint64_t)aa_isAccountClass:()AppleAccount
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "aa_accountClass");
  uint64_t v6 = [v5 isEqualToString:v4];

  return v6;
}

- (__CFString)aa_accountClass
{
  objc_opt_class();
  id v2 = [a1 objectForKeyedSubscript:@"accountClass"];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    id v4 = (__CFString *)v3;
  }
  else
  {
    objc_opt_class();
    id v5 = [a1 objectForKeyedSubscript:@"primaryAccount"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    int v7 = [v6 BOOLValue];
    v8 = @"basic";
    if (v7) {
      v8 = @"primary";
    }
    id v4 = v8;
  }

  return v4;
}

- (id)aa_formattedUsername
{
  v1 = (void *)MEMORY[0x1E4F4F0E0];
  id v2 = [a1 username];
  id v3 = [v1 formattedUsernameFromUsername:v2];

  return v3;
}

- (uint64_t)aa_primaryEmail
{
  return [a1 accountPropertyForKey:@"primaryEmail"];
}

- (uint64_t)aa_appleId
{
  return [a1 accountPropertyForKey:@"appleId"];
}

- (uint64_t)aa_appleIDAliases
{
  return [a1 accountPropertyForKey:@"appleIDAliases"];
}

- (uint64_t)aa_altDSID
{
  return [a1 accountPropertyForKey:@"altDSID"];
}

- (uint64_t)aa_firstName
{
  return [a1 accountPropertyForKey:@"firstName"];
}

- (void)aa_setFirstName:()AppleAccount
{
  id v4 = (id)[a3 copy];
  [a1 setAccountProperty:v4 forKey:@"firstName"];
}

- (uint64_t)aa_middleName
{
  return [a1 accountPropertyForKey:@"middleName"];
}

- (void)aa_setMiddleName:()AppleAccount
{
  id v4 = (id)[a3 copy];
  [a1 setAccountProperty:v4 forKey:@"middleName"];
}

- (uint64_t)aa_lastName
{
  return [a1 accountPropertyForKey:@"lastName"];
}

- (void)aa_setLastName:()AppleAccount
{
  id v4 = (id)[a3 copy];
  [a1 setAccountProperty:v4 forKey:@"lastName"];
}

- (id)aa_fullName
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  id v3 = objc_msgSend(a1, "aa_firstName");
  [v2 setGivenName:v3];

  id v4 = objc_msgSend(a1, "aa_lastName");
  [v2 setFamilyName:v4];

  id v5 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v2 style:2 options:0];
  if (![v5 length])
  {
    uint64_t v6 = [a1 accountPropertyForKey:*MEMORY[0x1E4F17698]];

    id v5 = (void *)v6;
  }

  return v5;
}

- (AARegionInfo)aa_regionInfo
{
  v1 = [a1 accountPropertyForKey:@"regionInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [[AARegionInfo alloc] initWithDictionary:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)aa_normalizedPersonID
{
  uint64_t v2 = [a1 accountPropertyForKey:*MEMORY[0x1E4F4D8E0]];
  if (!v2
    || (id v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v3 stringValue],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        (id v3 = (void *)v4) == 0))
  {
    id v5 = [a1 accountType];
    uint64_t v6 = [v5 identifier];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F17808]];

    if (!v7
      || ([a1 accountPropertyForKey:@"profile-id"],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 stringByReplacingOccurrencesOfString:@"D:" withString:&stru_1EF456870],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      v9 = [a1 accountType];
      v10 = [v9 identifier];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F17750]];

      if (v11)
      {
        id v3 = [a1 accountPropertyForKey:@"personID"];
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (uint64_t)aa_isPrimaryAccount
{
  uint64_t v2 = objc_msgSend(a1, "aa_accountClass");
  if (v2)
  {
    uint64_t v3 = objc_msgSend(a1, "aa_isAccountClass:", @"primary");
  }
  else
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(AppleAccount) aa_isPrimaryAccount](v4);
    }

    objc_opt_class();
    id v5 = [a1 objectForKeyedSubscript:@"primaryAccount"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    uint64_t v3 = [v6 BOOLValue];
  }

  return v3;
}

- (uint64_t)aa_setPrimaryAccount:()AppleAccount
{
  if (a3)
  {
    uint64_t v4 = @"primary";
  }
  else if (+[AAPreferences isMultipleFullAccountsEnabled])
  {
    uint64_t v4 = @"full";
  }
  else
  {
    uint64_t v4 = @"basic";
  }

  return objc_msgSend(a1, "aa_setAccountClass:", v4);
}

- (void)aa_setAccountClass:()AppleAccount
{
  id v5 = a3;
  id v6 = [a1 accountType];
  int v7 = [v6 identifier];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F17750]];

  if ((v8 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"ACAccount+AppleAccount.m" lineNumber:219 description:@"Attempt to set accountClass on non-iCloud account"];
  }
  v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(ACAccount(AppleAccount) *)(uint64_t)a1 aa_setAccountClass:v9];
  }

  [a1 setObject:v5 forKeyedSubscript:@"accountClass"];
  uint64_t v10 = [v5 isEqualToString:@"primary"];
  int v11 = [NSNumber numberWithBool:v10];
  [a1 setObject:v11 forKeyedSubscript:@"primaryAccount"];
}

- (BOOL)aa_updateAccountClassIfNecessary
{
  objc_opt_class();
  id v2 = [a1 objectForKeyedSubscript:@"accountClass"];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (!v3)
  {
    objc_opt_class();
    id v4 = [a1 objectForKeyedSubscript:@"primaryAccount"];
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    int v6 = [v5 BOOLValue];
    int v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(ACAccount(AppleAccount) *)(uint64_t)a1 aa_updateAccountClassIfNecessary];
    }

    if (v6) {
      char v8 = @"primary";
    }
    else {
      char v8 = @"basic";
    }
    [a1 setObject:v8 forKeyedSubscript:@"accountClass"];
  }

  return v3 == 0;
}

- (uint64_t)aa_isPrimaryEmailVerified
{
  v1 = [a1 accountPropertyForKey:@"primaryEmailVerified"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)aa_setPrimaryEmailVerified:()AppleAccount
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"primaryEmailVerified"];
}

- (uint64_t)aa_needsToVerifyTerms
{
  id v2 = [a1 parentAccount];

  if (v2)
  {
    id v3 = [a1 parentAccount];
    uint64_t v4 = objc_msgSend(v3, "aa_needsToVerifyTerms");
  }
  else
  {
    id v3 = [a1 accountPropertyForKey:@"needsToVerifyTerms"];
    uint64_t v4 = [v3 BOOLValue];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)aa_setNeedsToVerifyTerms:()AppleAccount
{
  uint64_t v5 = [a1 parentAccount];

  if (v5)
  {
    id v6 = [a1 parentAccount];
    objc_msgSend(v6, "aa_setNeedsToVerifyTerms:", a3);
  }
  else
  {
    id v6 = [NSNumber numberWithBool:a3];
    objc_msgSend(a1, "setAccountProperty:forKey:");
  }
}

- (uint64_t)aa_isSuspended
{
  id v2 = objc_msgSend(a1, "aa_suspensionInfo");
  if (v2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(a1, "aa_needsToVerifyTerms");
  }

  return v3;
}

- (AASuspensionInfo)aa_suspensionInfo
{
  id v2 = [a1 parentAccount];

  if (v2)
  {
    id v3 = [a1 parentAccount];
    objc_msgSend(v3, "aa_suspensionInfo");
    uint64_t v4 = (AASuspensionInfo *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    id v6 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  id v5 = [a1 accountPropertyForKey:@"suspendedInfo"];
  if (objc_opt_isKindOfClass()) {
    id v3 = v5;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    uint64_t v4 = [[AASuspensionInfo alloc] initWithDictionary:v3];
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (uint64_t)aa_isUsingCloudDocs
{
  v1 = [a1 accountPropertyForKey:@"usesCloudDocs"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)aa_setUsesCloudDocs:()AppleAccount
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"usesCloudDocs"];
}

- (uint64_t)aa_isCloudSubscriber
{
  v1 = [a1 accountPropertyForKey:@"isCloudSubscriber"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)aa_setIsCloudSubscriber:()AppleAccount
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"isCloudSubscriber"];
}

- (uint64_t)aa_isCloudDocsMigrationComplete
{
  v1 = [a1 accountPropertyForKey:@"cloudDocsMigrationComplete"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)aa_setCloudDocsMigrationComplete:()AppleAccount
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"cloudDocsMigrationComplete"];
}

- (BOOL)aa_isUsingiCloud
{
  v1 = [a1 enabledDataclasses];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (BOOL)aa_isRemotelyManaged
{
  v1 = [a1 accountPropertyForKey:*MEMORY[0x1E4F176F8]];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)aa_isManagedAppleID
{
  v1 = [a1 accountPropertyForKey:@"isManagedAppleID"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_isNotesMigrated
{
  v1 = [a1 accountPropertyForKey:@"notesMigrated"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_isRemindersMigrated
{
  v1 = [a1 accountPropertyForKey:@"remindersMigrated"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_isRemindersAutoMigratableToCK
{
  v1 = [a1 accountPropertyForKey:@"remindersAutoMigratableToCK"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_isSandboxAccount
{
  v1 = [a1 accountPropertyForKey:@"isSandboxAcct"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)aa_isAuthKitAccount
{
  v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  BOOL v3 = [v2 compare:*MEMORY[0x1E4F177E0] options:4] == 0;

  return v3;
}

- (uint64_t)aa_hasOptionalTerms
{
  v1 = [a1 objectForKeyedSubscript:@"hasOptionalTerms"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_lastKnownQuota
{
  return [a1 accountPropertyForKey:@"lastKnownQuota"];
}

- (uint64_t)aa_setLastKnownQuota:()AppleAccount
{
  return [a1 setAccountProperty:a3 forKey:@"lastKnownQuota"];
}

- (id)aa_repairState
{
  uint64_t v2 = [a1 parentAccount];

  if (v2)
  {
    BOOL v3 = [a1 parentAccount];
    uint64_t v4 = objc_msgSend(v3, "aa_repairState");
  }
  else
  {
    uint64_t v4 = [a1 accountPropertyForKey:@"repairState"];
  }

  return v4;
}

- (void)aa_setRepairState:()AppleAccount
{
  id v6 = a3;
  uint64_t v4 = [a1 parentAccount];

  if (v4)
  {
    id v5 = [a1 parentAccount];
    objc_msgSend(v5, "aa_setRepairState:", v6);
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"repairState"];
  }
}

- (uint64_t)aa_needsEmailConfiguration
{
  uint64_t result = [a1 isProvisionedForDataclass:*MEMORY[0x1E4F17AD8]];
  if (result)
  {
    BOOL v3 = objc_msgSend(a1, "aa_childMailAccount");

    if (v3) {
      return 0;
    }
    else {
      return [a1 _hasMailDataclassProperties] ^ 1;
    }
  }
  return result;
}

- (uint64_t)aa_serverDisabledDataclass:()AppleAccount
{
  id v4 = a3;
  if (objc_msgSend(a1, "aa_isManagedAppleID")
    && ([a1 dataclassProperties], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [a1 dataclassProperties];
    int v7 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = [a1 _dataclassIsDisabledForProperties:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)_dataclassIsDisabledForProperties:()AppleAccount
{
  BOOL v3 = [a3 objectForKeyedSubscript:@"status"];
  uint64_t v4 = [v3 isEqualToString:@"disabled"];

  return v4;
}

- (BOOL)_hasMailDataclassProperties
{
  v1 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
  uint64_t v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 allKeys];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)aa_isFamilyEligible
{
  v1 = [a1 accountPropertyForKey:@"familyEligible"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)aa_ageCategory
{
  v1 = [a1 accountPropertyForKey:@"ageCategory"];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (uint64_t)aa_lastAgreedTermsInfo
{
  return [a1 accountPropertyForKey:@"lastAgreedTerms"];
}

- (id)_aa_termsServerInfo
{
  return objc_getAssociatedObject(a1, sel__aa_termsServerInfo);
}

- (void)_aa_setTermsServerInfo:()AppleAccount
{
}

- (id)aa_fmfAccount
{
  v1 = [a1 childAccountsWithAccountTypeIdentifier:*MEMORY[0x1E4F177A8]];
  uint64_t v2 = [v1 firstObject];

  return v2;
}

- (id)aa_fmipAccount
{
  v1 = [a1 childAccountsWithAccountTypeIdentifier:*MEMORY[0x1E4F17790]];
  uint64_t v2 = [v1 firstObject];

  return v2;
}

- (id)aa_cloudKitAccount
{
  v1 = [a1 childAccountsWithAccountTypeIdentifier:*MEMORY[0x1E4F17788]];
  uint64_t v2 = [v1 firstObject];

  return v2;
}

- (id)aa_childMailAccount
{
  if ([a1 isProvisionedForDataclass:*MEMORY[0x1E4F17AD8]])
  {
    uint64_t v2 = [a1 childAccountsWithAccountTypeIdentifier:*MEMORY[0x1E4F177F0]];
    BOOL v3 = [v2 firstObject];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)aa_password
{
  v1 = [a1 credential];
  uint64_t v2 = [v1 password];

  return v2;
}

- (void)aa_setPassword:()AppleAccount
{
  id v9 = a3;
  BOOL v4 = [a1 credential];
  id v5 = [v4 password];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    int v7 = [a1 credential];

    if (v7)
    {
      uint64_t v8 = [a1 credential];
      [v8 setPassword:v9];
    }
    else
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v9];
      [a1 setCredential:v8];
    }
  }
}

- (id)aa_authToken
{
  v1 = [a1 credential];
  uint64_t v2 = [v1 token];

  return v2;
}

- (void)aa_setAuthToken:()AppleAccount
{
  id v9 = a3;
  BOOL v4 = [a1 credential];
  id v5 = [v4 token];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    int v7 = [a1 credential];

    if (v7)
    {
      id v8 = [a1 credential];
      [v8 setToken:v9];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F179C0]);
      [v8 setToken:v9];
      [a1 setCredential:v8];
    }

    [a1 setAuthenticated:1];
  }
}

- (id)aa_fmipToken
{
  uint64_t v2 = objc_msgSend(a1, "aa_fmipAccount");
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 credential];
    uint64_t v5 = [v4 token];
  }
  else
  {
    char v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "ERROR: Didn't find a child account, returning findMyiPhoneToken", v9, 2u);
    }

    BOOL v4 = [a1 credential];
    uint64_t v5 = [v4 findMyiPhoneToken];
  }
  int v7 = (void *)v5;

  return v7;
}

- (id)aa_mapsToken
{
  v1 = [a1 credential];
  uint64_t v2 = [v1 mapsToken];

  return v2;
}

- (void)aa_setMapsToken:()AppleAccount
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = [a1 credential];
    char v6 = [v5 mapsToken];
    char v7 = [v10 isEqualToString:v6];

    id v4 = v10;
    if ((v7 & 1) == 0)
    {
      id v8 = [a1 credential];

      if (v8)
      {
        id v9 = [a1 credential];
        [v9 setMapsToken:v10];
      }
      else
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F179C0]);
        [v9 setMapsToken:v10];
        [a1 setCredential:v9];
      }

      id v4 = v10;
    }
  }
}

- (id)aa_mdmServerToken
{
  v1 = [a1 credential];
  uint64_t v2 = [v1 mdmServerToken];

  return v2;
}

- (void)aa_setMDMServerToken:()AppleAccount
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = [a1 credential];
    char v6 = [v5 mdmServerToken];
    char v7 = [v10 isEqualToString:v6];

    id v4 = v10;
    if ((v7 & 1) == 0)
    {
      id v8 = [a1 credential];

      if (v8)
      {
        id v9 = [a1 credential];
        [v9 setMdmServerToken:v10];
      }
      else
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F179C0]);
        [v9 setMdmServerToken:v10];
        [a1 setCredential:v9];
      }

      id v4 = v10;
    }
  }
}

- (id)aa_authTokenWithError:()AppleAccount
{
  id v9 = 0;
  id v4 = [a1 credentialWithError:&v9];
  id v5 = v9;
  char v6 = v5;
  if (a3 && v5)
  {
    char v7 = 0;
    *a3 = v5;
  }
  else
  {
    char v7 = [v4 token];
  }

  return v7;
}

- (uint64_t)aa_hsaTokenWithError:()AppleAccount
{
  v0 = _AALogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    -[ACAccount(AppleAccount) aa_hsaTokenWithError:](v0);
  }

  return 0;
}

- (void)aa_setUseCellular:()AppleAccount forDataclass:
{
  id v8 = a4;
  char v6 = [a1 accountPropertyForKey:@"dataclassesDisabledForCellular"];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (a3) {
    [v7 removeObject:v8];
  }
  else {
    [v7 addObject:v8];
  }
  [a1 setAccountProperty:v7 forKey:@"dataclassesDisabledForCellular"];
}

- (void)aa_updateWithProvisioningResponse:()AppleAccount
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, a1, @"ACAccount+AppleAccount.m", 590, @"Invalid parameter not satisfying: %@", @"provisioningResponse" object file lineNumber description];
  }
  char v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a1 username];
    *(_DWORD *)buf = 138412290;
    v86 = v7;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Updating account %@ with provisioning response.", buf, 0xCu);
  }
  if (objc_msgSend(a1, "aa_needsToVerifyTerms")) {
    objc_msgSend(a1, "aa_setNeedsToVerifyTerms:", 0);
  }
  id v8 = objc_msgSend(a1, "aa_suspensionInfo");

  if (v8) {
    [a1 setAccountProperty:0 forKey:@"suspendedInfo"];
  }
  uint64_t v9 = [v5 altDSID];
  if (v9) {
    [a1 setAccountProperty:v9 forKey:@"altDSID"];
  }
  v63 = (void *)v9;
  id v10 = [v5 dataclassProperties];
  objc_msgSend(a1, "_aa_setDataclassProperties:", v10);

  int v11 = [v5 personID];
  [a1 setAccountProperty:v11 forKey:@"personID"];

  v12 = [v5 firstName];
  [a1 setAccountProperty:v12 forKey:@"firstName"];

  v13 = [v5 lastName];
  [a1 setAccountProperty:v13 forKey:@"lastName"];

  v14 = [v5 primaryEmail];
  [a1 setAccountProperty:v14 forKey:@"primaryEmail"];

  v15 = [v5 primaryEmailVerified];
  [a1 setAccountProperty:v15 forKey:@"primaryEmailVerified"];

  v16 = [v5 appleIDAliases];
  [a1 setAccountProperty:v16 forKey:@"appleIDAliases"];

  v17 = [v5 protocolVersion];
  [a1 setAccountProperty:v17 forKey:@"protocolVersion"];

  v18 = [v5 appleID];
  [a1 setAccountProperty:v18 forKey:@"appleId"];

  v19 = [v5 regionInfo];
  [a1 setAccountProperty:v19 forKey:@"regionInfo"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isManagedAppleID"));
  [a1 setAccountProperty:v20 forKey:@"isManagedAppleID"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isNotesMigrated"));
  [a1 setAccountProperty:v21 forKey:@"notesMigrated"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isRemindersMigrated"));
  [a1 setAccountProperty:v22 forKey:@"remindersMigrated"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isRemindersAutoMigratableToCK"));
  [a1 setAccountProperty:v23 forKey:@"remindersAutoMigratableToCK"];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isSandboxAccount"));
  [a1 setAccountProperty:v24 forKey:@"isSandboxAcct"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isCloudDocsMigrated"));
  [a1 setAccountProperty:v25 forKey:@"cloudDocsMigrationComplete"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isCloudDocsMigrated"));
  [a1 setAccountProperty:v26 forKey:@"usesCloudDocs"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "hasOptionalTerms"));
  [a1 setAccountProperty:v27 forKey:@"hasOptionalTerms"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isFamilyEligible"));
  [a1 setAccountProperty:v28 forKey:@"familyEligible"];

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "ageCategory"));
  [a1 setAccountProperty:v29 forKey:@"ageCategory"];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  v64 = v5;
  v31 = [v5 provisionedDataclasses];
  uint64_t v32 = [v30 setWithArray:v31];

  v33 = +[AADataclassManager sharedManager];
  v62 = (void *)v32;
  v34 = [v33 filteredServerProvidedFeatures:v32 forAccount:a1];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v35 = v34;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v78 != v38) {
          objc_enumerationMutation(v35);
        }
        [a1 setProvisioned:1 forDataclass:*(void *)(*((void *)&v77 + 1) + 8 * i)];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v37);
  }

  [a1 enabledDataclasses];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v74 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        if (([v35 containsObject:v45] & 1) == 0)
        {
          v46 = _AALogSystem();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v45;
            _os_log_impl(&dword_1A11D8000, v46, OS_LOG_TYPE_DEFAULT, "Disabling dataclass %@ because it is not provisioned.", buf, 0xCu);
          }

          [a1 setEnabled:0 forDataclass:v45];
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v42);
  }

  v47 = [a1 provisionedDataclasses];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v70 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        if (([v35 containsObject:v52] & 1) == 0)
        {
          v53 = _AALogSystem();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v52;
            _os_log_impl(&dword_1A11D8000, v53, OS_LOG_TYPE_DEFAULT, "Removing dataclass provisioning %@ because it is not provisioned.", buf, 0xCu);
          }

          [a1 setProvisioned:0 forDataclass:v52];
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v49);
  }
  if (objc_msgSend(a1, "aa_isManagedAppleID"))
  {
    v54 = [a1 enabledDataclasses];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v40 = v54;
    uint64_t v55 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v66;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v66 != v57) {
            objc_enumerationMutation(v40);
          }
          v59 = *(void **)(*((void *)&v65 + 1) + 8 * m);
          if (objc_msgSend(a1, "aa_serverDisabledDataclass:", v59))
          {
            v60 = _AALogSystem();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v59;
              _os_log_impl(&dword_1A11D8000, v60, OS_LOG_TYPE_DEFAULT, "Disabling dataclass %@ because it has been restricted by the server.", buf, 0xCu);
            }

            [a1 setEnabled:0 forDataclass:v59];
          }
        }
        uint64_t v56 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v56);
    }
  }
  objc_msgSend(a1, "aa_updateTokensWithProvisioningResponse:", v64);
}

- (BOOL)aa_updateTokensWithProvisioningResponse:()AppleAccount
{
  id v4 = a3;
  uint64_t v5 = [v4 authToken];
  BOOL v6 = v5 != 0;
  if (v5) {
    objc_msgSend(a1, "aa_setAuthToken:", v5);
  }
  v46 = (void *)v5;
  uint64_t v7 = [v4 mapsToken];
  if (v7)
  {
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Saving the Maps token", buf, 2u);
    }

    objc_msgSend(a1, "aa_setMapsToken:", v7);
    BOOL v6 = 1;
  }
  uint64_t v9 = [v4 mdmServerToken];
  if (v9)
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Saving the MDM Server token", buf, 2u);
    }

    objc_msgSend(a1, "aa_setMDMServerToken:", v9);
    BOOL v6 = 1;
  }
  uint64_t v11 = [v4 searchPartyToken];
  if (v11)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Setting SearchParty token...", buf, 2u);
    }

    v13 = [a1 credential];
    [v13 setCredentialItem:v11 forKey:*MEMORY[0x1E4F17978]];

    BOOL v6 = 1;
  }
  uint64_t v43 = (void *)v11;
  v44 = (void *)v9;
  v45 = (void *)v7;
  v14 = [v4 keyTransparencyToken];
  if (v14)
  {
    v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Setting KeyTransparency token...", buf, 2u);
    }

    v16 = [a1 credential];
    [v16 setCredentialItem:v14 forKey:*MEMORY[0x1E4F17920]];

    BOOL v6 = 1;
  }
  v17 = [v4 cloudKitToken];
  if (v17)
  {
    v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "Setting CloudKit token...", buf, 2u);
    }

    v19 = [a1 credential];
    [v19 setCredentialItem:v17 forKey:*MEMORY[0x1E4F178A0]];

    v20 = objc_msgSend(a1, "aa_cloudKitAccount");
    v21 = v20;
    if (v20)
    {
      [v20 setAuthenticated:1];
      v22 = [v21 credential];
      [v22 setToken:v17];

      v23 = [a1 accountStore];
      id v47 = 0;
      char v24 = [v23 saveVerifiedAccount:v21 error:&v47];
      id v25 = v47;

      if ((v24 & 1) == 0)
      {
        v26 = _AALogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:]((uint64_t)v25, v26);
        }
      }
    }
    else
    {
      v27 = _AALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v27, OS_LOG_TYPE_DEFAULT, "Couldn't find a CloudKit child account - stashing the token away", buf, 2u);
      }

      id v25 = [a1 username];
      +[AAKeychainManager setPassword:v17 forServiceName:@"com.apple.appleaccount.cloudkit.token" username:v25 accessGroup:@"appleaccount"];
    }

    BOOL v6 = 1;
  }
  v28 = [v4 fmipToken];
  if (v28)
  {
    v29 = [a1 credential];
    [v29 setFindMyiPhoneToken:v28];

    BOOL v6 = 1;
  }
  v30 = [v4 fmipAppToken];
  if (v30)
  {
    v31 = _AALogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v31, OS_LOG_TYPE_DEFAULT, "Setting FMIP App token...", buf, 2u);
    }

    uint64_t v32 = [a1 credential];
    [v32 setCredentialItem:v30 forKey:*MEMORY[0x1E4F17908]];

    BOOL v6 = 1;
  }
  v33 = [v4 fmipSiriToken];
  if (v33)
  {
    v34 = _AALogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v34, OS_LOG_TYPE_DEFAULT, "Setting FMIP Siri token...", buf, 2u);
    }

    id v35 = [a1 credential];
    [v35 setCredentialItem:v33 forKey:*MEMORY[0x1E4F17910]];

    BOOL v6 = 1;
  }
  uint64_t v36 = [v4 fmfToken];
  if (v36)
  {
    uint64_t v37 = _AALogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:](v37);
    }

    uint64_t v38 = [a1 credential];
    [v38 setCredentialItem:v36 forKey:*MEMORY[0x1E4F17900]];

    BOOL v6 = 1;
  }
  v39 = [v4 fmfAppToken];
  if (v39)
  {
    id v40 = _AALogSystem();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[ACAccount(AppleAccount) aa_updateTokensWithProvisioningResponse:](v40);
    }

    uint64_t v41 = [a1 credential];
    [v41 setCredentialItem:v39 forKey:*MEMORY[0x1E4F178F8]];

    BOOL v6 = 1;
  }

  return v6;
}

- (uint64_t)aa_hasDuplicateAccount
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 accountStore];
  v14[0] = *MEMORY[0x1E4F17750];
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v13 = 0;
  id v4 = [v2 accountsWithAccountTypeIdentifiers:v3 error:&v13];
  id v5 = v13;

  if (!v4)
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ACAccount(AppleAccount) *)(uint64_t)v5 aa_hasDuplicateAccount];
    }

    goto LABEL_8;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke;
  v12[3] = &unk_1E5A4A0F8;
  v12[4] = a1;
  BOOL v6 = objc_msgSend(v4, "aaf_firstObjectPassingTest:", v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__ACAccount_AppleAccount__aa_hasDuplicateAccount__block_invoke_2;
  v11[3] = &unk_1E5A4A0F8;
  v11[4] = a1;
  uint64_t v7 = objc_msgSend(v4, "aaf_firstObjectPassingTest:", v11);

  if (v6 || !v7)
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 1;
LABEL_9:

  return v8;
}

- (uint64_t)_aa_isExistingAccount:()AppleAccount
{
  id v4 = a3;
  id v5 = [a1 accountType];
  BOOL v6 = [v5 identifier];
  uint64_t v7 = [v4 accountType];
  uint64_t v8 = [v7 identifier];
  int v9 = [v6 isEqualToString:v8];

  id v10 = [a1 identifier];
  uint64_t v11 = [v4 identifier];

  uint64_t v12 = [v10 isEqualToString:v11] & v9;
  return v12;
}

- (uint64_t)aa_isDuplicateAccount:()AppleAccount
{
  id v4 = a3;
  id v5 = [a1 accountType];
  BOOL v6 = [v5 identifier];
  uint64_t v7 = [v4 accountType];
  uint64_t v8 = [(id)v7 identifier];
  int v9 = [v6 isEqualToString:v8];

  id v10 = [a1 identifier];
  uint64_t v11 = [v4 identifier];
  LOBYTE(v7) = [v10 isEqualToString:v11];

  uint64_t v12 = 0;
  if ((v7 & 1) == 0 && v9)
  {
    uint64_t v13 = objc_msgSend(a1, "aa_personID");
    if (!v13) {
      goto LABEL_7;
    }
    v14 = (void *)v13;
    v15 = objc_msgSend(a1, "aa_personID");
    v16 = objc_msgSend(v4, "aa_personID");
    int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      v18 = _AALogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        [(ACAccount(AppleAccount) *)a1 aa_isDuplicateAccount:v18];
      }
    }
    else
    {
LABEL_7:
      uint64_t v19 = [a1 username];
      if (!v19) {
        goto LABEL_11;
      }
      v20 = (void *)v19;
      v21 = [a1 username];
      v22 = [v4 username];
      int v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        v18 = _AALogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[ACAccount(AppleAccount) aa_isDuplicateAccount:]();
        }
      }
      else
      {
LABEL_11:
        uint64_t v24 = objc_msgSend(a1, "aa_altDSID");
        if (!v24) {
          goto LABEL_15;
        }
        id v25 = (void *)v24;
        v26 = objc_msgSend(a1, "aa_altDSID");
        v27 = objc_msgSend(v4, "aa_altDSID");
        int v28 = [v26 isEqualToString:v27];

        if (v28)
        {
          v18 = _AALogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            [(ACAccount(AppleAccount) *)a1 aa_isDuplicateAccount:v18];
          }
        }
        else
        {
LABEL_15:
          v18 = objc_msgSend(v4, "aa_appleIDAliases");
          uint64_t v12 = [a1 username];
          if (!v12)
          {
LABEL_21:

            goto LABEL_22;
          }
          v29 = [a1 username];
          int v30 = [v18 containsObject:v29];

          if (!v30)
          {
            uint64_t v12 = 0;
            goto LABEL_21;
          }
          v31 = _AALogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[ACAccount(AppleAccount) aa_isDuplicateAccount:]();
          }
        }
      }
    }
    uint64_t v12 = 1;
    goto LABEL_21;
  }
LABEL_22:

  return v12;
}

- (void)_aa_setAppleID:()AppleAccount
{
  id v4 = a3;
  if ([v4 length]) {
    [a1 setAccountProperty:v4 forKey:@"appleId"];
  }
}

- (void)_aa_setAltDSID:()AppleAccount
{
  id v4 = a3;
  if ([v4 length]) {
    [a1 setAccountProperty:v4 forKey:@"altDSID"];
  }
}

- (void)_aa_setPrimaryEmail:()AppleAccount
{
  id v4 = a3;
  if ([v4 length]) {
    [a1 setAccountProperty:v4 forKey:@"primaryEmail"];
  }
}

- (id)_aa_rawPassword
{
  v1 = [a1 credential];
  uint64_t v2 = [v1 credentialItemForKey:*MEMORY[0x1E4F17970]];

  return v2;
}

- (void)_aa_setRawPassword:()AppleAccount
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = objc_msgSend(a1, "_aa_rawPassword");
    char v6 = [v10 isEqualToString:v5];

    id v4 = v10;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [a1 credential];
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 setCredentialItem:v10 forKey:*MEMORY[0x1E4F17970]];
      }
      else
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F179C0]);
        [v9 setCredentialItem:v10 forKey:*MEMORY[0x1E4F17970]];
        [a1 setCredential:v9];
      }
      id v4 = v10;
    }
  }
}

- (void)_aa_clearRawPassword
{
  v1 = [a1 credential];
  if (v1)
  {
    id v2 = v1;
    [v1 setCredentialItem:0 forKey:*MEMORY[0x1E4F17970]];
    v1 = v2;
  }
}

- (void)aa_isPrimaryAccount
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Account Class is still not updated. Returning value from primaryAccount key.", v1, 2u);
}

- (void)aa_setAccountClass:()AppleAccount .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[ACAccount(AppleAccount) aa_setAccountClass:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_2_0(&dword_1A11D8000, a3, (uint64_t)a3, "[%s] called on %@, setting to: %@", (uint8_t *)&v3);
}

- (void)aa_updateAccountClassIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = @"NO";
  __int16 v5 = "-[ACAccount(AppleAccount) aa_updateAccountClassIfNecessary]";
  int v4 = 136315650;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  if (a2) {
    int v3 = @"YES";
  }
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1A11D8000, a3, (uint64_t)a3, "[%s] called on %@, should be primary: %@", (uint8_t *)&v4);
}

- (void)aa_hsaTokenWithError:()AppleAccount .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A11D8000, log, OS_LOG_TYPE_FAULT, "Method unsupported, does nothing, stop calling this", v1, 2u);
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  id v2 = @"YES";
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Updating FMF app (%@) tokens: ", (uint8_t *)&v1, 0xCu);
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  id v2 = @"YES";
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "Updating FMF (%@) tokens: ", (uint8_t *)&v1, 0xCu);
}

- (void)aa_updateTokensWithProvisioningResponse:()AppleAccount .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Saving CloudKit child account failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)aa_hasDuplicateAccount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch existing AppleAccounts, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Found duplicate ACAccount - AppleAccount alias matches: %@, %@");
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "aa_altDSID");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1A11D8000, a3, v5, "Found duplicate ACAccount - AppleAccount altDSID (%@) matches: %@, %@", v6);
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Found duplicate ACAccount - AppleAccount Username matches: %@, %@");
}

- (void)aa_isDuplicateAccount:()AppleAccount .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "aa_personID");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1A11D8000, a3, v5, "Found duplicate ACAccount - AppleAccount DSID (%@) matches: %@, %@", v6);
}

@end