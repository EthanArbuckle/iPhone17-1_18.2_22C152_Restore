@interface NEAgentDNSProxyExtension
- (id)driverInterface;
- (void)setSystemDNSSettings:(id)a3;
@end

@implementation NEAgentDNSProxyExtension

- (void)setSystemDNSSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  [v5 setSystemDNSSettings:v4];
}

- (id)driverInterface
{
  if (driverInterface_onceToken != -1) {
    dispatch_once(&driverInterface_onceToken, &__block_literal_global_2154);
  }
  v2 = (void *)driverInterface_driverInterface;

  return v2;
}

void __43__NEAgentDNSProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093698];
  v1 = (void *)driverInterface_driverInterface;
  driverInterface_driverInterface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)driverInterface_driverInterface setClasses:v4 forSelector:sel_setSystemDNSSettings_ argumentIndex:0 ofReply:0];
}

@end