@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __85__NSMutableAttributedString_CLKTextProvider__addAttributesPreservingOriginals_range___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttributes:range:", a2, a3, a4);
  }
  return result;
}

@end