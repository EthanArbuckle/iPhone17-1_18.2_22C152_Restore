@interface CNContactVerifier
+ (BOOL)arePropertiesOfContactAuthorized:(id)a3 error:(id *)a4;
+ (BOOL)isValidContact:(id)a3 error:(id *)a4;
+ (id)os_log;
@end

@implementation CNContactVerifier

+ (id)os_log
{
  if (os_log_cn_once_token_0_3 != -1) {
    dispatch_once(&os_log_cn_once_token_0_3, &__block_literal_global_20);
  }
  v2 = (void *)os_log_cn_once_object_0_3;

  return v2;
}

uint64_t __27__CNContactVerifier_os_log__block_invoke()
{
  os_log_cn_once_object_0_3 = (uint64_t)os_log_create("com.apple.contacts", "CNContactVerifier");

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isValidContact:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__CNContactVerifier_isValidContact_error___block_invoke;
  aBlock[3] = &unk_1E56B47B0;
  id v7 = v5;
  id v26 = v7;
  BOOL v29 = a4 != 0;
  id v8 = v6;
  id v27 = v8;
  v28 = &v30;
  v9 = (void (**)(void *, void))_Block_copy(aBlock);
  v10 = [v7 availableKeyDescriptor];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = +[CN writableContactProperties];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          v9[2](v9, *(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v34 count:16];
      }
      while (v14);
    }
  }
  else
  {
    v12 = [v7 keyVector];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__CNContactVerifier_isValidContact_error___block_invoke_2;
    v23[3] = &unk_1E56B47D8;
    v24 = v9;
    [v12 enumeratePropertiesUsingBlock:v23];

    v13 = v24;
  }

  int v17 = *((unsigned __int8 *)v31 + 24);
  if (!*((unsigned char *)v31 + 24) && a4)
  {
    *a4 = +[CNErrorFactory validationErrorByAggregatingValidationErrors:v8];
  }

  _Block_object_dispose(&v30, 8);
  return v17 != 0;
}

void __42__CNContactVerifier_isValidContact_error___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 key];
  v6 = [v3 valueForKey:v5];

  id v19 = 0;
  LOBYTE(v5) = [v4 isValidValue:v6 error:&v19];

  id v7 = v19;
  id v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v7 && *(unsigned char *)(a1 + 56))
    {
      v9 = [v7 userInfo];
      v10 = (void *)[v9 mutableCopy];

      v20[0] = *(void *)(a1 + 32);
      BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v10 setObject:v11 forKey:@"CNInvalidRecords"];

      v12 = *(void **)(a1 + 40);
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [v8 domain];
      uint64_t v15 = [v8 code];
      v16 = (void *)[v10 copy];
      int v17 = [v13 errorWithDomain:v14 code:v15 userInfo:v16];
      [v12 addObject:v17];
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v18 + 24)) {
      *(unsigned char *)(v18 + 24) = 0;
    }
  }
}

uint64_t __42__CNContactVerifier_isValidContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)arePropertiesOfContactAuthorized:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v35 = 0;
  v36[0] = &v35;
  v36[1] = 0x3032000000;
  v36[2] = __Block_byref_object_copy__4;
  v36[3] = __Block_byref_object_dispose__4;
  id v37 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactVerifier_arePropertiesOfContactAuthorized_error___block_invoke;
  aBlock[3] = &unk_1E56B4800;
  void aBlock[4] = &v35;
  id v27 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v5 = +[CN restrictedProperties];
  int v6 = [v4 hasBeenPersisted];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (!v7)
  {
    char v28 = 1;
LABEL_23:
    long long v20 = obj;
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)v31;
  char v28 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      BOOL v11 = [v10 key];
      v47 = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      int v13 = [v4 areKeysAvailable:v12];

      if (v13)
      {
        uint64_t v14 = [v10 CNValueForContact:v4];
        if (v6)
        {
          uint64_t v15 = [v4 snapshot];
          v16 = [v10 CNValueForContact:v15];
        }
        else
        {
          v16 = [v10 nilValue];
        }
        if (([v10 isValue:v14 equalToEmptyEquivalentOrValue:v16] & 1) == 0)
        {
          int v17 = objc_msgSend(a1, "os_log");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            id v19 = [v10 key];
            *(_DWORD *)buf = 138543874;
            v42 = v19;
            __int16 v43 = 2114;
            v44 = v14;
            __int16 v45 = 2114;
            v46 = v16;
            _os_log_debug_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEBUG, "UnauthorizedKey:%{public}@, value:%{public}@, snapshotValue:%{public}@", buf, 0x20u);
          }
          if (!a4)
          {

            char v28 = 0;
            goto LABEL_23;
          }
          uint64_t v18 = [v10 key];
          v27[2](v27, v18);

          char v28 = 0;
        }
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  if (!((a4 == 0) | v28 & 1))
  {
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      long long v20 = 0;
    }
    else
    {
      long long v22 = objc_msgSend(a1, "os_log");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[CNContactVerifier arePropertiesOfContactAuthorized:error:]((uint64_t)v36, v22);
      }

      uint64_t v23 = *(void *)(v36[0] + 40);
      id v38 = v4;
      v39[0] = @"CNKeyPaths";
      v39[1] = @"CNInvalidRecords";
      v40[0] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      v40[1] = v24;
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    }
    +[CNErrorFactory errorWithCode:102 userInfo:v20];
    char v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
  }
  _Block_object_dispose(&v35, 8);

  return v28 & 1;
}

void __60__CNContactVerifier_arePropertiesOfContactAuthorized_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

+ (void)arePropertiesOfContactAuthorized:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "CNErrorCodeUnauthorizedKeys:%{public}@", (uint8_t *)&v3, 0xCu);
}

@end