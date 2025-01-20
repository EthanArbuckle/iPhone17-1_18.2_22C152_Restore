@interface HDVersionedClinicalDeletedAccountSyncEntity
+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3;
+ (id)syncEntityIdentifier;
@end

@implementation HDVersionedClinicalDeletedAccountSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:6];
}

+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3
{
  return 1;
}

@end