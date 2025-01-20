@interface DEAnnotation
+ (id)errorWithMessage:(id)a3;
+ (id)readExtendedAttributeInURL:(id)a3 forKey:(id)a4 error:(id *)a5;
+ (id)writeExtendedAttributeInURL:(id)a3 forKey:(id)a4 value:(id)a5;
+ (void)annotateURL:(id)a3 displayName:(id)a4 description:(id)a5 iconType:(id)a6 additionalInfo:(id)a7 error:(id *)a8;
@end

@implementation DEAnnotation

+ (void)annotateURL:(id)a3 displayName:(id)a4 description:(id)a5 iconType:(id)a6 additionalInfo:(id)a7 error:(id *)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = [a1 writeExtendedAttributeInURL:v14 forKey:@"com.apple.diagnosticextensions.displayName" value:a4];
  if (v18
    || ([a1 writeExtendedAttributeInURL:v14 forKey:@"com.apple.diagnosticextensions.description" value:v15], (v18 = objc_claimAutoreleasedReturnValue()) != 0)|| v16&& (objc_msgSend(a1, "writeExtendedAttributeInURL:forKey:value:", v14, @"com.apple.diagnosticextensions.iconType", v16), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = v18;
    if (a8) {
      *a8 = (id)[v18 copy];
    }
  }
  else if (v17)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v29 = v17;
      id v30 = v16;
      id v31 = v15;
      uint64_t v23 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v26 = [v20 objectForKeyedSubscript:v25];
          v27 = [NSString stringWithFormat:@"%@.%@", @"com.apple.diagnosticextensions.additionalInfo", v25];
          v28 = [a1 writeExtendedAttributeInURL:v14 forKey:v27 value:v26];
          if (v28)
          {
            v19 = v28;
            if (a8) {
              *a8 = (id)[v28 copy];
            }

            goto LABEL_21;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      v19 = 0;
LABEL_21:
      id v16 = v30;
      id v15 = v31;
      id v17 = v29;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
}

+ (id)readExtendedAttributeInURL:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 path];

  if (!v10)
  {
    if (!a5) {
      goto LABEL_25;
    }
    [NSString stringWithFormat:@"URL path is nil. Cannot read annotation for key [%@]", v9, v27];
    goto LABEL_23;
  }
  id v11 = [v8 path];
  v12 = (const char *)[v11 cStringUsingEncoding:4];

  if (!v12)
  {
    if (!a5) {
      goto LABEL_25;
    }
    [NSString stringWithFormat:@"urlPathAsCString is nil. Cannot read annotation for key [%@]", v9, v27];
    goto LABEL_23;
  }
  id v13 = v9;
  id v14 = (const char *)[v13 cStringUsingEncoding:4];
  if (!v14)
  {
    if (!a5) {
      goto LABEL_25;
    }
    [NSString stringWithFormat:@"keyAsCString is nil. Cannot write annotation for key [%@]", v13, v27];
    goto LABEL_23;
  }
  id v15 = v14;
  ssize_t v16 = getxattr(v12, v14, 0, 0, 0, 0);
  if (v16 == -1)
  {
    if (*__error() == 93)
    {
      uint64_t v21 = +[DELogging fwHandle];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v13;
        _os_log_impl(&dword_1A7E51000, v21, OS_LOG_TYPE_INFO, "Extended attribute not found for key [%{public}@]", buf, 0xCu);
      }
    }
    else
    {
      if (a5)
      {
        [NSString stringWithFormat:@"Error reading key [%@] errno: [%i]", v13, *__error()];
        goto LABEL_23;
      }
      uint64_t v21 = +[DELogging fwHandle];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[DEAnnotation readExtendedAttributeInURL:forKey:error:]();
      }
    }
LABEL_34:

    goto LABEL_24;
  }
  size_t v17 = v16;
  v18 = malloc_type_calloc(v16 + 1, 1uLL, 0x100004077774924uLL);
  if (!v18)
  {
    if (a5)
    {
      [NSString stringWithFormat:@"Error allocating buffer to read value for key [%@] size: [%li]", v13, v17];
      uint64_t v22 = LABEL_23:;
      *a5 = [a1 errorWithMessage:v22];

LABEL_24:
      a5 = 0;
      goto LABEL_25;
    }
    uint64_t v21 = +[DELogging fwHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[DEAnnotation readExtendedAttributeInURL:forKey:error:]((uint64_t)v13, v17, v21);
    }
    goto LABEL_34;
  }
  v19 = v18;
  if (getxattr(v12, v15, v18, v17, 0, 0) == -1)
  {
    if (a5)
    {
      v24 = [NSString stringWithFormat:@"Error reading key [%@], errno: [%i]", v13, *__error()];
      *a5 = [a1 errorWithMessage:v24];
    }
    else
    {
      uint64_t v25 = +[DELogging fwHandle];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[DEAnnotation readExtendedAttributeInURL:forKey:error:]();
      }
    }
    free(v19);
    goto LABEL_24;
  }
  id v20 = +[DELogging fwHandle];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v26 = [v8 lastPathComponent];
    *(_DWORD *)buf = 136381187;
    id v29 = v19;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2114;
    long long v33 = v26;
    _os_log_debug_impl(&dword_1A7E51000, v20, OS_LOG_TYPE_DEBUG, "Read [%{private}s] for key [%{public}@] in file [%{public}@]", buf, 0x20u);
  }
  a5 = [NSString stringWithCString:v19 encoding:4];
  free(v19);
LABEL_25:

  return a5;
}

+ (id)writeExtendedAttributeInURL:(id)a3 forKey:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 path];

  if (v11)
  {
    id v12 = [v8 path];
    id v13 = (const char *)[v12 cStringUsingEncoding:4];

    if (v13)
    {
      uint64_t v14 = [v10 cStringUsingEncoding:4];
      if (v14)
      {
        id v15 = (const char *)v14;
        id v16 = v9;
        uint64_t v17 = [v16 cStringUsingEncoding:4];
        if (v17)
        {
          v18 = (const char *)v17;
          size_t v19 = strlen(v15);
          setxattr(v13, v18, v15, v19, 0, 0);
          id v20 = 0;
          goto LABEL_11;
        }
        [NSString stringWithFormat:@"keyAsCString is nil. Cannot write annotation for key [%@]", v16];
      }
      else
      {
        [NSString stringWithFormat:@"valueAsCString is nil. Cannot write annotation for key [%@]", v9];
      }
    }
    else
    {
      [NSString stringWithFormat:@"urlPathAsCString is nil. Cannot write annotation for key [%@]", v9];
    }
  }
  else
  {
    [NSString stringWithFormat:@"URL path is nil. Cannot write annotation for key [%@]", v9];
  uint64_t v21 = };
  id v20 = [a1 errorWithMessage:v21];

LABEL_11:
  return v20;
}

+ (id)errorWithMessage:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v3 errorWithDomain:@"DEExtensionErrorDomain" code:5 userInfo:v6];

  return v7;
}

+ (void)readExtendedAttributeInURL:forKey:error:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1A7E51000, v0, v1, "Error reading extended attribute key [%{public}@] errno: [%i]", v2, v3, v4, v5, v6);
}

+ (void)readExtendedAttributeInURL:(uint64_t)a1 forKey:(uint64_t)a2 error:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Error allocating buffer to read value for key [%{public}@] size: [%li]", (uint8_t *)&v3, 0x16u);
}

+ (void)readExtendedAttributeInURL:forKey:error:.cold.3()
{
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1A7E51000, v0, v1, "Error reading extended attribute key [%{public}@], errno: [%i]", v2, v3, v4, v5, v6);
}

@end