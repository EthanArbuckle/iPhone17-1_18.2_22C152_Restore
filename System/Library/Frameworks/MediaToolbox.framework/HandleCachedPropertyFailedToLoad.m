@interface HandleCachedPropertyFailedToLoad
@end

@implementation HandleCachedPropertyFailedToLoad

void __remoteXPCAssetClient_HandleCachedPropertyFailedToLoad_block_invoke(void *a1)
{
  FigCFDictionarySetInt32();
  v2 = (const void *)a1[6];
  if (v2)
  {
    v3 = (const void *)a1[5];
    v4 = *(__CFDictionary **)(a1[4] + 24);
    CFDictionarySetValue(v4, v3, v2);
  }
}

void __remoteXPCAssetTrackClient_HandleCachedPropertyFailedToLoad_block_invoke(void *a1)
{
  FigCFDictionarySetInt32();
  v2 = (const void *)a1[6];
  if (v2)
  {
    v3 = (const void *)a1[5];
    v4 = *(__CFDictionary **)(a1[4] + 32);
    CFDictionarySetValue(v4, v3, v2);
  }
}

@end