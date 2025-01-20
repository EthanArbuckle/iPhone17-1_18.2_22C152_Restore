@interface SGHarvestQueueMetrics
+ (id)overridePET2InstanceForTesting:(id)a3;
- (SGHarvestQueueMetrics)initWithBundleIdentifier:(id)a3 highPriority:(BOOL)a4 harvestedOnBattery:(BOOL)a5 receivedOnBattery:(BOOL)a6 harvestSource:(int)a7;
- (id)harvestTimerForName:(id)a3;
- (id)harvestTimes;
- (id)initRealtime:(id)a3 wasNoBudgetItem:(BOOL)a4;
- (int)_documentSourceForBundleId:(id)a3;
- (void)endHarvest;
- (void)endTimer:(id)a3 significantWork:(BOOL)a4;
- (void)startHarvest;
- (void)startTimer:(id)a3;
@end

@implementation SGHarvestQueueMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestCostMetrics, 0);
  objc_storeStrong((id *)&self->_guardedData, 0);
}

- (int)_documentSourceForBundleId:(id)a3
{
  id v3 = a3;
  if (_documentSourceForBundleId___pasOnceToken6 != -1) {
    dispatch_once(&_documentSourceForBundleId___pasOnceToken6, &__block_literal_global_104);
  }
  v4 = [(id)_documentSourceForBundleId___pasExprOnceResult objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    int v6 = [v4 intValue];
  }
  else {
    int v6 = [v3 containsString:@"com.apple"] ^ 1;
  }

  return v6;
}

void __52__SGHarvestQueueMetrics__documentSourceForBundleId___block_invoke()
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = *MEMORY[0x1E4F5DC40];
  v6[0] = *MEMORY[0x1E4F5DC28];
  v6[1] = v1;
  v7[0] = &unk_1F2535F70;
  v7[1] = &unk_1F2535F88;
  uint64_t v2 = *MEMORY[0x1E4F5DC60];
  v6[2] = *MEMORY[0x1E4F5DC48];
  v6[3] = v2;
  v7[2] = &unk_1F2535FA0;
  v7[3] = &unk_1F2535FB8;
  uint64_t v3 = *MEMORY[0x1E4F5DC58];
  v6[4] = *MEMORY[0x1E4F5DC38];
  v6[5] = v3;
  v7[4] = &unk_1F2535FD0;
  v7[5] = &unk_1F2535FE8;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  v5 = (void *)_documentSourceForBundleId___pasExprOnceResult;
  _documentSourceForBundleId___pasExprOnceResult = v4;
}

- (void)endHarvest
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79B230](self, a2);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = self;
  uint64_t v3 = [(SGHarvestQueueMetrics *)self harvestTimes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CB79B230]();
        LOBYTE(v7) = [v7 significantWork];
        if (v7)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(SGHarvestQueueMetrics *)v28 endTimer:kHarvestMetricsHarvestTimer significantWork:v4];
  if (petInstanceOverrideForTesting)
  {
    id v9 = (id)petInstanceOverrideForTesting;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F93728] sharedInstance];
  }
  v10 = v9;
  v11 = [(SGHarvestQueueMetrics *)v28 harvestTimerForName:kHarvestMetricsHarvestTimer];
  harvestCostMetrics = v28->_harvestCostMetrics;
  [v11 cpu];
  objc_msgSend(v10, "trackDistributionForMessage:value:", harvestCostMetrics);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(SGHarvestQueueMetrics *)v28 harvestTimes];
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    uint64_t v16 = *MEMORY[0x1E4F5DEF0];
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        v19 = (void *)MEMORY[0x1CB79B230]();
        v20 = objc_opt_new();
        objc_msgSend(v20, "setDocumentSource:", -[SGM2HarvestCost documentSource](v28->_harvestCostMetrics, "documentSource"));
        v21 = [v18 name];
        [v20 setComponentName:v21];

        objc_msgSend(v20, "setSignificantWork:", objc_msgSend(v18, "significantWork"));
        [v18 cpu];
        objc_msgSend(v10, "trackDistributionForMessage:value:", v20);
        v37 = @"harvestCPU";
        v22 = NSNumber;
        [v11 cpu];
        v23 = objc_msgSend(v22, "numberWithDouble:");
        v38 = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];

        v25 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", v16, @"SGHarvestQueueMetricsTimer"];
        AnalyticsSendEvent();
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v14);
  }
}

- (void)startHarvest
{
}

- (void)endTimer:(id)a3 significantWork:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1CB79B230]();
  guardedData = self->_guardedData;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SGHarvestQueueMetrics_endTimer_significantWork___block_invoke;
  v10[3] = &unk_1E65BA788;
  id v9 = v6;
  id v11 = v9;
  BOOL v12 = a4;
  [(_PASLock *)guardedData runWithLockAcquired:v10];
}

void __50__SGHarvestQueueMetrics_endTimer_significantWork___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v4 done:*(unsigned __int8 *)(a1 + 40)];
  if ([*(id *)(a1 + 32) isEqual:kHarvestMetricsMessageHtmlParser])
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:kHarvestMetricsMessageInhumanBody];
    [v5 applyAdjustmentIfSane:v4];

    id v6 = [v3 objectForKeyedSubscript:kHarvestMetricsMessageQuotedRegions];
    [v6 applyAdjustmentIfSane:v4];

    v7 = [v3 objectForKeyedSubscript:kHarvestMetricsMessageDetectedData];
    [v7 applyAdjustmentIfSane:v4];
  }
  if ([*(id *)(a1 + 32) hasPrefix:@"message"])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    v8 = [v3 allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v15 = [v13 name];
          int v16 = [v15 hasSuffix:@"Dissector"];

          if (v16) {
            [v13 applyAdjustmentIfSane:v4];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v3 = v17;
  }
}

- (void)startTimer:(id)a3
{
  id v4 = a3;
  guardedData = self->_guardedData;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SGHarvestQueueMetrics_startTimer___block_invoke;
  v7[3] = &unk_1E65BA760;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)guardedData runWithLockAcquired:v7];
}

void __36__SGHarvestQueueMetrics_startTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SGHarvestQueueMetricsTimer alloc] initWithName:*(void *)(a1 + 32)];
  [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)harvestTimerForName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__26827;
  int v16 = __Block_byref_object_dispose__26828;
  id v17 = 0;
  guardedData = self->_guardedData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SGHarvestQueueMetrics_harvestTimerForName___block_invoke;
  v9[3] = &unk_1E65BB4E8;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)guardedData runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __45__SGHarvestQueueMetrics_harvestTimerForName___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (id)harvestTimes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__26827;
  id v10 = __Block_byref_object_dispose__26828;
  id v11 = 0;
  guardedData = self->_guardedData;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SGHarvestQueueMetrics_harvestTimes__block_invoke;
  v5[3] = &unk_1E65BA738;
  v5[4] = &v6;
  [(_PASLock *)guardedData runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__SGHarvestQueueMetrics_harvestTimes__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 allValues];
  uint64_t v3 = sgFilter();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __37__SGHarvestQueueMetrics_harvestTimes__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

- (id)initRealtime:(id)a3 wasNoBudgetItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = HVIsConnectedToPower() ^ 1;
  if (v4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [(SGHarvestQueueMetrics *)self initWithBundleIdentifier:v6 highPriority:1 harvestedOnBattery:v7 receivedOnBattery:v7 harvestSource:v8];

  return v9;
}

- (SGHarvestQueueMetrics)initWithBundleIdentifier:(id)a3 highPriority:(BOOL)a4 harvestedOnBattery:(BOOL)a5 receivedOnBattery:(BOOL)a6 harvestSource:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGHarvestQueueMetrics;
  uint64_t v13 = [(SGHarvestQueueMetrics *)&v21 init];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    harvestCostMetrics = v13->_harvestCostMetrics;
    v13->_harvestCostMetrics = (SGM2HarvestCost *)v14;

    [(SGM2HarvestCost *)v13->_harvestCostMetrics setDocumentSource:[(SGHarvestQueueMetrics *)v13 _documentSourceForBundleId:v12]];
    [(SGM2HarvestCost *)v13->_harvestCostMetrics setHighPriority:v10];
    [(SGM2HarvestCost *)v13->_harvestCostMetrics setHarvestedOnBattery:v9];
    [(SGM2HarvestCost *)v13->_harvestCostMetrics setReceivedOnBattery:v8];
    [(SGM2HarvestCost *)v13->_harvestCostMetrics setHarvestSource:v7];
    id v16 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v17 = objc_opt_new();
    uint64_t v18 = [v16 initWithGuardedData:v17];
    guardedData = v13->_guardedData;
    v13->_guardedData = (_PASLock *)v18;
  }
  return v13;
}

+ (id)overridePET2InstanceForTesting:(id)a3
{
  id v3 = a3;
  id v4 = (id)petInstanceOverrideForTesting;
  uint64_t v5 = (void *)petInstanceOverrideForTesting;
  petInstanceOverrideForTesting = (uint64_t)v3;
  id v6 = v3;

  return v4;
}

@end