@interface ATXChinSuggestionThrottlingManager
- (ATXChinSuggestionThrottlingManager)init;
- (double)now;
- (double)timestampWallClockTimeCreditsLastReplenished;
- (double)wallClockTimeCredits;
- (void)_acceptOrRejectPendingRequestIfExists;
- (void)_acceptPendingRequest;
- (void)_rejectPendingRequest;
- (void)logAcceptedEventToCoreAnalytics;
- (void)logReceivedEventToCoreAnalytics;
- (void)logRejectedEventToCoreAnalytics;
- (void)logWallClockTimeToCoreAnalytics:(double)a3;
- (void)replenishWallClockTimeCredits;
- (void)scheduleRequest:(id)a3;
- (void)setTimestampWallClockTimeCreditsLastReplenished:(double)a3;
- (void)setWallClockTimeCredits:(double)a3;
@end

@implementation ATXChinSuggestionThrottlingManager

- (ATXChinSuggestionThrottlingManager)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)ATXChinSuggestionThrottlingManager;
  v2 = [(ATXChinSuggestionThrottlingManager *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F4B1D8]);
    [v6 doubleForKey:@"ATXChinSuggestionThrottlingManager.maxWallClockTimeCredits" defaultReturnValue:5.0];
    v2->_double maxWallClockTimeCredits = v7;
    [v6 doubleForKey:@"ATXChinSuggestionThrottlingManager.wallClockTimeCreditsReplenishingRate" defaultReturnValue:0.005];
    v2->_double wallClockTimeCreditsReplenishingRate = v8;
    v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double maxWallClockTimeCredits = v2->_maxWallClockTimeCredits;
      double wallClockTimeCreditsReplenishingRate = v2->_wallClockTimeCreditsReplenishingRate;
      *(_DWORD *)buf = 136315650;
      v21 = "-[ATXChinSuggestionThrottlingManager init]";
      __int16 v22 = 2048;
      double v23 = maxWallClockTimeCredits;
      __int16 v24 = 2048;
      double v25 = wallClockTimeCreditsReplenishingRate;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s: Starting up throttling manager with maxWallClockTimeCredits: %fs wallClockTimeCreditsReplenishingRate: %fs per second", buf, 0x20u);
    }

    v2->_requestProcessingQueueInUse = 0;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("ATXChinSuggestionThrottlingManager.requestManagementQueue", v12);
    requestManagementQueue = v2->_requestManagementQueue;
    v2->_requestManagementQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("ATXChinSuggestionThrottlingManager.requestProcessingQueue", v15);
    requestProcessingQueue = v2->_requestProcessingQueue;
    v2->_requestProcessingQueue = (OS_dispatch_queue *)v16;

    v2->_debuggingRequestSequenceNumber = 0;
  }
  return v2;
}

- (void)scheduleRequest:(id)a3
{
  id v4 = a3;
  requestManagementQueue = self->_requestManagementQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ATXChinSuggestionThrottlingManager_scheduleRequest___block_invoke;
  v7[3] = &unk_1E68AB870;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(requestManagementQueue, v7);
}

uint64_t __54__ATXChinSuggestionThrottlingManager_scheduleRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 40) + 64);
  objc_msgSend(*(id *)(a1 + 32), "setDebugIdentifier:");
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    double v7 = "-[ATXChinSuggestionThrottlingManager scheduleRequest:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Received %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) logReceivedEventToCoreAnalytics];
  id v4 = *(id **)(a1 + 40);
  if (v4[4])
  {
    [v4 _rejectPendingRequest];
    id v4 = *(id **)(a1 + 40);
  }
  objc_storeStrong(v4 + 4, *(id *)(a1 + 32));
  return [*(id *)(a1 + 40) _acceptOrRejectPendingRequestIfExists];
}

- (void)_acceptOrRejectPendingRequestIfExists
{
  requestManagementQueue = self->_requestManagementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ATXChinSuggestionThrottlingManager__acceptOrRejectPendingRequestIfExists__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(requestManagementQueue, block);
}

void __75__ATXChinSuggestionThrottlingManager__acceptOrRejectPendingRequestIfExists__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 32))
  {
    uint64_t v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      id v4 = "%s: No pending request to schedule. Returning.";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      id v4 = "%s: A request is currently processing. Returning";
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  [(id)v2 replenishWallClockTimeCredits];
  [*(id *)(a1 + 32) wallClockTimeCredits];
  if (v5 <= 0.0)
  {
    double v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) wallClockTimeCredits];
      int v9 = 136315394;
      uint64_t v10 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: Not enough wallClockTimeCredits to process the request. Rejecting. wallClockTimeCredits: %fs", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) _rejectPendingRequest];
  }
  else
  {
    int v6 = *(void **)(a1 + 32);
    [v6 _acceptPendingRequest];
  }
}

- (void)_acceptPendingRequest
{
  uint64_t v3 = self->_pendingRequest;
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  self->_requestProcessingQueueInUse = 1;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke;
  v7[3] = &unk_1E68AB870;
  uint64_t v8 = v3;
  int v9 = self;
  int v6 = v3;
  dispatch_async(requestProcessingQueue, v7);
}

void __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[ATXChinSuggestionThrottlingManager _acceptPendingRequest]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%s: Running %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) logAcceptedEventToCoreAnalytics];
  [*(id *)(a1 + 40) now];
  double v5 = v4;
  int v6 = [*(id *)(a1 + 32) acceptedBlock];
  v6[2]();

  [*(id *)(a1 + 40) now];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke_70;
  block[3] = &unk_1E68AE7A8;
  block[4] = v7;
  double v12 = v9 - v5;
  id v11 = *(id *)(a1 + 32);
  dispatch_async(v8, block);
}

uint64_t __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke_70(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 wallClockTimeCredits];
  [v2 setWallClockTimeCredits:v3 - *(double *)(a1 + 48)];
  double v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) wallClockTimeCredits];
    int v9 = 136315906;
    uint64_t v10 = "-[ATXChinSuggestionThrottlingManager _acceptPendingRequest]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: Finished %@ in %fs. Remaining wallClockTimeCredits: %fs", (uint8_t *)&v9, 0x2Au);
  }

  [*(id *)(a1 + 32) logWallClockTimeToCoreAnalytics:*(double *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return [*(id *)(a1 + 32) _acceptOrRejectPendingRequestIfExists];
}

- (void)_rejectPendingRequest
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingRequest = self->_pendingRequest;
    int v7 = 136315394;
    uint64_t v8 = "-[ATXChinSuggestionThrottlingManager _rejectPendingRequest]";
    __int16 v9 = 2112;
    uint64_t v10 = pendingRequest;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@", (uint8_t *)&v7, 0x16u);
  }

  [(ATXChinSuggestionThrottlingManager *)self logRejectedEventToCoreAnalytics];
  uint64_t v5 = [(ATXChinSuggestionRequest *)self->_pendingRequest rejectedBlock];
  v5[2]();

  uint64_t v6 = self->_pendingRequest;
  self->_pendingRequest = 0;
}

- (void)logReceivedEventToCoreAnalytics
{
  v4[1] = *MEMORY[0x1E4F143B8];
  double v3 = @"received";
  v4[0] = &unk_1F27F1E18;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  AnalyticsSendEvent();
}

- (void)logAcceptedEventToCoreAnalytics
{
  v4[1] = *MEMORY[0x1E4F143B8];
  double v3 = @"accepted";
  v4[0] = &unk_1F27F1E18;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  AnalyticsSendEvent();
}

- (void)logRejectedEventToCoreAnalytics
{
  v4[1] = *MEMORY[0x1E4F143B8];
  double v3 = @"rejected";
  v4[0] = &unk_1F27F1E18;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  AnalyticsSendEvent();
}

- (void)logWallClockTimeToCoreAnalytics:(double)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"wallClockTime";
  double v3 = [NSNumber numberWithDouble:a3];
  v6[0] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  AnalyticsSendEvent();
}

- (double)now
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (void)replenishWallClockTimeCredits
{
  double maxWallClockTimeCredits = self->_maxWallClockTimeCredits;
  [(ATXChinSuggestionThrottlingManager *)self wallClockTimeCredits];
  double v5 = v4;
  [(ATXChinSuggestionThrottlingManager *)self now];
  double v7 = v6;
  [(ATXChinSuggestionThrottlingManager *)self timestampWallClockTimeCreditsLastReplenished];
  [(ATXChinSuggestionThrottlingManager *)self setWallClockTimeCredits:fmin(maxWallClockTimeCredits, v5 + (v7 - v8) * self->_wallClockTimeCreditsReplenishingRate)];
  [(ATXChinSuggestionThrottlingManager *)self now];
  -[ATXChinSuggestionThrottlingManager setTimestampWallClockTimeCreditsLastReplenished:](self, "setTimestampWallClockTimeCreditsLastReplenished:");
}

- (double)wallClockTimeCredits
{
  uint64_t v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"ATXChinSuggestionThrottlingManager.wallClockTimeCredits"];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (double)timestampWallClockTimeCreditsLastReplenished
{
  uint64_t v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"ATXChinSuggestionThrottlingManager.timestampWallClockTimeCreditsLastReplenished"];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setWallClockTimeCredits:(double)a3
{
}

- (void)setTimestampWallClockTimeCreditsLastReplenished:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_requestProcessingQueue, 0);
  objc_storeStrong((id *)&self->_requestManagementQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end