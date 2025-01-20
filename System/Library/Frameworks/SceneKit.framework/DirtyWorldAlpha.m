@interface DirtyWorldAlpha
@end

@implementation DirtyWorldAlpha

uint64_t ____DirtyWorldAlpha_block_invoke(uint64_t a1, _DWORD *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = (a2[55] & 0x20) == 0;
  }
  if (!v2) {
    return 1;
  }
  a2[55] |= 0x20u;
  if (*(unsigned char *)(a1 + 40)) {
    C3DScenePostPipelineEvent(*(void *)(a1 + 32), 4, a2, 0);
  }
  return 0;
}

@end