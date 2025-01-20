@interface HDNotificationCategorySampleSyncEntity
+ (id)_predicateForCategoryTypesToSync;
+ (id)syncEntityIdentifier;
+ (int)nanoSyncObjectType;
@end

@implementation HDNotificationCategorySampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 49;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:55];
}

+ (id)_predicateForCategoryTypesToSync
{
  v2 = +[HDCategorySampleSyncEntity _categoryTypesDerivedFromQuantitySamples]();
  v3 = HDSampleEntityPredicateForDataTypes(v2);

  return v3;
}

@end