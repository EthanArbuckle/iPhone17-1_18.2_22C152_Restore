@interface NSPredicate(CDLogging)
- (id)cd_sanitizeForLogging;
@end

@implementation NSPredicate(CDLogging)

- (id)cd_sanitizeForLogging
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v12 = a1;
    v10 = v12;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_20;
    }
    v13 = [v12 leftExpression];
    int v14 = objc_msgSend(v13, "cd_containsSensitiveKeyPath");

    if (v14)
    {
      v15 = [MEMORY[0x1E4F28C68] expressionForConstantValue:@"<redacted>"];
      id v16 = objc_alloc(MEMORY[0x1E4F28B98]);
      v17 = [v10 leftExpression];
      uint64_t v18 = [v10 comparisonPredicateModifier];
      uint64_t v19 = [v10 predicateOperatorType];
      uint64_t v20 = [v10 options];
      v21 = v16;
      v22 = v17;
      v23 = v15;
    }
    else
    {
      v24 = [v10 rightExpression];
      int v25 = objc_msgSend(v24, "cd_containsSensitiveKeyPath");

      if (!v25)
      {
        id v27 = v10;
        goto LABEL_19;
      }
      v15 = [MEMORY[0x1E4F28C68] expressionForConstantValue:@"<redacted>"];
      id v26 = objc_alloc(MEMORY[0x1E4F28B98]);
      v17 = [v10 rightExpression];
      uint64_t v18 = [v10 comparisonPredicateModifier];
      uint64_t v19 = [v10 predicateOperatorType];
      uint64_t v20 = [v10 options];
      v21 = v26;
      v22 = v15;
      v23 = v17;
    }
    id v27 = (id)[v21 initWithLeftExpression:v22 rightExpression:v23 modifier:v18 type:v19 options:v20];

LABEL_19:
    v10 = v27;
    goto LABEL_20;
  }
  id v2 = a1;
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = objc_msgSend(v2, "subpredicates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "cd_sanitizeForLogging");
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v2, "compoundPredicateType"), v3);
LABEL_20:
  return v10;
}

@end