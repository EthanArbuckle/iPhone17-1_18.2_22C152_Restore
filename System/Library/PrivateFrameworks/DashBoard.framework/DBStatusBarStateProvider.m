@interface DBStatusBarStateProvider
+ (BOOL)_showIndicatorForData:(id)a3;
+ (int64_t)_sensorIndicatorTypeForData:(id)a3;
- ($6C45178016D353444451090973A2A97F)_generateData;
- (BOOL)_isAnnounceNotificationsEnabledForSystemSettings;
- (BOOL)_radarItemEnabled;
- (BOOL)_radarItemVisible;
- (BOOL)hasSetupAnnounceNotification;
- (BOOL)hasSetupETC;
- (BOOL)hasSetupTTR;
- (BOOL)hasSetupTime;
- (BOOL)inCallServiceActive;
- (CRSSiriPreferences)siriPreferences;
- (DBEnvironment)environment;
- (DBStatusBarSensorIndicatorView)sensorIndicatorView;
- (DBStatusBarStateProvider)initWithEnvironment:(id)a3;
- (DNDStateService)dndStateService;
- (NSDateFormatter)timeItemDateFormatter;
- (NSHashTable)stateObservers;
- (NSNumber)etcStatus;
- (NSString)activeBundleIdentifier;
- (NSString)activeModeSymbolName;
- (NSString)cachedTimeString;
- (NSString)nowRecordingBundleIdentifier;
- (NSTimer)timeUpdateTimer;
- (STBatteryStatusDomain)batteryDomain;
- (STBatteryStatusDomainData)batteryData;
- (STCallingStatusDomain)callingDomain;
- (STCallingStatusDomainData)callingData;
- (STMediaStatusDomain)mediaDomain;
- (STMediaStatusDomainData)mediaData;
- (STTelephonyStatusDomain)telephonyDomain;
- (STTelephonyStatusDomainData)telephonyData;
- (STVoiceControlStatusDomain)voiceControlDomain;
- (STVoiceControlStatusDomainData)voiceControlDomainData;
- (STWifiStatusDomain)wifiDomain;
- (STWifiStatusDomainData)wifiData;
- (int)_statusBarNetworkTypeForSystemStatusNetworkType:(unint64_t)a3;
- (int64_t)cachedCarPlayAnnounceSetting;
- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3;
- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (void)_batteryDataUpdatedWithData:(id)a3;
- (void)_callingDataUpdatedWithData:(id)a3;
- (void)_etcChanged:(id)a3;
- (void)_fetchAnnounceNotificationsSetting;
- (void)_focusStatusUpdated:(id)a3;
- (void)_getAnnounceNotificationsData:(id *)a3;
- (void)_getBatteryData:(id *)a3;
- (void)_getETCData:(id *)a3;
- (void)_getFocusData:(id *)a3;
- (void)_getMediaData:(id *)a3;
- (void)_getTTRData:(id *)a3;
- (void)_getTelephonyData:(id *)a3;
- (void)_getTimeData:(id *)a3;
- (void)_getVoiceControlData:(id *)a3;
- (void)_localeChanged:(id)a3;
- (void)_mediaDataUpdatedWithData:(id)a3;
- (void)_resetTimeDateFormatter;
- (void)_resetTimeUpdateTimer;
- (void)_setSensorActivityIndicator;
- (void)_setupAnnounceNotificationsSetting;
- (void)_setupBatteryDomain;
- (void)_setupCallingDomain;
- (void)_setupDNDStateService;
- (void)_setupETC;
- (void)_setupMediaDomain;
- (void)_setupProviderIfNeededForDataType:(unint64_t)a3;
- (void)_setupTelephonyDomain;
- (void)_setupTime;
- (void)_setupVoiceControlDomain;
- (void)_setupWifiDomain;
- (void)_telephonyDataUpdatedWithData:(id)a3;
- (void)_timeZoneChanged:(id)a3;
- (void)_updateETCStateWithSession:(id)a3;
- (void)_voiceControlDataUpdatedWithData:(id)a3;
- (void)_wifiDataUpdatedWithData:(id)a3;
- (void)addStatusBarStateObserver:(id)a3;
- (void)getStatusBarData:(id *)a3;
- (void)invalidate;
- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4;
- (void)removeStatusBarStateObserver:(id)a3;
- (void)setActiveBundleIdentifier:(id)a3;
- (void)setActiveModeSymbolName:(id)a3;
- (void)setBatteryData:(id)a3;
- (void)setBatteryDomain:(id)a3;
- (void)setCachedCarPlayAnnounceSetting:(int64_t)a3;
- (void)setCachedTimeString:(id)a3;
- (void)setCallingData:(id)a3;
- (void)setCallingDomain:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setEtcStatus:(id)a3;
- (void)setHasSetupAnnounceNotification:(BOOL)a3;
- (void)setHasSetupETC:(BOOL)a3;
- (void)setHasSetupTTR:(BOOL)a3;
- (void)setHasSetupTime:(BOOL)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaDomain:(id)a3;
- (void)setNowRecordingBundleIdentifier:(id)a3;
- (void)setSensorIndicatorView:(id)a3;
- (void)setSiriPreferences:(id)a3;
- (void)setStateObservers:(id)a3;
- (void)setTelephonyData:(id)a3;
- (void)setTelephonyDomain:(id)a3;
- (void)setTimeItemDateFormatter:(id)a3;
- (void)setTimeUpdateTimer:(id)a3;
- (void)setVoiceControlDomain:(id)a3;
- (void)setVoiceControlDomainData:(id)a3;
- (void)setWifiData:(id)a3;
- (void)setWifiDomain:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)subscribeForDataType:(unint64_t)a3;
- (void)updateStatusBarData;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
@end

@implementation DBStatusBarStateProvider

- (DBStatusBarStateProvider)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBStatusBarStateProvider;
  v5 = [(DBStatusBarStateProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    stateObservers = v6->_stateObservers;
    v6->_stateObservers = (NSHashTable *)v7;
  }
  return v6;
}

- (void)_setSensorActivityIndicator
{
  v3 = [MEMORY[0x263F7C458] sensorActivityIndicator];

  if (!v3)
  {
    id v4 = objc_alloc_init(DBStatusBarSensorIndicatorView);
    -[DBStatusBarSensorIndicatorView setFrame:](v4, "setFrame:", 0.0, 0.0, 4.0, 4.0);
    sensorIndicatorView = self->_sensorIndicatorView;
    self->_sensorIndicatorView = v4;
    v6 = v4;

    [MEMORY[0x263F7C458] setSensorActivityIndicator:self->_sensorIndicatorView];
  }
}

- (void)_setupProviderIfNeededForDataType:(unint64_t)a3
{
  __int16 v3 = a3;
  if (a3)
  {
    [(DBStatusBarStateProvider *)self _setupTime];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [(DBStatusBarStateProvider *)self _setupWifiDomain];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [(DBStatusBarStateProvider *)self _setupTelephonyDomain];
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [(DBStatusBarStateProvider *)self _setupVoiceControlDomain];
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [(DBStatusBarStateProvider *)self _setupBatteryDomain];
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [(DBStatusBarStateProvider *)self _setupETC];
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [(DBStatusBarStateProvider *)self _setupDNDStateService];
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  [(DBStatusBarStateProvider *)self setHasSetupTTR:1];
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    [(DBStatusBarStateProvider *)self _setupCallingDomain];
    if ((v3 & 0x200) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  [(DBStatusBarStateProvider *)self _setSensorActivityIndicator];
  [(DBStatusBarStateProvider *)self _setupMediaDomain];
  if ((v3 & 0x100) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v3 & 0x200) == 0) {
    return;
  }
LABEL_23:
  [(DBStatusBarStateProvider *)self _setupAnnounceNotificationsSetting];
}

- (BOOL)inCallServiceActive
{
  __int16 v3 = [(DBStatusBarStateProvider *)self callingData];
  id v4 = [v3 activeCallAttributions];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(DBStatusBarStateProvider *)self callingData];
    uint64_t v7 = [v6 ringingCallAttributions];
    if ([v7 count])
    {
      BOOL v5 = 1;
    }
    else
    {
      v8 = [(DBStatusBarStateProvider *)self callingData];
      v9 = [v8 activeVideoConferenceAttributions];
      if ([v9 count])
      {
        BOOL v5 = 1;
      }
      else
      {
        objc_super v10 = [(DBStatusBarStateProvider *)self callingData];
        v11 = [v10 ringingVideoConferenceAttributions];
        BOOL v5 = [v11 count] != 0;
      }
    }
  }
  return v5;
}

- (void)setActiveBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_activeBundleIdentifier, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    activeBundleIdentifier = self->_activeBundleIdentifier;
    self->_activeBundleIdentifier = v4;

    [(DBStatusBarStateProvider *)self updateStatusBarData];
  }
}

- (void)setNowRecordingBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_nowRecordingBundleIdentifier, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    nowRecordingBundleIdentifier = self->_nowRecordingBundleIdentifier;
    self->_nowRecordingBundleIdentifier = v4;

    [(DBStatusBarStateProvider *)self updateStatusBarData];
  }
}

- (void)updateStatusBarData
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  NSUInteger v3 = [(NSHashTable *)self->_stateObservers count];
  DBLogForCategory(4uLL);
  id v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, &v4->super, OS_LOG_TYPE_DEFAULT, "Updating status bar state observers", buf, 2u);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    *(_OWORD *)buf = 0u;
    long long v16 = 0u;
    [(DBStatusBarStateProvider *)self _generateData];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_stateObservers;
    uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "statusBarStateProvider:didPostStatusBarData:withActions:", self, buf, 0, (void)v10);
        }
        uint64_t v7 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, &v4->super, OS_LOG_TYPE_DEFAULT, "No status bar state observers, skipping update", buf, 2u);
  }
}

- (void)subscribeForDataType:(unint64_t)a3
{
  [(DBStatusBarStateProvider *)self _setupProviderIfNeededForDataType:a3];
  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)addStatusBarStateObserver:(id)a3
{
}

- (void)removeStatusBarStateObserver:(id)a3
{
}

- (void)getStatusBarData:(id *)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [(DBStatusBarStateProvider *)self _generateData];
  memcpy(a3, v4, sizeof($6C45178016D353444451090973A2A97F));
}

- ($6C45178016D353444451090973A2A97F)_generateData
{
  bzero(retstr, 0xF28uLL);
  [(DBStatusBarStateProvider *)self _getTimeData:retstr];
  [(DBStatusBarStateProvider *)self _getTelephonyData:retstr];
  [(DBStatusBarStateProvider *)self _getBatteryData:retstr];
  [(DBStatusBarStateProvider *)self _getETCData:retstr];
  [(DBStatusBarStateProvider *)self _getFocusData:retstr];
  if ([(DBStatusBarStateProvider *)self hasSetupTTR]) {
    [(DBStatusBarStateProvider *)self _getTTRData:retstr];
  }
  [(DBStatusBarStateProvider *)self _getMediaData:retstr];
  [(DBStatusBarStateProvider *)self _getAnnounceNotificationsData:retstr];
  return ($6C45178016D353444451090973A2A97F *)[(DBStatusBarStateProvider *)self _getVoiceControlData:retstr];
}

- (void)_setupTime
{
  if (![(DBStatusBarStateProvider *)self hasSetupTime])
  {
    [(DBStatusBarStateProvider *)self setHasSetupTime:1];
    NSUInteger v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__timeZoneChanged_ name:*MEMORY[0x263EFF5D0] object:0];

    [(DBStatusBarStateProvider *)self _resetTimeDateFormatter];
    [(DBStatusBarStateProvider *)self _resetTimeUpdateTimer];
  }
}

- (void)_resetTimeDateFormatter
{
  NSUInteger v3 = (void *)MEMORY[0x263F29C30];
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v3 formatterForDateAsTimeNoAMPMWithLocale:v5];
  [(DBStatusBarStateProvider *)self setTimeItemDateFormatter:v4];
}

- (void)_resetTimeUpdateTimer
{
  v1 = [a1 cachedTimeString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Cached time string is empty or nil: %@", v4, v5, v6, v7, v8);
}

- (void)_getTimeData:(id *)a3
{
  a3->var0[0] = 1;
  var2 = a3->var2;
  uint64_t v5 = [(DBStatusBarStateProvider *)self cachedTimeString];
  char v6 = [v5 getCString:var2 maxLength:64 encoding:4];

  if (v6)
  {
    if (*var2) {
      return;
    }
    uint64_t v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBStatusBarStateProvider _getTimeData:](self);
    }
  }
  else
  {
    uint64_t v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DBStatusBarStateProvider _getTimeData:](self);
    }
  }
}

- (void)_setupVoiceControlDomain
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [(DBStatusBarStateProvider *)self voiceControlDomain];

    if (!v3)
    {
      objc_initWeak(&location, self);
      uint64_t v4 = (STVoiceControlStatusDomain *)objc_alloc_init(MEMORY[0x263F7C308]);
      voiceControlDomain = self->_voiceControlDomain;
      self->_voiceControlDomain = v4;

      char v6 = self->_voiceControlDomain;
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      long long v10 = __52__DBStatusBarStateProvider__setupVoiceControlDomain__block_invoke;
      long long v11 = &unk_2649B3D58;
      objc_copyWeak(&v12, &location);
      [(STVoiceControlStatusDomain *)v6 observeDataWithBlock:&v8];
      uint64_t v7 = [(STVoiceControlStatusDomain *)self->_voiceControlDomain data];
      [(DBStatusBarStateProvider *)self _voiceControlDataUpdatedWithData:v7];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __52__DBStatusBarStateProvider__setupVoiceControlDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__DBStatusBarStateProvider__setupVoiceControlDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __52__DBStatusBarStateProvider__setupVoiceControlDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _voiceControlDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_getVoiceControlData:(id *)a3
{
  if ([(STVoiceControlStatusDomainData *)self->_voiceControlDomainData isVoiceControlActive]&& _AXSCommandAndControlCarPlayEnabled())
  {
    a3->var0[41] = 1;
    uint64_t v5 = [(STVoiceControlStatusDomainData *)self->_voiceControlDomainData listeningState];
    char v6 = (v5 == 2) << 6;
    if (v5 == 1) {
      char v6 = 32;
    }
    *((unsigned char *)a3 + 2529) = v6 | *((unsigned char *)a3 + 2529) & 0x9F;
  }
  else
  {
    a3->var0[41] = 0;
  }
}

- (void)_voiceControlDataUpdatedWithData:(id)a3
{
  [(DBStatusBarStateProvider *)self setVoiceControlDomainData:a3];
  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)_setupWifiDomain
{
  id v3 = [(DBStatusBarStateProvider *)self wifiDomain];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (STWifiStatusDomain *)objc_alloc_init(MEMORY[0x263F7C318]);
    wifiDomain = self->_wifiDomain;
    self->_wifiDomain = v4;

    char v6 = self->_wifiDomain;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    long long v10 = __44__DBStatusBarStateProvider__setupWifiDomain__block_invoke;
    long long v11 = &unk_2649B3D80;
    objc_copyWeak(&v12, &location);
    [(STWifiStatusDomain *)v6 observeDataWithBlock:&v8];
    id v7 = [(STWifiStatusDomain *)self->_wifiDomain data];
    [(DBStatusBarStateProvider *)self _wifiDataUpdatedWithData:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __44__DBStatusBarStateProvider__setupWifiDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DBStatusBarStateProvider__setupWifiDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __44__DBStatusBarStateProvider__setupWifiDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wifiDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_wifiDataUpdatedWithData:(id)a3
{
  [(DBStatusBarStateProvider *)self setWifiData:a3];
  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)_setupTelephonyDomain
{
  id v3 = [(DBStatusBarStateProvider *)self telephonyDomain];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (STTelephonyStatusDomain *)objc_alloc_init(MEMORY[0x263F7C300]);
    telephonyDomain = self->_telephonyDomain;
    self->_telephonyDomain = v4;

    char v6 = self->_telephonyDomain;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    long long v10 = __49__DBStatusBarStateProvider__setupTelephonyDomain__block_invoke;
    long long v11 = &unk_2649B3DA8;
    objc_copyWeak(&v12, &location);
    [(STTelephonyStatusDomain *)v6 observeDataWithBlock:&v8];
    id v7 = [(STTelephonyStatusDomain *)self->_telephonyDomain data];
    [(DBStatusBarStateProvider *)self _telephonyDataUpdatedWithData:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __49__DBStatusBarStateProvider__setupTelephonyDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DBStatusBarStateProvider__setupTelephonyDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __49__DBStatusBarStateProvider__setupTelephonyDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telephonyDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_telephonyDataUpdatedWithData:(id)a3
{
  [(DBStatusBarStateProvider *)self setTelephonyData:a3];
  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)_getTelephonyData:(id *)a3
{
  id v5 = [(DBStatusBarStateProvider *)self telephonyData];
  id v20 = [v5 primarySIMInfo];

  uint64_t v6 = [v20 serviceState];
  if (v6 == 2)
  {
    a3->var6 = [v20 signalStrengthBars];
    if ([v20 dataNetworkType])
    {
      a3->var0[9] = 1;
      a3->var21 = -[DBStatusBarStateProvider _statusBarNetworkTypeForSystemStatusNetworkType:](self, "_statusBarNetworkTypeForSystemStatusNetworkType:", [v20 dataNetworkType]);
    }
    else
    {
      a3->var0[9] = 0;
    }
    a3->var0[6] = 1;
    a3->var0[4] = 1;
  }
  else
  {
    if (v6 == 1) {
      a3->var14 = 5;
    }
    else {
      a3->var14 = 1;
    }
    a3->var0[4] = 1;
    a3->var0[6] = 1;
  }
  id v7 = [(DBStatusBarStateProvider *)self telephonyData];
  int v8 = [v7 isDualSIMEnabled];

  if (v8)
  {
    uint64_t v9 = [(DBStatusBarStateProvider *)self telephonyData];
    long long v10 = [v9 secondarySIMInfo];

    if (v10)
    {
      *((unsigned char *)a3 + 3160) |= 4u;
      a3->var0[5] = 1;
      a3->var0[7] = 1;
      uint64_t v11 = [v10 serviceState];
      switch(v11)
      {
        case 2:
          a3->var7 = [v10 signalStrengthBars];
          if ([v10 dataNetworkType])
          {
            a3->var0[10] = 1;
            a3->var22 = -[DBStatusBarStateProvider _statusBarNetworkTypeForSystemStatusNetworkType:](self, "_statusBarNetworkTypeForSystemStatusNetworkType:", [v10 dataNetworkType]);
          }
          break;
        case 1:
          unsigned int v12 = 5;
          goto LABEL_19;
        case 0:
          unsigned int v12 = 1;
LABEL_19:
          a3->var15 = v12;
          break;
      }
    }
  }
  uint64_t v13 = [(DBStatusBarStateProvider *)self wifiData];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(DBStatusBarStateProvider *)self wifiData];
    int v16 = [v15 isWifiActive];

    if (v16)
    {
      long long v17 = [(DBStatusBarStateProvider *)self wifiData];
      a3->var19 = [v17 signalStrengthBars];

      a3->var0[9] = 1;
      long long v18 = [(DBStatusBarStateProvider *)self wifiData];
      LODWORD(v17) = [v18 isAssociatedToIOSHotspot];

      if (v17) {
        unsigned int v19 = 6;
      }
      else {
        unsigned int v19 = 5;
      }
      a3->var21 = v19;
    }
  }
}

- (int)_statusBarNetworkTypeForSystemStatusNetworkType:(unint64_t)a3
{
  if (a3 - 2 > 0xC) {
    return 7;
  }
  else {
    return dword_22D86EBD8[a3 - 2];
  }
}

- (void)_setupBatteryDomain
{
  id v3 = [(DBStatusBarStateProvider *)self batteryDomain];

  if (!v3)
  {
    uint64_t v4 = [(DBStatusBarStateProvider *)self environment];
    id v5 = [v4 environmentConfiguration];
    int v6 = [v5 isConnectedWirelessly];

    if (v6)
    {
      objc_initWeak(&location, self);
      id v7 = (STBatteryStatusDomain *)objc_alloc_init(MEMORY[0x263F7C2B8]);
      batteryDomain = self->_batteryDomain;
      self->_batteryDomain = v7;

      uint64_t v9 = self->_batteryDomain;
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __47__DBStatusBarStateProvider__setupBatteryDomain__block_invoke;
      v14 = &unk_2649B3DD0;
      objc_copyWeak(&v15, &location);
      [(STBatteryStatusDomain *)v9 observeDataWithBlock:&v11];
      long long v10 = [(STBatteryStatusDomain *)self->_batteryDomain data];
      [(DBStatusBarStateProvider *)self _batteryDataUpdatedWithData:v10];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __47__DBStatusBarStateProvider__setupBatteryDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DBStatusBarStateProvider__setupBatteryDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __47__DBStatusBarStateProvider__setupBatteryDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _batteryDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_batteryDataUpdatedWithData:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DBStatusBarStateProvider *)self setBatteryData:v4];
  id v5 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Battery data updated: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)_getBatteryData:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [(DBStatusBarStateProvider *)self batteryData];

  if (v5)
  {
    a3->var0[12] = 1;
    int v6 = [(DBStatusBarStateProvider *)self batteryData];
    a3->unsigned int var24 = [v6 chargingState];

    id v7 = [(DBStatusBarStateProvider *)self batteryData];
    a3->int var23 = [v7 percentCharge];

    uint64_t v8 = [(DBStatusBarStateProvider *)self batteryData];
    *((unsigned char *)a3 + 2536) = *((unsigned char *)a3 + 2536) & 0xFE | [v8 isBatterySaverModeActive];

    uint64_t v9 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int var24 = a3->var24;
      int var23 = a3->var23;
      int v12 = *((unsigned char *)a3 + 2536) & 1;
      v13[0] = 67240704;
      v13[1] = var24;
      __int16 v14 = 1026;
      int v15 = var23;
      __int16 v16 = 1026;
      int v17 = v12;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Setting status bar battery data enabled, state: %{public}u, capacity: %{public}d, low power mode active: %{public}d", (uint8_t *)v13, 0x14u);
    }
  }
  else
  {
    a3->var0[12] = 0;
  }
}

- (void)_setupETC
{
  if (![(DBStatusBarStateProvider *)self hasSetupETC])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F30D98];
    id v5 = [(DBStatusBarStateProvider *)self environment];
    int v6 = [v5 environmentConfiguration];
    id v7 = [v6 session];
    [v3 addObserver:self selector:sel__etcChanged_ name:v4 object:v7];

    id v10 = [(DBStatusBarStateProvider *)self environment];
    uint64_t v8 = [v10 environmentConfiguration];
    uint64_t v9 = [v8 session];
    [(DBStatusBarStateProvider *)self _updateETCStateWithSession:v9];
  }
}

- (void)_etcChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__DBStatusBarStateProvider__etcChanged___block_invoke;
  v6[3] = &unk_2649B3D30;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __40__DBStatusBarStateProvider__etcChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [*(id *)(a1 + 40) _updateETCStateWithSession:v2];
}

- (void)_updateETCStateWithSession:(id)a3
{
  id v4 = [a3 electronicTollCollectionAvailable];
  [(DBStatusBarStateProvider *)self setEtcStatus:v4];

  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)_getETCData:(id *)a3
{
  id v5 = [(DBStatusBarStateProvider *)self etcStatus];

  if (v5)
  {
    a3->var0[35] = 1;
    id v6 = [(DBStatusBarStateProvider *)self etcStatus];
    *((unsigned char *)a3 + 3149) = *((unsigned char *)a3 + 3149) & 0xFE | [v6 BOOLValue];
  }
  else
  {
    a3->var0[35] = 0;
  }
}

- (void)_setupDNDStateService
{
  id v3 = [(DBStatusBarStateProvider *)self dndStateService];

  if (!v3)
  {
    id v4 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:@"com.apple.carplayapp"];
    dndStateService = self->_dndStateService;
    self->_dndStateService = v4;

    [(DNDStateService *)self->_dndStateService addStateUpdateListener:self withCompletionHandler:&__block_literal_global_0];
    id v6 = self->_dndStateService;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_118;
    v7[3] = &unk_2649B3E18;
    v7[4] = self;
    [(DNDStateService *)v6 queryCurrentStateWithCompletionHandler:v7];
  }
}

void __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_cold_1();
    }
  }
}

void __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_118(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_118_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _focusStatusUpdated:a2];
  }
}

- (void)_focusStatusUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__DBStatusBarStateProvider__focusStatusUpdated___block_invoke;
  v6[3] = &unk_2649B3D30;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __48__DBStatusBarStateProvider__focusStatusUpdated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 activeModeConfiguration];
    id v4 = [v3 mode];

    id v5 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Received updated focus state %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [v4 symbolImageName];
    [*(id *)(a1 + 40) setActiveModeSymbolName:v6];
  }
  else
  {
    id v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Received updated focus with no active mode.", (uint8_t *)&v9, 2u);
    }

    [*(id *)(a1 + 40) setActiveModeSymbolName:0];
  }
  return [*(id *)(a1 + 40) updateStatusBarData];
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  objc_msgSend(a4, "state", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(DBStatusBarStateProvider *)self _focusStatusUpdated:v5];
}

- (void)_getFocusData:(id *)a3
{
  id v5 = [(DBStatusBarStateProvider *)self activeModeSymbolName];
  uint64_t v6 = [v5 length];

  a3->var0[2] = v6 != 0;
  *((unsigned char *)a3 + 2529) = *((unsigned char *)a3 + 2529) & 0x7F | ((v6 == 0) << 7);
  if (v6)
  {
    id v7 = [(DBStatusBarStateProvider *)self activeModeSymbolName];
    [v7 cStringUsingEncoding:4];
    __strcpy_chk();
  }
}

- (BOOL)_radarItemVisible
{
  if (DBIsInternalInstall_onceToken != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken, &__block_literal_global_472);
  }
  if (!DBIsInternalInstall_isInternal) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CARStatusBarRadarButtonEnabled", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (BOOL)_radarItemEnabled
{
  if (DBIsInternalInstall_onceToken != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken, &__block_literal_global_472);
  }
  if (DBIsInternalInstall_isInternal)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CARStatusBarRadarButtonEnabled", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v3 = AppBooleanValue == 0;
    }
    else {
      BOOL v3 = 0;
    }
  }
  else
  {
    Boolean v7 = 0;
    int v4 = CFPreferencesGetAppBooleanValue(@"UIStatusBarRadarTimeItemEnabled", @"com.apple.UIKit", &v7);
    if (v7) {
      BOOL v3 = v4 == 0;
    }
    else {
      BOOL v3 = 1;
    }
  }
  return !v3;
}

- (void)_getTTRData:(id *)a3
{
  BOOL v5 = [(DBStatusBarStateProvider *)self _radarItemEnabled];
  a3->var0[34] = v5;
  if (v5)
  {
    if ([(DBStatusBarStateProvider *)self _radarItemVisible]) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  *((unsigned char *)a3 + 3149) = *((unsigned char *)a3 + 3149) & 0xFD | v6;
}

- (void)_setupMediaDomain
{
  BOOL v3 = [(DBStatusBarStateProvider *)self mediaDomain];

  if (!v3)
  {
    objc_initWeak(&location, self);
    int v4 = (STMediaStatusDomain *)objc_alloc_init(MEMORY[0x263F7C2C8]);
    mediaDomain = self->_mediaDomain;
    self->_mediaDomain = v4;

    char v6 = self->_mediaDomain;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __45__DBStatusBarStateProvider__setupMediaDomain__block_invoke;
    uint64_t v11 = &unk_2649B3E40;
    objc_copyWeak(&v12, &location);
    [(STMediaStatusDomain *)v6 observeDataWithBlock:&v8];
    Boolean v7 = [(STMediaStatusDomain *)self->_mediaDomain data];
    [(DBStatusBarStateProvider *)self _mediaDataUpdatedWithData:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __45__DBStatusBarStateProvider__setupMediaDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__DBStatusBarStateProvider__setupMediaDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  void v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __45__DBStatusBarStateProvider__setupMediaDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mediaDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_mediaDataUpdatedWithData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke;
  v6[3] = &unk_2649B3D30;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setMediaData:*(void *)(a1 + 40)];
  id v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) mediaData];
  uint64_t v4 = [v2 _sensorIndicatorTypeForData:v3];

  id v5 = [*(id *)(a1 + 32) sensorIndicatorView];
  [v5 setSensorIndicatorType:v4];

  char v6 = [*(id *)(a1 + 40) audioRecordingAttributionList];
  id v7 = [v6 firstObject];

  if (v7)
  {
    uint64_t v8 = [v7 attributedEntity];
    uint64_t v9 = [v8 bundleIdentifier];

    if (!v9)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      id v10 = DBLogForCategory(4uLL);
      BOOL v18 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (has_internal_diagnostics)
      {
        if (v18) {
          __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_1(v7);
        }
      }
      else if (v18)
      {
        __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_2(v10);
      }
      __int16 v14 = 0;
      goto LABEL_20;
    }
    id v10 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:v9];
    uint64_t v11 = [MEMORY[0x263F64570] handleForPredicate:v10 error:0];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 identity];
      __int16 v14 = [v13 embeddedApplicationIdentifier];

      int v15 = DBLogForCategory(4uLL);
      __int16 v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543362;
          id v20 = v14;
          _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Now recording bundle identifier updated to %{public}@.", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_19;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_4();
      }
    }
    else
    {
      __int16 v16 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_3();
      }
    }
    __int16 v14 = 0;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  __int16 v14 = 0;
LABEL_21:
  [*(id *)(a1 + 32) setNowRecordingBundleIdentifier:v14];
  [*(id *)(a1 + 32) updateStatusBarData];
}

- (void)_getMediaData:(id *)a3
{
  id v5 = [(DBStatusBarStateProvider *)self mediaData];

  if (v5)
  {
    char v6 = objc_opt_class();
    id v7 = [(DBStatusBarStateProvider *)self mediaData];
    char v8 = [v6 _showIndicatorForData:v7];
  }
  else
  {
    char v8 = 0;
  }
  a3->var0[28] = v8;
}

+ (BOOL)_showIndicatorForData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 audioRecordingAttributions];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    char v6 = [v3 cameraCaptureAttributions];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

+ (int64_t)_sensorIndicatorTypeForData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 cameraCaptureAttributions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    int64_t v6 = 2;
  }
  else
  {
    id v7 = [v3 audioRecordingAttributions];
    int64_t v6 = [v7 count] != 0;
  }
  return v6;
}

- (void)_setupCallingDomain
{
  id v3 = [(DBStatusBarStateProvider *)self callingDomain];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (STCallingStatusDomain *)objc_alloc_init(MEMORY[0x263F7C2C0]);
    callingDomain = self->_callingDomain;
    self->_callingDomain = v4;

    int64_t v6 = self->_callingDomain;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __47__DBStatusBarStateProvider__setupCallingDomain__block_invoke;
    uint64_t v11 = &unk_2649B3E68;
    objc_copyWeak(&v12, &location);
    [(STCallingStatusDomain *)v6 observeDataWithBlock:&v8];
    id v7 = [(STCallingStatusDomain *)self->_callingDomain data];
    [(DBStatusBarStateProvider *)self _callingDataUpdatedWithData:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __47__DBStatusBarStateProvider__setupCallingDomain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DBStatusBarStateProvider__setupCallingDomain__block_invoke_2;
  v6[3] = &unk_2649B3D30;
  void v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __47__DBStatusBarStateProvider__setupCallingDomain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callingDataUpdatedWithData:*(void *)(a1 + 40)];
}

- (void)_callingDataUpdatedWithData:(id)a3
{
  [(DBStatusBarStateProvider *)self setCallingData:a3];
  [(DBStatusBarStateProvider *)self updateStatusBarData];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__DBStatusBarStateProvider_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke;
  v7[3] = &unk_2649B3D30;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __95__DBStatusBarStateProvider_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke(uint64_t a1)
{
  id v2 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Announce status changed, updating announce", v4, 2u);
  }

  *(void *)(*(void *)(a1 + 32) + 208) = [*(id *)(a1 + 40) announcementCarPlaySetting];
  return [*(id *)(a1 + 32) updateStatusBarData];
}

- (BOOL)_isAnnounceNotificationsEnabledForSystemSettings
{
  int64_t cachedCarPlayAnnounceSetting = self->_cachedCarPlayAnnounceSetting;
  if ((unint64_t)(cachedCarPlayAnnounceSetting - 2) < 2) {
    return 1;
  }
  if (cachedCarPlayAnnounceSetting == -99)
  {
    uint64_t v4 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "No available announce status!", v5, 2u);
    }
  }
  return 0;
}

- (void)_fetchAnnounceNotificationsSetting
{
  id v4 = [MEMORY[0x263F84580] currentNotificationSettingsCenter];
  id v3 = [v4 notificationSystemSettings];
  self->_int64_t cachedCarPlayAnnounceSetting = [v3 announcementCarPlaySetting];
}

- (void)_setupAnnounceNotificationsSetting
{
  if (![(DBStatusBarStateProvider *)self hasSetupAnnounceNotification])
  {
    id v3 = +[DBNotificationSettingsCenter defaultCenter];
    [v3 addObserver:self];

    id v4 = (CRSSiriPreferences *)objc_alloc_init(MEMORY[0x263F312F8]);
    siriPreferences = self->_siriPreferences;
    self->_siriPreferences = v4;

    [(CRSSiriPreferences *)self->_siriPreferences addObserver:self];
    self->_int64_t cachedCarPlayAnnounceSetting = -99;
    id v6 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__DBStatusBarStateProvider__setupAnnounceNotificationsSetting__block_invoke;
    block[3] = &unk_2649B3E90;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

void __62__DBStatusBarStateProvider__setupAnnounceNotificationsSetting__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchAnnounceNotificationsSetting];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__DBStatusBarStateProvider__setupAnnounceNotificationsSetting__block_invoke_2;
  block[3] = &unk_2649B3E90;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__DBStatusBarStateProvider__setupAnnounceNotificationsSetting__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStatusBarData];
}

- (void)_getAnnounceNotificationsData:(id *)a3
{
  if ([(DBStatusBarStateProvider *)self _isAnnounceNotificationsEnabledForSystemSettings])
  {
    id v5 = [(DBStatusBarStateProvider *)self siriPreferences];
    int v6 = [v5 announceNotificationsInCarPlayTemporarilyDisabled];
    char v7 = v6 ^ 1;

    if (v6) {
      char v8 = 0;
    }
    else {
      char v8 = 4;
    }
  }
  else
  {
    char v7 = 0;
    char v8 = 0;
  }
  a3->var0[38] = v7;
  *((unsigned char *)a3 + 3149) = *((unsigned char *)a3 + 3149) & 0xFB | v8;
}

- (void)invalidate
{
  id v3 = [(DBStatusBarStateProvider *)self timeUpdateTimer];
  [v3 invalidate];

  id v4 = [(DBStatusBarStateProvider *)self telephonyDomain];
  [v4 invalidate];

  id v5 = [(DBStatusBarStateProvider *)self batteryDomain];
  [v5 invalidate];

  int v6 = [(DBStatusBarStateProvider *)self wifiDomain];
  [v6 invalidate];

  char v7 = [(DBStatusBarStateProvider *)self mediaDomain];
  [v7 invalidate];

  char v8 = [(DBStatusBarStateProvider *)self callingDomain];
  [v8 invalidate];

  id v9 = [(DBStatusBarStateProvider *)self voiceControlDomain];
  [v9 invalidate];
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  return a4;
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  if ([(DBStatusBarStateProvider *)self inCallServiceActive])
  {
    int v6 = [(DBStatusBarStateProvider *)self activeBundleIdentifier];
    char v7 = [v6 isEqualToString:@"com.apple.InCallService"];

    return (v7 & 1) == 0;
  }
  uint64_t v9 = [(DBStatusBarStateProvider *)self nowRecordingBundleIdentifier];
  if (!v9) {
    return 0;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(DBStatusBarStateProvider *)self activeBundleIdentifier];
  id v12 = [(DBStatusBarStateProvider *)self nowRecordingBundleIdentifier];
  int v13 = [v11 isEqualToString:v12];

  if (v13) {
    return 0;
  }
  return 4;
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  return a3;
}

- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  objc_msgSend(a5, "activeBundleIdentifier", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(DBStatusBarStateProvider *)self setActiveBundleIdentifier:v6];
}

- (void)_localeChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DBStatusBarStateProvider__localeChanged___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __43__DBStatusBarStateProvider__localeChanged___block_invoke(uint64_t a1)
{
  id v2 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Locale changed, resetting date formatter", v4, 2u);
  }

  [*(id *)(a1 + 32) _resetTimeDateFormatter];
  return [*(id *)(a1 + 32) _resetTimeUpdateTimer];
}

- (void)_timeZoneChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__DBStatusBarStateProvider__timeZoneChanged___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__DBStatusBarStateProvider__timeZoneChanged___block_invoke(uint64_t a1)
{
  id v2 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Time zone changed, updating time", v4, 2u);
  }

  return [*(id *)(a1 + 32) _resetTimeUpdateTimer];
}

- (void)preferences:(id)a3 announceNotificationsInCarPlayTemporarilyDisabledChanged:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__DBStatusBarStateProvider_preferences_announceNotificationsInCarPlayTemporarilyDisabledChanged___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __97__DBStatusBarStateProvider_preferences_announceNotificationsInCarPlayTemporarilyDisabledChanged___block_invoke(uint64_t a1)
{
  id v2 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "Announce status changed, updating announce", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateStatusBarData];
}

- (DBStatusBarSensorIndicatorView)sensorIndicatorView
{
  return self->_sensorIndicatorView;
}

- (void)setSensorIndicatorView:(id)a3
{
}

- (NSString)nowRecordingBundleIdentifier
{
  return self->_nowRecordingBundleIdentifier;
}

- (NSTimer)timeUpdateTimer
{
  return self->_timeUpdateTimer;
}

- (void)setTimeUpdateTimer:(id)a3
{
}

- (BOOL)hasSetupTime
{
  return self->_hasSetupTime;
}

- (void)setHasSetupTime:(BOOL)a3
{
  self->_hasSetupTime = a3;
}

- (NSHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (NSNumber)etcStatus
{
  return self->_etcStatus;
}

- (void)setEtcStatus:(id)a3
{
}

- (BOOL)hasSetupETC
{
  return self->_hasSetupETC;
}

- (void)setHasSetupETC:(BOOL)a3
{
  self->_hasSetupETC = a3;
}

- (NSString)activeBundleIdentifier
{
  return self->_activeBundleIdentifier;
}

- (STTelephonyStatusDomain)telephonyDomain
{
  return self->_telephonyDomain;
}

- (void)setTelephonyDomain:(id)a3
{
}

- (STTelephonyStatusDomainData)telephonyData
{
  return self->_telephonyData;
}

- (void)setTelephonyData:(id)a3
{
}

- (STBatteryStatusDomain)batteryDomain
{
  return self->_batteryDomain;
}

- (void)setBatteryDomain:(id)a3
{
}

- (STBatteryStatusDomainData)batteryData
{
  return self->_batteryData;
}

- (void)setBatteryData:(id)a3
{
}

- (STVoiceControlStatusDomain)voiceControlDomain
{
  return self->_voiceControlDomain;
}

- (void)setVoiceControlDomain:(id)a3
{
}

- (STVoiceControlStatusDomainData)voiceControlDomainData
{
  return self->_voiceControlDomainData;
}

- (void)setVoiceControlDomainData:(id)a3
{
}

- (STWifiStatusDomain)wifiDomain
{
  return self->_wifiDomain;
}

- (void)setWifiDomain:(id)a3
{
}

- (STWifiStatusDomainData)wifiData
{
  return self->_wifiData;
}

- (void)setWifiData:(id)a3
{
}

- (STMediaStatusDomain)mediaDomain
{
  return self->_mediaDomain;
}

- (void)setMediaDomain:(id)a3
{
}

- (STMediaStatusDomainData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
}

- (STCallingStatusDomain)callingDomain
{
  return self->_callingDomain;
}

- (void)setCallingDomain:(id)a3
{
}

- (STCallingStatusDomainData)callingData
{
  return self->_callingData;
}

- (void)setCallingData:(id)a3
{
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (NSString)activeModeSymbolName
{
  return self->_activeModeSymbolName;
}

- (void)setActiveModeSymbolName:(id)a3
{
}

- (NSDateFormatter)timeItemDateFormatter
{
  return self->_timeItemDateFormatter;
}

- (void)setTimeItemDateFormatter:(id)a3
{
}

- (NSString)cachedTimeString
{
  return self->_cachedTimeString;
}

- (void)setCachedTimeString:(id)a3
{
}

- (CRSSiriPreferences)siriPreferences
{
  return self->_siriPreferences;
}

- (void)setSiriPreferences:(id)a3
{
}

- (BOOL)hasSetupAnnounceNotification
{
  return self->_hasSetupAnnounceNotification;
}

- (void)setHasSetupAnnounceNotification:(BOOL)a3
{
  self->_hasSetupAnnounceNotification = a3;
}

- (int64_t)cachedCarPlayAnnounceSetting
{
  return self->_cachedCarPlayAnnounceSetting;
}

- (void)setCachedCarPlayAnnounceSetting:(int64_t)a3
{
  self->_int64_t cachedCarPlayAnnounceSetting = a3;
}

- (BOOL)hasSetupTTR
{
  return self->_hasSetupTTR;
}

- (void)setHasSetupTTR:(BOOL)a3
{
  self->_hasSetupTTR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPreferences, 0);
  objc_storeStrong((id *)&self->_cachedTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_activeModeSymbolName, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_callingData, 0);
  objc_storeStrong((id *)&self->_callingDomain, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_mediaDomain, 0);
  objc_storeStrong((id *)&self->_wifiData, 0);
  objc_storeStrong((id *)&self->_wifiDomain, 0);
  objc_storeStrong((id *)&self->_voiceControlDomainData, 0);
  objc_storeStrong((id *)&self->_voiceControlDomain, 0);
  objc_storeStrong((id *)&self->_batteryData, 0);
  objc_storeStrong((id *)&self->_batteryDomain, 0);
  objc_storeStrong((id *)&self->_telephonyData, 0);
  objc_storeStrong((id *)&self->_telephonyDomain, 0);
  objc_storeStrong((id *)&self->_activeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_etcStatus, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_timeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_nowRecordingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sensorIndicatorView, 0);
}

- (void)_getTimeData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 cachedTimeString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Time string is empty from cached string: %@", v4, v5, v6, v7, v8);
}

- (void)_getTimeData:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 cachedTimeString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Unable to store time string in status bar data: %@", v4, v5, v6, v7, v8);
}

void __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22D6F0000, v0, v1, "Failed to register with DNDStateService: %@", v2);
}

void __49__DBStatusBarStateProvider__setupDNDStateService__block_invoke_118_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22D6F0000, v0, v1, "Failed to query initial Focus state: %@", v2);
}

void __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 attributedEntity];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Recording attribution exists, but attributed entity has no bundle identifier: %{public}@", v4, v5, v6, v7, v8);
}

void __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Recording attribution exists, but attributed entity has no bundle identifier", v1, 2u);
}

void __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22D6F0000, v0, v1, "Recording attribution exists, but could not find process for bundle identifier: %{public}@.", v2);
}

void __54__DBStatusBarStateProvider__mediaDataUpdatedWithData___block_invoke_cold_4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22D6F0000, v0, v1, "Recording attribution exists, bundle identifier is %{public}@, but process is not an app.", v2);
}

@end