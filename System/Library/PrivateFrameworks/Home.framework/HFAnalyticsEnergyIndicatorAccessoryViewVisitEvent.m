@interface HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent
- (HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent)initWithData:(id)a3;
- (NSString)adviceText;
- (NSString)gridID;
- (id)payload;
- (void)setAdviceText:(id)a3;
- (void)setGridID:(id)a3;
@end

@implementation HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent

- (HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"energyForecastGridID"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_Hfanalyticsene_2.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"energyIndicatorAdviceText"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_Hfanalyticsene_3.isa);
  }
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent;
  v11 = [(HFAnalyticsEvent *)&v14 initWithEventType:51];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_gridID, v6);
    objc_storeStrong((id *)&v12->_adviceText, v9);
  }

  return v12;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent *)self gridID];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"energyForecastGridID");

  v6 = [(HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent *)self adviceText];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"energyIndicatorAdviceText");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6198, @"homeAppEventCount");
  return v4;
}

- (NSString)gridID
{
  return self->_gridID;
}

- (NSString)adviceText
{
  return self->_adviceText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adviceText, 0);
  objc_storeStrong((id *)&self->_gridID, 0);
}

- (void)setGridID:(id)a3
{
}

- (void)setAdviceText:(id)a3
{
}

@end