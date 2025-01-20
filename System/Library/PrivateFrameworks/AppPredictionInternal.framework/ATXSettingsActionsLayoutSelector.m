@interface ATXSettingsActionsLayoutSelector
- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
@end

@implementation ATXSettingsActionsLayoutSelector

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F93940];
  id v5 = a4;
  v6 = [v4 clientModelIdFromClientModelType:48];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__ATXSettingsActionsLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke;
  v11[3] = &unk_1E68AE0A0;
  id v12 = v6;
  id v7 = v6;
  v8 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v11);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F939C8]) initWithLayoutType:17 oneByOneSuggestions:0 oneByTwoSuggestions:v8 twoByTwoSuggestions:0 oneByFourSuggestions:0 twoByFourSuggestions:0 fourByFourSuggestions:0 fourByEightSuggestions:0];
  return v9;
}

uint64_t __87__ATXSettingsActionsLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 clientModelSpecification];
  v4 = [v3 clientModelId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

@end