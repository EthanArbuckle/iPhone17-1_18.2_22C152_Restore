@interface HUAddTriggerItem
- (BOOL)_itemisHidden;
- (Class)mapsToViewClass;
- (HMHome)home;
- (HUAddTriggerItem)initWithHome:(id)a3 mode:(unint64_t)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)mode;
- (void)setHome:(id)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation HUAddTriggerItem

- (HUAddTriggerItem)initWithHome:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAddTriggerItem;
  v8 = [(HUAddTriggerItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_mode = a4;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HUAddTriggerItem *)self _itemisHidden];
  unint64_t v5 = [(HUAddTriggerItem *)self mode];
  v6 = @"HUMacToolbarAddMenuAutomation";
  if (!v5) {
    v6 = @"HUTriggerListAddTriggerButtonTitle";
  }
  id v7 = (void *)MEMORY[0x1E4F7A0D8];
  v8 = (objc_class *)MEMORY[0x1E4F69228];
  v9 = v6;
  id v10 = [v8 alloc];
  uint64_t v11 = *MEMORY[0x1E4F68AC0];
  v26[0] = v9;
  uint64_t v12 = *MEMORY[0x1E4F68AB8];
  v25[0] = v11;
  v25[1] = v12;
  v13 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v26[1] = v13;
  v25[2] = *MEMORY[0x1E4F68B10];
  v14 = [NSNumber numberWithBool:v4];
  uint64_t v15 = *MEMORY[0x1E4F68AF0];
  v26[2] = v14;
  v26[3] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = *MEMORY[0x1E4F68908];
  v25[3] = v15;
  v25[4] = v16;
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HUAddTriggerItem *)self home];
  v19 = [v17 setWithObject:v18];
  v26[4] = v19;
  v25[5] = *MEMORY[0x1E4F68900];
  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v26[5] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];
  v22 = (void *)[v10 initWithResults:v21];
  v23 = [v7 futureWithResult:v22];

  return v23;
}

- (BOOL)_itemisHidden
{
  v3 = [(HUAddTriggerItem *)self home];
  char v4 = objc_msgSend(v3, "hf_hasAnyVisibleTriggers");

  unint64_t v5 = [(HUAddTriggerItem *)self mode];
  char v6 = v5 == 0;
  if (!v5 && (v4 & 1) == 0) {
    char v6 = [MEMORY[0x1E4F69758] isAMac];
  }
  id v7 = [(HUAddTriggerItem *)self home];
  char v8 = objc_msgSend(v7, "hf_userCanCreateTrigger") ^ 1 | v6;

  return v8;
}

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
}

@end