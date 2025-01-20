@interface ATXHomeScreenWidgetFeedbackProcessor
+ (BOOL)_shouldProcessEvent:(id)a3;
+ (id)_retrieveLastHistogramUpdateDate;
+ (void)_retrieveLastHistogramUpdateDate;
+ (void)_storeLastHistogramUpdateDate:(id)a3;
- (ATXHomeScreenWidgetFeedbackProcessor)init;
- (ATXHomeScreenWidgetFeedbackProcessor)initWithWidgetFeedback:(id)a3 publisher:(id)a4;
- (void)_addToHistogramForWidgetsInEvent:(id)a3 type:(unint64_t)a4;
- (void)_updateHistogramForEvent:(id)a3;
- (void)updateHistogramsForRecentHomeScreenEvents;
@end

@implementation ATXHomeScreenWidgetFeedbackProcessor

+ (BOOL)_shouldProcessEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 homeScreenEvent];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 eventTypeString];
      if ([v6 isEqualToString:@"Unknown"])
      {
        unsigned int v7 = 0;
LABEL_13:

LABEL_14:
        if (v7 <= 0xC) {
          unsigned int v8 = (0x100Eu >> v7) & 1;
        }
        else {
          LOBYTE(v8) = 0;
        }
        goto LABEL_17;
      }
      if ([v6 isEqualToString:@"HomeScreenPageShown"])
      {
        unsigned int v7 = 1;
        goto LABEL_13;
      }
      if ([v6 isEqualToString:@"HomeScreenDisappeared"])
      {
        unsigned int v7 = 2;
        goto LABEL_13;
      }
      if ([v6 isEqualToString:@"StackChanged"])
      {
        unsigned int v7 = 3;
        goto LABEL_13;
      }
      if ([v6 isEqualToString:@"WidgetTapped"]) {
        goto LABEL_20;
      }
      if ([v6 isEqualToString:@"WidgetLongLook"])
      {
        unsigned int v7 = 5;
        goto LABEL_13;
      }
      if ([v6 isEqualToString:@"WidgetUserFeedback"])
      {
LABEL_20:
      }
      else
      {
        if ([v6 isEqualToString:@"UserStackConfigChanged"])
        {
          unsigned int v7 = 7;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"DeviceLocked"])
        {
          unsigned int v7 = 8;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"DeviceUnlocked"])
        {
          unsigned int v7 = 9;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"PinnedWidgetAdded"])
        {
          unsigned int v7 = 10;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"PinnedWidgetDeleted"])
        {
          unsigned int v7 = 11;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"SpecialPageAppeared"])
        {
          unsigned int v7 = 12;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"SpecialPageDisappeared"])
        {
          unsigned int v7 = 13;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"StackShown"])
        {
          unsigned int v7 = 14;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"StackDisappeared"])
        {
          unsigned int v7 = 15;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"StackCreated"])
        {
          unsigned int v7 = 16;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"StackDeleted"])
        {
          unsigned int v7 = 17;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"WidgetAddedToStack"])
        {
          unsigned int v7 = 18;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"WidgetRemovedFromStack"])
        {
          unsigned int v7 = 19;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"StackVisibilityChanged"])
        {
          unsigned int v7 = 20;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"AppAdded"])
        {
          unsigned int v7 = 21;
          goto LABEL_13;
        }
        if ([v6 isEqualToString:@"AppRemoved"]) {
          unsigned int v7 = 22;
        }
        else {
          unsigned int v7 = 0;
        }

        if ((v7 & 0xFFFFFFFD) != 4) {
          goto LABEL_14;
        }
      }
      LOBYTE(v8) = 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v8) = 0;
LABEL_18:

  return v8;
}

- (void)_addToHistogramForWidgetsInEvent:(id)a3 type:(unint64_t)a4
{
  id v6 = [a3 metadata];
  unsigned int v7 = [v6 stacks];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke;
  v8[3] = &unk_1E68AD618;
  v8[4] = self;
  v8[5] = a4;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

void __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke_cold_1(v4);
  }

  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  unsigned int v7 = [v4 extensionBundleId];
  [v6 addEventForWidgetBundleId:v7 type:*(void *)(a1 + 40)];
}

- (void)_updateHistogramForEvent:(id)a3
{
  id v46 = a3;
  id v5 = [v46 eventTypeString];
  if ([v5 isEqualToString:@"Unknown"]) {
    goto LABEL_2;
  }
  if ([v5 isEqualToString:@"HomeScreenPageShown"])
  {

    [(ATXHomeScreenWidgetFeedbackProcessor *)self _addToHistogramForWidgetsInEvent:v46 type:2];
    objc_storeStrong((id *)&self->_lastPageAppearEvent, a3);
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"HomeScreenDisappeared"])
  {

    lastPageAppearEvent = self->_lastPageAppearEvent;
    if (lastPageAppearEvent)
    {
      unsigned int v7 = [(ATXHomeScreenEvent *)lastPageAppearEvent metadata];
      unsigned int v8 = [v7 pageIndex];
      v9 = [v46 metadata];
      v10 = [v9 pageIndex];
      int v11 = [v8 isEqual:v10];

      if (v11)
      {
        v12 = [v46 date];
        v13 = [(ATXHomeScreenEvent *)self->_lastPageAppearEvent date];
        [v12 timeIntervalSinceDate:v13];
        double v15 = v14;

        if (v15 > 5.0) {
          [(ATXHomeScreenWidgetFeedbackProcessor *)self _addToHistogramForWidgetsInEvent:v46 type:1];
        }
        v16 = self->_lastPageAppearEvent;
        self->_lastPageAppearEvent = 0;
      }
    }
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"StackChanged"])
  {

    v17 = [v46 reason];
    v18 = NSStringForATXHomeScreenStackChangeReason();
    int v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      widgetFeedback = self->_widgetFeedback;
      v21 = [v46 widgetBundleId];
      v22 = widgetFeedback;
      v23 = v21;
      uint64_t v24 = 3;
    }
    else
    {
      v29 = [v46 reason];
      v30 = NSStringForATXHomeScreenStackChangeReason();
      int v31 = [v29 isEqualToString:v30];

      if (v31)
      {
        v32 = self->_widgetFeedback;
        v21 = [v46 widgetBundleId];
        v22 = v32;
        v23 = v21;
        uint64_t v24 = 4;
      }
      else
      {
        v37 = [v46 reason];
        v38 = NSStringForATXHomeScreenStackChangeReason();
        int v39 = [v37 isEqualToString:v38];

        if (v39)
        {
          v40 = self->_widgetFeedback;
          v21 = [v46 widgetBundleId];
          v22 = v40;
          v23 = v21;
          uint64_t v24 = 5;
        }
        else
        {
          v41 = [v46 reason];
          v42 = NSStringForATXHomeScreenStackChangeReason();
          int v43 = [v41 isEqualToString:v42];

          if (!v43)
          {
LABEL_38:
            v45 = self->_widgetFeedback;
            id v5 = [v46 widgetBundleId];
            v26 = v45;
            id v27 = v5;
            uint64_t v28 = 2;
            goto LABEL_39;
          }
          v44 = self->_widgetFeedback;
          v21 = [v46 widgetBundleId];
          v22 = v44;
          v23 = v21;
          uint64_t v24 = 6;
        }
      }
    }
    [(ATXHomeScreenWidgetFeedback *)v22 addEventForWidgetBundleId:v23 type:v24];

    goto LABEL_38;
  }
  if ([v5 isEqualToString:@"WidgetTapped"])
  {

    v25 = self->_widgetFeedback;
    id v5 = [v46 widgetBundleId];
    v26 = v25;
    id v27 = v5;
    uint64_t v28 = 0;
    goto LABEL_39;
  }
  if ([v5 isEqualToString:@"WidgetLongLook"]) {
    goto LABEL_2;
  }
  if ([v5 isEqualToString:@"WidgetUserFeedback"])
  {

    v33 = [v46 reason];
    v34 = NSStringForATXHomeScreenWidgetExplicitFeedback();
    int v35 = [v33 isEqualToString:v34];

    if (!v35) {
      goto LABEL_6;
    }
    v36 = self->_widgetFeedback;
    id v5 = [v46 widgetBundleId];
    v26 = v36;
    id v27 = v5;
    uint64_t v28 = 7;
LABEL_39:
    [(ATXHomeScreenWidgetFeedback *)v26 addEventForWidgetBundleId:v27 type:v28];
    goto LABEL_3;
  }
  if (([v5 isEqualToString:@"UserStackConfigChanged"] & 1) != 0
    || ([v5 isEqualToString:@"DeviceLocked"] & 1) != 0
    || ([v5 isEqualToString:@"DeviceUnlocked"] & 1) != 0
    || ([v5 isEqualToString:@"PinnedWidgetAdded"] & 1) != 0
    || ([v5 isEqualToString:@"PinnedWidgetDeleted"] & 1) != 0)
  {
LABEL_2:

LABEL_3:
    goto LABEL_6;
  }
  if (([v5 isEqualToString:@"SpecialPageAppeared"] & 1) == 0)
  {
    if (([v5 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0
      && ([v5 isEqualToString:@"StackShown"] & 1) == 0
      && ([v5 isEqualToString:@"StackDisappeared"] & 1) == 0
      && ([v5 isEqualToString:@"StackCreated"] & 1) == 0
      && ([v5 isEqualToString:@"StackDeleted"] & 1) == 0
      && ([v5 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
      && ([v5 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0
      && ([v5 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
      && ([v5 isEqualToString:@"AppAdded"] & 1) == 0)
    {
      [v5 isEqualToString:@"AppRemoved"];
    }
    goto LABEL_2;
  }

  [(ATXHomeScreenWidgetFeedbackProcessor *)self _addToHistogramForWidgetsInEvent:v46 type:2];
LABEL_6:
  MEMORY[0x1F41817F8]();
}

+ (id)_retrieveLastHistogramUpdateDate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v4 = [v3 objectForKey:@"HomeScreenLastEventDateProcessedForHistograms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXHomeScreenWidgetFeedbackProcessor _retrieveLastHistogramUpdateDate](v5);
    }

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];

    id v4 = (void *)v6;
  }

  return v4;
}

+ (void)_storeLastHistogramUpdateDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (id)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v6 setObject:v4 forKey:@"HomeScreenLastEventDateProcessedForHistograms"];
}

- (ATXHomeScreenWidgetFeedbackProcessor)init
{
  id v3 = objc_opt_new();
  id v4 = +[ATXHomeScreenWidgetFeedbackProcessor _retrieveLastHistogramUpdateDate];
  [v4 timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v3, "genericEventPublisherFromStartTime:");

  id v6 = objc_opt_new();
  unsigned int v7 = [(ATXHomeScreenWidgetFeedbackProcessor *)self initWithWidgetFeedback:v6 publisher:v5];

  return v7;
}

- (ATXHomeScreenWidgetFeedbackProcessor)initWithWidgetFeedback:(id)a3 publisher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenWidgetFeedbackProcessor;
  v9 = [(ATXHomeScreenWidgetFeedbackProcessor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_widgetFeedback, a3);
    objc_storeStrong((id *)&v10->_publisher, a4);
  }

  return v10;
}

- (void)updateHistogramsForRecentHomeScreenEvents
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__17;
  v9[4] = __Block_byref_object_dispose__17;
  id v10 = 0;
  objc_initWeak(&location, self);
  id v3 = [(BPSPublisher *)self->_publisher filterWithIsIncluded:&__block_literal_global_36];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2;
  v7[3] = &unk_1E68AC060;
  v7[4] = v9;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_21;
  v5[3] = &unk_1E68AD640;
  objc_copyWeak(&v6, &location);
  v5[4] = v9;
  id v4 = (id)[v3 sinkWithCompletion:v7 receiveInput:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(v9, 8);
}

BOOL __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 eventBody];
  BOOL v3 = +[ATXHomeScreenWidgetFeedbackProcessor _shouldProcessEvent:v2];

  return v3;
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_home_screen();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2_cold_1(v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetFeedbackProcessor: Histograms updated for recent home screen events", v7, 2u);
  }

  +[ATXHomeScreenWidgetFeedbackProcessor _storeLastHistogramUpdateDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [v3 eventBody];
    id v6 = [v5 homeScreenEvent];

    if (v6)
    {
      [WeakRetained _updateHistogramForEvent:v6];
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v8 = [v6 date];
      v9 = v8;
      if (v7)
      {
        id v10 = [v8 laterDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      }
      else
      {
        id v10 = v8;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
      if (v7) {
    }
      }
    else
    {
      int v11 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_21_cold_1(v11);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPageAppearEvent, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_widgetFeedback, 0);
}

void __78__ATXHomeScreenWidgetFeedbackProcessor__addToHistogramForWidgetsInEvent_type___block_invoke_cold_1(void *a1)
{
  v1 = [a1 dictionaryRepresentation];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXHomeScreenWidgetFeedbackProcessor: %@", v4, v5, v6, v7, 2u);
}

+ (void)_retrieveLastHistogramUpdateDate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenWidgetFeedbackProcessor: Failed to retrieve date of last log processed.", v1, 2u);
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXHomeScreenWidgetFeedbackProcessor: Error while updating histograms for recent home screen events: %@", v4, v5, v6, v7, 2u);
}

void __81__ATXHomeScreenWidgetFeedbackProcessor_updateHistogramsForRecentHomeScreenEvents__block_invoke_21_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Can't deserialize ATXHomeScreenEvent instance", v1, 2u);
}

@end