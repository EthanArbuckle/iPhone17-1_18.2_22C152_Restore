@interface CSManagedIndexConnection
+ (id)connectionUUID:(id)a3;
+ (id)serviceName;
@end

@implementation CSManagedIndexConnection

+ (id)connectionUUID:(id)a3
{
  return CSManagedUUID(a3);
}

+ (id)serviceName
{
  return @"com.apple.managedcorespotlightd";
}

@end