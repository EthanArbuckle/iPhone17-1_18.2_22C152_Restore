@interface ACSIntrospect
@end

@implementation ACSIntrospect

void ___ACSIntrospect_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CFErrorRef v26 = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 72), &v26, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    v11 = *(void **)(a1 + 40);
    global_queue = dispatch_get_global_queue(0, 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 0x40000000;
    v22[2] = ___ACSIntrospect_block_invoke_2;
    v22[3] = &unk_1E6CC4248;
    int v23 = *(_DWORD *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 48);
    v22[6] = *(void *)(a1 + 56);
    v22[4] = *(void *)(a1 + 32);
    v22[5] = v13;
    v22[7] = *(void *)(a1 + 64);
    v22[8] = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, v22);
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  else
  {
    xpc_release(*(xpc_object_t *)(a1 + 40));
    v14 = qword_1EB6789F0;
    if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(a1 + 72);
      uint64_t v16 = *(void *)(a1 + 48);
      CFErrorRef v17 = v26;
      CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
      *(_DWORD *)buf = 67109890;
      int v28 = v15;
      __int16 v29 = 2080;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      CFErrorRef v32 = v17;
      __int16 v33 = 2048;
      CFAbsoluteTime v34 = v18;
      _os_log_impl(&dword_1DD432000, v14, OS_LOG_TYPE_DEFAULT, "#%08x %s -> error: %@, elapsed %.3f", buf, 0x26u);
    }
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      CFErrorRef Copy = v26;
      if (v26)
      {
        CFErrorRef Copy = aclErrorCreateCopy(v26);
        uint64_t v19 = *(void *)(a1 + 32);
      }
      v21 = *(NSObject **)(a1 + 64);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ACSIntrospect_block_invoke_175;
      block[3] = &unk_1E6CC41F8;
      block[4] = v19;
      block[5] = Copy;
      int v25 = *(_DWORD *)(a1 + 72);
      block[6] = *(void *)(a1 + 48);
      block[7] = v21;
      dispatch_async(v21, block);
    }
    if (v26) {
      CFRelease(v26);
    }
  }
}

void ___ACSIntrospect_block_invoke_175(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      ___ACSIntrospect_block_invoke_175_cold_1();
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    if (CFGetRetainCount(v3) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 64), *(void *)(a1 + 48), (uint64_t)"error", *(void *)(a1 + 40));
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

void ___ACSIntrospect_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEBUG)) {
    ___ACSIntrospect_block_invoke_2_cold_1();
  }
  if (MEMORY[0x1E01B5B30](a2) == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_value(a2, "introspection")) {
      v9 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else {
      v9 = 0;
    }
    v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 72), a2);
  }
  else
  {
    v8 = aclErrorCreate(*(unsigned int *)(a1 + 72), (const __CFString *)*MEMORY[0x1E4F1D160], 100, @"unexpected reply from XPC service %s: %@", v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    v9 = 0;
  }
  v10 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(_DWORD *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 40);
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 67110147;
    int v21 = v11;
    __int16 v22 = 2080;
    uint64_t v23 = v12;
    __int16 v24 = 2113;
    int v25 = v9;
    __int16 v26 = 2112;
    v27 = v8;
    __int16 v28 = 2048;
    CFAbsoluteTime v29 = v13;
    _os_log_impl(&dword_1DD432000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s -> result %{private}@, error %@, elapsed %.3f", buf, 0x30u);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v8)
    {
      CFErrorRef Copy = aclErrorCreateCopy(v8);
      uint64_t v14 = *(void *)(a1 + 32);
    }
    else
    {
      CFErrorRef Copy = 0;
    }
    uint64_t v16 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = ___ACSIntrospect_block_invoke_178;
    block[3] = &unk_1E6CC4220;
    block[4] = v14;
    block[5] = v9;
    int v19 = *(_DWORD *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 40);
    block[6] = Copy;
    block[7] = v17;
    void block[8] = v16;
    dispatch_async(v16, block);
  }
  else if (v9)
  {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  xpc_release(*(xpc_object_t *)(a1 + 64));
}

void ___ACSIntrospect_block_invoke_178(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      ___ACSIntrospect_block_invoke_178_cold_2();
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1) {
      ___ACSIntrospect_block_invoke_178_cold_1();
    }
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    if (CFGetRetainCount(v4) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(void *)(a1 + 56), (uint64_t)"introspection", *(void *)(a1 + 40));
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  uint64_t v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(void *)(a1 + 56), (uint64_t)"error", *(void *)(a1 + 48));
    }
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  uint64_t v6 = *(const void **)(a1 + 40);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(NSObject **)(a1 + 64);

  dispatch_release(v8);
}

void ___ACSIntrospect_block_invoke_175_cold_1()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1637, "CFGetRetainCount(callbackError) == 1");
}

void ___ACSIntrospect_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DD432000, v0, v1, "#%08x %s reply callback(object=%@)");
}

void ___ACSIntrospect_block_invoke_178_cold_1()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1672, "CFGetRetainCount(callbackError) == 1");
}

void ___ACSIntrospect_block_invoke_178_cold_2()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1671, "CFGetRetainCount(introspection) == 1");
}

@end