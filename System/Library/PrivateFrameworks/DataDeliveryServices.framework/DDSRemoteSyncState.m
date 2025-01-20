@interface DDSRemoteSyncState
+ (double)timeIntervalUntilNextRegularUpdate;
- (BOOL)shouldInitiateRegularUpdateCycle;
- (BOOL)shouldRequestCompleteRefresh;
- (DDSBackgroundActivityScheduler)scheduler;
- (DDSRemoteSyncState)init;
- (DDSRemoteSyncState)initWithDelegate:(id)a3 assetType:(id)a4;
- (DDSRemoteSyncStateDelegate)delegate;
- (NSDate)date;
- (NSString)assetType;
- (NSString)buildVersion;
- (NSString)metadataSyncStatePreferenceKey;
- (NSString)scheduleRetryIdentifier;
- (NSString)scheduleUpdateIdentifier;
- (double)nextUpdateTimeIntervalForAttemptCount:(unint64_t)a3;
- (double)timeBetweenSyncs;
- (int64_t)syncStatus;
- (unint64_t)attemptCount;
- (void)beganUpdateCycle;
- (void)completedUpdateCycleWithError:(id)a3;
- (void)loadState;
- (void)loadStateAndScheduleUpdate;
- (void)performScheduledActivityWithIdentifier:(id)a3;
- (void)requestCompleteRefresh;
- (void)requestRetry;
- (void)requestUpdate;
- (void)resetState;
- (void)saveState;
- (void)scheduleRegularUpdate;
- (void)scheduleRetry;
- (void)setAttemptCount:(unint64_t)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSyncStatus:(int64_t)a3;
@end

@implementation DDSRemoteSyncState

- (DDSRemoteSyncState)init
{
  return 0;
}

- (DDSRemoteSyncState)initWithDelegate:(id)a3 assetType:(id)a4
{
  id v6 = a3;
  v7 = (NSString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)DDSRemoteSyncState;
  v8 = [(DDSRemoteSyncState *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_assetType = v7;
    [(DDSRemoteSyncState *)v8 setDelegate:v6];
    v10 = objc_alloc_init(DDSBackgroundActivityScheduler);
    [(DDSRemoteSyncState *)v9 setScheduler:v10];

    v11 = [(DDSRemoteSyncState *)v9 scheduler];
    [v11 setDelegate:v9];

    v12 = [MEMORY[0x1E4F1C9C8] date];
    [(DDSRemoteSyncState *)v9 setDate:v12];

    v13 = [(id)objc_opt_class() buildVersionString];
    [(DDSRemoteSyncState *)v9 setBuildVersion:v13];

    [(DDSRemoteSyncState *)v9 setSyncStatus:0];
  }

  return v9;
}

- (void)loadStateAndScheduleUpdate
{
  [(DDSRemoteSyncState *)self loadState];
  if ([(DDSRemoteSyncState *)self shouldRequestCompleteRefresh]) {
    [(DDSRemoteSyncState *)self requestCompleteRefresh];
  }
  if ([(DDSRemoteSyncState *)self shouldInitiateRegularUpdateCycle]) {
    [(DDSRemoteSyncState *)self requestUpdate];
  }
  [(DDSRemoteSyncState *)self scheduleRegularUpdate];
}

- (NSString)scheduleUpdateIdentifier
{
  v3 = [(DDSRemoteSyncState *)self assetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.LinguisticData"];

  v5 = @"com.apple.DataDeliveryServices.update";
  if ((v4 & 1) == 0)
  {
    id v6 = [NSString alloc];
    v7 = [(DDSRemoteSyncState *)self assetType];
    v5 = (__CFString *)[v6 initWithFormat:@"%@.%@", @"com.apple.DataDeliveryServices.update", v7];
  }
  return (NSString *)v5;
}

- (NSString)scheduleRetryIdentifier
{
  v3 = [(DDSRemoteSyncState *)self assetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.LinguisticData"];

  v5 = @"com.apple.DataDeliveryServices.retry";
  if ((v4 & 1) == 0)
  {
    id v6 = [NSString alloc];
    v7 = [(DDSRemoteSyncState *)self assetType];
    v5 = (__CFString *)[v6 initWithFormat:@"%@.%@", @"com.apple.DataDeliveryServices.retry", v7];
  }
  return (NSString *)v5;
}

- (void)scheduleRegularUpdate
{
  [(DDSRemoteSyncState *)self timeBetweenSyncs];
  double v4 = v3;
  id v6 = [(DDSRemoteSyncState *)self scheduler];
  v5 = [(DDSRemoteSyncState *)self scheduleUpdateIdentifier];
  [v6 scheduleActivityWithIdentifier:v5 interval:v4 tolerance:v4 * 0.5];
}

- (void)scheduleRetry
{
  [(DDSRemoteSyncState *)self nextUpdateTimeIntervalForAttemptCount:[(DDSRemoteSyncState *)self attemptCount]];
  double v4 = v3;
  id v6 = [(DDSRemoteSyncState *)self scheduler];
  v5 = [(DDSRemoteSyncState *)self scheduleRetryIdentifier];
  [v6 scheduleActivityWithIdentifier:v5 interval:v4 tolerance:v4 * 0.5];
}

- (BOOL)shouldRequestCompleteRefresh
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(id)objc_opt_class() buildVersionString];
  double v4 = [(DDSRemoteSyncState *)self buildVersion];
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = UpdateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(DDSRemoteSyncState *)self buildVersion];
      int v10 = 138412546;
      v11 = v3;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Determined new build version: %@, previously on: %@", (uint8_t *)&v10, 0x16u);
    }
    v8 = [(id)objc_opt_class() buildVersionString];
    [(DDSRemoteSyncState *)self setBuildVersion:v8];
  }
  return v5 ^ 1;
}

- (BOOL)shouldInitiateRegularUpdateCycle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(DDSRemoteSyncState *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  id v6 = UpdateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(DDSRemoteSyncState *)self date];
    [v7 timeIntervalSinceNow];
    double v9 = -v8;
    int v10 = [(DDSRemoteSyncState *)self date];
    int v12 = 134218242;
    double v13 = v9;
    __int16 v14 = 2112;
    objc_super v15 = v10;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Time elapsed since last update: %f, date: %@", (uint8_t *)&v12, 0x16u);
  }
  return v5 < -86400.0;
}

- (void)beganUpdateCycle
{
  if ([(DDSRemoteSyncState *)self syncStatus] != 1)
  {
    [(DDSRemoteSyncState *)self setSyncStatus:1];
  }
}

- (void)completedUpdateCycleWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    double v5 = [MEMORY[0x1E4F1C9C8] date];
    [(DDSRemoteSyncState *)self setDate:v5];

    id v6 = self;
    uint64_t v7 = 2;
LABEL_9:
    [(DDSRemoteSyncState *)v6 setSyncStatus:v7];
    [(DDSRemoteSyncState *)self setAttemptCount:0];
    goto LABEL_10;
  }
  if ([(DDSRemoteSyncState *)self attemptCount] > 9)
  {
    double v8 = UpdateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Sync failed, giving up for today", v10, 2u);
    }

    id v6 = self;
    uint64_t v7 = 3;
    goto LABEL_9;
  }
  if ([(DDSRemoteSyncState *)self syncStatus] == 1)
  {
    [(DDSRemoteSyncState *)self setSyncStatus:0];
    [(DDSRemoteSyncState *)self setAttemptCount:[(DDSRemoteSyncState *)self attemptCount] + 1];
    [(DDSRemoteSyncState *)self scheduleRetry];
  }
  else if (![(DDSRemoteSyncState *)self syncStatus])
  {
    double v9 = UpdateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Retry already scheduled", buf, 2u);
    }
  }
LABEL_10:
  [(DDSRemoteSyncState *)self saveState];
}

- (void)requestUpdate
{
  id v4 = [(DDSRemoteSyncState *)self delegate];
  double v3 = [(DDSRemoteSyncState *)self assetType];
  [v4 remoteSyncStateRequestsUpdateForAssetType:v3];
}

- (void)requestRetry
{
  double v3 = UpdateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Requesting retry...", v6, 2u);
  }

  id v4 = [(DDSRemoteSyncState *)self delegate];
  double v5 = [(DDSRemoteSyncState *)self assetType];
  [v4 remoteSyncStateRequestsRetryForAssetType:v5];
}

- (void)requestCompleteRefresh
{
  double v3 = UpdateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Requesting complete refresh...", v6, 2u);
  }

  id v4 = [(DDSRemoteSyncState *)self delegate];
  double v5 = [(DDSRemoteSyncState *)self assetType];
  [v4 remoteSyncStateRequestsResetForAssetType:v5];
}

- (void)performScheduledActivityWithIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = [(DDSRemoteSyncState *)self scheduleUpdateIdentifier];
  int v5 = [v8 isEqualToString:v4];

  if (v5)
  {
    [(DDSRemoteSyncState *)self resetState];
    [(DDSRemoteSyncState *)self requestUpdate];
    [(DDSRemoteSyncState *)self scheduleRegularUpdate];
  }
  else
  {
    id v6 = [(DDSRemoteSyncState *)self scheduleRetryIdentifier];
    int v7 = [v8 isEqualToString:v6];

    if (v7) {
      [(DDSRemoteSyncState *)self requestRetry];
    }
  }
}

- (NSString)metadataSyncStatePreferenceKey
{
  double v3 = [(DDSRemoteSyncState *)self assetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.LinguisticData"];

  int v5 = @"MetadataSyncState";
  if ((v4 & 1) == 0)
  {
    id v6 = [NSString alloc];
    int v7 = [(DDSRemoteSyncState *)self assetType];
    int v5 = (__CFString *)[v6 initWithFormat:@"%@.%@", @"MetadataSyncState", v7];
  }
  return (NSString *)v5;
}

- (void)resetState
{
  [(DDSRemoteSyncState *)self setSyncStatus:0];
  [(DDSRemoteSyncState *)self setAttemptCount:0];
  [(DDSRemoteSyncState *)self saveState];
}

- (void)loadState
{
}

- (void)saveState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v4 = [a1 assetType];
  int v5 = [a1 date];
  id v6 = [a1 buildVersion];
  int v7 = 138544386;
  id v8 = v4;
  __int16 v9 = 2114;
  int v10 = v5;
  __int16 v11 = 2114;
  int v12 = v6;
  __int16 v13 = 2050;
  uint64_t v14 = [a1 attemptCount];
  __int16 v15 = 2050;
  uint64_t v16 = [a1 syncStatus];
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Saving sync state for asset type: %{public}@ (date: %{public}@, buildVersion: %{public}@, attempts: %{public}lu, status: %{public}lu", (uint8_t *)&v7, 0x34u);
}

- (double)nextUpdateTimeIntervalForAttemptCount:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 10800.0;
  }
  else {
    return dbl_1E41FE1E0[a3 - 1];
  }
}

+ (double)timeIntervalUntilNextRegularUpdate
{
  v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  char v4 = [v2 components:30 fromDate:v3];

  int v5 = [v2 dateFromComponents:v4];
  uint32_t v6 = arc4random() % 3;
  uint64_t v7 = arc4random() % 0x3C;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v8 setDay:1];
  [v8 setHour:v6 + 2];
  [v8 setMinute:v7];
  __int16 v9 = [v2 dateByAddingComponents:v8 toDate:v5 options:0];
  int v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:v9];
  double v12 = fabs(v11);

  return v12;
}

- (double)timeBetweenSyncs
{
  int v2 = DDSGetPreferenceIntForKey(@"timerOverrideDuration");
  if (v2 >= 1) {
    return (double)v2;
  }
  char v4 = objc_opt_class();
  [v4 timeIntervalUntilNextRegularUpdate];
  return result;
}

- (DDSRemoteSyncStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSRemoteSyncStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(int64_t)a3
{
  self->_syncStatus = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (DDSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end