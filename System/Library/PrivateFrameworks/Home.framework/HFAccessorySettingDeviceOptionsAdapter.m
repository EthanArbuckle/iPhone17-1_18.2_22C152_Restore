@interface HFAccessorySettingDeviceOptionsAdapter
- (BOOL)isAccessoryReachableOverRapport;
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (BOOL)supportButtonPressForEntity:(id)a3;
- (HFAccessorySettingDeviceOptionsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
- (HFAccessorySettingDeviceOptionsAdapterUtility)adapterUtility;
- (NAFuture)inProgressSysdiagnoseCollectionFuture;
- (id)_handleButtonPress;
- (id)_home;
- (id)airDropSysdiagnose:(id)a3;
- (id)extractWiFiInfo;
- (id)handleButtonPressForEntity:(id)a3;
- (id)identifyAccessory;
- (id)inProgressButtonPressFutureForEntity:(id)a3;
- (id)inProgressButtonPressFutureForKeyPath:(id)a3;
- (id)resetAccessory;
- (id)restartAccessories;
- (id)restartAccessory;
- (void)setAdapterUtility:(id)a3;
- (void)setInProgressSysdiagnoseCollectionFuture:(id)a3;
- (void)setIsAccessoryReachableOverRapport:(BOOL)a3;
@end

@implementation HFAccessorySettingDeviceOptionsAdapter

- (HFAccessorySettingDeviceOptionsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 1 || ([v6 isItemGroup] & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263EFFA08] set];
    v14.receiver = self;
    v14.super_class = (Class)HFAccessorySettingDeviceOptionsAdapter;
    v10 = [(HFAccessorySettingAdapter *)&v14 initWithHomeKitSettingsVendor:v7 keyPaths:v9 mode:a4 updateHandler:0];
    if (v10)
    {
      v11 = [[HFAccessorySettingDeviceOptionsAdapterUtility alloc] initWithHomeKitSettingsVendor:v7 mode:a4 groupedAccessory:0 delegate:v10];
      adapterUtility = v10->_adapterUtility;
      v10->_adapterUtility = v11;

      v10->_isAccessoryReachableOverRapport = 0;
    }
    self = v10;

    v8 = self;
  }

  return v8;
}

- (id)identifyAccessory
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "identifyAccessory invoked", v7, 2u);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v5 = [v4 identifyAccessory];

  return v5;
}

- (id)restartAccessory
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "restartAccessory invoked", v7, 2u);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v5 = [v4 restartAccessory];

  return v5;
}

- (id)resetAccessory
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "resetAccessory invoked", v7, 2u);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v5 = [v4 resetAccessory];

  return v5;
}

- (id)restartAccessories
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "restartAccessories invoked", v7, 2u);
  }

  v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v5 = [v4 restartAccessories];

  return v5;
}

- (id)airDropSysdiagnose:(id)a3
{
  id v4 = a3;
  v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "airDrop invoked", v9, 2u);
  }

  id v6 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v7 = [v6 requestAirDrop:v4];

  return v7;
}

- (id)extractWiFiInfo
{
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "extractWiFiInfo invoked", v7, 2u);
  }

  id v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
  v5 = [v4 extractWiFiInfo];

  return v5;
}

- (NAFuture)inProgressSysdiagnoseCollectionFuture
{
  inProgressSysdiagnoseCollectionFuture = self->_inProgressSysdiagnoseCollectionFuture;
  if (inProgressSysdiagnoseCollectionFuture)
  {
    if ([(NAFuture *)inProgressSysdiagnoseCollectionFuture isFinished]) {
      inProgressSysdiagnoseCollectionFuture = 0;
    }
    else {
      inProgressSysdiagnoseCollectionFuture = self->_inProgressSysdiagnoseCollectionFuture;
    }
  }
  return inProgressSysdiagnoseCollectionFuture;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  v3 = [a3 keyPath];
  int v4 = [v3 isEqualToString:@"root.general.analytics.sysdiagnose"];

  return v4 && HFPreferencesBooleanValueForKey(@"EXPOSE_SYSDIAGNOSE_FOR_HOMEPOD") == 2;
}

- (id)handleButtonPressForEntity:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5
    && ([v5 keyPath],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"root.general.analytics.sysdiagnose"],
        v7,
        !v8))
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFAccessorySettingDeviceOptionsAdapter.m", 112, @"Unhandled button press from entity '%@'  for adapter: %@", self, v6 object file lineNumber description];

    v11 = (void *)MEMORY[0x263F58190];
    v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 25);
    v9 = [v11 futureWithError:v12];
  }
  else
  {
    v9 = [(HFAccessorySettingDeviceOptionsAdapter *)self _handleButtonPress];
  }

  return v9;
}

- (BOOL)supportButtonPressForEntity:(id)a3
{
  v3 = [a3 keyPath];
  char v4 = [v3 isEqualToString:@"root.general.analytics.sysdiagnose"];

  return v4;
}

- (id)inProgressButtonPressFutureForEntity:(id)a3
{
  char v4 = [a3 keyPath];
  int v5 = [v4 isEqualToString:@"root.general.analytics.sysdiagnose"];

  if (v5)
  {
    id v6 = [(HFAccessorySettingDeviceOptionsAdapter *)self inProgressSysdiagnoseCollectionFuture];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)inProgressButtonPressFutureForKeyPath:(id)a3
{
  if ([a3 isEqualToString:@"root.general.analytics.sysdiagnose"])
  {
    char v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self inProgressSysdiagnoseCollectionFuture];
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

- (id)_handleButtonPress
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v4 = [(HFAccessorySettingDeviceOptionsAdapter *)self inProgressSysdiagnoseCollectionFuture];

  if (v4)
  {
    int v5 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous SysdiagnoseCollection future is active", buf, 0x16u);
    }
    v7 = [(HFAccessorySettingDeviceOptionsAdapter *)self inProgressSysdiagnoseCollectionFuture];
  }
  else
  {
    int v8 = NSNumber;
    v9 = objc_msgSend(MEMORY[0x263EFF910], "date", @"com.apple.Home.RapportRequest");
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
    v17 = v10;
    v11 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    v12 = HFLogForCategory(0x38uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Sending Collect Sysdiagnose rapport message w/ request: %@", buf, 0xCu);
    }

    v13 = [(HFAccessorySettingDeviceOptionsAdapter *)self adapterUtility];
    objc_super v14 = [v13 requestSysdiagnose:v11 options:0];
    [(HFAccessorySettingDeviceOptionsAdapter *)self setInProgressSysdiagnoseCollectionFuture:v14];

    v7 = [(HFAccessorySettingDeviceOptionsAdapter *)self inProgressSysdiagnoseCollectionFuture];
  }
  return v7;
}

- (id)_home
{
  v2 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  v3 = objc_msgSend(v2, "hf_home");

  return v3;
}

- (BOOL)isAccessoryReachableOverRapport
{
  return self->_isAccessoryReachableOverRapport;
}

- (void)setIsAccessoryReachableOverRapport:(BOOL)a3
{
  self->_isAccessoryReachableOverRapport = a3;
}

- (void)setInProgressSysdiagnoseCollectionFuture:(id)a3
{
}

- (HFAccessorySettingDeviceOptionsAdapterUtility)adapterUtility
{
  return self->_adapterUtility;
}

- (void)setAdapterUtility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterUtility, 0);
  objc_storeStrong((id *)&self->_inProgressSysdiagnoseCollectionFuture, 0);
}

@end