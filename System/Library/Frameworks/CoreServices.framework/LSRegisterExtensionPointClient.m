@interface LSRegisterExtensionPointClient
@end

@implementation LSRegisterExtensionPointClient

uint64_t ___LSRegisterExtensionPointClient_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = _LSGetOSStatusFromNSError(a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___LSRegisterExtensionPointClient_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  if (a2) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = _LSGetOSStatusFromNSError(a3);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end