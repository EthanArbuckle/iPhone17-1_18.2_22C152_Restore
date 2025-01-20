@interface NSConstantDictionary
@end

@implementation NSConstantDictionary

uint64_t __54___NSConstantDictionary_descriptionWithLocale_indent___block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)[*(id *)(a1 + 32) objectForKey:a2];
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [a2 descriptionWithLocale:*(void *)(a1 + 40) indent:*(void *)(a1 + 64) + 1];
  }
  else {
    uint64_t v5 = [a2 description];
  }
  uint64_t v6 = v5;
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [v4 descriptionWithLocale:*(void *)(a1 + 40) indent:*(void *)(a1 + 64) + 1];
  }
  else {
    uint64_t v7 = [v4 description];
  }
  return [*(id *)(a1 + 48) appendFormat:@"%@%@ = %@,\n", *(void *)(a1 + 56), v6, v7];
}

@end