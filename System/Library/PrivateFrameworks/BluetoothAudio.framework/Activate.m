@interface Activate
@end

@implementation Activate

void __endpoint_Activate_block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 1024;
    int v18 = a2;
    _os_log_impl(&dword_227451000, v4, OS_LOG_TYPE_DEFAULT, "Activated %@ with result %d", buf, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 72) + 1;
  *(void *)(v6 + 72) = v7;
  if (a2)
  {
    uint64_t v8 = 0;
    *(void *)(v6 + 80) = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v6 + 80);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)v6;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __endpoint_Activate_block_invoke_74;
    v13[3] = &__block_descriptor_76_e5_v8__0l;
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v13[4] = v9;
    v13[5] = v11;
    v13[6] = v8;
    v13[7] = v7;
    int v14 = a2;
    v13[8] = v12;
    dispatch_async(v10, v13);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
}

void __endpoint_Activate_block_invoke_74(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 64));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end