@interface ATXNotificationsEventProvider
- (ATXNotificationsEventProvider)initWithLastNDays:(unint64_t)a3;
- (unint64_t)globalCountOfNotificationsClearedWithinLast1Day;
- (unint64_t)globalCountOfNotificationsClearedWithinLastNDays;
- (unint64_t)globalCountOfNotificationsReceivedWithinLast1Day;
- (unint64_t)globalCountOfNotificationsReceivedWithinLastNDays;
- (unint64_t)modeCountOfNotificationsClearedWithinLast1DayForMode:(unint64_t)a3;
- (unint64_t)modeCountOfNotificationsClearedWithinLastNDaysForMode:(unint64_t)a3;
- (unint64_t)modeCountOfNotificationsReceivedWithinLast1DayForMode:(unint64_t)a3;
- (unint64_t)modeCountOfNotificationsReceivedWithinLastNDaysForMode:(unint64_t)a3;
- (void)cacheGlobalNotificationStreamIfNecessary;
- (void)cacheModeNotificationStreamIfNecessary;
@end

@implementation ATXNotificationsEventProvider

- (ATXNotificationsEventProvider)initWithLastNDays:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationsEventProvider;
  v4 = [(ATXNotificationsEventProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a3)];
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;
  }
  return v4;
}

- (void)cacheGlobalNotificationStreamIfNecessary
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationsEventProvider: Could not fetch notification stream with error: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t __73__ATXNotificationsEventProvider_cacheGlobalNotificationStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __73__ATXNotificationsEventProvider_cacheGlobalNotificationStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 eventBody];
  if ([v3 usageType] == 17 || objc_msgSend(v3, "usageType") == 18)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    [v7 timestamp];
    if (v4 <= *(double *)(a1 + 64)) {
      goto LABEL_9;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    goto LABEL_5;
  }
  if ([v3 usageType] == 4)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [v7 timestamp];
    if (v6 > *(double *)(a1 + 64))
    {
      uint64_t v5 = *(void *)(a1 + 56);
LABEL_5:
      ++*(_DWORD *)(*(void *)(v5 + 8) + 24);
    }
  }
LABEL_9:
}

- (void)cacheModeNotificationStreamIfNecessary
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationsEventProvider: Could not fetch inferred mode stream and notification stream with error: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v29 = a2;
  uint64_t v3 = [v29 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = [v29 eventBody];
  double v6 = v5;
  if (isKindOfClass)
  {
    if ([v5 modeType] == 2)
    {
LABEL_3:
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      double v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
      goto LABEL_20;
    }
    [v6 modeType];
    BMUserFocusInferredModeTypeToActivity();
    ATXModeFromActivityType();
    v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v23)
    {
      v24 = ATXModeToString();
      int v25 = [v23 isEqualToString:v24];

      int v26 = [v6 isStart];
      if (v25)
      {
        if (v26) {
          goto LABEL_21;
        }
        goto LABEL_3;
      }
    }
    else
    {
      int v26 = [v6 isStart];
    }
    if (!v26)
    {
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v27 = ATXModeToString();
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    double v8 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    double v6 = [v29 eventBody];
    if ([v6 usageType] == 17 || objc_msgSend(v6, "usageType") == 18)
    {
      v10 = NSNumber;
      uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      [v29 timestamp];
      if (v13 > *(double *)(a1 + 72))
      {
        v14 = NSNumber;
        v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
        [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      }
    }
    if ([v6 usageType] != 4) {
      goto LABEL_21;
    }
    v17 = NSNumber;
    v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "intValue") + 1);
    [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    [v29 timestamp];
    if (v20 <= *(double *)(a1 + 72)) {
      goto LABEL_21;
    }
    v21 = NSNumber;
    double v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    v22 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
    [*(id *)(a1 + 56) setObject:v22 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    goto LABEL_20;
  }
LABEL_22:
}

- (unint64_t)globalCountOfNotificationsReceivedWithinLastNDays
{
  return self->_notificationsReceivedGloballyInLastNDays;
}

- (unint64_t)globalCountOfNotificationsReceivedWithinLast1Day
{
  return self->_notificationsReceivedGloballyInLast1Day;
}

- (unint64_t)globalCountOfNotificationsClearedWithinLastNDays
{
  return self->_notificationsClearedGloballyInLastNDays;
}

- (unint64_t)globalCountOfNotificationsClearedWithinLast1Day
{
  return self->_notificationsClearedGloballyInLast1Day;
}

- (unint64_t)modeCountOfNotificationsReceivedWithinLastNDaysForMode:(unint64_t)a3
{
  [(ATXNotificationsEventProvider *)self cacheModeNotificationStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_notificationsReceivedInModeInLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)modeCountOfNotificationsReceivedWithinLast1DayForMode:(unint64_t)a3
{
  [(ATXNotificationsEventProvider *)self cacheModeNotificationStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_notificationsReceivedInModeInLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)modeCountOfNotificationsClearedWithinLastNDaysForMode:(unint64_t)a3
{
  [(ATXNotificationsEventProvider *)self cacheModeNotificationStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_notificationsClearedInModeInLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)modeCountOfNotificationsClearedWithinLast1DayForMode:(unint64_t)a3
{
  [(ATXNotificationsEventProvider *)self cacheModeNotificationStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_notificationsClearedInModeInLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsClearedInModeInLast1Day, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInModeInLastNDays, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInModeInLast1Day, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInModeInLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end