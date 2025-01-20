@interface ComponentAccessoryApplePencil
- (BOOL)isPresent;
- (ComponentAccessoryApplePencil)init;
- (DSIOHIDDevice)device;
- (id)getBatteryInfo;
- (void)populateAttributes:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation ComponentAccessoryApplePencil

- (ComponentAccessoryApplePencil)init
{
  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessoryApplePencil;
  v2 = [(ComponentAccessoryApplePencil *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[DSIOHIDDevice deviceMatchingAccessories:&off_1000B6EC8];
    device = v2->_device;
    v2->_device = (DSIOHIDDevice *)v3;
  }
  return v2;
}

- (BOOL)isPresent
{
  v2 = [(ComponentAccessoryApplePencil *)self device];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v10 = a3;
  v4 = [(ComponentAccessoryApplePencil *)self device];
  v5 = [v4 serialNumber];

  if (v5)
  {
    [v10 setObject:v5 forKeyedSubscript:@"serialNumber"];
    objc_super v6 = +[DSEADevice deviceWithSerialNumber:v5];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 information];
      [v10 addEntriesFromDictionary:v8];
    }
  }
  else
  {
    v7 = +[NSNull null];
    [v10 setObject:v7 forKeyedSubscript:@"serialNumber"];
  }

  v9 = [(ComponentAccessoryApplePencil *)self getBatteryInfo];
  [v10 setObject:v9 forKeyedSubscript:@"batteryInfo"];
}

- (id)getBatteryInfo
{
  v25 = self;
  if (qword_1000BE110 != -1) {
    dispatch_once(&qword_1000BE110, &stru_100084BF8);
  }
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v3 = [(id)qword_1000BE108 connectedDevices];
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v8, "accessoryCategory", v25) == (id)7)
        {
          v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 percentCharge]);
          [v2 setObject:v9 forKeyedSubscript:@"percentCharge"];

          id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 approximatesPercentCharge]);
          [v2 setObject:v10 forKeyedSubscript:@"approximatesPercentCharge"];

          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isLowBattery]);
          [v2 setObject:v11 forKeyedSubscript:@"lowBattery"];

          v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isCharging]);
          [v2 setObject:v12 forKeyedSubscript:@"isCharging"];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  memset(v27, 0, 37);
  uint64_t v26 = 37;
  v13 = [(ComponentAccessoryApplePencil *)v25 device];
  unsigned int v14 = [v13 reportWithID:34 reportType:2 object:v27 length:&v26];

  if (v14)
  {
    v15 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)v27 + 1)];
    [v2 setObject:v15 forKeyedSubscript:@"eepromWriteCount"];

    v16 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)v27 + 5)];
    [v2 setObject:v16 forKeyedSubscript:@"chargeCycleCount"];

    v17 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)v27 + 9)];
    [v2 setObject:v17 forKeyedSubscript:@"timeOnCharger"];

    v18 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)v27 + 13)];
    [v2 setObject:v18 forKeyedSubscript:@"timeOffCharger"];

    v19 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v27[1] + 1)];
    [v2 setObject:v19 forKeyedSubscript:@"timeInTopOff"];

    v20 = +[NSNumber numberWithInt:*(unsigned int *)((char *)&v27[1] + 5)];
    [v2 setObject:v20 forKeyedSubscript:@"maxTemp"];

    v21 = +[NSNumber numberWithInt:*(unsigned int *)((char *)&v27[1] + 9)];
    [v2 setObject:v21 forKeyedSubscript:@"minTemp"];

    v22 = +[NSNumber numberWithInt:*(unsigned int *)((char *)&v27[1] + 13)];
    [v2 setObject:v22 forKeyedSubscript:@"averageChargingTemp"];

    v23 = +[NSNumber numberWithInt:*(unsigned int *)((char *)&v27[2] + 1)];
    [v2 setObject:v23 forKeyedSubscript:@"averageDischargingTemp"];
  }

  return v2;
}

- (DSIOHIDDevice)device
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