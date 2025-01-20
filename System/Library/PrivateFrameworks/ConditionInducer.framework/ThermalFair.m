@interface ThermalFair
+ (id)description;
+ (id)profileFriendlyName;
- (ThermalFair)init;
@end

@implementation ThermalFair

+ (id)description
{
  return @"The system behaves as though under slightly elevated thermal state";
}

+ (id)profileFriendlyName
{
  return @"Fair";
}

- (ThermalFair)init
{
  v3.receiver = self;
  v3.super_class = (Class)ThermalFair;
  return [(ThermalNominal *)&v3 initWithThermalLevel:1];
}

@end