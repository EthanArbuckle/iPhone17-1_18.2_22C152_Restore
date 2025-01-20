@interface ATXContextMenuFeedbackTracker
+ (id)_suggestionStringForProactiveSuggestion:(id)a3;
+ (void)_logContextMenuFeedbackWithMenuActionType:(int)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 tracker:(id)a6;
+ (void)logContextMenuFeedbackForDismissOnceWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5;
+ (void)logContextMenuFeedbackForNeverShowAgainWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5;
@end

@implementation ATXContextMenuFeedbackTracker

+ (void)logContextMenuFeedbackForDismissOnceWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
}

+ (void)logContextMenuFeedbackForNeverShowAgainWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
}

+ (void)_logContextMenuFeedbackWithMenuActionType:(int)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 tracker:(id)a6
{
  uint64_t v6 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a4;
  v12 = objc_opt_new();
  [v12 setMenuActionType:v8];
  v13 = [v11 clientModelSpecification];
  v14 = [v13 clientModelId];
  [v12 setClientModelId:v14];

  v15 = (void *)MEMORY[0x1E4F93950];
  v16 = [v11 executableSpecification];
  v17 = objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
  [v12 setExecutableType:v17];

  v18 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
  [v12 setConsumerSubType:v18];

  v19 = [a1 _suggestionStringForProactiveSuggestion:v11];

  [v12 setSuggestion:v19];
  [v10 trackScalarForMessage:v12];

  v20 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[ATXContextMenuFeedbackTracker _logContextMenuFeedbackWithMenuActionType:suggestion:consumerSubType:tracker:]((objc_class *)a1, v12, v20);
  }
}

+ (id)_suggestionStringForProactiveSuggestion:(id)a3
{
  id v3 = a3;
  v4 = [v3 executableSpecification];
  v5 = [v4 executableObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 actionKey];
  }
  else
  {
    v7 = [v3 executableSpecification];
    uint64_t v6 = [v7 executableIdentifier];
  }

  return v6;
}

+ (void)_logContextMenuFeedbackWithMenuActionType:(NSObject *)a3 suggestion:consumerSubType:tracker:.cold.1(objc_class *a1, void *a2, NSObject *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  NSStringFromClass(a1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [a2 consumerSubType];
  uint64_t v7 = [a2 menuActionType];
  if (v7 == 1)
  {
    uint64_t v8 = @"DismissOnce";
  }
  else if (v7 == 2)
  {
    uint64_t v8 = @"NeverShowAgain";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = [a2 suggestion];
  id v10 = [a2 clientModelId];
  id v11 = [a2 executableType];
  *(_DWORD *)buf = 138413570;
  id v13 = v5;
  __int16 v14 = 2112;
  v15 = v6;
  __int16 v16 = 2112;
  v17 = v8;
  __int16 v18 = 2112;
  v19 = v9;
  __int16 v20 = 2112;
  v21 = v10;
  __int16 v22 = 2112;
  v23 = v11;
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBContextMenuFeedbackTracker with consumerSubType: %@, menuActionType: %@, suggestion: %@, clientModelId: %@, executableType: %@", buf, 0x3Eu);
}

@end