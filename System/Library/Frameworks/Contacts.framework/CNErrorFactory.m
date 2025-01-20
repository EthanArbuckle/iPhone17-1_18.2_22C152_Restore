@interface CNErrorFactory
+ (id)_localizedDescriptionForCode:(int64_t)a3;
+ (id)_localizedReasonForCode:(int64_t)a3;
+ (id)errorByAddingUserInfoEntries:(id)a3 toError:(id)a4;
+ (id)errorByPrependingKeyPath:(id)a3 toKeyPathsInError:(id)a4;
+ (id)errorForiOSABError:(__CFError *)a3;
+ (id)errorObject:(id)a3 doesNotImplementSelector:(SEL)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)genericiOSABError;
+ (id)os_log;
+ (id)validationErrorByAggregatingValidationErrors:(id)a3;
+ (int64_t)CNErrorCodeForABError:(__CFError *)a3;
@end

@implementation CNErrorFactory

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v7 = [a1 _localizedReasonForCode:a3];
  uint64_t v8 = [a1 _localizedDescriptionForCode:a3];
  v9 = (void *)v8;
  if (v6 || v8 || v7)
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = v11;
    if (v6) {
      [v11 addEntriesFromDictionary:v6];
    }
    if (v9) {
      [v10 setObject:v9 forKey:*MEMORY[0x1E4F28568]];
    }
    if (v7) {
      [v10 setObject:v7 forKey:*MEMORY[0x1E4F28588]];
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:a3 userInfo:v10];

  return v12;
}

+ (id)_localizedDescriptionForCode:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [v4 stringValue];
  id v6 = [v5 stringByAppendingString:@"_DESCRIPTION"];

  v7 = (void *)MEMORY[0x1E4F5A430];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v9 = [v7 localizedStringForString:v6 bundle:v8 table:@"Errors" returningNilIfNotFound:1];

  return v9;
}

+ (id)_localizedReasonForCode:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [v4 stringValue];
  id v6 = [v5 stringByAppendingString:@"_REASON"];

  v7 = (void *)MEMORY[0x1E4F5A430];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v9 = [v7 localizedStringForString:v6 bundle:v8 table:@"Errors" returningNilIfNotFound:1];

  return v9;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 userInfo:0];
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_6 != -1) {
    dispatch_once(&os_log_cn_once_token_0_6, &__block_literal_global_38);
  }
  v2 = (void *)os_log_cn_once_object_0_6;

  return v2;
}

uint64_t __31__CNErrorFactory_iOSAB__os_log__block_invoke()
{
  os_log_cn_once_object_0_6 = (uint64_t)os_log_create("com.apple.contacts", "CNErrorFactory");

  return MEMORY[0x1F41817F8]();
}

+ (id)genericiOSABError
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    +[CNErrorFactory(iOSAB) genericiOSABError](v2);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [MEMORY[0x1E4F29060] callStackSymbols];
  v4 = objc_msgSend(v3, "_cn_balancedSlicesWithMaximumCount:", 5);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        v10 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v9;
          _os_log_error_impl(&dword_1909E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:2 userInfo:0];

  return v11;
}

+ (id)errorForiOSABError:(__CFError *)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v24 = a3;
  if (!a3)
  {
    uint64_t v5 = [a1 genericiOSABError];
    goto LABEL_5;
  }
  if ([@"CNErrorDomain" isEqualToString:CFErrorGetDomain(a3)])
  {
    uint64_t v5 = a3;
LABEL_5:
    uint64_t v6 = (uint64_t)v5;
    goto LABEL_7;
  }
  uint64_t v7 = [a1 CNErrorCodeForABError:a3];
  uint64_t v28 = *MEMORY[0x1E4F28A50];
  v29[0] = a3;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  uint64_t v6 = [a1 errorWithCode:v7 userInfo:v8];

LABEL_7:
  uint64_t v9 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[CNErrorFactory(iOSAB) errorForiOSABError:v9];
  }
  id v19 = (id)v6;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [MEMORY[0x1E4F29060] callStackSymbols];
  v11 = objc_msgSend(v10, "_cn_balancedSlicesWithMaximumCount:", 5);

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v16;
          _os_log_error_impl(&dword_1909E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }

  return v19;
}

+ (int64_t)CNErrorCodeForABError:(__CFError *)a3
{
  if (CNErrorCodeForABError__cn_once_token_5 != -1) {
    dispatch_once(&CNErrorCodeForABError__cn_once_token_5, &__block_literal_global_7_0);
  }
  id v4 = (id)CNErrorCodeForABError__cn_once_object_5;
  uint64_t v5 = [v4 objectForKeyedSubscript:CFErrorGetDomain(a3)];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [v5 integerValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v6 = 2;
      goto LABEL_15;
    }
    uint64_t v7 = [NSNumber numberWithLong:CFErrorGetCode(a3)];
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];

    if (v8) {
      int64_t v6 = [v8 integerValue];
    }
    else {
      int64_t v6 = 2;
    }
  }
  if (v6 == 500)
  {
    CFDictionaryRef v9 = CFErrorCopyUserInfo(a3);
    v10 = [(__CFDictionary *)v9 objectForKey:*MEMORY[0x1E4F49828]];
    if (([v10 isEqualToString:*MEMORY[0x1E4F49830]] & 1) != 0
      || [v10 isEqualToString:*MEMORY[0x1E4F49838]])
    {

      int64_t v6 = 206;
    }
    else
    {
      char v12 = [v10 isEqualToString:*MEMORY[0x1E4F49840]];

      if (v12) {
        int64_t v6 = 207;
      }
      else {
        int64_t v6 = 500;
      }
    }
  }
LABEL_15:

  return v6;
}

void __47__CNErrorFactory_iOSAB__CNErrorCodeForABError___block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F49820];
  v8[0] = &unk_1EE089278;
  v8[1] = &unk_1EE0892A8;
  v9[0] = &unk_1EE089290;
  v9[1] = &unk_1EE0892C0;
  v10[0] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E4F49980];
  v6[0] = &unk_1EE0892A8;
  v6[1] = &unk_1EE0892F0;
  v7[0] = &unk_1EE0892D8;
  v7[1] = &unk_1EE0892D8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v10[2] = *MEMORY[0x1E4F49DE0];
  v11[1] = v2;
  v11[2] = &unk_1EE0892D8;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = (void *)CNErrorCodeForABError__cn_once_object_5;
  CNErrorCodeForABError__cn_once_object_5 = v4;
}

+ (id)errorByPrependingKeyPath:(id)a3 toKeyPathsInError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v5 length])
    {
      uint64_t v26 = v6;
      uint64_t v7 = [v6 userInfo];
      uint64_t v8 = (void *)[v7 mutableCopy];

      CFDictionaryRef v9 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v25 = v8;
      v10 = objc_msgSend(v8, "objectForKeyedSubscript:");
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v31[0] = v5;
            v31[1] = v15;
            uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
            v17 = [v16 componentsJoinedByString:@"."];
            [v9 addObject:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v12);
      }

      if ([v9 count])
      {
        uint64_t v18 = (void *)[v9 copy];
        [v25 setObject:v18 forKeyedSubscript:@"CNKeyPaths"];
      }
      id v19 = (void *)MEMORY[0x1E4F28C58];
      id v6 = v26;
      long long v20 = [v26 domain];
      uint64_t v21 = [v26 code];
      long long v22 = (void *)[v25 copy];
      id v23 = [v19 errorWithDomain:v20 code:v21 userInfo:v22];
    }
    else
    {
      id v23 = v6;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)errorByAddingUserInfoEntries:(id)a3 toError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 userInfo];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 addEntriesFromDictionary:v6];
  CFDictionaryRef v9 = (void *)MEMORY[0x1E4F28C58];
  v10 = [v5 domain];
  uint64_t v11 = [v5 code];

  uint64_t v12 = (void *)[v8 copy];
  uint64_t v13 = [v9 errorWithDomain:v10 code:v11 userInfo:v12];

  return v13;
}

+ (id)errorObject:(id)a3 doesNotImplementSelector:(SEL)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v11[0] = @"No implementation";
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v10[0] = v4;
  v10[1] = v5;
  id v6 = CNFullMethodName();
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:1002 userInfo:v7];

  return v8;
}

+ (id)validationErrorByAggregatingValidationErrors:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 lastObject];
  }
  else
  {
    uint64_t v26 = objc_opt_new();
    long long v27 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v11 = NSString;
          uint64_t v12 = [v10 domain];
          uint64_t v13 = [v11 stringWithFormat:@"%@:%ld", v12, objc_msgSend(v10, "code")];
          [v27 addObject:v13];

          uint64_t v14 = [v10 userInfo];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"CNInvalidRecords"];
          if (v15) {
            [v26 addObjectsFromArray:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v7);
    }

    v34 = @"CNValidationErrors";
    uint64_t v16 = (void *)[v5 copy];
    v35 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v18 = (void *)[v17 mutableCopy];

    if ((unint64_t)[v27 count] < 2)
    {
      uint64_t v21 = [v5 lastObject];
      uint64_t v22 = [v21 code];
      v32 = @"CNInvalidRecords";
      id v23 = [v26 array];
      uint64_t v33 = v23;
      id v19 = v26;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v4 = +[CNErrorFactory errorWithCode:v22 userInfo:v24];
    }
    else
    {
      id v19 = v26;
      if ([v26 count])
      {
        long long v20 = [v26 array];
        [v18 setObject:v20 forKey:@"CNInvalidRecords"];
      }
      uint64_t v4 = +[CNErrorFactory errorWithCode:300 userInfo:v18];
    }
  }

  return v4;
}

@end