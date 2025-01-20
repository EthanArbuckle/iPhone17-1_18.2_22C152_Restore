@interface CSTopHitQueryContext
+ (id)topHitQueryContext;
+ (id)topHitQueryContextWithCurrentSuggestion:(id)a3;
- (int64_t)maxItemCount;
- (void)setMaxItemCount:(int64_t)a3;
@end

@implementation CSTopHitQueryContext

+ (id)topHitQueryContext
{
  v2 = objc_alloc_init(CSTopHitQueryContext);
  [(CSSearchQueryContext *)v2 setLowPriority:0];
  [(CSSearchQueryContext *)v2 setRankingType:1];
  [(CSTopHitQueryContext *)v2 setMaxItemCount:0];
  [(CSUserQueryContext *)v2 setMaxResultCount:0];
  [(CSSearchQueryContext *)v2 setMaxSuggestionCount:0];
  [(CSSearchQueryContext *)v2 setGenerateSuggestions:0];
  [(CSSearchQueryContext *)v2 setEnableSuggestionTokens:0];

  return v2;
}

+ (id)topHitQueryContextWithCurrentSuggestion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CSTopHitQueryContext);
  [(CSSearchQueryContext *)v4 setLowPriority:0];
  [(CSSearchQueryContext *)v4 setRankingType:1];
  [(CSTopHitQueryContext *)v4 setMaxItemCount:0];
  [(CSUserQueryContext *)v4 setMaxResultCount:0];
  [(CSSearchQueryContext *)v4 setMaxSuggestionCount:10];
  [(CSSearchQueryContext *)v4 setGenerateSuggestions:1];
  [(CSSearchQueryContext *)v4 setEnableSuggestionTokens:0];
  [(CSSearchQueryContext *)v4 setSuggestion:v3];

  return v4;
}

- (int64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxItemCount = a3;
}

@end