@interface NSArray
@end

@implementation NSArray

uint64_t __40__NSArray_UserNotifications__un_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__NSArray_UserNotifications__un_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__NSArray_UserNotifications__un_map___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (id)v2;
  if (v2)
  {
    [v1 addObject:v2];
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
    [v1 addObject:v3];
  }
}

@end