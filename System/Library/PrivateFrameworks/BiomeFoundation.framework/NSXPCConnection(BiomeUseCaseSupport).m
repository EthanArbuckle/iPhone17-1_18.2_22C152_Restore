@interface NSXPCConnection(BiomeUseCaseSupport)
+ (id)bm_connectionWithListenerEndpoint:()BiomeUseCaseSupport queue:;
+ (id)bm_connectionWithMachServiceName:()BiomeUseCaseSupport queue:options:;
+ (id)bm_connectionWithServiceName:()BiomeUseCaseSupport queue:;
- (id)bm_exportedUseCase;
- (id)bm_remoteUseCase;
- (void)setBm_exportedUseCase:()BiomeUseCaseSupport;
@end

@implementation NSXPCConnection(BiomeUseCaseSupport)

- (id)bm_remoteUseCase
{
  v1 = objc_msgSend(a1, "bm_transport");
  v2 = [v1 remoteUserInfo];
  v3 = [v2 objectForKeyedSubscript:@"UseCase"];

  return v3;
}

+ (id)bm_connectionWithListenerEndpoint:()BiomeUseCaseSupport queue:
{
  v5 = a4;
  v6 = [a3 _endpoint];
  v7 = xpc_connection_create_from_endpoint(v6);

  if (v5) {
    xpc_connection_set_target_queue(v7, v5);
  }
  id v8 = [[_BMXPCConnection alloc] _initWithConnection:v7 queue:v5 flags:2];

  return v8;
}

+ (id)bm_connectionWithServiceName:()BiomeUseCaseSupport queue:
{
  id v5 = a3;
  v6 = a4;
  xpc_connection_t v7 = xpc_connection_create((const char *)[v5 UTF8String], v6);
  id v8 = [[_BMXPCConnection alloc] _initWithConnection:v7 queue:v6 flags:0];

  return v8;
}

+ (id)bm_connectionWithMachServiceName:()BiomeUseCaseSupport queue:options:
{
  uint64_t v6 = (a5 >> 11) & 2;
  id v7 = a3;
  id v8 = a4;
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v7 UTF8String], v8, v6);
  id v10 = [[_BMXPCConnection alloc] _initWithConnection:mach_service queue:v8 flags:0];

  return v10;
}

- (void)setBm_exportedUseCase:()BiomeUseCaseSupport
{
  id v4 = a3;
  objc_msgSend(a1, "bm_transport");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v6 exportedUserInfo];
  [v5 setObject:v4 forKeyedSubscript:@"UseCase"];
}

- (id)bm_exportedUseCase
{
  v1 = objc_msgSend(a1, "bm_transport");
  v2 = [v1 exportedUserInfo];
  v3 = [v2 objectForKeyedSubscript:@"UseCase"];

  return v3;
}

@end