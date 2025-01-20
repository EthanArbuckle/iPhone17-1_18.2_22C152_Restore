@interface AXXMIGCopyElementAtPosition
@end

@implementation AXXMIGCopyElementAtPosition

uint64_t ___AXXMIGCopyElementAtPosition_block_invoke(uint64_t a1)
{
  uint64_t result = xmmword_1EB39E838(*(void *)(a1 + 62), *(void *)(a1 + 70), *(unsigned __int16 *)(a1 + 60), *(unsigned int *)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 8) + 24, gUserData, *(float *)(a1 + 48), *(float *)(a1 + 52));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end