@interface DisplaySetLockState
@end

@implementation DisplaySetLockState

uint64_t ___DisplaySetLockState_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 204) = *(_DWORD *)(result + 40);
  return result;
}

@end