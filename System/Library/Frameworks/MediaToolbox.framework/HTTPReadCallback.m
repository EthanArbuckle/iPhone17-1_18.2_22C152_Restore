@interface HTTPReadCallback
@end

@implementation HTTPReadCallback

const void *__fpic_HTTPReadCallback_block_invoke(uint64_t a1)
{
  result = (const void *)fpic_FindURLReq(*(void *)(a1 + 40), @"FPICURLR_HTTPRequest", *(const void **)(a1 + 48));
  if (result != (const void *)-1)
  {
    result = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 56) + 624), (CFIndex)result);
    if (result) {
      result = CFRetain(result);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __fpic_HTTPReadCallback_block_invoke_100(uint64_t a1)
{
  fpic_ClearAssetListResponseAfterAssetListReadFailure(*(const void **)(a1 + 32), *(const void **)(a1 + 40), *(_DWORD *)(a1 + 48));
  fpic_UpdateEventLastPlaybackFailed(*(const void **)(a1 + 32), *(void *)(a1 + 40), 1);
  v2 = *(const void **)(a1 + 32);
  v3 = *(const void **)(a1 + 40);

  fpic_RemoveEvent(v2, v3, 0, 0, 0);
}

@end