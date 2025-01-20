@interface FigProcessStateMonitor
@end

@implementation FigProcessStateMonitor

void __FigProcessStateMonitor_handleMessage_block_invoke(uint64_t a1)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 1685024867)
  {
    v19 = *(void **)(a1 + 48);
    uint64 = (void *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), ".objectID");
    if (uint64)
    {
      v21 = (int64_t *)FigCFWeakReferenceTableCopyValue(gServedObjects, uint64);
      if (v21)
      {
        v22 = v21;
        xpc_dictionary_set_int64(v19, "ProcessStateMonitorLastPurgeEvent", v21[9]);
        CFRelease(v22);
        int MustNotPurgeClientObjects = 0;
        goto LABEL_28;
      }
LABEL_30:
      uint64_t v27 = 4294947864;
      uint64 = 0;
      goto LABEL_31;
    }
LABEL_29:
    uint64_t v27 = 4294947866;
LABEL_31:
    int MustNotPurgeClientObjects = FigSignalErrorAt(v27, (uint64_t)uint64, 0, 0, 0, 0, 0);
    goto LABEL_28;
  }
  if (v2 == 1835954287)
  {
    v23 = *(void **)(a1 + 40);
    cf[0] = 0;
    uint64 = (void *)xpc_dictionary_get_uint64(v23, ".objectID");
    if (uint64)
    {
      id v24 = FigCFWeakReferenceTableCopyValue(gServedObjects, uint64);
      if (v24)
      {
        uint64_t v8 = (uint64_t)v24;
        int v25 = FigXPCMessageCopyCFString(v23, "ProcessStateMonitorAssertion", cf);
        CFTypeRef v26 = cf[0];
        if (v25)
        {
          int MustNotPurgeClientObjects = v25;
          if (!cf[0]) {
            goto LABEL_27;
          }
        }
        else
        {
          int MustNotPurgeClientObjects = figProcessStateMonitorMustNotPurgeClientObjects(v8, cf[0]);
          CFTypeRef v26 = cf[0];
          if (!cf[0])
          {
LABEL_27:
            CFRelease((CFTypeRef)v8);
            goto LABEL_28;
          }
        }
        CFRelease(v26);
        goto LABEL_27;
      }
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v2 != 1701408885)
  {
    int MustNotPurgeClientObjects = -16158;
    goto LABEL_28;
  }
  v3 = *(_xpc_connection_s **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = (void *)xpc_dictionary_get_uint64(v4, ".objectID");
  if (!v5)
  {
    int MustNotPurgeClientObjects = FigSignalErrorAt(4294947866, 0, 0, 0, 0, 0, 0);
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  v7 = (CFTypeRef *)FigCFWeakReferenceTableCopyValue(gServedObjects, v5);
  uint64_t v8 = (uint64_t)v7;
  if (!v7)
  {
    int v9 = FigSignalErrorAt(4294947864, 0, 0, 0, 0, 0, 0);
    goto LABEL_34;
  }
  int v9 = FigXPCServerCopyMemoryRecipient(v3, v7 + 4);
  if (v9)
  {
LABEL_34:
    int MustNotPurgeClientObjects = v9;
    goto LABEL_9;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int MustNotPurgeClientObjects = FigMemoryRecipientCopyBlockBufferFromXPCMessage((const __CFAllocator *)*MEMORY[0x1E4F1CF80], *(void *)(v8 + 32), v4, "ProcessStateMonitorShmem", (CMBlockBufferRef *)(v8 + 40));
  if (!MustNotPurgeClientObjects)
  {
    int v12 = *(_DWORD *)(v8 + 16);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __figProcessStateMonitorHandleEnrollInPurge_block_invoke;
    v30[3] = &__block_descriptor_40_e8_v12__0i8l;
    v30[4] = v6;
    FigPurgeAndRenewProcessStateTrackerStartTrackingPIDWithBlock(v12, (uint64_t)v30);
    *(unsigned char *)(v8 + 80) = 1;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)(v8 + 88) = CFDateCreate(v10, Current);
  }
LABEL_9:
  if (dword_1E9272DD8)
  {
    int v29 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DD0, 1, &v29, &type);
    int v15 = v29;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v17 = v15;
    }
    else {
      unsigned int v17 = v15 & 0xFFFFFFFE;
    }
    if (v17)
    {
      int v31 = 136315394;
      v32 = "figProcessStateMonitorHandleEnrollInPurge";
      __int16 v33 = 2114;
      uint64_t v34 = v8;
      v18 = (CFTypeRef *)_os_log_send_and_compose_impl();
      LOBYTE(v15) = v29;
    }
    else
    {
      v18 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DD0, 1u, 1, v18, v18 != cf, v15, 0, v16);
  }
  if (v8) {
    goto LABEL_27;
  }
LABEL_28:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = MustNotPurgeClientObjects;
}

void __FigProcessStateMonitor_noReplyHandleMessage_block_invoke(uint64_t a1)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 != 1836082031)
  {
    if (v1 == 1684632432)
    {
      int v2 = *(_xpc_connection_s **)(a1 + 32);
      uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), ".objectID");
      FigXPCServerDisassociateObjectWithConnection(v2, uint64);
      if (dword_1E9272DD8)
      {
        v18[0] = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DD0, 1, v18, &type);
        int v5 = v18[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          unsigned int v7 = v5;
        }
        else {
          unsigned int v7 = v5 & 0xFFFFFFFE;
        }
        if (v7)
        {
          pid_t pid = xpc_connection_get_pid(v2);
          v18[1] = 136315650;
          v19 = "figProcessStateMonitorHandleDispose";
          __int16 v20 = 1024;
          pid_t v21 = pid;
          __int16 v22 = 2048;
          uint64_t v23 = uint64;
          int v9 = (CFTypeRef *)_os_log_send_and_compose_impl();
          LOBYTE(v5) = v18[0];
        }
        else
        {
          int v9 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DD0, 1u, 1, v9, v9 != cf, v5, 0, v6);
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -16158;
    }
    return;
  }
  CFAllocatorRef v10 = *(void **)(a1 + 40);
  cf[0] = 0;
  v11 = (void *)xpc_dictionary_get_uint64(v10, ".objectID");
  if (!v11)
  {
    uint64_t v16 = 4294947866;
LABEL_22:
    FigSignalErrorAt(v16, 0, 0, 0, 0, 0, 0);
    return;
  }
  id v12 = FigCFWeakReferenceTableCopyValue(gServedObjects, v11);
  if (!v12)
  {
    uint64_t v16 = 4294947864;
    goto LABEL_22;
  }
  v13 = v12;
  int v14 = FigXPCMessageCopyCFString(v10, "ProcessStateMonitorAssertion", cf);
  CFTypeRef v15 = cf[0];
  if (!v14)
  {
    figProcessStateMonitorMayPurgeClientObjects((uint64_t)v13, cf[0]);
    CFTypeRef v15 = cf[0];
  }
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(v13);
}

@end