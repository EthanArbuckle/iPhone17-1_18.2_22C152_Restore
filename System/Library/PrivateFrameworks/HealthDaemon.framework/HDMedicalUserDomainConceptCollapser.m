@interface HDMedicalUserDomainConceptCollapser
+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4;
@end

@implementation HDMedicalUserDomainConceptCollapser

+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  self;
  v12 = [v10 protectedDatabase];
  v13 = [v11 UUID];

  v14 = HDDataEntityPredicateForDataUUID();
  v15 = +[HDSQLiteEntity anyInDatabase:v12 predicate:v14 error:a6];

  if (v15)
  {
    v16 = [v10 protectedDatabase];
    v17 = [v9 UUID];
    v18 = HDDataEntityPredicateForDataUUID();
    v19 = +[HDSQLiteEntity anyInDatabase:v16 predicate:v18 error:a6];

    if (v19) {
      BOOL v20 = +[HDMedicalUserDomainConceptMappingEntity migrateMappingsFromUserDomainConceptID:toUserDomainConceptID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "migrateMappingsFromUserDomainConceptID:toUserDomainConceptID:transaction:error:", [v15 persistentID], objc_msgSend(v19, "persistentID"), v10, a6);
    }
    else {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 categoryTypes];
  v8 = (void *)[v7 mutableCopy];

  id v9 = [v6 categoryTypes];

  objc_msgSend(v8, "hk_addUniqueObjectsFromArray:", v9);
  uint64_t v10 = [v8 count];
  id v11 = [v5 categoryTypes];
  uint64_t v12 = [v11 count];

  if (v10 == v12)
  {
    id v13 = v5;
  }
  else
  {
    id v13 = [v5 medicalConceptByReplacingCategoryTypes:v8];
  }
  v14 = v13;

  return v14;
}

@end