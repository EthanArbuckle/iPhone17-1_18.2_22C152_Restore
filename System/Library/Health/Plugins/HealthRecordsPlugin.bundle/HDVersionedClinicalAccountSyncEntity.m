@interface HDVersionedClinicalAccountSyncEntity
+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3;
+ (id)_syncObjectsGenerationPredicate;
+ (id)syncEntityIdentifier;
@end

@implementation HDVersionedClinicalAccountSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:5];
}

+ (id)_syncObjectsGenerationPredicate
{
  return 0;
}

+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3
{
  return 1;
}

@end