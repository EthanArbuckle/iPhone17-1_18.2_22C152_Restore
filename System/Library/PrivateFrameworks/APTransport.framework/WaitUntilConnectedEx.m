@interface WaitUntilConnectedEx
@end

@implementation WaitUntilConnectedEx

uint64_t __stream_WaitUntilConnectedEx_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 24)) {
    int v2 = -16617;
  }
  else {
    int v2 = *(_DWORD *)(v1 + 48);
  }
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

@end