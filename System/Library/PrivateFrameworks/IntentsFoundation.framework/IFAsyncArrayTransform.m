@interface IFAsyncArrayTransform
@end

@implementation IFAsyncArrayTransform

void ___IFAsyncArrayTransform_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = [a2 count];
    v7 = (void *)(*(void *)(a1 + 48) + 16 * *(void *)(a1 + 56));
    if (a3 && !v6) {
      goto LABEL_4;
    }
LABEL_6:
    id v8 = a2;
    void *v7 = 0;
    goto LABEL_7;
  }
  v7 = (void *)(*(void *)(a1 + 48) + 16 * *(void *)(a1 + 56));
  if (a2) {
    goto LABEL_6;
  }
LABEL_4:
  id v8 = a3;
  void *v7 = 1;
LABEL_7:
  v7[1] = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void ___IFAsyncArrayTransform_block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = 0;
    id v4 = 0;
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = (void *)(*(void *)(a1 + 56) + v3);
      v7 = (void *)v6[1];
      if (*v6 == 1)
      {
        if (v7)
        {

          id v4 = v7;
        }
      }
      else if (*(unsigned char *)(a1 + 64))
      {
        if (v7) {
          [v2 addObjectsFromArray:v7];
        }
      }
      else
      {
        [v2 addObject:v7];
      }

      ++v5;
      v3 += 16;
    }
    while (v5 < *(void *)(a1 + 48));
  }
  else
  {
    id v4 = 0;
  }
  free(*(void **)(a1 + 56));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v8 = *(NSObject **)(a1 + 32);
  dispatch_release(v8);
}

@end