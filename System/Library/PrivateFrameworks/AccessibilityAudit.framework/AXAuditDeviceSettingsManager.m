@interface AXAuditDeviceSettingsManager
- (AXAuditDeviceSettingsManager)init;
- (AXAuditDeviceSettingsManagerDelegate)delegate;
- (BOOL)deviceSettingsCanBeRestored;
- (NSArray)_cachedSettings;
- (NSArray)defaultSettings;
- (NSArray)settings;
- (id)settingForIdentifier:(id)a3;
- (int64_t)hostAPIVersion;
- (void)cacheDeviceSettingsValues;
- (void)dealloc;
- (void)resetToDefaultAccessibilitySettings;
- (void)restoreDeviceSettingsValues;
- (void)setDefaultSettings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSettingsCanBeRestored:(BOOL)a3;
- (void)setHostAPIVersion:(int64_t)a3;
- (void)setSettings:(id)a3;
- (void)set_cachedSettings:(id)a3;
- (void)startObservingChanges;
- (void)updateCurrentValueForAllSettingsAndPostNotificationIfChanged:(BOOL)a3;
- (void)updateSetting:(id)a3 withNumberValue:(id)a4;
@end

@implementation AXAuditDeviceSettingsManager

- (AXAuditDeviceSettingsManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAuditDeviceSettingsManager;
  v2 = [(AXAuditDeviceSettingsManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXAuditDeviceSettingsManager *)v2 updateCurrentValueForAllSettingsAndPostNotificationIfChanged:1];
  }
  return v3;
}

- (void)dealloc
{
  [(AXAuditDeviceSettingsManager *)self stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)AXAuditDeviceSettingsManager;
  [(AXAuditDeviceSettingsManager *)&v3 dealloc];
}

- (void)startObservingChanges
{
}

- (void)cacheDeviceSettingsValues
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AXAuditDeviceSettingsManager *)self settingsToCache];
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "copy", (void)v12);
        [(AXAuditDeviceSettingsManager *)self updateCurrentValueForSetting:v10 postNotificationIfChanged:0];
        v11 = (void *)[v10 copy];
        [v4 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(AXAuditDeviceSettingsManager *)self set_cachedSettings:v4];
}

- (void)restoreDeviceSettingsValues
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(AXAuditDeviceSettingsManager *)self deviceSettingsCanBeRestored])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v3 = [(AXAuditDeviceSettingsManager *)self _cachedSettings];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          uint64_t v9 = [v8 currentValueNumber];
          [(AXAuditDeviceSettingsManager *)self updateSetting:v8 withNumberValue:v9];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)updateCurrentValueForAllSettingsAndPostNotificationIfChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(AXAuditDeviceSettingsManager *)self settings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AXAuditDeviceSettingsManager *)self updateCurrentValueForSetting:*(void *)(*((void *)&v10 + 1) + 8 * v9++) postNotificationIfChanged:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)settingForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(AXAuditDeviceSettingsManager *)self settings];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 identifier];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)resetToDefaultAccessibilitySettings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(AXAuditDeviceSettingsManager *)self defaultSettings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [v8 currentValueNumber];
        [(AXAuditDeviceSettingsManager *)self updateSetting:v8 withNumberValue:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(AXAuditDeviceSettingsManager *)self cacheDeviceSettingsValues];
  [(AXAuditDeviceSettingsManager *)self updateCurrentValueForAllSettingsAndPostNotificationIfChanged:1];
}

- (void)updateSetting:(id)a3 withNumberValue:(id)a4
{
  if (![(AXAuditDeviceSettingsManager *)self deviceSettingsCanBeRestored]) {
    [(AXAuditDeviceSettingsManager *)self cacheDeviceSettingsValues];
  }

  [(AXAuditDeviceSettingsManager *)self setDeviceSettingsCanBeRestored:1];
}

- (AXAuditDeviceSettingsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAuditDeviceSettingsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)deviceSettingsCanBeRestored
{
  return self->_deviceSettingsCanBeRestored;
}

- (void)setDeviceSettingsCanBeRestored:(BOOL)a3
{
  self->_deviceSettingsCanBeRestored = a3;
}

- (int64_t)hostAPIVersion
{
  return self->_hostAPIVersion;
}

- (void)setHostAPIVersion:(int64_t)a3
{
  self->_hostAPIVersion = a3;
}

- (NSArray)_cachedSettings
{
  return self->__cachedSettings;
}

- (void)set_cachedSettings:(id)a3
{
}

- (NSArray)defaultSettings
{
  return self->_defaultSettings;
}

- (void)setDefaultSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSettings, 0);
  objc_storeStrong((id *)&self->__cachedSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end