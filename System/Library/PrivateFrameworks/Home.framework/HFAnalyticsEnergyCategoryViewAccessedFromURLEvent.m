@interface HFAnalyticsEnergyCategoryViewAccessedFromURLEvent
- (HFAnalyticsEnergyCategoryViewAccessedFromURLEvent)initWithData:(id)a3;
- (NSString)fromUIView;
- (id)payload;
- (void)setFromUIView:(id)a3;
@end

@implementation HFAnalyticsEnergyCategoryViewAccessedFromURLEvent

- (HFAnalyticsEnergyCategoryViewAccessedFromURLEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"energyCategoryViewAccessedFrom"];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_Hfanalyticsene_6.isa);
  }
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsEnergyCategoryViewAccessedFromURLEvent;
  v8 = [(HFAnalyticsEvent *)&v11 initWithEventType:54];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_fromUIView, v6);
  }

  return v9;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyCategoryViewAccessedFromURLEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEnergyCategoryViewAccessedFromURLEvent *)self fromUIView];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"energyViewAccessedFrom");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F7800, @"homeAppEventCount");
  return v4;
}

- (NSString)fromUIView
{
  return self->_fromUIView;
}

- (void)setFromUIView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end