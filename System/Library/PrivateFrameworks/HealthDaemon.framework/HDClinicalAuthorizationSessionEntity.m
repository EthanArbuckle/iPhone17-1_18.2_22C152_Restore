@interface HDClinicalAuthorizationSessionEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)checkConstraints;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (int64_t)protectionClass;
@end

@implementation HDClinicalAuthorizationSessionEntity

+ (id)databaseTable
{
  return @"clinical_authorization_sessions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_37;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"gateway_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[1] = @"account_id";
  v7[0] = v2;
  v3 = +[HDHealthEntity defaultForeignKey];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)checkConstraints
{
  v2 = [MEMORY[0x1E4F65D70] checkConstraintWithSQL:@"(account_id IS NULL AND gateway_id IS NOT NULL) OR (account_id IS NOT NULL AND gateway_id IS NULL)"];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, 0);

  return v3;
}

+ (id)joinClausesForProperty:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = v4;
  v7 = self;
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v29[0] = @"account.identifier";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v10 = (void *)[v8 initWithArray:v9];

  LOBYTE(v9) = [v10 containsObject:v6];
  v11 = (void *)MEMORY[0x1E4F65C70];
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E4F65D38];
    v13 = [v7 disambiguatedDatabaseTable];
    v14 = [v12 innerJoinClauseFromTable:v13 toTargetEntity:objc_opt_class() as:@"account" localReference:@"account_id" targetKey:*v11];

    id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v14, 0);
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  [v5 unionSet:v15];
  id v16 = v6;
  v17 = self;
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v29[0] = @"gateway.external_id";
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v20 = (void *)[v18 initWithArray:v19];

  LOBYTE(v19) = [v20 containsObject:v16];
  if (v19)
  {
    v21 = (void *)MEMORY[0x1E4F65D38];
    v22 = [v17 disambiguatedDatabaseTable];
    v23 = [v21 innerJoinClauseFromTable:v22 toTargetEntity:objc_opt_class() as:@"gateway" localReference:@"gateway_id" targetKey:*v11];

    id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v23, 0);
  }
  else
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  [v5 unionSet:v24];
  if ([v5 count])
  {
    id v25 = v5;
  }
  else
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___HDClinicalAuthorizationSessionEntity;
    objc_msgSendSuper2(&v28, sel_joinClausesForProperty_, v16);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

@end