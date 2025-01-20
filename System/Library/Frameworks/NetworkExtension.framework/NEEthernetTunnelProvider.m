@interface NEEthernetTunnelProvider
- (NEEthernetTunnelProvider)init;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NEEthernetTunnelProvider

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v7;
    v10 = [v9 IPv4Settings];
    if (!v10
      || ([v9 IPv4Settings],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v4 configMethod] == 3))
    {
      uint64_t v13 = [v9 IPv6Settings];
      if (!v13)
      {
        if (v10)
        {
        }
        goto LABEL_17;
      }
      v14 = (void *)v13;
      v15 = [v9 IPv6Settings];
      uint64_t v16 = [v15 configMethod];

      if (v10)
      {
      }
      if (v16 == 2)
      {
LABEL_17:
        v24.receiver = self;
        v24.super_class = (Class)NEEthernetTunnelProvider;
        [(NEPacketTunnelProvider *)&v24 setTunnelNetworkSettings:v9 completionHandler:v8];
        goto LABEL_18;
      }
    }
    else
    {
    }
    Property = [(NEPacketTunnelProvider *)self packetFlow];
    v19 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v18, 96, 1);
    }
    id v20 = Property;

    if (!v20)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26 = @"-[NEPacketTunnelFlow readPacketsWithCompletionHandler:] must be called before setting IPv4 settings or IPv6 settings with non-manual address configuration";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v23 = [v21 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v22];

      v8[2](v8, v23);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28568];
  v28[0] = @"Only NEEthernetTunnelNetworkSettings can be used with NEEthernetTunnelProvider";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  id v9 = [v11 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v12];

  v8[2](v8, v9);
LABEL_18:
}

- (NEEthernetTunnelProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEEthernetTunnelProvider;
  return [(NEPacketTunnelProvider *)&v3 initWithVirtualInterfaceType:3];
}

@end