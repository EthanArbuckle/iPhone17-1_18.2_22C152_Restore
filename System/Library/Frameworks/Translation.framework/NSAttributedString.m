@interface NSAttributedString
@end

@implementation NSAttributedString

void __96__NSAttributedString_LTParagraphs__lt_attributedStringByJoiningComponents_withAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) appendAttributedString:v5];
}

@end