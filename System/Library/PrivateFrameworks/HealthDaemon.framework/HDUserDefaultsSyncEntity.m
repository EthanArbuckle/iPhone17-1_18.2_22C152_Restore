@interface HDUserDefaultsSyncEntity
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDUserDefaultsSyncEntity

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 41;
}

+ (int64_t)category
{
  return 102;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:44];
}

@end