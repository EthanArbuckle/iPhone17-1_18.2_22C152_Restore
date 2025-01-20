@interface HKRemoteFeatureAvailabilityDeviceClassEqualsRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (void)processUserInfo:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityDeviceClassEqualsRule

+ (id)ruleIdentifier
{
  return @"DeviceClassEquals";
}

- (void)processUserInfo:(id)a3
{
  objc_msgSend(a3, "hk_safeStringIfExistsForKeyPath:error:", @"DeviceClass", 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceClass = self->_deviceClass;
  self->_deviceClass = v4;

  MEMORY[0x1F41817F8](v4, deviceClass);
}

- (BOOL)evaluate
{
  if (!self->_deviceClass) {
    return 0;
  }
  v2 = self;
  v3 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v4 = [v3 currentDeviceClass];
  LOBYTE(v2) = [v4 isEqualToString:v2->_deviceClass];

  return (char)v2;
}

- (void).cxx_destruct
{
}

@end