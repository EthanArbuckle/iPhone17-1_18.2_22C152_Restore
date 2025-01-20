@interface AXXMIGPerformActionWithValue
@end

@implementation AXXMIGPerformActionWithValue

uint64_t ___AXXMIGPerformActionWithValue_block_invoke(uint64_t a1)
{
  uint64_t result = ((uint64_t (*)(void, void, void, void, uint64_t, void))*(&xmmword_1EB39E828 + 1))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned int *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), gUserData, *(unsigned int *)(a1 + 52));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end