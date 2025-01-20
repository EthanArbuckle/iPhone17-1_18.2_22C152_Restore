@interface HDHRAFibBurdenNotificationManager
+ (id)_buildNotificationBodyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6;
+ (id)_buildNotificationForAFibBurdenCurrentPercentage:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentage:(id)a5 isPreviousValueClamped:(BOOL)a6 startDate:(id)a7 endDate:(id)a8 currentDate:(id)a9 expirationDate:(id)a10 uuid:(id)a11 calendar:(id)a12;
+ (id)_buildNotificationForLackOfAFibBurdenWithCurrentDate:(id)a3 expirationDate:(id)a4 shouldForwardToWatch:(BOOL)a5 uuid:(id)a6;
+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5;
+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 isUnitTesting:(BOOL)a6;
+ (id)_julianDayFromDate:(id)a3 calendar:(id)a4;
+ (id)_notificationBodyKeyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6;
- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3;
- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 notificationLastSentDateStore:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7 eventSubmissionManager:(id)a8;
- (id)_buildNotificationForMode:(id)a3;
- (id)_buildValueNotificationForMode:(id)a3 currentDate:(id)a4;
- (id)_generateExpirationDateWithCurrentDate:(id)a3;
- (id)_userNotificationCenter;
- (void)_sendNotificationRequest:(id)a3 completion:(id)a4;
- (void)_sendNotificationWithMode:(id)a3 completion:(id)a4;
- (void)sevenDayAnalysisScheduler:(id)a3 didSuccessfullyCompleteAnalysisWithSample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 featureStatus:(id)a6;
@end

@implementation HDHRAFibBurdenNotificationManager

- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F2AC98];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [[HDHRAFibBurdenNotificationModeDeterminer alloc] initWithProfile:v5 calendarCache:v6];
  v8 = objc_msgSend(MEMORY[0x1E4F65B28], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", v5);
  id v9 = objc_alloc(MEMORY[0x1E4F2ABE8]);
  v10 = HKHRAFibBurdenLogForCategory();
  v11 = (void *)[v9 initWithLoggingCategory:v10 healthDataSource:v5];
  v12 = [(HDHRAFibBurdenNotificationManager *)self initWithProfile:v5 modeDeterminer:v7 notificationLastSentDateStore:v8 calendarCache:v6 dateGenerator:&__block_literal_global_3 eventSubmissionManager:v11];

  return v12;
}

uint64_t __53__HDHRAFibBurdenNotificationManager_initWithProfile___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 notificationLastSentDateStore:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7 eventSubmissionManager:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HDHRAFibBurdenNotificationManager;
  v18 = [(HDHRAFibBurdenNotificationManager *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    uint64_t v20 = MEMORY[0x1D943B130](v16);
    id dateGenerator = v19->_dateGenerator;
    v19->_id dateGenerator = (id)v20;

    objc_storeStrong((id *)&v19->_eventSubmissionManager, a8);
    objc_storeStrong((id *)&v19->_modeDeterminer, a4);
    objc_storeStrong((id *)&v19->_notificationLastSentDateStore, a5);
    objc_storeStrong((id *)&v19->_calendarCache, a6);
    v22 = (const char *)HKDispatchQueueName();
    dispatch_queue_t v23 = dispatch_queue_create(v22, 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v23;

    _HKInitializeLogging();
    v25 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      id v27 = v26;
      _os_log_impl(&dword_1D3AC6000, v25, OS_LOG_TYPE_DEFAULT, "[%@] was created", buf, 0xCu);
    }
  }

  return v19;
}

- (void)sevenDayAnalysisScheduler:(id)a3 didSuccessfullyCompleteAnalysisWithSample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 featureStatus:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  modeDeterminer = self->_modeDeterminer;
  id v18 = 0;
  v11 = [(HDHRAFibBurdenNotificationModeDeterminer *)modeDeterminer notificationModeForCurrentValue:a4 featureStatus:v9 onboardedWithinAnalysisInterval:v6 error:&v18];
  id v12 = v18;
  if (v11)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke;
    v15[3] = &unk_1E69B4528;
    v15[4] = self;
    id v16 = v11;
    id v17 = v9;
    dispatch_sync(queue, v15);
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenNotificationManager sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:]();
    }
  }
}

void __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke_2;
  v6[3] = &unk_1E69B4388;
  id v7 = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 _sendNotificationWithMode:v7 completion:v6];
}

void __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke_2(void *a1)
{
  v2 = [HDHRAFibBurdenNotificationAnalyticsEvent alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  BOOL v6 = [(HDHRAFibBurdenNotificationAnalyticsEvent *)v2 initWithNotificationMode:v3 featureStatus:v4 profile:WeakRetained];

  [*(id *)(a1[6] + 48) submitEvent:v6 error:0];
}

- (void)_sendNotificationWithMode:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HDHRAFibBurdenNotificationManager *)self _buildNotificationForMode:a3];
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__HDHRAFibBurdenNotificationManager__sendNotificationWithMode_completion___block_invoke;
    v9[3] = &unk_1E69B4190;
    v9[4] = self;
    id v10 = v6;
    [(HDHRAFibBurdenNotificationManager *)self _sendNotificationRequest:v7 completion:v9];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not generate notification for mode, will not post notification", buf, 0xCu);
    }
  }
}

void __74__HDHRAFibBurdenNotificationManager__sendNotificationWithMode_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    uint64_t v6 = *(void *)(v4 + 16);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v9 = a3;
    id v8 = v7(v6);
    [v5 setNotificationSentDate:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_userNotificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v3 = [WeakRetained notificationManager];

  return v3;
}

- (id)_generateExpirationDateWithCurrentDate:(id)a3
{
  calendarCache = self->_calendarCache;
  id v4 = a3;
  uint64_t v5 = [(HKCalendarCache *)calendarCache currentCalendar];
  uint64_t v6 = objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 1, v4);

  return v6;
}

- (void)_sendNotificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke;
  block[3] = &unk_1E69B4550;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = (id)objc_opt_class();
    id v3 = v9;
    _os_log_impl(&dword_1D3AC6000, v2, OS_LOG_TYPE_DEFAULT, "[%@] About to show AFib Burden Report notification", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) _userNotificationCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_315;
  v6[3] = &unk_1E69B4190;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 postNotificationWithRequest:v5 completion:v6];
}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_315(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    uint64_t v5 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_315_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_buildNotificationForMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (*((void (**)(void))self->_dateGenerator + 2))();
  uint64_t v6 = [v4 type];
  switch(v6)
  {
    case 3:
      id v9 = objc_opt_class();
      uint64_t v10 = [(HDHRAFibBurdenNotificationManager *)self _generateExpirationDateWithCurrentDate:v5];
      uint64_t v11 = [v4 shouldForwardToWatch];
      id v12 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v13 = [v12 UUIDString];
      id v14 = [v9 _buildNotificationForLackOfAFibBurdenWithCurrentDate:v5 expirationDate:v10 shouldForwardToWatch:v11 uuid:v13];

      goto LABEL_12;
    case 2:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = self;
        id v8 = "[%{public}@] Preparing notification with current and previous value";
        goto LABEL_9;
      }
LABEL_10:

      id v14 = [(HDHRAFibBurdenNotificationManager *)self _buildValueNotificationForMode:v4 currentDate:v5];
      goto LABEL_12;
    case 1:
      _HKInitializeLogging();
      id v7 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = self;
        id v8 = "[%{public}@] Preparing notification with current value only";
LABEL_9:
        _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (id)_buildValueNotificationForMode:(id)a3 currentDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 currentPercentage];
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v6 currentValueClamped];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [v6 currentValueDateInterval];
  if (!v12)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v13 = (void *)v12;
  id v14 = [v6 currentValueUUID];

  if (v14)
  {
    id v15 = objc_opt_class();
    v32 = [v6 currentPercentage];
    objc_super v31 = [v6 currentValueClamped];
    unsigned int v28 = [v31 BOOLValue];
    v26 = [v6 previousPercentage];
    id v30 = [v6 previousValueClamped];
    unsigned int v25 = [v30 BOOLValue];
    id v29 = [v6 currentValueDateInterval];
    int v16 = [v29 startDate];
    id v27 = [v6 currentValueDateInterval];
    id v17 = [v27 endDate];
    uint64_t v18 = [(HDHRAFibBurdenNotificationManager *)self _generateExpirationDateWithCurrentDate:v7];
    v19 = [v6 currentValueUUID];
    uint64_t v20 = [v19 UUIDString];
    v21 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
    v22 = [v15 _buildNotificationForAFibBurdenCurrentPercentage:v32 isCurrentValueClamped:v28 previousPercentage:v26 isPreviousValueClamped:v25 startDate:v16 endDate:v17 currentDate:v7 expirationDate:v18 uuid:v20 calendar:v21];

    goto LABEL_11;
  }
LABEL_8:
  _HKInitializeLogging();
  dispatch_queue_t v23 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    -[HDHRAFibBurdenNotificationManager _buildValueNotificationForMode:currentDate:]((uint64_t)self, v23);
  }

  v22 = 0;
LABEL_11:

  return v22;
}

+ (id)_buildNotificationBodyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[HDHRAFibBurdenNotificationManager _notificationBodyKeyForCurrentPercentageString:v10 isCurrentValueClamped:v7 previousPercentageString:v9 isPreviousValueClamped:v6];
  uint64_t v12 = NSString;
  if (v9)
  {
    id v19 = v10;
    id v20 = v9;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = &v19;
    uint64_t v15 = 2;
  }
  else
  {
    id v21 = v10;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = &v21;
    uint64_t v15 = 1;
  }
  int v16 = objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21, v22);
  id v17 = [v12 localizedUserNotificationStringForKey:v11 arguments:v16];

  return v17;
}

+ (id)_notificationBodyKeyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      uint64_t v11 = @"AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_CLAMPED_SECOND_PERCENT";
      uint64_t v12 = @"AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_CLAMPED_SECOND_CLAMPED_SAME";
      BOOL v13 = !v6;
    }
    else
    {
      if (v6)
      {
        id v14 = @"AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_CLAMPED";
        goto LABEL_11;
      }
      int v15 = [v9 isEqualToString:v10];
      uint64_t v11 = @"AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_PERCENT";
      uint64_t v12 = @"AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_PERCENT_SAME";
      BOOL v13 = v15 == 0;
    }
  }
  else
  {
    uint64_t v11 = @"AFIB_BURDEN_SINGLE_WEEK_NOTIFICATION_BODY_PERCENT";
    uint64_t v12 = @"AFIB_BURDEN_SINGLE_WEEK_NOTIFICATION_BODY_CLAMPED";
    BOOL v13 = !v8;
  }
  if (v13) {
    id v14 = v11;
  }
  else {
    id v14 = v12;
  }
LABEL_11:

  return v14;
}

+ (id)_buildNotificationForAFibBurdenCurrentPercentage:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentage:(id)a5 isPreviousValueClamped:(BOOL)a6 startDate:(id)a7 endDate:(id)a8 currentDate:(id)a9 expirationDate:(id)a10 uuid:(id)a11 calendar:(id)a12
{
  BOOL v14 = a6;
  BOOL v41 = a4;
  v49[4] = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v47 = (id)*MEMORY[0x1E4F67E50];
  id v17 = NSString;
  id v42 = a12;
  id v44 = a11;
  id v37 = a10;
  id v18 = a9;
  id v40 = a8;
  id v19 = a7;
  id v20 = a3;
  v46 = [v17 localizedUserNotificationStringForKey:@"AFIB_BURDEN_NOTIFICATION_TITLE" arguments:MEMORY[0x1E4F1CBF0]];
  id v21 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v21 setNumberStyle:1];
  [v21 setMaximumFractionDigits:0];
  uint64_t v22 = [v21 stringFromNumber:v20];

  v45 = v16;
  if (v16)
  {
    dispatch_queue_t v23 = [v21 stringFromNumber:v16];
  }
  else
  {
    dispatch_queue_t v23 = 0;
  }
  uint64_t v24 = +[HDHRAFibBurdenNotificationManager _notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:](HDHRAFibBurdenNotificationManager, "_notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:", v22, v41, v23, v14, v37);
  unsigned int v25 = +[HDHRAFibBurdenNotificationManager _buildNotificationBodyForCurrentPercentageString:v22 isCurrentValueClamped:v41 previousPercentageString:v23 isPreviousValueClamped:v14];
  id v26 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v26 setTitle:v46];
  [v26 setBody:v25];
  [v26 setCategoryIdentifier:v47];
  [v26 setThreadIdentifier:v47];
  v39 = [MEMORY[0x1E4F445C0] soundWithAlertType:25];
  objc_msgSend(v26, "setSound:");
  [v26 setDate:v18];

  [v26 setExpirationDate:v38];
  id v27 = +[HDHRAFibBurdenNotificationManager _generateDateRangeStringForAnalysisSampleWithStartDate:v19 endDate:v40 calendar:v42];

  unsigned int v28 = (void *)MEMORY[0x1E4F1CA60];
  v48[0] = @"currentPercentage";
  v48[1] = @"dateRange";
  v49[0] = v22;
  v49[1] = v27;
  v43 = (void *)v24;
  v49[2] = v24;
  v48[2] = @"watchBodyKey";
  v48[3] = @"firstValueClamped";
  id v29 = [NSNumber numberWithBool:v41];
  v49[3] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];
  objc_super v31 = [v28 dictionaryWithDictionary:v30];

  if (v23) {
    [v31 setObject:v23 forKeyedSubscript:@"previousPercentage"];
  }
  v32 = [MEMORY[0x1E4F2ACB8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v33 = _HKCreateURLForSampleType();
  uint64_t v34 = [v33 absoluteString];
  [v31 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F2BF00]];

  [v31 setObject:&unk_1F2B42148 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  [v26 setUserInfo:v31];
  v35 = [MEMORY[0x1E4F44628] requestWithIdentifier:v44 content:v26 trigger:0];

  return v35;
}

+ (id)_buildNotificationForLackOfAFibBurdenWithCurrentDate:(id)a3 expirationDate:(id)a4 shouldForwardToWatch:(BOOL)a5 uuid:(id)a6
{
  BOOL v6 = a5;
  uint64_t v9 = *MEMORY[0x1E4F67E48];
  id v10 = NSString;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  int v15 = [v10 localizedUserNotificationStringForKey:@"AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_TITLE" arguments:MEMORY[0x1E4F1CBF0]];
  id v16 = [NSString localizedUserNotificationStringForKey:@"AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_BODY" arguments:v14];
  id v17 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v17 setTitle:v15];
  [v17 setBody:v16];
  [v17 setCategoryIdentifier:v9];
  [v17 setThreadIdentifier:v9];
  id v18 = [MEMORY[0x1E4F445C0] soundWithAlertType:25];
  [v17 setSound:v18];
  [v17 setDate:v13];

  [v17 setExpirationDate:v12];
  id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:MEMORY[0x1E4F1CC08]];
  id v20 = [MEMORY[0x1E4F2ACB8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  id v21 = _HKCreateURLForSampleType();
  uint64_t v22 = [v21 absoluteString];
  [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F2BF00]];

  [v19 setObject:&unk_1F2B42148 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  [v19 setObject:@"AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_BODY" forKeyedSubscript:@"watchBodyKey"];
  dispatch_queue_t v23 = [NSNumber numberWithInt:!v6];
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2BEF8]];

  [v17 setUserInfo:v19];
  uint64_t v24 = [MEMORY[0x1E4F44628] requestWithIdentifier:v11 content:v17 trigger:0];

  return v24;
}

+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 isUnitTesting:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F28C20];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  if (v6)
  {
    uint64_t v14 = [v9 locale];
    [v13 setLocale:v14];

    int v15 = [v9 timeZone];
    [v13 setTimeZone:v15];
  }
  [v13 setDateStyle:2];
  [v13 setTimeStyle:0];
  id v16 = [v11 dateByAddingTimeInterval:-1.0];

  id v17 = [v13 stringFromDate:v12 toDate:v16];

  return v17;
}

+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  return +[HDHRAFibBurdenNotificationManager _generateDateRangeStringForAnalysisSampleWithStartDate:a3 endDate:a4 calendar:a5 isUnitTesting:0];
}

+ (id)_julianDayFromDate:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  BOOL v8 = [v5 components:32 fromDate:v6];

  uint64_t v9 = [v8 hour];
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v7, v9, v5);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_notificationLastSentDateStore, 0);
  objc_storeStrong((id *)&self->_modeDeterminer, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong(&self->_dateGenerator, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Not showing notification as we encountered an error when determining mode: %{public}@");
}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_315_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_1D3AC6000, a3, OS_LOG_TYPE_ERROR, "[%@] error requesting notification: %@)", (uint8_t *)&v6, 0x16u);
}

- (void)_buildValueNotificationForMode:(uint64_t)a1 currentDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Current value indicated to be present but not all components of current value present.", (uint8_t *)&v2, 0xCu);
}

@end