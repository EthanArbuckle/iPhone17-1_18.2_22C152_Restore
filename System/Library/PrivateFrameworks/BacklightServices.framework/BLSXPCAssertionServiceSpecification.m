@interface BLSXPCAssertionServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation BLSXPCAssertionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.BacklightServices.assertions";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_16);
  }
  v2 = (void *)interface___interface_0;

  return (BSServiceInterface *)v2;
}

void __48__BLSXPCAssertionServiceSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F50B98];
  v1 = +[BLSXPCAssertionServiceSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0E56020];
  [v6 setServer:v2];

  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0E4B870];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_0;
  interface___interface_0 = v4;
}

@end