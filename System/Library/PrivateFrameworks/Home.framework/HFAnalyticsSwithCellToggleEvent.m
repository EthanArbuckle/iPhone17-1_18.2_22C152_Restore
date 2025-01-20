@interface HFAnalyticsSwithCellToggleEvent
- (HFAnalyticsSwithCellToggleEvent)initWithData:(id)a3;
- (NSNumber)isOn;
- (NSString)itemClassName;
- (NSString)processName;
- (NSString)sourceViewControllerClassName;
- (NSString)toggleTitle;
- (id)payload;
- (void)setIsOn:(id)a3;
- (void)setItemClassName:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSourceViewControllerClassName:(id)a3;
- (void)setToggleTitle:(id)a3;
@end

@implementation HFAnalyticsSwithCellToggleEvent

- (HFAnalyticsSwithCellToggleEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"switchCellIsOn"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_Hfanalyticsdat_2.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"sourceViewController"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v34.receiver = self;
  v34.super_class = (Class)HFAnalyticsSwithCellToggleEvent;
  v11 = [(HFAnalyticsEvent *)&v34 initWithEventType:40];
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
      itemClassName = v11->_itemClassName;
      v11->_itemClassName = v15;
    }
    else
    {
      objc_opt_class();
      v17 = [v4 objectForKeyedSubscript:@"item"];
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      itemClassName = v11->_itemClassName;
      v11->_itemClassName = (NSString *)v21;
    }

    uint64_t v22 = [v4 objectForKeyedSubscript:@"switchCellToggleTitle"];
    toggleTitle = v11->_toggleTitle;
    v11->_toggleTitle = (NSString *)v22;

    objc_opt_class();
    v24 = [v4 objectForKeyedSubscript:@"sourceViewControllerOverrideClassName"];
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    if ([v26 length])
    {
      v27 = (NSString *)v26;
      sourceViewControllerClassName = (__CFString *)v11->_sourceViewControllerClassName;
      v11->_sourceViewControllerClassName = v27;
    }
    else
    {
      if (v10)
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        sourceViewControllerClassName = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sourceViewControllerClassName = @"nil";
      }
      objc_storeStrong((id *)&v11->_sourceViewControllerClassName, sourceViewControllerClassName);
      if (!v10) {
        goto LABEL_29;
      }
    }

LABEL_29:
    objc_storeStrong((id *)&v11->_isOn, v6);
    v30 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v31 = [v30 processName];
    processName = v11->_processName;
    v11->_processName = (NSString *)v31;
  }
  return v11;
}

- (id)payload
{
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsSwithCellToggleEvent;
  v3 = [(HFAnalyticsEvent *)&v11 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsSwithCellToggleEvent *)self itemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsSwithCellToggleEvent *)self toggleTitle];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"switchCellToggleTitle");

  id v7 = [(HFAnalyticsSwithCellToggleEvent *)self sourceViewControllerClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"sourceViewController");

  v8 = [(HFAnalyticsSwithCellToggleEvent *)self isOn];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"switchCellIsOn");

  v9 = [(HFAnalyticsSwithCellToggleEvent *)self processName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, @"processName");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6BB8, @"homeAppEventCount");
  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
}

- (NSString)toggleTitle
{
  return self->_toggleTitle;
}

- (void)setToggleTitle:(id)a3
{
}

- (NSNumber)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_isOn, 0);
  objc_storeStrong((id *)&self->_toggleTitle, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end