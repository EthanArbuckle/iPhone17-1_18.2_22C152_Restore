@interface APUIActionContextMenu
+ (id)actionProviderForSearchResult:(id)a3 dismissSearchResultHandler:(id)a4;
+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(id)a3;
@end

@implementation APUIActionContextMenu

+ (id)actionProviderForSearchResult:(id)a3 dismissSearchResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 type] == 23)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"Suggest Shortcut Less" value:&stru_26EFE9A30 table:0];

    v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"hand.thumbsdown"];
    v13 = (void *)MEMORY[0x263F1C3C0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke;
    v18[3] = &unk_264E3BD30;
    id v21 = a1;
    id v19 = v6;
    id v20 = v7;
    v14 = [v13 actionWithTitle:v11 image:v12 identifier:0 handler:v18];
    [v8 addObject:v14];
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_3;
  v16[3] = &unk_264E3BD58;
  id v17 = v8;
  v9 = (void *)MEMORY[0x23ECDF5D0](v16);

LABEL_6:
  return v9;
}

void __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(9, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_2;
  v7[3] = &unk_264E3BD08;
  uint64_t v9 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v2, v7);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v3, v4, v5);
  }
}

uint64_t __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _handleSuggestionDismissedWithATXActionSearchResult:*(void *)(a1 + 32)];
}

uint64_t __82__APUIActionContextMenu_actionProviderForSearchResult_dismissSearchResultHandler___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26EFE9A30 children:*(void *)(a1 + 32)];
}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 actionResponse];
  uint64_t v5 = [v4 blendingModelUICacheUpdateUUID];
  uint64_t v6 = [v5 UUIDString];

  id v7 = [v3 proactiveSuggestion];
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = (void *)MEMORY[0x263F250D8];
      v10 = [v7 uuid];
      v11 = [v10 UUIDString];
      v12 = objc_opt_new();
      v13 = [v9 actionSuggestionContextMenuDismissOnceEventWithSuggestionId:v11 actionBlendingCacheId:v6 date:v12];

      v14 = objc_opt_new();
      v15 = [MEMORY[0x263F25108] uiEventWithSpotlightEvent:v13];
      [v14 donateGenericUIEvent:v15];

      v16 = [MEMORY[0x263F25028] sharedInstance];
      [v16 addHiddenSuggestion:v8 duration:120 engagementRecordType:*MEMORY[0x263F25118]];

      id v17 = objc_opt_new();
      [v17 removeActionPredictionNotificationsMatchingSuggestion:v8 reply:0];

      v18 = objc_opt_new();
      [MEMORY[0x263F25020] logContextMenuFeedbackForDismissOnceWithSuggestion:v8 consumerSubType:21 tracker:v18];
      [MEMORY[0x263F25070] logUserInteractionFeedbackWithEngagementType:1 consumerSubType:21 tracker:v18];
      id v19 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v8 uuid];
        id v20 = [v24 UUIDString];
        v23 = [v8 executableSpecification];
        id v21 = [v23 executableDescription];
        v22 = [v8 executableSpecification];
        *(_DWORD *)buf = 138412802;
        v26 = v20;
        __int16 v27 = 2112;
        v28 = v21;
        __int16 v29 = 2048;
        uint64_t v30 = [v22 executableType];
        _os_log_impl(&dword_23C277000, v19, OS_LOG_TYPE_DEFAULT, "handled dismiss once in zkw actions for suggestion with uuid: %@ executable description: %@ executable type: %ld", buf, 0x20u);
      }
    }
    else
    {
      v13 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[APUIActionContextMenu _handleSuggestionDismissedWithATXActionSearchResult:]((uint64_t)v3, v13);
      }
    }
  }
  else
  {
    v13 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[APUIActionContextMenu _handleSuggestionDismissedWithATXActionSearchResult:]((uint64_t)v3, v13);
    }
  }
}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C277000, a2, OS_LOG_TYPE_ERROR, "could not find dismissed proactive suggestion for action search result: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_handleSuggestionDismissedWithATXActionSearchResult:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C277000, a2, OS_LOG_TYPE_ERROR, "could not find blending cache id for action search result: %@", (uint8_t *)&v2, 0xCu);
}

@end