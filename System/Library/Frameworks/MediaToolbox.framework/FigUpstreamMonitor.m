@interface FigUpstreamMonitor
@end

@implementation FigUpstreamMonitor

void __FigUpstreamMonitor_CreateOrRetainSharedMonitor_block_invoke(uint64_t a1)
{
  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)context;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  v4 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0xA004049E9B67CuLL);
  if (!v4) {
    goto LABEL_14;
  }
  if (FigUpstreamMonitor_CreateGuts_functionsOnce != -1) {
    dispatch_once(&FigUpstreamMonitor_CreateGuts_functionsOnce, &__block_literal_global_6_0);
  }
  v5 = sUpstreamMonitorUsingCoreAUC == 1
     ? &FigUpstreamMonitor_CreateGuts_constRealFunctions
     : &FigUpstreamMonitor_CreateGuts_constStubFunctions;
  long long v6 = v5[1];
  *(_OWORD *)(v4 + 8) = *v5;
  *(_OWORD *)(v4 + 24) = v6;
  *((void *)v4 + 5) = *((void *)v5 + 4);
  if (CMNotificationCenterRegisterForBarrierSupport()
    || (*((void *)v4 + 6) = DefaultLocalCenter,
        (*((unsigned int (**)(void (*)(uint64_t), char *, void, char *))v4 + 1))(FigUpstreamMonitorProtectionStatusChangedCallback, v4, 0, v4)))
  {
LABEL_14:
    FigUpstreamMonitor_DisposeGuts((CFTypeRef *)v4);
    v4 = 0;
  }
  else
  {
    CMNotificationCenterAddListener();
  }
  *(void *)context = v4;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
LABEL_12:
  }
    ++context[2];
}

_DWORD *__FigUpstreamMonitor_ReleaseSharedMonitor_block_invoke(uint64_t a1)
{
  result = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  int v3 = result[2] - 1;
  result[2] = v3;
  if (!v3)
  {
    v4 = result;
    result = (_DWORD *)FigUpstreamMonitor_DisposeGuts(*(void **)(a1 + 40));
    void *v4 = 0;
  }
  return result;
}

void __FigUpstreamMonitor_CreateGuts_block_invoke()
{
  sUpstreamMonitorUsingCoreAUC = 1;
}

@end