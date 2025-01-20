@interface DPInputHelper
@end

@implementation DPInputHelper

void __69___DPInputHelper_nonEmptyStringsFromFileAtPath_separatedBy_encoding___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:&stru_1F3681BE0] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __40___DPInputHelper_numbersFromFileAtPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) numberFromString:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  return MEMORY[0x1F41817F8]();
}

@end