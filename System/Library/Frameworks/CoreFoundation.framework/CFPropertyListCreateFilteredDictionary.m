@interface CFPropertyListCreateFilteredDictionary
@end

@implementation CFPropertyListCreateFilteredDictionary

BOOL ____CFPropertyListCreateFilteredDictionary_block_invoke(uint64_t a1, const __CFString *a2, unsigned char *a3)
{
  BOOL result = __CFPropertyListFilterKeyHasWildcard(a2);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
    *a3 = 1;
  }
  return result;
}

@end