@interface DownloadCatalogAndRequery
@end

@implementation DownloadCatalogAndRequery

void __figMobileAsset_DownloadCatalogAndRequery_block_invoke(uint64_t a1)
{
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    if (CFAbsoluteTimeGetCurrent() - *((double *)Value + 6) > *((double *)Value + 5))
    {
      figMobileAsset_UpdateLastUpdatedTime(*(CFTypeRef *)(a1 + 32));
      v3 = (void *)MEMORY[0x192FC5D30]();
      v4 = *(const void **)(a1 + 32);
      if (v4) {
        CFRetain(v4);
      }
      v5 = (const void *)Value[1];
      if (v5) {
        CFRetain(v5);
      }
      v6 = (const void *)Value[2];
      if (v6) {
        CFRetain(v6);
      }
      v7 = (const void *)Value[3];
      if (v7) {
        CFRetain(v7);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __figMobileAsset_DownloadCatalogAndRequery_block_invoke_2;
      v13 = &__block_descriptor_52_e8_v16__0q8l;
      int v16 = *(_DWORD *)(a1 + 40);
      uint64_t v14 = v8;
      v15 = Value;
      objc_msgSend((id)sMAAssetClass, "startCatalogDownload:then:");
    }
  }
  v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
}

void __figMobileAsset_DownloadCatalogAndRequery_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    figMobileAsset_QueryMostRecentAsset(*(void *)(a1 + 32), (*(_DWORD *)(a1 + 48) + 1), **(unsigned int **)(a1 + 40), 0, *(void *)(*(void *)(a1 + 40) + 8), *(void *)(*(void *)(a1 + 40) + 16), *(void *)(*(void *)(a1 + 40) + 24));
  }
  v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(void **)(a1 + 40);
  v5 = (const void *)v4[1];
  if (v5)
  {
    CFRelease(v5);
    v4 = *(void **)(a1 + 40);
  }
  v6 = (const void *)v4[2];
  if (v6)
  {
    CFRelease(v6);
    v4 = *(void **)(a1 + 40);
  }
  v7 = (const void *)v4[3];
  if (v7)
  {
    CFRelease(v7);
  }
}

@end