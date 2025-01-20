@interface NSComparisonPredicate(EDSearchableIndexExpressionGenerator)
- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:;
- (uint64_t)ed_hasOnlySpotlightKeypaths;
@end

@implementation NSComparisonPredicate(EDSearchableIndexExpressionGenerator)

- (uint64_t)ed_hasOnlySpotlightKeypaths
{
  if (ed_hasOnlySpotlightKeypaths_onceToken != -1) {
    dispatch_once(&ed_hasOnlySpotlightKeypaths_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)ed_hasOnlySpotlightKeypaths_spotlightKeyPaths;
  v3 = [a1 leftExpression];
  v4 = [v3 keyPath];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:
{
  v7 = [a1 leftExpression];
  v8 = [v7 keyPath];

  v9 = [a1 rightExpression];
  v10 = [v9 constantValue];

  if ([v8 isEqualToString:*MEMORY[0x1E4F5FF70]])
  {
    objc_storeStrong(a4, v10);
    v11 = 0;
  }
  else
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F5FF38]])
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[EDSearchableIndexExpressionGenerator searchableIndexQueryStringForComparisionPredicate:a1 hasSuggestion:a3];
    }
    v11 = v12;
  }

  return v11;
}

@end