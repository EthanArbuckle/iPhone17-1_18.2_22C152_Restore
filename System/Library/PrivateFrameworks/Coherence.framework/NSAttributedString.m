@interface NSAttributedString
@end

@implementation NSAttributedString

void __84__NSAttributedString_CRTT__cr_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  id v11 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  v13.location = a3;
  v13.length = a4;
  NSRange v10 = NSIntersectionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v13);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v11, v10.location, v10.length, a5);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 48)
                                                               - (a3
                                                                + a4);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = a3 + a4;
}

@end