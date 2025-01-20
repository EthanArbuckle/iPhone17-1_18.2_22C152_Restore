@interface NSSet
@end

@implementation NSSet

void __60__NSSet_Photos__ph_enumerateIntersectionWithSet_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end