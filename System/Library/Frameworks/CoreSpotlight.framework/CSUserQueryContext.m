@interface CSUserQueryContext
+ (CSUserQueryContext)userQueryContext;
+ (CSUserQueryContext)userQueryContextWithCurrentSuggestion:(CSSuggestion *)currentSuggestion;
- (BOOL)enableRankedResults;
- (NSInteger)maxResultCount;
- (id)getParserOptions;
- (void)setEnableRankedResults:(BOOL)enableRankedResults;
- (void)setMaxResultCount:(NSInteger)maxResultCount;
- (void)updateWithOptions:(id)a3;
@end

@implementation CSUserQueryContext

+ (CSUserQueryContext)userQueryContext
{
  v2 = objc_alloc_init(CSUserQueryContext);
  [(CSSearchQueryContext *)v2 setGenerateSuggestions:0];
  [(CSSearchQueryContext *)v2 setEnableSuggestionTokens:0];
  [(CSUserQueryContext *)v2 setMaxResultCount:0];
  [(CSSearchQueryContext *)v2 setMaxRankedResultCount:100];
  [(CSSearchQueryContext *)v2 setMaxSuggestionCount:0];
  [(CSSearchQueryContext *)v2 setEmbeddingGenerationTimeout:-1];
  [(CSSearchQueryContext *)v2 setEmbeddingRelevanceThreshold:-3.40282347e38];

  return v2;
}

+ (CSUserQueryContext)userQueryContextWithCurrentSuggestion:(CSSuggestion *)currentSuggestion
{
  v3 = currentSuggestion;
  v4 = objc_alloc_init(CSUserQueryContext);
  [(CSSearchQueryContext *)v4 setGenerateSuggestions:1];
  [(CSSearchQueryContext *)v4 setEnableSuggestionTokens:0];
  [(CSUserQueryContext *)v4 setMaxResultCount:0];
  [(CSSearchQueryContext *)v4 setMaxRankedResultCount:100];
  [(CSSearchQueryContext *)v4 setMaxSuggestionCount:10];
  [(CSSearchQueryContext *)v4 setSuggestion:v3];

  [(CSSearchQueryContext *)v4 setEmbeddingGenerationTimeout:-1];
  [(CSSearchQueryContext *)v4 setEmbeddingRelevanceThreshold:-3.40282347e38];

  return v4;
}

- (id)getParserOptions
{
  return self->_queryParserOptions;
}

- (void)updateWithOptions:(id)a3
{
  self->_queryParserOptions = (NSDictionary *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)enableRankedResults
{
  return self->_enableRankedResults;
}

- (void)setEnableRankedResults:(BOOL)enableRankedResults
{
  self->_enableRankedResults = enableRankedResults;
}

- (NSInteger)maxResultCount
{
  return self->_maxResultCount;
}

- (void)setMaxResultCount:(NSInteger)maxResultCount
{
  self->_maxResultCount = maxResultCount;
}

- (void).cxx_destruct
{
}

@end