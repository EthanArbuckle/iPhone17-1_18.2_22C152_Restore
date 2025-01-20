@interface CUIKSubscribedCalendarUtilities
+ (BOOL)canHandleURL:(id)a3;
+ (id)checkSubscriptionURL:(id)a3 missingSchemeBlock:(id)a4 unsupportedSchemeBlock:(id)a5;
+ (id)subscriptionURL:(id)a3 usingHTTPS:(BOOL)a4;
+ (id)subscriptionURLForCalendar:(id)a3 inStore:(id)a4;
+ (void)checkURLForSpam:(id)a3 completionHandler:(id)a4 queue:(id)a5;
+ (void)fetchAvailableHolidayCalendarsWithCompletion:(id)a3 queue:(id)a4;
+ (void)reportLocalSubscribedCalendarAsJunkWithoutRemoval:(id)a3;
+ (void)unsubscribeFromCalendar:(id)a3;
+ (void)unsubscribeFromCalendar:(id)a3 reportAsJunk:(BOOL)a4;
@end

@implementation CUIKSubscribedCalendarUtilities

+ (id)checkSubscriptionURL:(id)a3 missingSchemeBlock:(id)a4 unsupportedSchemeBlock:(id)a5
{
  v8 = (void (**)(id, void *))a4;
  v9 = (void (**)(id, void *))a5;
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 scheme];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [v11 scheme];
      if (![v14 length]) {
        goto LABEL_7;
      }
      uint64_t v15 = [v11 host];
      if (!v15) {
        goto LABEL_7;
      }
      v16 = (void *)v15;
      v17 = [v11 host];
      uint64_t v18 = [v17 length];

      if (v18)
      {
        v13 = [v11 CDVRawPath];
        v14 = [v13 CDVStringByAddingPercentEscapesForHREF];
        uint64_t v19 = [v11 CDVURLWithPath:v14];

        v11 = (void *)v19;
LABEL_7:
      }
    }
  }
  uint64_t v20 = [v11 scheme];
  if (!v20
    || (v21 = (void *)v20,
        [v11 scheme],
        v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 isEqualToString:&stru_1F187C430],
        v22,
        v21,
        v23))
  {
    if (v8) {
      v8[2](v8, v11);
    }
LABEL_12:
    id v24 = 0;
    goto LABEL_13;
  }
  if (([a1 canHandleURL:v11] & 1) == 0)
  {
    if (v9) {
      v9[2](v9, v11);
    }
    goto LABEL_12;
  }
  id v24 = v11;
LABEL_13:

  return v24;
}

+ (BOOL)canHandleURL:(id)a3
{
  v3 = [a3 scheme];
  BOOL v4 = 1;
  if ([v3 compare:@"webcal" options:1])
  {
    BOOL v4 = 1;
    if ([v3 compare:@"http" options:1]) {
      BOOL v4 = [v3 compare:@"https" options:1] == 0;
    }
  }

  return v4;
}

+ (id)subscriptionURLForCalendar:(id)a3 inStore:(id)a4
{
  id v5 = a4;
  v6 = [a3 subcalAccountID];
  v7 = [v5 accountWithIdentifier:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F5E7E8] daAccountSubclassWithBackingAccountInfo:v7];
    if ([v8 conformsToProtocol:&unk_1F18CAD60])
    {
      v9 = [v8 subscriptionURL];
    }
    else
    {
      v10 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CUIKSubscribedCalendarUtilities subscriptionURLForCalendar:inStore:]((uint64_t)v8, v7, v10);
      }

      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)subscriptionURL:(id)a3 usingHTTPS:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 scheme];
  v7 = v6;
  if (v4) {
    v8 = @"https";
  }
  else {
    v8 = @"http";
  }
  if ([v6 compare:v8 options:1])
  {
    v9 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    [v9 setScheme:v8];
    id v10 = [v9 URL];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (void)unsubscribeFromCalendar:(id)a3
{
}

+ (void)unsubscribeFromCalendar:(id)a3 reportAsJunk:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 subcalURL];
  v8 = [v6 subcalAccountID];
  id v9 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v10 = [v9 accountWithIdentifier:v8];
  v11 = [MEMORY[0x1E4F25540] sharedInstance];
  [v11 removeInteractionsForCalendar:v6];

  uint64_t v12 = [v6 source];
  uint64_t v13 = [v12 sourceType];

  if (v13 == 2)
  {
    v14 = [v10 parentAccount];
    int v15 = [v14 calIsiCloudCalDAVAccount];

    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  v16 = +[CUIKLogSubsystem defaultCategory];
  v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1BDF08000, v17, OS_LOG_TYPE_DEFAULT, "Deleting account %{public}@ to delete subscribed calendar %@", buf, 0x16u);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke;
    v22[3] = &unk_1E6369680;
    id v23 = v8;
    id v24 = v6;
    [v9 removeAccount:v10 withCompletionHandler:v22];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CUIKSubscribedCalendarUtilities unsubscribeFromCalendar:reportAsJunk:]((uint64_t)v8, (uint64_t)v6, v17);
    }
  }
  int v15 = 0;
  if (v4)
  {
LABEL_12:
    if (v15)
    {
      [v6 setIsSubscribedCalendarJunk:1];
      uint64_t v18 = [v6 eventStore];
      [v18 saveCalendar:v6 commit:1 error:0];
    }
    else
    {
      [a1 reportLocalSubscribedCalendarAsJunkWithoutRemoval:v7];
    }
  }
LABEL_15:
  uint64_t v19 = [v6 eventStore];
  id v21 = 0;
  [v19 removeCalendar:v6 commit:1 error:&v21];
  id v20 = v21;
}

void __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[CUIKLogSubsystem defaultCategory];
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1BDF08000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed account %{public}@ for delete of subscribed calendar %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }
}

+ (void)reportLocalSubscribedCalendarAsJunkWithoutRemoval:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F5E950];
    id v4 = a3;
    id v5 = [v3 sharedConnection];
    [v5 reportSubscriptionCalendarAsJunk:v4];
  }
}

+ (void)fetchAvailableHolidayCalendarsWithCompletion:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__10;
  v15[4] = __Block_byref_object_dispose__10;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke;
  aBlock[3] = &unk_1E636AD78;
  aBlock[4] = v15;
  v7 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2;
  v11[3] = &unk_1E636ADC0;
  uint64_t v13 = v15;
  id v8 = v5;
  id v12 = v8;
  uint64_t v9 = _Block_copy(v11);
  int v10 = [MEMORY[0x1E4F5E950] sharedConnection];
  [v10 fetchAvailableHolidayCalendarsWithResultsBlock:v7 completionBlock:v9 queue:v6];

  _Block_object_dispose(v15, 8);
}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = a1;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v31;
    uint64_t v28 = *MEMORY[0x1E4F1C400];
    uint64_t v29 = *MEMORY[0x1E4F1C438];
    do
    {
      uint64_t v6 = 0;
      uint64_t v27 = v4;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "language", v26);
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          uint64_t v10 = [v7 region];
          if (v10)
          {
            uint64_t v11 = (void *)v10;
            id v12 = [v7 URLString];

            if (!v12) {
              goto LABEL_15;
            }
            v34[0] = v29;
            uint64_t v13 = [v7 language];
            v34[1] = v28;
            v35[0] = v13;
            uint64_t v14 = [v7 region];
            v35[1] = v14;
            uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

            int v15 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v9];
            id v16 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v15];
            if (v16)
            {
              v17 = (void *)MEMORY[0x1E4F1CB10];
              uint64_t v18 = [v7 URLString];
              uint64_t v19 = [v17 URLWithString:v18];

              if (v19)
              {
                id v20 = [CUIKSubscribedHolidayCalendar alloc];
                [v7 language];
                uint64_t v21 = v5;
                id v23 = v22 = v2;
                id v24 = [(CUIKSubscribedHolidayCalendar *)v20 initWithLocale:v16 languageCode:v23 URL:v19];

                id v2 = v22;
                uint64_t v5 = v21;
                uint64_t v4 = v27;
                v25 = [v7 region];
                [(CUIKSubscribedHolidayCalendar *)v24 setCountryCode:v25];

                [*(id *)(*(void *)(*(void *)(v26 + 32) + 8) + 40) addObject:v24];
              }
            }
          }
        }
LABEL_15:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v4);
  }
}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v5 sortUsingComparator:&__block_literal_global_19];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 localizedDescription];
  uint64_t v6 = [v4 localizedDescription];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

+ (void)checkURLForSpam:(id)a3 completionHandler:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F5E950];
    id v10 = a5;
    uint64_t v11 = [v9 sharedConnection];
    id v12 = [v7 absoluteString];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke;
    v21[3] = &unk_1E636ADE8;
    uint64_t v13 = &v23;
    id v23 = v8;
    uint64_t v14 = &v22;
    id v22 = v7;
    id v15 = v8;
    [v11 checkSubscriptionCalendarIsJunk:v12 queue:v10 completionBlock:v21];
  }
  else
  {
    uint64_t v11 = a5;
    id v16 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CUIKSubscribedCalendarUtilities checkURLForSpam:completionHandler:queue:](v16);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_99;
    v18[3] = &unk_1E636A5E8;
    uint64_t v13 = &v20;
    uint64_t v14 = (id *)&v19;
    uint64_t v19 = 0;
    id v20 = v8;
    id v17 = v8;
    dispatch_async(v11, v18);
  }
}

void __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a3 > 0);
}

uint64_t __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)subscriptionURLForCalendar:(NSObject *)a3 inStore:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [a2 identifier];
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1BDF08000, a3, OS_LOG_TYPE_ERROR, "Unexpected DAAccount implementation (%{public}@) for account %{public}@", (uint8_t *)&v8, 0x16u);
}

+ (void)unsubscribeFromCalendar:(os_log_t)log reportAsJunk:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Couldn't find account with ID %{public}@ to remove while deleting subscribed calendar %@", (uint8_t *)&v3, 0x16u);
}

void __72__CUIKSubscribedCalendarUtilities_unsubscribeFromCalendar_reportAsJunk___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Failed to remove account %{public}@ while deleting subscribed calendar %@: %@", (uint8_t *)&v5, 0x20u);
}

void __86__CUIKSubscribedCalendarUtilities_fetchAvailableHolidayCalendarsWithCompletion_queue___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Error when fetching available holiday calendars: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)checkURLForSpam:(os_log_t)log completionHandler:queue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Asked to check a nil URL for spam", v1, 2u);
}

void __75__CUIKSubscribedCalendarUtilities_checkURLForSpam_completionHandler_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Received error when checking URL for junk: %@", (uint8_t *)&v2, 0xCu);
}

@end