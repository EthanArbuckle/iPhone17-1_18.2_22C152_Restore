@interface HKMCPregnancyStateQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isRunningForMaintenance;
- (HKMCPregnancyStateQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRunningForMaintenance:(BOOL)a3;
@end

@implementation HKMCPregnancyStateQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setIsRunningForMaintenance:", -[HKMCPregnancyStateQueryConfiguration isRunningForMaintenance](self, "isRunningForMaintenance"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCPregnancyStateQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_isRunningForMaintenance = [v4 decodeBoolForKey:@"IsRunningForMaintenance"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRunningForMaintenance, @"IsRunningForMaintenance", v5.receiver, v5.super_class);
}

- (BOOL)isRunningForMaintenance
{
  return self->_isRunningForMaintenance;
}

- (void)setIsRunningForMaintenance:(BOOL)a3
{
  self->_isRunningForMaintenance = a3;
}

@end