@interface HFAnalyticsAppForegroundDurationEvent
- (BOOL)userHasAccessories;
- (HFAnalyticsAppForegroundDurationEvent)initWithData:(id)a3;
- (NSNumber)foregroundDuration;
- (NSString)processName;
- (id)payload;
- (void)setForegroundDuration:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setUserHasAccessories:(BOOL)a3;
@end

@implementation HFAnalyticsAppForegroundDurationEvent

- (HFAnalyticsAppForegroundDurationEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"foregroundDuration"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsapp.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"userHasAccessories"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticsapp_0.isa);
  }
  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsAppForegroundDurationEvent;
  v7 = [(HFAnalyticsEvent *)&v13 initWithEventType:0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_foregroundDuration, v5);
    v8->_userHasAccessories = [v6 BOOLValue];
    v9 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v10 = [v9 processName];
    processName = v8->_processName;
    v8->_processName = (NSString *)v10;
  }
  return v8;
}

- (id)payload
{
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsAppForegroundDurationEvent;
  v3 = [(HFAnalyticsEvent *)&v9 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAppForegroundDurationEvent *)self foregroundDuration];
  [v4 setObject:v5 forKeyedSubscript:@"foregroundDuration"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAppForegroundDurationEvent userHasAccessories](self, "userHasAccessories"));
  [v4 setObject:v6 forKeyedSubscript:@"userHasAccessories"];

  v7 = [(HFAnalyticsAppForegroundDurationEvent *)self processName];
  [v4 setObject:v7 forKeyedSubscript:@"processName"];

  return v4;
}

- (NSNumber)foregroundDuration
{
  return self->_foregroundDuration;
}

- (void)setForegroundDuration:(id)a3
{
}

- (BOOL)userHasAccessories
{
  return self->_userHasAccessories;
}

- (void)setUserHasAccessories:(BOOL)a3
{
  self->_userHasAccessories = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_foregroundDuration, 0);
}

@end