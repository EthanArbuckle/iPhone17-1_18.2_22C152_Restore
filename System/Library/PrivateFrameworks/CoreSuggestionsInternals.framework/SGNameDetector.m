@interface SGNameDetector
+ (id)_contactNames;
+ (id)_fetchContactNamesToLimit:(unint64_t)a3;
+ (id)_fetchContactNamesToLimit:(unint64_t)a3 peopleSuggester:(id)a4;
- (SGNameDetector)initWithLanguage:(id)a3;
- (id)_detectContactNames:(id)a3;
- (id)_detectNLPNames:(id)a3;
- (id)_detectNames:(id)a3 withNameSet:(id)a4;
- (id)detectNames:(id)a3 algorithm:(unint64_t)a4;
- (id)detectNames:(id)a3 withNameSet:(id)a4;
- (id)tokenizerWithCoreNLPEnabled:(BOOL)a3;
@end

@implementation SGNameDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_coreNLPTokenizer, 0);
  objc_storeStrong((id *)&self->_noCoreNLPTokenizer, 0);
}

- (id)_detectNLPNames:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    LODWORD(v7) = -1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1CB79B230]();
        if ([v9 confidence])
        {
          int v11 = [v9 confidence];
          int v12 = v11;
          if (v7 == -1)
          {
            v23 = [v9 stringWithNewContents:@"SG_FEATURE_FULLNAME"];
            [v26 addObject:v23];
            LODWORD(v7) = v12;
          }
          else
          {
            if (v11 <= (int)v7) {
              int v13 = v7;
            }
            else {
              int v13 = v11;
            }
            uint64_t v7 = (v13 + 1);
            v14 = [v26 lastObject];
            NSUInteger v15 = [v14 range];
            v16 = v10;
            uint64_t v17 = v5;
            uint64_t v18 = v6;
            NSUInteger v20 = v19;
            v35.location = [v9 range];
            v35.length = v21;
            v34.location = v15;
            v34.length = v20;
            uint64_t v6 = v18;
            uint64_t v5 = v17;
            v10 = v16;
            NSRange v22 = NSUnionRange(v34, v35);
            v23 = +[SGTokenString stringWithString:@"SG_FEATURE_FULLNAME", v22.location, v22.length, v7 range confidence];

            objc_msgSend(v26, "setObject:atIndexedSubscript:", v23, objc_msgSend(v26, "count") - 1);
          }
        }
        else
        {
          LODWORD(v7) = -1;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  return v26;
}

- (id)_detectContactNames:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SGNameDetector _contactNames];
  uint64_t v6 = [(SGNameDetector *)self _detectNames:v4 withNameSet:v5];

  return v6;
}

- (id)detectNames:(id)a3 withNameSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SGNameDetector *)self tokenizerWithCoreNLPEnabled:0];
  v9 = [v8 transform:v7];

  v10 = [(SGNameDetector *)self _detectNames:v9 withNameSet:v6];

  return v10;
}

- (id)_detectNames:(id)a3 withNameSet:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v5;
  uint64_t v28 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v28)
  {
    uint64_t v9 = *(void *)v30;
    char v10 = 1;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v13 = (void *)MEMORY[0x1CB79B230]();
        v14 = [v12 lowercaseString];
        int v15 = [v6 containsObject:v14];

        if (v15)
        {
          if (v10)
          {
            v16 = [v12 stringWithNewContents:@"SG_FEATURE_FULLNAME"];
            [v7 addObject:v16];
          }
          else
          {
            uint64_t v17 = [v7 lastObject];
            id v18 = v8;
            NSUInteger v19 = v7;
            id v20 = v6;
            NSUInteger v21 = [v17 range];
            NSUInteger v23 = v22;
            v37.location = [v12 range];
            v37.length = v24;
            v36.location = v21;
            id v6 = v20;
            id v7 = v19;
            id v8 = v18;
            v36.length = v23;
            NSRange v25 = NSUnionRange(v36, v37);
            v16 = +[SGTokenString stringWithString:@"SG_FEATURE_FULLNAME", v25.location, v25.length range];

            uint64_t v9 = v27;
            objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, objc_msgSend(v7, "count") - 1);
          }
        }
        char v10 = v15 ^ 1;
      }
      uint64_t v28 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v28);
  }

  return v7;
}

- (id)detectNames:(id)a3 algorithm:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SGNameDetector *)self tokenizerWithCoreNLPEnabled:a4 == 1];
  id v8 = [v7 transform:v6];
  switch(a4)
  {
    case 2uLL:
      uint64_t v9 = [(SGNameMappingTransformer *)self->_transformer transform:v8];
      goto LABEL_7;
    case 0uLL:
      uint64_t v9 = [(SGNameDetector *)self _detectContactNames:v8];
LABEL_7:
      char v10 = (void *)v9;
      goto LABEL_8;
    case 1uLL:
      uint64_t v9 = [(SGNameDetector *)self _detectNLPNames:v8];
      goto LABEL_7;
  }
  int v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = a4;
    _os_log_fault_impl(&dword_1CA650000, v12, OS_LOG_TYPE_FAULT, "Invalid value for SGNameDetectorAlgorithm: %lu", (uint8_t *)&v13, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    abort();
  }
  char v10 = 0;
LABEL_8:

  return v10;
}

- (id)tokenizerWithCoreNLPEnabled:(BOOL)a3
{
  if (a3)
  {
    p_coreNLPTokenizer = &self->_coreNLPTokenizer;
    coreNLPTokenizer = self->_coreNLPTokenizer;
    if (coreNLPTokenizer) {
      goto LABEL_7;
    }
    id v6 = +[SGTokenizerMappingTransformer forLocale:self->_language tagNames:1 trustCoreNLP:1 personalNameMapping:0 punctuationMapping:0];
    noCoreNLPTokenizer = self->_coreNLPTokenizer;
    self->_coreNLPTokenizer = v6;
  }
  else
  {
    p_coreNLPTokenizer = &self->_noCoreNLPTokenizer;
    coreNLPTokenizer = self->_noCoreNLPTokenizer;
    if (coreNLPTokenizer) {
      goto LABEL_7;
    }
    id v8 = +[SGTokenizerMappingTransformer forLocale:self->_language tagNames:0 trustCoreNLP:0 personalNameMapping:0 punctuationMapping:0];
    noCoreNLPTokenizer = self->_noCoreNLPTokenizer;
    self->_noCoreNLPTokenizer = v8;
  }

  coreNLPTokenizer = *p_coreNLPTokenizer;
LABEL_7:
  return coreNLPTokenizer;
}

- (SGNameDetector)initWithLanguage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGNameDetector;
  id v6 = [(SGNameDetector *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_language, a3);
    uint64_t v8 = +[SGNameMappingTransformer instanceForNameDetector];
    transformer = v7->_transformer;
    v7->_transformer = (SGNameMappingTransformer *)v8;
  }
  return v7;
}

+ (id)_fetchContactNamesToLimit:(unint64_t)a3 peopleSuggester:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [v4 rankedGlobalSuggestionsFromContext:v6 contactsOnly:1];

  if (v7)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v7;
    uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v40)
    {
      NSRange v36 = v7;
      id v37 = v4;
      uint64_t v8 = 0;
      uint64_t v39 = *(void *)v48;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v42 = v8;
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(obj);
        }
        char v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        objc_super v11 = [v10 recipients];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v17 = (void *)MEMORY[0x1CB79B230]();
              id v18 = [v16 contact];
              NSUInteger v19 = [v18 givenName];
              uint64_t v20 = [v19 length];

              if (v20)
              {
                NSUInteger v21 = [v18 givenName];
                NSUInteger v22 = [v21 localizedLowercaseString];
                [v5 addObject:v22];
              }
              NSUInteger v23 = [v18 familyName];
              uint64_t v24 = [v23 length];

              if (v24)
              {
                NSRange v25 = [v18 familyName];
                id v26 = [v25 localizedLowercaseString];
                [v5 addObject:v26];
              }
              uint64_t v27 = [v18 middleName];
              uint64_t v28 = [v27 length];

              if (v28)
              {
                long long v29 = [v18 middleName];
                long long v30 = [v29 localizedLowercaseString];
                [v5 addObject:v30];
              }
              long long v31 = [v18 nickname];
              uint64_t v32 = [v31 length];

              if (v32)
              {
                v33 = [v18 nickname];
                uint64_t v34 = [v33 localizedLowercaseString];
                [v5 addObject:v34];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v13);
        }

        uint64_t v8 = v42 + 1;
        if (v42 + 1 >= a3) {
          break;
        }
        if (++v9 == v40)
        {
          uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
          if (v40) {
            goto LABEL_4;
          }
          break;
        }
      }
      id v7 = v36;
      id v4 = v37;
    }
  }
  else
  {
    id obj = sgLogHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, obj, OS_LOG_TYPE_ERROR, "SGNameDetector - Error querying contacts from people suggester.", buf, 2u);
    }
  }

  return v5;
}

+ (id)_fetchContactNamesToLimit:(unint64_t)a3
{
  id v4 = objc_opt_new();
  id v5 = +[SGNameDetector _fetchContactNamesToLimit:a3 peopleSuggester:v4];

  return v5;
}

+ (id)_contactNames
{
  if (_contactNames__pasOnceToken3 != -1) {
    dispatch_once(&_contactNames__pasOnceToken3, &__block_literal_global_38067);
  }
  objc_storeStrong((id *)&_contactNames_contactNames, (id)_contactNames__pasExprOnceResult);
  v2 = (void *)_contactNames_contactNames;
  return v2;
}

void __31__SGNameDetector__contactNames__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = +[SGNameDetector _fetchContactNamesToLimit:500];
  v2 = (void *)_contactNames__pasExprOnceResult;
  _contactNames__pasExprOnceResult = v1;
}

@end