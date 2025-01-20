@interface HUNetworkRouterListItem
- (HMHome)home;
- (HUNetworkRouterListItem)init;
- (HUNetworkRouterListItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUNetworkRouterListItem

- (HUNetworkRouterListItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkRouterListItem.m", 18, @"%s is unavailable; use %@ instead",
    "-[HUNetworkRouterListItem init]",
    v5);

  return 0;
}

- (HUNetworkRouterListItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUNetworkRouterListItem;
  v6 = [(HUNetworkRouterListItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = HULocalizedWiFiString(@"HUNetworkRouterSettingsTitle");
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [(HUNetworkRouterListItem *)self home];
  v8 = [v6 setWithObject:v7];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  objc_super v9 = [MEMORY[0x1E4F69548] iconDescriptorForAccessoryCategoryOrServiceType:*MEMORY[0x1E4F2C260]];
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v10 = [(HUNetworkRouterListItem *)self home];
  v11 = [v10 accessories];
  v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_181);
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", v13);
    [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v15 = (void *)MEMORY[0x1E4F7A0D8];
  v16 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v17 = [v15 futureWithResult:v16];

  return v17;
}

uint64_t __55__HUNetworkRouterListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end