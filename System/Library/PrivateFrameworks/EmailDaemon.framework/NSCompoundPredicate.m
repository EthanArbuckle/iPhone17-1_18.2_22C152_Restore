@interface NSCompoundPredicate
@end

@implementation NSCompoundPredicate

uint64_t __88__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_hasOnlySpotlightKeypaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ed_hasOnlySpotlightKeypaths");
}

id __134__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_searchableIndexQueryStringForQueryWithSuggestion_originalSearchString___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ed_searchableIndexQueryStringForQueryWithSuggestion:originalSearchString:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));

  return v2;
}

id __132__NSCompoundPredicate_EDSearchableIndexQueryTransformer__ed_transformSearchableIndexPredicateWithSuggestion_searchableIndexManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ed_transformSearchableIndexPredicateWithSuggestion:searchableIndexManager:", *(void *)(a1 + 32), *(void *)(a1 + 40));

  return v2;
}

@end