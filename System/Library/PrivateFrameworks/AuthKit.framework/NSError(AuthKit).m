@interface NSError(AuthKit)
+ (id)ak_anisetteErrorWithCode:()AuthKit underlyingError:;
+ (id)ak_attestationErrorWithCode:()AuthKit underlyingError:;
+ (id)ak_errorWithCode:()AuthKit underlyingError:;
+ (id)ak_generalErrorWithCode:()AuthKit errorDomain:underlyingError:;
+ (id)ak_wrappedAnisetteError:()AuthKit underlyingADIErrorCode:;
+ (uint64_t)ak_deviceListErrorWithCode:()AuthKit;
+ (uint64_t)ak_errorWithCode:()AuthKit;
+ (uint64_t)ak_errorWithCode:()AuthKit userInfo:;
+ (uint64_t)ak_livenessErrorWithCode:()AuthKit;
+ (uint64_t)ak_passkeyErrorWithCode:()AuthKit;
+ (uint64_t)ak_wrappedAnisetteError:()AuthKit;
- (BOOL)ak_isLAUserCancelError;
- (BOOL)ak_isServiceError;
- (BOOL)isAccountNotProvisioned;
- (id)ak_allUnderlyingErrorsWithMaxDepth:()AuthKit;
- (id)ak_errorByAppendingUserInfo:()AuthKit;
- (id)errorDescriptionIncludingUnderlyingErrorsWithMaxDepth:()AuthKit;
- (uint64_t)ak_allUnderlyingErrors;
- (uint64_t)ak_isAdditionalCTASelected;
- (uint64_t)ak_isAuthenticationError;
- (uint64_t)ak_isAuthenticationErrorWithCode:()AuthKit;
- (uint64_t)ak_isEligibleForProxiedAuthFallback;
- (uint64_t)ak_isIncompatibleDevicesError;
- (uint64_t)ak_isServerThrottlingError;
- (uint64_t)ak_isSurrogateAuthAlreadyInProgressError;
- (uint64_t)ak_isUnableToPromptError;
- (uint64_t)ak_isUserCancelError;
- (uint64_t)ak_isUserInitiatedError;
- (uint64_t)ak_isUserSkippedError;
- (uint64_t)ak_isUserTryAgainError;
- (uint64_t)ak_isXPCServiceError;
@end

@implementation NSError(AuthKit)

- (id)ak_errorByAppendingUserInfo:()AuthKit
{
  id v4 = a3;
  v5 = [a1 userInfo];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;

  [v9 addEntriesFromDictionary:v4];
  v10 = (void *)MEMORY[0x1E4F28C58];
  v11 = [a1 domain];
  uint64_t v12 = [a1 code];
  v13 = (void *)[v9 copy];
  v14 = [v10 errorWithDomain:v11 code:v12 userInfo:v13];

  return v14;
}

+ (uint64_t)ak_errorWithCode:()AuthKit
{
  return objc_msgSend(a1, "ak_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)ak_errorWithCode:()AuthKit userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAuthenticationError" code:a3 userInfo:a4];
}

+ (id)ak_errorWithCode:()AuthKit underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:userInfo:", a3, v7);

  return v8;
}

+ (id)ak_anisetteErrorWithCode:()AuthKit underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAnisetteError" code:a3 userInfo:v7];

  return v8;
}

+ (id)ak_attestationErrorWithCode:()AuthKit underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)ak_generalErrorWithCode:()AuthKit errorDomain:underlyingError:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x1E4F28A50];
    v14[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:a3 userInfo:v10];

  return v11;
}

+ (id)ak_wrappedAnisetteError:()AuthKit underlyingADIErrorCode:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKUnderlyingADIErrors" code:a4 userInfo:0];
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28A50];
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v6 errorWithDomain:@"AKAnisetteError" code:a3 userInfo:v7];

  return v8;
}

+ (uint64_t)ak_wrappedAnisetteError:()AuthKit
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "ak_wrappedAnisetteError:underlyingADIErrorCode:", -8004, a3);
}

+ (uint64_t)ak_passkeyErrorWithCode:()AuthKit
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:a3 userInfo:0];
}

+ (uint64_t)ak_deviceListErrorWithCode:()AuthKit
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"AKDeviceListError" code:a3 userInfo:0];
}

+ (uint64_t)ak_livenessErrorWithCode:()AuthKit
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"AKLivenessError" code:a3 userInfo:0];
}

- (uint64_t)ak_isUserCancelError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7003;
  }
  return result;
}

- (uint64_t)ak_isUserSkippedError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7038;
  }
  return result;
}

- (uint64_t)ak_isAdditionalCTASelected
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7124;
  }
  return result;
}

- (uint64_t)ak_isUserTryAgainError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7062;
  }
  return result;
}

- (uint64_t)ak_isUserInitiatedError
{
  if (objc_msgSend(a1, "ak_isUserCancelError") & 1) != 0 || (objc_msgSend(a1, "ak_isUserSkippedError")) {
    return 1;
  }

  return objc_msgSend(a1, "ak_isAdditionalCTASelected");
}

- (BOOL)ak_isServiceError
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ak_isAuthenticationError")) {
    BOOL v2 = [a1 code] == -7029 || objc_msgSend(a1, "code") == -7005;
  }
  else {
    BOOL v2 = 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 code] == -7029 || objc_msgSend(v8, "code") == -7005)
        {
          BOOL v2 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v2;
}

- (uint64_t)ak_isXPCServiceError
{
  if ([a1 code] != 4099 && objc_msgSend(a1, "code") != 4097) {
    return 0;
  }
  BOOL v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  return v3;
}

- (uint64_t)ak_isUnableToPromptError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7013;
  }
  return result;
}

- (uint64_t)ak_isSurrogateAuthAlreadyInProgressError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7045;
  }
  return result;
}

- (uint64_t)ak_isIncompatibleDevicesError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7095;
  }
  return result;
}

- (uint64_t)ak_isAuthenticationErrorWithCode:()AuthKit
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)ak_isAuthenticationError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"AKAuthenticationError"];

  return v2;
}

- (BOOL)ak_isLAUserCancelError
{
  uint64_t v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F30B30]]) {
    BOOL v3 = [a1 code] == -2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)ak_isServerThrottlingError
{
  uint64_t result = objc_msgSend(a1, "ak_isAuthenticationError");
  if (result) {
    return [a1 code] == -7120;
  }
  return result;
}

- (uint64_t)ak_isEligibleForProxiedAuthFallback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "ak_isUnableToPromptError");
  BOOL v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"NO";
    if (v2) {
      uint64_t v4 = @"YES";
    }
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    v9 = a1;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Proxied auth fallback eligibility: %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return v2;
}

- (id)ak_allUnderlyingErrorsWithMaxDepth:()AuthKit
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = a1;
  if (v6 && a3 >= 1)
  {
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    uint64_t v8 = 1;
    do
    {
      v9 = v6;
      [v5 addObject:v6];
      uint64_t v10 = [v6 userInfo];
      id v6 = [v10 objectForKeyedSubscript:v7];

      if (!v6) {
        break;
      }
    }
    while (v8++ < a3);
  }
  long long v12 = (void *)[v5 copy];

  return v12;
}

- (uint64_t)ak_allUnderlyingErrors
{
  return objc_msgSend(a1, "ak_allUnderlyingErrorsWithMaxDepth:", 10);
}

- (id)errorDescriptionIncludingUnderlyingErrorsWithMaxDepth:()AuthKit
{
  v1 = objc_msgSend(a1, "ak_allUnderlyingErrorsWithMaxDepth:");
  if ([v1 count])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__NSError_AuthKit__errorDescriptionIncludingUnderlyingErrorsWithMaxDepth___block_invoke;
    v6[3] = &unk_1E57608F0;
    id v7 = v2;
    id v3 = v2;
    [v1 enumerateObjectsUsingBlock:v6];
    uint64_t v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isAccountNotProvisioned
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [a1 code] == -45061 || objc_msgSend(a1, "code") == -45059;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 code] == -45061 || objc_msgSend(v8, "code") == -45059) {
          BOOL v2 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

@end