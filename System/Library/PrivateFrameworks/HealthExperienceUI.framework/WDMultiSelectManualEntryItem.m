@interface WDMultiSelectManualEntryItem
@end

@implementation WDMultiSelectManualEntryItem

uint64_t __46___WDMultiSelectManualEntryItem_generateValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 accessoryType];
  if (result == 3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

@end