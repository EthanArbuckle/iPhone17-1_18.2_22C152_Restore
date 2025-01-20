@interface NSDictionary(FTRegAppleIDSetupUtilities)
- (BOOL)__ftreg_isValidSetupDictionary;
- (id)__ftreg_candidateAliases;
- (id)__ftreg_responseProfileID;
- (uint64_t)__ftreg_responseAppleID;
- (uint64_t)__ftreg_responseAuthToken;
- (uint64_t)__ftreg_responseIsUpgrade;
@end

@implementation NSDictionary(FTRegAppleIDSetupUtilities)

- (uint64_t)__ftreg_responseAppleID
{
  return [a1 objectForKey:@"apple-id"];
}

- (id)__ftreg_responseProfileID
{
  v2 = [a1 objectForKey:@"realm-user-id"];
  if (![v2 length])
  {
    uint64_t v3 = [a1 objectForKey:@"profile-id"];

    v2 = (void *)v3;
  }
  return v2;
}

- (uint64_t)__ftreg_responseAuthToken
{
  return [a1 objectForKey:@"auth-token"];
}

- (uint64_t)__ftreg_responseIsUpgrade
{
  v1 = [a1 objectForKey:@"isUpgrade"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)__ftreg_isValidSetupDictionary
{
  uint64_t v2 = objc_msgSend(a1, "__ftreg_responseAppleID");
  uint64_t v3 = v2;
  if (v2 && [v2 length])
  {
    v4 = objc_msgSend(a1, "__ftreg_responseProfileID");
    v5 = v4;
    if (v4 && [v4 length])
    {
      v6 = objc_msgSend(a1, "__ftreg_responseAuthToken");
      v7 = v6;
      if (v6) {
        BOOL v8 = [v6 length] != 0;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)__ftreg_candidateAliases
{
  v1 = [a1 objectForKey:@"handles"];
  uint64_t v2 = v1;
  if (v1 && [v1 count])
  {
    uint64_t v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &__block_literal_global_11);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

@end