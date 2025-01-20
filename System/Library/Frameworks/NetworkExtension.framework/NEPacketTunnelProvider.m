@interface NEPacketTunnelProvider
- (NEPacketTunnelFlow)packetFlow;
- (NEPacketTunnelProvider)init;
- (NEPacketTunnelProvider)initWithVirtualInterfaceType:(int64_t)a3;
- (NWTCPConnection)createTCPConnectionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate;
- (NWUDPSession)createUDPSessionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint;
- (OS_nw_interface)virtualInterface;
- (id)getTunnelInterface;
- (void)cancelTunnelWithError:(NSError *)error;
- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7;
- (void)setPacketFlow:(id)a3;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
- (void)startTunnelWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)stopTunnelWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEPacketTunnelProvider

- (void).cxx_destruct
{
}

- (void)setPacketFlow:(id)a3
{
}

- (NEPacketTunnelFlow)packetFlow
{
  return (NEPacketTunnelFlow *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  v10 = [v9 IPv4Settings];
  if (!v10
    || ([v9 IPv4Settings],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 configMethod] == 3))
  {
    uint64_t v11 = [v9 IPv6Settings];
    if (!v11)
    {
      if (v10)
      {
      }
      goto LABEL_16;
    }
    v12 = (void *)v11;
    v13 = [v9 IPv6Settings];
    uint64_t v14 = [v13 configMethod];

    if (v10)
    {
    }
    if (v14 == 2)
    {
LABEL_16:
      v21.receiver = self;
      v21.super_class = (Class)NEPacketTunnelProvider;
      [(NETunnelProvider *)&v21 setTunnelNetworkSettings:v9 completionHandler:v8];
      goto LABEL_17;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Non-manual IP addressing can only be used with NEEthernetTunnelNetworkSettings";
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    v17 = (__CFString **)v25;
    v18 = &v24;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = *MEMORY[0x1E4F28568];
  v23 = @"Non-manual IP addressing can only be used with NEEthernetTunnelProvider";
  v16 = (void *)MEMORY[0x1E4F1C9E8];
  v17 = &v23;
  v18 = &v22;
LABEL_13:
  v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  v20 = [v15 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v19];

  v8[2](v8, v20);
LABEL_17:
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = "PFKey";
    int v19 = 138412802;
    v20 = self;
    if (v10) {
      v17 = "IKE";
    }
    __int16 v21 = 2080;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_INFO, "%@: Getting %s Socket for Interface %@", (uint8_t *)&v19, 0x20u);
  }

  v18 = [(NEProvider *)self context];
  [v18 requestSocket:v10 interface:v12 local:v15 remote:v14 completionHandler:v13];
}

- (void)stopTunnelWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = completionHandler;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2048;
    NEProviderStopReason v11 = reason;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: Stopping with reason %ld", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6);
}

- (void)startTunnelWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = options;
  id v7 = completionHandler;
  int v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    __int16 v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (void)cancelTunnelWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = error;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    int v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: canceling with error %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(NEProvider *)self context];
  [v6 cancelWithError:v4];
}

- (NWUDPSession)createUDPSessionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  v6 = localEndpoint;
  int v7 = (objc_class *)MEMORY[0x1E4F38C10];
  int v8 = remoteEndpoint;
  id v9 = objc_alloc_init(v7);
  if (v6)
  {
    __int16 v10 = (void *)MEMORY[0x1E4F38BC8];
    uint64_t v11 = [(NWHostEndpoint *)v6 hostname];
    uint64_t v12 = [(NWHostEndpoint *)v6 port];
    uint64_t v13 = [v10 endpointWithHostname:v11 port:v12];
    [v9 setLocalAddress:v13];
  }
  id v14 = -[NEPacketTunnelProvider getTunnelInterface](self);
  [v9 setRequiredInterface:v14];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F38C48]) initWithEndpoint:v8 parameters:v9];

  return (NWUDPSession *)v15;
}

- (id)getTunnelInterface
{
  if (a1)
  {
    v2 = [a1 packetFlow];
    if (v2)
    {
      v3 = (void *)v2[11];

      if (!v3) {
        goto LABEL_10;
      }
      id v4 = objc_alloc(MEMORY[0x1E4F38BF8]);
      uint64_t v5 = [a1 packetFlow];
      v6 = (void *)v5;
      if (v5 && (uint64_t v7 = *(void *)(v5 + 88)) != 0) {
        int v8 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)(v7 + 265), 0x600u);
      }
      else {
        int v8 = 0;
      }
      v3 = (void *)[v4 initWithInterfaceName:v8];
    }
    else
    {
      v6 = 0;
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_10:

  return v3;
}

- (NWTCPConnection)createTCPConnectionThroughTunnelToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  BOOL v7 = enableTLS;
  __int16 v10 = TLSParameters;
  uint64_t v11 = (objc_class *)MEMORY[0x1E4F38C10];
  id v12 = delegate;
  uint64_t v13 = remoteEndpoint;
  id v14 = objc_alloc_init(v11);
  [v14 setEnableTLS:v7];
  if (v10 && v7)
  {
    id v15 = [(NWTLSParameters *)v10 TLSSessionID];
    [v14 setTLSSessionID:v15];

    v16 = [(NWTLSParameters *)v10 SSLCipherSuites];
    [v14 setSSLCipherSuites:v16];

    objc_msgSend(v14, "setMinimumSSLProtocolVersion:", -[NWTLSParameters minimumSSLProtocolVersion](v10, "minimumSSLProtocolVersion"));
    objc_msgSend(v14, "setMaximumSSLProtocolVersion:", -[NWTLSParameters maximumSSLProtocolVersion](v10, "maximumSSLProtocolVersion"));
  }
  v17 = -[NEPacketTunnelProvider getTunnelInterface](self);
  [v14 setRequiredInterface:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F38C40]) initWithEndpoint:v13 parameters:v14 delegate:v12];

  return (NWTCPConnection *)v18;
}

- (OS_nw_interface)virtualInterface
{
  v3 = [(NEPacketTunnelProvider *)self packetFlow];
  if (v3)
  {
    id v4 = (void *)v3[11];

    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = [(NEPacketTunnelProvider *)self packetFlow];
    v6 = (void *)v5;
    if (v5) {
      uint64_t v5 = *(void *)(v5 + 88);
    }
    NEVirtualInterfaceGetIndex(v5);
    id v4 = (void *)nw_interface_create_with_index();
  }
  else
  {
    v6 = 0;
    id v4 = 0;
  }

LABEL_7:

  return (OS_nw_interface *)v4;
}

- (NEPacketTunnelProvider)initWithVirtualInterfaceType:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NEPacketTunnelProvider;
  id v4 = [(NEProvider *)&v13 initAllowUnentitled:0];
  if (v4)
  {
    uint64_t v5 = [NEPacketTunnelFlow alloc];
    if (v5)
    {
      v14.receiver = v5;
      v14.super_class = (Class)NEPacketTunnelFlow;
      v6 = [(NEProvider *)&v14 init];
      if (v6)
      {
        BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        int v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
        dispatch_queue_t v9 = dispatch_queue_create("NEPacketTunnelFlow queue", v8);
        context = v6->super.super._context;
        v6->super.super._context = (NEExtensionProviderContext *)v9;

        v6[1].super.super._defaultPath = (NWPath *)a3;
      }
    }
    else
    {
      v6 = 0;
    }
    packetFlow = v4->_packetFlow;
    v4->_packetFlow = (NEPacketTunnelFlow *)v6;
  }
  return v4;
}

- (NEPacketTunnelProvider)init
{
  return [(NEPacketTunnelProvider *)self initWithVirtualInterfaceType:1];
}

@end