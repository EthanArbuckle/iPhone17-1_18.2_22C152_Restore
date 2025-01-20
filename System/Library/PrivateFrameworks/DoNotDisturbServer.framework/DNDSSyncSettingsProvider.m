@interface DNDSSyncSettingsProvider
- (BOOL)_isCloudSyncPreferenceEnabled;
- (BOOL)_lock_isCloudSyncPreferenceEnabled;
- (BOOL)_lock_isPairSyncPreferenceEnabled;
- (DNDSSyncSettings)syncSettings;
- (DNDSSyncSettingsProvider)init;
- (DNDSSyncSettingsProviderDelegate)delegate;
- (id)_lock_accessor;
- (void)_beginMonitoringForChanges;
- (void)_endMonitoringForChanges;
- (void)_lock_accessor;
- (void)_lock_setCompanionCloudSyncPreferenceEnabled:(BOOL)a3;
- (void)_lock_updateCompanionCloudSyncPreference;
- (void)_lock_updatePairSyncPreferences;
- (void)_lock_updateSyncSettingsIfNewSettingsDiffer:(id)a3;
- (void)_updateCloudSyncPreferences;
- (void)_updatePairSyncPreferences;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pairedDeviceDidChange;
- (void)setDelegate:(id)a3;
- (void)setPairSyncEnabled:(BOOL)a3;
- (void)setSyncSettings:(id)a3;
@end

@implementation DNDSSyncSettingsProvider

- (DNDSSyncSettingsProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSSyncSettingsProvider;
  v2 = [(DNDSSyncSettingsProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [[DNDSSyncSettings alloc] initWithPairSyncEnabled:1 cloudSyncEnabled:[(DNDSSyncSettingsProvider *)v2 _isCloudSyncPreferenceEnabled]];
    syncSettings = v3->_syncSettings;
    v3->_syncSettings = v4;

    [(DNDSSyncSettingsProvider *)v3 _beginMonitoringForChanges];
    [(DNDSSyncSettingsProvider *)v3 _updatePairSyncPreferences];
    [(DNDSSyncSettingsProvider *)v3 _updateCloudSyncPreferences];
  }
  return v3;
}

- (void)dealloc
{
  [(DNDSSyncSettingsProvider *)self _endMonitoringForChanges];
  v3.receiver = self;
  v3.super_class = (Class)DNDSSyncSettingsProvider;
  [(DNDSSyncSettingsProvider *)&v3 dealloc];
}

- (void)setPairSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [[DNDSSyncSettings alloc] initWithPairSyncEnabled:v3 cloudSyncEnabled:[(DNDSSyncSettingsProvider *)self _lock_isCloudSyncPreferenceEnabled]];
  objc_super v7 = [(DNDSSyncSettingsProvider *)self _lock_accessor];
  [v7 setBool:v3 forKey:@"mirrorDNDState"];
  id v8 = (id)[v7 synchronize];
  v9 = objc_opt_new();
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"mirrorDNDState"];
  [v9 synchronizeNanoDomain:@"com.apple.nano" keys:v10];

  char v16 = 0;
  int v11 = [v7 BOOLForKey:@"mirrorDNDState" keyExistsAndHasValidFormat:&v16];
  if (v16)
  {
    char v12 = v11;
    v13 = DNDSLogSettings;
    if (v11 == v3)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Set Focus mirroring preference.", v15, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
    {
      [(DNDSSyncSettingsProvider *)v13 setPairSyncEnabled:v3];
    }
  }
  else
  {
    v14 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT)) {
      -[DNDSSyncSettingsProvider setPairSyncEnabled:](v14, v3);
    }
  }
  [(DNDSSyncSettingsProvider *)self _lock_updateSyncSettingsIfNewSettingsDiffer:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)pairedDeviceDidChange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accessor = self->_accessor;
  self->_accessor = 0;

  [(DNDSSyncSettingsProvider *)self _lock_updatePairSyncPreferences];
  [(DNDSSyncSettingsProvider *)self _lock_updateCompanionCloudSyncPreference];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setCompanionCloudSyncPreferenceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v4 = [MEMORY[0x1E4F5F5C8] currentDevice];
  uint64_t v5 = [v4 deviceClass];

  if (v5 == 1)
  {
    v6 = [MEMORY[0x1E4F79EF0] sharedInstance];
    int v7 = [v6 isPaired];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v8 setBool:!v3 forKey:@"dndCompanionCloudSyncDisabled"];

      id v10 = (id)objc_opt_new();
      v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"dndCompanionCloudSyncDisabled"];
      [v10 synchronizeUserDefaultsDomain:@"com.apple.donotdisturbd" keys:v9];
    }
  }
}

- (void)_lock_updateCompanionCloudSyncPreference
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = [(DNDSSyncSettingsProvider *)self syncSettings];
  -[DNDSSyncSettingsProvider _lock_setCompanionCloudSyncPreferenceEnabled:](self, "_lock_setCompanionCloudSyncPreferenceEnabled:", [v3 isCloudSyncEnabled]);
}

- (BOOL)_isCloudSyncPreferenceEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(DNDSSyncSettingsProvider *)v2 _lock_isCloudSyncPreferenceEnabled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isCloudSyncPreferenceEnabled
{
  os_unfair_lock_assert_owner(&self->_lock);
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"disableCloudSync"];

  if (v3)
  {
    v4 = v2;
    uint64_t v5 = @"disableCloudSync";
  }
  else
  {
    v6 = [v2 objectForKey:@"disableSync"];

    if (v6) {
      uint64_t v5 = @"disableSync";
    }
    else {
      uint64_t v5 = @"disableModeConfigurationsSync";
    }
    v4 = v2;
  }
  char v7 = [v4 BOOLForKey:v5] ^ 1;

  return v7;
}

- (id)_lock_accessor
{
  os_unfair_lock_assert_owner(&self->_lock);
  accessor = self->_accessor;
  if (!accessor)
  {
    v4 = [MEMORY[0x1E4F5F5C8] currentDevice];
    if ([v4 deviceClass] == 1 || objc_msgSend(v4, "deviceClass") == 5)
    {
      uint64_t v5 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.nano"];
      v6 = self->_accessor;
      self->_accessor = v5;

      if (!self->_accessor)
      {
        char v7 = [MEMORY[0x1E4F79EF0] sharedInstance];
        int v8 = [v7 isPaired];

        if (v8)
        {
          v9 = DNDSLogSettings;
          if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT)) {
            -[DNDSSyncSettingsProvider _lock_accessor](v9);
          }
        }
      }
    }

    accessor = self->_accessor;
  }
  return accessor;
}

- (BOOL)_lock_isPairSyncPreferenceEnabled
{
  v2 = [(DNDSSyncSettingsProvider *)self _lock_accessor];
  id v3 = (id)[v2 synchronize];
  char v7 = 0;
  char v4 = [v2 BOOLForKey:@"mirrorDNDState" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_beginMonitoringForChanges
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 addObserver:self forKeyPath:@"disableCloudSync" options:1 context:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDMirrorStateChanged, @"MirrorDNDStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MirrorDNDStateChangedNotification", 0);
}

- (void)_updatePairSyncPreferences
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSSyncSettingsProvider *)self _lock_updatePairSyncPreferences];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updatePairSyncPreferences
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = [(DNDSSyncSettingsProvider *)self _lock_isPairSyncPreferenceEnabled];
  char v4 = [(DNDSSyncSettingsProvider *)self syncSettings];
  id v5 = (id)[v4 mutableCopy];

  [v5 setPairSyncEnabled:v3];
  [(DNDSSyncSettingsProvider *)self _lock_updateSyncSettingsIfNewSettingsDiffer:v5];
}

- (void)_updateCloudSyncPreferences
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(DNDSSyncSettingsProvider *)self _lock_isCloudSyncPreferenceEnabled];
  id v5 = [(DNDSSyncSettingsProvider *)self syncSettings];
  int v6 = [v5 isCloudSyncEnabled];

  if (v4 != v6) {
    [(DNDSSyncSettingsProvider *)self _lock_setCompanionCloudSyncPreferenceEnabled:v4];
  }
  char v7 = [(DNDSSyncSettingsProvider *)self syncSettings];
  id v8 = (id)[v7 mutableCopy];

  [v8 setCloudSyncEnabled:v4];
  [(DNDSSyncSettingsProvider *)self _lock_updateSyncSettingsIfNewSettingsDiffer:v8];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateSyncSettingsIfNewSettingsDiffer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(DNDSSyncSettingsProvider *)self syncSettings];
  if (![v5 isEqual:v4])
  {
    if (self->_initialized)
    {
      uint64_t v6 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v12 = 138412546;
        *(void *)&v12[4] = v4;
        *(_WORD *)&v12[12] = 2112;
        *(void *)&v12[14] = v5;
        char v7 = "New sync settings: %@. Old: %@";
        id v8 = v6;
        uint32_t v9 = 22;
LABEL_9:
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, v7, v12, v9);
      }
LABEL_10:
      -[DNDSSyncSettingsProvider setSyncSettings:](self, "setSyncSettings:", v4, *(_OWORD *)v12, *(void *)&v12[16], v13);
      int v11 = [(DNDSSyncSettingsProvider *)self delegate];
      [v11 syncSettingsProvider:self didReceiveUpdatedSyncSettings:v4];

      goto LABEL_11;
    }
LABEL_7:
    self->_initialized = 1;
    uint64_t v10 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v12 = 138412290;
      *(void *)&v12[4] = v4;
      char v7 = "Initialized sync settings to %@";
      id v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (!self->_initialized) {
    goto LABEL_7;
  }
LABEL_11:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"disableCloudSync", a4, a5, a6))
  {
    [(DNDSSyncSettingsProvider *)self _updateCloudSyncPreferences];
  }
}

- (DNDSSyncSettings)syncSettings
{
  return (DNDSSyncSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSyncSettings:(id)a3
{
}

- (DNDSSyncSettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSSyncSettingsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncSettings, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
}

- (void)setPairSyncEnabled:(void *)a1 .cold.1(void *a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithBool:a2 & 1];
  int v6 = 138412290;
  char v7 = v5;
  _os_log_fault_impl(&dword_1D3052000, v4, OS_LOG_TYPE_FAULT, "Failed to set Focus mirroring preference. Key does not exist or is invalid format. Expected %@.", (uint8_t *)&v6, 0xCu);
}

- (void)setPairSyncEnabled:(char)a3 .cold.2(void *a1, char a2, char a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = NSNumber;
  int v6 = a1;
  char v7 = [v5 numberWithBool:a2 & 1];
  uint64_t v8 = [NSNumber numberWithBool:a3 & 1];
  int v9 = 138412546;
  uint64_t v10 = v7;
  __int16 v11 = 2112;
  char v12 = v8;
  _os_log_fault_impl(&dword_1D3052000, v6, OS_LOG_TYPE_FAULT, "Failed to set Focus mirroring preference. Accessor returned %@. Expected %@.", (uint8_t *)&v9, 0x16u);
}

- (void)_lock_accessor
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D3052000, log, OS_LOG_TYPE_FAULT, "Failed to get NPS accessor on paired device.", v1, 2u);
}

@end