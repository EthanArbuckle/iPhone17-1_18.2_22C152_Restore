@interface HFAnalyticsHiddenBannerEvent
- (HFAnalyticsHiddenBannerEvent)initWithData:(id)a3;
- (NSNumber)hiddenBannerCount;
- (NSString)hiddenBannerItemClassName;
- (NSString)tappedBannerItemClassName;
- (id)payload;
- (void)setHiddenBannerCount:(id)a3;
- (void)setHiddenBannerItemClassName:(id)a3;
- (void)setTappedBannerItemClassName:(id)a3;
@end

@implementation HFAnalyticsHiddenBannerEvent

- (HFAnalyticsHiddenBannerEvent)initWithData:(id)a3
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

  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"tappedBannerItem"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v29.receiver = self;
  v29.super_class = (Class)HFAnalyticsHiddenBannerEvent;
  v11 = [(HFAnalyticsEvent *)&v29 initWithEventType:42];
  if (v11)
  {
    objc_opt_class();
    v12 = [v4 objectForKeyedSubscript:@"overrideItemClassName"];
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if ([v14 length])
    {
      v15 = (NSString *)v14;
    }
    else
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    hiddenBannerItemClassName = v11->_hiddenBannerItemClassName;
    v11->_hiddenBannerItemClassName = v15;

    objc_opt_class();
    v18 = [v4 objectForKeyedSubscript:@"tappedBannerOverrideItemClassName"];
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    if ([v20 length])
    {
      v21 = (NSString *)v20;
    }
    else
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    tappedBannerItemClassName = v11->_tappedBannerItemClassName;
    v11->_tappedBannerItemClassName = v21;

    objc_opt_class();
    v24 = [v4 objectForKeyedSubscript:@"hiddenBannerCount"];
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    v26 = v25;

    hiddenBannerCount = v11->_hiddenBannerCount;
    v11->_hiddenBannerCount = v26;
  }
  return v11;
}

- (id)payload
{
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsHiddenBannerEvent;
  v3 = [(HFAnalyticsEvent *)&v9 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsHiddenBannerEvent *)self hiddenBannerItemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsHiddenBannerEvent *)self hiddenBannerCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"hiddenBannerCount");

  id v7 = [(HFAnalyticsHiddenBannerEvent *)self tappedBannerItemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"tappedBannerItem");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F62D0, @"homeAppEventCount");
  return v4;
}

- (NSString)hiddenBannerItemClassName
{
  return self->_hiddenBannerItemClassName;
}

- (void)setHiddenBannerItemClassName:(id)a3
{
}

- (NSString)tappedBannerItemClassName
{
  return self->_tappedBannerItemClassName;
}

- (void)setTappedBannerItemClassName:(id)a3
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
  objc_storeStrong((id *)&self->_tappedBannerItemClassName, 0);
  objc_storeStrong((id *)&self->_hiddenBannerItemClassName, 0);
}

@end