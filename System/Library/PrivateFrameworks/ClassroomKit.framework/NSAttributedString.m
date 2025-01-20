@interface NSAttributedString
@end

@implementation NSAttributedString

void __55__NSAttributedString_CRKAdditions__crk_familyNameRange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 isEqualToString:*MEMORY[0x263F08440]])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v9 + 32) = a3;
    *(void *)(v9 + 40) = a4;
    *a5 = 1;
  }
}

@end