@interface NSComparisonPredicate(EDSearchableIndexQueryTransformer)
- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:;
@end

@implementation NSComparisonPredicate(EDSearchableIndexQueryTransformer)

- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(a1, "ed_hasOnlySpotlightKeypaths"))
  {
    id v8 = +[EDSearchableIndexQueryTransformer transformSearchableIndexPredicate:a1 suggestion:v6 searchableIndexManager:v7];
  }
  else
  {
    id v8 = a1;
  }
  v9 = v8;

  return v9;
}

@end