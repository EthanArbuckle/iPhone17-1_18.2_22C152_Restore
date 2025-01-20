@interface NSSet
@end

@implementation NSSet

uint64_t __29__NSSet_FMAdditions__fm_map___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__NSSet_FMAdditions__fm_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__NSSet_FMAdditions__fm_firstObjectPassingTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __29__NSSet_FMAdditions__fm_any___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __30__NSSet_FMAdditions__fm_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__NSSet_FMAdditions__fm_setByFlattening__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v5 = objc_msgSend(v6, "fm_setByFlattening");

    [v4 unionSet:v5];
    id v6 = (id)v5;
  }
  else
  {
    [v4 addObject:v6];
  }
}

@end