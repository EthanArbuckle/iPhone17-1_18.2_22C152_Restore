@interface ACAccount(AppleAccount_Internal)
- (uint64_t)_aa_appProvidedContext;
- (uint64_t)_aa_benefactorAccount;
- (uint64_t)_aa_primaryAccountUpdaterVersion;
- (uint64_t)_aa_setAppProvidedContext:()AppleAccount_Internal;
- (uint64_t)_aa_setPrimaryAccountUpdaterVersion:()AppleAccount_Internal;
- (void)_aa_setBenefactorAccount:()AppleAccount_Internal;
- (void)_aa_setLastAgreedTermsInfo:()AppleAccount_Internal;
- (void)_aa_setPersonID:()AppleAccount_Internal;
@end

@implementation ACAccount(AppleAccount_Internal)

- (uint64_t)_aa_benefactorAccount
{
  v1 = [a1 accountPropertyForKey:@"benefactorAccount"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_aa_setBenefactorAccount:()AppleAccount_Internal
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"benefactorAccount"];
}

- (void)_aa_setPersonID:()AppleAccount_Internal
{
  id v4 = a3;
  if ([v4 length]) {
    [a1 setAccountProperty:v4 forKey:@"personID"];
  }
}

- (void)_aa_setLastAgreedTermsInfo:()AppleAccount_Internal
{
  id v4 = a3;
  if ([v4 count]) {
    [a1 setAccountProperty:v4 forKey:@"lastAgreedTerms"];
  }
}

- (uint64_t)_aa_primaryAccountUpdaterVersion
{
  return [a1 objectForKeyedSubscript:@"AAPrimaryAccountUpdaterVersion"];
}

- (uint64_t)_aa_setPrimaryAccountUpdaterVersion:()AppleAccount_Internal
{
  return [a1 setObject:a3 forKeyedSubscript:@"AAPrimaryAccountUpdaterVersion"];
}

- (uint64_t)_aa_appProvidedContext
{
  return [a1 accountPropertyForKey:@"tempForSignIn_apc"];
}

- (uint64_t)_aa_setAppProvidedContext:()AppleAccount_Internal
{
  return [a1 setAccountProperty:a3 forKey:@"tempForSignIn_apc"];
}

@end