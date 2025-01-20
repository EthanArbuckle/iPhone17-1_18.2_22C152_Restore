@interface CLSHolidayCalendarEventDateRule
- (BOOL)hasEndYear;
- (BOOL)hasExplicitYear;
- (BOOL)hasStartYear;
- (BOOL)matchesExplicitYear:(int64_t)a3;
- (CLSHolidayCalendarEventDateRule)initWithEventDescription:(id)a3;
- (CLSHolidayCalendarEventDateRuleDelegate)delegate;
- (NSDateComponents)simpleRuleComponents;
- (NSString)relativeToRuleUUID;
- (id)_stringDescriptionForDateRuleComponentValue:(int64_t)a3;
- (id)description;
- (id)localDateByEvaluatingRuleForYear:(int64_t)a3;
- (int64_t)endYear;
- (int64_t)offsetDays;
- (int64_t)startYear;
- (void)setDelegate:(id)a3;
- (void)setEndYear:(int64_t)a3;
- (void)setOffsetDays:(int64_t)a3;
- (void)setRelativeToRuleUUID:(id)a3;
- (void)setSimpleRuleComponents:(id)a3;
- (void)setStartYear:(int64_t)a3;
@end

@implementation CLSHolidayCalendarEventDateRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeToRuleUUID, 0);
  objc_storeStrong((id *)&self->_simpleRuleComponents, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRelativeToRuleUUID:(id)a3
{
}

- (NSString)relativeToRuleUUID
{
  return self->_relativeToRuleUUID;
}

- (void)setOffsetDays:(int64_t)a3
{
  self->_offsetDays = a3;
}

- (int64_t)offsetDays
{
  return self->_offsetDays;
}

- (void)setEndYear:(int64_t)a3
{
  self->_endYear = a3;
}

- (int64_t)endYear
{
  return self->_endYear;
}

- (void)setStartYear:(int64_t)a3
{
  self->_startYear = a3;
}

- (int64_t)startYear
{
  return self->_startYear;
}

- (void)setSimpleRuleComponents:(id)a3
{
}

- (NSDateComponents)simpleRuleComponents
{
  return self->_simpleRuleComponents;
}

- (void)setDelegate:(id)a3
{
}

- (CLSHolidayCalendarEventDateRuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLSHolidayCalendarEventDateRuleDelegate *)WeakRetained;
}

- (id)_stringDescriptionForDateRuleComponentValue:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = @"N/A";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:[(NSDateComponents *)self->_simpleRuleComponents year]];
  v5 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:[(NSDateComponents *)self->_simpleRuleComponents month]];
  v6 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:[(NSDateComponents *)self->_simpleRuleComponents day]];
  v7 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:[(NSDateComponents *)self->_simpleRuleComponents weekday]];
  v8 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:[(NSDateComponents *)self->_simpleRuleComponents weekdayOrdinal]];
  v9 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:self->_startYear];
  v10 = [(CLSHolidayCalendarEventDateRule *)self _stringDescriptionForDateRuleComponentValue:self->_endYear];
  v11 = [v3 stringWithFormat:@"%@-%@-%@, weekday %@, weekdayOrd %@, startY: %@, endY: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)matchesExplicitYear:(int64_t)a3
{
  return [(NSDateComponents *)self->_simpleRuleComponents year] == a3;
}

- (BOOL)hasExplicitYear
{
  return [(NSDateComponents *)self->_simpleRuleComponents year] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasEndYear
{
  return self->_endYear != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasStartYear
{
  return self->_startYear != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3
{
  if (self->_relativeToRuleUUID)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v6 = [WeakRetained dateForRuleWithUUID:self->_relativeToRuleUUID byEvaluatingForYear:a3];
      if (v6)
      {
        v7 = +[CLSCalendar components:28 fromDate:v6];
        [v7 setYear:a3];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_12;
  }
  v7 = (void *)[(NSDateComponents *)self->_simpleRuleComponents copy];
  [v7 setYear:a3];
  if ([v7 weekdayOrdinal] == -1)
  {
    id WeakRetained = +[CLSCalendar dateFromComponents:v7 inTimeZone:0];
    +[CLSCalendar rangeOfUnit:1024 inUnit:8 forDate:WeakRetained];
    [v7 setWeekdayOrdinal:v9];
    v8 = +[CLSCalendar dateFromComponents:v7 inTimeZone:0];
    int64_t v10 = +[CLSCalendar monthFromDate:v8];
    if (v10 == [v7 month]) {
      goto LABEL_13;
    }

    objc_msgSend(v7, "setWeekdayOrdinal:", objc_msgSend(v7, "weekdayOrdinal") - 1);
LABEL_12:
    v8 = 0;
LABEL_13:

    if (v8) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:
  if (v7)
  {
    v8 = +[CLSCalendar dateFromComponents:v7 inTimeZone:0];
  }
LABEL_16:
  if (v8)
  {
    int64_t offsetDays = self->_offsetDays;
    if (offsetDays)
    {
      uint64_t v12 = +[CLSCalendar dateByAddingDays:offsetDays toDate:v8];

      v8 = (void *)v12;
    }
  }

  return v8;
}

- (CLSHolidayCalendarEventDateRule)initWithEventDescription:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSHolidayCalendarEventDateRule;
  v5 = [(CLSHolidayCalendarEventDateRule *)&v21 init];
  v6 = (CLSHolidayCalendarEventDateRule *)v5;
  if (v5)
  {
    *(int64x2_t *)(v5 + 24) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v7 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    simpleRuleComponents = v6->_simpleRuleComponents;
    v6->_simpleRuleComponents = v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"year"];
    int64_t v10 = v9;
    if (v9) {
      -[NSDateComponents setYear:](v6->_simpleRuleComponents, "setYear:", [v9 integerValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"month"];

    if (v11) {
      -[NSDateComponents setMonth:](v6->_simpleRuleComponents, "setMonth:", [v11 integerValue]);
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"day"];

    if (v12) {
      -[NSDateComponents setDay:](v6->_simpleRuleComponents, "setDay:", [v12 integerValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"weekday"];

    if (v13) {
      -[NSDateComponents setWeekday:](v6->_simpleRuleComponents, "setWeekday:", [v13 integerValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"weekdayOrdinal"];

    if (v14) {
      -[NSDateComponents setWeekdayOrdinal:](v6->_simpleRuleComponents, "setWeekdayOrdinal:", [v14 integerValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"startYear"];

    if (v15) {
      v6->_startYear = [v15 integerValue];
    }
    v16 = [v4 objectForKeyedSubscript:@"endYear"];

    if (v16) {
      v6->_endYear = [v16 integerValue];
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"relativeToRule"];
    relativeToRuleUUID = v6->_relativeToRuleUUID;
    v6->_relativeToRuleUUID = (NSString *)v17;

    v19 = [v4 objectForKeyedSubscript:@"offsetDays"];
    v6->_int64_t offsetDays = [v19 integerValue];
  }
  return v6;
}

@end