@interface HKAttributeConceptSelection(HDSQLitePredicate)
- (id)predicateWithProfile:()HDSQLitePredicate;
@end

@implementation HKAttributeConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType([a1 type], 1);
  v3 = [a1 value];
  [a1 operatorType];
  uint64_t v4 = HDSQLiteComparisonTypeForPredicateOperator();
  v5 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v3, v4);
  v6 = (void *)MEMORY[0x1E4F65D08];
  v10[0] = v2;
  v10[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [v6 predicateMatchingAllPredicates:v7];

  return v8;
}

@end