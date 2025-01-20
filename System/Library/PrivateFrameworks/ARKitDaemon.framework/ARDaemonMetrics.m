@interface ARDaemonMetrics
+ (id)sharedDaemonMetrics;
- (ARDaemonMetrics)init;
- (BOOL)_removeServiceForClient:(id)a3 serviceName:(id)a4;
- (NSDate)lastDonTime;
- (id)_getActiveServiceCountPerClient;
- (id)_getAllServicesUsedPerClient;
- (unint64_t)_getPeakMemoryUsageInMegabytes;
- (void)_addServiceForClient:(id)a3 serviceName:(id)a4;
- (void)_reportCoreAnalyticsDaemonEventWithServiceName:(id)a3 clientBundleIdentifier:(id)a4 isServiceRemoved:(BOOL)a5 isDisconnectingClient:(BOOL)a6;
- (void)_reportDaemonHeartbeatForSessionUUID:(id)a3 daemonUpTimeExcludingSleepMinutes:(unint64_t)a4 daemonUpTimeIncludingSleepMinutes:(unint64_t)a5 systemUpTimeMinutes:(unint64_t)a6 memoryFootprintInBytes:(unint64_t)a7;
- (void)reportMemoryFootprintInBytes:(unint64_t)a3;
- (void)reportServiceAddedWithName:(id)a3 clientBundleIdentifier:(id)a4;
- (void)reportServiceRemovedWithName:(id)a3 clientBundleIdentifier:(id)a4;
- (void)setCurrentMemoryFootprintAsPeak;
- (void)setLastDonTime:(id)a3;
@end

@implementation ARDaemonMetrics

- (ARDaemonMetrics)init
{
  v11.receiver = self;
  v11.super_class = (Class)ARDaemonMetrics;
  v2 = [(ARDaemonMetrics *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_peakMemoryUsageInMegabytes = 0;
    uint64_t v4 = ARCreateNonFixedPriorityDispatchQueue();
    reportingQueue = v3->_reportingQueue;
    v3->_reportingQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    activeServiceCountPerClient = v3->_activeServiceCountPerClient;
    v3->_activeServiceCountPerClient = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    allServicesUsedPerClient = v3->_allServicesUsedPerClient;
    v3->_allServicesUsedPerClient = (NSMutableDictionary *)v8;
  }
  return v3;
}

+ (id)sharedDaemonMetrics
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ARDaemonMetrics_sharedDaemonMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonMetrics_onceToken != -1) {
    dispatch_once(&sharedDaemonMetrics_onceToken, block);
  }
  v2 = (void *)sharedDaemonMetrics_sharedARDaemonMetrics;
  return v2;
}

uint64_t __38__ARDaemonMetrics_sharedDaemonMetrics__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedDaemonMetrics_sharedARDaemonMetrics;
  sharedDaemonMetrics_sharedARDaemonMetrics = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)reportMemoryFootprintInBytes:(unint64_t)a3
{
  reportingQueue = self->_reportingQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__ARDaemonMetrics_reportMemoryFootprintInBytes___block_invoke;
  v4[3] = &unk_265207160;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(reportingQueue, v4);
}

uint64_t __48__ARDaemonMetrics_reportMemoryFootprintInBytes___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = (float)((float)*(unint64_t *)(result + 40) * 0.00097656) * 0.00097656;
  if (*(void *)(v1 + 8) < (unint64_t)v2) {
    *(void *)(v1 + 8) = (unint64_t)v2;
  }
  return result;
}

- (void)setCurrentMemoryFootprintAsPeak
{
  self->_peakMemoryUsageInMegabytes = (unint64_t)(float)((float)((float)0 * 0.00097656) * 0.00097656);
}

- (void)_reportCoreAnalyticsDaemonEventWithServiceName:(id)a3 clientBundleIdentifier:(id)a4 isServiceRemoved:(BOOL)a5 isDisconnectingClient:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v34[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [(NSMutableDictionary *)self->_allServicesUsedPerClient objectForKey:v11];
  v13 = [v12 allObjects];
  v14 = [v13 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  v15 = [v14 componentsJoinedByString:@";"];
  if (v6)
  {
    v33[0] = @"peakMemory";
    v16 = [NSNumber numberWithInteger:self->_peakMemoryUsageInMegabytes];
    v34[0] = v16;
    v33[1] = @"allClientsCount";
    v17 = NSNumber;
    [(NSMutableDictionary *)self->_activeServiceCountPerClient allKeys];
    v30 = v14;
    id v18 = v10;
    v20 = BOOL v19 = v7;
    v21 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v20, "count"));
    v34[1] = v21;
    v34[2] = v11;
    v33[2] = @"disconnectedClientBundleID";
    v33[3] = @"allServicesUsed";
    v34[3] = v15;
    [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    v23 = id v22 = v11;

    BOOL v7 = v19;
    id v10 = v18;
    v14 = v30;

    ARCoreAnalyticsEventCreateAndReport();
    id v11 = v22;
  }
  v31[0] = @"peakMemory";
  v24 = [NSNumber numberWithInteger:self->_peakMemoryUsageInMegabytes];
  v32[0] = v24;
  v31[1] = @"allClientsCount";
  v25 = NSNumber;
  v26 = [(NSMutableDictionary *)self->_activeServiceCountPerClient allKeys];
  v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
  v32[1] = v27;
  v32[2] = v15;
  v31[2] = @"allReportingClientServicesUsed";
  v31[3] = @"reportedServiceName";
  v32[3] = v10;
  v31[4] = @"isServiceRemoved";
  v28 = [NSNumber numberWithBool:v7];
  v32[4] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];

  ARCoreAnalyticsEventCreateAndReport();
}

- (void)reportServiceRemovedWithName:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    reportingQueue = self->_reportingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__ARDaemonMetrics_reportServiceRemovedWithName_clientBundleIdentifier___block_invoke;
    block[3] = &unk_265207188;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(reportingQueue, block);
  }
}

void __71__ARDaemonMetrics_reportServiceRemovedWithName_clientBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _removeServiceForClient:*(void *)(a1 + 40) serviceName:*(void *)(a1 + 48)];
  v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4[1] || ([v4 setCurrentMemoryFootprintAsPeak], *(void *)(*(void *)(a1 + 32) + 8)))
    {
      v5 = _ARLogDaemon_6();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        int v16 = 138543874;
        v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        _os_log_impl(&dword_24719A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Flushing daemon metrics to CA for disconnected client with ID: %@", (uint8_t *)&v16, 0x20u);
      }
      [*(id *)(a1 + 32) reportCoreAnalyticsDaemonEventWithServiceName:*(void *)(a1 + 48) clientBundleIdentifier:*(void *)(a1 + 40) isServiceRemoved:1 isDisconnectingClient:v2];
      *(void *)(*(void *)(a1 + 32) + 8) = 0;
      if (v2)
      {
        [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    id v10 = _ARLogDaemon_6();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138544130;
      v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_24719A000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Service '%@' removed for unknown client with ID: %@", (uint8_t *)&v16, 0x2Au);
    }
  }
}

- (void)reportServiceAddedWithName:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    reportingQueue = self->_reportingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ARDaemonMetrics_reportServiceAddedWithName_clientBundleIdentifier___block_invoke;
    block[3] = &unk_265207188;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(reportingQueue, block);
  }
}

void *__69__ARDaemonMetrics_reportServiceAddedWithName_clientBundleIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addServiceForClient:*(void *)(a1 + 40) serviceName:*(void *)(a1 + 48)];
  result = *(void **)(a1 + 32);
  if (result[1] || ([result setCurrentMemoryFootprintAsPeak], result = *(void **)(a1 + 32), result[1]))
  {
    result = (void *)[result reportCoreAnalyticsDaemonEventWithServiceName:*(void *)(a1 + 48) clientBundleIdentifier:*(void *)(a1 + 40) isServiceRemoved:0 isDisconnectingClient:0];
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
  return result;
}

- (void)_reportDaemonHeartbeatForSessionUUID:(id)a3 daemonUpTimeExcludingSleepMinutes:(unint64_t)a4 daemonUpTimeIncludingSleepMinutes:(unint64_t)a5 systemUpTimeMinutes:(unint64_t)a6 memoryFootprintInBytes:(unint64_t)a7
{
  unint64_t v10 = (unint64_t)(float)((float)((float)a7 * 0.00097656) * 0.00097656);
  id v11 = a3;
  id v17 = (id)objc_opt_new();
  id v12 = [v11 UUIDString];

  [v17 setObject:v12 forKeyedSubscript:@"sessionUUID"];
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
  [v17 setObject:v13 forKeyedSubscript:@"daemonUpTimeExcludingSleepMinutes"];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a5];
  [v17 setObject:v14 forKeyedSubscript:@"daemonUpTimeIncludingSleepMinutes"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a6];
  [v17 setObject:v15 forKeyedSubscript:@"systemUpTimeMinutes"];

  int v16 = [NSNumber numberWithInteger:v10];
  [v17 setObject:v16 forKeyedSubscript:@"currentMemoryFootprint"];

  ARCoreAnalyticsEventCreateAndReport();
}

- (unint64_t)_getPeakMemoryUsageInMegabytes
{
  return self->_peakMemoryUsageInMegabytes;
}

- (id)_getActiveServiceCountPerClient
{
  return self->_activeServiceCountPerClient;
}

- (id)_getAllServicesUsedPerClient
{
  return self->_allServicesUsedPerClient;
}

- (void)_addServiceForClient:(id)a3 serviceName:(id)a4
{
  id v19 = a3;
  activeServiceCountPerClient = self->_activeServiceCountPerClient;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)activeServiceCountPerClient objectForKey:v19];

  if (!v8)
  {
    uint64_t v9 = self->_activeServiceCountPerClient;
    unint64_t v10 = [MEMORY[0x263F087B0] zero];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v19];
  }
  id v11 = self->_activeServiceCountPerClient;
  id v12 = [(NSMutableDictionary *)v11 objectForKey:v19];
  uint64_t v13 = [MEMORY[0x263F087B0] one];
  uint64_t v14 = [v12 decimalNumberByAdding:v13];
  [(NSMutableDictionary *)v11 setObject:v14 forKey:v19];

  uint64_t v15 = [(NSMutableDictionary *)self->_allServicesUsedPerClient objectForKey:v19];

  if (!v15)
  {
    allServicesUsedPerClient = self->_allServicesUsedPerClient;
    id v17 = objc_opt_new();
    [(NSMutableDictionary *)allServicesUsedPerClient setObject:v17 forKey:v19];
  }
  __int16 v18 = [(NSMutableDictionary *)self->_allServicesUsedPerClient objectForKey:v19];
  [v18 addObject:v7];
}

- (BOOL)_removeServiceForClient:(id)a3 serviceName:(id)a4
{
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)self->_activeServiceCountPerClient objectForKey:v5];
  if (v6)
  {
    id v7 = [MEMORY[0x263F087B0] one];
    uint64_t v8 = [v6 decimalNumberBySubtracting:v7];

    [(NSMutableDictionary *)self->_activeServiceCountPerClient setObject:v8 forKey:v5];
    BOOL v9 = (int)[v8 intValue] < 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSDate)lastDonTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastDonTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDonTime, 0);
  objc_storeStrong((id *)&self->_allServicesUsedPerClient, 0);
  objc_storeStrong((id *)&self->_activeServiceCountPerClient, 0);
  objc_storeStrong((id *)&self->_reportingQueue, 0);
}

@end