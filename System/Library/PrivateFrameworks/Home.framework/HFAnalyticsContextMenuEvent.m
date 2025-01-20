@interface HFAnalyticsContextMenuEvent
- (HFAnalyticsContextMenuEvent)initWithData:(id)a3;
- (NSString)contextMenuTitle;
- (NSString)contextType;
- (NSString)itemClassName;
- (NSString)processName;
- (NSString)sourceViewControllerClassName;
- (id)payload;
- (void)setContextMenuTitle:(id)a3;
- (void)setContextType:(id)a3;
- (void)setItemClassName:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSourceViewControllerClassName:(id)a3;
@end

@implementation HFAnalyticsContextMenuEvent

- (HFAnalyticsContextMenuEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"contextMenuTitle"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }

  if (!v6) {
    NSLog(&cfstr_Hfanalyticsdat_1.isa);
  }
  v35.receiver = self;
  v35.super_class = (Class)HFAnalyticsContextMenuEvent;
  v7 = [(HFAnalyticsEvent *)&v35 initWithEventType:36];
  if (v7)
  {
    objc_opt_class();
    v8 = [v4 objectForKeyedSubscript:@"overrideItemClassName"];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if ([v10 length])
    {
      v11 = (NSString *)v10;
      itemClassName = v7->_itemClassName;
      v7->_itemClassName = v11;
    }
    else
    {
      objc_opt_class();
      v13 = [v4 objectForKeyedSubscript:@"item"];
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      itemClassName = v7->_itemClassName;
      v7->_itemClassName = (NSString *)v17;
    }

    v18 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v19 = [v18 processName];
    processName = v7->_processName;
    v7->_processName = (NSString *)v19;

    objc_opt_class();
    v21 = [v4 objectForKeyedSubscript:@"sourceViewController"];
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

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
      sourceViewControllerClassName = (__CFString *)v7->_sourceViewControllerClassName;
      v7->_sourceViewControllerClassName = v27;
    }
    else
    {
      if (v23)
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        sourceViewControllerClassName = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sourceViewControllerClassName = @"nil";
      }
      objc_storeStrong((id *)&v7->_sourceViewControllerClassName, sourceViewControllerClassName);
      if (!v23) {
        goto LABEL_29;
      }
    }

LABEL_29:
    objc_opt_class();
    v30 = [v4 objectForKeyedSubscript:@"dashboardContextType"];
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    objc_storeStrong((id *)&v7->_contextType, v31);

    objc_opt_class();
    v32 = [v4 objectForKeyedSubscript:@"contextMenuTitle"];
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
    objc_storeStrong((id *)&v7->_contextMenuTitle, v33);
  }
  return v7;
}

- (id)payload
{
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsContextMenuEvent;
  v3 = [(HFAnalyticsEvent *)&v11 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsContextMenuEvent *)self itemClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"item");

  v6 = [(HFAnalyticsContextMenuEvent *)self processName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"processName");

  v7 = [(HFAnalyticsContextMenuEvent *)self sourceViewControllerClassName];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"sourceViewController");

  v8 = [(HFAnalyticsContextMenuEvent *)self contextType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"dashboardContext");

  v9 = [(HFAnalyticsContextMenuEvent *)self contextMenuTitle];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, @"contextMenuTitle");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6A20, @"homeAppEventCount");
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

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)contextMenuTitle
{
  return self->_contextMenuTitle;
}

- (void)setContextMenuTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuTitle, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end