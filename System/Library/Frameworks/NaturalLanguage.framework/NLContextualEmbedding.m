@interface NLContextualEmbedding
+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3;
+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3 andOptions:(id)a4;
+ (NLContextualEmbedding)contextualEmbeddingWithLanguage:(NLLanguage)language;
+ (NLContextualEmbedding)contextualEmbeddingWithModelIdentifier:(NSString *)modelIdentifier;
+ (NLContextualEmbedding)contextualEmbeddingWithScript:(NLScript)script;
+ (NSArray)contextualEmbeddingsForValues:(NSDictionary *)valuesDictionary;
+ (id)contextualEmbeddingCatalog;
+ (id)contextualEmbeddingConfigurationCatalog;
+ (id)contextualEmbeddingForLanguage:(id)a3;
+ (id)contextualEmbeddingForScript:(id)a3;
+ (unint64_t)systemVersionForLanguage:(id)a3;
- (BOOL)compileWithError:(id *)a3;
- (BOOL)enumerateTokensForString:(id)a3 language:(id)a4 inRange:(_NSRange)a5 error:(id *)a6 usingBlock:(id)a7;
- (BOOL)hasAvailableAssets;
- (BOOL)isE5Enabled;
- (BOOL)isLoaded;
- (BOOL)load;
- (BOOL)loadSentenceEmbedding;
- (BOOL)loadSentenceEmbeddingWithError:(id *)a3;
- (BOOL)loadSentenceEmbeddingWithOptions:(id)a3 error:(id *)a4;
- (BOOL)loadWithError:(NSError *)error;
- (BOOL)loadWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestBackgroundModelLoadingWithTimeout:(double)a3 error:(id *)a4;
- (BOOL)requestBackgroundModelLoadingWithWithError:(id *)a3;
- (BOOL)requiresCompilation;
- (BOOL)useANE;
- (NLContextualEmbedding)initWithIdentifier:(id)a3 andOptions:(id)a4;
- (NLContextualEmbedding)initWithOptions:(id)a3;
- (NLContextualEmbeddingResult)embeddingResultForString:(NSString *)string language:(NLLanguage)language error:(NSError *)error;
- (NSArray)languages;
- (NSArray)scripts;
- (NSString)modelIdentifier;
- (NSUInteger)dimension;
- (NSUInteger)maximumSequenceLength;
- (NSUInteger)revision;
- (id)_concatenatedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7;
- (id)_getSentenceEmbeddingForString:(id)a3 error:(id *)a4;
- (id)_paddedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7;
- (id)_taggerForString:(id)a3 language:(id)a4;
- (id)_tokenRangesForString:(id)a3 language:(id)a4;
- (id)_tokensForString:(id)a3 tokenRanges:(id)a4;
- (id)adapterIdentifier;
- (id)adapters;
- (id)assetLocale;
- (id)assetLocaleIdentifier;
- (id)bundleName;
- (id)bundlePath;
- (id)description;
- (id)identifier;
- (id)requestBackgroundBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 error:(id *)a5;
- (id)requestBackgroundEmbeddingResultForString:(id)a3 language:(id)a4 error:(id *)a5;
- (id)sentenceEmbeddingVectorDataForString:(id)a3 language:(id)a4 error:(id *)a5;
- (id)sentenceEmbeddingVectorForString:(id)a3 language:(id)a4 error:(id *)a5;
- (id)subRangesWithinToken:(id)a3 componentRange:(_NSRange)a4 offset:(unint64_t)a5;
- (id)subRangesWithinToken:(id)a3 offset:(unint64_t)a4;
- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5;
- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5 componentRanges:(id)a6 componentsCount:(unint64_t)a7;
- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5;
- (int64_t)getCompilationState;
- (unint64_t)maximumBatchSize;
- (unint64_t)modelSystemVersion;
- (unint64_t)sentenceVectorDimension;
- (unint64_t)tokenVectorDimension;
- (void)dealloc;
- (void)requestAssetsWithCompletionHandler:(id)a3;
- (void)requestBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 completionHandler:(id)a5;
- (void)requestEmbeddingAssetsWithCompletionHandler:(void *)completionHandler;
- (void)requestEmbeddingResultForString:(id)a3 language:(id)a4 completionHandler:(id)a5;
- (void)requestModelCompilationWithCompletionHandler:(id)a3;
- (void)requestModelLoadingWithCompletionHandler:(id)a3;
- (void)requestSentenceEmbeddingVectorForString:(id)a3 language:(id)a4 completionHandler:(id)a5;
- (void)unload;
@end

@implementation NLContextualEmbedding

+ (id)contextualEmbeddingCatalog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NLContextualEmbedding_contextualEmbeddingCatalog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contextualEmbeddingCatalog_onceToken != -1) {
    dispatch_once(&contextualEmbeddingCatalog_onceToken, block);
  }
  v2 = (void *)contextualEmbeddingCatalog_contextualEmbeddingCatalog;

  return v2;
}

void __51__NLContextualEmbedding_contextualEmbeddingCatalog__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 URLForResource:@"ContextualEmbeddingCatalog" withExtension:@"plist"];

  if (v1
    && ([MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    id v22 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v22];
    id v5 = v22;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = v5;
      v17 = v3;
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v13 = [v7 objectForKey:v12];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v6 setObject:v13 forKey:v12];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }

      uint64_t v14 = [v6 copy];
      v15 = (void *)contextualEmbeddingCatalog_contextualEmbeddingCatalog;
      contextualEmbeddingCatalog_contextualEmbeddingCatalog = v14;

      v3 = v17;
      id v5 = v16;
    }
    else if (v5)
    {
      NSLog(&cfstr_Nlcontextualem.isa, v5);
    }
    else
    {
      NSLog(&cfstr_Nlcontextualem_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Nlcontextualem_0.isa);
  }
}

+ (id)contextualEmbeddingConfigurationCatalog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__NLContextualEmbedding_contextualEmbeddingConfigurationCatalog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contextualEmbeddingConfigurationCatalog_onceToken != -1) {
    dispatch_once(&contextualEmbeddingConfigurationCatalog_onceToken, block);
  }
  uint64_t v2 = (void *)contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog;

  return v2;
}

void __64__NLContextualEmbedding_contextualEmbeddingConfigurationCatalog__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 URLForResource:@"ContextualEmbeddingConfigurationCatalog" withExtension:@"plist"];

  if (v1
    && ([MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    id v22 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v22];
    id v5 = v22;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = v5;
      v17 = v3;
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v13 = [v7 objectForKey:v12];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v6 setObject:v13 forKey:v12];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }

      uint64_t v14 = [v6 copy];
      v15 = (void *)contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog;
      contextualEmbeddingConfigurationCatalog_contextualEmbeddingConfigurationCatalog = v14;

      v3 = v17;
      id v5 = v16;
    }
    else if (v5)
    {
      NSLog(&cfstr_Nlcontextualem_1.isa, v5);
    }
    else
    {
      NSLog(&cfstr_Nlcontextualem_2.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Nlcontextualem_2.isa);
  }
}

- (NLContextualEmbedding)initWithOptions:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"ModelIdentifier"];
  v6 = [(id)objc_opt_class() contextualEmbeddingCatalog];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v29.receiver = self;
    v29.super_class = (Class)NLContextualEmbedding;
    uint64_t v8 = [(NLContextualEmbedding *)&v29 init];
    if (v8)
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"EnableE5"];
      if (v9)
      {
        uint64_t v10 = [v4 objectForKeyedSubscript:@"EnableE5"];
        v8->_isE5Enabled = [v10 BOOLValue];
        p_isE5Enabled = &v8->_isE5Enabled;
      }
      else
      {
        v8->_isE5Enabled = 1;
        p_isE5Enabled = &v8->_isE5Enabled;
      }

      if (*p_isE5Enabled)
      {
        v13 = [v4 objectForKeyedSubscript:@"UseANE"];
        if (v13)
        {
          uint64_t v14 = [v4 objectForKeyedSubscript:@"UseANE"];
          v8->_useANE = [v14 BOOLValue];
        }
        else
        {
          v8->_useANE = 0;
        }
      }
      else
      {
        v8->_useANE = 0;
      }
      uint64_t v15 = [v5 copy];
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v15;

      uint64_t v17 = [v5 copy];
      modelIdentifier = v8->_modelIdentifier;
      v8->_modelIdentifier = (NSString *)v17;

      adapterIdentifier = v8->_adapterIdentifier;
      v8->_adapterIdentifier = 0;

      long long v20 = [NLTagger alloc];
      v30[0] = @"TokenType";
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      uint64_t v22 = [(NLTagger *)v20 initWithTagSchemes:v21];
      tagger = v8->_tagger;
      v8->_tagger = (NLTagger *)v22;

      uint64_t v24 = [v7 copy];
      catalogEntry = v8->_catalogEntry;
      v8->_catalogEntry = (NSDictionary *)v24;

      embeddingE5 = v8->_embeddingE5;
      v8->_embeddingE5 = 0;

      sentenceEmbeddingHead = v8->_sentenceEmbeddingHead;
      v8->_embedding = 0;
      v8->_sentenceEmbeddingHead = 0;
    }
    self = v8;
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (NLContextualEmbedding)contextualEmbeddingWithModelIdentifier:(NSString *)modelIdentifier
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = modelIdentifier;
  id v4 = [NLContextualEmbedding alloc];
  uint64_t v8 = @"ModelIdentifier";
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = [(NLContextualEmbedding *)v4 initWithOptions:v5];

  return v6;
}

- (NLContextualEmbedding)initWithIdentifier:(id)a3 andOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() contextualEmbeddingConfigurationCatalog];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [v9 objectForKey:@"ModelIdentifier"];
    v11 = [v9 objectForKey:@"AdapterIdentifier"];
  }
  else
  {
    id v10 = v6;
    v11 = 0;
  }
  uint64_t v12 = (void *)[v7 mutableCopy];
  [v12 setObject:v10 forKeyedSubscript:@"ModelIdentifier"];
  v13 = [(NLContextualEmbedding *)self initWithOptions:v12];
  if (v13)
  {
    uint64_t v14 = [v6 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    adapterIdentifier = v13->_adapterIdentifier;
    v13->_adapterIdentifier = (NSString *)v16;
  }
  return v13;
}

+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [NLContextualEmbedding alloc];
  id v5 = [(NLContextualEmbedding *)v4 initWithIdentifier:v3 andOptions:MEMORY[0x1E4F1CC08]];

  return v5;
}

+ (NLContextualEmbedding)contextualEmbeddingWithIdentifier:(id)a3 andOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NLContextualEmbedding alloc] initWithIdentifier:v6 andOptions:v5];

  return v7;
}

+ (NSArray)contextualEmbeddingsForValues:(NSDictionary *)valuesDictionary
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v58 = valuesDictionary;
  id v50 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [(id)objc_opt_class() contextualEmbeddingCatalog];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v60;
    uint64_t v52 = *(void *)v60;
    v53 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v54 = v5;
      do
      {
        if (*(void *)v60 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v59 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v3 objectForKey:v8];
          id v10 = (void *)v9;
          if (!v58 || !v9) {
            goto LABEL_52;
          }
          v11 = v58;
          uint64_t v12 = [v10 objectForKey:@"Languages"];
          v13 = [v10 objectForKey:@"Scripts"];
          uint64_t v55 = [(NSDictionary *)v11 objectForKey:@"Languages"];
          uint64_t v14 = [(NSDictionary *)v11 objectForKey:@"Scripts"];
          v57 = v10;
          uint64_t v15 = [v10 objectForKey:@"Revision"];
          uint64_t v16 = [(NSDictionary *)v11 objectForKey:@"Revision"];

          uint64_t v17 = v12;
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v17 = 0;
            }
          }
          long long v18 = v13;
          long long v19 = (void *)v15;
          long long v20 = (void *)v14;
          if (v13)
          {
            objc_opt_class();
            long long v21 = (void *)v55;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              long long v18 = 0;
            }
            if (!v55)
            {
LABEL_20:
              if (v20)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  long long v20 = 0;
                }
              }
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  long long v19 = 0;
                }
              }
              if (v16)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  uint64_t v16 = 0;
                }
              }
              if (!objc_msgSend(v21, "count", v50) && !objc_msgSend(v20, "count")) {
                goto LABEL_50;
              }
              if (v21 && [v21 count])
              {
                uint64_t v22 = v21;
                v23 = v20;
                uint64_t v24 = v16;
                v25 = v19;
                v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
                v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
                int v56 = [v26 isSubsetOfSet:v27];

                long long v19 = v25;
                uint64_t v16 = v24;
                long long v20 = v23;
                long long v21 = v22;

                if (!v20)
                {
LABEL_39:
                  int v35 = 1;
                  if (v16) {
                    goto LABEL_40;
                  }
LABEL_38:
                  int v36 = 1;
                  goto LABEL_45;
                }
              }
              else
              {
                int v56 = 1;
                if (!v20) {
                  goto LABEL_39;
                }
              }
              if (![v20 count]) {
                goto LABEL_39;
              }
              v51 = v17;
              [MEMORY[0x1E4F1CAD0] setWithArray:v20];
              v28 = v21;
              objc_super v29 = v20;
              v30 = v16;
              v32 = v31 = v19;
              [MEMORY[0x1E4F1CAD0] setWithArray:v18];
              v34 = v33 = v18;
              int v35 = [v32 isSubsetOfSet:v34];

              long long v18 = v33;
              uint64_t v17 = v51;

              long long v19 = v31;
              uint64_t v16 = v30;
              long long v20 = v29;
              long long v21 = v28;
              if (!v16) {
                goto LABEL_38;
              }
LABEL_40:
              if (v19)
              {
                v37 = v21;
                v38 = v20;
                v39 = v16;
                v40 = v19;
                uint64_t v41 = [v19 unsignedIntegerValue];
                BOOL v42 = v41 == [v39 unsignedIntegerValue];
                long long v19 = v40;
                uint64_t v16 = v39;
                long long v20 = v38;
                long long v21 = v37;
                int v36 = v42;
              }
              else
              {
                int v36 = 0;
              }
LABEL_45:
              if (v56)
              {
                v43 = v16;
                v44 = v19;
                int v45 = v35 & v36;

                BOOL v42 = v45 == 1;
                id v3 = v53;
                uint64_t v5 = v54;
                uint64_t v6 = v52;
                id v10 = v57;
                if (!v42) {
                  goto LABEL_52;
                }
                uint64_t v46 = +[NLContextualEmbedding contextualEmbeddingWithModelIdentifier:v8];
                if (v46)
                {
                  v47 = (void *)v46;
                  objc_msgSend(v50, "addObject:");
                }
                else
                {
                  v47 = 0;
                }
              }
              else
              {
LABEL_50:
                v47 = v17;

                id v3 = v53;
                uint64_t v5 = v54;
                uint64_t v6 = v52;
                id v10 = v57;
              }

LABEL_52:
              goto LABEL_53;
            }
          }
          else
          {
            long long v21 = (void *)v55;
            if (!v55) {
              goto LABEL_20;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            long long v21 = 0;
          }
          goto LABEL_20;
        }
LABEL_53:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v48 = [v3 countByEnumeratingWithState:&v59 objects:v63 count:16];
      uint64_t v5 = v48;
    }
    while (v48);
  }

  return (NSArray *)v50;
}

+ (NLContextualEmbedding)contextualEmbeddingWithLanguage:(NLLanguage)language
{
  v13[1] = *MEMORY[0x1E4F143B8];
  NLLanguage v11 = language;
  uint64_t v12 = @"Languages";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = language;
  uint64_t v6 = [v4 arrayWithObjects:&v11 count:1];
  v13[0] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);

  uint64_t v8 = [a1 contextualEmbeddingsWithValues:v7];
  uint64_t v9 = mostRecentEmbedding(v8);

  return (NLContextualEmbedding *)v9;
}

+ (id)contextualEmbeddingForLanguage:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = @"Languages";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v11 count:1];
  v13[0] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);

  uint64_t v8 = [a1 contextualEmbeddingsWithValues:v7];
  uint64_t v9 = mostRecentEmbedding(v8);

  return v9;
}

+ (NLContextualEmbedding)contextualEmbeddingWithScript:(NLScript)script
{
  v13[1] = *MEMORY[0x1E4F143B8];
  NLScript v11 = script;
  uint64_t v12 = @"Scripts";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = script;
  uint64_t v6 = [v4 arrayWithObjects:&v11 count:1];
  v13[0] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);

  uint64_t v8 = [a1 contextualEmbeddingsWithValues:v7];
  uint64_t v9 = mostRecentEmbedding(v8);

  return (NLContextualEmbedding *)v9;
}

+ (id)contextualEmbeddingForScript:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = @"Scripts";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v11 count:1];
  v13[0] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v11);

  uint64_t v8 = [a1 contextualEmbeddingsWithValues:v7];
  uint64_t v9 = mostRecentEmbedding(v8);

  return v9;
}

+ (unint64_t)systemVersionForLanguage:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([a1 contextualEmbeddingWithLanguage:v4],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 modelSystemVersion],
        v5,
        !v6))
  {
    unint64_t v6 = 4;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NLContextualEmbedding;
  id v4 = [(NLContextualEmbedding *)&v8 description];
  id v5 = [(NLContextualEmbedding *)self identifier];
  unint64_t v6 = [v3 stringWithFormat:@"%@<%@>", v4, v5];

  return v6;
}

- (void)dealloc
{
  [(NLContextualEmbedding *)self unload];
  v3.receiver = self;
  v3.super_class = (Class)NLContextualEmbedding;
  [(NLContextualEmbedding *)&v3 dealloc];
}

- (id)bundlePath
{
  objc_super v3 = [(NLContextualEmbedding *)self assetLocale];
  [(NLContextualEmbedding *)self bundleName];
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  LDEnumerateAssetDataItems();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__NLContextualEmbedding_bundlePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if ([@"Embedding" isEqualToString:a5])
  {
    id v14 = [a2 path];
    uint64_t v9 = [v14 lastPathComponent];
    int v10 = [v9 isEqual:*(void *)(a1 + 32)];

    if (v10)
    {
      uint64_t v11 = [v14 copy];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    *a6 = 1;
  }
}

- (BOOL)loadWithOptions:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  if ([(NLContextualEmbedding *)self isLoaded]) {
    return 1;
  }
  if (self->_isE5Enabled && !self->_embeddingE5)
  {
    uint64_t v27 = [(NLContextualEmbedding *)self bundlePath];
    if (!v27)
    {
      if (a4)
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        v61[0] = @"Failed to locate embedding model";
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
        *a4 = [v33 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v34];
      }
      int v35 = +[NLTelemetry sharedInstance];
      int v36 = [(NLContextualEmbedding *)self identifier];
      v37 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
      [v35 reportEmbeddingLoadedWithIdentifier:v36 localeIdentifier:v37 useANE:self->_useANE status:3];

      return 0;
    }
    v28 = (void *)v27;
    objc_super v29 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Adapters"];
    v30 = v29;
    if (self->_adapterIdentifier && (objc_msgSend(v29, "containsObject:") & 1) == 0)
    {
      if (a4)
      {
        v47 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        long long v59 = @"Backbone model doesn't contain requested adapter";
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        *a4 = [v47 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v48];
      }
      v44 = +[NLTelemetry sharedInstance];
      int v45 = [(NLContextualEmbedding *)self identifier];
      uint64_t v46 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
      [v44 reportEmbeddingLoadedWithIdentifier:v45 localeIdentifier:v46 useANE:self->_useANE status:2];
      BOOL v6 = 0;
      goto LABEL_39;
    }
    if ([(NLContextualEmbedding *)self requiresCompilation])
    {
      NSLog(&cfstr_Nlcontextualem_3.isa);
      self->_isE5Enabled = 0;
    }
    else
    {
      v38 = objc_opt_class();
      v39 = [v28 stringByAppendingPathComponent:@"embeddings.mil"];
      v40 = [v38 embeddingModelWithModelPath:v39 useANE:self->_useANE adapters:v30];
      embeddingE5 = self->_embeddingE5;
      self->_embeddingE5 = v40;

      if (a4)
      {
        if (self->_embeddingE5)
        {
LABEL_35:
          v44 = +[NLTelemetry sharedInstance];
          int v45 = [(NLContextualEmbedding *)self identifier];
          uint64_t v46 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
          [v44 reportEmbeddingLoadedWithIdentifier:v45 localeIdentifier:v46 useANE:self->_useANE status:0];
          BOOL v6 = 1;
LABEL_39:

          return v6;
        }
        BOOL v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v57 = @"Failed to load embedding model in MIL representation";
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        *a4 = [v42 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v43];
      }
    }
    if (!self->_embeddingE5)
    {
      NSLog(&cfstr_Nlcontextualem_4.isa);
      self->_isE5Enabled = 0;

      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_5:
  if (self->_embedding)
  {
    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  v13 = [(NLContextualEmbedding *)self bundlePath];
  id v14 = (id)*MEMORY[0x1E4F5C8D0];
  uint64_t v15 = *MEMORY[0x1E4F5C8B0];
  uint64_t v16 = *MEMORY[0x1E4F5C878];
  v54[0] = *MEMORY[0x1E4F5C8A0];
  v54[1] = v16;
  v55[0] = v15;
  v55[1] = v14;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
  long long v18 = (void *)[v17 mutableCopy];

  if (!v13)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53 = @"Failed to load embedding model";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      *a4 = [v31 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v32];
    }
    long long v19 = +[NLTelemetry sharedInstance];
    long long v20 = [(NLContextualEmbedding *)self identifier];
    long long v21 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
    BOOL useANE = self->_useANE;
    v23 = v19;
    uint64_t v24 = v20;
    v25 = v21;
    uint64_t v26 = 3;
    goto LABEL_24;
  }
  if (self->_adapterIdentifier)
  {
    NSLog(&cfstr_Nlcontextualem_5.isa);
    long long v19 = +[NLTelemetry sharedInstance];
    long long v20 = [(NLContextualEmbedding *)self identifier];
    long long v21 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
    BOOL useANE = self->_useANE;
    v23 = v19;
    uint64_t v24 = v20;
    v25 = v21;
    uint64_t v26 = 2;
LABEL_24:
    [v23 reportEmbeddingLoadedWithIdentifier:v24 localeIdentifier:v25 useANE:useANE status:v26];

    return 0;
  }
  [v18 setObject:v13 forKey:*MEMORY[0x1E4F5C898]];
  self->_embedding = (void *)NLStringEmbeddingCreateWithOptions();

  if (a4)
  {
LABEL_7:
    if (!self->_embedding)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51 = @"Failed to load embedding model";
      objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      *a4 = [v7 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v8];
    }
  }
LABEL_9:
  uint64_t v9 = +[NLTelemetry sharedInstance];
  int v10 = [(NLContextualEmbedding *)self identifier];
  uint64_t v11 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
  if (self->_embedding) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v9 reportEmbeddingLoadedWithIdentifier:v10 localeIdentifier:v11 useANE:self->_useANE status:v12];

  return self->_embedding != 0;
}

- (BOOL)loadWithError:(NSError *)error
{
  return [(NLContextualEmbedding *)self loadWithOptions:MEMORY[0x1E4F1CC08] error:error];
}

- (BOOL)load
{
  return [(NLContextualEmbedding *)self loadWithOptions:MEMORY[0x1E4F1CC08] error:0];
}

- (BOOL)isLoaded
{
  return self->_isE5Enabled && self->_embeddingE5 || self->_embedding != 0;
}

- (void)unload
{
  embeddingE5 = self->_embeddingE5;
  self->_embeddingE5 = 0;

  embedding = self->_embedding;
  if (embedding) {
    CFRelease(embedding);
  }
  self->_embedding = 0;

  [(NLContextualEmbedding *)self unloadSentenceEmbedding];
}

- (BOOL)loadSentenceEmbeddingWithOptions:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_isE5Enabled)
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Failed to load sentence embedding model";
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    long long v18 = (__CFString **)v32;
    long long v19 = &v31;
    goto LABEL_16;
  }
  [(NLContextualEmbedding *)self load];
  if (![(NLE5Embedding *)self->_embeddingE5 isAdapterLoaded:0x1EFB30C30]
    && ![(NLE5Embedding *)self->_embeddingE5 loadAdapter:0x1EFB30C30])
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30 = @"Failed to load adapter for sentence embedding";
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    long long v18 = &v30;
    long long v19 = &v29;
    goto LABEL_16;
  }
  sentenceEmbeddingHead = self->_sentenceEmbeddingHead;
  if (!sentenceEmbeddingHead)
  {
    uint64_t v8 = [(NLContextualEmbedding *)self bundlePath];
    if (!v8)
    {
      if (!a4) {
        goto LABEL_18;
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28 = @"Failed to locate assets for embedding model";
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      long long v21 = v24;
      uint64_t v22 = 8;
      goto LABEL_17;
    }
    uint64_t v9 = (void *)v8;
    int v10 = [NLSentenceEmbeddingHead alloc];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = [v9 stringByAppendingPathComponent:@"sentence-embedding-head.mlmodelc"];
    v13 = [v11 fileURLWithPath:v12];
    id v14 = [(NLSentenceEmbeddingHead *)v10 initWithModelURL:v13];
    uint64_t v15 = self->_sentenceEmbeddingHead;
    self->_sentenceEmbeddingHead = v14;

    sentenceEmbeddingHead = self->_sentenceEmbeddingHead;
  }
  if (![(NLSentenceEmbeddingHead *)sentenceEmbeddingHead isLoaded]
    && ![(NLSentenceEmbeddingHead *)self->_sentenceEmbeddingHead load])
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v26 = @"Failed to load head for sentence embedding";
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    long long v18 = &v26;
    long long v19 = &v25;
LABEL_16:
    long long v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    long long v21 = v16;
    uint64_t v22 = 7;
LABEL_17:
    *a4 = [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:v22 userInfo:v20];

    LOBYTE(a4) = 0;
    goto LABEL_18;
  }
  LOBYTE(a4) = 1;
LABEL_18:

  return (char)a4;
}

- (BOOL)loadSentenceEmbeddingWithError:(id *)a3
{
  return [(NLContextualEmbedding *)self loadSentenceEmbeddingWithOptions:MEMORY[0x1E4F1CC08] error:a3];
}

- (BOOL)loadSentenceEmbedding
{
  return [(NLContextualEmbedding *)self loadSentenceEmbeddingWithOptions:MEMORY[0x1E4F1CC08] error:0];
}

- (id)_taggerForString:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NLTagger *)self->_tagger setString:v6];
  if (v7) {
    -[NLTagger setLanguage:range:](self->_tagger, "setLanguage:range:", v7, 0, [v6 length]);
  }
  uint64_t v8 = self->_tagger;

  return v8;
}

- (id)_tokenRangesForString:(id)a3 language:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 array];
  int v10 = [(NLContextualEmbedding *)self _taggerForString:v8 language:v7];

  uint64_t v11 = [v8 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__NLContextualEmbedding__tokenRangesForString_language___block_invoke;
  v14[3] = &unk_1E5C54458;
  id v12 = v9;
  id v15 = v12;
  objc_msgSend(v10, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v11, 0, @"TokenType", 36, v14);

  return v12;
}

void __56__NLContextualEmbedding__tokenRangesForString_language___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (id)_tokensForString:(id)a3 tokenRanges:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "rangeValue", (void)v17);
        id v15 = objc_msgSend(v5, "substringWithRange:", v13, v14);
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_concatenatedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_isE5Enabled) {
    uint64_t Dimension = [(NLE5Embedding *)self->_embeddingE5 dimension];
  }
  else {
    uint64_t Dimension = NLStringEmbeddingGetDimension();
  }
  uint64_t v17 = Dimension;
  uint64_t v18 = [v13 count];
  long long v19 = [MEMORY[0x1E4F1CA58] dataWithLength:12 * v17 * a7 * v18];
  id v44 = v12;
  uint64_t v52 = [v44 bytes];
  id v43 = v19;
  long long v20 = (char *)[v43 mutableBytes];
  long long v21 = v20;
  if (3 * v17 * a7 * v18) {
    bzero(v20, 12 * v18 * v17 * a7);
  }
  if ([v13 count])
  {
    unint64_t v22 = 0;
    uint64_t v53 = 0;
    uint64_t v23 = 4 * v17;
    unint64_t v24 = 12 * a7;
    unint64_t v45 = 12 * a7 * v17;
    id v46 = v15;
    id v47 = v14;
    uint64_t v48 = v13;
    do
    {
      if (v22 >= [v14 count] || v22 >= objc_msgSend(v15, "count")) {
        break;
      }
      v51 = v21;
      uint64_t v25 = [v14 objectAtIndex:v22];
      uint64_t v49 = [v25 unsignedIntegerValue];

      uint64_t v54 = [v13 objectAtIndex:v22];
      unint64_t v50 = v22;
      uint64_t v26 = [v15 objectAtIndex:v22];
      if (a7)
      {
        unint64_t v27 = 0;
        v28 = v51;
        do
        {
          if (v27 >= [v54 count] || v27 >= objc_msgSend(v26, "count")) {
            break;
          }
          uint64_t v29 = [v26 objectAtIndex:v27];
          uint64_t v30 = [v29 rangeValue];
          unint64_t v31 = a7;
          unint64_t v33 = v32;

          uint64_t v34 = 3;
          if (v33 < 3) {
            uint64_t v34 = v33;
          }
          a7 = v31;
          if (v34)
          {
            uint64_t v35 = 0;
            int v36 = (int *)(v52 + v23 * (v53 + v30));
            v37 = v28;
            do
            {
              v38 = v37;
              v39 = v36;
              for (uint64_t i = v17; i; --i)
              {
                int v41 = *v39++;
                _DWORD *v38 = v41;
                v38 = (_DWORD *)((char *)v38 + v24);
              }
              ++v35;
              int v36 = (int *)((char *)v36 + v23);
              ++v37;
            }
            while (v35 != v34);
          }
          ++v27;
          v28 += 3;
        }
        while (v27 != v31);
      }
      v53 += v49;

      unint64_t v22 = v50 + 1;
      id v13 = v48;
      id v15 = v46;
      long long v21 = (char *)v51 + v45;
      id v14 = v47;
    }
    while (v50 + 1 < [v48 count]);
  }

  return v43;
}

- (id)subRangesWithinToken:(id)a3 componentRange:(_NSRange)a4 offset:(unint64_t)a5
{
  NSUInteger length = a4.length;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (self->_isE5Enabled)
  {
    uint64_t v9 = [(NLE5Embedding *)self->_embeddingE5 tokenIDsForText:v7];
  }
  else
  {
    uint64_t v9 = NLStringEmbeddingCopyTokenIDsForText();
  }
  uint64_t v10 = (void *)v9;
  unint64_t v28 = a5;
  if (subRangesWithinToken_componentRange_offset__onceToken != -1) {
    dispatch_once(&subRangesWithinToken_componentRange_offset__onceToken, &__block_literal_global_5);
  }
  uint64_t v11 = 0;
  if ([v10 count])
  {
    for (unint64_t i = 0; i < [v10 count]; ++i)
    {
      id v13 = [v10 objectAtIndex:i];
      id v14 = v13;
      if (i || ([v13 isEqual:&unk_1EFB3A988] & 1) == 0)
      {
        if ([v8 count] >= length)
        {

          break;
        }
        if (self->_isE5Enabled)
        {
          embeddingE5 = self->_embeddingE5;
          v31[0] = v14;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
          uint64_t v17 = [(NLE5Embedding *)embeddingE5 textForTokenIDs:v16];
          uint64_t v18 = [v17 stringByTrimmingCharactersInSet:subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet];
        }
        else
        {
          uint64_t v30 = v14;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          uint64_t v16 = (void *)NLStringEmbeddingCopyTextForTokenIDs();
          uint64_t v18 = [v16 stringByTrimmingCharactersInSet:subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet];
        }

        uint64_t v19 = [v18 length];
        uint64_t v20 = v19 + v11;
        if (v19 + v11 > (unint64_t)[v7 length])
        {
          uint64_t v20 = [v7 length];
          uint64_t v19 = v20 - v11;
        }
        long long v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11 + v28, v19);
        [v8 addObject:v21];

        uint64_t v11 = v20;
      }
    }
  }
  unint64_t v22 = [v8 count];
  NSUInteger v23 = length - v22;
  if (length > v22)
  {
    do
    {
      uint64_t v24 = v11 + 1;
      if (v11 + 1 <= (unint64_t)[v7 length])
      {
        uint64_t v25 = 1;
      }
      else
      {
        uint64_t v24 = [v7 length];
        uint64_t v25 = v24 - v11;
      }
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11 + v28, v25);
      [v8 addObject:v26];

      uint64_t v11 = v24;
      --v23;
    }
    while (v23);
  }

  return v8;
}

uint64_t __68__NLContextualEmbedding_subRangesWithinToken_componentRange_offset___block_invoke()
{
  subRangesWithinToken_componentRange_offset__whitespaceAndNewlineCharacterSet = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return MEMORY[0x1F41817F8]();
}

- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5 componentRanges:(id)a6 componentsCount:(unint64_t)a7
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v9 = a5;
  id v10 = a6;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    uint64_t v11 = -[NLContextualEmbedding subRangesWithinToken:componentRange:offset:](self, "subRangesWithinToken:componentRange:offset:", &stru_1EFB303D0, 0, 1, 0);
    if ([v11 count])
    {
      v37[0] = @"TokenRange";
      id v12 = [v11 firstObject];
      v38[0] = v12;
      v37[1] = @"ComponentRange";
      id v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, 1);
      v37[2] = @"SubtokenRanges";
      v38[1] = v13;
      v38[2] = v11;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
      [v33 addObject:v14];
    }
  }
  if (objc_msgSend(v34, "count", self))
  {
    unint64_t v15 = 0;
    do
    {
      if (v15 >= [v9 count]) {
        break;
      }
      if (v15 >= [v10 count]) {
        break;
      }
      uint64_t v16 = [v34 objectAtIndex:v15];
      uint64_t v17 = [v9 objectAtIndex:v15];
      uint64_t v18 = [v17 rangeValue];
      uint64_t v20 = v19;

      long long v21 = [v10 objectAtIndex:v15];
      id v22 = v9;
      uint64_t v23 = [v21 rangeValue];
      uint64_t v25 = v24;

      uint64_t v26 = objc_msgSend(v32, "subRangesWithinToken:componentRange:offset:", v16, v23, v25, v18);
      v35[0] = @"TokenRange";
      unint64_t v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v18, v20);
      v36[0] = v27;
      v35[1] = @"ComponentRange";
      unint64_t v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v23, v25);
      v35[2] = @"SubtokenRanges";
      v36[1] = v28;
      v36[2] = v26;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
      [v33 addObject:v29];

      id v9 = v22;
      ++v15;
    }
    while (v15 < [v34 count]);
  }

  return v33;
}

- (NLContextualEmbeddingResult)embeddingResultForString:(NSString *)string language:(NLLanguage)language error:(NSError *)error
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = string;
  id v9 = language;
  if ([(NLContextualEmbedding *)self isLoaded])
  {
    id v10 = 0;
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    id v39 = 0;
    [(NLContextualEmbedding *)self loadWithError:&v39];
    id v10 = v39;
    if (v9) {
      goto LABEL_6;
    }
  }
  id v9 = @"und";
LABEL_6:
  if (![(NLContextualEmbedding *)self isLoaded])
  {
    unint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    int v41 = @"Failed to load contextual embedding";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v16 = [v15 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v11];
    uint64_t v17 = 0;
    id v12 = v10;
    goto LABEL_29;
  }
  uint64_t v11 = [(NLContextualEmbedding *)self _tokenRangesForString:v8 language:v9];
  id v12 = [(NLContextualEmbedding *)self _tokensForString:v8 tokenRanges:v11];
  v46[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!self->_isE5Enabled) {
    goto LABEL_17;
  }
  if (self->_adapterIdentifier)
  {
    if (!-[NLE5Embedding isAdapterLoaded:](self->_embeddingE5, "isAdapterLoaded:"))
    {
      [(NLE5Embedding *)self->_embeddingE5 loadAdapter:self->_adapterIdentifier];
      goto LABEL_15;
    }
    if (self->_adapterIdentifier) {
      goto LABEL_15;
    }
  }
  if (![(NLE5Embedding *)self->_embeddingE5 isBackboneLoaded]) {
    [(NLE5Embedding *)self->_embeddingE5 loadBackbone];
  }
LABEL_15:
  if (!self->_isE5Enabled)
  {
LABEL_17:
    uint64_t v18 = NLStringEmbeddingCopyDataForTokenizedBatch();
    goto LABEL_18;
  }
  uint64_t v18 = [(NLE5Embedding *)self->_embeddingE5 embeddingDataForTokenizedBatch:v13 withOutputProperties:v14];
LABEL_18:
  v38 = (void *)v18;
  if (v18)
  {
    int v36 = error;
    uint64_t v19 = [v14 objectForKey:*MEMORY[0x1E4F5C8F0]];
    v37 = v14;
    uint64_t v20 = [v14 objectForKey:*MEMORY[0x1E4F5C8E8]];
    id v34 = v19;
    long long v21 = [v19 firstObject];
    id v33 = v20;
    id v22 = [v20 firstObject];
    if (self->_isE5Enabled) {
      uint64_t Dimension = [(NLE5Embedding *)self->_embeddingE5 dimension];
    }
    else {
      uint64_t Dimension = NLStringEmbeddingGetDimension();
    }
    uint64_t v24 = Dimension;
    uint64_t v35 = v13;
    if (v21 && v22)
    {
      uint64_t v25 = -[NLContextualEmbedding tokenDictionariesForString:tokens:tokenRanges:componentRanges:componentsCount:](self, "tokenDictionariesForString:tokens:tokenRanges:componentRanges:componentsCount:", v8, v12, v11, v22, [v21 unsignedIntegerValue]);
      uint64_t v17 = [[NLContextualEmbeddingResult alloc] initWithString:v8 tokenDictionaries:v25 data:v38 language:v9 tokenVectorDimension:v24];
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      unint64_t v45 = @"Failed to compute embedding result";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v27 = [v26 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v25];

      uint64_t v17 = 0;
      id v10 = (id)v27;
    }
    uint64_t v16 = v10;

    id v10 = v33;
    unint64_t v32 = v34;
    id v13 = v35;
    error = v36;
  }
  else
  {
    v37 = v14;
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    id v43 = @"Failed to compute embedding result";
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    unint64_t v31 = v29;
    unint64_t v32 = (void *)v30;
    uint64_t v16 = [v31 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v30];
    uint64_t v17 = 0;
  }

LABEL_29:
  if (error) {
    *error = (NSError *)v16;
  }

  return v17;
}

- (id)_paddedEmbeddingDataForInputEmbeddingData:(id)a3 tokenizedSentences:(id)a4 batchComponentsCountArray:(id)a5 batchComponentRangesArray:(id)a6 maxTokens:(unint64_t)a7
{
  id v12 = a3;
  id v39 = a4;
  id v13 = a5;
  id v38 = a6;
  if (self->_isE5Enabled) {
    uint64_t Dimension = [(NLE5Embedding *)self->_embeddingE5 dimension];
  }
  else {
    uint64_t Dimension = NLStringEmbeddingGetDimension();
  }
  uint64_t v15 = Dimension;
  uint64_t v16 = [v39 count];
  unint64_t v17 = v15 * a7 * v16;
  uint64_t v18 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v17];
  id v36 = v12;
  uint64_t v37 = [v36 bytes];
  id v35 = v18;
  uint64_t v19 = (char *)[v35 mutableBytes];
  uint64_t v20 = v19;
  if (v17) {
    bzero(v19, 4 * v16 * v15 * a7);
  }
  if ([v39 count])
  {
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 4 * v15;
    do
    {
      if (v21 >= [v13 count] || v21 >= objc_msgSend(v38, "count")) {
        break;
      }
      uint64_t v24 = [v13 objectAtIndex:v21];
      unint64_t v25 = [v24 unsignedIntegerValue];

      if (a7 >= v25) {
        unint64_t v26 = v25;
      }
      else {
        unint64_t v26 = a7;
      }
      if (v26)
      {
        uint64_t v27 = 0;
        unint64_t v28 = (int *)(v37 + v23 * v22);
        uint64_t v29 = v20;
        do
        {
          uint64_t v30 = v29;
          unint64_t v31 = v28;
          for (uint64_t i = v15; i; --i)
          {
            int v33 = *v31++;
            _DWORD *v30 = v33;
            v30 += a7;
          }
          ++v27;
          unint64_t v28 = (int *)((char *)v28 + v23);
          ++v29;
        }
        while (v27 != v26);
      }
      v22 += v25;
      ++v21;
      v20 += 4 * v15 * a7;
    }
    while (v21 < [v39 count]);
  }

  return v35;
}

- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5
{
  id v7 = a3;
  if (![(NLContextualEmbedding *)self isLoaded]) {
    [(NLContextualEmbedding *)self load];
  }
  if (![(NLContextualEmbedding *)self isLoaded])
  {
    id v9 = 0;
    goto LABEL_27;
  }
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!self->_isE5Enabled) {
    goto LABEL_14;
  }
  if (self->_adapterIdentifier)
  {
    if (!-[NLE5Embedding isAdapterLoaded:](self->_embeddingE5, "isAdapterLoaded:"))
    {
      [(NLE5Embedding *)self->_embeddingE5 loadAdapter:self->_adapterIdentifier];
      goto LABEL_12;
    }
    if (self->_adapterIdentifier) {
      goto LABEL_12;
    }
  }
  if (![(NLE5Embedding *)self->_embeddingE5 isBackboneLoaded]) {
    [(NLE5Embedding *)self->_embeddingE5 loadBackbone];
  }
LABEL_12:
  if (!self->_isE5Enabled)
  {
LABEL_14:
    uint64_t v10 = NLStringEmbeddingCopyDataForTokenizedBatch();
    goto LABEL_15;
  }
  uint64_t v10 = [(NLE5Embedding *)self->_embeddingE5 embeddingDataForTokenizedBatch:v7 withOutputProperties:v8];
LABEL_15:
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    id v12 = [v8 objectForKey:*MEMORY[0x1E4F5C8F0]];
    id v13 = [v8 objectForKey:*MEMORY[0x1E4F5C8E8]];
    if (v12
      && ((uint64_t v14 = [v12 count], v14 == objc_msgSend(v7, "count")) ? (v15 = v13 == 0) : (v15 = 1),
          !v15 && (uint64_t v16 = [v13 count], v16 == objc_msgSend(v7, "count"))))
    {
      id v9 = [(NLContextualEmbedding *)self _paddedEmbeddingDataForInputEmbeddingData:v11 tokenizedSentences:v7 batchComponentsCountArray:v12 batchComponentRangesArray:v13 maxTokens:a5];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

LABEL_27:

  return v9;
}

- (void)requestEmbeddingResultForString:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  if (!v9) {
    id v9 = @"und";
  }
  uint64_t v11 = +[NLXPCEmbeddingServerClient sharedClient];
  id v12 = [(NLContextualEmbedding *)self identifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__NLContextualEmbedding_requestEmbeddingResultForString_language_completionHandler___block_invoke;
  v16[3] = &unk_1E5C54480;
  id v17 = v8;
  uint64_t v18 = v9;
  uint64_t v19 = self;
  id v20 = v10;
  id v13 = v10;
  uint64_t v14 = v9;
  id v15 = v8;
  [v11 dataFromTokenVectorEmbeddingForString:v15 language:v14 identifier:v12 completionHandler:v16];
}

void __84__NLContextualEmbedding_requestEmbeddingResultForString_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    uint64_t v11 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:]([NLContextualEmbeddingResult alloc], "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", *(void *)(a1 + 32), v8, v7, *(void *)(a1 + 40), [*(id *)(a1 + 48) dimension]);
  }
  else
  {
    if (!v9)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"Failed to obtain result from embedding model";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = [v12 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v13];
    }
    uint64_t v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (unint64_t)maximumBatchSize
{
  return 64;
}

- (void)requestBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  unint64_t v11 = [v8 count];
  if (v11 <= [(NLContextualEmbedding *)self maximumBatchSize])
  {
    if (!v9) {
      id v9 = @"und";
    }
    id v15 = +[NLXPCEmbeddingServerClient sharedClient];
    uint64_t v16 = [(NLContextualEmbedding *)self identifier];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__NLContextualEmbedding_requestBatchEmbeddingResultsForStrings_language_completionHandler___block_invoke;
    v17[3] = &unk_1E5C544A8;
    id v18 = v8;
    id v9 = v9;
    uint64_t v19 = v9;
    id v20 = self;
    id v21 = v10;
    [v15 batchDataFromTokenVectorEmbeddingForStrings:v18 language:v9 identifier:v16 completionHandler:v17];

    uint64_t v14 = v18;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Maximum batch size exceeded";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v14 = [v12 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v13];

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __91__NLContextualEmbedding_requestBatchEmbeddingResultsForStrings_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7
    && v8
    && (uint64_t v10 = [*(id *)(a1 + 32) count], v10 == objc_msgSend(v7, "count"))
    && (uint64_t v11 = [v7 count], v11 == objc_msgSend(v8, "count")))
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    if ([v7 count])
    {
      id v21 = v9;
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [NLContextualEmbeddingResult alloc];
        id v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v13];
        uint64_t v16 = [v8 objectAtIndexedSubscript:v13];
        id v17 = [v7 objectAtIndexedSubscript:v13];
        id v18 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:](v14, "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", v15, v16, v17, *(void *)(a1 + 40), [*(id *)(a1 + 48) dimension]);

        [v12 addObject:v18];
        ++v13;
      }
      while (v13 < [v7 count]);
      id v9 = v21;
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"Failed to obtain result from embedding model";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v9 = [v19 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v20];
    }
    id v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)requestBackgroundEmbeddingResultForString:(id)a3 language:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  unint64_t v32 = __Block_byref_object_copy__2;
  int v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__2;
  uint64_t v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  if (!v9) {
    id v9 = @"und";
  }
  uint64_t v10 = +[NLXPCEmbeddingServerClient sharedClient];
  uint64_t v11 = [(NLContextualEmbedding *)self identifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__NLContextualEmbedding_requestBackgroundEmbeddingResultForString_language_error___block_invoke;
  v17[3] = &unk_1E5C544D0;
  id v21 = &v29;
  id v12 = v8;
  id v18 = v12;
  unint64_t v13 = v9;
  uint64_t v19 = v13;
  id v20 = self;
  uint64_t v22 = &v23;
  [v10 synchronousDataFromTokenVectorEmbeddingForString:v12 language:v13 identifier:v11 completionHandler:v17];

  uint64_t v14 = (void *)v30[5];
  if (a5 && !v14)
  {
    *a5 = (id) v24[5];
    uint64_t v14 = (void *)v30[5];
  }
  id v15 = v14;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __82__NLContextualEmbedding_requestBackgroundEmbeddingResultForString_language_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7 && v8)
  {
    uint64_t v11 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:]([NLContextualEmbeddingResult alloc], "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", *(void *)(a1 + 32), v8, v7, *(void *)(a1 + 40), [*(id *)(a1 + 48) dimension]);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Failed to obtain result from embedding model";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

- (id)requestBackgroundBatchEmbeddingResultsForStrings:(id)a3 language:(id)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__2;
  id v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  id v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  unint64_t v10 = [v8 count];
  if (v10 <= [(NLContextualEmbedding *)self maximumBatchSize])
  {
    if (!v9) {
      id v9 = @"und";
    }
    uint64_t v14 = +[NLXPCEmbeddingServerClient sharedClient];
    id v15 = [(NLContextualEmbedding *)self identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__NLContextualEmbedding_requestBackgroundBatchEmbeddingResultsForStrings_language_error___block_invoke;
    v18[3] = &unk_1E5C544F8;
    id v19 = v8;
    uint64_t v22 = &v30;
    id v9 = v9;
    id v20 = v9;
    id v21 = self;
    uint64_t v23 = &v24;
    [v14 synchronousBatchDataFromTokenVectorEmbeddingForStrings:v19 language:v9 identifier:v15 completionHandler:v18];

    uint64_t v16 = (void *)v31[5];
    if (a5 && !v16)
    {
      *a5 = (id) v25[5];
      uint64_t v16 = (void *)v31[5];
    }
    id v13 = v16;

    uint64_t v12 = v19;
    goto LABEL_10;
  }
  if (a5)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37[0] = @"Maximum batch size exceeded";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [v11 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v12];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  id v13 = 0;
LABEL_11:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return v13;
}

void __89__NLContextualEmbedding_requestBackgroundBatchEmbeddingResultsForStrings_language_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7
    && v8
    && (uint64_t v10 = [*(id *)(a1 + 32) count], v10 == objc_msgSend(v7, "count"))
    && (uint64_t v11 = [v7 count], v11 == objc_msgSend(v8, "count")))
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if ([v7 count])
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = [NLContextualEmbeddingResult alloc];
        uint64_t v17 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v15];
        id v18 = [v8 objectAtIndexedSubscript:v15];
        id v19 = [v7 objectAtIndexedSubscript:v15];
        id v20 = -[NLContextualEmbeddingResult initWithString:tokenDictionaries:data:language:tokenVectorDimension:](v16, "initWithString:tokenDictionaries:data:language:tokenVectorDimension:", v17, v18, v19, *(void *)(a1 + 40), [*(id *)(a1 + 48) dimension]);

        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v20];
        ++v15;
      }
      while (v15 < [v7 count]);
    }
  }
  else if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Failed to obtain result from embedding model";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v23 = [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

- (BOOL)requestBackgroundModelLoadingWithWithError:(id *)a3
{
  return [(NLContextualEmbedding *)self requestBackgroundModelLoadingWithTimeout:a3 error:0.0];
}

- (BOOL)requestBackgroundModelLoadingWithTimeout:(double)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  id v7 = +[NLXPCEmbeddingServerClient sharedClient];
  id v8 = [(NLContextualEmbedding *)self identifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__NLContextualEmbedding_requestBackgroundModelLoadingWithTimeout_error___block_invoke;
  v17[3] = &unk_1E5C54520;
  void v17[4] = &v24;
  v17[5] = &v18;
  [v7 synchronousLoadModelWithIdentifier:v8 timeout:v17 completionHandler:a3];

  int v9 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((unsigned char *)v25 + 24))
  {
    uint64_t v10 = (void *)v19[5];
    if (!v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"Failed to load embedding model";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v13 = [v11 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v12];
      uint64_t v14 = (void *)v19[5];
      v19[5] = v13;

      uint64_t v10 = (void *)v19[5];
    }
    *a4 = v10;
    int v9 = *((unsigned __int8 *)v25 + 24);
  }
  BOOL v15 = v9 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __72__NLContextualEmbedding_requestBackgroundModelLoadingWithTimeout_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)requestModelLoadingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NLXPCEmbeddingServerClient sharedClient];
  id v6 = [(NLContextualEmbedding *)self identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NLContextualEmbedding_requestModelLoadingWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5C53950;
  id v9 = v4;
  id v7 = v4;
  [v5 loadModelWithIdentifier:v6 completionHandler:v8];
}

void __66__NLContextualEmbedding_requestModelLoadingWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to load embedding model";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v5 = [v6 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_getSentenceEmbeddingForString:(id)a3 error:(id *)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  id v6 = [(NLE5Embedding *)self->_embeddingE5 embeddingDataForString:a3 sequenceSize:&v30 error:a4];
  if (v6)
  {
    unint64_t v7 = [(NLE5Embedding *)self->_embeddingE5 dimension];
    id v8 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    v32[0] = &unk_1EFB3A988;
    v32[1] = &unk_1EFB3A988;
    unint64_t v9 = 0x1E4F28000uLL;
    unint64_t v29 = v7;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
    void v32[2] = v10;
    unint64_t v11 = 0x1E4F1C000uLL;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
    uint64_t v13 = (void *)[v8 initWithShape:v12 dataType:65568 error:a4];

    if (v13)
    {
      uint64_t v26 = self;
      char v27 = a4;
      uint64_t v28 = v6;
      uint64_t v14 = [v6 bytes];
      if (v7)
      {
        uint64_t v16 = v14;
        uint64_t v17 = 0;
        uint64_t v18 = 4 * v7;
        do
        {
          LODWORD(v15) = *(_DWORD *)(v16 + v18 * (v30 - 1) + 4 * v17);
          id v19 = objc_msgSend(*(id *)(v9 + 3792), "numberWithFloat:", v15, v26, v27);
          v31[0] = &unk_1EFB3A9A0;
          v31[1] = &unk_1EFB3A9A0;
          uint64_t v20 = [*(id *)(v9 + 3792) numberWithUnsignedInteger:v17];
          void v31[2] = v20;
          [*(id *)(v11 + 2424) arrayWithObjects:v31 count:3];
          unint64_t v21 = v9;
          v23 = unint64_t v22 = v11;
          [v13 setObject:v19 forKeyedSubscript:v23];

          unint64_t v11 = v22;
          unint64_t v9 = v21;

          ++v17;
        }
        while (v29 != v17);
      }
      uint64_t v24 = -[NLSentenceEmbeddingHead getSentenceEmbeddingFromPooledTokenEmbeddings:error:](v26->_sentenceEmbeddingHead, "getSentenceEmbeddingFromPooledTokenEmbeddings:error:", v13, v27, v26, v27);
      id v6 = v28;
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)sentenceEmbeddingVectorForString:(id)a3 language:(id)a4 error:(id *)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = 0;
  BOOL v8 = [(NLContextualEmbedding *)self loadSentenceEmbeddingWithError:&v20];
  id v9 = v20;
  id v10 = v9;
  if (v8)
  {
    id v19 = v9;
    unint64_t v11 = [(NLContextualEmbedding *)self _getSentenceEmbeddingForString:v7 error:&v19];
    id v18 = v19;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NLSentenceEmbeddingHead outputDimension](self->_sentenceEmbeddingHead, "outputDimension"));
    if ([(NLSentenceEmbeddingHead *)self->_sentenceEmbeddingHead outputDimension])
    {
      unint64_t v13 = 0;
      do
      {
        v21[0] = &unk_1EFB3A9A0;
        v21[1] = &unk_1EFB3A9A0;
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v13, v18);
        v21[2] = v14;
        double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
        uint64_t v16 = [v11 objectForKeyedSubscript:v15];
        [v12 addObject:v16];

        ++v13;
      }
      while (v13 < [(NLSentenceEmbeddingHead *)self->_sentenceEmbeddingHead outputDimension]);
    }

    id v10 = v18;
  }
  else if (a5)
  {
    id v10 = v9;
    uint64_t v12 = 0;
    *a5 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)sentenceEmbeddingVectorDataForString:(id)a3 language:(id)a4 error:(id *)a5
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = 0;
  BOOL v8 = [(NLContextualEmbedding *)self loadSentenceEmbeddingWithError:&v23];
  id v9 = v23;
  id v10 = v9;
  if (v8)
  {
    unint64_t v11 = [MEMORY[0x1E4F1CA58] data];
    id v22 = v10;
    uint64_t v12 = [(NLContextualEmbedding *)self _getSentenceEmbeddingForString:v7 error:&v22];
    id v20 = v22;

    if ([(NLSentenceEmbeddingHead *)self->_sentenceEmbeddingHead outputDimension])
    {
      unint64_t v13 = 0;
      do
      {
        int v21 = 0;
        v24[0] = &unk_1EFB3A9A0;
        v24[1] = &unk_1EFB3A9A0;
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
        v24[2] = v14;
        double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
        uint64_t v16 = [v12 objectForKeyedSubscript:v15];
        [v16 floatValue];
        int v18 = v17;

        int v21 = v18;
        [v11 appendBytes:&v21 length:4];
        ++v13;
      }
      while (v13 < [(NLSentenceEmbeddingHead *)self->_sentenceEmbeddingHead outputDimension]);
    }

    id v10 = v20;
  }
  else if (a5)
  {
    id v10 = v9;
    unint64_t v11 = 0;
    *a5 = v10;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)requestSentenceEmbeddingVectorForString:(id)a3 language:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = +[NLXPCEmbeddingServerClient sharedClient];
  uint64_t v12 = [(NLContextualEmbedding *)self identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__NLContextualEmbedding_requestSentenceEmbeddingVectorForString_language_completionHandler___block_invoke;
  v14[3] = &unk_1E5C53928;
  id v15 = v8;
  id v13 = v8;
  [v11 dataFromSentenceVectorEmbeddingForString:v10 language:v9 identifier:v12 completionHandler:v14];
}

void __92__NLContextualEmbedding_requestSentenceEmbeddingVectorForString_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v9 = [v5 length];
    uint64_t v10 = [v5 bytes];
    if (v9 >= 4)
    {
      uint64_t v12 = (int *)v10;
      unint64_t v13 = v9 >> 2;
      do
      {
        int v14 = *v12++;
        LODWORD(v11) = v14;
        id v15 = [NSNumber numberWithFloat:v11];
        [v8 addObject:v15];

        --v13;
      }
      while (v13);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"Failed to obtain result from embedding model";
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v7 = [v16 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v17];
    }
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)subRangesWithinToken:(id)a3 offset:(unint64_t)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (self->_isE5Enabled)
  {
    uint64_t v7 = [(NLE5Embedding *)self->_embeddingE5 tokenIDsForText:v5];
  }
  else
  {
    uint64_t v7 = NLStringEmbeddingCopyTokenIDsForText();
  }
  id v8 = (void *)v7;
  if (subRangesWithinToken_offset__onceToken != -1) {
    dispatch_once(&subRangesWithinToken_offset__onceToken, &__block_literal_global_204);
  }
  if ([v8 count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      double v11 = [v8 objectAtIndex:v9];
      uint64_t v12 = v11;
      if (v9 || ([v11 isEqual:&unk_1EFB3A988] & 1) == 0)
      {
        if (self->_isE5Enabled)
        {
          embeddingE5 = self->_embeddingE5;
          v23[0] = v12;
          int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
          id v15 = [(NLE5Embedding *)embeddingE5 textForTokenIDs:v14];
          uint64_t v16 = [v15 stringByTrimmingCharactersInSet:subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet];
        }
        else
        {
          id v22 = v12;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          int v14 = (void *)NLStringEmbeddingCopyTextForTokenIDs();
          uint64_t v16 = [v14 stringByTrimmingCharactersInSet:subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet];
        }

        uint64_t v17 = [v16 length];
        uint64_t v18 = v17 + v10;
        if (v17 + v10 > (unint64_t)[v5 length])
        {
          uint64_t v18 = [v5 length];
          uint64_t v17 = v18 - v10;
        }
        id v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10 + a4, v17);
        [v6 addObject:v19];

        uint64_t v10 = v18;
      }

      ++v9;
    }
    while (v9 < [v8 count]);
  }

  return v6;
}

uint64_t __53__NLContextualEmbedding_subRangesWithinToken_offset___block_invoke()
{
  subRangesWithinToken_offset__whitespaceAndNewlineCharacterSet = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return MEMORY[0x1F41817F8]();
}

- (id)tokenDictionariesForString:(id)a3 tokens:(id)a4 tokenRanges:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 count])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, 0);
    v28[0] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

    if ([v11 count])
    {
      v26[0] = @"TokenRange";
      uint64_t v12 = [v11 firstObject];
      v26[1] = @"SubtokenRanges";
      v27[0] = v12;
      v27[1] = v11;
      unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      [v9 addObject:v13];
    }
  }
  if ([v7 count])
  {
    unint64_t v14 = 0;
    do
    {
      if (v14 >= [v8 count]) {
        break;
      }
      id v15 = [v7 objectAtIndex:v14];
      uint64_t v16 = [v8 objectAtIndex:v14];
      uint64_t v17 = [v16 rangeValue];
      uint64_t v19 = v18;

      id v20 = [(NLContextualEmbedding *)self subRangesWithinToken:v15 offset:v17];
      int v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17, v19, @"TokenRange");
      v24[1] = @"SubtokenRanges";
      v25[0] = v21;
      v25[1] = v20;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      [v9 addObject:v22];

      ++v14;
    }
    while (v14 < [v7 count]);
  }

  return v9;
}

- (BOOL)enumerateTokensForString:(id)a3 language:(id)a4 inRange:(_NSRange)a5 error:(id *)a6 usingBlock:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  uint64_t v37 = (__CFString *)a4;
  uint64_t v42 = (void (**)(id, unint64_t, uint64_t, unsigned char *))a7;
  BOOL isE5Enabled = self->_isE5Enabled;
  if (!isE5Enabled) {
    goto LABEL_5;
  }
  if (!self->_embeddingE5)
  {
    if (![(NLContextualEmbedding *)self loadWithError:a6]) {
      goto LABEL_30;
    }
    BOOL isE5Enabled = self->_isE5Enabled;
LABEL_5:
    if (isE5Enabled || self->_embedding || [(NLContextualEmbedding *)self loadWithError:a6]) {
      goto LABEL_8;
    }
LABEL_30:
    BOOL v32 = 0;
    goto LABEL_31;
  }
LABEL_8:
  unint64_t v14 = v37;
  if (!v37) {
    unint64_t v14 = @"und";
  }
  uint64_t v37 = v14;
  uint64_t v15 = [(NLContextualEmbedding *)self _tokenRangesForString:v36 language:v14];
  id v34 = [(NLContextualEmbedding *)self _tokensForString:v36 tokenRanges:v15];
  id v35 = (void *)v15;
  -[NLContextualEmbedding tokenDictionariesForString:tokens:tokenRanges:](self, "tokenDictionariesForString:tokens:tokenRanges:", v36);
  unsigned __int8 v51 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v48;
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v48 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v41 = v16;
      uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * v16);
      uint64_t v18 = [v17 objectForKey:@"TokenRange"];
      unint64_t v19 = [v18 rangeValue];
      uint64_t v21 = v20;

      id v22 = [v17 objectForKey:@"SubtokenRanges"];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v44;
LABEL_17:
        uint64_t v27 = 0;
        while (1)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          unint64_t v28 = [*(id *)(*((void *)&v43 + 1) + 8 * v27) rangeValue];
          uint64_t v30 = v29;
          if (rangesMatch(location, length, v19, v21)
            && rangesMatch(location, length, v28, v30))
          {
            v42[2](v42, v28, v30, &v51);
          }
          if (v51) {
            break;
          }
          if (v25 == ++v27)
          {
            uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v25) {
              goto LABEL_17;
            }
            break;
          }
        }
      }

      int v31 = v51;
      if (v31) {
        break;
      }
      uint64_t v16 = v41 + 1;
      if (v41 + 1 == v40)
      {
        uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v40) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  BOOL v32 = 1;
LABEL_31:

  return v32;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (id)adapterIdentifier
{
  return self->_adapterIdentifier;
}

- (NSUInteger)dimension
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Dimension"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    NSUInteger v3 = [v2 unsignedIntegerValue];
  }
  else {
    NSUInteger v3 = 0;
  }

  return v3;
}

- (NSUInteger)maximumSequenceLength
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"MaximumSequenceLength"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    NSUInteger v3 = [v2 unsignedIntegerValue];
  }
  else {
    NSUInteger v3 = 0;
  }

  return v3;
}

- (unint64_t)sentenceVectorDimension
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"SentenceEmbeddingDimension"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)tokenVectorDimension
{
  if (![(NLContextualEmbedding *)self isLoaded]) {
    [(NLContextualEmbedding *)self load];
  }
  if (![(NLContextualEmbedding *)self isLoaded]) {
    return 0;
  }
  if (self->_isE5Enabled)
  {
    embeddingE5 = self->_embeddingE5;
    return [(NLE5Embedding *)embeddingE5 dimension];
  }
  else
  {
    return NLStringEmbeddingGetDimension();
  }
}

- (NSArray)languages
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Languages"];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v3 = v2;
    }
  }
  id v4 = v3;

  return v4;
}

- (NSArray)scripts
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Scripts"];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v3 = v2;
    }
  }
  id v4 = v3;

  return v4;
}

- (id)adapters
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Adapters"];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v3 = v2;
    }
  }
  id v4 = v3;

  return v4;
}

- (NSUInteger)revision
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Revision"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    NSUInteger v3 = [v2 unsignedIntegerValue];
  }
  else {
    NSUInteger v3 = 0;
  }

  return v3;
}

- (unint64_t)modelSystemVersion
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"NLModelSystemVersion"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)assetLocaleIdentifier
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"AssetLocale"];
  unint64_t v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (id)assetLocale
{
  id v2 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)bundleName
{
  id v2 = [(NSDictionary *)self->_catalogEntry objectForKey:@"BundleName"];
  unint64_t v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasAvailableAssets
{
  unint64_t v3 = [(NLContextualEmbedding *)self bundlePath];

  if (v3) {
    return ![(NLContextualEmbedding *)self requiresCompilation];
  }
  else {
    return 0;
  }
}

- (BOOL)isE5Enabled
{
  return self->_isE5Enabled;
}

- (BOOL)useANE
{
  return self->_useANE;
}

- (BOOL)compileWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->_isE5Enabled && !self->_embeddingE5)
  {
    id v6 = [(NLContextualEmbedding *)self bundlePath];
    if (v6)
    {
      id v7 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Adapters"];
      id v8 = objc_opt_class();
      unint64_t v9 = [v6 stringByAppendingPathComponent:@"embeddings.mil"];
      char v4 = [v8 compileEmbeddingModelWithModelPath:v9 useANE:self->_useANE adapters:v7];

      if (a3 && (v4 & 1) == 0)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28568];
        uint64_t v15 = @"E5 model compilation failed";
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        *a3 = [v10 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v11];
      }
    }
    else
    {
      if (!a3)
      {
        char v4 = 0;
        goto LABEL_11;
      }
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = @"Failed to locate embedding model";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      [v12 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v7];
      char v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
    return v4;
  }
  return 1;
}

- (int64_t)getCompilationState
{
  if (!self->_isE5Enabled || self->_embeddingE5) {
    return 1;
  }
  char v4 = [(NLContextualEmbedding *)self bundlePath];
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(NSDictionary *)self->_catalogEntry objectForKey:@"Adapters"];
  id v6 = objc_opt_class();
  id v7 = [v4 stringByAppendingPathComponent:@"embeddings.mil"];
  BOOL useANE = self->_useANE;
  uint64_t v11 = 0;
  int v9 = [v6 isCompiledEmbeddingModelWithModelPath:v7 useANE:useANE adapters:v5 error:&v11];
  uint64_t v10 = v11;

  if (v10)
  {
LABEL_7:

    return 2;
  }

  return v9 != 0;
}

- (BOOL)requiresCompilation
{
  unint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  char v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.naturallanguaged"];

  if ((v5 & 1) != 0 || [(NLContextualEmbedding *)self getCompilationState] == 1) {
    return 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__NLContextualEmbedding_requiresCompilation__block_invoke;
  v7[3] = &unk_1E5C54548;
  v7[4] = self;
  [(NLContextualEmbedding *)self requestModelCompilationWithCompletionHandler:v7];
  return 1;
}

void __44__NLContextualEmbedding_requiresCompilation__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  char v5 = [*(id *)(a1 + 32) assetLocaleIdentifier];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  int v9 = (void *)v8;
  if (a2) {
    NSLog(&cfstr_CompilationOfM.isa, v5, v6, v8);
  }
  else {
    NSLog(&cfstr_CompilationOfM_0.isa, v5, v6, v10, v8);
  }
}

- (void)requestModelCompilationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = +[NLXPCEmbeddingServerClient sharedClient];
  id v6 = [(NLContextualEmbedding *)self identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__NLContextualEmbedding_requestModelCompilationWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5C53950;
  id v9 = v4;
  id v7 = v4;
  [v5 compileModelWithIdentifier:v6 completionHandler:v8];
}

void __70__NLContextualEmbedding_requestModelCompilationWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to compile embedding model";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v5 = [v6 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAssetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NLContextualEmbedding_requestAssetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C54570;
  id v8 = v4;
  id v6 = v4;
  +[NLTagger requestAssetsForLanguage:v5 tagScheme:@"ContextualEmbedding" completionHandler:v7];
}

uint64_t __60__NLContextualEmbedding_requestAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestEmbeddingAssetsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = [(NLContextualEmbedding *)self assetLocaleIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__NLContextualEmbedding_requestEmbeddingAssetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C54570;
  id v8 = v4;
  id v6 = v4;
  +[NLTagger requestAssetsForLanguage:v5 tagScheme:@"ContextualEmbedding" completionHandler:v7];
}

uint64_t __69__NLContextualEmbedding_requestEmbeddingAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingHead, 0);
  objc_storeStrong((id *)&self->_embeddingE5, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_catalogEntry, 0);
  objc_storeStrong((id *)&self->_adapterIdentifier, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end