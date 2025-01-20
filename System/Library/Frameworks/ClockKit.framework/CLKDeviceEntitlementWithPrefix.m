@interface CLKDeviceEntitlementWithPrefix
@end

@implementation CLKDeviceEntitlementWithPrefix

uint64_t ___CLKDeviceEntitlementWithPrefix_block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = 1;
  v7 = [NSString stringWithCString:a2 encoding:1];
  int v8 = [v7 hasPrefix:a1[4]];
  if (v5 && v8)
  {
    if (MEMORY[0x21D4AB0E0](v5) == MEMORY[0x263EF86E0])
    {
      uint64_t v6 = 1;
      if (xpc_BOOL_get_value(v5))
      {
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }

  return v6;
}

@end