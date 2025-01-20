@interface HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration
- (HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration)initWithType:(id)a3 format:(id)a4 values:(id)a5 settlingTime:(id)a6;
- (NSArray)values;
- (NSNumber)settlingTime;
- (NSString)format;
- (NSString)type;
@end

@implementation HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settlingTime, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (NSNumber)settlingTime
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)format
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration)initWithType:(id)a3 format:(id)a4 values:(id)a5 settlingTime:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration;
  v15 = [(HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_format, a4);
    objc_storeStrong((id *)&v16->_values, a5);
    objc_storeStrong((id *)&v16->_settlingTime, a6);
  }

  return v16;
}

@end