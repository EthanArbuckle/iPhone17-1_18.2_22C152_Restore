@interface INDateComponentsRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EKRecurrenceRule)EKRecurrenceRule;
- (INDateComponentsRange)initWithCoder:(id)a3;
- (INDateComponentsRange)initWithDate:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5;
- (INDateComponentsRange)initWithDateInterval:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5;
- (INDateComponentsRange)initWithEKRecurrenceRule:(EKRecurrenceRule *)recurrenceRule;
- (INDateComponentsRange)initWithStartDate:(id)a3 endDate:(id)a4 onCalendar:(id)a5 inTimeZone:(id)a6;
- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents;
- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents recurrenceRule:(INRecurrenceRule *)recurrenceRule;
- (INDateComponentsRange)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4 recurrenceRule:(id)a5 userInput:(id)a6 allDay:(id)a7;
- (INRecurrenceRule)recurrenceRule;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (NSDateInterval)dateInterval;
- (NSNumber)allDay;
- (NSString)description;
- (NSString)userInput;
- (id)_dictionaryRepresentation;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)_userInput;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INDateComponentsRange

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 locale];
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [(INDateComponentsRange *)self startDateComponents];
  if (v10)
  {
    v11 = [(INDateComponentsRange *)self startDateComponents];
    v12 = [v9 dateFromComponents:v11];
  }
  else
  {
    v12 = 0;
  }

  uint64_t v13 = [(INDateComponentsRange *)self endDateComponents];
  if (!v13)
  {
    BOOL v18 = 0;
    v16 = 0;
    BOOL v17 = v12 != 0;
    goto LABEL_9;
  }
  v14 = (void *)v13;
  v15 = [(INDateComponentsRange *)self endDateComponents];
  v16 = [v9 dateFromComponents:v15];

  BOOL v17 = v12 != 0;
  BOOL v18 = v16 != 0;
  if (!v12 || !v16)
  {
LABEL_9:
    if (v17 || v18)
    {
      if (v17) {
        v21 = v12;
      }
      else {
        v21 = v16;
      }
      v20 = objc_msgSend(v21, "_intents_readableTitleWithLocalizer:metadata:", v6, v7);
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_16;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F28C20]);
  [v19 setLocale:v8];
  v20 = [v19 stringFromDate:v12 toDate:v16];

LABEL_16:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDay, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_recurrenceRule, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);

  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

- (NSNumber)allDay
{
  return self->_allDay;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"startDateComponents";
  startDateComponents = self->_startDateComponents;
  v4 = startDateComponents;
  if (!startDateComponents)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"endDateComponents";
  endDateComponents = self->_endDateComponents;
  id v6 = endDateComponents;
  if (!endDateComponents)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"recurrenceRule";
  recurrenceRule = self->_recurrenceRule;
  v8 = recurrenceRule;
  if (!recurrenceRule)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (recurrenceRule)
  {
    if (endDateComponents) {
      goto LABEL_9;
    }
LABEL_14:

    if (startDateComponents) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!endDateComponents) {
    goto LABEL_14;
  }
LABEL_9:
  if (startDateComponents) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INDateComponentsRange;
  id v6 = [(INDateComponentsRange *)&v11 description];
  id v7 = [(INDateComponentsRange *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INDateComponentsRange *)self descriptionAtIndent:0];
}

- (INDateComponentsRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDateComponents"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDateComponents"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurrenceRule"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInput"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allDay"];

  v10 = [(INDateComponentsRange *)self initWithStartDateComponents:v5 endDateComponents:v6 recurrenceRule:v7 userInput:v8 allDay:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  startDateComponents = self->_startDateComponents;
  id v5 = a3;
  [v5 encodeObject:startDateComponents forKey:@"startDateComponents"];
  [v5 encodeObject:self->_endDateComponents forKey:@"endDateComponents"];
  [v5 encodeObject:self->_recurrenceRule forKey:@"recurrenceRule"];
  [v5 encodeObject:self->_userInput forKey:@"userInput"];
  [v5 encodeObject:self->_allDay forKey:@"allDay"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    startDateComponents = self->_startDateComponents;
    BOOL v9 = 0;
    if (startDateComponents == (NSDateComponents *)v5[1]
      || -[NSDateComponents isEqual:](startDateComponents, "isEqual:"))
    {
      endDateComponents = self->_endDateComponents;
      if (endDateComponents == (NSDateComponents *)v5[2]
        || -[NSDateComponents isEqual:](endDateComponents, "isEqual:"))
      {
        recurrenceRule = self->_recurrenceRule;
        if (recurrenceRule == (INRecurrenceRule *)v5[3] || -[INRecurrenceRule isEqual:](recurrenceRule, "isEqual:")) {
          BOOL v9 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateComponents *)self->_startDateComponents hash];
  uint64_t v4 = [(NSDateComponents *)self->_endDateComponents hash] ^ v3;
  return v4 ^ [(INRecurrenceRule *)self->_recurrenceRule hash];
}

- (EKRecurrenceRule)EKRecurrenceRule
{
  v28[1] = *MEMORY[0x1E4F143B8];
  recurrenceRule = self->_recurrenceRule;
  if (!recurrenceRule
    || [(INRecurrenceRule *)recurrenceRule frequency] == INRecurrenceFrequencyMinute
    || [(INRecurrenceRule *)self->_recurrenceRule frequency] == INRecurrenceFrequencyHourly
    || [(INRecurrenceRule *)self->_recurrenceRule frequency] == INRecurrenceFrequencyUnknown)
  {
    v12 = 0;
  }
  else
  {
    INRecurrenceFrequency v4 = [(INRecurrenceRule *)self->_recurrenceRule frequency];
    if ((unint64_t)(v4 - 4) >= 3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v4 - 3;
    }
    id v6 = 0;
    if ([(NSDateComponents *)self->_startDateComponents weekday] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2050000000;
      id v7 = (void *)getEKRecurrenceDayOfWeekClass_softClass;
      uint64_t v27 = getEKRecurrenceDayOfWeekClass_softClass;
      if (!getEKRecurrenceDayOfWeekClass_softClass)
      {
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        v21 = __getEKRecurrenceDayOfWeekClass_block_invoke;
        v22 = &unk_1E5520EB8;
        v23 = &v24;
        __getEKRecurrenceDayOfWeekClass_block_invoke((uint64_t)&v19);
        id v7 = (void *)v25[3];
      }
      v8 = v7;
      _Block_object_dispose(&v24, 8);
      id v9 = [v8 alloc];
      NSInteger v10 = [(NSDateComponents *)self->_startDateComponents weekday];
      if ([(NSDateComponents *)self->_startDateComponents weekdayOrdinal] == 0x7FFFFFFFFFFFFFFFLL) {
        NSInteger v11 = 0;
      }
      else {
        NSInteger v11 = [(NSDateComponents *)self->_startDateComponents weekdayOrdinal];
      }
      id v6 = (void *)[v9 initWithDayOfTheWeek:v10 weekNumber:v11];
    }
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v14 = (void *)getEKRecurrenceRuleClass_softClass;
    uint64_t v27 = getEKRecurrenceRuleClass_softClass;
    if (!getEKRecurrenceRuleClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getEKRecurrenceRuleClass_block_invoke;
      v22 = &unk_1E5520EB8;
      v23 = &v24;
      __getEKRecurrenceRuleClass_block_invoke((uint64_t)&v19);
      v14 = (void *)v25[3];
    }
    v15 = v14;
    _Block_object_dispose(&v24, 8);
    id v16 = [v15 alloc];
    NSUInteger v17 = [(INRecurrenceRule *)self->_recurrenceRule interval];
    if (v6)
    {
      v28[0] = v6;
      BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      v12 = (void *)[v16 initRecurrenceWithFrequency:v5 interval:v17 daysOfTheWeek:v18 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:0];
    }
    else
    {
      v12 = (void *)[v16 initRecurrenceWithFrequency:v5 interval:v17 daysOfTheWeek:0 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:0];
    }
  }

  return (EKRecurrenceRule *)v12;
}

- (INDateComponentsRange)initWithEKRecurrenceRule:(EKRecurrenceRule *)recurrenceRule
{
  INRecurrenceFrequency v4 = recurrenceRule;
  uint64_t v5 = [INRecurrenceRule alloc];
  uint64_t v6 = [(EKRecurrenceRule *)v4 interval];
  uint64_t v7 = [(EKRecurrenceRule *)v4 frequency];
  if ((unint64_t)(v7 - 1) >= 3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7 + 3;
  }
  id v9 = [(INRecurrenceRule *)v5 initWithInterval:v6 frequency:v8];
  NSInteger v10 = [(EKRecurrenceRule *)v4 daysOfTheWeek];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(EKRecurrenceRule *)v4 daysOfTheWeek];
    uint64_t v13 = [v12 firstObject];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    objc_msgSend(v14, "setWeekday:", objc_msgSend(v13, "dayOfTheWeek"));
    objc_msgSend(v14, "setWeekdayOrdinal:", objc_msgSend(v13, "weekNumber"));
  }
  else
  {
    id v14 = 0;
  }
  v15 = [(INDateComponentsRange *)self initWithStartDateComponents:v14 endDateComponents:0 recurrenceRule:v9];

  return v15;
}

- (NSDate)endDate
{
  endDateComponents = self->_endDateComponents;
  if (endDateComponents)
  {
    INRecurrenceFrequency v4 = [(NSDateComponents *)endDateComponents date];
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      INRecurrenceFrequency v4 = [v5 dateFromComponents:self->_endDateComponents];
    }
  }
  else
  {
    INRecurrenceFrequency v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startDate
{
  startDateComponents = self->_startDateComponents;
  if (startDateComponents)
  {
    INRecurrenceFrequency v4 = [(NSDateComponents *)startDateComponents date];
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      INRecurrenceFrequency v4 = [v5 dateFromComponents:self->_startDateComponents];
    }
  }
  else
  {
    INRecurrenceFrequency v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDateInterval)dateInterval
{
  uint64_t v3 = [(INDateComponentsRange *)self startDate];
  uint64_t v4 = [(INDateComponentsRange *)self endDate];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = 0;
  if (v3 && v4) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
  }

  return (NSDateInterval *)v6;
}

- (id)_userInput
{
  v2 = (void *)[(NSString *)self->_userInput copy];

  return v2;
}

- (INDateComponentsRange)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4 recurrenceRule:(id)a5 userInput:(id)a6 allDay:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INDateComponentsRange;
  NSUInteger v17 = [(INDateComponentsRange *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    startDateComponents = v17->_startDateComponents;
    v17->_startDateComponents = (NSDateComponents *)v18;

    uint64_t v20 = [v13 copy];
    endDateComponents = v17->_endDateComponents;
    v17->_endDateComponents = (NSDateComponents *)v20;

    uint64_t v22 = [v14 copy];
    recurrenceRule = v17->_recurrenceRule;
    v17->_recurrenceRule = (INRecurrenceRule *)v22;

    uint64_t v24 = [v15 copy];
    userInput = v17->_userInput;
    v17->_userInput = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    allDay = v17->_allDay;
    v17->_allDay = (NSNumber *)v26;
  }
  return v17;
}

- (INDateComponentsRange)initWithDate:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5
{
  return [(INDateComponentsRange *)self initWithStartDate:a3 endDate:a3 onCalendar:a4 inTimeZone:a5];
}

- (INDateComponentsRange)initWithDateInterval:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 startDate];
  id v12 = [v10 endDate];

  id v13 = [(INDateComponentsRange *)self initWithStartDate:v11 endDate:v12 onCalendar:v9 inTimeZone:v8];
  return v13;
}

- (INDateComponentsRange)initWithStartDate:(id)a3 endDate:(id)a4 onCalendar:(id)a5 inTimeZone:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 | v11)
  {
    id v15 = v12;
    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    id v16 = v13;
    if (v16 || ([v15 timeZone], (id v16 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v10) {
        goto LABEL_8;
      }
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      if (v10)
      {
LABEL_8:
        NSUInteger v17 = [v15 componentsInTimeZone:v16 fromDate:v10];
        if (v11)
        {
LABEL_9:
          uint64_t v18 = [v15 componentsInTimeZone:v16 fromDate:v11];
LABEL_13:
          id v14 = [(INDateComponentsRange *)self initWithStartDateComponents:v17 endDateComponents:v18];

          goto LABEL_14;
        }
LABEL_12:
        uint64_t v18 = 0;
        goto LABEL_13;
      }
    }
    NSUInteger v17 = 0;
    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  id v14 = [(INDateComponentsRange *)self initWithStartDateComponents:0 endDateComponents:0 recurrenceRule:0];
LABEL_14:

  return v14;
}

- (INRecurrenceRule)recurrenceRule
{
  v2 = (void *)[(INRecurrenceRule *)self->_recurrenceRule copy];

  return (INRecurrenceRule *)v2;
}

- (NSDateComponents)endDateComponents
{
  v2 = (void *)[(NSDateComponents *)self->_endDateComponents copy];

  return (NSDateComponents *)v2;
}

- (NSDateComponents)startDateComponents
{
  v2 = (void *)[(NSDateComponents *)self->_startDateComponents copy];

  return (NSDateComponents *)v2;
}

- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents recurrenceRule:(INRecurrenceRule *)recurrenceRule
{
  id v8 = startDateComponents;
  id v9 = endDateComponents;
  unint64_t v10 = recurrenceRule;
  v19.receiver = self;
  v19.super_class = (Class)INDateComponentsRange;
  unint64_t v11 = [(INDateComponentsRange *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSDateComponents *)v8 copy];
    id v13 = v11->_startDateComponents;
    v11->_startDateComponents = (NSDateComponents *)v12;

    uint64_t v14 = [(NSDateComponents *)v9 copy];
    id v15 = v11->_endDateComponents;
    v11->_endDateComponents = (NSDateComponents *)v14;

    uint64_t v16 = [(INRecurrenceRule *)v10 copy];
    NSUInteger v17 = v11->_recurrenceRule;
    v11->_recurrenceRule = (INRecurrenceRule *)v16;
  }
  return v11;
}

- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  return [(INDateComponentsRange *)self initWithStartDateComponents:startDateComponents endDateComponents:endDateComponents recurrenceRule:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end