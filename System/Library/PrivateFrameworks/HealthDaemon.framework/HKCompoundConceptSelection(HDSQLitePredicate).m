@interface HKCompoundConceptSelection(HDSQLitePredicate)
- (id)predicateWithProfile:()HDSQLitePredicate;
@end

@implementation HKCompoundConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  id v5 = a3;
  v6 = [a1 selections];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HKCompoundConceptSelection_HDSQLitePredicate__predicateWithProfile___block_invoke;
  v16[3] = &unk_1E630CFB0;
  id v7 = v5;
  id v17 = v7;
  v8 = objc_msgSend(v6, "hk_map:", v16);

  uint64_t v9 = [a1 operationType];
  if (v9 == 2)
  {
    uint64_t v13 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v8];
LABEL_7:
    v12 = (void *)v13;
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v8];
    goto LABEL_7;
  }
  if (v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"HKCompoundConceptSelection+HDSQLitePredicate.m" lineNumber:35 description:@"Unreachable code has been executed"];

    v12 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F65D08];
    v11 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v8];
    v12 = [v10 negatedPredicate:v11];
  }
LABEL_9:

  return v12;
}

@end