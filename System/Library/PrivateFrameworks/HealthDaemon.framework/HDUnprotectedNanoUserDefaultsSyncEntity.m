@interface HDUnprotectedNanoUserDefaultsSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDUnprotectedNanoUserDefaultsSyncEntity

+ (int64_t)category
{
  return 1;
}

+ (int)nanoSyncObjectType
{
  return 16;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:16];
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

@end