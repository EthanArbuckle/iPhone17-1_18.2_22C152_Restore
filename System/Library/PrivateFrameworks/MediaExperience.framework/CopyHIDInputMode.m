@interface CopyHIDInputMode
@end

@implementation CopyHIDInputMode

void __central_CopyHIDInputMode_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)v2)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    v3 = *(const void **)(v2 + 8);
    if (v3 && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
    {
      uint64_t v4 = a1[6];
      uint64_t v5 = a1[7];
      uint64_t v6 = a1[8];
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = *(uint64_t (**)(const void *, uint64_t, uint64_t, uint64_t))(v8 + 64);
      if (v9) {
        int v10 = v9(v3, v4, v5, v6);
      }
      else {
        int v10 = -12782;
      }
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v10;
      CFRelease(v3);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -12782;
    }
  }
}

@end