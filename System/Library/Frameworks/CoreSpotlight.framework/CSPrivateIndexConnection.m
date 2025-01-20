@interface CSPrivateIndexConnection
+ (id)connectionUUID:(id)a3;
+ (id)serviceName;
@end

@implementation CSPrivateIndexConnection

+ (id)serviceName
{
  return @"com.apple.corespotlightservice";
}

+ (id)connectionUUID:(id)a3
{
  return CSPrivateUUID(a3);
}

@end