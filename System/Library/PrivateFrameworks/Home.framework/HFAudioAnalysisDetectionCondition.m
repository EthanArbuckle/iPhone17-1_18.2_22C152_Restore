@interface HFAudioAnalysisDetectionCondition
- (HFAudioAnalysisDetectionCondition)initWithPredicate:(id)a3;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
@end

@implementation HFAudioAnalysisDetectionCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  v3 = [[HFConditionUISummary alloc] initWithCondition:self title:0 description:0];
  return v3;
}

- (HFAudioAnalysisDetectionCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HFAudioAnalysisDetectionCondition;
  v5 = [(HFCondition *)&v25 initWithPredicate:v4];
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    objc_opt_class();
    id v16 = v6;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v18 subpredicates];
    uint64_t v20 = [v19 count];

    if (v20 != 1)
    {

      goto LABEL_22;
    }
    objc_opt_class();
    v21 = [v18 subpredicates];
    id v6 = [v21 firstObject];
    if (objc_opt_isKindOfClass()) {
      v22 = v6;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    if (!v23) {
      goto LABEL_22;
    }
  }
  v9 = [v6 leftExpression];
  if ([v9 expressionType] != 4)
  {

    goto LABEL_20;
  }
  v10 = [v6 leftExpression];
  v11 = [v10 arguments];
  v12 = [v11 firstObject];
  v13 = [v12 keyPath];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F0BA90]];

  if (!v14)
  {
LABEL_20:

LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }

LABEL_9:
  v15 = v5;
LABEL_23:

  return v15;
}

@end