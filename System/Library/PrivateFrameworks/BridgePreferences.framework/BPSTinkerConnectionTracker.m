@interface BPSTinkerConnectionTracker
- (BPSTinkerConnectionTracker)initWithDevice:(id)a3;
- (BPSTinkerConnectionTrackerDelegate)delegate;
- (NRDevice)selectedDevice;
- (void)dealloc;
- (void)reachability:(id)a3 device:(id)a4 connectionStatus:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setSelectedDevice:(id)a3;
@end

@implementation BPSTinkerConnectionTracker

- (BPSTinkerConnectionTracker)initWithDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BPSTinkerConnectionTracker;
  v6 = [(BPSTinkerConnectionTracker *)&v12 init];
  if (v6)
  {
    v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 pairingID];
      *(_DWORD *)buf = 136315394;
      v14 = "-[BPSTinkerConnectionTracker initWithDevice:]";
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "%s for %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_selectedDevice, a3);
    uint64_t v9 = [MEMORY[0x263F5B970] sharedInstance];
    reachability = v6->_reachability;
    v6->_reachability = (PBBridgeIDSReachability *)v9;

    [(PBBridgeIDSReachability *)v6->_reachability addObserver:v6];
  }

  return v6;
}

- (void)setSelectedDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = (NRDevice *)a3;
  v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NRDevice *)self->_selectedDevice pairingID];
    v8 = [(NRDevice *)v5 pairingID];
    int v10 = 136315650;
    v11 = "-[BPSTinkerConnectionTracker setSelectedDevice:]";
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl(&dword_21C513000, v6, OS_LOG_TYPE_DEFAULT, "%s from %@ to %@", (uint8_t *)&v10, 0x20u);
  }
  if (self->_selectedDevice != v5)
  {
    objc_storeStrong((id *)&self->_selectedDevice, a3);
    uint64_t v9 = [MEMORY[0x263F5B970] sharedInstance];
    -[BPSTinkerConnectionTracker reachability:device:connectionStatus:](self, "reachability:device:connectionStatus:", v9, v5, [v9 reachabilityForDevice:v5]);
  }
}

- (void)dealloc
{
  [(PBBridgeIDSReachability *)self->_reachability removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BPSTinkerConnectionTracker;
  [(BPSTinkerConnectionTracker *)&v3 dealloc];
}

- (void)reachability:(id)a3 device:(id)a4 connectionStatus:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v7 = (NRDevice *)a4;
  v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v14 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]";
    _os_log_impl(&dword_21C513000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if (self->_selectedDevice == v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__BPSTinkerConnectionTracker_reachability_device_connectionStatus___block_invoke;
    block[3] = &unk_264408E58;
    unint64_t v12 = a5;
    int v10 = v7;
    v11 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __67__BPSTinkerConnectionTracker_reachability_device_connectionStatus___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 1)
  {
    v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21C513000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s device Bluetooth connected", buf, 0xCu);
    }

    v4 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57610]];
    uint64_t v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [NSString stringWithFormat:@"[Connecting to Apple Watch '%@'...]", v4];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_21C513000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    [WeakRetained didBTConnectDevice:*(void *)(a1 + 32)];
  }
  else if (v2 == 2)
  {
    objc_super v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s device IDS connected", buf, 0xCu);
    }

    v4 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57610]];
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [NSString stringWithFormat:@"[Apple Watch '%@' is connected.]", v4];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    [WeakRetained didIDSConnectDevice:*(void *)(a1 + 32)];
  }
  else
  {
    v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s device disconnected", buf, 0xCu);
    }

    v4 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57610]];
    unint64_t v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [NSString stringWithFormat:@"[Bring Apple Watch '%@' near your iPhone.]", v4];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_21C513000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    [WeakRetained didUpdateAsDisconnectedDevice:*(void *)(a1 + 32)];
  }
}

- (NRDevice)selectedDevice
{
  return self->_selectedDevice;
}

- (BPSTinkerConnectionTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BPSTinkerConnectionTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedDevice, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end