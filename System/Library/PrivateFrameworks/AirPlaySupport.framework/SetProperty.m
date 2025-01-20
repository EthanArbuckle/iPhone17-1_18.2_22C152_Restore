@interface SetProperty
@end

@implementation SetProperty

void __hoseSBAR_SetProperty_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(v2 + 224);
  if (v3)
  {
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5)
    {
      v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
      if (v6) {
        int v7 = v6(v3, *MEMORY[0x1E4F76610], v4);
      }
      else {
        int v7 = -19225;
      }
    }
    else
    {
      int v7 = -19221;
    }
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v7;
    uint64_t v8 = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
    if (v8)
    {
      APSLogErrorAt(v8);
      goto LABEL_14;
    }
    uint64_t v2 = a1[5];
  }
  v9 = *(const void **)(v2 + 256);
  v10 = (const void *)a1[6];
  *(void *)(v2 + 256) = v10;
  if (v10) {
    CFRetain(v10);
  }
  if (v9) {
    CFRelease(v9);
  }
  hoseSBAR_setPreferencesOnAudioSession(a1[7], 1);
LABEL_14:
  v11 = (const void *)a1[6];
  if (v11) {
    CFRelease(v11);
  }
  v12 = (const void *)a1[7];
  if (v12)
  {
    CFRelease(v12);
  }
}

void __dataSource_SetProperty_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"PSGDataSource::DevicePSGInfos"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = dataSource_SetDevicePSGInfoInternal(*(void *)(a1 + 48), *(const void **)(a1 + 56));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"PSGDataSource::LocalPSGInfo"))
  {
    uint64_t v2 = *(const void **)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(const void **)(v3 + 24);
    if (v2) {
      CFRetain(v2);
    }
    *(void *)(v3 + 24) = v2;
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12787;
  }
}

@end