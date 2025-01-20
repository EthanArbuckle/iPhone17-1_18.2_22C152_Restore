@interface HDUserCharacteristicSyncEntity
+ (BOOL)supportsSpeculativeNanoSyncChanges;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4;
@end

@implementation HDUserCharacteristicSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)category
{
  return 101;
}

+ (int)nanoSyncObjectType
{
  return 6;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:8];
}

+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4
{
  objc_msgSend(a4, "userCharacteristicsManager", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:]((uint64_t)v4, 1, 0);
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

@end