@interface SlowNetworkCondition
+ (id)description;
+ (id)descriptionWithProfileParamsForProfile:(id)a3;
- (BOOL)isDestructive;
- (BOOL)isInternalOnly;
- (BOOL)isNLCPrefPaneActive;
- (BOOL)running;
- (BOOL)setUp;
- (NSDictionary)profileData;
- (NSString)profile;
- (SlowNetworkCondition)initWithProfile:(id)a3;
- (SlowNetworkUtil)util;
- (id)identifierName;
- (id)userFriendlyName;
- (void)setProfile:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setUp;
- (void)setUtil:(id)a3;
- (void)tearDown;
@end

@implementation SlowNetworkCondition

+ (id)descriptionWithProfileParamsForProfile:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SlowNetworkUtil);
  v5 = [(SlowNetworkUtil *)v4 readInProfile:v3];

  [(SlowNetworkUtil *)v4 loadProfile:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v7 = NSString;
  v8 = [(SlowNetworkUtil *)v4 profileName];
  v9 = [v7 stringWithFormat:@"Name: %@", v8];
  [v6 addObject:v9];

  v10 = [(SlowNetworkUtil *)v4 downlinkBandwidth];

  if (v10)
  {
    v11 = NSString;
    v12 = [(SlowNetworkUtil *)v4 downlinkBandwidth];
    [v12 doubleValue];
    v14 = objc_msgSend(v11, "stringWithFormat:", @"Downlink Bandwidth: %g Mbps", v13);
    [v6 addObject:v14];
  }
  v15 = [(SlowNetworkUtil *)v4 downlinkDelay];

  if (v15)
  {
    v16 = NSString;
    v17 = [(SlowNetworkUtil *)v4 downlinkDelay];
    v18 = objc_msgSend(v16, "stringWithFormat:", @"Downlink Latency: %lu ms", objc_msgSend(v17, "unsignedLongValue"));
    [v6 addObject:v18];
  }
  v19 = [(SlowNetworkUtil *)v4 downlinkPacketLossRatio];

  if (v19)
  {
    v20 = NSString;
    v21 = [(SlowNetworkUtil *)v4 downlinkPacketLossRatio];
    [v21 doubleValue];
    v23 = objc_msgSend(v20, "stringWithFormat:", @"Downlink Packet Loss Ratio: %g%%", v22);
    [v6 addObject:v23];
  }
  v24 = [(SlowNetworkUtil *)v4 uplinkBandwidth];

  if (v24)
  {
    v25 = NSString;
    v26 = [(SlowNetworkUtil *)v4 uplinkBandwidth];
    [v26 doubleValue];
    v28 = objc_msgSend(v25, "stringWithFormat:", @"Uplink Bandwidth: %g Mbps", v27);
    [v6 addObject:v28];
  }
  v29 = [(SlowNetworkUtil *)v4 uplinkDelay];

  if (v29)
  {
    v30 = NSString;
    v31 = [(SlowNetworkUtil *)v4 downlinkDelay];
    v32 = objc_msgSend(v30, "stringWithFormat:", @"Uplink Latency: %lu ms", objc_msgSend(v31, "unsignedLongValue"));
    [v6 addObject:v32];
  }
  v33 = [(SlowNetworkUtil *)v4 uplinkPacketLossRatio];

  if (v33)
  {
    v34 = NSString;
    v35 = [(SlowNetworkUtil *)v4 downlinkPacketLossRatio];
    [v35 doubleValue];
    v37 = objc_msgSend(v34, "stringWithFormat:", @"Uplink Packet Loss Ratio: %g%%", v36);
    [v6 addObject:v37];
  }
  v38 = [(SlowNetworkUtil *)v4 excludeLoopback];

  if (v38)
  {
    v39 = NSString;
    v40 = [(SlowNetworkUtil *)v4 excludeLoopback];
    v41 = objc_msgSend(v39, "stringWithFormat:", @"Exclude Loopback: %lu", objc_msgSend(v40, "unsignedLongValue"));
    [v6 addObject:v41];
  }
  v42 = [(SlowNetworkUtil *)v4 dnsDelayValue];

  if (v42)
  {
    v43 = NSString;
    v44 = [(SlowNetworkUtil *)v4 dnsDelayValue];
    v45 = objc_msgSend(v43, "stringWithFormat:", @"DNS Delay: %lu ms", objc_msgSend(v44, "unsignedLongValue"));
    [v6 addObject:v45];
  }
  v46 = [v6 componentsJoinedByString:@"\n"];

  return v46;
}

- (id)identifierName
{
  uint64_t v8 = 0;
  v2 = @"SlowNetworkCondition";
  id v3 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"SlowNetworkCondition" error:&v8];
  v4 = [v3 objectForKey:@"ConditionIdentifierName"];
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    v2 = v4;
  }

  return v2;
}

- (id)userFriendlyName
{
  uint64_t v6 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"SlowNetworkCondition" error:&v6];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"ConditionUserFriendlyName"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  uint64_t v5 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"SlowNetworkCondition" error:&v5];
  id v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsDestructive"];
  }
  return 1;
}

- (BOOL)isInternalOnly
{
  uint64_t v5 = 0;
  v2 = +[COConditionSession prepareInfoDictForBuiltInCondition:@"SlowNetworkCondition" error:&v5];
  id v3 = v2;
  if (v2)
  {
    [v2 valueForKey:@"ConditionIsInternalOnly"];
  }
  return 1;
}

- (SlowNetworkCondition)initWithProfile:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_profile, a3);
  uint64_t v6 = objc_alloc_init(SlowNetworkUtil);
  util = self->_util;
  self->_util = v6;

  uint64_t v8 = [(SlowNetworkUtil *)self->_util readInProfile:v5];
  profileData = self->_profileData;
  self->_profileData = v8;

  [(SlowNetworkUtil *)self->_util loadProfile:self->_profileData];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v10 = [(SlowNetworkUtil *)self->_util profileName];
    *(_DWORD *)buf = 136315394;
    v23 = "name";
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Configured %s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v11 = [(SlowNetworkUtil *)self->_util downlinkDelay];
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkDelay";
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v12 = [(SlowNetworkUtil *)self->_util downlinkPacketLossRatio];
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkPacketLossRatio";
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(SlowNetworkUtil *)self->_util downlinkBandwidth];
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkBandwidth";
    __int16 v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v14 = [(SlowNetworkUtil *)self->_util uplinkDelay];
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkDelay";
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v15 = [(SlowNetworkUtil *)self->_util uplinkPacketLossRatio];
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkPacketLossRatio";
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v16 = [(SlowNetworkUtil *)self->_util uplinkBandwidth];
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkBandwidth";
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v17 = [(SlowNetworkUtil *)self->_util dnsDelayValue];
    *(_DWORD *)buf = 136315394;
    v23 = "DNSDelayValue";
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v18 = [(SlowNetworkUtil *)self->_util excludeLoopback];
    *(_DWORD *)buf = 136315394;
    v23 = "ExcludeLoopback";
    __int16 v24 = 2112;
    v25 = v18;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Set profile", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)SlowNetworkCondition;
  v19 = [(COCondition *)&v21 init];
  if (v19 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "SlowNetworkCondition Init passed", buf, 2u);
  }

  return v19;
}

- (BOOL)isNLCPrefPaneActive
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist"];

  if (v3)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist"];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [(__CFString *)v4 valueForKey:@"SimulatorIsRunning"];
      if (v6)
      {
        v7 = (void *)v6;
        [(__CFString *)v5 removeObjectForKey:@"Profiles"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          v12 = v5;
          _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "NLC prefpane plist: %@", (uint8_t *)&v11, 0xCu);
        }
        char v8 = [v7 BOOLValue];

        goto LABEL_15;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        v9 = [(__CFString *)v5 allKeys];
        int v11 = 138412546;
        v12 = @"SimulatorIsRunning";
        __int16 v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Unable to find value for key %@ in plist: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      v12 = @"/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist";
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Read plist from %@, but it was nil?", (uint8_t *)&v11, 0xCu);
    }
    char v8 = 0;
LABEL_15:

    return v8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    v12 = @"/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist";
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Unable to access the pref pane plist at %@, so we'll take the safe assumption and assume that NLC is not running.", (uint8_t *)&v11, 0xCu);
  }
  return 0;
}

- (BOOL)setUp
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    char v3 = [(SlowNetworkCondition *)self profile];
    int v26 = 138412546;
    uint64_t v27 = (const char *)self;
    __int16 v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Starting Setup: %@ Condition -- profile = %@", (uint8_t *)&v26, 0x16u);
  }
  BOOL v4 = [(SlowNetworkCondition *)self isNLCPrefPaneActive];
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SlowNetworkCondition setUp]();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v5 = [(SlowNetworkCondition *)self util];
      uint64_t v6 = [v5 profileName];
      int v26 = 136315394;
      uint64_t v27 = "name";
      __int16 v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Configuring %s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v7 = [(SlowNetworkCondition *)self util];
      char v8 = [v7 downlinkDelay];
      int v26 = 136315394;
      uint64_t v27 = "DownlinkDelay";
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v9 = [(SlowNetworkCondition *)self util];
      v10 = [v9 downlinkPacketLossRatio];
      int v26 = 136315394;
      uint64_t v27 = "DownlinkPacketLossRatio";
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v11 = [(SlowNetworkCondition *)self util];
      v12 = [v11 downlinkBandwidth];
      int v26 = 136315394;
      uint64_t v27 = "DownlinkBandwidth";
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = [(SlowNetworkCondition *)self util];
      v14 = [v13 uplinkDelay];
      int v26 = 136315394;
      uint64_t v27 = "UplinkDelay";
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(SlowNetworkCondition *)self util];
      v16 = [v15 uplinkPacketLossRatio];
      int v26 = 136315394;
      uint64_t v27 = "UplinkPacketLossRatio";
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v17 = [(SlowNetworkCondition *)self util];
      v18 = [v17 uplinkBandwidth];
      int v26 = 136315394;
      uint64_t v27 = "UplinkBandwidth";
      __int16 v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v19 = [(SlowNetworkCondition *)self util];
      v20 = [v19 dnsDelayValue];
      int v26 = 136315394;
      uint64_t v27 = "DNSDelayValue";
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      objc_super v21 = [(SlowNetworkCondition *)self util];
      uint64_t v22 = [v21 excludeLoopback];
      int v26 = 136315394;
      uint64_t v27 = "ExcludeLoopback";
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);
    }
    v23 = [(SlowNetworkCondition *)self util];
    [v23 startNLC];

    [(SlowNetworkCondition *)self setRunning:1];
  }
  if (![(SlowNetworkCondition *)self running])
  {
    __int16 v24 = [(SlowNetworkCondition *)self util];
    [v24 stopNLC];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Stopped NLC", (uint8_t *)&v26, 2u);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    uint64_t v27 = (const char *)self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finished Setup: %@ Condition", (uint8_t *)&v26, 0xCu);
  }
  return !v4;
}

- (void)tearDown
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Starting Teardown: %@ Condition", (uint8_t *)&v4, 0xCu);
  }
  char v3 = [(SlowNetworkCondition *)self util];
  [v3 stopNLC];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    LOWORD(v4) = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Stopped NLC", (uint8_t *)&v4, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finished Teardown: %@ Condition", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)description
{
  return @"Base class SlowNetwork Conditioner: Select another class to impose exact condition";
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (SlowNetworkUtil)util
{
  return self->_util;
}

- (void)setUtil:(id)a3
{
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSDictionary)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_util, 0);
}

- (void)setUp
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "NLC preference pane is active! Cannot start this condition", v0, 2u);
}

@end