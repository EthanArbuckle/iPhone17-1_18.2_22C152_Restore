@interface HULocationEventSelectedLocationItem
- (BOOL)_locationIsHome;
- (BOOL)locationCanBeEdited;
- (HFLocationEventBuilder)eventBuilder;
- (HMHome)home;
- (HULocationEventSelectedLocationItem)init;
- (HULocationEventSelectedLocationItem)initWithEvent:(id)a3 inHome:(id)a4;
- (id)_locationTitle;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setEventBuilder:(id)a3;
- (void)setLocationCanBeEdited:(BOOL)a3;
@end

@implementation HULocationEventSelectedLocationItem

- (HULocationEventSelectedLocationItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithEvent_inHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationEventSelectedLocationItem.m", 16, @"%s is unavailable; use %@ instead",
    "-[HULocationEventSelectedLocationItem init]",
    v5);

  return 0;
}

- (HULocationEventSelectedLocationItem)initWithEvent:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HULocationEventSelectedLocationItem;
  v9 = [(HULocationEventSelectedLocationItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventBuilder, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    v10->_locationCanBeEdited = 0;
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  v5 = [(HULocationEventSelectedLocationItem *)self _locationTitle];
  if (v5)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerSelectedLocationTitle", @"HULocationTriggerSelectedLocationTitle", 1);
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68980]];
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", -[HULocationEventSelectedLocationItem locationCanBeEdited](self, "locationCanBeEdited") ^ 1);
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68A08]];
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  id v8 = (void *)MEMORY[0x1E4F7A0D8];
  v9 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v10 = [v8 futureWithResult:v9];

  return v10;
}

- (id)_locationTitle
{
  if ([(HULocationEventSelectedLocationItem *)self _locationIsHome])
  {
    v3 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerSelectedLocationHome", @"HULocationTriggerSelectedLocationHome", 1);
  }
  else
  {
    v4 = [(HULocationEventSelectedLocationItem *)self eventBuilder];

    if (v4)
    {
      objc_opt_class();
      v5 = [(HULocationEventSelectedLocationItem *)self eventBuilder];
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;

      if (v7)
      {
        id v8 = [v7 region];
        v3 = [v8 identifier];
      }
      else
      {
        v9 = [(HULocationEventSelectedLocationItem *)self eventBuilder];
        NSLog(&cfstr_ExpectedARegio.isa, v9);

        v3 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerSelectedLocationCustom", @"HULocationTriggerSelectedLocationCustom", 1);
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (BOOL)_locationIsHome
{
  v3 = [(HULocationEventSelectedLocationItem *)self eventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  objc_opt_class();
  v6 = [(HULocationEventSelectedLocationItem *)self eventBuilder];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(HULocationEventSelectedLocationItem *)self home];
    char v5 = [v8 isRegionAtHome:v9];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HFLocationEventBuilder)eventBuilder
{
  return self->_eventBuilder;
}

- (void)setEventBuilder:(id)a3
{
}

- (BOOL)locationCanBeEdited
{
  return self->_locationCanBeEdited;
}

- (void)setLocationCanBeEdited:(BOOL)a3
{
  self->_locationCanBeEdited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilder, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end