@interface _HKStateOfMindComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKStateOfMindComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v3 = a1;
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A438]];

  if (v5)
  {
    if (!v3) {
      goto LABEL_25;
    }
    v6 = [v3 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:sel__predicateForReflectiveInterval object:v3 file:@"_HKStateOfMindComparisonFilter+HealthDaemon.m" lineNumber:39 description:@"Reflective interval should be NSInteger as an NSNumber"];
    }
    v8 = [v3 value];
    if ([v3 operatorType] == 4)
    {
      uint64_t v9 = [v8 integerValue];
      uint64_t v10 = 1;
    }
    else
    {
      if ([v3 operatorType] != 5)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:sel__predicateForReflectiveInterval object:v3 file:@"_HKStateOfMindComparisonFilter+HealthDaemon.m" lineNumber:50 description:@"Unreachable code has been executed"];

        uint64_t v16 = [MEMORY[0x1E4F65D58] falsePredicate];
        goto LABEL_24;
      }
      uint64_t v9 = [v8 integerValue];
      uint64_t v10 = 0;
    }
    uint64_t v16 = +[HDStateOfMindEntity predicateForReflectiveInterval:v9 equals:v10];
LABEL_24:
    v3 = (void *)v16;

    goto LABEL_25;
  }
  v11 = [v3 keyPath];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A440]];

  if (v12)
  {
    if (!v3) {
      goto LABEL_25;
    }
    v13 = [v3 value];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:sel__predicateForValence object:v3 file:@"_HKStateOfMindComparisonFilter+HealthDaemon.m" lineNumber:54 description:@"Valence should be double as an NSNumber"];
    }
    v8 = [v3 value];
    [v3 operatorType];
    uint64_t v15 = HDSQLiteComparisonTypeForPredicateOperator();
    [v8 doubleValue];
    uint64_t v16 = +[HDStateOfMindEntity predicateForValence:comparisonType:](HDStateOfMindEntity, "predicateForValence:comparisonType:", v15);
    goto LABEL_24;
  }
  v17 = [v3 keyPath];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2A430]];

  if (!v18)
  {
    v23 = [v3 keyPath];
    int v24 = [v23 isEqualToString:*MEMORY[0x1E4F2A428]];

    if (v24)
    {
      if (!v3) {
        goto LABEL_25;
      }
      v25 = [v3 value];
      objc_opt_class();
      char v26 = objc_opt_isKindOfClass();

      v27 = [v3 value];
      v8 = v27;
      if (v26)
      {
        uint64_t v16 = +[HDStateOfMindEntity predicateForDomain:](HDStateOfMindEntity, "predicateForDomain:", [v27 integerValue]);
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
      }
      else
      {
        v38 = [v3 value];
        objc_opt_class();
        char v39 = objc_opt_isKindOfClass();

        if ((v39 & 1) == 0)
        {
          v29 = [MEMORY[0x1E4F28B00] currentHandler];
          v30 = v29;
          v31 = sel__predicateForDomains;
          v32 = v3;
          uint64_t v33 = 80;
          goto LABEL_31;
        }
      }
      v36 = [v3 value];
      uint64_t v37 = +[HDStateOfMindEntity predicateForDomains:v36];
      goto LABEL_38;
    }
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = v29;
    v31 = a2;
    v32 = v3;
    uint64_t v33 = 33;
LABEL_31:
    [v29 handleFailureInMethod:v31 object:v32 file:@"_HKStateOfMindComparisonFilter+HealthDaemon.m" lineNumber:v33 description:@"Unreachable code has been executed"];

    v3 = [MEMORY[0x1E4F65D58] falsePredicate];
    goto LABEL_25;
  }
  if (!v3) {
    goto LABEL_25;
  }
  v19 = [v3 value];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  v21 = [v3 value];
  v8 = v21;
  if (v20)
  {
    uint64_t v16 = +[HDStateOfMindEntity predicateForLabel:](HDStateOfMindEntity, "predicateForLabel:", [v21 integerValue]);
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [v3 value];
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    if (v35) {
      goto LABEL_35;
    }
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = v29;
    v31 = sel__predicateForLabels;
    v32 = v3;
    uint64_t v33 = 69;
    goto LABEL_31;
  }

LABEL_35:
  v36 = [v3 value];
  uint64_t v37 = +[HDStateOfMindEntity predicateForLabels:v36];
LABEL_38:
  v3 = (void *)v37;

LABEL_25:

  return v3;
}

@end