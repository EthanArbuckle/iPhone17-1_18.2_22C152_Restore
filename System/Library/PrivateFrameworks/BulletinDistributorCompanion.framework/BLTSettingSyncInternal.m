@interface BLTSettingSyncInternal
- (BBObserver)observer;
- (BBSettingsGateway)settingsGateway;
- (BLTMuteSync)muteSync;
- (BLTRemoteGlobalSettingsSyncServer)remoteGlobalSettingsSyncServer;
- (BLTSectionConfiguration)sectionConfiguration;
- (BLTSettingSyncInternal)init;
- (BLTSettingSyncInternal)initWithSectionConfiguration:(id)a3 queue:(id)a4;
- (BLTSettingSyncServer)connection;
- (BLTSpokenSettingSync)spokenSettingSync;
- (BOOL)isWristDetectDisabled;
- (id)_overriddenSectionInfoForSectionID:(id)a3;
- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5;
- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 category:(id)a6 ignoresDowntime:(BOOL)a7 isCritical:(BOOL)a8;
- (void)connect;
- (void)dealloc;
- (void)disableStandaloneTestMode;
- (void)enableNotifications:(BOOL)a3 sectionID:(id)a4 mirror:(BOOL)a5;
- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)removeSectionWithSectionID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setMuteSync:(id)a3;
- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4;
- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4;
- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5;
- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6;
- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4;
- (void)setObserver:(id)a3;
- (void)setRemoteGlobalSettingsSyncServer:(id)a3;
- (void)setSectionInfo:(id)a3 completion:(id)a4;
- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5;
- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5;
- (void)setSettingsGateway:(id)a3;
- (void)setSpokenSettingSync:(id)a3;
- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4;
- (void)updateGlobalSettings:(id)a3;
@end

@implementation BLTSettingSyncInternal

- (BLTSettingSyncInternal)init
{
  return [(BLTSettingSyncInternal *)self initWithSectionConfiguration:0 queue:0];
}

- (BLTSettingSyncInternal)initWithSectionConfiguration:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BLTSettingSyncInternal;
  v9 = [(BLTSettingSyncInternal *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionConfiguration, a3);
    v11 = +[BLTSettingsGateway surrogateWithQueue:v8];
    [(BLTSettingSyncInternal *)v10 setSettingsGateway:v11];

    v12 = objc_alloc_init(BLTWristStateObserver);
    wristStateObserver = v10->_wristStateObserver;
    v10->_wristStateObserver = v12;

    v14 = +[BLTBBObserver surrogateWithQueue:v8 calloutQueue:v8];
    [(BLTSettingSyncInternal *)v10 setObserver:v14];

    v15 = [(BLTSettingSyncInternal *)v10 observer];
    [v15 setDelegate:v10];

    v16 = [(BLTSettingSyncInternal *)v10 observer];
    [v16 setObserverFeed:512];
  }
  return v10;
}

- (void)connect
{
  v3 = objc_alloc_init(BLTSettingSyncServer);
  [(BLTSettingSyncInternal *)self setConnection:v3];

  v4 = [(BLTSettingSyncInternal *)self connection];
  [v4 setDelegate:self];

  v5 = [BLTSpokenSettingSync alloc];
  v6 = [(BLTSettingSyncInternal *)self settingsGateway];
  id v7 = [(BLTSettingSyncInternal *)self connection];
  id v8 = [(BLTSpokenSettingSync *)v5 initWithSettingsGateway:v6 syncServer:v7];
  spokenSettingSync = self->_spokenSettingSync;
  self->_spokenSettingSync = v8;

  id v12 = [(BLTSettingSyncInternal *)self settingsGateway];
  v10 = [(BLTSettingSyncInternal *)self connection];
  v11 = +[BLTRemoteGlobalSettingsSyncServer remoteGlobalSettingsSyncServerWithLocalEndpoint:v12 remoteEndpoint:v10];
  [(BLTSettingSyncInternal *)self setRemoteGlobalSettingsSyncServer:v11];
}

- (void)dealloc
{
  v3 = [(BLTSettingSyncInternal *)self settingsGateway];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingSyncInternal;
  [(BLTSettingSyncInternal *)&v4 dealloc];
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setSectionInfo:completion:]", "BLTSettingSyncInternal.m", 114, "0");
}

- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __assert_rtn("-[BLTSettingSyncInternal setSectionInfo:keypaths:completion:]", "BLTSettingSyncInternal.m", 118, "0");
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:]", "BLTSettingSyncInternal.m", 122, "0");
}

- (void)removeSectionWithSectionID:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[BLTSettingSyncInternal removeSectionWithSectionID:]", "BLTSettingSyncInternal.m", 126, "0");
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6
{
  id v6 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsLevel:sectionID:mirror:fromRemote:]", "BLTSettingSyncInternal.m", 130, "0");
}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsGrouping:sectionID:]", "BLTSettingSyncInternal.m", 134, "0");
}

- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsSoundEnabled:sectionID:]", "BLTSettingSyncInternal.m", 138, "0");
}

- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsCriticalAlertEnabled:sectionID:]", "BLTSettingSyncInternal.m", 142, "0");
}

- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
}

- (void)enableNotifications:(BOOL)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(BLTSettingSyncInternal *)self setNotificationsLevel:v5 sectionID:a4 mirror:a5 fromRemote:0];
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  id v10 = [(BLTSettingSyncInternal *)self connection];
  [v10 enableStandaloneTestModeWithMinimumSendDelay:a3 maximumSendDelay:a4 minimumResponseDelay:a5 maximumResponseDelay:a6];
}

- (void)disableStandaloneTestMode
{
  id v2 = [(BLTSettingSyncInternal *)self connection];
  [v2 disableStandaloneTestMode];
}

- (id)_overriddenSectionInfoForSectionID:(id)a3
{
  return 0;
}

- (BOOL)isWristDetectDisabled
{
  return [(BLTWristStateObserver *)self->_wristStateObserver isWristDetectDisabled];
}

- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5
{
  return [(BLTSettingSyncInternal *)self willNanoPresentNotificationForSectionID:a3 subsectionIDs:a4 subtype:a5 category:0 ignoresDowntime:0 isCritical:0];
}

- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 category:(id)a6 ignoresDowntime:(BOOL)a7 isCritical:(BOOL)a8
{
  HIDWORD(v28) = a8;
  BOOL v8 = a7;
  id v13 = a3;
  id v14 = a6;
  id v15 = a4;
  v16 = [(BLTSettingSyncInternal *)self _overriddenSectionInfoForSectionID:v13];
  v17 = objc_alloc_init(BLTAlertStateTester);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __124__BLTSettingSyncInternal_willNanoPresentNotificationForSectionID_subsectionIDs_subtype_category_ignoresDowntime_isCritical___block_invoke;
  v29[3] = &unk_264684A80;
  v29[4] = self;
  [(BLTAlertStateTester *)v17 setSectionInfoRetriever:v29];
  objc_super v18 = [v16 factorySectionID];

  if (v18
    && (v19 = self->_sectionConfiguration,
        [v16 factorySectionID],
        BOOL v20 = v8,
        v21 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v19) = [(BLTSectionConfigurationInternal *)v19 applyAllowListToChildSections:v21], v21, BOOL v8 = v20, v19))
  {
    sectionConfiguration = self->_sectionConfiguration;
    v23 = [v16 factorySectionID];
    v24 = sectionConfiguration;
    BOOL v8 = v20;
    uint64_t v25 = [(BLTSectionConfigurationInternal *)v24 coordinationTypeForSectionID:v23 subtype:a5 category:v14];
  }
  else
  {
    uint64_t v25 = [(BLTSectionConfigurationInternal *)self->_sectionConfiguration coordinationTypeForSectionID:v13 subtype:a5 category:v14];
  }
  LOBYTE(v28) = BYTE4(v28);
  unint64_t v26 = [(BLTAlertStateTester *)v17 willNanoPresentNotificationForSectionInfo:v16 subsectionIDs:v15 isWristDetectDisabled:[(BLTSettingSyncInternal *)self isWristDetectDisabled] hasSectionIDOptedOutOfCoordination:v25 == 2 hasSectionIDOptedForwardOnly:v25 == 1 ignoresDowntime:v8 isCritical:v28];

  return v26;
}

uint64_t __124__BLTSettingSyncInternal_willNanoPresentNotificationForSectionID_subsectionIDs_subtype_category_ignoresDowntime_isCritical___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _overriddenSectionInfoForSectionID:a2];
}

- (void)updateGlobalSettings:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    BOOL v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ updateGlobalSettings: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(BLTSettingSyncInternal *)self remoteGlobalSettingsSyncServer];
  [v6 updateLocalSettingsWithProvider:v4];
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ observer: %@ globalSettings: %@", (uint8_t *)&v10, 0x20u);
  }

  -[BLTSpokenSettingSync bbUpdateLocalGlobalSpokenSettingEnabled:](self->_spokenSettingSync, "bbUpdateLocalGlobalSpokenSettingEnabled:", [v7 globalSpokenNotificationSetting]);
  __int16 v9 = [(BLTSettingSyncInternal *)self remoteGlobalSettingsSyncServer];
  [v9 observer:v6 updateGlobalSettings:v7];
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
}

- (BLTMuteSync)muteSync
{
  return self->_muteSync;
}

- (void)setMuteSync:(id)a3
{
}

- (BLTSettingSyncServer)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (BLTSpokenSettingSync)spokenSettingSync
{
  return self->_spokenSettingSync;
}

- (void)setSpokenSettingSync:(id)a3
{
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (BLTRemoteGlobalSettingsSyncServer)remoteGlobalSettingsSyncServer
{
  return self->_remoteGlobalSettingsSyncServer;
}

- (void)setRemoteGlobalSettingsSyncServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteGlobalSettingsSyncServer, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_spokenSettingSync, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_muteSync, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_wristStateObserver, 0);
}

@end