@interface FEFocusSystemRegister
@end

@implementation FEFocusSystemRegister

uint64_t ___FEFocusSystemRegister_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  uint64_t v1 = _MergedGlobals_4;
  _MergedGlobals_4 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end