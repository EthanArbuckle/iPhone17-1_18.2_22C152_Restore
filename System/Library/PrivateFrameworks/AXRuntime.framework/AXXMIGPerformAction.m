@interface AXXMIGPerformAction
@end

@implementation AXXMIGPerformAction

uint64_t ___AXXMIGPerformAction_block_invoke(uint64_t a1)
{
  uint64_t result = xmmword_1EB39E828(*(void *)(a1 + 44), *(void *)(a1 + 52), *(unsigned int *)(a1 + 40), gUserData);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end