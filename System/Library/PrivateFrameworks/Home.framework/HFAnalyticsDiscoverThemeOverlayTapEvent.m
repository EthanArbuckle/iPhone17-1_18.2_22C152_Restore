@interface HFAnalyticsDiscoverThemeOverlayTapEvent
- (HFAnalyticsDiscoverThemeOverlayTapEvent)initWithData:(id)a3;
- (NSString)themeType;
- (id)payload;
- (void)setThemeType:(id)a3;
@end

@implementation HFAnalyticsDiscoverThemeOverlayTapEvent

- (HFAnalyticsDiscoverThemeOverlayTapEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"discoverThemeTapKey"];

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsDiscoverThemeOverlayTapEvent;
  v8 = [(HFAnalyticsEvent *)&v11 initWithEventType:9];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_themeType, v6);
  }

  return v9;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsDiscoverThemeOverlayTapEvent;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsDiscoverThemeOverlayTapEvent *)self themeType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"themeOverlayType");

  return v4;
}

- (NSString)themeType
{
  return self->_themeType;
}

- (void)setThemeType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end