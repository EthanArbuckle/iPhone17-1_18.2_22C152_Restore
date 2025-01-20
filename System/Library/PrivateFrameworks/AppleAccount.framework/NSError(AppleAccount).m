@interface NSError(AppleAccount)
+ (id)aa_errorWithCode:()AppleAccount underlyingError:;
+ (id)aa_errorWithServerResponse:()AppleAccount;
+ (uint64_t)aa_errorWithCode:()AppleAccount;
+ (uint64_t)aa_errorWithCode:()AppleAccount userInfo:;
- (BOOL)aa_isAACustodianRecoveryErrorWithCode:()AppleAccount;
- (BOOL)aa_isAAErrorWithCode:()AppleAccount;
- (BOOL)aa_isAASignInErrorWithCode:()AppleAccount;
- (id)_aa_userReadableError;
- (id)aa_partialErrorsByName;
- (uint64_t)aa_isAACustodianRecoveryError;
- (uint64_t)aa_isAARecoverableError;
- (uint64_t)aa_isXPCError;
@end

@implementation NSError(AppleAccount)

+ (uint64_t)aa_errorWithCode:()AppleAccount
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AppleAccount.Error" code:a3 userInfo:0];
}

+ (uint64_t)aa_errorWithCode:()AppleAccount userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AppleAccount.Error" code:a3 userInfo:a4];
}

+ (id)aa_errorWithCode:()AppleAccount underlyingError:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = a4;
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a4;
    v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(a1, "aa_errorWithCode:userInfo:", a3, v8);

  return v9;
}

+ (id)aa_errorWithServerResponse:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSError+AppleAccount.m", 52, @"Invalid parameter not satisfying: %@", @"serverResponse" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  id v7 = [v5 objectForKeyedSubscript:@"localizedError"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"AAServerDescription"];
  }
  objc_opt_class();
  id v9 = [v5 objectForKeyedSubscript:@"protocolVersion"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:@"AAServerProtocolVersion"];
  }
  objc_opt_class();
  id v11 = [v5 objectForKeyedSubscript:@"message"];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12) {
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  v13 = (void *)MEMORY[0x1E4F28C58];
  v14 = (void *)[v6 copy];
  v15 = objc_msgSend(v13, "aa_errorWithCode:userInfo:", -4402, v14);

  return v15;
}

- (id)_aa_userReadableError
{
  id v1 = a1;
  v2 = [v1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F18F50]])
  {
  }
  else
  {
    v3 = [v1 domain];
    int v4 = [v3 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (!v4) {
      goto LABEL_20;
    }
  }
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v6 = [v5 localizedStringForKey:@"NETWORK_ERROR_GENERIC" value:0 table:@"Localizable"];

  uint64_t v7 = [v1 code];
  if (v7 <= -1002)
  {
    if (v7 == -1012)
    {
      id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      id v9 = v8;
      id v10 = @"INVALID_PASSWORD";
      goto LABEL_18;
    }
    if (v7 != -1009 && v7 != -1005) {
      goto LABEL_19;
    }
  }
  else
  {
    if (v7 > 306)
    {
      if (v7 != 310 && v7 != 307) {
        goto LABEL_19;
      }
      id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      id v9 = v8;
      id v10 = @"NETWORK_ERROR_PROXY";
      goto LABEL_18;
    }
    if (v7 == -1001)
    {
      id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      id v9 = v8;
      id v10 = @"NETWORK_ERROR_TIMEOUT";
      goto LABEL_18;
    }
    if (v7 != 302) {
      goto LABEL_19;
    }
  }
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v9 = v8;
  id v10 = @"NETWORK_ERROR_NOT_CONNECTED";
LABEL_18:
  uint64_t v11 = [v8 localizedStringForKey:v10 value:0 table:@"Localizable"];

  id v6 = (void *)v11;
LABEL_19:
  id v12 = [v1 userInfo];
  v13 = (void *)[v12 mutableCopy];

  [v13 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  v14 = (void *)MEMORY[0x1E4F28C58];
  v15 = [v1 domain];
  uint64_t v16 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(v1, "code"), v13);

  id v1 = (id)v16;
LABEL_20:

  return v1;
}

- (BOOL)aa_isAAErrorWithCode:()AppleAccount
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:@"com.apple.AppleAccount.Error"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)aa_isAASignInErrorWithCode:()AppleAccount
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:@"AASignInErrors"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)aa_isAACustodianRecoveryError
{
  id v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"AACustodianRecoveryErrors"];

  return v2;
}

- (BOOL)aa_isAACustodianRecoveryErrorWithCode:()AppleAccount
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:@"AACustodianRecoveryErrors"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)aa_isAARecoverableError
{
  uint64_t v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    if ([a1 code] == -997 || objc_msgSend(a1, "code") == -1005 || objc_msgSend(a1, "code") == -1001) {
      goto LABEL_10;
    }
    uint64_t v3 = [a1 code];

    if (v3 == -1009) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v2 = [a1 domain];
  if ([v2 isEqualToString:@"com.apple.appleaccount"])
  {
    if ([a1 code] == 500)
    {
LABEL_10:

      return 1;
    }
    uint64_t v5 = [a1 code];

    if (v5 == 400) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (uint64_t)aa_isXPCError
{
  uint64_t v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v3 = [a1 code];

    if (v3 == 4097) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (id)aa_partialErrorsByName
{
  if (objc_msgSend(a1, "aa_isAAErrorWithCode:", -4408))
  {
    objc_opt_class();
    uint64_t v2 = [a1 userInfo];
    id v3 = [v2 objectForKeyedSubscript:@"AAPartialErrorsByNameKey"];
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end