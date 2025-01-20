@interface NSError(BRFPAdditions)
- (id)_br_populateUserInfoDictWithDomain:()BRFPAdditions code:;
- (id)_createWrappedErrorWithDomain:()BRFPAdditions code:;
- (id)br_fileProviderErrorWithFPFS:()BRFPAdditions;
- (uint64_t)_br_getFileProviderDomainErrorCode:()BRFPAdditions;
- (uint64_t)_isTransientError:()BRFPAdditions code:;
- (uint64_t)br_fileProviderError;
- (void)_br_populateErrorMessageOnUserInfo:()BRFPAdditions;
@end

@implementation NSError(BRFPAdditions)

- (uint64_t)_br_getFileProviderDomainErrorCode:()BRFPAdditions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (_br_getFileProviderDomainErrorCode__once != -1) {
    dispatch_once(&_br_getFileProviderDomainErrorCode__once, &__block_literal_global_5);
  }
  v5 = [a1 domain];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v6)
  {
    v7 = &_br_getFileProviderDomainErrorCode__cocoaErrorToFPError;
    goto LABEL_24;
  }
  v8 = [a1 domain];
  int v9 = [v8 isEqualToString:@"BRCloudDocsErrorDomain"];

  if (v9)
  {
    if ([a1 code] == 17)
    {
      v10 = [a1 userInfo];
      v11 = [v10 objectForKey:*MEMORY[0x1E4F28A50]];

      if (v11)
      {
        uint64_t v12 = objc_msgSend(v11, "_br_getFileProviderDomainErrorCode:", a3);

        return v12;
      }
    }
    v7 = &_br_getFileProviderDomainErrorCode__clouddocsErrorToFPError;
LABEL_24:
    id v24 = (id)*v7;
    if (v24)
    {
      v25 = v24;
      v26 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(a1, "code"));
      v27 = [v25 objectForKey:v26];

      if (v27)
      {
        *a3 = [v27 longValue];

        return 1;
      }
    }
    return 0;
  }
  v13 = [a1 domain];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v14)
  {
    v22 = [a1 domain];
    int v23 = [v22 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v23)
    {
      *a3 = -1004;
      return 1;
    }
    return 0;
  }
  if ([a1 code] != 2)
  {
    v7 = &_br_getFileProviderDomainErrorCode__cloudKitErrorToFPError;
    goto LABEL_24;
  }
  v15 = [a1 userInfo];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v17 = objc_msgSend(v16, "objectEnumerator", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        if (objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "_br_getFileProviderDomainErrorCode:", a3))
        {
          uint64_t v12 = 1;
          goto LABEL_32;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_32:

  return v12;
}

- (void)_br_populateErrorMessageOnUserInfo:()BRFPAdditions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(a1, "br_isCloudDocsErrorCode:", 17))
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = [a1 underlyingErrors];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v37;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        if (objc_msgSend(v10, "br_isCKErrorCode:", 115))
        {
          v11 = [MEMORY[0x1E4F4C000] neediCloudTermsAcceptanceDeviceSpecificMessage];
          uint64_t v12 = [MEMORY[0x1E4F4C000] neediCloudTermsAcceptanceTitle];
          goto LABEL_32;
        }
        if (objc_msgSend(v10, "br_isCKErrorCode:", 3)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v13 = [v10 underlyingErrors];
      uint64_t v12 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v12)
      {
        uint64_t v14 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v13);
            }
            v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (objc_msgSend(v16, "br_isNSURLErrorCode:", -1009))
            {
              v17 = [v16 userInfo];
              uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F289D8]];

              if (v18 && [v18 intValue] == 1)
              {
                uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                uint64_t v12 = _BRLocalizedStringWithFormat(@"ICD_CELLULAR_DISABLED_TITLE", @"Localizable", v19, v20, v21, v22, v23, v24, v32);

                if (MGGetBoolAnswer()) {
                  v25 = @"ICD_CELLULAR_DISABLED_CH_BODY";
                }
                else {
                  v25 = @"ICD_CELLULAR_DISABLED_BODY";
                }
                v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                v11 = _BRLocalizedStringWithFormat(v25, @"Localizable", v26, v27, v28, v29, v30, v31, v32);
              }
              else
              {
                uint64_t v12 = 0;
                v11 = 0;
              }

              goto LABEL_31;
            }
          }
          uint64_t v12 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      v11 = 0;
LABEL_31:

LABEL_32:
      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28588]];
      }
      if (v12)
      {
        [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28568]];
        v5 = (void *)v12;
        goto LABEL_36;
      }
    }
    else
    {
LABEL_11:
      v11 = 0;
LABEL_36:
    }
  }
  else
  {
    v11 = 0;
  }
}

- (uint64_t)_isTransientError:()BRFPAdditions code:
{
  uint64_t result = [a3 isEqualToString:*MEMORY[0x1E4F25C10]];
  if (result) {
    return a4 == -2005 || *MEMORY[0x1E4F25C30] == a4;
  }
  return result;
}

- (id)_br_populateUserInfoDictWithDomain:()BRFPAdditions code:
{
  id v6 = a3;
  if (_br_populateUserInfoDictWithDomain_code__once != -1) {
    dispatch_once(&_br_populateUserInfoDictWithDomain_code__once, &__block_literal_global_102);
  }
  uint64_t v7 = [a1 userInfo];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_2;
  v22[3] = &unk_1E59ADA38;
  id v10 = v7;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v22];
  uint64_t v12 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_3;
  v18[3] = &unk_1E59ADA60;
  id v19 = v10;
  uint64_t v20 = a1;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  [v12 enumerateKeysAndObjectsUsingBlock:v18];
  if ([a1 _isTransientError:v6 code:a4]) {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F25C40]];
  }
  objc_msgSend(a1, "_br_populateErrorMessageOnUserInfo:", v13);
  [v13 setObject:a1 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v15 = v21;
  id v16 = v13;

  return v16;
}

- (id)_createWrappedErrorWithDomain:()BRFPAdditions code:
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = a3;
  id v8 = objc_msgSend(a1, "_br_populateUserInfoDictWithDomain:code:", v7, a4);
  uint64_t v9 = [v6 errorWithDomain:v7 code:a4 userInfo:v8];

  return v9;
}

- (uint64_t)br_fileProviderError
{
  uint64_t v3 = BRIsFPFSEnabled(a1, a2);

  return objc_msgSend(a1, "br_fileProviderErrorWithFPFS:", v3);
}

- (id)br_fileProviderErrorWithFPFS:()BRFPAdditions
{
  uint64_t v16 = 0;
  if (!objc_msgSend(a1, "_br_getFileProviderDomainErrorCode:", &v16))
  {
    if (a3)
    {
      id v8 = [a1 domain];
      int v9 = [v8 isEqualToString:@"BRCloudDocsErrorDomain"];

      if (v9)
      {
        uint64_t v5 = *MEMORY[0x1E4F25C10];
        id v7 = a1;
        uint64_t v6 = -2005;
        goto LABEL_11;
      }
      id v10 = [a1 domain];
      uint64_t v11 = *MEMORY[0x1E4F281F8];
      if ([v10 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
      }
      else
      {
        uint64_t v12 = [a1 domain];
        char v13 = [v12 isEqualToString:*MEMORY[0x1E4F25C10]];

        if ((v13 & 1) == 0)
        {
          id v7 = a1;
          uint64_t v5 = v11;
          uint64_t v6 = 4101;
          goto LABEL_11;
        }
      }
    }
    id v14 = a1;
    goto LABEL_12;
  }
  uint64_t v5 = *MEMORY[0x1E4F25C10];
  uint64_t v6 = v16;
  id v7 = a1;
LABEL_11:
  id v14 = [v7 _createWrappedErrorWithDomain:v5 code:v6];
LABEL_12:

  return v14;
}

@end