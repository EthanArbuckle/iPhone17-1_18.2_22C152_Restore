@interface BLSDiagnosticsXPCServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation BLSDiagnosticsXPCServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.BacklightServices.diagnostics";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] utility];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, &__block_literal_global_17);
  }
  v2 = (void *)interface___interface_1;

  return (BSServiceInterface *)v2;
}

void __50__BLSDiagnosticsXPCServiceSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F50B98];
  v1 = +[BLSDiagnosticsXPCServiceSpecification identifier];
  id v5 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0E56080];
  [v5 setServer:v2];

  uint64_t v3 = [v5 copy];
  v4 = (void *)interface___interface_1;
  interface___interface_1 = v3;
}

@end