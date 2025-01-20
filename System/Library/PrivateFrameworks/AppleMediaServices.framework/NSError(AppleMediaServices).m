@interface NSError(AppleMediaServices)
- (BOOL)ams_recursiveHasDomain:()AppleMediaServices code:;
- (id)_ams_firstUnderlyingErrorPassingTest:()AppleMediaServices;
- (id)ams_errorByAddingToMultipleUnderlyingErrors:()AppleMediaServices;
- (id)ams_errorByAddingUserInfo:()AppleMediaServices;
- (id)ams_errorWithMultipleUnderlyingErrors:()AppleMediaServices;
- (id)ams_errorWithUnderlyingError:()AppleMediaServices;
- (id)ams_message;
- (id)ams_sanitizedForSecureCoding;
- (id)ams_title;
- (id)ams_underlyingError;
- (id)ams_underlyingErrorWithDomain:()AppleMediaServices;
- (id)ams_underlyingErrorWithDomain:()AppleMediaServices code:;
- (uint64_t)ams_hasDomain:()AppleMediaServices;
- (uint64_t)ams_hasDomain:()AppleMediaServices code:;
- (uint64_t)ams_isTimeoutError;
- (uint64_t)ams_isUserCancelledError;
@end

@implementation NSError(AppleMediaServices)

- (uint64_t)ams_hasDomain:()AppleMediaServices code:
{
  id v6 = a3;
  if ([a1 code] == a4)
  {
    v7 = [a1 domain];
    uint64_t v8 = [v7 isEqualToString:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)ams_underlyingError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)ams_message
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"AMSFailureReason"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)ams_title
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"AMSDescription"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)ams_isTimeoutError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", @"AMSErrorDomain", 1);
}

- (uint64_t)ams_isUserCancelledError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", *MEMORY[0x1E4F281F8], 3072);
}

- (id)_ams_firstUnderlyingErrorPassingTest:()AppleMediaServices
{
  id v4 = a3;
  v5 = [a1 underlyingErrors];
  id v6 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v4);

  return v6;
}

- (id)ams_sanitizedForSecureCoding
{
  v2 = [a1 userInfo];

  if (v2)
  {
    id v3 = [a1 userInfo];
    id v4 = objc_msgSend(v3, "ams_sanitizedForSecureCoding");

    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = [a1 domain];
    uint64_t v7 = [a1 code];
    if ([v4 count]) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = (id)[v5 initWithDomain:v6 code:v7 userInfo:v8];
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (id)ams_errorByAddingToMultipleUnderlyingErrors:()AppleMediaServices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "ams_multipleUnderlyingErrors");

  if (v5)
  {
    id v6 = objc_msgSend(a1, "ams_multipleUnderlyingErrors");
    uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v4];

    id v4 = (id)v7;
  }
  uint64_t v11 = *MEMORY[0x1E4F28750];
  v12[0] = v4;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = objc_msgSend(a1, "ams_errorByAddingUserInfo:", v8);

  return v9;
}

- (id)ams_errorByAddingUserInfo:()AppleMediaServices
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  id v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  id v9 = v8;

  [v9 addEntriesFromDictionary:v4];
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = [a1 domain];
  v12 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, objc_msgSend(a1, "code"), v9);

  return v12;
}

- (id)ams_errorWithMultipleUnderlyingErrors:()AppleMediaServices
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28750];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = objc_msgSend(a1, "ams_errorByAddingUserInfo:", v6);

  return v7;
}

- (id)ams_errorWithUnderlyingError:()AppleMediaServices
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = objc_msgSend(a1, "ams_errorByAddingUserInfo:", v6);

  return v7;
}

- (uint64_t)ams_hasDomain:()AppleMediaServices
{
  id v4 = a3;
  id v5 = [a1 domain];
  uint64_t v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)ams_recursiveHasDomain:()AppleMediaServices code:
{
  id v6 = a3;
  if (objc_msgSend(a1, "ams_hasDomain:code:", v6, a4))
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = objc_msgSend(a1, "ams_underlyingErrorWithDomain:code:", v6, a4);
    BOOL v7 = v8 != 0;
  }
  return v7;
}

- (id)ams_underlyingErrorWithDomain:()AppleMediaServices
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NSError_AppleMediaServices__ams_underlyingErrorWithDomain___block_invoke;
  v8[3] = &unk_1E55A8938;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "_ams_firstUnderlyingErrorPassingTest:", v8);

  return v6;
}

- (id)ams_underlyingErrorWithDomain:()AppleMediaServices code:
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __66__NSError_AppleMediaServices__ams_underlyingErrorWithDomain_code___block_invoke;
  v10[3] = &unk_1E55A8960;
  id v11 = v6;
  uint64_t v12 = a4;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "_ams_firstUnderlyingErrorPassingTest:", v10);

  return v8;
}

@end