@interface HUHomeHubPersonalDeviceWarningItemManager
- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 devices:(id)a4;
- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSSet)devices;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)itemForDevice:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation HUHomeHubPersonalDeviceWarningItemManager

- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_devices_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeHubPersonalDeviceWarningItemManager.m", 27, @"%s is unavailable; use %@ instead",
    "-[HUHomeHubPersonalDeviceWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubPersonalDeviceWarningItemManager)initWithDelegate:(id)a3 devices:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubPersonalDeviceWarningItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_devices, a4);
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(HUHomeHubPersonalDeviceWarningItemManager *)self devices];
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubPersonalDeviceWarningItemManager _buildItemProvidersForHome:]";
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s fetched devices: %@.", buf, 0x16u);
  }
  v6 = [(HUHomeHubPersonalDeviceWarningItemManager *)self devices];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HUHomeHubPersonalDeviceWarningItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E638E6B0;
  v11[4] = self;
  id v7 = objc_msgSend(v6, "na_map:", v11);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v7];
  v12 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  return v9;
}

uint64_t __72__HUHomeHubPersonalDeviceWarningItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemForDevice:a2];
}

- (id)itemForDevice:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3)
  {
    v5 = [v3 name];
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315394;
      v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
      __int16 v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%s fetched device: %@.", (uint8_t *)&v25, 0x16u);
    }

    if ([(__CFString *)v5 length]
      || ([v3 productInfo], v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      id v7 = v5;
    }
    else
    {
      v9 = [v3 productInfo];
      [v9 productClass];

      HMFProductClassToString();
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v11 = [v3 productInfo];
        int v25 = 136315650;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        __int16 v27 = 2112;
        v28 = v7;
        __int16 v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%s device productClassName: %@, productInfo: %@.", (uint8_t *)&v25, 0x20u);
      }
    }
    objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68AB8]);
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[__CFString length](v7, "length") == 0);
    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E4F68B10]);

    v13 = [v3 productInfo];

    if (v13)
    {
      v14 = [v3 productInfo];
      [v14 productClass];

      __int16 v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFProductClassToString();
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v25 = 136315394;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        __int16 v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%s device productClass String: %@.", (uint8_t *)&v25, 0x16u);
      }
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_symbolForDevice:", v3);
      v18 = [v17 imageWithRenderingMode:0];

      objc_msgSend(v4, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E4F689F8]);
      v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = @"populated";
        if (!v18) {
          v20 = @"nil: no icon";
        }
        int v25 = 136315394;
        v26 = "-[HUHomeHubPersonalDeviceWarningItemManager itemForDevice:]";
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%s deviceImage is %@", (uint8_t *)&v25, 0x16u);
      }
    }
  }
  id v21 = objc_alloc(MEMORY[0x1E4F695C0]);
  v22 = (void *)[v4 copy];
  v23 = (void *)[v21 initWithResults:v22];

  return v23;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"devicesSectionIdentifier"];
  v8 = [(HFItemManager *)self allItems];
  v9 = [v8 allObjects];
  v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_188];
  [v7 setItems:v10];

  [v6 addObject:v7];
  objc_super v11 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v5];

  return v11;
}

uint64_t __78__HUHomeHubPersonalDeviceWarningItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F689F8];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  if (v8)
  {
  }
  else
  {
    __int16 v15 = [v5 latestResults];
    v16 = [v15 objectForKeyedSubscript:v7];

    if (v16)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
  }
  v9 = [v4 latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];
  if (!v10)
  {

    goto LABEL_9;
  }
  objc_super v11 = (void *)v10;
  v12 = [v5 latestResults];
  v13 = [v12 objectForKeyedSubscript:v7];

  if (v13)
  {
LABEL_9:
    uint64_t v14 = [MEMORY[0x1E4F69220] defaultItemComparator];

    goto LABEL_10;
  }
  uint64_t v14 = -1;
LABEL_10:

  return v14;
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end