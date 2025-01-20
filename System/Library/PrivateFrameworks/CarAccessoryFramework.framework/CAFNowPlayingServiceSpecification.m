@interface CAFNowPlayingServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)entitlement;
+ (NSString)identifier;
@end

@implementation CAFNowPlayingServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.caraccessoryframework.nowplaying";
}

+ (NSString)entitlement
{
  return (NSString *)@"com.apple.private.caraccessoryframework.nowplaying";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F2B9F0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)interface___interface_0;
  return (BSServiceInterface *)v2;
}

void __46__CAFNowPlayingServiceSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F2B9B0];
  v1 = +[CAFNowPlayingServiceSpecification identifier];
  v2 = [v0 interfaceWithIdentifier:v1];

  [v2 setClientMessagingExpectation:1];
  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26FDB2AF0];
  [v2 setServer:v3];

  v4 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26FDA4148];
  [v2 setClient:v4];

  v5 = (void *)interface___interface_0;
  interface___interface_0 = (uint64_t)v2;
}

@end