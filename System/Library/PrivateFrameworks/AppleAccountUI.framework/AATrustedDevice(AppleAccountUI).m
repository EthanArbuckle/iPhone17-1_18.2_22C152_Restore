@interface AATrustedDevice(AppleAccountUI)
- (id)_deviceLocatorKey;
- (id)aaui_localizedDeviceLocatorLabel;
@end

@implementation AATrustedDevice(AppleAccountUI)

- (id)_deviceLocatorKey
{
  v1 = NSString;
  v2 = [a1 deviceQualifiedClass];
  v3 = [v2 uppercaseString];
  v4 = [v1 stringWithFormat:@"DEVICE_LOCATOR_%@", v3];

  return v4;
}

- (id)aaui_localizedDeviceLocatorLabel
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [a1 _deviceLocatorKey];
  v4 = [v2 localizedStringForKey:@"DEVICE_LOCATOR_UNKNOWN" value:0 table:0];
  v5 = [v2 localizedStringForKey:v3 value:v4 table:0];

  return v5;
}

@end