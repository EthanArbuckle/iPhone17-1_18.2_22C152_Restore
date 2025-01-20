@interface NSError(EmailFoundationAdditions)
+ (uint64_t)ef_cancelledError;
+ (uint64_t)ef_connectionInterruptedError;
+ (uint64_t)ef_invalidInputError;
+ (uint64_t)ef_notSupportedError;
+ (uint64_t)ef_temporarilyUnavailableError;
+ (uint64_t)ef_timeoutError;
- (id)ef_initWithDomain:()EmailFoundationAdditions code:underlyingError:;
- (id)ef_match;
- (id)ef_secureCodableError;
- (id)ef_underlyingError;
- (uint64_t)ef_isCancelledError;
- (uint64_t)ef_isConnectionInterruptedError;
- (uint64_t)ef_isInvalidInputError;
- (uint64_t)ef_isNotSupportedError;
- (uint64_t)ef_isTemporarilyUnavailableError;
- (uint64_t)ef_isTimeoutError;
@end

@implementation NSError(EmailFoundationAdditions)

+ (uint64_t)ef_cancelledError
{
  return [a1 errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

- (id)ef_match
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__NSError_EmailFoundationAdditions__ef_match__block_invoke;
  aBlock[3] = &unk_1E6122610;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  return v1;
}

+ (uint64_t)ef_timeoutError
{
  return [a1 errorWithDomain:@"EFErrorDomain" code:1000000 userInfo:0];
}

+ (uint64_t)ef_notSupportedError
{
  return [a1 errorWithDomain:@"EFErrorDomain" code:1000001 userInfo:0];
}

+ (uint64_t)ef_connectionInterruptedError
{
  return [a1 errorWithDomain:@"EFErrorDomain" code:1000002 userInfo:0];
}

+ (uint64_t)ef_temporarilyUnavailableError
{
  return [a1 errorWithDomain:@"EFErrorDomain" code:1000003 userInfo:0];
}

+ (uint64_t)ef_invalidInputError
{
  return [a1 errorWithDomain:@"EFErrorDomain" code:1000004 userInfo:0];
}

- (id)ef_initWithDomain:()EmailFoundationAdditions code:underlyingError:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v15[0] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)[a1 initWithDomain:v8 code:a4 userInfo:v11];

  return v12;
}

- (uint64_t)ef_isCancelledError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = v1[2](v1, *MEMORY[0x1E4F281F8], 3072);

  return v2;
}

- (uint64_t)ef_isTimeoutError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EFErrorDomain", 1000000);

  return v2;
}

- (uint64_t)ef_isNotSupportedError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EFErrorDomain", 1000001);

  return v2;
}

- (uint64_t)ef_isConnectionInterruptedError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EFErrorDomain", 1000002);

  return v2;
}

- (uint64_t)ef_isTemporarilyUnavailableError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EFErrorDomain", 1000003);

  return v2;
}

- (uint64_t)ef_isInvalidInputError
{
  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v2 = ((uint64_t (**)(void, __CFString *, uint64_t))v1)[2](v1, @"EFErrorDomain", 1000004);

  return v2;
}

- (id)ef_underlyingError
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  return v2;
}

- (id)ef_secureCodableError
{
  uint64_t v2 = [a1 userInfo];
  if ([v2 count])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke;
    uint64_t v14 = &unk_1E6122660;
    id v4 = v3;
    id v15 = v4;
    v16 = &v17;
    [v2 enumerateKeysAndObjectsUsingBlock:&v11];
    if (*((unsigned char *)v18 + 24))
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      v6 = objc_msgSend(a1, "domain", v11, v12, v13, v14);
      v7 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v4);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v7 = 0;
  }
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = a1;
  }
  id v9 = v8;

  return v9;
}

@end