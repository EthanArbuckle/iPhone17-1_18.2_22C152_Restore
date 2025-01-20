@interface VNMetalProcessingDevice
+ (id)allDevices;
- (BOOL)isEqual:(id)a3;
- (BOOL)targetsGPU;
- (VNMetalProcessingDevice)initWithMetalDevice:(id)a3;
- (id)computeDevice;
- (id)description;
- (id)metalDevice;
- (int)espressoDeviceID;
- (int)espressoEngine;
- (int)espressoStorageType;
- (unint64_t)hash;
@end

@implementation VNMetalProcessingDevice

- (VNMetalProcessingDevice)initWithMetalDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNMetalProcessingDevice;
  v6 = [(VNMetalProcessingDevice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metalDevice, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (int)espressoStorageType
{
  return 65552;
}

- (int)espressoEngine
{
  return 5;
}

- (int)espressoDeviceID
{
  return espresso_device_id_for_metal_device();
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (BOOL)targetsGPU
{
  return 1;
}

- (id)computeDevice
{
  v2 = [(VNMetalProcessingDevice *)self metalDevice];
  v3 = +[VNComputeDeviceUtilities computeDeviceForMetalDevice:v2];

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)VNMetalProcessingDevice;
  v3 = [(VNProcessingDevice *)&v7 description];
  v4 = [(VNMetalProcessingDevice *)self metalDevice];
  id v5 = objc_msgSend(v3, "stringByAppendingFormat:", @"_%llu", objc_msgSend(v4, "registryID"));

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNMetalProcessingDevice;
  id v3 = [(VNProcessingDevice *)&v7 hash];
  v4 = [(VNMetalProcessingDevice *)self metalDevice];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNMetalProcessingDevice;
  if ([(VNProcessingDevice *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(VNMetalProcessingDevice *)self metalDevice];
    objc_super v7 = [v5 metalDevice];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)allDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v5 = MTLCreateSystemDefaultDevice();
  v6 = objc_msgSend(v4, "initWithObjects:", v5, 0);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = (void *)[objc_alloc((Class)a1) initWithMetalDevice:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

@end