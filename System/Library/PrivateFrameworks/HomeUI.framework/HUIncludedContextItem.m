@interface HUIncludedContextItem
- (HFHomeKitObject)homeKitObject;
- (HMHome)home;
- (HUIncludedContextItem)initWithHomeKitObject:(id)a3 contextType:(unint64_t)a4 home:(id)a5;
- (NSNumber)overrideHiddenState;
- (NSNumber)overridePrimaryState;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)contextType;
- (void)setHome:(id)a3;
- (void)setOverrideHiddenState:(id)a3;
- (void)setOverridePrimaryState:(id)a3;
@end

@implementation HUIncludedContextItem

- (HUIncludedContextItem)initWithHomeKitObject:(id)a3 contextType:(unint64_t)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUIncludedContextItem;
  v11 = [(HUIncludedContextItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_contextType = a4;
    objc_storeStrong((id *)&v11->_homeKitObject, a3);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  unint64_t v5 = [(HUIncludedContextItem *)self contextType];
  v6 = (void *)MEMORY[0x1E4F68AC0];
  switch(v5)
  {
    case 0uLL:
      NSLog(&cfstr_ShouldNotBeUsi.isa);
      break;
    case 1uLL:
      uint64_t v7 = *MEMORY[0x1E4F68AC0];
      v8 = @"HUStatusAndNotificationsIncludeInStatusTitle";
      goto LABEL_6;
    case 2uLL:
      [v4 setObject:@"HUServiceDetailsFavoriteSwitch" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      uint64_t v7 = *MEMORY[0x1E4F68928];
      v8 = @"AccessoryDetails.Favorite";
      goto LABEL_6;
    case 3uLL:
      [v4 setObject:@"HUShowInHomeDashboardTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      uint64_t v7 = *MEMORY[0x1E4F68928];
      v8 = @"AccessoryDetails.ShowInHome";
LABEL_6:
      [v4 setObject:v8 forKeyedSubscript:v7];
      break;
    default:
      break;
  }
  id v9 = [v4 objectForKeyedSubscript:*v6];
  id v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v11 = [(HUIncludedContextItem *)self homeKitObject];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = [(HUIncludedContextItem *)self homeKitObject];
    objc_super v14 = [v12 setWithObject:v13];
    [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  }
  v15 = [(HUIncludedContextItem *)self homeKitObject];
  int v16 = [v15 conformsToProtocol:&unk_1F1ABABC8];

  v17 = (void *)MEMORY[0x1E4F68BC0];
  if (v16)
  {
    v18 = [(HUIncludedContextItem *)self homeKitObject];
    if (objc_msgSend(v18, "hf_shouldBeOnForContextType:", -[HUIncludedContextItem contextType](self, "contextType")))v19 = &unk_1F19B43B8; {
    else
    }
      v19 = &unk_1F19B43D0;
    [v4 setObject:v19 forKeyedSubscript:*v17];
    int v20 = objc_msgSend(v18, "hf_shouldHideForContextType:", -[HUIncludedContextItem contextType](self, "contextType"));
  }
  else
  {
    int v20 = 1;
  }
  v21 = [(HUIncludedContextItem *)self overrideHiddenState];

  if (v21)
  {
    v22 = [(HUIncludedContextItem *)self overrideHiddenState];
    int v20 = [v22 BOOLValue];
  }
  v23 = [(HUIncludedContextItem *)self home];
  uint64_t v24 = objc_msgSend(v23, "hf_currentUserIsRestrictedGuest") | v20;

  v25 = [NSNumber numberWithBool:v24];
  [v4 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v26 = [(HUIncludedContextItem *)self overridePrimaryState];

  if (v26)
  {
    v27 = [(HUIncludedContextItem *)self overridePrimaryState];
    [v4 setObject:v27 forKeyedSubscript:*v17];
  }
  v28 = (void *)MEMORY[0x1E4F7A0D8];
  v29 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v30 = [v28 futureWithResult:v29];

  return v30;
}

- (NSNumber)overrideHiddenState
{
  return self->_overrideHiddenState;
}

- (void)setOverrideHiddenState:(id)a3
{
}

- (NSNumber)overridePrimaryState
{
  return self->_overridePrimaryState;
}

- (void)setOverridePrimaryState:(id)a3
{
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
  objc_storeStrong((id *)&self->_overridePrimaryState, 0);

  objc_storeStrong((id *)&self->_overrideHiddenState, 0);
}

@end