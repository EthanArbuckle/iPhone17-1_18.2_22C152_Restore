@interface HFAnalyticsEvent
- (HFAnalyticsEvent)initWithData:(id)a3;
- (HFAnalyticsEvent)initWithEventType:(unint64_t)a3;
- (NSDate)timestamp;
- (NSDictionary)payload;
- (NSString)name;
- (id)description;
- (unint64_t)type;
- (void)setTimestamp:(id)a3;
@end

@implementation HFAnalyticsEvent

- (void).cxx_destruct
{
}

- (NSString)name
{
  unint64_t v2 = [(HFAnalyticsEvent *)self type];
  return (NSString *)+[HFAnalytics eventNameForEventType:v2];
}

- (unint64_t)type
{
  return self->_type;
}

- (HFAnalyticsEvent)initWithEventType:(unint64_t)a3
{
  if ([(HFAnalyticsEvent *)self isMemberOfClass:objc_opt_class()]) {
    NSLog(&cfstr_Initwitheventt.isa);
  }
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsEvent;
  v5 = [(HFAnalyticsEvent *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = a3;
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v7;
  }
  return v6;
}

- (NSDictionary)payload
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"timestamp";
  unint64_t v2 = [(HFAnalyticsEvent *)self timestamp];
  v3 = objc_msgSend(v2, "hf_analyticsTimestamp");
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (HFAnalyticsEvent)initWithData:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFAnalyticsEvent.m", 22, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAnalyticsEvent initWithData:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFAnalyticsEvent *)self name];
  id v5 = (id)[v3 appendObject:v4 withName:@"name"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(HFAnalyticsEvent *)self payload];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [(HFAnalyticsEvent *)self payload];
        v13 = [v12 objectForKeyedSubscript:v11];
        id v14 = (id)[v3 appendObject:v13 withName:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [v3 build];

  return v15;
}

- (void)setTimestamp:(id)a3
{
}

@end