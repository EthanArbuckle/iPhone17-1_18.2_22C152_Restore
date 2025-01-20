@interface EKUIAppReviewUtils
+ (BOOL)_shouldDisplayReviewPromptWithCalendarModel:(id)a3;
+ (BOOL)_upcomingEventCountMeetsThresholdInCalendarModel:(id)a3;
+ (id)_queue;
+ (id)_sharedStoreReview;
+ (void)applicationDidForeground;
+ (void)displayReviewPromptIfNeededInScene:(id)a3 calendarModel:(id)a4;
@end

@implementation EKUIAppReviewUtils

void __28__EKUIAppReviewUtils__queue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("EKUIAppReviewUtils", 0);
  v1 = (void *)_queue_queue;
  _queue_queue = (uint64_t)v0;
}

void __40__EKUIAppReviewUtils__sharedStoreReview__block_invoke()
{
  id v4 = [MEMORY[0x1E4F4DE18] bagSubProfile];
  dispatch_queue_t v0 = [MEMORY[0x1E4F4DE18] bagSubProfileVersion];
  v1 = [MEMORY[0x1E4F4DBD8] bagForProfile:v4 profileVersion:v0];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F4DE18]) initWithBag:v1];
  v3 = (void *)_sharedStoreReview_sharedStoreReview;
  _sharedStoreReview_sharedStoreReview = v2;
}

void __46__EKUIAppReviewUtils_applicationDidForeground__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _sharedStoreReview];
  [v1 applicationDidForeground];
}

+ (id)_sharedStoreReview
{
  if (_sharedStoreReview_onceToken != -1) {
    dispatch_once(&_sharedStoreReview_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)_sharedStoreReview_sharedStoreReview;

  return v2;
}

+ (void)applicationDidForeground
{
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    v3 = [a1 _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EKUIAppReviewUtils_applicationDidForeground__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_10);
  }
  uint64_t v2 = (void *)_queue_queue;

  return v2;
}

+ (void)displayReviewPromptIfNeededInScene:(id)a3 calendarModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v8 = _os_feature_enabled_impl();
  if (v7 && (v8 & 1) != 0)
  {
LABEL_6:
    v9 = [a1 _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke;
    block[3] = &unk_1E6089500;
    id v13 = a1;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(v9, block);
  }
LABEL_7:
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke(id *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  v3 = v2;
  if (NavdRecentLocationsEntitlment_block_invoke_previousAttempt
    && ([v2 timeIntervalSinceReferenceDate],
        double v5 = v4,
        [(id)NavdRecentLocationsEntitlment_block_invoke_previousAttempt timeIntervalSinceReferenceDate],
        v5 - v6 < 600.0))
  {
    id v7 = logHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_INFO, "Skipping app store review prompt because it is too soon", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&NavdRecentLocationsEntitlment_block_invoke_previousAttempt, v3);
    char v8 = logHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_INFO, "Asking whether we should attempt an app store review prompt", buf, 2u);
    }

    v9 = [a1[6] _sharedStoreReview];
    v10 = [v9 shouldAttemptReview];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_16;
    v11[3] = &unk_1E60894D8;
    id v14 = a1[6];
    id v12 = a1[4];
    id v13 = a1[5];
    [v10 addFinishBlock:v11];

    id v7 = v12;
  }
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_16(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[6] _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2;
  block[3] = &unk_1E6087810;
  id v11 = v6;
  id v12 = v5;
  id v15 = a1[6];
  id v13 = a1[4];
  id v14 = a1[5];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2(uint64_t a1)
{
  id v1 = (uint64_t *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 40) BOOLValue])
    {
      if ([*(id *)(a1 + 64) _shouldDisplayReviewPromptWithCalendarModel:*(void *)(a1 + 48)])
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_17;
        v7[3] = &unk_1E6087E70;
        double v4 = *(id *)(a1 + 56);
        uint64_t v5 = *(void *)(a1 + 64);
        id v8 = v4;
        uint64_t v9 = v5;
        dispatch_async(MEMORY[0x1E4F14428], v7);
        uint64_t v2 = v8;
        goto LABEL_4;
      }
      uint64_t v2 = logHandle();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
        goto LABEL_4;
      }
      *(_WORD *)buf = 0;
      id v6 = "Not attempting to ask for app store review because our filtering says this is not a good candidate";
    }
    else
    {
      uint64_t v2 = logHandle();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
        goto LABEL_4;
      }
      *(_WORD *)buf = 0;
      id v6 = "Not attempting to ask for app store review because -[AMSSharedStoreReview shouldAttemptReview] said NO";
    }
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_INFO, v6, buf, 2u);
    goto LABEL_4;
  }
  uint64_t v2 = logHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2_cold_1(v1, v2);
  }
LABEL_4:
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = logHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to prompt for an app store review", v4, 2u);
  }

  [MEMORY[0x1E4F3C318] requestReviewInScene:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) _sharedStoreReview];
  [v3 didAttemptPromptReview];
}

+ (BOOL)_shouldDisplayReviewPromptWithCalendarModel:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 _upcomingEventCountMeetsThresholdInCalendarModel:v4] & 1) == 0)
  {
    id v14 = logHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.5();
    }
LABEL_19:
    BOOL v17 = 0;
    goto LABEL_20;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [v4 eventStore];
  id v6 = [v5 sources];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v7)
  {
LABEL_10:

LABEL_17:
    id v14 = logHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:]();
    }
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v30;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v30 != v9) {
      objc_enumerationMutation(v6);
    }
    id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
    id v12 = (void *)MEMORY[0x1E4F57658];
    id v13 = [v11 externalID];
    LOBYTE(v12) = [v12 isiCloudAccount:v13];

    if (v12) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v14 = v11;

  if (!v14) {
    goto LABEL_17;
  }
  id v15 = [v14 allCalendars];
  if ((unint64_t)[v15 count] < 5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = v15;
    uint64_t v19 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      unsigned int v21 = 0;
      uint64_t v22 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v16);
          }
          if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "sharingStatus", (void)v25) == 1) {
            ++v21;
          }
          if (v21 >= 2)
          {
            v24 = logHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:].cold.4();
            }

            goto LABEL_37;
          }
        }
        uint64_t v20 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    v16 = logHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:]();
    }
    BOOL v17 = 0;
  }
  else
  {
    v16 = logHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[EKUIAppReviewUtils _shouldDisplayReviewPromptWithCalendarModel:]();
    }
LABEL_37:
    BOOL v17 = 1;
  }

LABEL_20:
  return v17;
}

+ (BOOL)_upcomingEventCountMeetsThresholdInCalendarModel:(id)a3
{
  id v3 = a3;
  id v4 = CUIKTodayDate();
  uint64_t v5 = CalCopyCalendar();
  id v6 = [v5 dateByAddingUnit:16 value:7 toDate:v4 options:0];

  uint64_t v7 = [v6 dateByAddingTimeInterval:-1.0];

  uint64_t v8 = [v3 sectionForCachedOccurrencesOnDate:v4];
  uint64_t v9 = [v3 sectionForCachedOccurrencesOnDate:v7];
  uint64_t v10 = [v3 dateForCachedOccurrencesInSection:v8];
  id v11 = [v3 dateForCachedOccurrencesInSection:v9];
  unint64_t v12 = v8 + [v10 CalIsBeforeDate:v4];
  unint64_t v13 = v9 - [v11 CalIsAfterDate:v7];
  if (v12 <= v13)
  {
    unint64_t v15 = 0;
    do
    {
      v15 += [v3 numberOfCachedOccurrencesInSection:v12];
      BOOL v14 = v15 > 0xD;
      ++v12;
    }
    while (v15 <= 0xD && v12 <= v13);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __71__EKUIAppReviewUtils_displayReviewPromptIfNeededInScene_calendarModel___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B3F4C000, a2, OS_LOG_TYPE_ERROR, "Error returned from -[AMSSharedStoreReview shouldAttemptReview]: %@", (uint8_t *)&v3, 0xCu);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3F4C000, v0, v1, "This user is not a good candidate for an app store review prompt because they do not have an iCloud Calendar account", v2, v3, v4, v5, v6);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3F4C000, v0, v1, "This user is a good candidate for an app store review prompt because they have enough iCloud calendars", v2, v3, v4, v5, v6);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3F4C000, v0, v1, "This user is a not a good candidate for an app store review prompt. They had enough events, but did not meet other criteria", v2, v3, v4, v5, v6);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3F4C000, v0, v1, "This user is a good candidate for an app store review prompt because they have enough shared iCloud calendars", v2, v3, v4, v5, v6);
}

+ (void)_shouldDisplayReviewPromptWithCalendarModel:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3F4C000, v0, v1, "This user is not a good candidate for an app store review prompt because they do not have enough events", v2, v3, v4, v5, v6);
}

@end