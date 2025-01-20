@interface HFAnalyticsBannerInteractionEvent
- (HFAnalyticsBannerInteractionEvent)initWithData:(id)a3;
- (NSNumber)hiddenBannerCount;
- (NSString)itemClassName;
- (id)payload;
- (void)setHiddenBannerCount:(id)a3;
- (void)setItemClassName:(id)a3;
@end

@implementation HFAnalyticsBannerInteractionEvent

- (HFAnalyticsBannerInteractionEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"item"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v18.receiver = self;
  v18.super_class = (Class)HFAnalyticsBannerInteractionEvent;
  v8 = [(HFAnalyticsEvent *)&v18 initWithEventType:41];
  if (v8)
  {
    objc_opt_class();
    v9 = [v4 objectForKeyedSubscript:@"overrideItemClassName"];
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if ([v11 length])
    {
      v12 = (NSString *)v11;
    }
    else
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    itemClassName = v8->_itemClassName;
    v8->_itemClassName = v12;

    objc_opt_class();
    v15 = [v4 objectForKeyedSubscript:@"hiddenBannerCount"];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&v8->_hiddenBannerCount, v16);
  }
  return v8;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsBannerInteractionEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsBannerInteractionEvent *)self itemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsBannerInteractionEvent *)self hiddenBannerCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"hiddenBannerCount");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6ED0, @"homeAppEventCount");
  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
}

- (NSNumber)hiddenBannerCount
{
  return self->_hiddenBannerCount;
}

- (void)setHiddenBannerCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenBannerCount, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end