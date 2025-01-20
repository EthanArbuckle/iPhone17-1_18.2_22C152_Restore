@interface DDMatchCalendarEvent
- (BOOL)isAllDay;
- (DDMatchCalendarEvent)initWithDDScannerResult:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSTimeZone)endTimeZone;
- (NSTimeZone)startTimeZone;
@end

@implementation DDMatchCalendarEvent

- (DDMatchCalendarEvent)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DDMatchCalendarEvent;
  v5 = [(DDMatch *)&v25 initWithDDScannerResult:v4];
  if (v5)
  {
    [v4 coreResult];
    if ((DDResultHasType() & 1) != 0 || DDResultHasType())
    {
      BOOL v24 = 0;
      id v22 = 0;
      id v23 = 0;
      id v20 = 0;
      id v21 = 0;
      int v6 = [v4 extractStartDate:&v23 startTimezone:&v22 endDate:&v21 endTimezone:&v20 allDayRef:&v24 referenceDate:0 referenceTimezone:0];
      id v7 = v23;
      id v18 = v23;
      id v8 = v22;
      id v9 = v22;
      id v10 = v21;
      id v11 = v21;
      id v12 = v20;
      id v13 = v20;
      if (v6)
      {
        objc_storeStrong((id *)&v5->_startDate, v7);
        objc_storeStrong((id *)&v5->_startTimeZone, v8);
        objc_storeStrong((id *)&v5->_endDate, v10);
        objc_storeStrong((id *)&v5->_endTimeZone, v12);
        v5->_allDay = v24;
      }
    }
    else
    {
      BOOL v24 = 0;
      id v19 = 0;
      v14 = [v4 dateFromReferenceDate:0 referenceTimezone:0 timezoneRef:&v19 allDayRef:&v24];
      id v15 = v19;
      id v16 = v19;
      if (v14)
      {
        objc_storeStrong((id *)&v5->_startDate, v14);
        objc_storeStrong((id *)&v5->_startTimeZone, v15);
        v5->_allDay = v24;
      }
    }
  }

  return v5;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSTimeZone)startTimeZone
{
  return self->_startTimeZone;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)endTimeZone
{
  return self->_endTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end