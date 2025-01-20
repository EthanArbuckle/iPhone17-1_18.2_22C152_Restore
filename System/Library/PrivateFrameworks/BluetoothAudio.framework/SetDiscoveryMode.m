@interface SetDiscoveryMode
@end

@implementation SetDiscoveryMode

void __manager_SetDiscoveryMode_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v3;
    _os_log_impl(&dword_227451000, v2, OS_LOG_TYPE_DEFAULT, "Discovery Mode set to %{public}@", buf, 0xCu);
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  v4 = (const void *)*MEMORY[0x263F011C0];
  int v5 = CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x263F011C0]);
  v6 = *(const void **)(*(void *)(a1 + 48) + 24);
  if (v5)
  {
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(*(void *)(a1 + 48) + 24) = CFRetain(v4);
    v7 = [*(id *)(*(void *)(a1 + 48) + 40) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __manager_SetDiscoveryMode_block_invoke_14;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    int8x16_t v14 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    dispatch_async(v7, block);
  }
  else
  {
    CFTypeRef v8 = CFRetain(v6);
    v9 = *(const void **)(*(void *)(a1 + 48) + 24);
    if (v9) {
      CFRelease(v9);
    }
    v10 = (const void *)*MEMORY[0x263F011B0];
    if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x263F011B0]))
    {
      CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x263F011C8]);
      v10 = (const void *)*MEMORY[0x263F011B8];
    }
    *(void *)(*(void *)(a1 + 48) + 24) = CFRetain(v10);
    CFEqual(v8, v4);
    if (CFEqual(v8, *(CFTypeRef *)(*(void *)(a1 + 48) + 24)))
    {
      v11 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227451000, v11, OS_LOG_TYPE_DEFAULT, "Not changing scan parameters", buf, 2u);
      }
      CFRelease(*(CFTypeRef *)(a1 + 40));
    }
    else
    {
      v12 = [*(id *)(*(void *)(a1 + 48) + 40) queue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __manager_SetDiscoveryMode_block_invoke_12;
      v15[3] = &__block_descriptor_49_e5_v8__0l;
      char v17 = 0;
      int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      dispatch_async(v12, v15);
    }
    CFRelease(v8);
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 32), v4))
  {
    if (BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(void *)(a1 + 48) + 32))) {
      manager_postEndpointsChangedNotification(*(const void **)(a1 + 40));
    }
  }
}

void __manager_SetDiscoveryMode_block_invoke_12(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) startLEScanning:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void __manager_SetDiscoveryMode_block_invoke_14(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) stopLEScanning];
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end