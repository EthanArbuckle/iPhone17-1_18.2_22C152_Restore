@interface APUISuggestionsWidgetViewController
+ (BOOL)_isSuggestionShortcut:(id)a3;
+ (id)_actionWithSuggestion:(id)a3;
+ (id)_shortcutWithSuggestion:(id)a3;
- (APUISuggestionsWidgetView)widgetView;
- (APUISuggestionsWidgetViewController)initWithIdentifier:(id)a3 suggestionsClient:(id)a4 layoutSize:(unint64_t)a5;
- (BOOL)_canDismissSelectedSuggestion;
- (BOOL)_canSaveSelectedSuggestion;
- (BOOL)_canShowWhileLocked;
- (BOOL)isShowingContextMenu;
- (NSArray)applicationShortcutItems;
- (id)_suggestionIdsInLayout:(id)a3;
- (void)_updateLayoutAsynchronouslyWithSuggestionClient:(id)a3;
- (void)_updateWidgetViewIfPossible;
- (void)addVoiceShortcutViewController:(id)a3 didFinishWithVoiceShortcut:(id)a4 error:(id)a5;
- (void)addVoiceShortcutViewControllerDidCancel:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didSelectApplicationShortcutItem:(id)a3;
- (void)setShowingContextMenu:(BOOL)a3;
- (void)setWidgetView:(id)a3;
- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)verifyLayoutSizeCompatibility;
- (void)view:(id)a3 didFailExecutingSuggestion:(id)a4;
- (void)view:(id)a3 didFinishExecutingSuggestion:(id)a4;
- (void)view:(id)a3 didTapSuggestion:(id)a4;
- (void)viewDidLoad;
- (void)willShowContextMenuAtLocation:(CGPoint)a3;
@end

@implementation APUISuggestionsWidgetViewController

- (APUISuggestionsWidgetViewController)initWithIdentifier:(id)a3 suggestionsClient:(id)a4 layoutSize:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)APUISuggestionsWidgetViewController;
  v10 = [(APUIWidgetViewController *)&v21 initWithIdentifier:v8];
  v11 = v10;
  if (v10)
  {
    [(APUIWidgetViewController *)v10 setSuggestionClient:v9];
    v12 = objc_opt_new();
    [(APUIWidgetViewController *)v11 setWidgetIdentifiable:v12];

    v13 = [(APUIWidgetViewController *)v11 widgetIdentifiable];
    [v13 setWidgetUniqueId:v8];

    v14 = [(APUIWidgetViewController *)v11 widgetIdentifiable];
    [v14 setSize:a5];

    uint64_t v15 = *MEMORY[0x263F25148];
    v16 = [(APUIWidgetViewController *)v11 widgetIdentifiable];
    [v16 setExtensionBundleId:v15];

    v17 = ATXSpecialWidgetKindSiriSuggestions();
    v18 = [(APUIWidgetViewController *)v11 widgetIdentifiable];
    [v18 setWidgetKind:v17];

    [v9 registerObserver:v11];
    v19 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_225AE0000, v19, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUISuggestionsWidgetViewController initWithIdentifier %@", buf, 0xCu);
    }
  }
  return v11;
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)APUISuggestionsWidgetViewController;
  -[APUISuggestionsWidgetViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (!a3)
  {
    v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUISuggestionsWidgetViewController didMoveToParentViewController = nil", v6, 2u);
    }

    [(APUISuggestionsWidgetViewController *)self setShowingContextMenu:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)APUISuggestionsWidgetViewController;
  [(APUISuggestionsWidgetViewController *)&v32 viewDidLoad];
  v3 = __atxlog_handle_ui();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v35 = "-[APUISuggestionsWidgetViewController viewDidLoad]";
    _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  v4 = objc_alloc_init(APUISuggestionsWidgetView);
  [(APUISuggestionsWidgetViewController *)self setWidgetView:v4];

  v5 = [(APUISuggestionsWidgetViewController *)self widgetView];
  [v5 setDelegate:self];

  v6 = [(APUISuggestionsWidgetViewController *)self widgetView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [(APUISuggestionsWidgetViewController *)self view];
  id v8 = [(APUISuggestionsWidgetViewController *)self widgetView];
  [v7 addSubview:v8];

  v22 = (void *)MEMORY[0x263F08938];
  v31 = [(APUISuggestionsWidgetViewController *)self widgetView];
  v29 = [v31 topAnchor];
  v30 = [(APUISuggestionsWidgetViewController *)self view];
  v28 = [v30 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v33[0] = v27;
  v26 = [(APUISuggestionsWidgetViewController *)self widgetView];
  uint64_t v24 = [v26 bottomAnchor];
  v25 = [(APUISuggestionsWidgetViewController *)self view];
  id v23 = [v25 bottomAnchor];
  objc_super v21 = [v24 constraintEqualToAnchor:v23];
  v33[1] = v21;
  v20 = [(APUISuggestionsWidgetViewController *)self widgetView];
  v19 = [v20 leadingAnchor];
  id v9 = [(APUISuggestionsWidgetViewController *)self view];
  v10 = [v9 leadingAnchor];
  v11 = [v19 constraintEqualToAnchor:v10];
  v33[2] = v11;
  v12 = [(APUISuggestionsWidgetViewController *)self widgetView];
  v13 = [v12 trailingAnchor];
  v14 = [(APUISuggestionsWidgetViewController *)self view];
  uint64_t v15 = [v14 trailingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v33[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v22 activateConstraints:v17];

  v18 = [(APUIWidgetViewController *)self suggestionClient];
  [(APUISuggestionsWidgetViewController *)self _updateLayoutAsynchronouslyWithSuggestionClient:v18];
}

- (void)_updateWidgetViewIfPossible
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_showingContextMenu)
  {
    v3 = __atxlog_handle_ui();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL showingContextMenu = self->_showingContextMenu;
      *(_DWORD *)buf = 136446466;
      id v8 = "-[APUISuggestionsWidgetViewController _updateWidgetViewIfPossible]";
      __int16 v9 = 1024;
      BOOL v10 = showingContextMenu;
      _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s aborted: _showingContextMenu=%{BOOL}d", buf, 0x12u);
    }
  }
  else
  {
    id v6 = [(APUISuggestionsWidgetViewController *)self widgetView];
    v5 = [(APUIWidgetViewController *)self layout];
    [v6 updateWithSuggestionLayout:v5];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__APUISuggestionsWidgetViewController_traitCollectionDidChange___block_invoke;
  block[3] = &unk_2647647C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__APUISuggestionsWidgetViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 suggestionClient];
  [v1 _updateLayoutAsynchronouslyWithSuggestionClient:v2];
}

- (id)_suggestionIdsInLayout:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(APUIWidgetViewController *)self layout];
  id v6 = [v5 minSuggestionListInLayout];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) uuid];
        v12 = [v11 UUIDString];
        [v4 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__APUISuggestionsWidgetViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke;
  v6[3] = &unk_264764798;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __88__APUISuggestionsWidgetViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLayoutAsynchronouslyWithSuggestionClient:*(void *)(a1 + 40)];
}

- (void)_updateLayoutAsynchronouslyWithSuggestionClient:(id)a3
{
  id v4 = a3;
  id v5 = [(APUIWidgetViewController *)self suggestionIds];
  id v6 = (void *)[v5 copy];

  id v7 = [(APUIWidgetViewController *)self widgetIdentifiable];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke;
  v10[3] = &unk_264764A18;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [v8 layoutForSuggestionsWidget:v7 completionHandler:v10];
}

void __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke_2;
  v6[3] = &unk_2647649F0;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLayout:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) layout];

  if (v2)
  {
    [*(id *)(a1 + 32) verifyLayoutSizeCompatibility];
    id v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) layout];
      id v5 = [v4 uuid];
      id v6 = (void *)MEMORY[0x263F619E0];
      id v7 = [*(id *)(a1 + 32) layout];
      id v8 = objc_msgSend(v6, "stringFromUILayoutType:", objc_msgSend(v7, "layoutType"));
      id v9 = [*(id *)(a1 + 32) layout];
      [v9 layoutScore];
      int v19 = 138412802;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: _updateLayoutWithSuggestionClient layout: %@ type %@ score %f", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    id v3 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: _updateLayoutWithSuggestionClient layout: nil", (uint8_t *)&v19, 2u);
    }
  }

  id v11 = *(void **)(a1 + 32);
  id v12 = [v11 layout];
  v13 = [v11 _suggestionIdsInLayout:v12];
  [*(id *)(a1 + 32) setSuggestionIds:v13];

  long long v14 = __atxlog_handle_ui();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [*(id *)(a1 + 32) suggestionIds];
    int v19 = 136446466;
    v20 = "-[APUISuggestionsWidgetViewController _updateLayoutAsynchronouslyWithSuggestionClient:]_block_invoke";
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_225AE0000, v14, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s self.suggestionIds=%@", (uint8_t *)&v19, 0x16u);
  }
  if ([*(id *)(a1 + 32) effectiveViewVisibility])
  {
    long long v16 = *(void **)(a1 + 32);
    long long v17 = [v16 suggestionIds];
    [v16 logChangeWithNewSuggestionIds:v17 previousSuggestionIds:*(void *)(a1 + 48) suggestionClient:*(void *)(a1 + 56)];
  }
  return [*(id *)(a1 + 32) _updateWidgetViewIfPossible];
}

- (void)verifyLayoutSizeCompatibility
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 layout];
  int v4 = 134217984;
  uint64_t v5 = [v3 layoutType];
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "SuggestionsWidget: Layout type %lu is not compatible with any stack layout size", (uint8_t *)&v4, 0xCu);
}

- (void)view:(id)a3 didTapSuggestion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: didTapSuggestion invoked with suggestion: %@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [(APUIWidgetViewController *)self suggestionClient];
  id v8 = [(APUIWidgetViewController *)self widgetIdentifiable];
  id v9 = [(APUIWidgetViewController *)self layout];
  uint64_t v10 = [v9 uuid];
  id v11 = [v10 UUIDString];
  [v7 logDidTapSuggestion:v5 widget:v8 blendingCacheId:v11];
}

- (void)view:(id)a3 didFinishExecutingSuggestion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 setCanEngageSuggestion:1];
  id v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "didFinishExecutingSuggestion invoked with suggestion: %@", buf, 0xCu);
  }

  dispatch_time_t v8 = dispatch_time(0, 300000000);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__APUISuggestionsWidgetViewController_view_didFinishExecutingSuggestion___block_invoke;
  v10[3] = &unk_264764798;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], v10);
}

void __73__APUISuggestionsWidgetViewController_view_didFinishExecutingSuggestion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) suggestionClient];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) widgetIdentifiable];
  [v4 didFinishExecutingTappedSuggestion:v2 fromWidget:v3];
}

- (void)view:(id)a3 didFailExecutingSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  [a3 setCanEngageSuggestion:1];
  id v6 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "didFailExecutingSuggestion invoked with suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setShowingContextMenu:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ATXProactiveSuggestion *)self->_selectedSuggestion uiSpecification];
    int v7 = [v6 title];
    *(_DWORD *)buf = 67109378;
    BOOL v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: setShowingContextMenu %{BOOL}u _selectedSuggestion: %@", buf, 0x12u);
  }
  if (self->_showingContextMenu != v3)
  {
    self->_BOOL showingContextMenu = v3;
    id v8 = [(APUIWidgetViewController *)self suggestionClient];
    [v8 setIsUserInteractingWithProactiveWidget:self->_showingContextMenu];

    if (v3)
    {
      if ([(APUISuggestionsWidgetViewController *)self _canDismissSelectedSuggestion])
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __61__APUISuggestionsWidgetViewController_setShowingContextMenu___block_invoke;
        v10[3] = &unk_2647647C0;
        v10[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v10 options:0 animations:0.0 completion:0.1];
      }
    }
    else
    {
      uint64_t v9 = [(APUISuggestionsWidgetViewController *)self widgetView];
      [v9 highlightSuggestion:0];

      [(APUISuggestionsWidgetViewController *)self _updateWidgetViewIfPossible];
    }
  }
}

void __61__APUISuggestionsWidgetViewController_setShowingContextMenu___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) widgetView];
  [v2 highlightSuggestion:*(void *)(*(void *)(a1 + 32) + 1024)];
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  -[APUISuggestionsWidgetView suggestionAtLocation:](self->_widgetView, "suggestionAtLocation:");
  id v6 = (ATXProactiveSuggestion *)objc_claimAutoreleasedReturnValue();
  selectedSuggestion = self->_selectedSuggestion;
  self->_selectedSuggestion = v6;

  id v8 = __atxlog_handle_ui();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18.CGFloat x = x;
    v18.CGFloat y = y;
    uint64_t v9 = NSStringFromCGPoint(v18);
    uint64_t v10 = self->_selectedSuggestion;
    int v11 = 136446722;
    BOOL v12 = "-[APUISuggestionsWidgetViewController willShowContextMenuAtLocation:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    long long v16 = v10;
    _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s location=%@ _selectedSuggestion=%@", (uint8_t *)&v11, 0x20u);
  }
}

- (NSArray)applicationShortcutItems
{
  if ([(APUISuggestionsWidgetViewController *)self _canDismissSelectedSuggestion])
  {
    BOOL v3 = +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:@"com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion" localizedName:&stru_26D930E38];
    id v4 = [MEMORY[0x263EFFA68] arrayByAddingObject:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  if ([(APUISuggestionsWidgetViewController *)self _canSaveSelectedSuggestion])
  {
    id v5 = +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:@"com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion" localizedName:&stru_26D930E38];
    uint64_t v6 = [v4 arrayByAddingObject:v5];

    id v4 = (void *)v6;
  }
  return (NSArray *)v4;
}

- (BOOL)_canDismissSelectedSuggestion
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [(APUIWidgetViewController *)self suggestionClient];
  selectedSuggestion = self->_selectedSuggestion;
  id v5 = [(APUIWidgetViewController *)self layout];
  LOBYTE(selectedSuggestion) = [v3 isSuggestionReplacementAvailableForSuggestion:selectedSuggestion inLayout:v5];

  if ((selectedSuggestion & 1) == 0)
  {
    id v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      BOOL v12 = "-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion]";
      uint64_t v9 = "SuggestionsWidget: %{public}s No replacement available for _selectedSuggestion";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  uint64_t v6 = [(ATXProactiveSuggestion *)self->_selectedSuggestion executableSpecification];
  uint64_t v7 = [v6 executableType];

  if (v7 == 5)
  {
    id v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      BOOL v12 = "-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion]";
      uint64_t v9 = "SuggestionsWidget: %{public}s _selectedSuggestion is App Clip";
LABEL_7:
      _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)_canSaveSelectedSuggestion
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!self->_selectedSuggestion)
  {
    id v2 = __atxlog_handle_ui();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      uint64_t v6 = "-[APUISuggestionsWidgetViewController _canSaveSelectedSuggestion]";
      BOOL v3 = "SuggestionsWidget: %{public}s NO: _selectedSuggestion is null";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if ([(id)objc_opt_class() _isSuggestionShortcut:self->_selectedSuggestion])
  {
    id v2 = __atxlog_handle_ui();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      uint64_t v6 = "-[APUISuggestionsWidgetViewController _canSaveSelectedSuggestion]";
      BOOL v3 = "SuggestionsWidget: %{public}s NO: _selectedSuggestion is already shortcut";
LABEL_7:
      _os_log_impl(&dword_225AE0000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v5, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_selectedSuggestion) {
    goto LABEL_5;
  }
  int v5 = [(APUIWidgetViewController *)self layout];
  uint64_t v6 = [v5 minSuggestionListInLayout];

  if ([v6 count] == 1)
  {
    uint64_t v7 = [v6 firstObject];
    selectedSuggestion = self->_selectedSuggestion;
    self->_selectedSuggestion = v7;
  }
  if (self->_selectedSuggestion)
  {
LABEL_5:
    uint64_t v9 = __atxlog_handle_ui();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_selectedSuggestion;
      int v22 = 136446466;
      __int16 v23 = "-[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:]";
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _selectedSuggestion=%@", (uint8_t *)&v22, 0x16u);
    }

    int v11 = [v4 type];
    if ([v11 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion"])
    {
      BOOL v12 = [(APUIWidgetViewController *)self suggestionClient];
      uint64_t v13 = self->_selectedSuggestion;
      uint64_t v14 = [(APUIWidgetViewController *)self widgetIdentifiable];
      __int16 v15 = [(APUIWidgetViewController *)self layout];
      long long v16 = [v15 uuid];
      uint64_t v17 = [v16 UUIDString];
      [v12 logContextMenuDismissOnceForSuggestion:v13 widget:v14 blendingCacheId:v17];

LABEL_14:
      goto LABEL_20;
    }
    if ([v11 isEqualToString:@"com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion"])
    {
      CGPoint v18 = __atxlog_handle_ui();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136446210;
        __int16 v23 = "-[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:]";
        _os_log_impl(&dword_225AE0000, v18, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s saving it", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v19 = [(id)objc_opt_class() _shortcutWithSuggestion:self->_selectedSuggestion];
      if (v19)
      {
        BOOL v12 = (void *)v19;
        v20 = (void *)[objc_alloc(MEMORY[0x263F10310]) initWithShortcut:v19];
        [v20 setDelegate:self];
        [v20 setModalPresentationStyle:-2];
        [(APUISuggestionsWidgetViewController *)self presentViewController:v20 animated:1 completion:0];

        goto LABEL_14;
      }
    }
    __int16 v21 = __atxlog_handle_ui();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:]((uint64_t)v11, v21);
    }
  }
  else
  {
    int v11 = __atxlog_handle_ui();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:](self, v11);
    }
  }
LABEL_20:
}

+ (id)_shortcutWithSuggestion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 _actionWithSuggestion:a3];
  id v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446466;
    __int16 v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_225AE0000, v4, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s atxAction=%@", (uint8_t *)&v14, 0x16u);
  }

  if (![v3 actionType] || objc_msgSend(v3, "actionType") == 2)
  {
    id v5 = objc_alloc(MEMORY[0x263F0FF70]);
    uint64_t v6 = [v3 intent];
    uint64_t v7 = (void *)[v5 initWithIntent:v6];

    id v8 = __atxlog_handle_ui();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v14 = 136446466;
    __int16 v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    uint64_t v9 = "SuggestionsWidget: %{public}s ATXActionTypeIntent or ATXActionTypeOFA shortcut=%@";
    goto LABEL_7;
  }
  if ([v3 actionType] == 1)
  {
    id v10 = objc_alloc(MEMORY[0x263F0FF70]);
    int v11 = [v3 userActivity];
    BOOL v12 = [v3 bundleId];
    uint64_t v7 = (void *)[v10 initWithUserActivity:v11 bundleIdentifier:v12];

    id v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446466;
      __int16 v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      uint64_t v9 = "SuggestionsWidget: %{public}s ATXActionTypeNSUserActivity shortcut=%@";
LABEL_7:
      _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    id v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446466;
      __int16 v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s action type not handled shortcut=%@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v7 = 0;
  }
LABEL_14:

  return v7;
}

+ (BOOL)_isSuggestionShortcut:(id)a3
{
  BOOL v3 = [a1 _actionWithSuggestion:a3];
  id v4 = [v3 intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_actionWithSuggestion:(id)a3
{
  BOOL v3 = [a3 executableSpecification];
  id v4 = [v3 executableObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)addVoiceShortcutViewController:(id)a3 didFinishWithVoiceShortcut:(id)a4 error:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 dismissViewControllerAnimated:1 completion:0];
  uint64_t v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    uint64_t v9 = "-[APUISuggestionsWidgetViewController addVoiceShortcutViewController:didFinishWithVoiceShortcut:error:]";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s didFinishWithVoiceShortcut=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)addVoiceShortcutViewControllerDidCancel:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a3 dismissViewControllerAnimated:1 completion:0];
  BOOL v3 = __atxlog_handle_ui();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[APUISuggestionsWidgetViewController addVoiceShortcutViewControllerDidCancel:]";
    _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s addVoiceShortcutViewControllerDidCancel", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (APUISuggestionsWidgetView)widgetView
{
  return self->_widgetView;
}

- (void)setWidgetView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetView, 0);
  objc_storeStrong((id *)&self->_selectedSuggestion, 0);
}

- (void)didSelectApplicationShortcutItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 layout];
  int v4 = 134218242;
  uint64_t v5 = 5517;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: No selected suggestion found in layout %@", (uint8_t *)&v4, 0x16u);
}

- (void)didSelectApplicationShortcutItem:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: didSelectApplicationShortcutItem: %@ is not valid for Suggestions Widget", (uint8_t *)&v2, 0xCu);
}

@end