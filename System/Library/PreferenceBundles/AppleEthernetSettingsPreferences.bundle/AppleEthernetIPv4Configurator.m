@interface AppleEthernetIPv4Configurator
- (AppleEthernetIPv4Configurator)init;
- (BOOL)forceManualConfiguration;
- (void)removeManualIPv4ConfigurationSettings:(id)a3;
- (void)setForceManualConfiguration:(BOOL)a3;
- (void)setIPv4ConfigMethodForConfig:(id)a3 fromSettingsDictionary:(id)a4;
- (void)setValuesForConfig:(id)a3 fromService:(__SCNetworkService *)a4;
- (void)updateClientIDForNewConfig:(id)a3 inSettings:(id)a4;
- (void)updateIPv4ConfigurationMethodFromCurrentConfig:(id)a3 toNewConfig:(id)a4 inSettings:(id)a5;
- (void)updateManualIPv4Settings:(id)a3 forConfig:(id)a4;
- (void)updateSettings:(id)a3 fromCurrentConfig:(id)a4 toNewConfig:(id)a5;
@end

@implementation AppleEthernetIPv4Configurator

- (AppleEthernetIPv4Configurator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppleEthernetIPv4Configurator;
  v2 = [(AppleEthernetIPv4Configurator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AppleEthernetProtocolConfigurator *)v2 setProtocol:kSCEntNetIPv4];
    v3->_forceManualConfiguration = 0;
  }
  return v3;
}

- (void)setValuesForConfig:(id)a3 fromService:(__SCNetworkService *)a4
{
  id v22 = a3;
  v6 = [(AppleEthernetProtocolConfigurator *)self delegate];
  v7 = [v6 getPersistentSettingsForKey:kSCEntNetIPv4 inService:a4];

  [(AppleEthernetIPv4Configurator *)self setIPv4ConfigMethodForConfig:v22 fromSettingsDictionary:v7];
  v8 = (char *)[v22 ipv4Config];
  v9 = [(AppleEthernetProtocolConfigurator *)self delegate];
  v10 = v9;
  if (v8 == (unsigned char *)&dword_0 + 2)
  {
    v11 = [v9 getManualSettingsForKey:kSCEntNetIPv4 inService:a4];

    v12 = [v11 objectForKeyedSubscript:kSCPropNetIPv4Addresses];
    if ([v12 count])
    {
      v13 = [v12 objectAtIndex:0];
      [v22 setIpv4AddressManual:v13];
    }
    v14 = [v11 objectForKeyedSubscript:kSCPropNetIPv4SubnetMasks];
    if ([v14 count])
    {
      v15 = [v14 objectAtIndex:0];
      [v22 setIpv4SubnetMaskManual:v15];
    }
    v16 = [v11 objectForKeyedSubscript:kSCPropNetIPv4Router];
    [v22 setIpv4RouterAddressManual:v16];
    goto LABEL_13;
  }
  v11 = [v9 getDynamicSettingsForKey:kSCEntNetIPv4 inService:a4];

  v12 = [v11 objectForKeyedSubscript:kSCPropNetIPv4Addresses];
  if ([v12 count])
  {
    v17 = [v12 objectAtIndex:0];
    [v22 setIpv4Address:v17];
  }
  v14 = [v11 objectForKeyedSubscript:kSCPropNetIPv4SubnetMasks];
  if ([v14 count])
  {
    v18 = [v14 objectAtIndex:0];
    [v22 setIpv4SubnetMask:v18];
  }
  v19 = [v11 objectForKeyedSubscript:kSCPropNetIPv4Router];
  [v22 setIpv4RouterAddress:v19];

  if (![v22 ipv4Config])
  {
    v20 = [(AppleEthernetProtocolConfigurator *)self delegate];
    v21 = [v20 getManualSettingsForKey:kSCEntNetIPv4 inService:a4];

    v16 = [v21 objectForKeyedSubscript:kSCPropNetIPv4DHCPClientID];
    [v22 setDhcpClientID:v16];
    v11 = v21;
LABEL_13:
  }
}

- (void)setIPv4ConfigMethodForConfig:(id)a3 fromSettingsDictionary:(id)a4
{
  id v10 = a3;
  v6 = [a4 objectForKeyedSubscript:kSCPropNetIPv4ConfigMethod];
  v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToString:kSCValNetIPv4ConfigMethodDHCP])
    {
      v8 = v10;
      uint64_t v9 = 0;
LABEL_8:
      [v8 setIpv4Config:v9];
      goto LABEL_9;
    }
    if ([v7 isEqualToString:kSCValNetIPv4ConfigMethodManual])
    {
      v8 = v10;
      uint64_t v9 = 2;
      goto LABEL_8;
    }
    if ([v7 isEqualToString:kSCValNetIPv4ConfigMethodBOOTP])
    {
      v8 = v10;
      uint64_t v9 = 1;
      goto LABEL_8;
    }
    if ([v7 isEqualToString:kSCValNetIPv4ConfigMethodINFORM])
    {
      [v10 setIpv4Config:2];
      self->_forceManualConfiguration = 1;
    }
  }
LABEL_9:
}

- (void)updateSettings:(id)a3 fromCurrentConfig:(id)a4 toNewConfig:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  [(AppleEthernetIPv4Configurator *)self updateIPv4ConfigurationMethodFromCurrentConfig:v8 toNewConfig:v9 inSettings:v10];
  [(AppleEthernetIPv4Configurator *)self updateClientIDForNewConfig:v9 inSettings:v10];
  if ([v9 ipv4Config] == (char *)&dword_0 + 2)
  {
    [(AppleEthernetIPv4Configurator *)self updateManualIPv4Settings:v10 forConfig:v9];
  }
  else if ([v8 ipv4Config] == (char *)&dword_0 + 2)
  {
    [(AppleEthernetIPv4Configurator *)self removeManualIPv4ConfigurationSettings:v10];
  }
}

- (void)updateIPv4ConfigurationMethodFromCurrentConfig:(id)a3 toNewConfig:(id)a4 inSettings:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_forceManualConfiguration)
  {
    [v9 setObject:kSCValNetIPv4ConfigMethodManual forKeyedSubscript:kSCPropNetIPv4ConfigMethod];
    self->_forceManualConfiguration = 0;
  }
  id v11 = [v15 ipv4Config];
  if (v11 != [v8 ipv4Config])
  {
    v12 = (char *)[v8 ipv4Config];
    v13 = (id *)&kSCValNetIPv4ConfigMethodBOOTP;
    if (v12 != (unsigned char *)&dword_0 + 1) {
      v13 = (id *)&kSCValNetIPv4ConfigMethodDHCP;
    }
    if (v12 == (unsigned char *)&dword_0 + 2) {
      v13 = (id *)&kSCValNetIPv4ConfigMethodManual;
    }
    id v14 = *v13;
    [v10 setObject:v14 forKeyedSubscript:kSCPropNetIPv4ConfigMethod];
  }
}

- (void)updateClientIDForNewConfig:(id)a3 inSettings:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v9 ipv4Config]
    || ([v9 dhcpClientID],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 length],
        v6,
        !v7))
  {
    [v5 removeObjectForKey:kSCPropNetIPv4DHCPClientID];
  }
  else
  {
    id v8 = [v9 dhcpClientID];
    [v5 setObject:v8 forKeyedSubscript:kSCPropNetIPv4DHCPClientID];
  }
}

- (void)updateManualIPv4Settings:(id)a3 forConfig:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  id v8 = [v5 ipv4AddressManual];

  if (v8)
  {
    id v9 = [v5 ipv4AddressManual];
    [v6 addObject:v9];
  }
  [v13 setObject:v6 forKeyedSubscript:kSCPropNetIPv4Addresses];
  id v10 = [v5 ipv4SubnetMaskManual];

  if (v10)
  {
    id v11 = [v5 ipv4SubnetMaskManual];
    [v7 addObject:v11];
  }
  [v13 setObject:v7 forKeyedSubscript:kSCPropNetIPv4SubnetMasks];
  v12 = [v5 ipv4RouterAddressManual];
  [v13 setObject:v12 forKeyedSubscript:kSCPropNetIPv4Router];
}

- (void)removeManualIPv4ConfigurationSettings:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:kSCPropNetIPv4Addresses];
  [v3 removeObjectForKey:kSCPropNetIPv4SubnetMasks];
  [v3 removeObjectForKey:kSCPropNetIPv4Router];
}

- (BOOL)forceManualConfiguration
{
  return self->_forceManualConfiguration;
}

- (void)setForceManualConfiguration:(BOOL)a3
{
  self->_forceManualConfiguration = a3;
}

@end