@interface ATXFakeSuggestionDeduplicator
- (ATXFakeSuggestionDeduplicator)init;
- (ATXHomeScreenWidgetIdentifiable)duplicateWidgetReturnValue;
- (BOOL)blanketReturnValue;
- (BOOL)existingSuggestionsReturnValue;
- (BOOL)homeScreenPageReturnValue;
- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4;
- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5;
- (NSArray)pinnedWidgetSuggestions;
- (NSArray)suggestionsInRecentlyEngagedCache;
- (NSSet)appsOnPage;
- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4;
- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6;
- (void)setAppsOnPage:(id)a3;
- (void)setBlanketReturnValue:(BOOL)a3;
- (void)setDuplicateWidgetReturnValue:(id)a3;
- (void)setExistingSuggestionsReturnValue:(BOOL)a3;
- (void)setHomeScreenPageReturnValue:(BOOL)a3;
- (void)setPinnedWidgetSuggestions:(id)a3;
- (void)setSuggestionsInRecentlyEngagedCache:(id)a3;
@end

@implementation ATXFakeSuggestionDeduplicator

- (ATXFakeSuggestionDeduplicator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeSuggestionDeduplicator;
  v2 = [(ATXFakeSuggestionDeduplicator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    pinnedWidgetSuggestions = v2->_pinnedWidgetSuggestions;
    v2->_pinnedWidgetSuggestions = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)setBlanketReturnValue:(BOOL)a3
{
  self->_blanketValueIsSet = 1;
  self->_blanketReturnValue = a3;
}

- (void)setExistingSuggestionsReturnValue:(BOOL)a3
{
  self->_existingSuggestionsReturnValueIsSet = 1;
  self->_existingSuggestionsReturnValue = a3;
}

- (void)setHomeScreenPageReturnValue:(BOOL)a3
{
  self->_homeScreenPageReturnValueIsSet = 1;
  self->_homeScreenPageReturnValue = a3;
}

- (void)setDuplicateWidgetReturnValue:(id)a3
{
  self->_duplicateWidgetReturnValueIsSet = 1;
  objc_storeStrong((id *)&self->_duplicateWidgetReturnValue, a3);
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4
{
  if (self->_existingSuggestionsReturnValueIsSet)
  {
    uint64_t v4 = 13;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  if (self->_blanketValueIsSet)
  {
    uint64_t v4 = 12;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  return 0;
}

- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_homeScreenPageReturnValueIsSet)
  {
    BOOL homeScreenPageReturnValue = self->_homeScreenPageReturnValue;
  }
  else
  {
    if (self->_appsOnPage)
    {
      BOOL v12 = -[ATXFakeSuggestionDeduplicator suggestionIsDuplicate:otherApps:](self, "suggestionIsDuplicate:otherApps:", v8);
      goto LABEL_6;
    }
    if (!self->_blanketValueIsSet)
    {
      BOOL v12 = 0;
      goto LABEL_6;
    }
    BOOL homeScreenPageReturnValue = self->_blanketReturnValue;
  }
  BOOL v12 = homeScreenPageReturnValue;
LABEL_6:

  return v12;
}

- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_pinnedWidgetSuggestions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "isEqual:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4
{
  if (self->_duplicateWidgetReturnValueIsSet) {
    uint64_t v4 = self->_duplicateWidgetReturnValue;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4
{
  appsOnPage = self->_appsOnPage;
  if (appsOnPage)
  {
    id v6 = a3;
    BOOL v7 = [(ATXFakeSuggestionDeduplicator *)self suggestionIsDuplicate:v6 otherApps:appsOnPage];
  }
  else
  {
    id v8 = a3;
    id v6 = (id)objc_opt_new();
    BOOL v7 = [(ATXFakeSuggestionDeduplicator *)self suggestionIsDuplicate:v8 otherApps:v6];
  }
  return v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_appsOnPage)
  {
    if (self->_blanketValueIsSet)
    {
      BOOL blanketReturnValue = self->_blanketReturnValue;
      goto LABEL_7;
    }
LABEL_6:
    BOOL blanketReturnValue = 0;
    goto LABEL_7;
  }
  id v8 = [v6 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 != 1) {
    goto LABEL_6;
  }
  id v10 = [NSString alloc];
  v11 = [v6 executableSpecification];
  long long v12 = [v11 executable];
  long long v13 = (void *)[v10 initWithData:v12 encoding:4];

  BOOL blanketReturnValue = [(NSSet *)self->_appsOnPage containsObject:v13];
LABEL_7:

  return blanketReturnValue;
}

- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)blanketReturnValue
{
  return self->_blanketReturnValue;
}

- (BOOL)existingSuggestionsReturnValue
{
  return self->_existingSuggestionsReturnValue;
}

- (BOOL)homeScreenPageReturnValue
{
  return self->_homeScreenPageReturnValue;
}

- (ATXHomeScreenWidgetIdentifiable)duplicateWidgetReturnValue
{
  return self->_duplicateWidgetReturnValue;
}

- (NSArray)pinnedWidgetSuggestions
{
  return self->_pinnedWidgetSuggestions;
}

- (void)setPinnedWidgetSuggestions:(id)a3
{
}

- (NSSet)appsOnPage
{
  return self->_appsOnPage;
}

- (void)setAppsOnPage:(id)a3
{
}

- (NSArray)suggestionsInRecentlyEngagedCache
{
  return self->_suggestionsInRecentlyEngagedCache;
}

- (void)setSuggestionsInRecentlyEngagedCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInRecentlyEngagedCache, 0);
  objc_storeStrong((id *)&self->_appsOnPage, 0);
  objc_storeStrong((id *)&self->_pinnedWidgetSuggestions, 0);
  objc_storeStrong((id *)&self->_duplicateWidgetReturnValue, 0);
}

@end