@interface ThermalCritical
+ (id)description;
+ (id)profileFriendlyName;
- (ThermalCritical)init;
@end

@implementation ThermalCritical

+ (id)description
{
  return @"The system behaves as though there is significant thermal impact. At this state, the app should reduce usage of the CPU, GPU and any I/O to minimal levels for user interactions.";
}

+ (id)profileFriendlyName
{
  return @"Critical";
}

- (ThermalCritical)init
{
  v3.receiver = self;
  v3.super_class = (Class)ThermalCritical;
  return [(ThermalNominal *)&v3 initWithThermalLevel:3];
}

@end