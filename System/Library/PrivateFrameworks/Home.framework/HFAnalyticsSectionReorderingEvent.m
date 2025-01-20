@interface HFAnalyticsSectionReorderingEvent
- (HFAnalyticsSectionReorderingEvent)initWithData:(id)a3;
- (NSNumber)numberOfSections;
- (NSString)reorderingAction;
- (id)payload;
- (void)setNumberOfSections:(id)a3;
- (void)setReorderingAction:(id)a3;
@end

@implementation HFAnalyticsSectionReorderingEvent

- (HFAnalyticsSectionReorderingEvent)initWithData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsSectionReorderingEvent;
  v5 = [(HFAnalyticsEvent *)&v11 initWithEventType:39];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"HFAnalyticsDataSectionCountKey"];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_numberOfSections, v7);

    uint64_t v8 = [v4 objectForKeyedSubscript:@"HFAnalyticsDataSectionReorderingTypeKey"];
    reorderingAction = v5->_reorderingAction;
    v5->_reorderingAction = (NSString *)v8;
  }
  return v5;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsSectionReorderingEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:&unk_26C0F7EC0 forKeyedSubscript:@"homeAppEventCount"];
  v5 = [(HFAnalyticsSectionReorderingEvent *)self numberOfSections];
  [v4 setObject:v5 forKeyedSubscript:@"reorderingSectionsCount"];

  v6 = [(HFAnalyticsSectionReorderingEvent *)self reorderingAction];
  [v4 setObject:v6 forKeyedSubscript:@"reorderingSectionsType"];

  return v4;
}

- (NSNumber)numberOfSections
{
  return self->_numberOfSections;
}

- (void)setNumberOfSections:(id)a3
{
}

- (NSString)reorderingAction
{
  return self->_reorderingAction;
}

- (void)setReorderingAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderingAction, 0);
  objc_storeStrong((id *)&self->_numberOfSections, 0);
}

@end