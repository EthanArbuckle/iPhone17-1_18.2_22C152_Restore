@interface NSDictionary(FMAdditions)
+ (id)fm_dictionaryWithContentsOfData:()FMAdditions;
+ (id)fm_dictionaryWithContentsOfURL:()FMAdditions error:;
- (id)fm_dictionaryByMappingValues:()FMAdditions;
- (id)fm_dictionaryWithLowercaseKeys;
- (id)fm_filter:()FMAdditions;
@end

@implementation NSDictionary(FMAdditions)

+ (id)fm_dictionaryWithContentsOfData:()FMAdditions
{
  id v7 = 0;
  uint64_t v8 = 0;
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:&v8 error:&v7];
  id v4 = v7;
  if (v4)
  {

    v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NSDictionary(FMAdditions) fm_dictionaryWithContentsOfData:]((uint64_t)v4, v5);
    }

    v3 = 0;
  }

  return v3;
}

- (id)fm_dictionaryWithLowercaseKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [a1 objectForKeyedSubscript:v8];
        v10 = [v8 lowercaseString];
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)fm_dictionaryWithContentsOfURL:()FMAdditions error:
{
  if (!a3)
  {
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  id v11 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v10 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v10];
  if (a4)
  {
    id v6 = v10;
LABEL_8:
    *a4 = v6;
  }
LABEL_9:

LABEL_10:
  return v8;
}

- (id)fm_filter:()FMAdditions
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __39__NSDictionary_FMAdditions__fm_filter___block_invoke;
    long long v12 = &unk_1E6019B08;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateKeysAndObjectsUsingBlock:&v9];
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)fm_dictionaryByMappingValues:()FMAdditions
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__NSDictionary_FMAdditions__fm_dictionaryByMappingValues___block_invoke;
    v10[3] = &unk_1E6019B30;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

+ (void)fm_dictionaryWithContentsOfData:()FMAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FB9000, a2, OS_LOG_TYPE_ERROR, "Error parsing property list: %@", (uint8_t *)&v2, 0xCu);
}

@end