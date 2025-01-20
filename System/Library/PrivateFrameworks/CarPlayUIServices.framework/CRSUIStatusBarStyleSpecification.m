@interface CRSUIStatusBarStyleSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSUIStatusBarStyleSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.status-bar-style";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F3F6A8] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)interface___interface_0;
  return (BSServiceInterface *)v2;
}

void __45__CRSUIStatusBarStyleSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F3F678];
  v1 = +[CRSUIStatusBarStyleSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  [v6 setClientMessagingExpectation:1];
  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C9455E0];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C943310];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_0;
  interface___interface_0 = v4;
}

@end