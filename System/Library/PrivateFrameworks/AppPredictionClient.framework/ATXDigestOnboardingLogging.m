@interface ATXDigestOnboardingLogging
- (ATXDigestOnboardingLogging)init;
- (ATXDigestOnboardingLogging)initWithDigestOnboardingLoggingBiomeStream:(id)a3 digestOnboardingAppSelectionLoggingBiomeStream:(id)a4;
- (id)onBoardingAppSelectionEventWithApp:(id)a3 rank:(unint64_t)a4 addedToDigest:(BOOL)a5 wasShownInDigest:(BOOL)a6 sessionUUID:(id)a7;
- (void)logDigestOnboardingAppSelectionForShownApps:(id)a3 appsAddedToDigest:(id)a4 rankedApps:(id)a5 sessionUUID:(id)a6;
- (void)logDigestOnboardingWithEntrySource:(int)a3 digestSetupOutcome:(int)a4 finalUIShown:(int)a5 timeTaken:(double)a6 didSelectShowMore:(BOOL)a7 numDaysForAverageNotificationCount:(unint64_t)a8 shownApps:(id)a9 appsAddedToDigest:(id)a10 deliveryTimes:(id)a11;
@end

@implementation ATXDigestOnboardingLogging

- (ATXDigestOnboardingLogging)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXDigestOnboardingLogging *)self initWithDigestOnboardingLoggingBiomeStream:v3 digestOnboardingAppSelectionLoggingBiomeStream:v4];

  return v5;
}

- (ATXDigestOnboardingLogging)initWithDigestOnboardingLoggingBiomeStream:(id)a3 digestOnboardingAppSelectionLoggingBiomeStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDigestOnboardingLogging;
  v9 = [(ATXDigestOnboardingLogging *)&v14 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ATXDigestOnboardingLogging.queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_digestOnboardingLoggingBiomeStream, a3);
    objc_storeStrong((id *)&v9->_digestOnboardingAppSelectionLoggingBiomeStream, a4);
  }

  return v9;
}

- (void)logDigestOnboardingWithEntrySource:(int)a3 digestSetupOutcome:(int)a4 finalUIShown:(int)a5 timeTaken:(double)a6 didSelectShowMore:(BOOL)a7 numDaysForAverageNotificationCount:(unint64_t)a8 shownApps:(id)a9 appsAddedToDigest:(id)a10 deliveryTimes:(id)a11
{
  BOOL v12 = a7;
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  uint64_t v16 = *(void *)&a3;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  v21 = objc_opt_new();
  v22 = [[ATXDigestOnboardingLoggingEvent alloc] initWithSessionUUID:v21 entrySource:v16 digestOnboardingOutcome:v15 finalUIShown:v14 didSelectShowMore:v12 timeTaken:v20 deliveryTimes:a6];

  v23 = [(ATXDigestOnboardingLoggingBiomeStream *)self->_digestOnboardingLoggingBiomeStream source];
  [v23 sendEvent:v22];

  v24 = objc_opt_new();
  v25 = [NSNumber numberWithUnsignedInteger:a8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __202__ATXDigestOnboardingLogging_logDigestOnboardingWithEntrySource_digestSetupOutcome_finalUIShown_timeTaken_didSelectShowMore_numDaysForAverageNotificationCount_shownApps_appsAddedToDigest_deliveryTimes___block_invoke;
  v29[3] = &unk_1E5D07FE8;
  v29[4] = self;
  id v30 = v18;
  id v31 = v19;
  id v32 = v21;
  id v26 = v21;
  id v27 = v19;
  id v28 = v18;
  [v24 appsSortedByNotificationsReceivedInPreviousNumDays:v25 completionHandler:v29];
}

uint64_t __202__ATXDigestOnboardingLogging_logDigestOnboardingWithEntrySource_digestSetupOutcome_finalUIShown_timeTaken_didSelectShowMore_numDaysForAverageNotificationCount_shownApps_appsAddedToDigest_deliveryTimes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logDigestOnboardingAppSelectionForShownApps:*(void *)(a1 + 40) appsAddedToDigest:*(void *)(a1 + 48) rankedApps:a2 sessionUUID:*(void *)(a1 + 56)];
}

- (void)logDigestOnboardingAppSelectionForShownApps:(id)a3 appsAddedToDigest:(id)a4 rankedApps:(id)a5 sessionUUID:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v11 objectAtIndexedSubscript:v13];
      uint64_t v15 = [v14 bundleId];
      uint64_t v16 = [v21 containsObject:v15];

      if (v16)
      {
        v17 = [v14 bundleId];
        uint64_t v18 = [v10 containsObject:v17];
      }
      else
      {
        uint64_t v18 = 0;
      }
      id v19 = [(ATXDigestOnboardingLogging *)self onBoardingAppSelectionEventWithApp:v14 rank:++v13 addedToDigest:v18 wasShownInDigest:v16 sessionUUID:v12];
      id v20 = [(ATXDigestOnboardingAppSelectionLoggingBiomeStream *)self->_digestOnboardingAppSelectionLoggingBiomeStream source];
      [v20 sendEvent:v19];
    }
    while ([v11 count] > v13);
  }
}

- (id)onBoardingAppSelectionEventWithApp:(id)a3 rank:(unint64_t)a4 addedToDigest:(BOOL)a5 wasShownInDigest:(BOOL)a6 sessionUUID:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  unint64_t v13 = [ATXDigestOnboardingAppSelectionLoggingEvent alloc];
  uint64_t v14 = [v12 bundleId];
  uint64_t v15 = [v12 avgNumBasicNotifications];
  uint64_t v16 = [v12 avgNumMessageNotifications];
  uint64_t v17 = [v12 avgNumTimeSensitiveNonMessageNotifications];

  BYTE1(v20) = a6;
  LOBYTE(v20) = a5;
  uint64_t v18 = -[ATXDigestOnboardingAppSelectionLoggingEvent initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:](v13, "initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:", v11, v14, v15, v16, v17, a4, v20);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingAppSelectionLoggingBiomeStream, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLoggingBiomeStream, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end