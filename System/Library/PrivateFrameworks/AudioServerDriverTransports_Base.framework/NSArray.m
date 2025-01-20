@interface NSArray
@end

@implementation NSArray

uint64_t __47__NSArray_ASDTUtils__asdtNumericSortAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!*(unsigned char *)(a1 + 32)) {
    a2 = a3;
  }
  return objc_msgSend(a2, "compare:");
}

@end