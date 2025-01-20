@interface HFCameraSmartDetectionCondition
+ (BOOL)_predicateIsValidForPersonFamiliarityKeyPath:(id)a3;
+ (BOOL)_predicateIsValidForSignificantEventKeyPath:(id)a3;
- (HFCameraSmartDetectionCondition)initWithPredicate:(id)a3;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
@end

@implementation HFCameraSmartDetectionCondition

- (HFCameraSmartDetectionCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HFCameraSmartDetectionCondition;
  v5 = [(HFCondition *)&v31 initWithPredicate:v4];
  if (v5)
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v9 = [v8 subpredicates];
      uint64_t v10 = [v9 count];

      if (v10 != 2) {
        goto LABEL_26;
      }
      v11 = [v8 subpredicates];
      v12 = [v11 objectAtIndexedSubscript:0];
      BOOL v13 = +[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:v12];
      if (v13)
      {
        v14 = [v8 subpredicates];
        v15 = [v14 objectAtIndexedSubscript:1];
        if (+[HFCameraSmartDetectionCondition _predicateIsValidForPersonFamiliarityKeyPath:v15])
        {

LABEL_18:
          v16 = v5;
LABEL_27:

          goto LABEL_28;
        }
        v29 = v15;
        v26 = v14;
      }
      v30 = v12;
      v17 = objc_msgSend(v8, "subpredicates", v26);
      v18 = [v17 objectAtIndexedSubscript:1];
      if (+[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:v18])
      {
        v19 = [v8 subpredicates];
        [v19 objectAtIndexedSubscript:0];
        v20 = v28 = v11;
        BOOL v21 = +[HFCameraSmartDetectionCondition _predicateIsValidForPersonFamiliarityKeyPath:v20];

        v11 = v28;
      }
      else
      {
        BOOL v21 = 0;
      }

      if (v13)
      {
      }
      if (v21) {
        goto LABEL_18;
      }
    }
    objc_opt_class();
    id v22 = v6;
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    if (v24
      && +[HFCameraSmartDetectionCondition _predicateIsValidForSignificantEventKeyPath:v24])
    {
      v16 = v5;

      goto LABEL_27;
    }

LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_28:

  return v16;
}

+ (BOOL)_predicateIsValidForSignificantEventKeyPath:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 leftExpression];
  if ([v7 expressionType] == 4)
  {
    id v8 = [v6 leftExpression];
    v9 = [v8 arguments];
    uint64_t v10 = [v9 firstObject];
    v11 = [v10 keyPath];
    char v12 = [v11 isEqualToString:*MEMORY[0x263F0BD38]];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)_predicateIsValidForPersonFamiliarityKeyPath:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 leftExpression];
  if ([v7 expressionType] == 4)
  {
    id v8 = [v6 leftExpression];
    v9 = [v8 arguments];
    uint64_t v10 = [v9 firstObject];
    v11 = [v10 keyPath];
    char v12 = [v11 isEqualToString:*MEMORY[0x263F0BD40]];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v3 = [[HFConditionUISummary alloc] initWithCondition:self title:0 description:0];
  return v3;
}

@end