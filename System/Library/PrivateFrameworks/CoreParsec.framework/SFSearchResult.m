@interface SFSearchResult
@end

@implementation SFSearchResult

void __82__SFSearchResult_VisualCat__processVisualCATResultSynchronouslyUsingPatternClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (PARLogHandleForCategory_onceToken_23 != -1) {
    dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
  }
  v7 = (id)PARLogHandleForCategory_logHandles_4_25;
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19C7E7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "execute", "", (uint8_t *)&v16, 2u);
  }

  if (v6 || ([v5 visual], v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    if (PARLogHandleForCategory_onceToken_23 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_23, &__block_literal_global_24);
    }
    v10 = (void *)PARLogHandleForCategory_logHandles_4_25;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_25, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = [v6 localizedDescription];
      int v16 = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_19C7E7000, v11, OS_LOG_TYPE_ERROR, "Empty VisualCAT output, check DialogEngine logs. Execution error: %@.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v14 = *(void **)(a1 + 40);
    v15 = [v5 visual];
    [v14 setVisualCATOutput:v15];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end