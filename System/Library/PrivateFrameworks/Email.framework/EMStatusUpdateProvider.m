@interface EMStatusUpdateProvider
- (id)_statusUpdatedAtTimeWithDate:(id)a3;
- (id)_statusUpdatedMinutesAgoWithDate:(id)a3 now:(id)a4;
- (id)_statusUpdatedOnDateWithDate:(id)a3;
- (id)_statusUpdatedOnDayWithDate:(id)a3;
- (id)statusUpdateStringWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5;
- (unint64_t)statusUpdateWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5;
@end

@implementation EMStatusUpdateProvider

- (id)statusUpdateStringWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(EMStatusUpdateProvider *)self statusUpdateWithDate:v8 now:v9 nextTransition:a5];
  v11 = &stru_1F1A3DFB0;
  switch(v10)
  {
    case 0uLL:
      break;
    case 1uLL:
      v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"UPDATED_JUST_NOW" value:&stru_1F1A3DFB0 table:@"Main"];
      goto LABEL_7;
    case 2uLL:
      uint64_t v14 = [(EMStatusUpdateProvider *)self _statusUpdatedMinutesAgoWithDate:v8 now:v9];
      goto LABEL_10;
    case 3uLL:
      uint64_t v14 = [(EMStatusUpdateProvider *)self _statusUpdatedAtTimeWithDate:v8];
      goto LABEL_10;
    case 4uLL:
      v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"UPDATED_YESTERDAY" value:&stru_1F1A3DFB0 table:@"Main"];
LABEL_7:
      v11 = (__CFString *)v13;

      break;
    case 5uLL:
      uint64_t v14 = [(EMStatusUpdateProvider *)self _statusUpdatedOnDayWithDate:v8];
      goto LABEL_10;
    case 6uLL:
      uint64_t v14 = [(EMStatusUpdateProvider *)self _statusUpdatedOnDateWithDate:v8];
LABEL_10:
      v11 = (__CFString *)v14;
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (unint64_t)statusUpdateWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  unint64_t v10 = 0;
  if (v7 && v8)
  {
    v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v11 components:30 fromDate:v9];
    v23 = v21 = a5;
    uint64_t v13 = [v11 dateFromComponents:v23];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v14 setDay:-6];
    v22 = [v11 dateByAddingComponents:v14 toDate:v13 options:0];
    if (objc_msgSend(v7, "compare:") == -1)
    {
      id v18 = 0;
      unint64_t v10 = 6;
    }
    else
    {
      v20 = v12;
      v15 = [v11 components:112 fromDate:v7 toDate:v9 options:0];
      if ([v15 day] <= 0 && objc_msgSend(v15, "hour") <= 0 && objc_msgSend(v15, "minute") < 6)
      {
        id v18 = v7;
        if ([v15 minute] < 2)
        {
          [v12 setMinute:2];
          unint64_t v10 = 1;
        }
        else
        {
          objc_msgSend(v12, "setMinute:", objc_msgSend(v15, "minute") + 1);
          unint64_t v10 = 2;
        }
      }
      else
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        [v16 setDay:-1];
        v17 = [v11 dateByAddingComponents:v16 toDate:v13 options:0];
        if ([v7 compare:v17] == -1)
        {
          unint64_t v10 = 5;
        }
        else if ([v7 compare:v13] == -1)
        {
          unint64_t v10 = 4;
        }
        else
        {
          unint64_t v10 = 3;
        }
        id v18 = v13;
        [v20 setDay:1];

        id v12 = v20;
      }

      if (v21 && v18)
      {
        id *v21 = [v11 dateByAddingComponents:v12 toDate:v18 options:0];
      }
    }
  }
  return v10;
}

- (id)_statusUpdatedMinutesAgoWithDate:(id)a3 now:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = [v7 components:64 fromDate:v5 toDate:v6 options:0];

  id v9 = NSString;
  unint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v10 localizedStringForKey:@"UPDATED_N_MINUTES_AGO_FORMAT%1$ld" value:&stru_1F1A3DFB0 table:@"Main"];
  id v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v8, "minute"));

  return v12;
}

- (id)_statusUpdatedAtTimeWithDate:(id)a3
{
  id v4 = a3;
  if (!self->_timeFormatter)
  {
    id v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    timeFormatter = self->_timeFormatter;
    self->_timeFormatter = v5;

    [(NSDateFormatter *)self->_timeFormatter setDateStyle:0];
    [(NSDateFormatter *)self->_timeFormatter setTimeStyle:1];
  }
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 localizedStringForKey:@"UPDATED_AT_TIME_FORMAT" value:&stru_1F1A3DFB0 table:@"Main"];

  id v9 = NSString;
  unint64_t v10 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v4];
  v11 = objc_msgSend(v9, "stringWithFormat:", v8, v10);

  return v11;
}

- (id)_statusUpdatedOnDayWithDate:(id)a3
{
  id v4 = a3;
  if (!self->_weekdayFormatter)
  {
    id v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    weekdayFormatter = self->_weekdayFormatter;
    self->_weekdayFormatter = v5;

    [(NSDateFormatter *)self->_weekdayFormatter setDateFormat:@"EEEE"];
  }
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 localizedStringForKey:@"UPDATED_WEEKDAY_FORMAT" value:&stru_1F1A3DFB0 table:@"Main"];

  id v9 = NSString;
  unint64_t v10 = [(NSDateFormatter *)self->_weekdayFormatter stringFromDate:v4];
  v11 = objc_msgSend(v9, "stringWithFormat:", v8, v10);

  return v11;
}

- (id)_statusUpdatedOnDateWithDate:(id)a3
{
  id v4 = a3;
  if (!self->_dateFormatter)
  {
    id v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v5;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
  }
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 localizedStringForKey:@"UPDATED_ON_DATE_FORMAT" value:&stru_1F1A3DFB0 table:@"Main"];

  id v9 = NSString;
  unint64_t v10 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
  v11 = objc_msgSend(v9, "stringWithFormat:", v8, v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

@end