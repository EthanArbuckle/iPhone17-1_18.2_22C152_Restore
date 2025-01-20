@interface HFAnalyticsGeneralButtonTapEvent
- (HFAnalyticsGeneralButtonTapEvent)initWithData:(id)a3;
- (NSString)buttonTitle;
- (NSString)processName;
- (NSString)sourceViewControllerClassName;
- (id)payload;
- (void)setButtonTitle:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSourceViewControllerClassName:(id)a3;
@end

@implementation HFAnalyticsGeneralButtonTapEvent

- (HFAnalyticsGeneralButtonTapEvent)initWithData:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsGeneralButtonTapEvent;
  v5 = [(HFAnalyticsEvent *)&v17 initWithEventType:43];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"item"];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_buttonTitle, v7);

    v8 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v9 = [v8 processName];
    processName = v5->_processName;
    v5->_processName = (NSString *)v9;

    objc_opt_class();
    v11 = [v4 objectForKeyedSubscript:@"sourceViewController"];
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = @"nil";
    }
    objc_storeStrong((id *)&v5->_sourceViewControllerClassName, v15);
    if (v13) {
  }
    }
  return v5;
}

- (id)payload
{
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsGeneralButtonTapEvent;
  v3 = [(HFAnalyticsEvent *)&v9 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsGeneralButtonTapEvent *)self buttonTitle];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsGeneralButtonTapEvent *)self processName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"processName");

  v7 = [(HFAnalyticsGeneralButtonTapEvent *)self sourceViewControllerClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"sourceViewController");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F73C8, @"homeAppEventCount");
  return v4;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end