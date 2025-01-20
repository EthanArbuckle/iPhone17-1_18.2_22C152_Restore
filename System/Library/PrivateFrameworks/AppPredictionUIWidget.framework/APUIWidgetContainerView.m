@interface APUIWidgetContainerView
- (APUISuggestionsWidgetView)suggestionsWidgetView;
- (APUISuggestionsWidgetViewDelegate)delegate;
- (ATXProactiveSuggestion)suggestion;
- (unint64_t)platterSize;
- (void)_createStackViewIfNeeded;
- (void)_displayNoSuggestionsWithSuggestion:(id)a3;
- (void)_setActionSuggestion:(id)a3;
- (void)_setAppClipSuggestion:(id)a3;
- (void)_setAppSuggestion:(id)a3;
- (void)_setLinkSuggestion:(id)a3;
- (void)displaySuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlatterSize:(unint64_t)a3;
- (void)setSuggestion:(id)a3;
- (void)setSuggestion:(id)a3 inView:(id)a4;
- (void)setSuggestionViewLabelsAlpha:(double)a3;
- (void)setViewPressed:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation APUIWidgetContainerView

- (void)_createStackViewIfNeeded
{
  v19[4] = *MEMORY[0x263EF8340];
  if (!self->_stackView)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
    stackView = self->_stackView;
    self->_stackView = v3;

    [(UIStackView *)self->_stackView setDistribution:0];
    [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(APUIWidgetContainerView *)self addSubview:self->_stackView];
    v15 = (void *)MEMORY[0x263F08938];
    v18 = [(UIStackView *)self->_stackView leadingAnchor];
    v17 = [(APUIWidgetContainerView *)self leadingAnchor];
    v16 = [v18 constraintEqualToAnchor:v17];
    v19[0] = v16;
    v5 = [(UIStackView *)self->_stackView topAnchor];
    v6 = [(APUIWidgetContainerView *)self topAnchor];
    v7 = [v5 constraintEqualToAnchor:v6];
    v19[1] = v7;
    v8 = [(APUIWidgetContainerView *)self trailingAnchor];
    v9 = [(UIStackView *)self->_stackView trailingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v19[2] = v10;
    v11 = [(APUIWidgetContainerView *)self bottomAnchor];
    v12 = [(UIStackView *)self->_stackView bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v19[3] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
    [v15 activateConstraints:v14];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  [(APUIWidgetContainerView *)&v5 touchesBegan:a3 withEvent:a4];
  [(APUIWidgetContainerView *)self setViewPressed:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  [(APUIWidgetContainerView *)&v5 touchesEnded:a3 withEvent:a4];
  [(APUIWidgetContainerView *)self setViewPressed:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  [(APUIWidgetContainerView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(APUIWidgetContainerView *)self setViewPressed:0];
}

- (void)setViewPressed:(BOOL)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
    objc_super v5 = [(APUIWidgetContainerView *)self layer];
    v9[0] = v4;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v5 setFilters:v6];

    id v7 = [MEMORY[0x263F1C550] colorWithWhite:0.6 alpha:1.0];
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v7, "CGColor"), @"inputColor");

    [(APUIWidgetContainerView *)self setSuggestionViewLabelsAlpha:0.5];
  }
  else
  {
    v8 = [(APUIWidgetContainerView *)self layer];
    [v8 setFilters:0];

    [(APUIWidgetContainerView *)self setSuggestionViewLabelsAlpha:1.0];
  }
}

- (void)setSuggestionViewLabelsAlpha:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(APUISuggestionView *)self->_suggestionView labels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAlpha:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setSuggestion:(id)a3 inView:(id)a4
{
  uint64_t v6 = (ATXProactiveSuggestion *)a3;
  uint64_t v7 = (APUISuggestionView *)a4;
  suggestion = self->_suggestion;
  self->_suggestion = v6;
  long long v12 = v6;

  suggestionView = self->_suggestionView;
  self->_suggestionView = v7;
  long long v10 = v7;

  [(APUIWidgetContainerView *)self _createStackViewIfNeeded];
  long long v11 = [(APUIWidgetContainerView *)self delegate];
  [(APUISuggestionView *)v10 setDelegate:v11];

  [(APUISuggestionView *)v10 setPlatterSize:[(APUIWidgetContainerView *)self platterSize]];
  [(APUISuggestionView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(APUISuggestionView *)v10 setCanEngageSuggestion:1];
  [(APUISuggestionView *)v10 layoutSuggestion:v12];
  [(UIStackView *)self->_stackView addArrangedSubview:v10];
}

- (void)_setAppClipSuggestion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    int v9 = 136446466;
    long long v10 = "-[APUIWidgetContainerView _setAppClipSuggestion:]";
    __int16 v11 = 2112;
    long long v12 = v7;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = objc_opt_new();
  [(APUIWidgetContainerView *)self setSuggestion:v4 inView:v8];
}

- (void)_setAppSuggestion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    int v9 = 136446466;
    long long v10 = "-[APUIWidgetContainerView _setAppSuggestion:]";
    __int16 v11 = 2112;
    long long v12 = v7;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = objc_opt_new();
  [(APUIWidgetContainerView *)self setSuggestion:v4 inView:v8];
}

- (void)_setActionSuggestion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    int v9 = 136446466;
    long long v10 = "-[APUIWidgetContainerView _setActionSuggestion:]";
    __int16 v11 = 2112;
    long long v12 = v7;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = objc_alloc_init(APUIActionSuggestionView);
  [(APUIWidgetContainerView *)self setSuggestion:v4 inView:v8];
}

- (void)_setLinkSuggestion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    int v9 = 136446466;
    long long v10 = "-[APUIWidgetContainerView _setLinkSuggestion:]";
    __int16 v11 = 2112;
    long long v12 = v7;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = objc_alloc_init(APUILinkSuggestionView);
  [(APUIWidgetContainerView *)self setSuggestion:v4 inView:v8];
}

- (void)_displayNoSuggestionsWithSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[APUIWidgetContainerView _displayNoSuggestionsWithSuggestion:]((uint64_t)v4, v5);
  }

  suggestion = self->_suggestion;
  self->_suggestion = 0;

  [(APUIWidgetContainerView *)self _createStackViewIfNeeded];
}

- (void)displaySuggestion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(APUIWidgetContainerView *)self setSuggestion:v4];
  if (!v4)
  {
    __int16 v11 = self;
    id v12 = 0;
LABEL_7:
    [(APUIWidgetContainerView *)v11 _displayNoSuggestionsWithSuggestion:v12];
    goto LABEL_14;
  }
  uint64_t v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    uint64_t v8 = [v4 executableSpecification];
    int v19 = 136446722;
    v20 = "-[APUIWidgetContainerView displaySuggestion:]";
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = [v8 executableType];
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@ executableSpecification: %ld", (uint8_t *)&v19, 0x20u);
  }
  int v9 = [v4 executableSpecification];
  uint64_t v10 = [v9 executableType];

  if (v10 != 5)
  {
    uint64_t v13 = [v4 executableSpecification];
    uint64_t v14 = [v13 executableType];

    if (v14 == 1)
    {
      [(APUIWidgetContainerView *)self _setAppSuggestion:v4];
      goto LABEL_14;
    }
    v15 = [v4 executableSpecification];
    uint64_t v16 = [v15 executableType];

    if (v16 == 2)
    {
      [(APUIWidgetContainerView *)self _setActionSuggestion:v4];
      goto LABEL_14;
    }
    v17 = [v4 executableSpecification];
    uint64_t v18 = [v17 executableType];

    __int16 v11 = self;
    id v12 = v4;
    if (v18 == 10)
    {
      [(APUIWidgetContainerView *)self _setLinkSuggestion:v4];
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  [(APUIWidgetContainerView *)self _setAppClipSuggestion:v4];
LABEL_14:
}

- (APUISuggestionsWidgetView)suggestionsWidgetView
{
  return self->_suggestionsWidgetView;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APUISuggestionsWidgetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->_platterSize = a3;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsWidgetView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)_displayNoSuggestionsWithSuggestion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 5517;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: could not display suggestion: %@", (uint8_t *)&v2, 0x16u);
}

@end