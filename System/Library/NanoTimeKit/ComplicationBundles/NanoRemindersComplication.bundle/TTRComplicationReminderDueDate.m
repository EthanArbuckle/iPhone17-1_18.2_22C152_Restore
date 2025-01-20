@interface TTRComplicationReminderDueDate
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDueDate:(id)a3;
- (BOOL)isInSameDayAsDueDate:(id)a3 inCalendar:(id)a4;
- (NSDate)date;
- (TTRComplicationReminderDueDate)initWithDate:(id)a3 precision:(int64_t)a4;
- (TTRComplicationReminderDueDate)initWithDateComponents:(id)a3 inCalendar:(id)a4;
- (id)description;
- (int64_t)compare:(id)a3 inCalendar:(id)a4;
- (int64_t)precision;
@end

@implementation TTRComplicationReminderDueDate

- (TTRComplicationReminderDueDate)initWithDate:(id)a3 precision:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TTRComplicationReminderDueDate;
  v8 = [(TTRComplicationReminderDueDate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_date, a3);
    v9->_precision = a4;
  }

  return v9;
}

- (TTRComplicationReminderDueDate)initWithDateComponents:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 timeZone];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSTimeZone systemTimeZone];
  }
  objc_super v11 = v10;

  v12 = +[NSDateComponents rem_dateWithDateComponents:v6 timeZone:v11];
  if (v12)
  {
    uint64_t v13 = objc_msgSend(v6, "rem_isAllDayDateComponents") ^ 1;
    if (v13)
    {
      id v15 = v12;
    }
    else
    {
      v14 = [v7 dateByAddingUnit:16 value:1 toDate:v12 options:1024];
      id v15 = [v14 dateByAddingTimeInterval:-1.0];
    }
    self = [(TTRComplicationReminderDueDate *)self initWithDate:v15 precision:v13];

    v17 = self;
  }
  else
  {
    v16 = +[REMLog ui];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_B044((uint64_t)v6, (uint64_t)v11, v16);
    }

    v17 = 0;
  }

  return v17;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(TTRComplicationReminderDueDate *)self date];
  int64_t v5 = [(TTRComplicationReminderDueDate *)self precision];
  CFStringRef v6 = @"Exact";
  if (!v5) {
    CFStringRef v6 = @"All Day";
  }
  id v7 = +[NSString stringWithFormat:@"<%p %@: date=%@, precision=%@>", self, v3, v4, v6];

  return v7;
}

- (int64_t)compare:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  if (![(TTRComplicationReminderDueDate *)self isInSameDayAsDueDate:v6 inCalendar:a4])goto LABEL_10; {
  int64_t v7 = [(TTRComplicationReminderDueDate *)self precision];
  }
  v8 = (char *)[v6 precision];
  if (v7 == 1)
  {
    if (v8) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = -1;
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else if (v7 || (int64_t v9 = v8 == (unsigned char *)&dword_0 + 1, v8 != (unsigned char *)&dword_0 + 1))
  {
LABEL_10:
    id v10 = [(TTRComplicationReminderDueDate *)self date];
    objc_super v11 = [v6 date];
    int64_t v9 = (int64_t)[v10 compare:v11];
  }
  return v9;
}

- (BOOL)isEqualToDueDate:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRComplicationReminderDueDate *)self precision];
  if (v5 == [v4 precision])
  {
    id v6 = [(TTRComplicationReminderDueDate *)self date];
    int64_t v7 = [v4 date];
    unsigned __int8 v8 = [v6 isEqualToDate:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(TTRComplicationReminderDueDate *)self isEqualToDueDate:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isInSameDayAsDueDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(TTRComplicationReminderDueDate *)self date];
  int64_t v9 = [v7 date];

  LOBYTE(v7) = [v6 isDate:v8 inSameDayAsDate:v9];
  return (char)v7;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)precision
{
  return self->_precision;
}

- (void).cxx_destruct
{
}

@end