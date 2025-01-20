@interface SGPatterns
+ (id)calculateCurrentLanguagesFromPreferredLocaleCodes:(id)a3;
+ (id)calculateLangResolutionOrder;
+ (id)countryCodeFromLanguageCode:(id)a3;
+ (id)fallbackLanguageCodeForCountryCode:(id)a3;
+ (id)languagePartOfLanguageCode:(id)a3;
+ (id)patternsForClass:(Class)a3;
+ (id)patternsForIdentifier:(id)a3;
+ (void)_reinstateDeath;
+ (void)changeLanguageOrPatternData;
+ (void)clearAllRegexCaches;
+ (void)forceLanguagesTo:(id)a3;
+ (void)initialize;
+ (void)pauseCacheEvictionTemporarily;
+ (void)setPatternsDictForTesting:(id)a3;
+ (void)useAllLanguagesAtOnce:(BOOL)a3;
- (SGPatterns)init;
- (id)rawValueForKey:(id)a3;
- (id)rawValueOrDataForKey:(id)a3;
- (id)rawValuesForKey:(id)a3;
- (id)regex2ForKey:(id)a3;
- (id)stringSetMatcherForKey:(id)a3;
- (void)_becomeImmuneToDeath;
- (void)_clearRegexCache;
- (void)dealloc;
- (void)resetIfNeeded;
@end

@implementation SGPatterns

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexpKeysSeen, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_compiledRegexes2, 0);
  objc_storeStrong((id *)&self->_langResolutionOrder, 0);
  objc_storeStrong((id *)&self->_classKey, 0);
}

- (void)_becomeImmuneToDeath
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__SGPatterns__becomeImmuneToDeath__block_invoke;
  v2[3] = &unk_1E65B7678;
  v2[4] = self;
  [(id)globalPatternsData runWithLockAcquired:v2];
}

void __34__SGPatterns__becomeImmuneToDeath__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        if (v9) {
          [v3[7] addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_clearRegexCache
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __30__SGPatterns__clearRegexCache__block_invoke;
  v2[3] = &unk_1E65B7678;
  v2[4] = self;
  [(id)globalPatternsData runWithLockAcquired:v2];
}

uint64_t __30__SGPatterns__clearRegexCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (id)regex2ForKey:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__10159;
  v73 = __Block_byref_object_dispose__10160;
  id v74 = 0;
  uint64_t v63 = 0;
  v64 = (id *)&v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__10159;
  v67 = __Block_byref_object_dispose__10160;
  id v68 = 0;
  uint64_t v6 = (void *)globalPatternsData;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __27__SGPatterns_regex2ForKey___block_invoke;
  v58[3] = &unk_1E65B7738;
  v35 = self;
  v58[4] = self;
  v61 = &v63;
  id v43 = v4;
  id v59 = v43;
  v62 = &v69;
  id v36 = v5;
  id v60 = v36;
  [v6 runWithLockAcquired:v58];
  id v7 = v64[5];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    id obj = v36;
    uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v76 count:16];
    if (v9)
    {
      uint64_t v40 = *(void *)v55;
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v41 = v9;
        do
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v10;
          long long v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
          v44 = (void *)MEMORY[0x1CB79B230]();
          v46 = [v11 objectForKey:v43];
          if (v46)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              context = (void *)MEMORY[0x1CB79B230]();
              if (([v43 hasSuffix:@"/F"] & 1) == 0)
              {
                v28 = [MEMORY[0x1E4F28B00] currentHandler];
                [v28 handleFailureInMethod:a2, v35, @"SGPatterns.m", 376, @"Non-prefiltered regexp was array: %@", v43 object file lineNumber description];
              }
              long long v12 = [v43 stringByAppendingString:@".filt"];
              long long v13 = [v11 objectForKeyedSubscript:v12];
              v42 = dereferenceData(v13, 1);

              if (!v42)
              {
                v29 = [MEMORY[0x1E4F28B00] currentHandler];
                [v29 handleFailureInMethod:a2, v35, @"SGPatterns.m", 378, @"Data not found for prefiltered regexp: %@", v43 object file lineNumber description];
              }
              v39 = [[SGRe2PrefilterTree alloc] initWithData:v42];
              id v14 = v46;
              uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              id v16 = v14;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v75 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v51;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v51 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    v20 = dereferenceData(*(void **)(*((void *)&v50 + 1) + 8 * i), 0);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v21 = +[SGRe2 re2WithRegexpLazy:v20];
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_41;
                      }
                      uint64_t v21 = +[SGRe2 re2WithRegexpDataLazy:v20];
                    }
                    v22 = (void *)v21;
                    [v15 addObject:v21];
                  }
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v75 count:16];
                }
                while (v17);
              }

              v23 = (void *)v70[5];
              v24 = +[SGRe2 re2WithSubregexps:v15 prefilter:v39];
              [v23 addObject:v24];
            }
            else
            {
              v25 = dereferenceData(v46, 0);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v26 = +[SGRe2 re2WithRegexp:v25];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_41:
                  __break(1u);
                  goto LABEL_42;
                }
                uint64_t v26 = +[SGRe2 re2WithRegexpData:v25];
              }
              v27 = (void *)v26;
              [(id)v70[5] addObject:v26];
            }
          }

          uint64_t v10 = v45 + 1;
        }
        while (v45 + 1 != v41);
        uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v76 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (![(id)v70[5] count])
    {
LABEL_42:
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, v35, @"SGPatterns.m", 409, @"Could not find raw asset value for key %@", v43 object file lineNumber description];
    }
    if ([(id)v70[5] count] == 1) {
      [(id)v70[5] objectAtIndexedSubscript:0];
    }
    else {
    v30 = +[SGRe2 re2WithSubregexps:v70[5]];
    }
    objc_storeStrong(v64 + 5, v30);

    v31 = (void *)globalPatternsData;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __27__SGPatterns_regex2ForKey___block_invoke_2;
    v47[3] = &unk_1E65B7710;
    v47[4] = v35;
    v49 = &v63;
    id v48 = v43;
    [v31 runWithLockAcquired:v47];
    id v8 = v64[5];
  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  return v8;
}

void __27__SGPatterns_regex2ForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  [*(id *)(a1 + 32) resetIfNeeded];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(v3[1], "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v14), (void)v17);
          id v16 = [v15 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 8)];

          if (v16) {
            [*(id *)(a1 + 48) addObject:v16];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

uint64_t __27__SGPatterns_regex2ForKey___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

- (id)stringSetMatcherForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SGAhoCorasick alloc];
  uint64_t v6 = [(SGPatterns *)self rawValueForKey:v4];

  uint64_t v7 = dereferenceData(v6, 1);
  uint64_t v8 = [(SGAhoCorasick *)v5 initWithBytecode:v7];

  return v8;
}

- (id)rawValueOrDataForKey:(id)a3
{
  v3 = [(SGPatterns *)self rawValueForKey:a3];
  id v4 = dereferenceData(v3, 1);

  return v4;
}

- (id)rawValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10159;
  id v16 = __Block_byref_object_dispose__10160;
  id v17 = 0;
  [(SGPatterns *)self resetIfNeeded];
  uint64_t v5 = (void *)globalPatternsData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__SGPatterns_rawValueForKey___block_invoke;
  v9[3] = &unk_1E65B7710;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __29__SGPatterns_rawValueForKey___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1[4] + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(v3[1], "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        id v10 = [v9 objectForKeyedSubscript:*(void *)(a1[4] + 8)];

        if (v10)
        {
          uint64_t v11 = [v10 objectForKeyedSubscript:a1[5]];
          uint64_t v12 = *(void *)(a1[6] + 8);
          uint64_t v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          if (*(void *)(*(void *)(a1[6] + 8) + 40))
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)rawValuesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__10159;
  long long v16 = __Block_byref_object_dispose__10160;
  id v17 = 0;
  [(SGPatterns *)self resetIfNeeded];
  uint64_t v5 = (void *)globalPatternsData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__SGPatterns_rawValuesForKey___block_invoke;
  v9[3] = &unk_1E65B7710;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __30__SGPatterns_rawValuesForKey___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(*(id *)(a1[4] + 16), "count"));
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1[4] + 16);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v3[1], "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
        uint64_t v13 = [v12 objectForKeyedSubscript:*(void *)(a1[4] + 8)];

        if (v13)
        {
          uint64_t v14 = [v13 objectForKeyedSubscript:a1[5]];
          if (v14) {
            [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v14];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)resetIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __27__SGPatterns_resetIfNeeded__block_invoke;
  v2[3] = &unk_1E65B7678;
  v2[4] = self;
  [(id)globalPatternsData runWithLockAcquired:v2];
}

void __27__SGPatterns_resetIfNeeded__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = a2[6];
  if (*(_DWORD *)(v2 + 48) != v3)
  {
    *(_DWORD *)(v2 + 48) = v3;
    uint64_t v8 = a2;
    uint64_t v5 = +[SGPatterns calculateLangResolutionOrder];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  }
}

- (void)dealloc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__SGPatterns_dealloc__block_invoke;
  v4[3] = &unk_1E65B7678;
  v4[4] = self;
  [(id)globalPatternsData runWithLockAcquired:v4];
  v3.receiver = self;
  v3.super_class = (Class)SGPatterns;
  [(SGPatterns *)&v3 dealloc];
}

void __21__SGPatterns_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (SGPatterns)init
{
  v11.receiver = self;
  v11.super_class = (Class)SGPatterns;
  uint64_t v2 = [(SGPatterns *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    compiledRegexes2 = v2->_compiledRegexes2;
    v2->_compiledRegexes2 = (NSCache *)v3;

    uint64_t v5 = objc_opt_new();
    regexpKeysSeen = v2->_regexpKeysSeen;
    v2->_regexpKeysSeen = (NSMutableSet *)v5;

    id v7 = (void *)globalPatternsData;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __18__SGPatterns_init__block_invoke;
    v9[3] = &unk_1E65B7678;
    uint64_t v10 = v2;
    [v7 runWithLockAcquired:v9];
  }
  return v2;
}

uint64_t __18__SGPatterns_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 40) addObject:*(void *)(a1 + 32)];
}

+ (id)fallbackLanguageCodeForCountryCode:(id)a3
{
  return (id)[&unk_1F2537688 objectForKeyedSubscript:a3];
}

+ (id)countryCodeFromLanguageCode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v3];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

  return v6;
}

+ (id)languagePartOfLanguageCode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v3];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  return v6;
}

+ (void)pauseCacheEvictionTemporarily
{
  [(id)globalPatternsData runWithLockAcquired:&__block_literal_global_117];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_118;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_118(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_2;
  v2[3] = &__block_descriptor_40_e29_v16__0__SGPatternGlobalData_8l;
  v2[4] = *(void *)(a1 + 32);
  return [(id)globalPatternsData runWithLockAcquired:v2];
}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke__pasOnceToken7 != -1) {
    dispatch_once(&_block_invoke__pasOnceToken7, block);
  }
  uint64_t v1 = (id)_block_invoke__pasExprOnceResult;
  dispatch_suspend(v1);
  dispatch_time_t v2 = dispatch_time(0, 50000000000);
  dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C800uLL);
  dispatch_resume(v1);
}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGPatterns-deathTimer" qosClass:17];
  uint64_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_4;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  uint64_t v5 = (void *)_block_invoke__pasExprOnceResult;
  _block_invoke__pasExprOnceResult = (uint64_t)v4;
}

uint64_t __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reinstateDeath];
}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "_becomeImmuneToDeath", (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [v2[7] count];
    *(_DWORD *)buf = 67109120;
    int v15 = v9;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "Pausing death for %i objects", buf, 8u);
  }
}

+ (void)_reinstateDeath
{
}

void __29__SGPatterns__reinstateDeath__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = a2;
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = [v2[7] count];
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "Reinstating death for %i objects", (uint8_t *)v5, 8u);
  }

  [v2[7] removeAllObjects];
}

+ (void)clearAllRegexCaches
{
}

void __33__SGPatterns_clearAllRegexCaches__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a2 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_clearRegexCache", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)useAllLanguagesAtOnce:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__SGPatterns_useAllLanguagesAtOnce___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__SGPatternGlobalData_8l;
  BOOL v4 = a3;
  [(id)globalPatternsData runWithLockAcquired:v3];
}

uint64_t __36__SGPatterns_useAllLanguagesAtOnce___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 48) = *(unsigned char *)(result + 32);
  return result;
}

+ (id)calculateLangResolutionOrder
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  long long v8 = __Block_byref_object_copy__10159;
  long long v9 = __Block_byref_object_dispose__10160;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SGPatterns_calculateLangResolutionOrder__block_invoke;
  v4[3] = &unk_1E65B76C8;
  v4[4] = &v5;
  [(id)globalPatternsData runWithLockAcquired:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__SGPatterns_calculateLangResolutionOrder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*((unsigned char *)v3 + 48))
  {
    BOOL v4 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithObjects:", @"nolang", @"base", @"eu-me", @"w-europe", @"e-europe", @"asia", @"middleeast", 0);
    uint64_t v6 = (void *)*((void *)v3 + 1);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __42__SGPatterns_calculateLangResolutionOrder__block_invoke_2;
    v28[3] = &unk_1E65B76A0;
    id v29 = v5;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v28];
    uint64_t v8 = [v7 array];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v22 = a1;
    long long v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = *((id *)v3 + 4);
    uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          if (v17)
          {
            do
            {
              if (([v12 containsObject:v17] & 1) == 0)
              {
                [v11 addObject:v17];
                [v12 addObject:v17];
              }
              long long v18 = [*((id *)v3 + 1) objectForKeyedSubscript:v17];
              uint64_t v19 = [v18 objectForKeyedSubscript:@".."];

              id v17 = (id)v19;
            }
            while (v19);
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v20 = *(void *)(*(void *)(v22 + 32) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v11;
  }
}

void __42__SGPatterns_calculateLangResolutionOrder__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@".."];
  if (v6)
  {
    id v7 = (void *)v6;
    unint64_t v8 = [v5 count];

    if (v8 >= 2) {
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
}

+ (void)setPatternsDictForTesting:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)globalPatternsData;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SGPatterns_setPatternsDictForTesting___block_invoke;
  v6[3] = &unk_1E65B7678;
  id v7 = v3;
  id v5 = v3;
  [v4 runWithLockAcquired:v6];
}

void __40__SGPatterns_setPatternsDictForTesting___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)patternsForClass:(Class)a3
{
  BOOL v4 = [NSString stringWithUTF8String:class_getName(a3)];
  id v5 = [a1 patternsForIdentifier:v4];

  return v5;
}

+ (id)patternsForIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  id v5 = (void *)v4[1];
  v4[1] = v3;

  [v4 resetIfNeeded];
  return v4;
}

+ (void)forceLanguagesTo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)globalPatternsData;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__SGPatterns_forceLanguagesTo___block_invoke;
  v8[3] = &unk_1E65B7650;
  SEL v10 = a2;
  id v11 = a1;
  id v9 = v5;
  id v7 = v5;
  [v6 runWithLockAcquired:v8];
}

void __31__SGPatterns_forceLanguagesTo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*((void *)v3 + 1))
  {
    BOOL v4 = +[SGAsset asset];
    id v5 = [v4 filesystemPathForAssetDataRelativePath:@"CompiledPatterns.plist"];

    if (!v5)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"SGPatterns.m" lineNumber:170 description:@"filesystemPathForAssetDataRelativePath returned nil"];
    }
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v27 = v5;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "Loading pattern data from path \"%@\"", buf, 0xCu);
    }

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v5];
    unint64_t v8 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v7;

    if (!*((void *)v3 + 1))
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"SGPatterns.m" lineNumber:173 description:@"Could not load pattern data"];
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) copy];
  SEL v10 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v9;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = *((id *)v3 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = [*((id *)v3 + 1) objectForKeyedSubscript:v16];

        if (!v17)
        {
          long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 48), @"SGPatterns.m", 177, @"Language not found: %@", v16 object file lineNumber description];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  ++*((_DWORD *)v3 + 6);
}

+ (id)calculateCurrentLanguagesFromPreferredLocaleCodes:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  id v5 = (void *)globalPatternsData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SGPatterns_calculateCurrentLanguagesFromPreferredLocaleCodes___block_invoke;
  v11[3] = &unk_1E65B7628;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 runWithLockAcquired:v11];
  unint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __64__SGPatterns_calculateCurrentLanguagesFromPreferredLocaleCodes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v22 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v22) {
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)v24;
  id v6 = off_1E65B4000;
  id v19 = v4;
  uint64_t v20 = a1;
  long long v21 = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v24 != v5) {
        objc_enumerationMutation(v4);
      }
      unint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v9 = (void *)MEMORY[0x1CB79B230]();
      SEL v10 = [v8 lowercaseString];
      id v11 = [v3[1] objectForKeyedSubscript:v10];

      if (v11)
      {
        id v12 = v10;
        if (!v12) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v13 = v5;
        uint64_t v14 = [(__objc2_class *)v6[204] languagePartOfLanguageCode:v8];
        uint64_t v15 = [v14 lowercaseString];

        uint64_t v16 = [v3[1] objectForKeyedSubscript:v15];

        if (v16)
        {
          id v12 = v15;
        }
        else
        {
          id v17 = [(__objc2_class *)v6[204] countryCodeFromLanguageCode:v8];
          long long v18 = [(__objc2_class *)v6[204] fallbackLanguageCodeForCountryCode:v17];
          if (v18)
          {
            id v12 = [v21[1] objectForKeyedSubscript:v18];

            if (v12) {
              id v12 = v18;
            }
          }
          else
          {
            id v12 = 0;
          }

          id v4 = v19;
        }

        uint64_t v5 = v13;
        a1 = v20;
        id v3 = v21;
        id v6 = off_1E65B4000;
        if (!v12) {
          goto LABEL_18;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12, v19);
      if ([*(id *)(a1 + 40) count] == 5)
      {

        goto LABEL_22;
      }
LABEL_18:
    }
    uint64_t v22 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_22:

  if (![*(id *)(a1 + 40) count]) {
    [*(id *)(a1 + 40) addObject:@"en"];
  }
}

+ (void)changeLanguageOrPatternData
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__SGPatterns_changeLanguageOrPatternData__block_invoke;
  v2[3] = &__block_descriptor_48_e29_v16__0__SGPatternGlobalData_8l;
  v2[4] = a2;
  void v2[5] = a1;
  [(id)globalPatternsData runWithLockAcquired:v2];
}

void __41__SGPatterns_changeLanguageOrPatternData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = +[SGAsset asset];
  id v6 = [v5 filesystemPathsForAssetDataRelativePaths:&unk_1F2536878];

  id v7 = [v6 objectForKeyedSubscript:@"CompiledPatterns.plist"];
  unint64_t v8 = sgLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  SEL v10 = @"(nil path)";
  if (v9)
  {
    if (v7) {
      SEL v10 = v7;
    }
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "Loading pattern plist, path: %@", buf, 0xCu);
  }

  id v32 = 0;
  id v11 = [MEMORY[0x1E4F93B58] dictionaryWithPath:v7 error:&v32];
  id v12 = v32;
  if (!v11)
  {
    id v31 = v12;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:1 error:&v31];
    id v14 = v31;

    if (v13)
    {
      id v30 = 0;
      id v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:&v30];
      id v12 = v30;

      id v14 = v12;
      if (v11) {
        goto LABEL_11;
      }
    }
    else
    {
      id v12 = v14;
    }
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGPatterns.m", 101, @"Could not read pattern plist from %@: %@", v7, v14 object file lineNumber description];

    id v11 = 0;
  }
LABEL_11:
  objc_storeStrong(v3 + 1, v11);
  uint64_t v16 = [v3[1] objectForKeyedSubscript:@"nolang"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    id v29 = [v3[1] allKeys];
    [v26 handleFailureInMethod:v28, v27, @"SGPatterns.m", 103, @"Invalid pattern plist: no nolang locale found! Keys: %@", v29 object file lineNumber description];
  }
  long long v18 = [v6 objectForKeyedSubscript:@"CompiledPatterns.pldat"];
  id v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = @"(nil path)";
    if (v18) {
      uint64_t v20 = v18;
    }
    *(_DWORD *)buf = 138412290;
    v34 = v20;
    _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "Loading pattern pldat, path: %@", buf, 0xCu);
  }

  long long v21 = [[SGPatternDataFile alloc] initWithPath:v18];
  id v22 = v3[2];
  v3[2] = v21;

  long long v23 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v24 = +[SGPatterns calculateCurrentLanguagesFromPreferredLocaleCodes:v23];
  id v25 = v3[4];
  void v3[4] = (id)v24;

  ++*((_DWORD *)v3 + 6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = objc_opt_new();
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    uint64_t v5 = (void *)globalPatternsData;
    globalPatternsData = v4;

    id v6 = +[SGAsset asset];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __24__SGPatterns_initialize__block_invoke;
    v8[3] = &__block_descriptor_40_e20_v16__0___PASAsset2_8l;
    void v8[4] = a1;
    id v7 = (id)[v6 registerUpdateHandler:v8];

    [a1 changeLanguageOrPatternData];
    [(id)globalPatternsData runWithLockAcquired:&__block_literal_global_11152];
  }
}

uint64_t __24__SGPatterns_initialize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeLanguageOrPatternData];
}

void __24__SGPatterns_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28D30];
  id v3 = a2;
  uint64_t v4 = [v2 weakObjectsHashTable];
  uint64_t v5 = (void *)v3[5];
  v3[5] = v4;

  uint64_t v6 = objc_opt_new();
  id v7 = (id)v3[7];
  v3[7] = v6;
}

@end