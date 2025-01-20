@interface MOManagedSettingsAgentPublisherConnection
+ (id)newAgentInterface;
+ (id)newClientInterface;
+ (id)newConnectionWithExportedObject:(id)a3;
@end

@implementation MOManagedSettingsAgentPublisherConnection

+ (id)newConnectionWithExportedObject:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMachServiceName:@"com.apple.ManagedSettingsAgent.publisher" options:4096];
  v7 = (void *)[a1 newAgentInterface];
  [v6 setRemoteObjectInterface:v7];

  v8 = (void *)[a1 newClientInterface];
  [v6 setExportedInterface:v8];

  [v6 setExportedObject:v5];
  v9 = [v6 _xpcConnection];
  xpc_connection_set_non_launching();

  return v6;
}

+ (id)newClientInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newAgentInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end