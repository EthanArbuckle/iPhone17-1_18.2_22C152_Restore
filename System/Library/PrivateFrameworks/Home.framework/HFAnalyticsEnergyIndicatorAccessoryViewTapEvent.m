@interface HFAnalyticsEnergyIndicatorAccessoryViewTapEvent
- (HFAnalyticsEnergyIndicatorAccessoryViewTapEvent)initWithData:(id)a3;
- (id)payload;
- (unint64_t)interactionType;
- (void)setInteractionType:(unint64_t)a3;
@end

@implementation HFAnalyticsEnergyIndicatorAccessoryViewTapEvent

- (HFAnalyticsEnergyIndicatorAccessoryViewTapEvent)initWithData:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"interactionType"];
  unint64_t v5 = [v4 integerValue];

  if (!v5) {
    NSLog(&cfstr_Hfanalyticsene_5.isa);
  }
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewTapEvent;
  result = [(HFAnalyticsEvent *)&v7 initWithEventType:55];
  if (result) {
    result->_interactionType = v5;
  }
  return result;
}

- (id)payload
{
  if (self->_interactionType)
  {
    v7.receiver = self;
    v7.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewTapEvent;
    v3 = [(HFAnalyticsEvent *)&v7 payload];
    v4 = (void *)[v3 mutableCopy];

    unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsEnergyIndicatorAccessoryViewTapEvent interactionType](self, "interactionType"));
    objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"interactionType");

    objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6210, @"homeAppEventCount");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

@end