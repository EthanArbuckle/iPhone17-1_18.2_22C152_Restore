@interface Stop
@end

@implementation Stop

uint64_t __ids_Stop_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 36);
  if (v2 == 1)
  {
    uint64_t v3 = result;
    *(_WORD *)(v1 + 88) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 144));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v3 + 32) + 152));
    result = FigThreadJoin(*(pthread_t *)(*(void *)(v3 + 32) + 80), 0);
    *(void *)(*(void *)(v3 + 32) + 80) = 0;
    uint64_t v1 = *(void *)(v3 + 32);
    int v2 = *(_DWORD *)(v1 + 36);
  }
  BOOL v4 = __OFSUB__(v2, 1);
  int v5 = v2 - 1;
  if (v5 < 0 == v4) {
    *(_DWORD *)(v1 + 36) = v5;
  }
  return result;
}

uint64_t __tcp_Stop_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 48);
  if (v2 == 1)
  {
    uint64_t v3 = result;
    *(_WORD *)(v1 + 120) = 1;
    int v4 = *(_DWORD *)(v1 + 92);
    if ((v4 & 0x80000000) == 0)
    {
      close(v4);
      uint64_t v1 = *(void *)(v3 + 32);
      *(_DWORD *)(v1 + 92) = -1;
    }
    FigThreadJoin(*(pthread_t *)(v1 + 112), 0);
    *(void *)(*(void *)(v3 + 32) + 112) = 0;
    result = tcp_CleanupFileDescriptors(*(void *)(v3 + 40));
    uint64_t v1 = *(void *)(v3 + 32);
    int v2 = *(_DWORD *)(v1 + 48);
  }
  BOOL v5 = __OFSUB__(v2, 1);
  int v6 = v2 - 1;
  if (v6 < 0 == v5) {
    *(_DWORD *)(v1 + 48) = v6;
  }
  return result;
}

_opaque_pthread_t *__usb_Stop_block_invoke(_opaque_pthread_t *result)
{
  uint64_t v1 = *(void *)&result->__opaque[16];
  int v2 = *(_DWORD *)(v1 + 88);
  if (v2 == 1)
  {
    uint64_t v3 = result;
    int v4 = *(const void **)(v1 + 80);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(*(void *)&v3->__opaque[16] + 80) = 0;
    }
    result = usb_stopMessageSendingAndReceivingThreads(*(void *)&v3->__opaque[24]);
    uint64_t v1 = *(void *)&v3->__opaque[16];
    int v2 = *(_DWORD *)(v1 + 88);
  }
  BOOL v5 = __OFSUB__(v2, 1);
  int v6 = v2 - 1;
  if (v6 < 0 == v5) {
    *(_DWORD *)(v1 + 88) = v6;
  }
  return result;
}

@end