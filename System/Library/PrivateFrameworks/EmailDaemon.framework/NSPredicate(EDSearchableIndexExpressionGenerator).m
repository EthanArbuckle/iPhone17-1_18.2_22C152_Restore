@interface NSPredicate(EDSearchableIndexExpressionGenerator)
- (void)ed_hasOnlySpotlightKeypaths;
- (void)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:;
@end

@implementation NSPredicate(EDSearchableIndexExpressionGenerator)

- (void)ed_hasOnlySpotlightKeypaths
{
}

- (void)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:
{
}

@end