@interface CKVocabularySearcher
+ (id)makeSearcher;
+ (id)makeSearcherForUserId:(id)a3;
+ (void)initialize;
- (CKVocabularySearcher)init;
- (CKVocabularySearcher)initWithUserId:(id)a3 spanMatcher:(id)a4 prewarm:(BOOL)a5;
- (id)_convertMatches:(id)a3;
- (id)_convertResults:(id)a3;
- (id)_convertTypes:(id)a3;
- (id)_queryFromTokenChain:(id)a3;
- (id)_searcher;
- (id)matchSpansOfString:(id)a3;
- (id)matchSpansOfUtterance:(id)a3;
- (id)searchCustomVocabulary:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5;
- (id)searchCustomVocabularyWithWildcardPatterns:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5;
@end

@implementation CKVocabularySearcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatcher, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

- (id)_convertMatches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[CKVMatchingSpan matchingSpanFromSpanMatchResult:](CKVMatchingSpan, "matchingSpanFromSpanMatchResult:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_queryFromTokenChain:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    v24 = v3;
    v4 = [v3 tokens];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      uint64_t v6 = (void *)getSEMSpanMatchQueryBuilderClass_softClass;
      uint64_t v35 = getSEMSpanMatchQueryBuilderClass_softClass;
      if (!getSEMSpanMatchQueryBuilderClass_softClass)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __getSEMSpanMatchQueryBuilderClass_block_invoke;
        v31[3] = &unk_1E5CF9F10;
        v31[4] = &v32;
        __getSEMSpanMatchQueryBuilderClass_block_invoke((uint64_t)v31);
        uint64_t v6 = (void *)v33[3];
      }
      uint64_t v7 = v6;
      _Block_object_dispose(&v32, 8);
      id v8 = [v7 alloc];
      v9 = [v24 locale];
      v10 = [v24 normalizedString];
      v26 = (void *)[v8 initWithLocale:v9 originalText:v10];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id obj = [v24 tokens];
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(obj);
            }
            long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            long long v15 = [v14 value];
            v16 = [v14 cleanValue];
            uint64_t v17 = [v14 normalizedValues];
            uint64_t v18 = [v14 beginIndex];
            uint64_t v19 = [v14 endIndex];
            uint64_t v20 = [v14 isSignificant];
            LOBYTE(v23) = [v14 isWhitespace];
            [v26 addTokenWithValue:v15 cleanValue:v16 normalizedValues:v17 beginIndex:v18 endIndex:v19 isSignificant:v20 isWhitespace:v23];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v11);
      }

      v21 = [v26 build];
    }
    else
    {
      v21 = 0;
    }
    id v3 = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_convertResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v10 = [v9 vocabularyType];
        if (v10 == 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 2 * (v10 == 2);
        }
        uint64_t v12 = [CKVCustomTerm alloc];
        long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6 + i + 1);
        long long v14 = [v9 vocabularyString];
        long long v15 = [v9 vocabularyIdentifier];
        v16 = [(CKVCustomTerm *)v12 initWithItemId:v13 vocabularyType:v11 term:v14 vocabularyId:v15];

        uint64_t v17 = [CKVocabularySearchResult alloc];
        uint64_t v18 = [v9 originAppId];
        uint64_t v19 = [(CKVocabularySearchResult *)v17 initWithVocabularyItem:v16 originAppId:v18];

        if (v19) {
          [v22 addObject:v19];
        }
      }
      uint64_t v6 = (v6 + i);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  return v22;
}

- (id)_convertTypes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        unsigned __int16 v11 = objc_msgSend(v10, "integerValue", (void)v18);
        if (CKVCustomTypeIsValid(v11)) {
          unsigned __int16 v12 = v11;
        }
        else {
          unsigned __int16 v12 = 0;
        }
        int v13 = v12;
        if (!CKVCustomTypeIsValid(v12))
        {
          v16 = CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            long long v23 = "-[CKVocabularySearcher _convertTypes:]";
            __int16 v24 = 2112;
            long long v25 = v10;
            _os_log_error_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_ERROR, "%s Invalid vocabulary type: %@", buf, 0x16u);
          }

          id v15 = 0;
          goto LABEL_22;
        }
        if (v13 == 1) {
          break;
        }
        if (v13 == 2)
        {
          long long v14 = &unk_1EFD7D6D0;
LABEL_15:
          [v4 addObject:v14];
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }
      long long v14 = &unk_1EFD7D6B8;
      goto LABEL_15;
    }
LABEL_18:

    id v15 = v4;
LABEL_22:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_searcher
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getSEMAppCustomVocabularySearcherClass_softClass;
  uint64_t v11 = getSEMAppCustomVocabularySearcherClass_softClass;
  if (!getSEMAppCustomVocabularySearcherClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSEMAppCustomVocabularySearcherClass_block_invoke;
    v7[3] = &unk_1E5CF9F10;
    v7[4] = &v8;
    __getSEMAppCustomVocabularySearcherClass_block_invoke((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = (void *)[[v4 alloc] initWithUserId:self->_userId];
  return v5;
}

- (id)matchSpansOfString:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v18 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      long long v19 = v18;
      long long v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      id v22 = (objc_class *)objc_opt_class();
      long long v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v35 = v23;
      _os_log_error_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_ERROR, "%s Input must be nonnull object of class %@ received %@", buf, 0x20u);
    }
    goto LABEL_12;
  }
  if (![v4 length])
  {
    __int16 v24 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      _os_log_debug_impl(&dword_1A77B3000, v24, OS_LOG_TYPE_DEBUG, "%s Returning empty results for zero-length string input", buf, 0xCu);
    }
LABEL_12:
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  userId = self->_userId;
  spanMatcher = self->_spanMatcher;
  id v29 = 0;
  uint64_t v7 = [(SEMSpanMatcher *)spanMatcher indexLocaleWithUserId:userId error:&v29];
  id v8 = v29;
  if (v7)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    uint64_t v9 = (void *)getSEMTokenizerClass_softClass;
    uint64_t v33 = getSEMTokenizerClass_softClass;
    if (!getSEMTokenizerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSEMTokenizerClass_block_invoke;
      uint64_t v35 = &unk_1E5CF9F10;
      v36 = &v30;
      __getSEMTokenizerClass_block_invoke((uint64_t)buf);
      uint64_t v9 = (void *)v31[3];
    }
    uint64_t v10 = v9;
    _Block_object_dispose(&v30, 8);
    uint64_t v11 = (void *)[[v10 alloc] initWithLocale:v7];
    unsigned __int16 v12 = [v11 queryFromText:v4];
    long long v14 = self->_userId;
    int v13 = self->_spanMatcher;
    id v28 = v8;
    id v15 = [(SEMSpanMatcher *)v13 matchSpans:v12 userId:v14 error:&v28];
    id v16 = v28;

    if (v15)
    {
      uint64_t v17 = [(CKVocabularySearcher *)self _convertMatches:v15];
    }
    else
    {
      long long v26 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v35 = v4;
        _os_log_error_impl(&dword_1A77B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed match spans due to error: %@ input: %@", buf, 0x20u);
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    }

    id v8 = v16;
  }
  else
  {
    long long v25 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_error_impl(&dword_1A77B3000, v25, OS_LOG_TYPE_ERROR, "%s Failed to resolve index locale: %@", buf, 0x16u);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_21:
  return v17;
}

- (id)matchSpansOfUtterance:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKVocabularySearcher *)self _queryFromTokenChain:v4];
  if (v5)
  {
    userId = self->_userId;
    spanMatcher = self->_spanMatcher;
    id v14 = 0;
    id v8 = [(SEMSpanMatcher *)spanMatcher matchSpans:v5 userId:userId error:&v14];
    id v9 = v14;
    if (v8)
    {
      uint64_t v10 = [(CKVocabularySearcher *)self _convertMatches:v8];
    }
    else
    {
      unsigned __int16 v12 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v16 = "-[CKVocabularySearcher matchSpansOfUtterance:]";
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed match spans due to error: %@ input: %@", buf, 0x20u);
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v11 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[CKVocabularySearcher matchSpansOfUtterance:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_ERROR, "%s Received invalid utteranceTokens input: %@", buf, 0x16u);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)searchCustomVocabularyWithWildcardPatterns:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CKVocabularySearcher *)self _convertTypes:a5];
  uint64_t v11 = (void *)v10;
  if (!a5 || v10)
  {
    int v13 = [(CKVocabularySearcher *)self _searcher];
    id v14 = [v13 searchAppCustomVocabularyFTSWithWildcardPatterns:v8 appIds:v9 types:v11];

    unsigned __int16 v12 = [(CKVocabularySearcher *)self _convertResults:v14];
  }
  else
  {
    unsigned __int16 v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)searchCustomVocabulary:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CKVocabularySearcher *)self _convertTypes:a5];
  uint64_t v11 = (void *)v10;
  if (!a5 || v10)
  {
    int v13 = [(CKVocabularySearcher *)self _searcher];
    id v14 = [v13 searchAppCustomVocabularyFTS:v8 appIds:v9 types:v11];

    unsigned __int16 v12 = [(CKVocabularySearcher *)self _convertResults:v14];
  }
  else
  {
    unsigned __int16 v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (CKVocabularySearcher)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use factory method" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVocabularySearcher)initWithUserId:(id)a3 spanMatcher:(id)a4 prewarm:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularySearcher;
  uint64_t v11 = [(CKVocabularySearcher *)&v14 init];
  unsigned __int16 v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userId, a3);
    objc_storeStrong((id *)&v12->_spanMatcher, a4);
    if (v5) {
      [(SEMSpanMatcher *)v12->_spanMatcher prewarmIndexWithUserId:v9];
    }
  }

  return v12;
}

+ (void)initialize
{
  if (CKLogInit_onceToken != -1) {
    dispatch_once(&CKLogInit_onceToken, &__block_literal_global_471);
  }
}

+ (id)makeSearcherForUserId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL v5 = [getSEMSpanMatcherClass() indexMatcher];
  uint64_t v6 = (void *)[v4 initWithUserId:v3 spanMatcher:v5 prewarm:1];

  return v6;
}

+ (id)makeSearcher
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v3 = [getSEMSpanMatcherClass() indexMatcher];
  id v4 = (void *)[v2 initWithUserId:0 spanMatcher:v3 prewarm:0];

  return v4;
}

@end