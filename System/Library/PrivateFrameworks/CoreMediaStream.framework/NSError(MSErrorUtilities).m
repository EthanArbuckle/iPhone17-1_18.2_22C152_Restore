@interface NSError(MSErrorUtilities)
+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:suggestion:;
+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:additionalUserInfo:;
+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:;
+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:;
- (id)MSFindPrimaryError;
- (id)MSMMCSRetryAfterDate;
- (id)MSMakePrimaryError;
- (id)_MSVerboseDescriptionRecursionCount:()MSErrorUtilities;
- (uint64_t)MSASStateMachineIsCanceledError;
- (uint64_t)MSCanBeIgnored;
- (uint64_t)MSContainsErrorWithDomain:()MSErrorUtilities code:;
- (uint64_t)MSIsAuthError;
- (uint64_t)MSIsBadTokenError;
- (uint64_t)MSIsCounted;
- (uint64_t)MSIsFatal;
- (uint64_t)MSIsQuotaError;
- (uint64_t)MSIsRegistrationError;
- (uint64_t)MSIsTemporaryNetworkError;
- (uint64_t)MSNeedsBackoff;
- (uint64_t)MSVerboseDescription;
- (void)_MSApplyBlock:()MSErrorUtilities;
@end

@implementation NSError(MSErrorUtilities)

- (id)MSMMCSRetryAfterDate
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)MSIsRegistrationError
{
  return [a1 MSContainsErrorWithDomain:*MEMORY[0x1E4F73818] code:27];
}

- (uint64_t)MSIsQuotaError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSError_MSErrorUtilities__MSIsQuotaError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSContainsErrorWithDomain:()MSErrorUtilities code:
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NSError_MSErrorUtilities__MSContainsErrorWithDomain_code___block_invoke;
  v10[3] = &unk_1E6C3B9F8;
  id v7 = v6;
  v12 = &v14;
  uint64_t v13 = a4;
  id v11 = v7;
  [a1 _MSApplyBlock:v10];
  uint64_t v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)MSIsBadTokenError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__NSError_MSErrorUtilities__MSIsBadTokenError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsAuthError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__NSError_MSErrorUtilities__MSIsAuthError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsFatal
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__NSError_MSErrorUtilities__MSIsFatal__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsCounted
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__NSError_MSErrorUtilities__MSIsCounted__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSNeedsBackoff
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSError_MSErrorUtilities__MSNeedsBackoff__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSCanBeIgnored
{
  return [a1 MSContainsErrorWithDomain:*MEMORY[0x1E4F73818] code:4];
}

- (uint64_t)MSASStateMachineIsCanceledError
{
  return [a1 MSContainsErrorWithDomain:@"MSASStateMachineErrorDomain" code:0];
}

- (uint64_t)MSIsTemporaryNetworkError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__NSError_MSErrorUtilities__MSIsTemporaryNetworkError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_MSApplyBlock:()MSErrorUtilities
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = a1;
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *MEMORY[0x1E4F73830];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    uint64_t v22 = *MEMORY[0x1E4F73830];
    do
    {
      if (!v4[2](v4, v6))
      {
        v19 = v6;
        goto LABEL_22;
      }
      v10 = [v6 userInfo];
      id v11 = [v10 objectForKey:v8];

      if ([v11 count])
      {
        uint64_t v12 = v9;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              if (((uint64_t (*)(id, void))v4[2])(v4, *(void *)(*((void *)&v23 + 1) + 8 * i)))
              {

                unsigned int v20 = v7;
                v19 = v6;
                goto LABEL_19;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v12;
        uint64_t v8 = v22;
      }
      v18 = [v6 userInfo];
      v19 = [v18 objectForKey:v9];

      unsigned int v20 = v7 + 1;
      if (!v19) {
        break;
      }
      uint64_t v6 = v19;
    }
    while (v7++ < 0x13);
LABEL_19:
    if (v20 >= 0x14) {
      _logRecursiveError();
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_22:
}

- (id)MSFindPrimaryError
{
  uint64_t v1 = [a1 userInfo];
  uint64_t v2 = *MEMORY[0x1E4F28A50];
  v3 = [v1 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v3)
  {
    unsigned int v4 = -1;
    do
    {
      id v5 = [v3 userInfo];
      uint64_t v6 = [v5 objectForKey:@"MSErrorIsPrimary"];

      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v6 BOOLValue])
          {
            id v8 = v3;

            uint64_t v9 = v8;
            goto LABEL_12;
          }
        }
      }
      ++v4;
      unsigned int v7 = [v3 userInfo];
      id v8 = [v7 objectForKey:v2];

      if (!v8) {
        break;
      }
      v3 = v8;
    }
    while (v4 < 0x13);
    if (v4 >= 0x13) {
      _logRecursiveError();
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (id)MSMakePrimaryError
{
  uint64_t v2 = [a1 userInfo];
  v3 = (void *)[v2 mutableCopy];

  unsigned int v4 = [NSNumber numberWithBool:1];
  [v3 setObject:v4 forKey:@"MSErrorIsPrimary"];

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = [a1 domain];
  unsigned int v7 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v3);

  return v7;
}

- (uint64_t)MSVerboseDescription
{
  return [a1 _MSVerboseDescriptionRecursionCount:10];
}

- (id)_MSVerboseDescriptionRecursionCount:()MSErrorUtilities
{
  if (a3 < 20)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28E78];
    unsigned int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v3 = [v6 stringWithFormat:@"%@:\n", v8];

    uint64_t v9 = [a1 domain];
    [v3 appendFormat:@"Domain  : %@\nCode    : %ld\n", v9, objc_msgSend(a1, "code")];

    v10 = [a1 userInfo];
    uint64_t v11 = [a1 localizedDescription];
    uint64_t v12 = (void *)v11;
    if (v11) {
      [v3 appendFormat:@"Desc    : %@\n", v11];
    }
    uint64_t v13 = [a1 localizedRecoverySuggestion];
    uint64_t v14 = (void *)v13;
    if (v13) {
      [v3 appendFormat:@"Sugg    : %@\n", v13];
    }
    if ([v10 count]) {
      [v3 appendFormat:@"UserInfo: %@\n", v10];
    }
    uint64_t v15 = [a1 userInfo];
    uint64_t v16 = [v15 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v16)
    {
      char v17 = [v16 _MSVerboseDescriptionRecursionCount:(a3 + 1)];
      [v3 appendFormat:@"...Underlying error:\n%@", v17];
    }
  }
  else
  {
    _logRecursiveError();
    v3 = 0;
  }
  return v3;
}

+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:additionalUserInfo:
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [v13 MSFindPrimaryError];
  uint64_t v16 = v15;
  if (!v15) {
    uint64_t v15 = v13;
  }
  char v17 = [v15 localizedDescription];
  if (v14)
  {
    v18 = (void *)[v14 mutableCopy];
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v19 = v18;
  if (v12) {
    [v18 setObject:v12 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v13) {
    [v19 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v17) {
    [v19 setObject:v17 forKey:*MEMORY[0x1E4F285A0]];
  }
  unsigned int v20 = [MEMORY[0x1E4F28C58] errorWithDomain:v11 code:a4 userInfo:v19];

  return v20;
}

+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:
{
  return [MEMORY[0x1E4F28C58] MSErrorWithDomain:a3 code:a4 description:a5 underlyingError:a6 additionalUserInfo:0];
}

+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:suggestion:
{
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  uint64_t v12 = *MEMORY[0x1E4F285A0];
  id v13 = a3;
  id v14 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", a5, v11, a6, v12, 0);
  uint64_t v15 = [v9 errorWithDomain:v13 code:a4 userInfo:v14];

  return v15;
}

+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:
{
  return [a1 MSErrorWithDomain:a3 code:a4 description:a5 suggestion:0];
}

@end