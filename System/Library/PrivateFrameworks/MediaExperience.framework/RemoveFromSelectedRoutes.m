@interface RemoveFromSelectedRoutes
@end

@implementation RemoveFromSelectedRoutes

uint64_t __routingContextResilientRemote_RemoveFromSelectedRoutes_block_invoke(uint64_t a1, uint64_t a2)
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
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 96);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_RemoveFromSelectedRoutes_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)v2 == 9)
  {
    MXSystemRemotePool_RemoveEndpointFromContext(*(const void **)(a1 + 40), *(const void **)(v2 + 8), *(const __CFDictionary **)(a1 + 48));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers(*(void *)(*(void *)(a1 + 32) + 8), *(const __CFDictionary **)(a1 + 48), @"configUpdateReasonEndedFailed");
  }
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }
}

@end