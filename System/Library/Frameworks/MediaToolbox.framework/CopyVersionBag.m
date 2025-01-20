@interface CopyVersionBag
@end

@implementation CopyVersionBag

uint64_t __rcl_CopyVersionBag_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (!a2) {
    return 0;
  }
  if ([*(id *)(a1 + 32) rangeOfString:a2 options:1] == 0x7FFFFFFFFFFFFFFFLL
    || v7 != [a2 length])
  {
    return 0;
  }
  NSLog(&cfstr_FoundTheMatchF.isa, *(void *)(a1 + 32), a2);
  uint64_t result = 1;
  *a4 = 1;
  return result;
}

@end