@interface ATAssetLinkPowerLogger
+ (id)sharedInstance;
- (ATAssetLinkPowerLogger)init;
- (NSMutableDictionary)aggregation;
- (OS_dispatch_queue)loggerQueue;
- (OS_dispatch_source)flushTimer;
- (id)_aggregatesForKey:(id)a3 createIfNotExistsWithTimestamp:(id)a4;
- (void)_flushMessagesToPowerlog;
- (void)_incrementCountForAggregates:(id)a3 key:(id)a4;
- (void)_scheduleFlushTimer;
- (void)logAssetLinkOfType:(int64_t)a3 didBeginDownloadingAsset:(id)a4;
- (void)logAssetLinkOfType:(int64_t)a3 didFinishAsset:(id)a4 withError:(id)a5;
- (void)setAggregation:(id)a3;
- (void)setFlushTimer:(id)a3;
- (void)setLoggerQueue:(id)a3;
@end

@implementation ATAssetLinkPowerLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_loggerQueue, 0);

  objc_storeStrong((id *)&self->_aggregation, 0);
}

- (void)setFlushTimer:(id)a3
{
}

- (OS_dispatch_source)flushTimer
{
  return self->_flushTimer;
}

- (void)setLoggerQueue:(id)a3
{
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setAggregation:(id)a3
{
}

- (NSMutableDictionary)aggregation
{
  return self->_aggregation;
}

- (void)_flushMessagesToPowerlog
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ATAssetLinkPowerLogger *)self aggregation];
  v4 = [v3 allValues];

  if ([v4 count])
  {
    v8 = @"messages";
    v9[0] = v4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    PLLogRegisteredEvent();
    v5 = [(ATAssetLinkPowerLogger *)self aggregation];
    [v5 removeAllObjects];
  }
  v6 = [(ATAssetLinkPowerLogger *)self flushTimer];

  if (v6)
  {
    v7 = [(ATAssetLinkPowerLogger *)self flushTimer];
    dispatch_source_cancel(v7);

    [(ATAssetLinkPowerLogger *)self setFlushTimer:0];
  }
}

- (void)_incrementCountForAggregates:(id)a3 key:(id)a4
{
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 objectForKeyedSubscript:v6];
  v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (id)_aggregatesForKey:(id)a3 createIfNotExistsWithTimestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ATAssetLinkPowerLogger *)self aggregation];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:v7 forKeyedSubscript:@"timestamp"];
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "linkType"));
    [v9 setObject:v10 forKeyedSubscript:@"linkType"];

    v11 = [v6 dataclass];
    [v9 setObject:v11 forKeyedSubscript:@"dataclass"];

    v12 = [v6 assetType];
    if (v12) {
      [v6 assetType];
    }
    else {
    v13 = [MEMORY[0x1E4F1CA98] null];
    }
    [v9 setObject:v13 forKeyedSubscript:@"assetType"];

    v14 = [(ATAssetLinkPowerLogger *)self aggregation];
    [v14 setObject:v9 forKeyedSubscript:v6];
  }

  return v9;
}

- (void)_scheduleFlushTimer
{
  v3 = [(ATAssetLinkPowerLogger *)self flushTimer];

  if (!v3)
  {
    v4 = [(ATAssetLinkPowerLogger *)self loggerQueue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [(ATAssetLinkPowerLogger *)self setFlushTimer:v5];

    id v6 = [(ATAssetLinkPowerLogger *)self flushTimer];
    dispatch_time_t v7 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x29E8D60800uLL);

    v8 = [(ATAssetLinkPowerLogger *)self flushTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__ATAssetLinkPowerLogger__scheduleFlushTimer__block_invoke;
    handler[3] = &unk_1E6B8C468;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    id v9 = [(ATAssetLinkPowerLogger *)self flushTimer];
    dispatch_resume(v9);
  }
}

uint64_t __45__ATAssetLinkPowerLogger__scheduleFlushTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushMessagesToPowerlog];
}

- (void)logAssetLinkOfType:(int64_t)a3 didFinishAsset:(id)a4 withError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v8 dataclass];
  v12 = [v8 assetType];
  uint64_t v13 = [v8 totalBytes];
  if (v9) {
    v13 -= [v8 bytesRemaining];
  }
  v14 = [MEMORY[0x1E4FB8618] sharedMonitor];
  char v25 = [v14 isCharging];
  uint64_t v15 = [v14 networkType];
  v16 = @"Unknown";
  v26 = (void *)v10;
  v17 = (void *)v11;
  v18 = self;
  int64_t v19 = a3;
  if (v15 > 99)
  {
    if (v15 > 1000)
    {
      switch(v15)
      {
        case 1001:
          v16 = @"Bridged WiFi";
          break;
        case 2000:
          v16 = @"Wired Ethernet";
          break;
        case 3000:
          v16 = @"Other";
          break;
      }
    }
    else
    {
      switch(v15)
      {
        case 100:
          goto LABEL_5;
        case 500:
          v16 = @"Bluetooth";
          break;
        case 1000:
          v16 = @"WiFi";
          break;
      }
    }
  }
  else if ((unint64_t)(v15 - 1) < 8)
  {
LABEL_5:
    v16 = @"Cellular";
  }
  v20 = [(ATAssetLinkPowerLogger *)v18 loggerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didFinishAsset_withError___block_invoke;
  block[3] = &unk_1E6B8C358;
  id v28 = v17;
  id v29 = v12;
  v30 = v18;
  id v31 = v26;
  int64_t v34 = v19;
  uint64_t v35 = v13;
  char v36 = v25;
  id v32 = v9;
  v33 = v16;
  id v21 = v9;
  id v22 = v26;
  id v23 = v12;
  id v24 = v17;
  dispatch_async(v20, block);
}

void __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didFinishAsset_withError___block_invoke(uint64_t a1)
{
  id v8 = [[ATAssetLinkPowerLoggerAggregationKey alloc] initWithLinkType:*(void *)(a1 + 80) dataclass:*(void *)(a1 + 32) assetType:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(a1 + 48), "_aggregatesForKey:createIfNotExistsWithTimestamp:");
  v3 = NSNumber;
  v4 = [v2 objectForKeyedSubscript:@"sumBytesDownloaded"];
  dispatch_source_t v5 = objc_msgSend(v3, "numberWithUnsignedLongLong:", *(void *)(a1 + 88) + objc_msgSend(v4, "unsignedLongLongValue"));
  [v2 setObject:v5 forKeyedSubscript:@"sumBytesDownloaded"];

  if (*(void *)(a1 + 64)) {
    id v6 = @"countDownloadsFailed";
  }
  else {
    id v6 = @"countDownloadsSucceeded";
  }
  [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:v6];
  if (*(unsigned char *)(a1 + 96)) {
    [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:@"countFinishedOnCharger"];
  }
  dispatch_time_t v7 = [v2 objectForKeyedSubscript:@"countNetworkTypes"];
  if (!v7)
  {
    dispatch_time_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [v2 setObject:v7 forKeyedSubscript:@"countNetworkTypes"];
  }
  [*(id *)(a1 + 48) _incrementCountForAggregates:v7 key:*(void *)(a1 + 72)];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"timestampEnd"];
  [*(id *)(a1 + 48) _scheduleFlushTimer];
}

- (void)logAssetLinkOfType:(int64_t)a3 didBeginDownloadingAsset:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = [v6 date];
  id v9 = [v7 dataclass];
  uint64_t v10 = [v7 assetType];
  uint64_t v11 = [v7 totalBytes];
  char v12 = [v7 canUseCellularData];
  char v13 = [v7 isForeground];
  char v14 = [v7 deviceWasChargingWhenEnqueued];

  uint64_t v15 = [(ATAssetLinkPowerLogger *)self loggerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didBeginDownloadingAsset___block_invoke;
  block[3] = &unk_1E6B8C330;
  id v20 = v9;
  id v21 = v10;
  id v22 = self;
  id v23 = v8;
  int64_t v24 = a3;
  uint64_t v25 = v11;
  char v26 = v12;
  char v27 = v13;
  char v28 = v14;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v15, block);
}

void __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didBeginDownloadingAsset___block_invoke(uint64_t a1)
{
  id v6 = [[ATAssetLinkPowerLoggerAggregationKey alloc] initWithLinkType:*(void *)(a1 + 64) dataclass:*(void *)(a1 + 32) assetType:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(a1 + 48), "_aggregatesForKey:createIfNotExistsWithTimestamp:");
  v3 = NSNumber;
  v4 = [v2 objectForKeyedSubscript:@"sumBytesRequested"];
  dispatch_source_t v5 = objc_msgSend(v3, "numberWithUnsignedLongLong:", *(void *)(a1 + 72) + objc_msgSend(v4, "unsignedLongLongValue"));
  [v2 setObject:v5 forKeyedSubscript:@"sumBytesRequested"];

  [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:@"countDownloadsBegun"];
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:@"countCanUseCellular"];
  }
  if (*(unsigned char *)(a1 + 81)) {
    [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:@"countIsForeground"];
  }
  if (*(unsigned char *)(a1 + 82)) {
    [*(id *)(a1 + 48) _incrementCountForAggregates:v2 key:@"countEnqueuedOnCharger"];
  }
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"timestampEnd"];
  [*(id *)(a1 + 48) _scheduleFlushTimer];
}

- (ATAssetLinkPowerLogger)init
{
  v11.receiver = self;
  v11.super_class = (Class)ATAssetLinkPowerLogger;
  v2 = [(ATAssetLinkPowerLogger *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aggregation = v2->_aggregation;
    v2->_aggregation = v3;

    dispatch_source_t v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    loggerQueue = v2->_loggerQueue;
    v2->_loggerQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATAssetLinkPowerLogger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_1822 != -1) {
    dispatch_once(&sharedInstance_onceToken_1822, block);
  }
  v2 = (void *)sharedInstance_logger;

  return v2;
}

uint64_t __40__ATAssetLinkPowerLogger_sharedInstance__block_invoke()
{
  sharedInstance_logger = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

@end