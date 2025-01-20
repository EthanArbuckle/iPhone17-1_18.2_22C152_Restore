@interface NSDictionary(HKCodingSupport)
+ (id)dictionaryWithCodableMetadata:()HKCodingSupport;
- (HKCodableMetadataDictionary)codableMetadata;
@end

@implementation NSDictionary(HKCodingSupport)

- (HKCodableMetadataDictionary)codableMetadata
{
  v2 = objc_alloc_init(HKCodableMetadataDictionary);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NSDictionary_HKCodingSupport__codableMetadata__block_invoke;
  v5[3] = &unk_1E6D57B58;
  v3 = v2;
  v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

+ (id)dictionaryWithCodableMetadata:()HKCodingSupport
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 keyValuePairsCount];
  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(v3, "keyValuePairs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 key];
        if ([v11 hasNumberIntValue])
        {
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "numberIntValue"));
        }
        else
        {
          if (![v11 hasStringValue])
          {
            v14 = 0;
            goto LABEL_16;
          }
          uint64_t v13 = [v11 stringValue];
        }
        v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
LABEL_16:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

@end