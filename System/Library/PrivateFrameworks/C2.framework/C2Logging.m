@interface C2Logging
+ (void)printToLog:(id)a3 withDescription:(id)a4 array:(id)a5;
+ (void)printToLog:(id)a3 withDescription:(id)a4 dictionary:(id)a5;
+ (void)printToLog:(id)a3 withDescription:(id)a4 error:(id)a5;
+ (void)printToLog:(id)a3 withDescription:(id)a4 object:(id)a5;
@end

@implementation C2Logging

+ (void)printToLog:(id)a3 withDescription:(id)a4 array:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__C2Logging_printToLog_withDescription_array___block_invoke;
  v12[3] = &unk_1E6CCC1F0;
  id v14 = v8;
  id v15 = a1;
  id v13 = v9;
  id v10 = v8;
  id v11 = v9;
  [a5 enumerateObjectsUsingBlock:v12];
}

void __46__C2Logging_printToLog_withDescription_array___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSString;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [v5 stringWithFormat:@"%@:%llu", v6, a3];
  [(id)objc_opt_class() printToLog:*(void *)(a1 + 40) withDescription:v8 object:v7];
}

+ (void)printToLog:(id)a3 withDescription:(id)a4 dictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__C2Logging_printToLog_withDescription_dictionary___block_invoke;
  v12[3] = &unk_1E6CCC218;
  id v14 = v8;
  id v15 = a1;
  id v13 = v9;
  id v10 = v8;
  id v11 = v9;
  [a5 enumerateKeysAndObjectsUsingBlock:v12];
}

void __51__C2Logging_printToLog_withDescription_dictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSString;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = [v5 stringWithFormat:@"%@/%@", v6, a2];
  [(id)objc_opt_class() printToLog:*(void *)(a1 + 40) withDescription:v8 object:v7];
}

+ (void)printToLog:(id)a3 withDescription:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 domain];
  uint64_t v11 = [v9 code];
  if (v10)
  {
    if (([(id)*MEMORY[0x1E4F289A0] isEqual:v10] & (v11 != -999)) != 0) {
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
  }
  else
  {
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v7, v12))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = v8;
    __int16 v22 = 2114;
    v23 = v10;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1DD523000, v7, v12, "%{public}@ %{public}@/%ld", buf, 0x20u);
  }
  CFDictionaryRef v13 = [v9 userInfo];
  if (v13)
  {
    CFDictionaryRef v14 = v13;
    if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E4F1D140])) {
      BOOL v15 = CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x1E4F1D170]) != 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (CFDictionaryContainsKey(v14, @"NSErrorFailingURLStringKey")) {
      BOOL v16 = CFDictionaryContainsKey(v14, @"NSErrorFailingURLKey") != 0;
    }
    else {
      BOOL v16 = 0;
    }
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v14);
    if (MutableCopy)
    {
      v18 = MutableCopy;
      if (v15) {
        CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x1E4F1D170]);
      }
      if (v16) {
        CFDictionaryRemoveValue(v18, @"NSErrorFailingURLStringKey");
      }
    }
    else
    {
      v18 = v14;
    }
    v19 = [NSString stringWithFormat:@"%@, %@/%ld", v8, v10, v11];
    [(id)objc_opt_class() printToLog:v7 withDescription:v19 object:v18];
  }
}

+ (void)printToLog:(id)a3 withDescription:(id)a4 object:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(id)objc_opt_class() printToLog:v7 withDescription:v8 dictionary:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)objc_opt_class() printToLog:v7 withDescription:v8 array:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(id)objc_opt_class() printToLog:v7 withDescription:v8 error:v9];
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543618;
        id v11 = v8;
        __int16 v12 = 2114;
        id v13 = v9;
        _os_log_impl(&dword_1DD523000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

@end