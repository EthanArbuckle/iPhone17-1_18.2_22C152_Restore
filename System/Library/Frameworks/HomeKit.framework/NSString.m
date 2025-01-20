@interface NSString
- (id)stringByTrimmingDots;
@end

@implementation NSString

- (id)stringByTrimmingDots
{
  id v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"."];
    id v1 = [v1 stringByTrimmingCharactersInSet:v2];
  }

  return v1;
}

uint64_t __50__NSString_HomeKit__stringByCapitalizingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedCapitalizedString];
}

void __61__NSString_HomeKit__stringByTransformingFirstWordUsingBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = *(void *)(a1[5] + 8);
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  uint64_t v10 = (*(void (**)(void))(a1[4] + 16))();
  uint64_t v11 = *(void *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  *a7 = 1;
}

@end