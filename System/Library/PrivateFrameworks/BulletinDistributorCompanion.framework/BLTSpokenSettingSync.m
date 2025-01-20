@interface BLTSpokenSettingSync
- (BBSettingsGateway)settingsGateway;
- (BLTSettingSyncServer)syncServer;
- (BLTSpokenSettingSync)initWithSettingsGateway:(id)a3 syncServer:(id)a4;
- (BOOL)_queue_isUpdatingLocalStateFromRemote;
- (BOOL)_queue_updateLocalGlobalSpokenSettingEnabledFromUser:(BOOL)a3;
- (BOOL)_queue_updateLocalSetting;
- (BOOL)localGlobalSpokenSettingEnabled;
- (BOOL)remoteGlobalSpokenSettingEnabled;
- (NSDate)localGlobalSpokenSettingDate;
- (NSDate)remoteGlobalSpokenSettingDate;
- (NSURL)remoteSettingStoreURL;
- (OS_dispatch_queue)queue;
- (id)_remoteSettingStoreURL;
- (unint64_t)updatingLocalStateFromRemoteCount;
- (void)_queue_readSettings;
- (void)_queue_resolveState;
- (void)_queue_setNewLocalStateFromRemote:(BOOL)a3;
- (void)_queue_setUpdatingLocalStateFromRemote;
- (void)_queue_synchronizeSettingsWithLocalEnabled:(BOOL)a3;
- (void)_queue_writeLocalSetting;
- (void)_queue_writeRemoteSetting;
- (void)bbUpdateLocalGlobalSpokenSettingEnabled:(int64_t)a3;
- (void)setLocalGlobalSpokenSettingDate:(id)a3;
- (void)setLocalGlobalSpokenSettingEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteGlobalSpokenSettingDate:(id)a3;
- (void)setRemoteGlobalSpokenSettingEnabled:(BOOL)a3;
- (void)setRemoteSettingStoreURL:(id)a3;
- (void)setSettingsGateway:(id)a3;
- (void)setSyncServer:(id)a3;
- (void)setUpdatingLocalStateFromRemoteCount:(unint64_t)a3;
- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4;
@end

@implementation BLTSpokenSettingSync

- (BLTSpokenSettingSync)initWithSettingsGateway:(id)a3 syncServer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BLTSpokenSettingSync;
  v9 = [(BLTSpokenSettingSync *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settingsGateway, a3);
    objc_storeStrong((id *)&v10->_syncServer, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.bulletindistributor.spokensettingsync", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = v10->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__BLTSpokenSettingSync_initWithSettingsGateway_syncServer___block_invoke;
    block[3] = &unk_264683BD8;
    v17 = v10;
    dispatch_async(v14, block);
  }
  return v10;
}

uint64_t __59__BLTSpokenSettingSync_initWithSettingsGateway_syncServer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_readSettings");
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_updateLocalSetting");
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_resolveState");
  }
  return result;
}

- (id)_remoteSettingStoreURL
{
  remoteSettingStoreURL = self->_remoteSettingStoreURL;
  if (!remoteSettingStoreURL)
  {
    BLTFileURLInPairingPathWait(@"spokensettingsync.plist");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_remoteSettingStoreURL;
    self->_remoteSettingStoreURL = v4;

    remoteSettingStoreURL = self->_remoteSettingStoreURL;
  }
  return remoteSettingStoreURL;
}

- (void)_queue_readSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
  self->_localGlobalSpokenSettingEnabled = CFPreferencesGetAppIntegerValue(@"BLTSpokenSettingLocalGlobalSettingEnabled", @"com.apple.bulletindistributor", 0) != 0;
  id v12 = (id)CFPreferencesCopyAppValue(@"BLTSpokenSettingLocalGlobalSettingDate", @"com.apple.bulletindistributor");
  if (v12)
  {
    v3 = (void *)MEMORY[0x263EFF910];
    [v12 doubleValue];
    objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    localGlobalSpokenSettingDate = self->_localGlobalSpokenSettingDate;
    self->_localGlobalSpokenSettingDate = v4;
  }
  v6 = NSDictionary;
  id v7 = [(BLTSpokenSettingSync *)self _remoteSettingStoreURL];
  id v8 = [v6 dictionaryWithContentsOfURL:v7];

  v9 = [v8 objectForKeyedSubscript:@"BLTSpokenSettingsSyncRemoteEnabled"];
  self->_remoteGlobalSpokenSettingEnabled = [v9 BOOLValue];

  v10 = [v8 objectForKeyedSubscript:@"BLTSpokenSettingsSyncRemoteDate"];
  remoteGlobalSpokenSettingDate = self->_remoteGlobalSpokenSettingDate;
  self->_remoteGlobalSpokenSettingDate = v10;
}

- (void)_queue_writeLocalSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFPreferencesSetAppValue(@"BLTSpokenSettingLocalGlobalSettingEnabled", (CFPropertyListRef)[NSNumber numberWithBool:self->_localGlobalSpokenSettingEnabled], @"com.apple.bulletindistributor");
  v3 = NSNumber;
  [(NSDate *)self->_localGlobalSpokenSettingDate timeIntervalSince1970];
  objc_msgSend(v3, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"BLTSpokenSettingLocalGlobalSettingDate", v4, @"com.apple.bulletindistributor");
  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
}

- (void)_queue_writeRemoteSetting
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error storing remote spoken settings.", v1, 2u);
}

- (BOOL)_queue_updateLocalSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [(BLTSpokenSettingSync *)self settingsGateway];
  uint64_t v4 = [v3 effectiveGlobalSpokenNotificationSetting];

  if (v4 == -1) {
    return 0;
  }
  return [(BLTSpokenSettingSync *)self _queue_updateLocalGlobalSpokenSettingEnabledFromUser:v4 == 2];
}

- (BOOL)_queue_isUpdatingLocalStateFromRemote
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t updatingLocalStateFromRemoteCount = self->_updatingLocalStateFromRemoteCount;
  if (updatingLocalStateFromRemoteCount) {
    self->_unint64_t updatingLocalStateFromRemoteCount = updatingLocalStateFromRemoteCount - 1;
  }
  return updatingLocalStateFromRemoteCount != 0;
}

- (void)_queue_setUpdatingLocalStateFromRemote
{
}

- (void)bbUpdateLocalGlobalSpokenSettingEnabled:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__BLTSpokenSettingSync_bbUpdateLocalGlobalSpokenSettingEnabled___block_invoke;
  v4[3] = &unk_2646840C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __64__BLTSpokenSettingSync_bbUpdateLocalGlobalSpokenSettingEnabled___block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_isUpdatingLocalStateFromRemote");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == -1)
  {
    id v7 = blt_settings_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Received updated global settings with spoken notification not supported", v8, 2u);
    }
  }
  else
  {
    int v4 = v2;
    v5 = *(void **)(a1 + 32);
    BOOL v6 = v3 == 2;
    if (v4)
    {
      objc_msgSend(v5, "_queue_synchronizeSettingsWithLocalEnabled:", v6);
    }
    else
    {
      objc_msgSend(v5, "_queue_updateLocalGlobalSpokenSettingEnabledFromUser:", v6);
    }
  }
}

- (BOOL)_queue_updateLocalGlobalSpokenSettingEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BLTSpokenSettingSync *)self localGlobalSpokenSettingEnabled] == v3
    && ([(BLTSpokenSettingSync *)self localGlobalSpokenSettingDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = blt_settings_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "Received local global spoken setting that is the same as the cached version: %{BOOL}u", (uint8_t *)v9, 8u);
    }

    return 0;
  }
  else
  {
    [(BLTSpokenSettingSync *)self setLocalGlobalSpokenSettingEnabled:v3];
    id v8 = [MEMORY[0x263EFF910] date];
    [(BLTSpokenSettingSync *)self setLocalGlobalSpokenSettingDate:v8];

    [(BLTSpokenSettingSync *)self _queue_writeLocalSetting];
    [(BLTSpokenSettingSync *)self _queue_resolveState];
    return 1;
  }
}

- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BLTSpokenSettingSync_transportUpdateRemoteGlobalSpokenSettingEnabled_date___block_invoke;
  block[3] = &unk_264684630;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __77__BLTSpokenSettingSync_transportUpdateRemoteGlobalSpokenSettingEnabled_date___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) remoteGlobalSpokenSettingEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 == v2)
  {
    int v4 = [*(id *)(a1 + 32) remoteGlobalSpokenSettingDate];
    uint64_t v5 = [v4 compare:*(void *)(a1 + 40)];

    if (v5 != -1)
    {
      id v6 = blt_settings_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 40);
        v10[0] = 67109378;
        v10[1] = v7;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "Received remote global spoken setting and dropping: %{BOOL}u date: %@", (uint8_t *)v10, 0x12u);
      }

      return;
    }
    int v3 = *(unsigned __int8 *)(a1 + 48);
  }
  [*(id *)(a1 + 32) setRemoteGlobalSpokenSettingEnabled:v3 != 0];
  [*(id *)(a1 + 32) setRemoteGlobalSpokenSettingDate:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_writeRemoteSetting");
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "_queue_resolveState");
}

- (void)_queue_resolveState
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Trying to resolve global spoken setting state with 2 unknown states!", v1, 2u);
}

- (void)_queue_setNewLocalStateFromRemote:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = blt_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Setting spoken settings on BulletinBoard to enabled: %{BOOL}u", (uint8_t *)v7, 8u);
  }

  [(BLTSpokenSettingSync *)self _queue_setUpdatingLocalStateFromRemote];
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [(BBSettingsGateway *)self->_settingsGateway setEffectiveGlobalSpokenNotificationSetting:v6];
}

- (void)_queue_synchronizeSettingsWithLocalEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = blt_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Synchronizing spoken settings with enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }

  uint64_t v6 = [(BLTSpokenSettingSync *)self localGlobalSpokenSettingDate];
  if (v6)
  {
    int v7 = [(BLTSpokenSettingSync *)self localGlobalSpokenSettingDate];
    [(BLTSpokenSettingSync *)self remoteGlobalSpokenSettingDate];
  }
  else
  {
    int v7 = [(BLTSpokenSettingSync *)self remoteGlobalSpokenSettingDate];
    [(BLTSpokenSettingSync *)self localGlobalSpokenSettingDate];
  uint64_t v8 = };
  v9 = [v7 laterDate:v8];

  [(BLTSpokenSettingSync *)self setLocalGlobalSpokenSettingDate:v9];
  [(BLTSpokenSettingSync *)self setRemoteGlobalSpokenSettingDate:v9];
  [(BLTSpokenSettingSync *)self setLocalGlobalSpokenSettingEnabled:v3];
  [(BLTSpokenSettingSync *)self setRemoteGlobalSpokenSettingEnabled:v3];
  [(BLTSpokenSettingSync *)self _queue_writeRemoteSetting];
  [(BLTSpokenSettingSync *)self _queue_writeLocalSetting];
  if ([MEMORY[0x263F57700] activePairedDeviceSupportsSpokenNotificationSettings])
  {
    id v10 = [(BLTSpokenSettingSync *)self syncServer];
    __int16 v11 = [(BLTSpokenSettingSync *)self localGlobalSpokenSettingDate];
    [v10 sendRemoteGlobalSpokenSettingEnabled:v3 date:v11];
  }
}

- (BOOL)localGlobalSpokenSettingEnabled
{
  return self->_localGlobalSpokenSettingEnabled;
}

- (void)setLocalGlobalSpokenSettingEnabled:(BOOL)a3
{
  self->_localGlobalSpokenSettingEnabled = a3;
}

- (BOOL)remoteGlobalSpokenSettingEnabled
{
  return self->_remoteGlobalSpokenSettingEnabled;
}

- (void)setRemoteGlobalSpokenSettingEnabled:(BOOL)a3
{
  self->_remoteGlobalSpokenSettingEnabled = a3;
}

- (NSDate)localGlobalSpokenSettingDate
{
  return self->_localGlobalSpokenSettingDate;
}

- (void)setLocalGlobalSpokenSettingDate:(id)a3
{
}

- (NSDate)remoteGlobalSpokenSettingDate
{
  return self->_remoteGlobalSpokenSettingDate;
}

- (void)setRemoteGlobalSpokenSettingDate:(id)a3
{
}

- (unint64_t)updatingLocalStateFromRemoteCount
{
  return self->_updatingLocalStateFromRemoteCount;
}

- (void)setUpdatingLocalStateFromRemoteCount:(unint64_t)a3
{
  self->_unint64_t updatingLocalStateFromRemoteCount = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
}

- (BLTSettingSyncServer)syncServer
{
  return self->_syncServer;
}

- (void)setSyncServer:(id)a3
{
}

- (NSURL)remoteSettingStoreURL
{
  return self->_remoteSettingStoreURL;
}

- (void)setRemoteSettingStoreURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSettingStoreURL, 0);
  objc_storeStrong((id *)&self->_syncServer, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteGlobalSpokenSettingDate, 0);
  objc_storeStrong((id *)&self->_localGlobalSpokenSettingDate, 0);
}

@end