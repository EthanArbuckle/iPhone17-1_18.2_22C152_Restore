@interface NSMutableArray
@end

@implementation NSMutableArray

void __46__NSMutableArray_DBAdditions__db_mutatingMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v6 = *(void **)(a1 + 32);
  id v7 = (id)v5;
  if (v5) {
    [v6 replaceObjectAtIndex:a3 withObject:v5];
  }
  else {
    [v6 removeObjectAtIndex:a3];
  }
}

@end