@interface HFAnalyticsEnergyEducationTipVisitEvent
- (HFAnalyticsEnergyEducationTipVisitEvent)initWithData:(id)a3;
- (NSNumber)viewState;
- (id)payload;
- (void)setViewState:(id)a3;
@end

@implementation HFAnalyticsEnergyEducationTipVisitEvent

- (HFAnalyticsEnergyEducationTipVisitEvent)initWithData:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"educationTipViewState"];
  if (!v4) {
    NSLog(&cfstr_Hfanalyticsene_1.isa);
  }
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyEducationTipVisitEvent;
  v5 = [(HFAnalyticsEvent *)&v8 initWithEventType:48];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_viewState, v4);
  }

  return v6;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyEducationTipVisitEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEnergyEducationTipVisitEvent *)self viewState];
  [v4 setObject:v5 forKeyedSubscript:@"educationTipViewState"];

  return v4;
}

- (NSNumber)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end