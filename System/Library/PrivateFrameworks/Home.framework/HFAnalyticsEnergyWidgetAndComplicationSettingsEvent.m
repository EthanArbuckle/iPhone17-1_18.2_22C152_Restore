@interface HFAnalyticsEnergyWidgetAndComplicationSettingsEvent
- (HFAnalyticsEnergyWidgetAndComplicationSettingsEvent)initWithData:(id)a3;
- (NSNumber)location;
- (id)payload;
- (void)setLocation:(id)a3;
@end

@implementation HFAnalyticsEnergyWidgetAndComplicationSettingsEvent

- (HFAnalyticsEnergyWidgetAndComplicationSettingsEvent)initWithData:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"energyWidgetAndComplicationLocationSetting"];
  if (!v4) {
    NSLog(&cfstr_Hfanalyticsene_4.isa);
  }
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyWidgetAndComplicationSettingsEvent;
  v5 = [(HFAnalyticsEvent *)&v8 initWithEventType:52];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_location, v4);
  }

  return v6;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyWidgetAndComplicationSettingsEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEnergyWidgetAndComplicationSettingsEvent *)self location];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"energyWidgetAndComplicationLocation");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F61B0, @"homeAppEventCount");
  return v4;
}

- (NSNumber)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end