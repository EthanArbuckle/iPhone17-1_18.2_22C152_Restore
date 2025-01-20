@interface NSPredicate(EDSearchableIndexQueryTransformer)
- (void)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:;
@end

@implementation NSPredicate(EDSearchableIndexQueryTransformer)

- (void)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:
{
  id v7 = a3;
  id v8 = a4;
  [a1 doesNotRecognizeSelector:a2];
  __assert_rtn("-[NSPredicate(EDSearchableIndexQueryTransformer) ed_transformSearchableIndexPredicateWithSuggestion:searchableIndexManager:]", "EDSearchableIndexQueryTransformer.m", 36, "0");
}

@end