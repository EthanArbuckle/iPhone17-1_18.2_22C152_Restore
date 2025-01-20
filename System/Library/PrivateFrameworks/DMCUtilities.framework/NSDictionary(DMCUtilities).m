@interface NSDictionary(DMCUtilities)
+ (id)DMCDictionaryFromFile:()DMCUtilities;
+ (id)DMCShortenedArray:()DMCUtilities;
+ (id)DMCShortenedData:()DMCUtilities;
+ (id)DMCShortenedDictionary:()DMCUtilities;
+ (id)DMCShortenedObject:()DMCUtilities;
+ (id)dmc_jsonDictionaryFromData:()DMCUtilities;
- (id)DMCShortenedPlistDescription;
- (id)dmc_valueOfClass:()DMCUtilities forKey:;
- (uint64_t)DMCWriteToBinaryFile:()DMCUtilities;
@end

@implementation NSDictionary(DMCUtilities)

+ (id)DMCDictionaryFromFile:()DMCUtilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v12 = 0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v12];
  id v6 = v12;
  v7 = v6;
  if (!v5)
  {
    v9 = [v6 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v10 = [v7 code];

      if (v10 != 4) {
        goto LABEL_2;
      }
    }
    else
    {
    }
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v3;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
LABEL_2:

  return v5;
}

- (uint64_t)DMCWriteToBinaryFile:()DMCUtilities
{
  id v4 = a3;
  v5 = [[DMCDictionaryWriter alloc] initWithDictionary:a1 path:v4];

  uint64_t v6 = [(DMCDictionaryWriter *)v5 write];
  return v6;
}

- (id)dmc_valueOfClass:()DMCUtilities forKey:
{
  id v4 = [a1 objectForKeyedSubscript:a4];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)dmc_jsonDictionaryFromData:()DMCUtilities
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v12];
  id v4 = v12;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      goto LABEL_11;
    }
  }
  id v6 = *DMCLogObjects();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      v8 = "Failed to serialize data with error: %{public}@";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = "JSON Dict from response data is not valid.";
    v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (id)DMCShortenedPlistDescription
{
  v1 = [(id)objc_opt_class() DMCShortenedDictionary:a1];
  v2 = [v1 description];

  return v2;
}

+ (id)DMCShortenedObject:()DMCUtilities
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 DMCShortenedArray:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 DMCShortenedDictionary:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [a1 DMCShortenedData:v4];
      }
      else
      {
        id v5 = v4;
      }
    }
  }
  id v6 = v5;

  return v6;
}

+ (id)DMCShortenedDictionary:()DMCUtilities
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__NSDictionary_DMCUtilities__DMCShortenedDictionary___block_invoke;
  v9[3] = &unk_1E5CFD8A8;
  id v7 = v6;
  id v10 = v7;
  uint64_t v11 = a1;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

+ (id)DMCShortenedArray:()DMCUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "DMCShortenedObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)DMCShortenedData:()DMCUtilities
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = [v3 length];
    id v5 = NSString;
    if (v4 > 0x10)
    {
      id v6 = objc_msgSend(v3, "subdataWithRange:", 0, 8);
      uint64_t v8 = [v6 DMCHexString];
      uint64_t v9 = objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 8, 8);
      id v10 = [v9 DMCHexString];
      uint64_t v7 = [v5 stringWithFormat:@"0x%@ ... 0x%@", v8, v10];
    }
    else
    {
      id v6 = [v3 DMCHexString];
      uint64_t v7 = [v5 stringWithFormat:@"0x%@", v6];
    }
  }
  else
  {
    uint64_t v7 = @"<empty>";
  }
  uint64_t v11 = [NSString stringWithFormat:@"Data { length = %lu, bytes = %@ }", objc_msgSend(v3, "length"), v7];

  return v11;
}

@end