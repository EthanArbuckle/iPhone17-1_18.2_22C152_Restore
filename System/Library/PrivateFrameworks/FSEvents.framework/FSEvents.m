void __create_d2f_port_source_block_invoke(uint64_t a1)
{
  receive_and_dispatch_rcv_msg(*(_DWORD *)(a1 + 32));
}

void __FSEventStreamSetDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 188))
  {
    if (!*(unsigned char *)(v1 + 189)) {
      process_dir_events(*(_DWORD *)(a1 + 40), (void *)v1);
    }
  }
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    if (*((void *)streamRef + 27) || *((void *)streamRef + 45))
    {
      if (*((unsigned char *)streamRef + 188))
      {
        v2 = fsevent_default_log();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
          FSEventStreamInvalidate_cold_3();
        }
      }
      *((unsigned char *)streamRef + 189) = 1;
      _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, (char *)streamRef + 192);
      pthread_mutex_lock(&FSEvents_streamDict_mutex);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v3);
      pthread_mutex_unlock(&FSEvents_streamDict_mutex);
      CFRelease(v3);
      v4 = (__CFMachPort *)*((void *)streamRef + 25);
      if (v4)
      {
        CFMachPortInvalidate(v4);
        CFRelease(*((CFTypeRef *)streamRef + 25));
        *((void *)streamRef + 25) = 0;
        v5 = (__CFMachPort *)*((void *)streamRef + 26);
        if (v5)
        {
          CFMachPortSetInvalidationCallBack(v5, 0);
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((void *)streamRef + 26) = 0;
        }
        v6 = (const void *)*((void *)streamRef + 27);
        if (v6)
        {
          CFRelease(v6);
          *((void *)streamRef + 27) = 0;
        }
      }
      if (*((void *)streamRef + 45)) {
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
      }
      else {
        dispose_d2f_port(*((_DWORD *)streamRef + 48));
      }
      *((_DWORD *)streamRef + 48) = 0;
      if (*((void *)streamRef + 47))
      {
        cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }
      if ((*((unsigned char *)streamRef + 184) & 4) != 0)
      {
        v8 = (__CFFileDescriptor *)*((void *)streamRef + 52);
        if (v8)
        {
          CFFileDescriptorInvalidate(v8);
          CFRelease(*((CFTypeRef *)streamRef + 52));
          *((void *)streamRef + 52) = 0;
          v9 = (const void *)*((void *)streamRef + 53);
          if (v9)
          {
            CFRelease(v9);
            *((void *)streamRef + 53) = 0;
          }
        }
        if (*((void *)streamRef + 54))
        {
          cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
          *((_DWORD *)streamRef + 102) = -1;
        }
      }
    }
    else
    {
      v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        FSEventStreamInvalidate_cold_2();
      }
    }
  }
  else
  {
    v7 = fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSEventStreamInvalidate_cold_1();
    }
  }
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  if (streamRef)
  {
    if (q)
    {
      if (!*((_DWORD *)streamRef + 48))
      {
        if (allocate_d2f_port((uint64_t)"FSEventStreamSetDispatchQueue", (uint64_t)streamRef))
        {
          v17 = fsevent_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            FSEventStreamSetDispatchQueue_cold_4();
          }
          return;
        }
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        if (!FSEvents_streamDict) {
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v18, 0, MEMORY[0x263EFFF88], 0);
        }
        CFNumberRef v19 = CFNumberCreate(v18, kCFNumberIntType, (char *)streamRef + 192);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v19, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v19);
      }
      pthread_mutex_init((pthread_mutex_t *)((char *)streamRef + 240), 0);
      pthread_cond_init((pthread_cond_t *)((char *)streamRef + 304), 0);
      dispatch_retain(q);
      *((void *)streamRef + 44) = q;
      if (create_d2f_port_source((uint64_t)streamRef))
      {
        if ((*((unsigned char *)streamRef + 184) & 4) == 0) {
          return;
        }
        int v4 = *((_DWORD *)streamRef + 102);
        dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF83E8], v4, 0, *((dispatch_queue_t *)streamRef + 44));
        if (v5)
        {
          v6 = v5;
          dispatch_set_qos_class_fallback();
          FSEventStreamRetain(streamRef);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 0x40000000;
          handler[2] = __FSEventStreamSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp_0;
          handler[4] = streamRef;
          int v31 = v4;
          dispatch_source_set_event_handler(v6, handler);
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 0x40000000;
          v28[2] = __FSEventStreamSetDispatchQueue_block_invoke_2;
          v28[3] = &__block_descriptor_tmp_24;
          int v29 = v4;
          v28[4] = v6;
          v28[5] = streamRef;
          dispatch_source_set_cancel_handler(v6, v28);
          *((void *)streamRef + 54) = v6;
          *((_DWORD *)streamRef + 110) = 1;
          return;
        }
        v20 = fsevent_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          FSEventStreamSetDispatchQueue_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }
      else
      {
        v9 = fsevent_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          FSEventStreamSetDispatchQueue_cold_3(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
      if (*((void *)streamRef + 54))
      {
        cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }
      if (*((void *)streamRef + 45))
      {
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }
    }
    else
    {
      if (*((void *)streamRef + 45))
      {
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }
      if (*((void *)streamRef + 47))
      {
        cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }
      if ((*((unsigned char *)streamRef + 184) & 4) != 0 && *((void *)streamRef + 54))
      {
        cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }
      v8 = *((void *)streamRef + 44);
      if (v8)
      {
        dispatch_release(v8);
        *((void *)streamRef + 44) = 0;
      }
    }
  }
  else
  {
    v7 = fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSEventStreamSetDispatchQueue_cold_1();
    }
  }
}

BOOL create_d2f_port_source(uint64_t a1)
{
  uintptr_t v2 = *(unsigned int *)(a1 + 192);
  CFNumberRef v3 = dispatch_source_create(MEMORY[0x263EF83C8], v2, 0, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __create_d2f_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_66;
    int v8 = v2;
    dispatch_source_set_event_handler(v3, handler);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __create_d2f_port_source_block_invoke_2;
    v5[3] = &__block_descriptor_tmp_67;
    int v6 = v2;
    v5[4] = v3;
    v5[5] = a1;
    dispatch_source_set_cancel_handler(v3, v5);
    *(void *)(a1 + 360) = v3;
    *(_DWORD *)(a1 + 368) = 1;
  }
  return v3 != 0;
}

uint64_t allocate_d2f_port(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, (mach_port_name_t *)(a2 + 192));
  if (v2)
  {
    CFNumberRef v3 = fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      allocate_d2f_port_cold_1();
    }
  }
  return v2;
}

CFArrayRef FSEventStreamCopyPathsBeingWatched(ConstFSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    uint64_t v11 = fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_1();
    }
    return 0;
  }
  uint64_t v2 = (const void **)malloc_type_calloc(*((void *)streamRef + 9), 8uLL, 0x6004044C4A2DFuLL);
  if (!v2)
  {
    uint64_t v12 = fsevent_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0;
  }
  CFNumberRef v3 = v2;
  CFIndex v4 = *((void *)streamRef + 9);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    while (1)
    {
      CFStringRef v7 = CFStringCreateWithFileSystemRepresentation(v5, *(const char **)(*((void *)streamRef + 10) + 8 * v6));
      if (!v7) {
        break;
      }
      v3[v6++] = v7;
      CFIndex v4 = *((void *)streamRef + 9);
      if (v4 <= v6) {
        goto LABEL_7;
      }
    }
    v20 = fsevent_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_3((void *)streamRef + 10, v6, v20);
    }
    goto LABEL_20;
  }
LABEL_7:
  CFArrayRef v8 = CFArrayCreate(v5, v3, v4, MEMORY[0x263EFFF70]);
  if (!v8)
  {
    uint64_t v21 = fsevent_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_20:
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      uint64_t v29 = 0;
      do
      {
        v30 = v3[v29];
        if (!v30) {
          break;
        }
        CFRelease(v30);
        ++v29;
      }
      while (*((void *)streamRef + 9) > v29);
    }
    free(v3);
    return 0;
  }
  CFArrayRef v9 = v8;
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    uint64_t v10 = 0;
    do
      CFRelease(v3[v10++]);
    while (*((void *)streamRef + 9) > v10);
  }
  free(v3);
  return v9;
}

void receive_and_dispatch_rcv_msg(mach_port_name_t a1)
{
  mach_msg_return_t v7;
  mach_msg_size_t v8;
  mach_msg_header_t *v9;
  NSObject *v10;
  NSObject *v11;
  void v12[2];

  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EF8AF8];
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  CFIndex v4 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (_DWORD *)((char *)v12 - v5);
  CFStringRef v7 = mach_msg(v4, 50331910, 0, v2, a1, 0, 0);
  if (!v7)
  {
LABEL_8:
    CFArrayRef v9 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
    goto LABEL_9;
  }
  if (v7 != 268451844)
  {
    uint64_t v11 = fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      receive_and_dispatch_rcv_msg_cold_1();
    }
    goto LABEL_8;
  }
  CFArrayRef v8 = v4->msgh_size + 68;
  CFArrayRef v9 = (mach_msg_header_t *)malloc_type_malloc(v8, 0x34984651uLL);
  if (mach_msg(v9, 262, 0, v8, a1, 0, 0))
  {
    uint64_t v10 = fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      receive_and_dispatch_rcv_msg_cold_2();
    }
  }
LABEL_9:
  _DWORD *v6 = 0;
  v6[1] = v2;
  FSEventsD2F_server(v9, (uint64_t)v6);
  if (v9 != v4) {
    free(v9);
  }
}

uint64_t FSEventsD2F_server(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 67000)
  {
    _Xcallback_rpc((uint64_t)a1, a2);
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _Xcallback_rpc(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 120)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && *(unsigned char *)(a1 + 55) == 1 && *(unsigned char *)(a1 + 71) == 1 && *(unsigned char *)(a1 + 87) == 1)
    {
      int v3 = *(_DWORD *)(a1 + 40) >> 2;
      if (v3 == *(_DWORD *)(a1 + 104))
      {
        int v4 = *(_DWORD *)(a1 + 56) >> 2;
        if (v4 == *(_DWORD *)(a1 + 108))
        {
          int v5 = *(_DWORD *)(a1 + 72) >> 3;
          if (v5 == *(_DWORD *)(a1 + 112) && *(_DWORD *)(a1 + 88) == *(_DWORD *)(a1 + 116))
          {
            *(_DWORD *)(a2 + 32) = implementation_callback_rpc(*(_DWORD *)(a1 + 12), *(unsigned int *)(a1 + 100), *(void *)(a1 + 28), v3, *(unsigned char **)(a1 + 44), v4, *(__CFArray **)(a1 + 60), v5, *(char **)(a1 + 76), *(_DWORD *)(a1 + 88));
            mig_deallocate(*(void *)(a1 + 76), *(unsigned int *)(a1 + 88));
            *(void *)(a1 + 76) = 0;
            *(_DWORD *)(a1 + 88) = 0;
            mig_deallocate(*(void *)(a1 + 60), *(unsigned int *)(a1 + 72));
            *(void *)(a1 + 60) = 0;
            *(_DWORD *)(a1 + 72) = 0;
            mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
            *(void *)(a1 + 44) = 0;
            *(_DWORD *)(a1 + 56) = 0;
            mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
            *(void *)(a1 + 28) = 0;
            *(_DWORD *)(a1 + 40) = 0;
            return;
          }
        }
      }
    }
    int v6 = -300;
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
}

void cancel_source(NSObject **a1, int *a2)
{
  int v4 = *a1;
  if (v4)
  {
    dispatch_source_cancel(v4);
    resume_source(*a1, a2);
    *a1 = 0;
  }
  *a2 = 0;
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    int v4 = fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_1();
    goto LABEL_20;
  }
  if (*((unsigned char *)streamRef + 188))
  {
    unsigned int v2 = fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_3();
    goto LABEL_20;
  }
  if (!*((void *)streamRef + 27) && !*((void *)streamRef + 45))
  {
    CFArrayRef v8 = fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_2();
    goto LABEL_20;
  }
  int v5 = *((_DWORD *)streamRef + 46);
  if ((v5 & 4) != 0 && !*((void *)streamRef + 54) && !*((void *)streamRef + 52) && !*((void *)streamRef + 53))
  {
LABEL_20:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (!*((_DWORD *)streamRef + 49))
  {
    if (!register_with_server((uint64_t)streamRef, (uint64_t)"FSEventStreamStart", *((_DWORD *)streamRef + 48), *((_DWORD *)streamRef + 16), *((_DWORD *)streamRef + 18), *((const void ***)streamRef + 10), *((void *)streamRef + 21), *((void *)streamRef + 22), v5, (_DWORD *)streamRef + 49))
    {
      *((unsigned char *)streamRef + 188) = 1;
      if (*((void *)streamRef + 27))
      {
        context.version = 0;
        context.info = streamRef;
        context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
        context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
        context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
        CFArrayRef v9 = CFMachPortCreateWithPort(0, *((_DWORD *)streamRef + 49), (CFMachPortCallBack)FSEventsClientPortCallback, &context, 0);
        *((void *)streamRef + 26) = v9;
        CFMachPortSetInvalidationCallBack(v9, (CFMachPortInvalidationCallBack)server_gone_callback);
      }
      else
      {
        uint64_t v10 = *((void *)streamRef + 45);
        if (v10)
        {
          resume_source(v10, (int *)streamRef + 92);
          if (create_f2d_private_port_source((uint64_t)streamRef)) {
            resume_source(*((NSObject **)streamRef + 47), (int *)streamRef + 96);
          }
        }
      }
      goto LABEL_14;
    }
    goto LABEL_20;
  }
LABEL_14:
  int v6 = (__CFFileDescriptor *)*((void *)streamRef + 52);
  if (v6) {
    CFFileDescriptorEnableCallBacks(v6, 1uLL);
  }
  CFStringRef v7 = *((void *)streamRef + 54);
  if (v7) {
    resume_source(v7, (int *)streamRef + 110);
  }
  LOBYTE(v3) = 1;
  return v3;
}

void resume_source(NSObject *a1, int *a2)
{
  if (a1)
  {
    int v3 = *a2;
    if (*a2)
    {
      if (v3 == 2)
      {
        dispatch_resume(a1);
      }
      else if (v3 == 1)
      {
        dispatch_activate(a1);
      }
      *a2 = 3;
    }
  }
}

uint64_t register_with_server(uint64_t a1, uint64_t a2, int a3, int a4, int a5, const void **a6, uint64_t a7, uint64_t a8, int a9, _DWORD *a10)
{
  uint64_t v17 = FSEvents_connect();
  if (v17) {
    return v17;
  }
  uint64_t v66 = a7;
  uint64_t v19 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v19)
  {
    v20 = v19;
    v67 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    if (v67)
    {
      uint64_t v62 = a8;
      int v65 = a3;
      int v63 = a4;
      uint64_t v21 = a5;
      if (a5 < 1)
      {
        int v22 = 0;
      }
      else
      {
        int v22 = 0;
        uint64_t v23 = a5;
        uint64_t v24 = (const char **)a6;
        uint64_t v25 = v20;
        do
        {
          uint64_t v26 = *v24++;
          int v27 = strlen(v26);
          *v25++ = v27;
          v22 += v27;
          --v23;
        }
        while (v23);
      }
      int v30 = v22 + a5;
      int v31 = (char *)malloc_type_malloc(v22 + a5, 0x6D242494uLL);
      if (!v31)
      {
        v46 = fsevent_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_3();
        }
        uint64_t v40 = 0;
        v47 = 0;
        uint64_t v17 = 4294967293;
        goto LABEL_49;
      }
      int v64 = v30;
      v61 = v20;
      int v32 = 0;
      if (a5 >= 1)
      {
        v33 = v67;
        v34 = v20;
        do
        {
          *v33++ = v32;
          int v35 = *v34++;
          int v36 = v35 + 1;
          v37 = *a6++;
          memcpy(&v31[v32], v37, v36);
          v32 += v36;
          --v21;
        }
        while (v21);
      }
      int v38 = v64;
      if (v32 != v64)
      {
        v39 = fsevent_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_7();
        }
      }
      uint64_t v40 = *(void *)(a1 + 96);
      int v41 = v65;
      if (v40)
      {
        if (v40 < 1)
        {
          size_t v42 = 0;
          v20 = v61;
        }
        else
        {
          size_t v42 = 0;
          v43 = (const char **)(a1 + 104);
          uint64_t v44 = *(void *)(a1 + 96);
          v20 = v61;
          do
          {
            v45 = *v43++;
            v42 += strlen(v45) + 1;
            --v44;
          }
          while (v44);
        }
        v49 = malloc_type_malloc(4 * v40, 0x100004052888210uLL);
        if (!v49)
        {
          v57 = fsevent_default_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            register_with_server_cold_5();
          }
          uint64_t v40 = 0;
          v47 = 0;
          uint64_t v17 = 4294967292;
          goto LABEL_49;
        }
        v47 = v49;
        v50 = (char *)malloc_type_malloc(v42, 0x1CED7B04uLL);
        if (!v50)
        {
          v58 = fsevent_default_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            register_with_server_cold_6();
          }
          uint64_t v40 = 0;
          uint64_t v17 = 4294967291;
          goto LABEL_49;
        }
        uint64_t v40 = (uint64_t)v50;
        uint64_t v48 = *(void *)(a1 + 96);
        if (v48 < 1)
        {
          int v38 = v64;
        }
        else
        {
          v60 = v31;
          uint64_t v51 = 0;
          int v52 = 0;
          v53 = v50;
          uint64_t v54 = a1 + 104;
          do
          {
            v47[v51] = v52;
            size_t v55 = strlen(*(const char **)(v54 + 8 * v51));
            int v56 = v55 + 1;
            memcpy(&v53[v52], *(const void **)(v54 + 8 * v51), v55 + 1);
            v52 += v56;
            ++v51;
            uint64_t v48 = *(void *)(a1 + 96);
          }
          while (v48 > v51);
          v20 = v61;
          int v41 = v65;
          int v38 = v64;
          uint64_t v40 = (uint64_t)v53;
          int v31 = v60;
        }
      }
      else
      {
        LODWORD(v48) = 0;
        LODWORD(v42) = 0;
        v47 = 0;
        v20 = v61;
      }
      uint64_t v17 = f2d_register_rpc(FSEvents_f2d_public_port, v41, v63, a5, (uint64_t)v67, a5, (uint64_t)v31, v38, v48, (uint64_t)v47, v48, v40, v42, v62, a9, v66, a10);
      if (v17)
      {
        v59 = fsevent_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_4();
        }
      }
LABEL_49:
      free(v20);
      free(v67);
      if (v31) {
        free(v31);
      }
      if (v47) {
        free(v47);
      }
      if (v40) {
        free((void *)v40);
      }
      return v17;
    }
    uint64_t v29 = fsevent_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      register_with_server_cold_2();
    }
    free(v20);
    return 4294967294;
  }
  else
  {
    uint64_t v28 = fsevent_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      register_with_server_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
}

CFUUIDRef FSEventsCopyUUIDForDevice(dev_t dev)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (dev <= 0)
  {
    unsigned int v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      FSEventsCopyUUIDForDevice_cold_1();
    }
  }
  if (FSEvents_connect()) {
    return 0;
  }
  int v9 = 0;
  memset(v8, 0, sizeof(v8));
  f2d_get_server_uuid_rpc(FSEvents_f2d_public_port, dev, (uint64_t)v8);
  if (LODWORD(v8[0]) == 1429032782 && *(_DWORD *)((char *)v8 + 3) == 1145656661) {
    return 0;
  }
  CFStringRef v6 = CFStringCreateWithBytes(0, (const UInt8 *)v8, 36, 0x600u, 0);
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = v6;
  CFUUIDRef v3 = CFUUIDCreateFromString(0, v6);
  CFRelease(v7);
  return v3;
}

uint64_t FSEvents_connect()
{
  pthread_mutex_lock(&FSEvents_f2d_public_port_mutex);
  if (FSEvents_f2d_public_port)
  {
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    return 0;
  }
  else
  {
    uint64_t v0 = bootstrap_look_up2();
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    if (v0)
    {
      uint64_t v1 = fsevent_default_log();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        FSEvents_connect_cold_1();
      }
    }
  }
  return v0;
}

uint64_t f2d_get_server_uuid_rpc(int a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(_OWORD *)&msg[20] = 0u;
  memset(v13, 0, sizeof(v13));
  long long v12 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x101D200000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x50u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66102)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 72)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v7 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                long long v10 = *(_OWORD *)v13;
                *(_OWORD *)a3 = v12;
                *(_OWORD *)(a3 + 16) = v10;
                *(_DWORD *)(a3 + 32) = *(_DWORD *)&v13[16];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg[32] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t f2d_register_rpc(int a1, int a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, int a9, uint64_t a10, int a11, uint64_t a12, int a13, uint64_t a14, int a15, uint64_t a16, _DWORD *a17)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 5;
  *(_DWORD *)&msg[28] = a2;
  int v23 = 1310720;
  uint64_t v24 = a5;
  int v25 = 16777472;
  int v26 = 4 * a6;
  uint64_t v27 = a7;
  int v28 = 16777472;
  int v29 = a8;
  uint64_t v30 = a10;
  int v31 = 16777472;
  int v32 = 4 * a11;
  uint64_t v33 = a12;
  int v34 = 16777472;
  int v35 = a13;
  uint64_t v36 = *MEMORY[0x263EF80C8];
  int v37 = a3;
  int v38 = a4;
  int v39 = a6;
  int v40 = a8;
  int v41 = a9;
  int v42 = a11;
  int v43 = a13;
  uint64_t v44 = a14;
  int v45 = a15;
  uint64_t v46 = a16;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(void *)&msg[16] = 0x101D000000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v19 = mach_msg((mach_msg_header_t *)msg, 3162115, 0xA0u, 0x30u, special_reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) > 0xE || ((1 << (v19 - 2)) & 0x4003) == 0)
  {
    if (!v19)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v20 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66100)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v20 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v20 = 4294966996;
              }
              else {
                uint64_t v20 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v20 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v20 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 40 && !*(_DWORD *)&msg[8] && HIWORD(v23) << 16 == 1114112)
        {
          uint64_t v20 = 0;
          *a17 = *(_DWORD *)&msg[28];
          return v20;
        }
      }
      else
      {
        uint64_t v20 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v20;
    }
    mig_dealloc_special_reply_port();
  }
  return v20;
}

BOOL create_f2d_private_port_source(uint64_t a1)
{
  uintptr_t v2 = *(unsigned int *)(a1 + 196);
  CFUUIDRef v3 = dispatch_source_create(MEMORY[0x263EF83D0], v2, 1uLL, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __create_f2d_private_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_54;
    void handler[4] = a1;
    dispatch_source_set_event_handler(v3, handler);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __create_f2d_private_port_source_block_invoke_2;
    v5[3] = &__block_descriptor_tmp_55;
    int v6 = v2;
    v5[4] = v3;
    v5[5] = a1;
    dispatch_source_set_cancel_handler(v3, v5);
    *(void *)(a1 + 376) = v3;
    *(_DWORD *)(a1 + 384) = 1;
  }
  return v3 != 0;
}

void process_dir_events(int a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2[49];
  int v4 = (kevent *)a2[50];
  uint64_t v6 = a2[9];
  timeout.tv_sec = 0;
  timeout.tv_nsec = 0;
  dev_t v40 = v6;
  unsigned int v7 = kevent(a1, 0, 0, v4, v6, &timeout);
  if ((v7 & 0x80000000) != 0)
  {
    int v38 = *__error();
    int v39 = fsevent_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      process_dir_events_cold_1(v38);
    }
  }
  else if (v7)
  {
    for (uint64_t i = v7; i; --i)
    {
      if ((int)v4->udata < 0) {
        int64_t udata = (uint64_t)v4->udata & 0x7FFFFFFF;
      }
      else {
        int64_t udata = (int64_t)v4->udata;
      }
      if (udata < 0
        || udata >= v40
        || (uint64_t v10 = v5 + 32 * udata, v12 = (int *)(v10 + 4), v11 = *(_DWORD *)(v10 + 4), v11 < 0)
        || (v14 = (char **)(v10 + 24), (uint64_t v13 = *(const char **)(v10 + 24)) == 0))
      {
        int v22 = fsevent_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          if (udata >= v40)
          {
            __darwin_time_t v28 = 0;
            dev_t v27 = -1;
          }
          else
          {
            uint64_t v26 = v5 + 32 * udata;
            dev_t v27 = *(_DWORD *)(v26 + 4);
            __darwin_time_t v28 = *(void *)(v26 + 24);
          }
          buf.st_dev = 136316162;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = udata;
          HIWORD(buf.st_gid) = 1024;
          buf.st_rdev = v40;
          *((_WORD *)&buf.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&buf.st_rdev + 6) = v27;
          WORD1(buf.st_atimespec.tv_sec) = 2048;
          *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 4) = v28;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v22;
          uint64_t v20 = "%s: index in event (%ld) not valid (%d max; fdtbl %d name %p)";
          uint32_t v21 = 44;
          goto LABEL_39;
        }
      }
      else
      {
        if (*(unsigned char *)v10)
        {
          if (watch_path("process_dir_events", a1, v13, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            int v23 = fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = *v14;
              buf.st_dev = 136315394;
              *(void *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v36;
              _os_log_error_impl(&dword_210AF7000, v23, OS_LOG_TYPE_ERROR, "%s: creation: watch_path() failed for '%s'", (uint8_t *)&buf, 0x16u);
            }
          }
          if (*(unsigned char *)v10) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(unsigned char *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata)) {
            goto LABEL_17;
          }
          uint64_t v24 = fsevent_default_log();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          int v25 = *v14;
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v25;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v24;
          uint64_t v20 = "%s: creation: watch_all_parents() failed for '%s'";
LABEL_51:
          uint32_t v21 = 22;
          goto LABEL_39;
        }
        uint32_t fflags = v4->fflags;
        if ((fflags & 0x22) == 0)
        {
          if ((fflags & 1) == 0) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            int v29 = fsevent_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              int v37 = *v14;
              buf.st_dev = 136315394;
              *(void *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v37;
              _os_log_error_impl(&dword_210AF7000, v29, OS_LOG_TYPE_ERROR, "%s: delete: watch_path() failed for '%s'", (uint8_t *)&buf, 0x16u);
            }
          }
          if ((*(unsigned char *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata)) {
            goto LABEL_17;
          }
          uint64_t v30 = fsevent_default_log();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          int v31 = *v14;
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v31;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v30;
          uint64_t v20 = "%s: delete: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }
        memset(&buf, 0, sizeof(buf));
        if (!fcntl(v11, 50, __s1))
        {
          if (!strcmp(__s1, *v14) && !lstat(__s1, &buf)) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(unsigned char *)v10 & 4) != 0)
          {
            free(*v14);
            *uint64_t v14 = strdup(__s1);
          }
          else if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            int v32 = fsevent_default_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = *v14;
              *(_DWORD *)int v42 = 136315394;
              int v43 = "process_dir_events";
              __int16 v44 = 2080;
              int v45 = v33;
              _os_log_error_impl(&dword_210AF7000, v32, OS_LOG_TYPE_ERROR, "%s: rename: watch_path() failed for '%s'", v42, 0x16u);
            }
          }
          if ((*(unsigned char *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata)) {
            goto LABEL_17;
          }
          int v34 = fsevent_default_log();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          int v35 = *v14;
          *(_DWORD *)int v42 = 136315394;
          int v43 = "process_dir_events";
          __int16 v44 = 2080;
          int v45 = v35;
          p_stat buf = v42;
          uint64_t v19 = v34;
          uint64_t v20 = "%s: rename: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }
        uint64_t v16 = fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = *v12;
          *(_DWORD *)int v42 = 136315394;
          int v43 = "process_dir_events";
          __int16 v44 = 1024;
          LODWORD(v45) = v17;
          p_stat buf = v42;
          uint64_t v19 = v16;
          uint64_t v20 = "%s: failed to get the new path for fd %d";
          uint32_t v21 = 18;
LABEL_39:
          _os_log_error_impl(&dword_210AF7000, v19, OS_LOG_TYPE_ERROR, v20, p_buf, v21);
        }
      }
LABEL_17:
      ++v4;
    }
  }
}

uint64_t implementation_callback_rpc(int a1, uint64_t a2, uint64_t a3, int a4, unsigned char *a5, int a6, __CFArray *a7, int a8, char *a9, int a10)
{
  uint64_t v15 = a2;
  uint64_t v240 = *MEMORY[0x263EF8340];
  int valuePtr = a1;
  if (a2 != a4)
  {
    uint64_t v16 = fsevent_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_18();
    }
  }
  if (v15 != a6)
  {
    int v17 = fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_17();
    }
  }
  if (v15 == a8 || (uint64_t v18 = fsevent_default_log(), !os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)))
  {
    if (v15) {
      goto LABEL_10;
    }
LABEL_89:
    v104 = fsevent_default_log();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_1(v104, v105, v106, v107, v108, v109, v110, v111);
    }
    return 4294967278;
  }
  implementation_callback_rpc_cold_16();
  if (!v15) {
    goto LABEL_89;
  }
LABEL_10:
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  if (!v20)
  {
    uint64_t v36 = fsevent_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_2(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    return 4294967279;
  }
  CFNumberRef v21 = v20;
  pthread_mutex_lock(&FSEvents_streamDict_mutex);
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)FSEvents_streamDict, v21);
  pthread_mutex_unlock(&FSEvents_streamDict_mutex);
  CFRelease(v21);
  if (!Value)
  {
    int v45 = fsevent_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_3(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    return 4294967286;
  }
  *(void *)&long long v225 = a3;
  uint64_t v23 = 0;
  LODWORD(v24) = 0;
  int v25 = 0;
  LODWORD(v230) = a10;
  v229 = a9;
  do
  {
    unsigned int v26 = *(_DWORD *)&a5[v23];
    int v27 = (v26 >> 29) | 4;
    if ((v26 & 0x80000000) == 0) {
      int v27 = (v26 >> 29) & 3;
    }
    int v28 = (v26 << 8) & 0x1000;
    if ((v26 & 0x20) != 0) {
      int v28 = 4096;
    }
    int8x16_t v29 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v26), (uint32x4_t)xmmword_210B032D0), (int8x16_t)xmmword_210B032E0);
    int8x8_t v30 = vorr_s8(*(int8x8_t *)v29.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
    unsigned __int32 v31 = v30.i32[0] | v26 & 0x100000 | v30.i32[1] | (v26 >> 4) & 0x40000 | (((v26 >> 19) & 1) << 21) | (v26 << 8) & 0x400F00 | v28 | v27;
    if ((v26 & 0x40) != 0) {
      v31 |= 0xA000u;
    }
    int v32 = (v26 << 6) & 0x8000;
    if ((v26 & 0x400) != 0) {
      int v32 = 0x8000;
    }
    *(_DWORD *)&a5[v23] = (v26 >> 2) & 0x80000 | (((v26 >> 8) & 1) << 14) | (((v26 >> 7) & 1) << 8) | v32 | v31;
    if ((v31 & 6) != 0)
    {
      int v33 = *((_DWORD *)Value + 18);
      int v25 = 1;
    }
    else
    {
      int v33 = 1;
    }
    size_t v24 = (v33 + v24);
    v23 += 4;
  }
  while (4 * v15 != v23);
  int v34 = *((_DWORD *)Value + 46);
  if ((v34 & 0x40) != 0)
  {
    int v35 = malloc_type_calloc(v24, 8uLL, 0x100004000313F17uLL);
    if ((*((_DWORD *)Value + 46) & 0x100) != 0) {
      goto LABEL_27;
    }
LABEL_35:
    v228 = 0;
    goto LABEL_36;
  }
  int v35 = 0;
  if ((v34 & 0x100) == 0) {
    goto LABEL_35;
  }
LABEL_27:
  v228 = malloc_type_calloc(v24, 4uLL, 0x100004052888210uLL);
LABEL_36:
  if (v15 == 1 && (*a5 & 0x10) != 0)
  {
    if (!Value[190]) {
      return 0;
    }
    Value[190] = 0;
  }
  if (!Value[188]) {
    return 4294966297;
  }
  v227 = (const char **)malloc_type_malloc(8 * v24, 0x10040436913F5uLL);
  if (!v227)
  {
    v84 = fsevent_default_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_4(v84, v85, v86, v87, v88, v89, v90, v91);
    }
    v92 = 0;
    uint64_t v44 = 4294967285;
    goto LABEL_227;
  }
  int64_t v219 = v15;
  v53 = malloc_type_calloc(v24, 4uLL, 0x100004052888210uLL);
  v223 = v53;
  if (!v53)
  {
    v93 = fsevent_default_log();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_5(v93, v94, v95, v96, v97, v98, v99, v100);
    }
    v60 = 0;
    v57 = 0;
    v101 = 0;
    CFArrayRef v102 = 0;
    v103 = 0;
    uint64_t v44 = 4294967285;
    goto LABEL_210;
  }
  size_t v55 = v53;
  CFMutableArrayRef v224 = a7;
  if (!v25)
  {
    size_t v216 = 8 * v24;
    if (!v24)
    {
      v57 = a5;
      v60 = v224;
      goto LABEL_133;
    }
    uint64_t v217 = v15;
    CFAllocatorRef v221 = v19;
    LODWORD(v218) = 0;
    v112 = v35;
    v113 = (int *)(v225 + 4);
    *(void *)&long long v54 = 136315394;
    long long v225 = v54;
    v114 = v227;
    v115 = v228;
    size_t v116 = v24;
    v226 = v112;
    unsigned int v117 = v230;
    while (1)
    {
      if (*(v113 - 1) >= v117)
      {
        v118 = fsevent_default_log();
        BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
        unsigned int v117 = v230;
        if (v119)
        {
          *(_DWORD *)stat buf = v225;
          v237 = "implementation_callback_rpc";
          __int16 v238 = 2080;
          v239 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_210AF7000, v118, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          unsigned int v117 = v230;
        }
      }
      uint64_t v120 = *(v113 - 1);
      if (v120 >= v117) {
        v121 = "ERROR: failed assertion: path_offsets[i] < paths_blobCnt";
      }
      else {
        v121 = &v229[v120];
      }
      *v114 = v121;
      if (v226)
      {
        int v122 = strlen(v121);
        unsigned int v117 = v230;
        int v123 = (int)v230;
        if (v24 != 1)
        {
          int v123 = (int)v230;
          if (v116 != 1) {
            int v123 = *v113;
          }
        }
        int v124 = v120 + v122 + 1;
        if (v124 == v123)
        {
          uint64_t v125 = 0;
        }
        else
        {
          if (v124 + 8 > (unint64_t)v123) {
            goto LABEL_110;
          }
          uint64_t v125 = *(void *)&v229[v124];
        }
        void *v112 = v125;
      }
LABEL_110:
      if (v228)
      {
        int v126 = strlen(v121);
        unsigned int v117 = v230;
        int v127 = (int)v230;
        if (v24 != 1)
        {
          int v127 = (int)v230;
          if (v116 != 1) {
            int v127 = *v113;
          }
        }
        int v128 = v120 + v126 + 9;
        if (v128 == v127)
        {
          int v129 = 0;
LABEL_118:
          _DWORD *v115 = v129;
          goto LABEL_119;
        }
        if (v128 + 4 <= (unint64_t)v127)
        {
          int v129 = *(_DWORD *)&v229[v128];
          goto LABEL_118;
        }
      }
LABEL_119:
      ++v115;
      ++v112;
      ++v113;
      ++v114;
      if (!--v116)
      {
        v57 = a5;
        size_t v55 = v223;
        v60 = v224;
LABEL_128:
        int v25 = (int)v218;
        int v35 = v226;
        CFAllocatorRef v19 = v221;
        LODWORD(v15) = v217;
        goto LABEL_133;
      }
    }
  }
  int v56 = malloc_type_malloc(4 * v24, 0x100004052888210uLL);
  if (!v56)
  {
    v131 = fsevent_default_log();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_13(v131, v132, v133, v134, v135, v136, v137, v138);
    }
    v60 = 0;
    v57 = 0;
    v101 = 0;
    CFArrayRef v102 = 0;
    v103 = 0;
    uint64_t v44 = 4294967281;
    goto LABEL_210;
  }
  v57 = v56;
  size_t v216 = 8 * v24;
  v58 = malloc_type_malloc(v216, 0x100004000313F17uLL);
  if (!v58)
  {
    v139 = fsevent_default_log();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_14(v139, v140, v141, v142, v143, v144, v145, v146);
    }
    v60 = 0;
    v101 = 0;
    CFArrayRef v102 = 0;
    v103 = 0;
    uint64_t v44 = 4294967280;
    goto LABEL_210;
  }
  v60 = v58;
  CFAllocatorRef v221 = v19;
  v226 = v35;
  LODWORD(v218) = v25;
  uint64_t v61 = v15;
  uint64_t v62 = 0;
  unsigned int v63 = 0;
  uint64_t v217 = v61;
  if (v61 <= 1) {
    uint64_t v64 = 1;
  }
  else {
    uint64_t v64 = v61;
  }
  *(void *)&long long v59 = 136315394;
  long long v215 = v59;
  unsigned int v65 = v230;
  *(void *)&long long v220 = v64;
  do
  {
    int v66 = *(_DWORD *)&a5[4 * v62];
    uint64_t v67 = *((void *)v224 + v62);
    if ((v66 & 6) == 0)
    {
      unsigned int v70 = *(_DWORD *)(v225 + 4 * v62);
      LODWORD(v222) = v63;
      if (v70 >= v65)
      {
        v71 = fsevent_default_log();
        BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
        unsigned int v63 = v222;
        unsigned int v65 = v230;
        if (v72)
        {
          *(_DWORD *)stat buf = v215;
          v237 = "implementation_callback_rpc";
          __int16 v238 = 2080;
          v239 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_210AF7000, v71, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          unsigned int v63 = v222;
          unsigned int v65 = v230;
        }
      }
      uint64_t v73 = *(unsigned int *)(v225 + 4 * v62);
      v74 = &v229[v73];
      if (v73 >= v65) {
        v74 = "ERROR: failed assertion: path_offsets[i] < paths_blobCnt";
      }
      uint64_t v75 = v63;
      v227[v63] = v74;
      if (v226)
      {
        int v76 = strlen(v227[v62]);
        unsigned int v65 = v230;
        int v77 = (int)v230;
        if (v24 != 1)
        {
          int v77 = (int)v230;
          if (v62 != v24) {
            int v77 = *(_DWORD *)(v225 + 4 * v62 + 4);
          }
        }
        int v78 = v73 + v76 + 1;
        unsigned int v63 = v222;
        if (v78 == v77)
        {
          uint64_t v79 = 0;
        }
        else
        {
          if (v78 + 8 > (unint64_t)v77) {
            goto LABEL_69;
          }
          uint64_t v79 = *(void *)&v229[v78];
        }
        v226[v75] = v79;
      }
LABEL_69:
      if (v228)
      {
        int v80 = strlen(v227[v62]);
        unsigned int v65 = v230;
        int v81 = (int)v230;
        if (v24 != 1)
        {
          int v81 = (int)v230;
          if (v62 != v24) {
            int v81 = *(_DWORD *)(v225 + 4 * v62 + 4);
          }
        }
        int v82 = v73 + v80 + 9;
        unsigned int v63 = v222;
        if (v82 == v81)
        {
          int v83 = 0;
LABEL_77:
          v228[v75] = v83;
          goto LABEL_78;
        }
        if (v82 + 4 <= (unint64_t)v81)
        {
          int v83 = *(_DWORD *)&v229[v82];
          goto LABEL_77;
        }
      }
LABEL_78:
      v57[v75] = v66;
      v60[v75] = v67;
      ++v63;
      size_t v55 = v223;
      uint64_t v64 = v220;
      goto LABEL_79;
    }
    if (*((uint64_t *)Value + 9) >= 1)
    {
      uint64_t v68 = 0;
      v69 = v227;
      do
      {
        (&v69[v63])[v68] = *(const char **)(*((void *)Value + 10) + 8 * v68);
        v55[v63 + v68] = *(_DWORD *)(*((void *)Value + 11) + 4 * v68);
        v57[v63 + v68] = v66 | 1;
        v60[v63 + v68++] = v67;
      }
      while (*((void *)Value + 9) > v68);
      v63 += v68;
    }
LABEL_79:
    ++v62;
  }
  while (v62 != v64);
  if (v63 == v24) {
    goto LABEL_128;
  }
  v130 = fsevent_default_log();
  int v25 = (int)v218;
  int v35 = v226;
  LODWORD(v15) = v217;
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
    implementation_callback_rpc_cold_15();
  }
  size_t v55 = v223;
  CFAllocatorRef v19 = v221;
LABEL_133:
  unint64_t v147 = 0;
  unint64_t v148 = *((void *)Value + 21);
  if (v148 == -1) {
    unint64_t v148 = 0;
  }
  if (v15 <= 1) {
    unsigned int v149 = 1;
  }
  else {
    unsigned int v149 = v15;
  }
  uint64_t v150 = 8 * v149;
  do
  {
    if (v60[v147 / 8] > v148) {
      unint64_t v148 = v60[v147 / 8];
    }
    v147 += 8;
  }
  while (v150 != v147);
  *((void *)Value + 21) = v148;
  int v151 = *((_DWORD *)Value + 46);
  if ((v151 & 0x40) != 0)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v19, v219, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      v101 = Mutable;
      if (!v24)
      {
LABEL_175:
        v103 = 0;
        CFArrayRef v102 = 0;
        goto LABEL_176;
      }
      CFAllocatorRef v221 = v19;
      CFIndex v154 = 0;
      int64_t v219 = (int64_t)&v235;
      v218 = &v233;
      *(void *)&long long v153 = 136315394;
      long long v220 = v153;
      v229 = (char *)v35;
      CFMutableArrayRef v224 = Mutable;
      *(void *)&long long v225 = v228;
      v226 = v35;
      while (1)
      {
        v155 = v227[v154];
        int v156 = v223[v154];
        v230 = CFDictionaryCreateMutable(v221, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (!v230) {
          break;
        }
        v157 = caller_path(v155, v156);
        CFStringRef v158 = CFStringCreateWithFileSystemRepresentation(v221, v157);
        if (v158)
        {
          CFStringRef v159 = v158;
          CFDictionaryAddValue(v230, @"path", v158);
          CFRelease(v159);
          int v35 = v226;
          v101 = v224;
        }
        else
        {
          os_log_t v222 = (os_log_t)fsevent_default_log();
          int v35 = v226;
          v101 = v224;
          if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v220;
            v237 = "implementation_callback_rpc";
            __int16 v238 = 2080;
            v239 = v157;
            _os_log_error_impl(&dword_210AF7000, v222, OS_LOG_TYPE_ERROR, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", buf, 0x16u);
          }
        }
        if ((*(_DWORD *)&a5[4 * v154] & 0x77FF00) != 0)
        {
          if (v35 && *(void *)v229)
          {
            CFNumberRef v160 = CFNumberCreate(v221, kCFNumberSInt64Type, v229);
            if (v160)
            {
              CFNumberRef v161 = v160;
              CFDictionaryAddValue(v230, @"fileID", v160);
              CFRelease(v161);
            }
            else
            {
              v162 = fsevent_default_log();
              if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR)) {
                implementation_callback_rpc_cold_11(v234, (void *)v219, v162);
              }
            }
          }
          if (v228 && *(_DWORD *)v225)
          {
            CFNumberRef v163 = CFNumberCreate(v221, kCFNumberSInt32Type, (const void *)v225);
            if (v163)
            {
              CFNumberRef v164 = v163;
              CFDictionaryAddValue(v230, @"docID", v163);
              CFRelease(v164);
            }
            else
            {
              v165 = fsevent_default_log();
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR)) {
                implementation_callback_rpc_cold_11(v232, v218, v165);
              }
            }
          }
        }
        CFArraySetValueAtIndex(v101, v154, v230);
        CFRelease(v230);
        ++v154;
        *(void *)&long long v225 = v225 + 4;
        v229 += 8;
        if (v24 == v154) {
          goto LABEL_175;
        }
      }
      v188 = fsevent_default_log();
      if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR)) {
        implementation_callback_rpc_cold_10(v188, v189, v190, v191, v192, v193, v194, v195);
      }
      CFArrayRef v102 = 0;
      v103 = 0;
      uint64_t v44 = 4294967281;
      int v35 = v226;
      v101 = v224;
      goto LABEL_210;
    }
    v180 = fsevent_default_log();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_9(v180, v181, v182, v183, v184, v185, v186, v187);
    }
    v101 = 0;
    CFArrayRef v102 = 0;
    v103 = 0;
LABEL_191:
    uint64_t v44 = 4294967282;
    goto LABEL_210;
  }
  if (v151)
  {
    v166 = (const void **)malloc_type_calloc(v24, 8uLL, 0x6004044C4A2DFuLL);
    if (!v166)
    {
      v196 = fsevent_default_log();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR)) {
        implementation_callback_rpc_cold_6(v196, v197, v198, v199, v200, v201, v202, v203);
      }
      v101 = 0;
      CFArrayRef v102 = 0;
      v103 = 0;
      uint64_t v44 = 4294967284;
      goto LABEL_210;
    }
    v103 = v166;
    v226 = v35;
    if (v24)
    {
      uint64_t v167 = 0;
      while (1)
      {
        v168 = caller_path(v227[v167], v55[v167]);
        CFStringRef v169 = CFStringCreateWithFileSystemRepresentation(v19, v168);
        if (!v169) {
          break;
        }
        v103[v167++] = v169;
        if (v24 == v167) {
          goto LABEL_173;
        }
      }
      v204 = fsevent_default_log();
      if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR)) {
        implementation_callback_rpc_cold_8();
      }
      v101 = 0;
      CFArrayRef v102 = 0;
      uint64_t v44 = 4294967283;
      int v35 = v226;
      goto LABEL_210;
    }
LABEL_173:
    CFArrayRef v170 = CFArrayCreate(v19, v103, v24, MEMORY[0x263EFFF70]);
    if (v170)
    {
      CFArrayRef v102 = v170;
      v101 = 0;
      int v35 = v226;
      goto LABEL_176;
    }
    v205 = fsevent_default_log();
    int v35 = v226;
    if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_7(v205, v206, v207, v208, v209, v210, v211, v212);
    }
    v101 = 0;
    CFArrayRef v102 = 0;
    goto LABEL_191;
  }
  v103 = 0;
  CFArrayRef v102 = 0;
  v101 = 0;
LABEL_176:
  if (*((void *)Value + 2) && Value[188] && !Value[189])
  {
    FSEventStreamRetain((FSEventStreamRef)Value);
    int v171 = *((_DWORD *)Value + 46);
    if ((v171 & 0x40) != 0)
    {
      (*((void (**)(char *, void, size_t, __CFArray *, _DWORD *, void *))Value + 2))(Value, *((void *)Value + 4), v24, v101, v57, v60);
    }
    else if (v171)
    {
      (*((void (**)(char *, void, size_t, CFArrayRef, _DWORD *, void *))Value + 2))(Value, *((void *)Value + 4), v24, v102, v57, v60);
    }
    else
    {
      CFMutableArrayRef v224 = v101;
      v226 = v35;
      LODWORD(v218) = v25;
      v229 = (char *)&v215;
      MEMORY[0x270FA5388]();
      if (v216 >= 0x200) {
        size_t v173 = 512;
      }
      else {
        size_t v173 = v216;
      }
      v230 = (__CFDictionary *)((char *)&v215 - ((v172 + 15) & 0xFFFFFFFF0));
      bzero(v230, v173);
      if (v24)
      {
        size_t v174 = v24;
        v175 = v230;
        v176 = v223;
        v177 = v227;
        do
        {
          v179 = *v177++;
          v178 = v179;
          LODWORD(v179) = *v176++;
          *(void *)v175 = caller_path(v178, (char)v179);
          v175 = (__CFDictionary *)((char *)v175 + 8);
          --v174;
        }
        while (v174);
      }
      (*((void (**)(char *, void, size_t, __CFDictionary *, _DWORD *, void *))Value + 2))(Value, *((void *)Value + 4), v24, v230, v57, v60);
      int v25 = (int)v218;
      int v35 = v226;
      v101 = v224;
    }
    if (*((void *)Value + 45))
    {
      pthread_mutex_lock((pthread_mutex_t *)(Value + 240));
      pthread_cond_signal((pthread_cond_t *)(Value + 304));
      pthread_mutex_unlock((pthread_mutex_t *)(Value + 240));
    }
    FSEventStreamRelease((FSEventStreamRef)Value);
  }
  uint64_t v44 = 0;
LABEL_210:
  free(v227);
  if (v57 && v25) {
    free(v57);
  }
  if (v60 && v25) {
    free(v60);
  }
  if (v103)
  {
    if (v24)
    {
      v213 = v103;
      do
      {
        if (!*v213) {
          break;
        }
        CFRelease(*v213++);
        --v24;
      }
      while (v24);
    }
    free(v103);
  }
  if (v102) {
    CFRelease(v102);
  }
  if (v101) {
    CFRelease(v101);
  }
  v92 = v223;
LABEL_227:
  if (v35) {
    free(v35);
  }
  free(v92);
  return v44;
}

uint64_t watch_path(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v10 = 0;
  uint64_t v55 = *MEMORY[0x263EF8340];
  memset(&v42, 0, sizeof(v42));
  int v11 = -1;
  memset(&v41, 0, sizeof(v41));
  int v12 = 1;
  BOOL v13 = 1;
  uint64_t v14 = 0xFFFFFFFFLL;
  while (1)
  {
    unsigned int v15 = v10;
    int v10 = v12;
    realpath_DARWIN_EXTSN(a3, &__s);
    if (v53)
    {
      int v16 = 0;
      while (1)
      {
        int v17 = open(&__s, 0x8000);
        if ((v17 & 0x80000000) == 0) {
          break;
        }
        __error();
        my_dirname(&__s, v54);
        realpath_DARWIN_EXTSN(v54, &__s);
        ++v16;
        if (!v53) {
          goto LABEL_8;
        }
      }
      int v11 = v17;
LABEL_11:
      uint64_t v14 = 0;
      goto LABEL_12;
    }
    int v16 = 0;
    if (v11 < 0)
    {
LABEL_8:
      int v11 = open(&__s, 0x8000);
      if (v11 < 0)
      {
        int8x8_t v30 = fsevent_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_2();
        }
        __error();
        int v32 = fsevent_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_1();
        }
        uint64_t v14 = *__error();
        goto LABEL_45;
      }
      goto LABEL_11;
    }
LABEL_12:
    fcntl(v11, 2, 1);
    if (v13 || (int v18 = open(&__s, 0), v18 < 0))
    {
      unsigned int v20 = v15;
    }
    else
    {
      int v19 = v18;
      fstat(v11, &v42);
      fstat(v19, &v41);
      close(v19);
      close(v11);
      if (v42.st_ino == v41.st_ino)
      {
        int v33 = fsevent_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_3();
        }
        int v11 = -1;
        goto LABEL_45;
      }
      unsigned int v20 = v15;
      int v11 = -1;
    }
    *(void *)a4 = v11;
    *(void *)(a4 + 8) = 0x270021FFFCLL;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = a6;
    uint64_t v14 = kevent(a2, (const kevent *)a4, 1, 0, 0, 0);
    if ((v14 & 0x80000000) != 0)
    {
      CFNumberRef v21 = fsevent_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(a5 + 24);
        unsigned int v26 = __error();
        int v27 = strerror(*v26);
        *(_DWORD *)stat buf = 136316162;
        uint64_t v44 = a1;
        __int16 v45 = 2080;
        p_s = "watch_path";
        __int16 v47 = 1024;
        int v48 = v11;
        __int16 v49 = 2080;
        *(void *)uint64_t v50 = v37;
        *(_WORD *)&v50[8] = 2080;
        v51[0] = v27;
        _os_log_error_impl(&dword_210AF7000, v21, OS_LOG_TYPE_ERROR, "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
          buf,
          0x30u);
      }
    }
    uint64_t v22 = *(unsigned int *)(a5 + 4);
    if ((v22 & 0x80000000) == 0)
    {
      *(void *)a4 = v22;
      *(void *)(a4 + 8) = 0x270002FFFCLL;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = a6;
      uint64_t v14 = kevent(a2, (const kevent *)a4, 1, 0, 0, 0);
      if ((v14 & 0x80000000) != 0)
      {
        uint64_t v23 = fsevent_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v38 = *(_DWORD *)(a5 + 4);
          int v28 = __error();
          int8x16_t v29 = strerror(*v28);
          *(_DWORD *)stat buf = 136315906;
          uint64_t v44 = a1;
          __int16 v45 = 2080;
          p_s = "watch_path";
          __int16 v47 = 1024;
          int v48 = v38;
          __int16 v49 = 2080;
          *(void *)uint64_t v50 = v29;
          _os_log_error_impl(&dword_210AF7000, v23, OS_LOG_TYPE_ERROR, "%s: %s: error removing fd %d from kqueue (%s)", buf, 0x26u);
        }
      }
      close(*(_DWORD *)(a5 + 4));
    }
    *(_DWORD *)a5 = *(_DWORD *)a5 & 0xFFFFFFFE | (v16 != 0);
    *(_DWORD *)(a5 + 4) = v11;
    int v24 = open(&__s, 0);
    if (v24 < 0) {
      break;
    }
    fstat(v11, &v42);
    fstat(v24, &v41);
    close(v24);
    if (v42.st_ino == v41.st_ino) {
      goto LABEL_39;
    }
    int v25 = fsevent_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136315394;
      uint64_t v44 = "watch_path";
      __int16 v45 = 2080;
      p_s = &__s;
      _os_log_error_impl(&dword_210AF7000, v25, OS_LOG_TYPE_ERROR, "%s: watching path(%s) renamed while registering watchroot", buf, 0x16u);
    }
LABEL_30:
    BOOL v13 = v24 >= 0;
    int v12 = v10 + 1;
    if (v10 == 1000)
    {
      int v10 = 1001;
      goto LABEL_45;
    }
  }
  if ((*(_DWORD *)a5 & 5) != 4) {
    goto LABEL_30;
  }
  if (!fcntl(*(_DWORD *)(a5 + 4), 50, buf))
  {
    free(*(void **)(a5 + 24));
    *(void *)(a5 + 24) = strdup((const char *)buf);
  }
LABEL_39:
  if (v20 <= 0x3E6 && (v11 & 0x80000000) == 0) {
    return 0;
  }
LABEL_45:
  int v34 = fsevent_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = strerror(v14);
    *(_DWORD *)stat buf = 136316418;
    uint64_t v44 = "watch_path";
    __int16 v45 = 2080;
    p_s = (char *)a3;
    __int16 v47 = 1024;
    int v48 = v11;
    __int16 v49 = 1024;
    *(_DWORD *)uint64_t v50 = v10;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v14;
    LOWORD(v51[0]) = 2080;
    *(void *)((char *)v51 + 2) = v36;
    _os_log_error_impl(&dword_210AF7000, v34, OS_LOG_TYPE_ERROR, "%s: watching path (%s) fd(%d) retry (%d) failed (%d):(%s)", buf, 0x32u);
  }
  return v14;
}

char *my_dirname(char *__s, char *a2)
{
  if (__s && *__s && (int v4 = strrchr(__s, 47)) != 0)
  {
    if (v4 > __s)
    {
      while (*v4 == 47)
      {
        if (--v4 <= __s)
        {
          int v4 = __s;
          break;
        }
      }
    }
    uint64_t v5 = v4 - __s;
    if (v4 - __s > 1023)
    {
      strncpy(a2, __s, 0x3FFuLL);
      a2[1023] = 0;
    }
    else
    {
      uint64_t v6 = v5 + 1;
      strncpy(a2, __s, v5 + 1);
      a2[v6] = 0;
    }
  }
  else
  {
    strcpy(a2, "./");
  }
  return a2;
}

const char *caller_path(const char *a1, char a2)
{
  uintptr_t v2 = a1;
  if (!(a2 & 3 | strncmp(a1, "/System/Volumes/Data/", 0x15uLL)))
  {
    if (!strncmp(v2 + 20, "/Device/", 8uLL)) {
      v2 += 27;
    }
    else {
      v2 += 20;
    }
  }
  return v2;
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    if ((int)atomic_fetch_add((atomic_uint *volatile)streamRef, 0xFFFFFFFF) <= 1)
    {
      if ((*(_DWORD *)streamRef & 0x80000000) != 0)
      {
        uintptr_t v2 = fsevent_default_log();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
          FSEventStreamRelease_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
        }
      }
      else
      {
        _FSEventStreamDeallocate((char *)streamRef);
      }
    }
  }
  else
  {
    uint64_t v1 = fsevent_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      FSEventStreamRelease_cold_1();
    }
  }
}

void FSEventStreamRetain(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    atomic_fetch_add((atomic_uint *volatile)streamRef, 1u);
  }
  else
  {
    uint64_t v1 = fsevent_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      FSEventStreamRetain_cold_1();
    }
  }
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)_FSEventStreamCreate("FSEventStreamCreate", allocator, (uint64_t)callback, (long long *)&context->version, 0, pathsToWatch, sinceWhen, (unint64_t)(latency * 1000000.0), flags);
}

char *_FSEventStreamCreate(const char *a1, const __CFAllocator *Default, uint64_t a3, long long *a4, int a5, CFArrayRef theArray, uint64_t a7, uint64_t a8, int a9)
{
  v81[127] = *MEMORY[0x263EF8340];
  if ((a9 & 0x41) == 0x40)
  {
    uint64_t v9 = fsevent_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_1();
    }
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if ((const __CFAllocator *)*MEMORY[0x263EFFB08] == Default) {
    Default = CFAllocatorGetDefault();
  }
  int v16 = (char *)CFAllocatorAllocate(Default, 456, 0);
  if (!v16)
  {
    __int16 v49 = fsevent_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_2((uint64_t)a1, v49);
    }
    return 0;
  }
  int v17 = v16;
  *((void *)v16 + 56) = 0;
  *((_OWORD *)v16 + 26) = 0u;
  *((_OWORD *)v16 + 27) = 0u;
  *((_OWORD *)v16 + 24) = 0u;
  *((_OWORD *)v16 + 25) = 0u;
  *((_OWORD *)v16 + 22) = 0u;
  *((_OWORD *)v16 + 23) = 0u;
  *((_OWORD *)v16 + 20) = 0u;
  *((_OWORD *)v16 + 21) = 0u;
  *((_OWORD *)v16 + 18) = 0u;
  *((_OWORD *)v16 + 19) = 0u;
  *((_OWORD *)v16 + 16) = 0u;
  *((_OWORD *)v16 + 17) = 0u;
  *((_OWORD *)v16 + 14) = 0u;
  *((_OWORD *)v16 + 15) = 0u;
  *((_OWORD *)v16 + 12) = 0u;
  *((_OWORD *)v16 + 13) = 0u;
  *((_OWORD *)v16 + 10) = 0u;
  *((_OWORD *)v16 + 11) = 0u;
  *((_OWORD *)v16 + 8) = 0u;
  *((_OWORD *)v16 + 9) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 7) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *(_OWORD *)int v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((void *)v16 + 1) = Default;
  CFRetain(Default);
  *((void *)v17 + 2) = a3;
  if (a4)
  {
    long long v18 = *a4;
    long long v19 = a4[1];
    *((void *)v17 + 7) = *((void *)a4 + 4);
    *(_OWORD *)(v17 + 40) = v19;
    *(_OWORD *)(v17 + 24) = v18;
  }
  unsigned int v20 = (void (*)(void))*((void *)v17 + 5);
  if (v20) {
    v20(*((void *)v17 + 4));
  }
  *((_DWORD *)v17 + 16) = a5;
  *((void *)v17 + 9) = Count;
  *((void *)v17 + 10) = CFAllocatorAllocate(Default, 8 * Count, 0);
  *((void *)v17 + 11) = CFAllocatorAllocate(Default, 4 * Count, 0);
  CFNumberRef v21 = (void *)*((void *)v17 + 10);
  if (!v21)
  {
    uint64_t v50 = fsevent_default_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_3((uint64_t)a1);
    }
    goto LABEL_89;
  }
  bzero(v21, 8 * Count);
  bzero(*((void **)v17 + 11), 4 * Count);
  if ((a9 & 4) == 0)
  {
    *((_DWORD *)v17 + 102) = -1;
    goto LABEL_14;
  }
  int v51 = kqueue();
  *((_DWORD *)v17 + 102) = v51;
  if (v51 < 0)
  {
    long long v54 = fsevent_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_7();
    }
    goto LABEL_89;
  }
  uint64_t v52 = CFAllocatorAllocate(Default, 32 * Count, 0);
  *((void *)v17 + 49) = v52;
  if (!v52)
  {
    uint64_t v55 = fsevent_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_8((uint64_t)a1);
    }
    goto LABEL_89;
  }
  bzero(v52, 32 * Count);
  char v53 = CFAllocatorAllocate(Default, 32 * Count, 0);
  *((void *)v17 + 50) = v53;
  if (!v53)
  {
    long long v59 = fsevent_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_9((uint64_t)a1);
    }
LABEL_89:
    _FSEventStreamDeallocate(v17);
    return 0;
  }
  bzero(v53, 32 * Count);
LABEL_14:
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(ValueAtIndex))
      {
        int v56 = fsevent_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_6(i, (uint64_t)a1);
        }
        goto LABEL_89;
      }
      if (!CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024))
      {
        v57 = fsevent_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_4();
        }
        goto LABEL_89;
      }
      if (a5)
      {
        int v25 = 1000;
        while (1)
        {
          int v26 = getfsstat(0, 0, 2);
          if (v26 < 0) {
            goto LABEL_33;
          }
          int v27 = 2168 * (v26 + 1);
          int v28 = (statfs *)malloc_type_malloc(2168 * (v26 + 1), 0xD7006919uLL);
          if (!v28) {
            goto LABEL_33;
          }
          int8x16_t v29 = v28;
          unsigned int v30 = getfsstat(v28, v27, 2);
          if ((v30 & 0x80000000) == 0) {
            break;
          }
          free(v29);
          if (!--v25) {
            goto LABEL_33;
          }
        }
        if (!v30)
        {
LABEL_33:
          unsigned __int32 v31 = buffer;
          __strlcpy_chk();
LABEL_34:
          *(_DWORD *)(*((void *)v17 + 11) + 4 * i) |= 2u;
          goto LABEL_35;
        }
        uint64_t v32 = 0;
        while (1)
        {
          int v33 = &v29[v32];
          if (v29[v32].f_fsid.val[0] == a5) {
            break;
          }
          if (v30 == ++v32)
          {
            unsigned __int32 v31 = buffer;
            __strlcpy_chk();
LABEL_64:
            free(v29);
            goto LABEL_34;
          }
        }
        f_mntonname = v33->f_mntonname;
        snprintf(__s, 0x400uLL, "%s/%s", v33->f_mntonname, buffer);
        if (realpath_DARWIN_EXTSN(__s, __s1))
        {
          size_t v47 = strlen(f_mntonname);
          if (__s1[v47] == 47) {
            unsigned __int32 v31 = &__s1[v47 + 1];
          }
          else {
            unsigned __int32 v31 = &__s1[v47];
          }
          goto LABEL_64;
        }
        free(v29);
      }
      else
      {
        unsigned __int32 v31 = __s1;
        if (fsevent_realpath(buffer, __s1)) {
          goto LABEL_35;
        }
      }
      if (buffer[0] == 47)
      {
        unsigned __int32 v31 = buffer;
        __strlcpy_chk();
      }
      else
      {
        unsigned __int32 v31 = __s1;
        getcwd(__s1, 0x400uLL);
        __strlcat_chk();
        __strlcat_chk();
      }
LABEL_35:
      size_t v34 = (int)(strlen(v31) + 1);
      *(void *)(*((void *)v17 + 10) + 8 * i) = CFAllocatorAllocate(Default, v34, 0);
      int v35 = *(char **)(*((void *)v17 + 10) + 8 * i);
      if (!v35)
      {
        v58 = fsevent_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_5((uint64_t)a1);
        }
        goto LABEL_89;
      }
      strlcpy(v35, v31, v34);
      if (*(void *)buffer == 0x2F6D65747379532FLL
        && v81[0] == 0x2F73656D756C6F56
        && *(void *)((char *)v81 + 5) == 0x2F617461442F7365)
      {
        *(_DWORD *)(*((void *)v17 + 11) + 4 * i) |= 1u;
        if ((a9 & 4) == 0) {
          continue;
        }
      }
      else if ((a9 & 4) == 0)
      {
        continue;
      }
      uint64_t v38 = *((void *)v17 + 49);
      CFIndex v39 = v38 + 32 * i;
      *(_DWORD *)(v39 + 4) = -1;
      if (!*((_DWORD *)v17 + 16) || __s1[0] == 47)
      {
        *(void *)(v39 + 24) = strdup(__s1);
      }
      else
      {
        if (!realpath_DARWIN_EXTSN(*(const char **)(*((void *)v17 + 10) + 8 * i), __s))
        {
          getcwd(__s, 0x400uLL);
          int v40 = strlen(__s);
          __s[v40] = 47;
          strlcpy(&__s[v40 + 1], *(const char **)(*((void *)v17 + 10) + 8 * i), 1024 - (v40 + 1));
        }
        *(void *)(*((void *)v17 + 49) + 32 * i + 24) = strdup(__s);
        uint64_t v38 = *((void *)v17 + 49);
      }
      stat v41 = (_DWORD *)(v38 + 32 * i);
      *stat v41 = 8;
      int v42 = watch_path(a1, *((_DWORD *)v17 + 102), __s1, *((void *)v17 + 50) + 32 * i, (uint64_t)v41, i);
      if (v42)
      {
        int v43 = v42;
        uint64_t v44 = fsevent_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          int v48 = strerror(v43);
          *(_DWORD *)char __s = 136316674;
          uint64_t v68 = a1;
          __int16 v69 = 2080;
          unsigned int v70 = "_FSEventStreamCreate";
          __int16 v71 = 2080;
          BOOL v72 = v31;
          __int16 v73 = 2080;
          *(void *)v74 = __s1;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = i;
          __int16 v75 = 1024;
          int v76 = v43;
          __int16 v77 = 2080;
          int v78 = v48;
          _os_log_error_impl(&dword_210AF7000, v44, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: watch_path() failed for srcPath='%s' resolvedPath='%s' index=%d (%d):(%s)", (uint8_t *)__s, 0x40u);
        }
        if ((v43 - 23) < 2) {
          goto LABEL_89;
        }
      }
      int v45 = watch_all_parents((uint64_t)a1, *((_DWORD *)v17 + 102), __s1, *((void *)v17 + 49) + 32 * i, i);
      if (v45)
      {
        int v60 = v45;
        uint64_t v61 = fsevent_default_log();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          unsigned int v63 = strerror(v60);
          *(_DWORD *)char __s = 136316162;
          uint64_t v68 = a1;
          __int16 v69 = 2080;
          unsigned int v70 = "_FSEventStreamCreate";
          __int16 v71 = 2080;
          BOOL v72 = v31;
          __int16 v73 = 1024;
          *(_DWORD *)v74 = v60;
          *(_WORD *)&v74[4] = 2080;
          *(void *)&v74[6] = v63;
          _os_log_error_impl(&dword_210AF7000, v61, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: watch_all_parents() failed for '%s' (%d):(%s)", (uint8_t *)__s, 0x30u);
        }
        goto LABEL_89;
      }
    }
  }
  *((void *)v17 + 21) = a7;
  *((void *)v17 + 22) = a8;
  *((_DWORD *)v17 + 46) = a9;
  v17[188] = 0;
  v17[190] = a7 != -1;
  *((void *)v17 + 27) = 0;
  *((void *)v17 + 45) = 0;
  *((void *)v17 + 54) = 0;
  *((void *)v17 + 24) = 0;
  *((void *)v17 + 25) = 0;
  *(_DWORD *)int v17 = 1;
  return v17;
}

char *fsevent_realpath(const char *a1, char *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v4 = xmmword_210B032F0;
  memset(v7, 0, 512);
  int v5 = 0;
  int v6 = 32;
  DWORD1(v4) = 0x80000000;
  if (getattrlist(a1, &v4, v7, 0x420uLL, 0x20u) == -1) {
    return 0;
  }
  if (!a2) {
    return (char *)&v7[1] + SDWORD2(v7[1]) + 8;
  }
  strlcpy(a2, (const char *)&v7[1] + SDWORD2(v7[1]) + 8, 0x400uLL);
  return a2;
}

uint64_t f2d_unregister_rpc(int a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x101D600000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_special_reply_port();
      return v4;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v4 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 66106)
    {
      uint64_t v4 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v4 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v4;
        }
      }
    }
    else
    {
      uint64_t v4 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v4;
}

uint64_t f2d_get_current_event_id_rpc(int a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x101D300000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66103)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&msg[32] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

void dispose_f2d_private_port(mach_port_name_t a1)
{
  kern_return_t v3;
  mach_error_t v4;
  NSObject *v5;

  if (a1)
  {
    if (f2d_unregister_rpc(a1))
    {
      uintptr_t v2 = fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        dispose_f2d_private_port_cold_2();
      }
    }
    else
    {
      uint64_t v3 = mach_port_deallocate(*MEMORY[0x263EF8960], a1);
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          dispose_f2d_private_port_cold_1(v4);
        }
      }
    }
  }
}

void dispose_d2f_port(mach_port_name_t name)
{
  kern_return_t v1;
  mach_error_t v2;
  NSObject *v3;

  if (name)
  {
    uint64_t v1 = mach_port_mod_refs(*MEMORY[0x263EF8960], name, 1u, -1);
    if (v1)
    {
      uintptr_t v2 = v1;
      uint64_t v3 = fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        dispose_d2f_port_cold_1(v2);
      }
    }
  }
}

void __create_f2d_private_port_source_block_invoke_2(uint64_t a1)
{
  dispose_f2d_private_port(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  uintptr_t v2 = *(__FSEventStream **)(a1 + 40);

  FSEventStreamRelease(v2);
}

void __create_d2f_port_source_block_invoke_2(uint64_t a1)
{
  dispose_d2f_port(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  uintptr_t v2 = *(__FSEventStream **)(a1 + 40);

  FSEventStreamRelease(v2);
}

void _FSEventStreamUnscheduleFromRunLoops(uint64_t a1)
{
  uintptr_t v2 = *(const void **)(a1 + 224);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 224) = 0;
  }
  uint64_t v3 = *(const void **)(a1 + 232);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 232) = 0;
  }
}

void _FSEventStreamDeallocate(char *ptr)
{
  if (ptr)
  {
    if (*(_DWORD *)ptr)
    {
      uintptr_t v2 = fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        _FSEventStreamDeallocate_cold_4();
      }
    }
    else
    {
      if (ptr[188])
      {
        uint64_t v4 = fsevent_default_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamDeallocate_cold_3();
        }
      }
      if (*((void *)ptr + 27) || *((void *)ptr + 45))
      {
        uint64_t v5 = fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamDeallocate_cold_2();
        }
      }
      CFAllocatorRef v6 = (const __CFAllocator *)*((void *)ptr + 1);
      if (v6)
      {
        BOOL v7 = (void *)*((void *)ptr + 10);
        if (v7)
        {
          uint64_t v8 = *((void *)ptr + 9);
          *((void *)ptr + 9) = 0;
          if ((int)v8 >= 1)
          {
            uint64_t v9 = 0;
            uint64_t v10 = v8;
            do
            {
              uint64_t v11 = *(void **)(*((void *)ptr + 10) + 8 * v9);
              if (v11) {
                CFAllocatorDeallocate(v6, v11);
              }
              uint64_t v12 = *((void *)ptr + 49);
              if (v12)
              {
                BOOL v13 = *(void **)(v12 + 32 * v9 + 24);
                if (v13)
                {
                  free(v13);
                  uint64_t v12 = *((void *)ptr + 49);
                }
                uint64_t v14 = v12 + 32 * v9;
                unsigned int v15 = *(void **)(v14 + 16);
                if (v15)
                {
                  if (*(int *)(v14 + 8) >= 1)
                  {
                    uint64_t v16 = 0;
                    do
                    {
                      close(*(_DWORD *)(*(void *)(v12 + 32 * v9 + 16) + 4 * v16++));
                      uint64_t v12 = *((void *)ptr + 49);
                      uint64_t v17 = v12 + 32 * v9;
                    }
                    while (v16 < *(int *)(v17 + 8));
                    unsigned int v15 = *(void **)(v17 + 16);
                  }
                  free(v15);
                  uint64_t v12 = *((void *)ptr + 49);
                }
                close(*(_DWORD *)(v12 + 32 * v9 + 4));
              }
              ++v9;
            }
            while (v9 != v10);
            BOOL v7 = (void *)*((void *)ptr + 10);
          }
          CFAllocatorDeallocate(v6, v7);
          CFAllocatorDeallocate(v6, *((void **)ptr + 11));
          long long v18 = (void *)*((void *)ptr + 49);
          if (v18) {
            CFAllocatorDeallocate(v6, v18);
          }
          long long v19 = (void *)*((void *)ptr + 50);
          if (v19) {
            CFAllocatorDeallocate(v6, v19);
          }
        }
        for (uint64_t i = 104; i != 168; i += 8)
        {
          CFNumberRef v21 = *(void **)&ptr[i];
          if (v21)
          {
            free(v21);
            *(void *)&ptr[i] = 0;
          }
        }
        *((void *)ptr + 12) = 0;
        uint64_t v22 = *((void *)ptr + 44);
        if (v22) {
          dispatch_release(v22);
        }
        uint64_t v23 = (void (*)(void))*((void *)ptr + 6);
        if (v23) {
          v23(*((void *)ptr + 4));
        }
        *((void *)ptr + 56) = 0;
        *((_OWORD *)ptr + 26) = 0u;
        *((_OWORD *)ptr + 27) = 0u;
        *((_OWORD *)ptr + 24) = 0u;
        *((_OWORD *)ptr + 25) = 0u;
        *((_OWORD *)ptr + 22) = 0u;
        *((_OWORD *)ptr + 23) = 0u;
        *((_OWORD *)ptr + 20) = 0u;
        *((_OWORD *)ptr + 21) = 0u;
        *((_OWORD *)ptr + 18) = 0u;
        *((_OWORD *)ptr + 19) = 0u;
        *((_OWORD *)ptr + 16) = 0u;
        *((_OWORD *)ptr + 17) = 0u;
        *((_OWORD *)ptr + 14) = 0u;
        *((_OWORD *)ptr + 15) = 0u;
        *((_OWORD *)ptr + 12) = 0u;
        *((_OWORD *)ptr + 13) = 0u;
        *((_OWORD *)ptr + 10) = 0u;
        *((_OWORD *)ptr + 11) = 0u;
        *((_OWORD *)ptr + 8) = 0u;
        *((_OWORD *)ptr + 9) = 0u;
        *((_OWORD *)ptr + 6) = 0u;
        *((_OWORD *)ptr + 7) = 0u;
        *((_OWORD *)ptr + 4) = 0u;
        *((_OWORD *)ptr + 5) = 0u;
        *((_OWORD *)ptr + 2) = 0u;
        *((_OWORD *)ptr + 3) = 0u;
        *(_OWORD *)ptr = 0u;
        *((_OWORD *)ptr + 1) = 0u;
        CFAllocatorDeallocate(v6, ptr);
        CFRelease(v6);
      }
    }
  }
  else
  {
    uint64_t v3 = fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamDeallocate_cold_1();
    }
  }
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  FSEventStreamEventId v2 = 0;
  int v0 = FSEvents_connect();
  FSEventStreamEventId result = 0;
  if (!v0)
  {
    f2d_get_current_event_id_rpc(FSEvents_f2d_public_port, &v2);
    return v2;
  }
  return result;
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    if (*((unsigned char *)streamRef + 188))
    {
      if (*((_DWORD *)streamRef + 49))
      {
        FSEventStreamEventId v2 = *((void *)streamRef + 45);
        if (v2 && *((_DWORD *)streamRef + 92) == 3)
        {
          dispatch_suspend(v2);
          *((_DWORD *)streamRef + 92) = 2;
        }
        uint64_t v3 = *((void *)streamRef + 47);
        if (v3)
        {
          cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
          *((_DWORD *)streamRef + 49) = 0;
        }
        uint64_t v4 = (__CFMachPort *)*((void *)streamRef + 26);
        if (v4)
        {
          CFMachPortSetInvalidationCallBack(v4, 0);
          CFMachPortInvalidate(*((CFMachPortRef *)streamRef + 26));
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((void *)streamRef + 26) = 0;
        }
        if (!v3)
        {
          dispose_f2d_private_port(*((_DWORD *)streamRef + 49));
          *((_DWORD *)streamRef + 49) = 0;
        }
        uint64_t v5 = (__CFFileDescriptor *)*((void *)streamRef + 52);
        if (v5) {
          CFFileDescriptorDisableCallBacks(v5, 1uLL);
        }
        CFAllocatorRef v6 = *((void *)streamRef + 54);
        if (v6)
        {
          if (*((_DWORD *)streamRef + 110) == 3)
          {
            dispatch_suspend(v6);
            *((_DWORD *)streamRef + 110) = 2;
          }
        }
        *((unsigned char *)streamRef + 188) = 0;
      }
      else
      {
        uint64_t v8 = fsevent_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          FSEventStreamStop_cold_2();
        }
      }
    }
  }
  else
  {
    BOOL v7 = fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSEventStreamStop_cold_1();
    }
  }
}

uint64_t fsevent_default_log()
{
  if (fsevent_default_log_once != -1) {
    dispatch_once(&fsevent_default_log_once, &__block_literal_global);
  }
  return fsevent_default_log_logger;
}

os_log_t __fsevent_default_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.fsevents", "client");
  fsevent_default_log_logger = (uint64_t)result;
  return result;
}

atomic_uint *_FSEventStreamRetainAndReturnSelf(atomic_uint *a1)
{
  if (a1)
  {
    atomic_fetch_add(a1, 1u);
  }
  else
  {
    FSEventStreamEventId v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamRetainAndReturnSelf_cold_1();
    }
  }
  return a1;
}

CFStringRef FSEventStreamCopyDescription(ConstFSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    uint64_t v17 = fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyDescription_cold_1();
    }
    return 0;
  }
  FSEventStreamEventId v2 = (char *)malloc_type_malloc((*((_DWORD *)streamRef + 18) << 10) + 1024, 0x9B632473uLL);
  if (!v2)
  {
    long long v18 = fsevent_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyDescription_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = &v2[sprintf(v2, "FSEventStreamRef @ %p:\n", streamRef)];
  uint64_t v5 = &v4[sprintf(v4, "   allocator = %p\n", *((const void **)streamRef + 1))];
  CFAllocatorRef v6 = &v5[sprintf(v5, "   callback = %p\n", *((const void **)streamRef + 2))];
  BOOL v7 = &v6[sprintf(v6, "   context = {%lu, %p, %p, %p, %p}\n", *((void *)streamRef + 3), *((const void **)streamRef + 4), *((const void **)streamRef + 5), *((const void **)streamRef + 6), *((const void **)streamRef + 7))];
  uint64_t v8 = &v7[sprintf(v7, "   numPathsToWatch = %lu\n", *((void *)streamRef + 9))];
  uint64_t v9 = &v8[sprintf(v8, "   pathsToWatch = %p\n", *((const void **)streamRef + 10))];
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      v9 += sprintf(v9, "        pathsToWatch[%d] = '%s'\n", v10, *(const char **)(*((void *)streamRef + 10) + 8 * v10));
      ++v10;
    }
    while (*((void *)streamRef + 9) > v10);
  }
  uint64_t v11 = &v9[sprintf(v9, "   latestEventId = %lld\n", *((void *)streamRef + 21))];
  uint64_t v12 = &v11[sprintf(v11, "   latency = %llu (microseconds)\n", *((void *)streamRef + 22))];
  BOOL v13 = &v12[sprintf(v12, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46))];
  int v14 = sprintf(v13, "\trunLoop = %p\n", *((const void **)streamRef + 28));
  sprintf(&v13[v14], "\trunLoopMode = %p\n", *((const void **)streamRef + 29));
  CFStringRef v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, 0x8000100u);
  free(v3);
  return v15;
}

void FSEventsClientPortCallback()
{
  int v0 = fsevent_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    FSEventsClientPortCallback_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

uint64_t server_gone_callback(uint64_t a1, uint64_t a2)
{
  return server_gone_StreamRef_callback(a2);
}

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  if (streamRef) {
    return *((void *)streamRef + 21);
  }
  uint64_t v2 = fsevent_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    FSEventStreamGetLatestEventId_cold_1();
  }
  return 0;
}

dev_t FSEventStreamGetDeviceBeingWatched(ConstFSEventStreamRef streamRef)
{
  if (streamRef) {
    return *((_DWORD *)streamRef + 16);
  }
  uint64_t v2 = fsevent_default_log();
  dev_t result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (result)
  {
    FSEventStreamGetDeviceBeingWatched_cold_1();
    return 0;
  }
  return result;
}

FSEventStreamRef FSEventStreamCreateRelativeToDevice(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, dev_t deviceToWatch, CFArrayRef pathsToWatchRelativeToDevice, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  if (deviceToWatch > 0) {
    return (FSEventStreamRef)_FSEventStreamCreate("FSEventStreamCreateRelativeToDevice", allocator, (uint64_t)callback, (long long *)&context->version, deviceToWatch, pathsToWatchRelativeToDevice, sinceWhen, (unint64_t)(latency * 1000000.0), flags);
  }
  uint64_t v9 = fsevent_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    FSEventStreamCreateRelativeToDevice_cold_1();
  }
  return 0;
}

void FSEventStreamScheduleWithRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (streamRef)
  {
    if (runLoop)
    {
      uint64_t v6 = (mach_port_name_t *)((char *)streamRef + 192);
      if (*((_DWORD *)streamRef + 48))
      {
LABEL_4:
        if (_createAndAddRunLoopSource((int)"FSEventStreamScheduleWithRunLoop", (uint64_t)streamRef, runLoop, runLoopMode))
        {
          uint64_t v7 = fsevent_default_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            FSEventStreamScheduleWithRunLoop_cold_5();
          }
          mach_port_deallocate(*MEMORY[0x263EF8960], *v6);
          mach_port_name_t *v6 = 0;
        }
        else
        {
          *((void *)streamRef + 28) = CFRetain(runLoop);
          *((void *)streamRef + 29) = CFStringCreateCopy(0, runLoopMode);
          if ((*((unsigned char *)streamRef + 184) & 4) != 0)
          {
            context.version = 0;
            context.info = streamRef;
            context.retain = (void *(__cdecl *)(void *))_FSEventStreamRetainAndReturnSelf;
            context.release = (void (__cdecl *)(void *))FSEventStreamRelease;
            context.copyDescription = (CFStringRef (__cdecl *)(void *))FSEventStreamCopyDescription;
            uint64_t v11 = CFFileDescriptorCreate(0, *((_DWORD *)streamRef + 102), 1u, (CFFileDescriptorCallBack)cffd_callback, &context);
            *((void *)streamRef + 52) = v11;
            if (v11)
            {
              RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v11, 0);
              *((void *)streamRef + 53) = RunLoopSource;
              if (RunLoopSource)
              {
                CFRunLoopAddSource(runLoop, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
              }
              else
              {
                uint64_t v23 = fsevent_default_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  FSEventStreamScheduleWithRunLoop_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
                }
                CFFileDescriptorInvalidate(*((CFFileDescriptorRef *)streamRef + 52));
                CFRelease(*((CFTypeRef *)streamRef + 52));
                *((void *)streamRef + 52) = 0;
              }
            }
            else
            {
              CFStringRef v15 = fsevent_default_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                FSEventStreamScheduleWithRunLoop_cold_3(v15, v16, v17, v18, v19, v20, v21, v22);
              }
            }
          }
        }
        return;
      }
      if (!allocate_d2f_port((uint64_t)"FSEventStreamScheduleWithRunLoop", (uint64_t)streamRef))
      {
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        if (!FSEvents_streamDict) {
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v13, 0, MEMORY[0x263EFFF88], 0);
        }
        CFNumberRef v14 = CFNumberCreate(v13, kCFNumberIntType, v6);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v14, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v14);
        goto LABEL_4;
      }
      uint64_t v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        FSEventStreamScheduleWithRunLoop_cold_6();
      }
    }
    else
    {
      uint64_t v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        FSEventStreamScheduleWithRunLoop_cold_2();
      }
    }
  }
  else
  {
    uint64_t v8 = fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      FSEventStreamScheduleWithRunLoop_cold_1();
    }
  }
}

uint64_t _createAndAddRunLoopSource(int a1, uint64_t a2, CFRunLoopRef rl, CFRunLoopMode mode)
{
  mach_port_t v5 = *(_DWORD *)(a2 + 192);
  if (!v5)
  {
    uint64_t v10 = fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_1();
    }
    return 5;
  }
  if (*(void *)(a2 + 200))
  {
    uint64_t v8 = *(__CFRunLoopSource **)(a2 + 216);
    if (!v8)
    {
      uint64_t v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        _createAndAddRunLoopSource_cold_4();
      }
      return 5;
    }
LABEL_11:
    CFRunLoopAddSource(rl, v8, mode);
    return 0;
  }
  memset(&v16, 0, sizeof(v16));
  uint64_t v11 = CFMachPortCreateWithPort(0, v5, (CFMachPortCallBack)FSEventsClientProcessMessageCallback, &v16, 0);
  *(void *)(a2 + 200) = v11;
  if (v11)
  {
    CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, 0);
    *(void *)(a2 + 216) = RunLoopSource;
    if (RunLoopSource)
    {
      uint64_t v8 = RunLoopSource;
      goto LABEL_11;
    }
    CFStringRef v15 = fsevent_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_3();
    }
    CFMachPortInvalidate(*(CFMachPortRef *)(a2 + 200));
    CFRelease(*(CFTypeRef *)(a2 + 200));
    *(void *)(a2 + 200) = 0;
  }
  else
  {
    CFNumberRef v14 = fsevent_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_2();
    }
  }
  mach_port_deallocate(*MEMORY[0x263EF8960], *(_DWORD *)(a2 + 196));
  *(_DWORD *)(a2 + 196) = 0;
  return 5;
}

void cffd_callback(__CFFileDescriptor *a1, int a2, FSEventStreamRef streamRef)
{
  FSEventStreamRetain(streamRef);
  CFFileDescriptorNativeDescriptor NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  process_dir_events(NativeDescriptor, streamRef);
  if (*(int *)streamRef >= 2 && *((unsigned char *)streamRef + 188)) {
    CFFileDescriptorEnableCallBacks(a1, 1uLL);
  }

  FSEventStreamRelease(streamRef);
}

void FSEventStreamUnscheduleFromRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (streamRef)
  {
    if (runLoop)
    {
      mach_port_t v5 = (__CFRunLoopSource *)*((void *)streamRef + 27);
      if (v5)
      {
        CFRunLoopRemoveSource(runLoop, v5, runLoopMode);
        uint64_t v7 = (__CFRunLoopSource *)*((void *)streamRef + 53);
        if (v7) {
          CFRunLoopRemoveSource(runLoop, v7, runLoopMode);
        }
        _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      }
      else
      {
        uint64_t v10 = fsevent_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          FSEventStreamUnscheduleFromRunLoop_cold_3();
        }
      }
    }
    else
    {
      uint64_t v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        FSEventStreamUnscheduleFromRunLoop_cold_2();
      }
    }
  }
  else
  {
    uint64_t v8 = fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      FSEventStreamUnscheduleFromRunLoop_cold_1();
    }
  }
}

void __FSEventStreamSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  uint64_t v2 = *(__FSEventStream **)(a1 + 40);

  FSEventStreamRelease(v2);
}

FSEventStreamEventId FSEventStreamFlushAsync(FSEventStreamRef streamRef)
{
  FSEventStreamEventId v5 = 0;
  if (streamRef)
  {
    if (*((unsigned char *)streamRef + 188))
    {
      if (*((void *)streamRef + 25))
      {
        if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v5))
        {
          uint64_t v1 = fsevent_default_log();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
            FSEventStreamFlushAsync_cold_3();
          }
        }
      }
    }
    else
    {
      uint64_t v3 = fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        FSEventStreamFlushAsync_cold_2();
      }
    }
  }
  else
  {
    uint64_t v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      FSEventStreamFlushAsync_cold_1();
    }
  }
  return v5;
}

void FSEventStreamFlushSync(FSEventStreamRef streamRef)
{
  uint64_t v14 = 0;
  if (streamRef)
  {
    if (*((unsigned char *)streamRef + 188))
    {
      if (*((void *)streamRef + 25) || *((void *)streamRef + 45))
      {
        uint64_t v2 = (__CFRunLoop *)*((void *)streamRef + 28);
        if (v2 || *((void *)streamRef + 45))
        {
          uint64_t v3 = (__CFRunLoopSource *)*((void *)streamRef + 27);
          if (v3 || *((void *)streamRef + 45))
          {
            if (v2)
            {
              CFRunLoopAddSource(v2, v3, @"com.apple.FSEvents");
              uint64_t v13 = 0;
              while (*((unsigned char *)streamRef + 190)
                   && !_runRunLoopOnceForFlushSync((uint64_t)"FSEventStreamFlushSync:1", (uint64_t)streamRef, (int *)&v13 + 1, &v13));
            }
            else
            {
              pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
              while (*((unsigned char *)streamRef + 190))
              {
                if (pthread_cond_wait((pthread_cond_t *)((char *)streamRef + 304), (pthread_mutex_t *)((char *)streamRef + 240)))
                {
                  uint64_t v6 = fsevent_default_log();
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
                    FSEventStreamFlushSync_cold_8();
                  }
                  break;
                }
              }
              pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
            }
            if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v14))
            {
              uint64_t v7 = fsevent_default_log();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                FSEventStreamFlushSync_cold_7();
              }
            }
            if (!v14) {
              goto LABEL_46;
            }
            if (v14 > 0)
            {
              *((void *)streamRef + 56) = v14;
              uint64_t v13 = 0;
              if (*((void *)streamRef + 28))
              {
                while (*((void *)streamRef + 21) < *((void *)streamRef + 56)
                     && !_runRunLoopOnceForFlushSync((uint64_t)"FSEventStreamFlushSync:2", (uint64_t)streamRef, (int *)&v13 + 1, &v13));
              }
              else
              {
                pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
                while (*((void *)streamRef + 21) < *((void *)streamRef + 56))
                {
                  if (pthread_cond_wait((pthread_cond_t *)((char *)streamRef + 304), (pthread_mutex_t *)((char *)streamRef + 240)))
                  {
                    uint64_t v11 = fsevent_default_log();
                    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                      FSEventStreamFlushSync_cold_5();
                    }
                    break;
                  }
                }
                pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
              }
              *((void *)streamRef + 56) = 0;
LABEL_46:
              uint64_t v12 = (__CFRunLoop *)*((void *)streamRef + 28);
              if (v12) {
                CFRunLoopRemoveSource(v12, *((CFRunLoopSourceRef *)streamRef + 27), @"com.apple.FSEvents");
              }
              return;
            }
            uint64_t v8 = fsevent_default_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              FSEventStreamFlushSync_cold_6();
            }
          }
          else
          {
            uint64_t v10 = fsevent_default_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              FSEventStreamFlushSync_cold_4();
            }
          }
        }
        else
        {
          uint64_t v9 = fsevent_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            FSEventStreamFlushSync_cold_3();
          }
        }
      }
    }
    else
    {
      FSEventStreamEventId v5 = fsevent_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        FSEventStreamFlushAsync_cold_2();
      }
    }
  }
  else
  {
    uint64_t v4 = fsevent_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      FSEventStreamFlushSync_cold_1();
    }
  }
}

uint64_t _runRunLoopOnceForFlushSync(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  __int32 v8 = CFRunLoopRunInMode(@"com.apple.FSEvents", 5.0, 1u) - 1;
  uint64_t result = 0;
  switch(v8)
  {
    case 0:
      uint64_t v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        _runRunLoopOnceForFlushSync_cold_1();
      }
      return 1;
    case 1:
      uint64_t v12 = fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        _runRunLoopOnceForFlushSync_cold_2();
      }
      return 1;
    case 2:
      int v13 = *a3;
      if ((*a3 & ~(-1 << *a4)) == 0)
      {
        uint64_t v14 = fsevent_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          double v15 = (double)(*a3 + 1) * 5.0;
          int v16 = 136316162;
          uint64_t v17 = a1;
          __int16 v18 = 2048;
          uint64_t v19 = a2;
          __int16 v20 = 2080;
          uint64_t v21 = "The run loop timed out.";
          __int16 v22 = 1024;
          int v23 = 3;
          __int16 v24 = 2048;
          double v25 = v15;
          _os_log_error_impl(&dword_210AF7000, v14, OS_LOG_TYPE_ERROR, "%s(streamRef = %p): WARNING: CFRunLoopRunInMode() => %s (%d) (%.2f seconds)", (uint8_t *)&v16, 0x30u);
        }
        ++*a4;
        int v13 = *a3;
      }
      uint64_t result = 0;
      *a3 = v13 + 1;
      return result;
    case 3:
      return result;
    default:
      uint64_t v11 = fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315906;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        uint64_t v19 = a2;
        __int16 v20 = 2080;
        uint64_t v21 = "UNKNOWN";
        __int16 v22 = 1024;
        int v23 = 0;
        _os_log_error_impl(&dword_210AF7000, v11, OS_LOG_TYPE_ERROR, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", (uint8_t *)&v16, 0x26u);
      }
      return 1;
  }
}

FSEventStreamEventId FSEventsGetLastEventIdForDeviceBeforeTime(dev_t dev, CFAbsoluteTime time)
{
  FSEventStreamEventId v6 = 0;
  int v4 = FSEvents_connect();
  FSEventStreamEventId result = 0;
  if (!v4)
  {
    f2d_get_last_event_for_device_before_time_rpc(FSEvents_f2d_public_port, dev, (unint64_t)time, &v6);
    return v6;
  }
  return result;
}

Boolean FSEventStreamSetExclusionPaths(FSEventStreamRef streamRef, CFArrayRef pathsToExclude)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)streamRef + 188)) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(pathsToExclude);
  *((void *)streamRef + 12) = Count;
  if (Count && Count <= 8)
  {
    if (Count >= 1)
    {
      CFIndex v6 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(pathsToExclude, v6);
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID != CFGetTypeID(ValueAtIndex) || !CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024)) {
          break;
        }
        if (*((_DWORD *)streamRef + 16) || !fsevent_realpath(buffer, __s1)) {
          __strlcpy_chk();
        }
        *((void *)streamRef + v6++ + 13) = strdup(__s1);
        if (*((void *)streamRef + 12) <= v6) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  else
  {
    Boolean result = 0;
    *((void *)streamRef + 12) = 0;
  }
  return result;
}

Boolean FSEventsPurgeEventsForDeviceUpToEventId(dev_t dev, FSEventStreamEventId eventId)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v16 = 0;
  int v4 = FSEvents_connect();
  LOBYTE(v5) = 0;
  if (!v4)
  {
    v17[0] = 0;
    int v6 = getfsstat(0, 0, 2);
    if ((v6 & 0x80000000) == 0)
    {
      unsigned int v7 = v6;
      int v8 = 2168 * v6;
      uint64_t v9 = (statfs *)malloc_type_malloc(2168 * v6, 0x1156268uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        unsigned int v11 = getfsstat(v9, v8, 2);
        if ((v11 & 0x80000000) == 0)
        {
          uint64_t v12 = v11 >= v7 ? v7 : v11;
          if (v12)
          {
            f_mntonname = v10->f_mntonname;
            while (*((_DWORD *)f_mntonname - 10) != dev)
            {
              f_mntonname += 2168;
              if (!--v12) {
                goto LABEL_14;
              }
            }
            __strlcpy_chk();
          }
        }
LABEL_14:
        free(v10);
      }
    }
    syslog(2, "dev %d (%s) : purging events up to event id %lld", dev, v17, eventId);
    if (f2d_purge_events_for_device_up_to_event_id_rpc(FSEvents_f2d_public_port, dev, eventId, &v16))
    {
      uint64_t v14 = fsevent_default_log();
      BOOL v5 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        FSEventsPurgeEventsForDeviceUpToEventId_cold_1();
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = v16 == 0;
    }
  }
  return v5;
}

void FSEventStreamShow(ConstFSEventStreamRef streamRef)
{
  uint64_t v2 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "FSEventStreamRef @ %p:\n", streamRef);
  if (streamRef)
  {
    fprintf(*v2, "   allocator = %p\n", *((const void **)streamRef + 1));
    fprintf(*v2, "   callback = %p\n", *((const void **)streamRef + 2));
    fprintf(*v2, "   f2d_private_port = 0x%x\n", *((_DWORD *)streamRef + 49));
    fprintf(*v2, "   CFFileDescriptorContext context = {%lu, %p, %p, %p, %p}\n", *((void *)streamRef + 3), *((const void **)streamRef + 4), *((const void **)streamRef + 5), *((const void **)streamRef + 6), *((const void **)streamRef + 7));
    fprintf(*v2, "   numPathsToWatch = %lu\n", *((void *)streamRef + 9));
    fprintf(*v2, "   pathsToWatch = %p\n", *((const void **)streamRef + 10));
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      uint64_t v3 = 0;
      do
      {
        fprintf(*v2, "        pathsToWatch[%d] = '%s'\n", v3, *(const char **)(*((void *)streamRef + 10) + 8 * v3));
        ++v3;
      }
      while (*((void *)streamRef + 9) > v3);
    }
    fprintf(*v2, "   numPathsToExclude = %lu\n", *((void *)streamRef + 12));
    if (*((uint64_t *)streamRef + 12) >= 1)
    {
      uint64_t v4 = 0;
      do
      {
        fprintf(*v2, "        pathsToExclude[%d] = '%s'\n", v4, *((const char **)streamRef + v4 + 13));
        ++v4;
      }
      while (*((void *)streamRef + 12) > v4);
    }
    fprintf(*v2, "   latestEventId = %lld\n", *((void *)streamRef + 21));
    fprintf(*v2, "   latency = %llu (microseconds)\n", *((void *)streamRef + 22));
    fprintf(*v2, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46));
    fprintf(*v2, "   runLoop = %p\n", *((const void **)streamRef + 28));
    fprintf(*v2, "   runLoopMode = %p\n", *((const void **)streamRef + 29));
  }
}

void server_gone_StreamRef_callback(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 189) && (*(void *)(a1 + 360) || *(void *)(a1 + 224)))
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v3 = (mach_port_name_t *)(a1 + 192);
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, (const void *)(a1 + 192));
    pthread_mutex_lock(&FSEvents_streamDict_mutex);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v4);
    pthread_mutex_unlock(&FSEvents_streamDict_mutex);
    CFRelease(v4);
    pthread_mutex_lock(&FSEvents_f2d_public_port_mutex);
    BOOL v5 = (ipc_space_t *)MEMORY[0x263EF8960];
    mach_port_deallocate(*MEMORY[0x263EF8960], FSEvents_f2d_public_port);
    FSEvents_f2d_public_port = 0;
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    uint64_t v6 = *(void *)(a1 + 360);
    if (v6)
    {
      cancel_source((NSObject **)(a1 + 360), (int *)(a1 + 368));
      *(_DWORD *)(a1 + 192) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 376);
    if (v7)
    {
      cancel_source((NSObject **)(a1 + 376), (int *)(a1 + 384));
      *(_DWORD *)(a1 + 196) = 0;
    }
    int v8 = *(__CFRunLoopSource **)(a1 + 216);
    if (v8)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 224), v8, *(CFRunLoopMode *)(a1 + 232));
      CFRelease(*(CFTypeRef *)(a1 + 216));
      *(void *)(a1 + 216) = 0;
    }
    uint64_t v9 = *(__CFMachPort **)(a1 + 208);
    if (v9)
    {
      CFMachPortSetInvalidationCallBack(v9, 0);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 208));
      CFRelease(*(CFTypeRef *)(a1 + 208));
      *(void *)(a1 + 208) = 0;
    }
    if (!v7)
    {
      mach_port_deallocate(*v5, *(_DWORD *)(a1 + 196));
      *(_DWORD *)(a1 + 196) = 0;
    }
    uint64_t v10 = *(__CFMachPort **)(a1 + 200);
    if (v10)
    {
      CFMachPortInvalidate(v10);
      CFRelease(*(CFTypeRef *)(a1 + 200));
      *(void *)(a1 + 200) = 0;
    }
    if (!v6)
    {
      dispose_d2f_port(*v3);
      *uint64_t v3 = 0;
    }
    if (FSEvents_connect())
    {
      unsigned int v11 = fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        server_gone_StreamRef_callback_cold_4();
      }
    }
    else if (allocate_d2f_port((uint64_t)"server_gone_StreamRef_callback", a1))
    {
      uint64_t v12 = fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        server_gone_StreamRef_callback_cold_3();
      }
    }
    else
    {
      int v13 = (int *)(a1 + 196);
      int v14 = register_with_server(a1, (uint64_t)"server_gone_StreamRef_callback", *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 72), *(const void ***)(a1 + 80), -1, *(void *)(a1 + 176), *(_DWORD *)(a1 + 184), (_DWORD *)(a1 + 196));
      if (v14)
      {
        int v15 = v14;
        int v16 = fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          server_gone_StreamRef_callback_cold_2(v13, v15, v16);
        }
      }
      else
      {
        CFNumberRef v17 = CFNumberCreate(v2, kCFNumberIntType, (const void *)(a1 + 192));
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v17, (const void *)a1);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v17);
        if (v6)
        {
          if (create_d2f_port_source(a1)) {
            resume_source(*(NSObject **)(a1 + 360), (int *)(a1 + 368));
          }
          if (create_f2d_private_port_source(a1)) {
            resume_source(*(NSObject **)(a1 + 376), (int *)(a1 + 384));
          }
        }
        else if (*(void *)(a1 + 224))
        {
          context.version = 0;
          context.info = (void *)a1;
          context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
          context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
          context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
          uint64_t v18 = CFMachPortCreateWithPort(0, *(_DWORD *)(a1 + 196), (CFMachPortCallBack)FSEventsClientPortCallback, &context, 0);
          *(void *)(a1 + 208) = v18;
          if (v18)
          {
            CFMachPortSetInvalidationCallBack(v18, (CFMachPortInvalidationCallBack)server_gone_callback);
            _createAndAddRunLoopSource((int)"server_gone_StreamRef_callback", a1, *(CFRunLoopRef *)(a1 + 224), *(CFRunLoopMode *)(a1 + 232));
          }
          else
          {
            uint64_t v19 = fsevent_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              server_gone_StreamRef_callback_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
            }
          }
        }
        FSEventStreamRetain((FSEventStreamRef)a1);
        if (*(uint64_t *)(a1 + 72) >= 1)
        {
          uint64_t v27 = 0;
          do
            root_dir_event_callback(a1, v27++, 5);
          while (*(void *)(a1 + 72) > v27);
        }
        FSEventStreamRelease((FSEventStreamRef)a1);
      }
    }
  }
}

void root_dir_event_callback(uint64_t a1, int a2, int a3)
{
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void (**)(uint64_t, void, uint64_t, const char **, int *, void *))(a1 + 16);
  if (!v3) {
    return;
  }
  uint64_t v6 = caller_path(*(const char **)(*(void *)(a1 + 80) + 8 * a2), *(_DWORD *)(*(void *)(a1 + 88) + 4 * a2));
  uint64_t v38 = v6;
  int v37 = a3;
  v41[0] = 0;
  int v7 = *(_DWORD *)(a1 + 184);
  if ((v7 & 0x40) != 0)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v9 = (__CFString *)CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
    if (v9)
    {
      uint64_t v10 = v9;
      values = v9;
      keys = @"path";
      CFTypeRef cf = CFDictionaryCreate(v8, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (cf)
      {
        CFArrayRef v11 = CFArrayCreate(v8, &cf, 1, MEMORY[0x263EFFF70]);
        if (v11)
        {
          CFArrayRef v12 = v11;
          (*(void (**)(uint64_t, void, uint64_t, CFArrayRef, int *, void *))(a1 + 16))(a1, *(void *)(a1 + 32), 1, v11, &v37, v41);
          CFRelease(v12);
        }
        else
        {
          uint64_t v20 = fsevent_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            root_dir_event_callback_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
          }
        }
        CFRelease(cf);
      }
      else
      {
        uint64_t v18 = fsevent_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          root_dir_event_callback_cold_4();
        }
      }
      CFTypeRef v16 = v10;
      goto LABEL_22;
    }
    CFNumberRef v17 = fsevent_default_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
LABEL_13:
    root_dir_event_callback_cold_1();
    return;
  }
  if ((v7 & 1) == 0)
  {
    v3(a1, *(void *)(a1 + 32), 1, &v38, &v37, v41);
    return;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
  if (!cf)
  {
    uint64_t v19 = fsevent_default_log();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      return;
    }
    goto LABEL_13;
  }
  CFArrayRef v14 = CFArrayCreate(v13, &cf, 1, MEMORY[0x263EFFF70]);
  if (v14)
  {
    CFArrayRef v15 = v14;
    (*(void (**)(uint64_t, void, uint64_t, CFArrayRef, int *, void *))(a1 + 16))(a1, *(void *)(a1 + 32), 1, v14, &v37, v41);
    CFRelease(v15);
    CFTypeRef v16 = cf;
LABEL_22:
    CFRelease(v16);
    return;
  }
  uint64_t v28 = fsevent_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    root_dir_event_callback_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
  }
}

void __create_f2d_private_port_source_block_invoke(uint64_t a1)
{
}

uint64_t watch_all_parents(uint64_t a1, int kq, char *__s, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  memset(&changelist, 0, sizeof(changelist));
  uint64_t v10 = *(void **)(a4 + 16);
  if (v10)
  {
    int v11 = *(_DWORD *)(a4 + 8);
    if (v11 >= 1)
    {
      for (uint64_t i = 0; i < v11; ++i)
      {
        if ((*(_DWORD *)(*(void *)(a4 + 16) + 4 * i) & 0x80000000) == 0)
        {
          changelist.ident = *(unsigned int *)(*(void *)(a4 + 16) + 4 * i);
          *(void *)&changelist.filter = 0x200002FFFCLL;
          changelist.data = 0;
          changelist.int64_t udata = (void *)(a5 | 0x80000000);
          kevent(kq, &changelist, 1, 0, 0, 0);
          close(*(_DWORD *)(*(void *)(a4 + 16) + 4 * i));
          int v11 = *(_DWORD *)(a4 + 8);
        }
      }
      uint64_t v10 = *(void **)(a4 + 16);
    }
    free(v10);
    *(void *)(a4 + 16) = 0;
    *(_DWORD *)(a4 + 8) = 0;
  }
  if (__s && *__s)
  {
    my_dirname(__s, __sa);
    CFAllocatorRef v13 = v39;
    realpath_DARWIN_EXTSN(__sa, v39);
    int v14 = 0;
    do
    {
      while (1)
      {
        int v16 = *v13++;
        int v15 = v16;
        if (v16 != 47) {
          break;
        }
        ++v14;
      }
    }
    while (v15);
    uint64_t v19 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
    *(void *)(a4 + 16) = v19;
    if (v19)
    {
      uint64_t v20 = 0;
      uint64_t v21 = v14;
      *(_DWORD *)(a4 + 8) = v14;
      do
      {
        int v22 = open(v39, 0x8000);
        *(_DWORD *)(*(void *)(a4 + 16) + 4 * v20) = v22;
        if ((v22 & 0x80000000) == 0)
        {
          fcntl(v22, 2, 1);
          changelist.ident = *(int *)(*(void *)(a4 + 16) + 4 * v20);
          *(void *)&changelist.filter = 0x200021FFFCLL;
          changelist.data = 0;
          changelist.int64_t udata = (void *)(a5 | 0x80000000);
          if (kevent(kq, &changelist, 1, 0, 0, 0) < 0)
          {
            uint64_t v23 = fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              int v24 = *(_DWORD *)(*(void *)(a4 + 16) + 4 * v20);
              uint64_t v25 = __error();
              uint64_t v26 = strerror(*v25);
              *(_DWORD *)stat buf = 136316162;
              uint64_t v29 = a1;
              __int16 v30 = 2080;
              uint64_t v31 = "watch_all_parents";
              __int16 v32 = 1024;
              int v33 = v24;
              __int16 v34 = 2080;
              uint64_t v35 = v39;
              __int16 v36 = 2080;
              int v37 = v26;
              _os_log_error_impl(&dword_210AF7000, v23, OS_LOG_TYPE_ERROR, "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
                buf,
                0x30u);
            }
          }
        }
        __strcpy_chk();
        my_dirname(__sa, v39);
        uint64_t result = 0;
        ++v20;
      }
      while (v20 < v21 && v39[1]);
    }
    else
    {
      return 12;
    }
  }
  else
  {
    CFNumberRef v17 = fsevent_default_log();
    uint64_t result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (result)
    {
      watch_all_parents_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t FSEventsClientProcessMessageCallback(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = *MEMORY[0x263EF8340];
  return FSEventsD2F_server(v1, (uint64_t)v3);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t f2d_flush_rpc(int a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x101D100000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66101)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&msg[32] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

uint64_t f2d_get_last_event_for_device_before_time_rpc(int a1, int a2, uint64_t a3, void *a4)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v12 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&msg[32] = a2;
  *(void *)&long long v12 = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x101D400000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x2Cu, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66104)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a4 = v12;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t f2d_purge_events_for_device_up_to_event_id_rpc(int a1, int a2, uint64_t a3, _DWORD *a4)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = a2;
  *(void *)&rcv_name[32] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v11 = 5395;
  *(void *)&rcv_name[12] = 0x101D500000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x2Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 66105)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a4 = *(_DWORD *)&rcv_name[32];
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

void FSEventStreamStart_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamStart_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamStart_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: array_of_path_lengths = malloc() failed", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: array_of_path_offsets = malloc() failed", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: paths_blob = malloc() failed", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_4()
{
  OUTLINED_FUNCTION_12();
  mach_error_string(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14(&dword_210AF7000, v1, v2, "%s: %s: ERROR: f2d_register_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
}

void register_with_server_cold_5()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s:%d Insufficient Memory", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_6()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s:%d Insufficient Memory", v2, v3, v4, v5, 2u);
}

void register_with_server_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void _FSEventStreamRetainAndReturnSelf_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamRelease_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamRelease_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamCopyDescription_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamCopyDescription_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: cStr = malloc() failed", a5, a6, a7, a8, 2u);
}

void FSEventsClientPortCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamStop_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamStop_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void dispose_f2d_private_port_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_24(&dword_210AF7000, v1, v2, "%s: ERROR: mach_port_deallocate(port = 0x%x) => %s (%d)", v3, v4, v5, v6, 2u);
}

void dispose_f2d_private_port_cold_2()
{
  OUTLINED_FUNCTION_18();
  mach_error_string(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: f2d_unregister_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
}

void implementation_callback_rpc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "FSEvents: %s: WARNING: num_paths == 0", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: CFNumberCreate() => NULL", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: CFDictionaryGetValue(FSEvents_streamDict, cfPortNumber) => NULL", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: eventPaths = malloc() failed", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: pathFlags = malloc() failed", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: cfStringRef_eventPaths = calloc() failed", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void implementation_callback_rpc_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", v2, v3, v4, v5, 2u);
}

void implementation_callback_rpc_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: CFArrayCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: CFDictionaryCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_11(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)stat buf = 136315138;
  *a2 = "implementation_callback_rpc";
  _os_log_error_impl(&dword_210AF7000, log, OS_LOG_TYPE_ERROR, "%s: ERROR: CFNumberCreate() => NULL\n", buf, 0xCu);
}

void implementation_callback_rpc_cold_13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: eventFlags = malloc() failed", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_210AF7000, a1, a3, "%s: ERROR: eventIds = malloc() failed", a5, a6, a7, a8, 2u);
}

void implementation_callback_rpc_cold_15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void implementation_callback_rpc_cold_16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void implementation_callback_rpc_cold_17()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void implementation_callback_rpc_cold_18()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamRetain_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamGetLatestEventId_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamGetDeviceBeingWatched_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamCopyPathsBeingWatched_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamCopyPathsBeingWatched_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamCopyPathsBeingWatched_cold_3(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*a1 + 8 * a2);
  int v4 = 136315394;
  uint64_t v5 = "FSEventStreamCopyPathsBeingWatched";
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_210AF7000, log, OS_LOG_TYPE_ERROR, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", (uint8_t *)&v4, 0x16u);
}

void FSEventStreamCopyPathsBeingWatched_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _FSEventStreamCreate_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: parameter error kFSEventStreamCreateFlagUseCFTypes requires  kFSEventStreamCreateFlagUseExtendedData", v2, v3, v4, v5, 2u);
}

void _FSEventStreamCreate_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "_FSEventStreamCreate";
  __int16 v6 = 2048;
  uint64_t v7 = 456;
  _os_log_error_impl(&dword_210AF7000, a2, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: could not allocate %lu bytes for FSEventStream", (uint8_t *)&v2, 0x20u);
}

void _FSEventStreamCreate_cold_3(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_210AF7000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of path strings", (const char *)v3, DWORD2(v3), v4);
}

void _FSEventStreamCreate_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: CFStringGetCString() failed", v2, v3, v4, v5, 2u);
}

void _FSEventStreamCreate_cold_5(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_2();
  *(void *)&v3[14] = "_FSEventStreamCreate";
  OUTLINED_FUNCTION_22(&dword_210AF7000, v1, v2, "%s: %s: ERROR: could not allocate %d bytes for path string (2)", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"_FSEventStreamCreate" >> 16);
}

void _FSEventStreamCreate_cold_6(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)uint64_t v4 = 136315650;
  *(void *)&v4[4] = a2;
  OUTLINED_FUNCTION_2();
  *(void *)&v4[14] = "_FSEventStreamCreate";
  OUTLINED_FUNCTION_22(&dword_210AF7000, v2, v3, "%s: %s: ERROR: (CFStringGetTypeID() != CFGetTypeID(cfStringRef)) (uint64_t i = %d)\n", *(const char **)v4, *(const char **)&v4[8], (unint64_t)"_FSEventStreamCreate" >> 16);
}

void _FSEventStreamCreate_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: could not open kqueue ", v2, v3, v4, v5, 2u);
}

void _FSEventStreamCreate_cold_8(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_210AF7000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of dir_info structs", (const char *)v3, DWORD2(v3), v4);
}

void _FSEventStreamCreate_cold_9(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_210AF7000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of kevents", (const char *)v3, DWORD2(v3), v4);
}

void FSEventStreamCreateRelativeToDevice_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void _FSEventStreamDeallocate_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void _FSEventStreamDeallocate_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void _FSEventStreamDeallocate_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void _FSEventStreamDeallocate_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamScheduleWithRunLoop_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamScheduleWithRunLoop_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamScheduleWithRunLoop_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamScheduleWithRunLoop_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamScheduleWithRunLoop_cold_5()
{
  OUTLINED_FUNCTION_18();
  mach_error_string(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: _createAndAddRunLoopSource(...) => %s (%d)", v3, v4, v5, v6, 2u);
}

void FSEventStreamScheduleWithRunLoop_cold_6()
{
  OUTLINED_FUNCTION_18();
  mach_error_string(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
}

void allocate_d2f_port_cold_1()
{
  OUTLINED_FUNCTION_12();
  mach_error_string(v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14(&dword_210AF7000, v1, v2, "%s: %s: ERROR: mach_port_allocate() => %s (%d)", v3, v4, v5, v6, 2u);
}

void _createAndAddRunLoopSource_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void _createAndAddRunLoopSource_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: CFMachPortCreateWithPort() => NULL", v2, v3, v4, v5, 2u);
}

void _createAndAddRunLoopSource_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: ERROR: CFMachPortCreateRunLoopSource() => NULL", v2, v3, v4, v5, 2u);
}

void _createAndAddRunLoopSource_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamUnscheduleFromRunLoop_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamUnscheduleFromRunLoop_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamUnscheduleFromRunLoop_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamSetDispatchQueue_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamSetDispatchQueue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamSetDispatchQueue_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamSetDispatchQueue_cold_4()
{
  OUTLINED_FUNCTION_18();
  mach_error_string(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
}

void process_dir_events_cold_1(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: kevent returned %d (%s)", v3, v4, v5, v6, 2u);
}

void FSEventStreamFlushAsync_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushAsync_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushAsync_cold_3()
{
  OUTLINED_FUNCTION_18();
  mach_error_string(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: f2d_flush_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
}

void FSEventStreamFlushSync_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushSync_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushSync_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushSync_cold_5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315650;
  OUTLINED_FUNCTION_16();
  *(_DWORD *)&v3[7] = 3370;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_210AF7000, v2, OS_LOG_TYPE_ERROR, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v3, 0x18u);
}

void FSEventStreamFlushSync_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamFlushSync_cold_7()
{
  OUTLINED_FUNCTION_12();
  mach_error_string(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14(&dword_210AF7000, v1, v2, "%s(streamRef = %p): ERROR: f2d_flush_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
}

void FSEventStreamFlushSync_cold_8()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315650;
  OUTLINED_FUNCTION_16();
  *(_DWORD *)&v3[7] = 3329;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_210AF7000, v2, OS_LOG_TYPE_ERROR, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v3, 0x18u);
}

void _runRunLoopOnceForFlushSync_cold_1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_21(&dword_210AF7000, v0, v1, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", v2, v3, v4, v5);
}

void _runRunLoopOnceForFlushSync_cold_2()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_21(&dword_210AF7000, v0, v1, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", v2, v3, v4, v5);
}

void FSEventStreamInvalidate_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamInvalidate_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void FSEventStreamInvalidate_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
}

void dispose_d2f_port_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_24(&dword_210AF7000, v1, v2, "%s: ERROR: mach_port_mod_refs(port = 0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)", v3, v4, v5, v6, 2u);
}

void FSEvents_connect_cold_1()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12();
  bootstrap_strerror(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_210AF7000, v1, v2, "%s: ERROR: FSEvents_connect() => %s (%d)", v3, v4, v5, v6, 2u);
}

void FSEventsCopyUUIDForDevice_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
}

void FSEventsPurgeEventsForDeviceUpToEventId_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s: f2d_purge_events_for_device_up_to_event_id_rpc() failed: %d", v2, v3, v4, v5, 2u);
}

void server_gone_StreamRef_callback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void server_gone_StreamRef_callback_cold_2(int *a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "server_gone_StreamRef_callback";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_210AF7000, log, OS_LOG_TYPE_ERROR, "%s: re-registering with server failed and returned %d (f2d port %u)", (uint8_t *)&v4, 0x18u);
}

void server_gone_StreamRef_callback_cold_3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s: re-allocating d2f port failed and returned %d", v2, v3, v4, v5, 2u);
}

void server_gone_StreamRef_callback_cold_4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s: failed to reconnect to server! (kr 0x%x)", v2, v3, v4, v5, 2u);
}

void root_dir_event_callback_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", v2, v3, v4, v5, 2u);
}

void root_dir_event_callback_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void root_dir_event_callback_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: ERROR: CFDictionaryCreate('%s') failed", v2, v3, v4, v5, 2u);
}

void watch_path_cold_1()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_23(&dword_210AF7000, v1, v2, "%s: %s:2: open('%s', O_RDONLY) failed <3>, errno = %d (%s)", v3, v4, v5, v6, 2u);
}

void watch_path_cold_2()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_23(&dword_210AF7000, v1, v2, "%s: %s:2: open('%s', O_RDONLY) failed <2>, errno = %d (%s)", v3, v4, v5, v6, 2u);
}

void watch_path_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: watching path(%s) renamed and revalidated after watchroot registration", v2, v3, v4, v5, 2u);
}

void watch_all_parents_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_210AF7000, v0, v1, "%s: %s: empty watchpath", v2, v3, v4, v5, 2u);
}

void receive_and_dispatch_rcv_msg_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s: mach_msg <2> - err (%d)", v2, v3, v4, v5, 2u);
}

void receive_and_dispatch_rcv_msg_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_210AF7000, v0, v1, "%s: mach_msg <1> - err (%d)", v2, v3, v4, v5, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x270EE49E8](allocator, *(void *)&fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource(CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE49F0](allocator, f, order);
}

void CFFileDescriptorDisableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return MEMORY[0x270EE4A08](f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x270ED8778]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x270ED8790](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x270ED94F0]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x270ED9BD0](a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x270ED9C08](a1, *(void *)&a2, *(void *)&a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x270EDA4D8]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x270EDA4F0]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

void syslog(int a1, const char *a2, ...)
{
}