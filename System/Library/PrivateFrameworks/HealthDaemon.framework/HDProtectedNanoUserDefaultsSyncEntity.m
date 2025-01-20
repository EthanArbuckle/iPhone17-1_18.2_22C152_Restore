@interface HDProtectedNanoUserDefaultsSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDProtectedNanoUserDefaultsSyncEntity

+ (int64_t)category
{
  return 105;
}

+ (int)nanoSyncObjectType
{
  return 17;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:17];
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

@end