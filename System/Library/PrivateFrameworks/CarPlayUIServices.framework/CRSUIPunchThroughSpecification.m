@interface CRSUIPunchThroughSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSUIPunchThroughSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.punch-through";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F3F6A8] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_2 != -1) {
    dispatch_once(&interface_onceToken_2, &__block_literal_global_16);
  }
  v2 = (void *)interface___interface_2;
  return (BSServiceInterface *)v2;
}

void __43__CRSUIPunchThroughSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F3F678];
  v1 = +[CRSUIPunchThroughSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  [v6 setClientMessagingExpectation:1];
  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C944248];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C944E68];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_2;
  interface___interface_2 = v4;
}

@end