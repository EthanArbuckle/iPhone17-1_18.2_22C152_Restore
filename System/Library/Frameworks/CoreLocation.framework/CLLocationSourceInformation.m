@interface CLLocationSourceInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isProducedByAccessory;
- (BOOL)isSimulatedBySoftware;
- (CLLocationSourceInformation)initWithCoder:(id)a3;
- (CLLocationSourceInformation)initWithSoftwareSimulationState:(BOOL)isSoftware andExternalAccessoryState:(BOOL)isAccessory;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLLocationSourceInformation

- (BOOL)isSimulatedBySoftware
{
  return self->isSimulatedBySoftware;
}

- (CLLocationSourceInformation)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLLocationSourceInformation;
  v4 = [(CLLocationSourceInformation *)&v6 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      v4->isSimulatedBySoftware = [a3 decodeBoolForKey:@"kCLLocationCodingKeyFromSoftwareSimulator"];
      v4->isProducedByAccessory = [a3 decodeBoolForKey:@"kCLLocationCodingKeyFromExternalAccessory"];
    }
    else
    {
      [a3 decodeValueOfObjCType:"B" at:&v4->isSimulatedBySoftware];
      [a3 decodeValueOfObjCType:"B" at:&v4->isProducedByAccessory];
    }
  }
  return v4;
}

- (CLLocationSourceInformation)initWithSoftwareSimulationState:(BOOL)isSoftware andExternalAccessoryState:(BOOL)isAccessory
{
  v7.receiver = self;
  v7.super_class = (Class)CLLocationSourceInformation;
  result = [(CLLocationSourceInformation *)&v7 init];
  if (result)
  {
    result->isSimulatedBySoftware = isSoftware;
    result->isProducedByAccessory = isAccessory;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeBool:self->isSimulatedBySoftware forKey:@"kCLLocationCodingKeyFromSoftwareSimulator"];
    BOOL isProducedByAccessory = self->isProducedByAccessory;
    [a3 encodeBool:isProducedByAccessory forKey:@"kCLLocationCodingKeyFromExternalAccessory"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"B" at:&self->isSimulatedBySoftware];
    [a3 encodeValueOfObjCType:"B" at:&self->isProducedByAccessory];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL isSimulatedBySoftware = self->isSimulatedBySoftware;
  BOOL isProducedByAccessory = self->isProducedByAccessory;

  return (id)[v4 initWithSoftwareSimulationState:isSimulatedBySoftware andExternalAccessoryState:isProducedByAccessory];
}

- (BOOL)isProducedByAccessory
{
  return self->isProducedByAccessory;
}

@end