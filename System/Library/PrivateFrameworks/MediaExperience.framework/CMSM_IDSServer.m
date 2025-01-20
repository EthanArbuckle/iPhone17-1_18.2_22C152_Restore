@interface CMSM_IDSServer
- (CMSM_IDSServer)init;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation CMSM_IDSServer

- (CMSM_IDSServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMSM_IDSServer;
  v2 = [(CMSM_IDSServer *)&v6 init];
  v2->pIdsService = (IDSService *)[objc_alloc((Class)CMSM_GetIDSServiceClass()) initWithService:@"com.apple.private.alloy.cmsession"];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.cmsession.ids.server.dispatch", v3);
  v2->idsDispatchQueue = (OS_dispatch_queue *)v4;
  [(IDSService *)v2->pIdsService addDelegate:v2 queue:v4];
  return v2;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend(a5, "objectForKey:", kMXSession_IDSMessage_TypeKey, a4);
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!CMSM_IDSConnection_IsSharedAudioRouteConnectedToLocal()
    && v9 != kMXSession_IDSMessage_Type_BTDeviceConnectionStatusChanged
    && v9 != kMXSession_IDSMessage_Type_BTDeviceConnectionStatusReply)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (FigCFEqual())
  {
    v33 = (const void *)[a7 outgoingResponseIdentifier];
    v13 = (void *)CMSM_IDSConnection_CopyMXCoreSession();
    if (cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_onceToken != -1) {
      dispatch_once(&cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_onceToken, &__block_literal_global_117_0);
    }
    if (!a5)
    {
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v18 = objc_msgSend(a5, "objectForKey:", kMXSession_IDSMessage_SessionWillPlayInfoKey, v29, v31);
    if (!v18)
    {
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v20 = objc_msgSend(v18, "objectForKey:", @"AudioCategory", v30, v32);
    if (!v20) {
      v20 = (void *)[NSString stringWithString:@"MediaPlayback"];
    }
    v21 = (void *)[v18 objectForKey:@"AudioMode"];
    if (!v21) {
      v21 = (void *)[NSString stringWithString:@"Default"];
    }
    v22 = objc_msgSend(v18, "objectForKey:");
    if (!v22) {
      v22 = (void *)[MEMORY[0x1E4F28ED0] numberWithInt:0];
    }
    v23 = (void *)[v18 objectForKey:kMXSession_IDSMessage_HandoverInterruption];
    if (!v23) {
      v23 = (void *)[MEMORY[0x1E4F28ED0] numberWithBool:0];
    }
    uint64_t v24 = [v18 objectForKey:@"ClientName"];
    if (v24) {
      v25 = (__CFString *)v24;
    }
    else {
      v25 = @"Unknown";
    }
    if (![v20 isEqualToString:cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory]|| !objc_msgSend(v21, "isEqualToString:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode)|| !objc_msgSend(v22, "isEqualToNumber:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority)|| !objc_msgSend(v23, "isEqualToNumber:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption)|| (-[__CFString isEqualToString:](v25, "isEqualToString:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName) & 1) == 0)
    {
      CMSessionSetProperty(v13, @"DoesntActuallyPlayAudio", [MEMORY[0x1E4F28ED0] numberWithBool:0]);
      CMSessionSetProperty(v13, @"ClientName", [NSString stringWithFormat:@"IDSMXCoreSession (%@)", v25]);
      CMSessionSetProperty(v13, @"IAmIDSMXCoreSession", [MEMORY[0x1E4F28ED0] numberWithBool:1]);
      CMSessionSetProperty(v13, @"AudioCategory", (uint64_t)v20);
      CMSessionSetProperty(v13, @"AudioMode", (uint64_t)v21);
      CMSessionSetProperty(v13, @"ClientPriority", (uint64_t)v22);
      CMSessionSetProperty(v13, @"AudioHardwareControlFlags", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:0]);
      CMSessionSetProperty(v13, @"HandsOverInterruptionsToInterruptor", (uint64_t)v23);
      CMSessionSetProperty(v13, @"DoesntActuallyPlayAudio", [MEMORY[0x1E4F28ED0] numberWithBool:1]);

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory = v20;
      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode = v21;

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority = v22;
      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption = v23;

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName = v25;
    }
    int v26 = CMSessionBeginInterruption(v13);
    CMSM_IDSClient_NotifyRemote_InterruptionDone(v26, v33);
    v27 = MXGetNotificationSenderQueue();
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke_128;
    v37 = &__block_descriptor_40_e5_v8__0l;
    v38 = v13;
    MXDispatchAsync((uint64_t)"cmsm_IDSServer_ProcessRemoteInterruptionStartMessage", (uint64_t)"CMSessionManager_IDSServer.m", 306, 0, 0, v27, (uint64_t)&v34);
  }
  else if (FigCFEqual())
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)kMXSession_IDSMessage_IdentifierKey);
    MessagingQueue = CMSM_IDSConnection_GetMessagingQueue();
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage_block_invoke;
    v37 = &__block_descriptor_40_e5_v8__0l;
    v38 = Value;
    MXDispatchSync((uint64_t)"cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage", (uint64_t)"CMSessionManager_IDSServer.m", 323, 0, 0, MessagingQueue, (uint64_t)&v34);
  }
  else if (FigCFEqual())
  {
    int IsSharedAudioRouteConnectedToLocal = CMSM_IDSConnection_IsSharedAudioRouteConnectedToLocal();
    CMSM_IDSClient_ReplyToRemote_BTDeviceConnectionStatus(IsSharedAudioRouteConnectedToLocal);
  }
  else if (FigCFEqual())
  {
    BOOL v28 = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)kMXSession_IDSMessage_BTDeviceIsConnectedKey) == (const void *)*MEMORY[0x1E4F1CFD0];
    CMSM_IDSConnection_UpdateSharedAudioRouteIsConnectedToRemote(v28);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessBTDeviceConnectionStatusChangedMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessRemotePlayingInfoQueryMessage();
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessRemotePlayingInfoReplyMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsPlayingStartMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsPlayingDoneMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsDoingEndInterruption((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    CMSM_IDSConnection_ResetRemotePlayingInfo();
    CMSM_IDSConnection_DeactivateIDSMXCoreSession(@"non-resumable.remoteDeviceIsBeingInitialized");
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessUpdateSharedAudioRouteMacAddress((const __CFDictionary *)a5);
  }
}

@end