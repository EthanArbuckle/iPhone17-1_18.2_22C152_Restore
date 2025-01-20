@interface ASDCoding
+ (BOOL)securelyEncodeObject:(id)a3 forKey:(id)a4 withCoder:(id)a5 error:(id *)a6;
+ (id)_findNonSecureClassesFromObject:(uint64_t)a1;
+ (id)createDataByEncodingError:(id)a3;
+ (id)createErrorByDecodingData:(id)a3;
@end

@implementation ASDCoding

+ (id)createDataByEncodingError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)createErrorByDecodingData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)securelyEncodeObject:(id)a3 forKey:(id)a4 withCoder:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[ASDCoding _findNonSecureClassesFromObject:]((uint64_t)a1, v10);
  if ([v13 count])
  {
    v14 = NSString;
    v15 = [v13 componentsJoinedByString:@", "];
    v16 = [v14 stringWithFormat:@"Attempted to encode classes that don't conform to NSSecureCoding: '%@' with key '%@'", v15, v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      v23 = v16;
      id v19 = v21;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@", buf, 0x16u);
    }
    ASDErrorWithUnderlyingErrorAndInfo(0, @"ASDErrorDomain", 507, @"Error encoding object", v16, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    if (a6 && v17)
    {
      id v17 = v17;
      *a6 = v17;
    }
  }
  else
  {
    [v12 encodeObject:v10 forKey:v11];
    id v17 = 0;
  }

  return v17 == 0;
}

+ (id)_findNonSecureClassesFromObject:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_24;
  }
  uint64_t v4 = v3;
  id v5 = (id)objc_opt_new();
  if (([v2 conformsToProtocol:&unk_1EEC57C20] & 1) == 0)
  {
    v6 = [NSString stringWithFormat:@"%@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      v28 = v6;
      id v16 = v26;
      _os_log_error_impl(&dword_19BF6A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]:  Error: Found class %{public}@ that doesn't conform to NSSecureCoding", buf, 0x16u);
    }
    [v5 addObject:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v2 userInfo];
    v8 = +[ASDCoding _findNonSecureClassesFromObject:](v4, v7);

    if ([v8 count]) {
      [v5 addObjectsFromArray:v8];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__ASDCoding__findNonSecureClassesFromObject___block_invoke;
    v21[3] = &unk_1E58B49C8;
    uint64_t v23 = v4;
    id v5 = v5;
    id v22 = v5;
    [v2 enumerateKeysAndObjectsUsingBlock:v21];
    id v9 = v22;
  }
  else
  {
    if (![v2 conformsToProtocol:&unk_1EEC67080]) {
      goto LABEL_24;
    }
    id v9 = v2;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[ASDCoding _findNonSecureClassesFromObject:](v4, *(void *)(*((void *)&v17 + 1) + 8 * i));
          if ([v14 count]) {
            [v5 addObjectsFromArray:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v11);
    }
  }

LABEL_24:
  return v5;
}

void __45__ASDCoding__findNonSecureClassesFromObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[ASDCoding _findNonSecureClassesFromObject:](*(void *)(a1 + 40), a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
  }
}

@end