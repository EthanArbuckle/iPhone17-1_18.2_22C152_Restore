void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *SharedLocatorConnection;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *global_queue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const void *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  CFTypeRef v22;
  CFAbsoluteTime v23;
  uint64_t v24;
  void *Copy;
  NSObject *v26;
  void handler[10];
  int v28;
  void v29[8];
  int v30;
  CFTypeRef cf;
  uint64_t block;
  unsigned char v33[32];
  CFAbsoluteTime v34;
  CFTypeRef v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E4F143B8];
  cf = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 80), (CFErrorRef *)&cf, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    v11 = *(void **)(a1 + 40);
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_118;
    handler[3] = &unk_1E6CC40C0;
    v28 = *(_DWORD *)(a1 + 80);
    handler[6] = *(void *)(a1 + 48);
    v14 = *(void *)(a1 + 56);
    v13 = *(void *)(a1 + 64);
    handler[4] = *(void *)(a1 + 32);
    handler[5] = v13;
    v15 = *(void *)(a1 + 72);
    handler[7] = v14;
    handler[8] = v15;
    handler[9] = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, handler);
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  else
  {
    xpc_release(*(xpc_object_t *)(a1 + 40));
    v16 = *(void *)(a1 + 48);
    v17 = *(double *)(a1 + 56);
    block = MEMORY[0x1E4F143A8];
    *(void *)v33 = 0x40000000;
    *(void *)&v33[8] = __aclSaveMightHaveResult_block_invoke;
    *(void *)&v33[16] = &__block_descriptor_tmp_276;
    *(void *)&v33[24] = v16;
    v36 = 1;
    v34 = v17;
    v35 = cf;
    dispatch_sync((dispatch_queue_t)qword_1EB678A10, &block);
    v18 = *(const void **)(a1 + 56);
    if (v18) {
      CFRelease(v18);
    }
    v19 = qword_1EB6789F0;
    if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_DWORD *)(a1 + 80);
      v21 = *(void *)(a1 + 64);
      v22 = cf;
      v23 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
      LODWORD(block) = 67110146;
      HIDWORD(block) = v20;
      *(_WORD *)v33 = 2080;
      *(void *)&v33[2] = v21;
      *(_WORD *)&v33[10] = 2112;
      *(void *)&v33[12] = @"new";
      *(_WORD *)&v33[20] = 2112;
      *(void *)&v33[22] = v22;
      *(_WORD *)&v33[30] = 2048;
      v34 = v23;
      _os_log_impl(&dword_1DD432000, v19, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] error: %@, elapsed %.3f", (uint8_t *)&block, 0x30u);
    }
    v24 = *(void *)(a1 + 32);
    if (v24)
    {
      Copy = (void *)cf;
      if (cf)
      {
        Copy = aclErrorCreateCopy((__CFError *)cf);
        v24 = *(void *)(a1 + 32);
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 0x40000000;
      v29[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_115;
      v29[3] = &unk_1E6CC4070;
      v29[4] = v24;
      v29[5] = Copy;
      v30 = *(_DWORD *)(a1 + 80);
      v26 = *(NSObject **)(a1 + 72);
      v29[6] = *(void *)(a1 + 64);
      v29[7] = v26;
      dispatch_async(v26, v29);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

_xpc_connection_s *aclGetSharedLocatorConnection(uint64_t a1, CFErrorRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8 = (_xpc_connection_s *)qword_1EB678A00;
  if (!qword_1EB678A00)
  {
    if (qword_1EB678A08 < 0
      || (global_queue = dispatch_get_global_queue(0, 0),
          (mach_service = xpc_connection_create_mach_service("com.apple.AssetCacheLocatorService", global_queue, 2uLL)) == 0))
    {
      v8 = 0;
      if (a2) {
        *a2 = aclErrorCreate(a1, (const __CFString *)*MEMORY[0x1E4F1D160], 12, @"xpc_connection_create(%s) failed", a5, a6, a7, a8, (char)"com.apple.AssetCacheLocatorService");
      }
    }
    else
    {
      v8 = mach_service;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 0x40000000;
      handler[2] = __aclGetSharedLocatorConnection_block_invoke;
      handler[3] = &__block_descriptor_tmp_272;
      handler[4] = mach_service;
      handler[5] = &qword_1EB678A00;
      xpc_connection_set_event_handler(mach_service, handler);
      qword_1EB678A00 = (uint64_t)v8;
      xpc_connection_resume(v8);
    }
  }
  return v8;
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_118(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEBUG)) {
    __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_118_cold_1();
  }
  if (MEMORY[0x1E01B5B30](a2) == MEMORY[0x1E4F14590])
  {
    BOOL v9 = xpc_dictionary_get_BOOL(a2, "recentlySeen");
    v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 80), a2);
  }
  else
  {
    v8 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E4F1D160], 100, @"unexpected reply from XPC service %s: %@", v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    BOOL v9 = 1;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t block = MEMORY[0x1E4F143A8];
  *(void *)v24 = 0x40000000;
  *(void *)&v24[8] = __aclSaveMightHaveResult_block_invoke;
  *(void *)&v24[16] = &__block_descriptor_tmp_276;
  *(void *)&v24[24] = v10;
  BOOL v25 = v9;
  *(void *)&v24[32] = v11;
  *(void *)&v24[40] = v8;
  dispatch_sync((dispatch_queue_t)qword_1EB678A10, &block);
  v12 = *(const void **)(a1 + 56);
  if (v12) {
    CFRelease(v12);
  }
  v13 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *(_DWORD *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 40);
    CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    LODWORD(block) = 67110402;
    HIDWORD(block) = v14;
    *(_WORD *)v24 = 2080;
    *(void *)&v24[2] = v15;
    *(_WORD *)&v24[10] = 2112;
    *(void *)&v24[12] = @"new";
    *(_WORD *)&v24[20] = 1024;
    *(_DWORD *)&v24[22] = v9;
    *(_WORD *)&v24[26] = 2112;
    *(void *)&v24[28] = v8;
    *(_WORD *)&v24[36] = 2048;
    *(CFAbsoluteTime *)&v24[38] = v16;
    _os_log_impl(&dword_1DD432000, v13, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] mightHave %{BOOL}d, error %@, elapsed %.3f", (uint8_t *)&block, 0x36u);
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17)
  {
    if (v8)
    {
      CFErrorRef Copy = aclErrorCreateCopy(v8);
      uint64_t v17 = *(void *)(a1 + 32);
    }
    else
    {
      CFErrorRef Copy = 0;
    }
    v19 = *(NSObject **)(a1 + 64);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 0x40000000;
    v20[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_123;
    v20[3] = &unk_1E6CC4098;
    v20[4] = v17;
    v20[5] = Copy;
    BOOL v22 = v9;
    int v21 = *(_DWORD *)(a1 + 80);
    v20[6] = *(void *)(a1 + 40);
    v20[7] = v19;
    dispatch_async(v19, v20);
  }
  if (v8) {
    CFRelease(v8);
  }
  xpc_release(*(xpc_object_t *)(a1 + 72));
}

CFErrorRef aclErrorCreateFromXPC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "error");
  if (value)
  {
    uint64_t v4 = value;
    if (MEMORY[0x1E01B5B30]() == MEMORY[0x1E4F14590])
    {
      string = xpc_dictionary_get_string(v4, "errorDomain");
      if (string) {
        CFStringRef v8 = CFStringCreateWithCString(0, string, 0x8000100u);
      }
      else {
        CFStringRef v8 = 0;
      }
      int64_t int64 = xpc_dictionary_get_int64(v4, "errorCode");
      uint64_t v10 = xpc_dictionary_get_string(v4, "errorDescription");
      if (v10)
      {
        CFStringRef v11 = CFStringCreateWithCString(0, v10, 0x8000100u);
        if (v11)
        {
          CFStringRef v12 = v11;
          CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"AssetCacheLocatorService: %@", v11);
          CFStringRef v18 = v13;
          if (v8 && v13)
          {
            CFErrorRef v5 = aclErrorCreate(a1, v8, int64, @"%@", v14, v15, v16, v17, (char)v13);
            goto LABEL_15;
          }
          if (v13)
          {
            CFErrorRef v5 = 0;
LABEL_15:
            CFRelease(v18);
            CFRelease(v12);
            if (!v8) {
              return v5;
            }
            goto LABEL_19;
          }
          CFRelease(v12);
        }
      }
      CFErrorRef v5 = 0;
      if (!v8) {
        return v5;
      }
LABEL_19:
      CFRelease(v8);
      return v5;
    }
  }
  return 0;
}

void ACSMightCurrentNetworkHaveCachingServer(__CFString *a1, NSObject *global_queue, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint32_t v7 = arc4random();
  while (!v7);
  uint32_t v8 = v7;
  BOOL v9 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    uint32_t v43 = v8;
    __int16 v44 = 2080;
    v45 = "ACSMightCurrentNetworkHaveCachingServer";
    __int16 v46 = 2112;
    v47 = a1;
    __int16 v48 = 2048;
    *(void *)v49 = global_queue;
    *(_WORD *)&v49[8] = 2048;
    *(void *)&v49[10] = a3;
    _os_log_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s(options=%@, callbackQueue=%p, callback=%p)", buf, 0x30u);
  }
  if (!a3) {
    goto LABEL_22;
  }
  if (!global_queue) {
    global_queue = dispatch_get_global_queue(0, 0);
  }
  dispatch_retain(global_queue);
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2000000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2000000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2000000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2000000000;
  uint64_t v29 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke;
  block[3] = &unk_1E6CC4020;
  block[4] = &v38;
  block[5] = &v34;
  block[6] = &v30;
  block[7] = &v26;
  dispatch_sync((dispatch_queue_t)qword_1EB678A10, block);
  if (CFAbsoluteTimeGetCurrent() - v39[3] >= 5.0) {
    goto LABEL_16;
  }
  uint64_t v10 = (const void *)v35[3];
  if (!a1)
  {
    if (!v10) {
      goto LABEL_13;
    }
LABEL_16:
    int v14 = 1;
    goto LABEL_17;
  }
  if (!v10 || !CFEqual(a1, v10)) {
    goto LABEL_16;
  }
LABEL_13:
  int v11 = *((unsigned __int8 *)v31 + 24);
  CFStringRef v12 = (__CFError *)v27[3];
  if (v12) {
    CFErrorRef Copy = aclErrorCreateCopy(v12);
  }
  else {
    CFErrorRef Copy = 0;
  }
  CFStringRef v18 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67110402;
    uint32_t v43 = v8;
    __int16 v44 = 2080;
    v45 = "ACSMightCurrentNetworkHaveCachingServer";
    __int16 v46 = 2112;
    v47 = @"same";
    __int16 v48 = 1024;
    *(_DWORD *)v49 = v11;
    *(_WORD *)&v49[4] = 2112;
    *(void *)&v49[6] = Copy;
    *(_WORD *)&v49[14] = 2048;
    *(double *)&v49[16] = v19 - Current;
    _os_log_impl(&dword_1DD432000, v18, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] mightHave %{BOOL}d, error %@, elapsed %.3f", buf, 0x36u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 0x40000000;
  v22[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_105;
  v22[3] = &unk_1E6CC4048;
  v22[4] = a3;
  v22[5] = Copy;
  char v24 = v11;
  uint32_t v23 = v8;
  v22[6] = "ACSMightCurrentNetworkHaveCachingServer";
  v22[7] = global_queue;
  dispatch_async(global_queue, v22);
  int v14 = 0;
LABEL_17:
  uint64_t v15 = (const void *)v27[3];
  if (v15)
  {
    CFRelease(v15);
    v27[3] = 0;
  }
  uint64_t v16 = (const void *)v35[3];
  if (v16)
  {
    CFRelease(v16);
    v35[3] = 0;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  if (v14)
  {
LABEL_22:
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v17, "tag", v8);
    xpc_dictionary_set_string(v17, "command", "recentlySeen");
    if (a1)
    {
      if (CFDictionaryGetValue((CFDictionaryRef)a1, @"autoRefresh") == (const void *)*MEMORY[0x1E4F1CFC8]) {
        xpc_dictionary_set_BOOL(v17, "autoRefresh", 0);
      }
      if (CFDictionaryGetValue((CFDictionaryRef)a1, @"quickMiss") == (const void *)*MEMORY[0x1E4F1CFD0]) {
        xpc_dictionary_set_BOOL(v17, "quickMiss", 1);
      }
      CFRetain(a1);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 0x40000000;
    v20[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2;
    v20[3] = &unk_1E6CC40E8;
    uint32_t v21 = v8;
    *(double *)&v20[6] = Current;
    v20[7] = a1;
    void v20[8] = "ACSMightCurrentNetworkHaveCachingServer";
    v20[4] = a3;
    v20[5] = v17;
    v20[9] = global_queue;
    dispatch_async((dispatch_queue_t)qword_1EB6789F8, v20);
  }
}

void *__aclSaveMightHaveResult_block_invoke(void *result)
{
  if (*((double *)result + 4) > *(double *)&qword_1EB678A40)
  {
    v1 = result;
    qword_1EB678A40 = result[4];
    if (qword_1EB678A48) {
      CFRelease((CFTypeRef)qword_1EB678A48);
    }
    v2 = (const void *)v1[5];
    qword_1EB678A48 = (uint64_t)v2;
    if (v2) {
      CFRetain(v2);
    }
    byte_1EB678A50 = *((unsigned char *)v1 + 56);
    if (qword_1EB678A58) {
      CFRelease((CFTypeRef)qword_1EB678A58);
    }
    result = (void *)v1[6];
    qword_1EB678A58 = (uint64_t)result;
    if (result)
    {
      return CFRetain(result);
    }
  }
  return result;
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_123(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_123_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  CFErrorRef v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

CFTypeRef __ACSMightCurrentNetworkHaveCachingServer_block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = qword_1EB678A40;
  *(void *)(*(void *)(a1[5] + 8) + 24) = qword_1EB678A48;
  v2 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v2) {
    CFRetain(v2);
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = byte_1EB678A50;
  *(void *)(*(void *)(a1[7] + 8) + 24) = qword_1EB678A58;
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1[7] + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

void sub_1DD435D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4362C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4366DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD43692C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD436B18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD437D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DD43A644(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD440A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD440FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD441484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD44190C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSZExtractorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!StreamingZipLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __StreamingZipLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6CC3E40;
    uint64_t v5 = 0;
    StreamingZipLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!StreamingZipLibraryCore_frameworkLibrary) {
    __getSZExtractorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SZExtractor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSZExtractorClass_block_invoke_cold_2();
  }
  getSZExtractorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StreamingZipLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StreamingZipLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint32_t v8 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109890;
    v10[1] = a1;
    __int16 v11 = 2080;
    uint64_t v12 = a2;
    __int16 v13 = 2080;
    uint64_t v14 = a3;
    __int16 v15 = 2048;
    uint64_t v16 = a4;
    _os_log_error_impl(&dword_1DD432000, v8, OS_LOG_TYPE_ERROR, "#%08x A callback block invoked by %s released an object it did not own: \"%s\", %p", (uint8_t *)v10, 0x26u);
  }
  raise(6);
  pause();
  return pause();
}

void ACSLocateCachingServer(const void *a1, const __CFDictionary *a2, NSObject *global_queue, uint64_t a4, double a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint32_t v11 = arc4random();
  while (!v11);
  unsigned int v12 = v11;
  __int16 v13 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110658;
    unsigned int v25 = v12;
    __int16 v26 = 2080;
    v27 = "ACSLocateCachingServer";
    __int16 v28 = 2112;
    uint64_t v29 = a1;
    __int16 v30 = 2048;
    double v31 = a5;
    __int16 v32 = 2112;
    CFDictionaryRef v33 = a2;
    __int16 v34 = 2048;
    v35 = global_queue;
    __int16 v36 = 2048;
    uint64_t v37 = a4;
    _os_log_impl(&dword_1DD432000, v13, OS_LOG_TYPE_DEFAULT, "#%08x %s(assetURL=%@, locateTimeout=%.3f, options=%@, callbackQueue=%p, callback=%p)", buf, 0x44u);
  }
  if (a4)
  {
    CFRetain(a1);
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    dispatch_retain(global_queue);
    uint64_t v14 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 0x40000000;
    v22[2] = __ACSLocateCachingServer_block_invoke;
    v22[3] = &unk_1E6CC3FA8;
    unsigned int v23 = v12;
    v22[5] = a1;
    v22[6] = "ACSLocateCachingServer";
    *(double *)&v22[7] = Current;
    *(double *)&void v22[8] = a5;
    v22[9] = global_queue;
    v22[4] = a4;
  }
  else
  {
    uint64_t v14 = 0;
  }
  CFStringRef String = CFURLCopyQueryString((CFURLRef)a1, 0);
  if (String)
  {
    CFStringRef v16 = String;
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, @"&");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v18 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
      {
LABEL_17:
        int v21 = 0;
      }
      else
      {
        CFIndex v19 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, v19);
          if (!aclIsReservedQueryParameter(ValueAtIndex)) {
            break;
          }
          if (++v19 >= CFArrayGetCount(v18)) {
            goto LABEL_17;
          }
        }
        int v21 = 1;
      }
      CFRelease(v18);
    }
    else
    {
      int v21 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    int v21 = 0;
  }
  aclLocateCommon(v12, 1u, a2, v21, (uint64_t)v14, Current, a5);
}

void __ACSLocateCachingServer_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray, __CFError *a4)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    CFErrorRef Copy = aclErrorCreateCopy(a4);
LABEL_3:
    CFURLRef v7 = 0;
    MutableCFErrorRef Copy = 0;
    goto LABEL_4;
  }
  MutableCFErrorRef Copy = theArray;
  if (!theArray)
  {
    CFErrorRef Copy = 0;
    CFURLRef v7 = 0;
    goto LABEL_4;
  }
  if (CFArrayGetCount(theArray) < 1)
  {
    CFErrorRef Copy = 0;
    goto LABEL_3;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, 0);
  CFErrorRef Copy = (void *)CFDictionaryGetValue(ValueAtIndex, @"hostport");
  if (!Copy) {
    goto LABEL_53;
  }
  CFURLRef v16 = *(const __CFURL **)(a1 + 40);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    BOOL v22 = Mutable;
    CFStringRef String = CFURLCopyQueryString(v16, 0);
    if (String)
    {
      CFStringRef v24 = String;
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, @"&");
      if (!ArrayBySeparatingStrings) {
        goto LABEL_47;
      }
      CFArrayRef v26 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
      {
        CFIndex v27 = 0;
        do
        {
          CFStringRef v28 = (const __CFString *)CFArrayGetValueAtIndex(v26, v27);
          if (aclIsReservedQueryParameter(v28)) {
            goto LABEL_48;
          }
          CFArrayAppendValue(v22, v28);
        }
        while (++v27 < CFArrayGetCount(v26));
      }
      CFRelease(v26);
      CFRelease(v24);
    }
    CFStringRef v29 = CFURLCopyHostName(v16);
    if (v29)
    {
      CFStringRef v24 = v29;
      if (CFStringFind(v29, @":", 0).location == -1
        || CFStringHasPrefix(v24, @"[")
        || (v30 = CFStringCreateWithFormat(0, 0, @"[%@]", v24), CFRelease(v24), (CFStringRef v24 = v30) != 0))
      {
        SInt32 v31 = CFURLGetPortNumber(v16);
        if (v31 <= 0)
        {
          CFRetain(v24);
          CFStringRef v32 = v24;
        }
        else
        {
          CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"%@:%hu", v24, (unsigned __int16)v31);
          if (!v32) {
            goto LABEL_47;
          }
        }
        CFStringRef v33 = CFURLCreateStringByAddingPercentEscapes(0, v32, 0, @"!*'();:@&=+$,/?%#[]", 0x8000100u);
        if (v33)
        {
          CFStringRef v34 = v33;
          CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"source=%@", v33);
          if (v35)
          {
            CFArrayAppendValue(v22, v35);
            CFRelease(v35);
            LODWORD(v35) = 1;
          }
          CFRelease(v34);
        }
        else
        {
          LODWORD(v35) = 0;
        }
        CFRelease(v32);
        CFRelease(v24);
        if (v35)
        {
          CFStringRef v36 = CFURLCopyScheme(v16);
          if (v36)
          {
            CFStringRef v24 = v36;
            if (CFStringCompare(v36, @"http", 1uLL))
            {
              CFStringRef v37 = CFURLCreateStringByAddingPercentEscapes(0, v24, 0, @"!*'();:@&=+$,/?%#[]", 0x8000100u);
              if (!v37) {
                goto LABEL_47;
              }
              CFArrayRef v26 = (const __CFArray *)v37;
              CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"sourceScheme=%@", v37);
              if (!v38)
              {
LABEL_48:
                CFURLRef v7 = 0;
LABEL_49:
                CFRelease(v26);
LABEL_50:
                CFRelease(v24);
                CFRelease(v22);
                if (v7)
                {
                  CFErrorRef Copy = 0;
                  goto LABEL_54;
                }
                goto LABEL_52;
              }
              CFStringRef v39 = v38;
              CFArrayAppendValue(v22, v38);
              CFRelease(v39);
              CFRelease(v26);
            }
            CFRelease(v24);
          }
          CFStringRef v40 = CFURLCopyPath(v16);
          if (v40)
          {
            CFStringRef v24 = v40;
            uint64_t v41 = CFStringCreateMutable(0, 0);
            if (v41)
            {
              CFArrayRef v26 = (const __CFArray *)v41;
              CFStringAppendFormat(v41, 0, @"http://%@%@", Copy, v24);
              if (CFArrayGetCount(v22) >= 1)
              {
                CFIndex v42 = 0;
                CFStringRef v43 = @"?";
                do
                {
                  CFStringRef v44 = (const __CFString *)CFArrayGetValueAtIndex(v22, v42);
                  CFStringAppend((CFMutableStringRef)v26, v43);
                  CFStringAppend((CFMutableStringRef)v26, v44);
                  ++v42;
                  CFStringRef v43 = @"&";
                }
                while (v42 < CFArrayGetCount(v22));
              }
              CFURLRef v7 = CFURLCreateWithString(0, (CFStringRef)v26, 0);
              goto LABEL_49;
            }
LABEL_47:
            CFURLRef v7 = 0;
            goto LABEL_50;
          }
        }
      }
    }
    CFRelease(v22);
  }
LABEL_52:
  CFErrorRef Copy = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E4F1D160], 22, @"unable to rewrite %@ for caching server host/port %@", v18, v19, v20, v21, *(void *)(a1 + 40));
LABEL_53:
  CFURLRef v7 = 0;
LABEL_54:
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"advice");
  MutableCFErrorRef Copy = Value;
  if (Value)
  {
    CFIndex Count = CFDictionaryGetCount(Value);
    MutableCFErrorRef Copy = CFDictionaryCreateMutableCopy(0, Count, MutableCopy);
  }
LABEL_4:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v9 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a1 + 80);
    uint64_t v11 = *(void *)(a1 + 48);
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 67110914;
    int v50 = v10;
    __int16 v51 = 2080;
    uint64_t v52 = v11;
    __int16 v53 = 2112;
    uint64_t v54 = a2;
    __int16 v55 = 2112;
    CFURLRef v56 = v7;
    __int16 v57 = 2112;
    CFArrayRef v58 = MutableCopy;
    __int16 v59 = 2112;
    v60 = Copy;
    __int16 v61 = 2048;
    CFAbsoluteTime v62 = v12;
    __int16 v63 = 2048;
    uint64_t v64 = v13;
    _os_log_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] newURL %@, advice %@, error %@, elapsed %.3f/%.3f", buf, 0x4Eu);
  }
  uint64_t v14 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __ACSLocateCachingServer_block_invoke_85;
  block[3] = &unk_1E6CC3F80;
  block[6] = MutableCopy;
  block[7] = Copy;
  block[4] = *(void *)(a1 + 32);
  block[5] = v7;
  int v48 = *(_DWORD *)(a1 + 80);
  void block[8] = *(void *)(a1 + 48);
  block[9] = v14;
  dispatch_async(v14, block);
}

CFErrorRef aclErrorCreateCopy(__CFError *a1)
{
  CFDictionaryRef v2 = CFErrorCopyUserInfo(a1);
  CFStringRef Domain = CFErrorGetDomain(a1);
  CFIndex Code = CFErrorGetCode(a1);
  CFErrorRef v5 = CFErrorCreate(0, Domain, Code, v2);
  if (v2) {
    CFRelease(v2);
  }
  return v5;
}

CFErrorRef aclErrorCreate(uint64_t a1, const __CFString *a2, CFIndex a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    uint64_t v14 = Mutable;
    CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"#%08x", a1);
    if (v15)
    {
      CFStringRef v16 = v15;
      CFDictionaryAddValue(v14, @"com.apple.AssetCacheLocator.tag", v15);
      CFRelease(v16);
    }
    if (a4)
    {
      CFStringRef v17 = CFStringCreateWithFormatAndArguments(0, 0, a4, &a9);
      if (v17)
      {
        CFStringRef v18 = v17;
        CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F1D170], v17);
        CFRelease(v18);
      }
    }
    CFDictionaryRef Copy = CFDictionaryCreateCopy(0, v14);
    CFRelease(v14);
    CFErrorRef v20 = CFErrorCreate(0, a2, a3, Copy);
    if (Copy) {
      CFRelease(Copy);
    }
    return v20;
  }
  else
  {
    return CFErrorCreate(0, a2, a3, 0);
  }
}

void __ACSLocateCachingServer_block_invoke_85(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSLocateCachingServer_block_invoke_85_cold_3();
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1) {
      __ACSLocateCachingServer_block_invoke_85_cold_2();
    }
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    if (CFGetRetainCount(v4) != 1) {
      __ACSLocateCachingServer_block_invoke_85_cold_1();
    }
    CFRetain(*(CFTypeRef *)(a1 + 56));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFErrorRef v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(void *)(a1 + 64), (uint64_t)"modifiedURL", *(void *)(a1 + 40));
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  uint64_t v6 = *(const void **)(a1 + 48);
  if (v6)
  {
    if (CFGetRetainCount(v6) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(void *)(a1 + 64), (uint64_t)"advice", *(void *)(a1 + 48));
    }
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  CFURLRef v7 = *(const void **)(a1 + 56);
  if (v7)
  {
    if (CFGetRetainCount(v7) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(void *)(a1 + 64), (uint64_t)"error", *(void *)(a1 + 56));
    }
    CFRelease(*(CFTypeRef *)(a1 + 56));
    uint32_t v8 = *(const void **)(a1 + 56);
    if (v8) {
      CFRelease(v8);
    }
  }
  uint64_t v9 = *(const void **)(a1 + 48);
  if (v9) {
    CFRelease(v9);
  }
  int v10 = *(const void **)(a1 + 40);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(NSObject **)(a1 + 72);

  dispatch_release(v11);
}

void aclLocateCommon(unsigned int a1, unsigned int a2, const __CFDictionary *a3, int a4, uint64_t a5, double a6, double a7)
{
  uint64_t v7 = a5;
  if (!a5) {
    goto LABEL_20;
  }
  uint64_t valuePtr = 0;
  p_uint64_t valuePtr = &valuePtr;
  uint64_t v78 = 0x2000000000;
  uint64_t v79 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2000000000;
  uint64_t v75 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2000000000;
  char v71 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2000000000;
  int v67 = 0;
  uint64_t v60 = 0;
  __int16 v61 = &v60;
  uint64_t v62 = 0x2000000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  __int16 v57 = &v56;
  uint64_t v58 = 0x2000000000;
  uint64_t v59 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __aclLocateCommon_block_invoke;
  block[3] = &unk_1E6CC42D8;
  block[4] = &valuePtr;
  block[5] = &v72;
  block[6] = &v68;
  block[7] = &v64;
  void block[8] = &v60;
  block[9] = &v56;
  dispatch_sync((dispatch_queue_t)qword_1EB678A10, block);
  if (a3 && CFDictionaryGetValue(a3, @"forceMiss") == (const void *)*MEMORY[0x1E4F1CFD0]
    || CFAbsoluteTimeGetCurrent() - *((double *)p_valuePtr + 3) >= 5.0)
  {
    goto LABEL_12;
  }
  uint64_t v14 = (const void *)v73[3];
  if (a3)
  {
    if (!v14 || !CFEqual(a3, v14)) {
      goto LABEL_12;
    }
  }
  else if (v14)
  {
LABEL_12:
    int v15 = 1;
    goto LABEL_13;
  }
  if (*((unsigned __int8 *)v69 + 24) != a4 || *((_DWORD *)v65 + 6) < (signed int)a2) {
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, __CFString *, uint64_t, uint64_t))(v7 + 16))(v7, @"same", v61[3], v57[3]);
  int v15 = 0;
LABEL_13:
  CFStringRef v16 = (const void *)v57[3];
  if (v16)
  {
    CFRelease(v16);
    v57[3] = 0;
  }
  CFStringRef v17 = (const void *)v61[3];
  if (v17)
  {
    CFRelease(v17);
    v61[3] = 0;
  }
  CFStringRef v18 = (const void *)v73[3];
  if (v18)
  {
    CFRelease(v18);
    v73[3] = 0;
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&valuePtr, 8);
  if (v15)
  {
LABEL_20:
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v19, "tag", a1);
    xpc_dictionary_set_string(v19, "command", "locate");
    xpc_dictionary_set_int64(v19, "quantity", a2);
    if (!a3)
    {
LABEL_65:
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 0x40000000;
      v51[2] = __aclLocateCommon_block_invoke_2;
      v51[3] = &unk_1E6CC43A0;
      *(double *)&v51[5] = a6;
      char v54 = a4;
      unsigned int v52 = a1;
      unsigned int v53 = a2;
      v51[4] = v7;
      v51[6] = a3;
      v51[7] = v19;
      *(double *)&v51[8] = a7;
      v51[9] = "aclLocateCommon";
      dispatch_async((dispatch_queue_t)qword_1EB6789F8, v51);
      return;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, @"capabilities");
    unsigned int v50 = a1;
    if (Value)
    {
      CFArrayRef v21 = Value;
      CFTypeID v22 = CFGetTypeID(Value);
      if (v22 == CFArrayGetTypeID())
      {
        unsigned int v46 = a2;
        int v47 = a4;
        CFDictionaryRef v48 = a3;
        uint64_t v49 = v7;
        int64_t Count = CFArrayGetCount(v21);
        CFStringRef v24 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
        unsigned int v25 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
        if (Count < 1)
        {
          CFIndex v27 = 0;
        }
        else
        {
          CFIndex v26 = 0;
          CFIndex v27 = 0;
          CFStringRef v28 = (const void *)*MEMORY[0x1E4F1CFD0];
          do
          {
            CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v21, v26);
            CFTypeID v30 = CFGetTypeID(ValueAtIndex);
            if (v30 == CFStringGetTypeID())
            {
              v24[v27] = ValueAtIndex;
              v25[v27++] = v28;
            }
            ++v26;
          }
          while (Count != v26);
        }
        CFArrayRef v21 = CFDictionaryCreate(0, v24, v25, v27, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        free(v25);
        free(v24);
        CFArrayRef v32 = v21;
        a3 = v48;
        uint64_t v7 = v49;
        a2 = v46;
        a4 = v47;
      }
      else
      {
        CFArrayRef v32 = 0;
      }
      CFTypeID v33 = CFGetTypeID(v21);
      if (v33 == CFDictionaryGetTypeID()) {
        CFDictionaryRef v31 = v21;
      }
      else {
        CFDictionaryRef v31 = 0;
      }
      if (a4) {
        goto LABEL_39;
      }
    }
    else
    {
      CFDictionaryRef v31 = 0;
      CFArrayRef v32 = 0;
      if (a4) {
        goto LABEL_39;
      }
    }
    if (!v31)
    {
LABEL_49:
      if (v32) {
        CFRelease(v32);
      }
      CFStringRef v37 = (const __CFString *)CFDictionaryGetValue(a3, @"x-apple-persistent-identifier");
      if (v37)
      {
        CFStringRef v38 = v37;
        unsigned int v39 = a2;
        CFIndex Length = CFStringGetLength(v37);
        CFIndex v41 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        CFIndex v42 = (char *)malloc_type_malloc(v41, 0x5DAC55DFuLL);
        if (CFStringGetCString(v38, v42, v41, 0x8000100u)) {
          xpc_dictionary_set_string(v19, "x-apple-persistent-identifier", v42);
        }
        free(v42);
        a2 = v39;
      }
      if (CFDictionaryGetValue(a3, @"autoRefresh") == (const void *)*MEMORY[0x1E4F1CFC8]) {
        xpc_dictionary_set_BOOL(v19, "autoRefresh", 0);
      }
      CFStringRef v43 = CFDictionaryGetValue(a3, @"quickMiss");
      CFStringRef v44 = (const void *)*MEMORY[0x1E4F1CFD0];
      a1 = v50;
      if (v43 == (const void *)*MEMORY[0x1E4F1CFD0]) {
        xpc_dictionary_set_BOOL(v19, "quickMiss", 1);
      }
      if (CFDictionaryGetValue(a3, @"forceMiss") == v44) {
        xpc_dictionary_set_BOOL(v19, "forceMiss", 1);
      }
      CFNumberRef v45 = (const __CFNumber *)CFDictionaryGetValue(a3, @"sizeHint");
      if (v45)
      {
        uint64_t valuePtr = 0;
        if (CFNumberGetValue(v45, kCFNumberSInt64Type, &valuePtr)) {
          xpc_dictionary_set_uint64(v19, "sizeHint", valuePtr);
        }
      }
      CFRetain(a3);
      goto LABEL_65;
    }
LABEL_39:
    xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
    if (v31)
    {
      CFStringRef v35 = CFDictionaryGetValue(v31, @"import");
      CFStringRef v36 = (const void *)*MEMORY[0x1E4F1CFD0];
      if (v35 == (const void *)*MEMORY[0x1E4F1CFD0]) {
        xpc_dictionary_set_BOOL(v34, "import", 1);
      }
      if (CFDictionaryGetValue(v31, @"namespaces") == v36) {
        xpc_dictionary_set_BOOL(v34, "namespaces", 1);
      }
      if (CFDictionaryGetValue(v31, @"personalCaching") == v36) {
        xpc_dictionary_set_BOOL(v34, "personalCaching", 1);
      }
    }
    if (a4) {
      xpc_dictionary_set_BOOL(v34, "queryParameters", 1);
    }
    xpc_dictionary_set_value(v19, "capabilities", v34);
    xpc_release(v34);
    goto LABEL_49;
  }
}

void _ACSLocateAllCachingServers(const __CFDictionary *a1, NSObject *global_queue, uint64_t a3, double a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint32_t v9 = arc4random();
  while (!v9);
  unsigned int v10 = v9;
  uint64_t v11 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110402;
    unsigned int v16 = v10;
    __int16 v17 = 2080;
    CFStringRef v18 = "_ACSLocateAllCachingServers";
    __int16 v19 = 2048;
    double v20 = a4;
    __int16 v21 = 2112;
    CFDictionaryRef v22 = a1;
    __int16 v23 = 2048;
    CFStringRef v24 = global_queue;
    __int16 v25 = 2048;
    uint64_t v26 = a3;
    _os_log_impl(&dword_1DD432000, v11, OS_LOG_TYPE_DEFAULT, "#%08x %s(locateTimeout=%.3f, options=%@, callbackQueue=%p, callback=%p)", buf, 0x3Au);
  }
  if (a3)
  {
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    dispatch_retain(global_queue);
    CFAbsoluteTime v12 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 0x40000000;
    v13[2] = ___ACSLocateAllCachingServers_block_invoke;
    v13[3] = &unk_1E6CC3FF8;
    unsigned int v14 = v10;
    *(double *)&v13[6] = Current;
    *(double *)&v13[7] = a4;
    v13[8] = global_queue;
    v13[4] = a3;
    v13[5] = "_ACSLocateAllCachingServers";
  }
  else
  {
    CFAbsoluteTime v12 = 0;
  }
  aclLocateCommon(v10, 0, a1, 1, (uint64_t)v12, Current, a4);
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_105(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_105_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  CFErrorRef v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_115(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_115_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  CFErrorRef v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

uint64_t ACSUpdateCachingServerHealth(const __CFURL *a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint64_t v8 = arc4random();
  while (!v8);
  uint64_t v9 = v8;
  unsigned int v10 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "ACSUpdateCachingServerHealth";
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = a2;
    *(_WORD *)&buf[38] = 1024;
    *(_DWORD *)&buf[40] = a3;
    _os_log_impl(&dword_1DD432000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s(url=%@, options=%@, healthy=%{BOOL}d)", buf, 0x2Cu);
  }
  CFStringRef String = CFURLCopyQueryString(a1, 0);
  if (String)
  {
    CFStringRef v12 = String;
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, @"&");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v14 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
      {
        int v20 = 0;
      }
      else
      {
        int v31 = a3;
        CFIndex v15 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v14, v15);
          CFStringRef v17 = CFURLCreateStringByReplacingPercentEscapes(0, ValueAtIndex, &stru_1F38A2880);
          if (v17)
          {
            CFStringRef v18 = v17;
            int HasPrefix = CFStringHasPrefix(v17, @"source=");
            CFRelease(v18);
            if (HasPrefix) {
              break;
            }
          }
          if (++v15 >= CFArrayGetCount(v14))
          {
            int v20 = 0;
            goto LABEL_18;
          }
        }
        int v20 = 1;
LABEL_18:
        a3 = v31;
      }
      CFRelease(v14);
    }
    else
    {
      int v20 = 0;
    }
    CFRelease(v12);
  }
  else
  {
    int v20 = 0;
  }
  CFStringRef v21 = CFURLCopyHostName(a1);
  SInt32 v22 = CFURLGetPortNumber(a1);
  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  memset(buf, 0, sizeof(buf));
  if (!v20 || !v21 || v22 < 1)
  {
    if (!v21) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (!CFStringGetCString(v21, buffer, 62, 0x8000100u))
  {
LABEL_33:
    CFRelease(v21);
LABEL_34:
    if (!a4) {
      return 0;
    }
    CFErrorRef v29 = aclErrorCreate(v9, (const __CFString *)*MEMORY[0x1E4F1D160], 22, @"invalid URL", v23, v24, v25, v26, v30);
    uint64_t result = 0;
    *a4 = v29;
    return result;
  }
  int v35 = 0;
  v34[0] = 0;
  v34[1] = 0;
  *(void *)CFStringRef v38 = 0;
  uint64_t v39 = 0;
  *(_OWORD *)CFStringRef v36 = 0u;
  memset(v37, 0, sizeof(v37));
  if (strcasecmp(buffer, "localhost") && (inet_pton(2, buffer, &v35) != 1 || !inet_ntop(2, &v35, v38, 0x10u)))
  {
    if (inet_pton(30, buffer, v34) == 1 && inet_ntop(30, v34, v36, 0x2Eu))
    {
      snprintf((char *)buf, 0x5EuLL, "[%s]:%u");
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  snprintf((char *)buf, 0x5EuLL, "%s:%u");
LABEL_29:
  CFRelease(v21);
  if (!a3)
  {
    *(void *)buffer = MEMORY[0x1E4F143A8];
    uint64_t v44 = 0x40000000;
    CFNumberRef v45 = __aclSaveLocateResult_block_invoke;
    unsigned int v46 = &__block_descriptor_tmp_259;
    long long v47 = 0u;
    memset(v48, 0, sizeof(v48));
    dispatch_sync((dispatch_queue_t)qword_1EB678A10, buffer);
  }
  xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v27, "tag", v9);
  xpc_dictionary_set_string(v27, "command", "updateHealth");
  xpc_dictionary_set_string(v27, "hostport", (const char *)buf);
  xpc_dictionary_set_BOOL(v27, "healthy", a3 != 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __ACSUpdateCachingServerHealth_block_invoke;
  block[3] = &__block_descriptor_tmp_146;
  int v33 = v9;
  block[4] = v27;
  dispatch_async((dispatch_queue_t)qword_1EB6789F8, block);
  return 1;
}

void __ACSUpdateCachingServerHealth_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 40), 0, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection) {
    xpc_connection_send_message(SharedLocatorConnection, *(xpc_object_t *)(a1 + 32));
  }
  unsigned int v10 = *(void **)(a1 + 32);

  xpc_release(v10);
}

void ACSImportFileIntoCachingServer(const __CFURL *a1, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary *a4, NSObject *global_queue, uint64_t a6)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint64_t v13 = arc4random();
  while (!v13);
  uint64_t v14 = v13;
  CFIndex v15 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110914;
    int v83 = v14;
    __int16 v84 = 2080;
    v85 = "ACSImportFileIntoCachingServer";
    __int16 v86 = 2112;
    CFURLRef v87 = a1;
    __int16 v88 = 2112;
    CFStringRef v89 = a2;
    __int16 v90 = 2112;
    CFDictionaryRef v91 = a3;
    __int16 v92 = 2112;
    CFDictionaryRef v93 = a4;
    __int16 v94 = 2048;
    v95 = global_queue;
    __int16 v96 = 2048;
    uint64_t v97 = a6;
    _os_log_impl(&dword_1DD432000, v15, OS_LOG_TYPE_DEFAULT, "#%08x %s(assetURL=%@, sourcePath=%@, headers=%@, options=%@, callbackQueue=%p, callback=%p)", buf, 0x4Eu);
  }
  if (a6)
  {
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    dispatch_retain(global_queue);
  }
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  if (CStringPtr)
  {
    CFStringRef v17 = (uint8_t *)CStringPtr;
    *__error() = 22;
  }
  else
  {
    CFStringRef v17 = buf;
    if (!CFStringGetCString(a2, (char *)buf, 1024, 0x8000100u))
    {
      *__error() = 22;
      goto LABEL_48;
    }
  }
  CFDictionaryRef theDict = a4;
  CFFileDescriptorNativeDescriptor v18 = open((const char *)v17, 0);
  if ((v18 & 0x80000000) == 0)
  {
    int v19 = v18;
    uint64_t v74 = global_queue;
    uint64_t v75 = a6;
    CFFileDescriptorRef v73 = CFFileDescriptorCreate(0, v18, 1u, 0, 0);
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v20, "tag", v14);
    xpc_dictionary_set_string(v20, "command", "import");
    CFStringRef v21 = CFURLGetString(a1);
    CFIndex Length = CFStringGetLength(v21);
    CFIndex v23 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v24 = (char *)malloc_type_malloc(v23, 0x5BCF0BFDuLL);
    if (CFStringGetCString(v21, v24, v23, 0x8000100u)) {
      xpc_dictionary_set_string(v20, "url", v24);
    }
    free(v24);
    xpc_dictionary_set_string(v20, "sourcePath", (const char *)v17);
    xpc_dictionary_set_fd(v20, "sourceFd", v19);
    if (a3)
    {
      CFIndex Count = CFDictionaryGetCount(a3);
      if (Count >= 1)
      {
        size_t v26 = Count;
        xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v27 = (const void **)malloc_type_calloc(v26, 8uLL, 0xC0040B8AA526DuLL);
        CFStringRef v28 = (const void **)malloc_type_calloc(v26, 8uLL, 0xC0040B8AA526DuLL);
        CFDictionaryGetKeysAndValues(a3, v27, v28);
        for (uint64_t i = 0; i != v26; ++i)
        {
          CFStringRef v30 = (const __CFString *)v27[i];
          CFStringRef v31 = (const __CFString *)v28[i];
          CFTypeID v32 = CFGetTypeID(v30);
          if (v32 == CFStringGetTypeID())
          {
            CFTypeID v33 = CFGetTypeID(v31);
            if (v33 == CFStringGetTypeID())
            {
              CFIndex v34 = CFStringGetLength(v30);
              CFIndex v35 = CFStringGetMaximumSizeForEncoding(v34, 0x8000100u) + 1;
              CFStringRef v36 = (char *)malloc_type_malloc(v35, 0xC3A09D31uLL);
              if (CFStringGetCString(v30, v36, v35, 0x8000100u))
              {
                CFIndex v37 = CFStringGetLength(v31);
                CFIndex v38 = CFStringGetMaximumSizeForEncoding(v37, 0x8000100u) + 1;
                uint64_t v39 = (char *)malloc_type_malloc(v38, 0x9B859CAAuLL);
                if (CFStringGetCString(v31, v39, v38, 0x8000100u)) {
                  xpc_dictionary_set_string(xdict, v36, v39);
                }
                free(v39);
              }
              free(v36);
            }
          }
        }
        free(v28);
        free(v27);
        xpc_dictionary_set_value(v20, "headers", xdict);
        xpc_release(xdict);
      }
    }
    CFDictionaryRef v40 = theDict;
    if (!theDict) {
      goto LABEL_59;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"importStrategies");
    if (Value)
    {
      CFArrayRef v42 = Value;
      CFTypeID v43 = CFGetTypeID(Value);
      if (v43 == CFArrayGetTypeID())
      {
        CFIndex v44 = CFArrayGetCount(v42);
        if (v44 >= 1)
        {
          CFIndex v45 = v44;
          v98[0] = xmmword_1E6CC44A8;
          v98[1] = *(_OWORD *)&off_1E6CC44B8;
          v98[2] = xmmword_1E6CC44C8;
          v98[3] = *(_OWORD *)&off_1E6CC44D8;
          xpc_object_t v46 = xpc_array_create(0, 0);
          CFIndex v47 = 0;
LABEL_33:
          while (2)
          {
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v42, v47);
            uint64_t v49 = 0;
            while (1)
            {
              if (CFEqual(ValueAtIndex, *(CFTypeRef *)&v98[v49]))
              {
                unsigned int v50 = &v98[v49];
                if (!BYTE13(v98[v49])) {
                  break;
                }
              }
              if (++v49 == 4)
              {
                if (++v47 < v45) {
                  goto LABEL_33;
                }
                goto LABEL_43;
              }
            }
            xpc_array_set_uint64(v46, 0xFFFFFFFFFFFFFFFFLL, *((int *)v50 + 2));
            *((unsigned char *)v50 + 13) = 1;
            ++v47;
            if (*((unsigned char *)v50 + 12)) {
              BOOL v51 = 0;
            }
            else {
              BOOL v51 = v47 < v45;
            }
            if (v51) {
              continue;
            }
            break;
          }
LABEL_43:
          xpc_dictionary_set_value(v20, "importStrategies", v46);
          xpc_release(v46);
          CFDictionaryRef v40 = theDict;
        }
      }
    }
    unsigned int v52 = CFDictionaryGetValue(v40, @"sourceOffset");
    aclSetU64Option(v20, "sourceOffset", v52);
    unsigned int v53 = CFDictionaryGetValue(v40, @"sourceLength");
    aclSetU64Option(v20, "sourceLength", v53);
    char v54 = CFDictionaryGetValue(v40, @"method");
    if (v54)
    {
      __int16 v55 = v54;
      if (CFEqual(v54, @"PUT"))
      {
        uint64_t v56 = "PUT";
      }
      else
      {
        if (!CFEqual(v55, @"POST")) {
          goto LABEL_53;
        }
        uint64_t v56 = "POST";
      }
      xpc_dictionary_set_string(v20, "method", v56);
    }
LABEL_53:
    CFStringRef v66 = (const __CFString *)CFDictionaryGetValue(v40, @"x-apple-persistent-identifier");
    if (v66)
    {
      CFStringRef v67 = v66;
      CFIndex v68 = CFStringGetLength(v66);
      CFIndex v69 = CFStringGetMaximumSizeForEncoding(v68, 0x8000100u) + 1;
      uint64_t v70 = (char *)malloc_type_malloc(v69, 0x36A60298uLL);
      if (CFStringGetCString(v67, v70, v69, 0x8000100u))
      {
        xpc_object_t v71 = xpc_dictionary_get_value(v20, "headers");
        if (v71)
        {
          xpc_dictionary_set_string(v71, "x-apple-persistent-identifier", v70);
        }
        else
        {
          xpc_object_t v72 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v72, "x-apple-persistent-identifier", v70);
          xpc_dictionary_set_value(v20, "headers", v72);
          xpc_release(v72);
        }
      }
      free(v70);
    }
LABEL_59:
    uint64_t v65 = qword_1EB6789F8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __ACSImportFileIntoCachingServer_block_invoke_2;
    block[3] = &unk_1E6CC41D0;
    int v79 = v14;
    *(CFAbsoluteTime *)&block[6] = Current;
    block[7] = v73;
    void block[8] = v20;
    block[4] = v75;
    void block[5] = "ACSImportFileIntoCachingServer";
    block[9] = v74;
    uint64_t v64 = block;
    goto LABEL_60;
  }
LABEL_48:
  if (!a6) {
    return;
  }
  CFStringRef v57 = (const __CFString *)*MEMORY[0x1E4F1D160];
  uint64_t v58 = __error();
  CFErrorRef v63 = aclErrorCreate(v14, v57, *v58, @"open(%@) failed", v59, v60, v61, v62, (char)a2);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 0x40000000;
  v80[2] = __ACSImportFileIntoCachingServer_block_invoke;
  v80[3] = &unk_1E6CC4130;
  v80[4] = a6;
  v80[5] = v63;
  int v81 = v14;
  v80[6] = "ACSImportFileIntoCachingServer";
  v80[7] = global_queue;
  uint64_t v64 = v80;
  uint64_t v65 = global_queue;
LABEL_60:
  dispatch_async(v65, v64);
}

void __ACSImportFileIntoCachingServer_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSImportFileIntoCachingServer_block_invoke_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  CFErrorRef v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

void aclSetU64Option(void *a1, const char *a2, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID())
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &valuePtr)) {
        xpc_dictionary_set_uint64(a1, a2, valuePtr);
      }
    }
  }
}

void __ACSImportFileIntoCachingServer_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CFErrorRef v29 = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 80), &v29, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    unsigned int v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    uint64_t v11 = *(void **)(a1 + 64);
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = __ACSImportFileIntoCachingServer_block_invoke_2_167;
    handler[3] = &unk_1E6CC41A8;
    int v26 = *(_DWORD *)(a1 + 80);
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 48);
    long long v21 = *(_OWORD *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 72);
    uint64_t v25 = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, handler);
    xpc_release(*(xpc_object_t *)(a1 + 64));
  }
  else
  {
    uint64_t v13 = qword_1EB6789F0;
    if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(_DWORD *)(a1 + 80);
      uint64_t v15 = *(void *)(a1 + 40);
      CFErrorRef v16 = v29;
      CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      int v31 = v14;
      __int16 v32 = 2080;
      uint64_t v33 = v15;
      __int16 v34 = 2112;
      CFErrorRef v35 = v16;
      __int16 v36 = 2048;
      CFAbsoluteTime v37 = v17;
      _os_log_impl(&dword_1DD432000, v13, OS_LOG_TYPE_DEFAULT, "#%08x %s -> error: %@, elapsed %.3f", buf, 0x26u);
    }
    CFRelease(*(CFTypeRef *)(a1 + 56));
    xpc_release(*(xpc_object_t *)(a1 + 64));
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      int v19 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __ACSImportFileIntoCachingServer_block_invoke_164;
      block[3] = &unk_1E6CC4158;
      block[4] = v18;
      void block[5] = v29;
      int v28 = *(_DWORD *)(a1 + 80);
      block[6] = *(void *)(a1 + 40);
      block[7] = v19;
      dispatch_async(v19, block);
    }
    else if (v29)
    {
      CFRelease(v29);
    }
  }
}

void __ACSImportFileIntoCachingServer_block_invoke_164(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSImportFileIntoCachingServer_block_invoke_164_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  CFErrorRef v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

void __ACSImportFileIntoCachingServer_block_invoke_2_167(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEBUG)) {
    __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_118_cold_1();
  }
  if (MEMORY[0x1E01B5B30](a2) == MEMORY[0x1E4F14590])
  {
    BOOL v9 = xpc_dictionary_get_BOOL(a2, "success");
    CFErrorRef v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 80), a2);
  }
  else
  {
    CFErrorRef v8 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E4F1D160], 100, @"unexpected reply from XPC service %s: %@", v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    BOOL v9 = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  unsigned int v10 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(_DWORD *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 40);
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 67110146;
    int v20 = v11;
    __int16 v21 = 2080;
    uint64_t v22 = v12;
    __int16 v23 = 1024;
    BOOL v24 = v9;
    __int16 v25 = 2112;
    CFErrorRef v26 = v8;
    __int16 v27 = 2048;
    CFAbsoluteTime v28 = v13;
    _os_log_impl(&dword_1DD432000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s -> success %{BOOL}d, error %@, elapsed %.3f", buf, 0x2Cu);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    uint64_t v15 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __ACSImportFileIntoCachingServer_block_invoke_169;
    block[3] = &unk_1E6CC4180;
    block[4] = v14;
    void block[5] = v8;
    BOOL v18 = v9;
    int v17 = *(_DWORD *)(a1 + 80);
    block[6] = *(void *)(a1 + 40);
    block[7] = v15;
    dispatch_async(v15, block);
  }
  else if (v8)
  {
    CFRelease(v8);
  }
  xpc_release(*(xpc_object_t *)(a1 + 72));
}

void __ACSImportFileIntoCachingServer_block_invoke_169(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      __ACSImportFileIntoCachingServer_block_invoke_169_cold_1();
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
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
  }
  uint64_t v5 = *(NSObject **)(a1 + 56);

  dispatch_release(v5);
}

void _ACSIntrospect(const __CFDictionary *a1, NSObject *global_queue, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint32_t v7 = arc4random();
  while (!v7);
  uint32_t v8 = v7;
  BOOL v9 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    uint32_t v14 = v8;
    __int16 v15 = 2080;
    CFErrorRef v16 = "_ACSIntrospect";
    __int16 v17 = 2112;
    CFDictionaryRef v18 = a1;
    __int16 v19 = 2048;
    int v20 = global_queue;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    _os_log_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s(options=%@, callbackQueue=%p, callback=%p)", buf, 0x30u);
  }
  if (a3)
  {
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    dispatch_retain(global_queue);
  }
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "tag", v8);
  xpc_dictionary_set_string(v10, "command", "introspect");
  if (a1 && CFDictionaryGetValue(a1, @"forceMiss") == (const void *)*MEMORY[0x1E4F1CFD0]) {
    xpc_dictionary_set_BOOL(v10, "forceMiss", 1);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 0x40000000;
  v11[2] = ___ACSIntrospect_block_invoke;
  v11[3] = &unk_1E6CC4270;
  uint32_t v12 = v8;
  v11[5] = v10;
  v11[6] = "_ACSIntrospect";
  *(CFAbsoluteTime *)&v11[7] = Current;
  v11[4] = a3;
  v11[8] = global_queue;
  dispatch_async((dispatch_queue_t)qword_1EB6789F8, v11);
}

void _ACSSetTestFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (acl != -1) {
    dispatch_once(&acl, &__block_literal_global_0);
  }
  do
    uint32_t v4 = arc4random();
  while (!v4);
  uint32_t v5 = v4;
  uint64_t v6 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    uint32_t v11 = v5;
    __int16 v12 = 2080;
    CFAbsoluteTime v13 = "_ACSSetTestFlags";
    __int16 v14 = 2048;
    uint64_t v15 = a1;
    __int16 v16 = 2112;
    uint64_t v17 = a2;
    _os_log_impl(&dword_1DD432000, v6, OS_LOG_TYPE_DEFAULT, "#%08x %s(flags=%#llx, options=%@)", buf, 0x26u);
  }
  if (os_variant_allows_internal_security_policies()) {
    qword_1EB678A08 = a1 & 0x8000000000000000;
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "tag", v5);
  xpc_dictionary_set_string(v7, "command", "setTestFlags");
  xpc_dictionary_set_uint64(v7, "flags", a1 & 0x7FFFFFFFFFFFFFFFLL);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 0x40000000;
  v8[2] = ___ACSSetTestFlags_block_invoke;
  v8[3] = &__block_descriptor_tmp_186;
  uint32_t v9 = v5;
  v8[4] = v7;
  dispatch_async((dispatch_queue_t)qword_1EB6789F8, v8);
}

dispatch_queue_t __aclInit_block_invoke()
{
  qword_1EB6789F0 = (uint64_t)os_log_create("com.apple.AssetCacheServices", "Framework");
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("AssetCacheLocator.connectionQueue", v0);
  qword_1EB678A00 = 0;
  qword_1EB678A08 = 0;
  qword_1EB6789F8 = (uint64_t)v1;
  CFDictionaryRef v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("AssetCacheLocator.lastResultsQueue", v2);
  qword_1EB678A10 = (uint64_t)result;
  return result;
}

BOOL aclIsReservedQueryParameter(CFStringRef originalString)
{
  CFStringRef v1 = CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1F38A2880);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  BOOL v3 = CFEqual(v1, @"source")
    || CFStringHasPrefix(v2, @"source=")
    || CFEqual(v2, @"sourceScheme")
    || CFStringHasPrefix(v2, @"sourceScheme=") != 0;
  CFRelease(v2);
  return v3;
}

CFTypeRef __aclLocateCommon_block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = qword_1EB678A18;
  *(void *)(*(void *)(a1[5] + 8) + 24) = qword_1EB678A20;
  CFStringRef v2 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v2) {
    CFRetain(v2);
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = byte_1EB678A28;
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = dword_1EB678A2C;
  *(void *)(*(void *)(a1[8] + 8) + 24) = qword_1EB678A30;
  BOOL v3 = *(const void **)(*(void *)(a1[8] + 8) + 24);
  if (v3) {
    CFRetain(v3);
  }
  *(void *)(*(void *)(a1[9] + 8) + 24) = qword_1EB678A38;
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1[9] + 8) + 24);
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

void __aclLocateCommon_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef v46 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 0x40000000;
  CFDictionaryRef v48 = __aclLocateCommon_block_invoke_3;
  uint64_t v49 = &unk_1E6CC4300;
  uint64_t v51 = *(void *)(a1 + 40);
  uint64_t v52 = *(void *)(a1 + 48);
  char v54 = *(unsigned char *)(a1 + 88);
  uint64_t v53 = *(void *)(a1 + 80);
  uint64_t v50 = *(void *)(a1 + 32);
  SharedLocatorConnection = aclGetSharedLocatorConnection(v53, &v46, a3, a4, a5, a6, a7, a8);
  if (!SharedLocatorConnection)
  {
    xpc_release(*(xpc_object_t *)(a1 + 56));
    v48((uint64_t)v47, v46);
    return;
  }
  xpc_object_t v10 = SharedLocatorConnection;
  xpc_retain(SharedLocatorConnection);
  uint32_t v11 = 0;
  __int16 v12 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2000000000;
  char v45 = 0;
  double v13 = *(double *)(a1 + 64);
  if (v13 >= 0.0)
  {
    __int16 v14 = *(const char **)(a1 + 72);
    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v12 = dispatch_queue_create(v14, v15);
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint32_t v11 = v16;
    if (!v12 || !v16)
    {
      if (v12) {
        dispatch_release(v12);
      }
      if (v11) {
        dispatch_release(v11);
      }
      xpc_release(v10);
      xpc_release(*(xpc_object_t *)(a1 + 56));
      CFErrorRef v35 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E4F1D160], 12, @"dispatch_queue/semaphore_create failed", v31, v32, v33, v34, v36);
      v48((uint64_t)v47, v35);
      goto LABEL_23;
    }
    dispatch_retain(v12);
    dispatch_retain(v11);
    xpc_retain(v10);
    double v13 = *(double *)(a1 + 64);
  }
  uint64_t v17 = *(void **)(a1 + 56);
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = __aclLocateCommon_block_invoke_4;
  handler[3] = &unk_1E6CC4350;
  *(double *)&void handler[6] = v13;
  handler[7] = v12;
  handler[8] = v11;
  handler[9] = *(void *)(a1 + 72);
  handler[10] = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  char v43 = *(unsigned char *)(a1 + 88);
  handler[13] = *(void *)(a1 + 80);
  void handler[4] = *(void *)(a1 + 32);
  handler[5] = v44;
  handler[11] = v19;
  handler[12] = v10;
  xpc_connection_send_message_with_reply(v10, v17, global_queue, handler);
  xpc_release(*(xpc_object_t *)(a1 + 56));
  double v20 = *(double *)(a1 + 64);
  if (v20 >= 0.0)
  {
    double v21 = v20 - (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40));
    double v22 = v21 * 1000000000.0;
    BOOL v23 = v21 < 0.0;
    double v24 = 0.0;
    if (!v23) {
      double v24 = v22;
    }
    dispatch_time_t v25 = dispatch_time(0, (uint64_t)v24);
    if (!v11) {
      __aclLocateCommon_block_invoke_2_cold_1();
    }
    if (dispatch_semaphore_wait(v11, v25))
    {
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x2000000000;
      char v41 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __aclLocateCommon_block_invoke_2_250;
      block[3] = &unk_1E6CC4378;
      block[4] = &v38;
      void block[5] = v44;
      dispatch_sync(v12, block);
      if (!*((unsigned char *)v39 + 24))
      {
        xpc_connection_cancel(v10);
        if (v10 == (_xpc_connection_s *)qword_1EB678A00)
        {
          xpc_release(v10);
          qword_1EB678A00 = 0;
        }
        CFErrorRef v30 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E4F1D160], 60, @"timed out waiting for reply from XPC service %s", v26, v27, v28, v29, (char)"com.apple.AssetCacheLocatorService");
        v48((uint64_t)v47, v30);
      }
      _Block_object_dispose(&v38, 8);
    }
    xpc_release(v10);
    dispatch_release(v12);
    dispatch_release(v11);
  }
LABEL_23:
  _Block_object_dispose(v44, 8);
}

void __aclLocateCommon_block_invoke_3(uint64_t a1, const void *a2)
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  keys[0] = @"validUntil";
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v5 = CFDateCreate(0, Current + 300.0);
  values = v5;
  uint64_t v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  xpc_object_t v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  CFDictionaryRef v8 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFRelease(v5);
  double v22 = @"advice";
  double v21 = v8;
  CFDictionaryRef v9 = CFDictionaryCreate(0, (const void **)&v22, (const void **)&v21, 1, v6, v7);
  CFRelease(v8);
  double v20 = v9;
  CFArrayRef v10 = CFArrayCreate(0, (const void **)&v20, 1, MEMORY[0x1E4F1D510]);
  CFRelease(v9);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 64);
  int v14 = *(_DWORD *)(a1 + 60);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __aclSaveLocateResult_block_invoke;
  block[3] = &__block_descriptor_tmp_259;
  block[4] = v11;
  char v19 = v13;
  int v18 = v14;
  void block[5] = v12;
  void block[6] = v10;
  block[7] = a2;
  dispatch_sync((dispatch_queue_t)qword_1EB678A10, block);
  uint64_t v15 = *(const void **)(a1 + 48);
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, __CFString *, CFArrayRef, const void *))(v16 + 16))(v16, @"new", v10, a2);
  }
  if (a2) {
    CFRelease(a2);
  }
  if (v10) {
    CFRelease(v10);
  }
}

void __aclLocateCommon_block_invoke_4(uint64_t a1, __CFString *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  CFIndex v44 = &v43;
  uint64_t v45 = 0x2000000000;
  char v46 = 0;
  if (*(double *)(a1 + 48) >= 0.0)
  {
    uint32_t v4 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __aclLocateCommon_block_invoke_5;
    block[3] = &unk_1E6CC4328;
    uint64_t v5 = *(void *)(a1 + 40);
    block[4] = &v43;
    void block[5] = v5;
    dispatch_sync(v4, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  }
  uint64_t v6 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEBUG))
  {
    int v33 = *(_DWORD *)(a1 + 104);
    uint64_t v34 = @"XPC_ERROR_CONNECTION_INTERRUPTED";
    CFErrorRef v35 = @"XPC_ERROR_CONNECTION_INVALID";
    uint64_t v36 = *(void *)(a1 + 72);
    if (a2 == (__CFString *)MEMORY[0x1E4F14550]) {
      CFAbsoluteTime v37 = @"XPC_ERROR_TERMINATION_IMMINENT";
    }
    else {
      CFAbsoluteTime v37 = a2;
    }
    if (a2 != (__CFString *)MEMORY[0x1E4F14528]) {
      CFErrorRef v35 = v37;
    }
    int v38 = *((unsigned __int8 *)v44 + 24);
    if (a2 != (__CFString *)MEMORY[0x1E4F14520]) {
      uint64_t v34 = v35;
    }
    LODWORD(applier) = 67109890;
    HIDWORD(applier) = v33;
    *(_WORD *)CFDictionaryRef v48 = 2080;
    *(void *)&v48[2] = v36;
    *(_WORD *)&v48[10] = 2112;
    *(void *)&v48[12] = v34;
    *(_WORD *)&v48[20] = 1024;
    *(_DWORD *)&v48[22] = v38;
    _os_log_debug_impl(&dword_1DD432000, v6, OS_LOG_TYPE_DEBUG, "#%08x %s reply callback(object=%@) calledback=%{BOOL}d", (uint8_t *)&applier, 0x22u);
  }
  if (!*((unsigned char *)v44 + 24))
  {
    if (MEMORY[0x1E01B5B30](a2) == MEMORY[0x1E4F14590])
    {
      double v11 = xpc_dictionary_get_double(a2, "validityInterval");
      if (v11 >= 5.0) {
        double v12 = v11;
      }
      else {
        double v12 = 5.0;
      }
      xpc_object_t array = xpc_dictionary_get_array(a2, "servers");
      if (array)
      {
        int v14 = array;
        size_t count = xpc_array_get_count(array);
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E4F1D510]);
        if (Mutable)
        {
          CFArrayRef v17 = Mutable;
          uint64_t applier = MEMORY[0x1E4F143A8];
          *(void *)CFDictionaryRef v48 = 0x40000000;
          *(void *)&v48[8] = __aclResultsCreateFromXPC_block_invoke;
          *(void *)&v48[16] = &__block_descriptor_tmp_270;
          *(double *)&v48[24] = v12;
          CFMutableArrayRef v49 = Mutable;
          xpc_array_apply(v14, &applier);
          CFIndex v18 = CFArrayGetCount(v17);
          if (v18 >= 1)
          {
            CFIndex v19 = v18;
            CFIndex v20 = 0;
            double v21 = 0.0;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v17, v20);
              CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"advice");
              if (Value && CFDictionaryGetValue(Value, @"validUntil"))
              {
                double v24 = MEMORY[0x1E01B5100]();
                double v25 = v24 - CFAbsoluteTimeGetCurrent();
                if (v21 > v25 || v20 == 0) {
                  double v21 = v25;
                }
              }
              ++v20;
            }
            while (v19 != v20);
            if (v21 >= 5.0)
            {
              uint64_t v27 = *(void *)(a1 + 80);
              uint64_t v28 = *(__CFArray **)(a1 + 88);
              char v29 = *(unsigned char *)(a1 + 112);
              int v30 = *(_DWORD *)(a1 + 108);
              uint64_t applier = MEMORY[0x1E4F143A8];
              *(void *)CFDictionaryRef v48 = 0x40000000;
              *(void *)&v48[8] = __aclSaveLocateResult_block_invoke;
              *(void *)&v48[16] = &__block_descriptor_tmp_259;
              *(void *)&v48[24] = v27;
              char v53 = v29;
              int v52 = v30;
              CFMutableArrayRef v49 = v28;
              CFArrayRef v50 = v17;
              uint64_t v51 = 0;
              dispatch_sync((dispatch_queue_t)qword_1EB678A10, &applier);
            }
          }
          CFErrorRef v31 = 0;
          char v32 = 0;
          goto LABEL_35;
        }
      }
      CFErrorRef v39 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 104), a2);
    }
    else
    {
      CFErrorRef v39 = aclErrorCreate(*(unsigned int *)(a1 + 104), (const __CFString *)*MEMORY[0x1E4F1D160], 100, @"unexpected reply from XPC service %s: %@", v7, v8, v9, v10, (char)"com.apple.AssetCacheLocatorService");
    }
    CFErrorRef v31 = v39;
    CFArrayRef v17 = 0;
    char v32 = 1;
LABEL_35:
    uint64_t v40 = *(const void **)(a1 + 88);
    if (v40) {
      CFRelease(v40);
    }
    uint64_t v41 = *(void *)(a1 + 32);
    if (v41) {
      (*(void (**)(uint64_t, __CFString *, const __CFArray *, CFErrorRef))(v41 + 16))(v41, @"new", v17, v31);
    }
    if (v31) {
      CFRelease(v31);
    }
    if ((v32 & 1) == 0) {
      CFRelease(v17);
    }
  }
  xpc_release(*(xpc_object_t *)(a1 + 96));
  if (*(double *)(a1 + 48) >= 0.0)
  {
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
  _Block_object_dispose(&v43, 8);
}

uint64_t __aclLocateCommon_block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8)
                                                                            + 24);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __aclLocateCommon_block_invoke_2_250(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8)
                                                                            + 24);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

double *__aclSaveLocateResult_block_invoke(double *result)
{
  double v1 = result[4];
  if (v1 == 0.0 || v1 > *(double *)&qword_1EB678A18)
  {
    BOOL v3 = result;
    qword_1EB678A18 = *((void *)result + 4);
    if (qword_1EB678A20) {
      CFRelease((CFTypeRef)qword_1EB678A20);
    }
    uint32_t v4 = (const void *)*((void *)v3 + 5);
    qword_1EB678A20 = (uint64_t)v4;
    if (v4) {
      CFRetain(v4);
    }
    byte_1EB678A28 = *((unsigned char *)v3 + 68);
    dword_1EB678A2C = *((_DWORD *)v3 + 16);
    if (qword_1EB678A30) {
      CFRelease((CFTypeRef)qword_1EB678A30);
    }
    uint64_t v5 = (const void *)*((void *)v3 + 6);
    qword_1EB678A30 = (uint64_t)v5;
    if (v5) {
      CFRetain(v5);
    }
    if (qword_1EB678A38) {
      CFRelease((CFTypeRef)qword_1EB678A38);
    }
    CFTypeRef result = (double *)*((void *)v3 + 7);
    qword_1EB678A38 = (uint64_t)result;
    if (result)
    {
      return (double *)CFRetain(result);
    }
  }
  return result;
}

uint64_t __aclResultsCreateFromXPC_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E01B5B30](a3) == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(a3, "hostport");
    uint64_t v7 = xpc_dictionary_get_string(a3, "guid");
    double v8 = xpc_dictionary_get_double(a3, "timeout");
    if (v8 < 0.2) {
      double v8 = 1.0;
    }
    double valuePtr = v8;
    BOOL v9 = xpc_dictionary_get_BOOL(a3, "healthy");
    BOOL v10 = xpc_dictionary_get_BOOL(a3, "favored");
    BOOL v11 = xpc_dictionary_get_BOOL(a3, "supportsUrgency");
    double v12 = xpc_dictionary_get_double(a3, "validityInterval");
    if (v12 < 5.0) {
      double v12 = 5.0;
    }
    int int64 = xpc_dictionary_get_int64(a3, "rank");
    if (string && *string && v7 && *v7)
    {
      *(_OWORD *)keys = xmmword_1E6CC43E0;
      keys[2] = @"validUntil";
      CFNumberRef v13 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v15 = CFDateCreate(0, v12 + Current);
      CFDateRef v16 = v15;
      CFArrayRef v17 = (void *)*MEMORY[0x1E4F1CFD0];
      CFIndex v18 = (void *)*MEMORY[0x1E4F1CFC8];
      if (v11) {
        CFIndex v19 = (void *)*MEMORY[0x1E4F1CFD0];
      }
      else {
        CFIndex v19 = (void *)*MEMORY[0x1E4F1CFC8];
      }
      values[0] = v13;
      values[1] = v19;
      values[2] = v15;
      CFDictionaryRef v20 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFRelease(v16);
      CFRelease(v13);
      *(_OWORD *)CFErrorRef v31 = xmmword_1E6CC43F8;
      long long v32 = *(_OWORD *)&off_1E6CC4408;
      long long v33 = xmmword_1E6CC4418;
      CFStringRef v21 = CFStringCreateWithCString(0, v7, 0x8000100u);
      CFStringRef v22 = CFStringCreateWithCString(0, string, 0x8000100u);
      CFNumberRef v23 = CFNumberCreate(0, kCFNumberIntType, &int64);
      CFNumberRef v24 = v23;
      if (v10) {
        double v25 = v17;
      }
      else {
        double v25 = v18;
      }
      v30[0] = v20;
      v30[1] = v25;
      if (v9) {
        uint64_t v26 = v17;
      }
      else {
        uint64_t v26 = v18;
      }
      v30[2] = (void *)v21;
      v30[3] = v26;
      v30[4] = (void *)v22;
      v30[5] = v23;
      CFDictionaryRef v27 = CFDictionaryCreate(0, (const void **)v31, (const void **)v30, 6, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFRelease(v24);
      CFRelease(v22);
      CFRelease(v21);
      CFRelease(v20);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v27);
      CFRelease(v27);
    }
  }
  return 1;
}

void __aclGetSharedLocatorConnection_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __aclGetSharedLocatorConnection_block_invoke_2;
  block[3] = &__block_descriptor_tmp_271;
  long long v5 = *(_OWORD *)(a1 + 32);
  xpc_object_t v6 = object;
  dispatch_async((dispatch_queue_t)qword_1EB6789F8, block);
}

void __aclGetSharedLocatorConnection_block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = *(_xpc_connection_s **)(a1 + 32);
  if (v2 == **(_xpc_connection_s ***)(a1 + 40))
  {
    BOOL v3 = qword_1EB6789F0;
    if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      long long v5 = @"XPC_ERROR_CONNECTION_INVALID";
      if (v4 == MEMORY[0x1E4F14550]) {
        xpc_object_t v6 = @"XPC_ERROR_TERMINATION_IMMINENT";
      }
      else {
        xpc_object_t v6 = *(__CFString **)(a1 + 48);
      }
      if (v4 != MEMORY[0x1E4F14528]) {
        long long v5 = v6;
      }
      if (v4 == MEMORY[0x1E4F14520]) {
        uint64_t v7 = @"XPC_ERROR_CONNECTION_INTERRUPTED";
      }
      else {
        uint64_t v7 = v5;
      }
      v8[0] = 67109634;
      v8[1] = 0;
      __int16 v9 = 2080;
      BOOL v10 = "com.apple.AssetCacheLocatorService";
      __int16 v11 = 2112;
      double v12 = v7;
      _os_log_impl(&dword_1DD432000, v3, OS_LOG_TYPE_INFO, "#%08x event from XPC service %s: %@", (uint8_t *)v8, 0x1Cu);
      CFStringRef v2 = **(_xpc_connection_s ***)(a1 + 40);
    }
    xpc_connection_cancel(v2);
    xpc_release(**(xpc_object_t **)(a1 + 40));
    **(void **)(a1 + 40) = 0;
  }
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void __getSZExtractorClass_block_invoke_cold_1(void *a1)
{
  CFStringRef v2 = [MEMORY[0x1E4F28B00] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *StreamingZipLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ACSURLSession.m", 9, @"%s", *a1);

  __break(1u);
}

void __getSZExtractorClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  double v1 = [NSString stringWithUTF8String:"Class getSZExtractorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ACSURLSession.m", 10, @"Unable to find class %s", "SZExtractor");

  __break(1u);
}

void __ACSLocateCachingServer_block_invoke_85_cold_1()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1098, "CFGetRetainCount(error) == 1");
}

void __ACSLocateCachingServer_block_invoke_85_cold_2()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1097, "CFGetRetainCount(advice) == 1");
}

void __ACSLocateCachingServer_block_invoke_85_cold_3()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1096, "CFGetRetainCount(newURL) == 1");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_105_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1207, "CFGetRetainCount(error) == 1");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_115_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1264, "CFGetRetainCount(callbackError) == 1");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_118_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DD432000, v0, v1, "#%08x %s reply callback(object=%@)");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_123_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1297, "CFGetRetainCount(callbackError) == 1");
}

void __ACSImportFileIntoCachingServer_block_invoke_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1440, "CFGetRetainCount(error) == 1");
}

void __ACSImportFileIntoCachingServer_block_invoke_164_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1540, "CFGetRetainCount(getError) == 1");
}

void __ACSImportFileIntoCachingServer_block_invoke_169_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1569, "CFGetRetainCount(error) == 1");
}

void __aclLocateCommon_block_invoke_2_cold_1()
{
  __assert_rtn("aclLocateCommon_block_invoke", "AssetCacheLocator.c", 1026, "replySema != NULL");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x1F40D7AD0](allocator, *(void *)&fd, closeOnInvalidate, callout, context);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8768](anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D87A0](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D87C0](anURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x1F40D8910](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

int pause(void)
{
  return MEMORY[0x1F40CD738]();
}

int raise(int a1)
{
  return MEMORY[0x1F40CDC00](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}