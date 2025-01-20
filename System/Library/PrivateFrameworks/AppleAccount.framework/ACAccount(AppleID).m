@interface ACAccount(AppleID)
- (BOOL)canRemoveAccount;
- (id)normalizedDSID;
- (uint64_t)_registeredBundles;
- (uint64_t)dsid;
- (uint64_t)setDSID:()AppleID;
@end

@implementation ACAccount(AppleID)

- (uint64_t)setDSID:()AppleID
{
  return [a1 setAccountProperty:a3 forKey:*MEMORY[0x1E4F4D8E0]];
}

- (uint64_t)dsid
{
  return [a1 accountPropertyForKey:*MEMORY[0x1E4F4D8E0]];
}

- (id)normalizedDSID
{
  uint64_t v2 = [a1 accountPropertyForKey:*MEMORY[0x1E4F4D8E0]];
  if (!v2
    || (v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v3 stringValue],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        (v3 = (void *)v4) == 0))
  {
    v5 = [a1 accountType];
    v6 = [v5 identifier];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F17808]];

    if (!v7
      || ([a1 accountPropertyForKey:@"profile-id"],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 stringByReplacingOccurrencesOfString:@"D:" withString:&stru_1EF456870],
          v3 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      v9 = [a1 accountType];
      v10 = [v9 identifier];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F17750]];

      if (v11)
      {
        v3 = [a1 accountPropertyForKey:@"personID"];
      }
      else
      {
        v3 = 0;
      }
    }
  }

  return v3;
}

- (uint64_t)_registeredBundles
{
  return [a1 accountPropertyForKey:@"bundleRef"];
}

- (BOOL)canRemoveAccount
{
  v1 = [a1 _registeredBundles];
  BOOL v2 = [v1 count] == 0;

  return v2;
}

@end