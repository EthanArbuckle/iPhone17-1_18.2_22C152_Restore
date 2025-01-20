@interface NSDictionary
@end

@implementation NSDictionary

void __49__NSDictionary_EmailFoundationAdditions__ef_all___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __49__NSDictionary_EmailFoundationAdditions__ef_any___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t __52__NSDictionary_EmailFoundationAdditions__ef_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__NSDictionary_EmailFoundationAdditions__ef_mapValues___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  if (!v3) {
}
  }

@end