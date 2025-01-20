@interface NSComparisonPredicate(SQLitePredicate)
- (id)hd_sqlPredicateForSelect;
@end

@implementation NSComparisonPredicate(SQLitePredicate)

- (id)hd_sqlPredicateForSelect
{
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  unint64_t v4 = [a1 predicateOperatorType];
  if (v4 >= 6 && v4 != 10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported operator type in comparison expression: %@", a1 format];
  }
  if ([v2 expressionType] == 3) {
    [v2 keyPath];
  }
  else {
  v5 = [v2 description];
  }
  if ([v3 expressionType])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Expected constant value in right side of comparison expression: %@", a1 format];
    v6 = 0;
  }
  else
  {
    v6 = [v3 constantValue];
  }
  id v7 = v6;
  id v8 = v5;
  if (!a1)
  {
    v28 = 0;
    v11 = v7;
    goto LABEL_60;
  }
  if (qword_1EBA18CA8 != -1) {
    dispatch_once(&qword_1EBA18CA8, &__block_literal_global_139);
  }
  v9 = [(id)_MergedGlobals_211 objectForKeyedSubscript:v8];
  v10 = v9;
  v11 = v7;
  if (!v9) {
    goto LABEL_53;
  }
  v39 = v3;
  id v38 = v7;
  v12 = 0;
  if (![v9 count])
  {
    v11 = v7;
LABEL_43:
    uint64_t v26 = [v10 count];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    if (v26 == 1 && v12) {
      [MEMORY[0x1E4F1CA00] raise:v27, @"Expected constant value of type %@, received %@", v12, v11 format];
    }
    else {
      [MEMORY[0x1E4F1CA00] raise:v27, @"Constant value %@ not matching any expected type", v11, v36 format];
    }
    v3 = v39;
    id v7 = v38;

    v28 = 0;
    goto LABEL_59;
  }
  uint64_t v13 = 0;
  v37 = @"blob";
  v11 = v7;
  while (2)
  {
    v14 = [v10 objectAtIndexedSubscript:v13];
    int v15 = [v14 unsignedIntegerValue];

    switch(v15)
    {
      case 0:
        goto LABEL_51;
      case 1:
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          uint64_t v20 = _HDSQLiteValueForDate();

          v11 = (void *)v20;
        }
        goto LABEL_25;
      case 2:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = @"double";
LABEL_50:
          v37 = v29;
          goto LABEL_51;
        }
        objc_opt_class();
        v16 = @"double";
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_32;
        }
        double v40 = 0.0;
        v17 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
        if (![v17 scanDouble:&v40] || (objc_msgSend(v17, "isAtEnd") & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        uint64_t v34 = [NSNumber numberWithDouble:v40];

        v35 = @"double";
LABEL_64:
        v37 = v35;
        v11 = (void *)v34;
LABEL_51:

        v21 = v37;
LABEL_52:

        v3 = v39;
        id v7 = v38;
LABEL_53:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          _HDSQLiteValueForDate();
          id v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v31 = _HDSQLiteValueForUUID();

            v11 = (void *)v31;
          }
          id v30 = v11;
          v11 = v30;
        }
        v28 = v30;
LABEL_59:

LABEL_60:
        [a1 predicateOperatorType];
        v32 = [MEMORY[0x1E4F65D00] predicateWithProperty:v8 value:v28 comparisonType:HDSQLiteComparisonTypeForPredicateOperator()];

        return v32;
      case 3:
      case 6:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v16 = @"integer";
          if (objc_opt_isKindOfClass())
          {
            double v40 = 0.0;
            v17 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
            if [v17 scanInteger:&v40] && (objc_msgSend(v17, "isAtEnd"))
            {
              uint64_t v34 = [NSNumber numberWithInteger:*(void *)&v40];

              v35 = @"integer";
              goto LABEL_64;
            }
            goto LABEL_31;
          }
LABEL_32:

          v12 = v16;
          goto LABEL_38;
        }
        v29 = @"integer";
        goto LABEL_50;
      case 4:
      case 7:
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
LABEL_25:
        v21 = [(id)objc_opt_class() description];

        v12 = v21;
        if (isKindOfClass) {
          goto LABEL_52;
        }
        goto LABEL_38;
      case 5:
      case 8:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = _HDSQLiteValueForUUID();
LABEL_35:

          char v25 = 1;
          v11 = (void *)v19;
          goto LABEL_37;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = objc_alloc(MEMORY[0x1E4F29128]);
          v23 = [v11 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1F1728D60];
          uint64_t v24 = [v22 initWithUUIDString:v23];

          uint64_t v19 = _HDSQLiteValueForUUID();

          v11 = (void *)v24;
          goto LABEL_35;
        }
        char v25 = 0;
LABEL_37:
        v21 = [(id)objc_opt_class() description];

        v12 = v21;
        if (v25) {
          goto LABEL_52;
        }
LABEL_38:
        if (++v13 >= (unint64_t)[v10 count]) {
          goto LABEL_43;
        }
        continue;
      default:
        goto LABEL_38;
    }
  }
}

@end