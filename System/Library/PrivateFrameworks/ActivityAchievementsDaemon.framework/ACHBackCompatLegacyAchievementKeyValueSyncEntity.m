@interface ACHBackCompatLegacyAchievementKeyValueSyncEntity
+ (BOOL)setLegacyDataStoreValuesWithDictionary:(id)a3 profile:(id)a4 error:(id *)a5;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation ACHBackCompatLegacyAchievementKeyValueSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)[MEMORY[0x263F433C8] identifierWithSchema:0 entity:20];
}

+ (BOOL)setLegacyDataStoreValuesWithDictionary:(id)a3 profile:(id)a4 error:(id *)a5
{
  return [MEMORY[0x263F432E0] setValuesWithDictionary:a3 domain:*MEMORY[0x263F43030] category:106 profile:a4 error:a5];
}

+ (int64_t)category
{
  return 106;
}

+ (int)nanoSyncObjectType
{
  return 20;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return a3 < 8;
}

@end