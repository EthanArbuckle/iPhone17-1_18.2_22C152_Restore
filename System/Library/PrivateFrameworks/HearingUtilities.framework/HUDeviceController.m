@interface HUDeviceController
- (AXDispatchTimer)sendPropertyUpdatesTimer;
- (BOOL)representsLocalDevices;
- (HUDeviceController)init;
- (NSMutableArray)updateDeviceBlocks;
- (NSMutableDictionary)deviceUpdatesDescription;
- (OS_dispatch_queue)deviceUpdatesQueue;
- (id)hearingAidForDeviceID:(id)a3;
- (void)device:(id)a3 didUpdateProperty:(unint64_t)a4;
- (void)registerForPropertyUpdates:(id)a3;
- (void)setDeviceUpdatesDescription:(id)a3;
- (void)setDeviceUpdatesQueue:(id)a3;
- (void)setSendPropertyUpdatesTimer:(id)a3;
- (void)setUpdateDeviceBlocks:(id)a3;
- (void)stopPropertyUpdates;
- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4;
- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5;
@end

@implementation HUDeviceController

- (HUDeviceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)HUDeviceController;
  v2 = [(HUDeviceController *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("hu_device_updates_queue", v4);
    [(HUDeviceController *)v2 setDeviceUpdatesQueue:v5];

    v6 = [MEMORY[0x263EFF980] array];
    [(HUDeviceController *)v2 setUpdateDeviceBlocks:v6];

    uint64_t v7 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v2->_deviceUpdatesQueue];
    sendPropertyUpdatesTimer = v2->_sendPropertyUpdatesTimer;
    v2->_sendPropertyUpdatesTimer = (AXDispatchTimer *)v7;

    [(AXDispatchTimer *)v2->_sendPropertyUpdatesTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (id)hearingAidForDeviceID:(id)a3
{
  return 0;
}

- (void)device:(id)a3 didUpdateProperty:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  HAInitializeLogging();
  uint64_t v7 = NSString;
  v8 = [(HUDeviceController *)self updateDeviceBlocks];
  v9 = [v7 stringWithFormat:@"UPDATING %@ - %@", self, v8];

  objc_super v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUDeviceController device:didUpdateProperty:]", 42, v9];
  v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v14 = [v6 deviceUUID];

  v15 = (void *)[v14 copy];
  deviceUpdatesQueue = self->_deviceUpdatesQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke;
  block[3] = &unk_2640FC988;
  block[4] = self;
  id v19 = v15;
  unint64_t v20 = a4;
  id v17 = v15;
  dispatch_async(deviceUpdatesQueue, block);
}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceUpdatesDescription];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3 = [*(id *)(a1 + 32) sendPropertyUpdatesTimer];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke_2;
    v21[3] = &unk_2640FC960;
    v21[4] = *(void *)(a1 + 32);
    [v3 afterDelay:v21 processBlock:1.0];
  }
  id v4 = *(id *)(a1 + 40);
  dispatch_queue_t v5 = [v2 objectForKey:v4];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    dispatch_queue_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v2 setObject:v5 forKey:v4];
  }
  uint64_t v7 = [*(id *)(a1 + 32) hearingAidForDeviceID:v4];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __47__HUDeviceController_device_didUpdateProperty___block_invoke_22;
  v14 = &unk_2640FCB88;
  id v8 = v7;
  AXPerformSafeBlock();
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v9, v11, 3221225472, __47__HUDeviceController_device_didUpdateProperty___block_invoke_22, &unk_2640FCB88);
    }
    else
    {
      objc_super v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48), v11, 3221225472, __47__HUDeviceController_device_didUpdateProperty___block_invoke_22, &unk_2640FCB88);
      [v5 setObject:v9 forKey:v10];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceUpdatesDescription:", v2, v11, v12, v13, v14);
}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceUpdatesDescription];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke_3;
  v10[3] = &unk_2640FCB38;
  v10[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v10];
  v3 = [*(id *)(a1 + 32) updateDeviceBlocks];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __47__HUDeviceController_device_didUpdateProperty___block_invoke_19;
  id v8 = &unk_2640FCB60;
  id v9 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:&v5];

  objc_msgSend(*(id *)(a1 + 32), "setDeviceUpdatesDescription:", 0, v5, v6, v7, v8);
}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) hearingAidForDeviceID:a2];
  if (v6 && [*(id *)(a1 + 32) representsLocalDevices])
  {
    uint64_t v7 = [v6 valueForProperty:0x4000000];
    [v5 setObject:v7 forKey:&unk_26C1E5390];

    id v8 = [v6 valueForProperty:0x200000];
    [v5 setObject:v8 forKey:&unk_26C1E53A8];

    id v9 = [v6 valueForProperty:0x20000000];
    [v5 setObject:v9 forKey:&unk_26C1E53C0];

    objc_super v10 = [v6 valueForProperty:0x10000];
    [v5 setObject:v10 forKey:&unk_26C1E53D8];

    HAInitializeLogging();
    uint64_t v11 = NSString;
    uint64_t v12 = [v6 valueForProperty:0x4000000];
    v13 = [v6 valueForProperty:0x200000];
    v14 = [v11 stringWithFormat:@"Update Paired %@ Connected %@", v12, v13];

    uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUDeviceController device:didUpdateProperty:]_block_invoke", 60, v14];
    v16 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      uint64_t v20 = [v17 UTF8String];
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __47__HUDeviceController_device_didUpdateProperty___block_invoke_19(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t __47__HUDeviceController_device_didUpdateProperty___block_invoke_22(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) valueForProperty:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (void)registerForPropertyUpdates:(id)a3
{
  if (a3)
  {
    id v6 = (id)[a3 copy];
    id v4 = [(HUDeviceController *)self updateDeviceBlocks];
    id v5 = (void *)MEMORY[0x2105575F0](v6);
    [v4 addObject:v5];
  }
}

- (void)stopPropertyUpdates
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Stopping Updates"];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUDeviceController stopPropertyUpdates]", 106, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  deviceUpdatesQueue = self->_deviceUpdatesQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HUDeviceController_stopPropertyUpdates__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(deviceUpdatesQueue, block);
  id v9 = [(HUDeviceController *)self updateDeviceBlocks];
  [v9 removeAllObjects];
}

void __41__HUDeviceController_stopPropertyUpdates__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceUpdatesDescription];
  v3 = [*(id *)(a1 + 32) updateDeviceBlocks];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__HUDeviceController_stopPropertyUpdates__block_invoke_2;
  v5[3] = &unk_2640FCB60;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];

  [*(id *)(a1 + 32) setDeviceUpdatesDescription:v4];
}

uint64_t __41__HUDeviceController_stopPropertyUpdates__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  uint64_t v6 = [(HUDeviceController *)self hearingAidForDeviceID:a4];
  if (v6) {
    [(HUDeviceController *)self device:v6 didUpdateProperty:a3];
  }

  MEMORY[0x270F9A758]();
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  id v10 = a3;
  id v8 = [(HUDeviceController *)self hearingAidForDeviceID:a5];
  id v9 = v8;
  if (v8) {
    [v8 setValue:v10 forProperty:a4];
  }
}

- (BOOL)representsLocalDevices
{
  return 0;
}

- (OS_dispatch_queue)deviceUpdatesQueue
{
  return self->_deviceUpdatesQueue;
}

- (void)setDeviceUpdatesQueue:(id)a3
{
}

- (NSMutableDictionary)deviceUpdatesDescription
{
  return self->_deviceUpdatesDescription;
}

- (void)setDeviceUpdatesDescription:(id)a3
{
}

- (NSMutableArray)updateDeviceBlocks
{
  return self->_updateDeviceBlocks;
}

- (void)setUpdateDeviceBlocks:(id)a3
{
}

- (AXDispatchTimer)sendPropertyUpdatesTimer
{
  return self->_sendPropertyUpdatesTimer;
}

- (void)setSendPropertyUpdatesTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendPropertyUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_updateDeviceBlocks, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesDescription, 0);

  objc_storeStrong((id *)&self->_deviceUpdatesQueue, 0);
}

@end