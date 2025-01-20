@interface HKMCNotificationInteractedMetric
+ (NSString)eventName;
- (HKMCNotificationInteractedMetric)initWithCategory:(id)a3 action:(id)a4;
- (NSDictionary)eventPayload;
- (NSString)action;
- (NSString)category;
- (id)description;
- (void)setAction:(id)a3;
- (void)setCategory:(id)a3;
- (void)setEventPayload:(id)a3;
@end

@implementation HKMCNotificationInteractedMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.NotificationInteracted";
}

- (HKMCNotificationInteractedMetric)initWithCategory:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCNotificationInteractedMetric;
  v9 = [(HKMCNotificationInteractedMetric *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HKMCNotificationInteractedMetric *)self category];
  [v3 setObject:v4 forKeyedSubscript:@"category"];

  v5 = [(HKMCNotificationInteractedMetric *)self action];
  [v3 setObject:v5 forKeyedSubscript:@"action"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMCNotificationInteractedMetric *)self category];
  v6 = [(HKMCNotificationInteractedMetric *)self action];
  id v7 = [v3 stringWithFormat:@"<%@:%p category:%@ action:%@>", v4, self, v5, v6];

  return v7;
}

- (void)setEventPayload:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end