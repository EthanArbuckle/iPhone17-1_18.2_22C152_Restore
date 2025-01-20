@interface HFAnalyticsLearnTabInteractionEvent
- (HFAnalyticsLearnTabInteractionEvent)initWithData:(id)a3;
- (NSString)interactionType;
- (id)payload;
- (void)setInteractionType:(id)a3;
@end

@implementation HFAnalyticsLearnTabInteractionEvent

- (HFAnalyticsLearnTabInteractionEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"learnInteractionLinkType"];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsLearnTabInteractionEvent;
  v8 = [(HFAnalyticsEvent *)&v11 initWithEventType:8];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_interactionType, v6);
  }

  return v9;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsLearnTabInteractionEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsLearnTabInteractionEvent *)self interactionType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"linkType");

  return v4;
}

- (NSString)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end