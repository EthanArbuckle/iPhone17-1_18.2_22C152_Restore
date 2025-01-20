@interface APUISuggestionsWidgetView
+ (BOOL)_shouldDisplayRecentDonationsOrUpcomingMediaForTesting;
+ (id)_developerModeSuggestions:(unint64_t)a3;
- (APUISuggestionsWidgetViewDelegate)delegate;
- (BOOL)_hasBundleInstalledAndNotRestrictedForSuggestion:(id)a3;
- (UIStackView)stackView;
- (id)_addWidgetContainerViewWithSuggestion:(id)a3 toVerticalStackView:(id)a4;
- (id)_createWidgetContainerViewWithSuggestion:(id)a3;
- (id)_validSuggestionsWithSuggestions:(id)a3;
- (id)suggestionAtLocation:(CGPoint)a3;
- (void)_addFullWidthWidgetContainerViewWithSuggestion:(id)a3 withTopSeparator:(BOOL)a4;
- (void)_checkOrLoadSuggestions:(id)a3 inDeveloperMode:(BOOL)a4 rowCount:(unint64_t)a5 completion:(id)a6;
- (void)_clearStackView;
- (void)_displayNoSuggestions;
- (void)_layout1x4WithRowCount:(unint64_t)a3;
- (void)_layoutNotSupported:(int64_t)a3;
- (void)_layoutOne2x2;
- (void)_setupStackViewIfNecessary;
- (void)addSeparatorViewToView:(id)a3;
- (void)highlightSuggestion:(id)a3;
- (void)layoutSubviews;
- (void)logLayoutSuggestions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStackView:(id)a3;
- (void)updateWithSuggestionLayout:(id)a3;
@end

@implementation APUISuggestionsWidgetView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)APUISuggestionsWidgetView;
  [(APUISuggestionsWidgetView *)&v3 layoutSubviews];
  [(APUISuggestionsWidgetView *)self _setupStackViewIfNecessary];
}

- (void)_setupStackViewIfNecessary
{
  v28[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [(APUISuggestionsWidgetView *)self stackView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C9B8]);
    [(APUISuggestionsWidgetView *)self setStackView:v4];

    v5 = [(APUISuggestionsWidgetView *)self stackView];
    [v5 setAxis:0];

    v6 = [(APUISuggestionsWidgetView *)self stackView];
    [v6 setDistribution:1];

    v7 = [(APUISuggestionsWidgetView *)self stackView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(APUISuggestionsWidgetView *)self stackView];
    [v8 setSpacing:0.0];

    v9 = [(APUISuggestionsWidgetView *)self stackView];
    [(APUISuggestionsWidgetView *)self addSubview:v9];

    v20 = (void *)MEMORY[0x263F08938];
    v27 = [(APUISuggestionsWidgetView *)self stackView];
    v26 = [v27 leadingAnchor];
    v25 = [(APUISuggestionsWidgetView *)self leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v22 = [(APUISuggestionsWidgetView *)self trailingAnchor];
    v23 = [(APUISuggestionsWidgetView *)self stackView];
    v21 = [v23 trailingAnchor];
    v10 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v10;
    v11 = [(APUISuggestionsWidgetView *)self stackView];
    v12 = [v11 topAnchor];
    v13 = [(APUISuggestionsWidgetView *)self topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v28[2] = v14;
    v15 = [(APUISuggestionsWidgetView *)self bottomAnchor];
    v16 = [(APUISuggestionsWidgetView *)self stackView];
    v17 = [v16 bottomAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    v28[3] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    [v20 activateConstraints:v19];
  }
}

- (void)updateWithSuggestionLayout:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (ATXSuggestionLayout *)a3;
  v6 = v5;
  if (v5)
  {
    if (self->_suggestionLayout != v5
      || [(id)objc_opt_class() _shouldDisplayRecentDonationsOrUpcomingMediaForTesting])
    {
      objc_storeStrong((id *)&self->_suggestionLayout, a3);
      v7 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        suggestionLayout = self->_suggestionLayout;
        int v11 = 136315394;
        v12 = "-[APUISuggestionsWidgetView updateWithSuggestionLayout:]";
        __int16 v13 = 2112;
        v14 = suggestionLayout;
        _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  _suggestionLayout:%@", (uint8_t *)&v11, 0x16u);
      }

      switch([(ATXSuggestionLayout *)v6 layoutType])
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
        case 8:
        case 10:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
          [(APUISuggestionsWidgetView *)self _layoutNotSupported:[(ATXSuggestionLayout *)v6 layoutType]];
          break;
        case 5:
          [(APUISuggestionsWidgetView *)self _layoutOne2x2];
          break;
        case 9:
          v9 = self;
          uint64_t v10 = 2;
          goto LABEL_13;
        case 11:
          v9 = self;
          uint64_t v10 = 4;
LABEL_13:
          [(APUISuggestionsWidgetView *)v9 _layout1x4WithRowCount:v10];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    [(APUISuggestionsWidgetView *)self _displayNoSuggestions];
  }
}

- (void)_layoutNotSupported:(int64_t)a3
{
  v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[APUISuggestionsWidgetView _layoutNotSupported:](a3);
  }

  v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[APUISuggestionsWidgetView _layoutNotSupported:](a3, v6);
  }

  [(APUISuggestionsWidgetView *)self _displayNoSuggestions];
}

- (void)_clearStackView
{
  objc_super v3 = (NSMutableArray *)objc_opt_new();
  containerViews = self->_containerViews;
  self->_containerViews = v3;

  [(UIStackView *)self->_stackView removeFromSuperview];
  stackView = self->_stackView;
  self->_stackView = 0;

  [(APUISuggestionsWidgetView *)self _setupStackViewIfNecessary];
}

- (void)_displayNoSuggestions
{
  v21[3] = *MEMORY[0x263EF8340];
  objc_super v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: no suggestions to display!", buf, 2u);
  }

  [(APUISuggestionsWidgetView *)self _clearStackView];
  id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"No Suggestions Available" value:&stru_26D930E38 table:0];
  [v4 setText:v6];

  v7 = [MEMORY[0x263F1C550] labelColor];
  [v4 setTextColor:v7];

  [v4 setNumberOfLines:0];
  [v4 setTextAlignment:1];
  v8 = [(APUISuggestionsWidgetView *)self stackView];
  [v8 addSubview:v4];

  v18 = (void *)MEMORY[0x263F08938];
  v19 = [v4 leadingAnchor];
  v9 = [(UIStackView *)self->_stackView leadingAnchor];
  uint64_t v10 = [v19 constraintEqualToSystemSpacingAfterAnchor:v9 multiplier:1.0];
  v21[0] = v10;
  int v11 = [(UIStackView *)self->_stackView trailingAnchor];
  v12 = [v4 trailingAnchor];
  __int16 v13 = [v11 constraintEqualToSystemSpacingAfterAnchor:v12 multiplier:1.0];
  v21[1] = v13;
  v14 = [(UIStackView *)self->_stackView centerYAnchor];
  uint64_t v15 = [v4 centerYAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
  v21[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v18 activateConstraints:v17];
}

- (void)_layout1x4WithRowCount:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[APUISuggestionsWidgetView _layout1x4WithRowCount:]";
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%lu", buf, 0x16u);
  }

  self->_platterSize = 2;
  uint64_t v6 = [(id)objc_opt_class() _shouldDisplayRecentDonationsOrUpcomingMediaForTesting];
  if (v6)
  {
    v7 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v11 = "-[APUISuggestionsWidgetView _layout1x4WithRowCount:]";
      _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s: displayRecentDonations developer switch on. Getting recent donations asynchronously", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = [(ATXSuggestionLayout *)self->_suggestionLayout oneByFourSuggestions];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke;
  v9[3] = &unk_264764B50;
  v9[4] = self;
  v9[5] = a3;
  [(APUISuggestionsWidgetView *)self _checkOrLoadSuggestions:v8 inDeveloperMode:v6 rowCount:a3 completion:v9];
}

void __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) _clearStackView];
  id v4 = [*(id *)(a1 + 32) stackView];
  [v4 setAxis:1];

  v5 = [*(id *)(a1 + 32) stackView];
  [v5 setAlignment:1];

  if ([v3 count] == *(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) logLayoutSuggestions:v3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(a1 + 32), "_addFullWidthWidgetContainerViewWithSuggestion:withTopSeparator:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), v9 & 1, (void)v13);
          char v9 = 1;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    __int16 v12 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke_cold_1((uint64_t *)(a1 + 40), v3, v12);
    }

    [*(id *)(a1 + 32) _displayNoSuggestions];
  }
}

- (void)addSeparatorViewToView:(id)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [MEMORY[0x263F1C550] separatorColor];
  [v5 setBackgroundColor:v6];

  [v4 addSubview:v5];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  v19 = (void *)MEMORY[0x263F08938];
  v22 = [v5 heightAnchor];
  v21 = [v22 constraintEqualToConstant:v9];
  v23[0] = v21;
  v20 = [v5 leadingAnchor];
  uint64_t v10 = [(APUISuggestionsWidgetView *)self leadingAnchor];
  uint64_t v11 = [v20 constraintEqualToAnchor:v10 constant:16.0];
  v23[1] = v11;
  __int16 v12 = [v5 trailingAnchor];
  long long v13 = [(APUISuggestionsWidgetView *)self trailingAnchor];
  long long v14 = [v12 constraintEqualToAnchor:v13];
  v23[2] = v14;
  long long v15 = [v5 topAnchor];
  long long v16 = [v4 topAnchor];

  v17 = [v15 constraintEqualToAnchor:v16];
  v23[3] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v19 activateConstraints:v18];
}

- (void)_layoutOne2x2
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = __atxlog_handle_ui();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    double v9 = "-[APUISuggestionsWidgetView _layoutOne2x2]";
    _os_log_impl(&dword_225AE0000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  self->_platterSize = 1;
  uint64_t v4 = [(id)objc_opt_class() _shouldDisplayRecentDonationsOrUpcomingMediaForTesting];
  if (v4)
  {
    v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v9 = "-[APUISuggestionsWidgetView _layoutOne2x2]";
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s: displayRecentDonations developer switch on. Getting recent donations asynchronously", buf, 0xCu);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = [(ATXSuggestionLayout *)self->_suggestionLayout twoByTwoSuggestions];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke;
  v7[3] = &unk_264764B78;
  v7[4] = self;
  [(APUISuggestionsWidgetView *)self _checkOrLoadSuggestions:v6 inDeveloperMode:v4 rowCount:1 completion:v7];
}

void __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) _clearStackView];
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    v5 = (void *)v4;
    if (v4)
    {
      id v6 = *(void **)(a1 + 32);
      v12[0] = v4;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [v6 logLayoutSuggestions:v7];

      double v8 = *(void **)(a1 + 32);
      double v9 = [v8 stackView];
      id v10 = (id)[v8 _addWidgetContainerViewWithSuggestion:v5 toVerticalStackView:v9];
    }
  }
  else
  {
    uint64_t v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke_cold_1(v3);
    }

    [*(id *)(a1 + 32) _displayNoSuggestions];
  }
}

- (void)_checkOrLoadSuggestions:(id)a3 inDeveloperMode:(BOOL)a4 rowCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  __int16 v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke;
  block[3] = &unk_264764BC8;
  BOOL v20 = a4;
  id v16 = v10;
  v17 = self;
  id v18 = v11;
  unint64_t v19 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = [(id)objc_opt_class() _developerModeSuggestions:*(void *)(a1 + 56)];

    id v2 = (id)v3;
  }
  uint64_t v4 = [*(id *)(a1 + 40) _validSuggestionsWithSuggestions:v2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke_2;
  v7[3] = &unk_264764BA0;
  id v5 = *(id *)(a1 + 48);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_validSuggestionsWithSuggestions:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v4 count];
    _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  validating %lu  suggestions", buf, 0x16u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v9 = 136315394;
    long long v18 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "isValidForSuggestionsWidget", v18, (void)v19)
          && [(APUISuggestionsWidgetView *)self _hasBundleInstalledAndNotRestrictedForSuggestion:v13])
        {
          [v5 addObject:v13];
        }
        else
        {
          id v14 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
            __int16 v26 = 2112;
            uint64_t v27 = (uint64_t)v13;
            _os_log_error_impl(&dword_225AE0000, v14, OS_LOG_TYPE_ERROR, "%s:  invalid suggestion: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  long long v15 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v5 count];
    *(_DWORD *)buf = 136315394;
    v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
    __int16 v26 = 2048;
    uint64_t v27 = v16;
    _os_log_impl(&dword_225AE0000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  %lu valid suggestions", buf, 0x16u);
  }

  return v5;
}

- (BOOL)_hasBundleInstalledAndNotRestrictedForSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  id v6 = [v3 executableSpecification];
  id v7 = v6;
  if (v5 == 1)
  {
    uint64_t v8 = [v6 executableClassString];
    long long v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      id v12 = [NSString alloc];
      id v13 = [v3 executableSpecification];
      id v14 = [v13 executable];
      long long v15 = (void *)[v12 initWithData:v14 encoding:4];

      if (([MEMORY[0x263F24FF8] isInstalledAndNotRestrictedForBundle:v15] & 1) == 0) {
        goto LABEL_14;
      }
LABEL_11:
      BOOL v20 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v16 = [v6 executableType];

    if (v16 != 2)
    {
      long long v15 = 0;
      goto LABEL_11;
    }
    v17 = [v3 executableSpecification];
    long long v18 = [v17 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = [v18 bundleId];
      long long v15 = ATXBundleIdReplacementForBundleId();

      if (v15)
      {
        if ([MEMORY[0x263F24FF8] isInstalledAndNotRestrictedForBundle:v15])
        {
        }
        else
        {
          char v23 = [MEMORY[0x263F24FF8] isAppClipWebClipBundleId:v15];

          if ((v23 & 1) == 0) {
            goto LABEL_14;
          }
        }
        goto LABEL_11;
      }
    }
  }
  long long v15 = 0;
LABEL_14:
  long long v21 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[APUISuggestionsWidgetView _hasBundleInstalledAndNotRestrictedForSuggestion:]((uint64_t)v15, v21);
  }

  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (void)logLayoutSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[APUISuggestionsWidgetView logLayoutSuggestions:](v3, v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        int v11 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[APUISuggestionsWidgetView logLayoutSuggestions:](v17, v10, &v18, v11);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  id v12 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[APUISuggestionsWidgetView logLayoutSuggestions:](v12);
  }
}

- (void)_addFullWidthWidgetContainerViewWithSuggestion:(id)a3 withTopSeparator:(BOOL)a4
{
  BOOL v4 = a4;
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(APUISuggestionsWidgetView *)self stackView];
  uint64_t v8 = [(APUISuggestionsWidgetView *)self _addWidgetContainerViewWithSuggestion:v6 toVerticalStackView:v7];

  if (v4) {
    [(APUISuggestionsWidgetView *)self addSeparatorViewToView:v8];
  }
  uint64_t v9 = objc_msgSend(v8, "leadingAnchor", MEMORY[0x263F08938]);
  uint64_t v10 = [(APUISuggestionsWidgetView *)self stackView];
  int v11 = [v10 leadingAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v19[0] = v12;
  long long v13 = [(APUISuggestionsWidgetView *)self stackView];
  long long v14 = [v13 trailingAnchor];
  long long v15 = [v8 trailingAnchor];
  long long v16 = [v14 constraintEqualToAnchor:v15];
  v19[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v18 activateConstraints:v17];
}

- (id)_addWidgetContainerViewWithSuggestion:(id)a3 toVerticalStackView:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_ui();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    id v12 = "-[APUISuggestionsWidgetView _addWidgetContainerViewWithSuggestion:toVerticalStackView:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = [(APUISuggestionsWidgetView *)self _createWidgetContainerViewWithSuggestion:v6];
  [v7 addArrangedSubview:v9];

  return v9;
}

- (id)_createWidgetContainerViewWithSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(APUIWidgetContainerView);
  id v6 = [(APUISuggestionsWidgetView *)self delegate];
  [(APUIWidgetContainerView *)v5 setDelegate:v6];

  [(APUIWidgetContainerView *)v5 setPlatterSize:self->_platterSize];
  [(APUIWidgetContainerView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(APUIWidgetContainerView *)v5 displaySuggestion:v4];

  [(NSMutableArray *)self->_containerViews addObject:v5];
  return v5;
}

- (void)highlightSuggestion:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "-[APUISuggestionsWidgetView highlightSuggestion:]";
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  if (v4)
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v6 = self->_containerViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v12 = [v11 suggestion];
          int v13 = [v4 isEqual:v12];

          if (v13) {
            double v14 = 1.0;
          }
          else {
            double v14 = 0.3;
          }
          [v11 setAlpha:v14];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    id v6 = self->_containerViews;
    uint64_t v15 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "setAlpha:", 1.0, (void)v19);
        }
        uint64_t v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (id)suggestionAtLocation:(CGPoint)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = -[APUISuggestionsWidgetView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  id v4 = [v3 apuiFindInnermostSuperviewOfClass:objc_opt_class()];
  id v5 = [v4 suggestion];
  id v6 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 uiSpecification];
    uint64_t v8 = [v7 title];
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "suggestionAtLocation %@", (uint8_t *)&v10, 0xCu);
  }
  return v5;
}

+ (BOOL)_shouldDisplayRecentDonationsOrUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(@"displayRecentDonations", @"com.apple.duetexpertd", 0)
      || CFPreferencesGetAppBooleanValue(@"displayUpcomingMedia", @"com.apple.duetexpertd", 0) != 0;
}

+ (id)_developerModeSuggestions:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F24FC8] actionResponseForDeveloperMode];
  id v5 = [v4 proactiveSuggestions];
  id v6 = (void *)[v5 mutableCopy];

  if ([v6 count] >= a3)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, a3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v6 count])
    {
      unint64_t v7 = [v6 count];
      unint64_t v8 = a3 - v7;
      if (a3 > v7)
      {
        do
        {
          uint64_t v9 = [v6 lastObject];
          [v6 addObject:v9];

          --v8;
        }
        while (v8);
      }
    }
    id v10 = v6;
  }
  int v11 = v10;

  return v11;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APUISuggestionsWidgetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerViews, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
}

- (void)_layoutNotSupported:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F619E0] stringFromUILayoutType:a1];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: layout %@ not supported", v4, 0xCu);
}

- (void)_layoutNotSupported:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = [MEMORY[0x263F619E0] stringFromUILayoutType:a1];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_225AE0000, v2, v3, "SuggestionsWidget: layout %{public}@ not supported", v4, v5, v6, v7, v8);
}

void __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_225AE0000, a3, OS_LOG_TYPE_ERROR, "SuggestionsWidget: need %lu valid suggestions for _layoutTwo1x4. Got %lu", (uint8_t *)&v5, 0x16u);
}

void __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_225AE0000, v1, v2, "Need 1 suggestion for _layoutOne2x2. Got %lu", v3, v4, v5, v6, v7);
}

- (void)_hasBundleInstalledAndNotRestrictedForSuggestion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[APUISuggestionsWidgetView _hasBundleInstalledAndNotRestrictedForSuggestion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "%s:  bundle id %@ is not installed or is restricted", (uint8_t *)&v2, 0x16u);
}

- (void)logLayoutSuggestions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_225AE0000, log, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: ]", v1, 2u);
}

- (void)logLayoutSuggestions:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint8_t v7 = [a2 executableSpecification];
  uint64_t v8 = [v7 executableDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_225AE0000, a4, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: suggestion executable:%@", a1, 0xCu);
}

- (void)logLayoutSuggestions:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_225AE0000, a2, OS_LOG_TYPE_DEBUG, "SuggestionsWidget:  %lu suggestions[", v3, 0xCu);
}

@end