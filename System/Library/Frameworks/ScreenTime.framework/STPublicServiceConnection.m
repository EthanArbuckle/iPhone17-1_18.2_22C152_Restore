@interface STPublicServiceConnection
+ (id)newConnection;
@end

@implementation STPublicServiceConnection

+ (id)newConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ScreenTimeAgent" options:4096];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7D3C90];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end