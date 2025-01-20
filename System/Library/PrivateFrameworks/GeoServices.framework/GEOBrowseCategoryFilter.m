@interface GEOBrowseCategoryFilter
- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
- (GEOBrowseCategoryFilter)init;
- (GEOBrowseCategoryFilter)initWithCategory:(id)a3;
@end

@implementation GEOBrowseCategoryFilter

- (GEOBrowseCategoryFilter)init
{
  result = (GEOBrowseCategoryFilter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOBrowseCategoryFilter)initWithCategory:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOBrowseCategoryFilter;
  v6 = [(GEOBrowseCategoryFilter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 requestType] == 3)
  {
    v6 = [v5 allEntriesWithBrowse];
    v7 = [(GEOSearchCategory *)self->_category _suggestionEntryMetadata];
    [v6 setCategorySuggestionEntryMetadata:v7];

    v8 = [(GEOSearchCategory *)self->_category _autocompleteEntry];
    [v6 setCategorySuggestionEntry:v8];
  }
  else
  {
    v9 = GEOGetPlaceRequestLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v5 requestType];
      if (v10 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E4DC8[(int)v10];
      }
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Filtering based on a Nearby category is not supported for %{public}@ requests", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
    }
  }

  return 1;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (-[GEOPDSearchParameters searchType]((uint64_t)v5) != 2)
  {
    v6 = [(GEOSearchCategory *)self->_category _suggestionEntryMetadata];
    -[GEOPDSearchParameters setSuggestionEntryMetadata:]((uint64_t)v5, v6);

    v7 = [(GEOSearchCategory *)self->_category _autocompleteEntry];
    -[GEOPDSearchParameters setSuggestionEntry:]((uint64_t)v5, v7);
  }
  return 1;
}

- (void).cxx_destruct
{
}

@end