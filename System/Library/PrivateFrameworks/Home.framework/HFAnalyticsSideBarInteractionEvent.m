@interface HFAnalyticsSideBarInteractionEvent
- (HFAnalyticsSideBarInteractionEvent)initWithData:(id)a3;
- (NSString)deviceOrientationStr;
- (NSString)itemClassName;
- (id)payload;
- (void)setDeviceOrientationStr:(id)a3;
- (void)setItemClassName:(id)a3;
@end

@implementation HFAnalyticsSideBarInteractionEvent

- (HFAnalyticsSideBarInteractionEvent)initWithData:(id)a3
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

  if (!v7) {
    NSLog(&cfstr_Hfanalyticstil.isa);
  }
  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsSideBarInteractionEvent;
  v8 = [(HFAnalyticsEvent *)&v21 initWithEventType:37];
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
    v15 = [v4 objectForKeyedSubscript:@"orientation"];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      uint64_t v18 = HFStringForDeviceOrientationSimplified([v17 integerValue]);
      deviceOrientationStr = v8->_deviceOrientationStr;
      v8->_deviceOrientationStr = (NSString *)v18;
    }
  }

  return v8;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsSideBarInteractionEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsSideBarInteractionEvent *)self itemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsSideBarInteractionEvent *)self deviceOrientationStr];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"orientation");

  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
}

- (NSString)deviceOrientationStr
{
  return self->_deviceOrientationStr;
}

- (void)setDeviceOrientationStr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrientationStr, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end