@interface ASDateUtils
+ (id)eventEndDateFromDate:(id)a3;
+ (id)eventStartDateFromDate:(id)a3;
+ (id)predicateForEventsWithDateRangeFromDate:(id)a3 toDate:(id)a4;
+ (id)subtractDays:(int64_t)a3 fromDate:(id)a4;
@end

@implementation ASDateUtils

+ (id)eventStartDateFromDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSDate date];
  }
  v6 = v5;

  return v6;
}

+ (id)eventEndDateFromDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSDate date];
  }
  v6 = v5;

  return v6;
}

+ (id)predicateForEventsWithDateRangeFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v5 | v6))
  {
    v8 = +[NSPredicate predicateWithValue:1];
    v7 = 0;
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]";
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s No start date specified. Defaulting to [NSDate distantPast]", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v5 = +[NSDate distantPast];
    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    v10 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]";
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s No end date specified. Defaulting to [NSDate distantFuture]", (uint8_t *)&v12, 0xCu);
    }
    v7 = +[NSDate distantFuture];
  }
LABEL_12:
  if ([v7 compare:v5] == (id)-1)
  {
    v8 = 0;
  }
  else
  {
    v8 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v5 to:v7];
  }
LABEL_15:

  return v8;
}

+ (id)subtractDays:(int64_t)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSDateComponents);
  [v6 setDay:-a3];
  v7 = +[NSCalendar currentCalendar];
  v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];

  return v8;
}

@end