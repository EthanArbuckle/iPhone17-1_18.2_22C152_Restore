@interface NSError(SecureBackup)
- (BOOL)isCoolDownError;
- (BOOL)isICSCInvalidError;
- (BOOL)isICSCRecoveryHardLimitError;
- (BOOL)isRecoveryPETHardLimitError;
- (BOOL)isRecoveryPETSoftLimitError;
- (id)errorByExtendingUserInfoWithDictionary:()SecureBackup;
- (uint64_t)indicatesRecoveryCanBeRetried;
- (uint64_t)isMissingCachedPassphraseError;
- (uint64_t)isRecordNotViableError;
@end

@implementation NSError(SecureBackup)

- (BOOL)isICSCRecoveryHardLimitError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F32A28]])
  {
    v3 = [a1 userInfo];
    v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F32AA0]];
    BOOL v5 = [v4 unsignedIntegerValue] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isICSCInvalidError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F32A28]]) {
    BOOL v3 = [a1 code] == 26;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isCoolDownError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F32A28]])
  {
    BOOL v3 = [a1 userInfo];
    v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F32AA0]];
    BOOL v5 = [v4 unsignedIntegerValue] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isRecoveryPETHardLimitError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F32A28]]) {
    BOOL v3 = [a1 code] == 34;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isRecoveryPETSoftLimitError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F32A28]]) {
    BOOL v3 = [a1 code] == 35;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)errorByExtendingUserInfoWithDictionary:()SecureBackup
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [a1 userInfo];
    v6 = (void *)[v5 mutableCopy];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v10 = v8;

    [v10 addEntriesFromDictionary:v4];
    v11 = objc_opt_class();
    v12 = [a1 domain];
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(a1, "code"), v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = a1;
  }

  return v9;
}

- (uint64_t)isRecordNotViableError
{
  if ([a1 code] != 58) {
    return 0;
  }
  v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F16DA8]];

  return v3;
}

- (uint64_t)isMissingCachedPassphraseError
{
  if (objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5501)) {
    return 1;
  }
  uint64_t v3 = [a1 domain];
  if ([v3 isEqualToString:*MEMORY[0x263F32A28]]) {
    BOOL v2 = [a1 code] == 9;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (uint64_t)indicatesRecoveryCanBeRetried
{
  if (![MEMORY[0x263F34400] useCDPContextSecretInsteadOfSBDSecretFeatureEnabled]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x263F343A8] sharedInstance];
  int v3 = [v2 hasLocalSecret];

  if (!v3) {
    return 0;
  }
  return [a1 isMissingCachedPassphraseError];
}

@end