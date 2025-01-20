@interface _HKConceptIndexableComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKConceptIndexableComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v2 setEntityClass:objc_opt_class()];
  if (a1)
  {
    if ([a1 operatorType] == 4)
    {
      v3 = [a1 value];
      v4 = [a1 keyPath];
      v12[0] = v4;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      a1 = HDConceptIndexEntityPredicateForConceptIdentifier(v3, v5);

LABEL_6:
      goto LABEL_8;
    }
    if ([a1 operatorType] == 10)
    {
      v3 = [a1 value];
      v4 = [a1 keyPath];
      a1 = HDConceptIndexEntityPredicateForConceptIdentifiers(v3, v4);
      goto LABEL_6;
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:sel__conceptIndexPredicate object:a1 file:@"_HKConceptIndexableComparisonFilter+HealthDaemon.m" lineNumber:42 description:@"Unreachable code has been executed"];

    a1 = [MEMORY[0x1E4F65D58] falsePredicate];
  }
LABEL_8:
  [v2 setPredicate:a1];

  v7 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v11 = 0x1F173B420;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [v7 predicateWithProperty:@"data_id" comparisonType:7 subqueryDescriptor:v2 subqueryProperties:v8];

  return v9;
}

@end