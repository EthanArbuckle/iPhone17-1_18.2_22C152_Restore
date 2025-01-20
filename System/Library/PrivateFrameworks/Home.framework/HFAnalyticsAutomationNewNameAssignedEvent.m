@interface HFAnalyticsAutomationNewNameAssignedEvent
- (HFAnalyticsAutomationNewNameAssignedEvent)initWithData:(id)a3;
- (NSNumber)didNamingSucceed;
- (NSNumber)errorType;
- (NSNumber)modifiesExistingTrigger;
- (NSNumber)namingType;
- (id)payload;
- (void)setDidNamingSucceed:(id)a3;
- (void)setErrorType:(id)a3;
- (void)setModifiesExistingTrigger:(id)a3;
- (void)setNamingType:(id)a3;
@end

@implementation HFAnalyticsAutomationNewNameAssignedEvent

- (HFAnalyticsAutomationNewNameAssignedEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"didNamingSucceedKey"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"errorTypeKey"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"modifiesExisitingTriggerKey"];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  v14 = [v4 objectForKeyedSubscript:@"namingTypeKey"];

  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v20.receiver = self;
  v20.super_class = (Class)HFAnalyticsAutomationNewNameAssignedEvent;
  v17 = [(HFAnalyticsEvent *)&v20 initWithEventType:24];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_didNamingSucceed, v6);
    objc_storeStrong((id *)&v18->_errorType, v9);
    objc_storeStrong((id *)&v18->_modifiesExistingTrigger, v12);
    objc_storeStrong((id *)&v18->_namingType, v15);
  }

  return v18;
}

- (id)payload
{
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsAutomationNewNameAssignedEvent;
  v3 = [(HFAnalyticsEvent *)&v10 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAutomationNewNameAssignedEvent *)self didNamingSucceed];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"didNamingSucceed");

  v6 = [(HFAnalyticsAutomationNewNameAssignedEvent *)self errorType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"errorType");

  id v7 = [(HFAnalyticsAutomationNewNameAssignedEvent *)self modifiesExistingTrigger];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"modifiesExistingTrigger");

  v8 = [(HFAnalyticsAutomationNewNameAssignedEvent *)self namingType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"namingType");

  return v4;
}

- (NSNumber)didNamingSucceed
{
  return self->_didNamingSucceed;
}

- (void)setDidNamingSucceed:(id)a3
{
}

- (NSNumber)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(id)a3
{
}

- (NSNumber)modifiesExistingTrigger
{
  return self->_modifiesExistingTrigger;
}

- (void)setModifiesExistingTrigger:(id)a3
{
}

- (NSNumber)namingType
{
  return self->_namingType;
}

- (void)setNamingType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingType, 0);
  objc_storeStrong((id *)&self->_modifiesExistingTrigger, 0);
  objc_storeStrong((id *)&self->_errorType, 0);
  objc_storeStrong((id *)&self->_didNamingSucceed, 0);
}

@end