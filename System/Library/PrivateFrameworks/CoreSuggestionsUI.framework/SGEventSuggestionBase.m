@interface SGEventSuggestionBase
+ (id)_eventStore;
+ (id)calendarImage;
+ (void)confirm:(BOOL)a3 event:(id)a4 completion:(id)a5;
- (SGEventSuggestionBase)initWithRealtimeEvent:(id)a3;
- (SGSuggestionDelegate)suggestionDelegate;
- (id)eventKitEvent;
- (id)primaryActionTitle;
- (id)realtimeSuggestion;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionComparator;
- (id)suggestionDismissAction;
- (id)suggestionImage;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (id)suggestionsEvent;
- (int64_t)suggestionActionButtonType;
- (int64_t)suggestionCategoryActionButtonType;
- (void)dealloc;
- (void)eventKitStoreChangedNotification:(id)a3;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation SGEventSuggestionBase

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_calendarImage, 0);
  objc_storeStrong((id *)&self->_eventKitEvent, 0);
  objc_storeStrong((id *)&self->_realtimeEvent, 0);
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionDelegate);
  return (SGSuggestionDelegate *)WeakRetained;
}

- (id)suggestionImage
{
  calendarImage = self->_calendarImage;
  if (!calendarImage)
  {
    v4 = [(SGRealtimeEvent *)self->_realtimeEvent event];
    v5 = [v4 startTimeZone];

    [(SGRealtimeEvent *)self->_realtimeEvent event];
    if (v5) {
      v6 = {;
    }
      v7 = [v6 start];
    }
    else {
      v6 = {;
    }
      v8 = [v6 start];
      v7 = +[SGBannerUtility dateForUTCDate:v8];
    }
    v9 = +[SGUIIconSupport iconForCalendarDate:v7 drawBorder:1];
    v10 = self->_calendarImage;
    self->_calendarImage = v9;

    calendarImage = self->_calendarImage;
  }
  return calendarImage;
}

- (id)suggestionComparator
{
  v2 = _Block_copy((const void *)SGSuggestionEventTrailingComparator);
  return v2;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
  v7 = [v6 localizedStringForKey:@"SuggestionsBannerMixedSubtitleEvents" value:&stru_1F0ED27A8 table:0];
  uint64_t v8 = [v5 count];

  v9 = objc_msgSend(v3, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    if (v4 == 1)
    {
      v6 = [v3 objectAtIndexedSubscript:0];
      v7 = [v6 suggestionTitle];
    }
    else
    {
      uint64_t v8 = NSString;
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v9 = [v6 localizedStringForKey:@"SuggestionsBannerMixedSubtitleEvents" value:&stru_1F0ED27A8 table:0];
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = &stru_1F0ED27A8;
  }

  return v7;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  if ([a3 count])
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    uint64_t v4 = [v3 localizedStringForKey:@"SuggestionsBannerMultipleSuggestionsTitleFormat" value:&stru_1F0ED27A8 table:0];
  }
  else
  {
    uint64_t v4 = &stru_1F0ED27A8;
  }
  return v4;
}

- (int64_t)suggestionCategoryActionButtonType
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 6;

  return 4 * v3;
}

- (id)suggestionCategoryTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
  BOOL v3 = [v2 localizedStringForKey:@"SuggestionsListSectionEvents" value:&stru_1F0ED27A8 table:0];

  return v3;
}

- (id)suggestionCategoryImage
{
  v2 = objc_opt_class();
  return (id)[v2 calendarImage];
}

- (id)suggestionCategoryId
{
  v2 = @"com.apple.suggestions.SGEventSuggestion";
  return @"com.apple.suggestions.SGEventSuggestion";
}

- (int64_t)suggestionActionButtonType
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 6;

  return 4 * v3;
}

- (id)suggestionDismissAction
{
  if ([(SGRealtimeEvent *)self->_realtimeEvent state] == 4
    || [(SGRealtimeEvent *)self->_realtimeEvent state] == 5)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    uint64_t v5 = [v4 localizedStringForKey:@"SuggestionsListButtonIgnoreEvent" value:&stru_1F0ED27A8 table:0];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__SGEventSuggestionBase_suggestionDismissAction__block_invoke;
    v7[3] = &unk_1E612E548;
    v7[4] = self;
    BOOL v3 = +[SGSuggestionAction actionWithTitle:v5 handler:v7];
  }
  return v3;
}

void __48__SGEventSuggestionBase_suggestionDismissAction__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = sgEventsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 8) event];
    uint64_t v4 = [v3 loggingIdentifier];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B5B6C000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing suggested event (%{public}@) view controller", (uint8_t *)&v6, 0xCu);
  }
  [(id)objc_opt_class() confirm:0 event:*(void *)(*(void *)(a1 + 32) + 8) completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained suggestion:*(void *)(a1 + 32) actionFinished:1];
}

- (id)primaryActionTitle
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _currentContext;
  uint64_t v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v13 = [(SGRealtimeEvent *)self->_realtimeEvent event];
    v14 = [v13 loggingIdentifier];
    int v15 = [(SGRealtimeEvent *)self->_realtimeEvent state];
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 1026;
    int v19 = v15;
    _os_log_debug_impl(&dword_1B5B6C000, v4, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - [SGEvent %{public}@] in State %{public}d", (uint8_t *)&v16, 0x12u);
  }
  int v5 = [(SGRealtimeEvent *)self->_realtimeEvent state];
  switch(v5)
  {
    case 1:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v7 = v6;
      uint64_t v8 = @"SuggestionsListButtonAddToCalendar";
      v9 = @"SuggestionsBannerButtonAdd";
      break;
    case 2:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v7 = v6;
      uint64_t v8 = @"SuggestionsNewListButtonEventUpdate";
      v9 = @"SuggestionsBannerButtonUpdate";
      break;
    case 3:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v7 = v6;
      uint64_t v8 = @"SuggestionsNewListButtonEventDelete";
      v9 = @"SuggestionsBannerButtonDelete";
      break;
    default:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v7 = v6;
      uint64_t v8 = @"SuggestionsListButtonEventShow";
      v9 = @"SuggestionsBannerButtonShow";
      break;
  }
  if (v3) {
    v10 = v8;
  }
  else {
    v10 = v9;
  }
  v11 = [v6 localizedStringForKey:v10 value:&stru_1F0ED27A8 table:0];

  return v11;
}

- (id)suggestionSubtitle
{
  uint64_t v3 = [(SGEventSuggestionBase *)self suggestionsEvent];
  uint64_t v4 = [v3 title];

  int v5 = [(SGEventSuggestionBase *)self eventKitEvent];
  int v6 = v5;
  if (v5)
  {
    timeStringForDate(v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    dateStringForDate(v6);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_1F0ED27A8;
    v7 = &stru_1F0ED27A8;
  }
  v9 = objc_opt_new();
  [v9 appendString:v8];
  if ([(__CFString *)v7 length])
  {
    [v9 appendString:@"\n"];
    [v9 appendString:v7];
  }
  if ([v9 length])
  {
    if (_currentContext || ![v4 length])
    {
      id v10 = v9;
    }
    else
    {
      v11 = [v4 stringByAppendingString:@"\n"];

      id v10 = [v11 stringByAppendingString:v9];
      uint64_t v4 = v11;
    }
  }
  else
  {
    id v10 = v4;
    uint64_t v4 = v10;
  }

  return v10;
}

- (id)suggestionTitle
{
  if (_currentContext)
  {
    uint64_t v3 = [(SGEventSuggestionBase *)self suggestionsEvent];
    uint64_t v4 = [v3 title];
  }
  else
  {
    if ([(SGRealtimeEvent *)self->_realtimeEvent state] == 2)
    {
      int v5 = NSString;
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      uint64_t v3 = v6;
      v7 = @"SuggestionsBannerUpdatedEventTitle";
    }
    else
    {
      int v8 = [(SGRealtimeEvent *)self->_realtimeEvent state];
      int v5 = NSString;
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      uint64_t v3 = v6;
      if (v8 == 3) {
        v7 = @"SuggestionsBannerCanceledEventTitle";
      }
      else {
        v7 = @"SuggestionsBannerFoundEventsTitle";
      }
    }
    v9 = [v6 localizedStringForKey:v7 value:&stru_1F0ED27A8 table:0];
    uint64_t v4 = objc_msgSend(v5, "localizedStringWithFormat:", v9, 1);
  }
  return v4;
}

- (id)eventKitEvent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  eventKitEvent = self->_eventKitEvent;
  if (!eventKitEvent || ![(EKEvent *)eventKitEvent refresh])
  {
    uint64_t v4 = [(id)objc_opt_class() _eventStore];
    switch([(SGRealtimeEvent *)self->_realtimeEvent state])
    {
      case 1u:
        v7 = [(SGRealtimeEvent *)self->_realtimeEvent event];
        int v5 = v7;
        goto LABEL_10;
      case 2u:
        int v8 = [(SGRealtimeEvent *)self->_realtimeEvent eventIdentifier];
        v9 = [v4 eventWithIdentifier:v8];
        id v10 = self->_eventKitEvent;
        self->_eventKitEvent = v9;

        v11 = self->_eventKitEvent;
        v7 = [(SGRealtimeEvent *)self->_realtimeEvent event];
        int v5 = v7;
        if (v11)
        {
          [v7 mergeIntoEKEvent:self->_eventKitEvent withStore:v4];
        }
        else
        {
LABEL_10:
          int v6 = [v7 toEKEventWithStore:v4];
LABEL_11:
          int v15 = self->_eventKitEvent;
          self->_eventKitEvent = v6;
        }
LABEL_12:

LABEL_13:
        break;
      case 3u:
      case 4u:
      case 5u:
        int v5 = [(SGRealtimeEvent *)self->_realtimeEvent eventIdentifier];
        int v6 = [v4 eventWithIdentifier:v5];
        goto LABEL_11;
      case 6u:
        int v5 = sgEventsLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v12 = [(SGRealtimeEvent *)self->_realtimeEvent event];
          v13 = [v12 loggingIdentifier];
          int v14 = [(SGRealtimeEvent *)self->_realtimeEvent state];
          int v18 = 138543618;
          int v19 = v13;
          __int16 v20 = 1026;
          int v21 = v14;
          _os_log_debug_impl(&dword_1B5B6C000, v5, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - [SGEvent %{public}@] in unsupported state %{public}d", (uint8_t *)&v18, 0x12u);
        }
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  int v16 = self->_eventKitEvent;
  return v16;
}

- (void)eventKitStoreChangedNotification:(id)a3
{
  id v4 = [(SGEventSuggestionBase *)self suggestionDelegate];
  [v4 suggestionWasUpdated:self];
}

- (id)suggestionsEvent
{
  return (id)[(SGRealtimeEvent *)self->_realtimeEvent event];
}

- (id)realtimeSuggestion
{
  return self->_realtimeEvent;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SGEventSuggestionBase;
  [(SGEventSuggestionBase *)&v4 dealloc];
}

- (SGEventSuggestionBase)initWithRealtimeEvent:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGEventSuggestionBase;
  int v6 = [(SGEventSuggestionBase *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realtimeEvent, a3);
    int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_eventKitStoreChangedNotification_ name:*MEMORY[0x1E4F25460] object:0];
  }
  [(SGEventSuggestionBase *)v7 preloadPrimaryActionViewController];

  return v7;
}

+ (id)_eventStore
{
  if (_eventStore_predicate != -1) {
    dispatch_once(&_eventStore_predicate, &__block_literal_global_80);
  }
  v2 = (void *)_eventStore_eventStore;
  return v2;
}

uint64_t __36__SGEventSuggestionBase__eventStore__block_invoke()
{
  _eventStore_eventStore = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)confirm:(BOOL)a3 event:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!confirm_event_completion__service)
  {
    uint64_t v9 = [MEMORY[0x1E4F5DB70] serviceForEvents];
    objc_super v10 = (void *)confirm_event_completion__service;
    confirm_event_completion__service = v9;
  }
  v11 = sgEventsLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v12)
    {
      int v19 = [v7 event];
      __int16 v20 = [v19 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_debug_impl(&dword_1B5B6C000, v11, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - Confirming Event %{public}@", buf, 0xCu);
    }
    v13 = (void *)confirm_event_completion__service;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__SGEventSuggestionBase_confirm_event_completion___block_invoke;
    v26[3] = &unk_1E612E590;
    int v14 = &v27;
    int v15 = &v28;
    id v27 = v7;
    id v28 = v8;
    id v16 = v8;
    [v13 confirmEvent:v7 withCompletion:v26];
  }
  else
  {
    if (v12)
    {
      int v21 = [v7 event];
      uint64_t v22 = [v21 loggingIdentifier];
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_debug_impl(&dword_1B5B6C000, v11, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - Rejecting Event %{public}@", buf, 0xCu);
    }
    v17 = (void *)confirm_event_completion__service;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__SGEventSuggestionBase_confirm_event_completion___block_invoke_77;
    v23[3] = &unk_1E612E590;
    int v14 = &v24;
    int v15 = &v25;
    id v24 = v7;
    id v25 = v8;
    id v18 = v8;
    [v17 rejectEvent:v7 withCompletion:v23];
  }
}

void __50__SGEventSuggestionBase_confirm_event_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [*(id *)(a1 + 32) event];
      id v7 = [v6 loggingIdentifier];
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1B5B6C000, v4, OS_LOG_TYPE_ERROR, "SGEventSuggestionBase: Unable to confirm event %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __50__SGEventSuggestionBase_confirm_event_completion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [*(id *)(a1 + 32) event];
      id v7 = [v6 loggingIdentifier];
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1B5B6C000, v4, OS_LOG_TYPE_ERROR, "SGEventSuggestionBase: Unable to reject event %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (id)calendarImage
{
  return +[SGUIIconSupport spotlightIconImageWithBundleIdentifier:*MEMORY[0x1E4F5DC08] drawBorder:1];
}

@end