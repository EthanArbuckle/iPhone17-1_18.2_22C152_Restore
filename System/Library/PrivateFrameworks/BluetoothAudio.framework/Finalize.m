@interface Finalize
@end

@implementation Finalize

void __endpoint_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8 * v2 + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      v8 = *(void (**)(uint64_t))(v7 + 32);
      if (v8) {
        v8(v5);
      }
      v9 = *(const void **)(*(void *)(a1 + 32) + 8 * v2 + 16);
      if (v9)
      {
        CFRelease(v9);
        *(void *)(*(void *)(a1 + 32) + 8 * v2 + 16) = 0;
      }
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  v10 = *(void **)(a1 + 32);
  v11 = (const void *)v10[8];
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
    v10 = *(void **)(a1 + 32);
  }
  v12 = (const void *)v10[4];
  if (v12)
  {
    CFRelease(v12);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    v10 = *(void **)(a1 + 32);
  }
  v13 = (const void *)v10[5];
  if (v13)
  {
    CFRelease(v13);
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    v10 = *(void **)(a1 + 32);
  }
  v14 = (const void *)v10[6];
  if (v14)
  {
    CFRelease(v14);
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
  }
}

void __audioStream_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)v2)
  {
    dispatch_release(*(dispatch_object_t *)v2);
    **(void **)(a1 + 32) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  char v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  char v4 = *(const void **)(v2 + 24);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

@end