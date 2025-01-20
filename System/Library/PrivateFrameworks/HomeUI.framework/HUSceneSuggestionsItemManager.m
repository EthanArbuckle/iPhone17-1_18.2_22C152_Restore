@interface HUSceneSuggestionsItemManager
+ (id)computeNumberOfSuggestionsInHome:(id)a3;
+ (id)suggestionsItemProviderInHome:(id)a3;
- (HFItem)addCustomSceneItem;
- (HREActionSetRecommendationItemProvider)suggestionItemProvider;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_currentSectionIdentifiers;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (unint64_t)_numberOfSections;
- (void)setAddCustomSceneItem:(id)a3;
- (void)setSuggestionItemProvider:(id)a3;
@end

@implementation HUSceneSuggestionsItemManager

+ (id)suggestionsItemProviderInHome:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F6A2E0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithHome:v4 andServiceLikeItems:0];

  objc_msgSend(v5, "setEngineOptions:", objc_msgSend(v5, "engineOptions") | 0x10);
  [v5 setFilter:&__block_literal_global_85];

  return v5;
}

uint64_t __63__HUSceneSuggestionsItemManager_suggestionsItemProviderInHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actionSetBuilders];
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_7);

  return v3;
}

BOOL __63__HUSceneSuggestionsItemManager_suggestionsItemProviderInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 actionSet];
  if (v3)
  {
    id v4 = [v2 actionSet];
    v5 = [v4 actions];
    BOOL v6 = [v5 count] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

+ (id)computeNumberOfSuggestionsInHome:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() suggestionsItemProviderInHome:v3];

  v5 = [v4 reloadItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke;
  v9[3] = &unk_1E6385B10;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) items];
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_10);
  id v3 = [v2 allObjects];

  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v5 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v6 = [v4 combineAllFutures:v3 ignoringErrors:1 scheduler:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_3;
  v10[3] = &unk_1E6388A88;
  id v11 = v1;
  id v7 = v1;
  v8 = [v6 flatMap:v10];

  return v8;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F68720];
  v8[0] = MEMORY[0x1E4F1CC38];
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v3 updateWithOptions:v4];

  return v5;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F68B10];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v1);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "latestResults", (void)v15);
        v9 = [v8 objectForKeyedSubscript:v6];
        int v10 = [v9 BOOLValue];

        v4 += v10 ^ 1u;
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  id v11 = (void *)MEMORY[0x1E4F7A0D8];
  v12 = [NSNumber numberWithUnsignedInteger:v4];
  v13 = [v11 futureWithResult:v12];

  return v13;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  uint64_t v6 = [v4 set];
  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v18 = *MEMORY[0x1E4F68AB8];
  v8 = _HULocalizedStringWithDefaultValue(@"HUSceneSuggestionsAddCustomSceneButton", @"HUSceneSuggestionsAddCustomSceneButton", 1);
  v19[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  int v10 = (void *)[v7 initWithResults:v9];
  [(HUSceneSuggestionsItemManager *)self setAddCustomSceneItem:v10];

  id v11 = [(HUSceneSuggestionsItemManager *)self addCustomSceneItem];
  [v6 addObject:v11];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v6];
  v13 = [(id)objc_opt_class() suggestionsItemProviderInHome:v5];

  [(HUSceneSuggestionsItemManager *)self setSuggestionItemProvider:v13];
  v17[0] = v12;
  v14 = [(HUSceneSuggestionsItemManager *)self suggestionItemProvider];
  v17[1] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  return v15;
}

- (unint64_t)_numberOfSections
{
  uint64_t v2 = [(HUSceneSuggestionsItemManager *)self _currentSectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  uint64_t v4 = [(HUSceneSuggestionsItemManager *)self _currentSectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"HUSceneSuggestionsSectionIdentifierSuggestions"])
  {
    unint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUSceneSuggestionsSectionHeaderTitle", @"HUSceneSuggestionsSectionHeaderTitle", 1);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSceneSuggestionsItemManager *)self addCustomSceneItem];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    return @"HUSceneSuggestionsSectionIdentifierCustom";
  }
  else {
    return @"HUSceneSuggestionsSectionIdentifierSuggestions";
  }
}

- (id)_currentSectionIdentifiers
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(HUSceneSuggestionsItemManager *)self suggestionItemProvider];
  id v5 = [v4 items];
  if ([v5 count])
  {
    int v6 = [(HUSceneSuggestionsItemManager *)self suggestionItemProvider];
    id v7 = [v6 items];
    int v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_33_1);

    if (v8) {
      [v3 addObject:@"HUSceneSuggestionsSectionIdentifierSuggestions"];
    }
  }
  else
  {
  }
  [v3 addObject:@"HUSceneSuggestionsSectionIdentifierCustom"];

  return v3;
}

uint64_t __59__HUSceneSuggestionsItemManager__currentSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 latestResults];
  unint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  uint64_t v4 = [MEMORY[0x1E4F1CC38] isEqual:v3] ^ 1;

  return v4;
}

- (HFItem)addCustomSceneItem
{
  return self->_addCustomSceneItem;
}

- (void)setAddCustomSceneItem:(id)a3
{
}

- (HREActionSetRecommendationItemProvider)suggestionItemProvider
{
  return self->_suggestionItemProvider;
}

- (void)setSuggestionItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItemProvider, 0);

  objc_storeStrong((id *)&self->_addCustomSceneItem, 0);
}

@end