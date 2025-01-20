@interface DDActionClass
@end

@implementation DDActionClass

uint64_t ____DDActionClass_block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"DDAction", @"DataDetectorsUI");
  __DDActionClass__actionClass = result;
  return result;
}

@end