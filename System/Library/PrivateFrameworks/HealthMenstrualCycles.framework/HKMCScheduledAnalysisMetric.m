@interface HKMCScheduledAnalysisMetric
+ (NSString)eventName;
- (HKMCScheduledAnalysisMetric)initWithTimeSuccessful:(int64_t)a3;
- (NSDictionary)eventPayload;
- (id)description;
- (int64_t)timeSuccessful;
- (void)setEventPayload:(id)a3;
- (void)setTimeSuccessful:(int64_t)a3;
@end

@implementation HKMCScheduledAnalysisMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.ScheduledAnalysis";
}

- (HKMCScheduledAnalysisMetric)initWithTimeSuccessful:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCScheduledAnalysisMetric;
  result = [(HKMCScheduledAnalysisMetric *)&v5 init];
  if (result) {
    result->_timeSuccessful = a3;
  }
  return result;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCScheduledAnalysisMetric timeSuccessful](self, "timeSuccessful"));
  [v3 setObject:v4 forKeyedSubscript:@"timeSuccessful"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCScheduledAnalysisMetric timeSuccessful](self, "timeSuccessful"));
  v6 = [v3 stringWithFormat:@"<%@:%p timeSuccessful:%@>", v4, self, v5];

  return v6;
}

- (void)setEventPayload:(id)a3
{
}

- (int64_t)timeSuccessful
{
  return self->_timeSuccessful;
}

- (void)setTimeSuccessful:(int64_t)a3
{
  self->_timeSuccessful = a3;
}

- (void).cxx_destruct
{
}

@end