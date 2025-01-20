@interface SetCachedAssetTrackPropertyValue
@end

@implementation SetCachedAssetTrackPropertyValue

void __remoteXPCAssetTrack_SetCachedAssetTrackPropertyValue_block_invoke(void *a1)
{
  FigCFDictionarySetInt32();
  v2 = (const void *)a1[5];
  v3 = *(__CFDictionary **)(a1[4] + 40);
  if (a1[6]) {
    v4 = (const void *)a1[6];
  }
  else {
    v4 = (const void *)*MEMORY[0x1E4F1D260];
  }

  CFDictionarySetValue(v3, v2, v4);
}

@end