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
  id v5 = [objc_alloc((Class)a1) initWithSerialNumber:v4];

  return v5;
}

- (DSEADevice)initWithSerialNumber:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  id v5 = [(DSEADevice *)&v21 init];
  if (v5)
  {
    v6 = +[EAAccessoryManager sharedAccessoryManager];
    v7 = [v6 connectedAccessories];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v14 = [v13 serialNumber];
            unsigned int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
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

      id v5 = 0;
    }
  }
  return v5;
}

+ (id)deviceWithModelNumber:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithModelNumber:v4];

  return v5;
}

- (DSEADevice)initWithModelNumber:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DSEADevice;
  id v5 = [(DSEADevice *)&v21 init];
  if (v5)
  {
    v6 = +[EAAccessoryManager sharedAccessoryManager];
    v7 = [v6 connectedAccessories];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            v14 = [v13 modelNumber];
            unsigned int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              objc_storeStrong((id *)&v5->_device, v13);
              goto LABEL_13;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
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

      id v5 = 0;
    }
  }
  return v5;
}

+ (id)devicesWithModelNumbers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[EAAccessoryManager sharedAccessoryManager];
  v6 = [v5 connectedAccessories];

  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v12 modelNumber];
          unsigned int v14 = [v3 containsObject:v13];

          if (v14)
          {
            unsigned int v15 = [[DSEADevice alloc] initWithAccessory:v12];
            if (v15) {
              [v4 addObject:v15];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    v6 = v18;
  }
  id v16 = [v4 copy];

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
  v32[0] = @"capabilities";
  v31 = [(DSEADevice *)self device];
  v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 accessoryCapabilities]);
  v33[0] = v30;
  v32[1] = @"firmwareRevision";
  v29 = [(DSEADevice *)self device];
  uint64_t v3 = [v29 firmwareRevision];
  v28 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = +[NSNull null];
  }
  long long v22 = (void *)v3;
  v33[1] = v3;
  v32[2] = @"hardwareRevision";
  v27 = [(DSEADevice *)self device];
  uint64_t v4 = [v27 hardwareRevision];
  id v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = +[NSNull null];
  }
  long long v21 = (void *)v4;
  v33[2] = v4;
  v32[3] = @"MACAddress";
  v25 = [(DSEADevice *)self device];
  uint64_t v6 = [v25 macAddress];
  id v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = +[NSNull null];
  }
  v26 = v5;
  long long v20 = (void *)v6;
  v33[3] = v6;
  v32[4] = @"modelNumber";
  v24 = [(DSEADevice *)self device];
  uint64_t v8 = [v24 modelNumber];
  objc_super v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = +[NSNull null];
  }
  long long v19 = (void *)v8;
  v33[4] = v8;
  v32[5] = @"name";
  uint64_t v10 = [(DSEADevice *)self device];
  uint64_t v11 = [v10 name];
  v12 = v11;
  if (!v11)
  {
    v12 = +[NSNull null];
  }
  v33[5] = v12;
  v32[6] = @"serialNumber";
  v13 = [(DSEADevice *)self device];
  unsigned int v14 = [v13 serialNumber];
  unsigned int v15 = v14;
  if (!v14)
  {
    unsigned int v15 = +[NSNull null];
  }
  v33[6] = v15;
  v32[7] = @"connectionID";
  id v16 = [(DSEADevice *)self device];
  long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 connectionID]);
  v33[7] = v17;
  id v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:8];

  if (!v14) {
  if (!v11)
  }

  if (!v9) {
  if (!v7)
  }

  if (!v26) {
  if (!v28)
  }

  return v23;
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