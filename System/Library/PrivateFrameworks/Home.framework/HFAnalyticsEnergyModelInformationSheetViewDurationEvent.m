@interface HFAnalyticsEnergyModelInformationSheetViewDurationEvent
- (HFAnalyticsEnergyModelInformationSheetViewDurationEvent)initWithData:(id)a3;
- (NSNumber)modelInformationSheetViewDuration;
- (id)payload;
- (void)setModelInformationSheetViewDuration:(id)a3;
@end

@implementation HFAnalyticsEnergyModelInformationSheetViewDurationEvent

- (HFAnalyticsEnergyModelInformationSheetViewDurationEvent)initWithData:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"energyModelInformationSheetViewDuration"];
  if (!v4) {
    NSLog(&cfstr_Hfanalyticsene_7.isa);
  }
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyModelInformationSheetViewDurationEvent;
  v5 = [(HFAnalyticsEvent *)&v8 initWithEventType:50];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_modelInformationSheetViewDuration, v4);
  }

  return v6;
}

- (id)payload
{
  if ([(NSNumber *)self->_modelInformationSheetViewDuration integerValue] < 1)
  {
    v4 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HFAnalyticsEnergyModelInformationSheetViewDurationEvent;
    v3 = [(HFAnalyticsEvent *)&v7 payload];
    v4 = (void *)[v3 mutableCopy];

    v5 = [(HFAnalyticsEnergyModelInformationSheetViewDurationEvent *)self modelInformationSheetViewDuration];
    [v4 setObject:v5 forKeyedSubscript:@"energyModelInformationSheetViewDuration"];

    objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F7BF0, @"homeAppEventCount");
  }
  return v4;
}

- (NSNumber)modelInformationSheetViewDuration
{
  return self->_modelInformationSheetViewDuration;
}

- (void)setModelInformationSheetViewDuration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end