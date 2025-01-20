@interface HKJSONValidator
+ (BOOL)validateJSONObject:(id)a3 withSchemaNamed:(id)a4 bundle:(id)a5 error:(id *)a6;
+ (NSArray)searchPaths;
+ (void)registerSearchPath:(id)a3;
- (BOOL)_validateArray:(id)a3 schema:(id)a4 keyStack:(id)a5;
- (BOOL)_validateBoolean:(id)a3;
- (BOOL)_validateDictionary:(id)a3 schema:(id)a4 keyStack:(id)a5;
- (BOOL)_validateFingerprintSHA256:(id)a3;
- (BOOL)_validateJSONObject:(id)a3 keyStack:(id)a4;
- (BOOL)_validatePrimitive:(id)a3 schema:(id)a4 keyStack:(id)a5;
- (BOOL)_validateTimezone:(id)a3;
- (BOOL)_validateURL:(id)a3;
- (BOOL)_validateValue:(id)a3 schema:(id)a4 keyStack:(id)a5 root:(BOOL)a6;
- (BOOL)_validateValue:(id)a3 subschemaNamed:(id)a4 keyStack:(id)a5;
- (BOOL)validateJSONObject:(id)a3 error:(id *)a4;
- (HKJSONValidator)init;
- (HKJSONValidator)initWithSchema:(id)a3;
- (HKJSONValidator)initWithSchema:(id)a3 subschemaCache:(id)a4;
- (HKJSONValidator)initWithSchemaNamed:(id)a3 bundle:(id)a4;
- (NSCopying)schema;
- (id)_loadSubschemaNamed:(id)a3;
- (id)_mismatchErrorFromKeyStack:(id)a3;
@end

@implementation HKJSONValidator

+ (void)registerSearchPath:(id)a3
{
  id v11 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = v11;
  v6 = (void *)_searchPaths;
  if (!_searchPaths)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v8 = (void *)_searchPaths;
    _searchPaths = (uint64_t)v7;

    v6 = (void *)_searchPaths;
    id v5 = v11;
  }
  if (([v6 containsObject:v5] & 1) == 0)
  {
    uint64_t v9 = [(id)_searchPaths arrayByAddingObject:v11];
    v10 = (void *)_searchPaths;
    _searchPaths = v9;
  }
  objc_sync_exit(v4);
}

+ (NSArray)searchPaths
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_searchPaths;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (HKJSONValidator)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKJSONValidator)initWithSchema:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKJSONValidator;
  id v5 = [(HKJSONValidator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    schema = v5->_schema;
    v5->_schema = (NSCopying *)v6;
  }
  return v5;
}

- (HKJSONValidator)initWithSchema:(id)a3 subschemaCache:(id)a4
{
  id v6 = a4;
  id v7 = [(HKJSONValidator *)self initWithSchema:a3];
  if (v7)
  {
    uint64_t v8 = [v6 mutableCopy];
    subschemaCache = v7->_subschemaCache;
    v7->_subschemaCache = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (HKJSONValidator)initWithSchemaNamed:(id)a3 bundle:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 URLForResource:v6 withExtension:@"json"];
  if (v8)
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v8];
    v10 = v9;
    if (v9)
    {
      [v9 open];
      id v16 = 0;
      id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v10 options:0 error:&v16];
      id v12 = v16;
      [v10 close];
      if (v11)
      {
        self = [(HKJSONValidator *)self initWithSchema:v11];
        v13 = self;
      }
      else
      {
        _HKInitializeLogging();
        v14 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v18 = v6;
          __int16 v19 = 2114;
          id v20 = v7;
          __int16 v21 = 2114;
          id v22 = v12;
          _os_log_error_impl(&dword_19C023000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize schema %{public}@ in bundle %{public}@: %{public}@", buf, 0x20u);
        }
        v13 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        -[HKJSONValidator initWithSchemaNamed:bundle:]();
      }
      v13 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[HKJSONValidator initWithSchemaNamed:bundle:]();
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)validateJSONObject:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  BOOL v9 = [(HKJSONValidator *)self _validateJSONObject:v7 keyStack:v8];

  if (!v9)
  {
    id v10 = [(HKJSONValidator *)self _mismatchErrorFromKeyStack:v8];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }
  }
  return v9;
}

- (BOOL)_validateJSONObject:(id)a3 keyStack:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKJSONValidator *)self schema];
  LOBYTE(self) = [(HKJSONValidator *)self _validateValue:v7 schema:v8 keyStack:v6 root:1];

  return (char)self;
}

+ (BOOL)validateJSONObject:(id)a3 withSchemaNamed:(id)a4 bundle:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [[HKJSONValidator alloc] initWithSchemaNamed:v10 bundle:v11];
  v13 = v12;
  if (v12)
  {
    BOOL v14 = [(HKJSONValidator *)v12 validateJSONObject:v9 error:a6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Unable to create JSON validator with schema %@ in bundle %@", v10, v11);
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_validateValue:(id)a3 schema:(id)a4 keyStack:(id)a5 root:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v13 = [(HKJSONValidator *)self _validateArray:v10 schema:v11 keyStack:v12];
      goto LABEL_9;
    }
    if (!a6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v13 = [(HKJSONValidator *)self _validatePrimitive:v10 schema:v11 keyStack:v12];
        goto LABEL_9;
      }
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  BOOL v13 = [(HKJSONValidator *)self _validateDictionary:v10 schema:v11 keyStack:v12];
LABEL_9:
  BOOL v14 = v13;
LABEL_11:

  return v14;
}

- (BOOL)_validateDictionary:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v19 = 0;
    goto LABEL_24;
  }
  if (![v8 count])
  {
    BOOL v19 = 1;
    goto LABEL_24;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v11)
  {
    BOOL v19 = 1;
    goto LABEL_23;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v24;
  id v21 = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      id v16 = [v10 objectForKeyedSubscript:v15];
      if ([v15 hasSuffix:@"?"])
      {
        v17 = [v15 substringToIndex:objc_msgSend(v15, "length") - objc_msgSend(@"?", "length")];
        id v18 = [v7 objectForKeyedSubscript:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      else
      {
        id v18 = [v7 objectForKeyedSubscript:v15];
      }
      objc_msgSend(v9, "addObject:", v15, v21);
      if (![(HKJSONValidator *)self _validateValue:v18 schema:v16 keyStack:v9 root:0])
      {

LABEL_22:
        BOOL v19 = 0;
        id v8 = v21;
        goto LABEL_23;
      }
      [v9 removeLastObject];

LABEL_15:
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    BOOL v19 = 1;
    id v8 = v21;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_24:
  return v19;
}

- (BOOL)_validateArray:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 count])
    {
      uint64_t v11 = [v9 lastObject];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            if (!-[HKJSONValidator _validateValue:schema:keyStack:root:](self, "_validateValue:schema:keyStack:root:", *(void *)(*((void *)&v19 + 1) + 8 * i), v11, v10, 0, (void)v19))
            {
              BOOL v17 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      BOOL v17 = 1;
LABEL_14:
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_validatePrimitive:(id)a3 schema:(id)a4 keyStack:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 addObject:v9];
  if (![v9 isEqualToString:@"BOOLean"])
  {
    if ([v9 isEqualToString:@"number"]
      || [v9 isEqualToString:@"string"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_7;
      }
    }
    else
    {
      if ([v9 isEqualToString:@"fingerprint:sha256"])
      {
        if (![(HKJSONValidator *)self _validateFingerprintSHA256:v8]) {
          goto LABEL_20;
        }
        goto LABEL_7;
      }
      if ([v9 isEqualToString:@"timezone"])
      {
        if (![(HKJSONValidator *)self _validateTimezone:v8]) {
          goto LABEL_20;
        }
        goto LABEL_7;
      }
      if ([v9 isEqualToString:@"url"])
      {
        if (![(HKJSONValidator *)self _validateURL:v8]) {
          goto LABEL_20;
        }
        goto LABEL_7;
      }
      if ([v9 hasPrefix:@"schema:"])
      {
        id v12 = [v9 substringFromIndex:objc_msgSend(@"schema:", "length")];
        BOOL v11 = [(HKJSONValidator *)self _validateValue:v8 subschemaNamed:v12 keyStack:v10];

        if (!v11) {
          goto LABEL_21;
        }
        goto LABEL_7;
      }
    }
LABEL_20:
    LOBYTE(v11) = 0;
    goto LABEL_21;
  }
  if (![(HKJSONValidator *)self _validateBoolean:v8]) {
    goto LABEL_20;
  }
LABEL_7:
  [v10 removeLastObject];
  LOBYTE(v11) = 1;
LABEL_21:

  return v11;
}

- (BOOL)_validateBoolean:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = CFGetTypeID(v3);
    BOOL v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_validateFingerprintSHA256:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "hk_dataWithSHA256Fingerprint:error:", v3, 0);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_validateTimezone:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_validateURL:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = [v4 scheme];
      if (v6)
      {
        id v7 = [v5 host];
        BOOL v8 = v7 != 0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_validateValue:(id)a3 subschemaNamed:(id)a4 keyStack:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HKJSONValidator *)self _loadSubschemaNamed:a4];
  if (v10)
  {
    id v11 = objc_alloc((Class)objc_opt_class());
    id v12 = (void *)[(NSMutableDictionary *)self->_subschemaCache mutableCopy];
    uint64_t v13 = (void *)[v11 initWithSchema:v10 subschemaCache:v12];

    char v14 = [v13 _validateJSONObject:v8 keyStack:v9];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)_loadSubschemaNamed:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  subschemaCache = self->_subschemaCache;
  if (!subschemaCache)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_subschemaCache;
    self->_subschemaCache = v6;

    subschemaCache = self->_subschemaCache;
  }
  id v8 = [(NSMutableDictionary *)subschemaCache objectForKeyedSubscript:v4];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v10 = [v4 stringByAppendingPathExtension:@"json"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = [(id)objc_opt_class() searchPaths];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) URLByAppendingPathComponent:v10];
          BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v16];
          if (v17)
          {
            long long v19 = v17;
            [v17 open];
            id v24 = 0;
            long long v20 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v19 options:0 error:&v24];
            id v21 = v24;
            [v19 close];
            if (!v20)
            {
              _HKInitializeLogging();
              long long v22 = (void *)HKLogDefault;
              if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
                [(HKJSONValidator *)v22 _loadSubschemaNamed:(uint64_t)v21];
              }
            }
            [(NSMutableDictionary *)self->_subschemaCache setObject:v20 forKeyedSubscript:v4];
            id v9 = v20;

            goto LABEL_20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    id v18 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[HKJSONValidator _loadSubschemaNamed:]((uint64_t)v4, v18);
    }
    id v9 = 0;
LABEL_20:
  }

  return v9;
}

- (id)_mismatchErrorFromKeyStack:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 componentsJoinedByString:@"."];
  id v4 = (void *)[[NSString alloc] initWithFormat:@"Schema mismatch at %@", v3];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v9[0] = @"HKJSONErrorKeyPathKey";
  v9[1] = v5;
  v10[0] = v3;
  v10[1] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.healthkit.private.json" code:1 userInfo:v6];

  return v7;
}

- (NSCopying)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_subschemaCache, 0);
}

- (void)initWithSchemaNamed:bundle:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Schema %{public}@ not found in bundle %{public}@");
}

- (void)initWithSchemaNamed:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Failed to open schema %{public}@ in bundle %{public}@");
}

- (void)_loadSubschemaNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Subschema not found: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_loadSubschemaNamed:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  id v6 = [a2 absoluteString];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_19C023000, v5, OS_LOG_TYPE_ERROR, "Unable to load subschema at %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end