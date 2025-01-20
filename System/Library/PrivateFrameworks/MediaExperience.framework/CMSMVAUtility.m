@interface CMSMVAUtility
@end

@implementation CMSMVAUtility

uint64_t __CMSMVAUtility_IsAdditiveRoutingEnabled_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(void *)&inAddress.mSelector = *(void *)"sddabolg";
  inAddress.mElement = 0;
  UInt32 ioDataSize = 4;
  int outData = 0;
  uint64_t result = AudioObjectGetPropertyData(dword_1E9359BA0, &inAddress, 0, 0, &ioDataSize, &outData);
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    if (dword_1E9359ED0)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMVAUtility_IsAdditiveRoutingEnabled_isAdditiveRoutingSupportedForHardware = outData == 1;
  }
  return result;
}

@end