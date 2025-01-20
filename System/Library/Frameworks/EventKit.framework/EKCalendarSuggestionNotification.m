@interface EKCalendarSuggestionNotification
+ (id)_queue;
- (Class)_SGSuggestionsServiceClass;
- (NSString)originAppName;
- (SGEvent)suggestedEvent;
- (void)updateSuggestedEventWithEventStore:(id)a3;
@end

@implementation EKCalendarSuggestionNotification

- (NSString)originAppName
{
  originAppName = self->_originAppName;
  if (!originAppName)
  {
    v4 = [(EKCalendarSuggestionNotification *)self suggestedEvent];
    v5 = [v4 origin];
    v6 = [v5 bundleId];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
    v8 = [v7 localizedName];
    v9 = self->_originAppName;
    self->_originAppName = v8;

    originAppName = self->_originAppName;
  }

  return originAppName;
}

+ (id)_queue
{
  if (_queue_onceToken_0 != -1) {
    dispatch_once(&_queue_onceToken_0, &__block_literal_global_33);
  }
  v2 = (void *)_queue_queue_0;

  return v2;
}

uint64_t __42__EKCalendarSuggestionNotification__queue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.EventKit.EKCalendarSuggestionNotificationQueue", 0);
  uint64_t v1 = _queue_queue_0;
  _queue_queue_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (void)updateSuggestedEventWithEventStore:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke;
  v7[3] = &unk_1E5B97140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resourceChangeFromEventStore:*(void *)(a1 + 40)];
  v3 = [v2 calendarItem];
  id v4 = [v3 suggestionInfo];
  v5 = [v4 uniqueKey];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = objc_msgSend((id)objc_msgSend(v6, "_SGSuggestionsServiceClass"), "serviceForEvents");
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__8;
    v20 = __Block_byref_object_dispose__8;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke_12;
    v12[3] = &unk_1E5B97BA8;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v2;
    v15 = &v16;
    v9 = v8;
    v14 = v9;
    [v7 eventFromUniqueId:v5 withCompletion:v12];
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    if (!dispatch_group_wait(v9, v10)) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), (id)v17[5]);
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = (void *)v6[27];
    v6[27] = 0;
  }
}

void __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    id v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = @"no error returned";
      if (v7) {
        v14 = v7;
      }
      int v15 = 136315906;
      uint64_t v16 = "-[EKCalendarSuggestionNotification updateSuggestedEventWithEventStore:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_ERROR, "%s: Error attempting to look up the suggested event for notification [%@] and resource change [%@] with error [%@].", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (SGEvent)suggestedEvent
{
  suggestedEvent = self->_suggestedEvent;
  if (!suggestedEvent)
  {
    id v4 = [(id)objc_opt_class() _queue];
    dispatch_sync(v4, &__block_literal_global_18_0);

    suggestedEvent = self->_suggestedEvent;
  }

  return suggestedEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppName, 0);

  objc_storeStrong((id *)&self->_suggestedEvent, 0);
}

@end