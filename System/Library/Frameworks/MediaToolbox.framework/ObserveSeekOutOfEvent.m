@interface ObserveSeekOutOfEvent
@end

@implementation ObserveSeekOutOfEvent

void __fpic_ObserveSeekOutOfEvent_block_invoke(uint64_t a1)
{
  CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
  if (CurrentlyPlayingEvent || *(unsigned char *)(CMBaseObjectGetDerivedStorage() + 976))
  {
    fpic_clearIntentionToSeekIntoEventState();
    fpic_clearIntendedCurrentItemMoment();
    *(_DWORD *)(*(void *)(a1 + 56) + 728) = *(_DWORD *)(a1 + 72);
    if (CurrentlyPlayingEvent)
    {
      uint64_t v3 = fpic_UnwrapEvent(*(void *)(a1 + 48), (uint64_t)CurrentlyPlayingEvent);
      v4 = FigPlayerInterstitialEventCopyIdentifier(v3);
      if (dword_1E9351550)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      fpic_StopInterstitialPlayerAtCurrentItem(*(void *)(a1 + 48), *(void *)(a1 + 64));
    }
    else
    {
      if (dword_1E9351550)
      {
        v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4 = 0;
    }
    fpic_removeAllCurrentEvents(*(const void **)(a1 + 48), *(__CFArray **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), CurrentlyPlayingEvent != 0);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    if (v4) {
      CFRelease(v4);
    }
  }
}

@end