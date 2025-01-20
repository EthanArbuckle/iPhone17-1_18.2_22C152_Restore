@interface SetConnectionActive
@end

@implementation SetConnectionActive

void __playerairplay_SetConnectionActive_block_invoke(uint64_t a1)
{
}

void __playerairplay_SetConnectionActive_block_invoke_2(uint64_t a1)
{
  CFTypeRef v2 = 0;
  CFTypeRef cf = 0;
  playqueue_copyCurrentClientPlayQueueItemAndCurrentMediaControlPlayListItem(*(void *)(*(void *)(a1 + 32) + 32), (unint64_t)&v2, (unint64_t)&cf);
  playerairplay_savePlaybackInfoAndStopAPV(*(const void **)(a1 + 40), (uint64_t)v2, (uint64_t)cf);
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __playerairplay_SetConnectionActive_block_invoke_3(uint64_t a1)
{
  cf[24] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    if (pap_AirPlayState(*(const void **)(a1 + 32)) == 10)
    {
      playerairplay_checkStartAPV(*(void **)(a1 + 32));
      if (dword_1E93510E8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  playerairplay_copyPlayQueueAirPlayItemFromSubPlayer(*(void *)(a1 + 32), 0, cf);
  if (cf[0])
  {
    int v3 = *(unsigned __int8 *)(CMBaseObjectGetDerivedStorage() + 888);
    if (cf[0]) {
      CFRelease(cf[0]);
    }
  }
  else
  {
    int v3 = 0;
  }
  if (*(void *)(CMBaseObjectGetDerivedStorage() + 296) && (!*(unsigned char *)(a1 + 48) || v3))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v4 + 1))
    {
      CFTypeRef v5 = playerairplay_copyPredictedFormatDescriptionForBAO(*(void *)(a1 + 32));
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = *(unsigned __int8 *)(v4 + 1);
    }
    else
    {
      uint64_t v6 = 0;
      CFTypeRef v5 = 0;
    }
    uint64_t v7 = *(void *)(v4 + 296);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef))(v9 + 40);
    if (v10) {
      v10(v7, v6, 1, v5);
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 304) = *(unsigned char *)(*(void *)(a1 + 40) + 1);
    if (v5) {
      CFRelease(v5);
    }
  }
}

@end