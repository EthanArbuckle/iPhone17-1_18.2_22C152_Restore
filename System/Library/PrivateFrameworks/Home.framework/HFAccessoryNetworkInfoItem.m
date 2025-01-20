@interface HFAccessoryNetworkInfoItem
- (BOOL)_hiddenForType:(unint64_t)a3;
- (BOOL)_isFirstPartyAccessory:(id)a3;
- (BOOL)_showSignalStrength:(unint64_t)a3;
- (BOOL)initialSetup;
- (BOOL)supportsWiFiStrengthDisplay;
- (HFAccessoryNetworkInfoItem)initWithAccessory:(id)a3 home:(id)a4;
- (NSDate)debounceDate;
- (NSDictionary)wifiInfo;
- (NSString)forceCurrentDeviceNetworkSSID;
- (id)_accessoryMACAddress;
- (id)_accessoryNetworkSSID;
- (id)_currentDeviceNetworkSSID;
- (id)_extractWiFiInfo:(id)a3;
- (id)_getSignalStrengthIcon:(id)a3 forFastUpdate:(BOOL)a4;
- (id)_localizedDescriptionForType:(unint64_t)a3;
- (id)_localizedTitleForType:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_updateAccessoryWifiInfo;
- (int64_t)_getWiFiStrength:(id)a3 forFastUpdate:(BOOL)a4;
- (int64_t)fakeNetworkStrength;
- (unint64_t)_nextNetworkInfoType;
- (unint64_t)infoType;
- (unint64_t)networkInfoType;
- (void)setDebounceDate:(id)a3;
- (void)setFakeNetworkStrength:(int64_t)a3;
- (void)setForceCurrentDeviceNetworkSSID:(id)a3;
- (void)setInitialSetup:(BOOL)a3;
- (void)setNetworkInfoType:(unint64_t)a3;
- (void)setWifiInfo:(id)a3;
- (void)toggleNetworkInfoType;
@end

@implementation HFAccessoryNetworkInfoItem

- (HFAccessoryNetworkInfoItem)initWithAccessory:(id)a3 home:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryNetworkInfoItem;
  v4 = [(HFAccessoryInfoItem *)&v8 initWithAccessory:a3 infoType:3 home:a4];
  v5 = v4;
  if (v4)
  {
    v4->_networkInfoType = 2;
    [(HFAccessoryNetworkInfoItem *)v4 setFakeNetworkStrength:-1];
    [(HFAccessoryNetworkInfoItem *)v5 setInitialSetup:1];
    id v6 = [(HFAccessoryNetworkInfoItem *)v5 _updateAccessoryWifiInfo];
  }
  return v5;
}

- (void)toggleNetworkInfoType
{
  unint64_t v3 = [(HFAccessoryNetworkInfoItem *)self _nextNetworkInfoType];
  [(HFAccessoryNetworkInfoItem *)self setNetworkInfoType:v3];
}

- (BOOL)supportsWiFiStrengthDisplay
{
  unint64_t v3 = [(HFAccessoryInfoItem *)self accessory];
  v4 = [v3 home];
  int v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (!v5) {
    return 0;
  }
  id v6 = [(HFAccessoryInfoItem *)self accessory];
  BOOL v7 = [(HFAccessoryNetworkInfoItem *)self _isFirstPartyAccessory:v6];

  if (v7)
  {
    objc_super v8 = [(HFAccessoryInfoItem *)self accessory];
    v9 = [v8 softwareVersion];
    char v10 = objc_msgSend(v9, "hf_canProvideWifiStrength");
    goto LABEL_7;
  }
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  objc_super v8 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
  if (!v8)
  {
    char v10 = 0;
    goto LABEL_8;
  }
  v9 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
  v11 = [v9 objectForKeyedSubscript:@"HMAccessoryLinkQualityNetworkSupported"];
  char v10 = v11 != 0;

LABEL_7:
LABEL_8:

  return v10;
}

- (unint64_t)infoType
{
  return 3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_initWeak(&location, self);
  v20.receiver = self;
  v20.super_class = (Class)HFAccessoryNetworkInfoItem;
  id v6 = [(HFAccessoryInfoItem *)&v20 _subclass_updateWithOptions:v5];
  v22[0] = v6;
  BOOL v7 = [(HFAccessoryNetworkInfoItem *)self _updateAccessoryWifiInfo];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke;
  v19[3] = &unk_26408E098;
  v19[4] = self;
  objc_super v8 = [v7 flatMap:v19];
  v22[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

  char v10 = (void *)MEMORY[0x263F58190];
  v11 = [MEMORY[0x263F581B8] immediateScheduler];
  v12 = [v10 combineAllFutures:v9 scheduler:v11];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_2;
  v16[3] = &unk_2640927C0;
  objc_copyWeak(v18, &location);
  id v13 = v5;
  id v17 = v13;
  v18[1] = (id)a2;
  v14 = [v12 flatMap:v16];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  return v14;
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) initialSetup])
  {
    [*(id *)(a1 + 32) toggleNetworkInfoType];
    [*(id *)(a1 + 32) setInitialSetup:0];
  }
  v2 = [MEMORY[0x263F58190] futureWithNoResult];
  return v2;
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = [v3 firstObject];

  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v8 = (void *)[v6 mutableCopy];
  v9 = objc_msgSend(WeakRetained, "_localizedTitleForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  [v8 setObject:v9 forKeyedSubscript:@"title"];

  char v10 = objc_msgSend(WeakRetained, "_localizedDescriptionForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  [v8 setObject:v10 forKeyedSubscript:@"description"];

  LODWORD(v10) = objc_msgSend(WeakRetained, "_hiddenForType:", objc_msgSend(WeakRetained, "networkInfoType"));
  v11 = [WeakRetained home];
  uint64_t v12 = objc_msgSend(v11, "hf_currentUserIsRestrictedGuest") | v10;

  id v13 = [NSNumber numberWithBool:v12];
  [v8 setObject:v13 forKeyedSubscript:@"hidden"];

  [v8 setObject:@"AccessoryDetails.NetworkInfo" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  v14 = NSNumber;
  v15 = +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray];
  v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", @"HFAccessoryInfoTypeNetworkPreferredOrderKey"));
  [v8 setObject:v16 forKeyedSubscript:@"accessoryInfoDetailPreferredOrder"];

  if (!objc_msgSend(WeakRetained, "_showSignalStrength:", objc_msgSend(WeakRetained, "networkInfoType"))) {
    goto LABEL_7;
  }
  id v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    v19 = [WeakRetained wifiInfo];
    objc_super v20 = [WeakRetained _getSignalStrengthIcon:v19 forFastUpdate:1];
    [v8 setObject:v20 forKeyedSubscript:@"icon"];

LABEL_7:
    v21 = [MEMORY[0x263F58190] futureWithResult:v8];
    goto LABEL_9;
  }
  v22 = [WeakRetained accessory];
  v23 = [WeakRetained _extractWiFiInfo:v22];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_3;
  v32[3] = &unk_264092770;
  v32[4] = WeakRetained;
  id v24 = v8;
  id v33 = v24;
  char v34 = 0;
  v25 = [v23 flatMap:v32];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_4;
  v28[3] = &unk_264092798;
  uint64_t v26 = *(void *)(a1 + 48);
  v28[4] = WeakRetained;
  uint64_t v30 = v26;
  id v29 = v24;
  char v31 = 0;
  v21 = [v25 recover:v28];

LABEL_9:
  return v21;
}

uint64_t __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setWifiInfo:v4];
  id v5 = [*(id *)(a1 + 32) _getSignalStrengthIcon:v4 forFastUpdate:*(unsigned __int8 *)(a1 + 48)];

  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:@"icon"];
  id v6 = (void *)MEMORY[0x263F58190];
  uint64_t v7 = *(void *)(a1 + 40);
  return [v6 futureWithResult:v7];
}

id __58__HFAccessoryNetworkInfoItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to get wifiInfo with error %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  objc_super v8 = [v7 wifiInfo];
  v9 = [v7 _getSignalStrengthIcon:v8 forFastUpdate:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"icon"];

  char v10 = [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 40)];

  return v10;
}

- (unint64_t)_nextNetworkInfoType
{
  unint64_t v3 = [(HFAccessoryNetworkInfoItem *)self networkInfoType];
  do
  {
    if (!v3)
    {
      int64_t v4 = [(HFAccessoryNetworkInfoItem *)self fakeNetworkStrength];
      [(HFAccessoryNetworkInfoItem *)self setFakeNetworkStrength:~(5 * ((v4 + 2) / 5)) + v4 + 2];
    }
    unint64_t v3 = (v3 + 1) % 3;
  }
  while ([(HFAccessoryNetworkInfoItem *)self _hiddenForType:v3]
       && v3 != [(HFAccessoryNetworkInfoItem *)self networkInfoType]);
  return v3;
}

- (id)_localizedTitleForType:(unint64_t)a3
{
  if (a3 > 2)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = HFLocalizedWiFiString(off_264092858[a3]);
  }
  return v4;
}

- (id)_localizedDescriptionForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      int64_t v4 = [(HFAccessoryNetworkInfoItem *)self _accessoryNetworkSSID];
      uint64_t v5 = v4;
      if (v4)
      {
        id v6 = v4;
      }
      else
      {
        _HFLocalizedStringWithDefaultValue(@"HFAccessoryInfoTypeNetworkNotConnected", @"HFAccessoryInfoTypeNetworkNotConnected", 1);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v3 = v6;
      goto LABEL_11;
    case 2uLL:
      uint64_t v5 = [(HFAccessoryInfoItem *)self accessory];
      uint64_t v7 = objc_msgSend(v5, "hf_networkConfigurationProfiles");
      objc_super v8 = [v7 firstObject];
      uint64_t v3 = objc_msgSend(v8, "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");

LABEL_11:
      break;
    case 1uLL:
      uint64_t v3 = [(HFAccessoryNetworkInfoItem *)self _accessoryMACAddress];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (BOOL)_showSignalStrength:(unint64_t)a3
{
  BOOL v5 = [(HFAccessoryNetworkInfoItem *)self supportsWiFiStrengthDisplay];
  BOOL v6 = 0;
  if (a3 || !v5) {
    return v6;
  }
  uint64_t v7 = [(HFAccessoryInfoItem *)self accessory];
  char v8 = objc_msgSend(v7, "hf_fakeNetworkStrengthError");

  if (v8) {
    return 1;
  }
  v9 = [(HFAccessoryNetworkInfoItem *)self _accessoryNetworkSSID];
  char v10 = [(HFAccessoryNetworkInfoItem *)self _currentDeviceNetworkSSID];
  int v11 = [v9 isEqualToString:v10];

  if (!v11)
  {
    __int16 v14 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
    BOOL v6 = v14 != 0;
LABEL_9:

    return v6;
  }
  int v12 = [(HFAccessoryInfoItem *)self accessory];
  uint64_t v13 = [v12 mediaProfile];
  if (objc_msgSend(v13, "hf_isReachable"))
  {
    BOOL v6 = 1;
  }
  else
  {
    v15 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
    BOOL v6 = v15 != 0;
  }
  if (_os_feature_enabled_impl())
  {
    __int16 v16 = [(HFAccessoryInfoItem *)self accessory];
    char v17 = objc_msgSend(v16, "hf_isHomePod");

    if ((v17 & 1) == 0)
    {
      __int16 v14 = [(HFAccessoryInfoItem *)self accessory];
      if ([v14 isReachable])
      {
        v19 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
        BOOL v6 = v19 != 0;
      }
      else
      {
        BOOL v6 = 0;
      }
      goto LABEL_9;
    }
  }
  return v6;
}

- (id)_getSignalStrengthIcon:(id)a3 forFastUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v7 = (void *)MEMORY[0x263F1C550];
  id v8 = a3;
  v9 = [v7 systemGrayColor];
  char v10 = [v6 configurationWithHierarchicalColor:v9];

  int v11 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D260]];
  int v12 = [v11 configurationByApplyingConfiguration:v10];
  uint64_t v13 = [(HFAccessoryNetworkInfoItem *)self _getWiFiStrength:v8 forFastUpdate:v4];

  if (v13 == -1) {
    __int16 v14 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"wifi.exclamationmark" configuration:v12];
  }
  else {
    __int16 v14 = [[HFVariableImageIconDescriptor alloc] initWithSystemImageNamed:@"wifi" variableValue:v12 configuration:(double)v13 / 3.0];
  }
  v15 = v14;

  return v15;
}

- (int64_t)_getWiFiStrength:(id)a3 forFastUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HFAccessoryInfoItem *)self accessory];
  int v8 = objc_msgSend(v7, "hf_fakeNetworkStrengthError");

  if (v8)
  {
    int64_t v9 = [(HFAccessoryNetworkInfoItem *)self fakeNetworkStrength];
  }
  else if (v6)
  {
    objc_opt_class();
    char v10 = [v6 objectForKeyedSubscript:@"num3BarsRSSI"];
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      int64_t v9 = [v12 integerValue];
    }
    else
    {
      objc_opt_class();
      uint64_t v13 = [v6 objectForKeyedSubscript:@"RSSI"];
      if (objc_opt_isKindOfClass()) {
        __int16 v14 = v13;
      }
      else {
        __int16 v14 = 0;
      }
      id v15 = v14;

      if (v15)
      {
        uint64_t v16 = [v15 integerValue];
        uint64_t v17 = 2;
        if (v16 >= -70) {
          uint64_t v17 = 3;
        }
        if (v16 >= -80) {
          int64_t v9 = v17;
        }
        else {
          int64_t v9 = 1;
        }
      }
      else if (_os_feature_enabled_impl() {
             && ((objc_opt_class(),
      }
                  [v6 objectForKeyedSubscript:@"HMAccessoryLinkQuality"],
                  uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                  (objc_opt_isKindOfClass() & 1) == 0)
               ? (v19 = 0)
               : (v19 = v18),
                 id v20 = v19,
                 v18,
                 v20))
      {
        if ([v20 integerValue] <= 2)
        {
          if ([v20 integerValue] > 1) {
            int64_t v9 = 2;
          }
          else {
            int64_t v9 = [v20 integerValue];
          }
        }
        else
        {
          int64_t v9 = 3;
        }
      }
      else
      {
        int64_t v9 = -1;
      }
    }
  }
  else
  {
    int64_t v9 = v4 - 1;
  }

  return v9;
}

- (id)_updateAccessoryWifiInfo
{
  BOOL v4 = [(HFAccessoryInfoItem *)self accessory];
  BOOL v5 = [(HFAccessoryNetworkInfoItem *)self _isFirstPartyAccessory:v4];

  if (!v5 && (_os_feature_enabled_impl() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v6 = [(HFAccessoryNetworkInfoItem *)self debounceDate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    int v8 = [(HFAccessoryNetworkInfoItem *)self debounceDate];
    [v8 timeIntervalSinceNow];
    if (v9 >= 5.0)
    {
    }
    else
    {
      BOOL v10 = [(HFAccessoryNetworkInfoItem *)self initialSetup];

      if (!v10)
      {
LABEL_6:
        int v11 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];
        goto LABEL_9;
      }
    }
  }
  id v12 = [MEMORY[0x263EFF910] now];
  [(HFAccessoryNetworkInfoItem *)self setDebounceDate:v12];

  objc_initWeak(&location, self);
  uint64_t v13 = [(HFAccessoryInfoItem *)self accessory];
  __int16 v14 = [(HFAccessoryNetworkInfoItem *)self _extractWiFiInfo:v13];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  id v18[2] = __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke;
  v18[3] = &unk_2640927E8;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  id v15 = [v14 flatMap:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke_55;
  v17[3] = &unk_264092810;
  v17[4] = self;
  v17[5] = a2;
  int v11 = [v15 recover:v17];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
LABEL_9:
  return v11;
}

id __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3 && [v3 count]) {
    [WeakRetained setWifiInfo:v3];
  }
  BOOL v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v7 = [WeakRetained accessory];
    int v8 = [v7 name];
    double v9 = [WeakRetained accessory];
    BOOL v10 = [v9 uniqueIdentifier];
    int v11 = [WeakRetained wifiInfo];
    int v14 = 138413570;
    id v15 = WeakRetained;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    id v23 = v3;
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ received result for accessory %@[%@]: result: %@, wifiInfo: %@", (uint8_t *)&v14, 0x3Eu);
  }
  id v12 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v12;
}

id __54__HFAccessoryNetworkInfoItem__updateAccessoryWifiInfo__block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ _extractWifiInfo failed with error: %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];

  return v7;
}

- (id)_extractWiFiInfo:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (objc_msgSend(v5, "hf_isHomePod"))
  {
    uint64_t v6 = [v5 mediaProfile];
    uint64_t v7 = objc_msgSend(v6, "hf_settingsAdapterManager");
    int v8 = [v7 adapterForIdentifier:@"DeviceOptions"];

    int v9 = HFLogForCategory(0);
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = self;
        __int16 v31 = 2112;
        v32 = v11;
        __int16 v33 = 2112;
        id v34 = v6;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to send extract WiFi message to accessory: %@", buf, 0x20u);
      }
      uint64_t v12 = [v8 extractWiFiInfo];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v23 = NSStringFromSelector(a2);
        __int16 v24 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 25);
        *(_DWORD *)buf = 138413058;
        uint64_t v30 = self;
        __int16 v31 = 2112;
        v32 = v23;
        __int16 v33 = 2112;
        id v34 = v5;
        __int16 v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Device options adapter missing for accessory %@: %@", buf, 0x2Au);
      }
      uint64_t v12 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];
    }
    id v20 = (id)v12;
  }
  else
  {
    int v13 = _os_feature_enabled_impl();
    id v14 = (void *)MEMORY[0x263F58190];
    if (v13)
    {
      id v15 = objc_alloc_init(MEMORY[0x263F58190]);
      __int16 v16 = HFLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = self;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        id v34 = v5;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to call extract WiFi api to homekit for accessory: %@", buf, 0x20u);
      }
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __47__HFAccessoryNetworkInfoItem__extractWiFiInfo___block_invoke;
      v25[3] = &unk_264092838;
      v25[4] = self;
      SEL v28 = a2;
      id v26 = v5;
      id v18 = v15;
      id v27 = v18;
      [v26 queryLinkQualityWithCompletion:v25];
      v19 = v27;
      id v20 = v18;
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 38);
      id v20 = [v14 futureWithError:v21];
    }
  }

  return v20;
}

void __47__HFAccessoryNetworkInfoItem__extractWiFiInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v10 = *(void *)(a1 + 40);
      int v19 = 138413058;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v11 = "%@:%@ Failed to extract WiFi info for accessory: %@ error: %@";
LABEL_8:
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 0x2Au);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (([v5 supported] & 1) == 0)
  {
    uint64_t v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v18 = *(void *)(a1 + 40);
      int v19 = 138413058;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = 0;
      __int16 v11 = "%@:%@ WiFi info is not supported for accessory: %@ error: %@";
      goto LABEL_8;
    }
LABEL_9:

    [*(id *)(a1 + 48) finishWithResult:MEMORY[0x263EFFA78]];
    goto LABEL_10;
  }
  uint64_t v12 = objc_opt_new();
  int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "linkQuality"));
  [v12 setObject:v13 forKeyedSubscript:@"HMAccessoryLinkQuality"];

  id v14 = [v5 macAddress];
  [v12 setObject:v14 forKeyedSubscript:@"HMAccessoryLinkQualityMacAddress"];

  id v15 = [v5 networkName];
  [v12 setObject:v15 forKeyedSubscript:@"HMAccessoryLinkQualityNetworkName"];

  __int16 v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "supported"));
  [v12 setObject:v16 forKeyedSubscript:@"HMAccessoryLinkQualityNetworkSupported"];

  [*(id *)(a1 + 48) finishWithResult:v12];
LABEL_10:
}

- (BOOL)_isFirstPartyAccessory:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hf_isHomePod")) {
    char v4 = 1;
  }
  else {
    char v4 = objc_msgSend(v3, "hf_isAppleTV");
  }

  return v4;
}

- (id)_currentDeviceNetworkSSID
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v4 = [(HFAccessoryNetworkInfoItem *)self forceCurrentDeviceNetworkSSID];

  if (v4)
  {
    id v5 = [(HFAccessoryNetworkInfoItem *)self forceCurrentDeviceNetworkSSID];
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:3];
    [v6 resume];
    uint64_t v7 = [v6 networkName];
    id v5 = v7;
    if (!v6 || ![v7 length])
    {
      uint64_t v8 = HFLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = NSStringFromSelector(a2);
        __int16 v11 = [v6 networkName];
        int v12 = 138413058;
        int v13 = self;
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        __int16 v18 = 2112;
        int v19 = v11;
        _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@:%@ Can't find WiFi network SSID name: interface = %@, name = %@", (uint8_t *)&v12, 0x2Au);
      }
    }
    [v6 invalidate];
  }
  return v5;
}

- (id)_accessoryNetworkSSID
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  char v4 = [v3 diagnosticInfoManager];
  id v5 = [(HFAccessoryInfoItem *)self accessory];
  id v6 = [v4 wifiNetworkInfoForAccessory:v5];
  uint64_t v7 = [v6 SSID];

  if (_os_feature_enabled_impl()
    && ([(HFAccessoryInfoItem *)self accessory],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [(HFAccessoryNetworkInfoItem *)self _isFirstPartyAccessory:v8],
        v8,
        !v9))
  {
    int v13 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];

    if (v13)
    {
      objc_opt_class();
      __int16 v14 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
      id v15 = [v14 objectForKeyedSubscript:@"HMAccessoryLinkQualityNetworkName"];
      if (objc_opt_isKindOfClass()) {
        __int16 v16 = v15;
      }
      else {
        __int16 v16 = 0;
      }
      id v10 = v16;
    }
    else
    {
      id v10 = 0;
    }
  }
  else if (v7)
  {
    id v10 = v7;
  }
  else
  {
    __int16 v11 = [(HFAccessoryInfoItem *)self accessory];
    int v12 = [v11 wifiNetworkInfo];
    id v10 = [v12 SSID];
  }
  return v10;
}

- (id)_accessoryMACAddress
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  char v4 = [v3 diagnosticInfoManager];
  id v5 = [(HFAccessoryInfoItem *)self accessory];
  id v6 = [v4 wifiNetworkInfoForAccessory:v5];
  uint64_t v7 = [v6 MACAddress];

  if (_os_feature_enabled_impl()
    && ([(HFAccessoryInfoItem *)self accessory],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [(HFAccessoryNetworkInfoItem *)self _isFirstPartyAccessory:v8],
        v8,
        !v9))
  {
    objc_opt_class();
    __int16 v14 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
    id v15 = [v14 objectForKeyedSubscript:@"HMAccessoryLinkQualityMacAddress"];
    if (objc_opt_isKindOfClass()) {
      __int16 v16 = v15;
    }
    else {
      __int16 v16 = 0;
    }
    id v10 = v16;
  }
  else if (v7)
  {
    id v10 = [v7 formattedString];
  }
  else
  {
    __int16 v11 = [(HFAccessoryInfoItem *)self accessory];
    int v12 = [v11 wifiNetworkInfo];
    int v13 = [v12 MACAddress];
    id v10 = [v13 formattedString];
  }
  return v10;
}

- (BOOL)_hiddenForType:(unint64_t)a3
{
  id v5 = -[HFAccessoryNetworkInfoItem _localizedDescriptionForType:](self, "_localizedDescriptionForType:");
  uint64_t v6 = [v5 length];

  if (!v6) {
    return 1;
  }
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      BOOL v9 = [(HFAccessoryInfoItem *)self accessory];
      id v10 = [v9 home];
      if (!objc_msgSend(v10, "hf_isNetworkCredentialManagementEnabled"))
      {
        int v13 = [(HFAccessoryInfoItem *)self accessory];
        int v14 = objc_msgSend(v13, "hf_hasManagedNetworkCredential");

        return !v14;
      }
    }
    return 0;
  }
  if (!_os_feature_enabled_impl())
  {
    __int16 v11 = [(HFAccessoryInfoItem *)self accessory];
    int v12 = [v11 wifiNetworkInfo];

    return !v12;
  }
  uint64_t v7 = [(HFAccessoryNetworkInfoItem *)self wifiInfo];
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v15 = [(HFAccessoryInfoItem *)self accessory];
    __int16 v16 = [v15 wifiNetworkInfo];
    BOOL v8 = v16 == 0;
  }
  return v8;
}

- (unint64_t)networkInfoType
{
  return self->_networkInfoType;
}

- (void)setNetworkInfoType:(unint64_t)a3
{
  self->_networkInfoType = a3;
}

- (NSDate)debounceDate
{
  return self->_debounceDate;
}

- (void)setDebounceDate:(id)a3
{
}

- (int64_t)fakeNetworkStrength
{
  return self->_fakeNetworkStrength;
}

- (void)setFakeNetworkStrength:(int64_t)a3
{
  self->_fakeNetworkStrength = a3;
}

- (NSDictionary)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setWifiInfo:(id)a3
{
}

- (NSString)forceCurrentDeviceNetworkSSID
{
  return self->_forceCurrentDeviceNetworkSSID;
}

- (void)setForceCurrentDeviceNetworkSSID:(id)a3
{
}

- (BOOL)initialSetup
{
  return self->_initialSetup;
}

- (void)setInitialSetup:(BOOL)a3
{
  self->_initialSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceCurrentDeviceNetworkSSID, 0);
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_debounceDate, 0);
}

@end