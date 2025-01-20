@interface HandleCachedPropertyLoaded
@end

@implementation HandleCachedPropertyLoaded

void __remoteXPCAssetClient_HandleCachedPropertyLoaded_block_invoke(uint64_t a1)
{
  FigCFDictionarySetInt32();
  if (*(void *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
  {
    v2 = *(const void **)(a1 + 40);
    v3 = *(__CFDictionary **)(*(void *)(a1 + 32) + 32);
    if (*(void *)(a1 + 56)) {
      v4 = *(const void **)(a1 + 56);
    }
    else {
      v4 = (const void *)*MEMORY[0x1E4F1D260];
    }
    CFDictionarySetValue(v3, v2, v4);
  }
}

void __remoteXPCAssetTrackClient_HandleCachedPropertyLoaded_block_invoke(uint64_t a1)
{
  FigCFDictionarySetInt32();
  if (*(void *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
  {
    v2 = *(const void **)(a1 + 40);
    v3 = *(__CFDictionary **)(*(void *)(a1 + 32) + 40);
    if (*(void *)(a1 + 56)) {
      v4 = *(const void **)(a1 + 56);
    }
    else {
      v4 = (const void *)*MEMORY[0x1E4F1D260];
    }
    CFDictionarySetValue(v3, v2, v4);
  }
}

@end