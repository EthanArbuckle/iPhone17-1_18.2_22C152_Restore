@interface SCNetworkReachabilitySetDispatchQueue
@end

@implementation SCNetworkReachabilitySetDispatchQueue

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke(uint64_t a1)
{
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_2();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2 == *(void **)(v3 + 240))
  {
    *(void *)(v3 + 240) = 0;
    v2 = *(void **)(a1 + 40);
  }
  nw_release(v2);
  if (pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_1();
  }
  v4 = *(const void **)(a1 + 32);

  CFRelease(v4);
}

uint64_t ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2(uint64_t a1, void *a2)
{
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_3();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 112))
  {
    int FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(v4 + 193, (uint64_t)"Path updated", *(nw_path_t *)(v4 + 248), *(_DWORD *)(v4 + 80), *(_DWORD *)(v4 + 272), *(void *)(v4 + 280), *(unsigned __int8 *)(v4 + 288), *(_DWORD *)(v4 + 292));
    int interface_index = nw_path_get_interface_index();
    uint64_t count = nw_array_get_count();
    nw_release(*(void **)(*(void *)(a1 + 32) + 248));
    *(void *)(*(void *)(a1 + 32) + 248) = nw_retain(a2);
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v8 + 80) <= 1u)
    {
      CrazyIvan46Path = __SCNetworkReachabilityCreateCrazyIvan46Path(*(NSObject **)(v8 + 248), *(NSObject **)(a1 + 40), *(NSObject **)(v8 + 232), 1);
      uint64_t v8 = *(void *)(a1 + 32);
      if (CrazyIvan46Path)
      {
        v10 = CrazyIvan46Path;
        nw_release(*(void **)(v8 + 248));
        *(void *)(*(void *)(a1 + 32) + 248) = v10;
        uint64_t v8 = *(void *)(a1 + 32);
      }
    }
    int v11 = *(_DWORD *)(v8 + 272);
    if (v11 == 2)
    {
      *(_DWORD *)(v8 + 272) = 0;
      __SCNetworkReachabilityRestartResolver((void **)v8, (uint64_t)"Path updated, restart DNS");
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = *(_DWORD *)(v8 + 272);
    }
    int v12 = __SCNetworkReachabilityGetFlagsFromPath(v8 + 193, (uint64_t)"ShouldUpdateClient", *(nw_path_t *)(v8 + 248), *(_DWORD *)(v8 + 80), v11, *(void *)(v8 + 280), *(unsigned __int8 *)(v8 + 288), *(_DWORD *)(v8 + 292));
    int v13 = nw_path_get_interface_index();
    uint64_t v14 = nw_array_get_count();
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v8 + 113) && v12 == FlagsFromPath && v13 == interface_index && v14 == count)
    {
      uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(v15 + 16));
      if (result) {
        ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_2();
      }
    }
    else
    {
      return reachUpdateAndUnlock(v15);
    }
  }
  else
  {
    uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(v4 + 16));
    if (result) {
      ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_1();
    }
  }
  return result;
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_3(uint64_t a1)
{
  nw_resolver_cancel();
  v2 = *(void **)(a1 + 32);

  nw_release(v2);
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_1()
{
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_2()
{
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_1()
{
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_2()
{
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_3()
{
}

@end