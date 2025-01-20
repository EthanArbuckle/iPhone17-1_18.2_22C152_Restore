@interface HandleResponseData
@end

@implementation HandleResponseData

void __fpic_HandleResponseData_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CMBaseObjectGetDerivedStorage();
  uint64_t FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  if (FirstIndexOfValue != -1)
  {
    CFIndex v3 = FirstIndexOfValue;
    CFArrayRef v4 = *(const __CFArray **)(a1 + 48);
    if (v4 && (CFIndex Count = CFArrayGetCount(v4), Count >= 1))
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        uint64_t v8 = *(void *)(a1 + 56);
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), i);
        fpic_SetPerAssetPerEventTrackedObject(v8, v3, i, @"AssetURL", ValueAtIndex);
        uint64_t v10 = *(void *)(a1 + 56);
        v11 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), i);
        fpic_SetPerAssetPerEventTrackedObject(v10, v3, i, @"DurationFromJSON", v11);
      }
      if (dword_1E9351550)
      {
        int v16 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      fpic_EnsureEventHasResolvedProperties(*(const void **)(a1 + 32), *(void *)(a1 + 72), *(const void **)(a1 + 40), 1);
    }
    else
    {
      if (dword_1E9351550)
      {
        int v16 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigPlayerInterstitialEventGetResumptionOffset(*(void *)(a1 + 80), (uint64_t)&time1);
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &time2)) {
        fpic_SetPerAssetPerEventTrackedObject(*(void *)(a1 + 56), v3, 0, @"PlaybackItem", @"DummyItem");
      }
      else {
        fpic_RemoveEvent(*(const void **)(a1 + 32), *(const void **)(a1 + 40), 0, 0, 0);
      }
    }
  }
}

@end