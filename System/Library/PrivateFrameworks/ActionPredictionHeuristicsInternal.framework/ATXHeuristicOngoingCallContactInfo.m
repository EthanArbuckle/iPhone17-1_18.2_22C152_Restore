@interface ATXHeuristicOngoingCallContactInfo
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicOngoingCallContactInfo

- (id)permanentRefreshTriggers
{
  v2 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
  v3 = [MEMORY[0x1E4F5B6B8] keyPathForActiveCall];
  v4 = [(ATXInformationHeuristicRefreshContextChangeTrigger *)v2 initWithCDContextualKeyPath:v3];

  v5 = (void *)MEMORY[0x1D25F43D0]();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, 0);

  return v6;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3 = a3;
  v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: producing ongoing call suggestions", buf, 2u);
  }

  v5 = objc_opt_new();
  v6 = [MEMORY[0x1E4F5B6B8] keyPathForActiveCall];
  v7 = [v5 fetchDataDictionaryForKeyPath:v6];

  v8 = [MEMORY[0x1E4F5B6B8] calleeContactIDsKey];
  v9 = [v7 valueForKey:v8];

  v10 = objc_opt_new();
  if ([v9 count])
  {
    v11 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXOngoingCall: Found a donation in the context store on an active call where either calleeContactIDsKey or calleeHandlesKey is set", v18, 2u);
    }

    v12 = [[ATXOngoingCallSuggestionProducer alloc] initWithEnvironment:v3];
    uint64_t v13 = [(ATXOngoingCallSuggestionProducer *)v12 suggestionsForOngoingCall:v9];

    v10 = (void *)v13;
  }
  v14 = [ATXContextHeuristicResult alloc];
  v15 = [MEMORY[0x1E4F1CAD0] set];
  v16 = [(ATXContextHeuristicResult *)v14 initWithSuggestions:v10 additionalRefreshTriggers:v15];

  return v16;
}

@end