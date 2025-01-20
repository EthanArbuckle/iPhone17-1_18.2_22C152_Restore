@interface CPAnalyticsEvent
+ (id)dayOfWeekFromDate:(id)a3;
+ (id)hourOfDayFromDate:(id)a3;
+ (void)initialize;
- (CPAnalyticsEvent)initWithName:(id)a3 payload:(id)a4 systemProperties:(id)a5;
- (CPAnalyticsSystemProperties)systemProperties;
- (NSCalendar)gregorianCalendar;
- (NSDate)timestamp;
- (NSDictionary)payload;
- (NSString)name;
- (id)copyRawPayload;
- (id)propertyForKey:(id)a3;
@end

@implementation CPAnalyticsEvent

- (CPAnalyticsEvent)initWithName:(id)a3 payload:(id)a4 systemProperties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsEvent;
  v12 = [(CPAnalyticsEvent *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_payload, a4);
    uint64_t v14 = +[CPAnalytics currentDate];
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v14;

    objc_storeStrong((id *)&v13->_systemProperties, a5);
  }

  return v13;
}

uint64_t __30__CPAnalyticsEvent_initialize__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  gregorianCalendar = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_712);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_systemProperties, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (CPAnalyticsSystemProperties)systemProperties
{
  return self->_systemProperties;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)name
{
  return self->_name;
}

- (id)copyRawPayload
{
  v2 = [(CPAnalyticsEvent *)self payload];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"cpa_common_hourOfDay"])
  {
    v5 = objc_opt_class();
    v6 = [(CPAnalyticsEvent *)self timestamp];
    uint64_t v7 = [v5 hourOfDayFromDate:v6];
LABEL_5:
    id v9 = (void *)v7;
LABEL_6:

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"cpa_common_dayOfWeek"])
  {
    v8 = objc_opt_class();
    v6 = [(CPAnalyticsEvent *)self timestamp];
    uint64_t v7 = [v8 dayOfWeekFromDate:v6];
    goto LABEL_5;
  }
  id v11 = [(CPAnalyticsEvent *)self payload];
  id v9 = [v11 objectForKey:v4];

  if (!v9)
  {
    v6 = [(CPAnalyticsEvent *)self systemProperties];
    v12 = [(CPAnalyticsEvent *)self name];
    v13 = [(CPAnalyticsEvent *)self payload];
    id v9 = [v6 propertyForKey:v4 forEventName:v12 payloadForSystemPropertyExtraction:v13];

    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

+ (id)dayOfWeekFromDate:(id)a3
{
  uint64_t v3 = [(id)gregorianCalendar component:512 fromDate:a3];
  id v4 = NSNumber;
  return (id)[v4 numberWithInteger:v3];
}

+ (id)hourOfDayFromDate:(id)a3
{
  uint64_t v3 = [(id)gregorianCalendar component:32 fromDate:a3];
  id v4 = NSNumber;
  return (id)[v4 numberWithInteger:v3];
}

@end