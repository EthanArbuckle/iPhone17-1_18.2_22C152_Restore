@interface HFMediaAccessoryItemProvider
- (BOOL)includeContainedProfiles;
- (BOOL)includeMediaSystems;
- (BOOL)includeSiriEndPointProfiles;
- (HFCharacteristicValueSource)overrideValueSource;
- (HFCharacteristicValueSource)valueSource;
- (HFMediaAccessoryItemProvider)init;
- (HFMediaAccessoryItemProvider)initWithHome:(id)a3;
- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeContainedProfiles:(BOOL)a4;
- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeMediaSystems:(BOOL)a4;
- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeSiriEndPointProfiles:(BOOL)a4;
- (HMHome)home;
- (NSMutableSet)mediaAccessoryItems;
- (id)_siriEndpoints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5;
- (void)setFilter:(id)a3;
- (void)setIncludeContainedProfiles:(BOOL)a3;
- (void)setIncludeSiriEndPointProfiles:(BOOL)a3;
- (void)setMediaAccessoryItems:(id)a3;
- (void)setOverrideValueSource:(id)a3;
@end

@implementation HFMediaAccessoryItemProvider

- (HFMediaAccessoryItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessoryItemProvider.m", 50, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessoryItemProvider init]",
    v5);

  return 0;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeSiriEndPointProfiles:(BOOL)a4
{
  result = -[HFMediaAccessoryItemProvider initWithHome:](self, "initWithHome:", a3, a4);
  if (result) {
    result->_includeSiriEndPointProfiles = 1;
  }
  return result;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeContainedProfiles:(BOOL)a4
{
  result = [(HFMediaAccessoryItemProvider *)self initWithHome:a3 includeMediaSystems:0];
  if (result) {
    result->_includeContainedProfiles = 1;
  }
  return result;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = [(HFMediaAccessoryItemProvider *)self initWithHome:v4 includeMediaSystems:(HFPreferencesBooleanValueForKey(@"EnableMediaSystems") & 0xFFFFFFFFFFFFFFFDLL) == 0];

  return v5;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeMediaSystems:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMediaAccessoryItemProvider;
  v8 = [(HFItemProvider *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_includeMediaSystems = a4;
    v10 = objc_opt_new();
    [(HFMediaAccessoryItemProvider *)v9 setMediaAccessoryItems:v10];
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFMediaAccessoryItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (HFCharacteristicValueSource)valueSource
{
  v3 = [(HFMediaAccessoryItemProvider *)self overrideValueSource];

  if (v3)
  {
    id v4 = [(HFMediaAccessoryItemProvider *)self overrideValueSource];
  }
  else
  {
    v5 = [(HFMediaAccessoryItemProvider *)self home];
    id v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }
  return (HFCharacteristicValueSource *)v4;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v30, &location);
  v3 = _Block_copy(aBlock);
  id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
  v5 = [(HFMediaAccessoryItemProvider *)self home];
  v6 = objc_msgSend(v5, "hf_allUniqueMediaProfileContainers");
  id v7 = (id)[v4 initWithArray:v6];

  if (![(HFMediaAccessoryItemProvider *)self includeMediaSystems])
  {
    v8 = [(HFMediaAccessoryItemProvider *)self home];
    v9 = [v8 mediaSystems];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v11 = objc_msgSend(v7, "na_filter:", &__block_literal_global_103);
      objc_super v12 = (void *)[v11 mutableCopy];

      v13 = (void *)MEMORY[0x263EFF9C0];
      v14 = [(HFMediaAccessoryItemProvider *)self home];
      v15 = objc_msgSend(v14, "hf_allUniqueMediaProfileContainers");
      v16 = [v13 setWithArray:v15];

      [v16 minusSet:v12];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_3;
      v27[3] = &unk_264095020;
      id v7 = v12;
      id v28 = v7;
      objc_msgSend(v16, "na_each:", v27);
    }
  }
  if ([(HFMediaAccessoryItemProvider *)self includeSiriEndPointProfiles])
  {
    v17 = [(HFMediaAccessoryItemProvider *)self _siriEndpoints];
    v18 = (void *)[v17 mutableCopy];

    [v18 minusSet:v7];
    v19 = [v18 allObjects];
    [v7 addObjectsFromArray:v19];
  }
  v20 = [v7 allObjects];
  v21 = [(HFMediaAccessoryItemProvider *)self filter];
  v22 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v20 filter:v21 itemMap:v3];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_4;
  v25[3] = &unk_26408D198;
  objc_copyWeak(&v26, &location);
  v23 = [v22 flatMap:v25];
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return v23;
}

HFMediaAccessoryItem *__43__HFMediaAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v3;
  if ([v5 conformsToProtocol:&unk_26C155B48]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [HFMediaAccessoryItem alloc];
    v9 = [WeakRetained valueSource];
    uint64_t v10 = [(HFMediaAccessoryItem *)v8 initWithValueSource:v9 mediaProfileContainer:v7];
  }
  else
  {
    NSLog(&cfstr_Mediaprofileco_0.isa, v5);
    uint64_t v10 = 0;
  }
  v11 = v10;
  if ([(HFMediaAccessoryItem *)v11 conformsToProtocol:&unk_26C11EE68]) {
    objc_super v12 = v11;
  }
  else {
    objc_super v12 = 0;
  }
  v13 = v12;

  if (v13)
  {
    if ([(HFMediaAccessoryItem *)v13 isSiriEndpointAccessory])
    {
      v14 = [(HFMediaAccessoryItem *)v13 commonSettingsManager];

      if (v14)
      {
        v15 = [(HFMediaAccessoryItem *)v13 commonSettingsManager];
        [v15 addObserver:WeakRetained];
      }
    }
  }

  return v11;
}

BOOL __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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

  return v5 == 0;
}

void __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v9 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = *(void **)(a1 + 32);
  id v7 = [v5 mediaProfiles];
  v8 = [v7 allObjects];
  [v6 addObjectsFromArray:v8];
}

id __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained mediaAccessoryItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained mediaAccessoryItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)items
{
  id v2 = [(HFMediaAccessoryItemProvider *)self mediaAccessoryItems];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)invalidationReasons
{
  v7[3] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFMediaAccessoryItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"softwareUpdate";
  v7[2] = @"mediaSystem";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = [(HFMediaAccessoryItemProvider *)self reloadItems];
}

- (id)_siriEndpoints
{
  id v2 = [(HFMediaAccessoryItemProvider *)self home];
  id v3 = [v2 accessories];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_286);

  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

id __46__HFMediaAccessoryItemProvider__siriEndpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_siriEndpointProfile");
  if (v3)
  {
    id v4 = [v2 mediaProfile];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (BOOL)includeMediaSystems
{
  return self->_includeMediaSystems;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)mediaAccessoryItems
{
  return self->_mediaAccessoryItems;
}

- (void)setMediaAccessoryItems:(id)a3
{
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
}

- (BOOL)includeSiriEndPointProfiles
{
  return self->_includeSiriEndPointProfiles;
}

- (void)setIncludeSiriEndPointProfiles:(BOOL)a3
{
  self->_includeSiriEndPointProfiles = a3;
}

- (BOOL)includeContainedProfiles
{
  return self->_includeContainedProfiles;
}

- (void)setIncludeContainedProfiles:(BOOL)a3
{
  self->_includeContainedProfiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end