@interface ATXSuggestionDeduplicator
- (ATXSuggestionDeduplicator)init;
- (BOOL)_isContactsWidgetIntent:(id)a3 overlappingContactsWithOtherContactsWidgetIntent:(id)a4;
- (BOOL)_isWidget:(id)a3 showingContentOfAction:(id)a4;
- (BOOL)_isWidget:(id)a3 showingContentOfInfoSuggestion:(id)a4;
- (BOOL)executableSpecsAreDuplicates:(id)a3 otherExecutableSpec:(id)a4;
- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4 shouldCompareAcrossTypes:(BOOL)a5;
- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4;
- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4;
- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)suggestionsAreDuplicateActionAndLinkAction:(id)a3 otherSuggestion:(id)a4;
- (BOOL)suggestionsAreDuplicateAppAndAction:(id)a3 otherSuggestion:(id)a4;
- (BOOL)suggestionsAreDuplicateAppAndLinkAction:(id)a3 otherSuggestion:(id)a4;
- (BOOL)suggestionsAreDuplicateWidgetAndAction:(id)a3 otherSuggestion:(id)a4;
- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5;
- (id)_initWithVisibleAppsByPage:(id)a3;
- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4;
- (id)executableClassStringsToUnarchiveDuringComparison;
- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6;
- (id)stacksToConsiderForLeftOfHomeForStackId:(id)a3 stacksOnPage:(id)a4;
- (id)stacksWithDuplicateWidgetExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
- (id)stacksWithDuplicateWidgetSuggestion:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5;
@end

@implementation ATXSuggestionDeduplicator

- (ATXSuggestionDeduplicator)init
{
  v3 = +[_ATXAppIconState sharedInstance];
  v4 = [v3 nonFolderAppSetOnPages];
  v5 = [(ATXSuggestionDeduplicator *)self _initWithVisibleAppsByPage:v4];

  return v5;
}

- (id)_initWithVisibleAppsByPage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestionDeduplicator;
  v6 = [(ATXSuggestionDeduplicator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_visibleAppsByPage, a3);
  }

  return v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4
{
  return [(ATXSuggestionDeduplicator *)self suggestionIsDuplicate:a3 existingSuggestions:a4 shouldCompareAcrossTypes:1];
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4 shouldCompareAcrossTypes:(BOOL)a5
{
  BOOL v26 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D25F6CC0]();
        v12 = [v10 executableSpecification];
        uint64_t v13 = [v12 executableType];
        v14 = [v6 executableSpecification];
        uint64_t v15 = [v14 executableType];

        if (v13 == v15)
        {
          v16 = [v10 executableSpecification];
          v17 = [v16 executableClassString];
          v18 = [v6 executableSpecification];
          v19 = [v18 executableClassString];
          int v20 = [v17 isEqualToString:v19];

          if (v20)
          {
            v21 = [v6 executableSpecification];
            v22 = [v10 executableSpecification];
            BOOL v23 = [(ATXSuggestionDeduplicator *)self executableSpecsAreDuplicates:v21 otherExecutableSpec:v22];

            if (v23) {
              goto LABEL_18;
            }
          }
        }
        else if (v26 {
               && ([(ATXSuggestionDeduplicator *)self suggestionsAreDuplicateAppAndAction:v6 otherSuggestion:v10]|| [(ATXSuggestionDeduplicator *)self suggestionsAreDuplicateAppAndLinkAction:v6 otherSuggestion:v10]|| [(ATXSuggestionDeduplicator *)self suggestionsAreDuplicateWidgetAndAction:v6 otherSuggestion:v10]|| [(ATXSuggestionDeduplicator *)self suggestionsAreDuplicateActionAndLinkAction:v6 otherSuggestion:v10]))
        }
        {
LABEL_18:
          BOOL v24 = 1;
          goto LABEL_19;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v24 = 0;
LABEL_19:

  return v24;
}

- (BOOL)suggestionsAreDuplicateAppAndAction:(id)a3 otherSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 executableSpecification];
  if ([v7 executableType] == 2)
  {
    uint64_t v8 = [v6 executableSpecification];
    uint64_t v9 = [v8 executableType];

    v10 = v5;
    v11 = v6;
    if (v9 == 1) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v12 = [v5 executableSpecification];
  if ([v12 executableType] == 1)
  {
    uint64_t v13 = [v6 executableSpecification];
    uint64_t v14 = [v13 executableType];

    v10 = v6;
    v11 = v5;
    if (v14 != 2)
    {
      BOOL v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    id v12 = v10;
    id v15 = v11;
    v16 = [v12 executableSpecification];
    v17 = [v16 executableClassString];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    int v20 = [v17 isEqualToString:v19];

    if (v20)
    {
      v21 = [v12 executableSpecification];
      v22 = [v21 executableObject];

      BOOL v23 = [v22 bundleId];
      BOOL v24 = ATXBundleIdReplacementForBundleId();
    }
    else
    {
      BOOL v24 = 0;
    }
    BOOL v26 = [v15 executableSpecification];
    v27 = [v26 executableClassString];
    uint64_t v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    int v30 = [v27 isEqualToString:v29];

    if (v30)
    {
      long long v31 = [v15 executableSpecification];
      long long v32 = [v31 executableObject];

      long long v33 = ATXBundleIdReplacementForBundleId();

      if (v24 && v33 && ([v24 isEqualToString:v33] & 1) != 0)
      {
        BOOL v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      long long v33 = 0;
    }
    BOOL v25 = 0;
    goto LABEL_18;
  }
  BOOL v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateAppAndLinkAction:(id)a3 otherSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 executableSpecification];
  if ([v7 executableType] == 10)
  {
    uint64_t v8 = [v6 executableSpecification];
    uint64_t v9 = [v8 executableType];

    v10 = v5;
    v11 = v6;
    if (v9 == 1) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v12 = [v5 executableSpecification];
  if ([v12 executableType] == 1)
  {
    uint64_t v13 = [v6 executableSpecification];
    uint64_t v14 = [v13 executableType];

    v10 = v6;
    v11 = v5;
    if (v14 != 10)
    {
      BOOL v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    id v12 = v10;
    id v15 = v11;
    v16 = [v12 executableSpecification];
    v17 = [v16 executableClassString];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    int v20 = [v17 isEqualToString:v19];

    if (v20)
    {
      v21 = [v12 executableSpecification];
      v22 = [v21 executableObject];

      BOOL v23 = [v22 bundleId];
      BOOL v24 = ATXBundleIdReplacementForBundleId();
    }
    else
    {
      BOOL v24 = 0;
    }
    BOOL v26 = [v15 executableSpecification];
    v27 = [v26 executableClassString];
    uint64_t v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    int v30 = [v27 isEqualToString:v29];

    if (v30)
    {
      long long v31 = [v15 executableSpecification];
      long long v32 = [v31 executableObject];

      long long v33 = ATXBundleIdReplacementForBundleId();

      if (v24 && v33 && ([v24 isEqualToString:v33] & 1) != 0)
      {
        BOOL v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      long long v33 = 0;
    }
    BOOL v25 = 0;
    goto LABEL_18;
  }
  BOOL v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateActionAndLinkAction:(id)a3 otherSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 executableSpecification];
  if ([v7 executableType] == 2)
  {
    uint64_t v8 = [v6 executableSpecification];
    uint64_t v9 = [v8 executableType];

    v10 = v5;
    v11 = v6;
    if (v9 == 10) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v12 = [v5 executableSpecification];
  if ([v12 executableType] == 10)
  {
    uint64_t v13 = [v6 executableSpecification];
    uint64_t v14 = [v13 executableType];

    v10 = v6;
    v11 = v5;
    if (v14 != 2)
    {
      BOOL v25 = 0;
      goto LABEL_20;
    }
LABEL_7:
    id v12 = v10;
    id v15 = v11;
    v16 = [v12 executableSpecification];
    v17 = [v16 executableClassString];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    int v20 = [v17 isEqualToString:v19];

    if (v20)
    {
      v21 = [v12 executableSpecification];
      v22 = [v21 executableObject];

      BOOL v23 = [v22 bundleId];
      BOOL v24 = ATXBundleIdReplacementForBundleId();
    }
    else
    {
      BOOL v24 = 0;
    }
    BOOL v26 = [v15 executableSpecification];
    v27 = [v26 executableClassString];
    uint64_t v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    int v30 = [v27 isEqualToString:v29];

    if (v30)
    {
      long long v31 = [v15 executableSpecification];
      long long v32 = [v31 executableObject];

      long long v33 = [v32 bundleId];
      v34 = ATXBundleIdReplacementForBundleId();

      if (v24 && v34 && ([v24 isEqualToString:v34] & 1) != 0)
      {
        BOOL v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v34 = 0;
    }
    BOOL v25 = 0;
    goto LABEL_18;
  }
  BOOL v25 = 0;
LABEL_19:

LABEL_20:
  return v25;
}

- (BOOL)suggestionsAreDuplicateWidgetAndAction:(id)a3 otherSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 executableSpecification];
  if ([v7 executableType] == 2)
  {
    uint64_t v8 = [v6 executableSpecification];
    uint64_t v9 = [v8 executableType];

    v10 = v5;
    v11 = v6;
    if (v9 == 3) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v12 = [v5 executableSpecification];
  if ([v12 executableType] != 3)
  {
    BOOL v32 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v13 = [v6 executableSpecification];
  uint64_t v14 = [v13 executableType];

  v10 = v6;
  v11 = v5;
  if (v14 == 2)
  {
LABEL_7:
    id v12 = v10;
    id v15 = v11;
    v16 = [v12 executableSpecification];
    v17 = [v16 executableClassString];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    int v20 = [v17 isEqualToString:v19];

    if (!v20) {
      goto LABEL_13;
    }
    v21 = [v12 executableSpecification];
    v22 = [v21 executableObject];

    BOOL v23 = [v22 intent];

    if (v23)
    {
      BOOL v24 = [v15 executableSpecification];
      BOOL v25 = [v24 executableClassString];
      BOOL v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      int v28 = [v25 isEqualToString:v27];

      if (!v28) {
        goto LABEL_15;
      }
      v29 = [v15 executableSpecification];
      int v30 = [v29 executableObject];

      long long v31 = [v30 intent];

      if (v31)
      {
        BOOL v32 = +[ATXActionToWidgetConverter isWidgetIntent:v31 validConversionFromActionIntent:v23];
      }
      else
      {
LABEL_15:
        BOOL v32 = 0;
      }
    }
    else
    {
LABEL_13:
      BOOL v32 = 0;
    }

    goto LABEL_18;
  }
  BOOL v32 = 0;
LABEL_19:

  return v32;
}

- (BOOL)executableSpecsAreDuplicates:(id)a3 otherExecutableSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 executableType];
  if (v8 != [v7 executableType]
    || ![v6 executableType]
    || [v6 executableType] == 11
    || ([v6 executableClassString],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v7 executableClassString],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v9 isEqualToString:v10],
        v10,
        v9,
        !v11))
  {
    LOBYTE(v26) = 0;
    goto LABEL_12;
  }
  id v12 = [(ATXSuggestionDeduplicator *)self executableClassStringsToUnarchiveDuringComparison];
  uint64_t v13 = [v6 executableClassString];
  char v14 = [v12 containsObject:v13];

  if ((v14 & 1) == 0)
  {
    v19 = [v6 executableIdentifier];
    v21 = [v7 executableIdentifier];
    LOBYTE(v26) = [v19 isEqualToString:v21];
LABEL_56:

    goto LABEL_12;
  }
  id v15 = [v6 executableClassString];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  int v18 = [v15 isEqualToString:v17];

  if (v18)
  {
    v19 = [v6 executableObject];
    uint64_t v20 = [v7 executableObject];
    v21 = (void *)v20;
    if (v19 && v20) {
      goto LABEL_9;
    }
    v37 = __atxlog_handle_default();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:](v37, v38, v39, v40, v41, v42, v43, v44);
    }
LABEL_23:

LABEL_24:
    LOBYTE(v26) = 1;
    goto LABEL_56;
  }
  int v28 = [v6 executableClassString];
  v29 = (objc_class *)objc_opt_class();
  int v30 = NSStringFromClass(v29);
  int v31 = [v28 isEqualToString:v30];

  if (v31)
  {
    BOOL v32 = [v6 executableObject];
    uint64_t v33 = [v7 executableObject];
    v34 = (void *)v33;
    if (v32 && v33)
    {
      if ([v6 executableType] == 1 && objc_msgSend(v7, "executableType") == 1)
      {
        uint64_t v35 = ATXBundleIdReplacementForBundleId();

        uint64_t v36 = ATXBundleIdReplacementForBundleId();

        v34 = (void *)v36;
        BOOL v32 = (void *)v35;
      }
      LOBYTE(v26) = [v32 isEqual:v34];
    }
    else
    {
      BOOL v26 = __atxlog_handle_default();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:](v26, v56, v57, v58, v59, v60, v61, v62);
      }

      LOBYTE(v26) = 1;
    }

    goto LABEL_12;
  }
  v45 = [v6 executableClassString];
  v46 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v46);
  int v48 = [v45 isEqualToString:v47];

  if (v48)
  {
    v19 = [v6 executableObject];
    v21 = [v7 executableObject];
    v49 = [v19 appBundleIdentifier];
    v50 = [v21 appBundleIdentifier];
    int v51 = [v49 isEqualToString:v50];

    if (!v51) {
      goto LABEL_55;
    }
    v52 = [v19 widgetBundleIdentifier];
    v53 = [v21 widgetBundleIdentifier];
    int v54 = [v52 isEqualToString:v53];

    if (!v54) {
      goto LABEL_55;
    }
    if (([v19 isFallback] & 1) == 0 && (objc_msgSend(v21, "isFallback") & 1) == 0)
    {
      v55 = [v19 intent];
      if (v55)
      {

        goto LABEL_49;
      }
      v78 = [v21 intent];

      if (v78)
      {
LABEL_49:
        v79 = [v19 intent];
        v80 = [v21 intent];
        int v81 = objc_msgSend(v79, "atx_isEqualToIntent:", v80);

        if (!v81) {
          goto LABEL_55;
        }
      }
    }
    v82 = [v19 widgetKind];
    if (v82)
    {
    }
    else
    {
      v83 = [v21 widgetKind];

      if (!v83) {
        goto LABEL_24;
      }
    }
    BOOL v26 = [v21 widgetKind];

    if (!v26) {
      goto LABEL_56;
    }
    v84 = [v19 widgetKind];
    v85 = widgetKindForDeduping(v84);
    v86 = [v21 widgetKind];
    v87 = widgetKindForDeduping(v86);
    int v88 = [v85 isEqualToString:v87];

    if (v88) {
      goto LABEL_24;
    }
LABEL_55:
    LOBYTE(v26) = 0;
    goto LABEL_56;
  }
  v63 = [v6 executableClassString];
  v64 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v64);
  int v66 = [v63 isEqualToString:v65];

  if (v66)
  {
    v19 = [v6 executableObject];
    v21 = [v7 executableObject];
    LODWORD(v26) = [v19 isEqual:v21];
    if (!v26) {
      goto LABEL_56;
    }
    BOOL v23 = __atxlog_handle_blending();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:]((uint64_t)v19, (uint64_t)v21, v23);
    }
    goto LABEL_34;
  }
  v67 = [v6 executableClassString];
  v68 = (objc_class *)objc_opt_class();
  v69 = NSStringFromClass(v68);
  LODWORD(v26) = [v67 isEqualToString:v69];

  if (v26)
  {
    v19 = [v6 executableObject];
    uint64_t v70 = [v7 executableObject];
    v21 = (void *)v70;
    if (v19 && v70)
    {
LABEL_9:
      v22 = [v19 bundleId];
      BOOL v23 = ATXBundleIdReplacementForBundleId();

      BOOL v24 = [v21 bundleId];
      BOOL v25 = ATXBundleIdReplacementForBundleId();

      if ([v23 isEqualToString:v25]) {
        LOBYTE(v26) = 1;
      }
      else {
        LOBYTE(v26) = [v19 isEqual:v21];
      }

LABEL_34:
      goto LABEL_56;
    }
    v37 = __atxlog_handle_default();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[ATXSuggestionDeduplicator executableSpecsAreDuplicates:otherExecutableSpec:].cold.4(v37, v71, v72, v73, v74, v75, v76, v77);
    }
    goto LABEL_23;
  }
LABEL_12:

  return (char)v26;
}

- (id)executableClassStringsToUnarchiveDuringComparison
{
  if (executableClassStringsToUnarchiveDuringComparison__pasOnceToken12 != -1) {
    dispatch_once(&executableClassStringsToUnarchiveDuringComparison__pasOnceToken12, &__block_literal_global_54);
  }
  v2 = (void *)executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult;
  return v2;
}

void __78__ATXSuggestionDeduplicator_executableClassStringsToUnarchiveDuringComparison__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = (void *)MEMORY[0x1D25F6CC0]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  int v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  uint64_t v13 = objc_msgSend(v2, "initWithObjects:", v4, v6, v8, v10, v12, 0);

  char v14 = (void *)executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult;
  executableClassStringsToUnarchiveDuringComparison__pasExprOnceResult = v13;
}

- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 == 3)
  {
    v10 = [v7 atxInfoSuggestionExecutableObject];
    BOOL v11 = [(ATXSuggestionDeduplicator *)self _isWidget:v6 showingContentOfInfoSuggestion:v10];
  }
  else
  {
    id v12 = [v7 executableSpecification];
    uint64_t v13 = [v12 executableType];

    if (v13 != 2)
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    v10 = [v7 atxActionExecutableObject];
    BOOL v11 = [(ATXSuggestionDeduplicator *)self _isWidget:v6 showingContentOfAction:v10];
  }
  BOOL v14 = v11;

LABEL_7:
  return v14;
}

- (BOOL)_isWidget:(id)a3 showingContentOfInfoSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_22;
  }
  uint64_t v8 = [v6 extensionBundleId];
  uint64_t v9 = [v7 widgetBundleIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_22;
  }
  BOOL v11 = [v6 extensionBundleId];
  if (![v11 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"]
    || ([v6 intent], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    int v18 = [v6 widgetKind];
    v19 = widgetKindForDeduping(v18);
    uint64_t v20 = [v7 widgetKind];
    v21 = widgetKindForDeduping(v20);
    int v22 = [v19 isEqualToString:v21];

    if (v22)
    {
      if ([v7 isFallback])
      {
LABEL_16:
        BOOL v17 = 1;
        goto LABEL_23;
      }
      BOOL v23 = [v7 widgetBundleIdentifier];
      if ([v23 isEqualToString:@"com.apple.mobilecal.CalendarWidgetExtension"])
      {
LABEL_15:

        goto LABEL_16;
      }
      BOOL v24 = [v7 criterion];
      if ([v24 isEqualToString:@"ATXWeatherWakeUp"])
      {
LABEL_14:

        goto LABEL_15;
      }
      BOOL v25 = [v7 widgetBundleIdentifier];
      if ([v25 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
      {

        goto LABEL_14;
      }
      BOOL v26 = [v7 widgetBundleIdentifier];
      char v27 = [v26 isEqualToString:@"com.apple.Fitness.FitnessWidget"];

      if (v27) {
        goto LABEL_16;
      }
      int v28 = [v7 intent];
      if (v28)
      {
      }
      else
      {
        v29 = [v6 intent];

        if (!v29) {
          goto LABEL_16;
        }
      }
      int v30 = [v7 intent];
      int v31 = [v6 intent];
      char v32 = objc_msgSend(v30, "atx_isEqualToIntent:", v31);

      if (v32) {
        goto LABEL_16;
      }
    }
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = (void *)v12;
  BOOL v14 = [v7 intent];

  if (!v14) {
    goto LABEL_8;
  }
  id v15 = [v6 intent];
  v16 = [v7 intent];
  BOOL v17 = [(ATXSuggestionDeduplicator *)self _isContactsWidgetIntent:v15 overlappingContactsWithOtherContactsWidgetIntent:v16];

LABEL_23:
  return v17;
}

- (BOOL)_isContactsWidgetIntent:(id)a3 overlappingContactsWithOtherContactsWidgetIntent:(id)a4
{
  id v5 = a4;
  id v6 = +[ATXSuggestionPreprocessor contactIdsAssociatedWithContactsWidgetIntent:a3];
  id v7 = +[ATXSuggestionPreprocessor contactIdsAssociatedWithContactsWidgetIntent:v5];

  LOBYTE(v5) = [v6 intersectsSet:v7];
  return (char)v5;
}

- (BOOL)_isWidget:(id)a3 showingContentOfAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 intent];
  if (v7)
  {
    uint64_t v8 = [v6 intent];

    if (v8)
    {
      uint64_t v9 = [v5 intent];
      int v10 = [v6 intent];
      LOBYTE(v7) = +[ATXActionToWidgetConverter isWidgetIntent:v9 validConversionFromActionIntent:v10];
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4
{
  return [(ATXSuggestionDeduplicator *)self suggestionIsDuplicateAppOrWidget:a3 homeScreenPageConfig:a4 excludingStackConfigId:0];
}

- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = -[ATXSuggestionDeduplicator widgetSuggestionIsDuplicate:homeScreenPageConfig:excludingStackConfigId:](self, "widgetSuggestionIsDuplicate:homeScreenPageConfig:excludingStackConfigId:", v8, v9, a5)|| -[ATXSuggestionDeduplicator suggestionIsDuplicate:appsOnHomeScreenPageAtIndex:](self, "suggestionIsDuplicate:appsOnHomeScreenPageAtIndex:", v8, [v9 pageIndex]);

  return v10;
}

- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v5 = [(ATXSuggestionDeduplicator *)self stacksWithDuplicateWidgetSuggestion:a3 homeScreenPageConfig:a4 excludingStackConfigId:a5];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 executableSpecification];
  uint64_t v12 = [v11 executableType];

  if (v12 == 3)
  {
    [(ATXSuggestionDeduplicator *)self stacksWithDuplicateWidgetSuggestion:v8 homeScreenPageConfig:v9 excludingStackConfigId:v10];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1D25F6CC0](v14);
          uint64_t v20 = objc_msgSend(v18, "widgets", (void)v23);
          uint64_t v21 = [v20 count];

          if (v21 == 1)
          {
            LOBYTE(v15) = 1;
            goto LABEL_13;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v15 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)stacksWithDuplicateWidgetSuggestion:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 executableSpecification];
  uint64_t v12 = [v11 executableType];

  if (v12 == 3)
  {
    v29 = objc_opt_new();
    id v13 = [v9 stacks];
    uint64_t v14 = [v9 pageIndex];
    id v28 = v9;
    if (v14 == *MEMORY[0x1E4F4B540])
    {
      uint64_t v15 = [(ATXSuggestionDeduplicator *)self stacksToConsiderForLeftOfHomeForStackId:v10 stacksOnPage:v13];

      id v13 = (void *)v15;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (v10)
          {
            int v22 = [*(id *)(*((void *)&v30 + 1) + 8 * i) identifier];
            char v23 = [v22 isEqualToString:v10];

            if (v23) {
              continue;
            }
          }
          long long v24 = objc_msgSend(v21, "widgets", v28);
          long long v25 = [(ATXSuggestionDeduplicator *)self duplicateWidgetForWidgetSuggestion:v8 otherWidgets:v24];

          if (v25) {
            [v29 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }

    long long v26 = (void *)[v29 copy];
    id v9 = v28;
  }
  else
  {
    long long v26 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

- (id)stacksToConsiderForLeftOfHomeForStackId:(id)a3 stacksOnPage:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = (id)objc_opt_new();
    long long v24 = objc_opt_new();
    id v9 = [MEMORY[0x1E4F93550] sharedInstance];
    unint64_t v23 = [v9 lohStacksToConsiderAboveAndBelowForDeduplication];

    id v10 = [MEMORY[0x1E4F93550] sharedInstance];
    uint64_t v22 = [v10 lohStacksToConsiderAboveAndBelowForDeduplication];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v12) {
      goto LABEL_16;
    }
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "identifier", v21);
        char v19 = [v18 isEqualToString:v5];

        if (v19) {
          goto LABEL_10;
        }
        if (v14)
        {
          [v24 addObject:v17];
          if ([v24 count] == v22) {
            goto LABEL_16;
          }
LABEL_10:
          char v14 = 1;
          continue;
        }
        [v8 addObject:v17];
        if ([v8 count] > v23) {
          [v8 removeObjectAtIndex:0];
        }
        char v14 = 0;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v13)
      {
LABEL_16:

        [v8 addObjectsFromArray:v24];
        id v7 = v21;
        goto LABEL_18;
      }
    }
  }
  id v8 = v6;
LABEL_18:

  return v8;
}

- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = [a4 stacks];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    uint64_t v26 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      uint64_t v27 = v11;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        if (!v8
          || ([*(id *)(*((void *)&v32 + 1) + 8 * v13) identifier],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              char v16 = [v15 isEqualToString:v8],
              v15,
              (v16 & 1) == 0))
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v17 = objc_msgSend(v14, "widgets", v26);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v29 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = [*(id *)(*((void *)&v28 + 1) + 8 * i) extensionBundleId];
                char v23 = [v22 isEqualToString:v7];

                if (v23)
                {

                  BOOL v24 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          uint64_t v12 = v26;
          uint64_t v11 = v27;
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      BOOL v24 = 0;
    }
    while (v11);
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_22:

  return v24;
}

- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v5 = [(ATXSuggestionDeduplicator *)self pinnedWidgetIdentifiablesWithExtensionId:a3 homeScreenPageConfig:a4 excludingStackConfigId:a5 shouldStopAfterFindingFirstOne:1];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  uint64_t v27 = v11;
  long long v28 = v10;
  uint64_t v26 = v12;
  [(ATXSuggestionDeduplicator *)self stacksWithDuplicateWidgetExtensionId:v10 homeScreenPageConfig:v11 excludingStackConfigId:v12];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v20 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v21 = [v19 widgets];
        uint64_t v22 = [v21 count];

        if (v22 == 1)
        {
          char v23 = [v19 widgets];
          BOOL v24 = [v23 firstObject];
          [v13 addObject:v24];

          if (v6)
          {
            goto LABEL_12;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (id)stacksWithDuplicateWidgetExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v23 = v8;
  BOOL v24 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v8 stacks];
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (v9)
        {
          id v12 = [*(id *)(*((void *)&v32 + 1) + 8 * i) identifier];
          char v13 = [v12 isEqualToString:v9];

          if (v13) {
            continue;
          }
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = [v11 widgets];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [*(id *)(*((void *)&v28 + 1) + 8 * j) extensionBundleId];
              int v20 = [v19 isEqualToString:v7];

              if (v20)
              {
                [v24 addObject:v11];
                goto LABEL_18;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v27);
  }

  uint64_t v21 = (void *)[v24 copy];
  return v21;
}

- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  visibleAppsByPage = self->_visibleAppsByPage;
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [(NSDictionary *)visibleAppsByPage objectForKeyedSubscript:v9];

  if ([v10 count]) {
    BOOL v11 = [(ATXSuggestionDeduplicator *)self suggestionIsDuplicate:v6 otherApps:v10];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 executableSpecification];
  uint64_t v8 = [v7 executableType];

  if (v8 == 1)
  {
    id v9 = [v5 executableSpecification];
    id v10 = [v9 executableObject];

    BOOL v11 = v10 && ([v6 containsObject:v10] & 1) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 != 3) {
    goto LABEL_12;
  }
  id v10 = [v6 executableSpecification];
  BOOL v11 = [v10 executableClassString];
  id v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  int v14 = [v11 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = [v6 executableSpecification];
    uint64_t v16 = [v15 executableObject];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (-[ATXSuggestionDeduplicator _isWidget:showingContentOfInfoSuggestion:](self, "_isWidget:showingContentOfInfoSuggestion:", v22, v16, (void)v25))
          {
            id v23 = v22;
            goto LABEL_14;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    id v23 = 0;
LABEL_14:
  }
  else
  {
LABEL_12:
    id v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executableSpecsAreDuplicates:(os_log_t)log otherExecutableSpec:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Deduplicator found duplicate people suggestions. Suggestion 1: %@; Suggestion 2: %@",
    (uint8_t *)&v3,
    0x16u);
}

- (void)executableSpecsAreDuplicates:(uint64_t)a3 otherExecutableSpec:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end