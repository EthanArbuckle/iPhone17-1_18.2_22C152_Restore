@interface HDBatteryService
+ (id)implementedProperties;
+ (id)serviceUUID;
+ (int64_t)serviceType;
- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6;
- (void)readProperty:(id)a3;
@end

@implementation HDBatteryService

+ (int64_t)serviceType
{
  return -3;
}

+ (id)serviceUUID
{
  return +[CBUUID UUIDWithString:kHDBatteryService];
}

+ (id)implementedProperties
{
  CFStringRef v4 = @"batteryLevelPercent";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)readProperty:(id)a3
{
  id v8 = a3;
  if ([v8 isEqual:@"batteryLevelPercent"]
    && (batteryCharacteristic = self->_batteryCharacteristic) != 0
    && ([(CBCharacteristic *)batteryCharacteristic service],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 peripheral],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    [v6 readValueForCharacteristic:self->_batteryCharacteristic];
  }
  else
  {
    if (![(HDHealthService *)self characteristicsDiscovered]) {
      goto LABEL_8;
    }
    v6 = [(HDHealthService *)self healthPeripheral];
    v7 = +[NSError hk_error:310 description:@"Battery level not supported"];
    [v6 service:self didReadProperty:v8 value:0 error:v7];
  }
LABEL_8:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4
{
  id v9 = a4;
  v6 = [v9 UUID];
  v7 = [v6 UUIDString];
  unsigned int v8 = [v7 isEqual:@"2A19"];

  if (v8) {
    objc_storeStrong((id *)&self->_batteryCharacteristic, a4);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6
{
  id v15 = a4;
  id v8 = a6;
  id v9 = [v15 UUID];
  v10 = [v9 UUIDString];
  unsigned int v11 = [v10 isEqual:@"2A19"];

  if (v11)
  {
    if (v8 || ([v15 value], id v8 = (id)objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      v12 = 0;
    }
    else
    {
      v14 = [v15 value];
      v12 = sub_D1A8(self, v14);

      if (v12)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = +[NSError hk_error:311 description:@"Invalid property value format"];
      }
    }
    v13 = [(HDHealthService *)self healthPeripheral];
    [v13 service:self didReadProperty:@"batteryLevelPercent" value:v12 error:v8];
  }
}

- (void).cxx_destruct
{
}

@end