@interface HandleNewSecondaryConnection
@end

@implementation HandleNewSecondaryConnection

void __figXPC_HandleNewSecondaryConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x192FC6B30](a2);
  id v5 = FigCFWeakReferenceLoadAndRetain((id *)(*(void *)(a1 + 32) + 16));
  v6 = v5;
  if (v4 != MEMORY[0x1E4F14590])
  {
    if (v4 == MEMORY[0x1E4F145A8])
    {
      xpc_object_t v7 = FigXPCRetain(*(xpc_object_t *)(a1 + 48));
      xpc_object_t v8 = FigXPCRetain(a2);
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = *(NSObject **)(v9 + 128);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __figXPC_HandleNewSecondaryConnection_block_invoke_178;
      block[3] = &__block_descriptor_tmp_179;
      block[4] = v9;
      block[5] = v7;
      block[6] = v8;
      dispatch_async(v10, block);
    }
    if (!v6) {
      return;
    }
LABEL_8:
    CFRelease(v6);
    return;
  }
  if (v5)
  {
    figXPC_HandleMessage(*(void *)(a1 + 40), (int)v5, *(void *)(a1 + 48), a2);
    goto LABEL_8;
  }
  v21[0] = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 0, v21, &type);
  int v12 = v21[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    unsigned int v14 = v12;
  }
  else {
    unsigned int v14 = v12 & 0xFFFFFFFE;
  }
  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 88);
    v21[1] = 136315906;
    v22 = "figXPC_HandleNewSecondaryConnection_block_invoke";
    __int16 v23 = 2080;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    v28 = a2;
    v17 = (char *)_os_log_send_and_compose_impl();
    char v18 = v21[0];
  }
  else
  {
    char v18 = v12;
    v17 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 0, 1, v17, v17 != &v29, v18, 0, v13);
}

void __figXPC_HandleNewSecondaryConnection_block_invoke_178(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 48);
  if (v2 == (void *)MEMORY[0x1E4F14528])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(_xpc_connection_s **)(a1 + 40);
    id v5 = (void *)xpc_connection_copy_invalidation_reason();
    pid_t pid = xpc_connection_get_pid(v3);
    FigSimpleMutexLock(*(pthread_mutex_t **)(v4 + 112));
    Value = (pthread_mutex_t **)CFDictionaryGetValue(*(CFDictionaryRef *)(v4 + 104), (const void *)pid);
    if (Value)
    {
      xpc_object_t v8 = Value;
      FigSimpleMutexLock(Value[10]);
      CFIndex Count = CFArrayGetCount((CFArrayRef)v8[11]);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        CFIndex v11 = 0;
        do
        {
          ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex((CFArrayRef)v8[11], v11);
          if ((_xpc_connection_s *)ValueAtIndex[7] == v3)
          {
            uint64_t v13 = ValueAtIndex;
            FigCFWeakReferenceTableRemoveValue((uint64_t)v8[6], ValueAtIndex[3]);
            figXPC_ForgetNotificationsForServedObject((uint64_t)v8[14], v13);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)v8[11], v11);
            --v10;
          }
          else
          {
            ++v11;
          }
        }
        while (v11 < v10);
      }
      CFArrayRef v14 = (const __CFArray *)v8[18];
      v35.length = CFArrayGetCount(v14);
      v35.location = 0;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v14, v35, v3);
      if (FirstIndexOfValue < 0 || (CFIndex v16 = FirstIndexOfValue, FirstIndexOfValue >= CFArrayGetCount((CFArrayRef)v8[18])))
      {
        v25[0] = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 0, v25, &type);
        int v18 = v25[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          unsigned int v20 = v18;
        }
        else {
          unsigned int v20 = v18 & 0xFFFFFFFE;
        }
        if (v20)
        {
          uint64_t v21 = *(void *)(v4 + 88);
          int v22 = *((_DWORD *)v8 + 4);
          v25[1] = 136315906;
          uint64_t v26 = "figXPC_TerminateSecondaryConnection";
          __int16 v27 = 2048;
          v28 = v3;
          __int16 v29 = 2082;
          uint64_t v30 = v21;
          __int16 v31 = 1024;
          int v32 = v22;
          __int16 v23 = (char *)_os_log_send_and_compose_impl();
          LOBYTE(v18) = v25[0];
        }
        else
        {
          __int16 v23 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose(0, 0, 1, v23, v23 != &v33, v18, 0, v19);
        FigSimpleMutexUnlock(v8[10]);
      }
      else
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)v8[18], v16);
        FigSimpleMutexUnlock(v8[10]);
        xpc_release(v3);
      }
    }
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v4 + 112));
    free(v5);
    v2 = *(void **)(a1 + 48);
  }
  FigXPCRelease(v2);
  FigXPCRelease(*(xpc_object_t *)(a1 + 40));
}

@end