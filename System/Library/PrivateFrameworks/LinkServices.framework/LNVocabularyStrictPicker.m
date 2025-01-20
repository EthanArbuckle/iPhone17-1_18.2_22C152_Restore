@interface LNVocabularyStrictPicker
- (id)pickTermsFromCorpora:(id)a3;
@end

@implementation LNVocabularyStrictPicker

- (id)pickTermsFromCorpora:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      if (v8 == 1000) {
        break;
      }
      uint64_t v11 = 1000 - v8;
      v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "getTerms", (void)v15);
      if (1000 - v8 < (unint64_t)[v12 count] || (uint64_t v11 = objc_msgSend(v12, "count")) != 0)
      {
        v13 = objc_msgSend(v12, "subarrayWithRange:", 0, v11);
        [v4 addObjectsFromArray:v13];
        v8 += v11;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

@end