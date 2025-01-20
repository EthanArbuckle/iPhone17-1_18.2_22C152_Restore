@interface IRAVOutputDeviceDiscoverySessionController
- (IRAVOutputDeviceDiscoverySessionController)initWithAVOutputDeviceProvider:(id)a3;
- (IRAVOutputDeviceProvider)avOutputDeviceProvider;
- (void)_didUpdateAVOutputDevices:(id)a3;
- (void)dealloc;
- (void)registerForAvailableOutputDevicesNotification;
- (void)startDetailedDiscovery;
- (void)stopDetailedDiscovery;
- (void)unregisterForAvailableOutputDevicesNotification;
@end

@implementation IRAVOutputDeviceDiscoverySessionController

- (void)_didUpdateAVOutputDevices:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke;
  block[3] = &unk_26539FCE8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) availableOutputDevices];
  v3 = (void *)[v2 copy];

  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2;
  v7[3] = &unk_2653A06A0;
  id v8 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained didUpdateAVOutputDevices:v5];
}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = +[IRAVOutputDeviceDO AVOutputDeviceToDO:a2];
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
    __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  [*(id *)(a1 + 32) addObject:v3];
}

- (IRAVOutputDeviceDiscoverySessionController)initWithAVOutputDeviceProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IRAVOutputDeviceDiscoverySessionController;
  id v5 = [(IRAVOutputDeviceDiscoverySessionController *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_avOutputDeviceProvider, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.intelligentroutingd.IRAVOutputDeviceDiscoverySessionController", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFA7D0]) initWithDeviceFeatures:5];
    session = v6->_session;
    v6->_session = (AVOutputDeviceDiscoverySession *)v10;

    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v12;
  }
  return v6;
}

- (void)dealloc
{
  [(IRAVOutputDeviceDiscoverySessionController *)self unregisterForAvailableOutputDevicesNotification];
  [(AVOutputDeviceDiscoverySession *)self->_session setDiscoveryMode:0];
  v3.receiver = self;
  v3.super_class = (Class)IRAVOutputDeviceDiscoverySessionController;
  [(IRAVOutputDeviceDiscoverySessionController *)&v3 dealloc];
}

- (void)registerForAvailableOutputDevicesNotification
{
}

- (void)unregisterForAvailableOutputDevicesNotification
{
}

- (void)startDetailedDiscovery
{
}

- (void)stopDetailedDiscovery
{
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avOutputDeviceProvider);

  return (IRAVOutputDeviceProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_avOutputDeviceProvider);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__IRAVOutputDeviceDiscoverySessionController__didUpdateAVOutputDevices___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25418E000, a2, OS_LOG_TYPE_DEBUG, "#discovery-session-controller, AVOutputDevice: device has been updated: %@", (uint8_t *)&v2, 0xCu);
}

@end