@interface HFAccessorySettingDeviceOptionsAdapterUtility
- (HFAccessorySettingDeviceOptionsAdapterUtility)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4 groupedAccessory:(BOOL)a5 delegate:(id)a6;
- (HFAccessorySettingDeviceOptionsAdapterUtilityDelegate)delegate;
- (HFMediaProfileContainer)mediaProfileContainer;
- (RPCompanionLinkClient)discoveryLink;
- (id)_reachableDevices:(id)a3;
- (id)_sendRapportMessageToAccessoriesWithRequestID:(id)a3 request:(id)a4 options:(id)a5;
- (id)_sendRapportMessageToAccessoryWithRequestID:(id)a3 request:(id)a4 options:(id)a5;
- (id)_sendRapportMessageToDevice:(id)a3 requestID:(id)a4 request:(id)a5 options:(id)a6;
- (id)extractWiFiInfo;
- (id)identifyAccessory;
- (id)requestAirDrop:(id)a3;
- (id)requestSysdiagnose:(id)a3 options:(id)a4;
- (id)resetAccessory;
- (id)restartAccessories;
- (id)restartAccessory;
- (unint64_t)rapportClientActivationFailCount;
- (void)_resetRapportClientWithInvalidation:(BOOL)a3;
- (void)_setupRapportClient;
- (void)_updateRapportReachable;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryLink:(id)a3;
- (void)setMediaProfileContainer:(id)a3;
- (void)setRapportClientActivationFailCount:(unint64_t)a3;
@end

@implementation HFAccessorySettingDeviceOptionsAdapterUtility

- (HFAccessorySettingDeviceOptionsAdapterUtility)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4 groupedAccessory:(BOOL)a5 delegate:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  if (a4)
  {
    v11 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HFAccessorySettingDeviceOptionsAdapterUtility;
    v12 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)&v20 init];
    if (v12)
    {
      id v13 = v9;
      v14 = &unk_26C155B48;
      if ([v13 conformsToProtocol:v14]) {
        v15 = v13;
      }
      else {
        v15 = 0;
      }
      v16 = v15;

      mediaProfileContainer = v12->_mediaProfileContainer;
      v12->_mediaProfileContainer = v16;

      objc_storeWeak((id *)&v12->_delegate, v10);
      v18 = HFLogForCategory(0x38uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v12;
        __int16 v23 = 2080;
        v24 = "-[HFAccessorySettingDeviceOptionsAdapterUtility initWithHomeKitSettingsVendor:mode:groupedAccessory:delegate:]";
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s Instantiated utility class, about to reset rapport client, with media profile container %@", buf, 0x20u);
      }

      [(HFAccessorySettingDeviceOptionsAdapterUtility *)v12 _resetRapportClientWithInvalidation:1];
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (id)requestSysdiagnose:(id)a3 options:(id)a4
{
  return [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.homepod.SysdiagnoseOnly" request:a3 options:a4];
}

- (id)identifyAccessory
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HFAccessorySettingDeviceOptionsAdapterUtility identifyAccessory]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.identify" request:0 options:0];
  return v4;
}

- (id)restartAccessory
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HFAccessorySettingDeviceOptionsAdapterUtility restartAccessory]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.SoundBoard.RebootDeviceRequest" request:0 options:0];
  return v4;
}

- (id)restartAccessories
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HFAccessorySettingDeviceOptionsAdapterUtility restartAccessories]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoriesWithRequestID:@"com.apple.SoundBoard.RebootDeviceRequest" request:0 options:0];
  return v4;
}

- (id)resetAccessory
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HFAccessorySettingDeviceOptionsAdapterUtility resetAccessory]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.SoundBoard.ObliterateRequest" request:0 options:0];
  return v4;
}

- (id)requestAirDrop:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Sending AirDrop request for results: %@", buf, 0xCu);
  }

  int v6 = [v4 objectForKeyedSubscript:@"sysdiagnosePath"];
  if ([v6 length])
  {
    v7 = +[HFUtilities deviceAirDropIdentifier];
    if ([v7 length])
    {
      v20[0] = v7;
      uint64_t v8 = NSNumber;
      id v9 = objc_msgSend(MEMORY[0x263EFF910], "date", @"airDropDeviceIdentifier", @"com.apple.Home.RapportRequest");
      [v9 timeIntervalSince1970];
      id v10 = objc_msgSend(v8, "numberWithDouble:");
      v19[2] = @"sysdiagnosePath";
      v20[1] = v10;
      v20[2] = v6;
      v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

      uint64_t v12 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.homepod.AirDropFile" request:v11 options:0];
    }
    else
    {
      v16 = HFLogForCategory(0x38uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Invalid (Empty) airDropID", buf, 2u);
      }

      v17 = (void *)MEMORY[0x263F58190];
      v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 25, @"Invalid AirDrop ID", 0);
      uint64_t v12 = [v17 futureWithError:v11];
    }
    v15 = (void *)v12;
  }
  else
  {
    id v13 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Invalid (Empty) Sysdiagnose Path", buf, 2u);
    }

    v14 = (void *)MEMORY[0x263F58190];
    v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 25, @"Invalid Sysdiagnose Path", 0);
    v15 = [v14 futureWithError:v7];
  }

  return v15;
}

- (id)extractWiFiInfo
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[HFAccessorySettingDeviceOptionsAdapterUtility extractWiFiInfo]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToAccessoryWithRequestID:@"com.apple.SoundBoard.ExtractWiFiInfo" request:0 options:0];
  return v4;
}

- (void)_setupRapportClient
{
  v3 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc_init(MEMORY[0x263F62B70]);
    [v4 setControlFlags:2054];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke;
    v16[3] = &unk_26408E550;
    objc_copyWeak(&v17, &location);
    [v4 setInvalidationHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_285;
    v14[3] = &unk_26408E550;
    objc_copyWeak(&v15, &location);
    [v4 setInterruptionHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_286;
    v12[3] = &unk_264094D70;
    objc_copyWeak(&v13, &location);
    [v4 setDeviceFoundHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_288;
    v10[3] = &unk_264094D70;
    objc_copyWeak(&v11, &location);
    [v4 setDeviceLostHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_289;
    v9[3] = &unk_264094D98;
    v9[4] = self;
    [v4 setDeviceChangedHandler:v9];
    v5 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Now Activating RPCompanionLinkClient...", buf, 2u);
    }

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_291;
    v6[3] = &unk_26408D940;
    objc_copyWeak(&v7, &location);
    [v4 activateWithCompletion:v6];
    [(HFAccessorySettingDeviceOptionsAdapterUtility *)self setDiscoveryLink:v4];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetRapportClientWithInvalidation:0];
  v2 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient was invalidated.", v3, 2u);
  }
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_285(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetRapportClientWithInvalidation:1];
  v2 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient was interrupted.", v3, 2u);
  }
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_286(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_debug_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEBUG, "Device Found from Rapport..%@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRapportReachable];
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_debug_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEBUG, "Device lost from Rapport..%@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRapportReachable];
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_289(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEBUG, "device changed from Rapport..%@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _updateRapportReachable];
}

void __68__HFAccessorySettingDeviceOptionsAdapterUtility__setupRapportClient__block_invoke_291(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (v3)
  {
    id v6 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient failed to activate: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v5, "setRapportClientActivationFailCount:", objc_msgSend(v5, "rapportClientActivationFailCount") + 1);
    [v5 _resetRapportClientWithInvalidation:1];
  }
  else
  {
    [WeakRetained _updateRapportReachable];
  }
}

- (void)_resetRapportClientWithInvalidation:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
    [v4 invalidate];
  }
  int v5 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  [v5 setDeviceFoundHandler:0];

  id v6 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  [v6 setDeviceLostHandler:0];

  int v7 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  [v7 setInterruptionHandler:0];

  id v8 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  [v8 setInvalidationHandler:0];

  [(HFAccessorySettingDeviceOptionsAdapterUtility *)self setDiscoveryLink:0];
  if ([(HFAccessorySettingDeviceOptionsAdapterUtility *)self rapportClientActivationFailCount] > 2)
  {
    uint64_t v9 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      uint64_t v11 = 3;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "RPCompanionLinkClient activation exceeded  (%lu) activation attempts. Seems like a bug in Rapport. Please file a bug.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _setupRapportClient];
  }
}

- (void)_updateRapportReachable
{
  id v3 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self mediaProfileContainer];
  id v4 = [v3 accessories];
  int v5 = [v4 allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingDeviceOptionsAdapterUtility__updateRapportReachable__block_invoke;
  v8[3] = &unk_264094DC0;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "na_flatMap:", v8);

  int v7 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self delegate];
  objc_msgSend(v7, "accessoryReachableOverRapport:", objc_msgSend(v6, "count") != 0);
}

uint64_t __72__HFAccessorySettingDeviceOptionsAdapterUtility__updateRapportReachable__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reachableDevices:a2];
}

- (id)_reachableDevices:(id)a3
{
  id v4 = a3;
  int v5 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  id v6 = [v5 activeDevices];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke;
  void v20[3] = &unk_264094DE8;
  id v7 = v4;
  id v21 = v7;
  id v8 = objc_msgSend(v6, "na_filter:", v20);

  uint64_t v9 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self discoveryLink];
  int v10 = [v9 activeDevices];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke_2;
  v18 = &unk_264094DE8;
  id v19 = v7;
  id v11 = v7;
  uint64_t v12 = objc_msgSend(v10, "na_filter:", &v15);
  id v13 = objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12, v15, v16, v17, v18);

  return v13;
}

uint64_t __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 homeKitIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __67__HFAccessorySettingDeviceOptionsAdapterUtility__reachableDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 statusFlags] & 2) != 0)
  {
    uint64_t v5 = [v3 idsDeviceIdentifier];
    id v6 = [*(id *)(a1 + 32) accountIdentifier];
    id v7 = [v6 UUIDString];
    uint64_t v4 = [v5 isEqualToString:v7];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_sendRapportMessageToAccessoryWithRequestID:(id)a3 request:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self mediaProfileContainer];
  uint64_t v12 = [v11 accessories];
  id v13 = [v12 anyObject];
  v14 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _reachableDevices:v13];

  uint64_t v15 = [v14 firstObject];
  uint64_t v16 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self _sendRapportMessageToDevice:v15 requestID:v10 request:v9 options:v8];

  return v16;
}

- (id)_sendRapportMessageToAccessoriesWithRequestID:(id)a3 request:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HFAccessorySettingDeviceOptionsAdapterUtility *)self mediaProfileContainer];
  uint64_t v12 = [v11 accessories];
  id v13 = [v12 allObjects];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke;
  v27[3] = &unk_264094DC0;
  v27[4] = self;
  v14 = objc_msgSend(v13, "na_map:", v27);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke_2;
  v23[3] = &unk_264094E10;
  v23[4] = self;
  id v24 = v8;
  id v25 = v9;
  id v26 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  v18 = objc_msgSend(v14, "na_map:", v23);

  id v19 = [MEMORY[0x263F58190] combineAllFutures:v18];
  objc_super v20 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v21 = [v19 reschedule:v20];

  return v21;
}

uint64_t __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reachableDevices:a2];
}

id __111__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToAccessoriesWithRequestID_request_options___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = [a2 firstObject];
  uint64_t v5 = [v3 _sendRapportMessageToDevice:v4 requestID:a1[5] request:a1[6] options:a1[7]];

  return v5;
}

- (id)_sendRapportMessageToDevice:(id)a3 requestID:(id)a4 request:(id)a5 options:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F08C38] UUID];
  v14 = HFLogForCategory(0x38uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v13;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "(Request %@) Preparing to send rapport message to '%@'", buf, 0x16u);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F62B70]);
  [v15 setDestinationDevice:v9];
  id v16 = objc_opt_new();
  id v17 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke;
  v42[3] = &unk_26408D388;
  id v18 = v16;
  id v43 = v18;
  id v19 = v15;
  id v44 = v19;
  id v20 = v13;
  id v45 = v20;
  id v21 = [v17 afterDelay:v42 performBlock:10.0];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_298;
  v33[3] = &unk_264094E60;
  id v34 = v21;
  id v35 = v20;
  id v22 = v18;
  id v36 = v22;
  id v37 = v19;
  id v38 = v12;
  id v39 = v11;
  id v40 = v10;
  id v41 = v9;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v19;
  id v28 = v20;
  id v29 = v21;
  [v27 activateWithCompletion:v33];
  v30 = v41;
  id v31 = v22;

  return v31;
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = objc_msgSend(MEMORY[0x263F087E8], "na_timeoutError");
    [v2 finishWithError:v3];

    [*(id *)(a1 + 40) invalidate];
    uint64_t v4 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "(Request %@) Timeout trying to find send!", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_298(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) cancel];
  if (v3)
  {
    uint64_t v4 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "(Request %@) Companion link is invalid; error '%@'",
        buf,
        0x16u);
    }

    [*(id *)(a1 + 48) finishWithError:v3];
    [*(id *)(a1 + 56) invalidate];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 64);
    if (!v5) {
      uint64_t v5 = (void *)MEMORY[0x263EFFA78];
    }
    id v6 = v5;
    uint64_t v7 = *(void **)(a1 + 72);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v20 = @"com.apple.Home.RapportRequest";
      id v9 = NSNumber;
      id v10 = [MEMORY[0x263EFF910] date];
      [v10 timeIntervalSince1970];
      id v11 = objc_msgSend(v9, "numberWithDouble:");
      id v21 = v11;
      id v8 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    id v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 80);
    v14 = [*(id *)(a1 + 88) identifier];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_299;
    v16[3] = &unk_264094E38;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    [v12 sendRequestID:v13 request:v8 destinationID:v14 options:v6 responseHandler:v16];
  }
}

void __103__HFAccessorySettingDeviceOptionsAdapterUtility__sendRapportMessageToDevice_requestID_request_options___block_invoke_299(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = HFLogForCategory(0x38uLL);
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "(Request %@) rapport message send failed with error: %@", (uint8_t *)&v14, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v9];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138412802;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "(Request %@) rapport message sent; response: %@ / options: %@",
        (uint8_t *)&v14,
        0x20u);
    }

    [*(id *)(a1 + 40) finishWithResult:v7];
  }
  [*(id *)(a1 + 48) invalidate];
}

- (HFAccessorySettingDeviceOptionsAdapterUtilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFAccessorySettingDeviceOptionsAdapterUtilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
}

- (RPCompanionLinkClient)discoveryLink
{
  return self->_discoveryLink;
}

- (void)setDiscoveryLink:(id)a3
{
}

- (unint64_t)rapportClientActivationFailCount
{
  return self->_rapportClientActivationFailCount;
}

- (void)setRapportClientActivationFailCount:(unint64_t)a3
{
  self->_rapportClientActivationFailCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryLink, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end