@interface SCNetworkReachabilityGetFlagsFromPath
@end

@implementation SCNetworkReachabilityGetFlagsFromPath

uint64_t ____SCNetworkReachabilityGetFlagsFromPath_block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  if (xdict)
  {
    data = (const char *)xpc_dictionary_get_data(xdict, "data", v8);
    if (data)
    {
      if (v8[0] >= 0xD8)
      {
        v5 = data;
        if (v8[0] == *((unsigned int *)data + 53) + 216 && !strncmp("NetworkExtension", data + 16, 0x20uLL))
        {
          int v6 = *((_DWORD *)v5 + 52) & 0x12;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1u;
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = "nw_path_status_satisfied, VPN";
          if (v6 == 16 && *(_DWORD *)(a1 + 64) == 2 && *(_DWORD *)(a1 + 68) == 2 && !nw_array_get_count())
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 0x24u;
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = "nw_path_status_satisfied, OnDemand";
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          }
        }
      }
    }
  }
  return 1;
}

@end