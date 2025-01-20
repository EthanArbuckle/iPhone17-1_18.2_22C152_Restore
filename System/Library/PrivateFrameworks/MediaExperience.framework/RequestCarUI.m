@interface RequestCarUI
@end

@implementation RequestCarUI

void __central_RequestCarUI_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)v2)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    v3 = *(const void **)(v2 + 8);
    if (v3
      && (FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass())
      && (CFTypeRef v4 = CFRetain(v3)) != 0)
    {
      v5 = v4;
      uint64_t v6 = a1[6];
      uint64_t v7 = a1[7];
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      v10 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v9 + 8);
      if (v10) {
        int v11 = v10(v5, v6, v7);
      }
      else {
        int v11 = -12782;
      }
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v11;
      CFRelease(v5);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -12782;
    }
  }
}

@end