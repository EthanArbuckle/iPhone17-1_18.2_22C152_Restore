@interface _CNAutocompleteNonCachingSearchProvider
- (id)calendarServerSearch;
- (id)directoryServerSearch;
- (id)localExtensionSearches;
- (id)localSearch;
- (id)predictionSearch;
- (id)recentsSearch;
- (id)stewieSearch;
- (id)suggestionsSearch;
@end

@implementation _CNAutocompleteNonCachingSearchProvider

- (id)localSearch
{
  v2 = objc_alloc_init(CNAutocompleteLocalSearch);
  return v2;
}

- (id)recentsSearch
{
  v2 = objc_alloc_init(CNAutocompleteRecentsSearch);
  return v2;
}

- (id)stewieSearch
{
  v2 = objc_alloc_init(CNAutocompleteStewieSearch);
  return v2;
}

- (id)suggestionsSearch
{
  v2 = objc_alloc_init(CNAutocompleteSuggestionsSearch);
  return v2;
}

- (id)predictionSearch
{
  v2 = objc_alloc_init(CNAutocompletePredictionSearch);
  return v2;
}

- (id)localExtensionSearches
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(CNAutocompleteLocalExtensionSearch);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)directoryServerSearch
{
  v2 = objc_alloc_init(CNAutocompleteDirectoryServerSearch);
  return v2;
}

- (id)calendarServerSearch
{
  v2 = objc_alloc_init(CNAutocompleteCalendarServerSearch);
  return v2;
}

@end