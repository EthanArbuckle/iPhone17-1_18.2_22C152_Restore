@interface _DKWiFiConnectionMonitor
+ (BOOL)writeToBiome;
+ (id)entitlements;
- (id)historicalDeletingHandler;
- (void)_handleKnownNetworkProfileChangedEvent:(id)a3;
- (void)_handleWiFiEvent:(id)a3;
- (void)_handleWiFiStateChangeEvent:(id)a3;
- (void)setHistoricalDeletingHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKWiFiConnectionMonitor

+ (id)entitlements
{
  return &unk_26D86D740;
}

+ (BOOL)writeToBiome
{
  return _os_feature_enabled_impl() ^ 1;
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKWiFiConnectionMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33___DKWiFiConnectionMonitor_start__block_invoke;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (void)_handleWiFiEvent:(id)a3
{
  id v6 = a3;
  v4 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [v6 type];
  if (v5 == 30)
  {
    [(_DKWiFiConnectionMonitor *)self _handleKnownNetworkProfileChangedEvent:v6];
  }
  else if (v5 == 2)
  {
    [(_DKWiFiConnectionMonitor *)self _handleWiFiStateChangeEvent:v6];
  }
}

- (void)_handleWiFiStateChangeEvent:(id)a3
{
  id v27 = a3;
  v4 = self->_currentSSID;
  uint64_t v5 = [(CWFInterface *)self->_interface networkName];
  currentSSID = self->_currentSSID;
  self->_currentSSID = v5;

  if (v4 != self->_currentSSID && (-[NSString isEqual:](v4, "isEqual:") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x263F350A0];
    v8 = self->_currentSSID;
    v9 = [MEMORY[0x263F35000] type];
    v10 = [v7 identifierWithString:v8 type:v9];

    v11 = (void *)MEMORY[0x263F35088];
    v12 = [MEMORY[0x263F35148] wifiConnectionStream];
    v13 = [v27 timestamp];
    v14 = [MEMORY[0x263EFF910] distantFuture];
    v15 = [v11 eventWithStream:v12 startDate:v13 endDate:v14 value:v10];

    v16 = [(_DKMonitor *)self currentEvent];
    [(_DKMonitor *)self setCurrentEvent:v15 inferHistoricalState:v16 != 0];

    v17 = self->_currentSSID;
    v18 = [MEMORY[0x263F351B8] userContext];
    v19 = [MEMORY[0x263F351D0] keyPathForWiFiConnectionSSID];
    [v18 setObject:v17 forKeyedSubscript:v19];

    if (+[_DKWiFiConnectionMonitor writeToBiome])
    {
      v20 = [v27 timestamp];
      [v20 timeIntervalSinceReferenceDate];
      double v22 = v21;

      if (v4)
      {
        id v23 = objc_alloc(MEMORY[0x263F2A0D0]);
        v24 = (void *)[v23 initWithSSID:v4 starting:MEMORY[0x263EFFA80]];
        [(BMSource *)self->_source sendEvent:v24 timestamp:v22];
      }
      if (self->_currentSSID)
      {
        id v25 = objc_alloc(MEMORY[0x263F2A0D0]);
        v26 = (void *)[v25 initWithSSID:self->_currentSSID starting:MEMORY[0x263EFFA88]];
        [(BMSource *)self->_source sendEvent:v26 timestamp:v22];
      }
    }
  }
}

- (void)_handleKnownNetworkProfileChangedEvent:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 info];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F386B0]];
  int v7 = [v6 isEqual:&unk_26D86D8E0];

  if (v7)
  {
    v8 = [v4 info];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F386B8]];

    v10 = [v9 networkName];
    v11 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_225002000, v11, OS_LOG_TYPE_INFO, "Forgetting wifi networks with SSID: %@", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x263F35110];
    v13 = [MEMORY[0x263F35148] wifiConnectionStream];
    v14 = [v13 name];
    v15 = [v12 predicateForEventsWithStreamName:v14];

    v16 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v10];
    v17 = (void *)MEMORY[0x263F08730];
    v29[0] = v15;
    v29[1] = v16;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    v19 = [v17 andPredicateWithSubpredicates:v18];

    v20 = [(_DKWiFiConnectionMonitor *)self historicalDeletingHandler];
    ((void (**)(void, void *))v20)[2](v20, v19);

    double v21 = BiomeLibrary();
    double v22 = [v21 Device];
    id v23 = [v22 Wireless];
    v24 = [v23 WiFi];
    id v25 = [v24 pruner];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67___DKWiFiConnectionMonitor__handleKnownNetworkProfileChangedEvent___block_invoke;
    v27[3] = &unk_264714BB8;
    id v28 = v10;
    id v26 = v10;
    [v25 deleteWithPolicy:@"forget-this-network" eventsPassingTest:v27];
  }
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)_DKWiFiConnectionMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsDeactivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32___DKWiFiConnectionMonitor_stop__block_invoke;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->historicalDeletingHandler, 0);
  objc_storeStrong((id *)&self->_currentSSID, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end