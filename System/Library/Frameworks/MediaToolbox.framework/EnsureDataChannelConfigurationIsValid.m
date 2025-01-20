@interface EnsureDataChannelConfigurationIsValid
@end

@implementation EnsureDataChannelConfigurationIsValid

void __videoReceiver_EnsureDataChannelConfigurationIsValid_block_invoke(uint64_t a1)
{
  CFIndex ChannelCount = FigDataChannelConfigurationGetChannelCount(*(void *)(a1 + 40));
  if (ChannelCount < 1) {
    return;
  }
  CFIndex v3 = ChannelCount;
  CFIndex v4 = 0;
  while (1)
  {
    int OutputQueueTypeAtIndex = FigDataChannelConfigurationGetOutputQueueTypeAtIndex(*(void *)(a1 + 40), v4);
    if (OutputQueueTypeAtIndex == 2) {
      break;
    }
    if (OutputQueueTypeAtIndex == 1)
    {
      FigDataChannelConfigurationGetCAImageQueueIDAtIndex(*(void *)(a1 + 40), v4);
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      UInt64 = (const void *)FigCFNumberCreateUInt64();
      int v8 = CFDictionaryContainsKey(*(CFDictionaryRef *)(DerivedStorage + 16), UInt64);
      if (UInt64) {
        CFRelease(UInt64);
      }
      if (!v8)
      {
        if (dword_1E9350E80 >= 2)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        int v11 = -15574;
        goto LABEL_18;
      }
    }
LABEL_10:
    if (v3 == ++v4) {
      return;
    }
  }
  if (FigDataChannelConfigurationGetFigDataQueueAtIndex(*(void *)(a1 + 40), v4)) {
    goto LABEL_10;
  }
  if (dword_1E9350E80 >= 2)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v11 = -15578;
LABEL_18:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
}

@end