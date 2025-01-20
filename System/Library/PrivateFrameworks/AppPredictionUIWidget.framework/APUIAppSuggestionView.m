@interface APUIAppSuggestionView
- (void)_setAppWithBundleId:(id)a3 reason:(id)a4;
- (void)_tapRecognized:(id)a3;
- (void)layoutSuggestion:(id)a3;
@end

@implementation APUIAppSuggestionView

- (void)layoutSuggestion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(APUISuggestionView *)self setSuggestion:v4];
    [(APUISuggestionView *)self createViewsIfNeeded];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapRecognized_];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    [(APUIAppSuggestionView *)self addGestureRecognizer:self->_tapRecognizer];
    v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_tapRecognizer;
      int v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: added gesture recognizer: %@", (uint8_t *)&v21, 0xCu);
    }

    v9 = [v4 executableSpecification];
    v10 = [v9 executableClassString];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = [v10 isEqualToString:v12];

    if (v13)
    {
      id v14 = [NSString alloc];
      v15 = [v4 executableSpecification];
      v16 = [v15 executable];
      v17 = [v14 initWithData:v16 encoding:4];

      v18 = [v4 uiSpecification];
      v19 = [v18 reason];

      [(APUIAppSuggestionView *)self _setAppWithBundleId:v17 reason:v19];
    }
    else
    {
      v17 = __atxlog_handle_ui();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[APUIAppSuggestionView layoutSuggestion:]();
      }
    }

    [(APUISuggestionView *)self installReasonLabelIfNecessary];
  }
  else
  {
    v20 = __atxlog_handle_ui();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[APUIAppSuggestionView layoutSuggestion:]();
    }
  }
}

- (void)_setAppWithBundleId:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_appBundleId, a3);
  v9 = [(APUISuggestionView *)self appImageView];
  v10 = +[APUIAppIconDataSource iconForBundleIdentifier:v7 shouldApplyMask:1];
  [v9 setImage:v10];

  v11 = NSString;
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v13 = [v12 localizedStringForKey:@"Open %@" value:&stru_26D930E38 table:0];
  id v14 = [MEMORY[0x263F24FF8] localizedNameForBundle:v7];
  v15 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);

  v16 = [(APUISuggestionView *)self titleLabel];
  [v16 setText:v15];

  if (![v8 length])
  {
    v17 = __atxlog_handle_ui();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[APUIAppSuggestionView _setAppWithBundleId:reason:]((uint64_t)v7, (uint64_t)v8, v17);
    }
  }
  v18 = [(APUISuggestionView *)self subtitleLabel];
  [v18 setText:v8];
}

- (void)_tapRecognized:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(APUISuggestionView *)self canEngageSuggestion])
  {
    [(APUISuggestionView *)self setCanEngageSuggestion:0];
    if ([v4 state] == 3)
    {
      v5 = [(APUISuggestionView *)self suggestion];
      v6 = __atxlog_handle_ui();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        appBundleId = self->_appBundleId;
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = (uint64_t)appBundleId;
        _os_log_impl(&dword_225AE0000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: gesture recognizer ended; attempting to launch app: %@...",
          buf,
          0xCu);
      }

      id v8 = [(APUISuggestionView *)self delegate];
      [v8 view:self didTapSuggestion:v5];

      v9 = self->_appBundleId;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __40__APUIAppSuggestionView__tapRecognized___block_invoke;
      v11[3] = &unk_264764B28;
      v11[4] = self;
      id v12 = v5;
      v10 = v5;
      +[APUIAppIconDataSource openApplication:v9 completion:v11];
    }
    else
    {
      v10 = __atxlog_handle_ui();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = [v4 state];
        _os_log_impl(&dword_225AE0000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: gesture recognizer state: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[APUIAppSuggestionView _tapRecognized:]();
    }
  }
}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v3 = __40__APUIAppSuggestionView__tapRecognized___block_invoke_2;
  }
  else
  {
    v2 = v5;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v3 = __40__APUIAppSuggestionView__tapRecognized___block_invoke_3;
  }
  v2[2] = v3;
  v2[3] = &unk_264764798;
  id v4 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  v2[5] = v4;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 view:*(void *)(a1 + 32) didFinishExecutingSuggestion:*(void *)(a1 + 40)];
}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 view:*(void *)(a1 + 32) didFailExecutingSuggestion:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)layoutSuggestion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_225AE0000, v0, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: No suggestions provided", v1, 0xCu);
}

- (void)layoutSuggestion:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_225AE0000, v1, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: suggestion executable is not a string: %@", v2, 0x16u);
}

- (void)_setAppWithBundleId:(os_log_t)log reason:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136446722;
  uint64_t v4 = "-[APUIAppSuggestionView _setAppWithBundleId:reason:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: %{public}s:%@ reason:%@", (uint8_t *)&v3, 0x20u);
}

- (void)_tapRecognized:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_225AE0000, v0, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: tried to tap a suggestion before the last execution ended", v1, 0xCu);
}

@end