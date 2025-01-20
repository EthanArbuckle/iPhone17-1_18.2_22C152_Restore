@interface DSEADevice
+ (id)deviceWithModelNumber:(id)a3;
+ (id)deviceWithSerialNumber:(id)a3;
+ (id)devicesWithModelNumbers:(id)a3;
- (DSEADevice)initWithAccessory:(id)a3;
- (DSEADevice)initWithModelNumber:(id)a3;
- (DSEADevice)initWithSerialNumber:(id)a3;
- (EAAccessory)device;
- (id)information;
- (void)setDevice:(id)a3;
@end

@implementation DSEADevice

+ (id)deviceWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSerialNumber:v4];

  return v5;
}

- (DSEADevice)initWithSerialNumber:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = [(DSEADevice *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
    v7 = [v6 connectedAccessories];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "serialNumber", (void)v17);
            int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    if (!v5->_device)
    {

      v5 = 0;
    }
  }
  return v5;
}

+ (id)deviceWithModelNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithModelNumber:v4];

  return v5;
}

- (DSEADevice)initWithModelNumber:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  v5 = [(DSEADevice *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
    v7 = [v6 connectedAccessories];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "modelNumber", (void)v17);
            int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    if (!v5->_device)
    {

      v5 = 0;
    }
  }
  return v5;
}

+ (id)devicesWithModelNumbers:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  v6 = [v5 connectedAccessories];

  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v12 modelNumber];
          int v14 = [v3 containsObject:v13];

          if (v14)
          {
            int v15 = [[DSEADevice alloc] initWithAccessory:v12];
            if (v15) {
              [v4 addObject:v15];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v6 = v18;
  }
  v16 = (void *)[v4 copy];

  return v16;
}

- (DSEADevice)initWithAccessory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSEADevice;
  v6 = [(DSEADevice *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_device, a3);
    }
    else
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (id)information
{
  v35[8] = *MEMORY[0x263EF8340];
  v34[0] = @"capabilities";
  id v3 = NSNumber;
  v33 = [(DSEADevice *)self device];
  v32 = objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v33, "accessoryCapabilities"));
  v35[0] = v32;
  v34[1] = @"firmwareRevision";
  v31 = [(DSEADevice *)self device];
  uint64_t v4 = [v31 firmwareRevision];
  v30 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v24 = (void *)v4;
  v35[1] = v4;
  v34[2] = @"hardwareRevision";
  v29 = [(DSEADevice *)self device];
  uint64_t v5 = [v29 hardwareRevision];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v23 = (void *)v5;
  v35[2] = v5;
  v34[3] = @"MACAddress";
  v27 = [(DSEADevice *)self device];
  uint64_t v7 = [v27 macAddress];
  uint64_t v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v28 = v6;
  long long v22 = (void *)v7;
  v35[3] = v7;
  v34[4] = @"modelNumber";
  v26 = [(DSEADevice *)self device];
  uint64_t v9 = [v26 modelNumber];
  uint64_t v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  long long v21 = (void *)v9;
  v35[4] = v9;
  v34[5] = @"name";
  uint64_t v11 = [(DSEADevice *)self device];
  v12 = [v11 name];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x263EFF9D0] null];
  }
  v35[5] = v13;
  v34[6] = @"serialNumber";
  int v14 = [(DSEADevice *)self device];
  int v15 = [v14 serialNumber];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x263EFF9D0] null];
  }
  v35[6] = v16;
  v34[7] = @"connectionID";
  long long v17 = NSNumber;
  long long v18 = [(DSEADevice *)self device];
  long long v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "connectionID"));
  v35[7] = v19;
  id v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:8];

  if (!v15) {
  if (!v12)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v28) {
  if (!v30)
  }

  return v25;
}

- (EAAccessory)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end