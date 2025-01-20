@interface HDFitnessMachineService
+ (id)implementedProperties;
+ (id)serviceUUID;
+ (int64_t)serviceType;
+ (unint64_t)typeFromAdvertisementData:(id)a3;
- (BOOL)processAdvertisementData:(id)a3;
- (id)servicesInProfile;
- (unint64_t)machineType;
- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6;
- (void)readProperty:(id)a3;
@end

@implementation HDFitnessMachineService

+ (int64_t)serviceType
{
  return 1;
}

+ (id)serviceUUID
{
  return +[CBUUID UUIDWithString:@"0x1826"];
}

+ (id)implementedProperties
{
  CFStringRef v4 = @"fitnessMachineType";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)readProperty:(id)a3
{
  id v6 = a3;
  if ([v6 isEqual:@"fitnessMachineType"])
  {
    CFStringRef v4 = [(HDHealthService *)self healthPeripheral];
    v5 = +[NSNumber numberWithUnsignedInteger:self->_machineType];
    [v4 service:self didReadProperty:v6 value:v5 error:0];
  }
}

- (id)servicesInProfile
{
  v2 = +[HDDeviceInformationService serviceUUID];
  v6[0] = v2;
  v3 = +[HDEurotasService serviceUUID];
  v6[1] = v3;
  CFStringRef v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = sub_13D20();
  v7 = [v5 UUID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8 && ([v5 properties] & 0x10) != 0) {
    [v9 setNotifyValue:1 forCharacteristic:v5];
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    _HKInitializeLogging();
    v14 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Error on characteristic update for peripheral: %@ characteristic: %@; %{public}@",
        buf,
        0x20u);
    }
  }
  else
  {
    v15 = sub_13D20();
    v16 = [v11 UUID];
    id v17 = [v15 objectForKeyedSubscript:v16];

    if (v17)
    {
      v18 = [v11 value];
      id v23 = 0;
      v19 = [v17 buildWithBinaryValue:v18 updateTime:v12 error:&v23];
      id v20 = v23;

      if (v19)
      {
        [(HDHealthService *)self characteristicDataReceived:v19];
      }
      else
      {
        _HKInitializeLogging();
        v22 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v25 = v10;
          __int16 v26 = 2112;
          id v27 = v11;
          __int16 v28 = 2114;
          id v29 = v20;
          _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Error handling characteristic update for peripheral: %@ characteristic: %@; %{public}@",
            buf,
            0x20u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
        sub_403E4(v21, v11);
      }
    }
  }
}

+ (unint64_t)typeFromAdvertisementData:(id)a3
{
  id v3 = a3;
  __int16 v10 = 0;
  if ((unint64_t)[v3 length] >= 3)
  {
    unint64_t v4 = 1;
    objc_msgSend(v3, "getBytes:range:", &v10, 1, 2);
    if ((v10 & 1) == 0)
    {
      uint64_t v5 = 3;
      uint64_t v6 = 4;
      uint64_t v7 = 5;
      uint64_t v8 = 6;
      if ((v10 & 0x20) == 0) {
        uint64_t v8 = 0;
      }
      if ((v10 & 0x10) == 0) {
        uint64_t v7 = v8;
      }
      if ((v10 & 8) == 0) {
        uint64_t v6 = v7;
      }
      if ((v10 & 4) == 0) {
        uint64_t v5 = v6;
      }
      if ((v10 & 2) != 0) {
        unint64_t v4 = 2;
      }
      else {
        unint64_t v4 = v5;
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)processAdvertisementData:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() typeFromAdvertisementData:v4];
  id v6 = v5;
  if (v5)
  {
    self->_machineType = (unint64_t)v5;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_4048C((uint64_t)v4, v7);
    }
  }

  return v6 != 0;
}

- (unint64_t)machineType
{
  return self->_machineType;
}

@end