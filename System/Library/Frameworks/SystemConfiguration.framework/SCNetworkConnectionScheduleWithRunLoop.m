@interface SCNetworkConnectionScheduleWithRunLoop
@end

@implementation SCNetworkConnectionScheduleWithRunLoop

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke(uint64_t a1)
{
  mach_msg_return_t v3;
  mach_msg_return_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _DWORD *v16;
  NSObject *v17;
  uint64_t v18;
  void block[7];

  block[6] = *MEMORY[0x1E4F143B8];
  v2 = (mach_msg_header_t *)malloc_type_malloc(0x7CuLL, 0x100004039FCFF04uLL);
  v3 = mach_msg(v2, 2, 0, 0x7Cu, *(_DWORD *)(a1 + 48), 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = __log_SCNetworkConnection_log;
    if (!__log_SCNetworkConnection_log)
    {
      v5 = os_log_create("com.apple.SystemConfiguration", "SCNetworkConnection");
      __log_SCNetworkConnection_log = (uint64_t)v5;
    }
    v6 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v5, (os_log_type_t)v6))
    {
      v7 = _os_log_pack_size();
      v15 = (char *)&block[-1]
          - ((MEMORY[0x1F4188790](v7, v8, v9, v10, v11, v12, v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v16 = (_DWORD *)_os_log_pack_fill();
      *v16 = 67109120;
      v16[1] = v4;
      __SC_log_send(5, (uint64_t)v5, v6, v15);
    }
    free(v2);
  }
  else
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_137;
    block[3] = &__block_descriptor_tmp_138;
    v18 = *(void *)(a1 + 32);
    v17 = *(NSObject **)(a1 + 40);
    block[4] = v2;
    block[5] = v18;
    dispatch_async(v17, block);
  }
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __SCNetworkConnectionMachCallBack(a1, *(void *)(a1 + 32), a3, *(void *)(a1 + 40));
  free(*(void **)(a1 + 32));
  v4 = *(const void **)(a1 + 40);

  CFRelease(v4);
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_3(uint64_t a1, int a2)
{
  block[5] = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    v5 = __log_SCNetworkConnection_log;
    if (!__log_SCNetworkConnection_log)
    {
      v5 = os_log_create("com.apple.SystemConfiguration", "SCNetworkConnection");
      __log_SCNetworkConnection_log = (uint64_t)v5;
    }
    uint64_t v6 = _SC_syslog_os_log_mapping(7);
    if (__SC_log_enabled(7, v5, (os_log_type_t)v6))
    {
      uint64_t v7 = _os_log_pack_size();
      v15 = (char *)block - ((MEMORY[0x1F4188790](v7, v8, v9, v10, v11, v12, v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      uint64_t v16 = _os_log_pack_fill();
      uint64_t v17 = *(void *)(a1 + 40) + 88;
      *(_DWORD *)uint64_t v16 = 136315138;
      *(void *)(v16 + 4) = v17;
      __SC_log_send(7, (uint64_t)v5, v6, v15);
    }
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else if (a2 == 1)
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(__CFRunLoopSource **)(v3 + 224);
    if (v4)
    {
      CFRunLoopSourceSignal(v4);
      _SC_signalRunLoop(*(const void **)(a1 + 32), *(__CFRunLoopSource **)(*(void *)(a1 + 40) + 224), *(CFArrayRef *)(*(void *)(a1 + 40) + 280));
    }
    else if (*(void *)(v3 + 288))
    {
      CFRetain(*(CFTypeRef *)(a1 + 32));
      v18 = *(NSObject **)(*(void *)(a1 + 40) + 288);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_4;
      block[3] = &__block_descriptor_tmp_141;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v18, block);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
  }
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_4(uint64_t a1)
{
  __SCNetworkConnectionCallBack(*(void *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end