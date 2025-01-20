@interface SHShazamKitServiceConnectionProvider
- (id)shazamKitServiceConnection;
@end

@implementation SHShazamKitServiceConnectionProvider

- (id)shazamKitServiceConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.shazamd" options:4096];
  v3 = SHShazamKitServiceInterface();
  [v2 setRemoteObjectInterface:v3];

  v4 = SHShazamKitClientInterface();
  [v2 setExportedInterface:v4];

  return v2;
}

@end