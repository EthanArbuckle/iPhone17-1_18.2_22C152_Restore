@interface HDSignedClinicalDataIssuerEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)allProperties;
+ (id)databaseTable;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
@end

@implementation HDSignedClinicalDataIssuerEntity

+ (id)databaseTable
{
  return @"signed_clinical_data_issuer";
}

+ (id)allProperties
{
  return &unk_1F17EA650;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_78;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

@end