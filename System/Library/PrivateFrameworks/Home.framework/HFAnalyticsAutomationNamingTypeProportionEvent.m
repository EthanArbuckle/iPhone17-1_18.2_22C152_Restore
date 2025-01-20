@interface HFAnalyticsAutomationNamingTypeProportionEvent
- (HFAnalyticsAutomationNamingTypeProportionEvent)initWithData:(id)a3;
- (NSNumber)percentUsingConfiguredName;
- (id)payload;
- (void)setPercentUsingConfiguredName:(id)a3;
@end

@implementation HFAnalyticsAutomationNamingTypeProportionEvent

- (HFAnalyticsAutomationNamingTypeProportionEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"percentUsingConfiguredNameKey"];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsAutomationNamingTypeProportionEvent;
  v8 = [(HFAnalyticsEvent *)&v11 initWithEventType:25];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_percentUsingConfiguredName, v6);
  }

  return v9;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsAutomationNamingTypeProportionEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAutomationNamingTypeProportionEvent *)self percentUsingConfiguredName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"percentType0");

  return v4;
}

- (NSNumber)percentUsingConfiguredName
{
  return self->_percentUsingConfiguredName;
}

- (void)setPercentUsingConfiguredName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end