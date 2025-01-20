@interface NSError(HMB)
- (BOOL)hmbIsSQLiteConstraintError;
- (BOOL)hmbIsSQLiteDatabaseCorruptedError;
- (double)hmbCloudKitRetryDelay;
- (double)hmbDefaultCloudKitRetryDelay;
- (id)hmbCKUnderlyingError;
- (uint64_t)_hmbHasCKUnderlyingErrorWithCode:()HMB;
- (uint64_t)_hmbIsCKErrorOrHasPartialFailurePassingFilter:()HMB;
- (uint64_t)_hmbIsCKErrorOrHasPartialFailureWithCode:()HMB;
- (uint64_t)_hmbIsCKErrorWithCode:()HMB;
- (uint64_t)_hmbIsCKUnderlyingErrorWithCode:()HMB;
- (uint64_t)hmbIsCKChangeTokenExpiredError;
- (uint64_t)hmbIsCKLimitExceededError;
- (uint64_t)hmbIsCKManateeUnavailableError;
- (uint64_t)hmbIsCKMissingManateeIdentityError;
- (uint64_t)hmbIsCKNotAuthenticatedError;
- (uint64_t)hmbIsCKPartialFailureError;
- (uint64_t)hmbIsCKUnsyncedKeychainError;
- (uint64_t)hmbIsCKZoneDeletedError;
- (uint64_t)hmbIsCKZoneDisabledError;
- (uint64_t)hmbIsCloudKitError;
- (uint64_t)hmbIsCloudKitUnderlyingError;
@end

@implementation NSError(HMB)

- (uint64_t)_hmbHasCKUnderlyingErrorWithCode:()HMB
{
  if (objc_msgSend(a1, "_hmbIsCKUnderlyingErrorWithCode:")) {
    return 1;
  }
  v6 = [a1 hmbCKUnderlyingError];
  v7 = v6;
  if (v6) {
    uint64_t v5 = [v6 _hmbHasCKUnderlyingErrorWithCode:a3];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_hmbIsCKErrorOrHasPartialFailurePassingFilter:()HMB
{
  id v4 = a3;
  if ([a1 hmbIsCKPartialFailureError])
  {
    uint64_t v5 = [a1 userInfo];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    v7 = [v6 allValues];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__NSError_HMB___hmbIsCKErrorOrHasPartialFailurePassingFilter___block_invoke;
    v10[3] = &unk_1E69EB4E8;
    id v11 = v4;
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = (*((uint64_t (**)(id, void *))v4 + 2))(v4, a1);
  }

  return v8;
}

- (uint64_t)_hmbIsCKErrorOrHasPartialFailureWithCode:()HMB
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NSError_HMB___hmbIsCKErrorOrHasPartialFailureWithCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return [a1 _hmbIsCKErrorOrHasPartialFailurePassingFilter:v4];
}

- (uint64_t)_hmbIsCKUnderlyingErrorWithCode:()HMB
{
  uint64_t result = [a1 hmbIsCloudKitUnderlyingError];
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)_hmbIsCKErrorWithCode:()HMB
{
  uint64_t result = [a1 hmbIsCloudKitError];
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)hmbIsCKZoneDisabledError
{
  if (![a1 _hmbIsCKErrorWithCode:15]
    || ![a1 _hmbHasCKUnderlyingErrorWithCode:2000])
  {
    return 0;
  }
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19C68]];
  uint64_t v4 = [v3 isEqualToString:@"User modifications not allowed in disabled zone"];

  return v4;
}

- (uint64_t)hmbIsCKNotAuthenticatedError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailureWithCode:9];
}

- (uint64_t)hmbIsCKUnsyncedKeychainError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailureWithCode:111];
}

- (uint64_t)hmbIsCKManateeUnavailableError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailureWithCode:110];
}

- (uint64_t)hmbIsCKLimitExceededError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailureWithCode:27];
}

- (uint64_t)hmbIsCKMissingManateeIdentityError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailureWithCode:112];
}

- (uint64_t)hmbIsCKPartialFailureError
{
  return [a1 _hmbIsCKErrorWithCode:2];
}

- (uint64_t)hmbIsCKChangeTokenExpiredError
{
  return [a1 _hmbIsCKErrorWithCode:21];
}

- (uint64_t)hmbIsCKZoneDeletedError
{
  return [a1 _hmbIsCKErrorOrHasPartialFailurePassingFilter:&__block_literal_global_6918];
}

- (double)hmbDefaultCloudKitRetryDelay
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  if ([v0 isLowPowerModeEnabled]) {
    double v1 = 600.0;
  }
  else {
    double v1 = 60.0;
  }

  return v1;
}

- (double)hmbCloudKitRetryDelay
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a1 hmbIsCloudKitError])
  {
    v2 = [a1 userInfo];
    v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;

    if (!v5 || ([v5 doubleValue], double v7 = v6, v6 < 0.0))
    {
      if ([a1 hmbIsCKPartialFailureError])
      {
        uint64_t v8 = [a1 userInfo];
        v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          double v7 = -1.0;
LABEL_10:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * v14), (void)v21);
            [v15 hmbCloudKitRetryDelay];
            double v17 = v16;

            if (v17 == -1.0) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
              if (v12) {
                goto LABEL_10;
              }
              double v7 = v17;
              break;
            }
          }
        }
        else
        {
          double v7 = -1.0;
        }

        goto LABEL_26;
      }
      unint64_t v19 = [a1 code];
      double v7 = -1.0;
      if (v19 <= 0x17)
      {
        if (((1 << v19) & 0x9000D8) == 0)
        {
          if (v19 != 14 || ![a1 _hmbHasCKUnderlyingErrorWithCode:2037]) {
            goto LABEL_26;
          }
          goto LABEL_23;
        }
        if (([a1 _hmbHasCKUnderlyingErrorWithCode:3006] & 1) == 0)
        {
LABEL_23:
          [a1 hmbDefaultCloudKitRetryDelay];
          double v7 = v20;
        }
      }
    }
LABEL_26:

    return v7;
  }
  [a1 hmbDefaultCloudKitRetryDelay];
  return result;
}

- (id)hmbCKUnderlyingError
{
  double v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if ([v2 hmbIsCloudKitUnderlyingError]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (uint64_t)hmbIsCloudKitUnderlyingError
{
  double v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F19DD8]];

  return v2;
}

- (uint64_t)hmbIsCloudKitError
{
  double v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F19C40]];

  return v2;
}

- (BOOL)hmbIsSQLiteDatabaseCorruptedError
{
  uint64_t v2 = [a1 userInfo];
  v3 = objc_msgSend(v2, "hmf_numberForKey:", @"extcode");
  if ([v3 integerValue] == 26)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [a1 userInfo];
    double v6 = objc_msgSend(v5, "hmf_numberForKey:", @"extcode");
    BOOL v4 = [v6 integerValue] == 11;
  }
  return v4;
}

- (BOOL)hmbIsSQLiteConstraintError
{
  double v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_numberForKey:", @"extcode");
  BOOL v3 = [v2 integerValue] == 19;

  return v3;
}

@end