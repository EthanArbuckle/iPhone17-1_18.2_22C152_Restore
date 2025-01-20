@interface _DKMetadataHomeKitScene
+ (id)actionSetName;
+ (id)actionSetType;
+ (id)actionSetUUID;
+ (id)associatedAccessoryUUIDs;
+ (id)clientName;
+ (id)homeOccupancy;
+ (id)homeUUID;
+ (id)sceneName;
+ (id)source;
@end

@implementation _DKMetadataHomeKitScene

+ (id)homeUUID
{
  return @"homekit.homeUUID";
}

+ (id)actionSetUUID
{
  return @"homekit.actionSetUUID";
}

+ (id)actionSetName
{
  return @"homekit.actionSetName";
}

+ (id)actionSetType
{
  return @"homekit.actionSetType";
}

+ (id)clientName
{
  return @"homekit.clientName";
}

+ (id)sceneName
{
  return @"homekit.sceneName";
}

+ (id)source
{
  return @"homekit.source";
}

+ (id)associatedAccessoryUUIDs
{
  return @"homekit.associatedAccessoryUUIDs";
}

+ (id)homeOccupancy
{
  return @"homekit.homeOccupancy";
}

@end