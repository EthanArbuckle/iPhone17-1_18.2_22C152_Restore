@interface DTGPUService
+ (id)serviceName;
+ (void)registerCapabilities:(id)a3;
- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3 acceleratorID:(unint64_t)a4;
- (DTGPUService)initWithChannel:(id)a3;
- (DTGPUServiceDelegate)delegate;
- (id)_constructMessagePayload:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9;
- (id)_findDataSourcesForTargetProcess:(int)a3;
- (id)currentConsistentGPUPerformanceState;
- (id)dataSourceFromGPUIndex:(unint64_t)a3;
- (id)disableConsistentGPUPerformanceState:(unint64_t)a3;
- (id)flushRemainingData;
- (id)requestDeviceGPUInfo;
- (id)stopCollectingCounters;
- (void)_addGPU:(id)a3;
- (void)_configureDataSourcesAndSendMessage:(id)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6;
- (void)_removeGPU:(unint64_t)a3;
- (void)_resetAllDataSources;
- (void)_sendError:(id)a3;
- (void)_sendErrorMessage:(id)a3 code:(unint64_t)a4;
- (void)_sendMessage:(id)a3;
- (void)_setupDataSources;
- (void)_startHeartbeatTimer;
- (void)_stopHeartbeatTimer;
- (void)_waitForProcessMetalDevice:(int)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6;
- (void)configureAPS:(id)a3;
- (void)configureCounters:(unint64_t)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6 tracingPID:(int)a7;
- (void)enableMultiSourceCounters;
- (void)enableShaderProfiler;
- (void)importAPSData:(id)a3;
- (void)messageReceived:(id)a3;
- (void)readyToSendData:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9;
- (void)setAPSCounterConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startCollectingCounters;
@end

@implementation DTGPUService

+ (id)serviceName
{
  return @"com.apple.instruments.server.services.gpu";
}

+ (void)registerCapabilities:(id)a3
{
  id v6 = a3;
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu" withVersion:1 forClass:a1];
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu.immediate" withVersion:1 forClass:a1];
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu.deferred" withVersion:1 forClass:a1];
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu.counters" withVersion:4 forClass:a1];
  id v4 = MTLCreateSystemDefaultDevice();
  int v5 = [v4 supportsFamily:1004];

  if (v5)
  {
    [v6 publishCapability:@"com.apple.instruments.server.services.gpu.shaderprofiler" withVersion:1 forClass:a1];
    [v6 publishCapability:@"com.apple.instruments.server.services.gpu.performancestate" withVersion:2 forClass:a1];
  }
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu.counters.multisources" withVersion:1 forClass:a1];
  [v6 publishCapability:@"com.apple.instruments.server.services.gpu.counters.aps" withVersion:1 forClass:a1];
}

- (DTGPUService)initWithChannel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DTGPUService;
  v3 = [(DTXService *)&v9 initWithChannel:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dt.instruments.gpu", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    collectingDataSources = v3->_collectingDataSources;
    v3->_collectingDataSources = (NSMutableDictionary *)v6;

    v3->_enableShaderProfiler = 0;
  }
  return v3;
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    [(DTGPUService *)self _resetAllDataSources];
    [(DTGPUService *)self _stopHeartbeatTimer];
  }
}

- (void)_resetAllDataSources
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(DTGPUService *)self stopCollectingCounters];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  dispatch_queue_t v4 = [(NSMutableDictionary *)self->_collectingDataSources allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v8++) reset];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_super v9 = (NSMutableDictionary *)objc_opt_new();
  collectingDataSources = self->_collectingDataSources;
  self->_collectingDataSources = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  dataSourceDict = self->_dataSourceDict;
  self->_dataSourceDict = v11;

  self->_enableShaderProfiler = 0;
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 removeObserver:self];
}

- (void)_setupDataSources
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = (NSMutableDictionary *)objc_opt_new();
  dataSourceDict = self->_dataSourceDict;
  self->_dataSourceDict = v3;

  if (self->_importAPSDataPath)
  {
    obj = [[DTGPUDataSource alloc] initWithImportAPSDataPath:self->_importAPSDataPath workQueue:self->_workQueue];
    [(DTGPUDataSource *)obj setDelegate:self];
    [(NSMutableDictionary *)self->_dataSourceDict setObject:obj forKeyedSubscript:&unk_26E5340A0];
    importAPSDataPath = self->_importAPSDataPath;
    self->_importAPSDataPath = 0;
  }
  else
  {
    id v6 = MTLCreateSystemDefaultDevice();
    v23[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obja = v7;
    uint64_t v8 = [obja countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obja);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [[DTGPUDataSource alloc] initWithMTLDevice:v12 workQueue:self->_workQueue];
          [(DTGPUDataSource *)v13 setDelegate:self];
          long long v14 = self->_dataSourceDict;
          long long v15 = [NSNumber numberWithUnsignedLongLong:[v12 registryID]];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v9 = [obja countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)_sendMessage:(id)a3
{
  id v9 = a3;
  dispatch_queue_t v4 = [MEMORY[0x263F38CA0] messageWithObject:];
  uint64_t v5 = [(DTXService *)self channel];
  [v5 sendMessage:v4 replyHandler:0];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 receiveMessage:v9];
  }
}

- (void)_sendError:(id)a3
{
  id v9 = a3;
  dispatch_queue_t v4 = [MEMORY[0x263F38CA0] messageWithError:];
  uint64_t v5 = [(DTXService *)self channel];
  [v5 sendMessage:v4 replyHandler:0];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 receiveError:v9];
  }
}

- (void)_addGPU:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_dataSourceDict count])
  {
    uint64_t v5 = [[DTGPUDataSource alloc] initWithMTLDevice:v4 workQueue:self->_workQueue];
    [(DTGPUDataSource *)v5 setDelegate:self];
    dataSourceDict = self->_dataSourceDict;
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:[v4 registryID]];
    [(NSMutableDictionary *)dataSourceDict setObject:v5 forKeyedSubscript:v7];

    id v8 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v11[1] = v8;
    id v9 = [(DTGPUDataSource *)v5 deviceInfoDict];
    v11[2] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

    [(DTGPUService *)self _sendMessage:v10];
  }
}

- (void)_removeGPU:(unint64_t)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:];
  id v6 = [(NSMutableDictionary *)self->_collectingDataSources objectForKeyedSubscript:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 stop];
    [v7 reset];
    [(NSMutableDictionary *)self->_collectingDataSources removeObjectForKey:v5];
  }
  id v8 = [(NSMutableDictionary *)self->_dataSourceDict objectForKeyedSubscript:v5];

  if (v8)
  {
    [(NSMutableDictionary *)self->_dataSourceDict removeObjectForKey:v5];
    id v9 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v12[1] = v9;
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a3];
    v12[2] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

    [(DTGPUService *)self _sendMessage:v11];
  }
}

- (id)requestDeviceGPUInfo
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(DTGPUService *)self _setupDataSources];
  [(DTGPUService *)self _startHeartbeatTimer];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) deviceInfoDict];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)dataSourceFromGPUIndex:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3 > 5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v11 = [v10 device];
          uint64_t v12 = [v11 registryID];

          if (v12 == a3)
          {
            id v13 = v10;
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  if ([(NSMutableDictionary *)self->_dataSourceDict count] == 1)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
    id v13 = [v5 objectAtIndexedSubscript:0];
LABEL_15:
    long long v14 = v13;
  }
  else
  {
    long long v14 = 0;
  }
  return v14;
}

- (void)configureCounters:(unint64_t)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6 tracingPID:(int)a7
{
  unint64_t v7 = a6;
  unint64_t v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  collectingDataSources = self->_collectingDataSources;
  if (collectingDataSources)
  {
    if ([(NSMutableDictionary *)collectingDataSources count])
    {
      id v13 = @"Already collecting counters";
      long long v14 = self;
      uint64_t v15 = 4;
LABEL_20:
      [(DTGPUService *)v14 _sendErrorMessage:v13 code:v15];
      return;
    }
  }
  else
  {
    long long v16 = (NSMutableDictionary *)objc_opt_new();
    long long v17 = self->_collectingDataSources;
    self->_collectingDataSources = v16;
  }
  if (a3 > 4)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v21 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      unsigned int v37 = v9;
      unint64_t v38 = v8;
      unint64_t v39 = v7;
      uint64_t v24 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v27 = [v26 device];
          uint64_t v28 = [v27 registryID];

          if (v28 == a3)
          {
            long long v20 = [MEMORY[0x263EFFA08] setWithObject:v26];
            goto LABEL_18;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      long long v20 = 0;
LABEL_18:
      unint64_t v8 = v38;
      unint64_t v7 = v39;
      uint64_t v9 = v37;
    }
    else
    {
      long long v20 = 0;
    }

    if (![v20 count] && -[NSMutableDictionary count](self->_dataSourceDict, "count") == 1)
    {
      v29 = (void *)MEMORY[0x263EFFA08];
      v30 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
      [v30 objectAtIndexedSubscript:0];
      v32 = uint64_t v31 = v9;
      uint64_t v33 = [v29 setWithObject:v32];

      uint64_t v9 = v31;
      long long v20 = (void *)v33;
    }
  }
  else
  {
    uint64_t v18 = [(DTGPUService *)self dataSourceFromGPUIndex:a3];
    if (!v18)
    {
      id v13 = @"Failed to find target GPU for counter collection";
      long long v14 = self;
      uint64_t v15 = 0;
      goto LABEL_20;
    }
    long long v19 = (void *)v18;
    long long v20 = [MEMORY[0x263EFFA08] setWithObject:v18];
  }
  if (self->_importAPSDataPath)
  {
    v34 = (void *)MEMORY[0x263EFFA08];
    v35 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
    uint64_t v36 = [v34 setWithArray:v35];

    long long v20 = (void *)v36;
  }
  [(DTGPUService *)self _configureDataSourcesAndSendMessage:v20 counterProfile:v9 interval:v8 windowLimit:v7];
}

- (void)startCollectingCounters
{
  v2 = self;
  uint64_t v69 = *MEMORY[0x263EF8340];
  collectingDataSources = self->_collectingDataSources;
  if (collectingDataSources && [(NSMutableDictionary *)collectingDataSources count])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v4 = [(NSMutableDictionary *)v2->_collectingDataSources allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      LOBYTE(v7) = 0;
      uint64_t v8 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v61 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          [v10 enableShaderProfiler:v2->_enableShaderProfiler];
          if (v7) {
            int v7 = 1;
          }
          else {
            int v7 = [v10 run] ^ 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v6);

      if (v7)
      {
        [(DTGPUService *)v2 _sendErrorMessage:@"Failed to start counter collection" code:5];
        return;
      }
    }
    else
    {
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = [(NSMutableDictionary *)v2->_collectingDataSources allValues];
    uint64_t v55 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v55)
    {
      uint64_t v11 = *(void *)v57;
      v54 = v2;
      uint64_t v48 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          long long v14 = [v13 collectingProfile];
          int v15 = [v14 isAPS];

          if (v15)
          {
            v66[0] = &unk_26E5340E8;
            long long v16 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
            v66[1] = v16;
            long long v17 = NSNumber;
            uint64_t v18 = [v13 device];
            long long v19 = [v17 numberWithUnsignedLongLong:[v18 registryID]];
            v66[2] = v19;
            long long v20 = NSNumber;
            uint64_t v21 = [v13 collectingProfile];
            uint64_t v22 = [v20 numberWithUnsignedInteger:[v21 profile]];
            v66[3] = v22;
            uint64_t v23 = [v13 collectingProfile];
            uint64_t v24 = [v23 counterProfileForHost];
            v66[4] = v24;
            v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:5];

            v2 = v54;
            [(DTGPUService *)v54 _sendMessage:v25];
          }
          else
          {
            if (v2->_enableMultiSourceCounters)
            {
              v65[0] = &unk_26E534100;
              v52 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
              v65[1] = v52;
              v26 = NSNumber;
              v51 = [v13 device];
              v50 = [v26 numberWithUnsignedLongLong:objc_msgSend(v51, "registryID")];
              v65[2] = v50;
              v27 = NSNumber;
              uint64_t v28 = [v13 collectingProfile];
              v29 = [v27 numberWithUnsignedInteger:[v28 profile]];
              v65[3] = v29;
              v30 = [v13 collectingProfile];
              uint64_t v31 = [v30 counterProfileForHost];
              v65[4] = v31;
              v32 = [v13 collectingProfile];
              uint64_t v33 = [v32 sampleSizes];
              v65[5] = v33;
              v34 = [v13 collectingProfile];
              v35 = [v34 ringBufferCounts];
              v65[6] = v35;
              v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:7];

              v2 = v54;
              [(DTGPUService *)v54 _sendMessage:v25];
            }
            else
            {
              uint64_t v36 = [v13 collectingProfile];
              v25 = [v36 counterProfileForHost];

              unsigned int v37 = [v13 collectingProfile];
              unint64_t v38 = [v37 ringBufferCounts];

              if ([v25 count])
              {
                if ([v38 count])
                {
                  v64[0] = &unk_26E534118;
                  v53 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
                  v64[1] = v53;
                  unint64_t v39 = NSNumber;
                  long long v40 = [v13 device];
                  long long v41 = [v39 numberWithUnsignedLongLong:[v40 registryID]];
                  v64[2] = v41;
                  long long v42 = NSNumber;
                  long long v43 = [v13 collectingProfile];
                  v44 = [v42 numberWithUnsignedInteger:[v43 profile]];
                  v64[3] = v44;
                  uint64_t v45 = [v25 objectAtIndexedSubscript:0];
                  v64[4] = v45;
                  v46 = [v38 objectAtIndexedSubscript:0];
                  v64[5] = v46;
                  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:6];

                  v2 = v54;
                  [(DTGPUService *)v54 _sendMessage:v47];
                }
              }
            }
            uint64_t v11 = v48;
          }
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v55);
    }
  }
  else
  {
    [(DTGPUService *)v2 _sendErrorMessage:@"No configured data sources" code:2];
  }
}

- (void)enableShaderProfiler
{
  self->_enableShaderProfiler = 1;
}

- (id)stopCollectingCounters
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [(NSMutableDictionary *)self->_collectingDataSources allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) stop];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_collectingDataSources allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    unint64_t v12 = -1;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * j) timestampOfFirstSample];
        if (v12 >= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v12;
        }
        if (v14) {
          unint64_t v12 = v15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v12 = -1;
  }

  self->_enableShaderProfiler = 0;
  long long v16 = [NSNumber numberWithUnsignedLongLong:v12];
  return v16;
}

- (id)_constructMessagePayload:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  v33[7] = *MEMORY[0x263EF8340];
  id v14 = a6;
  unint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a5];
  if (a7 == 1)
  {
    v32[0] = &unk_26E534148;
    long long v16 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v32[1] = v16;
    v26 = NSNumber;
    long long v18 = [v14 device];
    long long v19 = [v26 numberWithUnsignedLongLong:[v18 registryID]];
    v32[2] = v19;
    v32[3] = &unk_26E5340A0;
    long long v20 = [NSNumber numberWithUnsignedLongLong:a4];
    v32[4] = v20;
    v32[5] = v15;
    long long v21 = [NSNumber numberWithUnsignedInt:v9];
    v32[6] = v21;
    long long v22 = [NSNumber numberWithUnsignedInt:a9];
    v32[7] = v22;
    long long v23 = (void *)MEMORY[0x263EFF8C0];
    long long v24 = v32;
    uint64_t v25 = 8;
    goto LABEL_5;
  }
  if (!a7)
  {
    v33[0] = &unk_26E534130;
    long long v16 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v33[1] = v16;
    long long v17 = NSNumber;
    long long v18 = [v14 device];
    long long v19 = [v17 numberWithUnsignedLongLong:[v18 registryID]];
    v33[2] = v19;
    long long v20 = [NSNumber numberWithUnsignedLongLong:a4];
    v33[3] = v20;
    v33[4] = v15;
    long long v21 = [NSNumber numberWithUnsignedInt:v9];
    v33[5] = v21;
    long long v22 = [NSNumber numberWithUnsignedInt:a9];
    v33[6] = v22;
    long long v23 = (void *)MEMORY[0x263EFF8C0];
    long long v24 = v33;
    uint64_t v25 = 7;
LABEL_5:
    v27 = [v23 arrayWithObjects:v24 count:v25];
LABEL_6:

    goto LABEL_7;
  }
  if ((a7 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v31[0] = &unk_26E534160;
    long long v16 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v31[1] = v16;
    v29 = NSNumber;
    long long v18 = [v14 device];
    long long v19 = [v29 numberWithUnsignedLongLong:[v18 registryID]];
    v31[2] = v19;
    long long v20 = [NSNumber numberWithUnsignedInteger:a7];
    v31[3] = v20;
    long long v21 = [NSNumber numberWithUnsignedLongLong:a5];
    v31[4] = v21;
    v31[5] = v15;
    long long v22 = [NSNumber numberWithUnsignedInt:v9];
    v31[6] = v22;
    v30 = [NSNumber numberWithUnsignedInt:a9];
    v31[7] = v30;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:8];

    goto LABEL_6;
  }
  v27 = 0;
LABEL_7:

  return v27;
}

- (id)flushRemainingData
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_collectingDataSources allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = sub_2308F5FF8;
        v13[3] = &unk_264B8FE98;
        v13[4] = self;
        v13[5] = v9;
        id v14 = v3;
        [v9 getRemainingData:v13];
        [v9 reset];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  collectingDataSources = self->_collectingDataSources;
  self->_collectingDataSources = v10;

  return v3;
}

- (void)readyToSendData:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9
{
  LODWORD(v11) = a9;
  uint64_t v10 = [(DTGPUService *)self _constructMessagePayload:a3 sampleCount:a4 length:a5 dataSource:a6 sampleType:a7 ringBufferIndex:*(void *)&a8 sourceIndex:v11];
  if (v10)
  {
    unint64_t v12 = v10;
    [(DTGPUService *)self _sendMessage:v10];
    uint64_t v10 = v12;
  }
}

- (id)_findDataSourcesForTargetProcess:(int)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSString stringWithFormat:@"pid %d", *(void *)&a3];
  id v20 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_dataSourceDict allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      uint64_t v18 = v6;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        io_iterator_t iterator = 0;
        uint64_t v11 = [v10 device];
        if (!MEMORY[0x230FC0C90]([v11 acceleratorPort], "IOService", &iterator))
        {
          io_object_t v12 = IOIteratorNext(iterator);
          if (v12)
          {
            io_registry_entry_t v13 = v12;
            do
            {
              io_object_t v14 = IOIteratorNext(iterator);
              CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, @"IOUserClientCreator", v8, 0);
              IOObjectRelease(v13);
              if ([CFProperty rangeOfString:v4] != 0x7FFFFFFFFFFFFFFFLL)
              {
                IOObjectRelease(iterator);
                [v20 addObject:v10];
              }

              io_registry_entry_t v13 = v14;
            }
            while (v14);
          }
          IOObjectRelease(iterator);
          uint64_t v7 = v17;
          uint64_t v6 = v18;
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v20;
}

- (void)_configureDataSourcesAndSendMessage:(id)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    obuint64_t j = v9;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          io_object_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v15 = [v14 configure:v6 interval:a5 windowLimit:a6];
          if (v15)
          {
            collectingDataSources = self->_collectingDataSources;
            uint64_t v17 = NSNumber;
            uint64_t v18 = [v14 device];
            long long v19 = [v17 numberWithUnsignedLongLong:[v18 registryID]];
            [(NSMutableDictionary *)collectingDataSources setObject:v14 forKeyedSubscript:v19];
          }
        }
        uint64_t v9 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }
    if ([(NSMutableDictionary *)self->_collectingDataSources count])
    {
      v31[0] = &unk_26E534178;
      id v20 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      v31[1] = v20;
      long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];

      [(DTGPUService *)self _sendMessage:v21];
      uint64_t v9 = obj;
    }
    else
    {
      [(DTGPUService *)self _sendErrorMessage:@"Selected counter profile is not supported on target device" code:1];
      heartbeatTimer = self->_heartbeatTimer;
      if (heartbeatTimer)
      {
        dispatch_source_cancel(heartbeatTimer);
        long long v23 = self->_heartbeatTimer;
        self->_heartbeatTimer = 0;
      }
    }
  }
  else
  {
    [(DTGPUService *)self _sendErrorMessage:@"Invalid device ID" code:0];
    if (self->_heartbeatTimer) {
      [(DTGPUService *)self _stopHeartbeatTimer];
    }
  }
}

- (void)_waitForProcessMetalDevice:(int)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308F6644;
  block[3] = &unk_264B8FEC0;
  objc_copyWeak(v13, &location);
  int v14 = a3;
  unsigned int v15 = a4;
  v13[1] = (id)a5;
  v13[2] = (id)a6;
  dispatch_async(workQueue, block);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_startHeartbeatTimer
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308F68F0;
  block[3] = &unk_264B8FEE8;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_sync(workQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopHeartbeatTimer
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308F6B70;
  block[3] = &unk_264B8D590;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_sendErrorMessage:(id)a3 code:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = a3;
  uint64_t v7 = NSDictionary;
  id v8 = a3;
  uint64_t v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v6 errorWithDomain:@"com.apple.DTGPUService" code:a4 userInfo:v9];

  [(DTGPUService *)self _sendError:v10];
}

- (id)currentConsistentGPUPerformanceState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_dataSourceDict allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) currentConsistentGPUPerformanceState];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3 acceleratorID:(unint64_t)a4
{
  if (a3)
  {
    unint64_t v4 = a3;
    self->_targetPerfState = a3;
    self->_enableConsistentPerfState = 1;
    uint64_t v5 = [(DTGPUService *)self dataSourceFromGPUIndex:a4];
    LOBYTE(v4) = [v5 enableConsistentGPUPerformanceState:v4];

    return v4;
  }
  else
  {
    id v7 = [(DTGPUService *)self disableConsistentGPUPerformanceState:a4];
    return 1;
  }
}

- (id)disableConsistentGPUPerformanceState:(unint64_t)a3
{
  self->_enableConsistentPerfState = 0;
  id v3 = [(DTGPUService *)self dataSourceFromGPUIndex:a3];
  unint64_t v4 = [v3 disableConsistentGPUPerformanceState];

  return v4;
}

- (void)enableMultiSourceCounters
{
  self->_enableMultiSourceCounters = 1;
}

- (void)importAPSData:(id)a3
{
}

- (void)configureAPS:(id)a3
{
}

- (void)setAPSCounterConfig:(id)a3
{
  id v4 = a3;
  dataSourceDict = self->_dataSourceDict;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308F6FA4;
  v7[3] = &unk_264B8FF10;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)dataSourceDict enumerateKeysAndObjectsUsingBlock:v7];
}

- (DTGPUServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DTGPUServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apsConfiguration, 0);
  objc_storeStrong((id *)&self->_importAPSDataPath, 0);
  objc_storeStrong((id *)&self->_dataSourceDict, 0);
  objc_storeStrong((id *)&self->_collectingDataSources, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_waitingForDeviceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end