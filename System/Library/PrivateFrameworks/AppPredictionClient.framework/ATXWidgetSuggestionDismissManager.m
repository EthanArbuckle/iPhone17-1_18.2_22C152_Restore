@interface ATXWidgetSuggestionDismissManager
+ (id)startDateOfDismissHistoryConsidered;
- (ATXWidgetSuggestionDismissManager)init;
- (ATXWidgetSuggestionDismissManager)initWithStore:(id)a3;
- (BOOL)_shouldBlockSuggestionByRelatedDismissDates:(id)a3;
- (BOOL)shouldBlockSuggestionWithIntent:(id)a3;
- (BOOL)shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:(id)a3 kind:(id)a4 intent:(id)a5;
- (unint64_t)userDismissCountForWidgetSuggestionWithBundleId:(id)a3;
- (void)init;
- (void)userDidDismissSuggestionForWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7;
@end

@implementation ATXWidgetSuggestionDismissManager

- (ATXWidgetSuggestionDismissManager)init
{
  v3 = +[ATXInformationStore sharedInstance];
  if (v3)
  {
    self = [(ATXWidgetSuggestionDismissManager *)self initWithStore:v3];
    v4 = self;
  }
  else
  {
    v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetSuggestionDismissManager init](v5);
    }

    v4 = 0;
  }

  return v4;
}

- (ATXWidgetSuggestionDismissManager)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetSuggestionDismissManager;
  v6 = [(ATXWidgetSuggestionDismissManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void)userDidDismissSuggestionForWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7
{
}

- (BOOL)shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v5 = self;
  v6 = -[ATXInformationStore dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:](self->_store, "dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:", a3, a4, a5);
  LOBYTE(v5) = [(ATXWidgetSuggestionDismissManager *)v5 _shouldBlockSuggestionByRelatedDismissDates:v6];

  return (char)v5;
}

- (BOOL)shouldBlockSuggestionWithIntent:(id)a3
{
  v3 = self;
  v4 = [(ATXInformationStore *)self->_store dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:a3];
  LOBYTE(v3) = [(ATXWidgetSuggestionDismissManager *)v3 _shouldBlockSuggestionByRelatedDismissDates:v4];

  return (char)v3;
}

- (BOOL)_shouldBlockSuggestionByRelatedDismissDates:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 count] <= 2)
    {
      v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
      [(id)objc_opt_class() startDateOfDismissHistoryConsidered];
      v23 = v22 = v4;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        unint64_t v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v7);
            }
            v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "startDate", v22);
            v16 = [v14 endDate];
            [v16 timeIntervalSinceNow];
            if (v17 >= 0.0)
            {
              v18 = [v15 laterDate:v6];

              if (v18 == v15)
              {
                ++v11;
                ++v10;
              }
              else
              {
                v19 = [v15 laterDate:v23];

                if (v19 == v15) {
                  ++v10;
                }
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v9);
      }
      else
      {
        unint64_t v10 = 0;
        uint64_t v11 = 0;
      }

      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v10 > 2;
      }
      BOOL v5 = v20;

      v4 = v22;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)userDismissCountForWidgetSuggestionWithBundleId:(id)a3
{
  id v3 = [(ATXInformationStore *)self->_store dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

+ (id)startDateOfDismissHistoryConsidered
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-5184000.0];
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXWidgetSuggestionDismissManager: couldn't initialize with nil store.", v1, 2u);
}

@end