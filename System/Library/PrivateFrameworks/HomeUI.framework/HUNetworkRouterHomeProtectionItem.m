@interface HUNetworkRouterHomeProtectionItem
- (HMHome)home;
- (HUNetworkRouterHomeProtectionItem)init;
- (HUNetworkRouterHomeProtectionItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUNetworkRouterHomeProtectionItem

- (HUNetworkRouterHomeProtectionItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkRouterHomeProtectionItem.m", 19, @"%s is unavailable; use %@ instead",
    "-[HUNetworkRouterHomeProtectionItem init]",
    v5);

  return 0;
}

- (HUNetworkRouterHomeProtectionItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUNetworkRouterHomeProtectionItem;
  v6 = [(HUNetworkRouterHomeProtectionItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = _HULocalizedStringWithDefaultValue(@"HUNetworkRouterHomeProtectionItemTitle", @"HUNetworkRouterHomeProtectionItemTitle", 1);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v6 = NSNumber;
  v7 = [(HUNetworkRouterHomeProtectionItem *)self home];
  objc_msgSend(v7, "hf_isNetworkProtectionEnabled");
  v8 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  objc_super v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [(HUNetworkRouterHomeProtectionItem *)self home];
  v11 = [v9 setWithObject:v10];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v12 = NSNumber;
  v13 = [(HUNetworkRouterHomeProtectionItem *)self home];
  v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "hf_isNetworkProtectionSupportedForHome") ^ 1);
  [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A78]];
  v15 = [(HUNetworkRouterHomeProtectionItem *)self home];
  v16 = objc_msgSend(v15, "hf_localizedDescriptionForNetworkProtectionSupport");
  [v4 setObject:v16 forKeyedSubscript:@"HFResultNetworkRouterHomeProtectionDescriptionKey"];

  v17 = (void *)MEMORY[0x1E4F7A0D8];
  v18 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v19 = [v17 futureWithResult:v18];

  return v19;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end