@interface HeadphoneReplayDevice
- (BOOL)isServiceSupported:(unsigned int)a3;
- (CBProductInfo)productInfo;
- (NSString)name;
- (float)batteryLevelCase;
- (float)batteryLevelLeft;
- (float)batteryLevelMain;
- (float)batteryLevelRight;
- (unsigned)accessorySettingFeatureBitMask;
- (unsigned)deviceColor;
- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3;
- (void)setBatteryLevelCase:(float)a3;
- (void)setBatteryLevelLeft:(float)a3;
- (void)setBatteryLevelMain:(float)a3;
- (void)setBatteryLevelRight:(float)a3;
- (void)setDeviceColor:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setProductInfo:(id)a3;
@end

@implementation HeadphoneReplayDevice

- (NSString)name
{
  v2 = self;
  uint64_t v6 = HeadphoneReplayDevice.name.getter();
  uint64_t v7 = v3;

  id v8 = (id)MEMORY[0x253385EB0](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  v5 = self;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneReplayDevice.name.setter();
}

- (unsigned)accessorySettingFeatureBitMask
{
  v2 = self;
  unsigned int v5 = HeadphoneReplayDevice.accessorySettingFeatureBitMask.getter();

  return v5;
}

- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.accessorySettingFeatureBitMask.setter(a3);
}

- (unsigned)deviceColor
{
  v2 = self;
  unsigned int v5 = HeadphoneReplayDevice.deviceColor.getter();

  return v5;
}

- (void)setDeviceColor:(unsigned int)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.deviceColor.setter(a3);
}

- (CBProductInfo)productInfo
{
  v2 = self;
  id v5 = HeadphoneReplayDevice.productInfo.getter();

  return (CBProductInfo *)v5;
}

- (void)setProductInfo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneReplayDevice.productInfo.setter(a3);
}

- (float)batteryLevelMain
{
  v2 = self;
  float v5 = HeadphoneReplayDevice.batteryLevelMain.getter();

  return v5;
}

- (void)setBatteryLevelMain:(float)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.batteryLevelMain.setter();
}

- (float)batteryLevelCase
{
  v2 = self;
  float v5 = HeadphoneReplayDevice.batteryLevelCase.getter();

  return v5;
}

- (void)setBatteryLevelCase:(float)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.batteryLevelCase.setter();
}

- (float)batteryLevelLeft
{
  v2 = self;
  float v5 = HeadphoneReplayDevice.batteryLevelLeft.getter();

  return v5;
}

- (void)setBatteryLevelLeft:(float)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.batteryLevelLeft.setter();
}

- (float)batteryLevelRight
{
  v2 = self;
  float v5 = HeadphoneReplayDevice.batteryLevelRight.getter();

  return v5;
}

- (void)setBatteryLevelRight:(float)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.batteryLevelRight.setter();
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  uint64_t v3 = self;
  HeadphoneReplayDevice.isServiceSupported(_:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void).cxx_destruct
{
}

@end