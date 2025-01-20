@interface HFAnalyticsResumeSetupExitOptionsEvent
- (HFAnalyticsResumeSetupExitOptionsEvent)initWithData:(id)a3;
- (NSNumber)resumeSetupOption;
- (NSString)accessoryType;
- (id)payload;
- (void)setAccessoryType:(id)a3;
- (void)setResumeSetupOption:(id)a3;
@end

@implementation HFAnalyticsResumeSetupExitOptionsEvent

- (HFAnalyticsResumeSetupExitOptionsEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"accessoryCategoryType"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"resumeSetupSelectedOption"];

  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsResumeSetupExitOptionsEvent;
  v11 = [(HFAnalyticsEvent *)&v14 initWithEventType:28];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessoryType, v6);
    objc_storeStrong((id *)&v12->_resumeSetupOption, v9);
  }

  return v12;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsResumeSetupExitOptionsEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsResumeSetupExitOptionsEvent *)self accessoryType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"accessory");

  v6 = [(HFAnalyticsResumeSetupExitOptionsEvent *)self resumeSetupOption];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"optionSelected");

  return v4;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSNumber)resumeSetupOption
{
  return self->_resumeSetupOption;
}

- (void)setResumeSetupOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeSetupOption, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end