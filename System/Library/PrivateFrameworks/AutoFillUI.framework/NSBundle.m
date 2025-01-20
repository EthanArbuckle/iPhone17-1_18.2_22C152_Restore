@interface NSBundle
@end

@implementation NSBundle

void __48__NSBundle_AFUIExtras___processLocalizedString___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 lowercaseString];
  [v2 addObject:v3];
}

@end