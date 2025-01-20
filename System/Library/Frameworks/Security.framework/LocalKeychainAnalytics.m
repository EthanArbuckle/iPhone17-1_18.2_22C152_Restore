@interface LocalKeychainAnalytics
+ (id)databasePath;
- (BOOL)canPersistMetrics;
- (LocalKeychainAnalytics)init;
- (void)processPendingMessages;
- (void)reportKeychainBackupEnd:(BOOL)a3 error:(id)a4;
- (void)reportKeychainBackupStartWithType:(int)a3;
- (void)reportKeychainUpgradeFrom:(int)a3 to:(int)a4 outcome:(int)a5 error:(id)a6;
- (void)reportKeychainUpgradeOutcome:(int)a3 attributes:(id)a4;
@end

@implementation LocalKeychainAnalytics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupStartTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_pendingReports, 0);
}

- (void)reportKeychainBackupEnd:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v18[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:self->_backupStartTime];
  uint64_t v9 = 100 * (int)((v8 + 0.05) * 10.0);
  v10 = [NSNumber numberWithInteger:v9];
  [(SFAnalytics *)self logMetric:v10 withName:@"LKAMetricBackupDuration"];

  if (v4)
  {
    [(SFAnalytics *)self setDateProperty:v7 forKey:@"backupLastSuccess"];
    [(SFAnalytics *)self logSuccessForEventNamed:@"LKAEventBackup" timestampBucket:2];
  }
  else
  {
    v11 = [(SFAnalytics *)self datePropertyForKey:@"backupLastSuccess"];
    int64_t v12 = +[SFAnalytics fuzzyDaysSinceDate:v11];

    if ([v6 code] != -25308 || v12)
    {
      v17[0] = @"daysSinceSuccess";
      v13 = [NSNumber numberWithInteger:v12];
      v18[0] = v13;
      v17[1] = @"duration";
      v14 = [NSNumber numberWithInteger:v9];
      v18[1] = v14;
      v17[2] = @"type";
      v15 = [NSNumber numberWithUnsignedInt:self->_backupType];
      v18[2] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
      [(SFAnalytics *)self logResultForEvent:@"LKAEventBackup" hardFailure:1 result:v6 withAttributes:v16 timestampBucket:2];
    }
  }
}

- (void)reportKeychainBackupStartWithType:(int)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] date];
  backupStartTime = self->_backupStartTime;
  self->_backupStartTime = v5;

  self->_backupType = a3;
}

- (void)reportKeychainUpgradeOutcome:(int)a3 attributes:(id)a4
{
  if (a3) {
    [(SFAnalytics *)self logHardFailureForEventNamed:@"LKAEventUpgrade" withAttributes:a4];
  }
  else {
    [(SFAnalytics *)self logSuccessForEventNamed:@"LKAEventUpgrade", a4];
  }
}

- (void)reportKeychainUpgradeFrom:(int)a3 to:(int)a4 outcome:(int)a5 error:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v26[3] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v25[0] = @"oldschema";
  v11 = [NSNumber numberWithInt:v8];
  v26[0] = v11;
  v25[1] = @"newschema";
  int64_t v12 = [NSNumber numberWithInt:v7];
  v26[1] = v12;
  v25[2] = @"upgradeoutcome";
  v13 = [NSNumber numberWithUnsignedInt:v6];
  v26[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v15 = (void *)[v14 mutableCopy];

  if (v10)
  {
    v23[0] = @"errorDomain";
    v16 = [v10 domain];
    v23[1] = @"errorCode";
    v24[0] = v16;
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
    v24[1] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v15 addEntriesFromDictionary:v18];
  }
  if ([(LocalKeychainAnalytics *)self canPersistMetrics])
  {
    [(LocalKeychainAnalytics *)self reportKeychainUpgradeOutcome:v6 attributes:v15];
  }
  else
  {
    queue = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke;
    v20[3] = &unk_1E54756D0;
    v20[4] = self;
    int v22 = v6;
    id v21 = v15;
    dispatch_async(queue, v20);
  }
}

void __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  v2 = [[LKAUpgradeOutcomeReport alloc] initWithOutcome:*(unsigned int *)(a1 + 48) attributes:*(void *)(a1 + 40)];
  [v1 addObject:v2];
}

- (void)processPendingMessages
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__LocalKeychainAnalytics_processPendingMessages__block_invoke;
  block[3] = &unk_1E5484B08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__LocalKeychainAnalytics_processPendingMessages__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = objc_msgSend(v7, "outcome", (void)v11);
        id v10 = [v7 attributes];
        [v8 reportKeychainUpgradeOutcome:v9 attributes:v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (BOOL)canPersistMetrics
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL probablyInClassD = v2->_probablyInClassD;
  objc_sync_exit(v2);

  if (!probablyInClassD) {
    return 1;
  }
  int v8 = -1431655766;
  if (!aks_get_lock_state(0, &v8) && (v8 & 4) != 0)
  {
    uint64_t v5 = v2;
    objc_sync_enter(v5);
    v2->_BOOL probablyInClassD = 0;
    int notificationToken = v5->_notificationToken;
    if (notificationToken != -1) {
      notify_cancel(notificationToken);
    }
    objc_sync_exit(v5);

    [(LocalKeychainAnalytics *)v5 processPendingMessages];
    return 1;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke;
  v7[3] = &unk_1E5484B08;
  v7[4] = v2;
  if (canPersistMetrics_onceToken != -1) {
    dispatch_once(&canPersistMetrics_onceToken, v7);
  }
  return 0;
}

void __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2;
  handler[3] = &unk_1E54756A8;
  handler[4] = v1;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(v1 + 88), v2, handler);
}

uint64_t __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) canPersistMetrics];
}

- (LocalKeychainAnalytics)init
{
  v10.receiver = self;
  v10.super_class = (Class)LocalKeychainAnalytics;
  id v2 = [(SFAnalytics *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_BOOL probablyInClassD = 1;
    uint64_t v4 = objc_opt_new();
    pendingReports = v3->_pendingReports;
    v3->_pendingReports = (NSMutableArray *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("LKADataQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_int notificationToken = -1;
  }
  return v3;
}

+ (id)databasePath
{
  return (id)[a1 defaultAnalyticsDatabasePath:@"localkeychain"];
}

@end