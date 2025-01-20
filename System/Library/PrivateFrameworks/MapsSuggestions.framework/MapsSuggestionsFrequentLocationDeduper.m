@interface MapsSuggestionsFrequentLocationDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsFrequentLocationDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (MapsSuggestionsEntriesAreBothOfType(4, v6, v5)
    && ([v5 uniqueIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 uniqueIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    BOOL v10 = 1;
    [v5 mergeFromSuggestionEntry:v6 behavior:1];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end