@interface XPCExtensionInterface
+ (id)extensionInterface;
+ (id)hostInterface;
@end

@implementation XPCExtensionInterface

+ (id)extensionInterface
{
  if (extensionInterface_onceToken != -1) {
    dispatch_once(&extensionInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)extensionInterface_sExtensionInterface;

  return v2;
}

uint64_t __43__XPCExtensionInterface_extensionInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C54FB98];
  uint64_t v1 = extensionInterface_sExtensionInterface;
  extensionInterface_sExtensionInterface = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)hostInterface
{
  if (hostInterface_onceToken != -1) {
    dispatch_once(&hostInterface_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)hostInterface_sHostInterface;

  return v2;
}

uint64_t __38__XPCExtensionInterface_hostInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5703B8];
  uint64_t v1 = hostInterface_sHostInterface;
  hostInterface_sHostInterface = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end