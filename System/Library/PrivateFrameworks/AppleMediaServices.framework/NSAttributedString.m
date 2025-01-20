@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __92__NSAttributedString_AppleMediaServices__ams_replaceOccurrencesOfString_withString_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a2, a3, *(void *)(a1 + 40));
}

@end