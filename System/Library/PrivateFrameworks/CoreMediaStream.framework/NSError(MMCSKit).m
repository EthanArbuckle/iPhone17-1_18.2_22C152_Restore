@interface NSError(MMCSKit)
+ (id)MMCSErrorWithDomain:()MMCSKit code:description:;
- (id)MMCSRetryAfterDate;
- (uint64_t)MMCSErrorType;
- (uint64_t)MMCSIsAuthorizationError;
- (uint64_t)MMCSIsCancelError;
- (uint64_t)MMCSIsFatalError;
- (uint64_t)MMCSIsNetworkConditionsError;
- (void)_MMCSApplyBlock:()MMCSKit;
@end

@implementation NSError(MMCSKit)

- (id)MMCSRetryAfterDate
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__5670;
  v8 = __Block_byref_object_dispose__5671;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MMCSApplyBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)MMCSIsFatalError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__NSError_MMCSKit__MMCSIsFatalError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MMCSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsAuthorizationError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__NSError_MMCSKit__MMCSIsAuthorizationError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MMCSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsNetworkConditionsError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__NSError_MMCSKit__MMCSIsNetworkConditionsError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MMCSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MMCSIsCancelError
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__NSError_MMCSKit__MMCSIsCancelError__block_invoke;
  v3[3] = &unk_1E6C3CD30;
  v3[4] = &v4;
  [a1 _MMCSApplyBlock:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_MMCSApplyBlock:()MMCSKit
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
      v11 = [v10 objectForKey:v8];

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
      NSLog(&cfstr_NotFollowingAn.isa);
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_22:
}

- (uint64_t)MMCSErrorType
{
  if ([a1 MMCSIsNetworkConditionsError]) {
    return 0;
  }
  if ([a1 MMCSIsAuthorizationError]) {
    return 1;
  }
  if ([a1 MMCSIsFatalError]) {
    return 2;
  }
  return 3;
}

+ (id)MMCSErrorWithDomain:()MMCSKit code:description:
{
  uint64_t v11 = MMCSErrorWithDomain_code_description__onceToken;
  id v12 = a5;
  id v13 = a3;
  if (v11 != -1) {
    dispatch_once(&MMCSErrorWithDomain_code_description__onceToken, &__block_literal_global_5680);
  }
  uint64_t v14 = [(id)MMCSErrorWithDomain_code_description__MMCSKitBundle localizedStringForKey:v12 value:v12 table:@"MMCSKit"];

  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:v14 arguments:&a9];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E4F28568], 0);
  v17 = [MEMORY[0x1E4F28C58] errorWithDomain:v13 code:a4 userInfo:v16];

  return v17;
}

@end