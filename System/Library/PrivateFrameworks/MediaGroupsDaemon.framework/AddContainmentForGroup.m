@interface AddContainmentForGroup
@end

@implementation AddContainmentForGroup

void ___AddContainmentForGroup_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  char v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  *a4 = v6;
  if ((v6 & 1) == 0)
  {
    v7 = [*(id *)(a1 + 32) objectForKey:v13];
    if (v7)
    {
      v8 = [*(id *)(a1 + 32) objectForKey:v13];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v11 = [*(id *)(a1 + 48) identifier];
      v12 = [v10 arrayByAddingObject:v11];
      _AddContainmentForGroup(v8, v9, v12, *(void *)(a1 + 56), *(void *)(a1 + 64));
    }
  }
}

@end