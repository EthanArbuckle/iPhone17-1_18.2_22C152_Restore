@interface AppleEthernetProxyConfigurator
- (AppleEthernetProxyConfigurator)init;
- (void)removeAutomaticProxySettings:(id)a3;
- (void)removeManualProxySettings:(id)a3;
- (void)setValuesForConfig:(id)a3 fromService:(__SCNetworkService *)a4;
- (void)updateAutomaticProxySettings:(id)a3 withConfig:(id)a4;
- (void)updateManualProxySettings:(id)a3 withConfig:(id)a4;
- (void)updateSettings:(id)a3 fromCurrentConfig:(id)a4 toNewConfig:(id)a5;
@end

@implementation AppleEthernetProxyConfigurator

- (AppleEthernetProxyConfigurator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppleEthernetProxyConfigurator;
  v2 = [(AppleEthernetProxyConfigurator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AppleEthernetProtocolConfigurator *)v2 setProtocol:kSCEntNetProxies];
  }
  return v3;
}

- (void)setValuesForConfig:(id)a3 fromService:(__SCNetworkService *)a4
{
  id v23 = a3;
  v6 = [(AppleEthernetProtocolConfigurator *)self delegate];
  v7 = [v6 getPersistentSettingsForKey:kSCEntNetProxies inService:a4];

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:@"HTTPProxyType"];
    objc_msgSend(v23, "setHttpProxyConfig:", objc_msgSend(v8, "integerValue"));

    v9 = (char *)[v23 httpProxyConfig];
    if (v9 == (unsigned char *)&dword_0 + 2)
    {
      v19 = [v7 objectForKeyedSubscript:kSCPropNetProxiesProxyAutoConfigEnable];
      unsigned __int8 v20 = [v19 BOOLValue];

      v21 = [v7 objectForKeyedSubscript:kSCPropNetProxiesProxyAutoDiscoveryEnable];
      unsigned int v22 = [v21 BOOLValue];

      if ((v20 & 1) != 0 || v22)
      {
        v15 = [v7 objectForKeyedSubscript:kSCPropNetProxiesProxyAutoConfigURLString];
        [v23 setHttpProxyConfigPAC:v15];
        goto LABEL_9;
      }
    }
    else if (v9 == (unsigned char *)&dword_0 + 1)
    {
      v10 = [v7 objectForKeyedSubscript:kSCPropNetProxiesHTTPProxy];
      [v23 setHttpProxyServerAddress:v10];

      v11 = [v7 objectForKeyedSubscript:kSCPropNetProxiesHTTPPort];
      v12 = +[NSString stringWithFormat:@"%@", v11];
      [v23 setHttpProxyServerPort:v12];

      v13 = [v7 objectForKeyedSubscript:@"HTTPProxyAuthenticated"];
      objc_msgSend(v23, "setHttpProxyAuthenticationRequired:", objc_msgSend(v13, "BOOLValue"));

      if ([v23 httpProxyAuthenticationRequired])
      {
        v14 = [v7 objectForKeyedSubscript:@"HTTPProxyUsername"];
        [v23 setHttpProxyUsername:v14];

        v15 = [v23 httpProxyServerAddress];
        v16 = [v23 httpProxyUsername];
        v17 = [v23 httpProxyServerPort];
        v18 = +[AppleEthernetKeychainUtilities passwordForHost:username:port:](AppleEthernetKeychainUtilities, "passwordForHost:username:port:", v15, v16, [v17 intValue]);
        [v23 setHttpProxyPassword:v18];

LABEL_9:
      }
    }
  }
}

- (void)updateSettings:(id)a3 fromCurrentConfig:(id)a4 toNewConfig:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 httpProxyConfig];
  if (v10 != [v9 httpProxyConfig])
  {
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 httpProxyConfig]);
    [v12 setObject:v11 forKeyedSubscript:@"HTTPProxyType"];
  }
  if ([v9 httpProxyConfig])
  {
    if ([v9 httpProxyConfig] == (char *)&dword_0 + 1)
    {
      if ([v8 httpProxyConfig] == (char *)&dword_0 + 2) {
        [(AppleEthernetProxyConfigurator *)self removeAutomaticProxySettings:v12];
      }
      [v12 setObject:&off_C870 forKeyedSubscript:kSCPropNetProxiesHTTPEnable];
      [v12 setObject:&off_C870 forKeyedSubscript:kSCPropNetProxiesHTTPSEnable];
      [(AppleEthernetProxyConfigurator *)self updateManualProxySettings:v12 withConfig:v9];
    }
    else if ([v9 httpProxyConfig] == (char *)&dword_0 + 2)
    {
      if ([v8 httpProxyConfig] == (char *)&dword_0 + 1)
      {
        [v12 setObject:&off_C858 forKeyedSubscript:kSCPropNetProxiesHTTPEnable];
        [v12 setObject:&off_C858 forKeyedSubscript:kSCPropNetProxiesHTTPSEnable];
        [(AppleEthernetProxyConfigurator *)self removeManualProxySettings:v12];
      }
      [(AppleEthernetProxyConfigurator *)self updateAutomaticProxySettings:v12 withConfig:v9];
    }
  }
  else
  {
    if ([v8 httpProxyConfig] == (char *)&dword_0 + 1)
    {
      [(AppleEthernetProxyConfigurator *)self removeManualProxySettings:v12];
    }
    else if ([v8 httpProxyConfig] == (char *)&dword_0 + 2)
    {
      [(AppleEthernetProxyConfigurator *)self removeAutomaticProxySettings:v12];
    }
    [v12 setObject:&off_C858 forKeyedSubscript:kSCPropNetProxiesHTTPEnable];
    [v12 setObject:&off_C858 forKeyedSubscript:kSCPropNetProxiesHTTPSEnable];
  }
}

- (void)updateManualProxySettings:(id)a3 withConfig:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  v6 = [v5 httpProxyServerAddress];
  [v20 setObject:v6 forKeyedSubscript:kSCPropNetProxiesHTTPProxy];

  v7 = [v5 httpProxyServerAddress];
  [v20 setObject:v7 forKeyedSubscript:kSCPropNetProxiesHTTPSProxy];

  id v8 = [v5 httpProxyServerPort];
  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 integerValue]);
  [v20 setObject:v9 forKeyedSubscript:kSCPropNetProxiesHTTPPort];

  id v10 = [v5 httpProxyServerPort];
  v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 integerValue]);
  [v20 setObject:v11 forKeyedSubscript:kSCPropNetProxiesHTTPSPort];

  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 httpProxyAuthenticationRequired]);
  [v20 setObject:v12 forKeyedSubscript:@"HTTPProxyAuthenticated"];

  if ([v5 httpProxyAuthenticationRequired])
  {
    v13 = [v5 httpProxyUsername];
    [v20 setObject:v13 forKeyedSubscript:@"HTTPProxyUsername"];
  }
  else
  {
    [v20 setObject:0 forKeyedSubscript:@"HTTPProxyUsername"];
  }
  if ([v5 httpProxyAuthenticationRequired]
    && ([v5 httpProxyPassword],
        v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 length],
        v14,
        v15))
  {
    v16 = [v5 httpProxyPassword];
    v17 = [v5 httpProxyServerAddress];
    v18 = [v5 httpProxyUsername];
    v19 = [v5 httpProxyServerPort];
    +[AppleEthernetKeychainUtilities setPassword:forHost:username:port:](AppleEthernetKeychainUtilities, "setPassword:forHost:username:port:", v16, v17, v18, [v19 intValue]);
  }
  else
  {
    v16 = [v5 httpProxyServerAddress];
    v17 = [v5 httpProxyUsername];
    v18 = [v5 httpProxyServerPort];
    +[AppleEthernetKeychainUtilities removePasswordForHost:username:port:](AppleEthernetKeychainUtilities, "removePasswordForHost:username:port:", v16, v17, [v18 intValue]);
  }
}

- (void)removeManualProxySettings:(id)a3
{
  id v10 = a3;
  v3 = [v10 objectForKeyedSubscript:@"HTTPProxyAuthenticated"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [v10 objectForKeyedSubscript:kSCPropNetProxiesHTTPProxy];
    v6 = [v10 objectForKeyedSubscript:@"HTTPProxyUsername"];
    CFStringRef v7 = kSCPropNetProxiesHTTPPort;
    id v8 = [v10 objectForKeyedSubscript:kSCPropNetProxiesHTTPPort];
    id v9 = [v8 intValue];

    +[AppleEthernetKeychainUtilities removePasswordForHost:v5 username:v6 port:v9];
    [v10 removeObjectForKey:@"HTTPProxyUsername"];
  }
  else
  {
    CFStringRef v7 = kSCPropNetProxiesHTTPPort;
  }
  [v10 removeObjectForKey:kSCPropNetProxiesHTTPProxy];
  [v10 removeObjectForKey:kSCPropNetProxiesHTTPSProxy];
  [v10 removeObjectForKey:v7];
  [v10 removeObjectForKey:kSCPropNetProxiesHTTPSPort];
  [v10 removeObjectForKey:@"HTTPProxyAuthenticated"];
}

- (void)updateAutomaticProxySettings:(id)a3 withConfig:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  v6 = [v5 httpProxyConfigPAC];
  [v11 setObject:v6 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigURLString];

  CFStringRef v7 = [v5 httpProxyConfigPAC];

  id v8 = [v7 length];
  if (v8) {
    id v9 = &off_C870;
  }
  else {
    id v9 = &off_C858;
  }
  if (v8) {
    id v10 = &off_C858;
  }
  else {
    id v10 = &off_C870;
  }
  [v11 setObject:v9 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigEnable];
  [v11 setObject:v10 forKeyedSubscript:kSCPropNetProxiesProxyAutoDiscoveryEnable];
}

- (void)removeAutomaticProxySettings:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:kSCPropNetProxiesProxyAutoConfigEnable];
  [v3 removeObjectForKey:kSCPropNetProxiesProxyAutoDiscoveryEnable];
  [v3 removeObjectForKey:kSCPropNetProxiesProxyAutoConfigURLString];
}

@end