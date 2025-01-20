@interface HKRemoteDateIntervals
- (HKRemoteDateIntervals)initWithDisplayType:(id)a3 fromEndDate:(id)a4;
- (HKRemoteDateIntervals)initWithQueryAlignment:(int64_t)a3 fromEndDate:(id)a4;
- (id)_dateIntervalFromDate:(id)a3 forUnit:(unint64_t)a4 withValue:(int64_t)a5 queryAlignment:(int64_t)a6 gregorianCalendar:(id)a7;
- (id)dateIntervalForTimeScope:(int64_t)a3 withGregorianCalendar:(id)a4 error:(id *)a5;
@end

@implementation HKRemoteDateIntervals

- (HKRemoteDateIntervals)initWithDisplayType:(id)a3 fromEndDate:(id)a4
{
  id v6 = a4;
  v7 = [a3 behavior];
  v8 = -[HKRemoteDateIntervals initWithQueryAlignment:fromEndDate:](self, "initWithQueryAlignment:fromEndDate:", [v7 preferredCalendarDayAlignment], v6);

  return v8;
}

- (HKRemoteDateIntervals)initWithQueryAlignment:(int64_t)a3 fromEndDate:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRemoteDateIntervals;
  v8 = [(HKRemoteDateIntervals *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dateIntervals = v8->_dateIntervals;
    v8->_dateIntervals = v9;

    v8->_calendarDayAlignment = a3;
    objc_storeStrong((id *)&v8->_endDate, a4);
  }

  return v8;
}

- (id)dateIntervalForTimeScope:(int64_t)a3 withGregorianCalendar:(id)a4 error:(id *)a5
{
  id v8 = a4;
  dateIntervals = self->_dateIntervals;
  v10 = [NSNumber numberWithInteger:a3];
  v11 = [(NSMutableDictionary *)dateIntervals objectForKey:v10];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    switch(a3)
    {
      case 0:
        [(HKRemoteDateIntervals *)self _dateIntervalFromDate:self->_endDate forUnit:4 withValue:-10 queryAlignment:self->_calendarDayAlignment gregorianCalendar:v8];

        goto LABEL_5;
      case 1:
LABEL_5:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 4;
        uint64_t v17 = -5;
        goto LABEL_14;
      case 2:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 4;
        goto LABEL_13;
      case 3:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 0x2000;
        uint64_t v17 = -26;
        goto LABEL_14;
      case 4:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 16;
        uint64_t v17 = -31;
        goto LABEL_14;
      case 5:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 16;
        uint64_t v17 = -7;
        goto LABEL_14;
      case 6:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 16;
        goto LABEL_13;
      case 7:
        int64_t calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        uint64_t v16 = 32;
LABEL_13:
        uint64_t v17 = -1;
LABEL_14:
        id v12 = [(HKRemoteDateIntervals *)v15 _dateIntervalFromDate:endDate forUnit:v16 withValue:v17 queryAlignment:calendarDayAlignment gregorianCalendar:v8];
        goto LABEL_15;
      case 8:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"HKTimeScopeCount is not a valid time scope for a date interval.");
        id v12 = 0;
        break;
      default:
        id v12 = 0;
LABEL_15:
        v18 = self->_dateIntervals;
        v19 = [NSNumber numberWithInteger:a3];
        [(NSMutableDictionary *)v18 setObject:v12 forKeyedSubscript:v19];

        break;
    }
  }

  return v12;
}

- (id)_dateIntervalFromDate:(id)a3 forUnit:(unint64_t)a4 withValue:(int64_t)a5 queryAlignment:(int64_t)a6 gregorianCalendar:(id)a7
{
  id v11 = a7;
  id v12 = objc_msgSend(a3, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, a4);
  v13 = [v11 dateByAddingUnit:a4 value:1 toDate:v12 options:0];
  v14 = [v11 dateByAddingUnit:a4 value:a5 toDate:v13 options:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v13];
  uint64_t v16 = objc_msgSend(v15, "hk_dateIntervalShiftedToQueryAlignment:calendar:", a6, v11);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_dateIntervals, 0);
}

@end