@interface FigSysdiagnoseBlock
@end

@implementation FigSysdiagnoseBlock

uint64_t __FigSysdiagnoseBlock_OneTimeInitializationForMediaserverd_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3) {
    CFDictionaryApplyFunction((CFDictionaryRef)gFigSysdiagnoseBlockRegistry_1, (CFDictionaryApplierFunction)SysdiagnoseBlockDictionaryApplierFunction, 0);
  }
  return 0;
}

@end