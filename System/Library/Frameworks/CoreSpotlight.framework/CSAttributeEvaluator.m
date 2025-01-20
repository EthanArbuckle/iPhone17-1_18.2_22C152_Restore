@interface CSAttributeEvaluator
+ (void)enumerateTokensForString:(id)a3 locale:(id)a4 options:(unint64_t)a5 withHandler:(id)a6;
- (BOOL)fuzzyMatching;
- (BOOL)isCJK;
- (BOOL)matchOncePerTerm;
- (BOOL)processPropertyToken:(const unsigned __int16 *)a3 length:(int64_t)a4 tokenType:(int)a5 range:(id)a6 index:(int64_t)a7 evaluationHandler:(id)a8;
- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 fuzzyThreshold:(unsigned __int8)a5 options:(unint64_t)a6;
- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 isCJK:(BOOL)a5 fuzzyThreshold:(unsigned __int8)a6 options:(unint64_t)a7;
- (NSArray)itemQPQUOutputTokenInfo;
- (NSArray)queryTerms;
- (NSArray)tokenizedQueryTerms;
- (NSString)language;
- (NSString)queryString;
- (const)matchers;
- (int64_t)countQPUSpecialToken;
- (int64_t)queryID;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withFuzzyHandler:(id)a6;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withHandler:(id)a6;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withFuzzyHandler:(id)a7;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withHandler:(id)a7;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 withHandler:(id)a6;
- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 withHandler:(id)a5;
- (unint64_t)matcherCount;
- (unint64_t)matchersPerTerm;
- (unint64_t)options;
- (unint64_t)queryTermCount;
- (void)dealloc;
- (void)processTranscriptionTokens:(CSAttributeEvaluatorContext *)a3;
- (void)setCountQPUSpecialToken:(int64_t)a3;
- (void)setFuzzyMatching:(BOOL)a3;
- (void)setIsCJK:(BOOL)a3;
- (void)setItemQPQUOutputTokenInfo:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMatchOncePerTerm:(BOOL)a3;
- (void)setMatcherCount:(unint64_t)a3;
- (void)setMatchers:(const void *)a3;
- (void)setMatchersPerTerm:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setQueryID:(int64_t)a3;
- (void)setQueryTermCount:(unint64_t)a3;
- (void)setTokenizedQueryTerms:(id)a3;
- (void)setTokenizer:(void *)a3;
- (void)tokenizer;
@end

@implementation CSAttributeEvaluator

+ (void)enumerateTokensForString:(id)a3 locale:(id)a4 options:(unint64_t)a5 withHandler:(id)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a6;
  if (enumerateTokensForString_locale_options_withHandler__onceToken != -1) {
    dispatch_once(&enumerateTokensForString_locale_options_withHandler__onceToken, &__block_literal_global_17);
  }
  id v10 = (id)enumerateTokensForString_locale_options_withHandler__sContext;
  objc_sync_enter(v10);
  [(id)enumerateTokensForString_locale_options_withHandler__sContext setHandler:v9];
  MDTokenizerGetTokenRanges();
  objc_sync_exit(v10);
}

uint64_t __76__CSAttributeEvaluator_enumerateTokensForString_locale_options_withHandler___block_invoke()
{
  enumerateTokensForString_locale_options_withHandler__sTokenizer = MDTokenizerCreate();
  enumerateTokensForString_locale_options_withHandler__sContext = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 isCJK:(BOOL)a5 fuzzyThreshold:(unsigned __int8)a6 options:(unint64_t)a7
{
  self->_isCJK = a5;
  return [(CSAttributeEvaluator *)self initWithQuery:a3 language:a4 fuzzyThreshold:a6 options:a7];
}

- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 fuzzyThreshold:(unsigned __int8)a5 options:(unint64_t)a6
{
  int v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (v11)
  {
    v51.receiver = self;
    v51.super_class = (Class)CSAttributeEvaluator;
    v13 = [(CSAttributeEvaluator *)&v51 init];
    v14 = v13;
    if (v13)
    {
      v13->_options = a6;
      objc_storeStrong((id *)&v13->_language, a4);
      objc_storeStrong((id *)&v14->_queryString, a3);
      if ([(NSString *)v14->_queryString length])
      {
        v14->_tokenizer = (void *)MDTokenizerCreate();
        v15 = objc_opt_new();
        MDTokenizerGetTokens();
        uint64_t v16 = [v15 count];
        v14->_queryTermCount = v16;
        if (v16)
        {
          uint64_t v17 = [v15 copy];
          tokenizedQueryTerms = v14->_tokenizedQueryTerms;
          v14->_tokenizedQueryTerms = (NSArray *)v17;

          if ((v7 - 100) >= 0xFFFFFF9D) {
            int v19 = v7;
          }
          else {
            int v19 = 0;
          }
          uint64_t v20 = [(NSArray *)v14->_tokenizedQueryTerms count];
          uint64_t v21 = 4;
          if (!v19) {
            uint64_t v21 = 2;
          }
          unint64_t v39 = v21;
          unint64_t v40 = v20;
          char v22 = 1;
          if (v19) {
            char v22 = 2;
          }
          unint64_t v38 = v20 << v22;
          v14->_matchers = (const void **)malloc_type_calloc(v20 << v22, 8uLL, 0xC0040B8AA526DuLL);
          [v12 UTF8String];
          int v42 = v7;
          v41 = v15;
          if (v19)
          {
            id v37 = v12;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            v23 = v14->_tokenizedQueryTerms;
            uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v47 objects:v53 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = 0;
              uint64_t v27 = *(void *)v48;
              do
              {
                uint64_t v28 = 0;
                uint64_t v29 = v26;
                do
                {
                  if (*(void *)v48 != v27) {
                    objc_enumerationMutation(v23);
                  }
                  [*(id *)(*((void *)&v47 + 1) + 8 * v28) UTF8String];
                  v14->_matchers[v29] = (const void *)MDMatcherCreate();
                  uint64_t v26 = v29 + 2;
                  v14->_matchers[v29 + 1] = (const void *)MDMatcherCreate();
                  ++v28;
                  v29 += 2;
                }
                while (v25 != v28);
                uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v47 objects:v53 count:16];
              }
              while (v25);
            }
            else
            {
              uint64_t v26 = 0;
            }

            id v12 = v37;
          }
          else
          {
            uint64_t v26 = 0;
          }
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v30 = v14->_tokenizedQueryTerms;
          uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v44;
            do
            {
              uint64_t v34 = 0;
              uint64_t v35 = v26;
              do
              {
                if (*(void *)v44 != v33) {
                  objc_enumerationMutation(v30);
                }
                [*(id *)(*((void *)&v43 + 1) + 8 * v34) UTF8String];
                v14->_matchers[v35] = (const void *)MDMatcherCreate();
                uint64_t v26 = v35 + 2;
                v14->_matchers[v35 + 1] = (const void *)MDMatcherCreate();
                ++v34;
                v35 += 2;
              }
              while (v32 != v34);
              uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v32);
          }

          v14->_matcherCount = v38;
          v15 = v41;
          v14->_queryTermCount = v40;
          v14->_matchersPerTerm = v39;
          int v7 = v42;
        }
        v14->_fuzzyMatching = v7 != 0;
        v14->_matchOncePerTerm = 1;
        v14->_countQPUSpecialToken = 0;
      }
      if (!v14->_tokenizedQueryTerms)
      {
        v14->_tokenizedQueryTerms = (NSArray *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  if (self->_tokenizer) {
    MDTokenizerDispose();
  }
  matchers = self->_matchers;
  if (matchers)
  {
    unint64_t matcherCount = self->_matcherCount;
    if (matcherCount)
    {
      for (unint64_t i = 0; i < matcherCount; ++i)
      {
        if (self->_matchers[i])
        {
          MDMatcherDispose();
          unint64_t matcherCount = self->_matcherCount;
        }
      }
      matchers = self->_matchers;
    }
  }
  free(matchers);
  v6.receiver = self;
  v6.super_class = (Class)CSAttributeEvaluator;
  [(CSAttributeEvaluator *)&v6 dealloc];
}

- (void)processTranscriptionTokens:(CSAttributeEvaluatorContext *)a3
{
  if (self->_fuzzyMatching) {
    unint64_t v3 = 2 * self->_queryTermCount;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t matcherCount = self->_matcherCount;
  if (v3 < matcherCount)
  {
    int64_t var9 = a3->var9;
    p_var12 = &a3->var12;
    do
    {
      if (*p_var12) {
        break;
      }
      if (var9 >= 1) {
        MDMatchUTF8();
      }
      ++v3;
    }
    while (v3 != matcherCount);
  }
}

- (BOOL)processPropertyToken:(const unsigned __int16 *)a3 length:(int64_t)a4 tokenType:(int)a5 range:(id)a6 index:(int64_t)a7 evaluationHandler:(id)a8
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  v14 = (void (**)(void, void, void, void, void, void, void, void, void, void, _DWORD, void))v13;
  unint64_t queryTermCount = self->_queryTermCount;
  unint64_t matchersPerTerm = self->_matchersPerTerm;
  unint64_t options = self->_options;
  unint64_t matcherCount = self->_matcherCount;
  BOOL matchOncePerTerm = self->_matchOncePerTerm;
  BOOL fuzzyMatching = self->_fuzzyMatching;
  unsigned __int8 v41 = 0;
  if (!matcherCount)
  {
    int v28 = 0;
    goto LABEL_25;
  }
  unint64_t v19 = 0;
  unint64_t v37 = queryTermCount;
  int v32 = a5;
  BOOL v34 = a5 != 0;
  unint64_t v35 = matchersPerTerm * queryTermCount + 2;
  uint64_t v33 = (void (**)(void, void, void, void, void, void, void, void, void, void, _DWORD, void))v13;
  unint64_t v36 = options;
  do
  {
    if (options == 1)
    {
      *(void *)buf = 0;
      if ((MDMatchWithFuzzyIndiciesRange() & 1) == 0) {
        goto LABEL_22;
      }
    }
    else if (!MDMatchWithFuzzyIndicies())
    {
      goto LABEL_22;
    }
    unint64_t v20 = matcherCount;
    uint64_t v21 = 5;
    if ((v19 & 1) == 0) {
      uint64_t v21 = 7;
    }
    uint64_t v22 = 3;
    if ((v19 & 1) == 0) {
      uint64_t v22 = 1;
    }
    if (v19 >= v35 || !fuzzyMatching) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v21;
    }
    unint64_t v25 = matchersPerTerm;
    unint64_t v26 = v19 / matchersPerTerm;
    if (v26 >= v37)
    {
      uint64_t v27 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134220032;
        *(void *)&buf[4] = v19;
        __int16 v43 = 2048;
        unint64_t v44 = v25;
        __int16 v45 = 2048;
        unint64_t v46 = v37;
        __int16 v47 = 2048;
        unint64_t v48 = v20;
        __int16 v49 = 2048;
        int64_t v50 = a4;
        __int16 v51 = 1024;
        int v52 = v32;
        __int16 v53 = 2048;
        int64_t v54 = var0;
        __int16 v55 = 2048;
        int64_t v56 = var1;
        __int16 v57 = 2048;
        int64_t v58 = a7;
        _os_log_fault_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_FAULT, "i/matchersPerTerm >= queryTermCount, i = %lu, matchersPerTerm = %lu, queryTermCount = %lu, unint64_t matcherCount = %lu, len = %ld, tokenType = %u, rangeInSource.location = %lu, rangeInSource.length = %lu, tokenIndex = %ld", buf, 0x58u);
      }

      v14 = v33;
    }
    LOBYTE(v31) = 0;
    ((void (**)(void, uint64_t, int64_t, int64_t, BOOL, unint64_t, int64_t, void, void, void, int, unsigned __int8 *))v14)[2](v14, v24, var0, var1, v34, v26, a7, 0, 0, 0, v31, &v41);
    int v28 = v41;
    unint64_t matchersPerTerm = v25;
    unint64_t matcherCount = v20;
    unint64_t options = v36;
    if (v41 | matchOncePerTerm) {
      goto LABEL_25;
    }
LABEL_22:
    ++v19;
  }
  while (matcherCount != v19);
  int v28 = v41;
LABEL_25:
  BOOL v29 = v28 != 0;

  return v29;
}

- (NSArray)queryTerms
{
  return self->_tokenizedQueryTerms;
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 withHandler:(id)a5
{
  return [(CSAttributeEvaluator *)self evaluateAttribute:a3 ignoreSubtokens:a4 strongCompounds:0 withHandler:a5];
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withHandler:(id)a6
{
  return [(CSAttributeEvaluator *)self evaluateAttribute:a3 ignoreSubtokens:a4 strongCompounds:0 skipTranscriptions:a5 withHandler:a6];
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withFuzzyHandler:(id)a6
{
  return [(CSAttributeEvaluator *)self evaluateAttribute:a3 ignoreSubtokens:a4 strongCompounds:0 skipTranscriptions:a5 withFuzzyHandler:a6];
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 withHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_withHandler___block_invoke;
  aBlock[3] = &unk_1E554A350;
  id v17 = v10;
  id v11 = v10;
  id v12 = a3;
  id v13 = _Block_copy(aBlock);
  unint64_t v14 = [(CSAttributeEvaluator *)self evaluateAttribute:v12 ignoreSubtokens:v7 strongCompounds:v6 skipTranscriptions:0 withFuzzyHandler:v13];

  return v14;
}

uint64_t __86__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_skipTranscriptions_withHandler___block_invoke;
  aBlock[3] = &unk_1E554A350;
  id v19 = v12;
  id v13 = v12;
  id v14 = a3;
  v15 = _Block_copy(aBlock);
  unint64_t v16 = [(CSAttributeEvaluator *)self evaluateAttribute:v14 ignoreSubtokens:v9 strongCompounds:v8 skipTranscriptions:v7 withFuzzyHandler:v15];

  return v16;
}

uint64_t __105__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_skipTranscriptions_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withFuzzyHandler:(id)a7
{
  BOOL v9 = a5;
  int v10 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  if (self->_tokenizer)
  {
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    if (v9) {
      v10 |= 2u;
    }
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v31 = 0uLL;
    id v14 = self;
    BOOL v29 = v14;
    id v30 = _Block_copy(v13);
    LOBYTE(v36) = 0;
    if (a6)
    {
      MDTokenizerGetTokenRangesWithTranscriptionOptional();
    }
    else
    {
      int v28 = v10;
      uint64_t v16 = [v12 length];
      uint64_t v25 = (uint64_t)&v25;
      if (v16 >= 256) {
        uint64_t v17 = 256;
      }
      else {
        uint64_t v17 = v16;
      }
      if (v16 >= 1024) {
        uint64_t v18 = 1024;
      }
      else {
        uint64_t v18 = v16;
      }
      uint64_t v19 = 5 * v18;
      if (v16 <= 1024) {
        uint64_t v20 = 1024;
      }
      else {
        uint64_t v20 = v16;
      }
      uint64_t v21 = 126;
      if (v19 > 126) {
        uint64_t v21 = v19;
      }
      uint64_t v26 = v21 + 1;
      uint64_t v27 = v20;
      uint64_t v22 = (char *)&v25 - ((v21 + 17) & 0xFFFFFFFFFFFFFFF0);
      bzero(v22, v21 + 2);
      v23 = (char *)&v25 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v23, 8 * v17);
      bzero(v23, 8 * v17);
      bzero((char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v17);
      *(void *)&long long v31 = v22;
      *((void *)&v31 + 1) = v23;
      *(void *)&long long v32 = v23;
      *((void *)&v32 + 1) = (char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(void *)&long long v33 = v26;
      *(void *)&long long v34 = v17;
      *(void *)&long long v35 = v27;
      MDTokenizerGetTokenRangesWithTranscriptionOptional();
      if (*((void *)&v34 + 1)) {
        -[CSAttributeEvaluator processTranscriptionTokens:](v14, "processTranscriptionTokens:", &v29, v25);
      }
      if (*((char **)&v31 + 1) != v23) {
        free(*((void **)&v31 + 1));
      }
      if ((char *)v32 != v23) {
        free((void *)v32);
      }
      if (*((uint64_t **)&v32 + 1) != (uint64_t *)((char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0))) {
        free(*((void **)&v32 + 1));
      }
    }
    unint64_t v15 = *((void *)&v35 + 1);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (BOOL)matchOncePerTerm
{
  return self->_matchOncePerTerm;
}

- (void)setMatchOncePerTerm:(BOOL)a3
{
  self->_BOOL matchOncePerTerm = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_isCJK = a3;
}

- (int64_t)countQPUSpecialToken
{
  return self->_countQPUSpecialToken;
}

- (void)setCountQPUSpecialToken:(int64_t)a3
{
  self->_countQPUSpecialToken = a3;
}

- (NSArray)itemQPQUOutputTokenInfo
{
  return self->_itemQPQUOutputTokenInfo;
}

- (void)setItemQPQUOutputTokenInfo:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (BOOL)fuzzyMatching
{
  return self->_fuzzyMatching;
}

- (void)setFuzzyMatching:(BOOL)a3
{
  self->_BOOL fuzzyMatching = a3;
}

- (unint64_t)matcherCount
{
  return self->_matcherCount;
}

- (void)setMatcherCount:(unint64_t)a3
{
  self->_unint64_t matcherCount = a3;
}

- (const)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(const void *)a3
{
  self->_matchers = a3;
}

- (unint64_t)queryTermCount
{
  return self->_queryTermCount;
}

- (void)setQueryTermCount:(unint64_t)a3
{
  self->_unint64_t queryTermCount = a3;
}

- (unint64_t)matchersPerTerm
{
  return self->_matchersPerTerm;
}

- (void)setMatchersPerTerm:(unint64_t)a3
{
  self->_unint64_t matchersPerTerm = a3;
}

- (void)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(void *)a3
{
  self->_tokenizer = a3;
}

- (NSArray)tokenizedQueryTerms
{
  return self->_tokenizedQueryTerms;
}

- (void)setTokenizedQueryTerms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizedQueryTerms, 0);
  objc_storeStrong((id *)&self->_itemQPQUOutputTokenInfo, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_queryString, 0);
}

@end