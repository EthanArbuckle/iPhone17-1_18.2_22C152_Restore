@interface EKUIRecurrenceRuleBuilder
- (EKUIRecurrenceRuleBuilder)init;
- (NSArray)dayNumbers;
- (NSArray)monthNumbers;
- (id)daysOfTheWeek;
- (id)daysOfTheWeekWithWeek:(int64_t)a3;
- (id)description;
- (id)recurrenceRule;
- (id)setPositions;
- (int)days;
- (int)ordinalValue;
- (int64_t)_frequencyToUse;
- (int64_t)frequency;
- (int64_t)interval;
- (unint64_t)count;
- (void)_setDefaultValues;
- (void)setCount:(unint64_t)a3;
- (void)setDayNumbers:(id)a3;
- (void)setDays:(int)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setInterval:(int64_t)a3;
- (void)setMonthNumbers:(id)a3;
- (void)setOrdinalValue:(int)a3;
@end

@implementation EKUIRecurrenceRuleBuilder

- (EKUIRecurrenceRuleBuilder)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIRecurrenceRuleBuilder;
  v2 = [(EKUIRecurrenceRuleBuilder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(EKUIRecurrenceRuleBuilder *)v2 _setDefaultValues];
  }
  return v3;
}

- (void)_setDefaultValues
{
  self->_interval = 1;
}

- (id)recurrenceRule
{
  int64_t v3 = [(EKUIRecurrenceRuleBuilder *)self _frequencyToUse];
  v4 = objc_msgSend(MEMORY[0x1E4F255F8], "recurrenceRuleWithType:interval:end:", v3, -[EKUIRecurrenceRuleBuilder interval](self, "interval"), 0);
  if ([(EKUIRecurrenceRuleBuilder *)self count])
  {
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F255E0], "recurrenceEndWithOccurrenceCount:", -[EKUIRecurrenceRuleBuilder count](self, "count"));
    [v4 setRecurrenceEnd:v5];
  }
  v6 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
  if ([v6 count]
    || [(EKUIRecurrenceRuleBuilder *)self days]
    || [(EKUIRecurrenceRuleBuilder *)self ordinalValue])
  {
  }
  else
  {
    v21 = [(EKUIRecurrenceRuleBuilder *)self monthNumbers];
    uint64_t v22 = [v21 count];

    if (!v22) {
      goto LABEL_32;
    }
  }
  switch(v3)
  {
    case 3:
      v9 = [(EKUIRecurrenceRuleBuilder *)self monthNumbers];
      [v4 setMonthsOfTheYear:v9];

      v10 = [(EKUIRecurrenceRuleBuilder *)self setPositions];
      v11 = [v10 lastObject];
      uint64_t v12 = [v11 integerValue];

      if (v12 && [(EKUIRecurrenceRuleBuilder *)self days])
      {
        uint64_t v13 = [(EKUIRecurrenceRuleBuilder *)self daysOfTheWeekWithWeek:v12];
LABEL_30:
        v19 = (void *)v13;
        [v4 setDaysOfTheWeek:v13];
        goto LABEL_31;
      }
      if (![(EKUIRecurrenceRuleBuilder *)self days]) {
        goto LABEL_32;
      }
      break;
    case 2:
      v14 = [(EKUIRecurrenceRuleBuilder *)self monthNumbers];
      [v4 setMonthsOfTheYear:v14];

      if ([(EKUIRecurrenceRuleBuilder *)self ordinalValue])
      {
        if ([(EKUIRecurrenceRuleBuilder *)self days])
        {
          v15 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
          uint64_t v16 = [v15 count];

          if (!v16)
          {
            v23 = [(EKUIRecurrenceRuleBuilder *)self setPositions];
            [v4 setSetPositions:v23];

LABEL_29:
            uint64_t v13 = [(EKUIRecurrenceRuleBuilder *)self daysOfTheWeek];
            goto LABEL_30;
          }
        }
      }
      v17 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
      if ([v17 count])
      {
        int v18 = [(EKUIRecurrenceRuleBuilder *)self days];

        if (!v18)
        {
          v19 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
          [v4 setDaysOfTheMonth:v19];
LABEL_31:

LABEL_32:
          v20 = v4;
          goto LABEL_33;
        }
      }
      else
      {
      }
      break;
    case 1:
      if ([(EKUIRecurrenceRuleBuilder *)self days])
      {
        v7 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
        uint64_t v8 = [v7 count];

        if (!v8) {
          goto LABEL_29;
        }
      }
      break;
  }
  v20 = 0;
LABEL_33:
  id v24 = v20;

  return v24;
}

- (int64_t)_frequencyToUse
{
  int64_t result = [(EKUIRecurrenceRuleBuilder *)self frequency];
  if (result == 3)
  {
    if ([(EKUIRecurrenceRuleBuilder *)self days] == 127
      || [(EKUIRecurrenceRuleBuilder *)self days] == 62
      || [(EKUIRecurrenceRuleBuilder *)self days] == 65)
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)daysOfTheWeek
{
  return [(EKUIRecurrenceRuleBuilder *)self daysOfTheWeekWithWeek:0];
}

- (id)daysOfTheWeekWithWeek:(int64_t)a3
{
  objc_super v5 = objc_opt_new();
  if ([(EKUIRecurrenceRuleBuilder *)self days])
  {
    v6 = [MEMORY[0x1E4F255D8] dayOfWeek:1 weekNumber:a3];
    [v5 addObject:v6];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 2) != 0)
  {
    v7 = [MEMORY[0x1E4F255D8] dayOfWeek:2 weekNumber:a3];
    [v5 addObject:v7];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 4) != 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F255D8] dayOfWeek:3 weekNumber:a3];
    [v5 addObject:v8];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 8) != 0)
  {
    v9 = [MEMORY[0x1E4F255D8] dayOfWeek:4 weekNumber:a3];
    [v5 addObject:v9];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 0x10) != 0)
  {
    v10 = [MEMORY[0x1E4F255D8] dayOfWeek:5 weekNumber:a3];
    [v5 addObject:v10];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 0x20) != 0)
  {
    v11 = [MEMORY[0x1E4F255D8] dayOfWeek:6 weekNumber:a3];
    [v5 addObject:v11];
  }
  if (([(EKUIRecurrenceRuleBuilder *)self days] & 0x40) != 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F255D8] dayOfWeek:7 weekNumber:a3];
    [v5 addObject:v12];
  }
  if ([v5 count]) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)setPositions
{
  int v2 = [(EKUIRecurrenceRuleBuilder *)self ordinalValue] - 1;
  if (v2 > 6) {
    return 0;
  }
  else {
    return (id)qword_1E6089620[v2];
  }
}

- (id)description
{
  int64_t v3 = [(EKUIRecurrenceRuleBuilder *)self recurrenceRule];
  uint64_t v16 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(EKUIRecurrenceRuleBuilder *)self frequency];
  int64_t v6 = [(EKUIRecurrenceRuleBuilder *)self interval];
  unint64_t v7 = [(EKUIRecurrenceRuleBuilder *)self count];
  uint64_t v8 = [(EKUIRecurrenceRuleBuilder *)self dayNumbers];
  uint64_t v9 = [(EKUIRecurrenceRuleBuilder *)self days];
  uint64_t v10 = [(EKUIRecurrenceRuleBuilder *)self ordinalValue];
  uint64_t v11 = [(EKUIRecurrenceRuleBuilder *)self monthNumbers];
  uint64_t v12 = (void *)v11;
  uint64_t v13 = @"NO VALID RULE";
  if (v3) {
    uint64_t v13 = v3;
  }
  id v14 = [v16 stringWithFormat:@"<%@: %p> {\n\tFrequency: %ld\n\tInterval: %ld\n\tCount: %tu\n\tDay Number: %@\n\tDays: %d\n\tOrdinal: %d\n\tMonth Numbers: %@\n\tCurrent Rule: %@\n}", v4, self, v5, v6, v7, v8, v9, v10, v11, v13];

  return v14;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSArray)dayNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDayNumbers:(id)a3
{
}

- (int)days
{
  return self->_days;
}

- (void)setDays:(int)a3
{
  self->_days = a3;
}

- (int)ordinalValue
{
  return self->_ordinalValue;
}

- (void)setOrdinalValue:(int)a3
{
  self->_ordinalValue = a3;
}

- (NSArray)monthNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonthNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthNumbers, 0);

  objc_storeStrong((id *)&self->_dayNumbers, 0);
}

@end