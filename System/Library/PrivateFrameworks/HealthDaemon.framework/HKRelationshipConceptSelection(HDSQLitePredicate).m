@interface HKRelationshipConceptSelection(HDSQLitePredicate)
- (id)predicateWithProfile:()HDSQLitePredicate;
@end

@implementation HKRelationshipConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F65D68];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setEntityClass:objc_opt_class()];
  v7 = [a1 selection];
  v8 = [v7 predicateWithProfile:v5];

  [v6 setPredicate:v8];
  uint64_t v9 = [a1 direction];
  v10 = HDSimpleGraphDatabaseRelationshipEntityPropertySubjectIdentifier;
  if (v9 != 1) {
    v10 = &HDSimpleGraphDatabaseRelationshipEntityPropertyObjectIdentifier;
  }
  v11 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:*v10];
  v12 = (void *)MEMORY[0x1E4F65D00];
  v21[0] = *MEMORY[0x1E4F65C70];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v14 = [v12 predicateWithProperty:v11 comparisonType:7 subqueryDescriptor:v6 subqueryProperties:v13];

  if ([a1 type] == -1)
  {
    id v18 = v14;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F65D08];
    v16 = HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType([a1 type]);
    v20[0] = v16;
    v20[1] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v18 = [v15 predicateMatchingAllPredicates:v17];
  }

  return v18;
}

@end