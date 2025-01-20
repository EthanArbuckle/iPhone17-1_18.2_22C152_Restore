@interface SetCachedAssetPropertyValue
@end

@implementation SetCachedAssetPropertyValue

void __remoteXPCAsset_SetCachedAssetPropertyValue_block_invoke(void *a1)
{
  FigCFDictionarySetInt32();
  v2 = (const void *)a1[5];
  if (!CFEqual(@"assetProperty_MakeReadAheadAssertionWhenCreatingByteStream", v2)
    && !CFEqual(@"assetProperty_OriginalReadAheadAssertion", v2)
    && !CFEqual(@"assetProperty_FormatReader", v2))
  {
    v3 = (const void *)a1[5];
    v4 = *(__CFDictionary **)(a1[4] + 32);
    if (a1[6]) {
      v5 = (const void *)a1[6];
    }
    else {
      v5 = (const void *)*MEMORY[0x1E4F1D260];
    }
    CFDictionarySetValue(v4, v3, v5);
  }
}

@end