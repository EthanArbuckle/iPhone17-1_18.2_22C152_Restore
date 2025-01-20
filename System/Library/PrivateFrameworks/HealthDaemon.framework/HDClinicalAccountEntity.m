@interface HDClinicalAccountEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)checkConstraints;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
@end

@implementation HDClinicalAccountEntity

+ (id)databaseTable
{
  return @"clinical_accounts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 26;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_18;
}

+ (id)foreignKeys
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"credential_id";
  id v2 = objc_alloc(MEMORY[0x1E4F65D20]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *MEMORY[0x1E4F65C70];
  v5 = (void *)[v2 initWithEntityClass:v3 property:*MEMORY[0x1E4F65C70] deletionAction:3];
  v11[0] = v5;
  v10[1] = @"gateway_id";
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:v4 deletionAction:3];
  v11[1] = v6;
  v10[2] = @"signed_clinical_data_issuer_rowid";
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:objc_opt_class() property:v4 deletionAction:2];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)checkConstraints
{
  id v2 = [MEMORY[0x1E4F65D70] checkConstraintWithSQL:@"(gateway_id IS NOT NULL AND signed_clinical_data_issuer_rowid IS NULL) OR (gateway_id IS NULL AND signed_clinical_data_issuer_rowid IS NOT NULL)"];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)joinClausesForProperty:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v19[0] = @"gateway.external_id";
  v19[1] = @"gateway.last_reported_status";
  v19[2] = @"issuer.identifier";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v7 = (void *)[v5 initWithArray:v6];

  if ([v7 containsObject:v4])
  {
    v8 = (void *)MEMORY[0x1E4F65D38];
    v9 = [a1 disambiguatedDatabaseTable];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x1E4F65C70];
    v12 = [v8 leftJoinClauseFromTable:v9 toTargetEntity:v10 as:@"gateway" localReference:@"gateway_id" targetKey:*MEMORY[0x1E4F65C70]];

    v13 = (void *)MEMORY[0x1E4F65D38];
    v14 = [a1 disambiguatedDatabaseTable];
    v15 = [v13 leftJoinClauseFromTable:v14 toTargetEntity:objc_opt_class() as:@"issuer" localReference:@"signed_clinical_data_issuer_rowid" targetKey:v11];

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v12, v15, 0);
  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_METACLASS___HDClinicalAccountEntity;
    v16 = objc_msgSendSuper2(&v18, sel_joinClausesForProperty_, v4);
  }

  return v16;
}

@end