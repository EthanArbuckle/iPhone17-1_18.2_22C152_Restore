@interface CMSM
@end

@implementation CMSM

void __CMSM_IDSServer_StartAutomaticOwnershipTransferToPhoneTimer_block_invoke()
{
  CMSM_IDSServer_CancelAutomaticOwnershipTransferToPhoneTimer();
  if (FigRoutingManagerUtilities_IsSystemAudioRouteBuiltIn())
  {
    CMSM_IDSConnection_RouteToSharedAudioRouteUponReceivingOwnership();
  }
  else if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

CMSM_IDSClient *__cmsm_IDSClient_GetClient_block_invoke()
{
  result = objc_alloc_init(CMSM_IDSClient);
  cmsm_IDSClient_GetClient_idsClient = (uint64_t)result;
  return result;
}

void __CMSM_IDSClient_SendMessageAsyncAndCopyIdentifier_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "sendMessage:toDestinations:priority:options:identifier:error:", *(void *)(a1 + 72), objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", *(void *)(a1 + 40)), 300, 0, *(void *)(*(void *)(a1 + 56) + 8) + 40, *(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    CMSM_IDSConnection_SetMessageWaitSemaphore(v2);
  }
}

uint64_t __CMSM_IDSConnection_Initialize_block_invoke()
{
  [(id)gIDSConnection updateNearbyPairedDevice];
  sIDSConnectedInitializationDone = 1;
  v0 = (void *)[(id)gIDSConnection copyNearbyPairedDevice];
  [v0 isNearby];

  uint64_t result = CMSM_IDSConnection_IsNearbyPairedDevicePresentAndConnected();
  int v2 = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v2)
  {
    CMSM_IDSClient_NotifyRemote_LocalIsBeingInitialized();
    CMSM_IDSClient_QueryRemote_BTDeviceConnectionStatus();
    return CMSM_IDSClient_QueryRemote_PlayingInfo();
  }
  else
  {
    byte_1E9358FE8 = 1;
  }
  return result;
}

void __CMSM_IDSConnection_CopyMXCoreSession_block_invoke()
{
  if (CMSessionCreate(&sIDSInfo)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = sIDSInfo == 0;
  }
  if (v0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (sIDSInfo)
    {
      CFRelease((CFTypeRef)sIDSInfo);
      sIDSInfo = 0;
    }
  }
  else
  {
    _CMSessionSetProperty((void *)sIDSInfo, @"ClientName", @"IDSMXCoreSession (Default)");
    _CMSessionSetProperty((void *)sIDSInfo, @"IAmIDSMXCoreSession", [MEMORY[0x1E4F28ED0] numberWithBool:1]);
    _CMSessionSetProperty((void *)sIDSInfo, @"AudioCategory", @"MediaPlayback");
    _CMSessionSetProperty((void *)sIDSInfo, @"AudioMode", @"Default");
    _CMSessionSetProperty((void *)sIDSInfo, @"AudioHardwareControlFlags", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:0]);
    _CMSessionSetProperty((void *)sIDSInfo, @"DoesntActuallyPlayAudio", [MEMORY[0x1E4F28ED0] numberWithBool:1]);
    int v2 = (void *)sIDSInfo;
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    _CMSessionSetProperty(v2, @"HandsOverInterruptionsToInterruptor", v3);
  }
}

void __CMSM_IDSConnection_DeactivateIDSMXCoreSession_block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t __CMSM_IDSConnection_StartWaitForRemoteToReplyWithInitialPlayingInfoTimer_block_invoke()
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  byte_1E9358FE8 = 1;
  CMSM_IDSConnection_RouteToSharedAudioRouteUponReceivingOwnership();
  MEMORY[0x199716E90](qword_1E9359000);
  if (qword_1E9358FF0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1E9358FF0);
    if (qword_1E9358FF0)
    {
      dispatch_release((dispatch_object_t)qword_1E9358FF0);
      qword_1E9358FF0 = 0;
    }
  }
  return MEMORY[0x199716EA0](qword_1E9359000);
}

void __CMSM_IDSConnection_StopWaitForRemoteToReplyWithInitialPlayingInfoTimer_block_invoke()
{
  MEMORY[0x199716E90](qword_1E9359000);
  if (qword_1E9358FF0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1E9358FF0);
    if (qword_1E9358FF0)
    {
      dispatch_release((dispatch_object_t)qword_1E9358FF0);
      qword_1E9358FF0 = 0;
    }
  }
  JUMPOUT(0x199716EA0);
}

void __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke(uint64_t a1)
{
  int v2 = MXGetSerialQueue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  long long v4 = *(_OWORD *)(a1 + 32);
  MXDispatchAsync((uint64_t)"CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke", (uint64_t)"CMSessionManager_IDSConnection.m", 848, 0, 0, v2, (uint64_t)v3);
}

void __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke_2(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    byte_1E9358FC4 = 0;
    if (dword_1E9359ED0)
    {
      uint64_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    byte_1E9358FC4 = 0;
  }
  if (!CMSM_IDSConnection_IsSomeClientPlayingOverSharedAudioRouteOnRemote())
  {
    if (dword_1E9359ED0)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!byte_1E9358FC3) {
      goto LABEL_14;
    }
LABEL_13:
    byte_1E9358FC3 = 0;
    cmsm_IDSConnection_UpdateOtherDevicesConnectedInfoInPickableRoutesCache();
LABEL_14:
    vaemTakeOwnershipOnSharedAudioRoute(*(void *)(a1 + 32));
    goto LABEL_15;
  }
  if (byte_1E9359C30)
  {
    if (dword_1E9359ED0)
    {
      long long v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!byte_1E9358FC3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_15:
  AudioObjectID A2DPPort = cmsmGetA2DPPort(*(CFArrayRef *)(a1 + 32));
  if (vaeGetBTPortOwnsSharedAudioConnection(A2DPPort)
    && (!vaeDoesBTPortSupportInEarDetection(A2DPPort)
     || vaeDoesBTPortSupportInEarDetection(A2DPPort)
     && CMSMVAUtility_ShouldBTPortBeTreatedAsInEar(A2DPPort)))
  {
    CFArrayRef PortListArrayFromPortID = vaeCreatePortListArrayFromPortID(A2DPPort);
    Routable = cmsmCopyPartnerPortsToMakeRoutable(PortListArrayFromPortID);
    UInt32 = (const void *)FigCFNumberCreateUInt32();
    CFArrayAppendValue(Routable, UInt32);
    if (dword_1E9359ED0)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemMakeArrayOfPortsRoutable(Routable, 1, 0, *(void *)(a1 + 40), 1);
    if (PortListArrayFromPortID) {
      CFRelease(PortListArrayFromPortID);
    }
    if (Routable) {
      CFRelease(Routable);
    }
    if (UInt32) {
      CFRelease(UInt32);
    }
  }
  v11 = *(const void **)(a1 + 40);
  if (v11) {
    CFRelease(v11);
  }
  v12 = *(const void **)(a1 + 32);
  if (v12) {
    CFRelease(v12);
  }
}

dispatch_queue_t __CMSM_IDSConnection_GetMessagingQueue_block_invoke()
{
  BOOL v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.cmsession.ids.messaging", v0);
  CMSM_IDSConnection_GetMessagingQueue_messagingQueue = (uint64_t)result;
  return result;
}

@end