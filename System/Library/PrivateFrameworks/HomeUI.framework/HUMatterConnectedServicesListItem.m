@interface HUMatterConnectedServicesListItem
- (HFItemProvider)itemProvider;
- (HMAccessory)accessory;
- (HMHome)home;
- (HUMatterConnectedServicesListItem)initWithAccessory:(id)a3 home:(id)a4 itemProvider:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUMatterConnectedServicesListItem

- (HUMatterConnectedServicesListItem)initWithAccessory:(id)a3 home:(id)a4 itemProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((v9 != 0) == (v10 != 0)) {
    NSLog(&cfstr_ExactlyOneShou.isa);
  }
  v15.receiver = self;
  v15.super_class = (Class)HUMatterConnectedServicesListItem;
  v12 = [(HUMatterConnectedServicesListItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a3);
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v13->_itemProvider, a5);
  }

  return v13;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v20[0] = *MEMORY[0x1E4F68AB8];
    v7 = _HULocalizedStringWithDefaultValue(@"HUMatterConnectedServicesTitle", @"HUMatterConnectedServicesTitle", 1);
    uint64_t v8 = *MEMORY[0x1E4F68980];
    v21[0] = v7;
    v21[1] = &stru_1F18F92B8;
    uint64_t v9 = *MEMORY[0x1E4F68B28];
    v20[1] = v8;
    v20[2] = v9;
    v20[3] = *MEMORY[0x1E4F68B10];
    v21[2] = MEMORY[0x1E4F1CC38];
    v21[3] = MEMORY[0x1E4F1CC38];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    v12 = [MEMORY[0x1E4F69228] outcomeWithResults:v10];
    v13 = [v11 futureWithResult:v12];
  }
  else
  {
    objc_initWeak(&location, self);
    v14 = [(HUMatterConnectedServicesListItem *)self itemProvider];
    objc_super v15 = [v14 reloadItems];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__HUMatterConnectedServicesListItem__subclass_updateWithOptions___block_invoke;
    v17[3] = &unk_1E6386068;
    objc_copyWeak(&v18, &location);
    v13 = [v15 flatMap:v17];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v13;
}

id __65__HUMatterConnectedServicesListItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained itemProvider];
  v3 = [v2 items];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_18);

  v5 = [WeakRetained accessory];

  if (v5)
  {
    int v6 = [WeakRetained accessory];
    if ([v6 supportsCHIP]) {
      BOOL v7 = (unint64_t)[v4 count] < 2;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = [v4 count] == 0;
  }
  uint64_t v8 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", objc_msgSend(v4, "count"));
  v18[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUMatterConnectedServicesTitle", @"HUMatterConnectedServicesTitle", 1);
  uint64_t v10 = *MEMORY[0x1E4F68980];
  v19[0] = v9;
  v19[1] = v8;
  uint64_t v11 = *MEMORY[0x1E4F68B28];
  v18[1] = v10;
  v18[2] = v11;
  v19[2] = MEMORY[0x1E4F1CC28];
  v18[3] = *MEMORY[0x1E4F68B10];
  v12 = [NSNumber numberWithBool:v7];
  v19[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  v14 = (void *)MEMORY[0x1E4F7A0D8];
  objc_super v15 = [MEMORY[0x1E4F69228] outcomeWithResults:v13];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

uint64_t __65__HUMatterConnectedServicesListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [v5 connectedEcosystem];
  BOOL v7 = [v6 vendor];
  if ([v7 isSystemCommissionerVendor])
  {
    uint64_t v8 = [v5 connectedEcosystem];
    uint64_t v9 = [v8 owned] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (HFItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end