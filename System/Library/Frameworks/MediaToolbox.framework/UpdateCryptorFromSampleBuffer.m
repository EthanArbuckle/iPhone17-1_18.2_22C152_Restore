@interface UpdateCryptorFromSampleBuffer
@end

@implementation UpdateCryptorFromSampleBuffer

void __vq_UpdateCryptorFromSampleBuffer_block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  if (!*(_DWORD *)v1 && *(void *)(v1 + 376) != a1[7])
  {
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CFTypeRef v4 = *(CFTypeRef *)(a1[6] + 376);
    if (v4) {
      CFTypeRef v4 = CFRetain(v4);
    }
    *(void *)(*(void *)(a1[4] + 8) + 24) = v4;
    if (*(void *)(*(void *)(a1[4] + 8) + 24))
    {
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
    }
    uint64_t v6 = a1[6];
    v5 = (const void *)a1[7];
    v7 = *(const void **)(v6 + 376);
    *(void *)(v6 + 376) = v5;
    if (v5) {
      CFRetain(v5);
    }
    if (v7) {
      CFRelease(v7);
    }
    uint64_t v8 = a1[7];
    if (v8)
    {
      CFTypeRef cf = 0;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      v11 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v10 + 48);
      if (v11)
      {
        if (!v11(v8, *MEMORY[0x1E4F1FDF8], *MEMORY[0x1E4F1CF80], &cf))
        {
          CFTypeRef v12 = cf;
          *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = cf == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
          if (v12) {
            CFRelease(v12);
          }
        }
      }
      uint64_t v13 = *(void *)(a1[6] + 632);
      if (v13)
      {
        uint64_t v14 = a1[7];
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v16 = v15 ? v15 : 0;
        v17 = *(void (**)(uint64_t, __CFString *, uint64_t))(v16 + 56);
        if (v17) {
          v17(v14, @"DisplayList", v13);
        }
      }
      FigNotificationCenterAddWeakListener();
      FigNotificationCenterAddWeakListener();
    }
    v18 = (const void *)a1[8];
    if (v18)
    {
      CFRetain(v18);
      uint64_t v19 = a1[8];
    }
    else
    {
      uint64_t v19 = 0;
    }
    v20 = *(NSObject **)(a1[6] + 520);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __vq_UpdateCryptorFromSampleBuffer_block_invoke_2;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = DefaultLocalCenter;
    block[5] = v19;
    dispatch_async(v20, block);
  }
}

void __vq_UpdateCryptorFromSampleBuffer_block_invoke_2(uint64_t a1)
{
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end