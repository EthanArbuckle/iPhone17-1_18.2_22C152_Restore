@interface _CDStringTokenizer
+ (BOOL)isEnglishStopWord:(id)a3;
+ (id)extractNormalizedKeywords:(id)a3;
@end

@implementation _CDStringTokenizer

+ (BOOL)isEnglishStopWord:(id)a3
{
  uint64_t v3 = isEnglishStopWord__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isEnglishStopWord__onceToken, &__block_literal_global_19);
  }
  v5 = (void *)isEnglishStopWord___stopWordSet;
  v6 = [v4 lowercaseString];

  char v7 = [v5 containsObject:v6];
  return v7;
}

+ (id)extractNormalizedKeywords:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    char v7 = (void *)[v6 mutableCopy];
    v18 = (void *)v5;
    [v7 formUnionWithCharacterSet:v5];
    v8 = [v4 lowercaseString];
    v9 = [v8 componentsSeparatedByCharactersInSet:v7];

    v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((unint64_t)[v16 length] >= 2
            && ([a1 isEnglishStopWord:v16] & 1) == 0)
          {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

@end