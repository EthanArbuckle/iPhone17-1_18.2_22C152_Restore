@interface INIntent(HelperService)
+ (id)atx_createEventIntentWithStartDate:()HelperService endDate:;
+ (id)atx_createIntentWithIntentType:()HelperService intentData:;
- (__CFString)atx_titleWithoutLocalizing;
- (id)atx_subtitleWithEfficientLocalization;
- (id)atx_titleWithEfficientLocalization;
- (uint64_t)atx_indexingHash;
- (uint64_t)atx_isEligibleForWidgets;
- (uint64_t)atx_supportsBackgroundExecution;
- (uint64_t)atx_titleLengthWithoutLocalizing;
- (void)atx_indexingHash;
- (void)atx_isEligibleForWidgets;
- (void)atx_subtitleWithEfficientLocalization;
- (void)atx_supportsBackgroundExecution;
- (void)atx_titleWithEfficientLocalization;
- (void)atx_titleWithoutLocalizing;
@end

@implementation INIntent(HelperService)

- (uint64_t)atx_titleLengthWithoutLocalizing
{
  v1 = objc_msgSend(a1, "atx_titleWithoutLocalizing");
  uint64_t v2 = [v1 length];

  return v2;
}

- (__CFString)atx_titleWithoutLocalizing
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    uint64_t v2 = [a1 _titleWithLocalizer:0 fromBundleURL:0];
    v3 = (void *)v2;
    v4 = &stru_1F2716100;
    if (v2) {
      v4 = (__CFString *)v2;
    }
    v5 = v4;
  }
  else
  {
    v3 = prepareXPCConnection();
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = &stru_1F2716100;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke;
    v10[3] = &unk_1E68A3110;
    v10[4] = a1;
    v10[5] = &v11;
    v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_8;
    v9[3] = &unk_1E68A3138;
    v9[4] = a1;
    v9[5] = &v11;
    [v6 titleForIntentNoLocalization:a1 withReply:v9];

    [v3 invalidate];
    v7 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[INIntent(HelperService) atx_titleWithoutLocalizing]();
    }

    v5 = (__CFString *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  return v5;
}

- (id)atx_titleWithEfficientLocalization
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    id v2 = [a1 _title];
  }
  else
  {
    v3 = prepareXPCConnection();
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    v14 = &stru_1F2716100;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke;
    v8[3] = &unk_1E68A3110;
    v8[4] = a1;
    v8[5] = &v9;
    v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_10;
    v7[3] = &unk_1E68A3138;
    v7[4] = a1;
    v7[5] = &v9;
    [v4 titleForIntent:a1 withReply:v7];

    [v3 invalidate];
    v5 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[INIntent(HelperService) atx_titleWithEfficientLocalization]();
    }

    id v2 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return v2;
}

- (id)atx_subtitleWithEfficientLocalization
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    id v2 = [a1 _subtitle];
  }
  else
  {
    v3 = prepareXPCConnection();
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    uint64_t v13 = __Block_byref_object_dispose_;
    v14 = &stru_1F2716100;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke;
    v8[3] = &unk_1E68A3110;
    v8[4] = a1;
    v8[5] = &v9;
    v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_11;
    v7[3] = &unk_1E68A3138;
    v7[4] = a1;
    v7[5] = &v9;
    [v4 subtitleForIntent:a1 withReply:v7];

    [v3 invalidate];
    v5 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[INIntent(HelperService) atx_subtitleWithEfficientLocalization]();
    }

    id v2 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return v2;
}

- (uint64_t)atx_indexingHash
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    return [a1 _indexingHash];
  }
  else
  {
    v3 = prepareXPCConnection();
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__INIntent_HelperService__atx_indexingHash__block_invoke;
    v8[3] = &unk_1E68A3110;
    v8[4] = a1;
    v8[5] = &v9;
    v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__INIntent_HelperService__atx_indexingHash__block_invoke_12;
    v7[3] = &unk_1E68A3160;
    v7[4] = a1;
    v7[5] = &v9;
    [v4 indexingHashForIntent:a1 withReply:v7];

    [v3 invalidate];
    v5 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[INIntent(HelperService) atx_indexingHash]();
    }

    uint64_t v6 = v10[3];
    _Block_object_dispose(&v9, 8);

    return v6;
  }
}

- (uint64_t)atx_isEligibleForWidgets
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    id v2 = [a1 _codableDescription];
    uint64_t v3 = [v2 isEligibleForWidgets];
  }
  else
  {
    id v2 = prepareXPCConnection();
    uint64_t v9 = 0;
    v10[0] = &v9;
    v10[1] = 0x2020000000;
    char v11 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke;
    v8[3] = &unk_1E68A3110;
    v8[4] = a1;
    v8[5] = &v9;
    v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_14;
    v7[3] = &unk_1E68A3188;
    v7[4] = a1;
    v7[5] = &v9;
    [v4 eligibleForWidgetsForIntent:a1 withReply:v7];

    [v2 invalidate];
    v5 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(INIntent(HelperService) *)(uint64_t)v10 atx_isEligibleForWidgets];
    }

    uint64_t v3 = *(unsigned __int8 *)(v10[0] + 24);
    _Block_object_dispose(&v9, 8);
  }

  return v3;
}

- (uint64_t)atx_supportsBackgroundExecution
{
  if (shouldDenyConnectionForCurrentProcess())
  {
    return [a1 _supportsBackgroundExecution];
  }
  else
  {
    uint64_t v3 = prepareXPCConnection();
    uint64_t v9 = 0;
    v10[0] = &v9;
    v10[1] = 0x2020000000;
    char v11 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke;
    v8[3] = &unk_1E68A3110;
    v8[4] = a1;
    v8[5] = &v9;
    v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_16;
    v7[3] = &unk_1E68A3188;
    v7[4] = a1;
    v7[5] = &v9;
    [v4 supportsBackgroundExecutionForIntent:a1 withReply:v7];

    [v3 invalidate];
    v5 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(INIntent(HelperService) *)(uint64_t)v10 atx_supportsBackgroundExecution];
    }

    uint64_t v6 = *(unsigned __int8 *)(v10[0] + 24);
    _Block_object_dispose(&v9, 8);

    return v6;
  }
}

+ (id)atx_createIntentWithIntentType:()HelperService intentData:
{
  id v5 = a3;
  id v6 = a4;
  if (shouldDenyConnectionForCurrentProcess())
  {
    INIntentCreate();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = prepareXPCConnection();
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke;
    v21[3] = &unk_1E68A31B0;
    v24 = &v25;
    id v9 = v5;
    id v22 = v9;
    id v10 = v6;
    id v23 = v10;
    char v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v21];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_17;
    v17 = &unk_1E68A31D8;
    v20 = &v25;
    id v18 = v9;
    id v19 = v10;
    [v11 createIntentWithIntentType:v18 intentData:v19 withReply:&v14];

    objc_msgSend(v8, "invalidate", v14, v15, v16, v17);
    uint64_t v12 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[INIntent(HelperService) atx_createIntentWithIntentType:intentData:]();
    }

    id v7 = (id)v26[5];
    _Block_object_dispose(&v25, 8);
  }
  return v7;
}

+ (id)atx_createEventIntentWithStartDate:()HelperService endDate:
{
  id v5 = a3;
  id v6 = a4;
  if (shouldDenyConnectionForCurrentProcess())
  {
    id v7 = 0;
  }
  else
  {
    v8 = prepareXPCConnection();
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_19;
    v12[3] = &unk_1E68A3220;
    v12[4] = &v13;
    [v9 createEventIntentWithStartDate:v5 endDate:v6 withReply:v12];

    [v8 invalidate];
    id v10 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[INIntent(HelperService) atx_createEventIntentWithStartDate:endDate:]();
    }

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  return v7;
}

- (void)atx_titleWithoutLocalizing
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "atx_titleWithoutLocalizing returning: %@", v2, v3, v4, v5, v6);
}

- (void)atx_titleWithEfficientLocalization
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "atx_titleWithEfficientLocalization returning: %@", v2, v3, v4, v5, v6);
}

- (void)atx_subtitleWithEfficientLocalization
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "atx_subtitleWithEfficientLocalization returning: %@", v2, v3, v4, v5, v6);
}

- (void)atx_indexingHash
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "atx_indexingHash returning: %lld", v2, v3, v4, v5, v6);
}

- (void)atx_isEligibleForWidgets
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_DEBUG, "atx_isEligibleForWidgets returning: %u", (uint8_t *)v3, 8u);
}

- (void)atx_supportsBackgroundExecution
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_DEBUG, "atx_supportsBackgroundExecution returning: %u", (uint8_t *)v3, 8u);
}

+ (void)atx_createIntentWithIntentType:()HelperService intentData:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "createdIntentWithIntentType returning: %@", v2, v3, v4, v5, v6);
}

+ (void)atx_createEventIntentWithStartDate:()HelperService endDate:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D0F2B000, v0, v1, "createEventIntentWithCurrentDate returning: %@", v2, v3, v4, v5, v6);
}

@end