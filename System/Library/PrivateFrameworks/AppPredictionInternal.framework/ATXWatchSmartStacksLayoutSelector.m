@interface ATXWatchSmartStacksLayoutSelector
- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
@end

@implementation ATXWatchSmartStacksLayoutSelector

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  v4 = objc_msgSend(a4, "_pas_filteredArrayWithTest:", &__block_literal_global_206);
  v5 = objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v4, "count") != 0);

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F939C8]) initWithLayoutType:17 oneByOneSuggestions:0 oneByTwoSuggestions:v5 twoByTwoSuggestions:0 oneByFourSuggestions:0 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];
  return v6;
}

BOOL __88__ATXWatchSmartStacksLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 executableSpecification];
  uint64_t v4 = [v3 executableType];

  if (v4 == 3
    && ([v2 scoreSpecification],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 suggestedConfidenceCategory],
        v5,
        v6 >= 3))
  {
    v8 = [v2 executableSpecification];
    v9 = [v8 executableObject];
    Class v10 = NSClassFromString(&cfstr_Atxinfosuggest_8.isa);
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    BOOL v7 = v13 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end