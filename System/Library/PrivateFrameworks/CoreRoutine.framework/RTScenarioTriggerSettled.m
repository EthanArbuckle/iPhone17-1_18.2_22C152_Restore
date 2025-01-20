@interface RTScenarioTriggerSettled
- (RTScenarioTriggerSettled)init;
- (id)description;
@end

@implementation RTScenarioTriggerSettled

- (RTScenarioTriggerSettled)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTScenarioTriggerSettled;
  return [(RTScenarioTrigger *)&v3 initWithType:1];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)RTScenarioTriggerSettled;
  v6 = [(RTScenarioTrigger *)&v9 description];
  v7 = [v3 stringWithFormat:@"%@, %@", v5, v6];

  return v7;
}

@end