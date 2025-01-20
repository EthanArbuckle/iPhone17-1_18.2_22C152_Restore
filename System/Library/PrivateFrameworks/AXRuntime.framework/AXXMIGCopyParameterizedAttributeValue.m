@interface AXXMIGCopyParameterizedAttributeValue
@end

@implementation AXXMIGCopyParameterizedAttributeValue

uint64_t ___AXXMIGCopyParameterizedAttributeValue_block_invoke(uint64_t a1)
{
  uint64_t result = (*((uint64_t (**)(void, void, void, void, uint64_t, uint64_t))&xmmword_1EB39E838 + 1))(*(void *)(a1 + 60), *(void *)(a1 + 68), *(int *)(a1 + 56), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 40) + 8) + 24, gUserData);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end