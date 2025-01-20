@interface UTCDateFormatter
- (HKDateCache)dateCache;
- (NSDateFormatter)monthDayYearFormatter;
- (NSDateFormatter)shortMonthDayFormatter;
- (NSDateFormatter)shortMonthYearFormatter;
- (NSDateFormatter)todayFormatter;
- (UTCDateFormatter)initWithDateCache:(id)a3;
- (id)relativeStringFromDate:(id)a3;
@end

@implementation UTCDateFormatter

- (UTCDateFormatter)initWithDateCache:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)UTCDateFormatter;
  v6 = [(UTCDateFormatter *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateCache, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthDayYearFormatter = v7->_monthDayYearFormatter;
    v7->_monthDayYearFormatter = v8;

    v10 = v7->_monthDayYearFormatter;
    v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v10 setTimeZone:v11];

    [(NSDateFormatter *)v7->_monthDayYearFormatter setDateStyle:3];
    [(NSDateFormatter *)v7->_monthDayYearFormatter setTimeStyle:0];
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    shortMonthDayFormatter = v7->_shortMonthDayFormatter;
    v7->_shortMonthDayFormatter = v12;

    v14 = v7->_shortMonthDayFormatter;
    v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v14 setTimeZone:v15];

    v16 = (void *)MEMORY[0x1E4F28C10];
    v17 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v18 = [v16 dateFormatFromTemplate:@"MMM d" options:0 locale:v17];

    [(NSDateFormatter *)v7->_shortMonthDayFormatter setDateFormat:v18];
    v19 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    shortMonthYearFormatter = v7->_shortMonthYearFormatter;
    v7->_shortMonthYearFormatter = v19;

    v21 = v7->_shortMonthYearFormatter;
    v22 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v21 setTimeZone:v22];

    v23 = (void *)MEMORY[0x1E4F28C10];
    v24 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v25 = [v23 dateFormatFromTemplate:@"MMM y" options:0 locale:v24];

    [(NSDateFormatter *)v7->_shortMonthYearFormatter setDateFormat:v25];
    v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    todayFormatter = v7->_todayFormatter;
    v7->_todayFormatter = v26;

    v28 = v7->_todayFormatter;
    v29 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [(NSDateFormatter *)v28 setTimeZone:v29];

    [(NSDateFormatter *)v7->_todayFormatter setDateStyle:2];
    [(NSDateFormatter *)v7->_todayFormatter setDoesRelativeDateFormatting:1];
  }
  return v7;
}

- (id)relativeStringFromDate:(id)a3
{
  id v4 = a3;
  id v5 = [(UTCDateFormatter *)self dateCache];
  if ([v5 isDateInToday:v4])
  {

LABEL_4:
    uint64_t v8 = 32;
    goto LABEL_7;
  }
  v6 = [(UTCDateFormatter *)self dateCache];
  char v7 = [v6 isDateInYesterday:v4];

  if (v7) {
    goto LABEL_4;
  }
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v9 component:4 fromDate:v10];

  v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v13 = [v12 component:4 fromDate:v4];

  uint64_t v8 = 24;
  if (v13 == v11) {
    uint64_t v8 = 16;
  }
LABEL_7:
  v14 = [*(id *)((char *)&self->super.isa + v8) stringFromDate:v4];

  return v14;
}

- (NSDateFormatter)monthDayYearFormatter
{
  return self->_monthDayYearFormatter;
}

- (NSDateFormatter)shortMonthDayFormatter
{
  return self->_shortMonthDayFormatter;
}

- (NSDateFormatter)shortMonthYearFormatter
{
  return self->_shortMonthYearFormatter;
}

- (NSDateFormatter)todayFormatter
{
  return self->_todayFormatter;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_todayFormatter, 0);
  objc_storeStrong((id *)&self->_shortMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_shortMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayYearFormatter, 0);
}

@end