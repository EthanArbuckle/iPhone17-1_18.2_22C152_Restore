@interface MLComputePlanDeviceUsage
- (MLComputeDeviceProtocol)preferredComputeDevice;
- (MLComputePlanDeviceUsage)initWithSupportedComputeDevices:(id)a3 preferredComputeDevice:(id)a4 deviceSupportInfoArray:(id)a5;
- (NSArray)deviceSupportInfoArray;
- (NSArray)supportedComputeDevices;
- (id)supportInfoForComputeDevice:(id)a3;
@end

@implementation MLComputePlanDeviceUsage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSupportInfoArray, 0);
  objc_storeStrong((id *)&self->_preferredComputeDevice, 0);

  objc_storeStrong((id *)&self->_supportedComputeDevices, 0);
}

- (NSArray)deviceSupportInfoArray
{
  return self->_deviceSupportInfoArray;
}

- (MLComputeDeviceProtocol)preferredComputeDevice
{
  return self->_preferredComputeDevice;
}

- (NSArray)supportedComputeDevices
{
  return self->_supportedComputeDevices;
}

- (id)supportInfoForComputeDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(MLComputePlanDeviceUsage *)self deviceSupportInfoArray];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 computeDevice];
        char v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MLComputePlanDeviceUsage)initWithSupportedComputeDevices:(id)a3 preferredComputeDevice:(id)a4 deviceSupportInfoArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLComputePlanDeviceUsage;
  char v11 = [(MLComputePlanDeviceUsage *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    supportedComputeDevices = v11->_supportedComputeDevices;
    v11->_supportedComputeDevices = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_preferredComputeDevice, a4);
    uint64_t v14 = [v10 copy];
    deviceSupportInfoArray = v11->_deviceSupportInfoArray;
    v11->_deviceSupportInfoArray = (NSArray *)v14;
  }
  return v11;
}

@end