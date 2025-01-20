@interface AXXMIGCopyAttributeValue
@end

@implementation AXXMIGCopyAttributeValue

uint64_t ___AXXMIGCopyAttributeValue_block_invoke(uint64_t a1)
{
  uint64_t result = gCallbacks(*(void *)(a1 + 52), *(void *)(a1 + 60), *(int *)(a1 + 48), *(void *)(*(void *)(a1 + 40) + 8) + 24, gUserData);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end