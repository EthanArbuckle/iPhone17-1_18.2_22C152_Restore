@interface HFAccessoryInfoDetailsItemProvider
+ (id)_displayValueForCachedValue:(id)a3 characteristicType:(id)a4 accessoryInfoService:(id)a5;
+ (id)accessoryInfoServiceDetailComparator;
+ (id)preferredCharacteristicOrderArray;
- (BOOL)canToggleAccessoryInfoItem:(id)a3;
- (BOOL)supportsWiFiStrengthDisplay:(id)a3;
- (HFAccessoryInfoDetailsItemProvider)init;
- (HFAccessoryInfoDetailsItemProvider)initWithHome:(id)a3 accessory:(id)a4;
- (HFAccessoryInfoItem)firmwareItem;
- (HFAccessoryInfoItem)softwareItem;
- (HFAccessoryNetworkInfoItem)networkItem;
- (HFCharacteristicValueSource)valueSource;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSMutableSet)accessoryInfoDetailItems;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setAccessory:(id)a3;
- (void)setAccessoryInfoDetailItems:(id)a3;
- (void)setValueSource:(id)a3;
- (void)toggleAccessoryInfoItem:(id)a3;
@end

@implementation HFAccessoryInfoDetailsItemProvider

+ (id)preferredCharacteristicOrderArray
{
  if (qword_26AB2E6D8 != -1) {
    dispatch_once(&qword_26AB2E6D8, &__block_literal_global_79);
  }
  v2 = (void *)_MergedGlobals_3_0;
  return v2;
}

void __71__HFAccessoryInfoDetailsItemProvider_preferredCharacteristicOrderArray__block_invoke()
{
  v4[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C3C0];
  v4[0] = *MEMORY[0x263F0C270];
  v4[1] = v0;
  v4[2] = *MEMORY[0x263F0C278];
  v4[3] = @"HFAccessoryInfoTypeNetworkPreferredOrderKey";
  uint64_t v1 = *MEMORY[0x263F0C400];
  v4[4] = *MEMORY[0x263F0C190];
  v4[5] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  v3 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = v2;
}

- (HFAccessoryInfoDetailsItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_accessory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryInfoDetailsItemProvider.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryInfoDetailsItemProvider init]",
    v5);

  return 0;
}

- (HFAccessoryInfoDetailsItemProvider)initWithHome:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryInfoDetailsItemProvider;
  v9 = [(HFItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_accessory, a4);
  }

  return v10;
}

- (BOOL)supportsWiFiStrengthDisplay:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];

  if (v5 != v4) {
    return 0;
  }
  id v7 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];
  char v8 = [v7 supportsWiFiStrengthDisplay];

  return v8;
}

- (BOOL)canToggleAccessoryInfoItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryInfoDetailsItemProvider *)self items];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];
    BOOL v8 = v7 == v4;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)toggleAccessoryInfoItem:(id)a3
{
  id v8 = a3;
  id v4 = [(HFAccessoryInfoDetailsItemProvider *)self items];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];

    if (v6 == v8)
    {
      id v7 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];
      [v7 toggleNetworkInfoType];
    }
  }
}

- (HFCharacteristicValueSource)valueSource
{
  valueSource = self->_valueSource;
  if (valueSource)
  {
    v3 = valueSource;
  }
  else
  {
    id v4 = [(HFAccessoryInfoDetailsItemProvider *)self home];
    objc_msgSend(v4, "hf_characteristicValueManager");
    v3 = (HFCharacteristicValueSource *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)reloadItems
{
  v3 = [(HFAccessoryInfoDetailsItemProvider *)self accessoryInfoDetailItems];
  id v4 = [(HFAccessoryInfoDetailsItemProvider *)self accessoryInfoDetailItems];
  int v5 = [HFItemProviderReloadResults alloc];
  id v6 = [MEMORY[0x263EFFA08] set];
  id v7 = [(HFItemProviderReloadResults *)v5 initWithAddedItems:v3 removedItems:v6 existingItems:v4];

  id v8 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v8;
}

- (id)invalidationReasons
{
  v7[3] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryInfoDetailsItemProvider;
  uint64_t v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"service";
  v7[1] = @"accessory";
  v7[2] = @"room";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)accessoryInfoServiceDetailComparator
{
  return &__block_literal_global_21_0;
}

uint64_t __74__HFAccessoryInfoDetailsItemProvider_accessoryInfoServiceDetailComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 latestResults];
  objc_super v6 = [v5 objectForKeyedSubscript:@"accessoryInfoDetailPreferredOrder"];

  id v7 = [v4 latestResults];

  id v8 = [v7 objectForKeyedSubscript:@"accessoryInfoDetailPreferredOrder"];

  uint64_t v15 = MEMORY[0x263EF8330];
  id v9 = v6;
  v16 = v9;
  id v10 = v8;
  v11 = v10;
  id v17 = v10;
  if (v9) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = v10 != 0;
  }
  v13 = v10;
  if (v9 && v10)
  {
    uint64_t v12 = objc_msgSend(v9, "compare:", v10, v15, 3221225472, __74__HFAccessoryInfoDetailsItemProvider_accessoryInfoServiceDetailComparator__block_invoke_2, &unk_264091450, v9);
    v13 = v17;
  }

  return v12;
}

uint64_t __74__HFAccessoryInfoDetailsItemProvider_accessoryInfoServiceDetailComparator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

- (NSMutableSet)accessoryInfoDetailItems
{
  accessoryInfoDetailItems = self->_accessoryInfoDetailItems;
  if (accessoryInfoDetailItems)
  {
    v3 = accessoryInfoDetailItems;
    goto LABEL_9;
  }
  int v5 = [HFAccessoryInfoItem alloc];
  objc_super v6 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  id v7 = [(HFAccessoryInfoDetailsItemProvider *)self home];
  id v8 = [(HFAccessoryInfoItem *)v5 initWithAccessory:v6 infoType:1 home:v7];
  firmwareItem = self->_firmwareItem;
  self->_firmwareItem = v8;

  id v10 = [HFAccessoryInfoItem alloc];
  v11 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  uint64_t v12 = [(HFAccessoryInfoDetailsItemProvider *)self home];
  v13 = [(HFAccessoryInfoItem *)v10 initWithAccessory:v11 infoType:2 home:v12];
  softwareItem = self->_softwareItem;
  self->_softwareItem = v13;

  uint64_t v15 = [HFAccessoryNetworkInfoItem alloc];
  v16 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  id v17 = [(HFAccessoryInfoDetailsItemProvider *)self home];
  v18 = [(HFAccessoryNetworkInfoItem *)v15 initWithAccessory:v16 home:v17];
  networkItem = self->_networkItem;
  self->_networkItem = v18;

  v20 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  v21 = [v20 services];

  v57 = v21;
  v22 = objc_msgSend(v21, "na_firstObjectPassingTest:", &__block_literal_global_27_2);
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_2;
  aBlock[3] = &unk_264093CA8;
  objc_copyWeak(&v66, location);
  id v23 = v22;
  id v65 = v23;
  v24 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  v25 = objc_opt_class();
  v26 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  v27 = [v26 manufacturer];
  uint64_t v28 = *MEMORY[0x263F0C270];
  v61 = [v25 _displayValueForCachedValue:v27 characteristicType:*MEMORY[0x263F0C270] accessoryInfoService:v23];

  v29 = objc_opt_class();
  v30 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  v31 = [v30 model];
  uint64_t v32 = *MEMORY[0x263F0C278];
  v60 = [v29 _displayValueForCachedValue:v31 characteristicType:*MEMORY[0x263F0C278] accessoryInfoService:v23];

  v33 = [HFStaticItem alloc];
  v34 = v24[2](v24, v28, v61);
  v59 = [(HFStaticItem *)v33 initWithResultsBlock:v34];

  v35 = [HFStaticItem alloc];
  v36 = v24[2](v24, v32, v60);
  v58 = [(HFStaticItem *)v35 initWithResultsBlock:v36];

  v37 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  if (([v37 supportsCHIP] & 1) == 0)
  {

    goto LABEL_7;
  }
  v38 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
  v39 = [v38 serialNumber];

  if (v39)
  {
LABEL_7:
    v41 = objc_opt_class();
    v42 = [(HFAccessoryInfoDetailsItemProvider *)self accessory];
    v43 = [v42 serialNumber];
    uint64_t v44 = *MEMORY[0x263F0C3C0];
    v45 = [v41 _displayValueForCachedValue:v43 characteristicType:*MEMORY[0x263F0C3C0] accessoryInfoService:v23];

    v46 = [HFStaticItem alloc];
    v47 = v24[2](v24, v44, v45);
    v40 = [(HFStaticItem *)v46 initWithResultsBlock:v47];

    goto LABEL_8;
  }
  v40 = 0;
LABEL_8:
  v48 = [HFStaticItem alloc];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_4;
  v62[3] = &unk_264093CD0;
  objc_copyWeak(&v63, location);
  v49 = [(HFStaticItem *)v48 initWithResultsBlock:v62];
  v50 = (void *)MEMORY[0x263EFF9C0];
  v51 = [(HFAccessoryInfoDetailsItemProvider *)self firmwareItem];
  v52 = [(HFAccessoryInfoDetailsItemProvider *)self softwareItem];
  v53 = [(HFAccessoryInfoDetailsItemProvider *)self networkItem];
  objc_msgSend(v50, "setWithObjects:", v59, v58, v51, v52, v53, v49, 0);
  v54 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  v55 = self->_accessoryInfoDetailItems;
  self->_accessoryInfoDetailItems = v54;

  [(NSMutableSet *)self->_accessoryInfoDetailItems na_safeAddObject:v40];
  v3 = self->_accessoryInfoDetailItems;

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v66);
  objc_destroyWeak(location);

LABEL_9:
  return v3;
}

uint64_t __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D610]];

  return v3;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_3;
  v11[3] = &unk_264093C80;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = _Block_copy(v11);

  objc_destroyWeak(&v15);
  return v9;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D610]];
  [v3 setObject:v4 forKeyedSubscript:@"dependentServiceTypes"];

  id v5 = NSString;
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0B5C0]];
  id v7 = [v5 stringWithFormat:@"AccessoryDetails.%@", v6];
  [v3 setObject:v7 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = objc_msgSend(v8, "hf_characteristicOfType:", *(void *)(a1 + 40));
    id v10 = +[HFAccessoryInfoItem accessibilityStringForCharacteristic:*(void *)(a1 + 40)];
    [v3 setObject:v10 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

    v11 = [MEMORY[0x263EFF9C0] setWithObject:*(void *)(a1 + 32)];
    objc_msgSend(v11, "na_safeAddObject:", v9);
    [v3 setObject:v11 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
  id v12 = +[HFAccessoryInfoItem localizedStringForCharacteristic:*(void *)(a1 + 40)];
  [v3 setObject:v12 forKeyedSubscript:@"title"];

  [v3 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"description"];
  if (*(void *)(a1 + 48))
  {
    id v13 = [WeakRetained home];
    uint64_t v14 = objc_msgSend(v13, "hf_currentUserIsRestrictedGuest");
  }
  else
  {
    uint64_t v14 = 1;
  }
  id v15 = [NSNumber numberWithBool:v14];
  [v3 setObject:v15 forKeyedSubscript:@"hidden"];

  v16 = +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray];
  uint64_t v17 = [v16 indexOfObject:*(void *)(a1 + 40)];

  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray];
    uint64_t v17 = [v18 count];
  }
  v19 = [NSNumber numberWithUnsignedInteger:v17];
  [v3 setObject:v19 forKeyedSubscript:@"accessoryInfoDetailPreferredOrder"];

  v20 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v20;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained accessory];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    id v6 = [WeakRetained accessory];
    id v7 = [v5 setWithObject:v6];
    [v2 setObject:v7 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
  else
  {
    id v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Unable to populate the uncertified static item properly since the accessory is missing.", v19, 2u);
    }
  }
  id v9 = [WeakRetained accessory];
  uint64_t v10 = [v9 certificationStatus];

  v11 = [NSNumber numberWithBool:v10 != 1];
  [v2 setObject:v11 forKeyedSubscript:@"hidden"];

  if (v10 == 1)
  {
    id v12 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryInfoDetailsCertification", @"HFAccessoryInfoDetailsCertification", 1);
    [v2 setObject:v12 forKeyedSubscript:@"title"];

    [v2 setObject:@"AccessoryDetails.HomeKitCertified" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
    id v13 = +[HFFormatterManager sharedInstance];
    uint64_t v14 = [v13 BOOLeanFormatter];
    id v15 = [NSNumber numberWithBool:0];
    v16 = [v14 stringForObjectValue:v15];
    [v2 setObject:v16 forKeyedSubscript:@"description"];
  }
  uint64_t v17 = [MEMORY[0x263F58190] futureWithResult:v2];

  return v17;
}

+ (id)_displayValueForCachedValue:(id)a3 characteristicType:(id)a4 accessoryInfoService:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7
    && +[HFUtilities isInternalInstall]
    && ((objc_msgSend(v9, "hf_characteristicOfType:", v8),
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v10,
         !v9)
     || v10))
  {
    id v13 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [MEMORY[0x263F0E248] localizedDescriptionForCharacteristicType:v8];
      int v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Missing cached value for accessory information characteristic %@!", (uint8_t *)&v15, 0xCu);
    }
    v11 = @"(null - file a radar!)";
  }
  else
  {
    v11 = (__CFString *)v7;
  }

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setValueSource:(id)a3
{
}

- (void)setAccessoryInfoDetailItems:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HFAccessoryInfoItem)firmwareItem
{
  return self->_firmwareItem;
}

- (HFAccessoryInfoItem)softwareItem
{
  return self->_softwareItem;
}

- (HFAccessoryNetworkInfoItem)networkItem
{
  return self->_networkItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkItem, 0);
  objc_storeStrong((id *)&self->_softwareItem, 0);
  objc_storeStrong((id *)&self->_firmwareItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDetailItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end