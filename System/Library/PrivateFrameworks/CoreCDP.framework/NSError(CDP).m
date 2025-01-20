@interface NSError(CDP)
- (BOOL)cdp_indicatesDaemonConnectionWasInterrupted;
- (BOOL)cdp_indicatesEDPRecoveryTokenIsNeeded;
- (BOOL)shouldDisplayToUser;
- (uint64_t)cdp_anyDescendantErrorDownToMaxDepth:()CDP matchesPredicate:;
@end

@implementation NSError(CDP)

- (BOOL)shouldDisplayToUser
{
  return (unint64_t)[a1 code] >> 1 == 0x7FFFFFFFFFFFF5D6;
}

- (BOOL)cdp_indicatesDaemonConnectionWasInterrupted
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v3 = [a1 code] == 4097;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)cdp_indicatesEDPRecoveryTokenIsNeeded
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"com.apple.protectedcloudstorage"];

  if (!v3) {
    return 0;
  }
  if ([a1 code] == 221 || objc_msgSend(a1, "code") == 232) {
    return 1;
  }
  return [a1 code] == 233;
}

- (uint64_t)cdp_anyDescendantErrorDownToMaxDepth:()CDP matchesPredicate:
{
  v6 = a4;
  if (v6[2](v6, a1))
  {
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [a1 userInfo];
    uint64_t v9 = *MEMORY[0x263F08608];
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v10) {
      BOOL v11 = a3 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v7 = 0;
    }
    else
    {
      unsigned int v12 = 2;
      v13 = v10;
      while (1)
      {
        uint64_t v7 = v6[2](v6, v13);
        if (v7) {
          break;
        }
        v14 = [v13 userInfo];
        v10 = [v14 objectForKeyedSubscript:v9];

        if (v10)
        {
          v13 = v10;
          if (v12++ <= a3) {
            continue;
          }
        }
        goto LABEL_15;
      }
      v10 = v13;
    }
LABEL_15:
  }
  return v7;
}

@end