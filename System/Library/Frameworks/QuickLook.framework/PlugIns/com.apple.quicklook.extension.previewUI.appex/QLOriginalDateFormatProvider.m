@interface QLOriginalDateFormatProvider
- (id)_originalStringAtTimeWithSender:(id)a3 date:(id)a4;
- (id)_originalStringDayWithSender:(id)a3 date:(id)a4;
- (id)_originalStringOnDateWithSender:(id)a3 date:(id)a4;
- (id)originalStringWithSender:(id)a3 date:(id)a4 now:(id)a5;
- (unint64_t)_originalFormatWithDate:(id)a3 now:(id)a4;
@end

@implementation QLOriginalDateFormatProvider

- (id)originalStringWithSender:(id)a3 date:(id)a4 now:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(QLOriginalDateFormatProvider *)self _originalFormatWithDate:v9 now:a5];
  v11 = &stru_100024EC8;
  switch(v10)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v12 = [(QLOriginalDateFormatProvider *)self _originalStringAtTimeWithSender:v8 date:v9];
      goto LABEL_7;
    case 2uLL:
      v13 = QLLocalizedString();
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3uLL:
      uint64_t v12 = [(QLOriginalDateFormatProvider *)self _originalStringDayWithSender:v8 date:v9];
      goto LABEL_7;
    case 4uLL:
      uint64_t v12 = [(QLOriginalDateFormatProvider *)self _originalStringOnDateWithSender:v8 date:v9];
LABEL_7:
      v11 = (__CFString *)v12;
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (unint64_t)_originalFormatWithDate:(id)a3 now:(id)a4
{
  id v5 = a3;
  unint64_t v6 = 0;
  if (v5 && a4)
  {
    id v7 = a4;
    id v8 = +[NSCalendar currentCalendar];
    id v9 = [v8 components:30 fromDate:v7];

    unint64_t v10 = [v8 dateFromComponents:v9];
    id v11 = objc_alloc_init((Class)NSDateComponents);
    [v11 setDay:-6];
    uint64_t v12 = [v8 dateByAddingComponents:v11 toDate:v10 options:0];
    if ([v5 compare:v12] == (id)-1)
    {
      unint64_t v6 = 4;
    }
    else
    {
      id v13 = objc_alloc_init((Class)NSDateComponents);
      [v13 setDay:-1];
      v14 = [v8 dateByAddingComponents:v13 toDate:v10 options:0];
      if ([v5 compare:v14] == (id)-1)
      {
        unint64_t v6 = 3;
      }
      else if ([v5 compare:v10] == (id)-1)
      {
        unint64_t v6 = 2;
      }
      else
      {
        unint64_t v6 = 1;
      }
    }
  }

  return v6;
}

- (id)_originalStringAtTimeWithSender:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_timeFormatter;
  objc_sync_enter(v8);
  if (!self->_timeFormatter)
  {
    id v9 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    timeFormatter = self->_timeFormatter;
    self->_timeFormatter = v9;

    [(NSDateFormatter *)self->_timeFormatter setDateStyle:0];
    [(NSDateFormatter *)self->_timeFormatter setTimeStyle:1];
  }
  id v11 = QLLocalizedString();
  uint64_t v12 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v7];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6, v12);

  objc_sync_exit(v8);

  return v13;
}

- (id)_originalStringDayWithSender:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_weekdayFormatter)
  {
    id v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    weekdayFormatter = self->_weekdayFormatter;
    self->_weekdayFormatter = v8;

    [(NSDateFormatter *)self->_weekdayFormatter setDateFormat:@"EEEE"];
  }
  unint64_t v10 = QLLocalizedString();
  id v11 = [(NSDateFormatter *)self->_weekdayFormatter stringFromDate:v7];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v11);

  return v12;
}

- (id)_originalStringOnDateWithSender:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_dateFormatter)
  {
    id v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v8;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
  }
  unint64_t v10 = QLLocalizedString();
  id v11 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v7];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);

  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

@end