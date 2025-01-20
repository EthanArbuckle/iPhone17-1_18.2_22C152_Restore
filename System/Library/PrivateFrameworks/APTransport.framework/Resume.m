@interface Resume
@end

@implementation Resume

void __stream_Resume_block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTransportStreamUnbuffered <= 30
    && (gLogCategory_APTransportStreamUnbuffered != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    int v14 = -16617;
    goto LABEL_27;
  }
  if (*(unsigned char *)(DerivedStorage + 25)) {
    goto LABEL_24;
  }
  uint64_t v4 = *(void *)DerivedStorage;
  if (*(void *)DerivedStorage == 1935897198) {
    APSEventRecorderRecordEventWithFlags();
  }
  uint64_t v5 = *(void *)(DerivedStorage + 40);
  uint64_t v6 = *(void *)(DerivedStorage + 104);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, const void *, uint64_t (*)(int, const void *, const void *), uint64_t, void))(v8 + 16);
  if (!v9)
  {
    int v14 = -12782;
LABEL_26:
    APSLogErrorAt();
    goto LABEL_27;
  }
  int v10 = v9(v5, v2, stream_handleEventFromSendConnection, v6, 0);
  if (v10)
  {
    int v14 = v10;
    goto LABEL_26;
  }
  uint64_t v11 = *(void *)(DerivedStorage + 40);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v15 = *(uint64_t (**)(uint64_t))(v13 + 8);
  if (!v15)
  {
    int v14 = -12782;
    goto LABEL_26;
  }
  int v16 = v15(v11);
  if (v16)
  {
    int v14 = v16;
    goto LABEL_26;
  }
  if (v4 == 1935897198) {
    APSEventRecorderRecordEventWithFlags();
  }
  *(unsigned char *)(DerivedStorage + 25) = 1;
  uint64_t v17 = CMBaseObjectGetDerivedStorage();
  int v18 = *(_DWORD *)(v17 + 28);
  if (v18)
  {
    uint64_t v19 = v17;
    CFRetain(v2);
    v20 = *(NSObject **)(v19 + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __stream_postCachedConnectionEvent_block_invoke;
    block[3] = &__block_descriptor_tmp_36;
    int v22 = v18;
    block[4] = v2;
    dispatch_async(v20, block);
  }
LABEL_24:
  int v14 = 0;
LABEL_27:
  *(_DWORD *)(DerivedStorage + 48) = v14;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v14;
}

void __tcpunbufnw_Resume_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -72323;
  free(0);
  sec_release(0);
}

void __tcpunbufnw_Resume_block_invoke_2(int a1, nw_protocol_options_t options)
{
}

void __tcpunbufnw_Resume_block_invoke_3(uint64_t a1, int a2, nw_error_t error)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (error) {
    int error_code = nw_error_get_error_code(error);
  }
  else {
    int error_code = 0;
  }
  if (error_code) {
    int v6 = 90;
  }
  else {
    int v6 = 50;
  }
  if (v6 >= gLogCategory_APTransportConnectionTCPUnbufferedNW
    && (gLogCategory_APTransportConnectionTCPUnbufferedNW != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a2 != 2)
  {
    if (a2 == 3)
    {
      if (!error_code) {
        int error_code = -6700;
      }
    }
    else
    {
      if (a2 != 4) {
        return;
      }
      int error_code = -6723;
    }
  }
  if (!*(unsigned char *)(v4 + 32))
  {
    *(unsigned char *)(v4 + 32) = 1;
    *(_DWORD *)(v4 + 36) = error_code;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 40));
  }
  if (a2 == 4)
  {
    CFRelease(*(CFTypeRef *)(v4 + 24));
    uint64_t v7 = *(NSObject **)(v4 + 40);
    dispatch_release(v7);
  }
}

uint64_t __tcpunbufnw_Resume_block_invoke_4(uint64_t a1, NSObject *a2)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 176))
  {
    APSLogErrorAt();
    nw_connection_group_cancel(a2);
  }
  else
  {
    *(void *)(v4 + 176) = nw_retain(a2);
    CFRetain((CFTypeRef)v4);
    nw_connection_group_set_queue(a2, *(dispatch_queue_t *)(v4 + 328));
    state_changed_handler[0] = MEMORY[0x1E4F143A8];
    state_changed_handler[1] = 0x40000000;
    state_changed_handler[2] = __tcpunbufnwGuts_handleNewConnectionGroupInternal_block_invoke;
    state_changed_handler[3] = &__block_descriptor_tmp_49_0;
    state_changed_handler[4] = v4;
    nw_connection_group_set_state_changed_handler(a2, state_changed_handler);
    nw_connection_group_set_new_connection_limit();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 0x40000000;
    v6[2] = __tcpunbufnwGuts_handleNewConnectionGroupInternal_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_50;
    v6[4] = v4;
    nw_connection_group_set_new_connection_handler(a2, v6);
    nw_connection_group_start(a2);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 48));
}

uint64_t __tcpunbufnw_Resume_block_invoke_5(uint64_t a1, NSObject *a2)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 48));
  tcpunbufnwGuts_handleNewConnectionInternal(*(void *)(a1 + 32), a2);
  uint64_t v4 = *(pthread_mutex_t **)(*(void *)(a1 + 32) + 48);
  return pthread_mutex_unlock(v4);
}

void __lowPowerKeepAliveController_Resume_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 32))
  {
    uint64_t v4 = DerivedStorage;
    uint64_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(DerivedStorage + 16));
    *(void *)(v4 + 24) = v5;
    if (v5)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 0x40000000;
      handler[2] = __lowPowerKeepAliveController_resumeInternal_block_invoke;
      handler[3] = &__block_descriptor_tmp_13_0;
      handler[4] = v2;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 24), 0, 0x2540BE400uLL, 0x3B9ACA00uLL);
      dispatch_resume(*(dispatch_object_t *)(v4 + 24));
      *(unsigned char *)(v4 + 32) = 1;
    }
    else
    {
      APSLogErrorAt();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __stream_Resume_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  int v18 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTransportStream <= 30
    && (gLogCategory_APTransportStream != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(DerivedStorage + 72))
  {
    APSLogErrorAt();
    int v18 = -16617;
    goto LABEL_26;
  }
  uint64_t v4 = 56;
  if (!*(_DWORD *)(DerivedStorage + 24)) {
    uint64_t v4 = 48;
  }
  uint64_t v5 = *(void *)(DerivedStorage + v4);
  if (!*(unsigned char *)(v5 + 9))
  {
    uint64_t v7 = *(void *)(v5 + 24);
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v8 = *(void *)(DerivedStorage + 184);
    uint64_t v9 = *(void *)(DerivedStorage + 96);
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(uint64_t (**)(uint64_t, const void *, uint64_t, uint64_t, uint64_t))(v11 + 16);
    if (v12)
    {
      int v18 = v12(v7, v2, v6, v8, v9);
      if (!v18)
      {
        uint64_t v13 = *(void *)(v5 + 24);
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        int v16 = *(uint64_t (**)(uint64_t))(v15 + 8);
        if (v16)
        {
          int v18 = v16(v13);
          if (!v18)
          {
            if (APTransportStreamIDGetStreamCategory(*(void *)DerivedStorage) == 2)
            {
              unsigned __int16 v17 = APSGetFBOPropertyInt64();
              *(void *)uint64_t DerivedStorage = APTransportStreamIDInsertPort(*(void *)DerivedStorage, v17);
            }
            *(unsigned char *)(v5 + 9) = 1;
            stream_postCachedConnectionEvent(v2, v5);
            goto LABEL_26;
          }
        }
        else
        {
          int v18 = -12782;
        }
      }
    }
    else
    {
      int v18 = -12782;
    }
    APSLogErrorAt();
  }
LABEL_26:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v18;
}

@end