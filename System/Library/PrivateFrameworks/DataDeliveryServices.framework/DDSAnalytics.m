@interface DDSAnalytics
+ (BOOL)isInteger:(id)a3;
+ (id)assetDownloadDurationBuckets;
+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4;
+ (id)sharedInstance;
- (DDSAnalytics)init;
- (NSMutableDictionary)analyticByIdentifier;
- (OS_dispatch_queue)analyticQueue;
- (id)bucketForValue:(id)a3 fromBuckets:(id)a4;
- (id)processName;
- (id)stringForAction:(int)a3;
- (void)cancelRecordingForAsset:(id)a3;
- (void)dumpAssetLogWithAssertions:(id)a3 installedAssets:(id)a4;
- (void)recordAssetAction:(int)a3 forAsset:(id)a4;
- (void)reportAssetDownloadAnalytic:(id)a3;
- (void)reportUpdateCycleAnalytic:(id)a3;
@end

@implementation DDSAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__DDSAnalytics_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(DDSAnalytics);
  return MEMORY[0x1F41817F8]();
}

- (DDSAnalytics)init
{
  v9.receiver = self;
  v9.super_class = (Class)DDSAnalytics;
  v2 = [(DDSAnalytics *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    analyticByIdentifier = v2->_analyticByIdentifier;
    v2->_analyticByIdentifier = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSAnalytics", v5);
    analyticQueue = v2->_analyticQueue;
    v2->_analyticQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)cancelRecordingForAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v6 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Cancel recording asset analytic for %@", buf, 0xCu);
  }
  v7 = [(DDSAnalytics *)self analyticQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__DDSAnalytics_cancelRecordingForAsset___block_invoke;
  v9[3] = &unk_1E6E39F58;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

void __40__DDSAnalytics_cancelRecordingForAsset___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) analyticByIdentifier];
  v2 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v3 removeObjectForKey:v2];
}

- (void)recordAssetAction:(int)a3 forAsset:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = DefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(DDSAnalytics *)self stringForAction:v4];
    v11 = [v6 uniqueIdentifier];
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_debug_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEBUG, "Record asset action: %{public}@ for %{public}@", buf, 0x16u);
  }
  id v8 = [(DDSAnalytics *)self analyticQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DDSAnalytics_recordAssetAction_forAsset___block_invoke;
  block[3] = &unk_1E6E3A510;
  block[4] = self;
  id v13 = v6;
  int v14 = v4;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __43__DDSAnalytics_recordAssetAction_forAsset___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) analyticByIdentifier];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v6 = [v2 objectForKey:v3];

  if (!v6)
  {
    id v6 = [[DDSAssetDownloadAnalytic alloc] initWithAsset:*(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(a1 + 32) analyticByIdentifier];
    v5 = [*(id *)(a1 + 40) uniqueIdentifier];
    [v4 setObject:v6 forKey:v5];
  }
  [(DDSTimedAnalytic *)v6 updateWithAction:*(unsigned int *)(a1 + 48)];
  if ((*(_DWORD *)(a1 + 48) - 3) <= 1) {
    [*(id *)(a1 + 32) reportAssetDownloadAnalytic:v6];
  }
}

- (void)reportAssetDownloadAnalytic:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  v7 = [(id)objc_opt_class() assetDownloadDurationBuckets];
  id v8 = [(DDSAnalytics *)self bucketForValue:v6 fromBuckets:v7];

  id v9 = objc_opt_class();
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  v11 = [v9 roundNumber:v10 toSignificantDigits:&unk_1F3FB2328];

  [v5 setObject:v11 forKey:@"aggDuration"];
  [v5 setObject:v8 forKey:@"duration"];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "success"));
  [v5 setObject:v12 forKey:@"success"];

  id v13 = NSNumber;
  int v14 = [v4 asset];
  v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "compatibilityVersion"));
  [v5 setObject:v15 forKey:@"compatibilityVersion"];

  v16 = NSNumber;
  __int16 v17 = [v4 asset];
  v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "contentVersion"));
  [v5 setObject:v18 forKey:@"contentVersion"];

  uint64_t v19 = [v4 asset];
  v20 = [v19 uniqueIdentifier];
  [v5 setObject:v20 forKey:@"assetName"];

  v21 = [(DDSAnalytics *)self processName];
  [v5 setObject:v21 forKey:@"process"];

  v22 = DefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[DDSAnalytics reportAssetDownloadAnalytic:]((uint64_t)v5, v22);
  }

  v23 = [@"com.apple.keyboard.dataDeliveryServices." stringByAppendingString:@"assetDownload"];
  v27 = v5;
  id v24 = v5;
  AnalyticsSendEventLazy();

  v25 = [(DDSAnalytics *)self analyticByIdentifier];
  v26 = [v4 identifier];
  [v25 removeObjectForKey:v26];
}

id __44__DDSAnalytics_reportAssetDownloadAnalytic___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportUpdateCycleAnalytic:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "durationInSec"));
  [v5 setObject:v6 forKey:@"duration"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "retries"));
  [v5 setObject:v7 forKey:@"retries"];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "success"));
  [v5 setObject:v8 forKey:@"success"];

  id v9 = [(DDSAnalytics *)self processName];
  [v5 setObject:v9 forKey:@"process"];

  id v10 = DefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DDSAnalytics reportUpdateCycleAnalytic:]((uint64_t)v5, v10);
  }

  v11 = [@"com.apple.keyboard.dataDeliveryServices." stringByAppendingString:@"updateCycle"];
  v15 = v5;
  id v12 = v5;
  AnalyticsSendEventLazy();

  id v13 = [(DDSAnalytics *)self analyticByIdentifier];
  int v14 = [v4 identifier];
  [v13 removeObjectForKey:v14];
}

id __42__DDSAnalytics_reportUpdateCycleAnalytic___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dumpAssetLogWithAssertions:(id)a3 installedAssets:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (DDS_IS_INTERNAL_INSTALL())
  {
    id v8 = NSString;
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    id v10 = DDS_STRING_FROM_DATE(v9);
    v28 = [v8 stringWithFormat:@"/var/tmp/dds_dump_%@.log", v10];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3FA8828];
    [v11 appendString:@"Assertions:\n"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v29 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dumpDescription];
          [v11 appendFormat:@"\n%@\n", v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v14);
    }

    [v11 appendString:@"\nInstalled Assets:\n"];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          id v24 = [v23 debuggingID];
          [v11 appendFormat:@"\n%@ (%lu)", v24, objc_msgSend(v23, "contentVersion")];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v20);
    }

    [v11 appendString:@"\n\nIn Progress:\n"];
    v25 = [(DDSAnalytics *)self analyticByIdentifier];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __59__DDSAnalytics_dumpAssetLogWithAssertions_installedAssets___block_invoke;
    v30[3] = &unk_1E6E3A560;
    v30[4] = self;
    id v26 = v11;
    id v31 = v26;
    [v25 enumerateKeysAndObjectsUsingBlock:v30];

    v27 = DefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v26;
      _os_log_impl(&dword_1E41D6000, v27, OS_LOG_TYPE_DEFAULT, "Dumping: \n%{public}@", buf, 0xCu);
    }

    [v26 writeToFile:v28 atomically:1 encoding:4 error:0];
    id v6 = v29;
  }
}

void __59__DDSAnalytics_dumpAssetLogWithAssertions_installedAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v4 = [v11 identifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v11 asset];
    uint64_t v6 = [v5 debuggingID];

    id v4 = (void *)v6;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v11 startTime];
  id v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  id v9 = DDS_STRING_FROM_DATE(v8);
  id v10 = objc_msgSend(*(id *)(a1 + 32), "stringForAction:", objc_msgSend(v11, "lastAction"));
  [*(id *)(a1 + 40) appendFormat:@"\n%@, (start: %@, state: %@ retries: %lu)", v4, v9, v10, objc_msgSend(v11, "retries")];
}

+ (id)assetDownloadDurationBuckets
{
  if (assetDownloadDurationBuckets_onceToken != -1) {
    dispatch_once(&assetDownloadDurationBuckets_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets;
  return v2;
}

void __44__DDSAnalytics_assetDownloadDurationBuckets__block_invoke()
{
  v0 = (void *)assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets;
  assetDownloadDurationBuckets_sharedAssetDownloadDurationBuckets = (uint64_t)&unk_1F3FB23A0;
}

- (id)bucketForValue:(id)a3 fromBuckets:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  __int16 v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__DDSAnalytics_bucketForValue_fromBuckets___block_invoke;
  v10[3] = &unk_1E6E3A588;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __43__DDSAnalytics_bucketForValue_fromBuckets___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  *a4 = v8 != 1;
}

+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v11 = v5;
    goto LABEL_11;
  }
  char v7 = [(id)objc_opt_class() isInteger:v5];
  [v5 doubleValue];
  if (v8 == 0.0)
  {
    id v9 = NSNumber;
    if (v7)
    {
      uint64_t v10 = 0;
LABEL_8:
      id v11 = [v9 numberWithInt:v10];
      goto LABEL_11;
    }
    double v16 = 0.0;
  }
  else
  {
    double v12 = v8;
    int v13 = [v6 intValue];
    double v14 = log10(fabs(v12));
    double v15 = __exp10((double)(int)(v13 - vcvtpd_s64_f64(v14)));
    double v16 = round(v12 * v15) / v15;
    id v9 = NSNumber;
    if (v7)
    {
      uint64_t v10 = (int)v16;
      goto LABEL_8;
    }
  }
  id v11 = [v9 numberWithDouble:v16];
LABEL_11:
  __int16 v17 = v11;

  return v17;
}

+ (BOOL)isInteger:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (CFTypeID v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("BcsilqCSILQ", *(char *)[v3 objCType], 0xCuLL) != 0;

  return v5;
}

- (id)processName
{
  if (processName_onceToken != -1) {
    dispatch_once(&processName_onceToken, &__block_literal_global_85);
  }
  v2 = (void *)processName_processName;
  return v2;
}

void __27__DDSAnalytics_processName__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v2 processName];
  v1 = (void *)processName_processName;
  processName_processName = v0;
}

- (id)stringForAction:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E6E3A5A8[a3];
  }
}

- (NSMutableDictionary)analyticByIdentifier
{
  return self->_analyticByIdentifier;
}

- (OS_dispatch_queue)analyticQueue
{
  return self->_analyticQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticQueue, 0);
  objc_storeStrong((id *)&self->_analyticByIdentifier, 0);
}

- (void)reportAssetDownloadAnalytic:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Report asset download analytic: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)reportUpdateCycleAnalytic:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Report update catalog analytic: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end