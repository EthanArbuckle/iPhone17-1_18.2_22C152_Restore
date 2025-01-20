@interface PNCopyStrippedNumberWithoutPauses
@end

@implementation PNCopyStrippedNumberWithoutPauses

CFCharacterSetRef ___PNCopyStrippedNumberWithoutPauses_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)*MEMORY[0x263EFFB08], @",;");
  _PNCopyStrippedNumberWithoutPauses_pauses = (uint64_t)result;
  return result;
}

@end