@interface HFAnalyticsEnergyDashboardVisitEvent
- (BOOL)isDoublePaneEnabled;
- (HFAnalyticsEnergyDashboardVisitEvent)initWithData:(id)a3;
- (NSNumber)status;
- (NSString)gridID;
- (id)payload;
- (void)setGridID:(id)a3;
- (void)setIsDoublePaneEnabled:(BOOL)a3;
- (void)setStatus:(id)a3;
@end

@implementation HFAnalyticsEnergyDashboardVisitEvent

- (HFAnalyticsEnergyDashboardVisitEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"energyDashboardStatus"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsene_8.isa);
  }
  objc_opt_class();
  v6 = [v4 objectForKeyedSubscript:@"energyForecastGridID"];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (!v8) {
    NSLog(&cfstr_Hfanalyticsene_9.isa);
  }
  v9 = [v4 objectForKeyedSubscript:@"energyDashboardDoublePaneEnabled"];
  if (!v9) {
    NSLog(&cfstr_Hfanalyticsene_10.isa);
  }
  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsEnergyDashboardVisitEvent;
  v10 = [(HFAnalyticsEvent *)&v13 initWithEventType:44];
  v11 = v10;
  if (v10)
  {
    v10->_status = v5;
    objc_storeStrong((id *)&v10->_gridID, v7);
    v11->_isDoublePaneEnabled = [v9 BOOLValue];
  }

  return v11;
}

- (id)payload
{
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsEnergyDashboardVisitEvent;
  v3 = [(HFAnalyticsEvent *)&v9 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEnergyDashboardVisitEvent *)self status];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"energyDashboardStatus");

  v6 = [(HFAnalyticsEnergyDashboardVisitEvent *)self gridID];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"energyForecastGridID");

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsEnergyDashboardVisitEvent isDoublePaneEnabled](self, "isDoublePaneEnabled"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"energyDashboardDoublePaneEnabled");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F7CF8, @"homeAppEventCount");
  return v4;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  self->_status = (NSNumber *)a3;
}

- (NSString)gridID
{
  return self->_gridID;
}

- (void)setGridID:(id)a3
{
}

- (BOOL)isDoublePaneEnabled
{
  return self->_isDoublePaneEnabled;
}

- (void)setIsDoublePaneEnabled:(BOOL)a3
{
  self->_isDoublePaneEnabled = a3;
}

- (void).cxx_destruct
{
}

@end