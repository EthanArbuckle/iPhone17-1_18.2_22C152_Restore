@interface CRSUIClusterThemeSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSUIClusterThemeSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.cluster-theme";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F3F6A8] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __43__CRSUIClusterThemeSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F3F678];
  v1 = +[CRSUIClusterThemeSpecification identifier];
  v2 = [v0 interfaceWithIdentifier:v1];

  [v2 setClientMessagingExpectation:1];
  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C93E958];
  [v2 setServer:v3];

  v4 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C944828];
  [v2 setClient:v4];

  v5 = (void *)interface___interface;
  interface___interface = (uint64_t)v2;
}

@end