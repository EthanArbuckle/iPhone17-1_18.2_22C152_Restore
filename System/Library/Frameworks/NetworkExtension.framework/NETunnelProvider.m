@interface NETunnelProvider
- (BOOL)reasserting;
- (NETunnelProviderRoutingMethod)routingMethod;
- (NEVPNProtocol)protocolConfiguration;
- (NSArray)appRules;
- (void)handleAppMessage:(NSData *)messageData completionHandler:(void *)completionHandler;
- (void)setAppRules:(id)a3;
- (void)setProtocolConfiguration:(id)a3;
- (void)setReasserting:(BOOL)reasserting;
- (void)setTunnelNetworkSettings:(NETunnelNetworkSettings *)tunnelNetworkSettings completionHandler:(void *)completionHandler;
@end

@implementation NETunnelProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRules, 0);

  objc_storeStrong((id *)&self->_protocolConfiguration, 0);
}

- (void)setAppRules:(id)a3
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProtocolConfiguration:(id)a3
{
}

- (NEVPNProtocol)protocolConfiguration
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NEProvider *)v2 context];
  v5 = v3;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 appVPN];

  if (v8)
  {
    NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodSourceApplication;
  }
  else
  {
    v10 = [(NEProvider *)v2 context];
    v12 = v10;
    if (v10) {
      id v13 = objc_getProperty(v10, v11, 48, 1);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    v15 = [v14 VPN];
    uint64_t v16 = [v15 tunnelType];

    if (v16 == 2) {
      NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodNetworkRule;
    }
    else {
      NETunnelProviderRoutingMethod v9 = NETunnelProviderRoutingMethodDestinationIP;
    }
  }
  objc_sync_exit(v2);

  return v9;
}

- (void)handleAppMessage:(NSData *)messageData completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = messageData;
  id v7 = completionHandler;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@: Handle App Message with %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)setReasserting:(BOOL)reasserting
{
  BOOL v3 = reasserting;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v7, 0x12u);
  }

  self->_reasserting = v3;
  v6 = [(NEProvider *)self context];
  [v6 didSetReasserting:v3];
}

- (BOOL)reasserting
{
  return self->_reasserting;
}

- (void)setTunnelNetworkSettings:(NETunnelNetworkSettings *)tunnelNetworkSettings completionHandler:(void *)completionHandler
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v6 = tunnelNetworkSettings;
  int v7 = completionHandler;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v6) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = @"NEPacketTunnelNetworkSettings can only be used with NEPacketTunnelProvider";
      BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = (__CFString **)v25;
      v12 = &v24;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = @"NEPacketTunnelNetworkSettings must be used with NEPacketTunnelProvider";
      BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = &v23;
      v12 = &v22;
LABEL_14:
      uint64_t v16 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      uint64_t v13 = [v9 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v16];

      v7[2](v7, v13);
      goto LABEL_17;
    }
  }
  if (![(NETunnelNetworkSettings *)v6 checkValidityAndCollectErrors:v8])
  {
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "%@: setTunnelConfiguration validation failed", buf, 0xCu);
    }

    if ([v8 count])
    {
      v15 = objc_msgSend(v8, "componentsJoinedByString:", @"\n", *MEMORY[0x1E4F28568]);
      v19 = v15;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v13];
    v7[2](v7, v17);
  }
  else
  {
LABEL_8:
    uint64_t v13 = [(NEProvider *)self context];
    [v13 setTunnelConfiguration:v6 completionHandler:v7];
  }
LABEL_17:
}

@end