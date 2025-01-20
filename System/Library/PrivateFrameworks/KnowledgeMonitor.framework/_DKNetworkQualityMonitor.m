@interface _DKNetworkQualityMonitor
+ (id)entitlements;
- (BOOL)enabled;
- (BOOL)initialized;
- (NSArray)noiKeyPaths;
- (NSMutableDictionary)statusDictionary;
- (NWNetworkOfInterest)noi;
- (NWNetworkOfInterestManager)noiManager;
- (OS_dispatch_queue)noiManagerQueue;
- (_CDContextualKeyPath)discretionaryInvitedKeyPath;
- (_CDContextualKeyPath)predictedQualityKeyPath;
- (_CDContextualKeyPath)qualityKeyPath;
- (_CDContextualKeyPath)statusKeyPath;
- (id)initForInterfaceType:(int64_t)a3 connectionStatusKeyPath:(id)a4 qualityKeyPath:(id)a5 predictedQualityKeyPath:(id)a6 discretionaryInvitedPath:(id)a7;
- (id)loadState;
- (id)predictionTimelineFromNOIPredictions:(id)a3;
- (int64_t)interfaceType;
- (int64_t)previousQuality;
- (void)deactivate;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDiscretionaryInvitedKeyPath:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setInterfaceType:(int64_t)a3;
- (void)setNoi:(id)a3;
- (void)setNoiKeyPaths:(id)a3;
- (void)setNoiManager:(id)a3;
- (void)setNoiManagerQueue:(id)a3;
- (void)setPredictedQualityKeyPath:(id)a3;
- (void)setPreviousQuality:(int64_t)a3;
- (void)setQualityKeyPath:(id)a3;
- (void)setStatusDictionary:(id)a3;
- (void)setStatusKeyPath:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)updateDiscretionaryTrafficInvited;
- (void)updateInstantQuality;
- (void)updateInterfaceClass;
- (void)updatePowerCostDL;
- (void)updatePowerCostUL;
- (void)updatePredictionAsync;
@end

@implementation _DKNetworkQualityMonitor

- (id)initForInterfaceType:(int64_t)a3 connectionStatusKeyPath:(id)a4 qualityKeyPath:(id)a5 predictedQualityKeyPath:(id)a6 discretionaryInvitedPath:(id)a7
{
  v33[5] = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)_DKNetworkQualityMonitor;
  v17 = [(_DKMonitor *)&v31 init];
  v18 = v17;
  if (v17)
  {
    v17->_interfaceType = a3;
    v17->_initialized = 0;
    objc_storeStrong((id *)&v17->_statusKeyPath, a4);
    v18->_previousQuality = 0;
    objc_storeStrong((id *)&v18->_qualityKeyPath, a5);
    objc_storeStrong((id *)&v18->_predictedQualityKeyPath, a6);
    objc_storeStrong((id *)&v18->_discretionaryInvitedKeyPath, a7);
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    statusDictionary = v18->_statusDictionary;
    v18->_statusDictionary = (NSMutableDictionary *)v19;

    if (a3 == 2)
    {
      v33[0] = @"predictionsGeneratedAt";
      v33[1] = @"linkQuality";
      v33[2] = @"discretionaryTrafficInvited";
      v33[3] = @"powerCostUL";
      v33[4] = @"interfaceClass";
      v21 = (void *)MEMORY[0x263EFF8C0];
      v22 = v33;
      uint64_t v23 = 5;
    }
    else
    {
      v32[0] = @"predictionsGeneratedAt";
      v32[1] = @"linkQuality";
      v32[2] = @"interfaceClass";
      v21 = (void *)MEMORY[0x263EFF8C0];
      v22 = v32;
      uint64_t v23 = 3;
    }
    uint64_t v24 = [v21 arrayWithObjects:v22 count:v23];
    noiKeyPaths = v18->_noiKeyPaths;
    v18->_noiKeyPaths = (NSArray *)v24;

    dispatch_queue_t v26 = dispatch_queue_create("com.apple.duetknowledgecollector.networkQualityMonitorQueue", 0);
    noiManagerQueue = v18->_noiManagerQueue;
    v18->_noiManagerQueue = (OS_dispatch_queue *)v26;

    v28 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x263F7C1E0]);
    noiManager = v18->_noiManager;
    v18->_noiManager = v28;

    [(NWNetworkOfInterestManager *)v18->_noiManager setQueue:v18->_noiManagerQueue];
    [(NWNetworkOfInterestManager *)v18->_noiManager setDelegate:v18];
  }

  return v18;
}

- (void)dealloc
{
  [(_DKNetworkQualityMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

- (id)predictionTimelineFromNOIPredictions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v27 = v5;
    v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v29;
    do
    {
      v12 = v6;
      uint64_t v13 = 0;
      id v14 = v10;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v12);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        id v16 = [v15 changePointAt];
        v17 = v16;
        if (v9)
        {
          [v16 timeIntervalSinceDate:v14];
          double v19 = v18;

          v20 = [NSNumber numberWithDouble:v19];
          [v27 addObject:v20];
        }
        else
        {
          v9 = v16;
        }
        v10 = [v15 changePointAt];

        v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "toQuality"));
        [v4 addObject:v21];

        uint64_t v22 = [v15 resolutionSeconds];
        ++v13;
        id v14 = v10;
      }
      while (v8 != v13);
      uint64_t v23 = v22;
      id v6 = v12;
      uint64_t v8 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);

    if (v9)
    {
      uint64_t v24 = [NSNumber numberWithDouble:(double)(2 * v23)];
      v5 = v27;
      [v27 addObject:v24];

      v25 = [MEMORY[0x263F35100] timelineWithValues:v4 forDurations:v27 startingAt:v9];
      goto LABEL_16;
    }
    v5 = v27;
  }
  else
  {

    v10 = 0;
  }
  v25 = [MEMORY[0x263F35100] predictionUnavailable];
  v9 = 0;
LABEL_16:

  return v25;
}

- (void)updatePredictionAsync
{
  if (self->_predictedQualityKeyPath)
  {
    id v3 = [(NWNetworkOfInterest *)self->_noi predictions];
    if (v3)
    {
      v4 = [(NWNetworkOfInterest *)self->_noi predictions];
      id v8 = [(_DKNetworkQualityMonitor *)self predictionTimelineFromNOIPredictions:v4];
    }
    else
    {
      id v8 = [MEMORY[0x263F35100] predictionUnavailable];
    }

    v5 = [MEMORY[0x263F351B8] userContext];
    [v5 setObject:v8 forKeyedSubscript:self->_predictedQualityKeyPath];

    [(NSMutableDictionary *)self->_statusDictionary setObject:v8 forKeyedSubscript:@"prediction"];
    id v6 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
    uint64_t v7 = [MEMORY[0x263F351B8] userContext];
    [v7 setObject:v6 forKeyedSubscript:self->_statusKeyPath];
  }
}

- (void)updateInstantQuality
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  noi = self->_noi;
  if (noi)
  {
    uint64_t v4 = [(NWNetworkOfInterest *)noi linkQuality];
    int64_t v5 = v4;
    if (!self->_initialized || v4 != self->_previousQuality)
    {
      id v6 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        qualityKeyPath = self->_qualityKeyPath;
        id v8 = [NSNumber numberWithInteger:v5];
        int v20 = 138412546;
        v21 = qualityKeyPath;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        _os_log_impl(&dword_225002000, v6, OS_LOG_TYPE_DEFAULT, "Network quality for %@ is %@", (uint8_t *)&v20, 0x16u);
      }
      v9 = [NSNumber numberWithInteger:v5];
      v10 = [MEMORY[0x263F351B8] userContext];
      [v10 setObject:v9 forKeyedSubscript:self->_qualityKeyPath];

      uint64_t v11 = [NSNumber numberWithInteger:v5];
      statusDictionary = self->_statusDictionary;
      uint64_t v13 = [MEMORY[0x263F35220] connectionQualityKey];
      [(NSMutableDictionary *)statusDictionary setObject:v11 forKeyedSubscript:v13];

      LODWORD(v11) = [(NWNetworkOfInterest *)self->_noi atHomeScopedNOI];
      int v14 = [(NWNetworkOfInterest *)self->_noi atWorkScopedNOI];
      if (v11)
      {
        id v15 = self->_statusDictionary;
        id v16 = [MEMORY[0x263F35220] loiKey];
        v17 = &unk_26D86D910;
      }
      else
      {
        if (!v14)
        {
LABEL_11:
          double v18 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
          double v19 = [MEMORY[0x263F351B8] userContext];
          [v19 setObject:v18 forKeyedSubscript:self->_statusKeyPath];

          self->_previousQuality = v5;
          self->_initialized = 1;
          return;
        }
        id v15 = self->_statusDictionary;
        id v16 = [MEMORY[0x263F35220] loiKey];
        v17 = &unk_26D86D928;
      }
      [(NSMutableDictionary *)v15 setObject:v17 forKeyedSubscript:v16];

      goto LABEL_11;
    }
  }
}

- (void)updateDiscretionaryTrafficInvited
{
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[NWNetworkOfInterest discretionaryTrafficInvited](self->_noi, "discretionaryTrafficInvited"));
  uint64_t v4 = [MEMORY[0x263F351B8] userContext];
  [v4 setObject:v3 forKeyedSubscript:self->_discretionaryInvitedKeyPath];

  int64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NWNetworkOfInterest discretionaryTrafficInvited](self->_noi, "discretionaryTrafficInvited"));
  statusDictionary = self->_statusDictionary;
  uint64_t v7 = [MEMORY[0x263F35220] interfaceUpKey];
  [(NSMutableDictionary *)statusDictionary setObject:v5 forKeyedSubscript:v7];

  id v9 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
  id v8 = [MEMORY[0x263F351B8] userContext];
  [v8 setObject:v9 forKeyedSubscript:self->_statusKeyPath];
}

- (void)updatePowerCostDL
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[NWNetworkOfInterest powerCostDL](self->_noi, "powerCostDL"));
  statusDictionary = self->_statusDictionary;
  int64_t v5 = [MEMORY[0x263F35220] downloadPowerCostKey];
  [(NSMutableDictionary *)statusDictionary setObject:v3 forKeyedSubscript:v5];

  id v7 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
  id v6 = [MEMORY[0x263F351B8] userContext];
  [v6 setObject:v7 forKeyedSubscript:self->_statusKeyPath];
}

- (void)updatePowerCostUL
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[NWNetworkOfInterest powerCostUL](self->_noi, "powerCostUL"));
  statusDictionary = self->_statusDictionary;
  int64_t v5 = [MEMORY[0x263F35220] uploadPowerCostKey];
  [(NSMutableDictionary *)statusDictionary setObject:v3 forKeyedSubscript:v5];

  id v7 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
  id v6 = [MEMORY[0x263F351B8] userContext];
  [v6 setObject:v7 forKeyedSubscript:self->_statusKeyPath];
}

- (void)updateInterfaceClass
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[NWNetworkOfInterest interfaceClass](self->_noi, "interfaceClass"));
  statusDictionary = self->_statusDictionary;
  int64_t v5 = [MEMORY[0x263F35220] interfaceClassKey];
  [(NSMutableDictionary *)statusDictionary setObject:v3 forKeyedSubscript:v5];

  id v7 = [NSDictionary dictionaryWithDictionary:self->_statusDictionary];
  id v6 = [MEMORY[0x263F351B8] userContext];
  [v6 setObject:v7 forKeyedSubscript:self->_statusKeyPath];
}

- (void)didStartTrackingNOI:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!self->_noi)
  {
    objc_storeStrong((id *)&self->_noi, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_noiKeyPaths;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((![v11 isEqualToString:@"predictionsGeneratedAt"]
             || self->_predictedQualityKeyPath)
            && (![v11 isEqualToString:@"discretionaryTrafficInvited"]
             || self->_discretionaryInvitedKeyPath))
          {
            [v5 addObserver:self forKeyPath:v11 options:1 context:0];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v8);
    }

    v12 = [(_DKMonitor *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48___DKNetworkQualityMonitor_didStartTrackingNOI___block_invoke;
    v16[3] = &unk_264714788;
    v16[4] = self;
    uint64_t v13 = v16;
    int v14 = (void *)os_transaction_create();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
    block[3] = &unk_2647148A0;
    id v22 = v14;
    id v23 = v13;
    id v15 = v14;
    dispatch_async(v12, block);
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqual:self->_noi])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_noiKeyPaths;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((![v10 isEqualToString:@"predictionsGeneratedAt"]
             || self->_predictedQualityKeyPath)
            && (![v10 isEqualToString:@"discretionaryTrafficInvited"]
             || self->_discretionaryInvitedKeyPath))
          {
            [v4 removeObserver:self forKeyPath:v10];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    nouint64_t i = self->_noi;
    self->_nouint64_t i = 0;
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_DKNetworkQualityMonitor *)self didStopTrackingNOI:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_enabled) {
    [(NWNetworkOfInterestManager *)self->_noiManager trackNOIAnyForInterfaceType:self->_interfaceType options:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  if ([a4 isEqual:self->_noi])
  {
    long long v9 = [(_DKMonitor *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75___DKNetworkQualityMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_2647147D8;
    id v14 = v8;
    long long v15 = self;
    long long v10 = v13;
    long long v11 = (void *)os_transaction_create();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_7;
    block[3] = &unk_2647148A0;
    id v17 = v11;
    id v18 = v10;
    id v12 = v11;
    dispatch_async(v9, block);
  }
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    [(NWNetworkOfInterestManager *)self->_noiManager trackNOIAnyForInterfaceType:self->_interfaceType options:0];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNetworkQualityMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNetworkQualityMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  if (self->_enabled)
  {
    self->_enabled = 0;
    self->_initialized = 0;
    noiManager = self->_noiManager;
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", self->_noi, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(NWNetworkOfInterestManager *)noiManager stopTrackingNOIs:v3];
  }
}

- (void)synchronouslyReflectCurrentValue
{
  if (![(_DKNetworkQualityMonitor *)self initialized])
  {
    id v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60___DKNetworkQualityMonitor_synchronouslyReflectCurrentValue__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (id)loadState
{
  return 0;
}

+ (id)entitlements
{
  return &unk_26D86D7B8;
}

- (NSArray)noiKeyPaths
{
  return self->_noiKeyPaths;
}

- (void)setNoiKeyPaths:(id)a3
{
}

- (OS_dispatch_queue)noiManagerQueue
{
  return self->_noiManagerQueue;
}

- (void)setNoiManagerQueue:(id)a3
{
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
}

- (NWNetworkOfInterest)noi
{
  return self->_noi;
}

- (void)setNoi:(id)a3
{
}

- (int64_t)previousQuality
{
  return self->_previousQuality;
}

- (void)setPreviousQuality:(int64_t)a3
{
  self->_previousQuality = a3;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (_CDContextualKeyPath)qualityKeyPath
{
  return self->_qualityKeyPath;
}

- (void)setQualityKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)predictedQualityKeyPath
{
  return self->_predictedQualityKeyPath;
}

- (void)setPredictedQualityKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)discretionaryInvitedKeyPath
{
  return self->_discretionaryInvitedKeyPath;
}

- (void)setDiscretionaryInvitedKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)statusKeyPath
{
  return self->_statusKeyPath;
}

- (void)setStatusKeyPath:(id)a3
{
}

- (NSMutableDictionary)statusDictionary
{
  return self->_statusDictionary;
}

- (void)setStatusDictionary:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_statusKeyPath, 0);
  objc_storeStrong((id *)&self->_discretionaryInvitedKeyPath, 0);
  objc_storeStrong((id *)&self->_predictedQualityKeyPath, 0);
  objc_storeStrong((id *)&self->_qualityKeyPath, 0);
  objc_storeStrong((id *)&self->_noi, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_noiManagerQueue, 0);
  objc_storeStrong((id *)&self->_noiKeyPaths, 0);
}

@end