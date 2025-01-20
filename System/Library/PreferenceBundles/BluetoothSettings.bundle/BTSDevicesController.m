@interface BTSDevicesController
- (BOOL)BOOLFromBluetoothPreferences:(id)a3;
- (BOOL)classicDeviceIsApple:(id)a3;
- (BOOL)isCarPlaySetupEnabled;
- (BOOL)isClassicAudioDevice:(id)a3;
- (BOOL)isDeviceSupported:(id)a3;
- (BOOL)isLECarPlayEnabled;
- (BOOL)isMainSettingsPane;
- (BOOL)isSupportCarPlaySetup:(id)a3;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (BOOL)nicknameEnabled;
- (BOOL)shouldDisplayDevice:(id)a3;
- (BOOL)shouldHideDevice:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)updateDADevices;
- (BTSDevicesController)init;
- (__CFRunLoopSource)runLoopSource;
- (__CFUserNotification)notification;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (id)_getDeviceForCTKDPeripheral:(id)a3;
- (id)_getDeviceForPeripheral:(id)a3;
- (id)_heroPlacardSpecifiers;
- (id)_knownDevicesSpecifiers;
- (id)_shareDevicesSpecifiers;
- (id)_specifierForDevice:(id)a3;
- (id)_specifierForSharingDevice:(id)a3;
- (id)bluetoothEnabled:(id)a3;
- (id)connectedFirmwareUpdateRequiredDeviceNames;
- (id)connectedPoorBehaviorDeviceNames;
- (id)currentSpecifier;
- (id)getLECarPlay:(id)a3;
- (id)localizedList:(id)a3;
- (id)makeWarningAttributedString:(id)a3;
- (id)mergeDualRadioDevices:(id)a3;
- (id)namesOfDevices:(id)a3 displayableOnly:(BOOL)a4;
- (id)powerOffWarningString;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int)bluetoothSettingsAppStateNotifyToken;
- (unsigned)connectedLEAudio1DeviceCount;
- (void)_addDevice:(id)a3;
- (void)_addDeviceSpecifier:(id)a3 withDevice:(id)a4;
- (void)_peripheralDidCompletePairing:(id)a3;
- (void)_removeDevice:(id)a3;
- (void)_removeDeviceSpecifier:(id)a3;
- (void)_retrievedRegisteredHealthDevices:(id)a3;
- (void)_setupCentralScanning;
- (void)_updateDevicePosition:(id)a3;
- (void)_updateHealthDevices;
- (void)alertSheetDismissed:(id)a3;
- (void)allowBluetoothConnections:(BOOL)a3;
- (void)allowBluetoothScans:(BOOL)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)authenticationRequestHandler:(id)a3;
- (void)bluetoothDenylistChanged:(id)a3;
- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)cleanupAlerts;
- (void)cleanupPairing;
- (void)dealloc;
- (void)deviceConnectedHandler:(id)a3;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)deviceDiscoveredHandler:(id)a3;
- (void)devicePairedHandler:(id)a3;
- (void)deviceRemovedHandler:(id)a3;
- (void)deviceUnpairedHandler:(id)a3;
- (void)deviceUpdatedHandler:(id)a3;
- (void)dismissPairingAlert:(id)a3;
- (void)effectiveMCSettingsDidChange:(id)a3;
- (void)fetchDADevices;
- (void)forcePushDetailViewForDevice:(id)a3;
- (void)handleDASessionEvent:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)healthDeviceUnregisteredHandler:(id)a3;
- (void)init;
- (void)migrateHKPairedHealthDevices;
- (void)notifyBluetoothSettingsAppStateIsActive:(BOOL)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheralConnectionTimeout:(id)a3;
- (void)peripheralDidUpdateName:(id)a3;
- (void)pinRequestHandler:(id)a3;
- (void)powerChanged;
- (void)powerChangedHandler:(id)a3;
- (void)refreshCTKDDevices;
- (void)refreshUI;
- (void)registerForNotifications;
- (void)sessionDidConnect:(id)a3;
- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4;
- (void)setBluetoothIsBusy:(BOOL)a3;
- (void)setBluetoothSettingsAppStateNotifyToken:(int)a3;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setSSPConfirmation:(int64_t)a3 forDevice:(id)a4;
- (void)showAlert:(id)a3;
- (void)showPairingAlert:(id)a3;
- (void)showPencilConnectionAttemptAlert:(int)a3;
- (void)showSyncContactsPopup:(id)a3;
- (void)showSyncContactsPrivacyPopup:(id)a3;
- (void)showUpgradeOSPopup:(id)a3;
- (void)sspConfirmationHandler:(id)a3;
- (void)sspNumericComparisonHandler:(id)a3;
- (void)sspPasskeyDisplayHandler:(id)a3;
- (void)startIncomingCarPlaySetup:(id)a3 andPasskey:(id)a4;
- (void)startOutgoingCarPlaySetup:(id)a3;
- (void)startedConnectionAttemptOnTransport:(unint64_t)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCTKDCounterparts:(id)a3 leDevice:(id)a4;
- (void)updateFirmwareUpdateRequiredDevicesList:(id)a3;
- (void)updateMainGroupFooter;
- (void)updatePoorConnectedDevicesList:(id)a3;
- (void)updatePowerState:(BOOL)a3 powerSpec:(id)a4;
- (void)updateUI:(BOOL)a3;
- (void)userDidTapWalletLink:(id)a3;
- (void)userDidTapWatchLink:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTSDevicesController

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BTSDevicesController;
  [(BTSDevicesController *)&v10 viewDidAppear:a3];
  if (!self->_bluetoothInitialized)
  {
    [(BTSDevicesController *)self allowBluetoothConnections:1];
    self->_bluetoothInitialized = 1;
  }
  if (self->_mainFooterNeedsUpdate)
  {
    [(BTSDevicesController *)self reloadSpecifiers];
    self->_mainFooterNeedsUpdate = 0;
  }
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Bluetooth"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"Bluetooth" table:0 locale:v6 bundleURL:v8];

  [(BTSDevicesController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.bluetooth" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
}

- (void)allowBluetoothConnections:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3
    || ([MEMORY[0x263F82438] sharedApplication],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 applicationState],
        v5,
        !v6))
  {
    self->_allowScanning = v3;
    v7 = [MEMORY[0x263F2B998] sharedInstance];
    [v7 setDiscoverable:v3];

    v8 = [MEMORY[0x263F2B998] sharedInstance];
    [v8 setConnectable:v3];

    v9 = [MEMORY[0x263F2B998] sharedInstance];
    [v9 setDeviceScanningEnabled:v3];

    if (!v3)
    {
      objc_super v10 = [MEMORY[0x263F2B998] sharedInstance];
      [v10 resetDeviceScanning];
    }
    [(BTSDevicesController *)self _setupCentralScanning];
  }
  sharingClient = self->_sharingClient;
  if (self->_allowScanning)
  {
    if (!sharingClient)
    {
      v13 = (SFDiagnostics *)objc_alloc_init(MEMORY[0x263F6C268]);
      v14 = self->_sharingClient;
      self->_sharingClient = v13;

      v15 = self->_sharingClient;
      [(SFDiagnostics *)v15 bluetoothUserInteraction];
    }
  }
  else
  {
    [(SFDiagnostics *)sharingClient invalidate];
    v12 = self->_sharingClient;
    self->_sharingClient = 0;
  }
}

- (id)specifiers
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F53C50] sharedConnection];
  self->_bluetoothRestricted = [v3 isBluetoothModificationAllowed] ^ 1;

  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v4) {
    goto LABEL_78;
  }
  v140 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v5 = (id)[MEMORY[0x263F2B998] sharedInstance];
  uint64_t v6 = [MEMORY[0x263F2B998] sharedInstance];
  self->_denylistEnabled = [v6 denylistEnabled];

  uint64_t v7 = (int)*MEMORY[0x263F5FE98];
  v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v9 = [v8 objectForKeyedSubscript:@"invoking-client-id"];
  invokingClientID = self->_invokingClientID;
  self->_invokingClientID = v9;

  v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v12 = [v11 objectForKeyedSubscript:@"custom-localized-title"];
  customTitle = self->_customTitle;
  self->_customTitle = v12;

  v14 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v15 = [v14 objectForKeyedSubscript:@"show-apple-devices"];
  self->_showAppleDevices = [v15 BOOLValue];

  v16 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v17 = [v16 objectForKeyedSubscript:@"show-audio-devices-only"];
  self->_showAudioDevicesOnly = [v17 BOOLValue];

  v18 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v19 = [v18 objectForKeyedSubscript:@"show-car-stereo-devices"];
  self->_BOOL showCarStereoDevices = [v19 BOOLValue];

  v20 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v21 = [v20 objectForKeyedSubscript:@"show-speaker-devices"];
  self->_BOOL showSpeakerDevices = [v21 BOOLValue];

  v22 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) userInfo];
  v23 = [v22 objectForKeyedSubscript:@"show-le-devices"];
  self->_showLEDevices = [v23 BOOLValue];

  v142 = self;
  v24 = self->_invokingClientID;
  v25 = sharedBluetoothSettingsLogComponent();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (!v26) {
      goto LABEL_20;
    }
    v27 = self->_invokingClientID;
    v28 = self->_customTitle;
    if (self->_showAppleDevices) {
      v29 = "yes";
    }
    else {
      v29 = "no";
    }
    BOOL showCarStereoDevices = self->_showCarStereoDevices;
    BOOL showSpeakerDevices = self->_showSpeakerDevices;
    if (self->_showAudioDevicesOnly) {
      v32 = "yes";
    }
    else {
      v32 = "no";
    }
    *(_DWORD *)buf = 138413570;
    if (showCarStereoDevices) {
      v33 = "yes";
    }
    else {
      v33 = "no";
    }
    v162 = (const char *)v27;
    __int16 v163 = 2112;
    if (showSpeakerDevices) {
      v34 = "yes";
    }
    else {
      v34 = "no";
    }
    uint64_t v164 = (uint64_t)v28;
    __int16 v165 = 2080;
    v166 = v29;
    __int16 v167 = 2080;
    v168 = v32;
    __int16 v169 = 2080;
    v170 = v33;
    __int16 v171 = 2080;
    v172 = v34;
    v35 = "BTSettings invoked from a client that is not the main Settings, ID: %@, customTitle: %@, showAppleDevices: %s,"
          " showAudioOnly: %s, showCarStereos: %s showSpeakers: %s";
    v36 = v25;
    uint32_t v37 = 62;
  }
  else
  {
    if (!v26) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v35 = "BTSettings invoked from main settings page";
    v36 = v25;
    uint32_t v37 = 2;
  }
  _os_log_impl(&dword_23EB2E000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_20:

  unint64_t v38 = 0x263EFF000uLL;
  v39 = (void *)MEMORY[0x263EFF980];
  v40 = self;
  v41 = [(BTSDevicesController *)self loadSpecifiersFromPlistName:@"Devices" target:self];
  v42 = [v39 arrayWithArray:v41];

  id v143 = [MEMORY[0x263EFF980] array];
  if ([(BTSDevicesController *)self isMainSettingsPane] || !self->_power)
  {
    v43 = [v42 objectAtIndexedSubscript:0];
    [v143 addObject:v43];

    v44 = [(BTSDevicesController *)self _heroPlacardSpecifiers];
    [v143 addObjectsFromArray:v44];

    v45 = [v42 objectAtIndexedSubscript:1];
    [v143 addObject:v45];
  }
  v46 = [v42 objectAtIndexedSubscript:3];
  myDevicesGroupSpec = self->_myDevicesGroupSpec;
  self->_myDevicesGroupSpec = v46;

  v48 = v140;
  if ([(NSMutableDictionary *)self->_pendingOtherRadioDevicesDict count])
  {
    v49 = self->_myDevicesGroupSpec;
    v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v51 = [v50 localizedStringForKey:@"FOLLOW_PAIR_INSTRUCTION_FOOTER" value:&stru_26F24FEE8 table:@"Devices"];
    [(PSSpecifier *)v49 setProperty:v51 forKey:*MEMORY[0x263F600F8]];
  }
  if (self->_bluetoothRestricted)
  {
    if (self->_power)
    {
      v52 = [(BTSDevicesController *)self _knownDevicesSpecifiers];
      if ([v52 count])
      {
        [v143 addObject:self->_myDevicesGroupSpec];
        [v143 addObjectsFromArray:v52];
      }
    }
    v53 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v160 = *MEMORY[0x263F537C0];
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:1];
    v55 = [v53 localizedRestrictionSourceDescriptionForFeatures:v54];
    restrictionDetail = self->_restrictionDetail;
    self->_restrictionDetail = v55;

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    obuint64_t j = v143;
    uint64_t v57 = [obj countByEnumeratingWithState:&v153 objects:v159 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      v59 = v42;
      uint64_t v60 = *(void *)v154;
      uint64_t v61 = *MEMORY[0x263F600A8];
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v154 != v60) {
            objc_enumerationMutation(obj);
          }
          v63 = *(void **)(*((void *)&v153 + 1) + 8 * i);
          v64 = [NSNumber numberWithBool:0];
          [v63 setProperty:v64 forKey:v61];
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v153 objects:v159 count:16];
      }
      while (v58);
      v42 = v59;
    }
  }
  else
  {
    if (self->_denylistEnabled && self->_power)
    {
      v65 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DENYLIST_ACTION_GROUP_ID"];
      v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v66 localizedStringForKey:@"DENYLIST_FOOTER" value:&stru_26F24FEE8 table:@"Devices"];
      v68 = v67 = v42;
      [v65 setProperty:v68 forKey:*MEMORY[0x263F600F8]];

      [v143 addObject:v65];
      v69 = (void *)MEMORY[0x263F5FC40];
      v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v38 = 0x263EFF000;
      v71 = [v70 localizedStringForKey:@"ALLOW_NEW_CONNECTIONS" value:&stru_26F24FEE8 table:@"Devices"];
      v72 = [v69 preferenceSpecifierNamed:v71 target:self set:0 get:0 detail:0 cell:13 edit:0];

      v42 = v67;
      [v72 setIdentifier:@"DENYLIST_ACTION_ID"];
      [v143 addObject:v72];
    }
    v73 = [v42 objectAtIndexedSubscript:4];
    otherDevicesGroupSpec = self->_otherDevicesGroupSpec;
    self->_otherDevicesGroupSpec = v73;

    if (MGGetBoolAnswer())
    {
      v75 = [MEMORY[0x263F57730] sharedInstance];
      char v76 = [v75 isPaired];

      if ((v76 & 1) == 0)
      {
        v77 = NSString;
        [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v78 = v138 = v42;
        unint64_t v79 = v38;
        v80 = [v78 localizedStringForKey:@"APPLE_WATCH_FOOTER_TEXT" value:&stru_26F24FEE8 table:@"Devices"];
        v81 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v82 = [v81 localizedStringForKey:@"APPLE_WATCH_APP_LINK" value:&stru_26F24FEE8 table:@"Devices"];
        v83 = objc_msgSend(v77, "stringWithFormat:", v80, v82);

        v40 = self;
        v48 = v140;

        v84 = self->_otherDevicesGroupSpec;
        v85 = (objc_class *)objc_opt_class();
        v86 = NSStringFromClass(v85);
        [(PSSpecifier *)v84 setProperty:v86 forKey:*MEMORY[0x263F600C0]];

        [(PSSpecifier *)self->_otherDevicesGroupSpec setProperty:v83 forKey:*MEMORY[0x263F600E8]];
        v87 = self->_otherDevicesGroupSpec;
        v88 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v89 = [v88 localizedStringForKey:@"APPLE_WATCH_APP_LINK" value:&stru_26F24FEE8 table:@"Devices"];
        v175.location = [v83 rangeOfString:v89];
        v90 = NSStringFromRange(v175);
        [(PSSpecifier *)v87 setProperty:v90 forKey:*MEMORY[0x263F600D0]];

        unint64_t v38 = v79;
        v42 = v138;
        v91 = self->_otherDevicesGroupSpec;
        v92 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
        [(PSSpecifier *)v91 setProperty:v92 forKey:*MEMORY[0x263F600E0]];

        [(PSSpecifier *)self->_otherDevicesGroupSpec setProperty:@"userDidTapWatchLink:" forKey:*MEMORY[0x263F600C8]];
      }
    }
    if (v40->_power)
    {
      obuint64_t j = [(BTSDevicesController *)v40 _shareDevicesSpecifiers];
      v139 = v42;
      if ([obj count])
      {
        uint64_t v93 = [v42 objectAtIndexedSubscript:2];
        sharingDevicesGroupSpec = v40->_sharingDevicesGroupSpec;
        v40->_sharingDevicesGroupSpec = (PSSpecifier *)v93;

        v95 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v96 = [v95 localizedStringForKey:@"SHARING_WITH" value:&stru_26F24FEE8 table:@"Devices"];
        [(PSSpecifier *)v40->_sharingDevicesGroupSpec setName:v96];

        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        id v141 = obj;
        uint64_t v97 = [v141 countByEnumeratingWithState:&v149 objects:v158 count:16];
        if (v97)
        {
          uint64_t v98 = v97;
          uint64_t v99 = *(void *)v150;
          uint64_t v100 = *MEMORY[0x263F600F8];
          do
          {
            for (uint64_t j = 0; j != v98; ++j)
            {
              if (*(void *)v150 != v99) {
                objc_enumerationMutation(v141);
              }
              v102 = *(void **)(*((void *)&v149 + 1) + 8 * j);
              v103 = v142->_sharingDevicesGroupSpec;
              v104 = NSString;
              v105 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v106 = [v105 localizedStringForKey:@"SHARING_NOW" value:&stru_26F24FEE8 table:@"Devices"];
              v107 = [v102 name];
              v108 = objc_msgSend(v104, "stringWithFormat:", v106, v107);
              [(PSSpecifier *)v103 setProperty:v108 forKey:v100];
            }
            uint64_t v98 = [v141 countByEnumeratingWithState:&v149 objects:v158 count:16];
          }
          while (v98);
        }

        v40 = v142;
        [v143 addObject:v142->_sharingDevicesGroupSpec];
        [v143 addObjectsFromArray:v141];
        v48 = v140;
        v42 = v139;
        unint64_t v38 = 0x263EFF000uLL;
      }
      v109 = [(BTSDevicesController *)v40 _knownDevicesSpecifiers];
      if ([v109 count])
      {
        [v143 addObject:v40->_myDevicesGroupSpec];
        [v143 addObjectsFromArray:v109];
        v110 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v111 = [v110 localizedStringForKey:@"OTHER_DEVICES" value:&stru_26F24FEE8 table:@"Devices"];
        [(PSSpecifier *)v40->_otherDevicesGroupSpec setName:v111];

        v112 = *(void **)(v38 + 2432);
        v113 = [MEMORY[0x263F2B998] sharedInstance];
        v114 = [v113 connectingDevices];
        v115 = [v112 arrayWithArray:v114];

        v116 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
        {
          uint64_t v117 = [v115 count];
          *(_DWORD *)buf = 136315650;
          v162 = "-[BTSDevicesController specifiers]";
          __int16 v163 = 2048;
          uint64_t v164 = v117;
          __int16 v165 = 2112;
          v166 = (const char *)v115;
          _os_log_impl(&dword_23EB2E000, v116, OS_LOG_TYPE_INFO, "%s found %lu connecting devices - %@", buf, 0x20u);
        }

        long long v147 = 0u;
        long long v148 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        id v118 = v115;
        uint64_t v119 = [v118 countByEnumeratingWithState:&v145 objects:v157 count:16];
        if (v119)
        {
          uint64_t v120 = v119;
          uint64_t v121 = *(void *)v146;
          do
          {
            for (uint64_t k = 0; k != v120; ++k)
            {
              if (*(void *)v146 != v121) {
                objc_enumerationMutation(v118);
              }
              v123 = [*(id *)(*((void *)&v145 + 1) + 8 * k) address];
              v124 = [v143 specifierForID:v123];

              if (v124)
              {
                [(BTSDevicesController *)v40 setBluetoothIsBusy:1];
                objc_storeStrong((id *)&v40->_currentDeviceSpecifier, v124);
              }
            }
            uint64_t v120 = [v118 countByEnumeratingWithState:&v145 objects:v157 count:16];
          }
          while (v120);
        }

        v42 = v139;
      }
      [v143 addObject:v40->_otherDevicesGroupSpec];
    }
    else
    {
      uint64_t v125 = [(BTSDevicesController *)v40 powerOffWarningString];
      v109 = [v143 objectAtIndexedSubscript:0];
      obuint64_t j = (id)v125;
      [v109 setProperty:v125 forKey:*MEMORY[0x263F600F8]];
    }
  }
  objc_storeStrong(v48, v143);
  if (v40->_pendingSetupDeviceID)
  {
    v126 = [MEMORY[0x263F2B998] sharedInstance];
    v127 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v40->_pendingSetupDeviceID];
    v128 = [v126 deviceFromIdentifier:v127];

    v129 = [v128 address];
    v130 = [(NSMutableDictionary *)v40->_devicesDict objectForKeyedSubscript:v129];

    if (v130)
    {
      v131 = [(NSMutableDictionary *)v40->_devicesDict objectForKeyedSubscript:v129];
      ctkdCounterpartDevicesDict = v40->_ctkdCounterpartDevicesDict;
      v133 = [v131 identifier];
      v134 = [(NSMutableDictionary *)ctkdCounterpartDevicesDict objectForKeyedSubscript:v133];

      if (v134)
      {
        v135 = [v134 underlyingDADevice];

        if (v135)
        {
          [(BTSDevicesController *)v40 forcePushDetailViewForDevice:v131];
          pendingSetupDeviceID = v40->_pendingSetupDeviceID;
          v40->_pendingSetupDeviceID = 0;
        }
      }
    }
  }

  id v4 = *v48;
LABEL_78:

  return v4;
}

- (id)_knownDevicesSpecifiers
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  v107 = [MEMORY[0x263EFF9C0] set];
  v105 = [MEMORY[0x263EFF9A0] dictionary];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  BOOL v3 = [MEMORY[0x263F2B998] sharedInstance];
  id v4 = [v3 pairedDevices];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v142 objects:v157 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v143;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v143 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v142 + 1) + 8 * i);
        objc_super v10 = +[BTSDeviceClassic deviceWithDevice:v9];
        v11 = [v10 classicDevice];
        v12 = [v11 address];

        v13 = [(NSMutableDictionary *)self->managedByWalletDictionary objectForKey:v12];

        if (v13)
        {
          [v10 setManagedByWallet:1];
          [v10 setManagedByAliroWallet:1];
        }
        v14 = [(NSMutableDictionary *)self->supportsBackgroundNIDictionary objectForKey:v12];

        if (v14) {
          [v10 setSupportsBackgroundNI:1];
        }
        if (([v9 isTemporaryPaired] & 1) == 0)
        {
          [v107 addObject:v10];
          [v105 setObject:v10 forKeyedSubscript:v12];
          if ([v10 connected])
          {
            if ([v10 isLimitedConnectivityDevice])
            {
              [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v10];
              self->_mainFooterNeedsUpdate = 1;
            }
            if ([v10 isHIDDevice])
            {
              [(NSMutableSet *)self->_connectedHIDDevices addObject:v10];
              self->_mainFooterNeedsUpdate = 1;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v142 objects:v157 count:16];
    }
    while (v6);
  }

  v15 = [MEMORY[0x263EFF9A0] dictionary];
  v104 = [MEMORY[0x263EFF9A0] dictionary];
  v106 = v15;
  if (self->_power)
  {
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    v16 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    v17 = [v16 retrievePairedPeers];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v138 objects:v156 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v139;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v139 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v138 + 1) + 8 * j);
          v23 = [(BTSDevicesController *)self _getDeviceForPeripheral:v22];
          if (v23)
          {
            [v22 setDelegate:self];
            if ([v23 isManagedByDeviceAccess])
            {
              v24 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v155 = v23;
                _os_log_impl(&dword_23EB2E000, v24, OS_LOG_TYPE_DEFAULT, "This device needs to be coalesced with a DADevice before being displayed: %@", buf, 0xCu);
              }

              v25 = [v22 identifier];
              [v106 setObject:v22 forKeyedSubscript:v25];
            }
            else
            {
              [v107 addObject:v23];
              if ([v23 connected])
              {
                if ([v23 isLimitedConnectivityDevice])
                {
                  [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v23];
                  self->_mainFooterNeedsUpdate = 1;
                }
                if ([v23 isFirmwareUpdateRequiredDevice])
                {
                  [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices addObject:v23];
                  self->_mainFooterNeedsUpdate = 1;
                }
                if ([v23 isHIDDevice])
                {
                  [(NSMutableSet *)self->_connectedHIDDevices addObject:v23];
                  self->_mainFooterNeedsUpdate = 1;
                }
              }
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v138 objects:v156 count:16];
      }
      while (v19);
    }

    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    BOOL v26 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v134 objects:v153 count:16];
    v15 = v106;
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v135;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v135 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v134 + 1) + 8 * k);
          if ([v31 connectedTransport] == 2)
          {
            v32 = [(BTSDevicesController *)self _getDeviceForPeripheral:v31];
            if (v32)
            {
              if ([v31 visibleInSettings])
              {
                [v31 setDelegate:self];
                if ([v32 isManagedByDeviceAccess])
                {
                  v33 = sharedBluetoothSettingsLogComponent();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    long long v155 = v32;
                    _os_log_impl(&dword_23EB2E000, v33, OS_LOG_TYPE_DEFAULT, "This device needs to be coalesced with a DADevice before being displayed: %@", buf, 0xCu);
                  }

                  v34 = [v31 identifier];
                  [v106 setObject:v31 forKeyedSubscript:v34];
                  goto LABEL_52;
                }
                [v107 addObject:v32];
              }
              else
              {
                v34 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v155 = v31;
                  _os_log_impl(&dword_23EB2E000, v34, OS_LOG_TYPE_DEFAULT, "Peripheral %@ should not be visible in Settings. Ignoring.", buf, 0xCu);
                }
LABEL_52:
              }
            }

            v15 = v106;
            continue;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v134 objects:v153 count:16];
      }
      while (v28);
    }

    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v100 = [(NSMutableDictionary *)self->_knownDADevices allKeys];
    uint64_t v102 = [v100 countByEnumeratingWithState:&v130 objects:v152 count:16];
    if (!v102) {
      goto LABEL_92;
    }
    uint64_t v101 = *(void *)v131;
LABEL_59:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v131 != v101) {
        objc_enumerationMutation(v100);
      }
      uint64_t v103 = v35;
      uint64_t v36 = *(void *)(*((void *)&v130 + 1) + 8 * v35);
      v108 = [(NSMutableDictionary *)self->_knownDADevices objectForKey:v36];
      centralManager = self->_centralManager;
      uint64_t v151 = v36;
      unint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v151 count:1];
      v39 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v38];

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v40 = v39;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v126 objects:v150 count:16];
      if (v41) {
        break;
      }
LABEL_90:

      uint64_t v35 = v103 + 1;
      if (v103 + 1 == v102)
      {
        uint64_t v102 = [v100 countByEnumeratingWithState:&v130 objects:v152 count:16];
        if (!v102)
        {
LABEL_92:

          goto LABEL_93;
        }
        goto LABEL_59;
      }
    }
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v127;
LABEL_64:
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v127 != v43) {
        objc_enumerationMutation(v40);
      }
      v45 = *(void **)(*((void *)&v126 + 1) + 8 * v44);
      [v45 setDelegate:self];
      v46 = [v45 identifier];
      [v15 setObject:0 forKeyedSubscript:v46];

      v47 = +[BTSDeviceLE deviceWithPeripheral:v45 manager:self->_centralManager];
      v48 = v47;
      if (v47)
      {
        if ([v47 supportsCTKD])
        {
          v49 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v155 = v45;
            v50 = v49;
            v51 = "Not showing peripheral because it's CTKD and will be shown with the classic device instead: %@";
LABEL_73:
            _os_log_impl(&dword_23EB2E000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
          }
        }
        else
        {
          v52 = [v48 relatedFutureRadioAddress];

          if (v52)
          {
            v53 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v155 = v45;
              _os_log_impl(&dword_23EB2E000, v53, OS_LOG_TYPE_DEFAULT, "Peripheral is waiting to link to a classic radio that is yet to be paired, showing LE first: %@", buf, 0xCu);
            }

            [v48 setUnderlyingDADevice:v108];
            [v107 addObject:v48];
            pendingOtherRadioDevicesDict = self->_pendingOtherRadioDevicesDict;
            v55 = [v48 relatedFutureRadioAddress];
            [(NSMutableDictionary *)pendingOtherRadioDevicesDict setObject:v48 forKey:v55];

            goto LABEL_88;
          }
          v56 = [v48 linkedRadioAddress];

          if (!v56) {
            goto LABEL_87;
          }
          uint64_t v57 = self->_pendingOtherRadioDevicesDict;
          uint64_t v58 = [v48 linkedRadioAddress];
          [(NSMutableDictionary *)v57 setObject:0 forKeyedSubscript:v58];

          v59 = [v48 linkedRadioAddress];
          uint64_t v60 = [v105 objectForKeyedSubscript:v59];

          uint64_t v61 = sharedBluetoothSettingsLogComponent();
          v62 = v61;
          if (!v60)
          {
            v15 = v106;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v155 = v45;
              _os_log_error_impl(&dword_23EB2E000, v62, OS_LOG_TYPE_ERROR, "Peripheral has linked classic radio but we don't see the classic device with this address. Showing LE device %@", buf, 0xCu);
            }

LABEL_87:
            [v48 setUnderlyingDADevice:v108];
            [v107 addObject:v48];
            goto LABEL_88;
          }
          v15 = v106;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v155 = v45;
            _os_log_impl(&dword_23EB2E000, v62, OS_LOG_TYPE_DEFAULT, "Not showing peripheral because it's linked to another classic radio and will be shown with the classic device instead: %@", buf, 0xCu);
          }

          v49 = [v45 identifier];
          [v104 setObject:v45 forKeyedSubscript:v49];
        }
      }
      else
      {
        v49 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v155 = v45;
          v50 = v49;
          v51 = "unable to create BTSDeviceLE for this DA peripheral: %@";
          goto LABEL_73;
        }
      }

LABEL_88:
      if (v42 == ++v44)
      {
        uint64_t v42 = [v40 countByEnumeratingWithState:&v126 objects:v150 count:16];
        if (!v42) {
          goto LABEL_90;
        }
        goto LABEL_64;
      }
    }
  }
LABEL_93:
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v63 = [v15 allValues];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v122 objects:v149 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v123;
    do
    {
      for (uint64_t m = 0; m != v65; ++m)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v122 + 1) + 8 * m);
        v69 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v155 = v68;
          _os_log_impl(&dword_23EB2E000, v69, OS_LOG_TYPE_DEFAULT, "Unable to fetch DADevice for DA tagged Peripheral, we should still add it to UI for user to be able to manage: %@", buf, 0xCu);
        }

        v70 = [(BTSDevicesController *)self _getDeviceForPeripheral:v68];
        if (v70)
        {
          if ([v68 visibleInSettings])
          {
            [v68 setDelegate:self];
            [v107 addObject:v70];
          }
          else
          {
            v71 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v155 = v68;
              _os_log_impl(&dword_23EB2E000, v71, OS_LOG_TYPE_DEFAULT, "Peripheral %@ should not be visible in Settings. Ignoring.", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v122 objects:v149 count:16];
    }
    while (v65);
  }

  [v107 unionSet:self->_knownHealthDevices];
  v72 = [MEMORY[0x263EFF980] array];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v73 = v107;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v118 objects:v148 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v119;
    do
    {
      for (uint64_t n = 0; n != v75; ++n)
      {
        if (*(void *)v119 != v76) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v118 + 1) + 8 * n);
        devicesDict = self->_devicesDict;
        v80 = [v78 identifier];
        [(NSMutableDictionary *)devicesDict setObject:v78 forKey:v80];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v118 objects:v148 count:16];
    }
    while (v75);
  }

  [(BTSDevicesController *)self refreshCTKDDevices];
  v81 = v104;
  if ([v104 count])
  {
    obuint64_t j = v72;
    v82 = [(BTSDevicesController *)self mergeDualRadioDevices:v104];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v83 = [v82 countByEnumeratingWithState:&v114 objects:v147 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v115;
      do
      {
        for (iuint64_t i = 0; ii != v84; ++ii)
        {
          if (*(void *)v115 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = *(void **)(*((void *)&v114 + 1) + 8 * ii);
          [v73 addObject:v87];
          v88 = self->_devicesDict;
          v89 = [v87 identifier];
          [(NSMutableDictionary *)v88 setObject:v87 forKey:v89];
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v114 objects:v147 count:16];
      }
      while (v84);
    }

    v81 = v104;
    v72 = obj;
  }
  else
  {
    [(NSMutableDictionary *)self->_dualRadioCounterpartDevicesDict removeAllObjects];
  }
  v90 = [v73 allObjects];
  v91 = [v90 sortedArrayUsingComparator:&__block_literal_global];

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v92 = v91;
  uint64_t v93 = [v92 countByEnumeratingWithState:&v110 objects:v146 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v111;
    do
    {
      for (juint64_t j = 0; jj != v94; ++jj)
      {
        if (*(void *)v111 != v95) {
          objc_enumerationMutation(v92);
        }
        uint64_t v97 = *(void *)(*((void *)&v110 + 1) + 8 * jj);
        if ([(BTSDevicesController *)self shouldDisplayDevice:v97])
        {
          uint64_t v98 = [(BTSDevicesController *)self _specifierForDevice:v97];
          [v72 addObject:v98];
        }
      }
      uint64_t v94 = [v92 countByEnumeratingWithState:&v110 objects:v146 count:16];
    }
    while (v94);
  }

  return v72;
}

- (void)refreshCTKDDevices
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (self->_power)
  {
    BOOL v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EB2E000, v3, OS_LOG_TYPE_DEFAULT, "CTKD : Update CTKD device properties", buf, 2u);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v4 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    uint64_t v5 = [v4 retrievePairedPeers];

    obuint64_t j = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v44;
      unint64_t v10 = 0x26503D000uLL;
      *(void *)&long long v7 = 138412546;
      long long v38 = v7;
      uint64_t v39 = *(void *)v44;
      do
      {
        uint64_t v11 = 0;
        uint64_t v40 = v8;
        do
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
          v13 = objc_msgSend(*(id *)(v10 + 1640), "deviceWithPeripheral:manager:", v12, self->_centralManager, v38);
          v14 = v13;
          if (v13 && [v13 supportsCTKD])
          {
            [v12 setDelegate:self];
            v15 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = [v12 identifier];
              *(_DWORD *)buf = 138412290;
              v48 = v16;
              _os_log_impl(&dword_23EB2E000, v15, OS_LOG_TYPE_DEFAULT, "Get derived device for CTKD device: %@", buf, 0xCu);
            }
            v17 = [MEMORY[0x263F2B998] sharedInstance];
            uint64_t v18 = [v12 identifier];
            uint64_t v19 = [v17 deviceFromIdentifier:v18];

            uint64_t v42 = (void *)v19;
            uint64_t v20 = +[BTSDeviceClassic deviceWithDevice:v19];
            devicesDict = self->_devicesDict;
            v22 = [v20 classicDevice];
            v23 = [v22 address];
            v24 = [(NSMutableDictionary *)devicesDict objectForKey:v23];

            if (v24)
            {
              [v24 setCtkdDevice:1];
              if ([v14 isManagedByDeviceAccess])
              {
                knownDADevices = self->_knownDADevices;
                BOOL v26 = [v12 identifier];
                uint64_t v27 = [(NSMutableDictionary *)knownDADevices objectForKeyedSubscript:v26];
                [v14 setUnderlyingDADevice:v27];

                uint64_t v28 = [v14 name];
                [v24 setAccessorySetupKitDisplayName:v28];

                objc_msgSend(v24, "setDenyIncomingClassicConnection:", objc_msgSend(v14, "shouldDenyIncomingClassicConnection"));
              }
              uint64_t v29 = self->_devicesDict;
              v30 = [v20 classicDevice];
              v31 = [v30 address];
              [(NSMutableDictionary *)v29 setObject:v24 forKey:v31];

              v32 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v36 = [v14 name];
                int v37 = [v24 isCTKDDevice];
                *(_DWORD *)buf = v38;
                v48 = v36;
                __int16 v49 = 1024;
                int v50 = v37;
                _os_log_debug_impl(&dword_23EB2E000, v32, OS_LOG_TYPE_DEBUG, "CTKD : classic device found in list %@ with CTKD : %d", buf, 0x12u);
              }
              v33 = [v12 identifier];
              v34 = [v33 UUIDString];

              if (v34)
              {
                uint64_t v35 = [(NSMutableDictionary *)self->_ctkdLeDevicesDict objectForKey:v34];

                if (!v35)
                {
                  [v14 setCtkdDevice:1];
                  [(NSMutableDictionary *)self->_ctkdLeDevicesDict setObject:v14 forKey:v34];
                }
              }
              [(BTSDevicesController *)self updateCTKDCounterparts:v24 leDevice:v14];
            }
            uint64_t v9 = v39;
            unint64_t v10 = 0x26503D000;
            uint64_t v8 = v40;
          }

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v8);
    }
  }
}

- (id)_getDeviceForPeripheral:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  devicesDict = self->_devicesDict;
  uint64_t v6 = [v4 identifier];
  long long v7 = [v6 UUIDString];
  uint64_t v8 = [(NSMutableDictionary *)devicesDict objectForKey:v7];

  if (v8)
  {
    if ([v4 hasTag:@"_MANAGED_BY_WALLET_"])
    {
      [v8 setManagedByWallet:1];
      uint64_t v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        unint64_t v10 = "DCK : Digital Car Key are special";
LABEL_28:
        _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v38, 2u);
      }
    }
    else
    {
      if (![v4 hasTag:@"_MANAGED_BY_ALIRO_WALLET_"])
      {
LABEL_30:
        id v32 = v8;
        uint64_t v8 = v32;
        goto LABEL_41;
      }
      [v8 setManagedByAliroWallet:1];
      uint64_t v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        unint64_t v10 = "Alire : Home Key are special";
        goto LABEL_28;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v8 = +[BTSDeviceLE deviceWithPeripheral:v4 manager:self->_centralManager];
  if (![(BTSDevicesController *)self shouldHideDevice:v8])
  {
    if ([v4 hasTag:@"_MANAGED_BY_WALLET_"])
    {
      [v8 setManagedByWallet:1];
      uint64_t v11 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_DEFAULT, "DCK : Digital Car Key are special", (uint8_t *)&v38, 2u);
      }
    }
    if ([v4 hasTag:@"_MANAGED_BY_ALIRO_WALLET_"])
    {
      [v8 setManagedByAliroWallet:1];
      v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_23EB2E000, v12, OS_LOG_TYPE_DEFAULT, "Aliro : Home Key are special", (uint8_t *)&v38, 2u);
      }
    }
    v13 = [v4 customProperty:@"Fitness"];

    if (v13) {
      [v8 setHealthDevice:1];
    }
    if (![v8 supportsCTKD])
    {
      uint64_t v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v8 name];
        int v38 = 138412290;
        uint64_t v39 = v33;
        _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_DEFAULT, "CTKD : Device %@ does not support CTKD", (uint8_t *)&v38, 0xCu);
      }
      goto LABEL_29;
    }
    v14 = [MEMORY[0x263F2B998] sharedInstance];
    v15 = [v4 identifier];
    uint64_t v9 = [v14 deviceFromIdentifier:v15];

    v16 = +[BTSDeviceClassic deviceWithDevice:v9];
    v17 = self->_devicesDict;
    uint64_t v18 = [v16 classicDevice];
    uint64_t v19 = [v18 address];
    uint64_t v20 = [(NSMutableDictionary *)v17 objectForKey:v19];

    if (v20)
    {
      [v20 setCtkdDevice:1];
      if ([v8 isManagedByDeviceAccess])
      {
        knownDADevices = self->_knownDADevices;
        v22 = [v4 identifier];
        v23 = [(NSMutableDictionary *)knownDADevices objectForKeyedSubscript:v22];
        [v8 setUnderlyingDADevice:v23];

        v24 = [v8 name];
        [v20 setAccessorySetupKitDisplayName:v24];

        objc_msgSend(v20, "setDenyIncomingClassicConnection:", objc_msgSend(v8, "shouldDenyIncomingClassicConnection"));
      }
      v25 = self->_devicesDict;
      BOOL v26 = [v16 classicDevice];
      uint64_t v27 = [v26 address];
      [(NSMutableDictionary *)v25 setObject:v20 forKey:v27];

      uint64_t v28 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BTSDevicesController _getDeviceForPeripheral:]();
      }

      uint64_t v29 = [v4 identifier];
      v30 = [v29 UUIDString];

      if (v30)
      {
        v31 = [(NSMutableDictionary *)self->_ctkdLeDevicesDict objectForKey:v30];

        if (!v31)
        {
          [v8 setCtkdDevice:1];
          [(NSMutableDictionary *)self->_ctkdLeDevicesDict setObject:v8 forKey:v30];
          [(BTSDevicesController *)self updateCTKDCounterparts:v20 leDevice:v8];
        }
      }
    }
    else
    {
      int v34 = [v4 hasTag:@"HasTS"];
      uint64_t v35 = sharedBluetoothSettingsLogComponent();
      v30 = v35;
      if (v34)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[BTSDevicesController _getDeviceForPeripheral:](v30);
        }

        goto LABEL_29;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = [v8 name];
        int v38 = 138412290;
        uint64_t v39 = v36;
        _os_log_impl(&dword_23EB2E000, v30, OS_LOG_TYPE_INFO, "CTKD : Device %@ missing from list of classic paired devices", (uint8_t *)&v38, 0xCu);
      }
    }
  }
  id v32 = 0;
LABEL_41:

  return v32;
}

- (id)_specifierForDevice:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v4;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "Creating specifier for device: %@.", buf, 0xCu);
  }

  uint64_t v6 = [v4 productName];
  if ([(BTSDevicesController *)self nicknameEnabled])
  {
    uint64_t v7 = [v4 name];

    uint64_t v6 = (__CFString *)v7;
  }
  uint64_t v8 = [v4 classicDevice];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    unint64_t v10 = [v4 classicDevice];
    int v11 = [v10 magicPaired];

    if (v11)
    {
      uint64_t v12 = [v4 name];

      uint64_t v6 = (__CFString *)v12;
    }
  }
  if (!v6 || [(__CFString *)v6 isEqualToString:&stru_26F24FEE8])
  {

    uint64_t v6 = @" ";
  }
  v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  v36[0] = *MEMORY[0x263F5FFE0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = *MEMORY[0x263F60080];
  v37[0] = v15;
  v37[1] = @"BTSPairSetup";
  uint64_t v17 = *MEMORY[0x263F60228];
  v36[1] = v16;
  v36[2] = v17;
  v36[3] = *MEMORY[0x263F602A0];
  v37[2] = @"BTSPairController";
  v37[3] = @"PSLinkCell";
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
  uint64_t v19 = (void *)[v14 initWithDictionary:v18];

  [v13 setName:v6];
  [v19 setObject:v6 forKey:*MEMORY[0x263F602D0]];
  uint64_t v20 = [v4 identifier];
  [v19 setObject:v20 forKey:*MEMORY[0x263F60138]];

  [v19 setObject:@"BTSDeviceConfigController" forKey:v16];
  [v13 setProperties:v19];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v21 setObject:v4 forKey:@"bt-device"];
  if ([v4 isCTKDDevice])
  {
    centralManager = self->_centralManager;
    v23 = [v4 classicDevice];
    v24 = [v23 address];
    v25 = [(CBCentralManager *)centralManager retrievePeripheralWithAddress:v24];

    BOOL v26 = +[BTSDeviceLE deviceWithPeripheral:v25 manager:self->_centralManager];
    if ([v26 isManagedByDeviceAccess])
    {
      knownDADevices = self->_knownDADevices;
      uint64_t v28 = [v25 identifier];
      uint64_t v29 = [(NSMutableDictionary *)knownDADevices objectForKeyedSubscript:v28];
      [v26 setUnderlyingDADevice:v29];
    }
    v30 = @"ctkd-device";
  }
  else
  {
    dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
    id v32 = [v4 identifier];
    v33 = [(NSMutableDictionary *)dualRadioCounterpartDevicesDict objectForKeyedSubscript:v32];

    if (!v33) {
      goto LABEL_18;
    }
    int v34 = self->_dualRadioCounterpartDevicesDict;
    v25 = [v4 identifier];
    BOOL v26 = [(NSMutableDictionary *)v34 objectForKeyedSubscript:v25];
    v30 = @"linked-le-device";
  }
  [v21 setObject:v26 forKey:v30];

LABEL_18:
  [v13 setUserInfo:v21];

  return v13;
}

- (BOOL)nicknameEnabled
{
  return ![(BTSDevicesController *)self BOOLFromBluetoothPreferences:@"nicknamingDisabled"];
}

- (BOOL)shouldHideDevice:(id)a3
{
  return [a3 cloudPaired];
}

- (BOOL)BOOLFromBluetoothPreferences:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.BTServer", &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (id)_shareDevicesSpecifiers
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9C0] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [MEMORY[0x263F2B998] sharedInstance];
  BOOL v5 = [v4 connectedDevices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v10 isTemporaryPaired])
        {
          int v11 = +[BTSDeviceClassic deviceWithDevice:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  uint64_t v36 = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  BOOL v26 = v3;
  id v14 = [v3 sortedArrayUsingDescriptors:v13];

  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        if ([(BTSDevicesController *)self shouldDisplayDevice:v21])
        {
          v22 = [(BTSDevicesController *)self _specifierForSharingDevice:v21];
          [v15 addObject:v22];

          sharingDevicesDict = self->_sharingDevicesDict;
          v24 = [v21 identifier];
          [(NSMutableDictionary *)sharingDevicesDict setObject:v21 forKey:v24];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }

  return v15;
}

- (void)_updateHealthDevices
{
  v26[1] = *MEMORY[0x263EF8340];
  BOOL v3 = (NSMutableSet *)objc_opt_new();
  knownHealthDevices = self->_knownHealthDevices;
  self->_knownHealthDevices = v3;

  if (_os_feature_enabled_impl())
  {
    centralManager = self->_centralManager;
    v26[0] = @"Fitness";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke;
    v22[3] = &unk_26503DA68;
    v22[4] = self;
    [(CBCentralManager *)centralManager retrievePeripheralsWithCustomProperties:v6 completion:v22];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(CBCentralManager *)self->_centralManager retrievePeripheralsWithIdentifiers:self->_retrievedHealthServices];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [(BTSDevicesController *)self _getDeviceForPeripheral:*(void *)(*((void *)&v18 + 1) + 8 * v11)];
          v13 = v12;
          if (v12)
          {
            [v12 setHealthDevice:1];
            [(NSMutableSet *)self->_knownHealthDevices addObject:v13];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v9);
    }

    id v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = self->_knownHealthDevices;
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_impl(&dword_23EB2E000, v14, OS_LOG_TYPE_INFO, "Found known health devices %@", buf, 0xCu);
    }

    if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
    {
      id v16 = self->_knownHealthDevices;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_541;
      v17[3] = &unk_26503DBC8;
      v17[4] = self;
      [(NSMutableSet *)v16 enumerateObjectsUsingBlock:v17];
    }
  }
}

- (void)_setupCentralScanning
{
  v15[3] = *MEMORY[0x263EF8340];
  if (self->_power)
  {
    if (self->_allowScanning)
    {
      BOOL v3 = (void *)[(NSArray *)self->_healthServices mutableCopy];
      id v4 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEE8]];
      [v3 addObject:v4];

      if ([(BTSDevicesController *)self isiPhone])
      {
        if ([(BTSDevicesController *)self isLECarPlayEnabled])
        {
          BOOL v5 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEF0]];
          [v3 addObject:v5];
        }
      }
      uint64_t v6 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEC8]];
      v15[0] = v6;
      uint64_t v7 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEED0]];
      v15[1] = v7;
      uint64_t v8 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEC0]];
      v15[2] = v8;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

      centralManager = self->_centralManager;
      uint64_t v13 = *MEMORY[0x263EFEDE0];
      id v14 = v9;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      [(CBCentralManager *)centralManager scanForPeripheralsWithServices:v3 options:v11];
    }
    else
    {
      uint64_t v12 = self->_centralManager;
      [(CBCentralManager *)v12 stopScan];
    }
  }
}

- (id)_getDeviceForCTKDPeripheral:(id)a3
{
  id v4 = a3;
  ctkdLeDevicesDict = self->_ctkdLeDevicesDict;
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [(NSMutableDictionary *)ctkdLeDevicesDict objectForKey:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F2B998] sharedInstance];
    uint64_t v10 = [v4 identifier];
    uint64_t v11 = [v9 deviceFromIdentifier:v10];

    uint64_t v12 = +[BTSDeviceClassic deviceWithDevice:v11];
    uint64_t v13 = [v12 classicDevice];
    id v14 = [v13 address];

    uint64_t v15 = [(NSMutableDictionary *)self->_devicesDict objectForKey:v14];
    if (([v8 isManagedByWallet] & 1) != 0 || objc_msgSend(v8, "isManagedByAliroWallet"))
    {
      id v16 = [(NSMutableDictionary *)self->managedByWalletDictionary objectForKey:v14];

      if (!v16) {
        [(NSMutableDictionary *)self->managedByWalletDictionary setValue:MEMORY[0x263EFFA88] forKey:v14];
      }
    }
    if ([v8 doesSupportBackgroundNI]
      && ([(NSMutableDictionary *)self->supportsBackgroundNIDictionary objectForKey:v14],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      [(NSMutableDictionary *)self->supportsBackgroundNIDictionary setValue:MEMORY[0x263EFFA88] forKey:v14];
      if (v15) {
        goto LABEL_9;
      }
    }
    else if (v15)
    {
LABEL_9:
      id v18 = v15;
      goto LABEL_14;
    }
    long long v19 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[BTSDevicesController _getDeviceForCTKDPeripheral:]();
    }

LABEL_14:
    if (v15) {
      goto LABEL_16;
    }
  }
  uint64_t v15 = 0;
LABEL_16:

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)BTSDevicesController;
  id v6 = a4;
  uint64_t v7 = [(BTSDevicesController *)&v41 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = [(BTSDevicesController *)self indexForIndexPath:v6];

  if ([v7 tag] != 1) {
    goto LABEL_39;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class()) {
    goto LABEL_39;
  }
  id v10 = v7;
  id v39 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
  uint64_t v11 = [v39 userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"bt-device"];

  if (([v12 paired] & 1) != 0
    || ([v12 isHealthDevice] & 1) != 0
    || ([v12 isManagedByDeviceAccess] & 1) != 0)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = [v12 isManagedByAliroWallet];
  }
  unsigned int v14 = [v12 connected];
  if ([v12 isCTKDDevice])
  {
    centralManager = self->_centralManager;
    id v16 = [v12 classicDevice];
    uint64_t v17 = [v16 address];
    id v18 = [(CBCentralManager *)centralManager retrievePeripheralWithAddress:v17];

    if ([v12 connected]) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = [v18 isConnectedToSystem];
    }
    long long v19 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [v10 title];
      *(_DWORD *)buf = 138412546;
      long long v43 = v20;
      __int16 v44 = 1024;
      int v45 = v14;
      _os_log_impl(&dword_23EB2E000, v19, OS_LOG_TYPE_DEFAULT, "CTKD : cell \"%@\" is connected %d", buf, 0x12u);
    }
  }
  dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
  v22 = [v12 identifier];
  v23 = [(NSMutableDictionary *)dualRadioCounterpartDevicesDict objectForKeyedSubscript:v22];

  if (v23) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v14;
  }
  if (v23 && (v14 & 1) == 0)
  {
    v25 = self->_dualRadioCounterpartDevicesDict;
    BOOL v26 = [v12 identifier];
    long long v27 = [(NSMutableDictionary *)v25 objectForKeyedSubscript:v26];
    uint64_t v24 = [v27 connected];
  }
  int v40 = 0;
  if ([v12 isMyDevice]
    && ([v12 isApplePencil:&v40] & 1) == 0
    && [v12 isLimitedConnectivityDevice])
  {
    [v10 setHasLimitedConnectivity:1];
  }
  long long v28 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    long long v29 = [v10 title];
    *(_DWORD *)buf = 138413058;
    long long v43 = v29;
    __int16 v44 = 1024;
    int v45 = v13;
    __int16 v46 = 1024;
    int v47 = v24;
    __int16 v48 = 2112;
    __int16 v49 = v12;
    _os_log_impl(&dword_23EB2E000, v28, OS_LOG_TYPE_INFO, "Setting cell \"%@\" paired %d and connected %d, device:%@", buf, 0x22u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
    long long v31 = [v12 identifier];
    long long v32 = [(NSMutableDictionary *)ctkdCounterpartDevicesDict objectForKeyedSubscript:v31];

    uint64_t v33 = [v32 shouldDenyIncomingClassicConnection];
  }
  else
  {
    if ([v12 shouldDenyIncomingClassicConnection])
    {
      uint64_t v33 = 1;
      goto LABEL_32;
    }
    long long v32 = [v12 relatedFutureRadioAddress];
    uint64_t v33 = v32 != 0;
  }

LABEL_32:
  [v10 setDeviceStatePaired:v13 andConnected:v24 andPendingSetup:v33];
  if (self->_bluetoothIsBusy)
  {
    long long v34 = [v12 identifier];
    uint64_t v35 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    int v36 = [v34 isEqualToString:v35];

    if (v36)
    {
      if (v13) {
        uint64_t v37 = 4;
      }
      else {
        uint64_t v37 = 1;
      }
      [v10 setDeviceState:v37];
    }
  }

LABEL_39:

  return v7;
}

- (BTSDevicesController)init
{
  v71[2] = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)BTSDevicesController;
  v2 = [(BTSDevicesController *)&v68 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263EFF910] date];
    [v3 timeIntervalSince1970];
    srandom(v4);

    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    ctkdCounterpartDevicesDict = v2->_ctkdCounterpartDevicesDict;
    v2->_ctkdCounterpartDevicesDict = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dualRadioCounterpartDevicesDict = v2->_dualRadioCounterpartDevicesDict;
    v2->_dualRadioCounterpartDevicesDict = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingOtherRadioDevicesDict = v2->_pendingOtherRadioDevicesDict;
    v2->_pendingOtherRadioDevicesDict = v9;

    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    devicesDict = v2->_devicesDict;
    v2->_devicesDict = v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sharingDevicesDict = v2->_sharingDevicesDict;
    v2->_sharingDevicesDict = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    ctkdLeDevicesDict = v2->_ctkdLeDevicesDict;
    v2->_ctkdLeDevicesDict = v15;

    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceAccessDevicesDict = v2->_deviceAccessDevicesDict;
    v2->_deviceAccessDevicesDict = v17;

    long long v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingDAInfoDevicesDict = v2->_pendingDAInfoDevicesDict;
    v2->_pendingDAInfoDevicesDict = v19;

    long long v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    retrievedHealthServices = v2->_retrievedHealthServices;
    v2->_retrievedHealthServices = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connectedPoorBehaviorDevices = v2->_connectedPoorBehaviorDevices;
    v2->_connectedPoorBehaviorDevices = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connectedFirmwareUpdateRequiredDevices = v2->_connectedFirmwareUpdateRequiredDevices;
    v2->_connectedFirmwareUpdateRequiredDevices = v25;

    long long v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connectedHIDDevices = v2->_connectedHIDDevices;
    v2->_connectedHIDDevices = v27;

    v2->_mainFooterNeedsUpdate = 0;
    v2->_shouldRestorePreviousScanningState = 0;
    Boolean keyExistsAndHasValidFormat = 0;
    LODWORD(v3) = CFPreferencesGetAppBooleanValue(@"enableHealthDevices", @"com.apple.bluetooth", &keyExistsAndHasValidFormat);
    int v29 = _os_feature_enabled_impl();
    if (v3) {
      int v30 = v29;
    }
    else {
      int v30 = 0;
    }
    if (keyExistsAndHasValidFormat) {
      int v31 = v30;
    }
    else {
      int v31 = 0;
    }
    long long v32 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v33 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEE0]];
    if (v31)
    {
      long long v34 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEED8]];
      uint64_t v35 = objc_msgSend(v32, "arrayWithObjects:", v33, v34, 0);
      healthServices = v2->_healthServices;
      v2->_healthServices = (NSArray *)v35;
    }
    else
    {
      uint64_t v37 = objc_msgSend(v32, "arrayWithObjects:", v33, 0);
      long long v34 = v2->_healthServices;
      v2->_healthServices = (NSArray *)v37;
    }

    [(BTSDevicesController *)v2 registerForNotifications];
    id v38 = objc_alloc(MEMORY[0x263EFEF00]);
    uint64_t v39 = *MEMORY[0x263EFEE80];
    v70[0] = *MEMORY[0x263EFED30];
    v70[1] = v39;
    v71[0] = MEMORY[0x263EFFA88];
    v71[1] = MEMORY[0x263EFFA88];
    int v40 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    uint64_t v41 = [v38 initWithDelegate:v2 queue:MEMORY[0x263EF83A0] options:v40];
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v41;

    long long v43 = [(CBCentralManager *)v2->_centralManager sharedPairingAgent];
    [v43 setDelegate:v2];

    if ([MEMORY[0x263F0A410] isHealthDataAvailable])
    {
      __int16 v44 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EB2E000, v44, OS_LOG_TYPE_INFO, "HealthKit is supported", buf, 2u);
      }

      uint64_t v45 = objc_opt_new();
      healthKitStore = v2->_healthKitStore;
      v2->_healthKitStore = (HKHealthStore *)v45;

      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        int v47 = v2->_healthKitStore;
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __28__BTSDevicesController_init__block_invoke;
        v65[3] = &unk_26503DA68;
        uint64_t v66 = v2;
        [(HKHealthStore *)v47 healthServicePairingsWithHandler:v65];
      }
    }
    if (_os_feature_enabled_impl())
    {
      __int16 v48 = (DASession *)objc_alloc_init(MEMORY[0x263F397F8]);
      deviceAccessSessiouint64_t n = v2->_deviceAccessSession;
      v2->_deviceAccessSessiouint64_t n = v48;

      [(DASession *)v2->_deviceAccessSession setDispatchQueue:MEMORY[0x263EF83A0]];
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v2);
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __28__BTSDevicesController_init__block_invoke_2;
      v63[3] = &unk_26503DA90;
      objc_copyWeak(&v64, (id *)buf);
      [(DASession *)v2->_deviceAccessSession setEventHandler:v63];
      [(DASession *)v2->_deviceAccessSession activate];
      objc_destroyWeak(&v64);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v50 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EB2E000, v50, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", buf, 2u);
      }
    }
    v51 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[BTSDevicesController init]";
      _os_log_impl(&dword_23EB2E000, v51, OS_LOG_TYPE_DEFAULT, "%s exposure notification init", buf, 0xCu);
    }

    uint64_t v52 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x263F30E50]);
    carplayStatus = v2->_carplayStatus;
    v2->_carplayStatus = v52;

    [(CARSessionStatus *)v2->_carplayStatus setSessionObserver:v2];
    v2->_scanningPausedForCarPlay = 0;
    v54 = (void *)MGGetStringAnswer();
    v55 = v54;
    if (v54 && [v54 isEqualToString:@"iPhone"])
    {
      v56 = (ENManager *)objc_alloc_init(MEMORY[0x263F04CE0]);
      exposureNotificationManager = v2->_exposureNotificationManager;
      v2->_exposureNotificationManager = v56;

      uint64_t v58 = v2->_exposureNotificationManager;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __28__BTSDevicesController_init__block_invoke_248;
      v61[3] = &unk_26503DAB8;
      v62 = v2;
      [(ENManager *)v58 activateWithCompletionHandler:v61];
      CFRelease(v55);
    }
    if (notify_register_check("com.apple.bluetooth.settings.app-state", &v2->_bluetoothSettingsAppStateNotifyToken))
    {
      v59 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        -[BTSDevicesController init](v59);
      }
    }
    [(BTSDevicesController *)v2 notifyBluetoothSettingsAppStateIsActive:1];
  }
  return v2;
}

void __28__BTSDevicesController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __28__BTSDevicesController_init__block_invoke_cold_1();
    }
  }
  else if ([v5 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__BTSDevicesController_init__block_invoke_233;
    v8[3] = &unk_26503DA40;
    uint64_t v9 = *(id *)(a1 + 32);
    id v10 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);

    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_DEFAULT, "Found no known health devices", buf, 2u);
    }
  }
}

uint64_t __28__BTSDevicesController_init__block_invoke_233(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrievedRegisteredHealthDevices:*(void *)(a1 + 40)];
}

void __28__BTSDevicesController_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleDASessionEvent:v3];
}

uint64_t __28__BTSDevicesController_init__block_invoke_248(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1530) = [*(id *)(*(void *)(a1 + 32) + 1656) exposureNotificationEnabled];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  double v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self];

  [(BTSDevicesController *)self allowBluetoothConnections:0];
  [(BTAlert *)self->_alert dismiss];
  id v5 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  [v5 setDelegate:0];

  [(CBCentralManager *)self->_centralManager setDelegate:0];
  [(DASession *)self->_deviceAccessSession invalidate];
  deviceAccessSessiouint64_t n = self->_deviceAccessSession;
  self->_deviceAccessSessiouint64_t n = 0;

  [(CARSessionStatus *)self->_carplayStatus setSessionObserver:0];
  if (self->_netClient) {
    _NETRBClientDestroy();
  }
  [(ENManager *)self->_exposureNotificationManager invalidate];
  exposureNotificationManager = self->_exposureNotificationManager;
  self->_exposureNotificationManager = 0;

  [(BTSDevicesController *)self notifyBluetoothSettingsAppStateIsActive:0];
  notify_cancel(self->_bluetoothSettingsAppStateNotifyToken);
  v8.receiver = self;
  v8.super_class = (Class)BTSDevicesController;
  [(BTSDevicesController *)&v8 dealloc];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [v11 objectForKey:@"path"];
  objc_super v8 = [v11 objectForKey:@"root"];
  if ([v7 length])
  {
    if ([v7 isEqualToString:@"AccessoryDetail"])
    {
      uint64_t v9 = [v11 objectForKeyedSubscript:@"identifier"];
      pendingSetupDeviceID = self->_pendingSetupDeviceID;
      self->_pendingSetupDeviceID = v9;

      [(BTSDevicesController *)self fetchDADevices];
    }
    else if (![v7 isEqualToString:@"AwaitIncomingConnection"])
    {
      goto LABEL_6;
    }
    [(BTSDevicesController *)self reloadSpecifiers];
  }
LABEL_6:
  v6[2](v6);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)BTSDevicesController;
  [(BTSDevicesController *)&v7 viewDidLoad];
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"MainGroupFooterId"];
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  managedByWalletDictionary = self->managedByWalletDictionary;
  self->managedByWalletDictionary = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  supportsBackgroundNIDictionary = self->supportsBackgroundNIDictionary;
  self->supportsBackgroundNIDictionary = v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BTSDevicesController;
  [(BTSDevicesController *)&v5 viewWillAppear:a3];
  if (self->_shouldRestorePreviousScanningState)
  {
    double v4 = [MEMORY[0x263F2B998] sharedInstance];
    [v4 setDeviceScanningEnabled:self->_allowScanning];

    self->_shouldRestorePreviousScanningState = 0;
  }
  if (_os_feature_enabled_impl())
  {
    [(BTSDevicesController *)self fetchDADevices];
    if (self->_power) {
      [(BTSDevicesController *)self reloadSpecifiers];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v4 = [(BTSDevicesController *)self navigationController];
  objc_super v5 = [v4 topViewController];
  id v6 = [v5 childViewControllers];
  objc_super v7 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v9 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      uint64_t v15 = self;
      _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_DEFAULT, "Unsubscribing from notifications because view controller was popped from the stack: BTSDevicesController instance %p", (uint8_t *)&v14, 0xCu);
    }

    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 removeObserver:self];

    id v11 = [MEMORY[0x263F087C8] defaultCenter];
    [v11 removeObserver:self];

    [(BTSDevicesController *)self allowBluetoothConnections:0];
    [(BTAlert *)self->_alert dismiss];
    uint64_t v12 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    [v12 setDelegate:0];

    [(CBCentralManager *)self->_centralManager setDelegate:0];
    [(DASession *)self->_deviceAccessSession invalidate];
    deviceAccessSessiouint64_t n = self->_deviceAccessSession;
    self->_deviceAccessSessiouint64_t n = 0;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  double v4 = objc_msgSend(MEMORY[0x263F2B998], "sharedInstance", a3);
  [v4 setDeviceScanningEnabled:0];

  self->_shouldRestorePreviousScanningState = 1;
  pendingSetupDeviceID = self->_pendingSetupDeviceID;
  self->_pendingSetupDeviceID = 0;
}

- (void)applicationWillTerminate:(id)a3
{
}

- (void)applicationWillResignActive:(id)a3
{
  [(BTSDevicesController *)self notifyBluetoothSettingsAppStateIsActive:0];
  [(BTSDevicesController *)self allowBluetoothConnections:0];
  self->_togglingPower = 0;
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setEnabled:1];
  [(BTSDevicesController *)self setBluetoothIsBusy:0];
  [(BTSDevicesController *)self cleanupPairing];

  [(BTSDevicesController *)self cleanupAlerts];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)applicationDidBecomeActive:(id)a3
{
  [(BTSDevicesController *)self notifyBluetoothSettingsAppStateIsActive:1];

  [(BTSDevicesController *)self allowBluetoothConnections:1];
}

- (void)applicationWillEnterForeground:(id)a3
{
  double v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_23EB2E000, v4, OS_LOG_TYPE_DEFAULT, "applicationWillEnterForeground. Re-register for bluetooth notifications", v5, 2u);
  }

  [(BTSDevicesController *)self notifyBluetoothSettingsAppStateIsActive:1];
  if (!self->_uiRefreshed) {
    [(BTSDevicesController *)self refreshUI];
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  double v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_23EB2E000, v4, OS_LOG_TYPE_DEFAULT, "applicationDidEnterBackground. Deregister for bluetooth notifications", v12, 2u);
  }

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  id v6 = [MEMORY[0x263F087C8] defaultCenter];
  [v6 removeObserver:self];

  objc_super v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F833C0] object:0];

  objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_applicationWillTerminate_ name:*MEMORY[0x263F833C8] object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];

  id v11 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  [v11 setDelegate:0];

  [(CBCentralManager *)self->_centralManager setDelegate:0];
  self->_uiRefreshed = 0;
}

- (void)notifyBluetoothSettingsAppStateIsActive:(BOOL)a3
{
  notify_set_state([(BTSDevicesController *)self bluetoothSettingsAppStateNotifyToken], a3);

  notify_post("com.apple.bluetooth.settings.app-state");
}

- (BOOL)isMainSettingsPane
{
  return self->_invokingClientID == 0;
}

- (unsigned)connectedLEAudio1DeviceCount
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:MEMORY[0x263EFFA68] allowAll:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned __int8 v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 hasTag:@"IsHearingAid"])
        {
          uint64_t v9 = [v8 customProperty:@"LEAVersion"];
          id v10 = v9;
          if (!v9 || [v9 isEqualToString:@"1"]) {
            ++v5;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDisplayDevice:(id)a3
{
  return 1;
}

- (BOOL)classicDeviceIsApple:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 vendorIdSrc]
    && ([v3 vendorId] == 1452 || objc_msgSend(v3, "vendorId") == 76)
    || [v3 vendorIdSrc] == 2 && objc_msgSend(v3, "vendorId") == 1452
    || [v3 vendorIdSrc] == 1 && objc_msgSend(v3, "vendorId") == 76;

  return v4;
}

- (BOOL)isClassicAudioDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 type] == 16
    || [v3 type] == 17
    || [v3 type] == 19
    || [v3 type] == 20
    || [v3 type] == 47
    || [v3 type] == 22
    || [v3 type] == 21
    || [v3 type] == 23;

  return v4;
}

- (void)powerChanged
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F2B998] sharedInstance];
  int v4 = [v3 enabled];

  if ([(CBCentralManager *)self->_centralManager state] == 5)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if ((v4 ^ ([(CBCentralManager *)self->_centralManager state] == 10)))
  {
    goto LABEL_8;
  }
  if (self->_power != v4)
  {
    self->_power = v4;
    self->_togglingPower = 0;
    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setEnabled:1];
    [(BTSDevicesController *)self setBluetoothIsBusy:0];
    self->_mainFooterNeedsUpdate = 1;
    [(BTSDevicesController *)self updateUI:self->_power];
    if (self->_bluetoothInitialized) {
      [(BTSDevicesController *)self allowBluetoothConnections:self->_power];
    }
  }
LABEL_8:
  unsigned __int8 v5 = [(BTSDevicesController *)self specifierForID:@"BLUETOOTH"];
  [(BTSDevicesController *)self reloadSpecifier:v5];

  if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v6 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    objc_super v7 = [v6 retrievePairedPeers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v30 = 0;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v13 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v12;
            _os_log_impl(&dword_23EB2E000, v13, OS_LOG_TYPE_DEFAULT, "Paired Peripheral: %@", buf, 0xCu);
          }

          long long v14 = [(BTSDevicesController *)self _getDeviceForPeripheral:v12];
          if (v14)
          {
            [v12 setDelegate:self];
            if ([v14 isManagedByDeviceAccess])
            {
              long long v15 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v41 = v14;
                _os_log_impl(&dword_23EB2E000, v15, OS_LOG_TYPE_DEFAULT, "We're waiting for DADevices from DADaemon, delay display of these DA managed peripherals until we have the DADevice: %@", buf, 0xCu);
              }
            }
            else
            {
              [(BTSDevicesController *)self _addDevice:v14];
              if ([v14 connected])
              {
                if ([v14 isLimitedConnectivityDevice])
                {
                  [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v14];
                  self->_mainFooterNeedsUpdate = 1;
                }
                if ([v14 isFirmwareUpdateRequiredDevice])
                {
                  [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices addObject:v14];
                  self->_mainFooterNeedsUpdate = 1;
                }
                if ([v14 isHIDDevice])
                {
                  [(NSMutableSet *)self->_connectedHIDDevices addObject:v14];
                  self->_mainFooterNeedsUpdate = 1;
                }
              }
            }
          }
          else
          {
            uint64_t v16 = [(BTSDevicesController *)self _getDeviceForCTKDPeripheral:v12];
            uint64_t v17 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v12;
              _os_log_impl(&dword_23EB2E000, v17, OS_LOG_TYPE_DEFAULT, "CTKD Paired device : %@", buf, 0xCu);
            }

            if (v16)
            {
              [v12 setDelegate:self];
              char v30 = 1;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v9);
    }
    else
    {
      char v30 = 0;
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          if ([v23 connectedTransport] == 2)
          {
            uint64_t v24 = [(BTSDevicesController *)self _getDeviceForPeripheral:v23];
            if (v24)
            {
              if ([v23 visibleInSettings])
              {
                [v23 setDelegate:self];
                int v25 = [v24 isManagedByDeviceAccess];
                BOOL v26 = sharedBluetoothSettingsLogComponent();
                BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
                if (v25)
                {
                  if (v27)
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v41 = v24;
                    long long v28 = v26;
                    int v29 = "We're waiting for DADevices from DADaemon, delay display of these DA managed peripherals until"
                          " we have the DADevice: %@";
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
                if (v27)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v41 = v23;
                  _os_log_impl(&dword_23EB2E000, v26, OS_LOG_TYPE_DEFAULT, "Peripheral %@ will be added to Settings.", buf, 0xCu);
                }

                [(BTSDevicesController *)self _addDevice:v24];
              }
              else
              {
                BOOL v26 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v41 = v23;
                  long long v28 = v26;
                  int v29 = "Peripheral %@ should not be visible in Settings. Ignoring.";
LABEL_51:
                  _os_log_impl(&dword_23EB2E000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
                }
LABEL_52:
              }
            }

            continue;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    [(BTSDevicesController *)self _updateHealthDevices];
    [(BTSDevicesController *)self _setupCentralScanning];
    if (self->_mainFooterNeedsUpdate | v30 & 1) {
      [(BTSDevicesController *)self reloadSpecifiers];
    }
  }
}

- (void)powerChangedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [MEMORY[0x263F2B998] sharedInstance];
  int v6 = [v5 enabled];

  objc_super v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    uint64_t v9 = (void *)v8;
    uint64_t v10 = "off";
    if (v6) {
      uint64_t v10 = "on";
    }
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    long long v14 = v10;
    _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);
  }
  [(BTSDevicesController *)self powerChanged];
}

- (void)deviceDiscoveredHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v17 = 136315650;
    id v18 = "-[BTSDevicesController deviceDiscoveredHandler:]";
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_INFO, "%s received %@ for device %@", (uint8_t *)&v17, 0x20u);
  }
  if (self->_power && !self->_togglingPower)
  {
    uint64_t v9 = +[BTSDeviceClassic deviceWithDevice:v5];
    devicesDict = self->_devicesDict;
    int v11 = [v5 address];
    uint64_t v12 = [(NSMutableDictionary *)devicesDict objectForKey:v11];

    if (v12)
    {
      __int16 v13 = [v9 identifier];
      long long v14 = [(BTSDevicesController *)self specifierForID:v13];

      if (!v14)
      {
        uint64_t v15 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_23EB2E000, v15, OS_LOG_TYPE_INFO, "Device exists in our list without a specifier. Add the specifier", (uint8_t *)&v17, 2u);
        }

        uint64_t v16 = [(BTSDevicesController *)self _specifierForDevice:v9];
        [(BTSDevicesController *)self _addDeviceSpecifier:v16 withDevice:v9];
      }
    }
    else
    {
      [(BTSDevicesController *)self _addDevice:v9];
    }
  }
}

- (void)devicePairedHandler:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    *(_DWORD *)buf = 136315906;
    *(void *)v59 = "-[BTSDevicesController devicePairedHandler:]";
    *(_WORD *)&v59[8] = 2112;
    *(void *)&v59[10] = v7;
    __int16 v60 = 2112;
    uint64_t v61 = v8;
    __int16 v62 = 2048;
    v63 = self;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", buf, 0x2Au);
  }
  uint64_t v9 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
  uint64_t v10 = [v9 objectForKey:@"PIN-ended"];

  if (self->_power && !self->_togglingPower)
  {
    int v11 = [v5 address];
    uint64_t v12 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    if ([v11 isEqualToString:v12])
    {
    }
    else
    {
      pendingOtherRadioDevicesDict = self->_pendingOtherRadioDevicesDict;
      long long v14 = [v5 address];
      uint64_t v15 = [(NSMutableDictionary *)pendingOtherRadioDevicesDict objectForKeyedSubscript:v14];

      if (v15)
      {
        uint64_t v16 = +[BTSDeviceClassic deviceWithDevice:v5];
        [(BTSDevicesController *)self _addDevice:v16];

        int v17 = +[BTSDeviceClassic deviceWithDevice:v5];
        [(BTSDevicesController *)self _updateDevicePosition:v17];
        goto LABEL_54;
      }
    }
    [(BTSDevicesController *)self cleanupPairing];
    id v18 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    __int16 v19 = [v18 objectForKey:@"reverse-pairing"];
    int v20 = [v19 BOOLValue];

    if (v20) {
      [(BTSDevicesController *)self setBluetoothIsBusy:0];
    }
    __int16 v21 = [v4 name];
    int v22 = [v21 isEqualToString:*MEMORY[0x263F2B958]];

    if (v22)
    {
      if (self->_alert || ([v10 isEqualToString:@"cancelled"] & 1) != 0)
      {
LABEL_49:
        uint64_t v50 = objc_msgSend(MEMORY[0x263F2B998], "sharedInstance", v52, v53, v54, v55, v56);
        if ([v50 wasDeviceDiscovered:v5])
        {
        }
        else
        {
          char v51 = [v5 paired];

          if ((v51 & 1) == 0)
          {
            int v17 = +[BTSDeviceClassic deviceWithDevice:v5];
            [(BTSDevicesController *)self _removeDevice:v17];
            goto LABEL_54;
          }
        }
        int v17 = [v5 address];
        [(BTSDevicesController *)self reloadSpecifierID:v17];
LABEL_54:

        goto LABEL_55;
      }
      uint64_t v23 = [BTAlert alloc];
      uint64_t v24 = +[BTSDeviceClassic deviceWithDevice:v5];
      int v25 = [(BTAlert *)v23 initWithDevice:v24];
      alert = self->_alert;
      self->_alert = v25;

      BOOL v27 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = self->_alert;
        *(_DWORD *)buf = 138412290;
        *(void *)v59 = v28;
        _os_log_impl(&dword_23EB2E000, v27, OS_LOG_TYPE_DEFAULT, "Pairing failed BTAlert : %@", buf, 0xCu);
      }

      [(BTAlert *)self->_alert setDelegate:self];
      if (v10) {
        goto LABEL_39;
      }
      sspAlert = self->_sspAlert;
      if (sspAlert
        && [(BTSSPPairingRequest *)sspAlert pairingStyle] != 2
        && [(BTSSPPairingRequest *)self->_sspAlert pairingStyle] != 3)
      {
        goto LABEL_21;
      }
      char v30 = [(BTSDevicesController *)self rootController];
      long long v31 = [v30 visibleViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_39:
        if (![v10 isEqualToString:@"entered"])
        {
          int v47 = [v4 userInfo];
          __int16 v46 = [v47 objectForKey:*MEMORY[0x263F2B938]];

          goto LABEL_43;
        }
        long long v33 = NSNumber;
        uint64_t v34 = 156;
      }
      else
      {
LABEL_21:
        long long v33 = NSNumber;
        uint64_t v34 = 1;
      }
      __int16 v46 = [v33 numberWithUnsignedInt:v34];
LABEL_43:
      __int16 v48 = [(BTSDevicesController *)self transitionCoordinator];
      if (v48)
      {
        __int16 v49 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EB2E000, v49, OS_LOG_TYPE_DEFAULT, "UIViewController is currently displaying or dismissing an UIAlertCOntroller", buf, 2u);
        }

        uint64_t v52 = MEMORY[0x263EF8330];
        uint64_t v53 = 3221225472;
        v54 = __44__BTSDevicesController_devicePairedHandler___block_invoke;
        v55 = &unk_26503DAE0;
        v56 = self;
        id v57 = v46;
        [v48 animateAlongsideTransition:0 completion:&v52];
      }
      else
      {
        [(BTAlert *)self->_alert showAlertWithResult:v46];
      }

      goto LABEL_49;
    }
    long long v35 = self->_pendingOtherRadioDevicesDict;
    long long v36 = [v5 address];
    long long v37 = [(NSMutableDictionary *)v35 objectForKeyedSubscript:v36];

    if (v37) {
      goto LABEL_24;
    }
    long long v38 = +[BTSDeviceClassic deviceWithDevice:v5];
    [(BTSDevicesController *)self _updateDevicePosition:v38];

    uint64_t v39 = [v4 name];
    int v40 = [v39 isEqualToString:*MEMORY[0x263F2B960]];

    if (v40) {
LABEL_24:
    }
      [(BTSDevicesController *)self reloadSpecifiers];
    int v41 = [v5 type];
    int v42 = [v5 isServiceSupported:2];
    unsigned int v43 = [v5 syncSettings];
    if ([(BTSDevicesController *)self isiPhone]
      && ([v5 isServiceSupported:0x40000] & 1) == 0
      && ([v5 type] == 22 || objc_msgSend(v5, "type") == 17))
    {
      [v5 setSyncSettings:v43 & 0xFFFF00FF];
      [(BTSDevicesController *)self showSyncContactsPrivacyPopup:v5];
    }
    else
    {
      __int16 v44 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = "not";
        if (v42) {
          uint64_t v45 = "";
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v59 = v41;
        *(_WORD *)&v59[4] = 2080;
        *(void *)&v59[6] = v45;
        _os_log_impl(&dword_23EB2E000, v44, OS_LOG_TYPE_DEFAULT, "Contact privacy alert ignored for device type : %x with phonebook service %s supported", buf, 0x12u);
      }

      [v5 setSyncSettings:v43 | 0x100000000];
    }
    if ([v5 vendorId] == 76
      && [v5 productId] >= 0x2007
      && [v5 productId] <= 0x2008)
    {
      [(BTSDevicesController *)self showUpgradeOSPopup:v5];
    }
  }
LABEL_55:
}

uint64_t __44__BTSDevicesController_devicePairedHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1560) showAlertWithResult:*(void *)(a1 + 40)];
}

- (void)deviceUpdatedHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v17 = 136315650;
    id v18 = "-[BTSDevicesController deviceUpdatedHandler:]";
    __int16 v19 = 2112;
    int v20 = v7;
    __int16 v21 = 2112;
    int v22 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_INFO, "%s received %@ for device %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"BluetoothDeviceUpdatedNotificationConfig" object:v5];

  if (self->_power && !self->_togglingPower)
  {
    devicesDict = self->_devicesDict;
    int v11 = [v5 address];
    uint64_t v12 = [(NSMutableDictionary *)devicesDict objectForKey:v11];

    if (v12)
    {
      __int16 v13 = [v5 address];
      long long v14 = [(BTSDevicesController *)self specifierForID:v13];

      uint64_t v15 = [v5 name];
      [(PSSpecifier *)v14 setName:v15];
      [(PSSpecifier *)v14 setProperty:v15 forKey:*MEMORY[0x263F602D0]];
      if (self->_bluetoothIsBusy && v14 == self->_currentDeviceSpecifier && [v5 paired]) {
        [(BTSDevicesController *)self setBluetoothIsBusy:0];
      }
      uint64_t v16 = +[BTSDeviceClassic deviceWithDevice:v5];
      [(BTSDevicesController *)self _updateDevicePosition:v16];
    }
  }
}

- (void)deviceConnectedHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v29 = 136315906;
    char v30 = "-[BTSDevicesController deviceConnectedHandler:]";
    __int16 v31 = 2112;
    long long v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    long long v36 = self;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", (uint8_t *)&v29, 0x2Au);
  }
  if (self->_power && !self->_togglingPower)
  {
    uint64_t v9 = [v5 address];
    uint64_t v10 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_15;
    }
    [(BTSDevicesController *)self cleanupPairing];
    uint64_t v12 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    __int16 v13 = [v12 objectForKey:@"PIN-ended"];

    long long v14 = [v4 name];
    if ([v14 isEqualToString:*MEMORY[0x263F2B8F8]]
      && !self->_alert
      && ([v13 isEqualToString:@"cancelled"] & 1) == 0)
    {
      char v15 = [v5 connected];

      if (v15)
      {
LABEL_14:
        [(BTSDevicesController *)self setBluetoothIsBusy:0];
        [(BTSDevicesController *)self allowBluetoothScans:1];

LABEL_15:
        if ([v5 isTemporaryPaired])
        {
          [(BTSDevicesController *)self reloadSpecifiers];
        }
        else
        {
          BOOL v27 = [v5 address];
          [(BTSDevicesController *)self reloadSpecifierID:v27];

          long long v28 = +[BTSDeviceClassic deviceWithDevice:v5];
          if ([v28 connected])
          {
            if ([v28 isLimitedConnectivityDevice])
            {
              [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v28];
              self->_mainFooterNeedsUpdate = 1;
              [(BTSDevicesController *)self updateMainGroupFooter];
            }
            if ([v28 isHIDDevice])
            {
              [(NSMutableSet *)self->_connectedHIDDevices addObject:v28];
              self->_mainFooterNeedsUpdate = 1;
              [(BTSDevicesController *)self updateMainGroupFooter];
            }
          }
        }
        goto LABEL_23;
      }
      uint64_t v16 = [BTAlert alloc];
      int v17 = +[BTSDeviceClassic deviceWithDevice:v5];
      id v18 = [(BTAlert *)v16 initWithDevice:v17];
      alert = self->_alert;
      self->_alert = v18;

      int v20 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = self->_alert;
        int v29 = 138412290;
        char v30 = (const char *)v21;
        _os_log_impl(&dword_23EB2E000, v20, OS_LOG_TYPE_DEFAULT, "deviceConnected BTAlert : %@", (uint8_t *)&v29, 0xCu);
      }

      [(BTAlert *)self->_alert setDelegate:self];
      int v22 = [v4 userInfo];
      uint64_t v23 = *MEMORY[0x263F2B938];
      uint64_t v24 = [v22 objectForKey:*MEMORY[0x263F2B938]];
      [v24 unsignedIntValue];

      int v25 = self->_alert;
      long long v14 = [v4 userInfo];
      BOOL v26 = [v14 objectForKey:v23];
      [(BTAlert *)v25 showAlertWithResult:v26];
    }
    goto LABEL_14;
  }
LABEL_23:
}

- (void)deviceDisconnectedHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v11 = 136315650;
    uint64_t v12 = "-[BTSDevicesController deviceDisconnectedHandler:]";
    __int16 v13 = 2112;
    long long v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);
  }
  if (self->_power && !self->_togglingPower)
  {
    if ([v5 isTemporaryPaired])
    {
      [(BTSDevicesController *)self reloadSpecifiers];
    }
    else
    {
      uint64_t v9 = [v5 address];
      [(BTSDevicesController *)self reloadSpecifierID:v9];

      uint64_t v10 = +[BTSDeviceClassic deviceWithDevice:v5];
      if ([(NSMutableSet *)self->_connectedPoorBehaviorDevices containsObject:v10])
      {
        [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeObject:v10];
        self->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)self updateMainGroupFooter];
      }
      if ([(NSMutableSet *)self->_connectedHIDDevices containsObject:v10])
      {
        [(NSMutableSet *)self->_connectedHIDDevices removeObject:v10];
        self->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)self updateMainGroupFooter];
      }
    }
  }
}

- (void)deviceRemovedHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v13 = 136315650;
    long long v14 = "-[BTSDevicesController deviceRemovedHandler:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v13, 0x20u);
  }
  if (self->_power && !self->_togglingPower && ([v5 paired] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F2B998] sharedInstance];
    uint64_t v10 = [v9 connectingDevices];
    char v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = +[BTSDeviceClassic deviceWithDevice:v5];
      [(BTSDevicesController *)self _removeDevice:v12];
    }
  }
}

- (void)deviceUnpairedHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v14 = 136315650;
    __int16 v15 = "-[BTSDevicesController deviceUnpairedHandler:]";
    __int16 v16 = 2112;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v9 = [MEMORY[0x263F2B998] sharedInstance];
  char v10 = [v9 wasDeviceDiscovered:v5];

  char v11 = sharedBluetoothSettingsLogComponent();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      int v14 = 138412290;
      __int16 v15 = (const char *)v5;
      _os_log_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_INFO, "Device %@ was unpaired and was discovered - updating position", (uint8_t *)&v14, 0xCu);
    }

    int v13 = +[BTSDeviceClassic deviceWithDevice:v5];
    [(BTSDevicesController *)self _updateDevicePosition:v13];
  }
  else
  {
    if (v12)
    {
      int v14 = 138412290;
      __int16 v15 = (const char *)v5;
      _os_log_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_INFO, "Device %@ was unpaired and wasn't discovered - removing", (uint8_t *)&v14, 0xCu);
    }

    int v13 = +[BTSDeviceClassic deviceWithDevice:v5];
    [(BTSDevicesController *)self _removeDevice:v13];
  }
}

- (void)authenticationRequestHandler:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_power && !self->_togglingPower)
  {
    unsigned __int8 v5 = [(BTSDevicesController *)self rootController];
    int v6 = [v5 visibleViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || self->_sspAlert || self->_alert)
    {

      goto LABEL_7;
    }
    syncContactsCarplayAlert = self->_syncContactsCarplayAlert;

    if (syncContactsCarplayAlert)
    {
LABEL_7:
      objc_super v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BTSDevicesController authenticationRequestHandler:]();
      }
      goto LABEL_9;
    }
    uint64_t v9 = [v4 name];
    uint64_t v10 = *MEMORY[0x263F2B978];
    if ([v9 isEqualToString:*MEMORY[0x263F2B978]])
    {
    }
    else
    {
      char v11 = [v4 name];
      int v12 = [v11 isEqualToString:*MEMORY[0x263F2B968]];

      if (!v12)
      {
        objc_super v7 = [v4 object];
LABEL_17:
        int v14 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [v4 name];
          __int16 v16 = [v7 name];
          *(_DWORD *)buf = 136315906;
          v67 = "-[BTSDevicesController authenticationRequestHandler:]";
          __int16 v68 = 2112;
          v69 = v15;
          __int16 v70 = 2112;
          v71 = v16;
          __int16 v72 = 2048;
          id v73 = self;
          _os_log_impl(&dword_23EB2E000, v14, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", buf, 0x2Au);
        }
        [(BTSDevicesController *)self setBluetoothIsBusy:1];
        p_currentDeviceSpecifier = &self->_currentDeviceSpecifier;
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        if (currentDeviceSpecifier)
        {
          uint64_t v19 = [(PSSpecifier *)currentDeviceSpecifier userInfo];
          [v19 removeObjectForKey:@"reverse-pairing"];
        }
        else
        {
          if ([v7 majorClass] == 256)
          {
            uint64_t v20 = [v4 userInfo];
            __int16 v21 = [v20 valueForKey:@"delayedPairingForNR"];

            if (!v21)
            {
              v55 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_23EB2E000, v55, OS_LOG_TYPE_INFO, "Delaying incoming pairing attempt from computer to try to retrieve the name…", buf, 2u);
              }

              v56 = (void *)MEMORY[0x263EFF9A0];
              id v57 = [v4 userInfo];
              uint64_t v37 = [v56 dictionaryWithDictionary:v57];

              [v37 setValue:&stru_26F24FEE8 forKey:@"delayedPairingForNR"];
              uint64_t v58 = (void *)MEMORY[0x263F089F8];
              v59 = [v4 name];
              __int16 v60 = [v4 object];
              uint64_t v61 = [v58 notificationWithName:v59 object:v60 userInfo:v37];
              [(BTSDevicesController *)self performSelector:sel_authenticationRequestHandler_ withObject:v61 afterDelay:1.0];

LABEL_55:
LABEL_9:

              goto LABEL_10;
            }
          }
          int v22 = [v7 address];
          uint64_t v19 = [(BTSDevicesController *)self specifierForID:v22];

          uint64_t v23 = sharedBluetoothSettingsLogComponent();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v24)
            {
              *(_DWORD *)buf = 136315394;
              v67 = "-[BTSDevicesController authenticationRequestHandler:]";
              __int16 v68 = 2112;
              v69 = v19;
              _os_log_impl(&dword_23EB2E000, v23, OS_LOG_TYPE_DEFAULT, "%s reverse-pairing attempt from %@", buf, 0x16u);
            }

            objc_storeStrong((id *)&self->_currentDeviceSpecifier, v19);
            [(BTSDevicesController *)self reloadSpecifier:*p_currentDeviceSpecifier];
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 136315138;
              v67 = "-[BTSDevicesController authenticationRequestHandler:]";
              _os_log_impl(&dword_23EB2E000, v23, OS_LOG_TYPE_DEFAULT, "%s reverse-pairing attempt from previously unknown device", buf, 0xCu);
            }

            int v25 = +[BTSDeviceClassic deviceWithDevice:v7];
            uint64_t v26 = [(BTSDevicesController *)self _specifierForDevice:v25];
            BOOL v27 = *p_currentDeviceSpecifier;
            *p_currentDeviceSpecifier = (PSSpecifier *)v26;

            long long v28 = +[BTSDeviceClassic deviceWithDevice:v7];
            [(BTSDevicesController *)self _addDevice:v28];
          }
          int v29 = [(PSSpecifier *)*p_currentDeviceSpecifier userInfo];
          [v29 setObject:*MEMORY[0x263EFFB40] forKey:@"reverse-pairing"];
        }
        char v30 = [(PSSpecifier *)*p_currentDeviceSpecifier userInfo];
        [v30 removeObjectForKey:@"PIN-ended"];

        if (!*p_currentDeviceSpecifier
          || ([v7 address],
              __int16 v31 = objc_claimAutoreleasedReturnValue(),
              [(PSSpecifier *)*p_currentDeviceSpecifier identifier],
              long long v32 = objc_claimAutoreleasedReturnValue(),
              int v33 = [v31 isEqualToString:v32],
              v32,
              v31,
              !v33))
        {
          int v41 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            [(BTSDevicesController *)v41 authenticationRequestHandler:v43];
          }

          goto LABEL_9;
        }
        if ([v7 type] != 24
          || ([v4 name],
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              int v35 = [v34 isEqualToString:*MEMORY[0x263F2B950]],
              v34,
              !v35))
        {
          int v44 = [v7 type];
          if ([(BTSDevicesController *)self isiPad] && (v44 & 0xFFFFFFFB) == 0x19)
          {
            uint64_t v45 = [v4 name];
            uint64_t v46 = *MEMORY[0x263F2B950];
            int v47 = [v45 isEqualToString:*MEMORY[0x263F2B950]];

            if (v47)
            {
              __int16 v48 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_23EB2E000, v48, OS_LOG_TYPE_DEFAULT, "Entering pairing flow for 2.0 mouses/trackpads", buf, 2u);
              }

              __int16 v49 = [[BTSSPPairingRequest alloc] initWithDevice:v7 andSpecifier:*p_currentDeviceSpecifier];
              sspAlert = self->_sspAlert;
              self->_sspAlert = v49;

              [(BTSSPPairingRequest *)self->_sspAlert setPairingStyle:4 andPasskey:0];
              [(BTSSPPairingRequest *)self->_sspAlert setDelegate:self];
              [(BTSSPPairingRequest *)self->_sspAlert show];
              goto LABEL_9;
            }
          }
          else
          {
            uint64_t v46 = *MEMORY[0x263F2B950];
          }
          char v51 = [v4 name];
          int v52 = [v51 isEqualToString:v46];

          if (v52)
          {
            [(BTSDevicesController *)self pinRequestHandler:v4];
          }
          else
          {
            uint64_t v53 = [v4 name];
            int v54 = [v53 isEqualToString:*MEMORY[0x263F2B970]];

            if (v54)
            {
              [(BTSDevicesController *)self sspConfirmationHandler:v4];
            }
            else
            {
              __int16 v62 = [v4 name];
              int v63 = [v62 isEqualToString:v10];

              if (v63)
              {
                [(BTSDevicesController *)self sspNumericComparisonHandler:v4];
              }
              else
              {
                uint64_t v64 = [v4 name];
                int v65 = [v64 isEqualToString:*MEMORY[0x263F2B968]];

                if (v65) {
                  [(BTSDevicesController *)self sspPasskeyDisplayHandler:v4];
                }
              }
            }
          }
          goto LABEL_9;
        }
        long long v36 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EB2E000, v36, OS_LOG_TYPE_DEFAULT, "Entering pairing flow for 2.0 HID device", buf, 2u);
        }

        uint64_t v37 = [NSNumber numberWithInt:((int)random() % 10000)];
        long long v38 = objc_msgSend(NSString, "stringWithFormat:", @"%04u", objc_msgSend(v37, "unsignedIntValue"));
        [v7 setPIN:v38];

        uint64_t v39 = [[BTSSPPairingRequest alloc] initWithDevice:v7 andSpecifier:*p_currentDeviceSpecifier];
        int v40 = self->_sspAlert;
        self->_sspAlert = v39;

        [(BTSSPPairingRequest *)self->_sspAlert setPairingStyle:3 andPasskey:v37];
        [(BTSSPPairingRequest *)self->_sspAlert setDelegate:self];
        [(BTSSPPairingRequest *)self->_sspAlert show];
        goto LABEL_55;
      }
    }
    int v13 = [v4 object];
    objc_super v7 = [v13 valueForKey:@"device"];

    goto LABEL_17;
  }
LABEL_10:
}

- (void)pinRequestHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v11 = 136315650;
    int v12 = "-[BTSDevicesController pinRequestHandler:]";
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = objc_alloc_init(BTSPairSetup);
  *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE88]));
  [(PSRootController *)v9 setRootController:WeakRetained];

  [(PSSetupController *)v9 setParentController:self];
  [(PSRootController *)v9 setSpecifier:self->_currentDeviceSpecifier];
  objc_storeWeak((id *)((char *)self->_currentDeviceSpecifier + (int)*MEMORY[0x263F5FE40]), self);
  [(BTSDevicesController *)self showController:v9];
}

- (void)sspConfirmationHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v4 name];
    uint64_t v8 = [v5 name];
    int v11 = 136315650;
    int v12 = "-[BTSDevicesController sspConfirmationHandler:]";
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = [[BTSSPPairingRequest alloc] initWithDevice:v5 andSpecifier:self->_currentDeviceSpecifier];
  sspAlert = self->_sspAlert;
  self->_sspAlert = v9;

  [(BTSSPPairingRequest *)self->_sspAlert setPairingStyle:0 andPasskey:0];
  [(BTSSPPairingRequest *)self->_sspAlert setDelegate:self];
  [(BTSSPPairingRequest *)self->_sspAlert show];
}

- (void)sspNumericComparisonHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = [v5 valueForKey:@"device"];
  objc_super v7 = [v5 valueForKey:@"value"];
  uint64_t v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v4 name];
    uint64_t v10 = [v6 name];
    int v13 = 136315906;
    int v14 = "-[BTSDevicesController sspNumericComparisonHandler:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = self;
    _os_log_impl(&dword_23EB2E000, v8, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", (uint8_t *)&v13, 0x2Au);
  }
  if ([v6 isServiceSupported:0x40000]
    && [(BTSDevicesController *)self isiPhone]
    && [(BTSDevicesController *)self isCarPlaySetupEnabled])
  {
    [(BTSDevicesController *)self startIncomingCarPlaySetup:v6 andPasskey:v7];
  }
  else
  {
    int v11 = [[BTSSPPairingRequest alloc] initWithDevice:v6 andSpecifier:self->_currentDeviceSpecifier];
    sspAlert = self->_sspAlert;
    self->_sspAlert = v11;

    [(BTSSPPairingRequest *)self->_sspAlert setPairingStyle:1 andPasskey:v7];
    [(BTSSPPairingRequest *)self->_sspAlert setDelegate:self];
    [(BTSSPPairingRequest *)self->_sspAlert show];
  }
}

- (void)sspPasskeyDisplayHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v5 = [v4 object];
  int v6 = [v5 valueForKey:@"device"];
  objc_super v7 = [v5 valueForKey:@"value"];
  uint64_t v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v4 name];
    uint64_t v10 = [v6 name];
    int v13 = 136315650;
    int v14 = "-[BTSDevicesController sspPasskeyDisplayHandler:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    _os_log_impl(&dword_23EB2E000, v8, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v13, 0x20u);
  }
  int v11 = [[BTSSPPairingRequest alloc] initWithDevice:v6 andSpecifier:self->_currentDeviceSpecifier];
  sspAlert = self->_sspAlert;
  self->_sspAlert = v11;

  [(BTSSPPairingRequest *)self->_sspAlert setPairingStyle:2 andPasskey:v7];
  [(BTSSPPairingRequest *)self->_sspAlert setDelegate:self];
  [(BTSSPPairingRequest *)self->_sspAlert show];
}

- (void)bluetoothDenylistChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BTSDevicesController_bluetoothDenylistChanged___block_invoke;
  block[3] = &unk_26503DB08;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__BTSDevicesController_bluetoothDenylistChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v19 = a4;
  objc_super v7 = -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:");
  if (v7)
  {
    [v19 setDelegate:self];
    devicesDict = self->_devicesDict;
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = [(NSMutableDictionary *)devicesDict objectForKey:v9];

    if (v10)
    {
      int v11 = [v7 identifier];
      int v12 = [(BTSDevicesController *)self specifierForID:v11];

      int v13 = [v12 name];
      int v14 = [v7 name];
      char v15 = [v13 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        __int16 v16 = [v7 name];
        [v12 setName:v16];

        __int16 v17 = [v7 name];
        [v12 setProperty:v17 forKey:*MEMORY[0x263F602D0]];
      }
      [(BTSDevicesController *)self _updateDevicePosition:v7];
      __int16 v18 = [v7 identifier];
      [(BTSDevicesController *)self reloadSpecifierID:v18 animated:0];
    }
    else
    {
      [(BTSDevicesController *)self _addDevice:v7];
    }
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  int v6 = [(BTSDevicesController *)self _getDeviceForPeripheral:a4];
  if (v6)
  {
    id v11 = v6;
    objc_super v7 = [v6 identifier];
    uint64_t v8 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    int v9 = [v7 isEqualToString:v8];

    if (v9) {
      [(BTSDevicesController *)self setBluetoothIsBusy:0];
    }
    uint64_t v10 = [v11 identifier];
    [(BTSDevicesController *)self reloadSpecifierID:v10];

    int v6 = v11;
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(BTSDevicesController *)self _getDeviceForPeripheral:v5];
  objc_super v7 = v6;
  if (v6)
  {
    if ([v6 connected])
    {
      uint64_t v8 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v5;
        _os_log_impl(&dword_23EB2E000, v8, OS_LOG_TYPE_INFO, "Discovering services for device %@", (uint8_t *)&v20, 0xCu);
      }

      [v5 setDelegate:self];
      healthServices = self->_healthServices;
      uint64_t v10 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEE8]];
      id v11 = [(NSArray *)healthServices arrayByAddingObject:v10];

      [v5 discoverServices:v11];
      if ([v7 connected])
      {
        if ([v7 isLimitedConnectivityDevice])
        {
          [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v7];
          self->_mainFooterNeedsUpdate = 1;
          [(BTSDevicesController *)self updateMainGroupFooter];
        }
        if ([v7 isFirmwareUpdateRequiredDevice])
        {
          [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices addObject:v7];
          self->_mainFooterNeedsUpdate = 1;
          [(BTSDevicesController *)self updateMainGroupFooter];
        }
        if ([v7 isHIDDevice])
        {
          [(NSMutableSet *)self->_connectedHIDDevices addObject:v7];
          self->_mainFooterNeedsUpdate = 1;
          [(BTSDevicesController *)self updateMainGroupFooter];
        }
      }
    }
    else
    {
      __int16 v16 = [v7 identifier];
      __int16 v17 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
      int v18 = [v16 isEqualToString:v17];

      if (v18) {
        [(BTSDevicesController *)self setBluetoothIsBusy:0];
      }
    }
    [(BTSDevicesController *)self _updateDevicePosition:v7];
    id v19 = [v7 identifier];
    [(BTSDevicesController *)self reloadSpecifierID:v19];

    if (([v7 connected] & 1) == 0)
    {
      if ([(NSMutableSet *)self->_connectedPoorBehaviorDevices containsObject:v7])
      {
        [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeObject:v7];
        self->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)self updateMainGroupFooter];
      }
      if ([(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices containsObject:v7])
      {
        [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices removeObject:v7];
        self->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)self updateMainGroupFooter];
      }
      if ([(NSMutableSet *)self->_connectedHIDDevices containsObject:v7])
      {
        [(NSMutableSet *)self->_connectedHIDDevices removeObject:v7];
        self->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)self updateMainGroupFooter];
      }
    }
  }
  else
  {
    int v12 = [(BTSDevicesController *)self _getDeviceForCTKDPeripheral:v5];
    if (v12)
    {
      int v13 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v5;
        _os_log_impl(&dword_23EB2E000, v13, OS_LOG_TYPE_DEFAULT, "CTKD device %@ connection state updated", (uint8_t *)&v20, 0xCu);
      }

      [(BTSDevicesController *)self _updateDevicePosition:v12];
      int v14 = [v12 classicDevice];
      char v15 = [v14 address];
      [(BTSDevicesController *)self reloadSpecifierID:v15];
    }
  }
}

- (void)_peripheralDidCompletePairing:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  id v5 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [(BTSDevicesController *)self setBluetoothIsBusy:0];
  }
  [(BTSDevicesController *)self _updateDevicePosition:v8];
  objc_super v7 = [v8 identifier];
  [(BTSDevicesController *)self reloadSpecifierID:v7];

  if ([v8 connected])
  {
    if ([v8 isLimitedConnectivityDevice])
    {
      [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v8];
      self->_mainFooterNeedsUpdate = 1;
      [(BTSDevicesController *)self updateMainGroupFooter];
    }
    if ([v8 isFirmwareUpdateRequiredDevice])
    {
      [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices addObject:v8];
      self->_mainFooterNeedsUpdate = 1;
      [(BTSDevicesController *)self updateMainGroupFooter];
    }
    if ([v8 isHIDDevice])
    {
      [(NSMutableSet *)self->_connectedHIDDevices addObject:v8];
      self->_mainFooterNeedsUpdate = 1;
      [(BTSDevicesController *)self updateMainGroupFooter];
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5 = [(BTSDevicesController *)self _getDeviceForPeripheral:a4];
  if (v5)
  {
    [(BTSDevicesController *)self _peripheralDidCompletePairing:v5];
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enableHealthDevices", @"com.apple.bluetooth", &keyExistsAndHasValidFormat);
    if (_os_feature_enabled_impl())
    {
      if (AppBooleanValue)
      {
        if (keyExistsAndHasValidFormat)
        {
          objc_super v7 = [v5 healthDeviceType];

          if (v7) {
            [v5 setUserSelectedHealthDataSyncConfig:0];
          }
        }
      }
    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = [(BTSDevicesController *)self _getDeviceForPeripheral:v6];
  if ([v6 state]) {
    [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:v6];
  }
  if (v7)
  {
    id v8 = [v7 identifier];
    int v9 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      id v11 = [[BTAlert alloc] initWithDevice:v7];
      alert = self->_alert;
      self->_alert = v11;

      int v13 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = self->_alert;
        int v15 = 138412290;
        __int16 v16 = v14;
        _os_log_impl(&dword_23EB2E000, v13, OS_LOG_TYPE_DEFAULT, "Pairing failed BTAlert : %@", (uint8_t *)&v15, 0xCu);
      }

      [(BTAlert *)self->_alert setDelegate:self];
      [(BTAlert *)self->_alert showAlertWithResult:&unk_26F253BC0];
    }
    if ([v7 isHealthDevice]) {
      [v7 setHealthDevice:0];
    }
    [(BTSDevicesController *)self _peripheralDidCompletePairing:v7];
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5 = [(BTSDevicesController *)self _getDeviceForPeripheral:a4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isHealthDevice])
    {
      [v6 setHealthDevice:0];
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        healthKitStore = self->_healthKitStore;
        id v8 = objc_alloc(MEMORY[0x263F08C38]);
        int v9 = [v6 identifier];
        int v10 = (void *)[v8 initWithUUIDString:v9];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke;
        v12[3] = &unk_26503DB30;
        id v13 = v6;
        [(HKHealthStore *)healthKitStore unregisterPeripheralIdentifier:v10 withCompletion:v12];
      }
    }
    [(BTSDevicesController *)self _updateDevicePosition:v6];
    id v11 = [v6 identifier];
    [(BTSDevicesController *)self reloadSpecifierID:v11];
  }
}

void __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1();
    }
  }
}

- (void)peripheralDidUpdateName:(id)a3
{
  id v4 = [(BTSDevicesController *)self _getDeviceForPeripheral:a3];
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 identifier];
    id v6 = [(BTSDevicesController *)self specifierForID:v5];

    objc_super v7 = [v9 name];
    [v6 setName:v7];

    id v8 = [v9 name];
    [v6 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

    [(BTSDevicesController *)self _updateDevicePosition:v9];
    id v4 = v9;
  }
}

- (void)peripheralConnectionTimeout:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 identifier];
  id v6 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (([v4 connected] & 1) == 0)
    {
      id v8 = [[BTAlert alloc] initWithDevice:v4];
      alert = self->_alert;
      self->_alert = v8;

      int v10 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_alert;
        int v13 = 138412290;
        int v14 = v11;
        _os_log_impl(&dword_23EB2E000, v10, OS_LOG_TYPE_DEFAULT, "Connection timeout BTAlert : %@", (uint8_t *)&v13, 0xCu);
      }

      [(BTAlert *)self->_alert setDelegate:self];
      [(BTAlert *)self->_alert showAlertWithResult:&unk_26F253BD8];
      [v4 disconnect];
    }
    [(BTSDevicesController *)self setBluetoothIsBusy:0];
    int v12 = [v4 identifier];
    [(BTSDevicesController *)self reloadSpecifierID:v12];
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BTSDevicesController peripheral:didDiscoverServices:]();
    }
  }
  else
  {
    uint64_t v9 = [(BTSDevicesController *)self _getDeviceForPeripheral:v6];
    id v8 = v9;
    if (v9)
    {
      long long v38 = v9;
      int v10 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v6 services];
        *(_DWORD *)buf = 138412546;
        id v50 = v6;
        __int16 v51 = 2112;
        int v52 = v11;
        _os_log_impl(&dword_23EB2E000, v10, OS_LOG_TYPE_INFO, "Device %@ supports services %@", buf, 0x16u);
      }
      uint64_t v37 = self;
      int v40 = [MEMORY[0x263EFFA08] setWithArray:self->_healthServices];
      uint64_t v39 = [MEMORY[0x263EFF9C0] set];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      int v12 = [v6 services];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        char v15 = 0;
        uint64_t v16 = *(void *)v45;
        uint64_t v17 = *MEMORY[0x263EFEEE8];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v16) {
              objc_enumerationMutation(v12);
            }
            id v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            int v20 = [v19 UUID];
            int v21 = [v40 containsObject:v20];

            if (v21)
            {
              uint64_t v22 = [v19 UUID];
              uint64_t v23 = [v22 UUIDString];
              [v39 addObject:v23];
            }
            BOOL v24 = [v19 UUID];
            int v25 = [MEMORY[0x263EFEF88] UUIDWithString:v17];
            char v26 = [v24 isEqual:v25];

            v15 |= v26;
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v14);
      }
      else
      {
        char v15 = 0;
      }

      BOOL v27 = [MEMORY[0x263EFEF88] UUIDWithString:*MEMORY[0x263EFEEE0]];
      long long v28 = [v27 UUIDString];
      int v29 = [v39 containsObject:v28];

      id v8 = v38;
      if ((v15 & 1) != 0
        && ([(NSMutableSet *)v37->_connectedHIDDevices containsObject:v38] & 1) == 0)
      {
        [(NSMutableSet *)v37->_connectedHIDDevices addObject:v38];
        v37->_mainFooterNeedsUpdate = 1;
        [(BTSDevicesController *)v37 updateMainGroupFooter];
      }
      id v7 = 0;
      if ([v39 count])
      {
        char v30 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[BTSDevicesController peripheral:didDiscoverServices:]();
        }

        [v38 setHealthDevice:1];
        if (v29)
        {
          if (_os_feature_enabled_impl())
          {
            __int16 v31 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[BTSDevicesController peripheral:didDiscoverServices:]();
            }

            [v6 setCustomProperty:@"Fitness" value:@"1"];
            long long v32 = [v6 customProperty:@"UpdateHealth"];

            if (!v32) {
              [v6 setCustomProperty:@"UpdateHealth" value:@"1"];
            }
            [v6 tag:*MEMORY[0x263F09E38]];
            notify_post("BTSettingsHRMConnectedNotification");
          }
          else
          {
            healthKitStore = v37->_healthKitStore;
            uint64_t v34 = [v6 identifier];
            int v35 = [v6 name];
            long long v36 = [v39 allObjects];
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke;
            v41[3] = &unk_26503DB58;
            id v42 = v6;
            id v43 = v39;
            [(HKHealthStore *)healthKitStore registerPeripheralIdentifier:v34 name:v35 services:v36 withCompletion:v41];
          }
        }
        [(BTSDevicesController *)v37 _updateDevicePosition:v38];
      }
    }
  }
}

void __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke_cold_1();
    }
  }
}

- (void)fetchDADevices
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, v0, v1, "Error fetching DADevices: %@", v2);
}

- (BOOL)updateDADevices
{
  return 0;
}

- (void)handleDASessionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 eventType];
  if (v5 <= 40)
  {
    if (v5 != 10)
    {
      if (v5 == 20)
      {
        id v6 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_INFO, "DAEventTypeInvalidated for BTSettings", v14, 2u);
        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    id v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_23EB2E000, v8, OS_LOG_TYPE_INFO, "DASession from BTSettings activated", v17, 2u);
    }

    [(BTSDevicesController *)self fetchDADevices];
LABEL_14:
    if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
      [(BTSDevicesController *)self reloadSpecifiers];
    }
    goto LABEL_23;
  }
  if (v5 != 41)
  {
    if (v5 != 42) {
      goto LABEL_23;
    }
    [(BTSDevicesController *)self fetchDADevices];
    id v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_INFO, "DeviceChanged for BTSettings", buf, 2u);
    }

    goto LABEL_14;
  }
  uint64_t v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_INFO, "DeviceLost for BTSettings", v16, 2u);
  }

  [(BTSDevicesController *)self fetchDADevices];
  if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    [(BTSDevicesController *)self reloadSpecifiers];
    int v10 = (void *)MEMORY[0x263F08A00];
    id v11 = v4;
    id v6 = [v10 defaultCenter];
    int v12 = [v11 device];

    uint64_t v13 = [v12 identifier];
    [v6 postNotificationName:@"DADeviceLost" object:v13];

LABEL_22:
  }
LABEL_23:
}

- (void)setSSPConfirmation:(int64_t)a3 forDevice:(id)a4
{
  id v11 = a4;
  if (a3)
  {
    id v6 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    [v6 setObject:@"cancelled" forKey:@"PIN-ended"];

    id v7 = [MEMORY[0x263F2B998] sharedInstance];
    id v8 = v7;
    int64_t v9 = a3;
  }
  else
  {
    if ([(BTSDevicesController *)self isiPhone]
      && [v11 isServiceSupported:0x40000])
    {
      objc_msgSend(v11, "setSyncSettings:", objc_msgSend(v11, "syncSettings") & 0xFFFF00FFLL);
      [(BTSDevicesController *)self showSyncContactsPopup:v11];
      goto LABEL_8;
    }
    int v10 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    [v10 setObject:@"accepted" forKey:@"PIN-ended"];

    id v7 = [MEMORY[0x263F2B998] sharedInstance];
    id v8 = v7;
    int64_t v9 = 0;
  }
  [v7 acceptSSP:v9 forDevice:v11];

LABEL_8:
}

- (void)showPairingAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BTSDevicesController *)self view];
  id v6 = [v5 window];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F82E10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__BTSDevicesController_showPairingAlert___block_invoke;
    v8[3] = &unk_26503DA40;
    void v8[4] = self;
    id v9 = v4;
    [v7 _performWithoutDeferringTransitions:v8];
  }
}

uint64_t __41__BTSDevicesController_showPairingAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)dismissPairingAlert:(id)a3
{
}

- (void)_addDevice:(id)a3
{
  id v12 = a3;
  if (-[BTSDevicesController shouldDisplayDevice:](self, "shouldDisplayDevice:"))
  {
    uint64_t v4 = [v12 identifier];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      devicesDict = self->_devicesDict;
      id v7 = [v12 identifier];
      id v8 = [(NSMutableDictionary *)devicesDict objectForKey:v7];

      if (!v8)
      {
        id v9 = self->_devicesDict;
        int v10 = [v12 identifier];
        [(NSMutableDictionary *)v9 setObject:v12 forKey:v10];

        id v11 = [(BTSDevicesController *)self _specifierForDevice:v12];
        [(BTSDevicesController *)self _addDeviceSpecifier:v11 withDevice:v12];
      }
    }
  }
}

- (void)_addDeviceSpecifier:(id)a3 withDevice:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BTSDevicesController *)self specifierForID:@"MY_DEVICES"];
  if (v8)
  {

LABEL_7:
    id v25 = v6;
    if ([v7 isMyDevice]) {
      char v15 = @"MY_DEVICES";
    }
    else {
      char v15 = @"DEVICES";
    }
    uint64_t v16 = [(BTSDevicesController *)self indexOfSpecifierID:v15];
    id v12 = [MEMORY[0x263EFF980] array];
    uint64_t v17 = (int)*MEMORY[0x263F5FDB8];
    if (v16 + 1 < (unint64_t)[*(id *)((char *)&self->super.super.super.super.super.isa + v17) count])
    {
      unint64_t v18 = v16 + 1;
      do
      {
        id v19 = [(BTSDevicesController *)self specifierAtIndex:v18];
        int v20 = [v19 userInfo];
        int v21 = [v20 objectForKey:@"bt-device"];

        if (!v21) {
          break;
        }
        int v22 = [v7 isMyDevice];
        if (v22 == [v21 isMyDevice]) {
          [v12 addObject:v21];
        }

        ++v18;
      }
      while (v18 < [*(id *)((char *)&self->super.super.super.super.super.isa + v17) count]);
    }
    [v12 addObject:v7];
    [v12 sortUsingSelector:sel_compare_];
    uint64_t v23 = v16 + 1 + [v12 indexOfObject:v7];
    BOOL v24 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[BTSDevicesController _addDeviceSpecifier:withDevice:]();
    }

    id v6 = v25;
    [(BTSDevicesController *)self insertSpecifier:v25 atIndex:v23 animated:1];
    goto LABEL_19;
  }
  if (![v7 isMyDevice]) {
    goto LABEL_7;
  }
  id v9 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [v7 name];
    *(_DWORD *)buf = 138412290;
    long long v28 = v10;
    _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_INFO, "Adding first \"known\" device %@", buf, 0xCu);
  }
  v26[0] = self->_myDevicesGroupSpec;
  v26[1] = v6;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [(BTSDevicesController *)self insertContiguousSpecifiers:v11 afterSpecifierID:@"BLUETOOTH" animated:1];

  id v12 = [(PSSpecifier *)self->_otherDevicesGroupSpec propertyForKey:*MEMORY[0x263F60128]];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"OTHER_DEVICES" value:&stru_26F24FEE8 table:@"Devices"];
  [v12 setName:v14];

LABEL_19:
}

- (void)_removeDeviceSpecifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BTSDevicesController *)self beginUpdates];
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v17 = 138412546;
    *(void *)&v17[4] = v4;
    __int16 v18 = 2048;
    uint64_t v19 = [(BTSDevicesController *)self indexOfSpecifier:v4];
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_INFO, "Removing specifier %@ at index %lu", v17, 0x16u);
  }

  [(BTSDevicesController *)self removeSpecifier:v4 animated:1];
  uint64_t v6 = [(BTSDevicesController *)self specifierForID:@"MY_DEVICES"];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(BTSDevicesController *)self rowsForGroup:1];

    if (!v8)
    {
      id v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_23EB2E000, v9, OS_LOG_TYPE_INFO, "Removing \"known\" device section", v17, 2u);
      }

      BOOL v10 = [(BTSDevicesController *)self isMainSettingsPane];
      id v11 = [(BTSDevicesController *)self table];
      if (v10)
      {
        id v12 = [(BTSDevicesController *)self tableView:v11 viewForHeaderInSection:2];

        uint64_t v13 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v17 = 0;
          uint64_t v14 = "Removing in BT pane";
LABEL_12:
          _os_log_impl(&dword_23EB2E000, v13, OS_LOG_TYPE_INFO, v14, v17, 2u);
        }
      }
      else
      {
        id v12 = [(BTSDevicesController *)self tableView:v11 viewForHeaderInSection:1];

        uint64_t v13 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v17 = 0;
          uint64_t v14 = "Removing in AX pane";
          goto LABEL_12;
        }
      }

      char v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v16 = [v15 localizedStringForKey:@"DEVICES" value:&stru_26F24FEE8 table:@"Devices"];
      [v12 setName:v16];

      [(BTSDevicesController *)self removeSpecifier:self->_myDevicesGroupSpec animated:1];
    }
  }
  [(BTSDevicesController *)self endUpdates];
}

- (void)_removeDevice:(id)a3
{
  id v4 = a3;
  devicesDict = self->_devicesDict;
  id v12 = v4;
  uint64_t v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)devicesDict objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v12 identifier];
    id v9 = [(BTSDevicesController *)self specifierForID:v8];

    if (v9 && v9 == self->_currentDeviceSpecifier)
    {
      [v12 disconnect];
      [(BTSDevicesController *)self setBluetoothIsBusy:0];
    }
    BOOL v10 = self->_devicesDict;
    id v11 = [v12 identifier];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];

    [(BTSDevicesController *)self _removeDeviceSpecifier:v9];
  }
}

- (void)allowBluetoothScans:(BOOL)a3
{
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v6 = [v5 applicationState];

    if (v6) {
      return;
    }
    self->_allowScanning = a3;
    uint64_t v8 = [MEMORY[0x263F2B998] sharedInstance];
    [v8 setDeviceScanningEnabled:1];
  }
  else
  {
    self->_allowScanning = 0;
    id v7 = [MEMORY[0x263F2B998] sharedInstance];
    [v7 setDeviceScanningEnabled:0];

    uint64_t v8 = [MEMORY[0x263F2B998] sharedInstance];
    [v8 resetDeviceScanning];
  }

  [(BTSDevicesController *)self _setupCentralScanning];
}

- (void)healthDeviceUnregisteredHandler:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BTSDevicesController healthDeviceUnregisteredHandler:]();
  }

  if ([v4 isHealthDevice])
  {
    [v4 setHealthDevice:0];
    if (_os_feature_enabled_impl())
    {
      [v4 unpair];
    }
    else
    {
      healthKitStore = self->_healthKitStore;
      id v7 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v8 = [v4 identifier];
      id v9 = (void *)[v7 initWithUUIDString:v8];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__BTSDevicesController_healthDeviceUnregisteredHandler___block_invoke;
      v10[3] = &unk_26503DB30;
      id v11 = v4;
      [(HKHealthStore *)healthKitStore unregisterPeripheralIdentifier:v9 withCompletion:v10];
    }
    [(BTSDevicesController *)self _updateDevicePosition:v4];
  }
}

void __56__BTSDevicesController_healthDeviceUnregisteredHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1();
    }
  }
}

- (void)userDidTapWatchLink:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [NSURL URLWithString:@"bridge:"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)userDidTapWalletLink:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [NSURL URLWithString:@"wallet:"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (id)_heroPlacardSpecifiers
{
  v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F24FEE8 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v2 setObject:NSClassFromString(&cfstr_Bluetoothsetti.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v2 setIdentifier:@"BLUETOOH_PLACARD"];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v2, 0);

  return v3;
}

- (id)powerOffWarningString
{
  if ([(BTSDevicesController *)self isMainSettingsPane])
  {
    self->_BOOL exposureNotificationManagerEnabled = [(ENManager *)self->_exposureNotificationManager exposureNotificationEnabled];
    int v3 = [MEMORY[0x263F6C1E8] autoUnlockEnabled];
    int v4 = MGGetBoolAnswer();
    BOOL exposureNotificationManagerEnabled = self->_exposureNotificationManagerEnabled;
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    if (v4)
    {
      if (exposureNotificationManagerEnabled)
      {
        if (v3) {
          uint64_t v8 = @"POWER_OFF_WARNING_WITH_EN_PAU_THR";
        }
        else {
          uint64_t v8 = @"POWER_OFF_WARNING_WITH_EN_THR";
        }
      }
      else if (v3)
      {
        uint64_t v8 = @"POWER_OFF_WARNING_WITH_PAU_THR";
      }
      else
      {
        uint64_t v8 = @"POWER_OFF_WARNING_THR";
      }
    }
    else if (exposureNotificationManagerEnabled)
    {
      if (v3) {
        uint64_t v8 = @"POWER_OFF_WARNING_WITH_EN_PAU";
      }
      else {
        uint64_t v8 = @"POWER_OFF_WARNING_WITH_EN";
      }
    }
    else if (v3)
    {
      uint64_t v8 = @"POWER_OFF_WARNING_WITH_PAU";
    }
    else
    {
      uint64_t v8 = @"POWER_OFF_WARNING";
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    uint64_t v8 = @"POWER_OFF_WARNING_IN_AX";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_26F24FEE8 table:@"Devices"];

  return v9;
}

- (id)namesOfDevices:(id)a3 displayableOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v21 = v6;
  uint64_t v8 = [v6 allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    int v12 = !v4;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [v14 name];
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          int v17 = [(BTSDevicesController *)self shouldDisplayDevice:v14] | v12;

          if (v17 == 1)
          {
            __int16 v18 = [v14 name];
            [v7 addObject:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v19 = (void *)[v7 copy];

  return v19;
}

- (id)connectedPoorBehaviorDeviceNames
{
  return [(BTSDevicesController *)self namesOfDevices:self->_connectedPoorBehaviorDevices displayableOnly:1];
}

- (id)connectedFirmwareUpdateRequiredDeviceNames
{
  return [(BTSDevicesController *)self namesOfDevices:self->_connectedFirmwareUpdateRequiredDevices displayableOnly:1];
}

- (id)localizedList:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = NSString;
        uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v12 = [v11 localizedStringForKey:@"QUOTED_DEVICE_NAME" value:&stru_26F24FEE8 table:@"Devices"];
        uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);

        [v4 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v14 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v4];

  return v14;
}

- (id)makeWarningAttributedString:(id)a3
{
  id v3 = [NSString stringWithFormat:@"\n\n %@", a3];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
  uint64_t v5 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
  uint64_t v6 = [v5 imageWithRenderingMode:1];

  uint64_t v7 = [MEMORY[0x263F81678] textAttachmentWithImage:v6];
  uint64_t v8 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v7];
  [v4 insertAttributedString:v8 atIndex:2];

  return v4;
}

- (id)currentSpecifier
{
  return self->_currentDeviceSpecifier;
}

- (id)_specifierForSharingDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  uint64_t v6 = v5;
  if (!v5 || [(__CFString *)v5 isEqualToString:&stru_26F24FEE8])
  {

    uint64_t v6 = @" ";
  }
  uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v7 setName:v6];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:v4 forKey:@"bt-device"];

  [v7 setUserInfo:v8];

  return v7;
}

uint64_t __47__BTSDevicesController__knownDevicesSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_retrievedRegisteredHealthDevices:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__BTSDevicesController__retrievedRegisteredHealthDevices___block_invoke;
  v6[3] = &unk_26503DBA0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "Received registered health devices %@", buf, 0xCu);
  }
}

void __58__BTSDevicesController__retrievedRegisteredHealthDevices___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1632);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__BTSDevicesController__updateHealthDevices__block_invoke_cold_1(v6, v7);
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v12 hasTag:@"FitnessClassic"] & 1) == 0)
          {
            uint64_t v13 = [*(id *)(a1 + 32) _getDeviceForPeripheral:v12];
            uint64_t v14 = v13;
            if (v13)
            {
              [v13 setHealthDevice:1];
              [*(id *)(*(void *)(a1 + 32) + 1624) addObject:v14];
            }
          }
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v9);
    }
    uint64_t v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 1624);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v16;
      _os_log_impl(&dword_23EB2E000, v15, OS_LOG_TYPE_INFO, "Found known health devices %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_539;
    block[3] = &unk_26503DB08;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __44__BTSDevicesController__updateHealthDevices__block_invoke_539(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(void *)((char *)v2 + (int)*MEMORY[0x263F5FDB8]))
  {
    id v3 = (void *)v2[203];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_2;
    v5[3] = &unk_26503DBC8;
    v5[4] = v2;
    [v3 enumerateObjectsUsingBlock:v5];
    v2 = *(void **)(a1 + 32);
  }
  return [v2 migrateHKPairedHealthDevices];
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 1448);
  id v7 = v3;
  id v5 = [v3 identifier];
  id v6 = [v4 objectForKey:v5];

  if (!v6) {
    [*(id *)(a1 + 32) _addDevice:v7];
  }
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_541(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 1448);
  id v5 = [v3 identifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_DEFAULT, "Found a health device that's already added - rearrange here.", v8, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _addDevice:v3];
  }
}

- (void)_updateDevicePosition:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(BTSDevicesController *)self specifierForID:v5];

  if (!v6) {
    goto LABEL_34;
  }
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  [(BTSDevicesController *)self getGroup:&v27 row:0 ofSpecifier:v6];
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDevicesController indexOfGroup:](self, "indexOfGroup:"));
    id v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    if ([v4 isMyDevice] && v7 == self->_myDevicesGroupSpec
      || ([v4 isMyDevice] & 1) == 0 && v7 == self->_otherDevicesGroupSpec)
    {
      uint64_t v8 = [(BTSDevicesController *)self indexOfSpecifier:v6];
      uint64_t v9 = [(BTSDevicesController *)self specifierAtIndex:v8 - 1];
      uint64_t v10 = [v9 userInfo];
      uint64_t v11 = [v10 objectForKey:@"bt-device"];

      int v12 = [(BTSDevicesController *)self specifierAtIndex:v8 + 1];
      uint64_t v13 = [v12 userInfo];
      uint64_t v14 = [v13 objectForKey:@"bt-device"];

      LODWORD(v12) = [v11 isMyDevice];
      if (v12 == [v4 isMyDevice])
      {
        uint64_t v16 = [v11 name];
        long long v17 = [v4 name];
        BOOL v15 = [v16 caseInsensitiveCompare:v17] == -1 || v11 == 0;
      }
      else
      {
        BOOL v15 = v11 == 0;
      }
      int v19 = [v14 isMyDevice];
      if (v19 == [v4 isMyDevice])
      {
        long long v21 = [v14 name];
        uint64_t v22 = [v4 name];
        BOOL v20 = [v21 caseInsensitiveCompare:v22] == -1 || v14 == 0;
      }
      else
      {
        BOOL v20 = v14 == 0;
      }
      if (v15 && v20)
      {
        long long v24 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = [v4 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v25;
          _os_log_impl(&dword_23EB2E000, v24, OS_LOG_TYPE_INFO, "Reloading correctly located device %@", buf, 0xCu);
        }
        [(BTSDevicesController *)self reloadSpecifier:v6 animated:0];

        goto LABEL_34;
      }
    }
  }
  char v26 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[BTSDevicesController _updateDevicePosition:](v4);
  }

  [(BTSDevicesController *)self beginUpdates];
  [(BTSDevicesController *)self _removeDeviceSpecifier:v6];
  [(BTSDevicesController *)self _addDeviceSpecifier:v6 withDevice:v4];
  [(BTSDevicesController *)self endUpdates];
LABEL_34:
}

- (void)updateUI:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = [(BTSDevicesController *)self specifierForID:@"MAIN_GROUP"];
  if (a3)
  {
    id v6 = (void *)MEMORY[0x263EFF980];
    id v7 = [(BTSDevicesController *)self _shareDevicesSpecifiers];
    uint64_t v8 = [v6 arrayWithArray:v7];

    uint64_t v9 = (void *)MEMORY[0x263EFF980];
    uint64_t v10 = [(BTSDevicesController *)self _knownDevicesSpecifiers];
    uint64_t v11 = [v9 arrayWithArray:v10];

    if ([v8 count])
    {
      sharingDevicesGroupSpec = self->_sharingDevicesGroupSpec;
      if (sharingDevicesGroupSpec) {
        [v8 insertObject:sharingDevicesGroupSpec atIndex:0];
      }
    }
    if ([v11 count])
    {
      uint64_t v29 = v5;
      [v11 insertObject:self->_myDevicesGroupSpec atIndex:0];
      uint64_t v13 = (void *)MEMORY[0x263EFF980];
      uint64_t v14 = [MEMORY[0x263F2B998] sharedInstance];
      BOOL v15 = [v14 connectingDevices];
      uint64_t v16 = [v13 arrayWithArray:v15];

      long long v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        long long v36 = "-[BTSDevicesController updateUI:]";
        __int16 v37 = 2048;
        uint64_t v38 = [v16 count];
        __int16 v39 = 2112;
        int v40 = v16;
        _os_log_impl(&dword_23EB2E000, v17, OS_LOG_TYPE_INFO, "%s found %lu connecting devices - %@", buf, 0x20u);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = [*(id *)(*((void *)&v30 + 1) + 8 * i) address];
            long long v24 = [v11 specifierForID:v23];

            if (v24)
            {
              [(BTSDevicesController *)self setBluetoothIsBusy:1];
              objc_storeStrong((id *)&self->_currentDeviceSpecifier, v24);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v20);
      }

      id v5 = v29;
    }
    if (!self->_bluetoothRestricted) {
      [v11 addObject:self->_otherDevicesGroupSpec];
    }
    [(BTSDevicesController *)self beginUpdates];
    if ([v8 count]) {
      [(BTSDevicesController *)self addSpecifiersFromArray:v8 animated:1];
    }
    [(BTSDevicesController *)self addSpecifiersFromArray:v11 animated:1];
    [(BTSDevicesController *)self endUpdates];
    [(BTSDevicesController *)self setBluetoothIsBusy:0];
    goto LABEL_27;
  }
  [(NSMutableDictionary *)self->_devicesDict removeAllObjects];
  [(NSMutableDictionary *)self->_sharingDevicesDict removeAllObjects];
  [(NSMutableDictionary *)self->_ctkdLeDevicesDict removeAllObjects];
  [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeAllObjects];
  [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices removeAllObjects];
  [(NSMutableSet *)self->_connectedHIDDevices removeAllObjects];
  [(BTSDevicesController *)self cleanupPairing];
  [(BTSDevicesController *)self cleanupAlerts];
  if ([(BTSDevicesController *)self numberOfGroups] >= 2)
  {
    uint64_t v25 = [(BTSDevicesController *)self indexOfGroup:1];
    char v26 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "subarrayWithRange:", v25, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "count") - v25);
    [(BTSDevicesController *)self removeContiguousSpecifiers:v26 animated:1];
  }
  uint64_t v8 = [(BTSDevicesController *)self powerOffWarningString];
  [v5 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
  [(BTSDevicesController *)self reloadSpecifier:v5 animated:1];
  uint64_t v27 = [(BTSDevicesController *)self parentViewController];

  if (v27)
  {
    uint64_t v11 = [(BTSDevicesController *)self rootController];
    id v28 = (id)[v11 popToViewController:self animated:1];
LABEL_27:
  }
}

- (void)updatePoorConnectedDevicesList:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EB2E000, v4, OS_LOG_TYPE_DEFAULT, "Received 'le hid device behavior changed' notification", buf, 2u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 connectedTransport] == 2)
        {
          uint64_t v11 = [(BTSDevicesController *)self _getDeviceForPeripheral:v10];
          if (v11 && [v10 visibleInSettings])
          {
            if (([v11 connected] & 1) != 0
              && [v11 isLimitedConnectivityDevice])
            {
              [(NSMutableSet *)self->_connectedPoorBehaviorDevices addObject:v11];
              goto LABEL_16;
            }
            if ([(NSMutableSet *)self->_connectedPoorBehaviorDevices containsObject:v11])
            {
              [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeObject:v11];
LABEL_16:
              self->_mainFooterNeedsUpdate = 1;
            }
          }

          continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v12 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v13 = [v12 connectedDevices];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (!v14) {
    goto LABEL_32;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v23;
  do
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = +[BTSDeviceClassic deviceWithDevice:*(void *)(*((void *)&v22 + 1) + 8 * j)];
      int v19 = [v18 isLimitedConnectivityDevice];
      connectedPoorBehaviorDevices = self->_connectedPoorBehaviorDevices;
      if (v19)
      {
        [(NSMutableSet *)connectedPoorBehaviorDevices addObject:v18];
      }
      else
      {
        if (![(NSMutableSet *)connectedPoorBehaviorDevices containsObject:v18]) {
          goto LABEL_30;
        }
        [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeObject:v18];
      }
      self->_mainFooterNeedsUpdate = 1;
LABEL_30:
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
  }
  while (v15);
LABEL_32:

  if (self->_mainFooterNeedsUpdate)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BTSDevicesController_updatePoorConnectedDevicesList___block_invoke;
    block[3] = &unk_26503DB08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    self->_mainFooterNeedsUpdate = 0;
  }
}

uint64_t __55__BTSDevicesController_updatePoorConnectedDevicesList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)updateFirmwareUpdateRequiredDevicesList:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EB2E000, v4, OS_LOG_TYPE_DEFAULT, "Received 'le device firmware update required changed' notification", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 connectedTransport] == 2)
        {
          uint64_t v11 = [(BTSDevicesController *)self _getDeviceForPeripheral:v10];
          if (v11
            && [v10 visibleInSettings]
            && [v11 connected]
            && [v11 isFirmwareUpdateRequiredDevice])
          {
            [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices addObject:v11];
            self->_mainFooterNeedsUpdate = 1;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  if (self->_mainFooterNeedsUpdate)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BTSDevicesController_updateFirmwareUpdateRequiredDevicesList___block_invoke;
    block[3] = &unk_26503DB08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    self->_mainFooterNeedsUpdate = 0;
  }
}

uint64_t __64__BTSDevicesController_updateFirmwareUpdateRequiredDevicesList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)updateMainGroupFooter
{
  if (self->_mainFooterNeedsUpdate)
  {
    [(BTSDevicesController *)self reloadSpecifiers];
    self->_mainFooterNeedsUpdate = 0;
  }
}

- (BOOL)isiPhone
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (BOOL)isiPad
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (id)bluetoothEnabled:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F2B998] sharedInstance];
  int v6 = [v5 powerState];
  uint64_t v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = !self->_togglingPower;
    *(_DWORD *)long long v22 = 136315650;
    *(void *)&v22[4] = "-[BTSDevicesController bluetoothEnabled:]";
    if (v8) {
      uint64_t v9 = "no";
    }
    else {
      uint64_t v9 = "yes";
    }
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = v9;
    __int16 v23 = 1024;
    int v24 = v6;
    _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_INFO, "%s - toggling: %s, powerstate: %d", v22, 0x1Cu);
  }

  uint64_t v10 = [MEMORY[0x263F55C28] sharedInstance];
  if ([v10 isStoreDemoModeEnabled:0])
  {
    uint64_t v11 = [MEMORY[0x263F55C38] sharedInstance];
    uint64_t v12 = [v11 isBetterTogetherDemoDevice] ^ 1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  long long v13 = [NSNumber numberWithInt:v12];
  uint64_t v14 = *MEMORY[0x263F600A8];
  [v4 setProperty:v13 forKey:*MEMORY[0x263F600A8]];

  BOOL v15 = v6 == 1 || self->_togglingPower;
  unsigned int v16 = objc_msgSend(v5, "available", *(_OWORD *)v22);
  long long v17 = [NSNumber numberWithBool:v15 & v16];
  [v4 setProperty:v17 forKey:*MEMORY[0x263F60020]];

  if (self->_bluetoothRestricted) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = [v5 available];
  }
  uint64_t v19 = [NSNumber numberWithBool:v18];
  [v4 setProperty:v19 forKey:v14];

  uint64_t v20 = [NSNumber numberWithInt:v6 == 2];

  return v20;
}

- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  if (self->_power != v7)
  {
    uint64_t v8 = v7;
    if (v7) {
      goto LABEL_4;
    }
    uint64_t v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v10 = [v9 persistentDomainForName:@"com.apple.bluetooth.settings"];
    uint64_t v11 = [v10 objectForKey:@"HideGizmoPowerWarning"];

    if (v11)
    {
LABEL_4:
      [(BTSDevicesController *)self updatePowerState:v8 powerSpec:v6];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x263F82418];
      long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v13 localizedStringForKey:@"POWER_WARNING_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
      BOOL v15 = [(BTSDevicesController *)self powerOffWarningString];
      unsigned int v16 = [v12 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

      long long v17 = (void *)MEMORY[0x263F82400];
      uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26F24FEE8 table:@"Devices"];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_2;
      v33[3] = &unk_26503DC10;
      id v35 = &__block_literal_global_562;
      v33[4] = self;
      id v20 = v6;
      id v34 = v20;
      uint64_t v21 = [v17 actionWithTitle:v19 style:1 handler:v33];
      [v16 addAction:v21];

      long long v22 = (void *)MEMORY[0x263F82400];
      __int16 v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v24 = [v23 localizedStringForKey:@"TURN_OFF" value:&stru_26F24FEE8 table:@"Devices"];
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      long long v28 = __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_3;
      long long v29 = &unk_26503DC38;
      long long v30 = self;
      id v31 = v20;
      id v32 = &__block_literal_global_562;
      uint64_t v25 = [v22 actionWithTitle:v24 style:0 handler:&v26];
      objc_msgSend(v16, "addAction:", v25, v26, v27, v28, v29, v30);

      [(BTSDevicesController *)self presentViewController:v16 animated:1 completion:0];
    }
  }
}

void __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v2 = [v1 persistentDomainForName:@"com.apple.bluetooth.settings"];
  id v4 = [v0 dictionaryWithDictionary:v2];

  [v4 setObject:MEMORY[0x263EFFA88] forKey:@"HideGizmoPowerWarning"];
  char v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 setPersistentDomain:v4 forName:@"com.apple.bluetooth.settings"];
}

uint64_t __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 reloadSpecifier:v3];
}

uint64_t __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updatePowerState:0 powerSpec:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)updatePowerState:(BOOL)a3 powerSpec:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  id v6 = [MEMORY[0x263F2B998] sharedInstance];
  LODWORD(v4) = [v6 setEnabled:v4];

  if (v4)
  {
    self->_togglingPower = 1;
    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setEnabled:0];
  }
  [(BTSDevicesController *)self reloadSpecifier:v7];
}

- (void)setBluetoothIsBusy:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = 1;
  }
  else
  {
    currentDeviceSpecifier = self->_currentDeviceSpecifier;
    self->_currentDeviceSpecifier = 0;

    [(NSTimer *)self->_currentDeviceConnectionTimer invalidate];
    currentDeviceConnectionTimer = self->_currentDeviceConnectionTimer;
    self->_currentDeviceConnectionTimer = 0;

    BOOL v4 = 0;
  }
  self->_bluetoothIsBusy = v4;
}

- (void)alertSheetDismissed:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    alert = self->_alert;
    int v13 = 138412290;
    uint64_t v14 = alert;
    _os_log_impl(&dword_23EB2E000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss BTAlert : %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = self->_alert;
  self->_alert = 0;

  id v7 = [(BTSDevicesController *)self rootController];
  uint64_t v8 = [v7 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(BTSDevicesController *)self rootController];
    uint64_t v11 = [v10 visibleViewController];
    uint64_t v12 = [v11 parentViewController];
    [v12 dismiss];
  }
}

- (void)showAlert:(id)a3
{
}

- (void)cleanupPairing
{
  [(BTSSPPairingRequest *)self->_sspAlert dismiss];
  sspAlert = self->_sspAlert;
  self->_sspAlert = 0;

  BOOL v4 = [(BTSDevicesController *)self rootController];
  id v5 = [v4 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(BTSDevicesController *)self rootController];
    uint64_t v8 = [v7 visibleViewController];
    uint64_t v9 = [v8 parentViewController];
    [v9 dismiss];
  }
  syncContactsCarplayAlert = self->_syncContactsCarplayAlert;
  if (syncContactsCarplayAlert)
  {
    [(UIAlertController *)syncContactsCarplayAlert dismissViewControllerAnimated:1 completion:0];
    uint64_t v11 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    [v11 setObject:@"cancelled" forKey:@"PIN-ended"];

    uint64_t v12 = self->_syncContactsCarplayAlert;
    self->_syncContactsCarplayAlert = 0;
  }
}

- (void)cleanupAlerts
{
  if (self->_syncContactsPrivacyAlert)
  {
    [(BTSDevicesController *)self dismissViewControllerAnimated:1 completion:0];
    id v6 = (id)_currentDevice;
    objc_msgSend(v6, "setSyncSettings:", objc_msgSend(v6, "syncSettings") & 0xFFFF00FFLL | 0x100000000);
    syncContactsPrivacyAlert = self->_syncContactsPrivacyAlert;
    self->_syncContactsPrivacyAlert = 0;

    BOOL v4 = (void *)_currentDevice;
    _currentDevice = 0;

    id v5 = (void *)_currentBTSDevice;
    _currentBTSDevice = 0;
  }
}

- (void)registerForNotifications
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F833C0] object:0];

  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_applicationWillTerminate_ name:*MEMORY[0x263F833C8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_healthDeviceUnregisteredHandler_ name:@"BTSUnregisterHealthDeviceNotification" object:0];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_powerChangedHandler_ name:*MEMORY[0x263F2B8E8] object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_powerChangedHandler_ name:*MEMORY[0x263F2B980] object:0];

  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_deviceDiscoveredHandler_ name:*MEMORY[0x263F2B918] object:0];

  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_deviceUpdatedHandler_ name:*MEMORY[0x263F2B930] object:0];

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_deviceRemovedHandler_ name:*MEMORY[0x263F2B920] object:0];

  int v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel_deviceUnpairedHandler_ name:*MEMORY[0x263F2B928] object:0];

  uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel_devicePairedStatusChangedHandler_ name:*MEMORY[0x263F2B948] object:0];

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel_deviceConnectedHandler_ name:*MEMORY[0x263F2B900] object:0];

  unsigned int v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 addObserver:self selector:sel_deviceConnectedHandler_ name:*MEMORY[0x263F2B8F8] object:0];

  long long v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:self selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x263F2B910] object:0];

  uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 addObserver:self selector:sel_devicePairedHandler_ name:*MEMORY[0x263F2B958] object:0];

  uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 addObserver:self selector:sel_devicePairedHandler_ name:*MEMORY[0x263F2B960] object:0];

  id v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 addObserver:self selector:sel_authenticationRequestHandler_ name:*MEMORY[0x263F2B950] object:0];

  uint64_t v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 addObserver:self selector:sel_authenticationRequestHandler_ name:*MEMORY[0x263F2B970] object:0];

  long long v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:self selector:sel_authenticationRequestHandler_ name:*MEMORY[0x263F2B978] object:0];

  __int16 v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:self selector:sel_authenticationRequestHandler_ name:*MEMORY[0x263F2B968] object:0];

  int v24 = [MEMORY[0x263F08A00] defaultCenter];
  [v24 addObserver:self selector:sel_effectiveMCSettingsDidChange_ name:*MEMORY[0x263F536E0] object:0];

  uint64_t v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 addObserver:self selector:sel_deviceUpdatedHandler_ name:*MEMORY[0x263F2B940] object:0];

  uint64_t v26 = [MEMORY[0x263F08A00] defaultCenter];
  [v26 addObserver:self selector:sel_bluetoothDenylistChanged_ name:*MEMORY[0x263F2B8F0] object:0];

  uint64_t v27 = [MEMORY[0x263F087C8] defaultCenter];
  [v27 addObserver:self selector:sel_updatePoorConnectedDevicesList_ name:@"com.apple.bluetooth.leHIDBehaviorKnown" object:0];

  long long v28 = [MEMORY[0x263F087C8] defaultCenter];
  [v28 addObserver:self selector:sel_updateFirmwareUpdateRequiredDevicesList_ name:@"com.apple.bluetooth.leDeviceFirmwareUpdateWarning" object:0];

  id v29 = [MEMORY[0x263F08A00] defaultCenter];
  [v29 addObserver:self selector:sel_reloadSpecifiers name:*MEMORY[0x263F83428] object:0];
}

- (void)refreshUI
{
  [(NSMutableDictionary *)self->_devicesDict removeAllObjects];
  [(NSMutableDictionary *)self->_sharingDevicesDict removeAllObjects];
  [(NSMutableDictionary *)self->_ctkdLeDevicesDict removeAllObjects];
  [(NSMutableSet *)self->_connectedPoorBehaviorDevices removeAllObjects];
  [(NSMutableSet *)self->_connectedFirmwareUpdateRequiredDevices removeAllObjects];
  [(NSMutableSet *)self->_connectedHIDDevices removeAllObjects];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F833C0] object:0];

  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F833C8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F83318] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F833B8] object:0];

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_DEFAULT, "Re-register for bluetooth notifications", v9, 2u);
  }

  uint64_t v8 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  [v8 setDelegate:self];

  [(CBCentralManager *)self->_centralManager setDelegate:self];
  [(BTSDevicesController *)self registerForNotifications];
  [(BTSDevicesController *)self reloadSpecifiers];
  self->_uiRefreshed = 1;
}

- (void)forcePushDetailViewForDevice:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v42 = "-[BTSDevicesController forcePushDetailViewForDevice:]";
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  id v6 = [(BTSDevicesController *)self navigationController];
  id v7 = [v6 topViewController];
  uint64_t v8 = [v7 childViewControllers];
  uint64_t v9 = [v8 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [(BTSDevicesController *)self navigationController];
    uint64_t v12 = [v11 topViewController];
    int v13 = [v12 childViewControllers];
    id v14 = [v13 firstObject];

    uint64_t v15 = [v14 device];
    unsigned int v16 = [v15 identifier];
    long long v17 = [v4 identifier];
    int v18 = [v16 isEqualToString:v17];

    if (v18)
    {
      uint64_t v19 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = (const char *)v4;
        _os_log_impl(&dword_23EB2E000, v19, OS_LOG_TYPE_DEFAULT, "Stop Force Push to Detail View because we're already in this page for device %@", buf, 0xCu);
      }
      goto LABEL_11;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x263F428D0]);
  id v20 = objc_alloc_init(MEMORY[0x263F5FC40]);
  [v14 setSpecifier:v20];

  id v21 = objc_alloc(MEMORY[0x263EFF9A0]);
  v39[0] = *MEMORY[0x263F5FFE0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = *MEMORY[0x263F60080];
  v40[0] = v22;
  v40[1] = @"BTSPairSetup";
  uint64_t v24 = *MEMORY[0x263F60228];
  v39[1] = v23;
  v39[2] = v24;
  v39[3] = *MEMORY[0x263F602A0];
  v40[2] = @"BTSPairController";
  v40[3] = @"PSLinkCell";
  uint64_t v25 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  uint64_t v19 = objc_msgSend(v21, "initWithDictionary:", v25, v39[0]);

  uint64_t v26 = [v4 name];
  [v19 setObject:v26 forKey:*MEMORY[0x263F602D0]];

  uint64_t v27 = [v4 identifier];
  [v19 setObject:v27 forKey:*MEMORY[0x263F60138]];

  [v19 setObject:@"BTSDeviceConfigController" forKey:v23];
  long long v28 = [v14 specifier];
  [v28 setProperties:v19];

  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v29 setObject:v4 forKey:@"bt-device"];
  if ([v4 isCTKDDevice])
  {
    centralManager = self->_centralManager;
    id v31 = [v4 classicDevice];
    id v32 = [v31 address];
    uint64_t v33 = [(CBCentralManager *)centralManager retrievePeripheralWithAddress:v32];

    ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
    id v35 = [v4 identifier];
    long long v36 = [(NSMutableDictionary *)ctkdCounterpartDevicesDict objectForKeyedSubscript:v35];

    [v29 setObject:v36 forKey:@"ctkd-device"];
  }
  __int16 v37 = [v14 specifier];
  [v37 setUserInfo:v29];

  uint64_t v38 = [(BTSDevicesController *)self navigationController];
  [v38 pushViewController:v14 animated:1];

LABEL_11:
}

- (id)mergeDualRadioDevices:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "Merging dual radio devices from AccessorySetupKit", buf, 2u);
  }

  id v31 = [MEMORY[0x263EFF9A0] dictionary];
  id v32 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v30 = v4;
  id v6 = [v4 allValues];
  uint64_t v34 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v34)
  {
    uint64_t v7 = *(void *)v37;
    unint64_t v8 = 0x268C0F000uLL;
    uint64_t v33 = v6;
    id v35 = self;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(NSObject **)(*((void *)&v36 + 1) + 8 * v9);
        uint64_t v11 = +[BTSDeviceLE deviceWithPeripheral:v10 manager:*(Class *)((char *)&self->super.super.super.super.super.isa + *(int *)(v8 + 2932))];
        uint64_t v12 = [v11 linkedRadioAddress];
        int v13 = sharedBluetoothSettingsLogComponent();
        id v14 = v13;
        if (v11) {
          BOOL v15 = v12 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v10;
            _os_log_error_impl(&dword_23EB2E000, v14, OS_LOG_TYPE_ERROR, "Peripheral does not have linked address: %@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v12;
            _os_log_impl(&dword_23EB2E000, v14, OS_LOG_TYPE_DEFAULT, "Device linked radio address: %@", buf, 0xCu);
          }

          id v14 = [(NSMutableDictionary *)v35->_devicesDict objectForKey:v12];
          if (!v14 || ![v11 isManagedByDeviceAccess]) {
            goto LABEL_23;
          }
          knownDADevices = v35->_knownDADevices;
          int v18 = [v10 identifier];
          uint64_t v19 = [(NSMutableDictionary *)knownDADevices objectForKeyedSubscript:v18];
          [v11 setUnderlyingDADevice:v19];

          ctkdCounterpartDevicesDict = v35->_ctkdCounterpartDevicesDict;
          id v21 = [v14 identifier];
          uint64_t v22 = [(NSMutableDictionary *)ctkdCounterpartDevicesDict objectForKeyedSubscript:v21];

          if (v22)
          {
            uint64_t v23 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v14;
              _os_log_error_impl(&dword_23EB2E000, v23, OS_LOG_TYPE_ERROR, "We cannot link to the new classic device because it's already linked to another LE device due to CTKD %@", buf, 0xCu);
            }

            [v32 addObject:v11];
            id v6 = v33;
LABEL_23:
            unint64_t v8 = 0x268C0F000;
            self = v35;
            goto LABEL_24;
          }
          uint64_t v24 = [v11 name];
          [v14 setAccessorySetupKitDisplayName:v24];

          self = v35;
          [(NSMutableDictionary *)v35->_devicesDict setObject:v14 forKey:v12];
          uint64_t v25 = [v14 identifier];
          [(NSMutableDictionary *)v31 setObject:v11 forKeyedSubscript:v25];

          uint64_t v26 = [v11 identifier];
          [(NSMutableDictionary *)v31 setObject:v14 forKeyedSubscript:v26];

          id v6 = v33;
          unint64_t v8 = 0x268C0F000;
        }
LABEL_24:

        ++v9;
      }
      while (v34 != v9);
      uint64_t v27 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
      uint64_t v34 = v27;
    }
    while (v27);
  }

  dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
  self->_dualRadioCounterpartDevicesDict = v31;

  return v32;
}

- (void)updateCTKDCounterparts:(id)a3 leDevice:(id)a4
{
  ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 identifier];
  [(NSMutableDictionary *)ctkdCounterpartDevicesDict setObject:v7 forKeyedSubscript:v9];

  uint64_t v10 = self->_ctkdCounterpartDevicesDict;
  id v11 = [v7 identifier];

  [(NSMutableDictionary *)v10 setObject:v8 forKeyedSubscript:v11];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(BTSDevicesController *)self indexForIndexPath:v5];
  uint64_t v7 = [(BTSDevicesController *)self indexOfSpecifierID:@"MY_DEVICES"];
  uint64_t v8 = (int)*MEMORY[0x263F5FDB8];
  unint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count];
  if (v6 > 255 || v7 >= 256)
  {
    id v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BTSDevicesController tableView:accessoryButtonTappedForRowWithIndexPath:]();
    }
  }
  else
  {
    if (v6 > v9 || v6 < v7)
    {
      id v11 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v5 row];
        uint64_t v18 = [v5 section];
        uint64_t v19 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count];
        int v23 = 134219008;
        uint64_t v24 = v17;
        __int16 v25 = 2048;
        uint64_t v26 = v18;
        __int16 v27 = 2048;
        uint64_t v28 = v6;
        __int16 v29 = 2048;
        uint64_t v30 = v7;
        __int16 v31 = 2048;
        uint64_t v32 = v19;
        _os_log_error_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_ERROR, "Invalid index %ld in section %ld; rowIndex : %ld\t myDevicesGroupIndex : %ld\ttotal specifiers count %lu",
          (uint8_t *)&v23,
          0x34u);
      }

      [(BTSDevicesController *)self reloadSpecifiers];
      uint64_t v6 = [(BTSDevicesController *)self indexForIndexPath:v5];
      uint64_t v12 = [(BTSDevicesController *)self indexOfSpecifierID:@"MY_DEVICES"];
      [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count];
      int v13 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v5 row];
        uint64_t v21 = [v5 section];
        uint64_t v22 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count];
        int v23 = 134219008;
        uint64_t v24 = v20;
        __int16 v25 = 2048;
        uint64_t v26 = v21;
        __int16 v27 = 2048;
        uint64_t v28 = v6;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_error_impl(&dword_23EB2E000, v13, OS_LOG_TYPE_ERROR, "Refreshed index %ld in section %ld; rowIndex : %ld\t myDevicesGroupIndex : %ld\ttotal specifiers count %lu",
          (uint8_t *)&v23,
          0x34u);
      }
    }
    id v14 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) objectAtIndex:v6];
    id v15 = objc_alloc_init(*(Class *)((char *)&v14->isa + (int)*MEMORY[0x263F5FE18]));
    *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE88]));
    [v15 setRootController:WeakRetained];

    [v15 setParentController:self];
    [v15 setSpecifier:v14];
    [(BTSDevicesController *)self showController:v15];
  }
}

- (BOOL)isDeviceSupported:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = objc_msgSend(MEMORY[0x263EFEF98], "isDeviceSupportedWithType:VIDsrc:VID:PID:", objc_msgSend(v3, "type"), objc_msgSend(v3, "vendorIdSrc"), (unsigned __int16)objc_msgSend(v3, "vendorId"), (unsigned __int16)objc_msgSend(v3, "productId"));
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v3 type];
    int v7 = [v3 vendorIdSrc];
    int v8 = [v3 vendorId];
    int v9 = [v3 productId];
    int v12 = 136316418;
    int v13 = "-[BTSDevicesController isDeviceSupported:]";
    uint64_t v10 = "UNSUPPORTED";
    int v15 = v6;
    __int16 v14 = 1024;
    if (v4) {
      uint64_t v10 = "SUPPORTED";
    }
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 2080;
    int v23 = v10;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_INFO, "%s - type=%d vendorSrc=%d VID=0x%04X PID=0x%04X: %s", (uint8_t *)&v12, 0x2Eu);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BTSDevicesController *)self specifierAtIndex:[(BTSDevicesController *)self indexForIndexPath:v7]];
  int v9 = [v8 userInfo];
  uint64_t v10 = [v9 objectForKey:@"bt-device"];

  if (!self->_bluetoothIsBusy)
  {
    id v11 = [(BTSDevicesController *)self specifierForID:@"DENYLIST_ACTION_ID"];

    if (v11 == v8)
    {
      int v12 = [MEMORY[0x263F2B998] sharedInstance];
      int v13 = [v12 denylistEnabled];

      if (v13)
      {
        __int16 v14 = [MEMORY[0x263F2B998] sharedInstance];
        [v14 setDenylistEnabled:0];

        [(BTSDevicesController *)self reloadSpecifiers];
      }
    }
  }
  if (v10)
  {
    int v15 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      if ([v16 state] == 6 || objc_msgSend(v16, "state") == 7)
      {
        [(BTSDevicesController *)self forcePushDetailViewForDevice:v10];
        [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) selectRowAtIndexPath:0 animated:1 scrollPosition:0];

LABEL_54:
        goto LABEL_55;
      }
    }
    if (self->_bluetoothIsBusy)
    {
LABEL_53:
      [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) selectRowAtIndexPath:0 animated:1 scrollPosition:0];
      goto LABEL_54;
    }
    if ([v10 connected] && (objc_msgSend(v10, "isTemporaryPairedDevice") & 1) == 0)
    {
      [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) selectRowAtIndexPath:0 animated:1 scrollPosition:0];
      __int16 v31 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BTSDevicesController tableView:didSelectRowAtIndexPath:](v10);
      }

      goto LABEL_54;
    }
    int v17 = [v10 classicDevice];
    BOOL v18 = [(BTSDevicesController *)self isDeviceSupported:v17];

    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v10;
        __int16 v20 = [v19 device];
        int v21 = [v20 isServiceSupported:4096];

        if (v21 && (self->_netClient || (__int16 v22 = (NETRBClient *)_NETRBClientCreate(), (self->_netClient = v22) != 0)))
        {
          v53[0] = 0;
          int v23 = 0;
          _NETRBClientGetHostCount();
        }
        else
        {
          int v23 = 0;
        }
      }
      else
      {
        int v23 = 0;
      }
      v53[0] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v10 connected] & 1) == 0
        && [v10 isApplePencil:v53])
      {
        [(BTSDevicesController *)self showPencilConnectionAttemptAlert:v53[0]];
      }
      else
      {
        sharingDevicesDict = self->_sharingDevicesDict;
        uint64_t v33 = [v10 identifier];
        uint64_t v34 = [(NSMutableDictionary *)sharingDevicesDict objectForKey:v33];

        if (v34)
        {
          [v10 unpair];
          id v35 = self->_sharingDevicesDict;
          long long v36 = [v10 identifier];
          [(NSMutableDictionary *)v35 removeObjectForKey:v36];

          [(BTSDevicesController *)self removeSpecifier:self->_sharingDevicesGroupSpec animated:1];
        }
        else
        {
          if (![(BTSDevicesController *)self isSupportCarPlaySetup:v10])
          {
            if ([v10 connect])
            {
              objc_storeStrong((id *)&self->_currentDeviceSpecifier, v8);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v41 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_peripheralConnectionTimeout_ selector:v10 userInfo:0 repeats:10.0];
                currentDeviceConnectionTimer = self->_currentDeviceConnectionTimer;
                self->_currentDeviceConnectionTimer = v41;

                uint64_t v43 = [MEMORY[0x263F2B998] sharedInstance];
                [v43 setDenylistEnabled:0];
              }
              [(BTSDevicesController *)self setBluetoothIsBusy:1];
              [(BTSDevicesController *)self allowBluetoothScans:0];
              id v44 = [v10 identifier];
              uint64_t v45 = [(BTSDevicesController *)self indexOfSpecifierID:v44];

              if (v45 != 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v46 = [v6 cellForRowAtIndexPath:v7];
                uint64_t v47 = 4;
                if (([v10 paired] & 1) == 0)
                {
                  if ([v10 isHealthDevice]) {
                    uint64_t v47 = 4;
                  }
                  else {
                    uint64_t v47 = 1;
                  }
                }
                [v46 setDeviceState:v47];
              }
            }
            goto LABEL_52;
          }
          [(BTSDevicesController *)self setBluetoothIsBusy:1];
          id v37 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([(BTSDevicesController *)self getLECarPlay:v37],
                (long long v38 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v39 = v38;

            int v40 = v39;
          }
          else
          {
            int v40 = 0;
            id v39 = v37;
          }
          [(BTSDevicesController *)self startOutgoingCarPlaySetup:v39];
          __int16 v48 = [v37 identifier];
          uint64_t v49 = [(BTSDevicesController *)self indexOfSpecifierID:v48];

          if (v49 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v50 = [v6 cellForRowAtIndexPath:v7];
            [v50 setDeviceState:1];
          }
        }
        int v23 = 0;
      }
    }
    else
    {
      __int16 v51 = (void *)MEMORY[0x263F82418];
      int v52 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v24 = [v52 localizedStringForKey:@"CANNOT_CONNECT_UNSUPPORTED_DEVICE_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
      __int16 v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v26 = [v25 localizedStringForKey:@"CANNOT_CONNECT_UNSUPPORTED_DEVICE_MESSAGE" value:&stru_26F24FEE8 table:@"Devices"];
      int v23 = [v51 alertControllerWithTitle:v24 message:v26 preferredStyle:1];

      __int16 v27 = (void *)MEMORY[0x263F82400];
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v29 = [v28 localizedStringForKey:@"OK" value:&stru_26F24FEE8 table:@"Devices"];
      uint64_t v30 = [v27 actionWithTitle:v29 style:1 handler:&__block_literal_global_637];
      [v23 addAction:v30];

      [(BTSDevicesController *)self presentViewController:v23 animated:1 completion:0];
    }
LABEL_52:

    goto LABEL_53;
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) selectRowAtIndexPath:0 animated:1 scrollPosition:0];
LABEL_55:
}

void __58__BTSDevicesController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBluetoothIsBusy:0];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 reloadSpecifierID:v3 animated:1];
}

uint64_t __58__BTSDevicesController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 1600))
  {
    v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_23EB2E000, v2, OS_LOG_TYPE_INFO, "Toggling Personal Hotspot to disconnect active clients", v4, 2u);
    }

    _NETRBClientSetGlobalServiceState();
    _NETRBClientSetGlobalServiceState();
    _NETRBClientDestroy();
    *(void *)(*(void *)(a1 + 32) + 1600) = 0;
  }
  return [*(id *)(a1 + 40) connect];
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (!a4
    || a4 == 1 && (self->_denylistEnabled || [(NSMutableDictionary *)self->_sharingDevicesDict count])
    || self->_denylistEnabled)
  {
    double v7 = 42.0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BTSDevicesController;
    [(BTSDevicesController *)&v10 tableView:v6 heightForFooterInSection:a4];
    double v7 = v9;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v61[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 || self->_denylistEnabled)
  {
    v59.receiver = self;
    v59.super_class = (Class)BTSDevicesController;
    double v7 = [(BTSDevicesController *)&v59 tableView:v6 viewForFooterInSection:a4];
    goto LABEL_4;
  }
  double v9 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  if (self->_bluetoothRestricted)
  {
    restrictionDetail = self->_restrictionDetail;
    id v58 = 0;
    uint64_t v11 = [NSString stringWithValidatedFormat:restrictionDetail, @"%@", &v58, v9 validFormatSpecifiers error];
    id v12 = v58;
    int v13 = v12;
    if (v11)
    {
      id v54 = v12;
      v56 = v9;
LABEL_12:
      v55 = v11;
      BOOL v18 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v11];
      int v19 = MGGetBoolAnswer();
      __int16 v20 = @"WIFI";
      if (v19) {
        __int16 v20 = @"WLAN";
      }
      int v21 = v20;
      __int16 v22 = [(BTSDevicesController *)self connectedPoorBehaviorDeviceNames];
      int v52 = v22;
      uint64_t v53 = v21;
      if ([v22 count])
      {
        if ((unint64_t)[v22 count] <= 1) {
          int v23 = @"SINGULAR";
        }
        else {
          int v23 = @"PLURAL";
        }
        uint64_t v24 = [NSString stringWithFormat:@"%@_DISCOVERABLE_WARNING_%@", v21, v23, v22, v21];
        __int16 v25 = [(BTSDevicesController *)self localizedList:v22];
        uint64_t v26 = NSString;
        __int16 v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v28 = [v27 localizedStringForKey:v24 value:&stru_26F24FEE8 table:@"Devices"];
        __int16 v29 = objc_msgSend(v26, "localizedStringWithFormat:", v28, v25);

        uint64_t v30 = [(BTSDevicesController *)self makeWarningAttributedString:v29];
        [v18 appendAttributedString:v30];
      }
      __int16 v31 = [(BTSDevicesController *)self connectedFirmwareUpdateRequiredDeviceNames];
      if ([v31 count])
      {
        if ((unint64_t)[v31 count] <= 1) {
          uint64_t v32 = @"SINGULAR";
        }
        else {
          uint64_t v32 = @"PLURAL";
        }
        uint64_t v33 = [NSString stringWithFormat:@"FIRMWARE_WARNING_%@", v32];
        uint64_t v34 = [(BTSDevicesController *)self localizedList:v31];
        id v35 = NSString;
        long long v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v37 = [v36 localizedStringForKey:v33 value:&stru_26F24FEE8 table:@"Devices"];
        long long v38 = objc_msgSend(v35, "localizedStringWithFormat:", v37, v34);

        id v39 = [(BTSDevicesController *)self makeWarningAttributedString:v38];
        [v18 appendAttributedString:v39];
      }
      int v40 = objc_opt_new();
      [v40 setAlignment:4];
      uint64_t v41 = [MEMORY[0x263F82918] groupedFooterConfiguration];
      id v42 = [v41 textProperties];
      uint64_t v43 = [v42 font];

      id v44 = [v41 textProperties];
      uint64_t v45 = [v44 color];

      uint64_t v46 = *MEMORY[0x263F814F0];
      v60[0] = *MEMORY[0x263F81500];
      v60[1] = v46;
      v61[0] = v45;
      v61[1] = v43;
      v60[2] = *MEMORY[0x263F81540];
      v61[2] = v40;
      uint64_t v47 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
      objc_msgSend(v18, "addAttributes:range:", v47, 0, objc_msgSend(v18, "length"));

      double v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"MainGroupFooterId"];
      __int16 v48 = [v7 textLabel];
      [v48 setTextAlignment:4];

      uint64_t v49 = [v7 textLabel];
      [v49 setNumberOfLines:0];

      id v50 = [v7 textLabel];
      [v50 setAttributedText:v18];

      self->_mainFooterNeedsUpdate = 1;
      int v15 = v55;
      double v9 = v56;
      int v13 = v54;
      goto LABEL_31;
    }
    int v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BTSDevicesController tableView:viewForFooterInSection:]();
    }
  }
  else
  {
    __int16 v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v15 = [v14 localizedStringForKey:@"DISCOVERABLE" value:&stru_26F24FEE8 table:@"Devices"];

    id v57 = 0;
    uint64_t v16 = [NSString stringWithValidatedFormat:v15, @"%@", &v57, v9 validFormatSpecifiers error];
    id v17 = v57;
    int v13 = v17;
    if (v16)
    {
      id v54 = v17;
      v56 = v9;

      uint64_t v11 = v16;
      goto LABEL_12;
    }
    __int16 v51 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[BTSDevicesController tableView:viewForFooterInSection:]();
    }
  }
  double v7 = 0;
LABEL_31:

LABEL_4:

  return v7;
}

- (void)showSyncContactsPopup:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v34 = "-[BTSDevicesController showSyncContactsPopup:]";
    __int16 v35 = 2048;
    long long v36 = self;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing Sync Contacts Popup from BTSDeviceController instance %p, for device: %@", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke;
  aBlock[3] = &unk_26503DCA8;
  aBlock[4] = self;
  id v32 = v4;
  id v26 = v4;
  __int16 v25 = _Block_copy(aBlock);
  id v6 = (void *)MEMORY[0x263F82418];
  double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"SYNC_CONTACTS_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
  double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v10 = [v9 localizedStringForKey:@"SYNC_CARPLAY_CONTACTS_MESSAGE" value:&stru_26F24FEE8 table:@"Devices"];
  uint64_t v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];
  syncContactsCarplayAlert = self->_syncContactsCarplayAlert;
  self->_syncContactsCarplayAlert = v11;

  int v13 = self->_syncContactsCarplayAlert;
  __int16 v14 = (void *)MEMORY[0x263F82400];
  int v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"SYNC_DISALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke_2;
  v29[3] = &unk_26503DCD0;
  id v17 = v25;
  id v30 = v17;
  BOOL v18 = [v14 actionWithTitle:v16 style:1 handler:v29];
  [(UIAlertController *)v13 addAction:v18];

  int v19 = self->_syncContactsCarplayAlert;
  __int16 v20 = (void *)MEMORY[0x263F82400];
  int v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v22 = [v21 localizedStringForKey:@"SYNC_ALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke_3;
  v27[3] = &unk_26503DCD0;
  id v28 = v17;
  id v23 = v17;
  uint64_t v24 = [v20 actionWithTitle:v22 style:0 handler:v27];
  [(UIAlertController *)v19 addAction:v24];

  [(BTSDevicesController *)self presentViewController:self->_syncContactsCarplayAlert animated:1 completion:0];
}

void __46__BTSDevicesController_showSyncContactsPopup___block_invoke(uint64_t a1, int a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1544) userInfo];
  [v4 setObject:@"accepted" forKey:@"PIN-ended"];

  id v5 = [MEMORY[0x263F2B998] sharedInstance];
  [v5 acceptSSP:0 forDevice:*(void *)(a1 + 40)];

  int v6 = [*(id *)(a1 + 40) syncSettings];
  uint64_t v7 = 0x100000000;
  if (a2) {
    uint64_t v7 = 0x100000100;
  }
  [*(id *)(a1 + 40) setSyncSettings:v7 | v6 & 0xFFFF00FF];
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 1576);
  *(void *)(v8 + 1576) = 0;

  if (a2)
  {
    objc_super v10 = *(void **)(*(void *)(a1 + 32) + 1448);
    uint64_t v11 = [*(id *)(a1 + 40) address];
    id v12 = [v10 objectForKeyedSubscript:v11];

    [*(id *)(a1 + 32) forcePushDetailViewForDevice:v12];
  }
}

uint64_t __46__BTSDevicesController_showSyncContactsPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__BTSDevicesController_showSyncContactsPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showSyncContactsPrivacyPopup:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "-[BTSDevicesController showSyncContactsPrivacyPopup:]";
    __int16 v57 = 2048;
    id v58 = self;
    __int16 v59 = 2112;
    id v60 = v5;
    _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "%s Showing Sync Contacts Popup from BTSDeviceController instance %p, for device: %@", buf, 0x20u);
  }

  objc_storeStrong((id *)&_currentDevice, a3);
  uint64_t v45 = v5;
  if (MGGetBoolAnswer())
  {
    *(_DWORD *)buf = 0;
    v53[0] = *MEMORY[0x263EFFFC8];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"SYNC_CONTACTS_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
    v54[0] = v8;
    v53[1] = *MEMORY[0x263EFFFD8];
    double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v10 = [v9 localizedStringForKey:@"SYNC_BLUETOOTH_CONTACTS_MESSAGE" value:&stru_26F24FEE8 table:@"Devices"];
    uint64_t v11 = *MEMORY[0x263EFFFE0];
    v54[1] = v10;
    v54[2] = MEMORY[0x263EFFA88];
    uint64_t v12 = *MEMORY[0x263EFFFE8];
    v53[2] = v11;
    _DWORD v53[3] = v12;
    int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v14 = [v13 localizedStringForKey:@"SYNC_DISALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
    v54[3] = v14;
    v53[4] = *MEMORY[0x263F00000];
    int v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"SYNC_ALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
    v54[4] = v16;
    CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];

    BOOL v18 = v45;
    objc_storeStrong((id *)&_currentControllerInstance, self);
    devicesDict = self->_devicesDict;
    __int16 v20 = [v45 address];
    uint64_t v21 = [(NSMutableDictionary *)devicesDict objectForKeyedSubscript:v20];
    __int16 v22 = (void *)_currentBTSDevice;
    _currentBTSDevice = v21;

    [(BTSDevicesController *)self setNotification:CFUserNotificationCreate(0, 100.0, 3uLL, (SInt32 *)buf, v17)];
    [(BTSDevicesController *)self setRunLoopSource:CFUserNotificationCreateRunLoopSource(0, [(BTSDevicesController *)self notification], (CFUserNotificationCallBack)NotificationCallback, 0)];
    Maiuint64_t n = CFRunLoopGetMain();
    uint64_t v24 = [(BTSDevicesController *)self runLoopSource];
    CFRunLoopAddSource(Main, v24, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke;
    aBlock[3] = &unk_26503DCA8;
    id v51 = v5;
    int v52 = self;
    id v44 = _Block_copy(aBlock);
    __int16 v25 = (void *)MEMORY[0x263F82418];
    id v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v27 = [v26 localizedStringForKey:@"SYNC_CONTACTS_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
    id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v29 = [v28 localizedStringForKey:@"SYNC_BLUETOOTH_CONTACTS_MESSAGE" value:&stru_26F24FEE8 table:@"Devices"];
    id v30 = [v25 alertControllerWithTitle:v27 message:v29 preferredStyle:1];
    syncContactsPrivacyAlert = self->_syncContactsPrivacyAlert;
    self->_syncContactsPrivacyAlert = v30;

    id v32 = self->_syncContactsPrivacyAlert;
    uint64_t v33 = (void *)MEMORY[0x263F82400];
    uint64_t v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v35 = [v34 localizedStringForKey:@"SYNC_DISALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_2;
    v48[3] = &unk_26503DCD0;
    id v36 = v44;
    id v49 = v36;
    __int16 v37 = [v33 actionWithTitle:v35 style:1 handler:v48];
    [(UIAlertController *)v32 addAction:v37];

    id v38 = self->_syncContactsPrivacyAlert;
    uint64_t v39 = (void *)MEMORY[0x263F82400];
    int v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v41 = [v40 localizedStringForKey:@"SYNC_ALLOW_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_3;
    v46[3] = &unk_26503DCD0;
    id v47 = v36;
    id v42 = v36;
    uint64_t v43 = [v39 actionWithTitle:v41 style:0 handler:v46];
    [(UIAlertController *)v38 addAction:v43];

    BOOL v18 = v45;
    [(BTSDevicesController *)self presentViewController:self->_syncContactsPrivacyAlert animated:1 completion:0];
  }
}

void __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke(uint64_t a1, int a2)
{
  int v4 = [*(id *)(a1 + 32) syncSettings];
  uint64_t v5 = 0x100000000;
  if (a2) {
    uint64_t v5 = 0x100000100;
  }
  [*(id *)(a1 + 32) setSyncSettings:v5 | v4 & 0xFFFF00FF];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 1592);
  *(void *)(v6 + 1592) = 0;

  uint64_t v8 = (void *)_currentDevice;
  _currentDevice = 0;

  if (a2)
  {
    double v9 = *(void **)(*(void *)(a1 + 40) + 1448);
    objc_super v10 = [*(id *)(a1 + 32) address];
    id v11 = [v9 objectForKeyedSubscript:v10];

    [*(id *)(a1 + 40) forcePushDetailViewForDevice:v11];
  }
}

uint64_t __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showPencilConnectionAttemptAlert:(int)a3
{
  id v17 = objc_alloc_init(NSString);
  if ((a3 - 1) >= 2)
  {
    if (a3) {
      goto LABEL_6;
    }
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = v5;
    uint64_t v7 = @"PLUG_IN_APPLE_PENCIL";
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = v5;
    uint64_t v7 = @"ATTACH_APPLE_PENCIL";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26F24FEE8 table:@"Devices"];

  id v17 = (id)v8;
LABEL_6:
  double v9 = (void *)MEMORY[0x263F82418];
  objc_super v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"APPLE_PENCIL_NOT_CONNECTED_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
  uint64_t v12 = [v9 alertControllerWithTitle:v11 message:v17 preferredStyle:1];

  int v13 = (void *)MEMORY[0x263F82400];
  __int16 v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v15 = [v14 localizedStringForKey:@"CLOSE" value:&stru_26F24FEE8 table:@"Devices"];
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:&__block_literal_global_704];

  [v12 addAction:v16];
  [(BTSDevicesController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)effectiveMCSettingsDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__BTSDevicesController_effectiveMCSettingsDidChange___block_invoke;
  block[3] = &unk_26503DB08;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__BTSDevicesController_effectiveMCSettingsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    void block[5] = v3;
    block[6] = v4;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__BTSDevicesController_startedConnectionAttemptOnTransport___block_invoke;
    block[3] = &unk_26503DB08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __60__BTSDevicesController_startedConnectionAttemptOnTransport___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allowBluetoothScans:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1525) = 1;
  return result;
}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    void block[5] = v3;
    block[6] = v4;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__BTSDevicesController_cancelledConnectionAttemptOnTransport___block_invoke;
    block[3] = &unk_26503DB08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

unsigned char *__62__BTSDevicesController_cancelledConnectionAttemptOnTransport___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[1525])
  {
    uint64_t result = (unsigned char *)[result allowBluetoothScans:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 1525) = 0;
  }
  return result;
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v4 = [a3 configuration];
  uint64_t v5 = [v4 transportType];

  if (v5 == 3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__BTSDevicesController_sessionDidConnect___block_invoke;
    block[3] = &unk_26503DB08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

unsigned char *__42__BTSDevicesController_sessionDidConnect___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[1525])
  {
    uint64_t result = (unsigned char *)[result allowBluetoothScans:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 1525) = 0;
  }
  return result;
}

- (void)showUpgradeOSPopup:(id)a3
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke;
  aBlock[3] = &unk_26503DCF8;
  void aBlock[4] = self;
  id v23 = _Block_copy(aBlock);
  uint64_t v4 = (void *)MEMORY[0x263F82418];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"SW_UPDATE_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"SW_UPDATE_MESSAGE" value:&stru_26F24FEE8 table:@"Devices"];
  double v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  swUpdateAlert = self->_swUpdateAlert;
  self->_swUpdateAlert = v9;

  id v11 = self->_swUpdateAlert;
  uint64_t v12 = (void *)MEMORY[0x263F82400];
  int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v14 = [v13 localizedStringForKey:@"SW_UPDATE_CLOSE_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  void v26[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_2;
  v26[3] = &unk_26503DCD0;
  id v15 = v23;
  id v27 = v15;
  uint64_t v16 = [v12 actionWithTitle:v14 style:1 handler:v26];
  [(UIAlertController *)v11 addAction:v16];

  id v17 = self->_swUpdateAlert;
  BOOL v18 = (void *)MEMORY[0x263F82400];
  int v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v20 = [v19 localizedStringForKey:@"SW_UPDATE_CHECK_BUTTON" value:&stru_26F24FEE8 table:@"Devices"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_3;
  v24[3] = &unk_26503DCD0;
  id v25 = v15;
  id v21 = v15;
  __int16 v22 = [v18 actionWithTitle:v20 style:0 handler:v24];
  [(UIAlertController *)v17 addAction:v22];

  [(BTSDevicesController *)self presentViewController:self->_swUpdateAlert animated:1 completion:0];
}

void __43__BTSDevicesController_showUpgradeOSPopup___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1584);
  *(void *)(v3 + 1584) = 0;

  if (a2)
  {
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v5 = [NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
    [v6 openSensitiveURL:v5 withOptions:0];
  }
}

uint64_t __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getLECarPlay:(id)a3
{
  id v4 = a3;
  if ([v4 paired])
  {
    centralManager = self->_centralManager;
    id v6 = [v4 identifier];
    uint64_t v7 = [(CBCentralManager *)centralManager retrievePeripheralWithAddress:v6];

    if (v7 && [v7 hasTag:@"_CARPLAY_DEVICE_"])
    {
      uint64_t v8 = +[BTSDeviceLE deviceWithPeripheral:v7 manager:self->_centralManager];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isSupportCarPlaySetup:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(BTSDevicesController *)self isiPhone]
    || ![(BTSDevicesController *)self isCarPlaySetupEnabled])
  {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v4 paired] & 1) == 0 && objc_msgSend(v4, "isCarPlayDevice"))
    {
      uint64_t v5 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "Unpaired classic CarPlay, no CarPlay setup: %@", (uint8_t *)&v10, 0xCu);
      }
      BOOL v6 = 0;
      goto LABEL_19;
    }
    if ([(BTSDevicesController *)self isLECarPlayEnabled])
    {
      uint64_t v8 = [(BTSDevicesController *)self getLECarPlay:v4];

      if (v8)
      {
        uint64_t v5 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          id v11 = v4;
          uint64_t v7 = "Paired classic device with LE CarPlay: %@";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
LABEL_20:
    BOOL v6 = 0;
    goto LABEL_21;
  }
  if (![(BTSDevicesController *)self isLECarPlayEnabled]
    || ![v4 isCarPlayDevice])
  {
    goto LABEL_20;
  }
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    uint64_t v7 = "LE only CarPlay: %@";
LABEL_17:
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
  }
LABEL_18:
  BOOL v6 = 1;
LABEL_19:

LABEL_21:
  return v6;
}

- (BOOL)isLECarPlayEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableBLE", @"com.apple.carplay", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isCarPlaySetupEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x263F30E88]);
  BOOL v3 = [v2 isCarPlaySetupEnabled];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)startOutgoingCarPlaySetup:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  uint64_t v7 = v6;
  if (isKindOfClass)
  {
    uint64_t v8 = [v6 device];
    double v9 = [v8 address];
    [(BTSDevicesController *)self allowBluetoothConnections:0];
    int v10 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_23EB2E000, v10, OS_LOG_TYPE_DEFAULT, "CarPlay setup for classic device, %@", buf, 0xCu);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v8);
    objc_copyWeak(&v12, (id *)buf);
    CRStartBluetoothClassicPairing();
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v8 = [v6 identifier];
    double v9 = [v7 name];
    id v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_DEFAULT, "CarPlay setup for le device, UUID: %@", buf, 0xCu);
    }

    CRConnectBluetoothLE();
  }
}

void __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2;
  block[3] = &unk_26503DD20;
  char v8 = a2;
  block[4] = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = sharedBluetoothSettingsLogComponent();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EB2E000, v3, OS_LOG_TYPE_DEFAULT, "successfully classic CarPlay paired", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23EB2E000, v3, OS_LOG_TYPE_DEFAULT, "failed to pair classic CarPlay", v7, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    BOOL v3 = [*(id *)(a1 + 40) address];
    [v5 reloadSpecifierID:v3];
  }

  return [*(id *)(a1 + 32) setBluetoothIsBusy:0];
}

void __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_730(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2_731;
  v2[3] = &unk_26503DD70;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2_731(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = sharedBluetoothSettingsLogComponent();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v9 = 0;
      id v5 = "successfully LE CarPlay paired";
      id v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_23EB2E000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v8 = 0;
    id v5 = "failed to pair LE CarPlay";
    id v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return [*(id *)(a1 + 32) setBluetoothIsBusy:0];
}

- (void)startIncomingCarPlaySetup:(id)a3 andPasskey:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 address];
  __int16 v8 = [v5 name];
  __int16 v9 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", objc_msgSend(v6, "unsignedIntValue"));
  int v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_23EB2E000, v10, OS_LOG_TYPE_DEFAULT, "CarPlay setup for classic device, %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, v5);
  objc_copyWeak(&v11, (id *)buf);
  CRConfirmAndContinueBluetoothClassicPairing();
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke_2;
  block[3] = &unk_26503DD20;
  char v8 = a2;
  block[4] = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    int v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      char v3 = "successfully classic CarPlay paired";
      BOOL v4 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_23EB2E000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) address];
    [v5 reloadSpecifierID:v6];

    int v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      char v3 = "failed to pair classic CarPlay";
      BOOL v4 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

  return [*(id *)(a1 + 32) setBluetoothIsBusy:0];
}

- (void)migrateHKPairedHealthDevices
{
  if (_os_feature_enabled_impl())
  {
    char v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    BOOL v4 = [v3 persistentDomainForName:@"com.apple.bluetooth.settings"];
    id v5 = [v4 objectForKey:@"HRM_MIGRATION_COMPLETE"];
    if (([v5 isEqualToString:@"1"] & 1) == 0)
    {
      if ([MEMORY[0x263F0A410] isHealthDataAvailable])
      {
        locatiouint64_t n = 0;
        objc_initWeak(&location, self);
        healthKitStore = self->_healthKitStore;
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke;
        v7[3] = &unk_26503DDE8;
        objc_copyWeak(&v10, &location);
        id v8 = v4;
        id v9 = v3;
        [(HKHealthStore *)healthKitStore healthPeripheralsWithFilter:1 handler:v7];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2;
  v5[3] = &unk_26503DDC0;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v23 = a1;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      uint64_t v25 = *MEMORY[0x263F09E38];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v10 = (void *)v4[201];
          id v11 = objc_msgSend(v9, "identifier", v23);
          __int16 v37 = v11;
          id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
          uint64_t v13 = [v10 retrievePeripheralsWithIdentifiers:v12];
          uint64_t v14 = [v13 firstObject];

          if (v14)
          {
            [v14 tag:v25];
            [v14 setCustomProperty:@"Fitness" value:@"1"];
            id v15 = (void *)v4[202];
            uint64_t v16 = [v9 identifier];
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            void v26[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_744;
            v26[3] = &unk_26503DD98;
            void v26[4] = v9;
            id v27 = v14;
            id v28 = v4;
            [v15 getEnabledStatusForPeripheral:v16 withCompletion:v26];
          }
          else
          {
            id v17 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2_cold_1(v35, v9, &v36, v17);
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v6);
    }

    BOOL v18 = (void *)[*(id *)(v23 + 40) mutableCopy];
    [v18 setObject:@"1" forKey:@"HRM_MIGRATION_COMPLETE"];
    int v19 = *(void **)(v23 + 48);
    __int16 v20 = (void *)[v18 copy];
    [v19 setPersistentDomain:v20 forName:@"com.apple.bluetooth.settings"];

    id v21 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [*(id *)(v23 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = v22;
      _os_log_impl(&dword_23EB2E000, v21, OS_LOG_TYPE_DEFAULT, "HRM migration complete. Migrated %lu devices", buf, 0xCu);
    }
  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_744(uint64_t a1, int a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_744_cold_1(a1, v4);
    }

    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = @"1";
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (a2) {
      uint64_t v6 = @"1";
    }
    else {
      uint64_t v6 = @"0";
    }
  }
  [v5 setCustomProperty:@"UpdateHealth" value:v6];
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = (void *)v7[202];
  uint64_t v9 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_748;
  v10[3] = &unk_26503DD98;
  void v10[4] = v9;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  [v8 removeHealthServicePairing:v9 withCompletion:v10];
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  uint64_t v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_748_cold_1(a1, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      id v8 = [v7 UUIDString];
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "Successfully migrated HRM device from HK to BT for identifier %@", buf, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 40) _getDeviceForPeripheral:*(void *)(a1 + 48)];
    id v10 = v9;
    if (v9)
    {
      [v9 setHealthDevice:1];
      [*(id *)(*(void *)(a1 + 40) + 1624) addObject:v10];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_749;
    v11[3] = &unk_26503DA40;
    id v12 = *(id *)(a1 + 40);
    id v13 = v10;
    uint64_t v6 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_749(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + (int)*MEMORY[0x263F5FDB8]))
  {
    id v3 = *(void **)(v1 + 1448);
    id v4 = [*(id *)(a1 + 40) identifier];
    uint64_t v5 = [v3 objectForKey:v4];

    if (!v5)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 _addDevice:v7];
    }
  }
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notificatiouint64_t n = a3;
}

- (int)bluetoothSettingsAppStateNotifyToken
{
  return self->_bluetoothSettingsAppStateNotifyToken;
}

- (void)setBluetoothSettingsAppStateNotifyToken:(int)a3
{
  self->_bluetoothSettingsAppStateNotifyTokeuint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSetupDeviceID, 0);
  objc_storeStrong((id *)&self->_knownDADevices, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_invokingClientID, 0);
  objc_storeStrong((id *)&self->_deviceAccessSession, 0);
  objc_storeStrong((id *)&self->_exposureNotificationManager, 0);
  objc_storeStrong((id *)&self->_carplayStatus, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_retrievedHealthServices, 0);
  objc_storeStrong((id *)&self->_knownHealthDevices, 0);
  objc_storeStrong((id *)&self->_healthKitStore, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_syncContactsPrivacyAlert, 0);
  objc_storeStrong((id *)&self->_swUpdateAlert, 0);
  objc_storeStrong((id *)&self->_syncContactsCarplayAlert, 0);
  objc_storeStrong((id *)&self->_sspAlert, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_currentDeviceConnectionTimer, 0);
  objc_storeStrong((id *)&self->_currentDeviceSpecifier, 0);
  objc_storeStrong((id *)&self->_restrictionDetail, 0);
  objc_storeStrong((id *)&self->_healthServices, 0);
  objc_storeStrong((id *)&self->_connectedHIDDevices, 0);
  objc_storeStrong((id *)&self->_connectedFirmwareUpdateRequiredDevices, 0);
  objc_storeStrong((id *)&self->_connectedPoorBehaviorDevices, 0);
  objc_storeStrong((id *)&self->_pendingDAInfoDevicesDict, 0);
  objc_storeStrong((id *)&self->_deviceAccessDevicesDict, 0);
  objc_storeStrong((id *)&self->_ctkdLeDevicesDict, 0);
  objc_storeStrong((id *)&self->_sharingDevicesDict, 0);
  objc_storeStrong((id *)&self->_devicesDict, 0);
  objc_storeStrong((id *)&self->_pendingOtherRadioDevicesDict, 0);
  objc_storeStrong((id *)&self->_dualRadioCounterpartDevicesDict, 0);
  objc_storeStrong((id *)&self->_ctkdCounterpartDevicesDict, 0);
  objc_storeStrong((id *)&self->_sharingDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->_otherDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->_myDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->supportsBackgroundNIDictionary, 0);

  objc_storeStrong((id *)&self->managedByWalletDictionary, 0);
}

- (void)init
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23EB2E000, log, OS_LOG_TYPE_ERROR, "Failed to create an BluetoothSettings App state notification token", v1, 2u);
}

void __28__BTSDevicesController_init__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, v0, v1, "Failed to retrieve registered health devices with error %@", v2);
}

- (void)authenticationRequestHandler:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_23EB2E000, v1, OS_LOG_TYPE_ERROR, "Ignoring authentication request as there's something pending user interaction: _sspAlert(%@), _alert(%@), _syncContactsCarplayAlert(%@)", v2, 0x20u);
}

- (void)authenticationRequestHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[BTSDevicesController authenticationRequestHandler:]";
  OUTLINED_FUNCTION_3(&dword_23EB2E000, a1, a3, "%s device notification does not match current device - not forwarding pairing request", (uint8_t *)&v3);
}

void __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_8(v0) identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_23EB2E000, v2, v3, "Failed to unregister peripheral %@ with error \"%@\"", v4, v5, v6, v7, v8);
}

- (void)peripheral:didDiscoverServices:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23EB2E000, v0, OS_LOG_TYPE_DEBUG, "Pairing HRM device: %@", v1, 0xCu);
}

- (void)peripheral:didDiscoverServices:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23EB2E000, v0, OS_LOG_TYPE_DEBUG, "Device %@ supports health service(s): %@", v1, 0x16u);
}

- (void)peripheral:didDiscoverServices:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_23EB2E000, v0, v1, "Failed to discover services for device %@ with error \"%@\"");
}

void __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_23EB2E000, v1, OS_LOG_TYPE_ERROR, "Failed to register peripheral %@ for services %@ with error \"%@\"", v2, 0x20u);
}

- (void)_getDeviceForPeripheral:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_23EB2E000, log, OS_LOG_TYPE_DEBUG, "CTKD : Apple Watches are special", v1, 2u);
}

- (void)_getDeviceForPeripheral:.cold.2()
{
  OUTLINED_FUNCTION_9();
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [v2 name];
  int v4 = 138413058;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = [v1 isCTKDDevice];
  __int16 v8 = 1024;
  int v9 = [v1 isManagedByWallet];
  __int16 v10 = 1024;
  int v11 = [v1 isManagedByAliroWallet];
  _os_log_debug_impl(&dword_23EB2E000, v0, OS_LOG_TYPE_DEBUG, "CTKD : classic device found in list %@ with CTKD : %d with ManagedByWallet: %d ManagedByAliroWallet: %d", (uint8_t *)&v4, 0x1Eu);
}

- (void)_getDeviceForCTKDPeripheral:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, v0, v1, "CTKD : Classic CTKD device not found in device list : %@", v2);
}

- (void)_addDeviceSpecifier:withDevice:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([v2 isMyDevice]) {
    int v4 = "known";
  }
  else {
    int v4 = "other";
  }
  uint64_t v5 = [v3 name];
  int v6 = 136315650;
  int v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v1;
  _os_log_debug_impl(&dword_23EB2E000, v0, OS_LOG_TYPE_DEBUG, "Adding \"%s\" device %@ at index %lu", (uint8_t *)&v6, 0x20u);
}

- (void)healthDeviceUnregisteredHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23EB2E000, v0, OS_LOG_TYPE_DEBUG, "Unregistering health device %@", v1, 0xCu);
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, a2, v4, "Error retrieving Fitness peripherals: %@", v5);
}

- (void)_updateDevicePosition:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_23EB2E000, v2, v3, "Updating position of device %@", v4, v5, v6, v7, v8);
}

- (void)tableView:accessoryButtonTappedForRowWithIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_1(&dword_23EB2E000, v0, v1, "Invalid rowIndex : %ld\t myDevicesGroupIndex:%ld", v2, v3);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.1(void *a1)
{
  os_log_t v1 = [a1 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_23EB2E000, v2, v3, "Device %@ is already connected. No further action to be taken.", v4, v5, v6, v7, v8);
}

- (void)tableView:viewForFooterInSection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_23EB2E000, v0, v1, "bad format string for devices table view (B) (%@): %@");
}

- (void)tableView:viewForFooterInSection:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23EB2E000, v0, v1, "bad format string for devices table view (A) (%@): %@");
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  uint8_t v8 = [v7 UUIDString];
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl(&dword_23EB2E000, a4, OS_LOG_TYPE_ERROR, "Failed to migrate HealthKit HRM with identifier %@. CBPeripheral does not exist", a1, 0xCu);
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_744_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_8(a1) identifier];
  uint64_t v4 = [v3 UUIDString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, a2, v5, "Failed to get HKHealthService enabled status during HRM migration for identifier %@", v6);
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_748_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_8(a1) identifier];
  uint64_t v4 = [v3 UUIDString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23EB2E000, a2, v5, "Failed to remove HKHealthService pairing during HRM migration for identifier %@", v6);
}

@end