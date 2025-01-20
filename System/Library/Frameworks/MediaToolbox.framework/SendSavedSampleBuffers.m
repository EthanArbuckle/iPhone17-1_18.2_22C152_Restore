@interface SendSavedSampleBuffers
@end

@implementation SendSavedSampleBuffers

void __sbcins_SendSavedSampleBuffers_block_invoke(uint64_t a1, const void *a2)
{
  if (a2)
  {
    int v4 = (*(uint64_t (**)(const void *, void))(*(void *)(a1 + 32) + 8))(a2, *(void *)(*(void *)(a1 + 32) + 16));
    if (v4 == 2)
    {
      v8 = *(__CFArray **)(a1 + 40);
      CFArrayAppendValue(v8, a2);
    }
    else if (v4 == 1)
    {
      uint64_t v5 = **(void **)(a1 + 32);
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v7 = v6 ? v6 : 0;
      v9 = *(void (**)(uint64_t, const void *))(v7 + 8);
      if (v9)
      {
        v9(v5, a2);
      }
    }
  }
}

@end