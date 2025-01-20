@interface HKMCLoggedDataMetric
+ (NSString)eventName;
- (HKMCLoggedDataMetric)initWithMethod:(id)a3;
- (NSDictionary)eventPayload;
- (NSNumber)dayIndexLoggingOffset;
- (NSString)method;
- (id)description;
- (void)setDayIndexLoggingOffset:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKMCLoggedDataMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.LoggedData";
}

- (HKMCLoggedDataMetric)initWithMethod:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCLoggedDataMetric;
  v6 = [(HKMCLoggedDataMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_method, a3);
  }

  return v7;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HKMCLoggedDataMetric *)self method];
  [v3 setObject:v4 forKeyedSubscript:@"method"];

  id v5 = [(HKMCLoggedDataMetric *)self dayIndexLoggingOffset];
  [v3 setObject:v5 forKeyedSubscript:@"dayIndexLoggingOffset"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKMCLoggedDataMetric *)self method];
  v6 = [(HKMCLoggedDataMetric *)self dayIndexLoggingOffset];
  v7 = [v3 stringWithFormat:@"<%@:%p method:%@ dayIndexLoggingOffset:%@>", v4, self, v5, v6];

  return v7;
}

- (void)setEventPayload:(id)a3
{
}

- (NSString)method
{
  return self->_method;
}

- (NSNumber)dayIndexLoggingOffset
{
  return self->_dayIndexLoggingOffset;
}

- (void)setDayIndexLoggingOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayIndexLoggingOffset, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end