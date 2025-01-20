@interface NSDictionary(ClassChecking)
- (id)axssDecodeArrayOfClass:()ClassChecking forKey:;
- (id)axssDecodeObjectOfClass:()ClassChecking forKey:;
- (uint64_t)axssDecodeBoolForKey:()ClassChecking;
@end

@implementation NSDictionary(ClassChecking)

- (id)axssDecodeObjectOfClass:()ClassChecking forKey:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 objectForKeyedSubscript:v6];
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      uint64_t v13 = a3;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = (id)objc_opt_class();
      id v11 = v17;
      _os_log_error_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_ERROR, "Tried to decode object of class %@ for key %@, but was class %@ instead", (uint8_t *)&v12, 0x20u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (uint64_t)axssDecodeBoolForKey:()ClassChecking
{
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ClassChecking) axssDecodeBoolForKey:]();
    }

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v5 BOOLValue];
  }

  return v6;
}

- (id)axssDecodeArrayOfClass:()ClassChecking forKey:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 objectForKeyedSubscript:v6];
  if (!v7)
  {
LABEL_12:
    id v13 = v7;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v15 = AXSSLogForCategory(1);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v17 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              uint64_t v24 = a3;
              __int16 v25 = 2112;
              id v26 = v6;
              __int16 v27 = 2112;
              v28 = v17;
              id v18 = v17;
              _os_log_error_impl(&dword_1B3B9D000, v15, OS_LOG_TYPE_ERROR, "Tried to decode array of class %@ for key %@, but objects were of class %@ instead", buf, 0x20u);
            }
            goto LABEL_19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }
  __int16 v14 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[NSDictionary(ClassChecking) axssDecodeArrayOfClass:forKey:]();
  }

LABEL_19:
  id v13 = 0;
LABEL_20:

  return v13;
}

- (void)axssDecodeBoolForKey:()ClassChecking .cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_2_2(&dword_1B3B9D000, v2, v3, "Tried to decode NSNumber for key %@, but was class %@ instead", v4, v5, v6, v7, v8);
}

- (void)axssDecodeArrayOfClass:()ClassChecking forKey:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_2_2(&dword_1B3B9D000, v2, v3, "Tried to decode array for key %@, but was class %@ instead", v4, v5, v6, v7, v8);
}

@end