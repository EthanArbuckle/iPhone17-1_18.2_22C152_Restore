@interface _HKDateCalendarUnitKey
- (BOOL)isEqual:(id)a3;
- (NSCalendar)calendar;
- (NSDate)date;
- (_HKDateCalendarUnitKey)initWithDate:(id)a3 calendar:(id)a4 unit:(unint64_t)a5;
- (unint64_t)calendarUnit;
- (unint64_t)hash;
@end

@implementation _HKDateCalendarUnitKey

- (_HKDateCalendarUnitKey)initWithDate:(id)a3 calendar:(id)a4 unit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"NSCalendar+HKCalendar.m", 60, @"Invalid parameter not satisfying: %@", @"date != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"NSCalendar+HKCalendar.m", 61, @"Invalid parameter not satisfying: %@", @"calendar != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)_HKDateCalendarUnitKey;
  v12 = [(_HKDateCalendarUnitKey *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_calendar, a4);
    v12->_calendarUnit = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [(_HKDateCalendarUnitKey *)self date];
    id v10 = [v8 date];
    if (v9 != v10)
    {
      uint64_t v11 = [v8 date];
      if (!v11)
      {
        BOOL v12 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v11;
      v4 = [(_HKDateCalendarUnitKey *)self date];
      v5 = [v8 date];
      if (![v4 isEqualToDate:v5])
      {
        BOOL v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      objc_super v18 = v5;
      v19 = v4;
      v20 = v3;
    }
    uint64_t v13 = [(_HKDateCalendarUnitKey *)self calendar];
    v14 = [v8 calendar];
    if (v13 == v14) {
      goto LABEL_12;
    }
    uint64_t v15 = [v8 calendar];
    if (!v15)
    {

      BOOL v12 = 0;
      goto LABEL_18;
    }
    v4 = (void *)v15;
    v5 = [(_HKDateCalendarUnitKey *)self calendar];
    v3 = [v8 calendar];
    if ([v5 isEqual:v3])
    {
LABEL_12:
      unint64_t v16 = [(_HKDateCalendarUnitKey *)self calendarUnit];
      BOOL v12 = v16 == [v8 calendarUnit];
      if (v13 == v14)
      {

        goto LABEL_17;
      }
    }
    else
    {
      BOOL v12 = 0;
    }

LABEL_17:
LABEL_18:
    v4 = v19;
    v3 = v20;
    v5 = v18;
    if (v9 != v10) {
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v12 = 0;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(_HKDateCalendarUnitKey *)self date];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_HKDateCalendarUnitKey calendarUnit](self, "calendarUnit"));
  uint64_t v6 = [v5 hash];
  id v7 = [(_HKDateCalendarUnitKey *)self calendar];
  id v8 = [v7 calendarIdentifier];
  uint64_t v9 = v4 ^ [v8 hash];
  id v10 = [(_HKDateCalendarUnitKey *)self calendar];
  uint64_t v11 = [v10 timeZone];
  unint64_t v12 = v6 ^ v9 ^ [v11 hash];

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)calendarUnit
{
  return self->_calendarUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end