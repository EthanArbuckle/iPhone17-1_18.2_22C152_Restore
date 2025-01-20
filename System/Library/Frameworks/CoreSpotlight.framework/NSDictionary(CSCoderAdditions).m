@interface NSDictionary(CSCoderAdditions)
- (void)encodeKeysAndValuesWithCSCoder:()CSCoderAdditions filterBlock:;
- (void)encodeWithCSCoder:()CSCoderAdditions;
@end

@implementation NSDictionary(CSCoderAdditions)

- (void)encodeKeysAndValuesWithCSCoder:()CSCoderAdditions filterBlock:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v30;
    *(void *)&long long v10 = 138412802;
    long long v28 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(NSObject **)(*((void *)&v29 + 1) + 8 * v13);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          v16 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v14;
              _os_log_error_impl(&dword_18D0E3000, v17, OS_LOG_TYPE_ERROR, "Dropping invalid key:%@", buf, 0xCu);
            }
            goto LABEL_34;
          }
          v16 = [v14 keyName];
        }
        v17 = v16;
        if (v7 && (v7[2](v7, v16) & 1) == 0)
        {
          v20 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v17;
            _os_log_debug_impl(&dword_18D0E3000, v20, OS_LOG_TYPE_DEBUG, "Dropping key:%@ since it was filtered out", buf, 0xCu);
          }
          goto LABEL_25;
        }
        if ((unint64_t)[v17 length] >= 0x3E9)
        {
          unint64_t v18 = [v17 lengthOfBytesUsingEncoding:4];
          if (v18 >= 0x1000)
          {
            unint64_t v19 = v18;
            v20 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              unint64_t v21 = [v17 length];
              if (v21 >= 0x1E) {
                uint64_t v22 = 30;
              }
              else {
                uint64_t v22 = v21;
              }
              v23 = -[NSObject substringWithRange:](v17, "substringWithRange:", 0, v22);
              *(_DWORD *)buf = v28;
              v34 = v23;
              __int16 v35 = 2048;
              unint64_t v36 = v19;
              __int16 v37 = 2048;
              uint64_t v38 = 4095;
              _os_log_error_impl(&dword_18D0E3000, v20, OS_LOG_TYPE_ERROR, "Dropping invalid key:\"%@\"..., lengthOfBytes:%ld/%ld", buf, 0x20u);
            }
            goto LABEL_25;
          }
        }
        if (isKindOfClass)
        {
          [v6 encodeObject:v14];
          v20 = [v8 objectForKeyedSubscript:v14];
          [v6 encodeObject:v20];
LABEL_25:

          goto LABEL_34;
        }
        v24 = v14;
        LODWORD(v25) = [v24 isSearchable];
        if ([v24 isSearchableByDefault]) {
          LODWORD(v25) = v25 | 2;
        }
        if ([v24 isUnique]) {
          LODWORD(v25) = v25 | 4;
        }
        if ([v24 isMultiValued]) {
          uint64_t v25 = v25 | 8;
        }
        else {
          uint64_t v25 = v25;
        }
        v26 = [v24 keyName];
        [v6 encodeObject:v26];

        [v6 beginArray];
        [v6 encodeInt32:v25];
        v27 = [v8 objectForKeyedSubscript:v24];

        [v6 encodeObject:v27];
        [v6 endArray];
LABEL_34:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v11);
  }
}

- (void)encodeWithCSCoder:()CSCoderAdditions
{
  id v4 = a3;
  [v4 beginDictionary];
  [a1 encodeKeysAndValuesWithCSCoder:v4 filterBlock:0];
  [v4 endDictionary];
}

@end