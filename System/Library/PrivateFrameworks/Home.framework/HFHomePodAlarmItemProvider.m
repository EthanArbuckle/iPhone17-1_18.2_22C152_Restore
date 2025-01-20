@interface HFHomePodAlarmItemProvider
- (HFAccessorySettingMobileTimerAdapter)mobileTimerAdapter;
- (HFHomePodAlarmItemProvider)initWithMediaProfileContainer:(id)a3;
- (HFMediaProfileContainer)mediaProfileContainer;
- (NSMutableDictionary)alarmIDToItemMap;
- (NSMutableSet)alarmItems;
- (id)items;
- (id)reloadItems;
@end

@implementation HFHomePodAlarmItemProvider

- (HFHomePodAlarmItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFHomePodAlarmItemProvider;
  v6 = [(HFItemProvider *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    v8 = objc_msgSend(v5, "hf_settingsAdapterManager");
    uint64_t v9 = [v8 adapterForIdentifier:@"MobileTimerAdapter"];
    mobileTimerAdapter = v7->_mobileTimerAdapter;
    v7->_mobileTimerAdapter = (HFAccessorySettingMobileTimerAdapter *)v9;

    uint64_t v11 = objc_opt_new();
    alarmItems = v7->_alarmItems;
    v7->_alarmItems = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    alarmIDToItemMap = v7->_alarmIDToItemMap;
    v7->_alarmIDToItemMap = (NSMutableDictionary *)v13;
  }
  return v7;
}

- (id)items
{
  v2 = [(HFHomePodAlarmItemProvider *)self alarmItems];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  if (_os_feature_enabled_impl())
  {
    id v3 = objc_alloc_init(MEMORY[0x263F58190]);
    v4 = [(HFHomePodAlarmItemProvider *)self mobileTimerAdapter];
    id v5 = [v4 allAlarmsFuture];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke;
    v21[3] = &unk_264093D20;
    objc_copyWeak(&v23, &location);
    id v6 = v3;
    id v22 = v6;
    id v7 = (id)[v5 addSuccessBlock:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_7;
    v19[3] = &unk_26408CDF0;
    id v8 = v6;
    id v20 = v8;
    id v9 = (id)[v5 addFailureBlock:v19];
    v10 = v20;
    id v11 = v8;

    objc_destroyWeak(&v23);
  }
  else
  {
    id v5 = [(HFHomePodAlarmItemProvider *)self mobileTimerAdapter];
    v12 = [v5 allAlarms];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_10;
    v17[3] = &unk_264099878;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = [(HFItemProvider *)self reloadItemsWithObjects:v12 keyAdaptor:&__block_literal_global_15_9 itemAdaptor:&__block_literal_global_17_9 filter:0 itemMap:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_11;
    v15[3] = &unk_26408D198;
    objc_copyWeak(&v16, &location);
    id v11 = [v13 flatMap:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
  return v11;
}

void __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_264099878;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v5 = [WeakRetained reloadItemsWithObjects:v3 keyAdaptor:&__block_literal_global_185 itemAdaptor:&__block_literal_global_7_10 filter:0 itemMap:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v6 = [v5 flatMap:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_6;
  v8[3] = &unk_264091218;
  id v9 = *(id *)(a1 + 32);
  id v7 = (id)[v6 addCompletionBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 alarmID];
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 alarm];
  id v3 = [v2 alarmID];

  return v3;
}

HFHomePodAlarmItem *__41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained alarmIDToItemMap];
  id v6 = [v3 alarmID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [WeakRetained alarmIDToItemMap];
    id v9 = [v3 alarmID];
    v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v11 = [HFHomePodAlarmItem alloc];
    v12 = [WeakRetained mediaProfileContainer];
    v10 = [(HFHomePodAlarmItem *)v11 initWithMediaProfileContainer:v12 alarm:v3];

    id v8 = [WeakRetained alarmIDToItemMap];
    id v9 = [v3 alarmID];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }

  return v10;
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained alarmItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained alarmItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithResult:a2];
  }
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 alarmID];
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 alarm];
  id v3 = [v2 alarmID];

  return v3;
}

HFHomePodAlarmItem *__41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained alarmIDToItemMap];
  id v6 = [v3 alarmID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [WeakRetained alarmIDToItemMap];
    id v9 = [v3 alarmID];
    v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v11 = [HFHomePodAlarmItem alloc];
    v12 = [WeakRetained mediaProfileContainer];
    v10 = [(HFHomePodAlarmItem *)v11 initWithMediaProfileContainer:v12 alarm:v3];

    id v8 = [WeakRetained alarmIDToItemMap];
    id v9 = [v3 alarmID];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }

  return v10;
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_11(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained alarmItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained alarmItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFAccessorySettingMobileTimerAdapter)mobileTimerAdapter
{
  return self->_mobileTimerAdapter;
}

- (NSMutableDictionary)alarmIDToItemMap
{
  return self->_alarmIDToItemMap;
}

- (NSMutableSet)alarmItems
{
  return self->_alarmItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmItems, 0);
  objc_storeStrong((id *)&self->_alarmIDToItemMap, 0);
  objc_storeStrong((id *)&self->_mobileTimerAdapter, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end