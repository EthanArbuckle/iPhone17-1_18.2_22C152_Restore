@interface EKSerializableRecurrenceRule
+ (id)classesForKey;
- (EKRecurrenceEnd)recurrenceEnd;
- (EKSerializableRecurrenceRule)initWithRecurrenceRule:(id)a3;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)setPositions;
- (NSArray)weeksOfTheYear;
- (id)createRecurrenceRule:(id *)a3;
- (int64_t)firstDayOfTheWeek;
- (int64_t)frequency;
- (int64_t)interval;
- (void)setRecurrenceEnd:(id)a3;
@end

@implementation EKSerializableRecurrenceRule

+ (id)classesForKey
{
  v25[10] = *MEMORY[0x1E4F143B8];
  v24[0] = @"frequency";
  uint64_t v23 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25[0] = v13;
  v24[1] = @"interval";
  uint64_t v22 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v25[1] = v2;
  v24[2] = @"recurrenceEnd";
  uint64_t v21 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v25[2] = v3;
  v24[3] = @"firstDayOfTheWeek";
  uint64_t v20 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v25[3] = v4;
  v24[4] = @"daysOfTheWeek";
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v25[4] = v5;
  v24[5] = @"daysOfTheMonth";
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v25[5] = v6;
  v24[6] = @"daysOfTheYear";
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v25[6] = v7;
  v24[7] = @"weeksOfTheYear";
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v25[7] = v8;
  v24[8] = @"monthsOfTheYear";
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v25[8] = v9;
  v24[9] = @"setPositions";
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v25[9] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];

  return v11;
}

- (EKSerializableRecurrenceRule)initWithRecurrenceRule:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKSerializableRecurrenceRule;
  v5 = [(EKSerializableRecurrenceRule *)&v34 init];
  if (v5)
  {
    v5->_frequency = [v4 frequency];
    v5->_interval = [v4 interval];
    v6 = [v4 recurrenceEnd];
    uint64_t v7 = [v6 copy];
    recurrenceEnd = v5->_recurrenceEnd;
    v5->_recurrenceEnd = (EKRecurrenceEnd *)v7;

    v5->_firstDayOfTheWeek = [v4 firstDayOfTheWeek];
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    v10 = [v4 daysOfTheWeek];
    uint64_t v11 = [v9 initWithArray:v10 copyItems:1];
    daysOfTheWeek = v5->_daysOfTheWeek;
    v5->_daysOfTheWeek = (NSArray *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1C978]);
    v14 = [v4 daysOfTheMonth];
    uint64_t v15 = [v13 initWithArray:v14 copyItems:1];
    daysOfTheMonth = v5->_daysOfTheMonth;
    v5->_daysOfTheMonth = (NSArray *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F1C978]);
    v18 = [v4 daysOfTheYear];
    uint64_t v19 = [v17 initWithArray:v18 copyItems:1];
    daysOfTheYear = v5->_daysOfTheYear;
    v5->_daysOfTheYear = (NSArray *)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v22 = [v4 weeksOfTheYear];
    uint64_t v23 = [v21 initWithArray:v22 copyItems:1];
    weeksOfTheYear = v5->_weeksOfTheYear;
    v5->_weeksOfTheYear = (NSArray *)v23;

    id v25 = objc_alloc(MEMORY[0x1E4F1C978]);
    v26 = [v4 monthsOfTheYear];
    uint64_t v27 = [v25 initWithArray:v26 copyItems:1];
    monthsOfTheYear = v5->_monthsOfTheYear;
    v5->_monthsOfTheYear = (NSArray *)v27;

    id v29 = objc_alloc(MEMORY[0x1E4F1C978]);
    v30 = [v4 setPositions];
    uint64_t v31 = [v29 initWithArray:v30 copyItems:1];
    setPositions = v5->_setPositions;
    v5->_setPositions = (NSArray *)v31;
  }
  return v5;
}

- (id)createRecurrenceRule:(id *)a3
{
  if ([(EKSerializableRecurrenceRule *)self interval] <= 0)
  {
    v14 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKSerializableRecurrenceRule createRecurrenceRule:](v14, self);
    }
    id v13 = 0;
  }
  else
  {
    v16 = [EKRecurrenceRule alloc];
    int64_t v4 = [(EKSerializableRecurrenceRule *)self frequency];
    int64_t v5 = [(EKSerializableRecurrenceRule *)self interval];
    v6 = [(EKSerializableRecurrenceRule *)self daysOfTheWeek];
    uint64_t v7 = [(EKSerializableRecurrenceRule *)self daysOfTheMonth];
    v8 = [(EKSerializableRecurrenceRule *)self monthsOfTheYear];
    id v9 = [(EKSerializableRecurrenceRule *)self weeksOfTheYear];
    v10 = [(EKSerializableRecurrenceRule *)self daysOfTheYear];
    uint64_t v11 = [(EKSerializableRecurrenceRule *)self setPositions];
    v12 = [(EKSerializableRecurrenceRule *)self recurrenceEnd];
    id v13 = [(EKRecurrenceRule *)v16 initRecurrenceWithFrequency:v4 interval:v5 daysOfTheWeek:v6 daysOfTheMonth:v7 monthsOfTheYear:v8 weeksOfTheYear:v9 daysOfTheYear:v10 setPositions:v11 end:v12];
  }

  return v13;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (EKRecurrenceEnd)recurrenceEnd
{
  return self->_recurrenceEnd;
}

- (void)setRecurrenceEnd:(id)a3
{
}

- (int64_t)firstDayOfTheWeek
{
  return self->_firstDayOfTheWeek;
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);

  objc_storeStrong((id *)&self->_recurrenceEnd, 0);
}

- (void)createRecurrenceRule:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 interval];
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Serialized recurrence rule has invalid interval (%d). Ignoring.", (uint8_t *)v4, 8u);
}

@end