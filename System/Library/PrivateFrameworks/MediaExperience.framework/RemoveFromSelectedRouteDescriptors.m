@interface RemoveFromSelectedRouteDescriptors
@end

@implementation RemoveFromSelectedRouteDescriptors

uint64_t __routingContextResilientRemote_RemoveFromSelectedRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_RemoveFromSelectedRouteDescriptors_block_invoke(uint64_t a1)
{
  cf[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  v2 = (const void *)FigEndpointDescriptorUtility_CopyEndpointFromDescriptor(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 48) + 8));
  cf[0] = 0;
  if (!v2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void *)(*(void *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), @"configUpdateReasonStarted");
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void *)(*(void *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), @"configUpdateReasonEndedFailed");
    goto LABEL_23;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(const void ***)(a1 + 48);
  unsigned int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 > 0xDu)
  {
LABEL_10:
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_22;
  }
  if (((1 << v5) & 0x201A) == 0)
  {
    if (v5 == 9)
    {
      unsigned int v8 = MXSystemRemotePool_RemoveEndpointFromContext(v2, v4[1], *(const __CFDictionary **)(a1 + 72));
LABEL_17:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor((uint64_t)v4[1], 5);
  uint64_t v6 = *(void *)(a1 + 48);
  if (*(_DWORD *)v6 != 13
    || (FigRoutingManagerCopyPickedRouteDescriptorForRoutingContext(*(void *)(v6 + 8), (__CFDictionary **)cf),
        FigCFDictionaryGetValue(),
        FigCFDictionaryGetValue(),
        FigCFDictionaryGetValue(),
        !FigCFEqual())
    && FigCFEqual())
  {
    if (FigRoutingManagerIsEndpointOfType((uint64_t)v3)
      && FigRoutingManagerIsEndpointWHAGroupable((uint64_t)v3))
    {
      CFTypeRef v10 = FigRoutingManagerCopyLocalAirPlayEndpoint();
      if (dword_1E9359DA0)
      {
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v10)
      {
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigRoutingManager_iOSRemoveEndpointFromContext(*(const void **)(*(void *)(a1 + 48) + 8), v10, *(CFDictionaryRef *)(a1 + 72));
      if (v10) {
        CFRelease(v10);
      }
      goto LABEL_22;
    }
    unsigned int v8 = FigRoutingManager_iOSRemoveEndpointFromContext(*(const void **)(*(void *)(a1 + 48) + 8), v3, *(CFDictionaryRef *)(a1 + 72));
    goto LABEL_17;
  }
  FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void *)(*(void *)(a1 + 48) + 8), *(const __CFDictionary **)(a1 + 72), @"configUpdateReasonEndedNoop");
LABEL_22:
  CFRelease(v3);
LABEL_23:
  v13 = *(const void **)(a1 + 80);
  if (v13) {
    CFRelease(v13);
  }
  v14 = *(const void **)(a1 + 40);
  if (v14) {
    CFRelease(v14);
  }
  v15 = *(const void **)(a1 + 72);
  if (v15) {
    CFRelease(v15);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
}

@end