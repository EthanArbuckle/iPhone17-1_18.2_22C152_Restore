@interface CalSuggestionsProvider
+ (id)defaultProvider;
- (BOOL)eventsFoundInMailEnabled;
- (BOOL)suggestionsFrameworkAvailable;
- (CalSuggestionsProvider)init;
- (SGSuggestionsServiceEventsProtocol)service;
- (id)fakeSGRecordID;
- (id)senderForEventWithSuggestionID:(id)a3;
- (id)sgEventFromUniqueID:(id)a3 error:(id *)a4;
- (id)sgRecordIDForEventWithSuggestionID:(id)a3 error:(id *)a4;
- (void)_loadSuggestionsFramework;
- (void)confirmEventWithSuggestionID:(id)a3;
- (void)confirmSGEventWithRecordID:(id)a3;
- (void)rejectSGEventWithRecordID:(id)a3;
- (void)setService:(id)a3;
- (void)setSuggestionsFrameworkAvailable:(BOOL)a3;
@end

@implementation CalSuggestionsProvider

+ (id)defaultProvider
{
  if (defaultProvider_onceToken != -1) {
    dispatch_once(&defaultProvider_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)defaultProvider__defaultProvider;

  return v2;
}

uint64_t __41__CalSuggestionsProvider_defaultProvider__block_invoke()
{
  defaultProvider__defaultProvider = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (CalSuggestionsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalSuggestionsProvider;
  v2 = [(CalSuggestionsProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CalSuggestionsProvider *)v2 _loadSuggestionsFramework];
    if ([(CalSuggestionsProvider *)v3 suggestionsFrameworkAvailable])
    {
      v4 = [NSClassFromString(&cfstr_Sgsuggestionss.isa) serviceForEvents];
      [(CalSuggestionsProvider *)v3 setService:v4];
    }
  }
  return v3;
}

- (void)_loadSuggestionsFramework
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [a1 localizedDescription];
  v5 = [a1 userInfo];
  v8[0] = 136315650;
  OUTLINED_FUNCTION_0_4();
  v9 = v4;
  __int16 v10 = v6;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to load Suggestions bundle with error: %@ userInfo: %@", (uint8_t *)v8, 0x20u);
}

- (id)sgEventFromUniqueID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  if ([(CalSuggestionsProvider *)self suggestionsFrameworkAvailable])
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v8 = [(CalSuggestionsProvider *)self service];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__CalSuggestionsProvider_sgEventFromUniqueID_error___block_invoke;
    v14[3] = &unk_1E56CDD70;
    v16 = &v18;
    v17 = a4;
    v9 = v7;
    v15 = v9;
    [v8 eventFromUniqueId:v6 withCompletion:v14];

    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v9, v10) >= 1)
    {
      uint64_t v11 = +[CalFoundationLogSubsystem suggestions];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CalSuggestionsProvider sgEventFromUniqueID:error:]((uint64_t)v6, v11);
      }
    }
  }
  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __52__CalSuggestionsProvider_sgEventFromUniqueID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a3;
  dispatch_semaphore_t v7 = v6;
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)confirmEventWithSuggestionID:(id)a3
{
  id v4 = a3;
  if ([(CalSuggestionsProvider *)self suggestionsFrameworkAvailable])
  {
    v5 = [(CalSuggestionsProvider *)self service];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke;
    v6[3] = &unk_1E56CDD98;
    v6[4] = self;
    id v7 = v4;
    [v5 eventFromUniqueId:v7 withCompletion:v6];
  }
}

void __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 recordId];
  id v7 = (void *)v6;
  if (!v5)
  {
    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) service];
      id v10 = 0;
      [v8 confirmEventByRecordId:v7 error:&v10];
      id v5 = v10;

      if (v5)
      {
        v9 = +[CalFoundationLogSubsystem suggestions];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke_cold_1();
        }
      }
    }
  }
}

- (id)senderForEventWithSuggestionID:(id)a3
{
  v3 = [(CalSuggestionsProvider *)self sgEventFromUniqueID:a3 error:0];
  id v4 = [v3 origin];
  id v5 = [v4 fromPerson];
  uint64_t v6 = [v5 displayName];

  return v6;
}

- (id)sgRecordIDForEventWithSuggestionID:(id)a3 error:(id *)a4
{
  id v4 = [(CalSuggestionsProvider *)self sgEventFromUniqueID:a3 error:a4];
  id v5 = [v4 recordId];

  return v5;
}

- (id)fakeSGRecordID
{
  if ([(CalSuggestionsProvider *)self suggestionsFrameworkAvailable])
  {
    Class v2 = NSClassFromString(&cfstr_Sgrecordid.isa);
    v3 = [(objc_class *)v2 recordIdWithNumericValue:arc4random()];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)confirmSGEventWithRecordID:(id)a3
{
  id v4 = a3;
  if ([(CalSuggestionsProvider *)self suggestionsFrameworkAvailable])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [(CalSuggestionsProvider *)self service];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__CalSuggestionsProvider_confirmSGEventWithRecordID___block_invoke;
    v10[3] = &unk_1E56CDDC0;
    id v7 = v5;
    uint64_t v11 = v7;
    [v6 confirmEventByRecordId:v4 withCompletion:v10];

    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8) >= 1)
    {
      v9 = +[CalFoundationLogSubsystem suggestions];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CalSuggestionsProvider confirmSGEventWithRecordID:](v9);
      }
    }
  }
}

intptr_t __53__CalSuggestionsProvider_confirmSGEventWithRecordID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)rejectSGEventWithRecordID:(id)a3
{
  id v4 = a3;
  if ([(CalSuggestionsProvider *)self suggestionsFrameworkAvailable])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [(CalSuggestionsProvider *)self service];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__CalSuggestionsProvider_rejectSGEventWithRecordID___block_invoke;
    v10[3] = &unk_1E56CDDC0;
    id v7 = v5;
    uint64_t v11 = v7;
    [v6 rejectEventByRecordId:v4 withCompletion:v10];

    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8) >= 1)
    {
      v9 = +[CalFoundationLogSubsystem suggestions];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CalSuggestionsProvider rejectSGEventWithRecordID:](v9);
      }
    }
  }
}

intptr_t __52__CalSuggestionsProvider_rejectSGEventWithRecordID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)eventsFoundInMailEnabled
{
  Class v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v3 = [v2 containsObject:@"com.apple.iCal"] ^ 1;

  return v3;
}

- (BOOL)suggestionsFrameworkAvailable
{
  return self->_suggestionsFrameworkAvailable;
}

- (void)setSuggestionsFrameworkAvailable:(BOOL)a3
{
  self->_suggestionsFrameworkAvailable = a3;
}

- (SGSuggestionsServiceEventsProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sgEventFromUniqueID:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "We timed out waiting for Suggestions to get an event for unique id %@", (uint8_t *)&v2, 0xCu);
}

void __55__CalSuggestionsProvider_confirmEventWithSuggestionID___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_190D88000, v1, OS_LOG_TYPE_ERROR, "confirmEventWithSuggestionID: %@ failed with error %@", (uint8_t *)v2, 0x16u);
}

- (void)confirmSGEventWithRecordID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "We timed out waiting for Suggestions to confirm our event.", v1, 2u);
}

- (void)rejectSGEventWithRecordID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "We timed out waiting for Suggestions to reject our event.", v1, 2u);
}

@end