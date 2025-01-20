@interface StartListeningForClientProcessDeath
@end

@implementation StartListeningForClientProcessDeath

uint64_t __figXPC_StartListeningForClientProcessDeath_block_invoke(uint64_t a1)
{
  FigSimpleMutexLock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 112));
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 104), (const void *)*(int *)(a1 + 40));
  if (Value && !Value[4]) {
    figXPC_ForgetProcessInfo(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
  }
  v3 = *(pthread_mutex_t **)(*(void *)(a1 + 32) + 112);

  return FigSimpleMutexUnlock(v3);
}

void __figXPC_StartListeningForClientProcessDeath_block_invoke_2(uint64_t a1)
{
}

@end