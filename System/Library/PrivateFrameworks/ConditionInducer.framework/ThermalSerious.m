@interface ThermalSerious
+ (id)description;
+ (id)profileFriendlyName;
- (ThermalSerious)init;
@end

@implementation ThermalSerious

+ (id)description
{
  return @"The system behaves as though under a high thermal state. At this state, the app should reduce usage of the CPU, GPU and any I/O (such as networking or Bluetooth).";
}

+ (id)profileFriendlyName
{
  return @"Serious";
}

- (ThermalSerious)init
{
  v3.receiver = self;
  v3.super_class = (Class)ThermalSerious;
  return [(ThermalNominal *)&v3 initWithThermalLevel:2];
}

@end