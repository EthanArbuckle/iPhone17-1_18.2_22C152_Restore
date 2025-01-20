@interface HFAnalyticsDiscoverTabContentViewedEvent
- (HFAnalyticsDiscoverTabContentViewedEvent)initWithData:(id)a3;
- (NSString)contentID;
- (NSString)locale;
- (id)payload;
- (void)setContentID:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation HFAnalyticsDiscoverTabContentViewedEvent

- (HFAnalyticsDiscoverTabContentViewedEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"discoverTabContentViewedIDKey"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"discoverTabContentViewedLocaleKey"];

  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsDiscoverTabContentViewedEvent;
  v11 = [(HFAnalyticsEvent *)&v14 initWithEventType:11];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentID, v6);
    objc_storeStrong((id *)&v12->_locale, v9);
  }

  return v12;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsDiscoverTabContentViewedEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsDiscoverTabContentViewedEvent *)self contentID];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"id");

  v6 = [(HFAnalyticsDiscoverTabContentViewedEvent *)self locale];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"locale");

  return v4;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end