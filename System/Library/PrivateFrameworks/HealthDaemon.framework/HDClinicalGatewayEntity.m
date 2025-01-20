@interface HDClinicalGatewayEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDClinicalGatewayEntity

+ (id)databaseTable
{
  return @"clinical_gateways";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_12;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"external_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v5 = @"country";
  if ([v4 isEqualToString:@"country"]
    || (v5 = @"fhirVersion", [v4 isEqualToString:@"fhirVersion"]))
  {
    v6 = NSString;
    v7 = [a1 disambiguatedDatabaseTable];
    v8 = [v6 stringWithFormat:@"json_extract(%@.raw_content, '$.%@')", v7, v5];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDClinicalGatewayEntity;
    v8 = objc_msgSendSuper2(&v10, sel_disambiguatedSQLForProperty_, v4);
  }

  return v8;
}

@end