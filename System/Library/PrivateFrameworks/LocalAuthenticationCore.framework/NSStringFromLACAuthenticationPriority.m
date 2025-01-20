@interface NSStringFromLACAuthenticationPriority
@end

@implementation NSStringFromLACAuthenticationPriority

__CFString *__NSStringFromLACAuthenticationPriority_block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 3) {
    return @"Lowest";
  }
  else {
    return off_2653B6BA8[v1];
  }
}

@end