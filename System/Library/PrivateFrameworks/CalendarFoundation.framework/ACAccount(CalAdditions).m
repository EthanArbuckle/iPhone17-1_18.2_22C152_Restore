@interface ACAccount(CalAdditions)
- (BOOL)calIsAutoRefreshed;
- (BOOL)calIsMissingParentAccount;
- (BOOL)calIsRestrictedForCalendar;
- (BOOL)removePrincipalWithUID:()CalAdditions;
- (__CFString)_schemeStringForUseSSL:()CalAdditions;
- (id)_accountPropertiesKeys;
- (id)_calDAVDataclassProperties;
- (id)_createExchangeWebServicesURLFromURL:()CalAdditions;
- (id)_diffAccountPropertiesWithAccount:()CalAdditions firstPropertyOnly:;
- (id)_diffPropertiesWithAccount:()CalAdditions firstPropertyOnly:;
- (id)_diffWithAccount:()CalAdditions firstPropertyOnly:;
- (id)_updateURL:()CalAdditions withHost:port:useSSL:;
- (id)calAccountFullName;
- (id)calCalDAVChildAccounts;
- (id)calExchangeWebServicesURL;
- (id)calExternalExchangeWebServicesURL;
- (id)calHostname;
- (id)calPort;
- (id)calPrincipalURLForMainPrincipal;
- (id)calPrincipalURLForPrincipalWithUID:()CalAdditions;
- (id)calPrincipals;
- (id)calServerURL;
- (id)calSyncingAccountUsingChildAccounts:()CalAdditions;
- (id)calTopLevelAccount;
- (id)firstDifferentPropertyWithAccount:()CalAdditions;
- (id)valueForAccountPropertyKey:()CalAdditions;
- (id)valueForKey:()CalAdditions forPrincipalWithUID:;
- (uint64_t)_dataclassIsEnabled:()CalAdditions;
- (uint64_t)_useSSLForSchemeString:()CalAdditions;
- (uint64_t)calAttachmentDownloadHasTakenPlace;
- (uint64_t)calCollectionSetName;
- (uint64_t)calExternalURL;
- (uint64_t)calIdentityEmailAddress;
- (uint64_t)calIsCalDAVAccount;
- (uint64_t)calIsDirty;
- (uint64_t)calIsEnabled;
- (uint64_t)calIsEnabledForCalendar;
- (uint64_t)calIsEnabledForReminders;
- (uint64_t)calIsExchangeAccount;
- (uint64_t)calIsGenericCalDAVAccount;
- (uint64_t)calIsiCloudCalDAVAccount;
- (uint64_t)calLocalDataMigrationHasTakenPlace;
- (uint64_t)calMainPrincipalUID;
- (uint64_t)calPushDisabled;
- (uint64_t)calRefreshInterval;
- (uint64_t)calRootFolderID;
- (uint64_t)calServerSyncHasTakenPlace;
- (uint64_t)calSkipCredentialVerification;
- (uint64_t)calSupportsPush;
- (uint64_t)calUseExternalURL;
- (uint64_t)calUseKerberos;
- (uint64_t)calUseSSL;
- (uint64_t)calWebServicesRecordGUID;
- (uint64_t)diffWithAccount:()CalAdditions;
- (uint64_t)setCalCollectionSetName:()CalAdditions;
- (uint64_t)setCalExternalURL:()CalAdditions;
- (uint64_t)setCalIdentityEmailAddress:()CalAdditions;
- (uint64_t)setCalIsEnabledForCalendar:()CalAdditions;
- (uint64_t)setCalIsEnabledForReminders:()CalAdditions;
- (uint64_t)setCalPrincipals:()CalAdditions;
- (uint64_t)setCalRootFolderID:()CalAdditions;
- (uint64_t)setCalWebServicesRecordGUID:()CalAdditions;
- (uint64_t)setValue:()CalAdditions forKey:forPrincipalWithUID:;
- (void)_setCalInternalValue:()CalAdditions forAccountPropertyKey:;
- (void)_setIsEnabled:()CalAdditions forDataclass:;
- (void)addPrincipal:()CalAdditions withUID:;
- (void)calHostname;
- (void)createDictionaryForPrincipalWithUID:()CalAdditions;
- (void)removeAccountPropertyForKey:()CalAdditions;
- (void)setCalAttachmentDownloadHasTakenPlace:()CalAdditions;
- (void)setCalHostname:()CalAdditions;
- (void)setCalLocalDataMigrationHasTakenPlace:()CalAdditions;
- (void)setCalMainPrincipalUID:()CalAdditions;
- (void)setCalPort:()CalAdditions;
- (void)setCalPushDisabled:()CalAdditions;
- (void)setCalRefreshInterval:()CalAdditions;
- (void)setCalServerSyncHasTakenPlace:()CalAdditions;
- (void)setCalServerURL:()CalAdditions;
- (void)setCalSkipCredentialVerification:()CalAdditions;
- (void)setCalUseExternalURL:()CalAdditions;
- (void)setCalUseKerberos:()CalAdditions;
- (void)setCalUseSSL:()CalAdditions;
@end

@implementation ACAccount(CalAdditions)

- (BOOL)calIsMissingParentAccount
{
  v2 = [a1 authenticationType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F17A58]])
  {
    v3 = [a1 parentAccount];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)calIsEnabledForCalendar
{
  return [a1 _dataclassIsEnabled:*MEMORY[0x1E4F17A80]];
}

- (uint64_t)_dataclassIsEnabled:()CalAdditions
{
  id v4 = a3;
  v5 = [a1 parentAccount];
  if (v5)
  {
    v6 = [a1 parentAccount];
    v7 = [v6 enabledDataclasses];
  }
  else
  {
    v7 = [a1 enabledDataclasses];
  }

  uint64_t v8 = [v7 containsObject:v4];
  return v8;
}

- (uint64_t)calIsEnabledForReminders
{
  return [a1 _dataclassIsEnabled:*MEMORY[0x1E4F17B08]];
}

- (id)calServerURL
{
  if ([a1 calIsCalDAVAccount])
  {
    v2 = [a1 calHostname];
    v3 = objc_msgSend(a1, "_schemeStringForUseSSL:", objc_msgSend(a1, "calUseSSL"));
    id v4 = [a1 calPort];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CB10] CDVDefaultPortForScheme:v3];
    }
    if ([v2 length] && v3 && v4)
    {
      v5 = [MEMORY[0x1E4F1CB10] CDVURLWithScheme:v3 host:v2 port:v4 path:0];

      goto LABEL_12;
    }
  }
  else if ([a1 calIsExchangeAccount])
  {
    v5 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F17680]];
    goto LABEL_12;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

- (uint64_t)calIsCalDAVAccount
{
  v1 = [a1 accountType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17770]];

  return v3;
}

- (id)calHostname
{
  if ([a1 calIsCalDAVAccount])
  {
    v2 = [a1 valueForAccountPropertyKey:*MEMORY[0x1E4F176A8]];
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = +[CalFoundationLogSubsystem accounts];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          [(ACAccount(CalAdditions) *)(uint64_t)v2 calHostname];
        }

        id v4 = 0;
        goto LABEL_12;
      }
    }
    id v3 = v2;
  }
  else
  {
    if (![a1 calIsExchangeAccount])
    {
      id v4 = 0;
      goto LABEL_13;
    }
    v2 = [a1 calServerURL];
    id v3 = [v2 host];
  }
  id v4 = v3;
LABEL_12:

LABEL_13:

  return v4;
}

- (id)valueForAccountPropertyKey:()CalAdditions
{
  id v4 = a3;
  if (([a1 calIsExchangeAccount] & 1) != 0
    || ([a1 _calDAVDataclassProperties],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    v7 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17A80]];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
  }
  else if ([a1 calIsCalDAVAccount])
  {
    uint64_t v8 = [a1 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)calUseSSL
{
  if ([a1 calIsCalDAVAccount])
  {
    v2 = [a1 valueForAccountPropertyKey:*MEMORY[0x1E4F17718]];
    uint64_t v3 = [v2 BOOLValue];
  }
  else
  {
    if (![a1 calIsExchangeAccount]) {
      return 0;
    }
    v2 = [a1 calServerURL];
    id v4 = [v2 scheme];
    uint64_t v3 = [a1 _useSSLForSchemeString:v4];
  }
  return v3;
}

- (__CFString)_schemeStringForUseSSL:()CalAdditions
{
  if (a3) {
    return @"https";
  }
  else {
    return @"http";
  }
}

- (id)calPort
{
  if ([a1 calIsCalDAVAccount])
  {
    v2 = [a1 valueForAccountPropertyKey:*MEMORY[0x1E4F176F0]];
  }
  else if ([a1 calIsExchangeAccount])
  {
    uint64_t v3 = [a1 calServerURL];
    v2 = [v3 port];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)valueForKey:()CalAdditions forPrincipalWithUID:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 calPrincipals];
  v9 = [v8 objectForKeyedSubscript:v6];

  v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)calPrincipals
{
  v1 = [a1 valueForAccountPropertyKey:@"CalDAVPrincipals"];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v4 = v3;

  return v4;
}

- (uint64_t)calMainPrincipalUID
{
  return [a1 valueForAccountPropertyKey:@"CalDAVMainPrincipalUID"];
}

- (uint64_t)calIsExchangeAccount
{
  v1 = [a1 accountType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17798]];

  return v3;
}

- (uint64_t)calIsEnabled
{
  if ([a1 calIsEnabledForCalendar]) {
    return 1;
  }

  return [a1 calIsEnabledForReminders];
}

- (uint64_t)calUseKerberos
{
  v1 = [a1 valueForAccountPropertyKey:@"kCalDAVUseKerberos"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)calRefreshInterval
{
  v1 = [a1 valueForAccountPropertyKey:@"kCalDAVRefreshIntervalKey"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 900;
  }

  return v3;
}

- (uint64_t)calPushDisabled
{
  v1 = [a1 valueForAccountPropertyKey:@"kCalDAVPushDisabled"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)calCollectionSetName
{
  return [a1 valueForAccountPropertyKey:@"kCalDAVCollectionSetName"];
}

- (uint64_t)calWebServicesRecordGUID
{
  return [a1 valueForAccountPropertyKey:@"kCalDAVWebServicesRecordGUID"];
}

- (id)calCalDAVChildAccounts
{
  v1 = [a1 childAccounts];
  uint64_t v2 = [v1 CalFilter:&__block_literal_global_34];

  return v2;
}

- (BOOL)calIsAutoRefreshed
{
  return [a1 calRefreshInterval] > 0;
}

- (uint64_t)calIsGenericCalDAVAccount
{
  uint64_t v2 = [a1 parentAccount];
  if (v2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [a1 calIsCalDAVAccount];
  }

  return v3;
}

- (BOOL)calIsRestrictedForCalendar
{
  uint64_t v2 = [a1 parentAccount];
  uint64_t v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)v2;
  }
  else {
    id v4 = a1;
  }
  id v5 = v4;

  id v6 = [v5 accountType];

  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F17750]];

  if (!v8) {
    return 0;
  }
  CFBooleanRef v9 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"DisableCalendariCloudSetting", @"com.apple.icloud.managed");
  if (!v9) {
    return 0;
  }
  CFBooleanRef v10 = v9;
  CFTypeID v11 = CFGetTypeID(v9);
  BOOL v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v10) != 0;
  CFRelease(v10);
  return v12;
}

- (id)calAccountFullName
{
  uint64_t v2 = [a1 calMainPrincipalUID];
  uint64_t v3 = [a1 valueForKey:@"FullName" forPrincipalWithUID:v2];

  return v3;
}

- (void)setCalHostname:()CalAdditions
{
  id v4 = a3;
  if (![a1 calIsCalDAVAccount])
  {
    if (![a1 calIsExchangeAccount]) {
      goto LABEL_10;
    }
    id v5 = [a1 calServerURL];
    id v6 = [a1 _updateURL:v5 withHost:v4 port:0 useSSL:0];
    [a1 setCalServerURL:v6];

LABEL_9:
    goto LABEL_10;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(ACAccount(CalAdditions) *)a1 setCalHostname:v5];
      }
      goto LABEL_9;
    }
  }
  [a1 _setCalInternalValue:v4 forAccountPropertyKey:*MEMORY[0x1E4F176A8]];
LABEL_10:
}

- (uint64_t)setCalIsEnabledForCalendar:()CalAdditions
{
  return [a1 _setIsEnabled:a3 forDataclass:*MEMORY[0x1E4F17A80]];
}

- (uint64_t)setCalIsEnabledForReminders:()CalAdditions
{
  uint64_t result = CalIsReminderBridgeEnabled();
  if ((result & 1) == 0)
  {
    uint64_t v6 = *MEMORY[0x1E4F17B08];
    return [a1 _setIsEnabled:a3 forDataclass:v6];
  }
  return result;
}

- (void)setCalMainPrincipalUID:()CalAdditions
{
  id v4 = a3;
  [a1 _setCalInternalValue:v4 forAccountPropertyKey:@"CalDAVMainPrincipalUID"];
  [a1 createDictionaryForPrincipalWithUID:v4];
}

- (void)setCalPort:()CalAdditions
{
  id v6 = a3;
  if ([a1 calIsCalDAVAccount])
  {
    [a1 _setCalInternalValue:v6 forAccountPropertyKey:*MEMORY[0x1E4F176F0]];
  }
  else if ([a1 calIsExchangeAccount])
  {
    id v4 = [a1 calServerURL];
    id v5 = [a1 _updateURL:v4 withHost:0 port:v6 useSSL:0];
    [a1 setCalServerURL:v5];
  }
}

- (uint64_t)setCalPrincipals:()CalAdditions
{
  return [a1 _setCalInternalValue:a3 forAccountPropertyKey:@"CalDAVPrincipals"];
}

- (void)setCalPushDisabled:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"kCalDAVPushDisabled"];
}

- (void)setCalRefreshInterval:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"kCalDAVRefreshIntervalKey"];
}

- (void)setCalServerURL:()CalAdditions
{
  id v7 = a3;
  if ([a1 calIsCalDAVAccount])
  {
    id v4 = [v7 host];
    [a1 setCalHostname:v4];

    id v5 = [v7 port];
    [a1 setCalPort:v5];

    id v6 = [v7 scheme];
    objc_msgSend(a1, "setCalUseSSL:", objc_msgSend(a1, "_useSSLForSchemeString:", v6));
  }
  else if ([a1 calIsExchangeAccount])
  {
    [a1 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F17680]];
  }
}

- (void)setCalUseSSL:()CalAdditions
{
  if ([a1 calIsCalDAVAccount])
  {
    id v7 = [NSNumber numberWithBool:a3];
    objc_msgSend(a1, "_setCalInternalValue:forAccountPropertyKey:");
  }
  else
  {
    if (![a1 calIsExchangeAccount]) {
      return;
    }
    id v7 = [a1 calServerURL];
    id v5 = [NSNumber numberWithBool:a3];
    id v6 = [a1 _updateURL:v7 withHost:0 port:0 useSSL:v5];
    [a1 setCalServerURL:v6];
  }
}

- (uint64_t)calSupportsPush
{
  id v2 = [a1 accountStore];
  uint64_t v3 = [v2 isPushSupportedForAccount:a1];

  return v3;
}

- (uint64_t)calLocalDataMigrationHasTakenPlace
{
  v1 = [a1 valueForAccountPropertyKey:@"CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)calServerSyncHasTakenPlace
{
  v1 = [a1 valueForAccountPropertyKey:@"CalAccountPropertyCalDAVSyncHasTakenPlace"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)calAttachmentDownloadHasTakenPlace
{
  v1 = [a1 valueForAccountPropertyKey:@"CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)calSkipCredentialVerification
{
  v1 = [a1 valueForAccountPropertyKey:@"CalAccountPropertyCalDAVSkipCredentialVerification"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)setCalCollectionSetName:()CalAdditions
{
  return [a1 _setCalInternalValue:a3 forAccountPropertyKey:@"kCalDAVCollectionSetName"];
}

- (void)setCalLocalDataMigrationHasTakenPlace:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace"];
}

- (void)setCalServerSyncHasTakenPlace:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"CalAccountPropertyCalDAVSyncHasTakenPlace"];
}

- (void)setCalAttachmentDownloadHasTakenPlace:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace"];
}

- (void)setCalSkipCredentialVerification:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"CalAccountPropertyCalDAVSkipCredentialVerification"];
}

- (void)setCalUseKerberos:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"kCalDAVUseKerberos"];
}

- (uint64_t)setCalWebServicesRecordGUID:()CalAdditions
{
  return [a1 _setCalInternalValue:a3 forAccountPropertyKey:@"kCalDAVWebServicesRecordGUID"];
}

- (uint64_t)calIsiCloudCalDAVAccount
{
  id v2 = [a1 accountType];
  uint64_t v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17770]];

  if (!v4) {
    return 0;
  }
  id v5 = [a1 parentAccount];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 accountType];
    int v8 = [v7 identifier];
    uint64_t v9 = [v8 isEqualToString:*MEMORY[0x1E4F17750]];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)calExchangeWebServicesURL
{
  id v2 = [a1 calServerURL];
  uint64_t v3 = [a1 _createExchangeWebServicesURLFromURL:v2];

  return v3;
}

- (id)calExternalExchangeWebServicesURL
{
  id v2 = [a1 calExternalURL];
  uint64_t v3 = [a1 _createExchangeWebServicesURLFromURL:v2];

  return v3;
}

- (uint64_t)calExternalURL
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F17678]];
}

- (uint64_t)calIdentityEmailAddress
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F176C8]];
}

- (uint64_t)calIsDirty
{
  if ([a1 isDirty]) {
    return 1;
  }
  uint64_t v3 = [a1 dirtyAccountProperties];
  BOOL v2 = [v3 count] != 0;

  return v2;
}

- (uint64_t)calRootFolderID
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F17688]];
}

- (uint64_t)calUseExternalURL
{
  v1 = [a1 valueForAccountPropertyKey:@"CalAccountPropertyExchangeUseExternalURL"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)setCalExternalURL:()CalAdditions
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F17678]];
}

- (uint64_t)setCalIdentityEmailAddress:()CalAdditions
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F176C8]];
}

- (uint64_t)setCalRootFolderID:()CalAdditions
{
  return [a1 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F17688]];
}

- (void)setCalUseExternalURL:()CalAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setCalInternalValue:v2 forAccountPropertyKey:@"CalAccountPropertyExchangeUseExternalURL"];
}

- (void)addPrincipal:()CalAdditions withUID:
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && [v7 length])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
    CFBooleanRef v10 = [a1 calPrincipals];
    CFTypeID v11 = [v9 dictionaryWithDictionary:v10];

    [v11 setObject:v6 forKeyedSubscript:v8];
    [a1 setCalPrincipals:v11];
  }
  else
  {
    BOOL v12 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACAccount(CalAdditions) addPrincipal:withUID:]();
    }
  }
}

- (id)calPrincipalURLForMainPrincipal
{
  id v2 = [a1 calMainPrincipalUID];
  uint64_t v3 = [a1 calPrincipalURLForPrincipalWithUID:v2];

  return v3;
}

- (id)calPrincipalURLForPrincipalWithUID:()CalAdditions
{
  int v4 = [a1 valueForKey:@"PrincipalPath" forPrincipalWithUID:a3];
  id v5 = [a1 calServerURL];
  if (v5 && [v4 length])
  {
    id v6 = [v5 CDVURLWithPath:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)createDictionaryForPrincipalWithUID:()CalAdditions
{
  id v6 = a3;
  int v4 = [a1 calPrincipals];
  id v5 = [v4 objectForKeyedSubscript:v6];

  if (!v5) {
    [a1 addPrincipal:MEMORY[0x1E4F1CC08] withUID:v6];
  }
}

- (uint64_t)diffWithAccount:()CalAdditions
{
  return [a1 _diffWithAccount:a3 firstPropertyOnly:0];
}

- (id)firstDifferentPropertyWithAccount:()CalAdditions
{
  uint64_t v3 = [a1 _diffWithAccount:a3 firstPropertyOnly:1];
  int v4 = [v3 anyObject];

  return v4;
}

- (void)removeAccountPropertyForKey:()CalAdditions
{
  id v12 = a3;
  if (([a1 calIsExchangeAccount] & 1) != 0
    || ([a1 _calDAVDataclassProperties],
        int v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsObject:v12],
        v4,
        v5))
  {
    uint64_t v6 = *MEMORY[0x1E4F17A80];
    uint64_t v7 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17A80]];
    if (v7)
    {
      int v8 = (void *)v7;
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
      CFBooleanRef v10 = [a1 propertiesForDataclass:v6];
      CFTypeID v11 = [v9 dictionaryWithDictionary:v10];

      if (v11)
      {
        [v11 removeObjectForKey:v12];
        [a1 setProperties:v11 forDataclass:v6];
      }
    }
  }
  else if ([a1 calIsCalDAVAccount])
  {
    [a1 setObject:0 forKeyedSubscript:v12];
  }
}

- (BOOL)removePrincipalWithUID:()CalAdditions
{
  id v4 = a3;
  int v5 = [a1 calPrincipals];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
    int v8 = [a1 calPrincipals];
    uint64_t v9 = [v7 dictionaryWithDictionary:v8];

    [v9 removeObjectForKey:v4];
    [a1 setCalPrincipals:v9];
  }
  return v6 != 0;
}

- (uint64_t)setValue:()CalAdditions forKey:forPrincipalWithUID:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    CFTypeID v11 = [a1 valueForKey:v9 forPrincipalWithUID:v10];
    int v12 = [v11 isEqual:v8];

    if (!v12)
    {
      [a1 createDictionaryForPrincipalWithUID:v10];
      v15 = (void *)MEMORY[0x1E4F1CA60];
      v16 = [a1 calPrincipals];
      v17 = [v16 objectForKeyedSubscript:v10];
      v18 = [v15 dictionaryWithDictionary:v17];

      [v18 setObject:v8 forKeyedSubscript:v9];
      [a1 addPrincipal:v18 withUID:v10];

      uint64_t v14 = 1;
      goto LABEL_9;
    }
    v13 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412802;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = a1;
      _os_log_impl(&dword_190D88000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to set %@ on principal with UID %@ by using its current value. This is a no-op change, and we won't dirty the account by making it. %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    v13 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = a1;
      _os_log_error_impl(&dword_190D88000, v13, OS_LOG_TYPE_ERROR, "Attempting to set %@ on principal with UID %@ by using a nil key. %@", (uint8_t *)&v20, 0x20u);
    }
  }

  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)calSyncingAccountUsingChildAccounts:()CalAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 accountType];
  uint64_t v6 = [v5 syncableDataclasses];
  uint64_t v7 = *MEMORY[0x1E4F17A80];
  int v8 = [v6 containsObject:*MEMORY[0x1E4F17A80]];

  if (v8)
  {
    id v9 = a1;
  }
  else
  {
    if (!v4)
    {
      id v4 = [a1 childAccounts];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v4;
    uint64_t v10 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v4);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "accountType", (void)v20);
          v16 = [v15 syncableDataclasses];
          char v17 = [v16 containsObject:v7];

          if (v17)
          {
            id v9 = v14;

            goto LABEL_17;
          }
        }
        uint64_t v11 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v18 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACAccount(CalAdditions) calSyncingAccountUsingChildAccounts:](a1);
    }

    id v9 = 0;
  }
LABEL_17:

  return v9;
}

- (id)_accountPropertiesKeys
{
  if ([a1 calIsCalDAVAccount])
  {
    id v2 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v3 = [a1 _calDAVDataclassProperties];
    id v4 = [v3 allObjects];
    int v5 = [v2 arrayWithArray:v4];

    uint64_t v6 = [a1 accountProperties];
    uint64_t v7 = [v6 allKeys];
    [v5 addObjectsFromArray:v7];
  }
  else
  {
    if (![a1 calIsExchangeAccount]) {
      goto LABEL_7;
    }
    uint64_t v6 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17A80]];
    int v5 = [v6 allKeys];
  }

  if (v5)
  {
    int v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

    goto LABEL_8;
  }
LABEL_7:
  int v8 = 0;
LABEL_8:

  return v8;
}

- (id)_createExchangeWebServicesURLFromURL:()CalAdditions
{
  id v4 = a3;
  int v5 = [v4 user];
  if ([v5 length]) {
    goto LABEL_2;
  }
  int v8 = [a1 username];
  uint64_t v9 = [v8 length];

  uint64_t v6 = v4;
  if (v9)
  {
    int v5 = [v4 resourceSpecifier];
    if ([v5 hasPrefix:@"//"])
    {
      uint64_t v10 = [v4 scheme];
      uint64_t v11 = [a1 username];
      uint64_t v12 = [MEMORY[0x1E4F28B88] URLUserAllowedCharacterSet];
      v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

      uint64_t v14 = [v5 substringFromIndex:2];
      v15 = [NSString stringWithFormat:@"%@://%@@%@", v10, v13, v14];
      uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v15];

      goto LABEL_3;
    }
LABEL_2:
    uint64_t v6 = v4;
LABEL_3:
  }

  return v6;
}

- (id)_diffWithAccount:()CalAdditions firstPropertyOnly:
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  int v8 = [a1 _diffAccountPropertiesWithAccount:v6 firstPropertyOnly:a4];
  [v7 unionSet:v8];

  if (![v7 count] || (a4 & 1) == 0)
  {
    uint64_t v9 = [a1 _diffPropertiesWithAccount:v6 firstPropertyOnly:a4];
    [v7 unionSet:v9];
  }

  return v7;
}

- (id)_diffAccountPropertiesWithAccount:()CalAdditions firstPropertyOnly:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  int v8 = [a1 _accountPropertiesKeys];
  [v7 unionSet:v8];

  uint64_t v9 = [v6 _accountPropertiesKeys];
  [v7 unionSet:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [a1 valueForAccountPropertyKey:v15];
        uint64_t v17 = [v6 valueForAccountPropertyKey:v15];
        if (v16 | v17)
        {
          if (([(id)v16 isEqual:v17] & 1) == 0)
          {
            [v19 addObject:v15];
            if (a4)
            {

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v19;
}

- (id)_diffPropertiesWithAccount:()CalAdditions firstPropertyOnly:
{
  id v7 = a3;
  int v8 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 1;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __72__ACAccount_CalAdditions___diffPropertiesWithAccount_firstPropertyOnly___block_invoke;
  v57[3] = &unk_1E56CEAD0;
  v59 = &v61;
  id v9 = v8;
  id v58 = v9;
  char v60 = a4;
  id v10 = (void (**)(void))MEMORY[0x192FD8850](v57);
  if (*((unsigned char *)v62 + 24))
  {
    uint64_t v11 = [a1 accountDescription];
    if (v11 || ([v7 accountDescription], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [a1 accountDescription];
      uint64_t v13 = [v7 accountDescription];
      char v14 = [v12 isEqual:v13];

      if (v11)
      {

        if (v14) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      if ((v14 & 1) == 0)
      {
LABEL_8:
        [v9 addObject:@"accountDescription"];
        v10[2](v10);
      }
    }
  }
LABEL_9:
  if (*((unsigned char *)v62 + 24))
  {
    int v15 = [a1 isActive];
    if (v15 != [v7 isActive])
    {
      [v9 addObject:@"active"];
      v10[2](v10);
    }
  }
  if (*((unsigned char *)v62 + 24))
  {
    int v16 = [a1 isAuthenticated];
    if (v16 != [v7 isAuthenticated])
    {
      [v9 addObject:@"authenticated"];
      v10[2](v10);
    }
  }
  if (*((unsigned char *)v62 + 24))
  {
    uint64_t v17 = [a1 credential];
    if (v17 || ([v7 credential], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = [a1 credential];
      id v19 = [v7 credential];
      char v20 = [v18 isEqual:v19];

      if (v17)
      {

        if (v20) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }

      if ((v20 & 1) == 0)
      {
LABEL_22:
        [v9 addObject:@"credential"];
        v10[2](v10);
      }
    }
  }
LABEL_23:
  if (*((unsigned char *)v62 + 24))
  {
    long long v21 = [a1 enabledDataclasses];
    if (v21 || ([v7 enabledDataclasses], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v22 = [a1 enabledDataclasses];
      long long v23 = [v7 enabledDataclasses];
      char v24 = [v22 isEqual:v23];

      if (v21)
      {

        if (v24) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }

      if ((v24 & 1) == 0)
      {
LABEL_30:
        [v9 addObject:@"enabledDataclasses"];
        v10[2](v10);
      }
    }
  }
LABEL_31:
  if (*((unsigned char *)v62 + 24))
  {
    uint64_t v25 = [a1 provisionedDataclasses];
    if (v25 || ([v7 provisionedDataclasses], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v26 = [a1 provisionedDataclasses];
      v27 = [v7 provisionedDataclasses];
      char v28 = [v26 isEqual:v27];

      if (v25)
      {

        if (v28) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }

      if ((v28 & 1) == 0)
      {
LABEL_38:
        [v9 addObject:@"provisionedDataclasses"];
        v10[2](v10);
      }
    }
  }
LABEL_39:
  if (*((unsigned char *)v62 + 24))
  {
    v29 = [a1 username];
    if (v29 || ([v7 username], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = [a1 username];
      v31 = [v7 username];
      char v32 = [v30 isEqual:v31];

      if (v29)
      {

        if (v32) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }

      if ((v32 & 1) == 0)
      {
LABEL_46:
        [v9 addObject:@"username"];
        v10[2](v10);
      }
    }
  }
LABEL_47:
  if (*((unsigned char *)v62 + 24))
  {
    int v33 = [a1 isVisible];
    if (v33 != [v7 isVisible])
    {
      [v9 addObject:@"visible"];
      v10[2](v10);
    }
  }
  if (*((unsigned char *)v62 + 24))
  {
    v34 = [a1 accountType];
    if (v34 || ([v7 accountType], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v35 = [a1 accountType];
      v36 = [v7 accountType];
      char v37 = [v35 isEqual:v36];

      if (v34)
      {

        if (v37) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }

      if ((v37 & 1) == 0)
      {
LABEL_57:
        [v9 addObject:@"accountType"];
        v10[2](v10);
      }
    }
  }
LABEL_58:
  if (*((unsigned char *)v62 + 24))
  {
    v38 = [a1 creationDate];
    if (v38 || ([v7 creationDate], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v39 = [a1 creationDate];
      v40 = [v7 creationDate];
      char v41 = [v39 isEqual:v40];

      if (v38)
      {

        if (v41) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }

      if ((v41 & 1) == 0)
      {
LABEL_65:
        [v9 addObject:@"creationDate"];
        v10[2](v10);
      }
    }
  }
LABEL_66:
  if (*((unsigned char *)v62 + 24))
  {
    v42 = [a1 identifier];
    if (v42 || ([v7 identifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v43 = [a1 identifier];
      v44 = [v7 identifier];
      char v45 = [v43 isEqual:v44];

      if (v42)
      {

        if (v45) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }

      if ((v45 & 1) == 0)
      {
LABEL_73:
        [v9 addObject:@"identifier"];
        v10[2](v10);
      }
    }
  }
LABEL_74:
  if (*((unsigned char *)v62 + 24))
  {
    v46 = [a1 owningBundleID];
    if (v46 || ([v7 owningBundleID], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v47 = [a1 owningBundleID];
      v48 = [v7 owningBundleID];
      char v49 = [v47 isEqual:v48];

      if (v46)
      {

        if (v49) {
          goto LABEL_82;
        }
        goto LABEL_81;
      }

      if ((v49 & 1) == 0)
      {
LABEL_81:
        [v9 addObject:@"owningBundleID"];
        v10[2](v10);
      }
    }
  }
LABEL_82:
  if (*((unsigned char *)v62 + 24))
  {
    v50 = [a1 parentAccountIdentifier];
    if (v50 || ([v7 parentAccountIdentifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v51 = [a1 parentAccountIdentifier];
      v52 = [v7 parentAccountIdentifier];
      char v53 = [v51 isEqual:v52];

      if (v50)
      {

        if (v53) {
          goto LABEL_90;
        }
        goto LABEL_89;
      }

      if ((v53 & 1) == 0)
      {
LABEL_89:
        [v9 addObject:@"parentAccountIdentifier"];
        v10[2](v10);
      }
    }
  }
LABEL_90:
  if (*((unsigned char *)v62 + 24))
  {
    int v54 = [a1 supportsAuthentication];
    if (v54 != [v7 supportsAuthentication])
    {
      [v9 addObject:@"supportsAuthentication"];
      v10[2](v10);
    }
  }
  id v55 = v9;

  _Block_object_dispose(&v61, 8);

  return v55;
}

- (void)_setIsEnabled:()CalAdditions forDataclass:
{
  id v6 = a4;
  id v7 = [a1 parentAccount];

  if (v7)
  {
    int v8 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACAccount(CalAdditions) _setIsEnabled:forDataclass:]((uint64_t)v6, (uint64_t)a1, v8);
    }
  }
  else if ([a1 _dataclassIsEnabled:v6] != a3)
  {
    [a1 setEnabled:a3 forDataclass:v6];
  }
}

- (void)_setCalInternalValue:()CalAdditions forAccountPropertyKey:
{
  id v22 = a3;
  id v6 = a4;
  if (v22)
  {
    if (([a1 calIsExchangeAccount] & 1) != 0
      || ([a1 _calDAVDataclassProperties],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 containsObject:v6],
          v7,
          v8))
    {
      uint64_t v9 = *MEMORY[0x1E4F17A80];
      id v10 = [a1 propertiesForDataclass:*MEMORY[0x1E4F17A80]];
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
      if (v10)
      {
        uint64_t v12 = [a1 propertiesForDataclass:v9];
        uint64_t v13 = [v11 dictionaryWithDictionary:v12];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      }

      uint64_t v14 = [v13 objectForKeyedSubscript:v6];
      if (!v14
        || (int v15 = (void *)v14,
            [v13 objectForKeyedSubscript:v6],
            int v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 isEqual:v22],
            v16,
            v15,
            (v17 & 1) == 0))
      {
        [v13 setObject:v22 forKeyedSubscript:v6];
        [a1 setProperties:v13 forDataclass:v9];
      }
    }
    else if ([a1 calIsCalDAVAccount])
    {
      uint64_t v18 = [a1 objectForKeyedSubscript:v6];
      if (!v18
        || (id v19 = (void *)v18,
            [a1 objectForKeyedSubscript:v6],
            char v20 = objc_claimAutoreleasedReturnValue(),
            char v21 = [v20 isEqual:v22],
            v20,
            v19,
            (v21 & 1) == 0))
      {
        [a1 setObject:v22 forKeyedSubscript:v6];
      }
    }
  }
  else
  {
    [a1 removeAccountPropertyForKey:v6];
  }
}

- (id)_calDAVDataclassProperties
{
  if (_calDAVDataclassProperties_onceToken != -1) {
    dispatch_once(&_calDAVDataclassProperties_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)_calDAVDataclassProperties_calDAVDataclassProperties;

  return v0;
}

- (id)_updateURL:()CalAdditions withHost:port:useSSL:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  uint64_t v14 = v13;
  if (v10) {
    [v13 setHost:v10];
  }
  if (v11) {
    [v14 setPort:v11];
  }
  if (v12)
  {
    int v15 = objc_msgSend(a1, "_schemeStringForUseSSL:", objc_msgSend(v12, "BOOLValue"));
    [v14 setScheme:v15];
  }
  int v16 = [v14 URL];

  return v16;
}

- (uint64_t)_useSSLForSchemeString:()CalAdditions
{
  uint64_t v3 = [a3 lowercaseString];
  uint64_t v4 = [v3 isEqualToString:@"https"];

  return v4;
}

- (id)calTopLevelAccount
{
  id v1 = a1;
  id v2 = [v1 parentAccount];

  if (v2)
  {
    do
    {
      uint64_t v3 = [v1 parentAccount];

      uint64_t v4 = [v3 parentAccount];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    uint64_t v3 = v1;
  }

  return v3;
}

- (void)calHostname
{
  id v7 = [a2 identifier];
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)setCalHostname:()CalAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = [a1 identifier];
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  id v6 = v5;
  _os_log_fault_impl(&dword_190D88000, a3, OS_LOG_TYPE_FAULT, "Ignoring attempt to set Hostname for account %{public}@ to something that's not a string (%@, which is a %{public}@)", v7, 0x20u);
}

- (void)addPrincipal:()CalAdditions withUID:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);
}

- (void)calSyncingAccountUsingChildAccounts:()CalAdditions .cold.1(void *a1)
{
  id v6 = [a1 identifier];
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

- (void)_setIsEnabled:()CalAdditions forDataclass:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Attempting to enable/disable %@ on a child account %@.", (uint8_t *)&v3, 0x16u);
}

@end