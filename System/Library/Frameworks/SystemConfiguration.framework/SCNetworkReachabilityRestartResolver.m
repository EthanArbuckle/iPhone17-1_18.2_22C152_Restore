@interface SCNetworkReachabilityRestartResolver
@end

@implementation SCNetworkReachabilityRestartResolver

void ____SCNetworkReachabilityRestartResolver_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 112))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2000000000;
    char v21 = 0;
    int FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(v6 + 193, *(void *)(a1 + 40), *(nw_path_t *)(v6 + 248), *(_DWORD *)(v6 + 80), *(_DWORD *)(v6 + 272), *(void *)(v6 + 280), *(unsigned __int8 *)(v6 + 288), *(_DWORD *)(v6 + 292));
    int interface_index = nw_path_get_interface_index();
    uint64_t count = nw_array_get_count();
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)(v10 + 272) = a2;
    nw_release(*(void **)(v10 + 280));
    *(void *)(*(void *)(a1 + 32) + 280) = nw_retain(a3);
    uint64_t v11 = *(void *)(a1 + 32);
    *(unsigned char *)(v11 + 288) = 0;
    *(void *)(v11 + 292) = 0;
    nw_array_apply();
    int v12 = *((unsigned __int8 *)v19 + 24);
    uint64_t v13 = *(void *)(a1 + 32);
    *(unsigned char *)(v13 + 288) = v12;
    int v14 = __SCNetworkReachabilityGetFlagsFromPath(v13 + 193, (uint64_t)"ShouldUpdateClient", *(nw_path_t *)(v13 + 248), *(_DWORD *)(v13 + 80), *(_DWORD *)(v13 + 272), *(void *)(v13 + 280), v12, *(_DWORD *)(v13 + 292));
    int v15 = nw_path_get_interface_index();
    uint64_t v16 = nw_array_get_count();
    uint64_t v17 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v13 + 113) && v14 == FlagsFromPath && v15 == interface_index && v16 == count)
    {
      if (pthread_mutex_unlock((pthread_mutex_t *)(v17 + 16))) {
        ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2();
      }
    }
    else
    {
      reachUpdateAndUnlock(v17);
    }
    _Block_object_dispose(&v18, 8);
  }
  else if (pthread_mutex_unlock((pthread_mutex_t *)(v6 + 16)))
  {
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1();
  }
}

BOOL ____SCNetworkReachabilityRestartResolver_block_invoke_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  uint64_t v6 = nw_path_evaluator_copy_path();
  if (!v6)
  {
    int FlagsFromPath = 0;
    goto LABEL_23;
  }
  v19 = 0;
  nw_endpoint_type_t type = nw_endpoint_get_type(a3);
  nw_endpoint_type_t v8 = type;
  if (type == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(a3);
    if (!address)
    {
LABEL_16:
      CrazyIvan46Path = __SCNetworkReachabilityCreateCrazyIvan46Path(v6, a3, *(NSObject **)(*(void *)(a1 + 40) + 232), 0);
      if (CrazyIvan46Path)
      {
        uint64_t v13 = CrazyIvan46Path;
        nw_release(v6);
        uint64_t v6 = v13;
      }
      goto LABEL_18;
    }
    _SC_sockaddr_to_string((uint64_t)address, v20, 0x80uLL);
    goto LABEL_10;
  }
  if (type != nw_endpoint_type_url && type != nw_endpoint_type_host)
  {
    int v11 = asprintf(&v19, "endpoint %zu, ?");
    goto LABEL_12;
  }
  if (nw_endpoint_get_hostname(a3))
  {
LABEL_10:
    int v11 = asprintf(&v19, "endpoint %zu, %s");
LABEL_12:
    if (v11 < 0 && v19)
    {
      free(v19);
      v19 = 0;
    }
    if (v8 != nw_endpoint_type_address) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_18:
  if (v19) {
    int v14 = v19;
  }
  else {
    int v14 = "";
  }
  int FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(*(void *)(a1 + 40) + 193, (uint64_t)v14, v6, 0, 0, 0, 0, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  if (v19) {
    free(v19);
  }
LABEL_23:
  int interface_index = nw_path_get_interface_index();
  nw_release(v6);
  nw_release(evaluator_for_endpoint);
  uint64_t v16 = *(void *)(a1 + 40);
  BOOL v17 = (*(_DWORD *)(v16 + 292) & 6) != 2;
  if ((FlagsFromPath & 4) != 0) {
    BOOL v17 = (*(_DWORD *)(v16 + 292) & 2) == 0;
  }
  BOOL result = 1;
  if ((FlagsFromPath & 2) != 0 && v17)
  {
    *(_DWORD *)(v16 + 292) = FlagsFromPath;
    *(_DWORD *)(v16 + 296) = interface_index;
    if ((FlagsFromPath & 4) == 0) {
      return 0;
    }
  }
  return result;
}

void ____SCNetworkReachabilityRestartResolver_block_invoke(uint64_t a1)
{
  nw_resolver_cancel();
  v2 = *(void **)(a1 + 32);

  nw_release(v2);
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_137(uint64_t a1)
{
  if (pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_137_cold_2();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2 == *(void **)(v3 + 264))
  {
    *(void *)(v3 + 264) = 0;
    v2 = *(void **)(a1 + 40);
  }
  nw_release(v2);
  if (pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 16))) {
    ____SCNetworkReachabilityRestartResolver_block_invoke_137_cold_1();
  }
  v4 = *(const void **)(a1 + 32);

  CFRelease(v4);
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_137_cold_1()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_137_cold_2()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2()
{
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3()
{
}

@end