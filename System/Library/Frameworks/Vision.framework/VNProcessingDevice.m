@interface VNProcessingDevice
+ (id)allDevices;
+ (id)defaultANEDevice;
+ (id)defaultCPUDevice;
+ (id)defaultDevice;
+ (id)defaultMetalDevice;
+ (id)deviceForMetalDevice:(id)a3;
+ (id)directANEDevice;
+ (void)_lockStaticObjectsAccessLock;
+ (void)_unlockStaticObjectsAccessLock;
+ (void)forcedCleanup;
- (BOOL)isEqual:(id)a3;
- (BOOL)targetsANE;
- (BOOL)targetsCPU;
- (BOOL)targetsGPU;
- (id)computeDevice;
- (id)description;
- (id)metalDevice;
- (int)espressoDeviceID;
- (int)espressoEngine;
- (int)espressoStorageType;
- (unint64_t)hash;
@end

@implementation VNProcessingDevice

+ (id)defaultMetalDevice
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  v3 = (void *)requestPerformingDevice_defaultMetalDevice;
  if (!requestPerformingDevice_defaultMetalDevice)
  {
    v4 = VNCreateMetalDevice();
    if (v4)
    {
      uint64_t v5 = [a1 deviceForMetalDevice:v4];
      v6 = (void *)requestPerformingDevice_defaultMetalDevice;
      requestPerformingDevice_defaultMetalDevice = v5;
    }
    v3 = (void *)requestPerformingDevice_defaultMetalDevice;
  }
  id v7 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v7;
}

+ (id)defaultCPUDevice
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  v2 = (void *)requestPerformingDevice_defaultCPUDevice;
  if (!requestPerformingDevice_defaultCPUDevice)
  {
    v3 = objc_alloc_init(VNCPUProcessingDevice);
    v4 = (void *)requestPerformingDevice_defaultCPUDevice;
    requestPerformingDevice_defaultCPUDevice = (uint64_t)v3;

    v2 = (void *)requestPerformingDevice_defaultCPUDevice;
  }
  id v5 = v2;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v5;
}

+ (id)defaultANEDevice
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  if (!requestPerformingDevice_defaultANEDevice && VisionCoreHasANE())
  {
    v2 = objc_alloc_init(VNANERuntimeProcessingDevice);
    v3 = (void *)requestPerformingDevice_defaultANEDevice;
    requestPerformingDevice_defaultANEDevice = (uint64_t)v2;
  }
  id v4 = (id)requestPerformingDevice_defaultANEDevice;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v4;
}

+ (void)_unlockStaticObjectsAccessLock
{
}

+ (void)_lockStaticObjectsAccessLock
{
  if (_lockStaticObjectsAccessLock_onceToken_createOnceTokenLock != -1) {
    dispatch_once(&_lockStaticObjectsAccessLock_onceToken_createOnceTokenLock, &__block_literal_global_31910);
  }
  v2 = (void *)staticObjectsAccessLock;

  [v2 lock];
}

uint64_t __50__VNProcessingDevice__lockStaticObjectsAccessLock__block_invoke()
{
  staticObjectsAccessLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28FD0]);

  return MEMORY[0x1F41817F8]();
}

+ (id)deviceForMetalDevice:(id)a3
{
  id v3 = a3;
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  if (ourMetalToProcessingDeviceMap)
  {
    id v4 = [(id)ourMetalToProcessingDeviceMap objectForKey:v3];
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v6 = (void *)ourMetalToProcessingDeviceMap;
    ourMetalToProcessingDeviceMap = v5;
  }
  id v4 = [[VNMetalProcessingDevice alloc] initWithMetalDevice:v3];
  if (v4) {
    [(id)ourMetalToProcessingDeviceMap setObject:v4 forKey:v3];
  }
LABEL_7:
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v4;
}

- (int)espressoStorageType
{
  return 65568;
}

- (int)espressoEngine
{
  return 0;
}

- (int)espressoDeviceID
{
  return -1;
}

- (id)metalDevice
{
  return 0;
}

- (id)computeDevice
{
  return 0;
}

- (BOOL)targetsANE
{
  return 0;
}

- (BOOL)targetsGPU
{
  return 0;
}

- (BOOL)targetsCPU
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v5 = a3;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  return a3 == self;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (void)forcedCleanup
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  v2 = (void *)allDevices;
  allDevices = 0;

  id v3 = (void *)requestPerformingDevice_defaultDevice;
  requestPerformingDevice_defaultDevice = 0;

  unint64_t v4 = (void *)requestPerformingDevice_defaultCPUDevice;
  requestPerformingDevice_defaultCPUDevice = 0;

  id v5 = (void *)requestPerformingDevice_defaultMetalDevice;
  requestPerformingDevice_defaultMetalDevice = 0;

  v6 = (void *)requestPerformingDevice_defaultANEDevice;
  requestPerformingDevice_defaultANEDevice = 0;

  id v7 = (void *)requestPerformingDevice_directANEDevice;
  requestPerformingDevice_directANEDevice = 0;

  [(id)ourMetalToProcessingDeviceMap removeAllObjects];
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];
}

+ (id)directANEDevice
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  if (!requestPerformingDevice_directANEDevice && VisionCoreHasANE())
  {
    v2 = objc_alloc_init(VNANERuntimeDirectProcessingDevice);
    id v3 = (void *)requestPerformingDevice_directANEDevice;
    requestPerformingDevice_directANEDevice = (uint64_t)v2;
  }
  id v4 = (id)requestPerformingDevice_directANEDevice;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v4;
}

+ (id)defaultDevice
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  id v3 = (void *)requestPerformingDevice_defaultDevice;
  if (!requestPerformingDevice_defaultDevice)
  {
    uint64_t v4 = [a1 defaultANEDevice];
    id v5 = (void *)requestPerformingDevice_defaultDevice;
    requestPerformingDevice_defaultDevice = v4;

    id v3 = (void *)requestPerformingDevice_defaultDevice;
    if (!requestPerformingDevice_defaultDevice)
    {
      uint64_t v6 = [a1 defaultMetalDevice];
      id v7 = (void *)requestPerformingDevice_defaultDevice;
      requestPerformingDevice_defaultDevice = v6;

      id v3 = (void *)requestPerformingDevice_defaultDevice;
      if (!requestPerformingDevice_defaultDevice)
      {
        uint64_t v8 = [a1 defaultCPUDevice];
        v9 = (void *)requestPerformingDevice_defaultDevice;
        requestPerformingDevice_defaultDevice = v8;

        id v3 = (void *)requestPerformingDevice_defaultDevice;
      }
    }
  }
  id v10 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v10;
}

+ (id)allDevices
{
  +[VNProcessingDevice _lockStaticObjectsAccessLock];
  id v3 = (void *)allDevices;
  if (!allDevices)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [a1 defaultCPUDevice];
    [v4 addObject:v5];

    uint64_t v6 = +[VNMetalProcessingDevice allDevices];
    [v4 addObjectsFromArray:v6];

    id v7 = [a1 defaultANEDevice];
    if (v7) {
      [v4 addObject:v7];
    }
    uint64_t v8 = [v4 copy];
    v9 = (void *)allDevices;
    allDevices = v8;

    id v3 = (void *)allDevices;
  }
  id v10 = v3;
  +[VNProcessingDevice _unlockStaticObjectsAccessLock];

  return v10;
}

@end