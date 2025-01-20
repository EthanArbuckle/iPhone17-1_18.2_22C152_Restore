@interface NSArray
@end

@implementation NSArray

void __50__NSArray_DBAdditions__db_firstObjectPassingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __34__NSArray_DBAdditions__db_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end