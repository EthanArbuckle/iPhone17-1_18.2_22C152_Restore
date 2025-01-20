@interface GetStatusOfValueForProperty
@end

@implementation GetStatusOfValueForProperty

uint64_t __remoteXPCAsset_GetStatusOfValueForProperty_block_invoke(uint64_t a1)
{
  uint64_t result = FigCFDictionaryGetInt32IfPresent();
  if (result)
  {
    uint64_t result = 0;
    **(_DWORD **)(a1 + 56) = 2;
    v3 = *(_DWORD **)(a1 + 64);
    if (v3) {
      _DWORD *v3 = 0;
    }
    v4 = *(void **)(a1 + 72);
    if (v4) {
      void *v4 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end