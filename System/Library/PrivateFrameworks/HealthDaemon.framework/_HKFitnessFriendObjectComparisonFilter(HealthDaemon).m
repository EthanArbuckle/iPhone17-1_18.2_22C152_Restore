@interface _HKFitnessFriendObjectComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKFitnessFriendObjectComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v3 = a1;
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A398]];

  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    v13 = a2;
    v14 = v3;
    uint64_t v15 = 22;
    goto LABEL_8;
  }
  if (!v3) {
    goto LABEL_23;
  }
  if ([v3 operatorType] != 4)
  {
    if ([v3 operatorType] == 5)
    {
      v16 = [v3 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:sel__predicateForFriendUUID object:v3 file:@"_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m" lineNumber:34 description:@"Friend UUID should be NSData"];
      }
      v8 = [v3 value];
      v9 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v8);
      v18 = HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();
      v3 = [MEMORY[0x1E4F65D08] negatedPredicate:v18];

      goto LABEL_22;
    }
    if ([v3 operatorType] == 10)
    {
      v19 = [v3 value];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = [v3 value];
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        if (v21)
        {
LABEL_18:
          v22 = [v3 value];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();
          v24 = [v3 value];
          v8 = v24;
          if ((v23 & 1) == 0)
          {
            uint64_t v25 = [v24 allObjects];

            v8 = (void *)v25;
          }

          v9 = objc_msgSend(v8, "hk_map:", &__block_literal_global_126);
          uint64_t v10 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v9];
          goto LABEL_21;
        }
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:sel__predicateForFriendUUID object:v3 file:@"_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m" lineNumber:42 description:@"Friend UUID should be NSArray or NSSet"];
      }

      goto LABEL_18;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = v11;
    v13 = sel__predicateForFriendUUID;
    v14 = v3;
    uint64_t v15 = 51;
LABEL_8:
    [v11 handleFailureInMethod:v13 object:v14 file:@"_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m" lineNumber:v15 description:@"Unreachable code has been executed"];

    v3 = [MEMORY[0x1E4F65D58] falsePredicate];
    goto LABEL_23;
  }
  v6 = [v3 value];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:sel__predicateForFriendUUID object:v3 file:@"_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m" lineNumber:29 description:@"Friend UUID should be NSData"];
  }
  v8 = [v3 value];
  v9 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v8);
  uint64_t v10 = HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();
LABEL_21:
  v3 = (void *)v10;
LABEL_22:

LABEL_23:

  return v3;
}

@end