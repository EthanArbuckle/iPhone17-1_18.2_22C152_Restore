@interface MPSGraphDevice
+ (MPSGraphDevice)deviceWithMTLDevice:(id)metalDevice;
+ (id)ANEDevice;
+ (id)CPUDevice;
+ (void)initialize;
- (MPSGraphDevice)initWithDeviceType:(unsigned int)a3 metalDevice:(id)a4;
- (MPSGraphDeviceType)type;
- (NSString)metalDeviceName;
- (id)metalDevice;
- (int64_t)gpuCoreCount;
@end

@implementation MPSGraphDevice

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:MEMORY[0x1E4F1CBF0]];
  v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v2;

  if (qword_1E8EBEFD0) {
    __assert_rtn("+[MPSGraphDevice initialize]", "MPSGraphDevice.mm", 31, "gDeviceSerialQueue == nullptr");
  }
  dispatch_queue_t v4 = dispatch_queue_create("MPSGraphDevice queue", 0);
  uint64_t v5 = qword_1E8EBEFD0;
  qword_1E8EBEFD0 = (uint64_t)v4;

  MEMORY[0x1F41817F8](v4, v5);
}

- (MPSGraphDevice)initWithDeviceType:(unsigned int)a3 metalDevice:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphDevice;
  v8 = [(MPSGraphDevice *)&v13 init];
  objc_storeStrong((id *)&v8->_metalDevice, a4);
  if (!v8->_metalDevice)
  {
    id v9 = MTLCreateSystemDefaultDevice();
    if ([v9 supportsFamily:1001]) {
      objc_storeStrong((id *)&v8->_metalDevice, v9);
    }
  }
  v8->_type = a3;
  uint64_t v10 = [v7 name];
  metalDeviceName = v8->_metalDeviceName;
  v8->_metalDeviceName = (NSString *)v10;

  return v8;
}

+ (MPSGraphDevice)deviceWithMTLDevice:(id)metalDevice
{
  id v3 = metalDevice;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  dispatch_queue_t v4 = qword_1E8EBEFD0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__MPSGraphDevice_deviceWithMTLDevice___block_invoke;
  v8[3] = &unk_1E4FC13C0;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (MPSGraphDevice *)v6;
}

void __38__MPSGraphDevice_deviceWithMTLDevice___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = (id)_MergedGlobals_1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v6, "type", (void)v14))
        {
          id v7 = [v6 metalDevice];
          uint64_t v8 = [v7 registryID];
          LOBYTE(v8) = v8 == [*(id *)(a1 + 32) registryID];

          if (v8)
          {
            uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v10 = *(void **)(v9 + 40);
            *(void *)(v9 + 40) = v6;

            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v11 = [[MPSGraphDevice alloc] initWithDeviceType:0 metalDevice:*(void *)(a1 + 32)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [(id)_MergedGlobals_1 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (int64_t)gpuCoreCount
{
  if (self->_metalDevice) {
    return *(unsigned __int8 *)(MPSDevice::GetMPSDevice() + 1480);
  }
  else {
    return -1;
  }
}

+ (id)ANEDevice
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MPSGraphDevice_ANEDevice__block_invoke;
  block[3] = &unk_1E4FC13E8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1E8EBEFD0, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __27__MPSGraphDevice_ANEDevice__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)_MergedGlobals_1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (void)v12) == 2)
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v8 = *(void **)(v7 + 40);
          *(void *)(v7 + 40) = v6;

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    if ([MEMORY[0x1E4F4E038] hasANE])
    {
      uint64_t v9 = [[MPSGraphDevice alloc] initWithDeviceType:2 metalDevice:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [(id)_MergedGlobals_1 addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    }
  }
}

+ (id)CPUDevice
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MPSGraphDevice_CPUDevice__block_invoke;
  block[3] = &unk_1E4FC13E8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1E8EBEFD0, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __27__MPSGraphDevice_CPUDevice__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)_MergedGlobals_1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (void)v12) == 1)
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v8 = *(void **)(v7 + 40);
          *(void *)(v7 + 40) = v6;

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v9 = [[MPSGraphDevice alloc] initWithDeviceType:1 metalDevice:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [(id)_MergedGlobals_1 addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (MPSGraphDeviceType)type
{
  return self->_type;
}

- (NSString)metalDeviceName
{
  return self->_metalDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDeviceName, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end