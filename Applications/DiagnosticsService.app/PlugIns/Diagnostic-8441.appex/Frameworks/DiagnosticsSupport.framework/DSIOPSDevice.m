@interface DSIOPSDevice
+ (id)deviceMatchingAccessories:(id)a3;
+ (id)deviceWithAccessory:(unint64_t)a3;
- (DSIOPSDevice)initWithDeviceIdentifiers:(id)a3;
- (NSDictionary)info;
- (id)information;
- (id)serialNumber;
- (unint64_t)deviceModel;
- (void)setInfo:(id)a3;
@end

@implementation DSIOPSDevice

+ (id)deviceWithAccessory:(unint64_t)a3
{
  v4 = +[DSIODeviceIdentifier identifierForAccessoryModel:a3];
  id v5 = objc_alloc((Class)a1);
  v9 = v4;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = [v5 initWithDeviceIdentifiers:v6];

  return v7;
}

+ (id)deviceMatchingAccessories:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", (int)[v10 intValue]);
        if (v11)
        {
          [v4 addObject:v11];
        }
        else
        {
          v12 = DiagnosticLogHandleForCategory(6);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v10;
            _os_log_fault_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  id v13 = [objc_alloc((Class)a1) initWithDeviceIdentifiers:v4];

  return v13;
}

- (DSIOPSDevice)initWithDeviceIdentifiers:(id)a3
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DSIOPSDevice;
  v4 = [(DSIOPSDevice *)&v10 init];
  if (v4)
  {
    CFTypeRef blob = 0;
    int v5 = IOPSCopyPowerSourcesByTypePrecise();
    id v6 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DSIOPSDevice initWithDeviceIdentifiers:](v5, v6);
    }

    if (!v4->_info)
    {

      v4 = 0;
    }
  }

  return v4;
}

- (id)serialNumber
{
  v2 = [(DSIOPSDevice *)self info];
  id v3 = [v2 objectForKeyedSubscript:@"Accessory Identifier"];

  return v3;
}

- (id)information
{
  v32[0] = @"serialNumber";
  v31 = [(DSIOPSDevice *)self info];
  uint64_t v3 = [v31 objectForKeyedSubscript:@"Accessory Identifier"];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = +[NSNull null];
  }
  v23 = (void *)v3;
  v33[0] = v3;
  v32[1] = @"fullChargeCapacity";
  v29 = [(DSIOPSDevice *)self info];
  uint64_t v5 = [v29 objectForKeyedSubscript:@"Max Capacity"];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = +[NSNull null];
  }
  v30 = v4;
  v22 = (void *)v5;
  v33[1] = v5;
  v32[2] = @"nominalChargeCapacity";
  v27 = [(DSIOPSDevice *)self info];
  uint64_t v7 = [v27 objectForKeyedSubscript:@"Nominal Capacity"];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = +[NSNull null];
  }
  v21 = (void *)v7;
  v33[2] = v7;
  v32[3] = @"cycleCount";
  v26 = [(DSIOPSDevice *)self info];
  uint64_t v9 = [v26 objectForKeyedSubscript:@"CycleCount"];
  objc_super v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = +[NSNull null];
  }
  v28 = v6;
  v33[3] = v9;
  v32[4] = @"temperature";
  v25 = [(DSIOPSDevice *)self info];
  v11 = [v25 objectForKeyedSubscript:@"Temperature"];
  v12 = v11;
  if (!v11)
  {
    v12 = +[NSNull null];
  }
  v33[4] = v12;
  v32[5] = @"isCharging";
  id v13 = [(DSIOPSDevice *)self info];
  v14 = [v13 objectForKeyedSubscript:@"Is Charging"];
  v15 = v14;
  if (!v14)
  {
    v15 = +[NSNull null];
  }
  v33[5] = v15;
  v32[6] = @"powerSourceState";
  long long v16 = [(DSIOPSDevice *)self info];
  long long v17 = [v16 objectForKeyedSubscript:@"Power Source State"];
  long long v18 = v17;
  if (!v17)
  {
    long long v18 = +[NSNull null];
  }
  v33[6] = v18;
  id v24 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:7];
  if (!v17) {

  }
  if (!v14) {
  if (!v11)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v28) {
  if (!v30)
  }

  return v24;
}

- (unint64_t)deviceModel
{
  return self->_deviceModel;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDeviceIdentifiers:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not retrieve power sources list.", v1, 2u);
}

- (void)initWithDeviceIdentifiers:(int)a1 .cold.2(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not retrieve power sources info. Error code: %03X", (uint8_t *)v2, 8u);
}

@end