@interface STScreenTimeAgentConnection
+ (id)newConnection;
+ (id)newInterface;
@end

@implementation STScreenTimeAgentConnection

+ (id)newConnection
{
  if (_os_feature_enabled_impl())
  {
    return +[STPublicServiceConnection newConnection];
  }
  else
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ScreenTimeAgent" options:4096];
    v5 = (void *)[a1 newInterface];
    [v4 setRemoteObjectInterface:v5];

    return v4;
  }
}

+ (id)newInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end