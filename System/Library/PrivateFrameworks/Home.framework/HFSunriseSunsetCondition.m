@interface HFSunriseSunsetCondition
- (HFSunriseSunsetCondition)initWithPredicate:(id)a3;
- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 comparisonType:(unint64_t)a4;
- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 offset:(id)a4 comparisonType:(unint64_t)a5;
- (NSDateComponents)offset;
- (NSString)description;
- (NSString)significantEvent;
- (int64_t)compare:(id)a3;
- (unint64_t)comparisonType;
@end

@implementation HFSunriseSunsetCondition

- (HFSunriseSunsetCondition)initWithPredicate:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HFSunriseSunsetCondition;
  v5 = [(HFCondition *)&v30 initWithPredicate:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = [v6 predicateOperatorType];
      if (v7 < 4)
      {
        v5->_comparisonType = qword_20BD13B10[v7];
        v8 = [v6 leftExpression];
        if ([v8 expressionType] == 3)
        {
          uint64_t v9 = *MEMORY[0x263F0D908];
          v31[0] = *MEMORY[0x263F0D8F8];
          v31[1] = v9;
          v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
          v11 = [v8 keyPath];
          int v12 = [v10 containsObject:v11];

          if (v12)
          {
            uint64_t v13 = [v8 keyPath];
            significantEvent = v5->_significantEvent;
            v5->_significantEvent = (NSString *)v13;

            v15 = [v6 rightExpression];
            if ([v15 expressionType] == 4)
            {
              v16 = [v15 function];
              int v17 = [v16 isEqualToString:@"add:to:"];

              if (v17)
              {
                v18 = [v15 arguments];
                v19 = [v18 firstObject];
                if ([v19 expressionType] == 4)
                {
                  v20 = [v19 function];
                  int v21 = [v20 isEqualToString:@"now"];

                  if (v21)
                  {
                    v22 = [v18 lastObject];
                    if (![v22 expressionType])
                    {
                      v23 = [v22 constantValue];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if (isKindOfClass)
                      {
                        v25 = [v22 constantValue];
                        uint64_t v26 = objc_msgSend(v25, "hf_negativeValue");
                        offset = v5->_offset;
                        v5->_offset = (NSDateComponents *)v26;
                      }
                    }
                  }
                }
              }
            }

            goto LABEL_16;
          }
        }
      }
    }
    v28 = 0;
    goto LABEL_20;
  }
LABEL_16:
  v28 = v5;
LABEL_20:

  return v28;
}

- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 comparisonType:(unint64_t)a4
{
  return [(HFSunriseSunsetCondition *)self initWithSignificantEvent:a3 offset:0 comparisonType:a4];
}

- (HFSunriseSunsetCondition)initWithSignificantEvent:(id)a3 offset:(id)a4 comparisonType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke;
  v15[3] = &unk_26409AE98;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a5;
  id v10 = v9;
  id v11 = v8;
  int v12 = __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke(v15);
  uint64_t v13 = [(HFSunriseSunsetCondition *)self initWithPredicate:v12];

  return v13;
}

id __75__HFSunriseSunsetCondition_initWithSignificantEvent_offset_comparisonType___block_invoke(void *a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F0E788]) initWithSignificantEvent:a1[4] offset:a1[5]];
  uint64_t v3 = a1[6];
  if (v3 == 2)
  {
    uint64_t v4 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringAfterSignificantEvent:v2];
    goto LABEL_5;
  }
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:v2];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_11;
  }
  id v8 = [(HFSunriseSunsetCondition *)self significantEvent];
  uint64_t v9 = *MEMORY[0x263F0D908];
  if ([v8 isEqualToString:*MEMORY[0x263F0D908]])
  {
    id v10 = [v7 significantEvent];
    uint64_t v11 = *MEMORY[0x263F0D8F8];
    char v12 = [v10 isEqualToString:*MEMORY[0x263F0D8F8]];

    if (v12)
    {
      int64_t v13 = 1;
      goto LABEL_18;
    }
  }
  else
  {

    uint64_t v11 = *MEMORY[0x263F0D8F8];
  }
  v14 = [(HFSunriseSunsetCondition *)self significantEvent];
  if ([v14 isEqualToString:v11])
  {
    v15 = [v7 significantEvent];
    char v16 = [v15 isEqualToString:v9];

    if (v16)
    {
LABEL_11:
      int64_t v13 = -1;
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v17 = [(HFSunriseSunsetCondition *)self offset];
  double v18 = 0.0;
  double v19 = 0.0;
  if (v17)
  {
    v20 = [(HFSunriseSunsetCondition *)self offset];
    objc_msgSend(v20, "hf_timeInterval");
    double v19 = v21;
  }
  v22 = [v7 offset];
  if (v22)
  {
    v23 = [v7 offset];
    objc_msgSend(v23, "hf_timeInterval");
    double v18 = v24;
  }
  v25 = [NSNumber numberWithDouble:v19];
  uint64_t v26 = [NSNumber numberWithDouble:v18];
  int64_t v13 = [v25 compare:v26];

LABEL_18:
  return v13;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFSunriseSunsetCondition *)self significantEvent];
  id v5 = (id)[v3 appendObject:v4 withName:@"significantEvent"];

  id v6 = [(HFSunriseSunsetCondition *)self offset];
  id v7 = (id)[v3 appendObject:v6 withName:@"offset"];

  unint64_t v8 = [(HFSunriseSunsetCondition *)self comparisonType];
  if (v8 > 2) {
    uint64_t v9 = @"(unknown)";
  }
  else {
    uint64_t v9 = off_26409AEE0[v8];
  }
  [v3 appendString:v9 withName:@"comparisonType"];
  id v10 = [v3 build];

  return (NSString *)v10;
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end