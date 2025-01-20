@interface HUHomeAudioAnalysisDetectionSettingsItemProvider
- (HMHome)home;
- (HUHomeAudioAnalysisDetectionSettingsItemProvider)init;
- (HUHomeAudioAnalysisDetectionSettingsItemProvider)initWithHome:(id)a3;
- (NSMutableSet)items;
- (id)reloadItems;
@end

@implementation HUHomeAudioAnalysisDetectionSettingsItemProvider

- (HUHomeAudioAnalysisDetectionSettingsItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeAudioAnalysisDetectionSettingsItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;
  }
  return v7;
}

- (HUHomeAudioAnalysisDetectionSettingsItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeAudioAnalysisDetectionSettingsItemProvider.m", 72, @"%s is unavailable; use %@ instead",
    "-[HUHomeAudioAnalysisDetectionSettingsItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_1E6386EF8;
  objc_copyWeak(&v9, &location);
  v3 = [(HFItemProvider *)self reloadItemsWithObjects:&unk_1F19B5A68 keyAdaptor:&__block_literal_global_289 itemAdaptor:&__block_literal_global_39_5 filter:0 itemMap:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_5;
  v6[3] = &unk_1E6385B38;
  objc_copyWeak(&v7, &location);
  v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

id __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 audioDetectionType];

  return [v2 numberWithUnsignedInteger:v3];
}

HUHomeAudioAnalysisDetectionSettingsItem *__63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained items];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6386108;
  id v6 = v3;
  id v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  id v7 = (HUHomeAudioAnalysisDetectionSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v8 = [HUHomeAudioAnalysisDetectionSettingsItem alloc];
    uint64_t v9 = [v6 unsignedIntegerValue];
    v10 = [WeakRetained home];
    id v7 = [(HUHomeAudioAnalysisDetectionSettingsItem *)v8 initWithDetectionType:v9 home:v10];
  }

  return v7;
}

BOOL __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 audioDetectionType];
    BOOL v8 = v7 == [*(id *)(a1 + 32) unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained items];
  BOOL v8 = [v3 removedItems];
  [v7 minusSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end