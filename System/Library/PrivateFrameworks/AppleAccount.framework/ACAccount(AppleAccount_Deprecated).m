@interface ACAccount(AppleAccount_Deprecated)
- (BOOL)aa_needsRegistration;
- (BOOL)aa_serviceUnavailable;
- (id)aa_accountFirstDisplayAlert;
- (id)aa_accountFooterButton;
- (id)aa_accountFooterText;
- (id)aa_accountTypeString;
- (id)aa_serviceUnavailableInfo;
- (uint64_t)aa_isSyncedAccount;
- (uint64_t)aa_protocolVersion;
- (uint64_t)aa_syncStoreIdentifier;
- (void)aa_setSyncedAccount:()AppleAccount_Deprecated;
@end

@implementation ACAccount(AppleAccount_Deprecated)

- (uint64_t)aa_isSyncedAccount
{
  v1 = [a1 accountPropertyForKey:@"syncedAccount"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)aa_setSyncedAccount:()AppleAccount_Deprecated
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"syncedAccount"];
}

- (BOOL)aa_needsRegistration
{
  id v2 = [a1 dataclassProperties];
  if (v2)
  {
    v3 = objc_msgSend(a1, "aa_personID");
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)aa_serviceUnavailable
{
  v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Account"];
  id v2 = v1;
  if (v1)
  {
    v3 = [v1 objectForKey:@"notAvailable"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)aa_serviceUnavailableInfo
{
  v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Account"];
  id v2 = v1;
  if (v1)
  {
    v3 = [v1 objectForKey:@"notAvailable"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)aa_protocolVersion
{
  return [a1 accountPropertyForKey:@"protocolVersion"];
}

- (uint64_t)aa_syncStoreIdentifier
{
  return 0;
}

- (id)aa_accountTypeString
{
  v1 = [a1 accountType];
  id v2 = [v1 accountTypeDescription];

  return v2;
}

- (id)aa_accountFooterText
{
  v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Account"];
  id v2 = v1;
  if (v1)
  {
    v3 = [v1 objectForKey:@"accountFooterText"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)aa_accountFooterButton
{
  v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Account"];
  id v2 = v1;
  if (v1)
  {
    v3 = [v1 objectForKey:@"accountFooterButton"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)aa_accountFirstDisplayAlert
{
  v1 = [a1 propertiesForDataclass:@"com.apple.Dataclass.Account"];
  id v2 = v1;
  if (v1)
  {
    v3 = [v1 objectForKey:@"firstDisplayAlert"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end