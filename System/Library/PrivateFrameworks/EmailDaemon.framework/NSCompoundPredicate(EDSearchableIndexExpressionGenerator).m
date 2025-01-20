@interface NSCompoundPredicate(EDSearchableIndexExpressionGenerator)
- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:;
- (uint64_t)ed_hasOnlySpotlightKeypaths;
@end

@implementation NSCompoundPredicate(EDSearchableIndexExpressionGenerator)

- (uint64_t)ed_hasOnlySpotlightKeypaths
{
  v1 = [a1 subpredicates];
  uint64_t v2 = objc_msgSend(v1, "ef_all:", &__block_literal_global_9);

  return v2;
}

- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:
{
  v7 = [a1 subpredicates];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __134__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_searchableIndexQueryStringForQueryWithSuggestion_originalSearchString___block_invoke;
  v11[3] = &__block_descriptor_41_e31___NSString_16__0__NSPredicate_8l;
  char v12 = a3;
  v11[4] = a4;
  v8 = objc_msgSend(v7, "ef_compactMap:", v11);

  v9 = +[EDSearchableIndexExpressionGenerator queryStringByJoiningQueries:withPredicateType:](EDSearchableIndexExpressionGenerator, "queryStringByJoiningQueries:withPredicateType:", v8, [a1 compoundPredicateType]);

  return v9;
}

@end