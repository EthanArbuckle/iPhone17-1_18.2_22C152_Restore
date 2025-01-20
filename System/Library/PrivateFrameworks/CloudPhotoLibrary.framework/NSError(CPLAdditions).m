@interface NSError(CPLAdditions)
- (BOOL)isCPLEncryptionError;
- (BOOL)isCPLThrottlingError;
- (__CFString)cplShortDomainDescription;
- (id)_cplReinflatedUserInfoForXPCDidChange:()CPLAdditions;
- (id)_cplSafeUserInfoForXPCDidChange:()CPLAdditions;
- (id)cplReinflatedErrorForXPC;
- (id)cplSafeErrorForXPC;
- (id)cplUnderlyingError;
- (id)cplUnderlyingPOSIXError;
- (uint64_t)cplReturnCode;
- (uint64_t)isCPLError;
- (uint64_t)isCPLErrorWithCode:()CPLAdditions;
- (uint64_t)isCPLOperationCancelledError;
- (uint64_t)isCPLOperationDeferredError;
@end

@implementation NSError(CPLAdditions)

- (uint64_t)cplReturnCode
{
  v1 = [a1 cplUnderlyingPOSIXError];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 code];
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

- (id)cplReinflatedErrorForXPC
{
  char v9 = 0;
  v2 = [a1 _cplReinflatedUserInfoForXPCDidChange:&v9];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class() && v9 == 0)
  {
    id v7 = a1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    v6 = [a1 domain];
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_cplReinflatedUserInfoForXPCDidChange:()CPLAdditions
{
  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"CPLErrorRetryAfterDate"];

  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
    id v7 = [v4 objectForKeyedSubscript:@"CPLErrorRetryAfterDate"];
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    char v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    [v6 setObject:v9 forKeyedSubscript:@"CPLErrorRetryAfterDate"];

    *a3 = 1;
  }
  else
  {
    *a3 = 0;
    id v6 = v4;
  }

  return v6;
}

- (id)cplSafeErrorForXPC
{
  char v9 = 0;
  v2 = [a1 _cplSafeUserInfoForXPCDidChange:&v9];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class() && v9 == 0)
  {
    id v7 = a1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [a1 domain];
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_cplSafeUserInfoForXPCDidChange:()CPLAdditions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = [a1 userInfo];
  uint64_t v5 = [v4 count];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F28568]];
  v8 = (void *)v7;
  if (!v5 || v5 == 1 && v7)
  {
    *a3 = 0;
    id v9 = v4;
  }
  else
  {
    *a3 = 1;
    if (_cplSafeUserInfoForXPCDidChange__onceToken != -1) {
      dispatch_once(&_cplSafeUserInfoForXPCDidChange__onceToken, &__block_literal_global_212);
    }
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
    id v9 = v10;
    if (v8) {
      [v10 setObject:v8 forKey:v6];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = (id)_cplSafeUserInfoForXPCDidChange__safeKeys;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v17 = objc_msgSend(v4, "objectForKey:", v16, (void)v26);
          if (v17) {
            [v9 setObject:v17 forKey:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    v18 = [v4 objectForKeyedSubscript:@"CPLErrorRetryAfterDate"];
    v19 = v18;
    if (v18)
    {
      v20 = NSNumber;
      [v18 timeIntervalSinceReferenceDate];
      v21 = objc_msgSend(v20, "numberWithDouble:");
      [v9 setObject:v21 forKeyedSubscript:@"CPLErrorRetryAfterDate"];
    }
    uint64_t v22 = *MEMORY[0x1E4F28A50];
    v23 = objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E4F28A50], (void)v26);
    v24 = [v23 cplSafeErrorForXPC];

    if (v24) {
      [v9 setObject:v24 forKey:v22];
    }
  }
  return v9;
}

- (__CFString)cplShortDomainDescription
{
  if (cplShortDomainDescription_onceToken != -1) {
    dispatch_once(&cplShortDomainDescription_onceToken, &__block_literal_global_9792);
  }
  v2 = [a1 domain];
  if (v2)
  {
    uint64_t v3 = [(id)cplShortDomainDescription_wellKnownDomainToShortDomain objectForKey:v2];
    v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = (void *)v3;
    }
    else {
      uint64_t v5 = v2;
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = @"unknown";
  }

  return v6;
}

- (id)cplUnderlyingError
{
  id v1 = a1;
  v2 = [v1 userInfo];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v4)
  {
    do
    {
      uint64_t v5 = [v1 userInfo];
      uint64_t v6 = [v5 objectForKeyedSubscript:v3];

      uint64_t v7 = [v6 userInfo];
      v8 = [v7 objectForKeyedSubscript:v3];

      id v1 = v6;
    }
    while (v8);
  }
  else
  {
    uint64_t v6 = v1;
  }
  return v6;
}

- (id)cplUnderlyingPOSIXError
{
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F28798];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  do
  {
    v4 = [v1 domain];
    char v5 = [v4 isEqual:v2];

    if (v5) {
      break;
    }
    uint64_t v6 = [v1 userInfo];
    uint64_t v7 = [v6 objectForKey:v3];

    id v1 = (id)v7;
  }
  while (v7);
  return v1;
}

- (BOOL)isCPLEncryptionError
{
  uint64_t v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"CloudPhotoLibraryErrorDomain"];

  return v3 && [a1 code] == 70;
}

- (BOOL)isCPLThrottlingError
{
  uint64_t v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"CloudPhotoLibraryErrorDomain"];

  return v3 && ([a1 code] & 0xFFFFFFFFFFFFFFFBLL) == 1000;
}

- (uint64_t)isCPLOperationDeferredError
{
  return [a1 isCPLErrorWithCode:257];
}

- (uint64_t)isCPLOperationCancelledError
{
  if ([a1 code] != 3072) {
    return 0;
  }
  uint64_t v2 = [a1 domain];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  return v3;
}

- (uint64_t)isCPLError
{
  id v1 = [a1 domain];
  uint64_t v2 = [v1 isEqual:@"CloudPhotoLibraryErrorDomain"];

  return v2;
}

- (uint64_t)isCPLErrorWithCode:()CPLAdditions
{
  if ([a1 code] != a3) {
    return 0;
  }
  v4 = [a1 domain];
  uint64_t v5 = [v4 isEqual:@"CloudPhotoLibraryErrorDomain"];

  return v5;
}

@end