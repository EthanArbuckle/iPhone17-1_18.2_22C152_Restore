@interface IOSurface
@end

@implementation IOSurface

uint64_t __IOSurface_ForwardDeclarationsLogHandle_block_invoke()
{
  IOSurface_ForwardDeclarationsLogHandle_log = (uint64_t)os_log_create("com.apple.Messages.blastdoor", "IOSurface_ForwardDeclarations");
  return MEMORY[0x1F41817F8]();
}

@end