@interface BKSMousePointerServiceSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation BKSMousePointerServiceSessionSpecification

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BKSMousePointerServiceSessionSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, block);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __55__BKSMousePointerServiceSessionSpecification_interface__block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779670];
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7722E0];
  v3 = (void *)MEMORY[0x1E4F50B98];
  v4 = [*(id *)(a1 + 32) identifier];
  v5 = [v3 interfaceWithIdentifier:v4];

  [v5 setServer:v8];
  [v5 setClient:v2];
  uint64_t v6 = [v5 copy];
  v7 = (void *)interface___interface;
  interface___interface = v6;
}

+ (NSString)identifier
{
  return (NSString *)@"BKMousePointerService";
}

@end