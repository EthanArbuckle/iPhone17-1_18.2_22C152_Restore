@interface ATXInformationHeuristicResult
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicResult)initWithCoder:(id)a3;
- (ATXInformationHeuristicResult)initWithHeuristicName:(id)a3 suggestions:(id)a4 refreshTriggers:(id)a5 hasFailed:(BOOL)a6;
- (BOOL)hasFailed;
- (NSArray)suggestions;
- (NSSet)refreshTriggers;
- (NSString)heuristicName;
- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6;
- (id)_safeDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInformationHeuristicResult

- (ATXInformationHeuristicResult)initWithHeuristicName:(id)a3 suggestions:(id)a4 refreshTriggers:(id)a5 hasFailed:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXInformationHeuristicResult;
  v14 = [(ATXInformationHeuristicResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_heuristicName, a3);
    objc_storeStrong((id *)&v15->_suggestions, a4);
    objc_storeStrong((id *)&v15->_refreshTriggers, a5);
    v15->_hasFailed = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  heuristicName = self->_heuristicName;
  id v5 = a3;
  [v5 encodeObject:heuristicName forKey:@"heuristicName"];
  [v5 encodeObject:self->_suggestions forKey:@"suggestions"];
  [v5 encodeObject:self->_refreshTriggers forKey:@"refreshTriggers"];
  [v5 encodeBool:self->_hasFailed forKey:@"hasFailed"];
}

- (ATXInformationHeuristicResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXInformationHeuristicResult;
  id v5 = [(ATXInformationHeuristicResult *)&v23 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [(ATXInformationHeuristicResult *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"heuristicName" withCoder:v4 nonNull:1];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [(ATXInformationHeuristicResult *)v5 _safeDecodeObjectOfClasses:v9 forKey:@"suggestions" withCoder:v4 nonNull:1];

  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [(ATXInformationHeuristicResult *)v5 _safeDecodeObjectOfClasses:v13 forKey:@"refreshTriggers" withCoder:v4 nonNull:1];

  if (v6)
  {
    if (v10)
    {
      if (v14)
      {
        v15 = [v4 error];

        if (!v15)
        {
          heuristicName = v5->_heuristicName;
          v5->_heuristicName = v6;
          v18 = v6;

          suggestions = v5->_suggestions;
          v5->_suggestions = v10;
          v20 = v10;

          refreshTriggers = v5->_refreshTriggers;
          v5->_refreshTriggers = v14;

          v5->_hasFailed = [v4 decodeBoolForKey:@"hasFailed"];
LABEL_8:
          v16 = v5;
          goto LABEL_9;
        }
      }
    }
  }

  v16 = 0;
LABEL_9:

  return v16;
}

- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  BOOL v6 = a6;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 decodeObjectOfClass:a3 forKey:v9];
  if (v11)
  {
    if (objc_opt_isKindOfClass())
    {
LABEL_3:
      id v12 = v11;
      goto LABEL_10;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v9, *MEMORY[0x1E4F28568]];
    v27 = v16;
    objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v18 = (void *)[v15 initWithDomain:@"ATXInformationHeuristicResult" code:-1 userInfo:v17];
    [v10 failWithError:v18];

    v14 = __atxlog_handle_gi();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
    }
  }
  else
  {
    id v13 = [v10 error];

    if (v13)
    {
      v14 = __atxlog_handle_gi();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
    else
    {
      if (!v6) {
        goto LABEL_3;
      }
      if ([v10 containsValueForKey:v9])
      {
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v20 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\"", v9];
        v31[0] = v20;
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = (void **)v31;
        objc_super v23 = &v30;
      }
      else
      {
        uint64_t v28 = *MEMORY[0x1E4F28568];
        v20 = [NSString stringWithFormat:@"key \"%@\" not present", v9];
        v29 = v20;
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = &v29;
        objc_super v23 = &v28;
      }
      v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];

      v14 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXInformationHeuristicResult" code:-1 userInfo:v24];
      [v10 failWithError:v14];
      v25 = __atxlog_handle_gi();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
  }

  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)_safeDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  BOOL v6 = a6;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 decodeObjectOfClasses:v9 forKey:v10];
  if (v12)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass())
          {
            id v22 = v12;
            goto LABEL_25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v10];
    v36 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v21 = (void *)[v18 initWithDomain:@"ATXInformationHeuristicResult" code:-1 userInfo:v20];
    [v11 failWithError:v21];

    id v13 = __atxlog_handle_gi();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
    }
  }
  else
  {
    objc_super v23 = [v11 error];

    if (v23)
    {
      id v13 = __atxlog_handle_gi();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
    else
    {
      if (!v6)
      {
        id v22 = 0;
        goto LABEL_26;
      }
      if ([v11 containsValueForKey:v10])
      {
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v24 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\"", v10];
        v41[0] = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = (void **)v41;
        v27 = &v40;
      }
      else
      {
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v24 = [NSString stringWithFormat:@"key \"%@\" not present", v10];
        v39 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v39;
        v27 = &v38;
      }
      uint64_t v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];

      id v13 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXInformationHeuristicResult" code:-1 userInfo:v28];
      [v11 failWithError:v13];
      v29 = __atxlog_handle_gi();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
  }
  id v22 = 0;
LABEL_25:

LABEL_26:

  return v22;
}

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSSet)refreshTriggers
{
  return self->_refreshTriggers;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTriggers, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);

  objc_storeStrong((id *)&self->_heuristicName, 0);
}

- (void)_safeDecodeObjectOfClass:forKey:withCoder:nonNull:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(v0, v1), "error");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D0F43000, v3, v4, "ATXInformationHeuristicResult: error decoding %@ - %@", v5, v6, v7, v8, v9);
}

@end