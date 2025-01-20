@interface APUIActionSuggestionView
- (void)_tapRecognized:(id)a3;
- (void)layoutSuggestion:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation APUIActionSuggestionView

- (void)layoutSuggestion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(APUISuggestionView *)self setSuggestion:v4];
    [(APUISuggestionView *)self createViewsIfNeeded];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapRecognized_];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    [(APUIActionSuggestionView *)self addGestureRecognizer:self->_tapRecognizer];
    v7 = [v4 executableSpecification];
    v8 = [v7 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      objc_storeStrong((id *)&self->_atxAction, v8);
      v10 = [v9 bundleId];
      v11 = [v9 userActivityWebpageURL];
      v12 = ATXBundleIdReplacementForBundleIdWithWebpageURLHint();

      v13 = [v9 intent];
      v14 = [v13 keyImage];
      v15 = __atxlog_handle_ui();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_225AE0000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: %@ inImage = intent.keyImage = %@", buf, 0x16u);
      }

      [(APUISuggestionView *)self setINImage:v14 withBundleID:v12];
      v16 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__APUIActionSuggestionView_layoutSuggestion___block_invoke;
      block[3] = &unk_2647648B8;
      v20 = v9;
      id v21 = v12;
      v22 = self;
      id v17 = v12;
      v18 = v9;
      dispatch_async(v16, block);
    }
    else
    {
      v13 = __atxlog_handle_ui();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[APUIActionSuggestionView layoutSuggestion:]();
      }
    }

    [(APUISuggestionView *)self installReasonLabelIfNecessary];
  }
  else
  {
    v8 = __atxlog_handle_ui();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[APUIActionSuggestionView layoutSuggestion:]();
    }
  }
}

void __45__APUIActionSuggestionView_layoutSuggestion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionTitle];
  if (![*(id *)(a1 + 32) isHeuristic]) {
    goto LABEL_6;
  }
  v3 = [*(id *)(a1 + 32) actionSubtitle];
  if (![v3 length])
  {

LABEL_6:
    v3 = [MEMORY[0x263F24FF8] localizedNameForBundle:*(void *)(a1 + 40)];
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__APUIActionSuggestionView_layoutSuggestion___block_invoke_2;
  block[3] = &unk_2647648B8;
  void block[4] = *(void *)(a1 + 48);
  id v7 = v2;
  id v8 = v3;
  id v4 = v3;
  id v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__APUIActionSuggestionView_layoutSuggestion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) titleLabel];
  [v2 setText:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) subtitleLabel];
  [v3 setText:*(void *)(a1 + 48)];
}

- (void)_tapRecognized:(id)a3
{
  id v4 = a3;
  if (![(APUISuggestionView *)self canEngageSuggestion])
  {
    v11 = __atxlog_handle_ui();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[APUIActionSuggestionView _tapRecognized:].cold.5();
    }
    goto LABEL_29;
  }
  [(APUISuggestionView *)self setCanEngageSuggestion:0];
  if ([v4 state] == 3)
  {
    id v5 = [(APUISuggestionView *)self delegate];
    v6 = [(APUISuggestionView *)self suggestion];
    [v5 view:self didTapSuggestion:v6];

    p_atxAction = &self->_atxAction;
    if (![(ATXAction *)self->_atxAction actionType])
    {
      id v8 = [(ATXAction *)*p_atxAction intent];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v10 = [(ATXAction *)*p_atxAction intent];
        v11 = [v10 linkAction];

        if (v11)
        {
          v12 = 0;
LABEL_13:
          id v17 = __atxlog_handle_ui();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_225AE0000, v17, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: invoking ShortcutsRuntime for action execution", v30, 2u);
          }

          id v18 = objc_alloc(MEMORY[0x263F85430]);
          v19 = v18;
          if (v11)
          {
            v20 = [(ATXAction *)*p_atxAction bundleId];
            id v21 = (WFSuggestionsWorkflowRunnerClient *)[v19 initWithLinkAction:v11 bundleIdentifier:v20 resultSurface:1];
            workflowRunnerClient = self->_workflowRunnerClient;
            self->_workflowRunnerClient = v21;
          }
          else
          {
            uint64_t v27 = (WFSuggestionsWorkflowRunnerClient *)[v18 initWithINShortcut:v12 executionContext:3];
            v20 = self->_workflowRunnerClient;
            self->_workflowRunnerClient = v27;
          }

          [(WFSuggestionsWorkflowRunnerClient *)self->_workflowRunnerClient setDelegate:self];
          [(WFSuggestionsWorkflowRunnerClient *)self->_workflowRunnerClient start];

          goto LABEL_29;
        }
        v29 = __atxlog_handle_ui();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[APUIActionSuggestionView _tapRecognized:](v29);
        }

LABEL_28:
        v11 = [(APUISuggestionView *)self delegate];
        v28 = [(APUISuggestionView *)self suggestion];
        [v11 view:self didFailExecutingSuggestion:v28];

LABEL_29:
        goto LABEL_30;
      }
    }
    if ([(ATXAction *)*p_atxAction actionType] && [(ATXAction *)*p_atxAction actionType] != 2)
    {
      if ([(ATXAction *)*p_atxAction actionType] == 1)
      {
        id v23 = objc_alloc(MEMORY[0x263F0FF70]);
        v24 = [(ATXAction *)*p_atxAction userActivity];
        __int16 v25 = [(ATXAction *)*p_atxAction bundleId];
        v12 = (void *)[v23 initWithUserActivity:v24 bundleIdentifier:v25];

        if (v12) {
          goto LABEL_12;
        }
        v26 = __atxlog_handle_ui();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          -[APUIActionSuggestionView _tapRecognized:]((id *)&self->_atxAction, v26);
        }
      }
      else
      {
        v26 = __atxlog_handle_ui();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          -[APUIActionSuggestionView _tapRecognized:].cold.4((id *)&self->_atxAction);
        }
      }
    }
    else
    {
      v13 = [(ATXAction *)*p_atxAction bundleId];
      v14 = [(ATXAction *)*p_atxAction intent];
      [v14 _setLaunchId:v13];

      id v15 = objc_alloc(MEMORY[0x263F0FF70]);
      v16 = [(ATXAction *)*p_atxAction intent];
      v12 = (void *)[v15 initWithIntent:v16];

      if (v12)
      {
LABEL_12:
        v11 = 0;
        goto LABEL_13;
      }
      v26 = __atxlog_handle_ui();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[APUIActionSuggestionView _tapRecognized:]((id *)&self->_atxAction);
      }
    }

    goto LABEL_28;
  }
LABEL_30:
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_ui();
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
      id v15 = __atxlog_handle_ui();
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
    v14 = __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_58;
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
    v14 = __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
  }
  v13[2] = v14;
  v13[3] = &unk_2647647C0;
  v13[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

void __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 suggestion];
  [v4 view:v2 didFinishExecutingSuggestion:v3];
}

void __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_58(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 suggestion];
  [v4 view:v2 didFailExecutingSuggestion:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_atxAction, 0);
}

- (void)layoutSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225AE0000, v0, v1, "e:%ld * SuggestionsWidget: No suggestions provided to ActionSuggestionView", v2, v3, v4, v5, v6);
}

- (void)layoutSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225AE0000, v0, v1, "e:%ld * SuggestionsWidget: error: suggestion is not an action", v2, v3, v4, v5, v6);
}

- (void)_tapRecognized:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: Unable to obtain Link action from INAppIntent", v1, 2u);
}

- (void)_tapRecognized:(id *)a1 .cold.2(id *a1)
{
  uint64_t v1 = [*a1 intent];
  OUTLINED_FUNCTION_2(&dword_225AE0000, v2, v3, "e:fault SuggestionsWidget: init method returned nil: INShortcut initWithIntent:%@", v4, v5, v6, v7, 2u);
}

- (void)_tapRecognized:(id *)a1 .cold.3(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*a1 userActivity];
  uint64_t v5 = [*a1 bundleId];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_fault_impl(&dword_225AE0000, a2, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: init method returned nil: INShortcut initWithUserActivity:%@ bundleIdentifier:%@", (uint8_t *)&v6, 0x16u);
}

- (void)_tapRecognized:(id *)a1 .cold.4(id *a1)
{
  [*a1 actionType];
  OUTLINED_FUNCTION_2(&dword_225AE0000, v1, v2, "e:fault SuggestionsWidget: tried to handle unknown action type in widget: %ld", v3, v4, v5, v6, 0);
}

- (void)_tapRecognized:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225AE0000, v0, v1, "e:%ld * SuggestionsWidget: tried to tap a suggestion before the last execution ended", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_225AE0000, v1, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: ShortcutsRuntime had an error: %@", v2, 0x16u);
}

@end