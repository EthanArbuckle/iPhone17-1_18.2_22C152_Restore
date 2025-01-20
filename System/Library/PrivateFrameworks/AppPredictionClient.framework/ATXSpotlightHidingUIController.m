@interface ATXSpotlightHidingUIController
+ (id)normalizedIdentifier:(id)a3;
- (BOOL)_autoShortcutHasBeenHiddenForSearchResult:(id)a3 withFeedbackManager:(id)a4;
- (BOOL)_contextHasBeenHiddenForSearchResult:(id)a3 adapter:(id)a4 feedbackManager:(id)a5;
- (BOOL)_isExecutableIdentifierRecognized:(id)a3;
- (BOOL)_shouldAddHidingButtonItemForContextIdentifier:(id)a3;
- (BOOL)_shouldAddHidingButtonItemForExecutableIdentifier:(id)a3;
- (BOOL)shouldHideSearchResult:(id)a3;
- (id)_actionTypeButtonItemWithBundleIdentifier:(id)a3;
- (id)_actionTypeButtonItemWithExecutableIdentifier:(id)a3;
- (id)_contextIdentifierWithPredictionReasons:(unint64_t)a3;
- (id)_entityButtonItemWithWithSearchEntity:(id)a3;
- (id)_excludedFronHindingExecutableidentifiers;
- (id)_hideActionTitleWithBundleIdentifier:(id)a3;
- (id)_hideActionTitleWithExecutableIdentifier:(id)a3;
- (id)_hideContextActionTitleWithContextIdentifier:(id)a3;
- (id)_hideContextButtonItemWithContextIdentifier:(id)a3;
- (id)_hideContextButtonItemWithReasons:(unint64_t)a3;
- (id)_hideContextSymbolImageWithContextIdentifier:(id)a3;
- (id)_hideWebsiteButtonItemWithIdentifier:(id)a3;
- (id)_hidingCommandButtonItemWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5 isAction:(BOOL)a6;
- (id)_hidingPreviewButtonItemsWithBundleIdentifier:(id)a3 context:(unint64_t)a4;
- (id)_hidingPreviewButtonItemsWithExecutableIdentifier:(id)a3 context:(unint64_t)a4;
- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 entity:(id)a4;
- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 queryTopic:(id)a4;
- (id)_hidingPreviewButtonItemsWithURL:(id)a3 identifier:(id)a4 context:(unint64_t)a5;
- (id)_identifierWithEntity:(id)a3;
- (id)_identifierWithSearchResult:(id)a3;
- (id)_identifierWithSuggestion:(id)a3;
- (id)_localizableKeyWithExecutableIdentifier:(id)a3;
- (id)_localizedTitleWithQueryTopic:(id)a3;
- (id)_makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:(BOOL)a3 ForResult:(id)a4;
- (id)_nameWithNearbySuggestionIdentifier:(id)a3;
- (id)_nearbySuggestionIdentifierWithName:(id)a3;
- (id)_subMenuButtonItemWithItems:(id)a3;
- (id)_symbolNameWithQueryTopic:(id)a3;
- (void)_addHideContextButtonItemForSearchResult:(id)a3 toButtonItems:(id)a4;
- (void)_addHidingButtonToAutoShortcut:(id)a3;
- (void)_addHidingPreviewButtonItemsToSearchResult:(id)a3;
- (void)_addSwipeButtonItemToCardSection:(id)a3 previewButtonItems:(id)a4;
- (void)addHidingPreviewButtonItemsToServerResultSections:(id)a3;
@end

@implementation ATXSpotlightHidingUIController

- (BOOL)shouldHideSearchResult:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v4 sectionBundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v50 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "shouldHideSearchResult searchResult.sectionBundleIdentifier:%@", buf, 0xCu);
  }
  v9 = [v4 sectionBundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.spotlight.dec.zkw.recents"];

  if (v10)
  {
    v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = @"com.apple.spotlight.dec.zkw.recents";
      v12 = "shouldHideSearchResult NO in %@";
      v13 = v11;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v15 = [v4 sectionBundleIdentifier];
  int v16 = [v15 isEqualToString:@"com.apple.searchd.suggestions"];

  if (v16)
  {
    v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "shouldHideSearchResult NO in com.apple.searchd.suggestions";
      v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v17) = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 proactiveSuggestion], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v19;
    v20 = [(ATXSpotlightHidingUIController *)self _identifierWithSuggestion:v19];
    int v21 = [v5 hasBeenHiddenEntityWithIdentifier:v20];
    v22 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v11 uiSpecification];
      v24 = [v23 title];
      *(_DWORD *)buf = 138412802;
      v50 = v20;
      __int16 v51 = 2112;
      v52 = v24;
      __int16 v53 = 1024;
      int v54 = v21;
      _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier:%@ for suggestion:%@ hidden=%{BOOL}d", buf, 0x1Cu);
    }
    if (v21)
    {
      LOBYTE(v17) = 1;
    }
    else
    {
      int v17 = [v5 contextHasBeenHiddenForSuggestion:v11];
      v37 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [v11 uiSpecification];
        v39 = [v38 title];
        *(_DWORD *)buf = 138412546;
        v50 = v39;
        __int16 v51 = 1024;
        LODWORD(v52) = v17;
        _os_log_impl(&dword_1A790D000, v37, OS_LOG_TYPE_DEFAULT, "contextHasBeenHiddenForSuggestion :%@ hidden=%{BOOL}d", buf, 0x12u);
      }
    }
  }
  else
  {
    getSPSearchSuggestionResultClass();
    if (objc_opt_isKindOfClass())
    {
      v42 = v6;
      id v43 = v4;
      v41 = v4;
      [v41 searchEntities];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            v31 = [(ATXSpotlightHidingUIController *)self _identifierWithEntity:v30];
            v32 = v5;
            int v33 = [v5 hasBeenHiddenEntityWithIdentifier:v31];
            v34 = __atxlog_handle_zkw_hide();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v50 = v31;
              __int16 v51 = 2112;
              v52 = v30;
              __int16 v53 = 1024;
              int v54 = v33;
              _os_log_impl(&dword_1A790D000, v34, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier:%@ for entity:%@ hidden=%{BOOL}d", buf, 0x1Cu);
            }

            if (v33)
            {

              LOBYTE(v17) = 1;
              v5 = v32;
              v11 = v41;
              v6 = v42;
              goto LABEL_37;
            }
            v5 = v32;
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      v11 = v41;
      v6 = v42;
      LOBYTE(v17) = [(ATXSpotlightHidingUIController *)self _contextHasBeenHiddenForSearchResult:v41 adapter:v42 feedbackManager:v5];
LABEL_37:

      id v4 = v43;
    }
    else
    {
      v11 = [(ATXSpotlightHidingUIController *)self _identifierWithSearchResult:v4];
      if (![v11 length])
      {
        v40 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          -[ATXSpotlightHidingUIController shouldHideSearchResult:]();
        }

        goto LABEL_10;
      }
      int v35 = [v5 hasBeenHiddenEntityWithIdentifier:v11];
      v36 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v50 = (__CFString *)v11;
        __int16 v51 = 1024;
        LODWORD(v52) = v35;
        _os_log_impl(&dword_1A790D000, v36, OS_LOG_TYPE_DEFAULT, "hasBeenHiddenEntityWithIdentifier resultIdentifier:%@ hidden=%{BOOL}d", buf, 0x12u);
      }

      LOBYTE(v17) = (v35 & 1) != 0
                 || [(ATXSpotlightHidingUIController *)self _contextHasBeenHiddenForSearchResult:v4 adapter:v6 feedbackManager:v5]|| [(ATXSpotlightHidingUIController *)self _autoShortcutHasBeenHiddenForSearchResult:v4 withFeedbackManager:v5];
    }
  }
LABEL_11:

  return v17;
}

- (BOOL)_contextHasBeenHiddenForSearchResult:(id)a3 adapter:(id)a4 feedbackManager:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v7 sectionBundleIdentifier];
  if (v10)
  {
    v11 = [v8 contextCodeIdentifierWithSectionBundleIdentifier:v10];
    int v12 = [v9 contextHasBeenHiddenForContextIdentifier:v11];
    v13 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      int v16 = v11;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "contextHasBeenHiddenForContextIdentifier :%@ hidden=%{BOOL}d", (uint8_t *)&v15, 0x12u);
    }
  }
  else
  {
    v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      int v16 = v7;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightHidingUIController contextHasBeenHiddenForSearchResult:%@ sectionBundleIdentifier is NIL hidden=NO", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)_autoShortcutHasBeenHiddenForSearchResult:(id)a3 withFeedbackManager:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  getSPSearchSuggestionResultClass();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v5 sectionBundleIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"],
        v7,
        v8))
  {
    uint64_t v9 = [v5 relatedAppIdentifier];
  }
  else
  {
    uint64_t v9 = [v5 applicationBundleIdentifier];
  }
  int v10 = (void *)v9;
  v11 = [v5 identifier];
  int v12 = [v10 stringByAppendingString:v11];
  int v13 = [v6 autoShortcutHasBeenHiddenForIdentifier:v12];

  uint32_t v14 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v5 identifier];
    int v16 = [v10 stringByAppendingString:v15];
    int v18 = 138412546;
    uint64_t v19 = v16;
    __int16 v20 = 1024;
    int v21 = v13;
    _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "autoShortcutHasBeenHiddenForSearchResult :%@ hidden=%{BOOL}d", (uint8_t *)&v18, 0x12u);
  }
  return v13;
}

- (id)_identifierWithSearchResult:(id)a3
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 normalizedTopic];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 normalizedTopic];
    int v8 = [v7 queryType];
    switch(v8)
    {
      case 3:
        int v16 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = [v7 query];
          int v28 = 138412290;
          *(void *)v29 = v17;
          _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeSports identifier queryTopic.query=%@", (uint8_t *)&v28, 0xCu);
        }
        uint64_t v18 = [v7 query];
        break;
      case 6:
        uint64_t v19 = [v7 query];
        int v10 = [(ATXSpotlightHidingUIController *)self _nearbySuggestionIdentifierWithName:v19];

        __int16 v20 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          *(void *)v29 = v10;
          _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeRelatePOI identifier =%@", (uint8_t *)&v28, 0xCu);
        }

        goto LABEL_29;
      case 4:
        uint64_t v9 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          *(void *)v29 = @"zkw.hiding.topic.weather";
          _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult kSFQueryTopicTypeWeather queryTopic weather identifier %@", (uint8_t *)&v28, 0xCu);
        }

        int v10 = @"zkw.hiding.topic.weather";
        goto LABEL_29;
      default:
        int v21 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [v7 queryType];
          v23 = [v4 identifier];
          int v28 = 67109378;
          v29[0] = v22;
          LOWORD(v29[1]) = 2112;
          *(void *)((char *)&v29[1] + 2) = v23;
          _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult queryTopic.queryType=%d default identifier %@", (uint8_t *)&v28, 0x12u);
        }
        v24 = [v4 identifier];
        uint64_t v25 = [v24 length];

        if (!v25)
        {
          uint64_t v26 = __atxlog_handle_zkw_hide();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[ATXSpotlightHidingUIController _identifierWithSearchResult:]();
          }
        }
        uint64_t v18 = [v4 identifier];
        break;
    }
    int v10 = (__CFString *)v18;
LABEL_29:

    goto LABEL_30;
  }
  v11 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v4 identifier];
    int v28 = 138412290;
    *(void *)v29 = v12;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "_identifierWithSearchResult default identifier %@", (uint8_t *)&v28, 0xCu);
  }
  int v13 = [v4 identifier];
  uint64_t v14 = [v13 length];

  if (!v14)
  {
    int v15 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _identifierWithSearchResult:]();
    }
  }
  int v10 = [v4 identifier];
LABEL_30:

  return v10;
}

- (id)_identifierWithSuggestion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 executableSpecification];
  id v6 = [v5 executableIdentifier];

  v7 = [(id)objc_opt_class() normalizedIdentifier:v6];

  int v8 = [v4 executableSpecification];
  uint64_t v9 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableSpecification = %@", (uint8_t *)&v27, 0xCu);
  }

  int v10 = [v8 executableObject];
  v11 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v10;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableObject=%@", (uint8_t *)&v27, 0xCu);
  }

  if ([v7 hasPrefix:@"is.workflow.actions.openurl"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      int v13 = [v12 contextualAction];
      uint64_t v14 = [v13 associatedAppBundleIdentifier];
      int v15 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        id v28 = v14;
        _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: bundleIdentifier = %@", (uint8_t *)&v27, 0xCu);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v14 isEqualToString:@"com.apple.mobilesafari"])
      {
        int v16 = [v13 url];
        objc_msgSend(v16, "_lp_simplifiedDisplayString");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412546;
          id v28 = v16;
          __int16 v29 = 2112;
          id v30 = v17;
          _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: url = %@ urlIdentifier=%@", (uint8_t *)&v27, 0x16u);
        }

        if (![v17 length])
        {
          uint64_t v19 = __atxlog_handle_zkw_hide();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[ATXSpotlightHidingUIController _identifierWithSuggestion:]();
          }
        }
      }
      else
      {
        id v17 = v14;
      }

LABEL_29:
      goto LABEL_30;
    }
  }
  if ([(ATXSpotlightHidingUIController *)self _isExecutableIdentifierRecognized:v7])
  {
    __int16 v20 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableIdentifier %@ is recognized. Using it", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
    int v21 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v12 bundleId];
      int v27 = 138412290;
      id v28 = v22;
      _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: default ATXAction identifier=bundleId=%@", (uint8_t *)&v27, 0xCu);
    }
    id v17 = [v12 bundleId];
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([v7 length]) {
      goto LABEL_22;
    }
    __int16 v20 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _identifierWithSuggestion:]();
    }
LABEL_21:

LABEL_22:
    id v17 = v7;
    goto LABEL_30;
  }
  v24 = [v10 clipMetadata];
  uint64_t v25 = [v24 clipName];

  id v17 = [(ATXSpotlightHidingUIController *)self _nearbySuggestionIdentifierWithName:v25];
  uint64_t v26 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v17;
    _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: ATXHeroData identifier with heroData.clipMetadata.clipName=%@", (uint8_t *)&v27, 0xCu);
  }

LABEL_30:

  return v17;
}

- (id)_identifierWithEntity:(id)a3
{
  id v3 = a3;
  getSPSearchContactEntityClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_11;
  }
  id v4 = v3;
  id v5 = [v4 contactIdentifier];

  if (v5)
  {
    uint64_t v6 = [v4 contactIdentifier];
LABEL_9:
    v7 = (void *)v6;
    goto LABEL_10;
  }
  int v8 = [v4 personIdentifier];

  if (v8)
  {
    uint64_t v6 = [v4 personIdentifier];
    goto LABEL_9;
  }
  v7 = [v4 personQueryIdentifier];

  if (v7)
  {
    uint64_t v6 = [v4 personQueryIdentifier];
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  if (![v7 length])
  {
    uint64_t v9 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _identifierWithEntity:]();
    }
  }

  return v7;
}

- (void)addHidingPreviewButtonItemsToServerResultSections:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = [v4 count];
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "addHidingPreviewButtonItemsToServerResultSections %lu sections", buf, 0xCu);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        int v8 = [v7 bundleIdentifier];
        if (([v8 isEqualToString:@"com.apple.spotlight.dec.zkw.recents"] & 1) == 0)
        {
          uint64_t v9 = [v7 bundleIdentifier];
          char v10 = [v9 isEqualToString:@"com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"];

          if (v10) {
            goto LABEL_18;
          }
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          int v8 = [v7 results];
          uint64_t v11 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v31 != v13) {
                  objc_enumerationMutation(v8);
                }
                [(ATXSpotlightHidingUIController *)self _addHidingPreviewButtonItemsToSearchResult:*(void *)(*((void *)&v30 + 1) + 8 * j)];
              }
              uint64_t v12 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v12);
          }
        }

LABEL_18:
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        int v15 = [v7 results];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              __int16 v20 = *(void **)(*((void *)&v26 + 1) + 8 * k);
              int v21 = [v20 sectionBundleIdentifier];
              int v22 = [v21 isEqualToString:@"com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"];

              if (v22) {
                [(ATXSpotlightHidingUIController *)self _addHidingButtonToAutoShortcut:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v17);
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v25);
  }
}

- (void)_addHidingButtonToAutoShortcut:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldUseCompactDisplay]
    && ([v4 compactCard], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)v5;
    v7 = [v4 compactCard];
  }
  else
  {
    v7 = [v4 inlineCard];
  }
  int v8 = [v7 cardSections];
  uint64_t v9 = [v8 firstObject];

  char v10 = [(ATXSpotlightHidingUIController *)self _makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:1 ForResult:v4];
  uint64_t v11 = [(ATXSpotlightHidingUIController *)self _makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:0 ForResult:v4];
  uint64_t v12 = [v9 previewButtonItems];
  if (v12)
  {
    uint64_t v13 = [v9 previewButtonItems];
    uint64_t v14 = [v13 arrayByAddingObject:v10];
    [v9 setPreviewButtonItems:v14];
  }
  else
  {
    v19[0] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v9 setPreviewButtonItems:v13];
  }

  int v15 = [v9 trailingSwipeButtonItems];
  if (v15)
  {
    uint64_t v16 = [v9 trailingSwipeButtonItems];
    uint64_t v17 = [v16 arrayByAddingObject:v11];
    [v9 setTrailingSwipeButtonItems:v17];
  }
  else
  {
    uint64_t v18 = v11;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v9 setTrailingSwipeButtonItems:v16];
  }
}

- (id)_makeClearButtonItemForAutoShortcutAndShouldClearWholeSection:(BOOL)a3 ForResult:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  v7 = [v5 bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"HIDE" value:&stru_1EFD9B408 table:0];
  NSSelectorFromString(&cfstr_Relatedappiden.isa);
  if (objc_opt_respondsToSelector()) {
    [v6 valueForKey:@"_relatedAppIdentifier"];
  }
  else {
  uint64_t v9 = [v6 applicationBundleIdentifier];
  }

  if (v9)
  {
    char v10 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v9 error:0];
    uint64_t v11 = [v10 localizedName];

    uint64_t v12 = NSString;
    uint64_t v13 = [v7 localizedStringForKey:@"HIDE_ALL_APP_SHORTCUT_SUGGESTIONS" value:&stru_1EFD9B408 table:0];
    uint64_t v14 = [v12 stringWithValidatedFormat:v13, @"%@", 0, v11 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v4) {
    int v15 = v14;
  }
  else {
    int v15 = v8;
  }
  id v16 = v15;
  if (v4)
  {
    uint64_t v17 = objc_opt_new();
    [v17 setSymbolName:@"hand.thumbsdown"];
    [v17 setIsTemplate:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = objc_opt_new();
  [v18 setCategory:2];
  [v18 setShouldClearWholeSection:v4];
  uint64_t v19 = objc_opt_new();
  [v19 setTitle:v16];
  [v19 setImage:v17];
  [v19 setCommand:v18];
  [v19 setIsDestructive:1];

  return v19;
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = (uint64_t)v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: %@", buf, 0xCu);
  }

  id v6 = [v4 inlineCard];
  v7 = [v6 cardSections];
  int v8 = [v7 firstObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 proactiveSuggestion], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v10 = v9;
    uint64_t v11 = [v9 uiSpecification];
    uint64_t v12 = [v11 predictionReasons];

    if (v12)
    {
      uint64_t v13 = [v10 executableSpecification];
      uint64_t v14 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v13;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: executableSpecification = %@", buf, 0xCu);
      }

      uint64_t v15 = [v13 executableObject];
      id v16 = [(ATXSpotlightHidingUIController *)self _identifierWithSuggestion:v10];
      v50 = v13;
      uint64_t v17 = [v13 executableIdentifier];
      if ([v17 hasPrefix:@"is.workflow.actions.openurl"])
      {
        objc_opt_class();
        uint64_t v18 = (void *)v15;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          __int16 v20 = v18;
          id v49 = v18;
          int v21 = [v49 contextualAction];
          int v22 = [v21 associatedAppBundleIdentifier];
          objc_opt_class();
          long long v47 = v22;
          v48 = v21;
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v22 isEqualToString:@"com.apple.mobilesafari"])
          {
            long long v46 = [v21 url];
            v23 = __atxlog_handle_zkw_hide();
            uint64_t v24 = v50;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v53 = (uint64_t)v46;
              _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: url = %@", buf, 0xCu);
            }

            uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithURL:v46 identifier:v16 context:v12];
          }
          else
          {
            long long v35 = __atxlog_handle_zkw_hide();
            uint64_t v24 = v50;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v53 = (uint64_t)v16;
              _os_log_impl(&dword_1A790D000, v35, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: bundleIdentifier = %@", buf, 0xCu);
            }

            uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithBundleIdentifier:v16 context:v12];
          }

LABEL_44:
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v18 = (void *)v15;
      }
      if ([(ATXSpotlightHidingUIController *)self _isExecutableIdentifierRecognized:v16])
      {
        long long v33 = __atxlog_handle_zkw_hide();
        __int16 v20 = v18;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v53 = (uint64_t)v16;
          _os_log_impl(&dword_1A790D000, v33, OS_LOG_TYPE_DEFAULT, "_identifierWithSuggestion: executableIdentifier %@ is recognized. Using it", buf, 0xCu);
        }
      }
      else
      {
        objc_opt_class();
        __int16 v20 = v18;
        if (objc_opt_isKindOfClass())
        {
          id v49 = v18;
          long long v34 = __atxlog_handle_zkw_hide();
          uint64_t v24 = v50;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = (uint64_t)v49;
            _os_log_impl(&dword_1A790D000, v34, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: default action=%@", buf, 0xCu);
          }

          uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithBundleIdentifier:v16 context:v12];
          goto LABEL_44;
        }
      }
      uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithExecutableIdentifier:v16 context:v12];
      uint64_t v24 = v50;
LABEL_45:

      goto LABEL_46;
    }
    long long v30 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      long long v31 = [v10 uiSpecification];
      long long v32 = [v31 title];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = (uint64_t)v32;
      _os_log_impl(&dword_1A790D000, v30, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: suggestion %@ has context ATXSuggestionPredictionReasonUnknown. Skipping", buf, 0xCu);
    }
  }
  else
  {
    getSPSearchSuggestionResultClass();
    if (objc_opt_isKindOfClass())
    {
      char v10 = v4;
      uint64_t v24 = [v10 searchEntities];
      if ([v24 count] != 1)
      {
        long long v29 = __atxlog_handle_zkw_hide();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ATXSpotlightHidingUIController _addHidingPreviewButtonItemsToSearchResult:](v24, v29);
        }

        uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithExecutableIdentifier:@"result class not handled" context:0];
        goto LABEL_47;
      }
      __int16 v20 = [v24 firstObject];
      long long v26 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v20;
        _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: SPSearchSuggestionResult entity=%@", buf, 0xCu);
      }

      uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithSearchResult:v10 entity:v20];
LABEL_46:

LABEL_47:
      goto LABEL_48;
    }
    long long v27 = [v4 normalizedTopic];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if (v28)
    {
      char v10 = [v4 normalizedTopic];
      uint64_t v25 = [(ATXSpotlightHidingUIController *)self _hidingPreviewButtonItemsWithSearchResult:v4 queryTopic:v10];
LABEL_48:

      long long v36 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v25;
        _os_log_impl(&dword_1A790D000, v36, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: SPSearchSuggestionResult previewButtonItems=%@", buf, 0xCu);
      }

      [(ATXSpotlightHidingUIController *)self _addSwipeButtonItemToCardSection:v8 previewButtonItems:v25];
      long long v37 = [(ATXSpotlightHidingUIController *)self _subMenuButtonItemWithItems:v25];
      v38 = [v8 previewButtonItems];
      uint64_t v39 = [v38 count];

      v40 = __atxlog_handle_zkw_hide();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          uint64_t v42 = [v8 previewButtonItems];
          uint64_t v43 = [v42 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v53 = v43;
          _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: %lu previous buttons", buf, 0xCu);
        }
        long long v44 = [v8 previewButtonItems];
        long long v45 = [v44 arrayByAddingObject:v37];
        [v8 setPreviewButtonItems:v45];
      }
      else
      {
        if (v41)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_DEFAULT, "_addHidingPreviewButtonItemsToSearchResult: no previous button", buf, 2u);
        }

        __int16 v51 = v37;
        long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        [v8 setPreviewButtonItems:v44];
      }

      char v10 = v25;
      goto LABEL_58;
    }
    char v10 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _addHidingPreviewButtonItemsToSearchResult:](v4, v10);
    }
  }
LABEL_58:
}

- (void)_addSwipeButtonItemToCardSection:(id)a3 previewButtonItems:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"DONT_SUGGEST_" value:&stru_1EFD9B408 table:0];
  [v7 setTitle:v9];
  [v7 setIsDestructive:1];
  char v10 = objc_opt_new();
  [v7 setCommand:v10];

  [v7 setPreviewButtonItems:v6];
  uint64_t v11 = [v5 previewButtonItems];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [v5 previewButtonItems];
    uint64_t v14 = [v13 arrayByAddingObject:v7];
    [v5 setTrailingSwipeButtonItems:v14];
  }
  else
  {
    v15[0] = v7;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v5 setTrailingSwipeButtonItems:v13];
  }
}

- (id)_subMenuButtonItemWithItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"DONT_SUGGEST_" value:&stru_1EFD9B408 table:0];
  [v4 setTitle:v6];
  v7 = objc_opt_new();
  [v7 setSymbolName:@"hand.thumbsdown"];
  [v4 setImage:v7];
  [v4 setPreviewButtonItems:v3];

  return v4;
}

- (id)_hidingPreviewButtonItemsWithBundleIdentifier:(id)a3 context:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithBundleIdentifier:%@", (uint8_t *)&v14, 0xCu);
  }

  int v8 = objc_opt_new();
  uint64_t v9 = [(ATXSpotlightHidingUIController *)self _actionTypeButtonItemWithBundleIdentifier:v6];
  if (v9)
  {
    [v8 addObject:v9];
  }
  else
  {
    char v10 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithBundleIdentifier:context:]();
    }
  }
  uint64_t v11 = [(ATXSpotlightHidingUIController *)self _hideContextButtonItemWithReasons:a4];
  if (v11)
  {
    [v8 addObject:v11];
  }
  else
  {
    uint64_t v12 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithBundleIdentifier:%@ dontSuggestContextButtonItem is nil", (uint8_t *)&v14, 0xCu);
    }
  }

  return v8;
}

- (id)_hidingPreviewButtonItemsWithExecutableIdentifier:(id)a3 context:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@", (uint8_t *)&v15, 0xCu);
  }

  int v8 = objc_opt_new();
  uint64_t v9 = [(id)objc_opt_class() normalizedIdentifier:v6];

  if ([(ATXSpotlightHidingUIController *)self _shouldAddHidingButtonItemForExecutableIdentifier:v9])
  {
    char v10 = [(ATXSpotlightHidingUIController *)self _actionTypeButtonItemWithExecutableIdentifier:v9];
    if (v10)
    {
      [v8 addObject:v10];
    }
    else
    {
      uint64_t v11 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:]();
      }
    }
  }
  uint64_t v12 = [(ATXSpotlightHidingUIController *)self _hideContextButtonItemWithReasons:a4];
  if (v12)
  {
    [v8 addObject:v12];
  }
  else
  {
    uint64_t v13 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:]();
    }
  }

  return v8;
}

- (id)_hidingPreviewButtonItemsWithURL:(id)a3 identifier:(id)a4 context:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithURL:%@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = [(ATXSpotlightHidingUIController *)self _hideWebsiteButtonItemWithIdentifier:v9];

  if (v12)
  {
    [v11 addObject:v12];
  }
  else
  {
    uint64_t v13 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithURL:identifier:context:]();
    }
  }
  int v14 = [(ATXSpotlightHidingUIController *)self _hideContextButtonItemWithReasons:a5];
  if (v14)
  {
    [v11 addObject:v14];
  }
  else
  {
    int v15 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithURL:identifier:context:]();
    }
  }

  return v11;
}

- (id)_localizedTitleWithQueryTopic:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v5 = [v3 queryType];
  if (v5 == 3)
  {
    id v6 = @"DONT_SUGGEST_GAME";
    goto LABEL_5;
  }
  if (v5 == 4)
  {
    id v6 = @"DONT_SUGGEST_WEATHER";
LABEL_5:
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1EFD9B408 table:0];
    goto LABEL_7;
  }
  uint64_t v7 = [v3 query];
LABEL_7:
  id v8 = (void *)v7;

  return v8;
}

- (id)_symbolNameWithQueryTopic:(id)a3
{
  int v3 = [a3 queryType];
  id v4 = @"sportscourt";
  if (v3 != 3) {
    id v4 = 0;
  }
  if (v3 == 4) {
    return @"sun.max";
  }
  else {
    return v4;
  }
}

- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 queryTopic:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(ATXSpotlightHidingUIController *)self _identifierWithSearchResult:v6];
  uint64_t v10 = [v9 length];
  uint64_t v11 = __atxlog_handle_zkw_hide();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult(queryTopic):%@ queryTopic:%@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v12 = [(ATXSpotlightHidingUIController *)self _localizedTitleWithQueryTopic:v7];
    uint64_t v13 = [(ATXSpotlightHidingUIController *)self _symbolNameWithQueryTopic:v7];
    int v14 = [(ATXSpotlightHidingUIController *)self _hidingCommandButtonItemWithIdentifier:v9 title:v12 symbolName:v13 isAction:0];
    if (v14)
    {
      [v8 addObject:v14];
    }
    else
    {
      int v15 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithExecutableIdentifier:context:]();
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:queryTopic:]();
  }

  [(ATXSpotlightHidingUIController *)self _addHideContextButtonItemForSearchResult:v6 toButtonItems:v8];

  return v8;
}

- (id)_hidingPreviewButtonItemsWithSearchResult:(id)a3 entity:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult entity:%@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = objc_opt_new();
  uint64_t v10 = [(ATXSpotlightHidingUIController *)self _entityButtonItemWithWithSearchEntity:v6];
  if (v10)
  {
    [v9 addObject:v10];
  }
  else
  {
    uint64_t v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hidingPreviewButtonItemsWithSearchResult:entity:]();
    }
  }
  [(ATXSpotlightHidingUIController *)self _addHideContextButtonItemForSearchResult:v7 toButtonItems:v9];

  return v9;
}

- (void)_addHideContextButtonItemForSearchResult:(id)a3 toButtonItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sectionBundleIdentifier];
  if (v8)
  {
    id v9 = objc_opt_new();
    uint64_t v10 = [v9 contextCodeIdentifierWithSectionBundleIdentifier:v8];
    uint64_t v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      int v17 = v10;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "_hidingPreviewButtonItemsWithSearchResult sectionBundleIdentifier=%@ contextCode=%@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v12 = [(ATXSpotlightHidingUIController *)self _hideContextButtonItemWithContextIdentifier:v10];
    if (v12)
    {
      [v7 addObject:v12];
    }
    else
    {
      int v13 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:]();
      }
    }
  }
  else
  {
    id v9 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:toButtonItems:]();
    }
  }
}

- (id)_entityButtonItemWithWithSearchEntity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  getSPSearchContactEntityClass();
  if (objc_opt_isKindOfClass())
  {
    int v5 = v4;
    id v6 = [v5 name];
    if ([v6 length])
    {
      id v7 = [(ATXSpotlightHidingUIController *)self _identifierWithEntity:v5];
      if ([v7 length])
      {
        id v8 = [(ATXSpotlightHidingUIController *)self _hidingCommandButtonItemWithIdentifier:v7 title:v6 symbolName:@"person" isAction:0];
LABEL_14:

        goto LABEL_15;
      }
      id v9 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _entityButtonItemWithWithSearchEntity:]();
      }
    }
    else
    {
      id v7 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _entityButtonItemWithWithSearchEntity:]();
      }
    }
    id v8 = 0;
    goto LABEL_14;
  }
  int v5 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "_entityButtonItemWithWithSearchEntity:%@ not a SPSearchContactEntity", (uint8_t *)&v11, 0xCu);
  }
  id v8 = 0;
LABEL_15:

  return v8;
}

- (id)_actionTypeButtonItemWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(ATXSpotlightHidingUIController *)self _hideActionTitleWithBundleIdentifier:v4];
  id v6 = [(ATXSpotlightHidingUIController *)self _hidingCommandButtonItemWithIdentifier:v4 title:v5 symbolName:0 isAction:1];

  return v6;
}

- (id)_actionTypeButtonItemWithExecutableIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [&unk_1EFDF5040 objectForKey:v4];
  id v6 = [(ATXSpotlightHidingUIController *)self _hideActionTitleWithExecutableIdentifier:v4];
  if ([v6 length])
  {
    id v7 = [(ATXSpotlightHidingUIController *)self _hidingCommandButtonItemWithIdentifier:v4 title:v6 symbolName:v5 isAction:1];
  }
  else
  {
    id v8 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _actionTypeButtonItemWithExecutableIdentifier:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_hideWebsiteButtonItemWithIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"DONT_SUGGEST_URL" value:&stru_1EFD9B408 table:0];
  id v8 = [(ATXSpotlightHidingUIController *)self _hidingCommandButtonItemWithIdentifier:v5 title:v7 symbolName:@"globe" isAction:1];

  return v8;
}

- (id)_hidingCommandButtonItemWithIdentifier:(id)a3 title:(id)a4 symbolName:(id)a5 isAction:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  [v12 setTitle:v10];

  if ([v9 length])
  {
    uint64_t v13 = objc_opt_new();
    [v13 setSymbolName:v9];
    [v13 setIsTemplate:1];
    [v12 setImage:v13];
  }
  int v14 = objc_opt_new();
  [v14 setProactiveIdentifier:v11];

  if (v6) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 5;
  }
  [v14 setCategory:v15];
  [v14 setShouldClearWholeSection:0];
  [v12 setCommand:v14];

  return v12;
}

- (id)_hideContextButtonItemWithReasons:(unint64_t)a3
{
  id v4 = -[ATXSpotlightHidingUIController _contextIdentifierWithPredictionReasons:](self, "_contextIdentifierWithPredictionReasons:");
  if (v4)
  {
    id v5 = [(ATXSpotlightHidingUIController *)self _hideContextButtonItemWithContextIdentifier:v4];
  }
  else
  {
    BOOL v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hideContextButtonItemWithReasons:]();
    }

    id v5 = 0;
  }

  return v5;
}

- (id)_hideContextButtonItemWithContextIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(ATXSpotlightHidingUIController *)self _shouldAddHidingButtonItemForContextIdentifier:v4])
    {
      id v5 = objc_opt_new();
      BOOL v6 = [(ATXSpotlightHidingUIController *)self _hideContextSymbolImageWithContextIdentifier:v4];
      id v7 = [(ATXSpotlightHidingUIController *)self _hideContextActionTitleWithContextIdentifier:v4];
      [v5 setTitle:v7];
      [v5 setImage:v6];
      id v8 = objc_opt_new();
      [v8 setCategory:3];
      [v8 setShouldClearWholeSection:1];
      [v8 setProactiveIdentifier:v4];
      [v5 setCommand:v8];
      [v5 setIsDestructive:0];

      goto LABEL_8;
    }
  }
  else
  {
    id v9 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier:]();
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (id)_contextIdentifierWithPredictionReasons:(unint64_t)a3
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__21;
  id v9 = __Block_byref_object_dispose__21;
  id v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  if ([(id)v6[5] count] == 1)
  {
    int v3 = [(id)v6[5] firstObject];
  }
  else
  {
    int v3 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __74__ATXSpotlightHidingUIController__contextIdentifierWithPredictionReasons___block_invoke(uint64_t a1)
{
  stringForATXSuggestionPredictionReasonCode();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

- (BOOL)_shouldAddHidingButtonItemForExecutableIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXSpotlightHidingUIController *)self _excludedFronHindingExecutableidentifiers];
  int v6 = [v5 containsObject:v4];
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "_shouldAddHidingButtonItemForExecutableIdentifier: no hiding button item shown for executableIdentifier %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6 ^ 1;
}

- (id)_excludedFronHindingExecutableidentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"openPackageTrackingUrl", @"contactPhoneNumber", @"openUrl", @"returnCall", @"setAlarmForUnusualEarlyEvents", 0);
}

- (BOOL)_shouldAddHidingButtonItemForContextIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"UpcomingMedia", 0);
  int v5 = [v4 containsObject:v3];
  if (v5)
  {
    int v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "_shouldAddHidingButtonItemForExecutableIdentifier: no hiding button item shown for contextIdentifier %@", buf, 0xCu);
    }
  }
  return v5 ^ 1;
}

- (id)_hideActionTitleWithBundleIdentifier:(id)a3
{
  return +[ATXApplicationRecord localizedNameForBundle:a3];
}

- (id)_nearbySuggestionIdentifierWithName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [@"zkw.hiding.nearby:" stringByAppendingString:v3];
  }
  else
  {
    int v5 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _nearbySuggestionIdentifierWithName:]();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_nameWithNearbySuggestionIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasPrefix:@"zkw.hiding.nearby:"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"zkw.hiding.nearby:", "length")];
  }
  else
  {
    int v5 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = @"zkw.hiding.nearby:";
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "_nameWithNearbySuggestionIdentifier %@ is not prefixed by %@", (uint8_t *)&v7, 0x16u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_localizableKeyWithExecutableIdentifier:(id)a3
{
  return (id)[&unk_1EFDF5068 objectForKey:a3];
}

- (BOOL)_isExecutableIdentifierRecognized:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(ATXSpotlightHidingUIController *)self _excludedFronHindingExecutableidentifiers];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(ATXSpotlightHidingUIController *)self _localizableKeyWithExecutableIdentifier:v4];
    BOOL v7 = v8 != 0;
  }
  __int16 v9 = __atxlog_handle_zkw_hide();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 1024;
    BOOL v14 = v7;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "isExecutableIdentifierRecognized: %@ = %{BOOL}i", (uint8_t *)&v11, 0x12u);
  }

  return v7;
}

- (id)_hideActionTitleWithExecutableIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [(ATXSpotlightHidingUIController *)self _nameWithNearbySuggestionIdentifier:v4];
  if ([v6 length])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(ATXSpotlightHidingUIController *)self _localizableKeyWithExecutableIdentifier:v4];
    __int16 v9 = [v5 localizedStringForKey:v8 value:&stru_1EFD9B408 table:0];
    if (!v8)
    {
      uint64_t v10 = __atxlog_handle_zkw_hide();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXSpotlightHidingUIController _hideActionTitleWithExecutableIdentifier:]();
      }
    }
    id v7 = v9;
  }

  return v7;
}

- (id)_hideContextActionTitleWithContextIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [&unk_1EFDF5090 objectForKey:v3];
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:v4 value:&stru_1EFD9B408 table:0];
  }
  else
  {
    id v7 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hideContextActionTitleWithContextIdentifier:]();
    }

    id v6 = [NSString stringWithFormat:@"No title for %@", v3];
  }

  return v6;
}

- (id)_hideContextSymbolImageWithContextIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [&unk_1EFDF50B8 objectForKey:v3];
  if (v4)
  {
    int v5 = objc_opt_new();
    [v5 setSymbolName:v4];
    [v5 setIsTemplate:1];
  }
  else
  {
    id v6 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightHidingUIController _hideContextSymbolImageWithContextIdentifier:]();
    }

    int v5 = 0;
  }

  return v5;
}

+ (id)normalizedIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_1EFDF4EC0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  int v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(&unk_1EFDF4EC0);
      }
      int v5 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if ([v3 hasPrefix:v5]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [&unk_1EFDF4EC0 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        int v5 = v3;
        break;
      }
    }
  }
  id v9 = v5;

  return v9;
}

- (void)shouldHideSearchResult:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "hasBeenHiddenEntityWithIdentifier _identifierWithSearchResult returns empty result. hidden = NO", v2, v3, v4, v5, v6);
}

- (void)_identifierWithSearchResult:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController_identifierWithSearchResult EMPTY for search result %@", v2, v3, v4, v5, v6);
}

- (void)_identifierWithSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController _identifierWithSuggestion EMPTY for url %@", v2, v3, v4, v5, v6);
}

- (void)_identifierWithSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController _identifierWithSuggestion EMPTY for suggestion %@", v2, v3, v4, v5, v6);
}

- (void)_identifierWithEntity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController _identifierWithEntity EMPTY for searchEntity %@", v2, v3, v4, v5, v6);
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "_addHidingPreviewButtonItemsToSearchResult: searchSuggestionResult has %lu searchEntities", v3, 0xCu);
}

- (void)_addHidingPreviewButtonItemsToSearchResult:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 normalizedTopic];
  uint64_t v5 = [a1 normalizedTopic];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = objc_opt_class();
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "_addHidingPreviewButtonItemsToSearchResult not implemented for normalized topic %@ of class %@", (uint8_t *)&v6, 0x16u);
}

- (void)_hidingPreviewButtonItemsWithBundleIdentifier:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithBundleIdentifier:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithExecutableIdentifier:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithExecutableIdentifier:context:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithExecutableIdentifier:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithURL:identifier:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithURL:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithURL:identifier:context:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithURL:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithSearchResult:queryTopic:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult _identifierWithSearchResult returns empty result", v2, v3, v4, v5, v6);
}

- (void)_hidingPreviewButtonItemsWithSearchResult:entity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult entity:%@ dontSuggestActionButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_addHideContextButtonItemForSearchResult:toButtonItems:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController _addHideContextButtonItemForSearchResult:%@ sectionBundleIdentifier is NIL. skipping", v2, v3, v4, v5, v6);
}

- (void)_addHideContextButtonItemForSearchResult:toButtonItems:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hidingPreviewButtonItemsWithSearchResult contextIdentifier:%@ dontSuggestContextButtonItem is nil", v2, v3, v4, v5, v6);
}

- (void)_entityButtonItemWithWithSearchEntity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_entityButtonItemWithWithSearchEntity:%@ name is empty. Not creating button item", v2, v3, v4, v5, v6);
}

- (void)_entityButtonItemWithWithSearchEntity:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_entityButtonItemWithWithSearchEntity: _identifierWithEntity %@ is empty. Not creating button item", v2, v3, v4, v5, v6);
}

- (void)_actionTypeButtonItemWithExecutableIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_actionTypeButtonItemWithExecutableIdentifier:%@ gets a null title", v2, v3, v4, v5, v6);
}

- (void)_hideContextButtonItemWithReasons:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hideContextButtonItemWithReasons:%llu return null context identifier", v2, v3, v4, v5, v6);
}

- (void)_hideContextButtonItemWithContextIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightHidingUIController _hideContextButtonItemWithContextIdentifier: NIL. returns nil", v2, v3, v4, v5, v6);
}

- (void)_nearbySuggestionIdentifierWithName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "_nearbySuggestionIdentifierWithName null", v2, v3, v4, v5, v6);
}

- (void)_hideActionTitleWithExecutableIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hideActionTitleWithExecutableIdentifier: no title mapped for executableIdentifier %@", v2, v3, v4, v5, v6);
}

- (void)_hideContextActionTitleWithContextIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hideContextActionTitleWithContextIdentifier: no title mapped for contextIdentifier %@", v2, v3, v4, v5, v6);
}

- (void)_hideContextSymbolImageWithContextIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "_hideContextSymbolImageWithContextIdentifier: no symbolName mapped for contextIdentifier %@", v2, v3, v4, v5, v6);
}

@end