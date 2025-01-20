@interface _DKMetadataHomeKitAccessoryControl
+ (id)accessoryName;
+ (id)accessoryState;
+ (id)accessoryUUID;
+ (id)characteristicType;
+ (id)clientName;
+ (id)eligibleForSuggestions;
+ (id)homeOccupancy;
+ (id)homeUUID;
+ (id)serviceName;
+ (id)serviceType;
+ (id)serviceUUID;
+ (id)source;
@end

@implementation _DKMetadataHomeKitAccessoryControl

+ (id)homeUUID
{
  return @"homekit.homeUUID";
}

+ (id)accessoryUUID
{
  return @"homekit.accessoryUUID";
}

+ (id)serviceUUID
{
  return @"homekit.serviceUUID";
}

+ (id)accessoryName
{
  return @"homekit.accessoryName";
}

+ (id)serviceName
{
  return @"homekit.serviceName";
}

+ (id)serviceType
{
  return @"homekit.serviceType";
}

+ (id)characteristicType
{
  return @"homekit.characteristicType";
}

+ (id)clientName
{
  return @"homekit.clientName";
}

+ (id)source
{
  return @"homekit.source";
}

+ (id)accessoryState
{
  return @"homekit.accessoryState";
}

+ (id)homeOccupancy
{
  return @"homekit.homeOccupancy";
}

+ (id)eligibleForSuggestions
{
  return @"homekit.eligibleForSuggestions";
}

@end