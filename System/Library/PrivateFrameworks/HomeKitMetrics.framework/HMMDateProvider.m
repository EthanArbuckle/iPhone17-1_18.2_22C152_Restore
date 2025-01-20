@interface HMMDateProvider
+ (HMMDateProvider)sharedInstance;
+ (NSCalendar)gmtCalendar;
+ (id)calendarForTimeZone:(id)a3;
+ (id)dateFromYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
+ (id)startOfDateByAddingDayCount:(int64_t)a3 toDate:(id)a4;
+ (id)startOfDayForDate:(id)a3;
+ (id)startOfWeekForDate:(id)a3;
+ (int64_t)dayNumberOfWeekForDate:(id)a3;
+ (int64_t)daysFromDate:(id)a3 toDate:(id)a4;
- (HMMDateProvider)init;
- (HMMDateProvider)initWithLocalTimeZone:(id)a3;
- (NSCalendar)localCalendar;
- (NSDate)currentDate;
- (id)startOfCurrentDay;
- (id)startOfCurrentMonth;
- (id)startOfCurrentWeek;
- (id)startOfCurrentYear;
- (id)startOfDayByAddingDayCount:(int64_t)a3;
- (int64_t)currentDayNumberOfWeek;
- (int64_t)localHourOfDay;
@end

@implementation HMMDateProvider

- (id)startOfCurrentDay
{
  v3 = +[HMMDateProvider gmtCalendar];
  v4 = [(HMMDateProvider *)self currentDate];
  v5 = [v3 startOfDayForDate:v4];

  return v5;
}

- (NSDate)currentDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] now];
}

+ (NSCalendar)gmtCalendar
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HMMDateProvider_gmtCalendar__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gmtCalendar_onceToken != -1) {
    dispatch_once(&gmtCalendar_onceToken, block);
  }
  v2 = (void *)gmtCalendar_gmtCalendar;
  return (NSCalendar *)v2;
}

- (void).cxx_destruct
{
}

- (NSCalendar)localCalendar
{
  return self->_localCalendar;
}

- (int64_t)localHourOfDay
{
  v3 = [(HMMDateProvider *)self localCalendar];
  v4 = [(HMMDateProvider *)self currentDate];
  v5 = [v3 components:32 fromDate:v4];

  int64_t v6 = [v5 hour];
  return v6;
}

- (id)startOfCurrentYear
{
  v3 = +[HMMDateProvider gmtCalendar];
  id v7 = 0;
  v4 = [(HMMDateProvider *)self currentDate];
  [v3 rangeOfUnit:4 startDate:&v7 interval:0 forDate:v4];
  id v5 = v7;

  return v5;
}

- (id)startOfCurrentMonth
{
  v3 = +[HMMDateProvider gmtCalendar];
  id v7 = 0;
  v4 = [(HMMDateProvider *)self currentDate];
  [v3 rangeOfUnit:8 startDate:&v7 interval:0 forDate:v4];
  id v5 = v7;

  return v5;
}

- (id)startOfCurrentWeek
{
  v2 = [(HMMDateProvider *)self currentDate];
  v3 = +[HMMDateProvider startOfWeekForDate:v2];

  return v3;
}

- (int64_t)currentDayNumberOfWeek
{
  v2 = [(HMMDateProvider *)self currentDate];
  int64_t v3 = +[HMMDateProvider dayNumberOfWeekForDate:v2];

  return v3;
}

- (id)startOfDayByAddingDayCount:(int64_t)a3
{
  v4 = [(HMMDateProvider *)self currentDate];
  id v5 = +[HMMDateProvider startOfDateByAddingDayCount:a3 toDate:v4];

  return v5;
}

- (HMMDateProvider)initWithLocalTimeZone:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMDateProvider;
  id v5 = [(HMMDateProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[HMMDateProvider calendarForTimeZone:v4];
    localCalendar = v5->_localCalendar;
    v5->_localCalendar = (NSCalendar *)v6;
  }
  return v5;
}

- (HMMDateProvider)init
{
  int64_t v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  id v4 = [(HMMDateProvider *)self initWithLocalTimeZone:v3];

  return v4;
}

+ (id)startOfWeekForDate:(id)a3
{
  id v3 = a3;
  id v4 = +[HMMDateProvider gmtCalendar];
  id v7 = 0;
  [v4 rangeOfUnit:0x2000 startDate:&v7 interval:0 forDate:v3];

  id v5 = v7;
  return v5;
}

+ (int64_t)dayNumberOfWeekForDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 startOfWeekForDate:v4];
  uint64_t v6 = [a1 daysFromDate:v5 toDate:v4];

  return v6 + 1;
}

+ (int64_t)daysFromDate:(id)a3 toDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 gmtCalendar];
  objc_super v9 = [v8 components:16 fromDate:v7 toDate:v6 options:0];

  int64_t v10 = [v9 day];
  return v10;
}

+ (id)startOfDateByAddingDayCount:(int64_t)a3 toDate:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [v8 setDay:a3];
  objc_super v9 = [a1 gmtCalendar];
  int64_t v10 = [v9 dateByAddingComponents:v8 toDate:v7 options:0];

  v11 = [a1 gmtCalendar];
  v12 = [v11 startOfDayForDate:v10];

  return v12;
}

+ (id)startOfDayForDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 gmtCalendar];
  id v6 = [v5 startOfDayForDate:v4];

  return v6;
}

void __30__HMMDateProvider_gmtCalendar__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  uint64_t v2 = [v1 calendarForTimeZone:v4];
  id v3 = (void *)gmtCalendar_gmtCalendar;
  gmtCalendar_gmtCalendar = v2;
}

+ (id)calendarForTimeZone:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v6 setTimeZone:v4];

  [v6 setFirstWeekday:2];
  return v6;
}

+ (id)dateFromYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v8 setYear:a3];
  [v8 setMonth:a4];
  [v8 setDay:a5];
  objc_super v9 = +[HMMDateProvider gmtCalendar];
  [v8 setCalendar:v9];

  int64_t v10 = [v8 date];

  return v10;
}

+ (HMMDateProvider)sharedInstance
{
  if (sharedInstance__hmf_once_t0_2065 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0_2065, &__block_literal_global_2066);
  }
  uint64_t v2 = (void *)sharedInstance__hmf_once_v1_2067;
  return (HMMDateProvider *)v2;
}

uint64_t __33__HMMDateProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMMDateProvider);
  uint64_t v1 = sharedInstance__hmf_once_v1_2067;
  sharedInstance__hmf_once_v1_2067 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end