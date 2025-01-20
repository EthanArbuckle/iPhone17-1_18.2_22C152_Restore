@interface HFAnalyticsEnergyCategoryViewDurationEvent
- (BOOL)userHasAccessories;
- (HFAnalyticsEnergyCategoryViewDurationEvent)initWithData:(id)a3;
- (NSNumber)energyViewDuration;
- (id)payload;
- (void)setEnergyViewDuration:(id)a3;
- (void)setUserHasAccessories:(BOOL)a3;
@end

@implementation HFAnalyticsEnergyCategoryViewDurationEvent

- (HFAnalyticsEnergyCategoryViewDurationEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"energyViewDuration"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsene.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"userHasAccessories"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticsene_0.isa);
  }
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsEnergyCategoryViewDurationEvent;
  v7 = [(HFAnalyticsEvent *)&v10 initWithEventType:47];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_energyViewDuration, v5);
    v8->_userHasAccessories = [v6 BOOLValue];
  }

  return v8;
}

- (id)payload
{
  if ([(NSNumber *)self->_energyViewDuration integerValue] < 1)
  {
    id v4 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HFAnalyticsEnergyCategoryViewDurationEvent;
    v3 = [(HFAnalyticsEvent *)&v8 payload];
    id v4 = (void *)[v3 mutableCopy];

    v5 = [(HFAnalyticsEnergyCategoryViewDurationEvent *)self energyViewDuration];
    [v4 setObject:v5 forKeyedSubscript:@"energyViewDuration"];

    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsEnergyCategoryViewDurationEvent userHasAccessories](self, "userHasAccessories"));
    [v4 setObject:v6 forKeyedSubscript:@"energyViewUserHasAccessories"];

    objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F5E08, @"homeAppEventCount");
  }
  return v4;
}

- (NSNumber)energyViewDuration
{
  return self->_energyViewDuration;
}

- (void)setEnergyViewDuration:(id)a3
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

- (void).cxx_destruct
{
}

@end