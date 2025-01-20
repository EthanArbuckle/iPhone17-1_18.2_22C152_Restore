@interface ATXAppIntentDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5;
@end

@implementation ATXAppIntentDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 7;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[_ATXDataStore sharedInstance];
  v9 = [v8 appIntentDuetEventsForActionsBetweenStartDate:v7 endDate:v6];

  return v9;
}

@end