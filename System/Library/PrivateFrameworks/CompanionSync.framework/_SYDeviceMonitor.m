@interface _SYDeviceMonitor
+ (id)sharedInstance;
- (_SYDeviceMonitor)init;
- (id)allDevices;
- (id)currentTargetableDevice;
- (id)deviceForNRDevice:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (void)_clearDeviceList;
- (void)_deviceDidBecomeActive:(id)a3;
- (void)_deviceDidBecomeInactive:(id)a3;
- (void)_rebuildDeviceList;
- (void)addNRDevice:(id)a3;
- (void)deviceBecameTargetable:(id)a3;
- (void)removeNRDevice:(id)a3;
@end

@implementation _SYDeviceMonitor

- (id)currentTargetableDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  syncQ = self->_syncQ;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43___SYDeviceMonitor_currentTargetableDevice__block_invoke;
  v5[3] = &unk_264423C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___singleton;
  return v2;
}

- (_SYDeviceMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)_SYDeviceMonitor;
  v2 = [(_SYDeviceMonitor *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("_SYDeviceMonitor RWLock", v5);
    syncQ = v2->_syncQ;
    v2->_syncQ = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__deviceDidBecomeActive_ name:*MEMORY[0x263F57688] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__deviceDidBecomeActive_ name:*MEMORY[0x263F576A8] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel__deviceDidBecomeInactive_ name:*MEMORY[0x263F57690] object:0];

    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel__deviceDidBecomeInactive_ name:*MEMORY[0x263F576B8] object:0];

    [(_SYDeviceMonitor *)v2 _rebuildDeviceList];
    v12 = [(_SYDeviceMonitor *)v2 currentTargetableDevice];
    uint64_t v13 = [v12 pairingID];
    currentTargetDeviceUUID = v2->_currentTargetDeviceUUID;
    v2->_currentTargetDeviceUUID = (NSUUID *)v13;

    v15 = v2;
  }

  return v2;
}

- (void)_rebuildDeviceList
{
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38___SYDeviceMonitor__rebuildDeviceList__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_barrier_sync(syncQ, block);
}

- (void)_clearDeviceList
{
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36___SYDeviceMonitor__clearDeviceList__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_barrier_sync(syncQ, block);
}

- (void)deviceBecameTargetable:(id)a3
{
  id v9 = a3;
  v4 = [v9 pairingID];
  char v5 = [v4 isEqual:self->_currentTargetDeviceUUID];

  if ((v5 & 1) == 0)
  {
    dispatch_queue_t v6 = [v9 pairingID];
    currentTargetDeviceUUID = self->_currentTargetDeviceUUID;
    self->_currentTargetDeviceUUID = v6;

    if (v9)
    {
      uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"SYDeviceTargetedNewDeviceNotification" object:v9];
    }
  }
}

- (void)_deviceDidBecomeActive:(id)a3
{
  v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F57680]];

  char v5 = [(_SYDeviceMonitor *)self deviceForNRDevice:v8];

  if (!v5) {
    [(_SYDeviceMonitor *)self addNRDevice:v8];
  }
  dispatch_queue_t v6 = [(_SYDeviceMonitor *)self deviceForNRDevice:v8];
  if ([v6 isTargetable])
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SYDeviceTargetabilityChangedNotification" object:v6];
  }
}

- (void)_deviceDidBecomeInactive:(id)a3
{
  v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F57680]];

  char v5 = [(_SYDeviceMonitor *)self deviceForNRDevice:v7];
  if (v5)
  {
    [(_SYDeviceMonitor *)self removeNRDevice:v7];
    dispatch_queue_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SYDeviceRemovedNotification" object:v5];
  }
}

- (void)addNRDevice:(id)a3
{
  id v4 = a3;
  char v5 = [[SYDevice alloc] initWithNRDevice:v4];

  syncQ = self->_syncQ;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32___SYDeviceMonitor_addNRDevice___block_invoke;
  v8[3] = &unk_264422990;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_sync(syncQ, v8);
}

- (void)removeNRDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35___SYDeviceMonitor_removeNRDevice___block_invoke;
  block[3] = &unk_264422BF8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_barrier_sync(syncQ, block);
}

- (id)deviceForNRDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  if (v5)
  {
    id v6 = [(_SYDeviceMonitor *)self deviceForPairingID:v5];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__9;
    v16 = __Block_byref_object_dispose__9;
    id v17 = 0;
    syncQ = self->_syncQ;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38___SYDeviceMonitor_deviceForNRDevice___block_invoke;
    block[3] = &unk_264423BE0;
    block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(syncQ, block);
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (id)deviceForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___SYDeviceMonitor_deviceForPairingID___block_invoke;
  block[3] = &unk_264423BE0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(syncQ, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  syncQ = self->_syncQ;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30___SYDeviceMonitor_allDevices__block_invoke;
  v5[3] = &unk_264422AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_currentTargetDeviceUUID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end