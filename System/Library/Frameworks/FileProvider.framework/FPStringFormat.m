@interface FPStringFormat
+ (id)formatForPlistObject:(id)a3 localizationLookup:(id)a4;
+ (id)formatForStringFormatDict:(id)a3 localizationLookup:(id)a4;
- (NSArray)keyPaths;
- (NSString)format;
- (id)evaluateWithValuesByName:(id)a3 error:(id *)a4;
- (unint64_t)length;
- (void)setFormat:(id)a3;
- (void)setKeyPaths:(id)a3;
@end

@implementation FPStringFormat

- (NSArray)keyPaths
{
  v2 = (void *)[(NSArray *)self->_keyPaths copy];

  return (NSArray *)v2;
}

+ (id)formatForPlistObject:(id)a3 localizationLookup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = objc_opt_new();
    v9 = [v7 localizedStringForKey:v6];
    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = v6;
    }
    [v8 setFormat:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [a1 formatForStringFormatDict:v6 localizationLookup:v7];
    }
    else
    {
      v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[FPStringFormat formatForPlistObject:localizationLookup:]();
      }

      v8 = 0;
    }
  }

  return v8;
}

+ (id)formatForStringFormatDict:(id)a3 localizationLookup:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:@"NSStringFormat"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 localizedStringForKey:v7];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;

      id v7 = v10;
    }
    uint64_t v11 = [v5 objectForKey:@"NSStringFormatValues"];
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      v13 = (void *)v11;
    }
    id v14 = v13;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v14 count] < 0xB)
      {
        id v24 = v6;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v17 = v14;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v17);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v22 = fp_current_or_default_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                  +[FPStringFormat formatForStringFormatDict:localizationLookup:]();
                }

                v16 = 0;
                goto LABEL_28;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        v16 = objc_opt_new();
        [v16 setFormat:v7];
        [v16 setKeyPaths:v17];
LABEL_28:
        id v6 = v24;
        goto LABEL_29;
      }
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[FPStringFormat formatForStringFormatDict:localizationLookup:](v14, v15);
      }
    }
    else
    {
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[FPStringFormat formatForStringFormatDict:localizationLookup:]();
      }
    }

    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[FPStringFormat formatForStringFormatDict:localizationLookup:].cold.4();
  }
  v16 = 0;
LABEL_30:

  return v16;
}

- (void)setFormat:(id)a3
{
}

- (void)setKeyPaths:(id)a3
{
}

- (unint64_t)length
{
  return [(NSString *)self->_format length];
}

- (id)evaluateWithValuesByName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(FPStringFormat *)self format];
  v8 = [(FPStringFormat *)self keyPaths];
  v9 = objc_msgSend(v7, "fp_localizedFormatWithKeys:fromDictionary:error:", v8, v6, a4);

  return v9;
}

- (NSString)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_keyPaths, 0);
}

+ (void)formatForPlistObject:localizationLookup:.cold.1()
{
  id v0 = (id)objc_opt_class();
  id v1 = (id)objc_opt_class();
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] Malformed format. Object should have class %@ or %@, but it has %@", v5, v6, v7, v8, 2u);
}

+ (void)formatForStringFormatDict:(void *)a1 localizationLookup:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = @"NSStringFormatValues";
  __int16 v5 = 1024;
  int v6 = 10;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 count];
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Malformed format. %@ should have at most %d values, but it has %lu", (uint8_t *)&v3, 0x1Cu);
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.2()
{
  id v0 = (id)objc_opt_class();
  id v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_13(v1);
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] Malformed format. Value in %@ should have class %@, but it has %@", v5, v6, v7, v8, 2u);
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.3()
{
  id v0 = (id)objc_opt_class();
  id v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_13(v1);
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] Malformed format. %@ should have class %@, but it has %@", v5, v6, v7, v8, 2u);
}

+ (void)formatForStringFormatDict:localizationLookup:.cold.4()
{
  id v0 = (id)objc_opt_class();
  id v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_13(v1);
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] Malformed format. %@ should have class %@, but it has %@", v5, v6, v7, v8, 2u);
}

@end