@interface HDOriginalSignedClinicalDataRecordEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)allColumns;
+ (id)allProperties;
+ (id)checkConstraints;
+ (id)databaseTable;
+ (id)entityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)existingEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDOriginalSignedClinicalDataRecordEntity

+ (id)databaseTable
{
  return @"original_signed_clinical_data_records";
}

+ (id)allColumns
{
  return &unk_1F17EAD10;
}

+ (id)allProperties
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F17EAD28];
  [v2 addObject:@"gateway.external_id"];

  return v2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_95;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"gateway.external_id"])
  {
    v5 = (void *)MEMORY[0x1E4F65D38];
    v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *MEMORY[0x1E4F65C70];
    v9 = [v5 leftJoinClauseFromTable:v6 toTargetEntity:v7 as:@"account" localReference:@"account_id" targetKey:*MEMORY[0x1E4F65C70]];

    v10 = [MEMORY[0x1E4F65D38] leftJoinClauseFromTable:@"account" toTargetEntity:objc_opt_class() as:@"gateway" localReference:@"gateway_id" targetKey:v8];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, v10, 0);
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___HDOriginalSignedClinicalDataRecordEntity;
    v11 = objc_msgSendSuper2(&v13, sel_joinClausesForProperty_, v4);
  }

  return v11;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = +[HDHealthEntity defaultForeignKey];
  v5 = @"account_id";
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"account_id";
  v4[1] = @"uniqueness_checksum";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)checkConstraints
{
  v2 = [MEMORY[0x1E4F65D70] checkConstraintWithSQL:@"(raw_content IS NULL AND deleted == 1) OR (raw_content IS NOT NULL AND deleted == 0)"];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];

  return v3;
}

+ (id)existingEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v14 = 0;
  v9 = [a1 entityWithSyncIdentifier:v8 database:a4 error:&v14];
  id v10 = v14;
  v11 = v10;
  if (v9)
  {
    id v12 = v9;
  }
  else if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 118, @"original signed clinical data record with sync identifier %@ not found", v8);
  }

  return v9;
}

+ (id)entityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = [v8 predicateWithProperty:@"sync_identifier" equalToValue:a3];
  v11 = [a1 anyInDatabase:v9 predicate:v10 error:a5];

  if (v11) {
    id v12 = v11;
  }

  return v11;
}

@end