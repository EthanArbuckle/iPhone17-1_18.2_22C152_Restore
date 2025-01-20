@interface IMAccount(CNFRegInternalUtilities)
- (BOOL)CNFRegSignInComplete;
- (BOOL)CNFRegSignInFailed;
- (uint64_t)CNFRegIsSignedOut;
- (uint64_t)CNFRegRegisteringLocalPhoneNumberSentinelAlias;
@end

@implementation IMAccount(CNFRegInternalUtilities)

- (uint64_t)CNFRegRegisteringLocalPhoneNumberSentinelAlias
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!CNFRegSupportsLocalPhoneNumberSentinelAlias()
    || [a1 accountType] != 1
    || [a1 registrationStatus] < 3)
  {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(a1, "aliases", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x263F4A8D8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isEqualToIgnoringCase:v7]) {
          char v5 = 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
    uint64_t v9 = v5 & 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)CNFRegSignInComplete
{
  return [a1 registrationStatus] == 5;
}

- (uint64_t)CNFRegIsSignedOut
{
  if ([a1 isOperational] & 1) != 0 || (objc_msgSend(a1, "canSendMessages")) {
    return 0;
  }
  return [a1 BOOLForKey:@"AccountSignedOut"];
}

- (BOOL)CNFRegSignInFailed
{
  return [a1 registrationStatus] == -1;
}

@end