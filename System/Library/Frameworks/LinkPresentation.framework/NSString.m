@interface NSString
@end

@implementation NSString

uint64_t __41__NSString_LPInternal___lp_isEqualToAny___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

uint64_t __53__NSString_LPInternal___lp_isEqualToAnyIgnoringCase___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lp_isEqualIgnoringCase:", a2);
}

@end