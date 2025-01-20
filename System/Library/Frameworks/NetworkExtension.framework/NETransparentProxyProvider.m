@interface NETransparentProxyProvider
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NETransparentProxyProvider

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"Only NETransparentProxyNetworkSettings can be used with NETransparentProxyProvider";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v10 = [v8 errorWithDomain:@"NETunnelProviderErrorDomain" code:1 userInfo:v9];

      v7[2](v7, v10);
      goto LABEL_6;
    }
    [v6 setIsFullyTransparent:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)NETransparentProxyProvider;
  [(NETunnelProvider *)&v11 setTunnelNetworkSettings:v6 completionHandler:v7];
LABEL_6:
}

@end