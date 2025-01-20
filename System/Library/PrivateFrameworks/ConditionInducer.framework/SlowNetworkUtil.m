@interface SlowNetworkUtil
+ (id)loadNetworkProfilesData;
+ (void)loadNetworkProfilesData;
- (NSData)profileData;
- (NSNumber)dnsDelayValue;
- (NSNumber)downlinkBandwidth;
- (NSNumber)downlinkDelay;
- (NSNumber)downlinkPacketLossRatio;
- (NSNumber)excludeLoopback;
- (NSNumber)uplinkBandwidth;
- (NSNumber)uplinkDelay;
- (NSNumber)uplinkPacketLossRatio;
- (NSString)profileName;
- (SlowNetworkUtil)init;
- (id)readInProfile:(id)a3;
- (void)extractProfileSetting:(id)a3;
- (void)loadProfile:(id)a3;
- (void)setProfileData:(id)a3;
- (void)startNLC;
- (void)stopNLC;
@end

@implementation SlowNetworkUtil

- (SlowNetworkUtil)init
{
  v5.receiver = self;
  v5.super_class = (Class)SlowNetworkUtil;
  v2 = [(SlowNetworkUtil *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SlowNetworkUtil *)v2 setProfileData:0];
    *(_OWORD *)&v3->nlcCommand.version = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].downlink_config.qsize_unit = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].uplink_config.plr = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].net_config.ifname[8] = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].net_config.family = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].downlink_config.protocol = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].downlink_config.plr = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].uplink_config.dst_port = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].uplink_config.latency = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].net_config.ifname[12] = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].net_config.exclude_loopback = 0u;
    v3->nlcCommand.version = 21;
    v3->sessionCookie = 0;
  }
  return v3;
}

+ (id)loadNetworkProfilesData
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"NetworkProfiles" ofType:@"plist"];
  if (v3)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v3];
    objc_super v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      +[SlowNetworkUtil loadNetworkProfilesData]((uint64_t)v3);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[SlowNetworkUtil loadNetworkProfilesData]();
    }
    objc_super v5 = 0;
  }

  return v5;
}

- (id)readInProfile:(id)a3
{
  id v3 = a3;
  v4 = +[SlowNetworkUtil loadNetworkProfilesData];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:v3];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[SlowNetworkUtil readInProfile:]((uint64_t)v3);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SlowNetworkUtil readInProfile:]();
    }
    v7 = 0;
  }

  return v7;
}

- (void)loadProfile:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  *(_OWORD *)&self->nlcCommand.version = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.qsize_unit = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.plr = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].net_config.ifname[8] = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].net_config.family = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.protocol = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.plr = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.dst_port = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.latency = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].net_config.ifname[12] = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].net_config.exclude_loopback = 0u;
  self->nlcCommand.version = 21;
  [(SlowNetworkUtil *)self extractProfileSetting:a3];
  long long v27 = 0uLL;
  long long v25 = 0uLL;
  unsigned int v26 = 0;
  downlinkDelay = self->downlinkDelay;
  if (downlinkDelay) {
    unsigned int v5 = [(NSNumber *)downlinkDelay unsignedLongValue];
  }
  else {
    unsigned int v5 = 0;
  }
  downlinkPacketLossRatio = self->downlinkPacketLossRatio;
  if (downlinkPacketLossRatio)
  {
    [(NSNumber *)downlinkPacketLossRatio floatValue];
    float v8 = v7 / 100.0;
  }
  else
  {
    float v8 = 0.0;
  }
  downlinkBandwidth = self->downlinkBandwidth;
  if (downlinkBandwidth)
  {
    [(NSNumber *)downlinkBandwidth floatValue];
    BOOL v11 = v10 >= 1.0;
    if (v10 < 1.0) {
      float v10 = v10 * 1000.0;
    }
    unsigned int v12 = v10;
    if (v10) {
      goto LABEL_16;
    }
  }
  else
  {
    unsigned int v12 = 0;
    BOOL v11 = 0;
  }
  if (v8 == 0.0 && !v5)
  {
    int v13 = 0;
    unsigned int v12 = 0;
    BOOL v11 = 0;
    float v8 = 0.0;
    goto LABEL_17;
  }
LABEL_16:
  long long v25 = 0uLL;
  int v13 = 9;
  unsigned int v26 = 0;
LABEL_17:
  uplinkDelay = self->uplinkDelay;
  if (uplinkDelay) {
    unsigned int v15 = [(NSNumber *)uplinkDelay unsignedLongValue];
  }
  else {
    unsigned int v15 = 0;
  }
  uplinkPacketLossRatio = self->uplinkPacketLossRatio;
  if (uplinkPacketLossRatio)
  {
    [(NSNumber *)uplinkPacketLossRatio floatValue];
    float v18 = v17 / 100.0;
  }
  else
  {
    float v18 = 0.0;
  }
  uplinkBandwidth = self->uplinkBandwidth;
  if (uplinkBandwidth) {
    [(NSNumber *)uplinkBandwidth floatValue];
  }
  BOOL v20 = v18 == 0.0 && v15 == 0;
  if (v20) {
    float v18 = 0.0;
  }
  else {
    v13 |= 5u;
  }
  if (v20) {
    unsigned int v15 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Setting default params", v24, 2u);
  }
  if (v13)
  {
    self->nlcCommand.nlc_conditions[1].flags = v13;
    *(void *)&self->nlcCommand.nlc_conditions[1].net_config.family = 0x100000000;
    *(_OWORD *)self->nlcCommand.nlc_conditions[1].net_config.ifname = v27;
    *(void *)&self->nlcCommand.nlc_conditions[1].uplink_config.bandwidth = 0;
    self->nlcCommand.nlc_conditions[1].uplink_config.plr = v18;
    self->nlcCommand.nlc_conditions[1].uplink_config.latency = v15;
    *(void *)&self->nlcCommand.nlc_conditions[1].uplink_config.qsize = 0;
    *(void *)&self->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0;
    self->nlcCommand.nlc_conditions[1].uplink_config.src_port = 0;
    self->nlcCommand.nlc_conditions[1].downlink_config.bandwidth = v12;
    self->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = v11;
    self->nlcCommand.nlc_conditions[1].downlink_config.plr = v8;
    self->nlcCommand.nlc_conditions[1].downlink_config.latency = v5;
    *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.qsize = v25;
    self->nlcCommand.nlc_conditions[1].downlink_config.src_port = v26;
  }
  if ([(NSNumber *)self->dnsDelayValue intValue] >= 1)
  {
    unsigned int v21 = [(NSNumber *)self->dnsDelayValue unsignedLongValue];
    int v22 = [(NSNumber *)self->excludeLoopback unsignedLongValue];
    if (v21)
    {
      long long v25 = 0uLL;
      unsigned int v26 = 0;
      long long v27 = 0uLL;
      LODWORD(v23) = 0;
      HIDWORD(v23) = v22;
      self->nlcCommand.nlc_conditions[0].flags = 6;
      *(void *)&self->nlcCommand.nlc_conditions[0].net_config.family = v23;
      *(_OWORD *)self->nlcCommand.nlc_conditions[0].net_config.ifname = v27;
      *(void *)&self->nlcCommand.nlc_conditions[0].uplink_config.bw_unit = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.bandwidth = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.latency = v21;
      *(void *)&self->nlcCommand.nlc_conditions[0].uplink_config.qsize = 0;
      *(void *)&self->nlcCommand.nlc_conditions[0].uplink_config.protocol = 0x3500000011;
      *(void *)&self->nlcCommand.nlc_conditions[0].downlink_config.bandwidth = 0;
      *(void *)&self->nlcCommand.nlc_conditions[0].downlink_config.plr = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.src_port = 0;
      self->nlcCommand.nlc_conditions[0].downlink_config.src_port = v26;
      *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.qsize = v25;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Done setting", v24, 2u);
  }
}

- (void)extractProfileSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v37 = v4;
    unsigned int v5 = [v4 objectForKey:@"UplinkBandwidthUnit"];

    id v6 = [v37 objectForKey:@"DownlinkBandwidthUnit"];

    float v7 = [v37 valueForKey:@"ExcludeLoopback"];
    excludeLoopback = self->excludeLoopback;
    self->excludeLoopback = v7;

    v9 = [v37 valueForKey:@"DNSDelayValue"];
    dnsDelayValue = self->dnsDelayValue;
    self->dnsDelayValue = v9;

    BOOL v11 = [v37 valueForKey:@"DownlinkDelay"];
    downlinkDelay = self->downlinkDelay;
    self->downlinkDelay = v11;

    int v13 = [v37 valueForKey:@"DownlinkPacketLossRatio"];
    downlinkPacketLossRatio = self->downlinkPacketLossRatio;
    self->downlinkPacketLossRatio = v13;

    unsigned int v15 = [v37 valueForKey:@"DownlinkBandwidth"];
    downlinkBandwidth = self->downlinkBandwidth;
    self->downlinkBandwidth = v15;

    float v17 = [v37 valueForKey:@"UplinkDelay"];
    uplinkDelay = self->uplinkDelay;
    self->uplinkDelay = v17;

    v19 = [v37 valueForKey:@"UplinkPacketLossRatio"];
    uplinkPacketLossRatio = self->uplinkPacketLossRatio;
    self->uplinkPacketLossRatio = v19;

    unsigned int v21 = [v37 valueForKey:@"UplinkBandwidth"];
    uplinkBandwidth = self->uplinkBandwidth;
    self->uplinkBandwidth = v21;

    uint64_t v23 = [v37 objectForKey:@"name"];
    profileName = self->profileName;
    self->profileName = v23;

    if (v5)
    {
      long long v25 = [v37 valueForKey:@"UplinkBandwidthUnit"];
      int v26 = [v25 intValue];

      if (!v26)
      {
        long long v27 = NSNumber;
        [(NSNumber *)self->uplinkBandwidth doubleValue];
        v29 = [v27 numberWithDouble:v28 / 1000.0];
        v30 = self->uplinkBandwidth;
        self->uplinkBandwidth = v29;
      }
    }
    id v4 = v37;
    if (v6)
    {
      v31 = [v37 valueForKey:@"DownlinkBandwidthUnit"];
      int v32 = [v31 intValue];

      id v4 = v37;
      if (!v32)
      {
        v33 = NSNumber;
        [(NSNumber *)self->downlinkBandwidth doubleValue];
        v35 = [v33 numberWithDouble:v34 / 1000.0];
        v36 = self->downlinkBandwidth;
        self->downlinkBandwidth = v35;

        id v4 = v37;
      }
    }
  }
}

- (void)startNLC
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_22CE75000, &_os_log_internal, v0, "_nlc_connect failed: (%d)", v1, v2, v3, v4, v5);
}

- (void)stopNLC
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_22CE75000, &_os_log_internal, v0, "_nlc_stop_simulation failed: (%d)", v1, v2, v3, v4, v5);
}

- (NSNumber)excludeLoopback
{
  return self->excludeLoopback;
}

- (NSNumber)dnsDelayValue
{
  return self->dnsDelayValue;
}

- (NSNumber)uplinkPacketLossRatio
{
  return self->uplinkPacketLossRatio;
}

- (NSNumber)uplinkBandwidth
{
  return self->uplinkBandwidth;
}

- (NSNumber)uplinkDelay
{
  return self->uplinkDelay;
}

- (NSNumber)downlinkPacketLossRatio
{
  return self->downlinkPacketLossRatio;
}

- (NSNumber)downlinkBandwidth
{
  return self->downlinkBandwidth;
}

- (NSNumber)downlinkDelay
{
  return self->downlinkDelay;
}

- (NSString)profileName
{
  return self->profileName;
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->profileName, 0);
  objc_storeStrong((id *)&self->downlinkDelay, 0);
  objc_storeStrong((id *)&self->downlinkBandwidth, 0);
  objc_storeStrong((id *)&self->downlinkPacketLossRatio, 0);
  objc_storeStrong((id *)&self->uplinkDelay, 0);
  objc_storeStrong((id *)&self->uplinkBandwidth, 0);
  objc_storeStrong((id *)&self->uplinkPacketLossRatio, 0);
  objc_storeStrong((id *)&self->dnsDelayValue, 0);

  objc_storeStrong((id *)&self->excludeLoopback, 0);
}

+ (void)loadNetworkProfilesData
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to load profiles from %@", (uint8_t *)&v1, 0xCu);
}

- (void)readInProfile:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to load any network profiles", v0, 2u);
}

- (void)readInProfile:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not read the profile: %@", (uint8_t *)&v1, 0xCu);
}

@end