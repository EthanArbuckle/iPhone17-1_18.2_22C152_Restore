@interface HUBridgeListItem
- (HMHome)home;
- (HUBridgeListItem)init;
- (HUBridgeListItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUBridgeListItem

- (HUBridgeListItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBridgeListItem.m", 18, @"%s is unavailable; use %@ instead",
    "-[HUBridgeListItem init]",
    v5);

  return 0;
}

- (HUBridgeListItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUBridgeListItem;
  v6 = [(HUBridgeListItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = _HULocalizedStringWithDefaultValue(@"HUBridgeAndResidentListItemTitle", @"HUBridgeAndResidentListItemTitle", 1);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v4 setObject:@"Home.HomeSettings.HubsAndBridges" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  uint64_t v6 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
  v7 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
  v28 = (void *)v6;
  v8 = [v7 configurationByApplyingConfiguration:v6];
  objc_super v9 = [MEMORY[0x1E4F69548] iconDescriptorForAccessoryCategoryOrServiceType:*MEMORY[0x1E4F2C1A0]];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [v12 imageIconDescriptorWithUpdatedImageSymbolConfiguration:v8];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v14 = [(HUBridgeListItem *)self home];
  v15 = [v14 accessories];
  v16 = objc_msgSend(v15, "na_filter:", &__block_literal_global_127);
  uint64_t v17 = [v16 count];

  v18 = [(HUBridgeListItem *)self home];
  v19 = [v18 residentDevices];
  uint64_t v20 = [v19 count];

  if (v20 + v17)
  {
    v21 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", v20 + v17);
    [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v22 = [(HUBridgeListItem *)self home];
  char v23 = objc_msgSend(v22, "hf_currentUserIsAdministrator");

  if ((v23 & 1) == 0) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v24 = (void *)MEMORY[0x1E4F7A0D8];
  v25 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v26 = [v24 futureWithResult:v25];

  return v26;
}

uint64_t __48__HUBridgeListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAsBridge");
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end