@interface BWFigCaptureAttachedAccessoriesMonitor
+ (id)sharedAttachedAccessoriesMonitor;
+ (void)initialize;
- (BOOL)batteryPackAccessoryConnected;
- (BOOL)walletAccessoryConnected;
- (BWFigCaptureAttachedAccessoriesMonitor)init;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 forConnection:(id)a6;
- (void)dealloc;
@end

@implementation BWFigCaptureAttachedAccessoriesMonitor

- (BOOL)walletAccessoryConnected
{
  return self->_walletAccessoryUUID != 0;
}

- (BOOL)batteryPackAccessoryConnected
{
  return self->_batteryPackAccessoryUUID != 0;
}

+ (id)sharedAttachedAccessoriesMonitor
{
  if (sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLockOnce != -1) {
    dispatch_once(&sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLockOnce, &__block_literal_global_108);
  }
  return (id)sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

BWFigCaptureAttachedAccessoriesMonitor *__74__BWFigCaptureAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor__block_invoke()
{
  sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitorLock = FigSimpleMutexCreate();
  result = objc_alloc_init(BWFigCaptureAttachedAccessoriesMonitor);
  sharedAttachedAccessoriesMonitor_sharedAttachedAccessoriesMonitor = (uint64_t)result;
  return result;
}

- (BWFigCaptureAttachedAccessoriesMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWFigCaptureAttachedAccessoriesMonitor;
  v2 = [(BWFigCaptureAttachedAccessoriesMonitor *)&v5 init];
  if (v2)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3052000000;
    v10 = __Block_byref_object_copy__38;
    v11 = __Block_byref_object_dispose__38;
    v3 = (void *)getACCConnectionInfoClass_softClass;
    uint64_t v12 = getACCConnectionInfoClass_softClass;
    if (!getACCConnectionInfoClass_softClass)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __getACCConnectionInfoClass_block_invoke;
      v6[3] = &unk_1E5C24978;
      v6[4] = &v7;
      __getACCConnectionInfoClass_block_invoke((uint64_t)v6);
      v3 = (void *)v8[5];
    }
    _Block_object_dispose(&v7, 8);
    v2->_connectionInfoProvider = (ACCConnectionInfo *)(id)[v3 sharedInstance];
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.sharedattachedaccessories.notification", 0);
    [(ACCConnectionInfo *)v2->_connectionInfoProvider registerDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(ACCConnectionInfo *)self->_connectionInfoProvider registerDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureAttachedAccessoriesMonitor;
  [(BWFigCaptureAttachedAccessoriesMonitor *)&v3 dealloc];
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 forConnection:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F70)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke;
  block[3] = &unk_1E5C285A0;
  int v14 = a4;
  int v15 = a5;
  block[4] = self;
  block[5] = a3;
  block[6] = a6;
  dispatch_sync(notificationQueue, block);
}

uint64_t __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke(uint64_t result)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(result + 56) != 13) {
    return result;
  }
  uint64_t v1 = result;
  unsigned int v2 = *(_DWORD *)(result + 60);
  BOOL v3 = v2 > 0xE;
  int v4 = (1 << v2) & 0x4402;
  if (v3 || v4 == 0) {
    return result;
  }
  v6 = *(void **)(*(void *)(result + 32) + 8);
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v7 = (void *)getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr;
  uint64_t v19 = getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr;
  if (!getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr)
  {
    v14[1] = MEMORY[0x1E4F143A8];
    v14[2] = 3221225472;
    v14[3] = __getkACCProperties_Endpoint_NFC_TypeSymbolLoc_block_invoke;
    v14[4] = &unk_1E5C24978;
    int v15 = &v16;
    v8 = (void *)CoreAccessoriesLibrary();
    v17[3] = (uint64_t)dlsym(v8, "kACCProperties_Endpoint_NFC_Type");
    getkACCProperties_Endpoint_NFC_TypeSymbolLoc_ptr = *(void *)(v15[1] + 24);
    uint64_t v7 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v7) {
    __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke_cold_1();
  }
  result = objc_msgSend((id)objc_msgSend(v6, "accessoryPropertySync:forEndpoint:connection:", *v7, *(void *)(v1 + 40), *(void *)(v1 + 48)), "intValue");
  if ((result - 87) > 1)
  {
    if (result != 66) {
      return result;
    }
    if (*(void *)(*(void *)(v1 + 32) + 32))
    {
      if (dword_1EB4C4F70) {
        goto LABEL_12;
      }
      return result;
    }
    if (dword_1EB4C4F70)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v12 = 32;
LABEL_23:
    *(void *)(*(void *)(v1 + 32) + v12) = *(id *)(v1 + 48);
    v13 = @"NewPropertyValue";
    v14[0] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterPostNotification();
  }
  if (!*(void *)(*(void *)(v1 + 32) + 24))
  {
    if (dword_1EB4C4F70)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v12 = 24;
    goto LABEL_23;
  }
  if (dword_1EB4C4F70)
  {
LABEL_12:
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F70)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__BWFigCaptureAttachedAccessoriesMonitor_accessoryConnectionDetached___block_invoke;
  block[3] = &unk_1E5C24458;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(notificationQueue, block);
}

uint64_t __70__BWFigCaptureAttachedAccessoriesMonitor_accessoryConnectionDetached___block_invoke(uint64_t a1)
{
  v7[20] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 24)])
  {
    if (dword_1EB4C4F70)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = 24;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 32)];
    if (!result) {
      return result;
    }
    if (dword_1EB4C4F70)
    {
      int v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = 32;
  }

  *(void *)(*(void *)(a1 + 40) + v5) = 0;
  v6 = @"NewPropertyValue";
  v7[0] = MEMORY[0x1E4F1CC28];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

void __105__BWFigCaptureAttachedAccessoriesMonitor_accessoryEndpointAttached_transportType_protocol_forConnection___block_invoke_cold_1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkACCProperties_Endpoint_NFC_Type(void)"), @"BWFigCaptureAttachedAccessoriesMonitor.m", 31, @"%s", dlerror());
  __break(1u);
}

@end