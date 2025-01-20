@interface NSError(Authentication)
- (BOOL)isAuthKitUnableToPromptError;
- (uint64_t)isAuthKitUnableToPromptDueToNetworkError;
- (uint64_t)isAuthenticationErrorIncludingUnderlyingErrors;
- (unint64_t)isAuthenticationError;
@end

@implementation NSError(Authentication)

- (unint64_t)isAuthenticationError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F32A28]];

  if (v3)
  {
    unint64_t v4 = [a1 code];
    if (v4 >= 0x23) {
      return 0;
    }
    else {
      return (0x400000180uLL >> v4) & 1;
    }
  }
  else
  {
    v6 = [a1 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x263F329A8]];

    if (v7)
    {
      return [a1 code] == 305;
    }
    else
    {
      v9 = [a1 domain];
      int v10 = [v9 isEqualToString:*MEMORY[0x263F329B0]];

      if (!v10) {
        return 0;
      }
      uint64_t v11 = [a1 code];
      return v11 == 99 || v11 == 102;
    }
  }
}

- (BOOL)isAuthKitUnableToPromptError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F28F30]]) {
    BOOL v3 = [a1 code] == -7013;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)isAuthKitUnableToPromptDueToNetworkError
{
  if ([a1 isAuthKitUnableToPromptError])
  {
    v2 = [a1 userInfo];
    BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v3)
    {
      if ([v3 code] == -7005) {
        char v4 = -1;
      }
      else {
        char v4 = 0;
      }
    }
    else
    {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)isAuthenticationErrorIncludingUnderlyingErrors
{
  return objc_msgSend(a1, "cdp_anyDescendantErrorDownToMaxDepth:matchesPredicate:", 3, &__block_literal_global_3);
}

@end