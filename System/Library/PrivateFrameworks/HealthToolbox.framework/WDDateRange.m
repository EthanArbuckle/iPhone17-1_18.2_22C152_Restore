@interface WDDateRange
+ (id)dateRangeWithStartDate:(id)a3 endDate:(id)a4;
+ (id)dateRangeWithTimePeriod:(int64_t)a3 anchorDate:(id)a4;
- (BOOL)dateInRange:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (WDDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (WDDateRange)initWithTimePeriod:(int64_t)a3 anchorDate:(id)a4;
- (id)_getEndDateFromStartDate:(id)a3 timePeriod:(int64_t)a4;
- (id)_getStartDateFromAnchorDate:(id)a3 timePeriod:(int64_t)a4;
- (id)description;
@end

@implementation WDDateRange

+ (id)dateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithStartDate:v7 endDate:v6];

  return v8;
}

+ (id)dateRangeWithTimePeriod:(int64_t)a3 anchorDate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithTimePeriod:a3 anchorDate:v6];

  return v7;
}

- (WDDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(WDDateRange *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (WDDateRange)initWithTimePeriod:(int64_t)a3 anchorDate:(id)a4
{
  id v6 = a4;
  id v7 = [(WDDateRange *)self init];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(WDDateRange *)v7 _getStartDateFromAnchorDate:v6 timePeriod:a3];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v9;

    uint64_t v11 = [(WDDateRange *)v8 _getEndDateFromStartDate:v8->_startDate timePeriod:a3];
    endDate = v8->_endDate;
    v8->_endDate = (NSDate *)v11;
  }
  return v8;
}

- (BOOL)dateInRange:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [(NSDate *)startDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v5 timeIntervalSinceReferenceDate];
  double v11 = v10;

  return v11 <= v9 && v7 <= v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSDate *)self->_startDate description];
  id v5 = [(NSDate *)self->_endDate description];
  double v6 = [v3 stringWithFormat:@"WDDateRange(%@ %@)", v4, v5];

  return v6;
}

- (id)_getStartDateFromAnchorDate:(id)a3 timePeriod:(int64_t)a4
{
  id v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  double v7 = [v5 currentCalendar];
  double v8 = [v7 components:8716 fromDate:v6];

  [v8 setHour:0];
  [v8 setMinute:0];
  [v8 setSecond:0];
  switch(a4)
  {
    case 0:
      goto LABEL_5;
    case 1:
      [v8 setWeekday:1];
      goto LABEL_5;
    case 2:
      [v8 setDay:1];
LABEL_5:
      double v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v9 = [v10 dateFromComponents:v8];
      goto LABEL_16;
    case 3:
      double v11 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v10 = [v11 dateFromComponents:v8];

      id v12 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v12 setMonth:-2];
      v13 = [MEMORY[0x263EFF8F0] currentCalendar];
      v14 = v13;
      id v15 = v12;
      v16 = v10;
      goto LABEL_15;
    case 4:
      id v17 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v10 = v17;
      uint64_t v18 = -5;
      goto LABEL_14;
    case 5:
      id v17 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v10 = v17;
      goto LABEL_13;
    case 6:
      id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v10 = v19;
      uint64_t v20 = -1;
      goto LABEL_12;
    case 7:
      id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v10 = v19;
      uint64_t v20 = -4;
      goto LABEL_12;
    case 8:
      id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v10 = v19;
      uint64_t v20 = -9;
LABEL_12:
      [v19 setYear:v20];
      id v17 = v10;
LABEL_13:
      uint64_t v18 = -11;
LABEL_14:
      [v17 setMonth:v18];
      id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      v14 = [MEMORY[0x263EFF910] date];
      v13 = v12;
      id v15 = v10;
      v16 = v14;
LABEL_15:
      double v9 = [v13 dateByAddingComponents:v15 toDate:v16 options:0];

LABEL_16:
      break;
    default:
      double v9 = 0;
      break;
  }

  return v9;
}

- (id)_getEndDateFromStartDate:(id)a3 timePeriod:(int64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF918];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  double v8 = v7;
  switch(a4)
  {
    case 0:
      [v7 setDay:1];
      break;
    case 1:
      [v7 setWeekOfYear:1];
      break;
    case 2:
      uint64_t v9 = 1;
      goto LABEL_7;
    case 3:
      uint64_t v9 = 3;
      goto LABEL_7;
    case 4:
      uint64_t v9 = 6;
LABEL_7:
      [v7 setMonth:v9];
      break;
    case 5:
      uint64_t v10 = 1;
      goto LABEL_12;
    case 6:
      uint64_t v10 = 2;
      goto LABEL_12;
    case 7:
      uint64_t v10 = 5;
      goto LABEL_12;
    case 8:
      uint64_t v10 = 10;
LABEL_12:
      [v7 setYear:v10];
      break;
    default:
      break;
  }
  double v11 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v12 = [v11 dateByAddingComponents:v8 toDate:v6 options:0];

  return v12;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end