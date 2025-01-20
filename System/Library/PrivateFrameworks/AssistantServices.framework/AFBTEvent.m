@interface AFBTEvent
- (AFBTEvent)initWithMetadata:(id)a3;
- (BOOL)appleAudioDevice;
- (BOOL)hasAppleAudioDevice;
- (BOOL)hasBatteryLevelHeadphoneCase;
- (BOOL)hasBatteryLevelHeadphoneLeft;
- (BOOL)hasBatteryLevelHeadphoneRight;
- (BOOL)hasProductID;
- (BOOL)hasStarting;
- (BOOL)hasUserWearing;
- (BOOL)starting;
- (BOOL)userWearing;
- (NSNumber)batteryLevelHeadphoneCase;
- (NSNumber)batteryLevelHeadphoneLeft;
- (NSNumber)batteryLevelHeadphoneRight;
- (NSNumber)productID;
- (NSString)address;
- (NSString)name;
- (int)deviceType;
- (void)setHasAppleAudioDevice:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3;
- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3;
- (void)setHasProductID:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setHasUserWearing:(BOOL)a3;
@end

@implementation AFBTEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneLeft, 0);
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneRight, 0);
  objc_storeStrong((id *)&self->_batteryLevelHeadphoneCase, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)setHasUserWearing:(BOOL)a3
{
  self->_hasUserWearing = a3;
}

- (BOOL)hasUserWearing
{
  return self->_hasUserWearing;
}

- (BOOL)userWearing
{
  return self->_userWearing;
}

- (void)setHasAppleAudioDevice:(BOOL)a3
{
  self->_hasAppleAudioDevice = a3;
}

- (BOOL)hasAppleAudioDevice
{
  return self->_hasAppleAudioDevice;
}

- (BOOL)appleAudioDevice
{
  return self->_appleAudioDevice;
}

- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneLeft = a3;
}

- (BOOL)hasBatteryLevelHeadphoneLeft
{
  return self->_hasBatteryLevelHeadphoneLeft;
}

- (NSNumber)batteryLevelHeadphoneLeft
{
  return self->_batteryLevelHeadphoneLeft;
}

- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneRight = a3;
}

- (BOOL)hasBatteryLevelHeadphoneRight
{
  return self->_hasBatteryLevelHeadphoneRight;
}

- (NSNumber)batteryLevelHeadphoneRight
{
  return self->_batteryLevelHeadphoneRight;
}

- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneCase = a3;
}

- (BOOL)hasBatteryLevelHeadphoneCase
{
  return self->_hasBatteryLevelHeadphoneCase;
}

- (NSNumber)batteryLevelHeadphoneCase
{
  return self->_batteryLevelHeadphoneCase;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
}

- (void)setHasProductID:(BOOL)a3
{
  self->_hasProductID = a3;
}

- (BOOL)hasProductID
{
  return self->_hasProductID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (AFBTEvent)initWithMetadata:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AFBTEvent;
  v5 = [(AFBTEvent *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kAFBTEventDeviceTypeKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = [v6 integerValue];
    }
    else {
      int v7 = 0;
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"kAFBTEventAddressKey"];
    address = v5->_address;
    v5->_address = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"kAFBTEventNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"kAFBTEventProductIdKey"];
    productID = v5->_productID;
    v5->_productID = (NSNumber *)v12;

    v14 = [v4 objectForKeyedSubscript:@"kAFBTEventProductIdKey"];
    v5->_hasProductID = v14 != 0;

    v15 = [v4 objectForKeyedSubscript:@"kAFBTEventStartingKey"];
    v5->_starting = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:@"kAFBTEventStartingKey"];
    v5->_hasStarting = v16 != 0;

    v5->_deviceType = v7;
    uint64_t v17 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelHeadphoneCaseKey"];
    batteryLevelHeadphoneCase = v5->_batteryLevelHeadphoneCase;
    v5->_batteryLevelHeadphoneCase = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelHeadphoneRightKey"];
    batteryLevelHeadphoneRight = v5->_batteryLevelHeadphoneRight;
    v5->_batteryLevelHeadphoneRight = (NSNumber *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelHeadphoneLeftKey"];
    batteryLevelHeadphoneLeft = v5->_batteryLevelHeadphoneLeft;
    v5->_batteryLevelHeadphoneLeft = (NSNumber *)v21;

    v23 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelAppleAudioDeviceKey"];
    v5->_appleAudioDevice = [v23 BOOLValue];

    v24 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelUserWearingKey"];
    v5->_userWearing = [v24 BOOLValue];

    v25 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelHeadphoneRightKey"];
    v5->_hasBatteryLevelHeadphoneRight = v25 != 0;

    v26 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelHeadphoneLeftKey"];
    v5->_hasBatteryLevelHeadphoneLeft = v26 != 0;

    v27 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelAppleAudioDeviceKey"];
    v5->_hasAppleAudioDevice = v27 != 0;

    v28 = [v4 objectForKeyedSubscript:@"kAFBTEventBatteryLevelUserWearingKey"];
    v5->_hasUserWearing = v28 != 0;
  }
  return v5;
}

@end