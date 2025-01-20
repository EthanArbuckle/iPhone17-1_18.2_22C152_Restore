@interface BLSBacklightFBSSceneEnvironmentActionHandler
+ (id)desiredFidelityRequestFromAction:(id)a3;
+ (id)frameSpecifiersRequestFromAction:(id)a3;
- (id)respondToActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5;
@end

@implementation BLSBacklightFBSSceneEnvironmentActionHandler

+ (id)frameSpecifiersRequestFromAction:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [BLSFrameSpecifiersRequest alloc];
    v5 = [v3 dateInterval];
    v6 = [v3 previousPresentationDate];
    uint64_t v7 = [v3 shouldReset];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke;
    v10[3] = &unk_1E6107A78;
    id v11 = v3;
    v8 = [(BLSFrameSpecifiersRequest *)v4 initWithDateInterval:v5 previousPresentationDate:v6 shouldReset:v7 completion:v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)desiredFidelityRequestFromAction:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [BLSDesiredFidelityRequest alloc];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke;
    v7[3] = &unk_1E6107088;
    id v8 = v3;
    v5 = [(BLSDesiredFidelityRequest *)v4 initWithCompletion:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void **)(a1 + 32);
  int v4 = [*(id *)(a1 + 32) canSendResponse];
  v5 = bls_scenes_log();
  v6 = (BLSDesiredFidelityResponse *)v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_1();
    }

    uint64_t v7 = *v3;
    v6 = [[BLSDesiredFidelityResponse alloc] initWithDesiredFidelity:a2];
    [v7 sendResponse:v6];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_2();
  }
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  int v4 = (void **)(a1 + 32);
  int v6 = [v5 canSendResponse];
  uint64_t v7 = bls_scenes_log();
  id v8 = (BLSFrameSpecifiersRequestResponse *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_1();
    }

    v9 = *v4;
    id v8 = [[BLSFrameSpecifiersRequestResponse alloc] initWithDateSpecifiers:v3];
    [v9 sendResponse:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_2();
  }
}

- (id)respondToActions:(id)a3 forFBSScene:(id)a4 fromTransitionContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  int v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = bls_scenes_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BLSBacklightFBSSceneEnvironmentActionHandler respondToActions:forFBSScene:fromTransitionContext:](v5);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v14 = bls_scenes_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v13;
            _os_log_debug_impl(&dword_1B55DE000, v14, OS_LOG_TYPE_DEBUG, "respondToActions expect to handle action:%@", buf, 0xCu);
          }
          v15 = v6;
        }
        else
        {
          v14 = bls_scenes_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v13;
            _os_log_debug_impl(&dword_1B55DE000, v14, OS_LOG_TYPE_DEBUG, "respondToActions unhandled action:%@", buf, 0xCu);
          }
          v15 = v21;
        }

        [v15 addObject:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
      uint64_t v10 = v16;
    }
    while (v16);
  }

  if ([v6 count])
  {
    dispatch_time_t v17 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke;
    block[3] = &unk_1E6107AA0;
    id v23 = v6;
    dispatch_after(v17, MEMORY[0x1E4F14428], block);
  }
  v18 = bls_scenes_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[BLSBacklightFBSSceneEnvironmentActionHandler respondToActions:forFBSScene:fromTransitionContext:](v21);
  }

  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];

  return v19;
}

void __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = (uint64_t *)(a1 + 32);
  v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v5 = v3;
  char v6 = 0;
  uint64_t v7 = *(void *)v13;
  *(void *)&long long v4 = 138412290;
  long long v11 = v4;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v2);
      }
      uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if (objc_msgSend(v9, "_expectsResponse", v11, (void)v12)
        && [v9 canSendResponse])
      {
        uint64_t v10 = bls_scenes_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v11;
          dispatch_time_t v17 = v9;
          _os_log_debug_impl(&dword_1B55DE000, v10, OS_LOG_TYPE_DEBUG, "response failed for action:%@", buf, 0xCu);
        }

        char v6 = 1;
      }
    }
    uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  }
  while (v5);

  if (v6)
  {
    v2 = bls_scenes_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke_cold_1(v1, v2);
    }
LABEL_16:
  }
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  NSStringFromBLSUpdateFidelity(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_2(&dword_1B55DE000, v2, v3, "will send desiredFidelity:%{public}@ response to desiredFidelityAction:%{public}@", v4, v5, v6, v7, v8);
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_desiredFidelityRequestFromAction___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  NSStringFromBLSUpdateFidelity(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_0(&dword_1B55DE000, v2, v3, "unable to send desiredFidelity:%{public}@ response to desiredFidelityAction:%{public}@", v4, v5, v6, v7, v8);
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  objc_msgSend(v1, "bls_boundedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_2(&dword_1B55DE000, v2, v3, "will send specifiers:%{public}@ response to frameSpecifiersAction:%{public}@", v4, v5, v6, v7, v8);
}

void __81__BLSBacklightFBSSceneEnvironmentActionHandler_frameSpecifiersRequestFromAction___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  objc_msgSend(v1, "bls_boundedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_0(&dword_1B55DE000, v2, v3, "unable to send specifiers:%{public}@ response to frameSpecifiersAction:%{public}@", v4, v5, v6, v7, v8);
}

- (void)respondToActions:(void *)a1 forFBSScene:fromTransitionContext:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_1(&dword_1B55DE000, v1, v2, "respondToActions: remaining action count:%ld", v3, v4, v5, v6, 0);
}

- (void)respondToActions:(void *)a1 forFBSScene:fromTransitionContext:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_1(&dword_1B55DE000, v1, v2, "respondToActions: start action count:%ld", v3, v4, v5, v6, 0);
}

void __99__BLSBacklightFBSSceneEnvironmentActionHandler_respondToActions_forFBSScene_fromTransitionContext___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218242;
  uint64_t v4 = 0x4014000000000000;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "one or more actions did not respond after %lf seconds; %@",
    (uint8_t *)&v3,
    0x16u);
}

@end