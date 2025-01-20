@interface HUMediaAccessoryAudioSettingsItemManager
- (HFItem)audioSettingsItem;
- (HFMediaSystemBuilder)mediaSystemBuilder;
- (HUMediaAccessoryAudioSettingsItemManager)initWithMediaSystemBuilder:(id)a3 sourceItem:(id)a4 delegate:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
@end

@implementation HUMediaAccessoryAudioSettingsItemManager

- (HUMediaAccessoryAudioSettingsItemManager)initWithMediaSystemBuilder:(id)a3 sourceItem:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUMediaAccessoryAudioSettingsItemManager.m", 23, @"Invalid parameter not satisfying: %@", @"builder" object file lineNumber description];
  }
  v13 = (void *)[v11 copy];
  v17.receiver = self;
  v17.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  v14 = [(HFItemManager *)&v17 initWithDelegate:v12 sourceItem:v13];

  if (v14) {
    objc_storeStrong((id *)&v14->_mediaSystemBuilder, a3);
  }

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  objc_super v17 = __71__HUMediaAccessoryAudioSettingsItemManager__buildItemProvidersForHome___block_invoke;
  v18 = &unk_1E6384FD0;
  objc_copyWeak(&v19, &location);
  v6 = (HFItem *)[v5 initWithResultsBlock:&v15];
  audioSettingsItem = self->_audioSettingsItem;
  self->_audioSettingsItem = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F695C8]);
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [(HUMediaAccessoryAudioSettingsItemManager *)self audioSettingsItem];
  id v11 = [v9 setWithObject:v10];
  id v12 = (void *)[v8 initWithItems:v11];

  v21[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __71__HUMediaAccessoryAudioSettingsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_opt_new();
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [WeakRetained mediaSystemBuilder];
  id v5 = [v4 mediaSystem];
  v6 = objc_msgSend(v3, "na_setWithSafeObject:", v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(WeakRetained, "mediaSystemBuilder", 0);
  id v8 = [v7 accessories];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUMediaAccessoryAudioSettingsItemManager *)self audioSettingsItem];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"MediaAccessoryAudioSettings"];
    id v8 = [(HUMediaAccessoryAudioSettingsItemManager *)self audioSettingsItem];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v7 setItems:v9];

    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsSectionFooter", @"HUMediaAccessoryAudioSettingsSectionFooter", 1);
    [v7 setFooterTitle:v10];

    v13 = v7;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)_registerForExternalUpdates
{
  v2.receiver = self;
  v2.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  [(HFItemManager *)&v2 _registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v2.receiver = self;
  v2.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  [(HFItemManager *)&v2 _unregisterForExternalUpdates];
}

- (HFItem)audioSettingsItem
{
  return self->_audioSettingsItem;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);

  objc_storeStrong((id *)&self->_audioSettingsItem, 0);
}

@end