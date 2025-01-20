@interface SHShazamKitUIServiceConnectionProvider
- (id)shazamKitUIServiceConnection;
@end

@implementation SHShazamKitUIServiceConnectionProvider

- (id)shazamKitUIServiceConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.shazamd.ui" options:4096];
  v3 = SHShazamKitUIServiceInterface();
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

@end