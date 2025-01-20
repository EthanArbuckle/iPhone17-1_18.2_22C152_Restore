@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __97__NSMutableAttributedString_ITK__itk_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(void *)(a1 + 40) + *(void *)(a1 + 56), a4);
}

@end