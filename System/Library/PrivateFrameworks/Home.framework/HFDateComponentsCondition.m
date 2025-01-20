@interface HFDateComponentsCondition
- (BOOL)isTimeOfDayCondition;
- (HFDateComponentsCondition)initWithDateComponents:(id)a3 comparisonType:(unint64_t)a4;
- (HFDateComponentsCondition)initWithPredicate:(id)a3;
- (NSDateComponents)dateComponents;
- (NSString)description;
- (int64_t)compare:(id)a3;
- (unint64_t)comparisonType;
- (unint64_t)timeConditionType;
@end

@implementation HFDateComponentsCondition

- (HFDateComponentsCondition)initWithDateComponents:(id)a3 comparisonType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke;
  v14 = &unk_26409AEC0;
  id v15 = v6;
  unint64_t v16 = a4;
  id v7 = v6;
  v8 = __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke((uint64_t)&v11);
  v9 = -[HFDateComponentsCondition initWithPredicate:](self, "initWithPredicate:", v8, v11, v12, v13, v14);

  return v9;
}

id __67__HFDateComponentsCondition_initWithDateComponents_comparisonType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 == 2)
  {
    v2 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringAfterDateWithComponents:*(void *)(a1 + 32)];
  }
  else if (v1 == 1)
  {
    v2 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringOnDateWithComponents:*(void *)(a1 + 32)];
  }
  else if (v1)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263F0E310] predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:*(void *)(a1 + 32)];
  }
  return v2;
}

- (HFDateComponentsCondition)initWithPredicate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFDateComponentsCondition;
  v5 = [(HFCondition *)&v17 initWithPredicate:v4];
  if (!v5) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    unint64_t v7 = [v6 predicateOperatorType];
    if (v7 >= 5)
    {
LABEL_9:

      goto LABEL_10;
    }
    v5->_comparisonType = qword_20BD13B30[v7];
    v8 = [v6 leftExpression];
    v9 = [v6 rightExpression];
    if ([v8 expressionType] != 4)
    {
LABEL_8:

      goto LABEL_9;
    }
    v10 = [v8 function];
    if (![v10 isEqualToString:@"now"] || objc_msgSend(v9, "expressionType"))
    {

      goto LABEL_8;
    }
    uint64_t v12 = [v9 constantValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v14 = [v9 constantValue];
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v14;

LABEL_13:
    uint64_t v11 = v5;
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)isTimeOfDayCondition
{
  v2 = [(HFDateComponentsCondition *)self dateComponents];
  BOOL v3 = (objc_msgSend(v2, "hf_validComponents") & 0xFFFFFFFFFFFFFF9FLL) == 0;

  return v3;
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

  if (v7)
  {
    v8 = [(HFDateComponentsCondition *)self dateComponents];
    v9 = [v7 dateComponents];
    int64_t v10 = objc_msgSend(v8, "hf_compareNextMatchingDate:", v9);
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFDateComponentsCondition *)self dateComponents];
  id v5 = (id)[v3 appendObject:v4 withName:@"dateComponents"];

  unint64_t v6 = [(HFDateComponentsCondition *)self comparisonType];
  if (v6 > 2) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_26409AEE0[v6];
  }
  [v3 appendString:v7 withName:@"comparisonType"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (unint64_t)timeConditionType
{
  if ([(HFDateComponentsCondition *)self isTimeOfDayCondition]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)HFDateComponentsCondition;
  return [(HFTimeCondition *)&v4 timeConditionType];
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
}

@end