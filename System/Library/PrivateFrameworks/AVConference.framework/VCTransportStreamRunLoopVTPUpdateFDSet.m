@interface VCTransportStreamRunLoopVTPUpdateFDSet
@end

@implementation VCTransportStreamRunLoopVTPUpdateFDSet

uint64_t ___VCTransportStreamRunLoopVTPUpdateFDSet_block_invoke(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = *(_DWORD *)(v5 + 24);
  if (v6 <= a4) {
    int v6 = a4;
  }
  *(_DWORD *)(v5 + 24) = v6;
  v7 = (char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (__darwin_check_fd_set_overflow(a4, v7, 0)) {
    *(_DWORD *)&v7[((unint64_t)a4 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << a4;
  }
  return 0;
}

@end