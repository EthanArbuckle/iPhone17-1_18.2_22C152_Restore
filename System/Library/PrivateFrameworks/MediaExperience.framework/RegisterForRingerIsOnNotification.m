@interface RegisterForRingerIsOnNotification
@end

@implementation RegisterForRingerIsOnNotification

void __cmsmdevicestate_RegisterForRingerIsOnNotification_block_invoke()
{
  int v0 = byte_1E9358971;
  cmsmdevicestate_UpdateRingerIsOn();
  if (v0 != byte_1E9358971)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v2 = MXGetSerialQueue();
    MXDispatchAsync((uint64_t)"cmsmdevicestate_RingerIsOnChangeCallback", (uint64_t)"CMSessionManager_DeviceState.m", 1259, 0, 0, v2, (uint64_t)&__block_literal_global_122);
  }
}

uint64_t __cmsmdevicestate_RegisterForRingerIsOnNotification_block_invoke_2()
{
  uint64_t result = notify_register_check("com.apple.mediaexperience.silentmode", &dword_1E9358978);
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end