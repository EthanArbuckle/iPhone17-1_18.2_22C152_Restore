@interface HFHomeKitAccessorySettingsDataSource
- (HFHomeKitAccessorySettingsDataSource)initWithHomeManager:(id)a3;
- (HMAccessorySettingsDataSource)dataSource;
- (NSHashTable)observers;
- (id)hf_defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5;
- (id)hf_localizedTitleForKeyPath:(id)a3;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
- (void)addObserver:(id)a3;
- (void)hf_fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6;
- (void)hf_subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)removeObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5;
@end

@implementation HFHomeKitAccessorySettingsDataSource

- (HFHomeKitAccessorySettingsDataSource)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeKitAccessorySettingsDataSource;
  v5 = [(HFHomeKitAccessorySettingsDataSource *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "hf_accessorySettingsDataSource");
    dataSource = v5->_dataSource;
    v5->_dataSource = (HMAccessorySettingsDataSource *)v6;

    [(HMAccessorySettingsDataSource *)v5->_dataSource setDelegate:v5];
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitAccessorySettingsDataSource *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(HFHomeKitAccessorySettingsDataSource *)self observers];
  [v6 removeObject:v5];

  v7 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    v9 = [(HFHomeKitAccessorySettingsDataSource *)self observers];
    int v10 = 138413058;
    objc_super v11 = self;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Removed observer = [%@]. Remaining observers = [%@]", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v11 = [(HFHomeKitAccessorySettingsDataSource *)self observers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 updateSettingValue:v8 forKeyPath:v9 accessoryIdentifier:v10];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)hf_localizedTitleForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeKitAccessorySettingsDataSource *)self dataSource];
  uint64_t v6 = [v5 localizedTitleForKeyPath:v4];

  return v6;
}

- (void)hf_subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  long long v17 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = NSStringFromSelector(a2);
    int v20 = 138413314;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v18;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Subscribing to setting for homeIdentifier %@ accessoryIdentifier %@ keyPaths %@", (uint8_t *)&v20, 0x34u);
  }
  long long v19 = [(HFHomeKitAccessorySettingsDataSource *)self dataSource];
  [v19 subscribeToAccessorySettingsWithHomeIdentifier:v13 accessoryIdentifier:v14 keyPaths:v15 options:a6 completionHandler:v16];
}

- (void)hf_fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(HFHomeKitAccessorySettingsDataSource *)self dataSource];
  [v14 fetchAccessorySettingsWithHomeIdentifier:v13 accessoryIdentifier:v12 keyPaths:v11 completionHandler:v10];
}

- (id)hf_defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HFHomeKitAccessorySettingsDataSource *)self dataSource];
  id v12 = [v11 defaultSettingsWithHomeIdentifier:v10 accessoryIdentifier:v9 keyPaths:v8];

  return v12;
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HFHomeKitAccessorySettingsDataSource *)self observers];
  id v11 = (void *)[v10 copy];

  id v12 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v13;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Settings updated for accessoryIdentifier [%@] setting [%@]. Notifying observers [%@]", buf, 0x34u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v19, "didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:", v8, v9, (void)v20);
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (HMAccessorySettingsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end