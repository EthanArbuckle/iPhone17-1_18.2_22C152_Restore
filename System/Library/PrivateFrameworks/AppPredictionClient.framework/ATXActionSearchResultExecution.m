@interface ATXActionSearchResultExecution
- (ATXActionSearchResultExecutionDelegate)delegate;
- (BOOL)_delegateDoesRespond;
- (BOOL)_shouldTellDelegateToClearActionOnDismissal:(int64_t)a3;
- (SFSearchResult)searchResult;
- (WFSuggestionsWorkflowRunnerClient)workflowRunnerClient;
- (WFWorkflowRunViewSource)runViewSource;
- (void)_spawnShortcutExecutionWithShortcut:(id)a3 executionContext:(int64_t)a4;
- (void)executeShortcut;
- (void)setDelegate:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setWorkflowRunnerClient:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation ATXActionSearchResultExecution

- (void)executeShortcut
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "e:%ld * searchExec: Attempted to run shortcut from indexed search result, but VCInteractionDonation was nil.", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F626A0];
  v9[0] = *MEMORY[0x1E4F62688];
  v9[1] = v2;
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "searchExec: launching UAUserActivityProxy...", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) userActivityProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48;
  v6[3] = &unk_1E5D08058;
  id v7 = *(id *)(a1 + 32);
  [v5 launchActivityWithOptions:v3 completionHandler:v6];
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint8_t v6 = v5;
  if ((a2 & 1) == 0)
  {
    BOOL v9 = v5 == 0;
    goto LABEL_7;
  }
  id v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) bundleId];
    int v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: successfully launched UAUserActivityProxy for bundleId: %@", (uint8_t *)&v14, 0xCu);
  }
  if (v6)
  {
    BOOL v9 = 0;
LABEL_7:
    v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48_cold_2(a1);
    }

    if (!v9)
    {
      v11 = __atxlog_handle_ui();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48_cold_1(v6);
      }
    }
  }
  v12 = [*(id *)(a1 + 32) userActivityProxy];
  id v13 = self;
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2;
  block[3] = &unk_1E5D05D78;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = __atxlog_handle_ui();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_3(v1, v2);
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    if (v4)
    {
      id v5 = [v4 shortcut];

      id v6 = __atxlog_handle_ui();
      uint64_t v2 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_DEFAULT, "searchExec: fetched voiceShortcut SUCCESS. Continuing...", v8, 2u);
        }

        id v7 = *(void **)(a1 + 48);
        uint64_t v2 = [*(id *)(a1 + 40) shortcut];
        [v7 _spawnShortcutExecutionWithShortcut:v2 executionContext:5];
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_2();
      }
    }
    else
    {
      uint64_t v2 = __atxlog_handle_ui();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_1();
      }
    }
  }
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72;
  block[3] = &unk_1E5D080A8;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_ui();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "searchExec: fetchDataAndUpdateIntentFromIdentifier attributeValues: %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) count])
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_ui();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_6();
      }
      goto LABEL_27;
    }
    id v5 = v4;
    if (![v5 count])
    {
      id v6 = __atxlog_handle_ui();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_2();
      }
      goto LABEL_26;
    }
    id v6 = [v5 objectAtIndexedSubscript:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v7 = __atxlog_handle_ui();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_5();
      }
    }
    id v8 = (void *)MEMORY[0x1AD0D3C30]();
    id v15 = 0;
    BOOL v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];
    id v10 = v15;
    if (v10 || !v9)
    {
      int v14 = __atxlog_handle_ui();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_4();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x1E4F30738]) initWithIntent:v9];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        [*(id *)(a1 + 40) _spawnShortcutExecutionWithShortcut:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) executionContext:5];
LABEL_25:

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      int v14 = __atxlog_handle_ui();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_3();
      }
    }

    goto LABEL_25;
  }
  id v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_1();
  }
LABEL_28:
}

- (void)_spawnShortcutExecutionWithShortcut:(id)a3 executionContext:(int64_t)a4
{
  id v6 = a3;
  long long v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: invoking ShortcutsRuntime for execution", v13, 2u);
  }

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB49C0]) initWithINShortcut:v6 executionContext:a4];
  [(ATXActionSearchResultExecution *)self setWorkflowRunnerClient:v8];

  BOOL v9 = [(ATXActionSearchResultExecution *)self runViewSource];
  id v10 = [(ATXActionSearchResultExecution *)self workflowRunnerClient];
  [v10 setRunViewSource:v9];

  uint64_t v11 = [(ATXActionSearchResultExecution *)self workflowRunnerClient];
  [v11 setDelegate:self];

  uint64_t v12 = [(ATXActionSearchResultExecution *)self workflowRunnerClient];
  [v12 start];
}

- (BOOL)_shouldTellDelegateToClearActionOnDismissal:(int64_t)a3
{
  id v4 = [(ATXActionSearchResultExecution *)self searchResult];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  if (CFPreferencesGetAppBooleanValue(@"displayRecentDonations", @"com.apple.duetexpertd", 0)) {
    return 0;
  }
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_delegateDoesRespond
{
  uint64_t v2 = [(ATXActionSearchResultExecution *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = v5;
    __int16 v10 = 2048;
    id v11 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = __atxlog_handle_ui();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    id v21 = v9;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", (uint8_t *)&v20, 0xCu);
  }

  BOOL v12 = [(ATXActionSearchResultExecution *)self _delegateDoesRespond];
  id v13 = __atxlog_handle_ui();
  int v14 = v13;
  if (v10 || v6)
  {
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
      }

      int v14 = __atxlog_handle_ui();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:](v10);
      }
      uint64_t v15 = 1;
      uint64_t v16 = 2;
    }
    else if (v6)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient:didFinishRunningWithError: CANCELLED", (uint8_t *)&v20, 2u);
      }
      uint64_t v15 = 1;
      uint64_t v16 = 5;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
      }
      uint64_t v16 = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient:didFinishRunningWithError: SUCCEEDED", (uint8_t *)&v20, 2u);
    }
    uint64_t v15 = 3;
    uint64_t v16 = 1;
  }

  if (v12)
  {
    uint64_t v17 = __atxlog_handle_ui();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_INFO, "searchExec: calling delegate for ATXActionSearchResultExecution", (uint8_t *)&v20, 2u);
    }

    BOOL v18 = [(ATXActionSearchResultExecution *)self _shouldTellDelegateToClearActionOnDismissal:v15];
    v19 = [(ATXActionSearchResultExecution *)self delegate];
    [v19 actionSearchResultExecution:self didDismissRemoteAlertWithReason:v15 actionCompleted:1 withResult:v16 shouldClearAction:v18];
  }
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (ATXActionSearchResultExecutionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXActionSearchResultExecutionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFSuggestionsWorkflowRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (void)setWorkflowRunnerClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_searchResult, 0);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_7_1(&dword_1A790D000, v2, v3, "e:%ld * %ld * %s : %@ -- %@", v4, v5, v6, v7, v8);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_48_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleId];
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "e:%ld * searchExec: failed to launch UAUserActivityProxy for bundleId: %@", v4, v5, v6, v7, v8);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "e:fault searchExec: voiceShortcut was nil but there was no error!", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "e:%ld * searchExec: voiceShortcut.shortcut is nil! This is unexpected!", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218242;
  uint64_t v4 = 5516;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "e:%ld * searchExec: VoiceShortcutClient fetch error: %@", (uint8_t *)&v3, 0x16u);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "e:%ld * searchExec: attributeValues has length 0, this is unexpected!", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "e:%ld * searchExec: attribute values returned 0 results!", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "e:fault searchExec: unexpected intent type!", v2, v3, v4, v5, v6);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "e:%ld * searchExec: Could not unarchive intent: %@", v1, 0x16u);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_5()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "e:%ld * searchExec: data is unexpected type! - %@", v4, v5, v6, v7, v8);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_72_cold_6()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "e:%ld * searchExec: fetched attributes is unexpected type! - %@", v4, v5, v6, v7, v8);
}

- (void)workflowRunnerClient:(void *)a1 didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_7_1(&dword_1A790D000, v2, v3, "e:%ld * %ld * %s : %@ -- %@", v4, v5, v6, v7, v8);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "e:%ld * searchExec: workflowRunnerClient:didFinishRunningWithError:", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "e:fault searchExec: workflowRunnerClient:didFinishRunningWithError: UNEXPECTED CODE PATH REACHED", v2, v3, v4, v5, v6);
}

@end