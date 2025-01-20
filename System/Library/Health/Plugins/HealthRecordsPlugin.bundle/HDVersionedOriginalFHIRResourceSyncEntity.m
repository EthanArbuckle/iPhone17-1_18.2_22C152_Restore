@interface HDVersionedOriginalFHIRResourceSyncEntity
+ (BOOL)_shouldInsertReceivedCodableResource:(id)a3;
+ (id)_syncObjectsGenerationPredicate;
+ (id)syncEntityIdentifier;
@end

@implementation HDVersionedOriginalFHIRResourceSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:8];
}

+ (id)_syncObjectsGenerationPredicate
{
  return 0;
}

+ (BOOL)_shouldInsertReceivedCodableResource:(id)a3
{
  return 1;
}

@end