@interface NSError(HomeKitCKError)
- (id)hmd_actualCKErrorFromCKErrorPartialFailure:()HomeKitCKError;
- (id)hmd_conciseCKError;
- (id)hmd_convertedCKError;
- (id)hmd_hmErrorFromCKError;
- (id)hmd_retryAfterCKError;
- (uint64_t)hmd_isCKError;
- (uint64_t)hmd_isNonRecoverableCKError;
- (uint64_t)hmd_isRecordConflictCKError;
- (uint64_t)hmd_isUnderlyingCKError;
@end

@implementation NSError(HomeKitCKError)

- (uint64_t)hmd_isRecordConflictCKError
{
  uint64_t result = objc_msgSend(a1, "hmd_isCKError");
  if (result)
  {
    uint64_t v3 = [a1 code];
    return v3 == 14 || v3 == 11;
  }
  return result;
}

- (id)hmd_retryAfterCKError
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "hmd_isCKError") & 1) != 0 || (objc_msgSend(a1, "hmd_isUnderlyingCKError"))
  {
    if ([a1 code] == 2)
    {
      v2 = [a1 userInfo];
      uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v4 = objc_msgSend(v3, "allValues", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "hmd_retryAfterCKError");
            if (v9)
            {
              v15 = (void *)v9;

              goto LABEL_22;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    id v10 = [a1 userInfo];
    uint64_t v11 = objc_msgSend(v10, "hmf_numberForKey:", *MEMORY[0x263EFD4A0]);
  }
  else
  {
    v12 = [a1 userInfo];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v10 = v14;

    if (!v10)
    {
      v15 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = objc_msgSend(v10, "hmd_retryAfterCKError");
  }
  v15 = (void *)v11;
LABEL_20:

LABEL_22:
  return v15;
}

- (id)hmd_convertedCKError
{
  if (objc_msgSend(a1, "hmd_isCKError"))
  {
    id v2 = a1;
  }
  else
  {
    uint64_t v3 = [a1 userInfo];
    v4 = [v3 objectForKey:*MEMORY[0x263F08608]];

    if (v4 && objc_msgSend(v4, "hmd_isCKError")) {
      id v2 = v4;
    }
    else {
      id v2 = 0;
    }
  }
  return v2;
}

- (uint64_t)hmd_isNonRecoverableCKError
{
  uint64_t result = objc_msgSend(a1, "hmd_isCKError");
  if (result)
  {
    unint64_t v3 = [a1 code];
    uint64_t result = 1;
    if (v3 > 0x12 || ((1 << v3) & 0x4932A) == 0) {
      return v3 == 131;
    }
  }
  return result;
}

- (uint64_t)hmd_isUnderlyingCKError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EFD588]];

  return v2;
}

- (uint64_t)hmd_isCKError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EFD498]];

  return v2;
}

- (id)hmd_hmErrorFromCKError
{
  if ((objc_msgSend(a1, "hmd_isCKError") & 1) == 0)
  {
    id v4 = a1;
    goto LABEL_10;
  }
  uint64_t v2 = [a1 code];
  if ((unint64_t)(v2 - 3) >= 2)
  {
    if (v2 == 9)
    {
      uint64_t v3 = 1010;
      goto LABEL_9;
    }
    if (v2 != 23)
    {
      uint64_t v3 = 52;
      goto LABEL_9;
    }
  }
  uint64_t v3 = 78;
LABEL_9:
  id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:v3 description:0 reason:0 suggestion:0 underlyingError:a1];
LABEL_10:
  return v4;
}

- (id)hmd_conciseCKError
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, "hmd_isCKError"))
  {
    uint64_t v2 = [a1 userInfo];
    uint64_t v3 = (void *)[v2 mutableCopy];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = objc_msgSend(a1, "userInfo", 0);
    uint64_t v5 = [v4 allKeys];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (([(id)ckErrorUserInfoKeys containsObject:v10] & 1) == 0) {
            [v3 removeObjectForKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    v12 = [a1 domain];
    uint64_t v13 = [a1 code];
    v14 = (void *)[v3 copy];
    id v15 = [v11 errorWithDomain:v12 code:v13 userInfo:v14];
  }
  else
  {
    id v15 = a1;
  }
  return v15;
}

- (id)hmd_actualCKErrorFromCKErrorPartialFailure:()HomeKitCKError
{
  id v4 = a3;
  if (!objc_msgSend(a1, "hmd_isCKError")) {
    goto LABEL_4;
  }
  if ([a1 code] != 2) {
    goto LABEL_4;
  }
  uint64_t v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFD4C8]];
  id v7 = [v6 objectForKey:v4];

  if (!v7) {
LABEL_4:
  }
    id v7 = a1;

  return v7;
}

@end