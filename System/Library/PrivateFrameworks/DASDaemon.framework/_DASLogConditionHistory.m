@interface _DASLogConditionHistory
+ (id)condition:(id)a3 fromDate:(id)a4;
- (NSMutableArray)conditions;
- (NSMutableArray)intervals;
- (_DASLogConditionHistory)initWithCondition:(id)a3 fromDate:(id)a4;
- (id)description;
- (id)idealIntervals;
- (void)addCondition:(id)a3 atDate:(id)a4;
- (void)setConditions:(id)a3;
- (void)setIntervals:(id)a3;
@end

@implementation _DASLogConditionHistory

- (_DASLogConditionHistory)initWithCondition:(id)a3 fromDate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_DASLogConditionHistory;
  v4 = [(_DASLogConditionHistory *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    conditions = v4->_conditions;
    v4->_conditions = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    intervals = v4->_intervals;
    v4->_intervals = (NSMutableArray *)v7;
  }
  return v4;
}

+ (id)condition:(id)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCondition:v6 fromDate:v5];

  return v7;
}

- (void)addCondition:(id)a3 atDate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_conditions lastObject];
  char v8 = [v7 isEqual:v9];

  if ((v8 & 1) == 0)
  {
    [(NSMutableArray *)self->_conditions addObject:v9];
    [(NSMutableArray *)self->_intervals addObject:v6];
  }
}

- (id)idealIntervals
{
  v3 = [MEMORY[0x263EFF980] array];
  if ([(NSMutableArray *)self->_conditions count])
  {
    unint64_t v4 = 0;
    id v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_conditions objectAtIndexedSubscript:v4];
      int v7 = [v6 isIdeal];

      if (v7)
      {
        if (!v5)
        {
          id v5 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v4];
        }
      }
      else if (v5)
      {
        id v8 = objc_alloc(MEMORY[0x263F08798]);
        id v9 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v4];
        objc_super v10 = (void *)[v8 initWithStartDate:v5 endDate:v9];
        [v3 addObject:v10];

        id v5 = 0;
      }
      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_conditions count]);
    if (v5)
    {
      id v11 = objc_alloc(MEMORY[0x263F08798]);
      v12 = [MEMORY[0x263EFF910] distantFuture];
      v13 = (void *)[v11 initWithStartDate:v5 endDate:v12];
      [v3 addObject:v13];
    }
  }
  else
  {
    id v5 = 0;
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (id)description
{
  if ([(NSMutableArray *)self->_conditions count])
  {
    if (description_onceToken != -1) {
      dispatch_once(&description_onceToken, &__block_literal_global);
    }
    v32 = [MEMORY[0x263EFF8F0] currentCalendar];
    v3 = [MEMORY[0x263F089D8] string];
    uint64_t v4 = [(NSMutableArray *)self->_conditions count];
    if (v4)
    {
      unint64_t v31 = v4 - 1;
      if (v4 == 1)
      {
        unint64_t v9 = 0;
      }
      else
      {
        unint64_t v5 = 0;
        unsigned int v6 = 1;
        do
        {
          int v7 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v5];
          id v8 = [v32 components:24 fromDate:v7];
          unint64_t v9 = v6;
          objc_super v10 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v6];
          id v11 = [v32 components:24 fromDate:v10];
          int v12 = [v8 isEqual:v11];

          v13 = NSString;
          v14 = (void *)description_formatter;
          v15 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v5];
          v16 = [v14 stringFromDate:v15];
          if (v12) {
            v17 = (void *)description_shortFormatter;
          }
          else {
            v17 = (void *)description_formatter;
          }
          v18 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v9];
          v19 = [v17 stringFromDate:v18];
          v20 = [v13 stringWithFormat:@"%@ - %@", v16, v19];

          id v21 = v20;
          uint64_t v22 = [v21 UTF8String];
          v23 = [(NSMutableArray *)self->_conditions objectAtIndexedSubscript:v5];
          [v3 appendFormat:@"  %-50s %@\n", v22, v23];

          unsigned int v6 = v9 + 1;
          unint64_t v5 = v9;
        }
        while (v31 > v9);
      }
      v25 = (void *)description_formatter;
      v26 = [(NSMutableArray *)self->_intervals objectAtIndexedSubscript:v9];
      id v27 = [v25 stringFromDate:v26];
      uint64_t v28 = [v27 UTF8String];
      v29 = [(NSMutableArray *)self->_conditions objectAtIndexedSubscript:v9];
      [v3 appendFormat:@"  %-50s %@", v28, v29];
    }
    v24 = (__CFString *)[v3 copy];
  }
  else
  {
    v24 = &stru_26DDDA0E0;
  }
  return v24;
}

- (NSMutableArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (NSMutableArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end