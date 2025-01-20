@interface NSDictionary(HDCodingSupport)
+ (id)hk_dictionaryOrNilWithCodableMetadata:()HDCodingSupport;
+ (id)hk_dictionaryWithCodableMetadata:()HDCodingSupport;
- (HDCodableMetadataDictionary)hk_codableMetadata;
@end

@implementation NSDictionary(HDCodingSupport)

- (HDCodableMetadataDictionary)hk_codableMetadata
{
  v2 = objc_alloc_init(HDCodableMetadataDictionary);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NSDictionary_HDCodingSupport__hk_codableMetadata__block_invoke;
  v5[3] = &unk_1E62FCB70;
  v3 = v2;
  v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

+ (id)hk_dictionaryWithCodableMetadata:()HDCodingSupport
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 keyValuePairsCount];
  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = v3;
  v6 = [v3 keyValuePairs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        v12 = [v11 key];
        if ([v11 hasStringValue])
        {
          uint64_t v13 = [v11 stringValue];
LABEL_14:
          v15 = (void *)v13;
          goto LABEL_15;
        }
        if ([v11 hasNumberDoubleValue])
        {
          v14 = NSNumber;
          [v11 numberDoubleValue];
          uint64_t v13 = objc_msgSend(v14, "numberWithDouble:");
          goto LABEL_14;
        }
        if ([v11 hasNumberIntValue])
        {
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "numberIntValue"));
          goto LABEL_14;
        }
        if ([v11 hasDateValue])
        {
          [v11 dateValue];
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
          goto LABEL_14;
        }
        if ([v11 hasQuantityValue])
        {
          v17 = (void *)MEMORY[0x1E4F2B370];
          v18 = [v11 quantityValue];
          uint64_t v19 = [v17 createWithCodable:v18];
        }
        else
        {
          if (![v11 hasDataValue])
          {
            v15 = 0;
            goto LABEL_20;
          }
          v20 = (void *)MEMORY[0x1E4F1C9B8];
          v18 = [v11 dataValue];
          uint64_t v19 = [v20 dataWithData:v18];
        }
        v15 = (void *)v19;

LABEL_15:
        if (v12) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          [v5 setObject:v15 forKeyedSubscript:v12];
        }
LABEL_20:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v21 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v8 = v21;
    }
    while (v21);
  }

  return v5;
}

+ (id)hk_dictionaryOrNilWithCodableMetadata:()HDCodingSupport
{
  id v4 = a3;
  if ([v4 keyValuePairsCount])
  {
    v5 = objc_msgSend(a1, "hk_dictionaryWithCodableMetadata:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end