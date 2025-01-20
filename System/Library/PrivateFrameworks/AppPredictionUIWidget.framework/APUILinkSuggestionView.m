@interface APUILinkSuggestionView
- (void)_tapRecognized:(id)a3;
- (void)layoutSuggestion:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation APUILinkSuggestionView

- (void)layoutSuggestion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(APUISuggestionView *)self setSuggestion:v4];
    [(APUISuggestionView *)self createViewsIfNeeded];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapRecognized_];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    [(APUILinkSuggestionView *)self addGestureRecognizer:self->_tapRecognizer];
    v7 = [v4 executableSpecification];
    v8 = [v7 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_linkAction, v8);
      v9 = [v8 bundleId];
      v10 = [v4 uiSpecification];
      v11 = [v10 title];

      v12 = [v4 uiSpecification];
      v13 = [v12 subtitle];

      v14 = [v8 image];
      [(APUISuggestionView *)self setLNImage:v14 withBundleID:v9];

      v15 = [(APUISuggestionView *)self titleLabel];
      [v15 setText:v11];

      v16 = [(APUISuggestionView *)self subtitleLabel];
      [v16 setText:v13];
    }
    else
    {
      v17 = __atxlog_handle_ui();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[APUILinkSuggestionView layoutSuggestion:]();
      }
    }
  }
  else
  {
    v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[APUILinkSuggestionView layoutSuggestion:]();
    }
  }
}

- (void)_tapRecognized:(id)a3
{
  id v4 = a3;
  if (![(APUISuggestionView *)self canEngageSuggestion])
  {
    workflowRunnerClient = __atxlog_handle_ui();
    if (os_log_type_enabled(workflowRunnerClient, OS_LOG_TYPE_ERROR)) {
      -[APUIActionSuggestionView _tapRecognized:].cold.5();
    }
    goto LABEL_8;
  }
  [(APUISuggestionView *)self setCanEngageSuggestion:0];
  if ([v4 state] == 3)
  {
    v5 = [(APUISuggestionView *)self delegate];
    v6 = [(APUISuggestionView *)self suggestion];
    [v5 view:self didTapSuggestion:v6];

    v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: Invoking ShortcutsRuntime for link action execution", v13, 2u);
    }

    id v8 = objc_alloc(MEMORY[0x263F85430]);
    v9 = [(ATXLinkActionContainer *)self->_linkAction action];
    v10 = [(ATXLinkActionContainer *)self->_linkAction bundleId];
    v11 = (void *)[v8 initWithLinkAction:v9 bundleIdentifier:v10 resultSurface:1];

    [v11 setDelegate:self];
    [v11 start];
    workflowRunnerClient = self->_workflowRunnerClient;
    self->_workflowRunnerClient = (WFWorkflowRunnerClient *)v11;
LABEL_8:
  }
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = v5;
    __int16 v10 = 2048;
    id v11 = v6;
    _os_log_impl(&dword_225AE0000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = __atxlog_handle_ui();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v20 = v9;
    _os_log_impl(&dword_225AE0000, v11, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", buf, 0xCu);
  }

  if (v10 || v6)
  {
    if (v6)
    {
      v15 = __atxlog_handle_ui();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225AE0000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: ShortcutsRuntime was cancelled", buf, 2u);
      }
    }
    if (v10)
    {
      v16 = __atxlog_handle_ui();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[APUIActionSuggestionView workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
      }
    }
    v13 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v14 = __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_55;
  }
  else
  {
    uint64_t v12 = __atxlog_handle_ui();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225AE0000, v12, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: ShortcutsRuntime completed successfully.", buf, 2u);
    }

    v13 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v14 = __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
  }
  v13[2] = v14;
  v13[3] = &unk_2647647C0;
  v13[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

void __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 suggestion];
  [v4 view:v2 didFinishExecutingSuggestion:v3];
}

void __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_55(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 suggestion];
  [v4 view:v2 didFailExecutingSuggestion:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
}

- (void)layoutSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225AE0000, v0, v1, "e:%ld * SuggestionsWidget: No suggestions provided to LinkSuggestionView", v2, v3, v4, v5, v6);
}

- (void)layoutSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225AE0000, v0, v1, "e:%ld * SuggestionsWidget: error: suggestion is not a link action", v2, v3, v4, v5, v6);
}

@end