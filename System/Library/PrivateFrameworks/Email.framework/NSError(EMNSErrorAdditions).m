@interface NSError(EMNSErrorAdditions)
+ (id)em_internalErrorWithReason:()EMNSErrorAdditions;
+ (id)em_internalErrorWithReason:()EMNSErrorAdditions userInfo:;
+ (id)em_itemNotFoundErrorWithItemID:()EMNSErrorAdditions;
+ (uint64_t)em_itemTimeoutError;
- (uint64_t)em_isInternalError;
- (uint64_t)em_isItemNotFoundError;
@end

@implementation NSError(EMNSErrorAdditions)

+ (id)em_itemNotFoundErrorWithItemID:()EMNSErrorAdditions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken != -1) {
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_38);
  }
  if (v4)
  {
    v11 = @"itemID";
    v12[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    v9 = @"itemID";
    v6 = [MEMORY[0x1E4F1CA98] null];
    v10 = v6;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  v7 = [a1 errorWithDomain:@"EMErrorDomain" code:1024 userInfo:v5];

  return v7;
}

+ (uint64_t)em_itemTimeoutError
{
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken != -1) {
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_38);
  }
  return [a1 errorWithDomain:@"EMErrorDomain" code:1026 userInfo:0];
}

+ (id)em_internalErrorWithReason:()EMNSErrorAdditions
{
  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:userInfo:", a3, 0);
  return v3;
}

+ (id)em_internalErrorWithReason:()EMNSErrorAdditions userInfo:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken == -1)
  {
    if (v7)
    {
LABEL_3:
      id v9 = (id)[v8 mutableCopy];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_38);
    if (v8) {
      goto LABEL_3;
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_6:
  v10 = v9;
  uint64_t v11 = *MEMORY[0x1E4F60D00];
  v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F60D00]];

  if (v12)
  {
    v13 = [v10 objectForKeyedSubscript:v11];
    v14 = (void *)[v13 mutableCopy];

    [v14 setObject:v6 forKeyedSubscript:@"reason"];
    v10 = v14;
  }
  else
  {
    v18 = @"reason";
    v19[0] = v6;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v10 setObject:v15 forKeyedSubscript:v11];
  }
  v16 = [a1 errorWithDomain:@"EMErrorDomain" code:1 userInfo:v10];

  return v16;
}

- (uint64_t)em_isItemNotFoundError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EMErrorDomain", 1024);

  return v2;
}

- (uint64_t)em_isInternalError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EMErrorDomain", 1);

  return v2;
}

@end